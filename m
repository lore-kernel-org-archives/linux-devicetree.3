Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6367614B08A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847867; cv=none; b=HyvSAcesHEcum0A/DHCx2WR6GWFfNfqTcQShqWriJhKietBwdgLciQuEoBgeK4utOTpHRyZ8CYfpSfcX9HHRq7AokdHttff01QcDeYxkVeX2BR46C75u0qDO40wPOIKRI5HVi7mbRWWeSgkHo7I3/yoLMY7HtygN3/UZ3mzz0A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847867; c=relaxed/simple;
	bh=Df+Cbr1Eo//Ggkg4wFdfdJYi95iDu3aWp9NygTwJAxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGf5VRLC+0uBh7vHoV1BLyB20ltQNI8jiLTUwCm8a7rgmqqOAaJg7WTnuEaX78d0XGim81F49Av09QR/o3Qo16UwI5HBzHKvKr+DRlrgJzLu5wBy80mJzNBr/hFUijIQ4JnEWpiUHmLZamYvtUS4h3hTt0VUrNXF8kNsVbVXLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYg2XpYZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYg2XpYZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48fde653997so912585e9.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778847863; x=1779452663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8XqpAyLmGQCyogYc0ZRPb2ZQz/k14Ga1XFZBsKcAbX0=;
        b=bYg2XpYZIMTp3oVtEEJO6FvUxYOnpK50ETzaO3HZG043SmqNJgu6pIoz6WxbbsYBTs
         19ArR8yUCqwQfThCjfC4Kj1fwBKavmZY3sIfnILTx/eHcCQOytVCJoaMowBPb8HHuCRE
         ZFB6V+tgnujgIEJwwXT3yjuqMM26wNzQjYdLCAnuMBeJllHGKq3CKa8aNkLrDFRCnmK5
         08XchLKgTNiL9KMvfu/0OC6ZNEgGW/RddQHeQzdD08QOywekIn79FOI08YwSSq+ZkyIz
         B7tIu+hX+ktB8k97evVx3wdsZK9bIe/kl6DLblaKBeUKlt1nBZW4eqtjNHXE6or2az7T
         ajsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847863; x=1779452663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XqpAyLmGQCyogYc0ZRPb2ZQz/k14Ga1XFZBsKcAbX0=;
        b=pvImFezs49cvZI3grF7eca9Du8RfIBeimqNI4AAFs9zBoMwqTAHKnNEap2w2+DwRVg
         DyBGmlQAphM7L9ttfFFmvaycaeinps/RPX7cOiIfMayHyhZJV9AgR9dPN90+Zh/jNinF
         xU/XAGdALBFD7Z/k8pFUACAJc3dAPrGKXATcYugz4zaIuaBjsO6Bq+5uaFp2vH+J8lnK
         ZjweXsvaELzyoccxKu2nCV5ZfvmlsMR9gFEQfMHA//v8nuEKpQLid4Q0NzTqv2CSe5Ww
         82bpYOuPeZybGcu7X+szVLrhL3k1i0vpxDg1ZM0oQyMjHw97XBApj5UWAHDPtQiqDke9
         kYvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Yw5iCNrgBZgcvV8R4Jx8WFlBe3L8NbZpHDV7XTuErETgQGPWuflMBasvS9H0CI8C4Ja5wnuDRmN5w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1fzqoYSYZ0GzQaMytJoI3kvrevljDHv70QnX4J8XAtZF5fdc5
	MIPJR8PNemfUbjEcEqMe2iEOmkdYXgP3V/fbFWr4y3vJFshHEbfdXMFb
