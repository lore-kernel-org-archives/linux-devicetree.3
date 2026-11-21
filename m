Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258772;
	b=ZN3N73DntRZ8p2B4d1lXdxyJ6An0jc9eZJGlGxRY/khfe0GcQ5Z4VinBdlz3vqM8DGI2
	 08ECXqMfIvcosozJT1xMIw/R+7D1gc8MqRy/9k9yQQfg71Ftc4XB2qHLKlGMu0RUWLdHp
	 W8CCf47mFhDk0eyBUBO4U1yyzTeqSdRL14GKUppJ8L57zBwCaMxwPVf9+4EYCcb4w6xNK
	 OW33IRR9xQoVJ255vvYZclkiDXN2jj7bQ+IBLfLJpXkQed9MqwgsQTeBDQEwGVBPNvlsT
	 3uh2FN1VzBVYhdkKyECXedggHmLqnEy7VIM4tuSpNS/mOr9w8v5Lr7/CW7uWgpkkXDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258772;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qY2Rg3otMYSq9Uq3AvnnixdrXC9ooPIQhGOKyhwLA9Y=;
	b=aq9YNAqKVhnhsIQkaatsZ29rybyn5a3JZZVReeRH16LI3HDeI7RcsYkODynF25ngRKND
	 ugKqv6tB6xRTsYSEGpShQ7vxTmK2+IdI7uVLZS5YoGoBBDZY5FK6NjPed7xvebTECddTY
	 lkO3rYv6v+I5KBPT3JLrsLxSGCJ2vlw5/vgJFqCjLT5HU7WqZN9+3kHMgCmycvsP8XPgg
	 Tw3LSqkYTPs4Pz/baFgbaQkYcznYHyJeRr8bFApgKYM8TEa8domM7KXRrZOPH5LvbWOSb
	 8DOdvqplx55VpSwfLiM5zzXVITUcsCiUIJmUgUpxh3QPgk3kMmyaZrsk3eMOU4pJicQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fO9z974C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D65606A320;
	Sat, 21 Nov 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fO9z974C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B191F000C4;
	Sat, 21 Nov 2026 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795258771;
	bh=qY2Rg3otMYSq9Uq3AvnnixdrXC9ooPIQhGOKyhwLA9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fO9z974ChRoMI7+DQ0aYKZReN3YFJydIrKPj77+nuOOTgV9bQVea80pJLx/vL37Eo
	 rQ+HRcE6u7Sk/AbholYmlukSFrriwgzdG3audpmXPOlC3+XUqbWidc/hgEopu9Shg9
	 OHcV8cQZWVcdbFku8+t7EanSbfaD78UljRkyeL4tumnw9/WC9TgoVNvB+bMfKYJ1iT
	 kf4qXDg3+TxlzhTYVAukkh5H8WnfwBHlUTbJ/sGniMf7nqwg5BtJd8UkTSMyljaPGg
	 CoWtKrc28xZ2z2jODios272MIjkp9itUYMdFbbAzFefJ+JznWYSR99vrfoeCXqHhJV
	 HWUiPOlEyGckw==
Date: Sat, 21 Nov 2026 11:59:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, Akash Goel <akash.goel@arm.com>, 
	Lukas Zapolskas <lukas.zapolskas@arm.com>, Chris Diamand <chris.diamand@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 8/9] dt-bindings: gpu: mali-gen5-am: Add Mali 5th-Gen
 AM schema
Message-ID: <20261121-polar-mutant-degu-2acd65@quoll>
References: <20261119154604.2519184-1-karunika.choo@arm.com>
 <20261119154604.2519184-9-karunika.choo@arm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119154604.2519184-9-karunika.choo@arm.com>

On Thu, Nov 19, 2026 at 03:45:58PM +0000, Karunika Choo wrote:
> Add a separate device-tree schema for Mali 5th-Gen AM GPUs.
> 
> AM_GOVERNOR controls GPU frequency. The GPU node does not accept OPP,
> cooling or GPU supply properties.
> 
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> v4:
> - Pick up Ack from Boris
> v3:
> - Drop the $nodename constraint from the AM GPU binding.
> - Require the arm,zena-css-mali integration compatible followed by
>   the arm,mali-gen5-am fallback.
> - Update the binding example to use the new compatible, three-cell
>   interrupt specifiers, and a single GPU clock.
> v2:
> - Move arm,mali-gen5-am support from arm,mali-valhall-csf.yaml to a
>   separate arm,mali-gen5-am.yaml schema.
> - Move the AM GPU example to the new schema and add the interrupt
>   binding headers.
> - Add the new schema to the Panthor MAINTAINERS entry.
> 
>  .../bindings/gpu/arm,mali-gen5-am.yaml        | 89 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
> new file mode 100644
> index 0000000000000..af758daec2aeb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-gen5-am.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali 5th Gen AM GPU
> +
> +maintainers:
> +  - Liviu Dudau <liviu.dudau@arm.com>
> +  - Boris Brezillon <boris.brezillon@collabora.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - arm,zena-css-mali
> +      - const: arm,mali-gen5-am
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Job interrupt
> +      - description: MMU interrupt
> +      - description: GPU interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: job
> +      - const: mmu
> +      - const: gpu
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - enum:
> +          - coregroup
> +          - stacks

- enum: [ coregroup, stacks ]

> +      - const: stacks
> +
> +  nvmem-cells:
> +    items:
> +      - description: bitmask of functional shader cores
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: shader-present
> +
> +  power-domains:
> +    minItems: 1
> +    maxItems: 5
> +
> +  power-domain-names:
> +    minItems: 1
> +    maxItems: 5

You need to list the names

> +
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +

And all the flexible properties should be constrained. Since you have
only one device, I see little benefit in having wide constraints which
are not used. Each integration will add them when needed.


Best regards,
Krzysztof

