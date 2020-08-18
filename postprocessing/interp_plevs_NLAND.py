from isca.util import interpolate_output

caselist = ['Aqua2_acdc', 'Dayland_acdc',  'LandworldLakes_acdc','Northland_bright_acdc', 'Northland_dry_acdc', 'Northland_empty_acdc',
'Aqua_acdc' , 'LandBelt_acdc',  'Landworld_acdc', 'Northland_dark_acdc', 'Northland_empty_acdc','PolarCap_acdc']

#caselist = ['LandworldLakes_acdc',    'Northland_dark_acdc',
#'Landworld_acdc_atmos_mean_5_to_50',         'Northland_dry_acdc_atmos_mean_5_to_50',
#'Northland_bright_acdc_atmos_mean_5_to_50',  'Northland_empty_acdc_atmos_mean_5_to_50']

for case in caselist:
    #infile = '/scratch/mp586/Isca_DATA/Northland/'+infile_in+'.nc'
    #outfile = '/scratch/mp586/Isca_DATA/Northland/'+infile_in+'_interp.nc'
    infile = '~/scratch/ISCA/output/'+case+'/TimeSeries/'+case+'_atmos_mean_5_to_50.nc'
    outfile = '~/scratch/ISCA/output/'+case+'/TimeSeries/'+case+'_atmos_mean_5_to_50_pinterp.nc'

    interpolate_output(infile, outfile, p_levs='INPUT', var_names=['slp', 'height', 'omega', 'ucomp', 'vcomp', 'temp','rh','sphum'])




