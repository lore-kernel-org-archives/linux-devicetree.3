Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CAC363090
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584217; cv=none; b=kGI7CNK4/8+kzZ1SB8p6miTS9LVDDaG8YXWZhXml0vieo/9cg3rAmWiAKOSPeHicT20WsQ0H9pCRm1Cdxcli7XQ/KzKh6fnGNe86Q7QvINcnXiVvIgusQ2j79WYfTGZvuWWvv3ojdrZxp4cvpTRRN1ZA17a0LDcPcZ7ai0up7gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584217; c=relaxed/simple;
	bh=9DoiwYk2pGJN9MxYVBRD2SwvlFIPnY+XytZhJ9iNxTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ygyq0yyNIVHOvlNDS3iMZPnxBPRUl/sU/ns7au2Zh01OelRHcGhzdDD1WmqnxaR4AqB6oghI08QL93FAghnlxVjI7uAisMv10j0yQUjgmajaD7Ke+Uv1raoY6Wvxam1GthrmsMaWYDuoVjztrgX+by8bizPCwF3A/bBjsFllkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+Hos983; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+Hos983"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12DC1F000E9;
	Mon, 24 Aug 2026 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787584216;
	bh=WxilYGOLSdhhAa1kxPIVPWG00BpmpC07RmcOS0Rx3Yk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+Hos983MNfJQlFfPld/kRMIXl92Swu0bYDOpx+5G+1yv/LupIBzYjwXL0kFssfdA
	 sv5AAjrQbcs4Q4lEC7Ycy4nQ0Wrm1Vfc3iwF6AfUpmXS071MhJr1/UMS3b/kd13WNV
	 XmBS2SwKqzxqwBioPta+bZXqL6x6LMqcGG7/8dGQZLpit85Pu1PrIpqyAIphU7HSVd
	 CVPQq7429skDAbMk4Ge6JlQvca15mSEy5MpDykx8pVWxWHXNU/zjA43wa73hUJPt1a
	 dIcL0Kc9bbv3NIur0ZO7YZoXRHj+MjLtyThOpkB2k0gALelMaG57hx7m+rW6fTRDie
	 VsswysemwfIxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raj Aryan" <raj.aryan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 15:10:15 +0000
Message-Id: <20260824151015.C12DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `polling-delay` property in thermal zones prevents them fr=
om being polled, rendering thermal mitigation non-functional.
- [Low] The patch references a device tree label `pm4125_adc` that appears =
undefined, which will cause a fatal `dtc` compilation error.
--

--- Patch [1]: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatt=
i QRB2210-RB1 platform ---
commit 01dca3a5fb92132d1ae40d936842a155e5f13716
Author: Raj Aryan <raj.aryan@oss.qualcomm.com>

arm64: dts: qcom: Add PMIC thermal support for Agatti QRB2210-RB1 platform
   =20
Add ADC channels for msm, quiet and xo thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/d=
ts/qcom/qrb2210-rb1.dts
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts

[ ... ]

> @@ -33,6 +34,68 @@ clk40m: can-clk {
>  		};
>  	};
> =20
> +	msm_therm_bridge: msm-therm-bridge {
> +		compatible =3D "generic-adc-thermal";
> +		io-channels =3D <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;

[Severity: Low]
Is the pm4125_adc label defined in any of the included files?

If not, will this cause a dtc compilation error due to an undefined phandle?

> +		io-channel-names =3D "sensor-channel";
> +		#thermal-sensor-cells =3D <0>;
> +	};

[ ... ]

> +	thermal-zones {
> +		sys-1-thermal {
> +			polling-delay-passive =3D <2000>;

[Severity: High]
Does this thermal zone also need a polling-delay property?

If polling-delay is omitted, it defaults to 0. Since there are only hot tri=
ps
defined, the zone will never enter passive cooling mode and therefore might
never be polled by the thermal core, rendering mitigation non-functional.

This missing property appears in sys-1-thermal, sys-2-thermal, and
sys-3-thermal.

> +			thermal-sensors =3D <&msm_therm_bridge>;

[ ... ]

> @@ -333,6 +396,34 @@ vreg_l7p: ldo7 {
>  	};
>  };
> =20
> +&pm4125_adc {

[Severity: Low]
Similar to the io-channels property above, will extending this pm4125_adc
label cause a build failure if it isn't defined?

> +	status =3D "okay";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-pm4125-adc=
-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com?part=3D1
