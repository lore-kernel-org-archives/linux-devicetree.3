Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F7E3D9041
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696888; cv=none; b=DnWTqIqeGQ3d4yXVIy1FIttJBweF8V6uQhHttBMH5jYsyD0/VaQEAub5zivfHfWG4oIqkGvi048bKjsSj+UD2gNUvElH+jTwmY0u+mA4GAkn8GaHiEo6ArrT2XiebMnHROpxI/LnDl02QwJwCK6Ruc6uW5b8H1zWwuzdKgEqZbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696888; c=relaxed/simple;
	bh=p1m6c+WBzCjdZ+p5GdraWDE816KriLzuY8G1VIENNTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HgrjxHpr55cTv3JFQ2ckz++oJnO0VSy5NnZ9lPUuyUzwTV5Vi8ee/iXuT9NrXMDz5r/SgQrEEWwjHavU7kyEhD9SMzd4h4xl6rd/y6ZEsYloY2baKptNrVx7aHjdBCjKDG0GAP/vCWpeozXy6ZYQ5V4y3jkmLERFQ59JUdDEjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMHfhB9S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMHfhB9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D551F000E9;
	Tue, 25 Aug 2026 22:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787696886;
	bh=ftyXNUAShr8G+TQ7YMTWv5LUSRg7LcZ+3d0SSDmHcWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jMHfhB9Sd0KsG0wRUicrEUEfv28T0qEj98ptriDWIaH0DTuJWZ2WaZDyjhB2zItWI
	 1/joGfaENDLBmDNbdn7KloeT7dHcx/VuV5jwodj8226zL4+mcI1RddiuQKIT/PG5n4
	 DWdBoYDku7+K0/1Qe83HRPp2jL17bOIBhLsIyzjL/DXYe3HFIYOyxM1qCZEoQftXtu
	 eUsFwQJj0O224gefVYEFsC9V5Q424mbM0iYHVe0+K5Nbn7ooeEZB+9/UUhdeaYx/N0
	 SB6tvKWNB2a15TyJZ9jMo3gBXzLmZz0QcveyfpTGSuUns/8CS1QGlECdWSj5lMz7HW
	 fSyAyPYSkYMtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260825221539.255951-2-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-2-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:28:05 +0000
Message-Id: <20260825222806.48D551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Properties `rambus,num-slots` and `rambus,slot-stride-bytes` des=
cribe software policy rather than hardware topology.
- [Low] The `rambus,cores` description contradicts its schema definition re=
garding multiple core instances.
--

commit 8265e37ff871f85826a6ac586fd7dcad414998e4
Author: Alex Ousherovitch <aousherovitch@rambus.com>

dt-bindings: crypto: add Rambus CryptoManager Hub

This commit adds the device tree binding schema for the Rambus
CryptoManager Hub (CMH) hardware crypto accelerator. The binding
describes the SoC-level node and its mailbox child nodes, detailing
their respective registers, interrupts, and VCQ ring geometries.

> diff --git a/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.ya=
ml b/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
> new file mode 100644
> index 0000000000000..d9598b0f3bbc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
[ ... ]
> +      rambus,num-slots:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 819=
2,
> +               16384, 32768]
> +        default: 64
> +        description:
> +          Number of VCQ ring slots for this mailbox's command queue in
> +          host DMA memory.  This is a per-board, per-mailbox host-memory
> +          ring geometry -- boards built around the same SoC (hence the
> +          same compatible) may use different ring sizes, so it is
> +          described per mailbox rather than derived from the compatible.

[Severity: Medium]
Do these properties describe OS software allocation policy rather than fixed
hardware topology?

Device tree bindings are intended to describe immutable hardware or firmware
interfaces. This property dictates the size of command queues in host DMA
memory, which the host driver dynamically allocates and programs into hardw=
are
registers. Should software tuning parameters like this be excluded from the
device tree?

> +
> +      rambus,slot-stride-bytes:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [128, 256, 512, 1024]
> +        default: 512
> +        description:
> +          Stride in bytes between consecutive VCQ ring slots for this
> +          mailbox's command queue.  Like rambus,num-slots this is a
> +          per-board host-memory ring geometry, not derived from the
> +          compatible.

[Severity: Medium]
Similarly, does this stride property represent software memory layout policy
rather than a fixed hardware constraint?

> +
> +      rambus,cores:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          enum: [0x02, 0x03, 0x04, 0x05, 0x08, 0x09, 0x0a, 0x18]
> +        description: |
> +          Core-affinity list: the hardware core IDs whose work is
> +          dispatched to this mailbox.  A core ID may appear on at most o=
ne
> +          mailbox.  Cores not listed on any mailbox are load-balanced
> +          across all mailboxes.  Optional (default: none -- the mailbox
> +          only serves the load-balanced pool).
> +
> +          Because each core instance has a distinct ID, separate
> +          instances of the same core type can be pinned to different
> +          mailboxes.

[Severity: Low]
Is there a contradiction between this documentation and the schema definiti=
on?

The description implies support for multiple instances of the same core type
distinguished by unique IDs, but the enum above strictly limits the valid I=
Ds
to exactly 8 specific values (exactly one for each core type). If a develop=
er
attempts to configure a second instance using a new ID, it will fail schema
validation.

> +
> +          Core IDs:
> +            0x02 HC, 0x03 AES, 0x04 SM4, 0x05 SM3,
> +            0x08 HCQ, 0x09 QSE, 0x0a PKE, 0x18 CCP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D1
