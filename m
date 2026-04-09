Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE75D30BF67
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719699; cv=none; b=jYOCjkKCWoOT3ORfJoVRFquG2FUzyRtjJ0VmKnqjAL5yZQU4DbqB4luWz5Jn1o6FeVAgZa7cvBC1QzeNv8Fveaao6oH8ThqXoWCGl851USd6NpCWLKyPCAvTrHk3uoe6Xbav6xRIX1FPfvgThotRTL8zQIUefW+hRMuHjDV+Ft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719699; c=relaxed/simple;
	bh=wGp8rio3+O1LigJl7XJ1TouzLqDBv3x6HJpnWI0/Ifg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVyjzTcHR5DqU48mvaZk5dK+NABau94FeiLxg/GUms5XWmU6mSUrbAxUNF86rG7P/eAmfZTXjTUtgpLyrYNTY3DPaFdxpeJI3dZCqH9Po/M5uZG4QAMdkG6Ed5cj1rtsgUlM8H5foilBTeJBqeiKQtlWV/dm3CpqZ2nrB/h6u90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FloQYJ2c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FloQYJ2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B795C4CEF7;
	Thu,  9 Apr 2026 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719699;
	bh=wGp8rio3+O1LigJl7XJ1TouzLqDBv3x6HJpnWI0/Ifg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FloQYJ2c5SgdHHvn1NdU1cHQSeYqeBynECzDyAjAy4b8FuIRjOkBM61yBgn4oUO3Y
	 knFq4qkQ0jAh/fq362EBXQ0nOWCgPyzxNwhnGsStS1gamecAmV6RB8QW+THelaMIrR
	 brnznsxZ1n1LZxCs48N2fZ/PTWmsEVBN5s1ebZNIKH0tZ2nh3DKN0myG4THk15I32t
	 qQiTrEYS5ZlrcJCzE1FcMDfby2vKslWs0GbHHanWLLXyq2bR4xEQzLOLr2MsaCNPLp
	 cG7Aowyj1makyC//P3Cwy+gQiCeRbeg3An5LVouCxbVbxuLrUnBXkimPNOcWkN2w/Z
	 D8O0+qZIPG7dg==
Date: Thu, 9 Apr 2026 09:28:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global registers
Message-ID: <20260409-beneficial-sociable-tamarin-dbcaeb@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>

On Wed, Apr 08, 2026 at 10:34:35PM +0200, Dawid Glazik wrote:
> Introduce the device-tree bindings for I3C global registers found on
> AST2600 SoCs.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> I wasn't sure if I should add newline at the end of the
> file or not so I took
> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
> as an example.

Answer is: you cannot have patch warnings.

Documentation/devicetree/bindings/i3c does not have patch warning, does
it?

> ---
>  .../i3c/aspeed,ast2600-i3c-global.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> new file mode 100644
> index 000000000000..edecc18796a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c-global.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 I3C Global Registers
> +
> +description: |
> +  The AST2600 SoC provides a shared I3C global register block used by all
> +  I3C controller instances. This block contains per-instance global

Why are you adding syscon to I3C controllers? Only I3C controllers go
to i3c directory.

syscons go soc.



> +  configuration fields, including controller instance ID and SDA pull-up
> +  configuration.
> +  Each I3C controller references this syscon node through the
> +  aspeed,global-regs property.
> +
> +maintainers:
> +  - Dawid Glazik <dawid.glazik@linux.intel.com>
> +
> +allOf:
> +  - $ref: /schemas/mfd/syscon-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: aspeed,ast2600-i3c-global
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +

I do not see any differences against syscon.yaml binding. Why do you
need separate file? Look first how other platforms do it.

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    bus@1e7a0000 {
> +        compatible = "simple-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x1e7a0000 0x8000>;

Drop entire node, not needed.

> +
> +        i3c-global@0 {
> +            compatible = "aspeed,ast2600-i3c-global", "syscon";
> +            reg = <0x0 0x1000>;
> +            resets = <&syscon ASPEED_RESET_I3C_DMA>;
> +        };
> +    };
> +...
> \ No newline at end of file

Patch warning.

Best regards,
Krzysztof

