Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65EE36E46C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779230410; cv=none; b=umcj/R/v/OeJ3UfX0nrYfPwE2Be5hDoDJ33O1J5RLZ6cH+TFtuMoMy1eZEMqa/pwu0U6KJ2F99y2FHa2vDzEj6PKa/S33MdjSYsO1oHFS5Y2cFCSmRKNaftqgyr9O2CSU42mIbKe5vMOXNqYrBsmu0z+aiumE94VDk+d7kTww3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779230410; c=relaxed/simple;
	bh=t5yEwEBv/9FFupPH1eD1j1P5G3//a3LbMzRNa+0HJXw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sii085cjuLwHKj6zgO0B9acUO7NuIy6ZejsmILw+W7G0Dr9dJkgI9JANE5YU4uy5NhuqN7+89FX7zRRASfra8zb4nkH16E4itsqoqmCmBfZeSNkmrhf2iO3fsxp6A3vpnVdm0mBtzxRgJ/l3nq6x5nfUzCYr1z8pBj46KvUL55k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+KAEvC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+KAEvC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DF61F000E9;
	Tue, 19 May 2026 22:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779230409;
	bh=JSd2zfDHSKwk/ZSW0mQFfjSjuAMyp8UNhQF7ptunyIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a+KAEvC1Q7caypF1DP8P4AizOGRVMkhWqosVUxyc1AFB8OzMBYbWK4CEQukTbG0Hl
	 upiwVijGGm0adY1fBlEHLNaBUXGu5lLz2t/xvkm4mx5Z6Jcd2J02scCmID9jOg2l9u
	 FqD18x5xRa/OCVpofXraDNp2ehhmdlU91c0vJoiWh3mMeiHEKgCirsIDDEOq96rjI7
	 3yf8V2aDjdEIV/ipKu2kFxTiSZbWwOd5FYjJYFSTN9+G4ssXnUBHP10VK5rYCyCKMJ
	 997Jfecrzpl7sEbMwj63r5+KglhZlzh9YcmP6UtE5ZSRRZsWZRnzxv0qi/dA3kjtmO
	 OKQDlv/WA4HrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/6] clk: en7523: Add support for selecting the
 Serdes port in SCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260519220813.28468-5-ansuelsmth@gmail.com>
References: <20260519220813.28468-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 22:40:08 +0000
Message-Id: <20260519224008.A9DF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] The `reg` and `mask` variables are left uninitialized when pro=
cessing the `AIROHA_SCU_SERDES_PCIE2` case, leading to arbitrary memory/har=
dware corruption.
- [High] Concurrent read-modify-write operations on shared hardware registe=
rs lack spinlock protection, leading to race conditions and potential lost =
updates.
- [High] USB PHY instances unconditionally reject `PHY_MODE_USB_HOST` and `=
PHY_MODE_USB_OTG`, breaking USB host functionality.
--

commit 714fd2f968cbdacf2f17f7ead8459ffad971d307
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: clk: en7523: Add support for selecting the Serdes port in SCU

This commit adds support for selecting the Serdes port in the SCU register=
=20
for clock and reset. It implements a simple PHY provider with a set_mode=20
operation to toggle the requested mode (PCIe, USB, or Ethernet) for the=20
Airoha AN7581 SoC Serdes ports.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d32..58ec071388a4d 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -830,12 +858,173 @@ static int en7581_reset_register(struct device *de=
v, void __iomem *base,
> +static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mod=
e,
> +				      int submode)
> +{
> +	struct en_serdes_phy_instance *instance =3D phy_get_drvdata(phy);
> +	struct en_clk_priv *priv =3D dev_get_drvdata(phy->dev.parent);
> +	u32 reg, mask, sel, val;
> +
> +	switch (instance->serdes_port) {
> +	case AIROHA_SCU_SERDES_PCIE1:
> +		reg =3D REG_NP_SCU_SSTR;
> +		mask =3D REG_PCIE_XSI0_SEL_MASK;
[ ... ]
> +		} else {
> +			sel =3D REG_PCIE_XSI0_SEL_PCIE;
> +		}
> +
> +		break;
> +	case AIROHA_SCU_SERDES_PCIE2:

[Severity: Critical]
Could this cause random memory or hardware corruption?

It looks like reg and mask are not initialized for AIROHA_SCU_SERDES_PCIE2
here. When the switch statement finishes, the function uses these
uninitialized stack variables for the readl and writel operations.

> +		if (mode !=3D PHY_MODE_ETHERNET && mode !=3D PHY_MODE_PCIE)
> +			return -EINVAL;
[ ... ]
> +		} else {
> +			sel =3D REG_PCIE_XSI1_SEL_PCIE;
> +		}
> +
> +		break;
> +	case AIROHA_SCU_SERDES_USB1:
> +		reg =3D REG_NP_SCU_SSR3;
> +		mask =3D REG_SSUSB_HSGMII_SEL_MASK;
> +
> +		if (mode !=3D PHY_MODE_ETHERNET && mode !=3D PHY_MODE_USB_DEVICE &&
> +		    mode !=3D PHY_MODE_USB_DEVICE_SS)
> +			return -EINVAL;

[Severity: High]
Will this break USB host or dual-role functionality?

USB controllers operating in host or OTG modes often request
PHY_MODE_USB_HOST or PHY_MODE_USB_OTG. Since this PHY only acts as a
multiplexer, should it accept all valid USB modes when routing lines to the
USB controller?

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
[ ... ]
> +		if (mode =3D=3D PHY_MODE_PCIE)
> +			sel =3D REG_USB_PCIE_SEL_PCIE;
> +		else
> +			sel =3D REG_USB_PCIE_SEL_USB;
> +
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	val =3D readl(priv->base + reg);
> +	val &=3D ~mask;
> +	val |=3D sel;
> +	writel(val, priv->base + reg);

[Severity: High]
Can this read-modify-write sequence race if multiple Serdes ports are
configured concurrently?

The PHY subsystem uses a per-PHY instance mutex, so the set_mode callbacks
for different Serdes ports could execute in parallel (for example, during
asynchronous probing). Because they share hardware registers like
REG_NP_SCU_SSTR, concurrent operations could lead to lost updates and route
the Serdes to the wrong subsystem.

Would it be safer to protect these accesses with a spinlock added to struct
en_clk_priv?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519220813.2846=
8-1-ansuelsmth@gmail.com?part=3D4
