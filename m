Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2A4ADD80
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790285458; cv=none; b=etGP+7Gl9xvTloJnU4M0z3iATHoRlQhuTwO8uTXsteBHRXcTgHMigJz0lW9W1k/hC6ComgYWYXwNooD3rZ/kSkgg3gC6yJm9oNy40/DQsrlAGX31GhAAkfEMGDNiSEBGJlxOrDjeq3ONy8x1ePrWbKBB/pvuA5fk1Wh/sFhHa8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790285458; c=relaxed/simple;
	bh=qy5kpUqRj3bU7Jr7C9QLWnXXLfMCjeEUAuf1Ica4IaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gEs7kKaOJdIPITLJY4aFHg8cgSnDESVnDRSUEa5JFXXgD7NKRGJKodN5nBkNOg+8iin5xLGj/L090YJ35EP+nVXRzRLO0zdnZiwWSip1JlYzaKRuXX7Olptm5vQPZXyNPtn5yHTati8uq7RiVmLhb2bCfGRvsNy1t9ewRKK8TrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMYOu8pL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMYOu8pL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA3F1F000FF;
	Thu, 24 Sep 2026 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790285454;
	bh=FtjJDuGMCGnEZygAFeGwAxfgOdCkS6ihEAquCZQERJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IMYOu8pLLfI0VMS9+cBY5Uo/JXmkGzxxn6F8gqTCkldVlvSXSgsKGwSpSbRYsJ7nd
	 xJHYGXcn1sZ9pdKh9ON7YQsn0WoVS/3YCs97paqNTj8sGacQD1+tfQG/iFJkHUDX7F
	 fQWcA1RfBiiyJTzEwD1dyL+kUxBpTByiYNymoLVdBJgN4fjpxR/t7WB53lS+zlQ4Pr
	 RaEY/NhtwBWwGR70nAUuDPH0Ipqpp7pBGgHWwP0ztDMpb13ym4aRwtSttQv13JsYpX
	 qSZVv8R4JJuAy47pGcZ5FiaruFaoVJFmRYtgIkcwhcDa7YmBLzBtitIhGRhfttX0gg
	 mSiPP4asnxq4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3] dt-bindings: mtd: convert IBM NDFC binding to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924212240.81857-1-rosenp@gmail.com>
References: <20260924212240.81857-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 21:30:53 +0000
Message-Id: <20260924213054.4FA3F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: mtd: ibm,ndfc schema rejects modern partitions
--

commit f1a26fcb68368a1ab8dd195e7a927c46335d8315
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: mtd: convert IBM NDFC binding to YAML

The NDFC NAND flash controller was only described in a legacy text file,
so dtbs_check reported "failed to match any schema". This commit converts
the binding to the YAML format.

> diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml b/Docume=
ntation/devicetree/bindings/mtd/ibm,ndfc.yaml
> new file mode 100644
> index 0000000000000..e614c5855b423
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
[ ... ]
> +  bank-settings:
> +    description: NDFC bank configuration register value.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  nand:
> +    type: object
> +    description: NAND chip attached to the controller.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 1
> +
> +    patternProperties:
> +      "^partition@[0-9a-f]+$":
> +        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-no=
de
> +        deprecated: true
> +
> +    unevaluatedProperties: false

[Severity: Medium]
Does this strict definition of the nand child node prevent device trees from
using modern partition layouts?

Because unevaluatedProperties is set to false without a reference to
/schemas/mtd/mtd.yaml# or /schemas/mtd/nand-chip.yaml#, the schema will
reject modern generic MTD properties.

For example, if a device tree author updates their DTS files by replacing
deprecated direct partition@ nodes with the modern partitions subnode (using
compatible =3D "fixed-partitions"), dt_binding_check will fail.

Additionally, the node name nand (without a unit address) does not match the
^nand@[a-f0-9]$ regex in the inherited nand-controller-legacy.yaml.

Could this be updated to allow the correct modern alternatives?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924212240.8185=
7-1-rosenp@gmail.com?part=3D1
