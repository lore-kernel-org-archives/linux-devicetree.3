Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB329A31C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604314; cv=none; b=Qi4vC5DdaDaGss6KgRN52v9Nb5/5eRD8UXF78TftoXUwlarX20+Ld3xovo1+E8RHb90G3VPgoo4ov/oATKTgOSL9QwdRZ++hOHDWQGNY1S3afVNJE3xhfjLlkElzE7Ysw6sK7iQGYXfUOxlySaKgHsWIrNxyt2zZ+GYSpyOcWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604314; c=relaxed/simple;
	bh=o6QfflYPHpmEVUSeDNVQiDgZkyYCZ08CNZyii0pku2s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ng+IefAiuCW7OhH9On8GuXe0mfLp2ISYZmej8DjBt3lWhxLNdZ5D7kyVuKdiHlYqQNWkZBxxEHpS/Tt07/CLvYZQ47HBy+gymi7pW80RzZ4QvgtLx0E1M/dV5h0izh99qawkGzRiU4AMahOaWp5mgeS5WB9+31AqH7TvJOEvaEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLNdzai7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLNdzai7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D731F000E9;
	Thu,  9 Jul 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783604312;
	bh=LpOMMkeOXEeGZjLnW2jHRQHlWlCk7cVaqxivdhYUKnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gLNdzai7hCGm8etVjOqX60M0jls+QzufnCP4arr9lMaXvSRX83V07e1GM9dOlCOep
	 ilw9QnFFVQGvi2yXRpZEHed3XH7xYlm7fXcnSXZWc4HEUfufSEEmJdsYMdyHGYqeU5
	 4Yfx4dGY57E1+N2CYCSu5zylvtkZ4asFkd0jJVsXvywQeqEDbPkO4sfvk+QeyoefSP
	 HstkUuiejZ0sEssWiAEM5T4xRPcc2Vt956ieYuOiaoSlZE0SLFwjNeLx1dJ9wGy6gQ
	 r/cuLYDa6ePgUIl9sMwTaQmhhiK2WoTHj/YPE79SJ+6hfUfZ5S5bcnln8YtWSUNFoQ
	 l3pCDAD4e+Scg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709132013.4096850-2-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 13:38:32 +0000
Message-Id: <20260709133832.82D731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The UFS host controller node specifies a unit address but is missi=
ng a `reg` property.
- [Low] The `watchdog@17826000` node references a `sleep_clk` clock label, =
but this label/phandle is not defined anywhere in the SoC `.dtsi`.
- [Low] The SPI controller nodes within the QUPv3 wrappers are missing the =
mandatory `#address-cells` and `#size-cells` properties.
- [Low] The QUPv3 wrapper and serial engine nodes (`i2c`, `spi`, `uart`) ar=
e missing mandatory `clocks` and `clock-names` properties.
--

--- Patch [1]: [PATCH v5 1/7] arm64: dts: qcom: Add device tree for Nord So=
C series ---
commit 85da8a1968eae51c682bf41212bb6ddfbb6a4ee8
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include (nord.dtsi) for the Nord SoC
series, describing core hardware components like Oryon cores, GICv3, TLMM,
SMMU, and QUP blocks.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..716297bcc9a63
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

[ ... ]

> +		qupv3_2: geniqup@8c0000 {
> +			compatible =3D "qcom,geni-se-qup";
> +			reg =3D <0x0 0x008c0000 0x0 0x2000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x15a3 0x0>;
> +			ranges;

[Severity: Low]
The QUPv3 wrapper and its child serial engine nodes (i2c, spi, uart) appear=
 to
be missing the mandatory clocks and clock-names properties. Are dummy or fi=
xed
clocks needed here to prevent dtbs_check validation errors if the clock
controller is not yet available?

[ ... ]

> +			spi14: spi@880000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x00880000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				status =3D "disabled";
> +			};

[Severity: Low]
This spi node, and others throughout the file, seems to be missing the
#address-cells =3D <1> and #size-cells =3D <0> properties. Without these, w=
on't
child peripheral nodes fail to specify their chip select addresses, causing
dtbs_check schema validation errors?

[ ... ]

> +		ufs_mem_hc: ufshc@1d44000 {
> +			compatible =3D "qcom,nord-ufshc",
> +				     "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			interrupts =3D <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			lanes-per-direction =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x14c0 0x0>;
> +			dma-coherent;
> +			msi-parent =3D <&gic_its 0x14c0>;
> +		};

[Severity: High]
Does this UFS host controller node need a reg property? Since it specifies a
unit address (ufshc@1d44000), omitting the reg property violates the device
tree specification.

Could this also cause the ufshc driver probe to fail when it attempts to
fetch the MMIO base?

[ ... ]

> +		watchdog@17826000 {
> +			compatible =3D "qcom,apss-wdt-nord",
> +				     "qcom,kpss-wdt";
> +			reg =3D <0x0 0x17826000 0x0 0x1000>;
> +			clocks =3D <&sleep_clk>;
> +			interrupts =3D <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
> +		};

[Severity: Low]
The clocks property references &sleep_clk, but this phandle does not appear
to be defined anywhere in this SoC .dtsi.

If a board file includes this file without explicitly declaring sleep_clk,
will it cause a dtc compilation error for a non-existent node or label?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709132013.4096=
850-1-shengchao.guo@oss.qualcomm.com?part=3D1
