Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E52B3947B5
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784267131; cv=none; b=sE9KChR4q482wnERMjfQFeUZ5Sd83iO5gsIzxciwTNFiogEvSDKBTntoVIhbevtgHpvoHEWk/QjCHCBl4QSAI5+i/4xNShfpuAw3F0bDN7ogizlguf3Au+HQw1w8ZvrUWEbcKLF+7nZRkp7LjR+Su3U+U5PQfy7YoU3ryrEuiMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784267131; c=relaxed/simple;
	bh=7sfisOMm97INvX+ukBwKQTQdciNNqOUojAuK9UDuwKA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AM5pAHTxsV4yBjgXYMwkNGPJf+chKwpmlcozf7/Se80wGEnrKHBd+jV5dwzrxWh6jQmMohqD7ELFQ3SFfKfPT6Uw28MirERKRCm3skdVuawsmi+v+nkPZupuNy0sSqa/sYFS6VgHMWMqswt2NYhjsFpOUT/0B4oh2eksJwEbjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Us9DcokF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Us9DcokF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0521F000E9;
	Fri, 17 Jul 2026 05:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784267129;
	bh=7yA9koE+jNSYCiTdBQNy3ll15+2wyICRLVe0ZGX473g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Us9DcokFWGneiGtU0Wh/GKcCVI4c31tYrIRJti0BdL1elXalPkfp27Vdel25x0aV7
	 PmCX+Z7DWsy0JpM5lVOcksy76olAbdStAdgr7u45qczt8vGNh/3p1aQrvBj3T1wQDz
	 acj+ljxjXdEMtDFPQpAxxTL5fLrkMhDTrAPgi/SaYIBTd4+v3TO4M+ZHWdgRiMNSk9
	 YMDU5Y1UiF8xotaf4FG8veGXclq/pgLVnyGc/dEESca6Y6eJ8PCJOVk6jAd0agReKM
	 Fpz0JtEEjRUNkQsPKbyA809pSiNqSdurTh+m5BNgoN2VO4KUAKYO7ACoWggPRviBLq
	 dleU+hRM9NMWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: add vph_pwr and fix
 supply parent mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rakesh Kota" <rakesh.kota@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-pm2250-fix-supply-parent-v1-3-a6213a42a3b5@oss.qualcomm.com>
References: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
 <20260717-pm2250-fix-supply-parent-v1-3-a6213a42a3b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:45:28 +0000
Message-Id: <20260717054529.9E0521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Physically impossible hardware topology: 1.8V LDOs are configured =
to be supplied by a 1.396V source.
- [Medium] Missing parent supply properties for the s1 and s2 buck converte=
rs in the PM4125 regulator node.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: qcom: shikra: add vph_pwr and fix su=
pply parent mappings ---
commit 64d116ee25fe416f23ec9e23adfecfac498cc60e
Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

arm64: dts: qcom: shikra: add vph_pwr and fix supply parent mappings

This commit adds a fixed vph_pwr regulator to represent the PM4125 charger
output. It also configures the per-group supply properties for the regulato=
rs
and adds the s1 and s4 nodes.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> index dc3861489f64d..6e4c23a730fb6 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
[ ... ]
> @@ -52,12 +62,33 @@ &pm8005_regulators {
>  &rpm_requests {
>  	regulators {
>  		compatible =3D "qcom,rpm-pm2250-regulators";
> +		vdd_s4-supply =3D <&vph_pwr>;
> +		vdd_l1-supply =3D  <&pm4125_s4>;

[Severity: Medium]
Are the parent supply properties for the s1 and s2 buck converters intentio=
nally
omitted here?

Leaving out vdd_s1-supply and vdd_s2-supply prevents the regulator core from
resolving the full supply chain, which could lead to power management
dependencies failing if the parent supply is turned off while s1 or s2 are
active.

> +		vdd_l2_l3-supply =3D  <&pm4125_s4>;
> +		vdd_l5_l6_l7_l11_l12-supply =3D  <&pm4125_s4>;
> +		vdd_l8_l9-supply =3D  <&pm4125_s4>;
> +		vdd_l10-supply =3D  <&pm4125_s4>;
> +		vdd_l13_l14-supply =3D  <&pm4125_s1>;
> +		vdd_l15_l16-supply =3D  <&pm4125_s1>;

[Severity: High]
Is it possible to supply 1.8V LDOs from a 1.396V source?

The s1 regulator is configured with a 1.396V output later in this patch:

> +		pm4125_s1: s1 {
> +			regulator-min-microvolt =3D <1396000>;
> +			regulator-max-microvolt =3D <1396000>;
> +		};

But l13 through l16 are defined elsewhere in the file as requiring 1.8V:

arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi:regulators {
        pm4125_l13: l13 {
                regulator-min-microvolt =3D <1800000>;
                regulator-max-microvolt =3D <1800000>;
        };

Since a Low-Dropout Regulator (LDO) can only step down voltage, it seems li=
ke
supplying these LDOs from pm4125_s1 will prevent them from reaching their
target output voltage and cause hardware malfunction.

> +		vdd_l17_l22-supply =3D <&vph_pwr>;
> +		vdd_l18_l19-supply =3D <&vph_pwr>;
> +		vdd_l4_l20_l21-supply =3D <&vph_pwr>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-pm2250-fix=
-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com?part=3D3
