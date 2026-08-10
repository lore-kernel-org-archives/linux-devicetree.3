Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9E3AEB29
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363029; cv=none; b=u2Eo+doKR7lLSxZhhuAN67fb1drZX9muw8MATecF9kkvUN7ehMbh4U3uU1j8F3M5kaSn37nzS9uGSH3IdTMvvVJ8petEitz35rq+7LgrhNj31/qNszx8q5QHynoX/Jf1jcjF7hr4py9ttsubIA2fDmuy6L48EriUIAxwTos/ToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363029; c=relaxed/simple;
	bh=o5WkBg1NLALV5hwx12VsffQih8R6gwM53qCFRt+Oukk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a/yiRLyBIeSmQ/pbpJymJYqie/aIgOmX5Y7Q0HoN4euPMyOpX2Sym+Qrh5yvk4JaKa3dCJOobE+MJfIc8QSbEEcTUctEmyvVTy/Zm39xKyveCzctUH/WexM7iK5Zgc5XDlamimw3fmiBwgjdDdaepVj9EmRTxbabg4PbThnZX4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgCD6hXq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgCD6hXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AD61F000E9;
	Mon, 10 Aug 2026 11:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786363028;
	bh=yoq9TvQbw570jUnpK+0CMz7l27Zxa9GD/5F3ez5HHag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IgCD6hXqxCOu9rzNZZd0qKUpSHKgOw95cWuhicTgl+Nn/I24XH12Z3nqI+5FydqJx
	 7vyYvZk4aHqv3Go9nHwqv38UHk9QtmJPV5K36QWOv/Tk5pxdVqfuQ2+tGa/4FX/4s8
	 YpYWxaCww3Mak11YgWjTCx1vOqQvkUBX5ux54sKBX2N5eA4M1ICaWylw+71BTHpZZY
	 drlSoJUErYWR7l9+lrUvyTx+p0kbImXG9T30h5qmAoIOS9V8CksYckxws+2wM91Yir
	 kNpRHAk6XnJhkn5Fhd/LNH5t/w1GiUefHb0Hq3OAC/2A9BFsNCUs3hLCGeqZfE59+t
	 3IXDw0xK3HYkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] phy: qcom-ipq806x-usb: fix the PHY_PARAM_CTRL1
 field masks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
In-Reply-To: <20260810-msm8974-usb3-v1-6-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-6-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:57:07 +0000
Message-Id: <20260810115707.94AD61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes overlapping off-by-one field masks for PHY_PARAM_C=
TRL1, but fails to address identical off-by-one overlaps in RX_OVRD_IN_HI a=
nd TX_OVRD_DRV_LO register masks which cause active initialization bugs.
- [High] Missing clock cleanup on error paths in qcom_ipq806x_usb_ss_phy_in=
it().
- [High] TEST_POWERDOWN is incorrectly cleared instead of being set during =
PHY exit.
- [High] Missing -EPROBE_DEFER handling for the optional xo_clk.
- [Medium] qcom_ipq806x_usb_ss_phy_init() incorrectly passes a fully assemb=
led register value to usb_phy_write_readback(), causing spurious readback v=
erification failures.
--

--- Patch [6]: [PATCH 06/10] phy: qcom-ipq806x-usb: fix the PHY_PARAM_CTRL1=
 field masks ---
commit cc9548cb27cc0af73d58ff5dfbb1d43ff53c1b2b
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

phy: qcom-ipq806x-usb: fix the PHY_PARAM_CTRL1 field masks

This patch aligns the PHY_PARAM_CTRL1 field masks with their documented=20
positions to prevent values from landing shifted. The previous off-by-one=20
masks corrupted neighboring fields and caused spurious write-readback=20
failures during PHY initialization.

> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qu=
alcomm/phy-qcom-ipq806x-usb.c
> index cf77e0a66e20d..3d3e9d6da298c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -68,15 +68,17 @@
>  #define SSPHY_MPLL_VALUE		0
> =20
>  /* QSCRATCH PHY_PARAM_CTRL1 fields */
> -#define PHY_PARAM_CTRL1_TX_FULL_SWING_MASK	GENMASK(26, 19)
> -#define PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK	GENMASK(19, 13)
> -#define PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK	GENMASK(13, 7)
> -#define PHY_PARAM_CTRL1_LOS_BIAS_MASK		GENMASK(7, 2)
> +#define PHY_PARAM_CTRL1_TX_FULL_SWING_MASK	GENMASK(26, 20)
> +#define PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK	GENMASK(19, 14)
> +#define PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK	GENMASK(13, 8)
> +#define PHY_PARAM_CTRL1_LOS_LEVEL_MASK		GENMASK(7, 3)
> +#define PHY_PARAM_CTRL1_LOS_BIAS_MASK		GENMASK(2, 0)
> =20
>  #define PHY_PARAM_CTRL1_MASK				\
>  		(PHY_PARAM_CTRL1_TX_FULL_SWING_MASK |	\
>  		 PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK |	\
>  		 PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK |	\
> +		 PHY_PARAM_CTRL1_LOS_LEVEL_MASK | \
>  		 PHY_PARAM_CTRL1_LOS_BIAS_MASK)

