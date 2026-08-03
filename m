Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF02836A0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739541; cv=none; b=c2GcSiyynqWA75aEeVfTK5nJfkLHfJUt4arcryZXQZw0b9RPB3BbEByI6cJ4zivTWmkg2LvYuhmnbwXZKTupEVah+gH0pwNYxuVkHIFZH1F0sjY3cAfirX1VB0QqHdWLtkFN+pG0Srbsoa+ZYLPZJjbwq8Wa6TyLFxn2JcXzbAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739541; c=relaxed/simple;
	bh=iwDXPNuEASxnRGB3cumq3M/d/g47mKlQtY/hnpgjiic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YM/nkUj2+eLuNykhB9wyj/4J1dQ9tY2ihtp3Dd+2Lp7hbcEjIqJUkEdDVswQRCZA5oUE7eX2/rC0kPP3A2+0y3JRZJW1xeMvCXysCMqw/mq9mRiWNxlprUjkqMwWr2ydBiaika3G2IGCH1B6oC0CJ6lkMdHH9f7Rk5OuljOEX1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZc0X9UH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZc0X9UH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2DF1F000E9;
	Mon,  3 Aug 2026 06:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739540;
	bh=Btv+a5Uh4yS/r5R4hClOIlB0rWlkwM3JnpLvWmNymIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iZc0X9UHFnywFVHxrRiEO1nMrpaibvrVlrH/XgTQArT6/FShuzC3LHKF6rprBHjIZ
	 6E4xSUTzbNNU2ZHD3WM4xveDhWd9iEx1/yh1ETyjOZinwhBK18Uvr/IBSOtPdzdUZr
	 kUN9CrOg1LT6Fqzap2Qp+w2qrwo7z4Cax0hSrm9vRyFQ606LOe+hBksKq828k2O0yV
	 yyTL1b1k19q5IG0vUJAQYu9X9h1gaaVRjkC8uIsXZFVJlWui2RWWUhCbyHpIyQdADt
	 9qWJS84lSkCmSGFW18LMuUuS2yFPm8SwDR39Khzft/4oxuhUCJH3t1RWeYkt0W1+jS
	 wO+sUdEikHB/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/28] arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-18-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-18-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:45:39 +0000
Message-Id: <20260803064539.BC2DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: Snapdragon X Plus (purwa/x1p) boards were missed a=
nd continue to supply incorrect voltages to the USB QMP PHYs.
--

--- Patch [18]: [PATCH 18/28] arm64: dts: qcom: hamoa: Fix swapped USB QMP =
PHY vdda-phy/vdda-pll supplies ---
commit 56ae73fe6fa593d516dd7a86b9b535d8c22c1819
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

This commit fixes an issue across multiple Snapdragon boards where the 1.2V
and 0.88V regulators for the USB QMP PHY were incorrectly swapped. The patch
swaps vdda-phy-supply and vdda-pll-supply back to their correct voltages for
the affected devices.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boo=
t/dts/qcom/hamoa-iot-som.dtsi
> index 9c5e77df00547..bc70fe5db96f5 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -590,8 +590,8 @@ &usb_1_ss0_hsphy {
>  };
> =20
>  &usb_1_ss0_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> -	vdda-pll-supply =3D <&vreg_l1j_0p8>;
> +	vdda-phy-supply =3D <&vreg_l1j_0p8>;
> +	vdda-pll-supply =3D <&vreg_l2j_1p2>;
> =20
>  	status =3D "okay";
>  };

[Severity: High]
This is a pre-existing issue, but it looks like some Snapdragon X Plus (pur=
wa/x1p)
boards were missed and continue to supply incorrect voltages to the USB QMP=
 PHYs.

For example, in arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi around line 586
for usb_1_ss0_qmpphy:

&usb_1_ss0_qmpphy {
	vdda-phy-supply =3D <&vreg_l2j_1p2>;
	vdda-pll-supply =3D <&vreg_l1j_0p8>;

And similarly in arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
around line 1590 for usb_1_ss0_qmpphy:

&usb_1_ss0_qmpphy {
	vdda-phy-supply =3D <&vreg_l2j_1p2>;
	vdda-pll-supply =3D <&vreg_l1j_0p8>;

Should these files be updated as well to prevent unconditionally feeding 1.=
2V
into the 0.88V PHY rails on those boards during boot?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D18
