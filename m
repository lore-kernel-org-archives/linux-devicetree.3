Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403982877E8;
	Mon,  3 Aug 2026 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791224; cv=none; b=cNV5IeoytJNwhP14JN3eoCnuiaLs3nfopjCkVciFuD3mvbwnmF+AAAKKCP/dTiuukh+RzPXTgn4XXDr22dQClnDb3ty0vbiBCHhnVxwvBIlT/jOcKrYSNxgGpbR8g6CwfArsR3M3ZC5H/IajRpkXe17K6uLO2eG+eEFoQm2YYyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791224; c=relaxed/simple;
	bh=X8ItND1kBfkkjAmOaH8CYwKkFTtL+n8wGWqNdOh+100=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HenHWeUU1VMOPbgWKRuuJWprKR4UGjsm2kQ1JVFj3XwV/j582QTgEObZr/6Nk9c2qQPZdwyVpyL3hJHhoGDRgPWfmSpLmAW/gthqHoKH8ilrfIcfY+9btzlSe14vFJC/zxLlQ3rGZY0QyCmvM6KsRC2mBU4SBrDA6vyH8Caznow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPpcfTrF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPpcfTrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0251F000E9;
	Mon,  3 Aug 2026 21:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785791223;
	bh=B5vfmwdKagLC8EVjkml7NKqwBmlVxsiB1KjQ3iqp5TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JPpcfTrFoYK+KsyQptE+yz9dMh9sgYFlStPo0/3UrZH+iiDn2FCICRGPMqC7tPAOL
	 j3z8+ChphDfYQ+PzqwgmvvWQcB6iHvXz579G4BsetNf9gR43qL4KmNc2OZiPurflHM
	 EfUNBX/48fcaoB/CSCfDdsNCf73DxE1mHAgk5Ypiq9IDJSqSvke77lVMOw6hGnn2qx
	 yrwl/Q8T0pLbob9tfdALl2R1QvhuMuV+tVYoJyW3evFYZkmKyQtHt2ItpbDMvkJ/aE
	 MFxGibiGzUVIxavAZ7Sus2qzztUnp3LQIN+60rqkf/6H1YxiFXjCuqppPpOuACfnpj
	 hqDCEzDJsPdzw==
Date: Mon, 3 Aug 2026 16:07:00 -0500
From: Rob Herring <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: Re: [PATCH v2] dt-bindings: arm: omap: Convert L4 interconnect to DT
 schema
Message-ID: <20260803210700.GA473113-robh@kernel.org>
References: <20260723100540.628609-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723100540.628609-1-egbostina@gmail.com>

