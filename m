Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2FD31195B;
	Thu,  2 Jul 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977228; cv=none; b=EvR/XNy/SMdZAqB4xqDEZGPXxlYpQgpgASBCFpN1dHIYxV0GA8kRip+hOhMz1GTGLeKWyiOhHQJLl3gLWkVbMotx5aDP8l3YGCDx9SGvnVaNw1ZhTna9DpEBiAgIBiEdO+yq0sPgxrvhiQvZ4+AY7KqMCjBojanQA2QErTTLwwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977228; c=relaxed/simple;
	bh=/ddFEgBhKVE3ZJV7wnlZcGr/MJQ/mN66AvoVinzWMqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlDYOr+kOm8Po9/HKqM1W+KwoRSQLIN8S1Vkhc/ZOoPuhJHrBLeHxLcVmxGh++tFaNTyOSsgSZIAZcVy08dRWfir/jLMlZaveiqjZPJ7RuBlTvaiVI55aaJP1gqBz6hBl8U/aQwIScvUrgDeCp+lfneh1NOUlO6mdtjtfFTBf8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eA4bgR29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eA4bgR29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DA41F000E9;
	Thu,  2 Jul 2026 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782977226;
	bh=6cwdGMgRTKAHuwZObqOVV5ZdMxDDGkVMKlAcxWc019Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eA4bgR29LULQbOaPtyCQxo7D+Jg7aJbzl4APm39IiLUrhf3JgDm9o7DB2OJDNcpS7
	 3jmM2kvV9GYVjTt2/RcR1isk1aaB8iijslybj6d2K9f5U5AImGbkAjTAkd8mg8P32m
	 HzACyyfAxgzINAZPh4DJHZZhM99rBRxakpvysOGOn1SUejlqBVLUdF2dRPgnFyflyd
	 1q4KWKoFRRvy21A6OBa/fo4iBtlENqBF5qXUMkRutiRGVNSEwV60g9tKKbwOOlCesG
	 5oxtoFi/nAXJXwcRkswBKOYOqe54gfLtznYDvs06VdA3r1K3qNDtXoGL/0Mi64MKiw
	 pVs1BWt+ohS0g==
Date: Thu, 2 Jul 2026 09:27:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, simona.toaca@nxp.com, 
	goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH 2/2] dt-bindings: arm: omap: Convert IVA to DT schema
Message-ID: <20260702-comical-accelerated-labrador-a06ad7@quoll>
References: <20260630132857.3007019-1-egbostina@gmail.com>
 <20260630132857.3007019-3-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630132857.3007019-3-egbostina@gmail.com>

On Tue, Jun 30, 2026 at 01:28:56PM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments IVA bindings to DT schema.
> 
> During the conversion, several updates were made to reflect actual hardware
> usage and resolve dtbs_check warnings:
>  - Added a dsp sub node that references the new ti,omap3-c64.yaml
> schema to support OMAP3 configurations where the DSP is defined as a
> child of the IVA node.
>  - Updated the compatible property to allow ti,ivahd as a standalone
> string.

Heh? Old binding already said that, so you did not implement such
change. Instead you invented ti,iva without a reason...

>  - ti,hwmods has been made optional.

Why?

>  - Added a second example to demonstrate the OMAP3 configuration
> with the nested DSP node.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../devicetree/bindings/arm/omap/iva.txt      | 19 -------
>  .../devicetree/bindings/arm/omap/ti,iva.yaml  | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/omap/iva.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,iva.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/omap/iva.txt b/Documentation/devicetree/bindings/arm/omap/iva.txt
> deleted file mode 100644
> index 6d6295171358..000000000000
> --- a/Documentation/devicetree/bindings/arm/omap/iva.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -* TI - IVA (Imaging and Video Accelerator) subsystem
> -
> -The IVA contain various audio, video or imaging HW accelerator
> -depending of the version.
> -
> -Required properties:
> -- compatible : Should be:
> -  - "ti,ivahd" for OMAP4
> -  - "ti,iva2.2" for OMAP3
> -  - "ti,iva2.1" for OMAP2430
> -  - "ti,iva1" for OMAP2420
> -- ti,hwmods: "iva"
> -
> -Examples:
> -
> -iva {
> -    compatible = "ti,ivahd", "ti,iva";
> -    ti,hwmods = "iva";
> -};
> diff --git a/Documentation/devicetree/bindings/arm/omap/ti,iva.yaml b/Documentation/devicetree/bindings/arm/omap/ti,iva.yaml
> new file mode 100644
> index 000000000000..771415196235
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/omap/ti,iva.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/omap/ti,iva.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments IVA (Imaging and Video Accelerator)
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: ti,ivahd
> +          - const: ti,iva

From where did you get such list (ti,iva fallback)? ti,iva is completely
undocumented and completely unused (not existing), so why it did come up
with it?

> +      - enum:
> +          - ti,iva1
> +          - ti,iva2.1
> +          - ti,iva2.2
> +          - ti,ivahd

This is wrong. ti,ivahd cannot be both: compatible and not compatible
with ti,iva

> +
> +  ti,hwmods:
> +    description: Name of the hwmod associated to the iva
> +    $ref: /schemas/types.yaml#/definitions/string

And here it is a string. Confusing.

> +    const: iva
> +
> +  dsp:
> +    type: object
> +    $ref: /schemas/arm/omap/ti,omap3-c64.yaml#

Missing unevaluatedProperties: false.

Actually the other binding could be squashed/folded into this place...
but split is fine as well.

> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    iva {
> +        compatible = "ti,iva2.2";
> +        ti,hwmods = "iva";
> +        dsp {
> +            compatible = "ti,omap3-c64";
> +        };
> +    };
> +  - |
> +    iva {
> +        compatible = "ti,ivahd", "ti,iva";
> +        ti,hwmods = "iva";
> +    };
> -- 
> 2.43.0
> 
