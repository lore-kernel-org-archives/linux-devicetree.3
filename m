Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251A23845D5
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740521; cv=none; b=B9sJE4Dj6ls/Dih5lG6+yrLKSw8qh3/KMZ36dFhi5hm3ghIx4TZ8LymJw8AQ+/8FAp4zqoCkHq1zZKNQFGV8S6o9S1i8ZoA1d3pKNxTz/3HdaxwqWDYzI/o5uTcGUF0oTgARONHXuvRo3yl3iVCAA24L4lqe5jWBDZs+WH5Fw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740521; c=relaxed/simple;
	bh=ElXEm7gKmQrmDvvCdyjb55+gJWkZofMlyS/QpD8MpYs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D4/w50le7EyLrRmPQlO4onRLz7odr0zYiD0vUb9cQLvggl45kIgymP4pewN0ydfcqE8j06MVEAD2Y6vHE40i5WX+UyWStQQ1ds0TvYgnPfm8HUBXEEu8dElwzmYADOMA/1twPAv31qcqxhkj3myHM3fssCl3YfJNlk6lfAAXZ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMsRMwf+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMsRMwf+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771841F00A3A;
	Mon,  3 Aug 2026 07:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785740519;
	bh=I28J6cK4TxAllAdjNk09SGudJYfE5wtDptxjrqupb/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aMsRMwf+SuNwJl+DKfx2RkiZZWT+WZIxXAqX84bNa5+JSp7iwlErERa9TBgx6lFbf
	 +L5/vFrdGBxUOzIrjpVuQyPWF03CMWWBem1+/dvw8dzrclkeKGzpNLA2oUHPHdOA/s
	 3FWjRC8cys/giLgFahgndTxWjQ/XrghLaDrNKS827w3mUs+/7RbdW8V2izKm5XPpy4
	 WmMa8wLDXw9spfjaPHvGwxoOV/MR+y2dEJFK/R+SIHdTWp28aoXwVnBh6e4QFuN55a
	 93nYM8gQ4HCXlVtkYVTeR83dDZ0b7jqNWTga9XX2TWrOvANCV1HA8PyRyX8y+zV8X4
	 f24+ty7jSmx5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 28/28] arm64: dts: qcom: talos-evk: Fix swapped USB QMP
 PHY vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-28-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-28-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 07:01:59 +0000
Message-Id: <20260803070159.771841F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch provid=
es an incomplete fix that leaves several QMP PHYs incorrectly configured. T=
he commit message states that the QMP PHY expects the `vdda-pll` supply to =
be 1.2V, and the patch correctly sets `usb_qmpphy_2` to use `vreg_l11a` (wh=
ich is configured for 1.23V - 1.26V). However, it fails to fix `usb_qmpphy`=
, `ufs_mem_phy`, and `pcie_phy` in the same file (`talos-evk-som.dtsi`), al=
l of which continue to use `vreg_l12a` (which is configured for 1.8V - 1.89=
V) for their PLL supply. Furthermore, the sibling board `qcs615-ride.dts` a=
lso leaves both `usb_qmpphy` and `usb_qmpphy_2` configured with `vreg_l12a`=
 (1.8V). This leaves the remaining PHYs exposed to a significant overvoltag=
e (1.8V instead of 1.2V).
--

--- Patch [28]: [PATCH 28/28] arm64: dts: qcom: talos-evk: Fix swapped USB =
QMP PHY vdda-phy/vdda-pll supplies ---
commit a8da26c25bde26c79bbdbc3a2692464d3f213cfd
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: talos-evk: Fix swapped USB QMP PHY vdda-phy/vdda-pll supp=
lies

This commit corrects the swapped vdda-phy and vdda-pll supplies for the USB
QMP PHY on the QCS615 Talos EVK board. The patch ensures the vdda-pll supply
is fed 1.2V instead of 0.9V.

> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boo=
t/dts/qcom/talos-evk-som.dtsi
> index 294354c034c37..6469c6fa9f634 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> @@ -589,8 +589,8 @@ &usb_qmpphy {
>  };
> =20
>  &usb_qmpphy_2 {
> -	vdda-phy-supply =3D <&vreg_l11a>;
> -	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-phy-supply =3D <&vreg_l5a>;
> +	vdda-pll-supply =3D <&vreg_l11a>;

[Severity: High]
This isn't a bug introduced by this patch, but does this provide an
incomplete fix that leaves several other QMP PHYs incorrectly configured?

The commit message states that the QMP PHY expects the vdda-pll supply to
be 1.2V, and this patch updates usb_qmpphy_2 to use vreg_l11a (1.23V - 1.26=
V).

However, looking just above this block in talos-evk-som.dtsi, usb_qmpphy
still uses vreg_l12a (which is configured for 1.8V):

&usb_qmpphy {
        vdda-phy-supply =3D <&vreg_l5a>;
        vdda-pll-supply =3D <&vreg_l12a>;

Similarly, ufs_mem_phy and pcie_phy also continue to use vreg_l12a for their
vdda-pll-supply.

Additionally, the sibling reference board qcs615-ride.dts leaves both
usb_qmpphy and usb_qmpphy_2 configured with vreg_l12a (1.8V).

Since supplying 1.8V to a PLL expecting 1.2V could expose the PHYs to a
significant overvoltage, or alternatively undervolt usb_qmpphy_2 if the SoC
natively requires 1.8V, should the remaining PHYs and sibling boards
be updated to the correct voltage as well?

> =20
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D28
