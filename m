Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B833A70A;
	Thu, 11 Jun 2026 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195413; cv=none; b=F5G+UcfsWcNze1t728pn+locmZpkcWYWfy6ofWs+tYVIVb/aT0EJ1IhrYt5mLHZDHU4O49FoAUYGgvoFNUbNHXwIvWsTGtYsPGrQ//BTTcRquvppHgwcxTx843RRvNH6nuxjN5DkBmQHH8wRLx4kyTFrK8tdfX+ZW/Wyy+FAT4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195413; c=relaxed/simple;
	bh=YW+tvE4e2OGMpboAEWoc/tMu9cH559mYanqqo1PiA6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/jWPpFInPhqxd2zF+uslVSh0UXOecBjTrXQo4T/XM7OeeogoM+sHa8hutAcdxjqEbRrMxlMCqO6A98vNRnX3I3qj/R1kd/Fdj3tlxVUedZjObThWB3pTuHZWkjR7y6M/8/fbm/DWUtxunEHA51aj7R82aKyiPXQHcBiNOnAvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPAUnYjv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPAUnYjv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7FE1F00893;
	Thu, 11 Jun 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781195411;
	bh=sUuwlpaBLh6tnQQlebDBJ+Xh85HCcs+ftZZACcojad8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPAUnYjvERUR/HIfXUfkPZr7mABv/kXAyU0egUEHrOFzHTDGYirZ7Luc/ysaRLhq5
	 DAusACqbld2BEPZTrtrd515xu6yKzjES5A55v4YZIfyWspMa8geU5kz5SOXKeZXwi1
	 Mu0wrz3DA21hLRkL0igpjxymCttEJ22owRx4WBptxiZZLorNxeNgyKfNu7lB2yCv1t
	 mUBfAcMQa1vIzrUNGIwHVfw0FyNZxvVq8bTbtpy/Ure/0sbxcOF3tSORsSf5CxMFZp
	 kWZF92v4agLONM+Nn56/EN02wkzxV4B/4pzXzq7FChsKuDXrg/8L/xNKpgSkQC+RPA
	 Qje+L7gFMX7Ug==
Date: Thu, 11 Jun 2026 17:30:05 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v10 5/9] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260611163005.GA1140262@google.com>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
 <20260525064209.2263045-6-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525064209.2263045-6-lakshay.piplani@nxp.com>

On Mon, 25 May 2026, Lakshay Piplani wrote:

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
>  drivers/mfd/p3h2840.c       | 122 ++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/device.h  |   1 +
>  include/linux/mfd/p3h2840.h |  26 ++++++++
>  6 files changed, 165 insertions(+)
>  create mode 100644 drivers/mfd/p3h2840.c
>  create mode 100644 include/linux/mfd/p3h2840.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8ae231f67460..25e578dd74dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19311,6 +19311,8 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c-owner@lists.infradead.org
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
> index 000000000000..9bd8cf6980f1
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025-2026 NXP
> + * P3H2X4X i3c hub and regulator device.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/i3c/master.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/p3h2840.h>
> +#include <linux/regmap.h>
> +
> +static const struct mfd_cell p3h2x4x_devs[] = {
> +	{
> +		.name = "p3h2x4x-regulator",
> +	},
> +	{
> +		.name = "p3h2x4x-i3c-hub",
> +	},
> +};

MFD_CELL_NAME()

> +static const struct regmap_config p3h2x4x_regmap_config = {
> +	.reg_bits = P3H2X4X_REG_BITS,
> +	.val_bits = P3H2X4X_VAL_BITS,
> +	.max_register = 0xFF,
> +};
> +
> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> +{
> +	struct p3h2x4x_dev *p3h2x4x;

struct p3h2x4x *ddata;

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
> +				     "Failed to register HUB regmap\n");
> +	p3h2x4x->i3cdev = i3cdev;

Where is this used again?

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
> +				     "Failed to register HUB regmap\n");
> +
> +	p3h2x4x->i3cdev = NULL;
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
> +		.name = "p3h2x4x_i3c_drv",
> +	},

'-'s only and drop the "_drv" part.

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

Remove this line.

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
> index 000000000000..18ff15f9e2d9
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025-2026 NXP
> + * This header file contain private Reg address and its bit mapping etc.
> + */

"This header file contains register definitions and bit masks for the P3H2X4X."

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
