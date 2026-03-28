Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0023018787A;
	Sat, 28 Mar 2026 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774706623; cv=none; b=SulQ11dy3mhHXRePT0DA/akZVKS2NgaEdUPkdF/TU/m5FQiS2o1PNZmxkYl0De2rEnisMGswD3UVudE3lEbngtvn7xjhSWw8VJpk/TELgQHIP3ML6L8AQ237Dgl5wH7Tu1pnwooAoebq+SwIjXWO2ecdoVXlEmgtcYefejNH1kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774706623; c=relaxed/simple;
	bh=LP2OMDqjdBj9ybs8hsbQu15Xbc2oFeNlIx4PTLnzC/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRdMySSLhd74Dzomi0eNTawgYyrUDZTtI3Q+I/ILRTG3qv8rc2/D3XOgSlKt4Wtw//vW3X4l0Txe5KGP44o75lHL1pHTdKGBI2DDhDNI6vpdlvVl66kDYGbfiHSMaDJ/LiOqMFiLM5JHWky/hottiUO1ydfvNxNDkYiv1nJ4xKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYI0PYmy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYI0PYmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD1CC4CEF7;
	Sat, 28 Mar 2026 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774706622;
	bh=LP2OMDqjdBj9ybs8hsbQu15Xbc2oFeNlIx4PTLnzC/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYI0PYmyurfc1IJg+PeyuF772oAYK0fPF0HmzDyDN4ccKpQfdc/jaJsiGLRWZVvwp
	 3EFf5kasIic9ndyGhY4NkNuyM0/XC3QxgMO9BxSugLSndUeUVIeDZeqP+flBqp8hh5
	 SiG7fYol9UXCF//oZwuK00xIA/nuTDJl/SMFqhR3o2vAQurUcagZ1ZNNC6KmKyvBxM
	 xI6cUzbaKs5zhKtOAFbpkAz0I8DfeTMOmpVgt/uLn2KjwQ9TntUDlkDFF/XbBRsNT0
	 XfIUlYrWBVSzFvVMgXIf6LnQrueurRVMOtChXezhUzSFDYrUThWrRlAk6mKvLWTVNy
	 RrrCGv8jVrtYA==
Date: Sat, 28 Mar 2026 15:03:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12
 board DTS
Message-ID: <20260328-translucent-scarlet-skunk-0e09cb@quoll>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
 <20260327174445.3275835-4-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327174445.3275835-4-nick.hawkins@hpe.com>

On Fri, Mar 27, 2026 at 12:44:45PM -0500, nick.hawkins@hpe.com wrote:
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

You miss fourth commit adding it to defconfig.

>  arch/arm64/boot/dts/hpe/Makefile           |   2 +
>  arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts |  18 ++++
>  arch/arm64/boot/dts/hpe/gsc.dtsi           | 104 +++++++++++++++++++++
>  3 files changed, 124 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/hpe/Makefile
>  create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
>  create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi
> 
> diff --git a/arch/arm64/boot/dts/hpe/Makefile b/arch/arm64/boot/dts/hpe/Makefile
> new file mode 100644
> index 000000000000..6b547b8a8154
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +dtb-$(CONFIG_ARCH_HPE) += gsc-dl340gen12.dtb
> diff --git a/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
> new file mode 100644
> index 000000000000..42cfeac99029
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Keep consistent SPDX, so I guess "GPL-2.0" here.

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
> index 000000000000..087688b089e9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/gsc.dtsi
> @@ -0,0 +1,104 @@
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
> +	osc: clock-33333333 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "osc";
> +		clock-frequency = <33333333>;
> +	};
> +
> +	timer {

Same comment as last time. I see you ignored few more comments and never
responded to them, so I finish the review here.

Best regards,
Krzysztof

