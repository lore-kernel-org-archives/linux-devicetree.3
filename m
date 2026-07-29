Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2543314B7
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785346414; cv=none; b=Hxefk3GdH3ZbEavewWF/8uCUDZbBNaL5fvrdnSDOeqmeUKMM6thVBN4mqcR+MXG37KDwbIOb6tpDPTuFW943Riygpy4G5mPRD48vC+gsS96Za3XXS3/2MDYWF7l2w9+TLrPFBhvJr2SfKa8Fb+VsqE+XRkpFnJzQwuq/XWxJRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785346414; c=relaxed/simple;
	bh=sOzyr9TdpNzPnhUyxJ4nL2wtHcV1sz20mAMT9b4pA7A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cZq2eZ4KesqYCxGx5AmtyTk6HGniaTpAA3xeU7Ulqy0A5XrtLp8W4Nuk7WXaGqHdKjeSiuYaVRTEntMpjUTGSYhrj2DUcXEZNrARJZ+z8CVY5P2nI2Uh3N1TexPRPNGJlJEvHLjIUnrL6LbIyTQPawuONdRw9fVCmDZyI1wvH3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBeTW+Ec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBeTW+Ec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D661F000E9;
	Wed, 29 Jul 2026 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785346412;
	bh=uKAYgmYFnmOzlQEW7dCb+q2fOxHFlV0zf4pLNF2vHr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZBeTW+EcaMoWLOfiqHnMlJP89ci1DJzN4F8ApfQgiooxzpFOz7FSz7KOxL4dLtJjt
	 OKVLNEunAxYoOWdRkIR234wFI88DZC1CNrBpB2kRoWdVm3i6ykdwkDhWMJhGTF9/As
	 B6t0HIxfF3/pkkQ2AuX4P2zi35N8K8Q/4wT63aPVUpBnMi2T0Ps44tXXnrwXaz4hQK
	 XMaJqPA7l0GnInNBGvpp/IwicsYYFUYrKTe0IMlYJJGU6PFVdRd21onLGghU1pHYzi
	 /o15NGgC+MOPjB2z2MiSs9wUQXMBk5m/pNuMGjV23G4wZMh8+zsx0YK2uq2jlmt1bq
	 Kum3OR66sUFYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k3: add USB3 B and C
 controllers for Pico-ITX board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729172450.1660418-4-aurelien@aurel32.net>
References: <20260729172450.1660418-1-aurelien@aurel32.net>
 <20260729172450.1660418-4-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:33:31 +0000
Message-Id: <20260729173332.51D661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between the length of the `phys` and `phy-names` proper=
ties in the `usb3b` and `usb3c` device tree nodes.
--

--- Patch [3]: [PATCH v2 3/4] riscv: dts: spacemit: k3: add USB3 B and C co=
ntrollers for Pico-ITX board ---
commit 2aa9a6448bde1ee249cba54ddbed1021d4ace1cc
Author: Aurelien Jarno <aurelien@aurel32.net>

riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board

This commit adds the USB3 B and C controller nodes and their corresponding
USB2 and USB3 PHY nodes to the SpacemiT K3 SoC device tree. It also enables
them on the K3 Pico-ITX board in USB 2 mode.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index 0eb24fac4733e..b786f119d4f95 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
[ ... ]
> +		usb3b: usb@81400000 {
> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0x81400000 0x0 0x10000>;
[ ... ]
> +			resets =3D <&syscon_apmu RESET_APMU_USB3_B_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_B_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_B_PHY>;
> +			reset-names =3D "ahb", "vcc", "phy";
> +			phys =3D <&usb3b_u2phy>,
> +			       <&combophy 2 PHY_TYPE_USB3>;
> +			phy-names =3D "usb2-phy";

[Severity: Medium]
Does this mismatch between the array lengths of phys and phy-names cause
dtbs_check schema validation to fail? The phys property defines two items,
but phy-names only lists "usb2-phy", omitting "usb3-phy".

Without "usb3-phy" in the phy-names list, devm_phy_get(dev, "usb3-phy")
in the DWC3 core driver will fail. While the current Pico-ITX board limits
this controller to high-speed mode, does this omission bypass USB3 PHY
initialization and break SuperSpeed functionality for any future generic
boards using this SoC-level .dtsi?

> +			phy_type =3D "utmi";
[ ... ]
> +		usb3c: usb@81700000 {
> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0x81700000 0x0 0x10000>;
[ ... ]
> +			resets =3D <&syscon_apmu RESET_APMU_USB3_C_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_C_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_C_PHY>;
> +			reset-names =3D "ahb", "vcc", "phy";
> +			phys =3D <&usb3c_u2phy>,
> +			       <&combophy 3 PHY_TYPE_USB3>;
> +			phy-names =3D "usb2-phy";

[Severity: Medium]
Similarly here, does omitting "usb3-phy" from the phy-names array also
break USB3 PHY power-on and initialization for the usb3c controller on
future boards?

> +			phy_type =3D "utmi";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729172450.1660=
418-1-aurelien@aurel32.net?part=3D3
