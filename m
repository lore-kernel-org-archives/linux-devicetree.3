Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE99381B1D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281416; cv=none; b=l28zZri+bQPwFZhyN987S1MoQw9PxNYhSoaBcV2vN6lvkddcbXm5y8UmIXtctm57k7mi/+T6Nbf6Yqba4ayo7SDOJ8AzebG3dlnCWrm9+de5MjvKV2S9E/QsOd7yprk2kHe620NpbRGrD0HWidV5Tzqg4FUL/2FXjpclCEPPBXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281416; c=relaxed/simple;
	bh=6wVbBnB2Itm3XdwxaEqm5T59Ehin1Jaqvd7CnKfnlaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lssb4QhXbmJcdRzB16rdM1BQxJqByv4N8k0AyX/4+GftX6VvK9jXo8KUkpWnejUw3QNTmb1fylI7zxx1IJhihseq1bmc82CMMYzIXo3suPpUexpMnsa2/friSrLWaXXq48/mw1+xhnfGhLFRQs/GE34+zYVQG/UTgYZjspUazN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eiqba53p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eiqba53p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9361F000E9;
	Fri, 12 Jun 2026 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281415;
	bh=OBNnJvOuiKkEWQ9r2pjYu0A1ur5Qd26STMCQabmtbho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eiqba53pVy0yYULMQ8CBYH1mzKIF4bYrTygl8UUiWFzOhvpc9kcNsg/PXL7hskN9H
	 kiP2f7VoKwht5Bn+QM9pdc706Kai/AWdsIUkHaEh5NonFpDAnR7t1tAP+I7EOQ6cGI
	 dT6J0XODHq/L/6bAhFMevKzSeT1IYy94y6E2P5yKmSfaUkYA+nJcoqtBz4wKZ5YMny
	 Rd5fSip/DEls1KQRhA0kJ2U2+ZDK19UQnGRNmhaKjoMhg+ddrDislP6l7vWMC4czvW
	 Jz/1Sk3GFC+Z5W1btqwMHqMEp4ifwZu+H5tP9Do1tba+aXSgpVcCozqHEM0JuebybH
	 Tizfl2kkPpmnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: exynos: add initial support for Samsung
 Exynos8855 smdk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612163020.411761-5-alim.akhtar@samsung.com>
References: <20260612163020.411761-5-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:23:34 +0000
Message-Id: <20260612162335.1F9361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing Required Property in UART node `serial_0`
- [Medium] Device Tree Topology Error: `cluster1` skips `core2`
- [Low] Device Tree Binding Violation in `timer` node interrupts
- [Low] DT Binding Violation: Missing `-gpio-bank` suffix on GPIO bank nodes
- [Low] Device Tree Syntax Error: `gic` node defines `#size-cells =3D <1>` =
without `#address-cells =3D <1>`
--

commit fb7d1034f06462e074dc2aa5a08df68787706d6c
Author: Alim Akhtar <alim.akhtar@samsung.com>

arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
   =20
Add initial devicetree support for Samsung smdk board using
Exynos8855 SoC.

> diff --git a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi b/arch/ar=
m64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..f5d30fd299b62
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> @@ -0,0 +1,581 @@
[ ... ]
> +&pinctrl_alive {
> +	gpa0: gpa0 {
> +		gpio-controller;
> +		#gpio-cells =3D <2>;

[Severity: Low]
Does this missing suffix violate the Exynos pinctrl dt-binding schema?

Nodes such as gpa0 and gpm0 appear to be missing the required
-gpio-bank suffix, which the schema expects to match the pattern:

    ^[a-z0-9-]+-gpio-bank$

Without this suffix, the nodes will fail DT schema validation, even though
the Linux pinctrl driver will still parse them by iterating over child node=
s.

> +
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
[ ... ]
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot=
/dts/exynos/exynos8855.dtsi
> new file mode 100644
> index 0000000000000..cffa40b6bb986
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -0,0 +1,214 @@
[ ... ]
> +			cluster1 {
> +				core0 {
> +					cpu =3D <&cpu4>;
> +				};
> +				core1 {
> +					cpu =3D <&cpu5>;
> +				};
> +				core3 {
> +					cpu =3D <&cpu6>;
> +				};

[Severity: Medium]
Is it intentional to skip core2 in the cpu-map topology array?

The cluster1 node defines core0, core1, and core3, completely skipping
core2. Device tree topology indices are generally expected to be contiguous.

Skipping core2 might misrepresent the actual hardware topology and confuse
kernel topology parsers or the task scheduler.

> +			};
> +
> +			cluster2 {
[ ... ]
> +		gic: interrupt-controller@10200000 {
> +			compatible =3D "arm,gic-v3";
> +			#interrupt-cells =3D <4>;
> +			#address-cells =3D <0>;
> +			#size-cells =3D <1>;

[Severity: Low]
Is this #size-cells assignment a device tree syntax error?

The gic node explicitly specifies #address-cells =3D <0>, but sets
#size-cells =3D <1>. In Device Tree syntax, if #address-cells is 0, the nod=
e's
children cannot have sizes, so #size-cells must also be 0 or omitted.

This mismatch will trigger the avoid_unnecessary_addr_size dtc compiler
warning.

> +			reg =3D <0x10200000 0x10000>,
> +			      <0x10240000 0x100000>;
[ ... ]
> +		serial_0: serial@15500000 {
> +			compatible =3D "samsung,exynos850-uart";
> +			reg =3D <0x15500000 0x100>;
> +			interrupts =3D <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH 0>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart0_bus>;
> +		};

[Severity: High]
Does this node need clocks and clock-names properties?

The samsung_tty driver unconditionally requests the uart clock during its
probe() function via devm_clk_get(). Without these properties, the driver's
probe will fail with -ENOENT and abort.

Since serial_0 is set as the stdout-path in the board DTS, this failure
would result in a non-functional serial console.

> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +		interrupts =3D
> +		     <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,

[Severity: Low]
Are these interrupt definitions violating the GICv3 device tree bindings?

The timer node defines its GICv3 PPI interrupts using the
GIC_CPU_MASK_SIMPLE(8) macro and IRQ_TYPE_LEVEL_LOW.

Under GICv3 device tree bindings, the 3rd cell must only encode trigger type
and level flags; embedding CPU affinity masks violates the schema.
Additionally, GIC device tree bindings standardly expect
IRQ_TYPE_LEVEL_HIGH or IRQ_TYPE_EDGE_RISING.

This will trigger dtbs_check validation warnings, though the Linux GICv3
driver safely masks out the unsupported bits at runtime.

> +		     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> +		     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> +		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612163020.4117=
61-1-alim.akhtar@samsung.com?part=3D4
