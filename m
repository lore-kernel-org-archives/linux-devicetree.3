Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1953CB8EB
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491594; cv=none; b=oCfPCbe7Kjqmu8KUFuW8XJckE7+9Va8Ye+gm6EiDwAAidS3FiJZ5K/YHgIKoN5rOboJqBr7Jhyj1sv+lqn4vxojmLecTHholEOGbXymSxQkM9SBU68vNHxmucgXjqyHXcCv9TduaJr6LZyr1xQURDT6J+5jMKmGEOf4TPqud2mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491594; c=relaxed/simple;
	bh=B4Z0Vdacwd18nCziCKE/ZQ2lWcHh4havG56bUGLXEGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwhgdtowTT16vtgCqY2mSUOwPuQFCPE5n8T4fXscLKRs56RTzR0moMO4AKk8Bpc0LMPVeVl+FtOYnaU6UOMJ3oQ+oZ25s8+gsH5Z2WKar19+MKgxEqzl1Uk57f1k3FR8ku25tC0ZD6KqT053hYVej3f40fhd8U8n3DT9QuYYgFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+FI3UbY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+FI3UbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C71B1F000E9;
	Fri, 31 Jul 2026 09:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491586;
	bh=b1HzVAbJoeGZlBlvW7h/X2/UPrYq5XsuQruZrSL0lMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J+FI3UbYJ9qsSezKemJ/EmZ5jdP1F9hy5XPmx/ym4nOEfOcRscg6p4T3ch8bIk21+
	 0t7XLv5+sWchomWh3uw5iDDkEjCbvunU8r74bpnFyh+4Pt5ppF6vvH8yq9yzu2u+Ex
	 O5D3UWbNJKpY6GAUodbTvcF9PSDXiqpCRDlX/v03GS4h/q1u/It36ySAa2QvGUWLFv
	 1Zx0mBsaIJwhHjRQnDKs+sN8VVOIuLC3kl7D9Q4T+r7nINhBp8wLa9BWksg90Km+ka
	 mgFNxDWLs+QjLZcVEHd/yikfttdldCfnvmcluXOhpqTG6m4jM6KNywf6cSSx9PqXjo
	 bkUfthOdcIBpg==
Date: Fri, 31 Jul 2026 11:53:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add GlandaGPU binding
Message-ID: <20260731-petrel-of-fascinating-finesse-cd10ae@quoll>
References: <20260730173643.256052-1-kieweg.leander@gmail.com>
 <20260730173643.256052-2-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730173643.256052-2-kieweg.leander@gmail.com>

On Thu, Jul 30, 2026 at 07:36:41PM +0200, Leander Kieweg wrote:
> Add Device Tree binding documentation for GlandaGPU, a custom
> FPGA-based 2D display controller.
> 
> For hardware designs and RTL sources, see:
> https://github.com/stiangglanda/GlandaGPU
> 
> Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
> ---
>  .../bindings/display/glanda,gpu.yaml          | 55 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/glanda,gpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/glanda,gpu.yaml b/Documentation/devicetree/bindings/display/glanda,gpu.yaml
> new file mode 100644
> index 000000000..988a30946
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/glanda,gpu.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/glanda,gpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GlandaGPU 2D Hardware Accelerated Display Controller
> +
> +maintainers:
> +  - Leander Kieweg <kieweg.leander@gmail.com>
> +
> +description: |
> +  GlandaGPU is a custom FPGA soft-IP core providing a simple
> +  2D hardware-accelerated drawing engine with a VGA-compatible
> +  display output. The register window covers a combined VRAM + MMIO
> +  region, with MMIO registers at a fixed offset within it.
> +
> +  For hardware designs and RTL sources, see:
> +  https://github.com/stiangglanda/GlandaGPU
> +
> +properties:
> +  compatible:
> +    const: glanda,gpu-1.0

What does this 1.0 correspond to? There is no such tag on linked Github.

> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Combined VRAM + MMIO register window (VRAM at offset 0,
> +      MMIO registers at offset 0x00200000 within this range).
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: Bus and pixel clock provided to the FPGA IP.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu@c0000000 {
> +        compatible = "glanda,gpu-1.0";
> +        reg = <0xc0000000 0x1000000>;
> +        interrupt-parent = <&intc>;
> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&osc1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index b1af9deac..b8b7a5401 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -666,6 +666,8 @@ patternProperties:
>      description: Giantplus Technology Co., Ltd.
>    "^gira,.*":
>      description: Gira Giersiepen GmbH & Co. KG
> +  "^glanda,.*":
> +    description: GlandaGPU

Vendor prefixes are per actual vendor, not product.

I have doubts this is needed in the first place. As a pure FPGA design,
this cannot work alone and you cannot get it alone (at least yet,
happily to see resources proving me wrong). Thus it will be always
customized per final board design, thus that final compatible is what
matters.

Best regards,
Krzysztof

