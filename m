Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F923BD1B
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739573; cv=none; b=Npq+jgwu9oA44EwX6Yzd4MTdydDZIjVbRF9U9ENyeMA+l67tNBFMXm6S7a0Ilxa1Qu/p15VUVQLZ6XjYVKF6ctW7VzrwMAOlwwCDNS1CAY6jZHTtatEwAcezQXM8p2yYROeOgIpbe2DLl07bK1JNxX1GGVNuPeuRubSuaHhfY+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739573; c=relaxed/simple;
	bh=F09L/N/CYEMQ4QaEBc+JHCFjC+BnDHVAPCO/QJRTik8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=stk+/7919yrtiZXea9J8F6R2ixF8yMxcfrEhE52+QE4AWHC9iSov9K7hgAymci56MJDdKEH80l2t10W022lSYEAmV7s984dWh+0B4fRg1P2fruqDb6kJgdP6E1GfCUKjHBM8XR6KdALD+GP2mHi+ZshGRvdYS8MMh9x7fbq8XLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKqtd29d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKqtd29d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C511F000E9;
	Mon,  3 Aug 2026 06:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739571;
	bh=gehH/b9hKVZiZiH1pqoDnHVHwplDbDrWan0GqqHW5nA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FKqtd29d56kE7MbVZVfKwipBgeVnmB4YU1esVl4oTvsmw4dZ4oNWyIulRSLnQ6yan
	 nUyf+LJoOAcUILiPUXovb8/2u4YZ7ybeAY4dzzQ5cliYVQq+UxfVUNqpygMqmGzXt5
	 j72X4ydU/u6nfjzOEqJl/V6YJjBcxhG8G+eheXq/FDwoDNMSquBJCk6iC2UQQV3CgC
	 R7zfHX11ysyjpVqkMEmriQ7YRuqfwO89S7yu+tqJDkGnMTiXFWDN4ZEDN2qx+Jwsej
	 S6RJaCv6PYC/XfiyJV6BccWEfIyg7oLT+ZUcMCT/QM8A072v4UKMLoVN9Yrt5uIddj
	 8JSO0JjK0SgZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/28] arm64: dts: qcom: sa8540p: Fix swapped USB QMP
 PHY vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-3-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-3-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:46:11 +0000
Message-Id: <20260803064611.76C511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Swapped PHY and PLL regulator supplies in additional Qualcomm boar=
ds missed by patch series.
--

--- Patch [3]: [PATCH 03/28] arm64: dts: qcom: sa8540p: Fix swapped USB QMP=
 PHY vdda-phy/vdda-pll supplies ---
commit f7f68ce606103ed03353b8e43b7fb5b5dfb4a92b
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sa8540p: Fix swapped USB QMP PHY vdda-phy/vdda-pll suppli=
es

The QMP PHY expects the vdda-phy supply to be around 0.88V and the vdda-pll
supply to be 1.2V. This patch fixes an issue where these two supplies were
swapped for the USB QMP PHYs on SA8540P and SA8295P boards.

> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/d=
ts/qcom/sa8295p-adp.dts
> index d28d691624279..7178ae087038c 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -604,8 +604,8 @@ &usb_0_hsphy {
>  };
> =20
>  &usb_0_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l3a>;
> -	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-phy-supply =3D <&vreg_l5a>;
> +	vdda-pll-supply =3D <&vreg_l3a>;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this fix I
noticed that identical swapped PHY and PLL supplies seem to exist in other
Qualcomm boards missed by this patch series.

For instance, in arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
for pcie2a_phy and pcie4_phy:

&pcie2a_phy {
	vdda-phy-supply =3D <&vreg_l4d>;
	vdda-pll-supply =3D <&vreg_l6d>;

Here 1.2V (vreg_l4d) is fed to the 0.88V vdda-phy rail and 0.88V (vreg_l6d)=
 is
fed to the 1.2V vdda-pll rail.

Similarly, in arch/arm64/boot/dts/qcom/lemans-evk.dts (usb_0_qmpphy) and
arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi (usb_0_qmpphy and
usb_1_qmpphy):

&usb_0_qmpphy {
	vdda-phy-supply =3D <&vreg_l1c>;
	vdda-pll-supply =3D <&vreg_l7a>;

This also mistakenly feeds 1.2V to the 0.88V rail and 0.88V to the 1.2V rail
during device probe at boot.

Are these additional nodes also causing a deterministic overvoltage on the =
PHY
circuitry that risks hardware damage, and should they be fixed as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D3
