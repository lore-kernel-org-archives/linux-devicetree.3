Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556950;
	b=rV21PeK5sBRntruVbmEFh5wWMqh6NYmuhpi9GbW1xJnLbzhzIwyhBJv/n4vdZKD7M4pW
	 AhQhRqgHdfbqBbhHW4brzozBYmLwKWgGI7hhknxAJvsOxIDs7le90A8GMS/GgG5EW8WZA
	 uNrkjPvZW5n7MhkAZOgTaR2XMhohHWKcALK3672cWuPjAVYrzu65qdFXqW9NDgMcBhc/Y
	 3HVjbtnRRTPHfRPkOEsir26kb5L9N2CxpG9p1F582Xevcn34rg+L61ryJy+S4gCz5Q1Vp
	 yK55TzYraq0yrukCEw65P7N2BqEw9TuFEK9RXlbrDI24aUQmJqGwdor3hB+QWJe7tmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eZlMZHyXEKoepLTT+Gj9m6hq4Ih4bW6CUj6skMHicbo=;
	b=OfRwJ/8IysrxP88ImOcnpqW9XFqoHdXrda4MBggv1+pkw/BsWA6vLlUfWjnVGEEIBLnB
	 Fb6mmamOtCnoIq5qzBwbVS5yyVpBx5DDqMe3LL/0vThGlaAG8PY5WfQ38rhTD5grDGCQ3
	 BGGQKMzQAAbLcYTfdtlPqjFZIxiwaNHczv17POHLk6ZhggzHmHKvKs4syTpNlR3/lfCAZ
	 eSlqzcVzHlph8oEJrmKs+sEyINArmOAQbiO3upl9tJIfkAdKpBgY9cKkyrVVLnZYBiTkg
	 JlS9DtwMTsLLJqh/3EzgX3ZPbiZVt2fI/g9FAVUGe6LletOseUVb5NjLNrwHHdxr7qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ybn8mFiG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8AF606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ybn8mFiG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D001F000CF;
	Fri, 13 Nov 2026 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556950;
	bh=eZlMZHyXEKoepLTT+Gj9m6hq4Ih4bW6CUj6skMHicbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ybn8mFiGK/Gicb6vtE9f797jleJ+SY0aeuZoNrE055mpcmJuRp3dhesUQbLXEkbu6
	 HIQFao7Ya1kh0i/OT+nb6nx2N/OlvceUHa6orxIlijzQhSC9saS4TuE2IelGw4PRbO
	 ABWoO7LIHcbXq9NcmvB5/qcWKLMurvaAqPslmbNr8t+zJmyr1FNvGYMcQnzlppJe0E
	 QDs/KSePqwFZRhYX33bkGeLmM5+TDVSLDmQjKwjojuPIlbJTNjp+MbWvM84FlqyEfS
	 EF6R7KMg83kG+foHJyFZVsNbZWySih2qLFMtn/l1PbMiYDjytxLl5Zgvv0YaIRrv0S
	 NmFHCMDTQk54Q==
Message-ID: <sashiko-outbox-212378@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongmei Xu" <hongmei.xu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-nvmem-byte-mask-for-split-macaddr-v1-1-138f715f18c1@oss.qualcomm.com>
References: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
 <20261113-nvmem-byte-mask-for-split-macaddr-v1-1-138f715f18c1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:02:29 +0000
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
- [Medium] dt-bindings: nvmem: byte-mask redefines reg size and accesses
  beyond reg
- [Low] dt-bindings: nvmem: missing hardware motivation for byte-mask in
  changelog
--

commit f8160f5bc1c29ed4ba48f6d458beb8ca96b09427
Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>

> dt-bindings: nvmem: add byte-mask property for non-contiguous byte select=
ion
>
> Add the byte-mask property to the fixed-cell binding. This allows
> selecting non-contiguous physical bytes from an NVMEM region to form
> a logical cell value.
>
> Bit N set in byte-mask means physical byte N relative to the cell's
> base offset is included in the output; selected bytes are packed into
> the output buffer in ascending byte order. If fewer bytes are selected
> than the cell's logical size given by reg, the remaining output bytes
> are zero-filled. The number of set bits must not exceed the cell's
> logical size given by reg. byte-mask and bits are mutually exclusive.
>
> Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>

[Severity: Low]
Could the commit message explain the hardware layout that motivates
byte-mask? It repeats the property rules from the schema, but does not
describe which SoC or NVMEM layout splits a logical cell across
non-contiguous physical bytes or why existing mechanisms such as multiple
reg entries or a device-specific layout are insufficient.

> diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.y=
aml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> index 38e3ad50ff4fb..cddda3f706917 100644
> --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> @@ -34,6 +34,21 @@ properties:
>          description:
>            Size in bit within the address range specified by reg.
> =20
> +  byte-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    description: >
> +      Bitmask selecting which physical bytes within the NVMEM device reg=
ion
> +      contribute to this cell's output. Bit N set means physical byte N
> +      relative to the cell's base offset is included; selected bytes are
> +      packed into the output buffer in ascending byte order. If fewer by=
tes
> +      are selected than the cell's logical size given by reg, the remain=
ing
> +      output bytes are zero-filled. Byte positions are relative to the c=
ell's
> +      base offset and limited to a 32-byte window. The highest set bit m=
ust
> +      not reference a byte beyond the device size. The number of set bit=
s must
> +      not exceed the cell's logical size given by reg. Cannot be used
> +      together with bits.

[Severity: Medium]
Does byte-mask conflict with standard reg semantics by treating the reg
size as a logical output buffer size while reading physical bytes outside
the reg range?

Any non-contiguous selection of K bytes spans at least K + 1 physical
bytes (highest set bit H >=3D K). A Devicetree author must then either set
the reg size to K and access physical bytes up to offset + H outside the
declared reg range, hiding overlaps with sibling cells, or set the reg
size to the physical span M >=3D H + 1, which pads the output to M bytes and
breaks typed consumers like nvmem_cell_read_u32() that require the cell
size to match sizeof(*val).

Defining software zero-padding in reg also puts buffer formatting policy
into the hardware description, and the binding leaves write semantics for
cells with byte-mask undefined.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-nvmem-byte=
-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com?part=3D1
