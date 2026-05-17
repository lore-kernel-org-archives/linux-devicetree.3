Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C389D2E175F;
	Sun, 17 May 2026 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779035880; cv=none; b=FsmtKCY1lhLkvuBll2svH3MsZa6eJWjkLsBcd66tD/egA21GYo7b4RwcQEieqmaLOzwZul2RYpeaO5yCPxuUJu43qX56QL9XD/8fGLVNKgJxjBtuhnc6vqbetWKvgxw2hD5povEs3oA4LjBJQnJd0WA/7ootNSFaaVkoTb86Sg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779035880; c=relaxed/simple;
	bh=+LYQ5X69Ij/o6P43EjB7X6DpZkZiMN5FBEa13GAqLmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3PnDAtLUvZLDLxsIeKsukXGrPom4uR59JjA8ubDWPtqB/yVUnnpvYAyEm5wzEGLFrZtZD7u0IMEFmOCYPbTSd7eHeMAVq/2yyyd2gjqtUrsbF7WIJbd7PV501yqQS2QZkUrKR+o+B5UHfEbA75P2CSzlKVRl0yQRV4epzIyzcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yi5V/ECE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yi5V/ECE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B4FC2BCB0;
	Sun, 17 May 2026 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779035880;
	bh=+LYQ5X69Ij/o6P43EjB7X6DpZkZiMN5FBEa13GAqLmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yi5V/ECEHHOSSNF/vj1ZFL4uuBHJg0Me5MMwlS4NINDJCS7jSEIbaU422M/xYAT1v
	 R0ya7dAScQwXrvtkXHjcc3XT5pFdCHTsYB1OFPzt7LGTED5ADGa3dzlcHqGGHsO9B+
	 +oI7jpcn36mvariCVO/KYnUTWRYbHfgLvLM7ZasSf78mbad/6jYSDrBvr4UnwOSy/5
	 emA/QVOZ2b6767kb5QYXVWU4lBXKUkJh+waO0NXSQc11YXMlZNzn3NvC9wp0TdW2rS
	 Xf+VtcgKMqWclb9orzsmsGn7hch0TbHCZm5txmNSfpA3CO9/psYh+uS84JDqqt+etE
	 +Zd+2n4JQVu3g==
Date: Sun, 17 May 2026 22:07:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, johan@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 phy-next 2/2] phy: ti: add PHY driver for TI
 DS125DF111 Dual-Channel Retimer
Message-ID: <agnu5Mmf_d8zvWXH@vaman>
References: <20260516060309.2282592-1-ioana.ciornei@nxp.com>
 <20260516060309.2282592-3-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516060309.2282592-3-ioana.ciornei@nxp.com>

