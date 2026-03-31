Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E533AE1A4;
	Tue, 31 Mar 2026 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956564; cv=none; b=MKV2B3JFGrDF3FmSFnDApBHMCxv6lgFsRRY1o/mfB/UCKDipetY9cfkC9yv3J3EMINZB3A+/agjmDq7oH/fspd32kSoU19osbaGri0jlPQAudoM1aiMvmq6g/CzYq++JxxPOmeFSRvdoJBaDw/9M0X6VYbqGNxEV921SAqe/KgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956564; c=relaxed/simple;
	bh=S/vMHtpXmmwINoW98j8tfDkxvqXu7f2o4UFRAH921GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AabTiRA73gzJ+HZfoZnnsFB5E8qgL1JT6BshFtlTLiiU7X6yNnp+S/UmSJByzThsWMX5e2d64kgHP6INWZsKg7xrswpWxrwEwoiAeqVrKPRLcX/rhJsRgCtsVc3EEj6utrcKNu1Y/CHyU9JiEDg/jaKwL5OD7gQFVGfDWTjLOa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufX/9lvJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufX/9lvJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA522C2BCB5;
	Tue, 31 Mar 2026 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774956564;
	bh=S/vMHtpXmmwINoW98j8tfDkxvqXu7f2o4UFRAH921GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufX/9lvJw9d25VwcF3VjDq/OD4oVn03acEo3fyAgqixpxoawSFmBBZ7blTgVReEqT
	 BDpF0Ygb/kS1ZeFQ6/c6RIaAlSZzJEgnh4J/iQBB4pgtP0OMl9wZs5kSoCwg9RzXSd
	 9NrIj4+rzcS42RbYBAVV7amBu1onxzFcxjmtMiDRFyU6W9nVOzspV8LCnNBS1hWWNc
	 2YuRCbQg1fw4d7bvC76wENH/jU5NxsCAVYdCixcvYW29FwGdvZhYtBHH2EW1UlP8KA
	 L9l3kCQYRq+GpoBOn31Z7YJarIvkghuuoYr5gxQQAxCtLiaFPRNa1IQHieE6WDZt+Y
	 3s2xDJri0LwfA==
Date: Tue, 31 Mar 2026 12:29:18 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v8 4/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260331112918.GD3795166@google.com>
References: <20260323062737.886728-1-lakshay.piplani@nxp.com>
 <20260323062737.886728-5-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323062737.886728-5-lakshay.piplani@nxp.com>

On Mon, 23 Mar 2026, Lakshay Piplani wrote:

> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
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
>  drivers/mfd/p3h2840.c       | 125 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/p3h2840.h |  27 ++++++++
>  5 files changed, 168 insertions(+)
>  create mode 100644 drivers/mfd/p3h2840.c
>  create mode 100644 include/linux/mfd/p3h2840.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c72976dbdf31..4f67fe64c833 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19101,6 +19101,8 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c-owner@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/mfd/p3h2840.c
> +F:	include/linux/mfd/p3h2840.h
>  
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
>  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268..14f4736683a1 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -617,6 +617,19 @@ config MFD_MX25_TSADC
>  	  i.MX25 processors. They consist of a conversion queue for general
>  	  purpose ADC and a queue for Touchscreens.
>  
> +config MFD_P3H2X4X
> +       tristate "NXP P3H2X4X I3C Hub Device"
> +       depends on I3C_OR_I2C
> +       select MFD_CORE
> +       select REGMAP_I3C
> +       select REGMAP_I2C

Please use a single tab to indent config attributes, and a tab plus two spaces
for the help text.

Also, if 'I3C' is disabled but 'I2C' is enabled, unconditionally selecting
'REGMAP_I3C' could result in unmet dependencies. Should these selects be made
conditional?

> +       help
> +         Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2C
> +         communication interface.
> +
> +         This driver provides support for I3C hub and regulator, each subdriver
> +         can be enabled independently depending on the required functionality.
> +
>  config MFD_PF1550
>  	tristate "NXP PF1550 PMIC Support"
>  	depends on I2C=y && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..aaadf50fedf4 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>  obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>  
> +obj-$(CONFIG_MFD_P3H2X4X) 	+= p3h2840.o

No spaces before tabs.

>  obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
>  
>  obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 000000000000..65090a09f7c6
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP

This is quite out of date at this point.

> + * P3H2x4x i3c hub and regulator device.
> + */
> +
> +#include <linux/i3c/master.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/p3h2840.h>
> +#include <linux/regmap.h>

Alphabetical.

