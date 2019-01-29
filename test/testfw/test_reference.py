import logging
from pathlib import Path
from .test_common import add_sources, TestsBase, dict_merge, \
                         get_common_modelsim_init_files, get_seed
from textwrap import dedent

log = logging.getLogger(__name__)


class ReferenceTests(TestsBase):
    def __init__(self, *args, **kwds):
        super().__init__(*args, **kwds)
        self._tests = self.config['tests'].keys()

    def add_sources(self) -> None:
        sources = []
        sources.append('reference/tb_reference.vhd')
        sources.append('reference/vunit_reference_wrapper.vhd')
        add_sources(self.lib, sources)

    def configure(self) -> bool:
        tb = self.lib.get_test_benches('*reference*')[0]
        default = self.config['default']
        self.add_modelsim_gui_file(tb, default, 'sanity')

        for data_set,cfg in self.config['tests'].items():
            dict_merge(cfg, default)
            # bm = len_to_matrix(cfg['topology'], cfg['bus_len_v'])
            generics = {
                'timeout'      : cfg['timeout'],
                'iterations'   : cfg['iterations'],
                'log_level'    : cfg['log_level'] + '_l',
                'error_tol'    : cfg['error_tolerance'],
                'seed'         : get_seed(cfg),
                'data_path'    : str(self.build) + '/../' + cfg['data_path'],
            }
            tb.add_config(data_set, generics=generics)

            tcl = self.build / 'modelsim_init_{}.tcl'.format(data_set)
            with tcl.open('wt', encoding='utf-8') as f:
                print(dedent('''\
                    global TCOMP
                    set TCOMP i_test
                    '''), file=f)

            init_files = get_common_modelsim_init_files()
            init_files += [str(tcl)]
            tb.set_sim_option("modelsim.init_files.after_load", init_files)
            self.add_modelsim_gui_file(tb, cfg, data_set)
        return True