On Thu, Jul 23, 2026 at 10:05:40AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments OMAP L4 interconnect bus bindings
> to DT schema.
> 
> During the conversion, several updates were made:
> - Defined the compatible property as an array to require
>   the TI-specific string first, followed by either 'simple-bus' or
>   'simple-pm-bus'.
> - Added a 'select' block to ensure this schema is only
>   applied to TI-specific nodes, preventing duplicate
>   schema warnings against the core simple-pm-bus.yaml.
> - Added the L4 compatible strings used by the boards but missing from
>   the text binding, and corrected the 'ti,am3-l4-wkup' typo to
>   'ti,am33xx-l4-wkup'.
> - Made 'reg' and 'reg-names' optional.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v2:
> - Renamed the example bus node so it matches the simple-bus schema,
>   fixing the 'make dt_binding_check' nodename error.
> - Added the L4 compatible strings used by the boards but missing from
>   the text binding, and corrected the 'ti,am3-l4-wkup' typo to
>   'ti,am33xx-l4-wkup'.
> 
> Link to v1:
> https://lore.kernel.org/all/20260722171840.299303-1-egbostina@gmail.com/
> 
>  .../devicetree/bindings/arm/omap/l4.txt       |  37 ------
>  .../bindings/arm/omap/ti,omap-l4.yaml         | 121 ++++++++++++++++++
>  2 files changed, 121 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/omap/l4.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/omap/l4.txt b/Documentation/devicetree/bindings/arm/omap/l4.txt
> deleted file mode 100644
> index 6816adcdc15f..000000000000
> --- a/Documentation/devicetree/bindings/arm/omap/l4.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -L4 interconnect bindings
> -
> -These bindings describe the OMAP SoCs L4 interconnect bus.
> -
> -Required properties:
> -- compatible : Should be "ti,omap2-l4" for OMAP2 family l4 core bus
> -	       Should be "ti,omap2-l4-wkup" for OMAP2 family l4 wkup bus
> -	       Should be "ti,omap3-l4-core" for OMAP3 family l4 core bus
> -	       Should be "ti,omap4-l4-cfg" for OMAP4 family l4 cfg bus
> -	       Should be "ti,omap4-l4-per" for OMAP4 family l4 per bus
> -	       Should be "ti,omap4-l4-wkup" for OMAP4 family l4 wkup bus
> -	       Should be "ti,omap5-l4-cfg" for OMAP5 family l4 cfg bus
> -	       Should be "ti,omap5-l4-wkup" for OMAP5 family l4 wkup bus
> -	       Should be "ti,dra7-l4-cfg" for DRA7 family l4 cfg bus
> -	       Should be "ti,dra7-l4-wkup" for DRA7 family l4 wkup bus
> -	       Should be "ti,am3-l4-wkup" for AM33xx family l4 wkup bus
> -	       Should be "ti,am4-l4-wkup" for AM43xx family l4 wkup bus
> -- ranges : contains the IO map range for the bus
> -- reg : registers link agent and interconnect agent and access protection
> -- reg-names : "la" for link agent, "ia0" to "ia3" for one to three
> -              interconnect agent instances, "ap" for access if it exists
> -
> -Examples:
> -
> -l4: interconnect@48000000 {
> -	compatible "ti,omap4-l4-per", "simple-bus";
> -	reg = <0x48000000 0x800>,
> -	      <0x48000800 0x800>,
> -	      <0x48001000 0x400>,
> -	      <0x48001400 0x400>,
> -	      <0x48001800 0x400>,
> -	      <0x48001c00 0x400>;
> -	reg-names = "ap", "la", "ia0", "ia1", "ia2", "ia3";
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges = <0 0x48000000 0x100000>;
> -};
> diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
> new file mode 100644
> index 000000000000..de3f5f9da3fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/omap/ti,omap-l4.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI OMAP SoCs L4 interconnect bus
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +description:
> +  These bindings describe the OMAP SoCs L4 interconnect bus.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - ti,omap2-l4
> +          - ti,omap2-l4-wkup
> +          - ti,omap3-l4-core
> +          - ti,omap4-l4-abe
> +          - ti,omap4-l4-cfg
> +          - ti,omap4-l4-per
> +          - ti,omap4-l4-wkup
> +          - ti,omap5-l4-abe
> +          - ti,omap5-l4-cfg
> +          - ti,omap5-l4-per
> +          - ti,omap5-l4-wkup
> +          - ti,dra7-l4-cfg
> +          - ti,dra7-l4-per1
> +          - ti,dra7-l4-per2
> +          - ti,dra7-l4-per3
> +          - ti,dra7-l4-wkup
> +          - ti,am33xx-l4-fast
> +          - ti,am33xx-l4-fw
> +          - ti,am33xx-l4-mpuss
> +          - ti,am33xx-l4-per
> +          - ti,am33xx-l4-wkup
> +          - ti,am4-l4-fast
> +          - ti,am4-l4-per
> +          - ti,am4-l4-wkup
> +          - ti,dm814-l4hs
> +          - ti,dm814-l4ls
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - ti,omap2-l4
> +          - ti,omap2-l4-wkup
> +          - ti,omap3-l4-core
> +          - ti,omap4-l4-abe
> +          - ti,omap4-l4-cfg
> +          - ti,omap4-l4-per
> +          - ti,omap4-l4-wkup
> +          - ti,omap5-l4-abe
> +          - ti,omap5-l4-cfg
> +          - ti,omap5-l4-per
> +          - ti,omap5-l4-wkup
> +          - ti,dra7-l4-cfg
> +          - ti,dra7-l4-per1
> +          - ti,dra7-l4-per2
> +          - ti,dra7-l4-per3
> +          - ti,dra7-l4-wkup
> +          - ti,am33xx-l4-fast
> +          - ti,am33xx-l4-fw
> +          - ti,am33xx-l4-mpuss
> +          - ti,am33xx-l4-per
> +          - ti,am33xx-l4-wkup
> +          - ti,am4-l4-fast
> +          - ti,am4-l4-per
> +          - ti,am4-l4-wkup
> +          - ti,dm814-l4hs
> +          - ti,dm814-l4ls
> +      - enum:
> +          - simple-bus
> +          - simple-pm-bus
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 6
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 6
> +    items:
> +      enum:
> +        - ap
> +        - la
> +        - ia0
> +        - ia1
> +        - ia2
> +        - ia3
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - ranges
> +
> +additionalProperties: true

Restrict anything else to nodes:

additionalProperties:
  type: object

You'll need to define #address-cells and #size-cells.


> +
> +examples:
> +  - |
> +    bus@48000000 {
> +        compatible = "ti,omap4-l4-per", "simple-bus";
> +        reg = <0x48000000 0x800>,
> +              <0x48000800 0x800>,
> +              <0x48001000 0x400>,
> +              <0x48001400 0x400>,
> +              <0x48001800 0x400>,
> +              <0x48001c00 0x400>;
> +        reg-names = "ap", "la", "ia0", "ia1", "ia2", "ia3";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x48000000 0x100000>;
> +    };
> -- 
> 2.43.0
> 
> 
