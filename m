Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348D41685C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181964; cv=none; b=gyqCnlfrKDwbK5NAD2cjHxa4t+tGZridOhnfbeeYN1KlW5zfFmbKhVWxrJ8ABr66h59GxoeqatGba9HQZmTBCpG7jaBkAzPuMeA4O8zUXfwd8A7/XywQblfNn+scXe4IMScEHag1Uxo+mNhKiFiVvoPxYTw5ZVGoJ3FIdsSPN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181964; c=relaxed/simple;
	bh=YnNt3hYfCuBplK3zaSFI2gBLkQ9s/kQw6BQvz6stOxo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gGDhkXobkcCrERhf6mV5enfLFE1LFrdJIJ2PoobhDAvYOt/qXcmysegMABJLKfoOChiXsRdMKz8oC4IAk7mS5sRzP+ZH1IrIQAWraVJQuykO4yVoABsO0njj5NA25F3mrqX0EKRU2LPrmRbaASgFlGEnJ4zaSFVHqRvmSZWzlZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrzQ0+wU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrzQ0+wU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0991F000C4;
	Fri, 16 Oct 2026 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792181956;
	bh=8jUnJqWI53smBso1FSi+MFEpzTjF+gX0y1Z8ouA/mfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TrzQ0+wUV15CyXT1P2FKj+KmRir5FTI4acuzgAbio+lUXvSp3IvUyaXDwteocZmSj
	 W4x7fZZ51qdIk4hJu8Tk0cwFxTPmUi15JYfGigI+dXZQ7CvhcGyRHvAzoLlz1gAX7q
	 MLLrgQQKoAtmMXWPvYOgCsgU2pFjLqmLq2wlr/goGk3ftAyZItFpq5eWirQvGgi588
	 IjTtCuktQLwwcdWip/a4l9owddNbOWH92EnEqTxHMFIAxClQeunGAxHMi6uhAN2war
	 viWsKjTvFXf1aP0NodiifTwtl2SkWs+xvuGmkGxc9DIFKHt8i7a6WSsJbZzqpmYz1D
	 NO0G2tI7xjP2g==
Message-ID: <sashiko-outbox-174910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-nezha-v1-2-a39900dfaadd@mentallysanemainliners.org>
References: <20261016-nezha-v1-0-a39900dfaadd@mentallysanemainliners.org>
 <20261016-nezha-v1-2-a39900dfaadd@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 20:19:15 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: inconsistent xiaomi vendor casing in nezha fir=
mware-name
- [Low] arm64: dts: qcom: mismatched unit-address on pdp@81300000 reserved-=
memory node
- [Low] arm64: dts: qcom: unused ts_vdd_regulator and empty spi19 node enab=
led
--

commit b1cf4bc0135ad608aeddecedf111fee0057493b2
Author: Igor Belwon <igor.belwon@mentallysanemainliners.org>

arm64: dts: qcom: Add support for Xiaomi 17 Ultra phones

This commit adds device tree files for the Xiaomi 17 Ultra phones (China and
EEA variants), which are based on the Qualcomm Kaanapali SoC.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi =
b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi
> new file mode 100644
> index 0000000000000..fce2d9e0f8b2f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi
> @@ -0,0 +1,899 @@

[ ... ]

> +	reserved-memory {
> +		/*
> +		 * If we do not have this exact region with this exact name
> +		 * present, the bootloader disables the display panel and
> +		 * for some reason it cannot be re-enabled.
> +		 */
> +		splashmem: splash_region {
> +			reg =3D <0x0 0xfc800000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +
> +		/delete-node/ pdp@81300000;
> +		pdp_mem: pdp@81300000 {
> +			reg =3D <0x0 0x81200000 0x0 0x200000>;
> +			no-map;
> +		};

[Severity: Low]
Since pdp_mem moves the base address in reg to 0x81200000 after deleting
pdp@81300000, should the node name be updated to pdp@81200000 so the unit
address matches reg and avoids a dtc warning?

> +
> +		/delete-node/ adspslpi@a1400000;
> +		adspslpi_mem: adspslpi@a1400000 {
> +			reg =3D <0x0 0xa1400000 0x0 0x5580000>;
> +			no-map;
> +		};
> +	};
> +
> +	ts_vdd_regulator: regulator-tsvdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ts_vdd";
> +		regulator-min-microvolt =3D <3000000>;
> +		regulator-max-microvolt =3D <3000000>;
> +
> +		gpio =3D <&tlmm 215 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};

[ ... ]

> +&gpu {
> +	status =3D "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name =3D "qcom/kaanapali/xiaomi/nezha/gen80200_zap.mbn";
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +
> +	bq27z561: fuel-gauge@55 {
> +		compatible =3D "ti,bq27z561";
> +		reg =3D <0x55>;
> +		monitored-battery =3D <&battery>;
> +	};
> +};
> +
> +&spi19 {
> +	status =3D "okay";
> +
> +	/* Synaptics TCM touch screen */
> +};

[Severity: Low]
With the Synaptics TCM touch screen child node not yet populated in spi19,
should spi19 and ts_vdd_regulator be dropped or left disabled until the tou=
ch
screen node is added?

Currently spi19 probes an empty controller and ts_vdd_regulator registers an
unreferenced GPIO regulator on tlmm 215 that regulator_late_cleanup()
Subsequently disables.

[ ... ]

> +&remoteproc_adsp {
> +	firmware-name =3D "qcom/kaanapali/Xiaomi/nezha/adsp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/adsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name =3D "qcom/kaanapali/Xiaomi/nezha/cdsp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/cdsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_soccp {
> +	firmware-name =3D "qcom/kaanapali/Xiaomi/nezha/soccp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/soccp_dtb.mbn";
> +};

[Severity: Medium]
Will firmware loading fail with -ENOENT on case-sensitive filesystems for
either the GPU or the remote processors?

Above, gpu_zap_shader uses lowercase "xiaomi" in its path:

	firmware-name =3D "qcom/kaanapali/xiaomi/nezha/gen80200_zap.mbn";

whereas remoteproc_adsp, remoteproc_cdsp, and remoteproc_soccp use capitali=
zed
"Xiaomi":

	firmware-name =3D "qcom/kaanapali/Xiaomi/nezha/adsp.mbn",
			"qcom/kaanapali/Xiaomi/nezha/adsp_dtb.mbn";

Should these all use the same vendor directory casing?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-nezha-v1-0=
-a39900dfaadd@mentallysanemainliners.org?part=3D2
