Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963535;
	b=tluoVmyp1riIaiAqdhRUvR6YOnAYkSlG68VLWprfZYMhu8x7SNcHtPoFrBzzHevTUJMF
	 gtQqPZRpOIFIM/TNvvO77W3s9U7JZrxrz0YQtQ2d0m9ssIzv7GCEP7g/e3u9Z0bafkQyz
	 HyW46vZ4KzM2+rUgxICyJVw+RcltcHm5oAhjLpwUWeWPFx4fp+TiFOgQlvrDY+F7xp8AU
	 qjMW7xUnwdwLBnVrWgrGKVkFE4EX8IDCUjotOYCEiFXgSDuOqgMY3XHVZvZ6vkZ5b3hJU
	 G8IiE4X0IJV+sMqNixyAqTNMVLde3S95MaZiQrGl61EMCyRpTTEXyTQW7abiS0Hxp0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963535;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Zqlq+2NqonEVaOF9+4aOhdOgFsGySsIX3Ml4YY6AD6I=;
	b=ZDghD+j3OJ7JLyc4VE8O6RaNYwEmvQjoueyttCiWc/S/INw0jYSTCNxcbIGE3PIHEbS1
	 heBpjeoU4AxdBeSWwhbQDpE267rfFiOebgXuZcEjy6QzlLuDGYva7HaRiO/dmGZTPNOe+
	 lKDfJ6Mby5Ea3CbafWI3VqKD2Cex4PjzAnThz9vmECdDc26wPXahS5FyeZp2PucZGNZd3
	 7qy21IwKvjmIByIRKlbiMOCuX9UR5sIXMIQKjmT9TAUibz4YhprSbj2qxaZ2yCqqoTSm2
	 u7kCEa2Jzc1kySEklLXqs1ireN7TZeQRAVWtl6GuD3QVKrF35RQIC146YcsLzC9km/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7G8KVef;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BAD606A33B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7G8KVef
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC331F0089F;
	Fri,  6 Nov 2026 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963534;
	bh=Zqlq+2NqonEVaOF9+4aOhdOgFsGySsIX3Ml4YY6AD6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L7G8KVefHq+LBUJaJ0NlMKd5U5R2OebJIp0TpmnGEGvBNNfjbulxBrFXtSVrsmZX9
	 GwCjkM/4ydNPNweHT886dleraJLC9ITGxJxIu73LaDds0oB5o1GIc799DIU4WbHbgZ
	 aX/xbg6HoMEmAfugRNEVLS3yWulUZeA3QdkfFflPRM1AWSkvXIQ7Zx0NPeQ6MzN4hg
	 ZwUvjfOqCFQhdGNYh5kZd8OqDdsS+zaQfA6HgpSOyX95LLJn0VDHDkBLG864g/JmeF
	 wrVC4TYpPawBrPSIw3t7y7dFQgAtlMjdKxvJWbXvyB2ReF5KqirPWkJVGCQKRS/2E9
	 bn73OUdT84z8A==
Message-ID: <sashiko-outbox-201271@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-08-dts-v8-10-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
 <20261106-08-dts-v8-10-d91401955039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:12:13 +0000
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
- [Medium] arm64: dts: qcom: ipq5210: 50 MHz SPI OPP cap breaks
  get_spi_clk_cfg()
--

commit 725b83be0f0b59dd5d0c719a4664cb25c7baa4d8
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add SPI node definitions

This commit adds the spi0 and spi1 QUPv3 GENI SPI controller nodes and a
50 MHz OPP table to ipq5210.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 35cd558819691..61a58fd5d4ce3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -168,6 +168,14 @@ opp-32000000 {
>  		};
>  	};
> =20
> +	spi_opp_table_50mhz: opp-table-spi50mhz {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-50000000 {
> +			opp-hz =3D /bits/ 64 <50000000>;
> +		};
> +	};
> +
>  	pmu {
>  		compatible =3D "arm,cortex-a53-pmu";
>  		interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIG=
H)>;
> @@ -434,6 +442,18 @@ qupv3: geniqup@1ac0000 {
>  			#address-cells =3D <2>;
>  			#size-cells =3D <2>;
> =20
> +			spi0: spi@1a80000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x01a80000 0x0 0x4000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				clock-names =3D "se";
> +				interrupts =3D <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +				operating-points-v2 =3D <&spi_opp_table_50mhz>;
> +				status =3D "disabled";
> +			};
> +
>  			uart1: serial@1a84000 {
>  				compatible =3D "qcom,geni-debug-uart";
>  				reg =3D <0x0 0x01a84000 0x0 0x4000>;
> @@ -470,6 +490,18 @@ i2c1: i2c@1a8c000 {
>  				status =3D "disabled";
>  			};
> =20
> +			spi1: spi@1a90000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x01a90000 0x0 0x4000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
> +				clock-names =3D "se";
> +				interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +				operating-points-v2 =3D <&spi_opp_table_50mhz>;
> +				status =3D "disabled";
> +			};
> +
>  			i2c2: i2c@1a94000 {
>  				compatible =3D "qcom,geni-i2c";
>  				reg =3D <0x0 0x01a94000 0x0 0x4000>;

[Severity: Medium]
Will capping spi_opp_table_50mhz at 50 MHz cause get_spi_clk_cfg() to fail
with -ERANGE on spi0 and spi1?

Both GCC_QUPV3_WRAP_SE0_CLK and GCC_QUPV3_WRAP_SE4_CLK are backed by
ftbl_gcc_qupv3_wrap_se0_clk_src, which exposes rates above 50 MHz:

drivers/clk/qcom/gcc-ipq5210.c:ftbl_gcc_qupv3_wrap_se0_clk_src[] {
    ...
	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
	F(58986175, P_GPLL0_OUT_MAIN, 1, 16, 217),
	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
    ...
}

geni_se_clk_tbl_get() builds se->clk_perf_tbl via clk_round_rate() on the
SE clock without filtering against the device OPP table, so all entries up
to 64 MHz are recorded.  When a client requests a valid bus speed such as
30 MHz, get_spi_clk_cfg() -> geni_se_clk_freq_match() selects the 60 MHz
source clock with a divider of 2 and passes sclk_freq =3D 60000000 to
dev_pm_opp_set_rate(), which fails with -ERANGE because the highest OPP in
spi_opp_table_50mhz is 50000000 Hz, aborting the SPI transfer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-08-dts-v8-=
0-d91401955039@oss.qualcomm.com?part=3D10