[Severity: High]
This is a pre-existing issue, but while fixing the overlapping field masks =
for=20
PHY_PARAM_CTRL1, are there identical overlaps in the RX_OVRD_IN_HI and=20
TX_OVRD_DRV_LO masks that break the initialization logic?

For example:

#define RX_OVRD_IN_HI_RX_EQ_MASK		GENMASK(10, 7)
#define RX_OVRD_IN_HI_RX_EQ_EN_OVRD		BIT(7)

Because these masks overlap at bit 7, does qcom_ipq806x_usb_ss_phy_init()=20
silently disable the override right after enabling it?

	data |=3D RX_OVRD_IN_HI_RX_EQ_EN_OVRD;
	data &=3D ~RX_OVRD_IN_HI_RX_EQ_MASK;
	data |=3D RX_OVRD_IN_HI_RX_EQ(phy_dwc3->rx_eq);

[ ... ]

> @@ -436,7 +440,8 @@ static int qcom_ipq806x_usb_ss_phy_init(struct phy *p=
hy)
>  	data |=3D PHY_PARAM_CTRL1_TX_FULL_SWING(0x6e) |
>  		PHY_PARAM_CTRL1_TX_DEEMPH_6DB(0x20) |
>  		PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(phy_dwc3->tx_deamp_3_5db) |
> -		PHY_PARAM_CTRL1_LOS_BIAS(0x9);
> +		PHY_PARAM_CTRL1_LOS_LEVEL(0x9) |
> +		PHY_PARAM_CTRL1_LOS_BIAS(0x0);
> =20
>  	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_PARAM_CTRL_1,
>  			       PHY_PARAM_CTRL1_MASK, data);

[Severity: Medium]
This isn't a bug introduced by this patch, but does this call to=20
usb_phy_write_readback() always fail spuriously on probe?

It looks like we are passing a fully assembled register value (`data`) as `=
val`
instead of passing just the masked bits:

	data =3D readl(phy_dwc3->base + SSUSB_PHY_PARAM_CTRL_1);
	data &=3D ~PHY_PARAM_CTRL1_MASK;
	data |=3D PHY_PARAM_CTRL1_TX_FULL_SWING(0x6e) | ...
	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_PARAM_CTRL_1,
			       PHY_PARAM_CTRL1_MASK, data);

Inside usb_phy_write_readback(), it uses the provided `mask` when checking =
`val`:

	/* Read back to see if val was written */
	tmp =3D readl(phy_dwc3->base + offset);
	tmp &=3D mask;		/* clear other bits */

	if (tmp !=3D val)
		dev_err(...);

Since `data` contains unmasked bits from the initial readl() and `tmp` masks
them out, won't this check unconditionally fail if any unmasked bits are no=
n-zero?

[Severity: High]
This is a pre-existing issue, but does qcom_ipq806x_usb_ss_phy_init() leak=
=20
the clock references if it fails?=20

When a hardware read/write fails, the error path returns without unwinding=
=20
the enabled clocks:

err_phy_trans:
	return ret;

Since the PHY core doesn't call phy_exit() when phy_init() fails, it seems=
=20
xo_clk and ref_clk remain permanently prepared and enabled?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the PHY exit sequence i=
n=20
qcom_ipq806x_usb_ss_phy_exit() disable PHY retention instead of enabling it?

The comment indicates we want to set TEST_POWERDOWN:

	/* 3. Set TEST_POWERED_DOWN in PHY_CTRL_REG to enable PHY retention */
	...
	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_CTRL_REG,
			       SSUSB_CTRL_TEST_POWERDOWN, 0x0);

Since 0x0 is passed as the `val`, usb_phy_write_readback() clears the=20
SSUSB_CTRL_TEST_POWERDOWN bit rather than setting it. Should this pass=20
SSUSB_CTRL_TEST_POWERDOWN as the value?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does qcom_ipq806x_usb_phy_probe() handle=
=20
probe deferral correctly for the optional xo_clk?

	phy_dwc3->xo_clk =3D devm_clk_get(phy_dwc3->dev, "xo");
	if (IS_ERR(phy_dwc3->xo_clk)) {
		dev_dbg(phy_dwc3->dev, "cannot get TCXO clock\n");
		phy_dwc3->xo_clk =3D NULL;
	}

devm_clk_get() returns -EPROBE_DEFER when the clock is not yet ready. By=20
checking IS_ERR and masking all errors to NULL, wouldn't the driver fail to=
=20
defer its probe and silently operate without the TCXO clock if it probes=20
before the clock provider is ready?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-msm8974-us=
b3-v1-0-1a47e1185524@oss.qualcomm.com?part=3D6
