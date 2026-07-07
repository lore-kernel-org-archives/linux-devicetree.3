Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A663F99ED
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428891; cv=none; b=TAPCyHsecaAMj2MXRtgxjSn9p9M9Dcqoe8yLucvRkBifNJQniUkvAsfmG4elOcFJjt07IrzTDh18c02Ae2iJgfhchSl49A//4sdBFt3Mu7KbD7NPQuhy3VrWV3tJA2nQuR0J7zBB6zGmx6ldlP9vQ0BzeJ2ch6tjmJLCb1WWLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428891; c=relaxed/simple;
	bh=eQxcA6aoqpvNPpJUfx++PcXWoeVnTH4CGe7mGu8mAQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fyw2xgkTZF6PuGJSGErLDPYXJiUTFdewUIeg77XTqlF7YSC2hESRtieT1VXO4WBnKDe3YpYgspICrwikKMfkiqnYlkK74BzVtJtbckeEqAYz4odN6jQTNDWfM6cXyNqZW7OKBB5h7OI0f76GgKR/jHO05FIdShFUPxFNy3rRHnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9IqtOOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9IqtOOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12591F000E9;
	Tue,  7 Jul 2026 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783428890;
	bh=SUUdMJSL0rK7As7vNIw0M58+s47xv8ow2DUN2o8N+hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P9IqtOOmrt/N5W1q9FSBdPPr9vxAS1cvc/SQYoAmA6NbhW0jV7U60/i60Z7lFtYuP
	 NkOm1XZlaW3vq1CuJ37GCOcokd/M/E8bGy7B3V792NhGgOwHzLnKdLcQAGXGsVKXFH
	 EqMrwBT9LeBO1PTwnmFN360Z8OrNbGcY6eTiejDnFtoZ3u/6Uqe9+kZpyBb+4uuQ4P
	 SoRGibIx/si8ot71GWbSIz13uFTATtayaI9p6xswuJSK5ZSuMMZgdWBVbdUduhFdoJ
	 YfoH4X6lIKPUF+NCO9ymtMuNLI7lsf2Y/+UbIxdjTUR6wOaeYy5VZHYMo62wk2jujc
	 fYidod4ZlMStQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707123902.3868016-2-shengchao.guo@oss.qualcomm.com>
References: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
 <20260707123902.3868016-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 12:54:49 +0000
Message-Id: <20260707125449.F12591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] All thermal zones incorrectly configure their highest trip point a=
s 'passive' instead of 'critical'.
- [High] The QUPv3 wrapper nodes (`qupv3_0`, `qupv3_1`, `qupv3_2`) and thei=
r child serial engines are missing the mandatory `clocks` and `clock-names`=
 properties.
- [Medium] The QUPv3 wrapper nodes lack the `dma-coherent;` property despit=
e operating behind DMA-coherent SMMUs.
--

--- Patch [1]: [PATCH v4 1/4] arm64: dts: qcom: Add device tree for Nord So=
C series ---
commit 5f24b1554bc5bc9f0d13a6a874f148ee166082f5
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include for the Qualcomm Nord SoC
series. It describes core hardware components like CPUs, interrupt
controllers, GPIO, thermal sensors, memory mappings, and QUP blocks.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> +	soc: soc@0 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		dma-ranges =3D <0 0 0 0 0x10 0>;
> +		ranges =3D <0 0 0 0 0x10 0>;
> +
> +		qupv3_2: geniqup@8c0000 {
> +			compatible =3D "qcom,geni-se-qup";
> +			reg =3D <0x0 0x008c0000 0x0 0x2000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x15a3 0x0>;
> +			ranges;

[Severity: High]
Are these QUPv3 wrapper nodes (and their child serial engines) missing
the mandatory clocks and clock-names properties?

The qcom,geni-se-qup compatible string instructs the driver to request
two clocks (m-ahb and s-ahb). Because these properties are omitted, the
probe function will fail immediately with -ENOENT when validating the
clock count, leaving the QUP wrappers and all their child serial engines
unusable.

[Severity: Medium]
Should this node also include the dma-coherent property?

The apps_smmu_0, apps_smmu_1, and apps_smmu_2 IOMMUs are explicitly
marked as dma-coherent. However, because the parent soc node does not
declare dma-coherent, the QUP wrappers must explicitly define it so that
child serial engines inherit the coherency property.

Omitting it causes the DMA API to fall back to non-coherent mappings,
leading to unnecessary CPU cache maintenance operations on every DMA
transfer.

> +
> +			i2c14: i2c@880000 {
[ ... ]
> +	thermal_zones: thermal-zones {
> +		ddr-0-0-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens0 0>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <105000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature =3D <115000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};

[Severity: High]
Is the highest trip point intentionally configured as passive instead
of critical here and across the other thermal zones?

When the hardware reaches high temperature thresholds like 115C or 125C,
having the type set to passive means the Linux thermal core will only
attempt passive cooling (throttling) and will not initiate an emergency
shutdown.

Without a critical trip point, temperatures could continue to rise until
the hardware's protection circuit forcibly cuts power, which can lead to
data corruption or permanent hardware damage.

> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707123902.3868=
016-1-shengchao.guo@oss.qualcomm.com?part=3D1
