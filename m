Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881BF418A43
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269092; cv=none; b=OP4ZXGSN/vdulogZAb+AJSu6Pr2shKCKces1bx+mpQ/J2ln0PMYfATDElzCqioVz/3HjoT+APO/4b0uaQ2wByNCWVYMRCDlsC7mEMu0ucQ2I9T2glzp0EOd+j5rHgxpv29zrLoIjTkxbHE3LfG+5eUn0H7J1sXjGW7hmf8LwiSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269092; c=relaxed/simple;
	bh=7RowtOhKqbexAjOEL02LIVeK+vQijmd6QcKwhHcMxm8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJMIDSPBG0BklH6qmu7AAWfSXiKWD+tSCsdDHZqsqpTWP9mJSHA1zUI3HVkuOKgPLjsKhnxdLBMSUEFfcrtgoIFm22beZRT2UqRqTNOaOEa4Y8qIkrolp74ixblfS9Jzh5Hfl5dZrlUDIt6vMkX+SH40PebPE3LWQP+aW3s97fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPfttG06; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPfttG06"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48431648f33so805029f8f.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788269089; x=1788873889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m9s+pEoGrG4HFANGtdOnl/hc5uhb6frTfUBLBjF9eG0=;
        b=WPfttG06dilPF+0ZsPIxzRe8WIhUJXsntdsQqjQskmYNjJXbGwjLLQA98LpMCB/mld
         FFdNKFp9sNQC/KEIZkdAtSQJ8l4KAS2JcRbmzFQvTgYJilh3cGvI9sE9vfA3k36I0MH5
         iZ9ZFXwkWNER9aRVBMEuOonE4UH3CIzdpdmrdvIsUvPC/JI2ZWXnKaU1ViVsJ9hfxnz4
         xpec5RyAroVAQR3IPJNeXbqrYQyUFGi2hO6i3d/QLOe8xIyDAb2OKQNDCb+uD5d4wuKI
         1si3Hmx+OJsZuuw0hTrZ/nWDmN9VTefdd2OnSCAlM30NPa0rnN4HZHsKWqmrrwLpKs62
         K4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269089; x=1788873889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9s+pEoGrG4HFANGtdOnl/hc5uhb6frTfUBLBjF9eG0=;
        b=SJOwOVODzrofG+RTManIu8+EQt921d+kRVWZqiX4SKxyPUAewX4Y8zwSBhIV9ZNrzU
         CKlFSJtdc4zbw4n0MT6JFyDfnL4RcYyCxOVOep7FveMuTJdeIwQWSKVhK5oBZJDM0ILi
         Q2tDkx8KIjRWu4Zy/2xtg+DGk0DJy+gl6f0S9swZ1G3U+kGBAtu726ImTa/qAeFWZPeH
         6A9g9g3dMZ24NNDLyJHIc1NWffYAtx4SsEeds8SZCxayHlZSvpATU61TNow/6avVTxbv
         B+AbO1PyicBeeuXNLO1t7wFzgE8d16qajJUJM7X0t0X0oZpWJpFsNXDAc2ZB4vpOEosw
         liSA==
X-Forwarded-Encrypted: i=1; AKwUvBx1M0V6SNgFDMrvHiS4s6/NXgOHiPuK2Mbrp/9ny6TIyMegW18wq76sxwOpp2NbQTipDb2T02e50HBx@vger.kernel.org
X-Gm-Message-State: AFuF++kS+A30jwHU7uIoornlnmNoIMBEY9LJR6EL2dEsVANpXerDFRNm
	NGbfmZz10As15zH9ZdY/sE2rEAwyBCayZ+/tauh1FpGGaSJ1ikG10K4Q
X-Gm-Gg: AYBFou08uizA57Vl029IogJx4jRuZjp8Z3lnmFMBbmkje/NHb2qXkEePs/ZufZrN0SV
	w2awEzlDA7obXu1FZb10wgjGdL3tFk5QGeXt0e9JYir/qIlM/a0EVhSEYkRaaRFXZXEaYSuq/P2
	48oaKIuH8fRp5vgPymeBnnWG4PW2ayed5jIYGCMPO1TB1QWkjSUfNLLC5QmrgaYC9iEshWFvj0m
	gZh54DznbvmuYPW7+zF/YSyGhaZz730ggl4pErU2huoM/UGuMf7KUXBj1iJPefYzVgUFTxrBPjf
	Ur0zyn8Bouo3S//ZRS6Ajb6hq2TPm/jyP0R7YdEagAlQKXW6H3B6P1jQNyDSXeMRfniORoDXMWg
	QL0o2fMTWQfYOlckuYJ3pQP/NkT/xwEA2p6IOsHmLyXPL7lVMoaho0bvQ+WmDsIZp4JvMnczBmF
	xZEpeu5B5LiDr8oNzBkbG+Zl38fiKdY1k4sdnOgyRj91gstiWk/C37lLuq3kepFyEn/rsfrw2E8
	R2qgR6HUv8lVGsDCEHDbn2feziEfgfZev4=
