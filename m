Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710F4A207C
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145502; cv=none; b=JYxy7snOB6MEuT226ie8u9P4TLAFp8HWx1QgM7sHakXIs8Ij0gOl5hwDc41vBHN2+jcm2sb4weNyfr1wiqMFNiTxTEuLVfHdGWvyZqANMLT8i6N7pXFPyI+b8OKLcgy4F9D6dOgBVAaavJZhx4Z1Zdbt3o1WnChuKE62rOb74ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145502; c=relaxed/simple;
	bh=3NQ3r0690h3s92nM4LbFG/BmrNbdAb++dyILKtxakDA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZSMyfsk5d1+Mtl+2HE8EqD7uU68DcDDw8MCiJ0ov2aIZywnMEVECW7+Ge32k/EKSqvaJEmQGJCKHQ3xNJZViV4/rcNAgtd/VukQQstNkCiVBDm3JWNnT7Z0MXXexX0p7JhLnJRI3d7uo45YUOngktxuBQsKtcFPKimYHMsnHxUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGsiBUeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGsiBUeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63671F00893;
	Fri, 11 Sep 2026 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789145500;
	bh=QJstd6PCAmvM9R16T8S337iHh0kIJtUvf0wFZxdYDxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LGsiBUeAebHVifTtzUXCznykSil+SJ2nEE66G9B3QEY7r9XgNuNvWjeNeWW17z7Rf
	 YYnZ0dHuE6HYGyqw3D9UjbZBVElXz0150jCKnkGBDLW/8hMvFe+V6ESL42tVSUErr/
	 yytsbUsFrOAGfB37laBkZgjiHk3uJLRMZPdY3e3NdwA4IaPTF74B1sKAWHv2BUb5IO
	 tJUDnMJZzUIszcUf02FfzrNssu9lrr9jIXMDNsirsQZ8usWT+fruO3sqcKCHKltgMW
	 0d7BHVMqqRKv16SkZBJBBKT9PZ0YBxw5uhEX+4XtYQcdyro+RZvM3lqZIbMTH2ztyk
	 cBNM+7LP1nlfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-shikra_adc_support-v6-2-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-2-e4b2da5cd55c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 16:51:39 +0000
Message-Id: <20260911165139.A63671F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The critical trip temperature of 145000 mC exceeds the hardware's =
maximum Stage 2 shutdown threshold, causing a premature hard-power cut that=
 bypasses OS software shutdown.
--

commit 88b914c28016cf188fecbd155d9b9942de82bce0
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: pm8005: Add temp alarm node
   =20
This commit adds a temperature alarm node along with a thermal zone used
for PMIC thermal mitigation on the PM8005.
   =20
> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/q=
com/pm8005.dtsi
> index 0f0ab2da83055..ce31a85450200 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
[ ... ]
> +				pm8005_trip1: trip1 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <0>;
> +					type =3D "hot";
> +				};
> +
> +				pm8005_trip2: trip2 {
> +					temperature =3D <145000>;
> +					hysteresis =3D <0>;
> +					type =3D "critical";
> +				};

[Severity: High]
Does setting this temperature to 145000 mC exceed the hardware's maximum
Stage 2 shutdown threshold (typically 125000 mC or 140000 mC depending on t=
he
generation)?

If this threshold is physically unattainable by the hardware without an ADC,
could this force an early, ungraceful hardware power cut before the OS is
able to reach the thermal framework's graceful shutdown procedure?

[ ... ]
>  &spmi_bus {
>  	pm8005_lsid0: pmic@4 {
>  		compatible =3D "qcom,pm8005", "qcom,spmi-pmic";
> @@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> +		pm8005_tz: temp-alarm@2400 {
> +			compatible =3D "qcom,spmi-temp-alarm";
> +			reg =3D <0x2400>;
> +			interrupts =3D <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells =3D <0>;
> +		};

[Severity: High]
Because there is no io-channels property defined here, it looks like the
qcom-spmi-temp-alarm driver will have to rely on the PMIC's internal hardwa=
re
comparators instead of an ADC.

When the driver attempts to configure the 145000 mC critical trip point from
above, will it find that it exceeds the hardware's maximum threshold, cap it
at the hardware maximum, and leave SHUTDOWN_CTRL1_OVERRIDE_STAGE2 disabled?

If so, would the PMIC abruptly power off when the temperature reaches the
lower Stage 2 hardware threshold? This bypasses the OS thermal framework's
graceful shutdown and can potentially lead to filesystem corruption on
overheating. Should an io-channels property be provided here to properly
delegate the critical trip to software?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-shikra_adc=
_support-v6-0-e4b2da5cd55c@oss.qualcomm.com?part=3D2
