Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27641372EED;
	Tue, 24 Mar 2026 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344054; cv=none; b=hCtplkRO38FzmKW7IAEuFoQUJ8pB+bexeohZzw0TIl3unJx5c1/bx+I11VR4ag9aSh10Qlsw38EoKuASAh/nM2U+HKuvC13SweNM/L4KZsYu9KVpt5LZ2OuznHgcURY5aE68FdCYQMLS4XxlYdUguyZ6xass77t/eYIzcoNLRfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344054; c=relaxed/simple;
	bh=w5xTSyD9au6QJlfLkBDAjSdfDSrRJuHsjffbvMb4zBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cbidq/rxKBr27vsoM2cKDj9FkHgZhD+tNvzciwuH/3oNF3keDeFZuWcxBDqbZ6CxTmmjfMCaTMcAL8udSUuGK0e6e1dzD7bZP/xILAonaTDs09A9asqKBmVcAUe7nvkWoGkqb9j6CQAjui1L+ir5RxwUxuoG69nROeDjFNf211U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gu61lEDK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gu61lEDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0545AC2BC9E;
	Tue, 24 Mar 2026 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774344053;
	bh=w5xTSyD9au6QJlfLkBDAjSdfDSrRJuHsjffbvMb4zBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gu61lEDKm40+ng6AZkyQBKS7A9c0sXDbweFMh5nr6rZvZKFGJ21wuj2BXaPEtBGU/
	 Jyy7GgOl0QkcpPbczyutOluHQhpxFu5Kdt9J0Z1irM6QKTE6bBVuphxT7OSK8F57ey
	 jdlJb0V7WgCorzL4CmcwKQv55yn9aREJmxaQKF/Re2KgywZWOGNA7cqWDLB/KGCPo8
	 IYC1bc0Q0zycrBiZhthQiH8QJdieLraP2U3IFr1KNB1iWh1nDauJ6hr8lZrqkS1AM+
	 ti/55+iKO8FmQ8VIpqfSw6hrxqTYYzPEMsWiVnQ1VZny5ktdKJzSF9InmfOWyfDa4w
	 RJaa8rGQE2j3A==
Date: Tue, 24 Mar 2026 10:20:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Marie Verdun <verdun@hpe.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12
 board DTS
Message-ID: <20260324-valiant-copperhead-of-psychology-fe202e@quoll>
References: <20260323194223.683487-1-nick.hawkins@hpe.com>
 <20260323194223.683487-4-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323194223.683487-4-nick.hawkins@hpe.com>

On Mon, Mar 23, 2026 at 02:42:23PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add SoC-level DTSI for the HPE GSC ARM64 BMC SoC, covering the CPU
> cluster, GIC v3 interrupt controller, ARM64 generic timer, and console
> UART.
> 
> Add the board-level DTS for the HPE DL340 Gen12, which includes
> gsc.dtsi and adds memory and chosen nodes.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm64/boot/dts/hpe/Makefile           |   2 +
>  arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts |  18 ++++
>  arch/arm64/boot/dts/hpe/gsc.dtsi           | 106 +++++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/hpe/Makefile
>  create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
>  create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi
> 
> diff --git a/arch/arm64/boot/dts/hpe/Makefile b/arch/arm64/boot/dts/hpe/Makefile
> new file mode 100644
> index 000000000000..804f7c54e9b6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +dtb-$(CONFIG_ARCH_HPE_GSC) += gsc-dl340gen12.dtb
> diff --git a/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
> new file mode 100644
> index 000000000000..42cfeac99029
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/dts-v1/;
> +
> +#include "gsc.dtsi"
> +
> +/ {
> +	compatible = "hpe,gsc-dl340gen12", "hpe,gsc";
> +	model = "HPE ProLiant DL340 Gen12";
> +
> +	chosen {
> +		stdout-path = &uartc;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x00000000 0x40000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/hpe/gsc.dtsi b/arch/arm64/boot/dts/hpe/gsc.dtsi
> new file mode 100644
> index 000000000000..3433c4a18512
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/gsc.dtsi
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for HPE GSC
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0xa0008048>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <1>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0xa0008048>;
> +		};
> +	};
> +
> +	clocks {

Drop node

> +		osc: osc {

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-output-names = "osc";
> +			clock-frequency = <33333333>;
> +		};
> +	};
> +
> +	timer {

Any particular reason not to follow DTS coding style for ordering nodes?

> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gic>;
> +	};
> +
> +	ahb: ahb@80000000 {

Convention is rather soc@

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x80000000 0x80000000>;
> +		ranges;
> +
> +		gic: gic@ce000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			redistributor-stride = <0x0 0x20000>;
> +			#redistributor-regions = <1>;
> +			reg = <0xce000000 0x10000>,
> +			      <0xce060000 0x40000>,
> +			      <0xce200000 0x40000>;

Same question - any reason to deviate from DTS coding style?

> +		};
> +
> +		uartc: serial@c00000f0 {
> +			compatible = "ns16550a";
> +			reg = <0xc00000f0 0x8>;
> +			interrupts = <0 19 4>;

Use proper defines.

Best regards,
Krzysztof

