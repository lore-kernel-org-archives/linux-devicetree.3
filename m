Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459639;
	b=b7d5t4quNwwl3lndsl+DSpLy9eZRvocopqEiS7i25qgqXIL2nOI2/xEHwiKSex9WPD7P
	 kSznROex+jxsX9BpeL2tuIRC/f8ttsuLM4CaNm1QHjhbYZg4CKLn9RtZNQb0JdegaQGiK
	 efNoJtoF0rhU3RIWfV1w7yQhrNAQczH+myeYGs/yLpPFnThJ4zMmL8hBx2o0TlAGq+nj9
	 tL2HOt+1bPjqtfUl/FCi5bDdtdyntMjbP0orOmzCfoSdek4rw7IDqC5IEEwe3A3J6ujOp
	 0jUwB7PwltbQEzIlC6+HsaQiKYr6NEJpHkn+8KnPe0ca0NWN906/sA5sxAciHP3szlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zHOMSk1Nz0b3keQ9uF/wOvL2htKXSmoUrdPk0wh4/p8=;
	b=nqza5ia3aAKBEjiJAcsUjdUZcWEyqpeP0y3+RJSVCUl3ruDkUK+2X68sMTdwmcAedVOx
	 wf8zRIP6giJsg5wlJ/KkDlshtSx4ZTW7teHyNeYCqu1C7SrxS+fW59rnFKAEm4MwTW8nA
	 sm0D1jgR2z71ZZAKQ4b1m4hMqvPvtdfjvzTbqAWs/eGzerSJjJK/2unZM8XnHCmS4njJT
	 bOsjj8r4/F6FdQ72WYR3jwlh5s3MEmVW/ooIWIxI2n2XpWA1n1zr0p3/flbOyPirMqHrK
	 gjfUTCedjXjSrwjp1Op/P1PB1Mr0IsTxJQdmi7nV3HjU+AgVJnflpkTpxLVIVq+Lrmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gkvQIcSk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D9D606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gkvQIcSk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3451F00A05;
	Thu, 12 Nov 2026 05:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459638;
	bh=zHOMSk1Nz0b3keQ9uF/wOvL2htKXSmoUrdPk0wh4/p8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gkvQIcSklie+Y/uB5secYYovXHf76vMbfRuocGo23x8ycMA+dzbQevOsDAPtt5YMw
	 aT59bfH5zGo5HHMMzK7kMT9ZkNMJ4QXUvfzIh3ronM5/QKGgmAmDxqTbqMaJv4jXB7
	 2nenqd8/zD6D1AkfIGbEclZs7RtWFfAKwSCunRgVuahIsDHOIlQrYGD+JRLZrUtbEL
	 Qn3ovi3piKw8zDFLFCmIkRurLNLAwV4mw4PIepd05h5x6Vy1ivET7C+uIKdWZyvjNo
	 zFNzsDqFAQxRvmZa1oHtjuP3PJD04p08tWB6ptW3K/TTt3ouA7odeGDX4hyBsO3wbT
	 6WnLQOxZ+2IQQ==
Message-ID: <sashiko-outbox-210408@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-08-dts-v9-10-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
 <20261112-08-dts-v9-10-c34de4f78fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 05:00:37 +0000
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

commit 146df0b74de51d5a0fb5f5d16a2e1f1177beaca7
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add SPI node definitions

This commit adds the spi0 and spi1 QUPv3 GENI SPI nodes and a 50 MHz OPP
table to the IPQ5210 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 36f874e57b425..052c2f3df94db 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -181,6 +181,14 @@ opp-32000000 {
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
> @@ -459,6 +467,18 @@ qupv3: geniqup@1ac0000 {
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
> @@ -495,6 +515,18 @@ i2c1: i2c@1a8c000 {
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
Will capping spi_opp_table_50mhz at 50 MHz cause get_spi_clk_cfg() ->
dev_pm_opp_set_rate() to fail with -ERANGE when geni_se_clk_freq_match()
picks a source clock rate above 50 MHz?

Both GCC_QUPV3_WRAP_SE0_CLK and GCC_QUPV3_WRAP_SE4_CLK use
ftbl_gcc_qupv3_wrap_se0_clk_src, which exposes five rates above 50 MHz:

drivers/clk/qcom/gcc-ipq5210.c:
	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
	F(58986175, P_GPLL0_OUT_MAIN, 1, 16, 217),
	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),

geni_se_clk_tbl_get() populates se->clk_perf_tbl via clk_round_rate()
without consulting the device OPP table, so geni_se_clk_freq_match() will
select 51.2..64 MHz source rates whenever an integer divider yields a
better match for the requested SPI bus speed (for example, 30 MHz =3D
60 MHz / 2 or 15 MHz =3D 60 MHz / 4).  When get_spi_clk_cfg() then calls
dev_pm_opp_set_rate(mas->dev, sclk_freq), _find_freq_ceil() returns
-ERANGE because the highest OPP in spi_opp_table_50mhz is 50 MHz, aborting
the SPI transfer.

Since spi_opp_table_50mhz carries no voltage, level, or bandwidth votes,
operating-points-v2 can be dropped (as on ipq5424.dtsi) so
dev_pm_opp_set_rate() falls back to clk_set_rate(), or the OPP ceiling can
be raised to 64 MHz if the SPI controller supports those source rates.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-08-dts-v9-=
0-c34de4f78fbb@oss.qualcomm.com?part=3D10
