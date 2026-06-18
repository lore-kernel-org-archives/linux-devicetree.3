Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF938D017;
	Thu, 18 Jun 2026 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781786892; cv=none; b=VZtefoOmE7ddf7A1HoEyuhmwx3aLZBdZ9UXaJfF0BP1fJ7xR8rTghdUJwNHsfM46MAgxx+BgI9KmgfTnV1ck95C4f4AHyPoBx9ISTs6ghHIwUo/pxFO2E2nOuRqplaCF7VFBFa53bnjeiHM57yGpRm0lPy6LYqP8KGemIxPMCX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781786892; c=relaxed/simple;
	bh=pSL0P6Eg4piEda/gbE7u7BzkxMSRpxGMi66smVaqXlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3lHW8F1/Q0n+wXNHn13jkLwNoBDrqlokA3eJ/CFWzdYAz1RA++jJgTd8BoVirtSc+lhsTWqfZhwn+dfuTqaICSft3/mOaSsWNNkdI0D+ZUZ2nPLfL1tI/RzwK0pkdzGgdtZi+laGwISgr9GqzXsy50E9pefypmb5VMNRYpaxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYfyyhqS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYfyyhqS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA72B1F000E9;
	Thu, 18 Jun 2026 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781786890;
	bh=5lKKLYGNWyFoFsJqMIxM1awayVyD6dxfs7aHSjXBGrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GYfyyhqSMolwb6Asss93MrQwcNMUQL3VKObITmdYcqWSh0pjxthxjyM81HPR0Bdwe
	 dK9xigbCkGr9A5RJ95rDv7adqUyiCc3kYvOabLpmtfTPA1GAYPVG1qX8X23rR83eXQ
	 VqcgVPh7gs3HENtxt26ayudCxjaU7VHMDrMHastO7KLA6kwlw3ukDN5TLupOw2wMyP
	 NI4PY6/4Yr+o8OVlUJzRIFXZthyLzjA6GRDCcjAI/6C9t/kiMWuZNzbKDW0utn3UCF
	 UNFjWeMRi+mBv++rQDJGRfWKpOGB3QwLFgPQP6G9Q+q3bSy/Zm7ltPkruTiaokyaYO
	 c2FSubcXLPDnA==
Date: Thu, 18 Jun 2026 13:48:05 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v11 5/9] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260618124805.GJ1672911@google.com>
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
 <20260612111816.3688240-6-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612111816.3688240-6-lakshay.piplani@nxp.com>

/* Sashiko Automation: Issues Found (3 Findings) */

Please investigate.

> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> 
> ---
> Changes in v11:
>  - Use MFD_CELL_NAME() for child device registration
>  - Rename local variables for consistency
>  - Rename driver names to follow subsystem conventions:
>    - Use '-' instead of '_' in driver names
>    - Drop the "_drv" suffix from driver names
> 
> Changes in v10:
>  - Drop redundant is_p3h2x4x_in_i3c flag
> 
> Changes in v9:
>  - Renamed macros to follow consistent uppercase naming conventions
>  - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional,
>    to avoid I3C/I2C dependency issues
> 
> Changes in v8:
>  - No change
> 
> Changes in v7:
>  - Use new config I3C_OR_I2C
> 
> Changes in v6:
>  - No change
> 
> Changes in v5:
>  - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
>  - Updated dev_err_probe() for regmap_init failure.
>  - Updated module description
> 
> Changes in v4:
>  - Split the driver into three separate patches(mfd, regulator and I3C hub)
>  - Added support for NXP P3H2x4x MFD functionality
> ---
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  13 ++++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/p3h2840.c       | 119 ++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/device.h  |   1 +
>  include/linux/mfd/p3h2840.h |  26 ++++++++
>  6 files changed, 162 insertions(+)
>  create mode 100644 drivers/mfd/p3h2840.c
>  create mode 100644 include/linux/mfd/p3h2840.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba65ae5a008b..3420701a75c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19311,6 +19311,8 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/mfd/p3h2840.c
> +F:	include/linux/mfd/p3h2840.h
>  
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
>  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268..405b50c3c77b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -617,6 +617,19 @@ config MFD_MX25_TSADC
>  	  i.MX25 processors. They consist of a conversion queue for general
>  	  purpose ADC and a queue for Touchscreens.
>  
> +config MFD_P3H2X4X
> +	tristate "NXP P3H2X4X I3C Hub Device"
> +	depends on I3C_OR_I2C
> +	select MFD_CORE
> +	select REGMAP_I3C if I3C
> +	select REGMAP_I2C if I2C
> +	help
> +	  Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2C
> +	  communication interface.
> +
> +	  This driver provides support for I3C hub and regulator, each subdriver
> +	  can be enabled independently depending on the required functionality.
> +
>  config MFD_PF1550
>  	tristate "NXP PF1550 PMIC Support"
>  	depends on I2C=y && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..a284b22c7b13 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>  obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>  
> +obj-$(CONFIG_MFD_P3H2X4X)	+= p3h2840.o
>  obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
>  
>  obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 000000000000..0a80992d6250
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025-2026 NXP
> + * P3H2X4X i3c hub and regulator device.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/i3c/master.h>