On 16-05-26, 09:03, Ioana Ciornei wrote:
> Add a generic PHY driver for the TI DS125DF111 Multi-Protocol
> Dual-Channel Retimer. The driver currently supports only 10G and 1G link
> speeds but it can easily extended to also cover other usecases.
> 
> Since the available datasheet (https://www.ti.com/lit/gpn/DS125DF111)
> does not name the registers, the name for the macros were determined by
> their usage pattern.
> 
> A PHY device is created for each of the two channels present on the
> retimer. This allows for independent configuration of the two channels.
> This capability is especially important on retimers which have more than
> 2 channels that can be, depending on the board design, connected in
> multiple different ways to the SerDes lanes.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v3:
> - Use reverse Christmas tree ordering
> - Print a symbolic description in case of error
> - Some words do not need to be capitalized
> - Remove duplicated exit code path
> - Return -EINVAL in case of unsupported submode received in .set_mode()
> - Add a .validate() callback
> - Remove comma after sentinel entry
> - Add a ds125df111_rmw() helper
> - Use read_poll_timeout() to wait for channel reset to complete
> 
> Changes in v2:
> - Explicitly include all the needed headers
> - Change ds125df111_xlate() so that it returns an error if args_count is
> not exactly 1
> - Add a MAINTAINERS entry
> ---
>  MAINTAINERS                     |   7 +
>  drivers/phy/ti/Kconfig          |  10 ++
>  drivers/phy/ti/Makefile         |   1 +
>  drivers/phy/ti/phy-ds125df111.c | 294 ++++++++++++++++++++++++++++++++
>  4 files changed, 312 insertions(+)
>  create mode 100644 drivers/phy/ti/phy-ds125df111.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f877e5aaf2c7..58f410b666e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26781,6 +26781,13 @@ T:	git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
>  F:	drivers/media/platform/ti/davinci/
>  F:	include/media/davinci/
>  
> +TI DS125DF111 RETIMER PHY DRIVER
> +M:	Ioana Ciornei <ioana.ciornei@nxp.com>
> +L:	linux-phy@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
> +F:	drivers/phy/ti/phy-ds125df111.c
> +
>  TI ENHANCED CAPTURE (eCAP) DRIVER
>  M:	Vignesh Raghavendra <vigneshr@ti.com>
>  R:	Julien Panis <jpanis@baylibre.com>
> diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
> index b40f28019131..475e80fcd52d 100644
> --- a/drivers/phy/ti/Kconfig
> +++ b/drivers/phy/ti/Kconfig
> @@ -111,3 +111,13 @@ config PHY_TI_GMII_SEL
>  	help
>  	  This driver supports configuring of the TI CPSW Port mode depending on
>  	  the Ethernet PHY connected to the CPSW Port.
> +
> +config PHY_TI_DS125DF111

This should be in alphabetical order, so I guess before PHY_TI_G...

> +	tristate "DS125DF111 2-Channel Retimer Driver"
> +	depends on OF && I2C
> +	select GENERIC_PHY
> +	help
> +	  Enable this to add support for configuration and runtime management
> +	  of the TI DS125DF111 Multi-Protocol 2-Channel Retimer.
> +	  The retimer is modeled as a Generic PHY and supports both 10G and 1G
> +	  link speeds.
> diff --git a/drivers/phy/ti/Makefile b/drivers/phy/ti/Makefile
> index dcba2571c9bd..e68445ddd848 100644
> --- a/drivers/phy/ti/Makefile
> +++ b/drivers/phy/ti/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
>  obj-$(CONFIG_PHY_AM654_SERDES)		+= phy-am654-serdes.o
>  obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
>  obj-$(CONFIG_PHY_J721E_WIZ)		+= phy-j721e-wiz.o
> +obj-$(CONFIG_PHY_TI_DS125DF111)		+= phy-ds125df111.o

Here as well

> diff --git a/drivers/phy/ti/phy-ds125df111.c b/drivers/phy/ti/phy-ds125df111.c
> new file mode 100644
> index 000000000000..8788f340e3b0
> --- /dev/null
> +++ b/drivers/phy/ti/phy-ds125df111.c
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2026 NXP */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
> +#include <linux/slab.h>
> +
> +#define DS125DF111_NUM_CH			2
> +#define DS125DF111_NUM_VCO_GROUP_REG		5
> +
> +#define DS125DF111_CH_SELECT			0xff
> +#define DS125DF111_CH_SELECT_TARGET_MASK	GENMASK(3, 0)
> +#define DS125DF111_CH_SELECT_EN			BIT(2)
> +
> +#define DS125DF111_CH_CTRL			0x00
> +#define DS125DF111_CH_CTRL_RESET		BIT(2) /* self clearing */
> +
> +#define DS125DF111_CH_RST_SLEEP_US		10
> +#define DS125DF111_CH_RST_TIMEOUT_US		10000
> +
> +#define DS125DF111_VCO_GROUP_BASE		0x60
> +
> +#define DS125DF111_RATIOS			0x2F

Lower case for the hex values please

> +#define DS125DF111_RATIOS_RATE_MASK		GENMASK(7, 6)
> +#define DS125DF111_RATIOS_SUBRATE_MASK		GENMASK(5, 4)
> +#define DS125DF111_RATIOS_MASK			GENMASK(7, 4)
> +
> +struct ds125df111_ch {
> +	struct phy *phy;
> +	struct ds125df111_priv *priv;
> +	int idx;
> +};
> +
> +struct ds125df111_priv {
> +	struct ds125df111_ch ch[DS125DF111_NUM_CH];
> +	struct i2c_client *client;
> +	struct mutex mutex; /* protects access to shared registers */
> +};
> +
> +enum ds125df111_mode {
> +	FREQ_1G,
> +	FREQ_10G,
> +};
> +
> +static const struct ds125df111_config {
> +	u8 vco_group[DS125DF111_NUM_VCO_GROUP_REG];
> +	u8 rate;
> +	u8 subrate;
> +} ds125df111_cfg[] = {
> +	[FREQ_1G] = {
> +		/* VCO group #0 = 10GHz, VCO group #1 = 10GHz */
> +		.vco_group = {0x00, 0xB2, 0x00, 0xB2, 0xCC},
> +		/* By using the following combination of rate and subrate we
> +		 * select divide ratios of 1, 2, 4, 8 on both groups
> +		 */
> +		.rate = 0x1,
> +		.subrate = 0x2,
> +	},
> +
> +	[FREQ_10G] = {
> +		/* VCO group #0 = 10.3125GHz, VCO group #1 = 10.3125GHz */
> +		.vco_group = {0x90, 0xB3, 0x90, 0xB3, 0xCD},
> +		/* By using the following combination of rate and subrate we
> +		 * select divide ratios of 1 on both groups
> +		 */
> +		.rate = 0x1,
> +		.subrate = 0x3,
> +	},
> +};
> +
> +static int ds125df111_rmw(struct ds125df111_priv *priv, u8 reg, u8 clr, u8 set)
> +{
> +	struct i2c_client *i2c = priv->client;
> +	int err;
> +	u8 val;
> +
> +	err = i2c_smbus_read_byte_data(i2c, reg);
> +	if (err < 0)
> +		return err;
> +
> +	val = (u8)err;
> +	val &= ~clr;
> +	val |= set;
> +
> +	err = i2c_smbus_write_byte_data(i2c, reg, val);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int ds125df111_configure(struct phy *phy,
> +				const struct ds125df111_config *cfg)

This should start at preceding line open braces (here and few other
places)

> +{
> +	struct ds125df111_ch *ch = phy_get_drvdata(phy);
> +	struct ds125df111_priv *priv = ch->priv;
> +	struct i2c_client *i2c = priv->client;
> +	struct device *dev = &phy->dev;
> +	u8 ratios_val;
> +	int err, i;
> +	int val;
> +
> +	mutex_lock(&priv->mutex);
> +
> +	/* Make sure that any subsequent read/write operation will be directed
> +	 * only to the registers of the selected channel
> +	 */
> +	err = ds125df111_rmw(priv, DS125DF111_CH_SELECT,
> +			     DS125DF111_CH_SELECT_TARGET_MASK,
> +			     DS125DF111_CH_SELECT_EN | ch->idx);
> +	if (err < 0) {
> +		dev_err(dev, "Unable to select channel: %pe\n", ERR_PTR(err));
> +		goto out;
> +	}
> +
> +	/* Reset channel registers and wait until the bit was cleared */
> +	err = ds125df111_rmw(priv, DS125DF111_CH_CTRL, 0,
> +			     DS125DF111_CH_CTRL_RESET);
> +	if (err < 0) {
> +		dev_err(dev, "Error resetting channel configuration: %pe\n",
> +			ERR_PTR(err));
> +		goto out;
> +	}
> +
> +	err = read_poll_timeout(i2c_smbus_read_byte_data, val,
> +				val < 0 || !(val & DS125DF111_CH_CTRL_RESET),
> +				DS125DF111_CH_RST_SLEEP_US,
> +				DS125DF111_CH_RST_TIMEOUT_US, false, i2c,
> +				DS125DF111_CH_CTRL);
> +	if (err) {
> +		dev_err(dev, "Timed out waiting for channel reset: %pe\n",
> +			ERR_PTR(err));
> +		goto out;
> +	}
> +
> +	if (val < 0) {
> +		dev_err(dev, "Error reading reset status: %pe\n", ERR_PTR(val));
> +		err = val;
> +		goto out;
> +	}
> +
> +	/* Program the VCO group frequencies */
> +	for (i = 0; i < DS125DF111_NUM_VCO_GROUP_REG; i++) {
> +		err = i2c_smbus_write_byte_data(i2c,
> +						DS125DF111_VCO_GROUP_BASE + i,
> +						cfg->vco_group[i]);
> +		if (err < 0) {
> +			dev_err(dev, "Error programming VCO group: %pe\n",
> +				ERR_PTR(err));
> +			goto out;
> +		}
> +	}
> +
> +	/* Set the divide ratios for the VCO groups */
> +	ratios_val = FIELD_PREP(DS125DF111_RATIOS_RATE_MASK, cfg->rate) |
> +		FIELD_PREP(DS125DF111_RATIOS_SUBRATE_MASK, cfg->subrate);
> +	err = ds125df111_rmw(priv, DS125DF111_RATIOS, DS125DF111_RATIOS_MASK,
> +			     ratios_val);
> +	if (err < 0) {
> +		dev_err(dev, "Error programming the divide ratios: %pe\n",
> +			ERR_PTR(err));
> +		goto out;
> +	}
> +
> +out:
> +	mutex_unlock(&priv->mutex);
> +
> +	return err;
> +}
> +
> +static int ds125df111_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	const struct ds125df111_config *cfg;
> +
> +	if (mode != PHY_MODE_ETHERNET)
> +		return -EINVAL;
> +
> +	switch (submode) {
> +	case PHY_INTERFACE_MODE_10GBASER:
> +		cfg = &ds125df111_cfg[FREQ_10G];
> +		break;
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +	case PHY_INTERFACE_MODE_SGMII:
> +		cfg = &ds125df111_cfg[FREQ_1G];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ds125df111_configure(phy, cfg);
> +}
> +
> +static int ds125df111_validate(struct phy *phy, enum phy_mode mode, int submode,
> +			       union phy_configure_opts *opts __always_unused)
> +{
> +	if (mode != PHY_MODE_ETHERNET)
> +		return -EINVAL;
> +
> +	switch (submode) {
> +	case PHY_INTERFACE_MODE_10GBASER:
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +	case PHY_INTERFACE_MODE_SGMII:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct phy_ops ds125df111_ops = {
> +	.validate	= ds125df111_validate,
> +	.set_mode	= ds125df111_set_mode,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static struct phy *ds125df111_xlate(struct device *dev,
> +				    const struct of_phandle_args *args)
> +{
> +	struct ds125df111_priv *priv = dev_get_drvdata(dev);
> +	u32 idx;
> +
> +	if (args->args_count != 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	idx = args->args[0];
> +	if (idx >= DS125DF111_NUM_CH) {
> +		dev_err(dev, "Maximum number of channels is %d\n",
> +			DS125DF111_NUM_CH);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return priv->ch[idx].phy;
> +}
> +
> +static int ds125df111_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct phy_provider *provider;
> +	struct ds125df111_priv *priv;
> +	int i, err;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->client = client;
> +	err = devm_mutex_init(dev, &priv->mutex);
> +	if (err)
> +		return err;
> +
> +	i2c_set_clientdata(client, priv);
> +
> +	for (i = 0; i < DS125DF111_NUM_CH; i++) {
> +		struct ds125df111_ch *ch = &priv->ch[i];
> +		struct phy *phy;
> +
> +		phy = devm_phy_create(dev, NULL, &ds125df111_ops);
> +		if (IS_ERR(phy))
> +			return PTR_ERR(phy);
> +
> +		ch->idx = i;
> +		ch->priv = priv;
> +		ch->phy = phy;
> +
> +		phy_set_drvdata(phy, ch);
> +	}
> +
> +	provider = devm_of_phy_provider_register(dev, ds125df111_xlate);
> +
> +	return PTR_ERR_OR_ZERO(provider);
> +}
> +
> +static const struct of_device_id ds125df111_dt_ids[] = {
> +	{ .compatible = "ti,ds125df111", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ds125df111_dt_ids);
> +
> +static struct i2c_driver ds125df111_driver = {
> +	.driver = {
> +		.name = "ds125df111",
> +		.of_match_table = ds125df111_dt_ids,
> +	},
> +	.probe = ds125df111_probe,
> +};
> +module_i2c_driver(ds125df111_driver);
> +
> +MODULE_AUTHOR("Ioana Ciornei <ioana.ciornei@nxp.com>");
> +MODULE_DESCRIPTION("TI DS125DF111 Retimer driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1

-- 
~Vinod