> +static const struct mfd_cell p3h2x4x_devs[] = {
> +	{
> +		.name = "p3h2x4x-regulator",
> +	},
> +	{
> +		.name = "p3h2x4x-i3c-hub",
> +	},
> +};
> +
> +static const struct regmap_config p3h2x4x_regmap_config = {
> +	.reg_bits = P3H2x4x_REG_BITS,

Please use standard uppercase for macro names (e.g., 'P3H2X4X_REG_BITS').

> +	.val_bits = P3H2x4x_VAL_BITS,
> +	.max_register = 0xFF,
> +};
> +
> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)

This probe function and 'p3h2x4x_device_probe_i2c()' are nearly identical.
Could we refactor the common logic into a single generic helper function?

> +{
> +	struct p3h2x4x_dev *p3h2x4x;
> +	int ret;
> +
> +	p3h2x4x = devm_kzalloc(&i3cdev->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> +	if (!p3h2x4x)
> +		return -ENOMEM;
> +
> +	i3cdev_set_drvdata(i3cdev, p3h2x4x);
> +
> +	p3h2x4x->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> +	if (IS_ERR(p3h2x4x->regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(p3h2x4x->regmap),
> +				     "Failed to register I3C HUB regmap\n");
> +
> +	p3h2x4x->is_p3h2x4x_in_i3c = true;
> +	p3h2x4x->i3cdev = i3cdev;
> +
> +	ret = devm_mfd_add_devices(&i3cdev->dev, PLATFORM_DEVID_NONE,

Why are you using PLATFORM_DEVID_NONE here instead of *_AUTO?

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
> +	struct p3h2x4x_dev *p3h2x4x;
> +	int ret;
> +
> +	p3h2x4x = devm_kzalloc(&client->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> +	if (!p3h2x4x)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, p3h2x4x);
> +
> +	p3h2x4x->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
> +	if (IS_ERR(p3h2x4x->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(p3h2x4x->regmap),
> +				     "Failed to register I3C HUB regmap\n");

I3C?

> +
> +	p3h2x4x->is_p3h2x4x_in_i3c = false;
> +
> +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;
> +}
> +
> +/* p3h2x4x ids (i3c) */

This comment doesn't add anything.  Please remove it.

> +static const struct i3c_device_id p3h2x4x_i3c_ids[] = {
> +	I3C_CLASS(I3C_DCR_HUB, NULL),
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
> +
> +/* p3h2x4x ids (i2c) */

And this one.

> +static const struct i2c_device_id p3h2x4x_i2c_id_table[] = {
> +	{ "nxp-i3c-hub" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
> +
> +static const struct of_device_id  p3h2x4x_i2c_of_match[] = {

Too many spaces.

> +	{ .compatible = "nxp,p3h2840", },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);

This needs to be moved up a line.

It's linked with 'p3h2x4x_i2c_of_match', not 'p3h2x4x_i3c'.

> +static struct i3c_driver p3h2x4x_i3c = {
> +	.driver = {
> +		.name = "p3h2x4x_i3c_drv",
> +	},
> +	.probe = p3h2x4x_device_probe_i3c,
> +	.id_table = p3h2x4x_i3c_ids,
> +};
> +
> +static struct i2c_driver p3h2x4x_i2c = {
> +	.driver = {
> +		.name = "p3h2x4x_i2c_drv",
> +		.of_match_table = p3h2x4x_i2c_of_match,
> +	},
> +	.probe =  p3h2x4x_device_probe_i2c,
> +	.id_table = p3h2x4x_i2c_id_table,
> +};
> +
> +module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_DESCRIPTION("P3H2x4x I3C HUB multi function driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 000000000000..cba6fa516d1e
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

These should use // in header files.

> +/*
> + * Copyright 2025 NXP
> + * This header file contain private Reg address and its bit mapping etc.
> + */
> +
> +#ifndef _LINUX_MFD_P3H2840_H
> +#define _LINUX_MFD_P3H2840_H
> +
> +#include <linux/types.h>
> +
> +/* Device Configuration Registers */
> +#define P3H2x4x_DEV_REG_PROTECTION_CODE				0x10
> +#define P3H2x4x_REGISTERS_LOCK_CODE				0x00
> +#define P3H2x4x_REGISTERS_UNLOCK_CODE				0x69
> +#define P3H2x4x_CP1_REGISTERS_UNLOCK_CODE			0x6a

Could we use standard uppercase for all macro names (e.g., 'P3H2X4X_')?

> +
> +/* Reg config for Regmap */
> +#define P3H2x4x_REG_BITS					8
> +#define P3H2x4x_VAL_BITS					8
> +
> +struct p3h2x4x_dev {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;
> +	bool is_p3h2x4x_in_i3c;
> +};

Which attributes do the child drivers actually use?

-- 
Lee Jones [李琼斯]
