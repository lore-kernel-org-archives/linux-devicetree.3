Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCDF349CD2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916467; cv=none; b=k483Rbcc41T1C4QzB0whUIivvGaHN0s3DHtgVCLsfITXLjrPbhycuUCJ/HNn4YExElSVqkiKT21zEFG6S0NjGlfG3YHJsny3lW6lRqXMI8w4f+y4KalfjX0ps9Rl+v7MDAGred+WFm47OcVSWdgQh21TVk0ZY3E50EDXZrYTqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916467; c=relaxed/simple;
	bh=rU7AxkopJJIzxZFPA4XMAO205pRBP6wKHWPrqtVv5yE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LfAbNO9h/5EMZt+AaDkj6X1NKFnlPssHSPI68VyZgYGHoC4mP+eYSayU6DQC8c/YcxHtXuMBcZe9hglltMiw9/dCdp6jDpQcuQ9JBAGhUXicjtyhCS6uqgr3pbAf/YijdzvTu7DFJW1SCRAdc9FyAgzTg07JpbIAcFNjzZPpREA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVDjVM2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVDjVM2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F101F000E9;
	Wed,  1 Jul 2026 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916466;
	bh=m8Ep+WztZKrXzs6aDdcLp08aRmZN/JP7RHztmzoUg70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XVDjVM2W+LtBln79oqh1lxaXq75t1lo3qu/Glu5hGIdHX9CkKIvyyG9ke07HqTAC+
	 s04MIqelE/9OSSasprfamkN3ApTEz9tg9m0aDueZDenypb1zItWSSmOyxgQhx3yIop
	 Ly4yYdvynGEpfSJYsiE2lT589Pk53VHgMfLD9vbh/euFmlNqs5kBNR564hRI83TKLd
	 LyV7gs5p9Wucvp+T8EMeD91hnQJ5jb4YCYTr2JymZlizpne7FB1Q/thoMAk9Q/fQRo
	 5/EW7+LrMs+uHJ23Rom4dnPxT3dW8mlxfS6jiKTmWj8IrRZEWUnEPwhdGhYcqKV8X0
	 f3ezpyZ/RdjCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 2/2] arm64: dts: ti: Add PLL1 refclk to
 J784S4 SoC SERDES node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gokul Praveen" <g-praveen@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260701142457.81874-3-g-praveen@ti.com>
References: <20260701142457.81874-1-g-praveen@ti.com>
 <20260701142457.81874-3-g-praveen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 14:34:24 +0000
Message-Id: <20260701143425.97F101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The Cadence Torrent PHY multilink configuration will fail on other=
 K3 platforms (e.g., J721S2) due to a missing pll1_refclk property in ident=
ical serdes nodes.
--

commit cad292e544578dc0fc4b900abd68b229a97dc116
Author: Gokul Praveen <g-praveen@ti.com>

arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node

This commit adds the PLL1 reference clock to the clocks and clock-names
parameters of the SERDES nodes for the J784S4 and J742S2 SoCs. This resolves
an issue where serdes multilink configurations fail without PLL1.

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/a=
rch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index c2636e624f18b..e5224bd7f5383 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -1149,8 +1149,9 @@ serdes0: serdes@5060000 {
>  			resets =3D <&serdes_wiz0 0>;
>  			reset-names =3D "torrent_reset";
>  			clocks =3D <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
> +				 <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
>  				 <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
> -			clock-names =3D "refclk", "phy_en_refclk";
> +			clock-names =3D "refclk",	"pll1_refclk", "phy_en_refclk";

[Severity: High]
This isn't a bug introduced by this patch, but does the same multilink
configuration failure occur on other K3 platforms like J721S2?

Looking at serdes0 in arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi, it lacks
the pll1_refclk property in the clocks array:

    clocks =3D <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
             <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
    clock-names =3D "refclk", "phy_en_refclk";

When a multilink configuration is requested on these platforms (e.g., PCIe =
on
lane 0 and SGMII on lane 1), will the phy-cadence-torrent driver fail to
enable the PLL1 reference clock?

Could this cause essential peripheral initialization to fail when the
PHY is unable to lock PLL1?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701142457.8187=
4-1-g-praveen@ti.com?part=3D2
