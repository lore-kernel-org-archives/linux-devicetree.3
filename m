Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED8301474;
	Thu, 18 Jun 2026 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781786440; cv=none; b=g1Ehieq4Hxz+2zTCtUqFWGqDKQjBmXrwwv3tuljqAHf23ron9GdZh8TNLrKDClpKHF8vwKX2W2H21CRxlHBlcloHfyDIWM4JlBoOtX+Joc0FVlcQtjv6yRWXbpup/HR18pRope5tOyZPnMA/sKm3UAPZYITKXr72KA3PkvPkCOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781786440; c=relaxed/simple;
	bh=g+Ru3dUElyBs1hq5p7YIKtELoiRZRltJoBxtvUXmC54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iic7cVytrTfLC+aABzEujyrRzVGS+tuMsXd6enKC9wobuvhgGTbdOhUBo35ftX99RD4ILvZO2zds7mBk9QiA8lZj20KPx9Lw3viuZhi5l0xELW8ic+R3i25JKKIl1j4D+hAqrkb9YkqtSWlnlDQHRV9+iqWA98x9FR5E9OC3kVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKdudmbm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKdudmbm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C46B1F000E9;
	Thu, 18 Jun 2026 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781786438;
	bh=5sUQR/xdZQxSzSMRRiS9uGPf8xtVlstkiyBWNK3BRuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YKdudmbmAA7hoKeEjbEC5ynsd1yMi6ff4ydVxut7ivYJLXZJ8ToZRyoDl6Wsbcgqn
	 h7uSslj4hlUqtFIdRc/6jzaAoaa/pwvo3cD5p4y/4VuMgK7ySgw8A+0leinMJ3oWZk
	 KPTpw/++YT3M3I+UZENUSWka01ldYvd6LG5Jm484WgiR+vIDSxEIdVkdjeZlPtnBee
	 lnkNDZ8e7FdjWqJu1XND2XJck6CfLEQHYDCGegW0TEbh3gB22B73Eumk4Oztw2Klnk
	 SaTa1MgbtsBVZNDBAJy9h223qiXFG1iVYzVvVc4s2xiViaKbfiWFDIfXluoxoQSeHN
	 mY/wzzvx3ePLw==
Date: Thu, 18 Jun 2026 13:40:34 +0100
From: Lee Jones <lee@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/4] mfd: Add support for UGREEN NASync DH2300 MCU
Message-ID: <20260618124034.GI1672911@google.com>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
 <20260612-dh2300-mcu-v1-3-ab8db1617bc0@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-dh2300-mcu-v1-3-ab8db1617bc0@flipper.net>

On Fri, 12 Jun 2026, Alexey Charkov wrote:

> Add a driver for the HC32F005 MCU used as an embedded controller on the
> UGREEN NASync DH2300 NAS.
> 
> This part provides the shared I2C regmap to be used by function-specific
> sub-devices, and instantiates the SATA drive-bay power gate regulator.
> Implemented as an MFD to allow for other functions of the MCU to be added
> later: vendor binaries imply that it also provides a hardware watchdog
> and somehow serves as a wake source, but so far only the SATA power gating
> function has been confirmed in absence of documentation and sources for the
> vendor firmware.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  MAINTAINERS                     |  1 +
>  drivers/mfd/Kconfig             | 16 +++++++++++
>  drivers/mfd/Makefile            |  1 +
>  drivers/mfd/ugreen-dh2300-mcu.c | 60 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 78 insertions(+)

Did you see: drivers/mfd/simple-mfd-i2c.c ?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index ca27df7cd684..9578a06fe651 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27637,6 +27637,7 @@ UGREEN DH2300 MCU MFD DRIVER
>  M:	Alexey Charkov <alchark@flipper.net>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
> +F:	drivers/mfd/ugreen-dh2300-mcu.c
>  
>  UHID USERSPACE HID IO DRIVER
>  M:	David Rheinsberg <david@readahead.eu>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782..5a2ad75bd9c9 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1947,6 +1947,22 @@ config MFD_TPS6594_SPI
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called tps6594-spi.
>  
> +config MFD_UGREEN_DH2300_MCU
> +	tristate "UGREEN NASync DH2300 embedded controller"
> +	depends on I2C
> +	depends on OF
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to enable support for the HC32F005 microcontroller found
> +	  on the UGREEN NASync DH2300 NAS, where it acts as a board embedded
> +	  controller. This core driver sets up the shared register map and
> +	  instantiates the function sub-devices (the SATA drive-bay power
> +	  regulator).
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called ugreen-dh2300-mcu.
> +
>  config TWL4030_CORE
>  	bool "TI TWL4030/TWL5030/TWL6030/TPS659x0 Support"
>  	depends on I2C=y
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index dd4bb7e77c33..6247239bcfe1 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -109,6 +109,7 @@ obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
>  obj-$(CONFIG_MFD_TPS6594)	+= tps6594-core.o
>  obj-$(CONFIG_MFD_TPS6594_I2C)	+= tps6594-i2c.o
>  obj-$(CONFIG_MFD_TPS6594_SPI)	+= tps6594-spi.o
> +obj-$(CONFIG_MFD_UGREEN_DH2300_MCU)	+= ugreen-dh2300-mcu.o
>  obj-$(CONFIG_MENELAUS)		+= menelaus.o
>  
>  obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
> diff --git a/drivers/mfd/ugreen-dh2300-mcu.c b/drivers/mfd/ugreen-dh2300-mcu.c
> new file mode 100644
> index 000000000000..5184b0c98759
> --- /dev/null
> +++ b/drivers/mfd/ugreen-dh2300-mcu.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Core driver for the UGREEN NASync DH2300 embedded controller (HC32F005 MCU).
> + *
> + * The microcontroller sits on I2C and exposes an 8-bit register map. It is a
> + * multi-function device: SATA drive-bay power gate, hardware watchdog and
> + * possibly other functions
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#define UGREEN_DH2300_MCU_REG_MAX	0x94
> +
> +static const struct regmap_config ugreen_dh2300_mcu_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = UGREEN_DH2300_MCU_REG_MAX,
> +};
> +
> +static const struct mfd_cell ugreen_dh2300_mcu_cells[] = {
> +	{ .name = "ugreen-dh2300-mcu-regulator" },
> +};
> +
> +static int ugreen_dh2300_mcu_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i2c(client, &ugreen_dh2300_mcu_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to initialise regmap\n");
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				    ugreen_dh2300_mcu_cells,
> +				    ARRAY_SIZE(ugreen_dh2300_mcu_cells),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id ugreen_dh2300_mcu_of_match[] = {
> +	{ .compatible = "ugreen,dh2300-mcu" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ugreen_dh2300_mcu_of_match);
> +
> +static struct i2c_driver ugreen_dh2300_mcu_driver = {
> +	.driver = {
> +		.name = "ugreen-dh2300-mcu",
> +		.of_match_table = ugreen_dh2300_mcu_of_match,
> +	},
> +	.probe = ugreen_dh2300_mcu_probe,
> +};
> +module_i2c_driver(ugreen_dh2300_mcu_driver);
> +
> +MODULE_DESCRIPTION("UGREEN NASync DH2300 embedded controller core driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones
