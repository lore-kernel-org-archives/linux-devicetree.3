Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792942948;
	b=xg9s9t0rrlM5vizkY/BNkVY3kit66AlZFz1cpNVRRN+C4Okz7Q98mjoXPt/jub7nBQGp
	 jowTpldBFo6v8CVSgUtAcSS1cjujlQMKPey2JR2N6BETdR/r/5gYeLrgVGktD2SYkEuVm
	 nQvORZdkAKsYdcEvHLVgj1Cc/mvTg8/1IgD0bV6rzDI2okddexeR9kakGLSkneFjiXzNl
	 8qJdOqEfBeUHnaMo7yNgdZiFCF+c+B3xQr27SQATDuLeQ7P2SDMlkd+JEMeMb6PHXvvUR
	 9rGJV/e4OJPikRoli5Zcy32S8S5sTAZyd4j/kUQ3a2C6DoyDNe0VwG095SVcY60+ECw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792942948;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0l6H5rEmfZdUFjBvh60rvmt8E1JTpx0RLmLl/MbW4zU=;
	b=Z1EPuHThpQx4/hLzxGL3HCpCGmTkmxWp+hJV9CZy5LQNEY+LzE9dkktoK+EVTd4eAVqW
	 deMyPki8L5OUBeirlC6nyYf/my7PgtaM/pgN7FbA5wd3iMabDA5zm7cI+bRzUl350pW6Z
	 24gjsyD5z7GC9Am5L0kNwxFZx0ZGnvB2fYgAer23BUsrImee27Lxw+9N86zqmA0gGIKc2
	 nnv6iSfZcO30kmUv8br2uVCpQPTMEcQBxeYplkSIxmrPEhucy4AnZvcMLD0GS5BiYmsm2
	 iSX+1/gXku5Zcb7R9AJL8p2rfZxFdVWOhaP4N+46eOWf/n3crlqqheTmhDUfzaHmFgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwLZF77p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC682606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwLZF77p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5FE1F01825;
	Sun, 25 Oct 2026 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792942947;
	bh=0l6H5rEmfZdUFjBvh60rvmt8E1JTpx0RLmLl/MbW4zU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EwLZF77pGi6dHcjjWGGLArgZl1ldZ0axIs5hEO9W8b4JGWNHXamHAGVtGzWLO8kG9
	 xcT9R5PIAi8IIvy7pfJ0/jMq5wQ8/T5WtkklGPyUaYz6UffSIMbPumCFJD6Z795e1R
	 osK5qqCwoKOPR1WmrYGEmhGv8UcdsquzChKALHshbW9byX3Qzuzdz13ZLeWG7LQP7x
	 6hdbl22zfJBvYLnyofim49DPd8A6SVIA/8ddu2rGQqiJZmuP8ZEsbjz/0OdbY/c6IZ
	 NIc0CxhBwa+kLGwiE8mPamjKlre4mBuz7C9a3czvNEoEYDN+rvs1gnAFIz1cHIgRSr
	 uo3E3bnJwY7vA==
Message-ID: <sashiko-outbox-184260@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next 1/3] dt-bindings: net: airoha: npu: add DMA pool
 memory region
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Scott" <gilroyscott1970@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261024154150.45733-2-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
 <20261024154150.45733-2-gilroyscott1970@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 15:42:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: airoha: memory-region schema rejects dma witho=
ut ba
--

commit cc6f0348f0ae07c584596be380fd6f15cd65362e
Author: Daniel Pawlik <pawlik.dan@gmail.com>

dt-bindings: net: airoha: npu: add DMA pool memory region

This commit updates the Airoha EN7581 NPU device tree binding to allow an
optional coherent DMA pool memory region after either the firmware region
or the WLAN offload regions.

Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com

> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> index aefa19c5b4246..21a1a275003b1 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> @@ -42,22 +42,34 @@ properties:
>        - description: wlan irq line5
> =20
>    memory-region:
> -    items:
> -      - description: NPU firmware binary region
> -      - description: NPU wlan offload RX buffers region
> -      - description: NPU wlan offload TX buffers region
> -      - description: NPU wlan offload TX packet identifiers region
> -      - description: NPU wlan Block Ack buffers region
> -    minItems: 1
> +    oneOf:
> +      - items:
> +          - description: NPU firmware binary region
> +          - description: Coherent DMA pool for buffers shared with the N=
PU
> +        minItems: 1
> +      - items:
> +          - description: NPU firmware binary region
> +          - description: NPU wlan offload RX buffers region
> +          - description: NPU wlan offload TX buffers region
> +          - description: NPU wlan offload TX packet identifiers region
> +          - description: NPU wlan Block Ack buffers region
> +          - description: Coherent DMA pool for buffers shared with the N=
PU
> +        minItems: 4
> =20
>    memory-region-names:
> -    items:
> -      - const: firmware
> -      - const: pkt
> -      - const: tx-pkt
> -      - const: tx-bufid
> -      - const: ba
> -    minItems: 1
> +    oneOf:
> +      - items:
> +          - const: firmware
> +          - const: dma
> +        minItems: 1
> +      - items:
> +          - const: firmware
> +          - const: pkt
> +          - const: tx-pkt
> +          - const: tx-bufid
> +          - const: ba
> +          - const: dma
> +        minItems: 4

[Severity: Medium]
Does this schema in Documentation/devicetree/bindings/net/airoha,en7581-npu=
.yaml
under properties:memory-region and properties:memory-region-names reject va=
lid
device trees that configure WLAN offload with the dma pool when the optional
ba region is omitted?

In drivers/net/ethernet/airoha/airoha_npu.c, airoha_npu_wlan_init_memory()
treats the ba region as optional while requiring tx-bufid, pkt, and tx-pkt:

drivers/net/ethernet/airoha/airoha_npu.c:airoha_npu_wlan_init_memory() {
	...
	if (of_property_match_string(npu->dev->of_node, "memory-region-names",
				     "ba") >=3D 0) {
		cmd =3D WLAN_FUNC_SET_WAIT_DRAM_BA_NODE_ADDR;
		err =3D airoha_npu_wlan_set_reserved_memory(npu, 0, "ba", cmd);
		if (err)
			return err;
	}
	...
}

Because the second oneOf branch validates items positionally with minItems:=
 4,
a 5-entry list that omits ba and appends dma (firmware, pkt, tx-pkt, tx-buf=
id,
dma) is checked against the fifth item (const: ba) and fails schema validat=
ion.

Should the fifth item in the WLAN oneOf branch allow either ba or dma when
only 5 regions are present?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024154150.4573=
3-1-gilroyscott1970@gmail.com?part=3D1
