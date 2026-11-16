Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798335;
	b=u74SPAEwwM9bAkU9mmn02X+lc+r6ckc6AydlLVn8OkgR4NHxLardvigPEvPn69WQ9l9H
	 S8wbVz+nRJJxe/3a4PbR6dyd48kweUsqm1paPswluV9RFygdYDbWhT3AfmgE29DkY7wMh
	 3F1kV3AU+BrTwVesyvUy22R6yb2HrB7ZuCblF57i5wWCjBwq2zo6wBMluCPFDlX05U7qu
	 OcSx+/Ef2IPtFCWx6Sq6slGOjt+TfeyUjNsKuydrADmF36WNK6GBChpnlex6JMIo6uuNR
	 FlX7isyY/+O91+Cdf7+VrV83AZY6OGlcW/KseBkmC2jhf2biRaRsPKVbBIeCZNcOQcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798335;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LAuTbl2HX3qhAEBMiEQP62OmlsXSQlZPdUzj4B1f3n4=;
	b=r1e3p+P/8zZ58eiVP6/ZkCHOw3l42nyPKVoE5ipgzIBbe3mf34UdroWuQXI7HuzccRwZ
	 jLu0AY3zY/AbmaT0ZHxtoZ4zK/DNLt6GeGafoLrTIGiIovwxRKYQ4gpwUGWyCCFxw2FJ6
	 akADLnNOMXK7i+hwQke8QQM+Ta/b8d1EQsKg/qwj2WS8CncGTeSCzNgtRSbX2/eNoCT3G
	 OCbquOcwH+1hi0jGUD3ucGhBHXliKtjLOZ86+kL8wvWcWGcKTzCzHEuSig3H1M9VKlvYn
	 Ro3PJiAv4NnBU9QLFXmlELHWsi218Ayl0GTr+djhKXxH5pWEHKKtJFtYQ/EsbYEgCaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMSiWMwi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED969606A338
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMSiWMwi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF5F1F000C4;
	Mon, 16 Nov 2026 03:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794798334;
	bh=LAuTbl2HX3qhAEBMiEQP62OmlsXSQlZPdUzj4B1f3n4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AMSiWMwiHwQ5/755uMQdIbhwzQV7tIf3GbdW2Jg+nr54YwsMkBRPYsiprlS72p4aq
	 6yYGEqbsYSxB1TTPYf4a5Ja/ejwYM0ur7nEKScWpG90zbD1nWSsIrcmGjtX3x5TdMM
	 QOgo287QB3ObfjAQQIH0iW0bPHSzvQtq+/uJisiaM5/y9GOWnt7x5uIclz/qPz6zak
	 mlRi8QSTxP8I48ONwnIoEwjLH9KaaIQo799ZCsV1kV44oyLFpa7AeFBcqzi8oHhIvF
	 w76UQuzpG+6Br9ijrDSbPYYVD5gYLw9xSHIFJSbqL/mvAQ3Yq9L2aYRxy9AZ3+emrI
	 wf6G8qnYU7a4w==
Message-ID: <sashiko-outbox-216098@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongmei Xu" <hongmei.xu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-nvmem-byte-mask-for-split-macaddr-v2-1-96f4a0c08264@oss.qualcomm.com>
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
 <20261116-nvmem-byte-mask-for-split-macaddr-v2-1-96f4a0c08264@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 03:05:33 +0000
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
- [Medium] dt-bindings: nvmem: byte-mask redefines reg size and accesses
  beyond reg
--

commit 66779220f836f809e1148ff64ede0801ef303fad
Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>

dt-bindings: nvmem: add byte-mask property for non-contiguous byte selection

This commit adds the byte-mask property to the fixed-cell NVMEM binding to
select non-contiguous physical bytes within a 32-byte window relative to a
cell's base offset.

> diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.y=
aml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> index 38e3ad50ff4fb..46e1101ee98ae 100644
> --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> @@ -34,6 +34,20 @@ properties:
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
> +      packed into the output buffer in ascending byte order. Byte positi=
ons
> +      are relative to the cell's base offset and limited to a 32-byte wi=
ndow.
> +      The highest set bit must not reference a byte beyond the device si=
ze.
> +      The number of set bits must not exceed the cell's logical size giv=
en by
> +      reg. Cannot be used together with bits. Cells using byte-mask are
> +      read-only; write operations are not supported.

[Severity: Medium]
Does byte-mask redefine the size cell of reg as a logical output size while
allowing physical reads past the declared reg range?

Any non-contiguous selection of K bytes has a highest set bit H >=3D K, whi=
ch
references physical bytes at offset + H outside a reg =3D <offset K> range.
Unlike the existing bits property, which stays within the address range
specified by reg, setting reg =3D <offset K> causes physical accesses beyond
the cell's declared reg range and hides overlaps between sibling cells.
Conversely, setting reg =3D <offset M> to cover the full physical span M > K
leaves the contents of the trailing M - K output bytes unspecified in the
binding and causes consumers such as nvmem_get_mac_address() and
nvmem_cell_read_u32() to see an unexpected cell size M instead of K.

Also, the commit message notes that multiple reg entries would require the
consumer to assemble the value from separate cells, but multiple reg tuples
on a single cell node (for example, reg =3D <offset1 len1>, <offset2 len2>)
describe one cell with discontiguous physical ranges without redefining reg
or limiting the span to 32 bytes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-nvmem-byte=
-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com?part=3D1
