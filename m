Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546401;
	b=KK5NSa5PIMG2LRuXX7L4OUqDVc/yqe+tV1wyBtWfWePXv11tpFmL+KH+o1pT2AeRCC1V
	 klG44xEHfHrfBOhIda+IybTYifMWmHlwsm0yAPOF3nG2Hkv53z15oWXeepYG9HERCjo6q
	 8JPhkejLjHxCTEhOU5nKrBy4YaHgpKRFxVNLALFqTdWqoQ5S9JO7G4jmBl4VWk7G8Exu7
	 JSjmofjKt7FJr1nDe0pvYjBAOupz9ATd0bL6ZhSPXs4g7sc0kjwNjfA0bouRmOds9pjXj
	 oJwxQH0EaMA/vm1jHa0OIelwplpn/21cmY1ebNpXjI+waxLp8EcfrAKyzuzyBAs2IGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546401;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SfXydcwywLkFkDCMxBb1KNDACn+wvZqQmbXRTjbwlDY=;
	b=AWcqAC2UFUNVN/DoJHslcRleZyFW6zOxucfV/UYHl6sp7G17E1eoRiOxwblqZFfvkWmF
	 cv+GUMR91KpKc8Xz5WkxJWYZDSsTyRRPYixGP7og15GudNRvdxamzGd5acVCwHGyOedOG
	 2fO1338tz+MEbqsAslRvrZ7RSl8Q9fjp5LgGaKQmc1FgT99lUrQ9rvEQTSt5Ci+bREYzd
	 ZBvfOyzbPHgrl6oOpCVVxuS/JrzmfoRF1b88L5hHNjwTSwrsKZJ95QH6abDMLTTkP8M81
	 m5AXhxbtPjDoqYPqOrkiRjnRINJVQ2lTVmEr8pQc2xMERj3qIJRHNKQ8MC86eGhqgeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eryddmJ+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346C606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 18:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eryddmJ+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316261F000C4;
	Tue, 24 Nov 2026 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795546400;
	bh=SfXydcwywLkFkDCMxBb1KNDACn+wvZqQmbXRTjbwlDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eryddmJ+Epr7UpGSn6qxri+kUHq6cLREKeq3Ugrh6QrSJFuWf1Qomh8M6ETZAhwc3
	 wRSMq11j98ggwF5kai2TtpwKAIxkFgOT8vpRisZzWeGGybqtu/FpixPQyusje0Vlc+
	 nochH8Z2Q2FOarg67hkcLfCAlDzBRCAIih39djyM8+4aJ80WEmnDCjoTqaIE8gblOx
	 KVw7xMWBH8P1L5Y0l7dXOxWttBuMkpyJtGvdyOSIoh4wW6PFnh2tV6gpOyFoEkGL8B
	 ZO42+CAawf7jenlouCsX+/XH6/iZSZi0oCA4vYNL667Mq1G/z3rDIxogc4h+eQCNvg
	 ZWzwVRGN35eTw==
Message-ID: <sashiko-outbox-231857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: reset: Add Cortina CS7542
 network engine reset domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 18:53:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: reset: cortina,cs7542-ne-reset models driver
  policy with 0 cells
- [Medium] dt-bindings: reset: cortina,cs7542-syscon adds resource-less
  reset child node
--

commit 8b12223a26b6c9716b47cb476510aff102be0e41
Author: Fil Dunsky <filipp.dunsky@gmail.com>

dt-bindings: reset: Add Cortina CS7542 network engine reset domain

This commit adds a DT schema for the Cortina CS7542 network engine reset
domain and references it as a child of the CS7542 global syscon binding.

> diff --git a/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-re=
set.yaml b/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.=
yaml
> new file mode 100644
> index 0000000000000..8f5b5b8350502
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/cortina,cs7542-ne-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cortina Systems CS7542 network engine reset domain
> +
> +maintainers:
> +  - Fil Dunsky <filipp.dunsky@gmail.com>
> +
> +description: |
> +  Child of the CS7542 global syscon. One reset domain covers NI, FE, TM,
> +  scheduler, queue manager, NI XRAM and the entire DMA block (LSO and SS=
P).
> +  SDRAM and unrelated peripheral reset bits are not modified. The consum=
er
> +  must own all these blocks exclusively. This reset is not suitable for a
> +  network-only consumer while a separate driver uses SSP DMA.
> +
> +properties:
> +  compatible:
> +    const: cortina,cs7542-ne-reset
> +
> +  "#reset-cells":
> +    const: 0

[Severity: Medium]
Should this reset provider use #reset-cells =3D <1> to expose the individual
hardware reset lines in the global reset register rather than bundling a
subset of them into a 0-cell virtual domain?

Bundling NI, FE, TM, scheduler, queue manager, NI XRAM and the shared
LSO/SSP DMA reset bits into a single 0-cell reset while excluding PCIe and
other peripheral resets in the same register encodes current driver
partitioning into the DT ABI.  Separate DT consumers (such as an SSP DMA
or PCIe driver) cannot address individual reset lines without breaking the
binding.

> diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542=
-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542=
-syscon.yaml
> index fb074de870bd4..5aca670cdbde7 100644
> --- a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon=
.yaml
> @@ -33,6 +33,10 @@ properties:
>      type: object
>      $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
> =20
> +  reset-controller:
> +    type: object
> +    $ref: /schemas/reset/cortina,cs7542-ne-reset.yaml#

[Severity: Medium]
Why add a child reset-controller node with no registers or other DT
resources of its own instead of putting #reset-cells directly on the
parent cortina,cs7542-syscon node?

The parent syscon node already owns the global control register block
(reg =3D <0xf0000000 0x100>) containing the reset register and already acts
directly as the clock provider via #clock-cells =3D <1>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-cs7542-=
ethernet-v1-0-fdb5e8c2d508@gmail.com?part=3D1
