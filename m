Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537615;
	b=aqPeVHkP48JjpyHEbKt7sispZsxTnT19cq3DfuIR3FlJJKOKgWAUupDDGHCFTOYC//24
	 Hxn9wXEgLklPAjb3xUPp0uIz4Po+mCRg4W5FD/u+mxKEw2HOv88GzPy9H7LETxh9seboU
	 KJgnJuJRpFdQ/hyTBf3skl37fTcYN8Wdrfx3XuHIHkIjZH1NeUvNUGQZwgP6jWN8PSPeo
	 iAlo/8ZpYZ6FyPBMIA1d5QUedOsZ3bZ1wmny7O9baANm81RIOnSlA9fo0bV/ThN3sENCB
	 0weg1Lfq/PqHJkquMa8mx9Tu53z5gjuvETHE1pQM+E58e/y0c1PrlcTL8VQmnxurG2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537615;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i49qnlqz0zXgF28dxkTVJ61k0bJxWhQuZY0QF8cqeEA=;
	b=20thtG6XMV8m4kCVEeYtWtGGSznT3OA0zl/LVbQxY6LmQG0ExrzYVS671FuzHVkD3cnP
	 gemNu7RF1JR1aqz6IKmglzKV7VbO91TIBsfKidkUGIGX/pGtCy+UeCoPqPucjOBHFeCgi
	 BabZ8QNsX7fYjiGqUiuWqy60EduKypEdkzLhmkQGWyXRpjmYBEk52dS5+D3LFhR1KvP/z
	 Wfu0jmhLmPWnUgKLWpskEPIw0FUfE85I0ebxx3gXdbkdK6q2G9jQjldo+98QUrapXRHnZ
	 FcLFprgjn/mG4jNYXgopndV46TEE9R8XLK/8UQpKTAxSXKqp8KYZj27I8evd5v0pBSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vuni9J1x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1D606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vuni9J1x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034921F000C4;
	Tue, 24 Nov 2026 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537615;
	bh=i49qnlqz0zXgF28dxkTVJ61k0bJxWhQuZY0QF8cqeEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vuni9J1xAT4mRWJWnqAORmy8xE2SywaIkxOeIdp6TMfrnIS3yWIit33pEz/WfVvby
	 S7fjwg3fxsvWPocu5SQDs6s0q2qrwLhMP/7KzW7QXaRR+HqHm8+iBF7Bh7LiWXZrDw
	 gcvzxWT52TQHqt8SXfLFkT+hzcAF5vNbINsDREqNxeQCIK4iDqzNmXKjfYYginIOWK
	 c/m6/KPRXdD+uK6FiiHtSenwlmpaTL9xmZuEMzpIB82Z8OdEZ3dc8s7A23GuvihJDm
	 ObSqW8JJf9D0s3erM60gnCRQn6+x4dcsl2AWFZW37HfD8sK6IwAhFepW/zReIH1/vU
	 x9rWRJzbShfWw==
Message-ID: <sashiko-outbox-231557@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] dt-bindings: gpu: mali-gen5-am: Add Mali 5th-Gen
 AM schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karunika Choo" <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124161952.1053586-9-karunika.choo@arm.com>
References: <20261124161952.1053586-1-karunika.choo@arm.com>
 <20261124161952.1053586-9-karunika.choo@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:26:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: gpu: arm,mali-gen5-am: interrupts listed before
  clocks
--

commit 8146e86e1cef7b5ce16835f2b37c463e5fa71384
Author: Karunika Choo <karunika.choo@arm.com>

dt-bindings: gpu: mali-gen5-am: Add Mali 5th-Gen AM schema

This commit adds a Device Tree binding schema for ARM Mali 5th-Gen AM GPUs
and updates MAINTAINERS.

> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml =
b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
> new file mode 100644
> index 0000000000000..d955476c99774
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
> @@ -0,0 +1,63 @@

[ ... ]

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
> +    maxItems: 1
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
> +        compatible =3D "arm,zena-css-mali", "arm,mali-gen5-am";
> +        reg =3D <0x100000 0x480000>;
> +        interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "job", "mmu", "gpu";
> +        clocks =3D <&gpu_clk>;
> +    };

[Severity: Low]
This isn't a bug, but in Device Tree binding schemas and example nodes the
canonical property order places clocks before interrupts and
interrupt-names (after reg), in properties, required, and the gpu@100000
example node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124161952.1053=
586-1-karunika.choo@arm.com?part=3D8
