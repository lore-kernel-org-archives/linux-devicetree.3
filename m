Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE2382281
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778350210; cv=none; b=ImJahGIpuu/SbNJBeAd6/c4BQbVQTWMXx0JtReA75XjrQO0+pCuND77nSxHiVoE3K90qtMeO5LKVftl3owGJdJ2S7AF+v8+e4cjKBUxnnbUO/xFS1JEccR2WvGNfJbjN1OID8uV7unN6v7BhJIZ+aiwDBiA+wPTPtsUN6wpCqmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778350210; c=relaxed/simple;
	bh=HHHAx0iSIpv2QA8LnoMZ0aYyITjmuApL3hfq/LoUnaA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aDta2x/mpu1WFdb+Wq3zXEoseryMBlCmjBS0XTa03AQi6y8sXEWUCpGdDosqUFVaNcXzji+Cfs++KTlwRqZKBLJp7b4sOJztZVBxlDbLeuVWQuSJRDkylrEgZt0gmU1BAbMK1KI52SF1YF6E1DA5LHnM1UVnIoO/XA1GxX0o9Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iharWL+z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iharWL+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E6AC2BCC4;
	Sat,  9 May 2026 18:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778350210;
	bh=HHHAx0iSIpv2QA8LnoMZ0aYyITjmuApL3hfq/LoUnaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iharWL+zMqpLyGnWv8wmLrbG3ftrBfk79kN1OBRy7Ryz9gaAo5BlCrs9z/WEZffGB
	 WqhZakvV0+uawcQbFoBGixfIp9855VzAwmTFVAj9aBHhudzEQUnA4C8uhnB4gf9wUQ
	 nQSFV0C5dEzdQQLOtTDHMdTaJ2dWHnvayFU2Dz/X6PyL3o4IKh9mNxV/ctBC4jyH+q
	 t+sE/W3XJR2vrAKPC9otHbrfcz8uRh9R/L+c2hhzygkChg8nmQw8ivyR7pzjYtuldr
	 3MJZH50Jl0QyaBNGD3Gc0CKrMXD/pic8/f1AQxXrzQ7RWzlF2bY3310vR9haFg2f0r
	 cPOvuNu1HlK5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: Add Airoha AN7583 SoC and AN7583
 Evaluation Board
Reply-To: sashiko@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260509-airoha-7583-v1-2-e5ad085b258e@kernel.org>
References: <20260509-airoha-7583-v1-2-e5ad085b258e@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 18:10:09 +0000
Message-Id: <20260509181009.E5E6AC2BCC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The memory node specifies a physical size of 8GB, which is a typo =
that will cause a fatal boot panic.
- [Medium] The UART compatible string 'ns16550' will disable hardware FIFOs.
- [Medium] The GIC maintenance interrupt polarity is incorrectly specified =
as active-low.
- [Low] Missing SoC-specific compatible string for the watchdog timer.
- [Low] Unnecessary address and size cells in the GIC node will trigger com=
piler warnings.
- [Low] CPU nodes declare cooling capabilities but lack required frequency =
scaling properties.
--

commit f0ce6065ddf4c46b3e0a82baac122d34553f5f4c
Author: Lorenzo Bianconi <lorenzo@kernel.org>

arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board

Introduce the Airoha AN7583 SoC's dtsi and the Airoha AN7583 Evaluation
Board's dts file.

> diff --git a/arch/arm64/boot/dts/airoha/an7583-evb.dts b/arch/arm64/boot/=
dts/airoha/an7583-evb.dts
> new file mode 100644
> index 0000000000000..76b3d94434f63
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7583-evb.dts

[ ... ]

> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x80000000 0x2 0x00000000>;
> +	};

Because #size-cells =3D <2>, the size array <0x2 0x00000000> sets the upper
32 bits to 0x2, which evaluates to an enormous 8GB memory range.

Is this a typo for 512MB (<0x0 0x20000000>) or 2GB (<0x0 0x80000000>)?

While an identical value exists in the predecessor board's DT, it was
safely masked there by a restrictive linux,usable-memory-range property
in the chosen node.

Since this board lacks that protective limit, will the kernel attempt to
map and access the full 8GB of memory and trigger unbacked physical
memory accesses, resulting in a fatal bus fault during early boot?

> diff --git a/arch/arm64/boot/dts/airoha/an7583.dtsi b/arch/arm64/boot/dts=
/airoha/an7583.dtsi
> new file mode 100644
> index 0000000000000..64b2c7533aff6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7583.dtsi

[ ... ]

> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a53";
> +			reg =3D <0x0>;
> +			enable-method =3D "psci";
> +			next-level-cache =3D <&l2>;
> +			#cooling-cells =3D <2>;
> +		};

Are required frequency scaling properties missing here?

Both CPU nodes define #cooling-cells, but the cpufreq_cooling subsystem
requires properties like clocks or operating-points-v2 to bind. Without
them, is this cooling declaration functionally dead code that generates
validation warnings?

[ ... ]

> +		gic: interrupt-controller@9000000 {
> +			compatible =3D "arm,gic-v3";
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;

Do we need these address and size cells here? According to device tree
compiler rules, specifying them without any children or a ranges property
causes an avoid_unnecessary_addr_size warning.

> +			reg =3D <0x0 0x09000000 0x0 0x20000>,
> +			      <0x0 0x09080000 0x0 0x80000>,
> +			      <0x0 0x09400000 0x0 0x2000>,
> +			      <0x0 0x09500000 0x0 0x2000>,
> +			      <0x0 0x09600000 0x0 0x20000>;
> +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;

Should this maintenance interrupt be active-high?

The ARM Generic Interrupt Controller architecture specification explicitly
mandates that the GIC maintenance interrupt is an active-high,
level-sensitive interrupt (IRQ_TYPE_LEVEL_HIGH).

Incorrect polarity might prevent it from firing properly and break
hardware virtualization support.

> +		};
> +
> +		uart1: serial@1fbf0000 {
> +			compatible =3D "ns16550";

Could this compatible string unintentionally disable hardware FIFOs?

In the Linux 8250 serial driver, ns16550 restricts the fifo_size to 1
byte due to known hardware bugs in the original 16550 chip. Since modern
UART IPs include working FIFOs, should this be declared as ns16550a to
avoid excessive interrupt load?

> +			reg =3D <0x0 0x1fbf0000 0x0 0x30>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <1843200>;
> +		};
> +
> +		watchdog@1fbf0100 {
> +			compatible =3D "airoha,en7581-wdt";

Would it be better to include the SoC-specific compatible string alongside
the fallback?

The dt-binding schema typically dictates using a string like
"airoha,an7583-wdt", "airoha,en7581-wdt" to accurately describe the
specific SoC and ensure any future platform-specific driver quirks can be
cleanly applied.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-airoha-758=
3-v1-0-e5ad085b258e@kernel.org?part=3D2