[Severity: Low]
Does this include bypass the I3C subsystem abstraction? By including the
master header, the driver has access to the internal definition of
struct i3c_device. Should this include <linux/i3c/device.h> instead?



> +#include <linux/mfd/core.h>
> +#include <linux/mfd/p3h2840.h>
> +#include <linux/regmap.h>
> +
> +static const struct mfd_cell p3h2x4x_devs[] = {
> +		MFD_CELL_NAME("p3h2x4x-regulator"),
> +		MFD_CELL_NAME("p3h2x4x-i3c-hub"),
> +};
> +
> +static const struct regmap_config p3h2x4x_regmap_config = {
> +	.reg_bits = P3H2X4X_REG_BITS,
> +	.val_bits = P3H2X4X_VAL_BITS,
> +	.max_register = 0xFF,
> +};
> +
> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> +{
> +	struct p3h2x4x_dev *ddata;
> +	int ret;
> +
> +	ddata = devm_kzalloc(&i3cdev->dev, sizeof(*ddata), GFP_KERNEL);

[Severity: Low]
This directly accesses the internal dev field of struct i3c_device. Should
this use i3cdev_to_dev(i3cdev) to obtain the underlying struct device pointer
to maintain API boundaries?



> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	i3cdev_set_drvdata(i3cdev, ddata);
> +
> +	ddata->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> +	if (IS_ERR(ddata->regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(ddata->regmap),
> +				     "Failed to register HUB regmap\n");
> +
> +	// The hub child driver retrieves information from i3cdev
> +	ddata->i3cdev = i3cdev;
> +
> +	ret = devm_mfd_add_devices(&i3cdev->dev, PLATFORM_DEVID_AUTO,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&i3cdev->dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;
> +}
> +
> +static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
> +{
> +	struct p3h2x4x_dev *ddata;
> +	int ret;
> +
> +	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, ddata);
> +
> +	ddata->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
> +	if (IS_ERR(ddata->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(ddata->regmap),
> +				     "Failed to register HUB regmap\n");
> +
> +	ddata->i3cdev = NULL;
> +
> +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;
> +}
> +
> +static const struct i3c_device_id p3h2x4x_i3c_ids[] = {
> +	I3C_CLASS(I3C_DCR_HUB, NULL),
> +	{ /* sentinel */ },
> +};

[Severity: High]
Will this driver inappropriately bind to any generic I3C hub device on the
bus?

Using I3C_CLASS(I3C_DCR_HUB, NULL) instructs the subsystem to match any
device that advertises the generic Hub DCR (194), without filtering by
vendor or part ID.

Because the probe function doesn't verify the Manufacturer ID, it seems this
could eagerly bind to third-party hubs and attempt NXP-specific register
operations on them.

Should this use I3C_DEVICE(I3C_VENDOR_NXP, ...) to exclusively match the
supported NXP devices instead of the generic hub class?

> +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
> +
> +static const struct i2c_device_id p3h2x4x_i2c_id_table[] = {
> +	{ "nxp-i3c-hub" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
> +
> +static const struct of_device_id p3h2x4x_i2c_of_match[] = {
> +	{ .compatible = "nxp,p3h2840", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);
> +
> +static struct i3c_driver p3h2x4x_i3c = {
> +	.driver = {
> +		.name = "p3h2x4x-i3c",
> +	},
> +	.probe = p3h2x4x_device_probe_i3c,
> +	.id_table = p3h2x4x_i3c_ids,
> +};
> +
> +static struct i2c_driver p3h2x4x_i2c = {
> +	.driver = {
> +		.name = "p3h2x4x-i2c",
> +		.of_match_table = p3h2x4x_i2c_of_match,
> +	},
> +	.probe =  p3h2x4x_device_probe_i2c,
> +	.id_table = p3h2x4x_i2c_id_table,
> +};
> +module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> +MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB multi function driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 971d53349b6f..6188082599dd 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -85,6 +85,7 @@ struct i3c_xfer {
>   */
>  enum i3c_dcr {
>  	I3C_DCR_GENERIC_DEVICE = 0,
> +	I3C_DCR_HUB = 194,
>  };
>  
>  #define I3C_PID_MANUF_ID(pid)		(((pid) & GENMASK_ULL(47, 33)) >> 33)
> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 000000000000..2d4fae2176ae
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025-2026 NXP
> + * This header file contains register definitions and bit masks for the P3H2X4X.
> + */
> +
> +#ifndef _LINUX_MFD_P3H2840_H
> +#define _LINUX_MFD_P3H2840_H
> +
> +#include <linux/types.h>
> +
> +/* Device Configuration Registers */
> +#define P3H2X4X_DEV_REG_PROTECTION_CODE				0x10
> +#define P3H2X4X_REGISTERS_LOCK_CODE				0x00
> +#define P3H2X4X_REGISTERS_UNLOCK_CODE				0x69
> +#define P3H2X4X_CP1_REGISTERS_UNLOCK_CODE			0x6a
> +
> +/* Reg config for Regmap */
> +#define P3H2X4X_REG_BITS					8
> +#define P3H2X4X_VAL_BITS					8
> +
> +struct p3h2x4x_dev {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;
> +};
> +#endif /* _LINUX_MFD_P3H2840_H */
> -- 
> 2.25.1
> 

-- 
Lee Jones
