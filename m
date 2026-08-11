Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656E242BC56
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485998; cv=none; b=fNvN1MERRChSroT5xhLm3/xJgkrT+yDtrX3RiaZ2tnBopHJVjuECIaHvNjJ/KQrbC04QH06OJVkirREtslUNC5rd+E2Jr9oSal5Hfq96wwQDgPCjFmW/gkwfhjOUpx7qggoWpGc7YXifqcbcIMxLTSvqBY7LH/3371DTuvAixUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485998; c=relaxed/simple;
	bh=K7wOSoJvuJpLB5ScizzIuYm1lxCsnf33ZQXBJvCIL40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SxtDnAoZhkf68wRYRdSB9v8ji8VCMi7EPryd1rdtONVwBYDkO6OrgsQXabiUiq/z1p92MO9b4EI1cLXCVc6zbbet+vFKlnu4txbYQOds+Nmk9mynCSGNuZ3XCtH3TyBWgDsX//o0UghMs1iTlKtaDBAjBH/LrimJ5ID2H4DGA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/TXRqq8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/TXRqq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84751F000E9;
	Tue, 11 Aug 2026 22:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485997;
	bh=16BhzpxugMeQi3bNHBMaelKZMv43Swjh6xnGiH0Ny0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/TXRqq8tL8jfgY+AoQqG8tuj4W7+xSdKQbb8let3qoROE8nLsRfAWrRVDtWXjIYb
	 cccXs46F/VPsIq3khM14vtydAO+2RM9Do/wHud2b+wlQkKOWWYrAu8umcZDrkrgwBP
	 FU7rGWh/yvmDI2E8I0zzBYOUSs9cnygi17gNINERBef4gbmmKBoesJfnL8ODZmFXUQ
	 sZCdvMksB22AJjrHSHot5mc9pL+1IEOPVdhjv+47T4Qo2mSQ8RbAj412Rg5okW14Y4
	 5/cbwaNSPwv4nabAwQsho5dcIutXnZUfO/oXA+DGqFl1xCNrTV8abqO2zRxEsxFU7h
	 RSDM4iqHNzM+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] arm64: dts: qcom: Map USB connector to EUD on
 Kodiak boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260811213610.2956147-10-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-10-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 22:06:36 +0000
Message-Id: <20260811220636.B84751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Rerouting the Type-C High-Speed endpoint to EUD breaks USB enumera=
tion and role-switching because the required `eud` and `usb_2` nodes are le=
ft disabled.
- [Low] The patch references an undefined devicetree label `&eud_con`, whic=
h will cause a fatal `dtc` compilation error.
--

--- Patch [9]: [PATCH v6 9/9] arm64: dts: qcom: Map USB connector to EUD on=
 Kodiak boards ---
commit 2fda8aaa91eca6e348e83f602c927ebd7362e954
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

arm64: dts: qcom: map USB connector endpoint to EUD on Kodiak boards

This commit updates board-level descriptions for Kodiak-based boards to map
the primary USB connector's High-Speed path through the Embedded USB Debugg=
er
(EUD). It replaces the existing remote-endpoint mapping to usb_1_dwc3_hs wi=
th
eud_con to reflect the intended hardware topology.

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index f41ad446a39e..b1f1ff6b99e6 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -98,7 +98,7 @@ port@0 {
>  					reg =3D <0>;
> =20
>  					pmic_glink_hs_in: endpoint {
> -						remote-endpoint =3D <&usb_1_dwc3_hs>;
> +						remote-endpoint =3D <&eud_con>;
>  					};
>  				};
> =20

[Severity: Low]
Will this compile cleanly? In the baseline kodiak.dtsi, the eud node
defines port@0, but it doesn't appear to define the eud_con label:

arch/arm64/boot/dts/qcom/kodiak.dtsi:
eud: eud@88e0000 {
    ...
    port@0 {
        eud_ep: endpoint {
            ...

Does the eud_con label need to be added to the SoC dtsi first to avoid a
device tree compiler syntax error?

[ ... ]

> @@ -1573,3 +1569,7 @@ &wifi {
>  	qcom,calibration-variant =3D "Fairphone_5";
>  	status =3D "okay";
>  };
> +
> +&eud_con {
> +	remote-endpoint =3D <&pmic_glink_hs_in>;
> +};

[Severity: High]
Does routing this connector through the EUD strand the primary USB controll=
er
without a role switch provider?

The usb_1 node in this file is configured for usb-role-switch, but it is
severed from its High-Speed endpoint by this patch.

Additionally, in kodiak.dtsi, both the eud node and the secondary usb_2
controller it relies on have their status disabled by default:

arch/arm64/boot/dts/qcom/kodiak.dtsi:
eud: eud@88e0000 {
    ...
    status =3D "disabled";
...
usb_2: usb@a6f8800 {
    ...
    status =3D "disabled";

Since the board files don't override these to "okay", will this prevent the
graph traversal via fwnode_usb_role_switch_get() and break USB enumeration
entirely upon boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D9
