Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197970;
	b=hR/IWx9oSOQ0IBQjKzrMiFrwW81Mt7asUyTjRl83Daj3QQObm2FWAxG/kgIWEX1grtsx
	 vyNfp1NFdWR91CKDgN3PjR3n4SmPcA25l8DSEqyMPGu5rBFIYeu1lNgQ7rJl9EFMDQFb4
	 TIDCB58bShhkZoMDe5uTGFCk4UiUp4tegkwkvq237Rg+Z8dYrbExj1Oiuih66ynLLkRkh
	 7IhNiProgs2B6skqvkMYVSvnTONcLypSptxYemsVnj2ssD15EOK69sNtVu5o5qrU9tuMT
	 6U+MvRFEVvik2Sl8T7cPzWTCgyQSZWv/K1h0LEsdozJGwocONQqSNXo7uNe5ZK5DGPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197970;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fed8MkOo/AUMYHL7M9hA3h9amz5BiCcPGnkNDv0PGkY=;
	b=g3r/1B6aAkYdaKuAyIDdayAzhYSBTd+RD7z8zRv4Aeo+0jAhozQNytESPJyqba9vgDfm
	 sD22CYrE/u17eOU0KMavJYYPFjzAi2SpX+tK7rTM7TsPnDsno6nQfng3n3EMlg9qb1777
	 RgoL21xFrZ80fj/04O+MaTwDElpI22pzVB2VvIPG2jXYTisO7VbgqLfiAedSTUD+WGduM
	 sR9+o4k5J3wz7U1nXAT8cW6PMeHyahDmDbrlT3LJe+7+k1TSzwxt1RkBzMmp8g8f+qwSm
	 zWKoAMxUhmkl4vJYMZLuAyvUAOScw8lkvQnci1VIMfHiv2e6L5X0AQ9ABdF56dI12jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPv8Efms;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C98606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPv8Efms
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4D41F01825;
	Wed, 28 Oct 2026 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793197970;
	bh=Fed8MkOo/AUMYHL7M9hA3h9amz5BiCcPGnkNDv0PGkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YPv8Efmsay/H4PSDX7pE5jyN0r4YTQj1+KguLOVRPsM5v+LaH9G4eW5oHWHJMZ86X
	 P7Lns8Dl93OGkOY8G8glHV9dmP1E7UgsUSfKS7TyrSgrgoNFr3kiEW+9P29QAJtJfs
	 uoqJB05kDunVKN/QdVZPBpN82wxuPAzdVo24eBHVP1wjMqiH6QiS8RN9nRG03rAw54
	 O2iZ1SQ3UiVHLrojOMgpRvRlhWw7WJNhO0FoaaGafWwG31khZAFa4l7dtKabepnG3K
	 VgWjlQZsGSRw74JBQSMws/ihWqCv/tgfqXZj/GfyLjexqworpocXWPzbdL2qAEHVj2
	 0zvm1EDt3hDPA==
Message-ID: <sashiko-outbox-187990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
References: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 14:32:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: monaco-monza-som: qcom,adc-tm channels lack th=
ermal zones
- [Low] arm64: dts: qcom: wrong PMIC prefix in pmm8650au_1_adc SDRAM therm =
label
--

commit 561733e4e2720685d27dd79350db7cc51662ba15
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: monaco-monza-som: Add ADC thermal channels

This commit adds ADC5 GEN3 thermistor channels to the pmm8620au_0_adc and
pmm8650au_1_adc nodes in monaco-monza-som.dtsi for thermal monitoring on
the Monaco Monza SoM.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/=
boot/dts/qcom/monaco-monza-som.dtsi
> index 36af1ad2105d5..dc2ef7e5b0613 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> @@ -227,6 +227,46 @@ &pcie1_phy {
>  	status =3D "okay";
>  };
> =20
> +&pmm8620au_0_adc {
> +	channel@44 {
> +		reg =3D <ADC5_GEN3_AMUX1_THM_100K_PU(0)>;
> +		label =3D "pmm8620au_0_xo_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,adc-tm;
> +	};
> +
> +	channel@48 {
> +		reg =3D <ADC5_GEN3_AMUX5_THM_100K_PU(0)>;
> +		label =3D "pmm8620au_0_ufs_emmc_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,adc-tm;
> +	};
> +
> +	channel@49 {
> +		reg =3D <ADC5_GEN3_AMUX6_THM_100K_PU(0)>;
> +		label =3D "pmm8620au_0_soc_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,adc-tm;
> +	};
> +};
> +
> +&pmm8650au_1_adc {
> +	channel@249 {
> +		reg =3D <ADC5_GEN3_AMUX6_THM_100K_PU(2)>;
> +		label =3D "pmm8620au_1_sdram_therm";

[Severity: Low]
Should this label be "pmm8650au_1_sdram_therm" instead of
"pmm8620au_1_sdram_therm" to match the parent &pmm8650au_1_adc node and the
existing channels in arch/arm64/boot/dts/qcom/monaco-pmics.dtsi ("pmm8650au=
_1_die_temp"
and "pmm8650au_1_vph_pwr")?

> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,adc-tm;
> +	};
> +};

[Severity: Medium]
All four channels set qcom,adc-tm, which causes adc5_gen3_probe() ->
adc5_gen3_get_fw_channel_data() -> adc5_gen3_add_aux_tm_device() in
drivers/iio/adc/qcom-spmi-adc5-gen3.c to instantiate the
qcom_spmi_adc5_gen3.adc5_tm_gen3 auxiliary devices and register
adctm5_gen3_isr() on SDAM0.

When adc_tm5_probe() -> adc_tm5_register_tzd() in
drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c runs:

	for (int i =3D 0; i < adc_tm5->nchannels; i++) {
		channel =3D ADC5_GEN3_V_CHAN(adc_tm5->chan_props[i].common_props);
		tzd =3D devm_thermal_of_zone_register(adc_tm5->dev, channel,
						    &adc_tm5->chan_props[i],
						    &adc_tm_ops);

devm_thermal_of_zone_register() calls of_thermal_zone_find() in
drivers/thermal/thermal_of.c:

		count =3D of_count_phandle_with_args(child, "thermal-sensors",
						   "#thermal-sensor-cells");
		if (count <=3D 0) {
			pr_err("%pOFP: missing thermal sensor\n", child);
			return ERR_PTR(-EINVAL);
		}

However, neither pmm8620au_0_adc nor pmm8650au_1_adc in
arch/arm64/boot/dts/qcom/monaco-pmics.dtsi or
arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi defines
#thermal-sensor-cells =3D <1>, and no thermal-zones entries reference these
ADC channels. As a result, devm_thermal_of_zone_register() returns -ENODEV
for all four channels (or -EINVAL if a downstream board references the ADC
nodes in thermal-sensors without #thermal-sensor-cells), leaving hardware
threshold monitoring unconfigured while still running adctm5_gen3_isr() on
SDAM0 interrupts.

Should pmm8620au_0_adc and pmm8650au_1_adc define #thermal-sensor-cells =3D=
 <1>
along with corresponding thermal-zones entries, or should qcom,adc-tm be
omitted until thermal zones are wired up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-monza-ther=
m-v1-1-dfe4759c15bd@oss.qualcomm.com?part=3D1
