Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075455;
	b=JO/3ADLXGGcfRACu27xNE+Lf30Nm9fIC3CnHlFdRSvHmQpi4WMCATCfZykWx7s3afBTz
	 lk+oS1vY+ROf4MZl9ZPmvzMAudW/cjwr4SlgEEqITDHyqs1owAvfMysahQp2jrMaC/VBH
	 UGjdW5GatFgEc44caHJN4PwYWrae5nYWZQwYJLK0vJhHdf1PtmIYcVrkd8CjYTyA2VKHJ
	 2Bfe3dBfgn9bKKyijPl0NVUwLUD14eHb8STALnLDbyjEO+P4E0F88SRV2d6B+0UTPqQvg
	 f/icBN1xc+6xIxwKwgM7e4dp8MAV4kWJ9nCVHunQ7JOABALQ0UVhJzQZRwLGbCEJe6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075455;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AUfxBCI5LX46rUGxQDClAvTCMn3/wSv5pgwNIHm/pgo=;
	b=ykgjEM2WS2f/DJ89kJ4GxCNVjS3e71Ts9SzoPDP9QgAOCn1DvwgGlfRKr4dC/oHGeJvA
	 NiwOk/nfenGDLpPSM2xNSznvmbyahw+wTJSvNVp/w12SNPEzAdlp9sj+ZP3m7rGL2eb4W
	 zyK0rygggJxGQnvYFhe+sMENEBUatNqCCT6M8WQ3ZoteJzm5FmHsaP3zpjLL3nZDc8SR4
	 UeQ1klWzdhm6pnVafM2ThBRZmK21/Dl8uSsOuOGufFQzhroHOqUfGAfLZbkq5ZNu1BO8z
	 LaWaZhIJMqozWLY4E04H9qlytXhiTQOHNZwpwtlwV2/RX4aX6WG5KrryxkxcyQKV6DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dVs4xeTh;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBAC60A260B;
	Thu, 19 Nov 2026 08:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCBAC60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dVs4xeTh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795075453;
	bh=9TazWM6BKOf6d9tLlEyGmgvHD0KV9sR6KW/73xdMYsA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dVs4xeThV2UkMFisYcBJ5RmcjppQeHn5BY71MaXE0m6sN0CvZUU9f9oEI+SC4B2Pg
	 AU21kIkKA2P99IgAu2NmbgPBisBJVqlxTuUmOahVdkj3ryM5pj1gh/HvUN/g6aQIsI
	 pMjxFcuEw5y5NFasazxkiQcIxP4VTLv5s3LpEQDnijS9ieX4QifC6Ncgv40D2FfHB1
	 bGrHppvuQXtMCDH6jsBSYI6wM/QddBNwEd/tsPYLCQQXlEig3QsfyAkoYw6vZBw+D9
	 4EMDLFDongjLmSpKYuzRna2DuNRkA0fGdJtiy+UN2GyMAua4HrA8BYoXYHXYz5HVku
	 qBQhJFOCAW3XA==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9548717E00E8;
	Thu, 19 Nov 2026 09:04:12 +0100 (CET)
Date: Thu, 19 Nov 2026 09:04:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Akash Goel <akash.goel@arm.com>, Lukas
 Zapolskas <lukas.zapolskas@arm.com>, Chris Diamand <chris.diamand@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 08/10] dt-bindings: gpu: mali-gen5-am: Add Mali
 5th-Gen AM schema
Message-ID: <20261119090409.5309e7bb@fedora1.home>
In-Reply-To: <20261118175332.519657-9-karunika.choo@arm.com>
References: <20261118175332.519657-1-karunika.choo@arm.com>
	<20261118175332.519657-9-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 17:53:24 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> Add a separate device-tree schema for Mali 5th-Gen AM GPUs.
> 
> AM_GOVERNOR controls GPU frequency. The GPU node does not accept OPP,
> cooling or GPU supply properties.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu@100000 {
> +        compatible = "arm,zena-css-mali", "arm,mali-gen5-am";
> +        reg = <0x100000 0x480000>;
> +        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "job", "mmu", "gpu";
> +        clocks = <&gpu_clk>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcade5bfbafe9..93ee837af9958 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2404,6 +2404,7 @@ R:	Chris Diamand <chris.diamand@arm.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/gpu/arm,mali-gen5-am*.yaml
>  F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
>  F:	drivers/gpu/drm/ci/xfails/panthor*
>  F:	drivers/gpu/drm/panthor/
> --
> 2.43.0
> 