X-Gm-Gg: Acq92OFjULzqjaLCg4RtdwdvgUciWVB3qO4VT1YR/UbHKI34Q1leVxykaJ+uFlfsoaH
	gT2t/m+bpAWsrTSSXeIkDO/oNR6OWiUJ7Y+r4YT4PDaFaH6cdyCS694oUQGLjHBZ+AutloAMncA
	W18bM4bxGmBlZrhmKGCn9Mdusr0tKjp+WV0pezuIKhXbkmRTo7zZfAITSXzKBESC85QLbPm1LWF
	BfOXNGt13U9i7yPqKWZH8MWXUSQ0SfOqYYcK2GIC02OGlb4We3jLDXlJKmFMQ0SLnWIkUV6XprL
	228lexxneB/d1QHyj5gKPOW9jzqvvJwPeqkIFKXAULgwnBupk/oMWvP+Xw6F1mh3ZXPAMi0p2/J
	jgPW3TaFKro33PBah0jOSa8u/1RXuE3fekWzeD4YkERYSj5Aim7GsH49/qnLb1EDxkWvT0kwbyh
	ubboTmwIUOjjbIRw==
X-Received: by 2002:a05:600c:c177:b0:48a:56d4:7274 with SMTP id 5b1f17b1804b1-48fe66423ecmr25025435e9.3.1778847862553;
        Fri, 15 May 2026 05:24:22 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d507:6e00:9f61:24db:b04:35c4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c834besm58836735e9.3.2026.05.15.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:24:21 -0700 (PDT)
Date: Fri, 15 May 2026 15:24:18 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 phy-next 2/2] phy: ti: add PHY driver for TI
 DS125DF111 Dual-Channel Retimer
Message-ID: <20260515122418.edzemzv5gnronihb@skbuf>
References: <20260515110145.1925579-1-ioana.ciornei@nxp.com>
 <20260515110145.1925579-1-ioana.ciornei@nxp.com>
 <20260515110145.1925579-3-ioana.ciornei@nxp.com>
 <20260515110145.1925579-3-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515110145.1925579-3-ioana.ciornei@nxp.com>
 <20260515110145.1925579-3-ioana.ciornei@nxp.com>