X-Received: by 2002:a05:6000:4549:b0:475:da0e:744d with SMTP id ffacd0b85a97d-48441fcbc51mr7324639f8f.8.1788269088492;
        Tue, 01 Sep 2026 06:24:48 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e452sm4638242f8f.35.2026.09.01.06.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:24:48 -0700 (PDT)
Message-ID: <6a96d220.5fb1dcdd.280708.47d5@mx.google.com>
X-Google-Original-Message-ID: <apbSGVNOYn15F6Cr@Ansuel-XPS.>
Date: Tue, 1 Sep 2026 15:24:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-phy@lists.infradead.org,
	neil.armstrong@linaro.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com
Subject: Re: [PATCH v4 3/3] phy: airoha: Add support for Airoha AN7583 USB PHY
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
 <20260901123933.15388-4-ansuelsmth@gmail.com>
 <20260901125344.46F841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901125344.46F841F000E9@smtp.kernel.org>

On Tue, Sep 01, 2026 at 12:53:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Failure to propagate PHY lifecycle calls to the underlying SerDes PHY
> - [High] USB PHY instances are inaccessible due to incorrect PHY provider registration
> - [Medium] Use of uninitialized stack variable due to missing regmap_read return check
> - [Medium] Lockdep warning due to recursive locking of phy->mutex in set_mode callbacks
> - [Low] Missing select REGMAP_MMIO in Kconfig leading to link-time errors
> - [Low] Missing explicit inclusion of <linux/delay.h>
> --
> 
> commit 78bb8c49d95aeffce30cf8303d7ac8de16f47e67
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
>     phy: airoha: Add support for Airoha AN7583 USB PHY
>     
>     Add support for USB PHY for Airoha AN7583 SoC, this share some U2 init
>     from AN7581 but use a totally different init phase for PLL and
>     calibration for U3. Also on AN7583 there is a single USB PHY that init 2
>     U2 port and one U3 port. (the USB controller expose 2 hub, one with 2
>     usb 2.0 port and one with one 3.0 port)
>     
>     A second USB PHY is used for PCIe Gen2 controller and follow the same
>     calibration and setup logic of USB.
> 
> > diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
> > new file mode 100644
> > index 0000000000000..13e49ff947e3e
> > --- /dev/null
> > +++ b/drivers/phy/airoha/Kconfig
> > @@ -0,0 +1,11 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config PHY_AIROHA_AN7583_USB
> > +	tristate "Airoha AN7583 USB PHY Driver"
> > +	depends on ARCH_AIROHA || COMPILE_TEST
> > +	depends on OF
> > +	select GENERIC_PHY
> 
> [Severity: Low]
> Is a select for REGMAP_MMIO missing here? If COMPILE_TEST is enabled and no
> other driver implicitly selects REGMAP_MMIO, couldn't this cause a link-time
> error due to an undefined reference to __devm_regmap_init_mmio_clk?
> 
> > +	help
> > +	  Say 'Y' here to add support for Airoha AN7583 USB PHY driver.
> 
> > diff --git a/drivers/phy/airoha/phy-an7583-usb.c b/drivers/phy/airoha/phy-an7583-usb.c
> > new file mode 100644
> > index 0000000000000..46b5f09582cfd
> > --- /dev/null
> > +++ b/drivers/phy/airoha/phy-an7583-usb.c
> > @@ -0,0 +1,2023 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Author: Christian Marangi <ansuelsmth@gmail.com>
> > + */
> > +
> > +#include <dt-bindings/phy/phy.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/math.h>
> > +#include <linux/module.h>
> > +#include <linux/phy.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> 
> [Severity: Low]
> Does this code rely on linux/delay.h for mdelay() and usleep_range() without
> including it? This could lead to compilation failures on architectures or
> configurations where it isn't implicitly included by other headers.
> 
> [ ... ]
> 
> > +static bool an7583_usb_phy_u3_kband_is_calibrated(struct an7583_usb_phy_priv *priv)
> > +{
> > +	u32 val, res;
> 
> [ ... ]
> 
> > +	regmap_read(priv->regs[AIROHA_USB_PHY_PMA],
> > +		    AIROHA_USB_PMA_INTF_STS_9, &val);
> > +	res = FIELD_GET(AIROHA_USB_PMA_ADDR_INTF_STS_PLL_VCOCAL, val) << 4;
> 
> [Severity: Medium]
> If the regmap_read() fails, wouldn't the uninitialized stack variable val be
> accessed here? Could this result in undefined behavior and potentially bypass
> the KBand calibration loop?
> 
> [ ... ]
> 
> > +static int an7583_usb_phy_init(struct phy *phy)
> > +{
> > +	struct an7583_usb_phy_instance *instance = phy_get_drvdata(phy);
> 
> [Severity: High]
> Does this initialization omit a call to phy_init(instance->serdes_phy)? Since
> the wrapper PHY intercepts the init call, failing to forward it might leave
> the physical SerDes lines uninitialized and the PCIe and USB 3.0 interfaces
> non-functional.
> 
> > +
> > +	switch (instance->type) {
> > +	case PHY_TYPE_USB2:
> 
> [ ... ]
> 
> > +static int an7583_usb_phy_power_on(struct phy *phy)
> > +{
> > +	struct an7583_usb_phy_instance *instance = phy_get_drvdata(phy);
> 
> [Severity: High]
> Similarly, does this fail to call phy_power_on(instance->serdes_phy)? This
> seems to leave the physical SerDes disabled when a consumer attempts to power
> on the PHY.
> 
> > +
> > +	switch (instance->type) {
> > +	case PHY_TYPE_USB2:
> 
> [ ... ]
> 
> > +static int an7583_usb_phy_u3_set_mode(struct phy *phy, enum phy_mode mode,
> > +				      int submode)
> > +{
> > +	struct an7583_usb_phy_instance *instance = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	switch (mode) {
> 
> [ ... ]
> 
> > +	}
> > +
> > +	ret = phy_set_mode_ext(instance->serdes_phy, mode, submode);
> 
> [Severity: Medium]
> Can this nested call to phy_set_mode_ext() on the child SerDes PHY cause a
> lockdep warning?
> 
> Since the parent PHY's mutex is already held by the framework, and all PHY
> mutexes are initialized with the same lockdep key, this might trigger a
> possible recursive locking deadlock warning. This pattern also appears in
> an7583_usb_phy_pcie_set_mode().
> 
> [ ... ]
> 
> > +static struct phy *an7583_usb_phy_xlate(struct device *dev,
> > +					const struct of_phandle_args *args)
> > +{
> > +	struct an7583_usb_phy_priv *priv = dev_get_drvdata(dev);
> > +	const struct an7583_usb_phy_match_data *data;
> > +	struct device_node *phy_np = args->np;
> > +	struct phy *phy = NULL;
> > +	int type, index;
> > +
> > +	data = of_device_get_match_data(dev);
> > +
> > +	if (args->args_count != 1) {
> > +		dev_err(dev, "invalid number of cells in 'phy' property\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	for (index = 0; index < data->max_instance; index++) {
> > +		if (!priv->phys[index])
> > +			continue;
> > +
> > +		if (phy_np == priv->phys[index]->dev.of_node) {
> > +			phy = priv->phys[index];
> > +			break;
> > +		}
> > +	}
> 
> [ ... ]
> 
> > +static int an7583_usb_phy_probe(struct platform_device *pdev)
> > +{
> 
> [ ... ]
> 
> > +	phy_provider = devm_of_phy_provider_register(dev, an7583_usb_phy_xlate);
> 
> [Severity: High]
> Does this incorrectly isolate the subnodes from the PHY core?
> 
> By registering the provider with devm_of_phy_provider_register(dev, ...)
> instead of using a variant that checks the children tree, the PHY core might
> fail to traverse to the child nodes when looking up the PHY.
> 
> Furthermore, in an7583_usb_phy_xlate(), comparing the parent node (args->np)
> against the child node stored in priv->phys[index]->dev.of_node would
> guarantee a mismatch. Would this make the USB PHY instances completely
> inaccessible to any consumer?
> 

Is AI getting drunk? Aside from the mostly unreadable message, this is
totally non-sense and out of complete speculation.

The scenario pointed out by AI is in the case where a consumer reference
the provider node in DT but this was never suggested and actually an
implementation error of the user writing the device tree.

The Documentation example instruct for USB nodes to put the phy cell in the
child node, NEVER in the provider node. Any kind of phandle will fail as
the correct cell property won't be found. So I'm not really understanding
the error pointed out here.

-- 
	Ansuel
