Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F22E3ABD8E;
	Tue,  7 Jul 2026 06:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407534; cv=none; b=kH5EAc8BEO909+endG/nGg3P74jnuh2ODzZJTn5Pp1xdlqHBdr6yHpg2wuZNJr2+811MAVUvs+E6IdR3Y5UvGed2fcfNlbGmqkK1pMkzVopZt/PQAldJvQWEK2TkCHifYORU3UfyOKJ3UqOUwSdAtiFxXMA8AcGTRs5A75wOc0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407534; c=relaxed/simple;
	bh=CpseX0V3P8kSiymIYvNGY8y3IfLMDM/Cm4OCfrQ3V2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CV0MNINCFQfEnMRRq9c1hK7doDRgIpfCYFfQVqlmRKtYQpzFSX6TOFDkFgFzRaJPnqT6VM/tYkpitAo+PLOR8xqOQCNa4CAURgB4Fh2tqZPZl08YA/QLbWQevZqzTlJrrkBcCSM21QLhDMmMVhSFf60sUsUpM3W9CbbbBvi6KFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VX2MP6MI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VX2MP6MI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8021F000E9;
	Tue,  7 Jul 2026 06:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783407533;
	bh=oECIqmbpPuUnxJXuxcvDW0bVvqzjgpMBsSKXYPT0Sb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VX2MP6MItrVnTTtaRG7rzMhBWmfb0oUEM1Hv35dAe27iXY0QdLGeB5kzbK4Ixb6JY
	 /iQnv154TY6FOc9LMMeCakmx3OJ7g+BsAt+/u0vAaOwBJOMnFtz6YohUzGRFVVM92I
	 ILStdV89OycXyQu4hxEy86RhGKT4eLJdEfZpxqwtU/ba1nh6ZDZpeE4Dssb+/gdJuH
	 2sHqhlR7oLuoK1s7rRtrians/q7H8mdW4JrUKDJTDFQtShIm0k9LgZHO2ihud3cazw
	 9+VB2F3L06zkkFJLSt/NrQ0JsegSNzYe6kDfqhxK+FI05PXI0ONKkvKXE00Cz7fIOS
	 Co6LRIxrO/axw==
Date: Tue, 7 Jul 2026 08:58:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: axiado: Add initial support for
 AX3005 SoC and eval board
Message-ID: <20260707-quixotic-cobalt-guillemot-6b1aee@quoll>
References: <20260705-upstream-axiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com>
 <20260705-upstream-axiado-ax3005-upstream-v2-2-2dfbd1448f81@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-upstream-axiado-ax3005-upstream-v2-2-2dfbd1448f81@axiado.com>

On Sun, Jul 05, 2026 at 11:39:06PM -0700, Swark Yang wrote:
> +		cpu3: cpu@3 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <0x0 0x3>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x80002fa0>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		l2: l2-cache0 {

l2-cache

> +			compatible = "cache";
> +			cache-unified;
> +			cache-size = <0x100000>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-level = <2>;
> +		};
> +	};
> +
> +	timer {

Odd node sorting.

> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic500>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +

...

> +			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
> +			reg = <0x0 0x33080000 0x0 0x100>;
> +			clocks = <&pclk>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		gpio2: gpio-controller@33100000 {
> +			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
> +			reg = <0x0 0x33100000 0x0 0x100>;
> +			clocks = <&pclk>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		gpio3: gpio-controller@33180000 {
> +			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
> +			reg = <0x0 0x33180000 0x0 0x100>;
> +			clocks = <&pclk>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		gpio4: gpio-controller@33200000 {
> +			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";

Here...

> +		spi6: spi@333a0000 {
> +			compatible = "snps,dwc-ssi-1.01a";
> +			reg = <0x0 0x333a0000 0x0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&spiclk>;
> +			num-cs = <1>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart0: serial@33020000 {
> +			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";

and here: wrong compatible, this is ax3005 SoC, no?

Best regards,
Krzysztof