On Fri, May 15, 2026 at 02:01:45PM +0300, Ioana Ciornei wrote:
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
> Changes in v2:
> - Explicitly include all the needed headers
> - Change ds125df111_xlate() so that it returns an error if args_count is
> not exactly 1
> - Add a MAINTAINERS entry
> ---
>  MAINTAINERS                     |   7 +
>  drivers/phy/ti/Kconfig          |  10 ++
>  drivers/phy/ti/Makefile         |   1 +
>  drivers/phy/ti/phy-ds125df111.c | 252 ++++++++++++++++++++++++++++++++
>  4 files changed, 270 insertions(+)
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
> diff --git a/drivers/phy/ti/phy-ds125df111.c b/drivers/phy/ti/phy-ds125df111.c
> new file mode 100644
> index 000000000000..084a94e655c2
> --- /dev/null
> +++ b/drivers/phy/ti/phy-ds125df111.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2026 NXP */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
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
> +#define DS125DF111_VCO_GROUP_BASE		0x60
> +
> +#define DS125DF111_RATIOS			0x2F
> +#define DS125DF111_RATIOS_RATE_MASK		GENMASK(7, 6)
> +#define DS125DF111_RATIOS_SUBRATE_MASK		GENMASK(5, 4)
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
> +static int ds125df111_configure(struct phy *phy,
> +				const struct ds125df111_config *cfg)
> +{
> +	struct ds125df111_ch *ch = phy_get_drvdata(phy);
> +	struct ds125df111_priv *priv = ch->priv;
> +	struct i2c_client *i2c = priv->client;
> +	struct device *dev = &phy->dev;
> +	u8 val;
> +	int err, i;

Not mandatory, but if the rest of the file uses reverse Christmas tree
variable ordering, could you stick to that here as well?

> +
> +	mutex_lock(&priv->mutex);
> +
> +	/* Make sure that any subsequent read/write operation will be directed
> +	 * only to the registers of the selected channel
> +	 */
> +	err = i2c_smbus_read_byte_data(i2c, DS125DF111_CH_SELECT);
> +	if (err < 0) {
> +		dev_err(dev, "Unable to select channel\n");

Here and everywhere else: could you please print a symbolic description
of the error? %pe, ERR_PTR(err).

> +		goto out;
> +	}
> +	val = (u8)err;
> +	val &= ~DS125DF111_CH_SELECT_TARGET_MASK;
> +	val |= DS125DF111_CH_SELECT_EN | ch->idx;
> +	err = i2c_smbus_write_byte_data(i2c, DS125DF111_CH_SELECT, val);
> +	if (err < 0) {
> +		dev_err(dev, "Unable to select channel\n");
> +		goto out;
> +	}
> +
> +	/* Reset Channel Registers */
> +	err = i2c_smbus_read_byte_data(i2c, DS125DF111_CH_CTRL);
> +	if (err < 0) {
> +		dev_err(dev, "Error resetting channel configuration\n");
> +		goto out;
> +	}
> +	val = (u8)err;
> +	val |= DS125DF111_CH_CTRL_RESET;
> +	err = i2c_smbus_write_byte_data(i2c, DS125DF111_CH_CTRL, val);
> +	if (err < 0) {
> +		dev_err(dev, "Error resetting channel configuration\n");
> +		goto out;
> +	}

Did you consider simplifying this function using a ds125df111_rmw() helper?
All configuration accesses except the VCO group frequencies are
read-modify-write.

> +
> +	/* Program the VCO group frequencies */
> +	for (i = 0; i < DS125DF111_NUM_VCO_GROUP_REG; i++) {
> +		err = i2c_smbus_write_byte_data(i2c,
> +						DS125DF111_VCO_GROUP_BASE + i,
> +						cfg->vco_group[i]);
> +		if (err < 0) {
> +			dev_err(dev, "Error programming VCO group frequencies\n");
> +			goto out;
> +		}
> +	}
> +
> +	/* Set the Divide Ratios for the VCO Groups*/

Space between Groups and */
Also, Divide Ratios, Groups, Channel Registers are not proper nouns,
they don't need to be capitalized.

> +	err = i2c_smbus_read_byte_data(i2c, DS125DF111_RATIOS);
> +	if (err < 0) {
> +		dev_err(dev, "Error programming the divide ratios\n");
> +		goto out;
> +	}
> +	val = (u8)err;
> +	val &= ~(DS125DF111_RATIOS_RATE_MASK | DS125DF111_RATIOS_SUBRATE_MASK);
> +	val |= FIELD_PREP(DS125DF111_RATIOS_RATE_MASK, cfg->rate) |
> +		FIELD_PREP(DS125DF111_RATIOS_SUBRATE_MASK, cfg->subrate);
> +	err = i2c_smbus_write_byte_data(i2c, DS125DF111_RATIOS, val);
> +	if (err < 0) {
> +		dev_err(dev, "Error programming the divide ratios\n");
> +		goto out;
> +	}
> +
> +	mutex_unlock(&priv->mutex);
> +
> +	return 0;
> +
> +out:
> +	mutex_unlock(&priv->mutex);
> +
> +	return err;

You don't need a separate code path for the 'out' label, it can be
common with the normal exit path (err will be 0).

> +}
> +
> +static int ds125df111_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	const struct ds125df111_config *cfg;
> +
> +	if (mode != PHY_MODE_ETHERNET)
> +		return -EOPNOTSUPP;

Please use a different error code like -EINVAL. Let -EOPNOTSUPP mean
that the function is not implemented (when calling phy_set_mode_ext()).

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
> +		return -EOPNOTSUPP;

Same here.

> +	}
> +
> +	return ds125df111_configure(phy, cfg);
> +}
> +
> +static const struct phy_ops ds125df111_ops = {
> +	.set_mode	= ds125df111_set_mode,

Can you please implement .validate() as well? It will be made mandatory
in the future for those who implement .set_mode().

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
> +	{},

Unnecessary comma after sentinel entry.

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
> 
> 

