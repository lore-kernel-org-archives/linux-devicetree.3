Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1A27EFE9
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297257; cv=none; b=WB8bdGaIwUcg1HxVN3pRPnUX6SODxV6L7c/vqvyBPuUVuXpjLt1PeInNGxv4cFAUHECIMq9MJzAGhQ6WsgrsqhGXhvi2tXkJRzrrAWQmgCpgvq7lxnGTx68Wd9qIJVxZj4IFxbZCaCtMDe40B2akkSjgw079ajwpYJrmexDDqGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297257; c=relaxed/simple;
	bh=ARl9uhgo/ShrYen5CART69RRM5FvRmEONIdR4a3s7FU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fCjlRAuU9WRo8imRBaPXi7dDQCAdzbe0xzIWhBKsonnTmebFhzTWShNjw3RvDgJ8hrdX6YiuqWHKc5o6AygCWY3y0om5GeXJKyvoFzG0ip0ooTdF4ae0yYX33mzVjyOrZhGIu//MT9QGmJO7w8Dol8I4C010kIkX18QgzGvr1BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJNP0Goz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJNP0Goz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7461F000E9;
	Wed, 24 Jun 2026 10:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297256;
	bh=jvRWAgMe2+vbGMeUFB1zwfI94UwtAkmsxXKx10NgiqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJNP0GozenEsJHu8hDTa/ABFj7bcDBOC0X7PqujfOYgNEL4CjPOr5xdJBrSVD+/w2
	 gH/vxIm9hxJREmqlNh0iocj6MMmYznLIvMt8lCFrX41+3//TDbu+7+LDYF8kBkiS11
	 umf18uYnG7je6HbxoRLZrLLy6BxP0jbvrgMn2b1lQveWhW7oP/k2qi9PYHzXUE/jRT
	 /e2e6NP3kvH+mQNNQW8xwqyGQD9cR3pv0r+mqjnZpzuodP1I5GStZ3kCmooaJzGBLV
	 msxDP6XLtsjUMFt02C/Ub6aye996TAmFIijy4bwGSA2j5WbgWZUHOBzHzZdSP0c/R4
	 CH14gVZFgJvyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: axiado: Add initial support for AX3005
 SoC and eval board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swark Yang" <syang@axiado.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624-upstream-axiado-ax3005-upstream-v1-2-c05bd0bc9124@axiado.com>
References: <20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com>
 <20260624-upstream-axiado-ax3005-upstream-v1-2-c05bd0bc9124@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:34:15 +0000
Message-Id: <20260624103416.5D7461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] All secondary CPUs share the exact same `cpu-release-addr` for the=
 SMP spin-table.
- [Medium] The ARMv8 architectural timer and GIC maintenance interrupts are=
 incorrectly configured as active-high.
- [Low] Mismatch between the memory node's unit address and its `reg` base =
address.
- [Low] Missing `clock-frequency` property in the `timer` node despite indi=
cating firmware did not configure registers.
--

commit 9c7369abb8e810cca148d4bf6cc3f8266fdfad15
Author: Swark Yang <syang@axiado.com>
Subject: arm64: dts: axiado: Add initial support for AX3005 SoC and eval bo=
ard

This commit adds initial device tree support for the AX3005 SoC and its
evaluation board. The AX3005 is a multi-core SoC featuring 4 Cortex-A53
cores, and this adds the CPUs, timer, GPIO, UART, I2C, I3C, SPI and USB
controllers.

Link: None

> diff --git a/arch/arm64/boot/dts/axiado/ax3005-evk.dts b/arch/arm64/boot/=
dts/axiado/ax3005-evk.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3005-evk.dts
[ ... ]
> +	memory@0 {
> +		device_type =3D "memory";
> +		/* Cortex-A53 will use following memory map */
> +		reg =3D <0x0 0x81000000 0x0 0x7f000000>;
> +	};

[Severity: Low]
Should this unit address match the base address? The memory node specifies a
base address of 0x81000000 in its reg property, but the unit address is @0.
This will cause a dtc compilation warning for unit_address_vs_reg.

[ ... ]
> diff --git a/arch/arm64/boot/dts/axiado/ax3005.dtsi b/arch/arm64/boot/dts=
/axiado/ax3005.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3005.dtsi
[ ... ]
> +		cpu1: cpu@1 {
> +			compatible =3D "arm,cortex-a53";
> +			device_type =3D "cpu";
> +			reg =3D <0x0 0x1>;
> +			enable-method =3D "spin-table";
> +			cpu-release-addr =3D <0x0 0x80002fa0>;

[Severity: High]
Are all secondary CPUs supposed to share the exact same cpu-release-addr?

If cpu1, cpu2, and cpu3 all poll 0x80002fa0, the first wake event will
trigger all of them simultaneously. Will this cause concurrent jumps into
secondary_startup and corrupt the stack during SMP bring-up since they would
all attempt to consume the single cpu_boot_task?

[ ... ]
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupt-parent =3D <&gic500>;
> +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Medium]
Should the ARMv8 architectural timer PPIs be active-low? The generic timer
output signals usually generate active-low level-sensitive interrupts
(IRQ_TYPE_LEVEL_LOW), but these are defined as IRQ_TYPE_LEVEL_HIGH here.

> +		arm,cpu-registers-not-fw-configured;

[Severity: Low]
Does this timer node need a clock-frequency property?

The arm,cpu-registers-not-fw-configured property indicates firmware did not
initialize the timer frequency register. If CNTFRQ_EL0 is actually
unconfigured, omitting the fallback frequency can cause boot warnings or
failure in the timer subsystem.

> +	};
[ ... ]
> +		gic500: interrupt-controller@40400000 {
> +			compatible =3D "arm,gic-v3";
> +			reg =3D <0x0 0x40400000 0x0 0x10000>,
> +			      <0x0 0x40500000 0x0 0xc0000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			#interrupt-cells =3D <3>;
> +			interrupt-controller;
> +			#redistributor-regions =3D <1>;
> +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Medium]
Does the GICv3 VGIC maintenance interrupt need to be active-low? Similar to
the timer interrupts, the architecture specifies this as an active-low
level-sensitive interrupt, but it is declared as IRQ_TYPE_LEVEL_HIGH here.

> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-upstream-a=
xiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com?part=3D2
