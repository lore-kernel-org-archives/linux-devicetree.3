Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF6C44102F
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230990; cv=none; b=XNuiwq9mvwcHtT8JDfWgJ5EwKCVyuODbDNoJtiMavUahy6FOaWPkSBEgi70GXB0Hsheqa6NJ8T3NuNVcF9IpzybKGA4GPrBuCu19v++ZgRI8B/B58ifAHf/MgFIryfW6q/lFqLIoFvzpOpJapBqpOl8E+qbNLxXz50iTfO2r+DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230990; c=relaxed/simple;
	bh=7dtVvv1BP9qeZvMG1K7MpsUr6m2ZNXSyJWW4V2d8OtU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JaVof60dAOyPYUaiYBQeTNoSbODnc0kNl9AJNHa5jWMXSn3m9b/F5LbDjydhbEg688mdeuwilB080i8urQlr96sGLk6uCiblIlVGRbj3JINkBs0xYG9tPfPPgdp519Q2bqQsofkTsLGbPc1dwd7jgDixgWeimHd3XZyWkVGOXOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/Mi3XdI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/Mi3XdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61FA1F000E9;
	Thu, 20 Aug 2026 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787230989;
	bh=6AaUEAbYUJW6QFOhmqJDWOOCO/q35lCEGrUr5t8po34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/Mi3XdInpcfyQoZkAOlOajXI0xKY4K6crIHmS2lDQJKLwFqLG5dJzlol8ZvtznAZ
	 z7veqvAGlhNJNsxZ0fsm6g358u1dxRhUfNoFcRtxlyVimVyXifIoAmgR1aHbwqSdL/
	 zcLQa38cbKAF1l+H3Myy5agn+1ymPuI/dCWLDLyR6/94L10RNBSxLnx4o9XUzvT5TG
	 jzUUkOUDIXc6zo4eLB0PnnrDoK8pZCXTmoOibBDW1gs8fU9ksK7sLp5QVotdiVgAn4
	 jxvhQKrspIkDEsdwkn3wrIzCv6tE/90ZzNPIABEKpLKZEZvvj6M475Ohb4lK/t0scL
	 Hw6AFKEDnOohA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Flatten the USB node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
References: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:03:08 +0000
Message-Id: <20260820130308.B61FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `dr_mode` and `maximum-speed` properties in the flattened =
USB node
--

--- Patch [1]: [PATCH] arm64: dts: qcom: agatti: Flatten the USB node ---
commit 0427bd1800c10434e0638f89470c4f8172cd92b9
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: agatti: Flatten the USB node

This commit updates the USB controller node in the agatti device tree
by flattening it to use the latest bindings and flattened driver approach.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85b..e7fed60a59d93 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
[ ... ]
> @@ -1606,48 +1610,42 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
[ ... ]
> -			usb_dwc3: usb@4e00000 {
> -				compatible =3D "snps,dwc3";
> -				reg =3D <0x0 0x04e00000 0x0 0xcd00>;
> -				interrupts =3D <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
> -				phys =3D <&usb_hsphy>, <&usb_qmpphy>;
> -				phy-names =3D "usb2-phy", "usb3-phy";
> -				iommus =3D <&apps_smmu 0x120 0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_enblslpm_quirk;
> -				snps,has-lpm-erratum;
> -				snps,hird-threshold =3D /bits/ 8 <0x10>;
> -				snps,usb3_lpm_capable;
> -				snps,parkmode-disable-ss-quirk;
> -				maximum-speed =3D "super-speed";
> -				dr_mode =3D "otg";
> -				usb-role-switch;
> +			snps,hird-threshold =3D /bits/ 8 <0x10>;
> +			snps,parkmode-disable-ss-quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,has-lpm-erratum;
> +			snps,usb3_lpm_capable;
> =20
> +			usb-role-switch;
> +			wakeup-source;
> =20
> +			status =3D "disabled";

[Severity: High]
Were the maximum-speed and dr_mode properties intentionally dropped when
flattening this node?

The previous usb_dwc3 child node defined dr_mode =3D "otg" and=20
maximum-speed =3D "super-speed", but they appear to be missing from the
newly flattened usb: usb@4e00000 node.=20

Could dropping dr_mode cause the USB controller to fail to initialize
role-switching properly and break OTG functionality on boards utilizing
this SoC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-topic-agat=
ti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com?part=3D1
