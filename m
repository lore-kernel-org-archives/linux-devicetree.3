Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896027;
	b=HpBb5Yf/X0tXmTdkCxwfTYpUyGXhbIU8GtHBDQrjl0bpsT8kBzzbNxYTdUGX5gE42AJi
	 Q7iVVQb603VP4ZMD4EJSVm342u0SpXGlcdWrkbG8XMxzEGLRBcpbgpfbuAhno4JER6cBB
	 WOKX0RKP5kWaOvKtP/BAa2iNE59K/0/WVqH4/BoD9e195eZwlZoA8bctf4gz/rO+kWo1O
	 Nsz8iHNKdIKJX7/D40J03ip5LuFYlq2pxiOxpIQ9PsAT79Ay1QH58HAt1EecXL8Jh0gE1
	 jgwSCwivokbMA+5g9xGpYI4xmfWdlSoiR9kvtIHaL7LCQG1PuHGMlQ7QwNVmkMAUlUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896027;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+tJ+JiUTPECwV4i42nwLG4U/QvHFDPZCK+MpETnx2mo=;
	b=KBlIWlAeCgiAREAFQlZaNZvEt2XKOkD+Zn5E+JVNHVEsVoZk+LeAS3wROaD0A0wzgcVm
	 g2GjnYZPx58G83wFbGCFDt39uKyzBZXtPGDbw5kZd+r8THHnLY8MRT2UuGsfIH1GuJo7w
	 T0DsE51fWburqvUrVG9wm1j6JiNNDdbS05F3TTZMwLeeERqr/HlV1vb9ReCxLKV63aBg/
	 tBKf3PTr9ksDv9p5H0ipEn41c8zSi2JRVk2UfGiezCjI488SHxTMReomx7jKwEF08bnIo
	 cM4sW2NXmSV8dbHbQsTHZRdrntHkQPkk/rPHnOGdNIdM3P95pHJ0BejmnhHZJ3J39OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T306VmVK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68842606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T306VmVK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAFC1F000C4;
	Tue, 17 Nov 2026 06:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794896026;
	bh=+tJ+JiUTPECwV4i42nwLG4U/QvHFDPZCK+MpETnx2mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T306VmVKZGNOEjVRSjVVwCtX3+YSRYaucYyWDaQy0D61/a32oAgagc+G7pYrcgrCB
	 v3DkfoMiQfZjeUGkw2jLGMnh8mvtWihxiW3WkVfT9zJbKtYzUyJdBvzQuw1oLgUzHv
	 AFWTQwntwkFT5YTqNwb/6W5LbM9ol8yn4ph+acO+86zhAhTePYHg+6yXK8V2Lo02CU
	 WtCQTp4s1WuHyxgdG0H2zDQ9s9bsNrvHNMXYTzFHg6ydysJJ1yDDEvlAEqpeHBXPOm
	 GJM2Oup7CZYwpSE0YNcYXm2aq9E39T4hcCsEF3OlAsx1LU6Y7NBRzhsof5VUXGh4ly
	 iOEb3ffa3mP5g==
Message-ID: <sashiko-outbox-218243@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongmei Xu" <hongmei.xu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-nvmem-byte-mask-for-split-macaddr-v3-1-c02177658f66@oss.qualcomm.com>
References: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
 <20261117-nvmem-byte-mask-for-split-macaddr-v3-1-c02177658f66@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:13:46 +0000
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
- [Medium] dt-bindings: nvmem: byte-mask redefines reg size and reads
  beyond reg
--

commit c8ae5b67172a64e8cfa54543074f9aaa24c7c23a
Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>

dt-bindings: nvmem: add byte-mask property for non-contiguous byte selection

This commit adds the byte-mask property to the fixed-cell NVMEM binding
to allow selecting non-contiguous physical bytes within a 32-byte window.

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
Does byte-mask redefine the size cell of reg as the logical output size
instead of the physical address range spanned by the cell in the NVMEM
device?

In fixed-cell.yaml (such as the bits property right above) and nvmem.yaml,
reg =3D <offset size> specifies the physical address range in the parent
NVMEM device, and sub-range selection operates within that reg range.  For
any non-contiguous selection of K bytes, the highest set bit H in
byte-mask is at least K, spanning at least K + 1 physical bytes.

If a DT author sets reg =3D <offset K> to match the logical size, byte-mask
reads physical bytes beyond the declared [offset, offset + K) reg range,
hiding physical address overlaps between sibling cells from DT tooling and
reviewers.  Conversely, if reg =3D <offset M> covers the full physical span
(M >=3D K + 1), the number of set bits is smaller than reg, which leaves the
remaining M - K trailing bytes unspecified in the binding and causes
consumers expecting a K-byte cell (such as nvmem_get_mac_address() or
nvmem_cell_read_u32()) to fail on the larger cell size.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-nvmem-byte=
-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com?part=3D1
