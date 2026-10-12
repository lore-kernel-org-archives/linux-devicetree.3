Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CA439F8A
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790455; cv=none; b=b70OZTuEDjiiCVtcQ83njXjiPSzjsZTTKYwdpv8G+/IQ1zE4AeDfHOqiLc0YPggMie180S81SI5mY8g58+CowBexVgCT1S1y63rgVW452bHDmu0kzuRXdMlWZsOsrTl4duAAtpHuXHO1y74/1y3TtB9xjZpwQDeHuGecyw0XaeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790455; c=relaxed/simple;
	bh=QTj0uC4Iz2AyAw84MAiU4eXhGePaGxXc9Nt53CPh5no=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AbOjmJimtqmS+8yFciQoYpkTVv0RZ0nxCTN/sQo9vFxVnWSZwOOfzxUj7S0pe0gQ1pi4Rv1nlpAWHAqJ7qHDFXEPCt4yYA+tZOLvCbxmgkKNetGKJjYAK3+AYRTyFPdCAA4TFqbr+m6wSZHQ2/H4O350jYOBCMmf/zCe63LxFbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTotG80G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTotG80G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32011F0089B;
	Mon, 12 Oct 2026 07:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791790453;
	bh=uzyd3hyMxUG+o++sJK5fbk/m5aNFRMNtqaY4p1txL7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CTotG80GMcrAWf643XUQRdenuQCJpJEEcGaaj92E/ZkMe7YR1r99XEUHw9yfPKLwx
	 x1T37AouMU5cAN2IQ0WFp4T5LI39Bn8BA5trtiRjKLm+AMxfZauMNfDPu0Nkp09Z7r
	 GK2OxWOEWd+ADUHuWw+ovyjbiE7Nyjyki+qu557sW3hk7WwfWka5CaLtUeAAD4B+ps
	 3XyO/SHNr6vmnbsIFSCKryyiv5u6n+brTyfMrknKL2XVnH1bMydOcmqxDuYu5ZxNO/
	 zOcyJHjQJSsT+wd5+DVAIY3fl8+aXedGjrgZRFATAI1SQoj8hCPJEpRcqXTQeoPRjB
	 6pMbwKha5/jfw==
Message-ID: <sashiko-outbox-167802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/11] arm64: dts: qcom: ipq5210: Add nodes for
 multiple peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012-08-dts-v7-1-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-1-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:34:12 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt: qcom: ipq5210: missing USB3 PHY pipe clock link in gcc node
- [Medium] dt: qcom: ipq5210: missing cooling-maps for cpu1-thermal passive=
 trip
- [Low] dt: qcom: ipq5210: comment and code mismatch regarding CPU thermal =
throttling limits
--

commit e1cb08a769aa7e73265d212c8410f86f91d91e54
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals

This commit adds common IPQ5210 SoC peripherals to the base DTSI, including
USB, PCIe, QPIC, TSENS, and thermal zones. It also describes the CPU OPP
table and CPU cooling cells.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 20e8b240642c6..0c03295f61b07 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
[ ... ]
> @@ -146,8 +359,8 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x0 0x01800000 0x0 0x40000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <0>,
>  				 <0>;

[Severity: Medium]
Should the fifth entry in this clocks array be linked to the USB3 PHY pipe=
=20
clock (e.g., <&ssphy_0>)?=20

The qcom,ipq5210-gcc binding defines the fifth clock entry as the USB3 PHY=
=20
pipe clock source. Leaving it as <0> instead of linking to the newly added=
=20
ssphy_0 node might result in a broken clock topology, potentially preventin=
g=20
the USB PHY and controller from initializing successfully.

[ ... ]
> +		cpu0-thermal {
> +			thermal-sensors =3D <&tsens 14>;
[ ... ]
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&cpu0_thermal_alert>;
> +					/* Set maximum frequency as 816 MHz */
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,

[Severity: Low]
Is the comment accurate regarding the maximum frequency limit?=20

The cooling-device property uses THERMAL_NO_LIMIT for both limits, which=20
allows the full range of available cooling states instead of enforcing a=20
strict 816 MHz hard-cap. If a strict cap was intended, should these limits=
=20
be updated to reflect the specific restricted cooling state?

> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		cpu1-thermal {
> +			thermal-sensors =3D <&tsens 15>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature =3D <115000>;
> +					hysteresis =3D <9000>;
> +					type =3D "critical";
> +				};
> +
> +				cpu-passive {
> +					temperature =3D <100000>;
> +					hysteresis =3D <9000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};

[Severity: Medium]
Does cpu1-thermal need a cooling-maps array for the passive trip point?

The cpu1-thermal zone defines a cpu-passive trip at 100000 mC but omits the=
=20
cooling-maps block needed to bind cooling devices to it. In the Linux=20
thermal framework, a passive trip point without associated cooling-maps=20
takes no active mitigation (such as CPU frequency throttling). As a result,=
=20
the system may take no action to prevent continued heating until it hits=20
the critical shutdown threshold.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-08-dts-v7-=
0-77bd3d68d850@oss.qualcomm.com?part=3D1
