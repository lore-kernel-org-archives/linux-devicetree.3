Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA544C81
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335030; cv=none; b=Ga0cYkPqVVR8UP4+Bmo/RQ58+qQd9UblyiMvL07csoUPkczAFnhRQ1JPh+Y5HL5w84GpQd0gqL6GqP06GuGlTAnCjKma+MWP+pkrXZRS6/jHsUymTVbfeWD6s7XygAYx/1u1LC1x/dt5flk7iqy7Tbly7A31VVXhHA3gXX+kO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335030; c=relaxed/simple;
	bh=BOxCbahYeMXBie3ntQ0u/5h11UMYD4HNYtTnrFGC5LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S65w5o/b/arMo5cGfls9U6Et0MRqHvbUJeizQ9KTKezKN3eO+dNvEZOhwej+SKEjpJ4N7kRwSAxyJiR3djHHT+vncPRrgOTq9HsvJxWahqyiwDW9PxPE8tuAmxG+jGN0EDhFtsNfCHttlCNW4v7gvs0LQ/UxjZRwtMqKpvWRpcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MHzNVtue; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MHzNVtue"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 607EF3297
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 03:50:23 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C25A3F85F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783335027; bh=BOxCbahYeMXBie3ntQ0u/5h11UMYD4HNYtTnrFGC5LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHzNVtuePtsCHpAdQ8eKdAnoX6VSdOaYAFrGOw1zK9vI8tU0ML6PO9G6QSg4nETd9
	 4ImYBc7ZQt3NvsYklUp4CWu/rtSn5WuVOWLR5AcNOEX7RENSYNt3dYu8/FKIkUgR8s
	 8O44tXdi5UtfpMVw4CWI08I9LY5gvVrMvrpvu2vI=
Date: Mon, 6 Jul 2026 11:50:17 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: arm: Correct indentation
Message-ID: <akuIad1FdhC9rTqE@e142607>
References: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>

On Mon, Jul 06, 2026 at 12:19:43PM +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---
>  arch/arm/boot/dts/arm/arm-realview-eb.dtsi     | 2 +-
>  arch/arm/boot/dts/arm/arm-realview-pb1176.dts  | 2 +-
>  arch/arm/boot/dts/arm/arm-realview-pb11mp.dts  | 6 +++---
>  arch/arm/boot/dts/arm/arm-realview-pbx.dtsi    | 6 +++---
>  arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> index ae370d4eb9d8..f90e28ee4cb9 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> +++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> @@ -51,7 +51,7 @@ vmmc: regulator-vmmc {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -        };
> +	};
>  
>  	xtal24mhz: mclk: kmiclk: sspclk: uartclk: wdogclk: clock-24000000 {
>  		#clock-cells = <0>;
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> index a75d8b107fe1..1cd095496832 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> +++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> @@ -53,7 +53,7 @@ vmmc: regulator-vmmc {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -        };
> +	};
>  
>  	veth: regulator-veth {
>  		compatible = "regulator-fixed";
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> index 59c78def83f2..635b09030f60 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> +++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> @@ -153,7 +153,7 @@ vmmc: regulator-vmmc {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -        };
> +	};
>  
>  	veth: regulator-veth {
>  		compatible = "regulator-fixed";
> @@ -544,7 +544,7 @@ timer01: timer@10011000 {
>  			interrupts = <0 1 IRQ_TYPE_LEVEL_HIGH>;
>  			arm,sp804-has-irq = <1>;
>  			clocks = <&sp810_syscon 0>,
> -			         <&sp810_syscon 1>,
> +				 <&sp810_syscon 1>,
>  				 <&pclk>;
>  			clock-names = "timer0clk",
>  				    "timer1clk",
> @@ -558,7 +558,7 @@ timer23: timer@10012000 {
>  			interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>;
>  			arm,sp804-has-irq = <1>;
>  			clocks = <&sp810_syscon 2>,
> -			         <&sp810_syscon 3>,
> +				 <&sp810_syscon 3>,
>  				 <&pclk>;
>  			clock-names = "timer0clk",
>  				    "timer1clk",
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> index 0d3d96ffa6e6..366c8baefe8c 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> +++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> @@ -52,7 +52,7 @@ vmmc: regulator-vmmc {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -        };
> +	};
>  
>  	veth: regulator-veth {
>  		compatible = "regulator-fixed";
> @@ -373,7 +373,7 @@ timer01: timer@10011000 {
>  			compatible = "arm,sp804", "arm,primecell";
>  			reg = <0x10011000 0x1000>;
>  			clocks = <&sp810_syscon0 0>,
> -			         <&sp810_syscon0 1>,
> +				 <&sp810_syscon0 1>,
>  				 <&pclk>;
>  			clock-names = "timerclk0",
>  				    "timerclk1",
> @@ -384,7 +384,7 @@ timer23: timer@10012000 {
>  			compatible = "arm,sp804", "arm,primecell";
>  			reg = <0x10012000 0x1000>;
>  			clocks = <&sp810_syscon0 2>,
> -			         <&sp810_syscon0 3>,
> +				 <&sp810_syscon0 3>,
>  				 <&pclk>;
>  			clock-names = "timerclk2",
>  				    "timerclk3",
> diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
> index 6ef23c53d2d8..64f87e6c12bf 100644
> --- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
> +++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
> @@ -209,11 +209,11 @@ dma@7ff00000 {
>  		clock-names = "apb_pclk";
>  	};
>  
> -        scc@7fff0000 {
> +	scc@7fff0000 {
>  		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
>  		reg = <0 0x7fff0000 0 0x1000>;
>  		interrupts = <0 95 4>;
> -        };
> +	};
>  
>  	timer {
>  		compatible = "arm,armv7-timer";
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
