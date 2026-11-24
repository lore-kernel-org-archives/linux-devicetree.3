Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518787;
	b=lXSXEAoJJxjBh+42nGsT+RuiE5hNEX9dJHWj9ZkhnZ4aPBpw5nWJOa8kvi34ZgpqZTqv
	 mWMR85Cgggfn7fCjeyBOU7I09dCHQejBoLKxu5vwYmFBJXPWDBmhd+ck1PRqzKq4MQZ/V
	 WpEiDrVTghNaDKbfkwuLYcxBF+yPbcvHNemOGwSffYN286daf5f3VDKmRqN2R1DsY4ddO
	 Oeo2XHGgYVL7+1qz51Ray+TF+to1dzzlLncXyO8SYUQOzLgb7TZ7+EzPjTWogFUySmd8A
	 gVX9xoxic4ah1ozHYQoW8NVk7hsDQngezJWp1kNFH4Fkv8WRdFm/EBk9iVQUZTZEkww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518787;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+3pgKqckFllVK7kDPqZiEbjUEoTDygESlUvXMjcmBRI=;
	b=kkhMXySPFB3VuORSkA2PGeQ7d7XirYanUrhHPuETpoDH5Y7tdkFde0bw4VUpNvZQATAB
	 8dECeHXXmCDPZbnbXMw+NCdLLbHb+IH4lo0LT0r525QPnSPq8D4oDN3XZIvHWeFyxmCXG
	 SJuBFgGH+QCOsMTDf2u2r8wlgLzsYxPzTvS9hRLOAkUjRrAi+G8aXXfoRLHQs7axPjI7A
	 acBB+Z+VHe0Dt/61sMT02PQb4mMCiV0JdHV3rBVB6vY6PluYff7u39rTRf+e/AJa/v1Pq
	 J/4m4LkAQIdaJU9hgHI1Ncdm5qx97wRV2kqQUzC5GU7M6OL3GbXE+7XoOejqT6qVY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8nOj49r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE3606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8nOj49r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EC51F000CA;
	Tue, 24 Nov 2026 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518787;
	bh=+3pgKqckFllVK7kDPqZiEbjUEoTDygESlUvXMjcmBRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n8nOj49rZgXWBn9Ce5Co9gtyYLml+05qGlPLQoZ3VoKwXU+K8bC7KXtZ62Ou68CxW
	 mHCRGLh24y5msiL/r+RO+4Kp8A3c7iNhQT/1HPMMqbjiYIEOLqWEU8yQ0thwhF3QHr
	 Tx4IUkHbAMLRiKDP2G2iOzmjYi2XQklJZU8BMMJAXNT/FF28Lx5jDtD23DcgDqLNG7
	 ftiaBxnlLMrMLPhYWe1ln71q2F3AURUEv+ivWEFlPEhL0UrPHz8kbnklCpTsgpGscr
	 hewnHvIY/TOO/nbg1CRBf7i6hmprK8WIvr09iAbCxyKQ8PfKOi8T9bgxy38TXd8X/t
	 tTcscUlgGaT/A==
Message-ID: <sashiko-outbox-231023@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Seca SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yadu M G" <yadu.mg@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <d92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28.1795517711.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
 <d92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28.1795517711.git.yadu.mg@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:13:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] arm64: dts: qcom: seca: uart19 specifies GIC_SPI 584 instead
  of 587
- [Low] arm64: dts: qcom: seca: GENI I2C and SPI nodes omit address/size
  cells
- [Low] arm64: dts: qcom: seca: memory@80000000 hardcodes 2 GiB size
  instead of 0
- [Low] arm64: dts: qcom: seca: watchdog@17826000 uses deprecated
  qcom,kpss-wdt alone
--

commit cd118f7edde6b22c320982447575045a1e79989d
Author: Yadu M G <yadu.mg@oss.qualcomm.com>

arm64: dts: qcom: Introduce Seca SoC

This commit adds the base device tree include (seca.dtsi) for the Qualcomm
Seca automotive SoC.

> diff --git a/arch/arm64/boot/dts/qcom/seca.dtsi b/arch/arm64/boot/dts/qco=
m/seca.dtsi
> new file mode 100644
> index 0000000000000..ae557be27e98f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/seca.dtsi
> @@ -0,0 +1,3339 @@

[ ... ]

> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x80000000 0x0 0x80000000>;
> +	};

[Severity: Low]
Should memory@80000000 use a zero size (<0x0 0x80000000 0x0 0x0>) in the
SoC dtsi so the board DTS or bootloader fills in the actual DRAM capacity?
Hardcoding 2 GiB here also leaves the reserved-memory carveouts at
0x8c0000000 and 0x8c8000000 outside the memory range.

[ ... ]

> +		qupv3_2: geniqup@8c0000 {
> +			compatible =3D "qcom,geni-se-qup";
> +			reg =3D <0x0 0x008c0000 0x0 0x2000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x12a3 0x0>;
> +			ranges;
> +			dma-coherent;
> +
> +			i2c14: i2c@880000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x00880000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +				status =3D "disabled";
> +			};
> +
> +			spi14: spi@880000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x00880000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +				status =3D "disabled";
> +			};

[Severity: Low]
Should all 20 GENI I2C nodes (i2c0..i2c5, i2c7..i2c14, i2c16..i2c21) and
18 GENI SPI nodes (spi0..spi5, spi7..spi8, spi11..spi14, spi16..spi21)
define #address-cells =3D <1> and #size-cells =3D <0>?  Without them, adding
child peripheral devices in a board DTS triggers dtc i2c_bus_bridge,
spi_bus_bridge, and reg_format warnings.

[ ... ]

> +			i2c19: i2c@894000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x00894000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +				status =3D "disabled";
> +			};
> +
> +			spi19: spi@894000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x00894000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +				status =3D "disabled";
> +			};
> +
> +			uart19: serial@894000 {
> +				compatible =3D "qcom,geni-uart";
> +				reg =3D <0x0 0x00894000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> +				status =3D "disabled";
> +			};

[Severity: Medium]
Should uart19 use GIC_SPI 587 instead of GIC_SPI 584 to match i2c19 and
spi19 at 0x894000?  GIC_SPI 584 belongs to the serial engine at 0x888000
(i2c16, spi16, and uart16), so enabling uart19 will leave it without its
hardware interrupt and conflict with SE2 devices.

[ ... ]

> +		watchdog@17826000 {
> +			compatible =3D "qcom,kpss-wdt";
> +			reg =3D <0x0 0x17826000 0x0 0x1000>;
> +			clocks =3D <&sleep_clk>;
> +			interrupts =3D <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
> +		};

[Severity: Low]
Should watchdog@17826000 include an SoC-specific compatible string such as
"qcom,apss-wdt-seca" before "qcom,kpss-wdt"?  Using "qcom,kpss-wdt" alone
is deprecated in Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
and causes a dtbs_check warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795517711.gi=
t.yadu.mg@oss.qualcomm.com?part=3D2
