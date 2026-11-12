Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471794;
	b=zRfnXMSP4s5wYeegVbd91JEwBH5QFLfJIzWUPwN4CQeCHMddEJmsXxqqgEYyqW+I3nVO
	 QYZDU8NV+yC/jCvGpEAgV05ylelDhfqg+b5vEAuGd3lfKzpkimrjmp06x4MUgV1kFZb6m
	 l7OOQ7tVvaL3k4yFF+5W9Gv7d/yIgWHxRyjt1EX1p42yaCGjmUlATYUPhi9145FZbJgvs
	 Xu9dcIUt3DY721r3lOjEjBKgyuKWmv3o62q6QMvGLfAMv+Q3ogLOTpxNDu+5VgZ4e/b+L
	 Y4Jt292VJ5smWqSIxkgn575a37DpuHVm/PqhR24UJNH59nZsFlUGAODuA+vR0LePYVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471794;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+gjp+j/K2fZERzk5HL3qZw8YKHHQVed0sM3gsSjuBOY=;
	b=r/AWxCbx16qEBITQCNk8qGy5MgO6HNc3zMa9Hns28nB8OER6Vjuvq/qmQA9fobxiGq23
	 N6LGfwqZg6mUameIqnujXPtBt7+tJTP6ow7yqnvXWzjRIP5VfhRq6w0S0PA/nXVdhLv7H
	 d9cbBXngFC8XLBHXAm5gmh2M1AbBgN+pVwELVegEBHBBAIsmeYWHkZ0ElSgzpqTkyFerN
	 2SjhTou4GZQwj8xreo6zlw2DHo/nKk+kN/KeK8/UipfTh9BvVzsnLvcmT/67KfzHKg1Ve
	 Tp00vzLe0gEieK6lJLNiNK9OTfAwYHJO0kCCPvIW4FEALBEFe3DA9qzCPQF8pacnnjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHPW5PFG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF46606A88A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHPW5PFG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68431F00A12;
	Thu, 12 Nov 2026 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471794;
	bh=+gjp+j/K2fZERzk5HL3qZw8YKHHQVed0sM3gsSjuBOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CHPW5PFGseobdzynB0k2U6/ixjS/oW3o/eiED0bFX5JwE/vd+Ob8iDJBs/8ZLc3IG
	 NbdC1NpWty8NOGE/3OrztqSUWfFzdKh2M6ujnQm8ulEmd7pUkmdqoXmiTj91XaAi1A
	 sxvjG9yz4YwhHxjXTEr27X1KaVCgVLthF+P3cXdwxxB/5BsZQRtk2LIpdPg5uP+5Th
	 qIPV9fsFyOsMRVfgW9tPOXTJODXXePNNKimTvZZzxN6TyiNoyEfDpbBUf/Q6UzA8e7
	 yzobyst+XRixnUQZAJcTZ9eLm1Ozf9zARUT30UdS+uHSNHp7iPTTT6hK+ZK4oO2rK/
	 qwGPdXdRGSlEQ==
Message-ID: <sashiko-outbox-210701@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112081047.1550471-2-m-shah@ti.com>
References: <20261112081047.1550471-1-m-shah@ti.com>
 <20261112081047.1550471-2-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:23:13 +0000
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
- [Medium] dt-bindings: soc: ti: unresolved maintainer objection to
  ti,proxy-id
--

commit 3553d71ec015a9aca0d29d3d396108a6a975a8a8
Author: Moteen Shah <m-shah@ti.com>

dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf

This commit adds the Device Tree binding schema for the Texas Instruments
TDA54 SoC MCU domain System Control Module configuration register region.

> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-co=
nf.yaml b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.ya=
ml
> new file mode 100644
> index 0000000000000..111cbb739b5f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
> @@ -0,0 +1,78 @@

[ ... ]

> +  ti,proxy-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Proxy region (0-7) through which this node's clients access
> +      claimable registers and their fault status registers.
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      The cell selects the ePWM time-base clock gate. Values 0 to 12 sel=
ect
> +      ehrpwm_tbclk0 to ehrpwm_tbclk12, i.e. the gate for ePWM instance N=
 is
> +      specifier N.
> +
> +required:
> +  - compatible
> +  - reg
> +  - ti,proxy-id

[Severity: Medium]
As reported by Krzysztof Kozlowski on v2 [1], is the required custom
ti,proxy-id property still needed here?

The proxy selection does not vary per board for this single device (or
would be implied by the compatible string), and selecting a proxy region
for register access arbitration duplicates the standard access-controllers
binding.

[1] https://lore.kernel.org/r/20261028-inventive-screeching-bettong-9f4240@=
quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112081047.1550=
471-1-m-shah@ti.com?part=3D1
