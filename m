Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962382;
	b=FFL9JNdzkP9QwHVZB4/n4HCMcQHlyUD1sJaBU0GlysJ6Gyab0w3n2R/jM5E/xkjTjA1r
	 iWU8ClAM5kMy+zeEnZ5prTHZcazTH4pWiPOaeiKwwGJMlVdEdRZHiciJFYcxgRQCLpmgz
	 gi1Cv3WXxMtC9rAiAjKrSvYF0pSqJYqc2LPpOBRROH57p+ElJjQtZlrbg9yCjO2pWWt2e
	 clI+LocAYFmugGIJwGusDPIsI4iUAJoVZzfztdrl60VEKhemG8rOq9GYHKBPNRLFbQR0a
	 6vVv+rcBQMP0VE4EBeqzhk/iyMTjGPe5q0RA0K1Hu+e+enVgLSS95+kwO8lVLphm/PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lMwDJ2OoGczv+U5ZV+MkbQUVDrRNwQ8FdLoAqir6sXU=;
	b=0CEuqQ+Qjc3DjWbH1Sm46XGNu2f1/OTY47LV8+nPj3MBXnXfvxWB1tKNRiT8xCCUGqhg
	 9csAdXj7XzTxyiYNI6gusGI0kqEA/1G5KompIy0oXyksRioLAqrX1QPDuLrVdvEoXrMWy
	 LMSfdeZ7zye5jaPYM4j/WusAhhk+TJbF4bq/kVoAMXom5ofa8k4egzkg7SjvhtIweUXVa
	 JELmuskGScU9HBr6vKqLvX3ewedWtQYDY9aYf7qEylJdHPb3FowgxoJSivtcOGQPClJ4/
	 cSB0KlSXw/Kx3mAbTR5TJDjqYzmpmy82MzSaBdR4FSOth3krmSgl9aKMA00qIghVp7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0RNrruf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46509606A332
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0RNrruf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3B61F0089F;
	Fri,  6 Nov 2026 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962381;
	bh=lMwDJ2OoGczv+U5ZV+MkbQUVDrRNwQ8FdLoAqir6sXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d0RNrrufx7ZBdlzamCDYDtOOrfW9GZO4ndagfMmF6CBsaBpf1KDW6BxbNMPCewPbx
	 rmPuAyvIrx88Vhg3JtHqSbvzpIlQ6uQH1DdWpBrytzKcdTKxP2Ru0TTi11bmoeKBIj
	 ewlm0Z2T+Nyba4T/6l4Udw5iv7IWgrhFsF93z2FLFN8MqKc7S5eSBmlLR5tdaLE7hI
	 ripbb2Qdn2olFNz6d/TmE+zdQmhogCf47+xklvnTe0Mmeub+9Xdbj/REZDHZ91RhRD
	 2wBbX5PjHyoopcjLKcHLJBkPhdpbP7S7NVp4R3JNwbIhNf8NNqENKPe4PdRgDruseK
	 qfw5yIc9Bshiw==
Message-ID: <sashiko-outbox-201237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-08-dts-v8-9-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
 <20261106-08-dts-v8-9-d91401955039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:53:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: ipq5210: unconfigured 32 MHz SE clock in
  geni_i2c_probe()
--

commit 8371ffb1bf1c7c415a01c1f69c3fa2b781c1dc69
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add I2C nodes

This commit adds the QUPv3 I2C controller nodes for IPQ5210 and enables
I2C0 on RDP504.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index e4a696a65e550..35cd558819691 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -160,6 +160,14 @@ opp-300000000 {
>  		};
>  	};
> =20
> +	i2c_opp_table_32mhz: opp-table-qup32mhz {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-32000000 {
> +			opp-hz =3D /bits/ 64 <32000000>;
> +		};
> +	};
> +
>  	pmu {
>  		compatible =3D "arm,cortex-a53-pmu";
>  		interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIG=
H)>;
> @@ -435,6 +443,45 @@ uart1: serial@1a84000 {
> =20
>  				status =3D "disabled";
>  			};
> +
> +			i2c0: i2c@1a88000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x01a88000 0x0 0x4000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
> +				clock-names =3D "se";
> +				clock-frequency =3D <400000>;
> +				interrupts =3D <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +				operating-points-v2 =3D <&i2c_opp_table_32mhz>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c1: i2c@1a8c000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x01a8c000 0x0 0x4000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
> +				clock-names =3D "se";
> +				clock-frequency =3D <400000>;
> +				interrupts =3D <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> +				operating-points-v2 =3D <&i2c_opp_table_32mhz>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c2: i2c@1a94000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x01a94000 0x0 0x4000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
> +				clock-names =3D "se";
> +				clock-frequency =3D <400000>;
> +				interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +				operating-points-v2 =3D <&i2c_opp_table_32mhz>;
> +				status =3D "disabled";
> +			};
>  		};

[Severity: High]
Can i2c0, i2c1, and i2c2 fail to probe or lose their SE clock rate across
runtime suspend when using operating-points-v2 instead of assigned-clocks
and assigned-clock-rates?

geni_se_resources_init() registers the OPP table and sets se->has_opp,
which causes geni_se_resources_deactivate() to call
dev_pm_opp_set_rate(se->dev, 0) on runtime suspend, but the "qcom,geni-i2c"
driver never calls dev_pm_opp_set_rate() or clk_set_rate() during probe or
resume.   Instead, geni_i2c_clk_map_idx() only checks the existing clock
rate:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_clk_map_idx() {
	if (clk_get_rate(gi2c->se.clk) =3D=3D GENI_SE_CLK_32MHZ) {
		req_freq =3D GENI_SE_CLK_32MHZ;
		itr =3D geni_i2c_clk_map_32mhz;
	} else {
		req_freq =3D GENI_SE_CLK_19P2MHZ;
		itr =3D geni_i2c_clk_map_19p2mhz;
	}

	ret =3D geni_se_clk_freq_match(&gi2c->se, req_freq, &gi2c->clk_idx,
				     &res_freq, true);

Because ftbl_gcc_qupv3_wrap_se0_clk_src in drivers/clk/qcom/gcc-ipq5210.c
has no 19.2 MHz entry, geni_i2c_probe() fails with -EINVAL unless the
bootloader already set the SE clock to 32 MHz, and runtime suspend clears
the clock rate to 0 without restoring it on resume.  Setting
assigned-clocks and assigned-clock-rates =3D <32000000> on each I2C node and
dropping operating-points-v2 avoids both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-08-dts-v8-=
0-d91401955039@oss.qualcomm.com?part=3D9
