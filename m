Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595C138F244
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919455; cv=none; b=C39wmNe5Lbj3IkTmJizY5+55u5aTSAHCQr4he/sMpWJlxKrzIsfNLJQCM8r4oRKjHiEbVkJ1RkYpI7+tI4YZxl4gdI5mB1RxGS8Y0umyrQFD9VYeLj8Qy3ySUUlr5RTMZCFR5Xk+oUudmn9XRdW2PbsfGvvKlzLoLN5UHe1qNh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919455; c=relaxed/simple;
	bh=fzNyTr6pgXuicrr4mitBUveNaAe6Xit/unHSIgtBzRg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JEaKRbDos0ssuURsU2jwvJ2MJfio/2qOkiWgHZwsnM35G2c0xeWRxgb1ALzOaXyz7UjpGyj0AY56XSRKYmlzNcdsDvCTbDwGsw5aj6LKGonpekNvzzAGwoFGN3EcX4sW31ZM0MXn7OKdna8HhACG5u5ScyFIMBWsa21noxsuM1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mArXS+cC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mArXS+cC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33201F00A3A;
	Fri, 24 Jul 2026 18:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784919452;
	bh=+GX3dR39xRvD3ItJVZ2cYEeoobPAFdjmrzQosLfQynQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mArXS+cCbxOkrRpUjnMvDAaO3Qeypybe3SglW3CyoFNiHS9Tdqxcn6brzyicA8tii
	 hFjULA48nM5DTiFDDkjMK9tnxmmXD9szdlmx0Pn5gyNI0XtqN4Dk5wtGrUmMhNZlTh
	 lVPA5JLJ5ZQiI8s6iNpRl9OdUwhe2gFutbrEjA/CZYWRuBYMSuUeZvGbGZ9yH80mH/
	 zAfC6ZhYX6JU0KakVq1JugNzWEHH0Pt5iGc5rDicGPnS2QPffYK2vs1JSnWvBg9rvg
	 B5FSj/bIMBPnhc4n0bzptGg8iAtYv06MKltG34fcahshmbbF3R8rh6b3b78xquyXzK
	 u3XiXGPomVV7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: en7523: Add support for selecting the Serdes
 port in SCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724184304.192962-3-ansuelsmth@gmail.com>
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
 <20260724184304.192962-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:57:31 +0000
Message-Id: <20260724185731.C33201F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The PHY set_mode callback incorrectly rejects USB host and OTG mod=
es, breaking USB host functionality.

Pre-existing issues:
- [High] Missing spinlock in reset operations allows concurrent reset asser=
tions to corrupt shared reset control registers.
- [High] Probe failure leaves unregistered clocks in the clock core, causin=
g a Use-After-Free and memory leak when devres frees the clock structures.
--

--- Patch [2]: [PATCH 2/2] clk: en7523: Add support for selecting the Serde=
s port in SCU ---
commit e81bbf2efd265f6528ea23e2f2c71e904963fc17
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: Add support for selecting the Serdes port in SCU

In the SCU register for clock and reset, there are also some register to
select the Serdes port mode. The Airoha AN7581 SoC have 4 different Serdes
that can switch between PCIe, USB or Ethernet mode.

Add a simple PHY provider that expose the .set_mode OP to toggle the
requested mode for the Serdes port.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d32..183cf7fe4bda6 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -830,12 +861,179 @@ static int en7581_reset_register(struct device *de=
v, void __iomem *base,
>  	return devm_reset_controller_register(dev, &rst_data->rcdev);
>  }
> =20
> +static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mod=
e,
> +				      int submode)
> +{

[ ... ]

> +	case AIROHA_SCU_SERDES_USB1:
> +		reg =3D REG_NP_SCU_SSR3;
> +		mask =3D REG_SSUSB_HSGMII_SEL_MASK;
> +
> +		if (mode !=3D PHY_MODE_ETHERNET && mode !=3D PHY_MODE_USB_DEVICE &&
> +		    mode !=3D PHY_MODE_USB_DEVICE_SS)
> +			return -EINVAL;

[Severity: High]
Does this validation block USB host and OTG operations for the USB1 port?

If a USB controller driver calls phy_set_mode(phy, PHY_MODE_USB_HOST) or
PHY_MODE_USB_OTG during initialization, it appears this check will reject
it and return -EINVAL, bypassing the register write and leaving the Serdes
lanes uninitialized.

> +
> +		if (mode =3D=3D PHY_MODE_ETHERNET)
> +			sel =3D REG_SSUSB_HSGMII_SEL_HSGMII;
> +		else
> +			sel =3D REG_SSUSB_HSGMII_SEL_USB;
> +
> +		break;
> +	case AIROHA_SCU_SERDES_USB2:
> +		reg =3D REG_NP_SCU_SSTR;
> +		mask =3D REG_USB_PCIE_SEL_MASK;
> +
> +		if (mode !=3D PHY_MODE_PCIE && mode !=3D PHY_MODE_USB_DEVICE &&
> +		    mode !=3D PHY_MODE_USB_DEVICE_SS)
> +			return -EINVAL;

[Severity: High]
Similarly, does this logic improperly reject PHY_MODE_USB_HOST and
PHY_MODE_USB_OTG for the USB2 Serdes port?

[ ... ]

> @@ -853,9 +1053,12 @@ static int en7581_clk_hw_init(struct platform_devic=
e *pdev,
>  	val =3D readl(base + REG_NP_SCU_PCIC);
>  	writel(val | 3, base + REG_NP_SCU_PCIC);
> =20
> -	return en7581_reset_register(&pdev->dev, base, en7581_rst_map,
> -				     ARRAY_SIZE(en7581_rst_map),
> -				     en7581_rst_ofs);
> +	ret =3D en7581_reset_register(&pdev->dev, base, en7581_rst_map,
> +				    ARRAY_SIZE(en7581_rst_map), en7581_rst_ofs);

[Severity: High]
This is a pre-existing issue, but does the lack of a spinlock in the reset
operations allow concurrent reset assertions to corrupt shared registers?

If multiple driver probes (e.g., PCIe, USB, Ethernet) call
en7523_reset_update() or en7523_pci_prepare() concurrently, both functions
perform unlocked read-modify-write sequences on REG_RESET_CONTROL1:

en7523_reset_update() {
    ...
    val =3D readl(addr);
    if (assert)
        val |=3D BIT(id % RST_NR_PER_BANK);
    else
        val &=3D ~BIT(id % RST_NR_PER_BANK);
    writel(val, addr);
}

Could a race condition here cause one IP block to be wedged in reset because
its update was lost?

> +	if (ret)
> +		return ret;
> +
> +	return en7581_serdes_phy_register(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but does this new error path expose a memory
leak and use-after-free of struct en_clk_gate in the clock core?

The clocks are allocated with devres but registered with unmanaged APIs:

en7523_register_pcie_clk() {
    ...
    cg =3D devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
    ...
    err =3D clk_hw_register(dev, hw);
}

If en7581_serdes_phy_register() returns an error here, the probe fails and
devres will automatically free cg. However, because clk_hw_register() was
used, the clock remains registered in CCF.

Would this leave a dangling pointer in the clock core that causes a crash
on subsequent access to /sys/kernel/debug/clk?

>  }
> =20
>  static enum en_hir get_hw_id(void __iomem *np_base)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724184304.1929=
62-1-ansuelsmth@gmail.com?part=3D2
