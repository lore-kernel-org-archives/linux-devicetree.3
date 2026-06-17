Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A6F3E638E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696223; cv=none; b=LmuwoI202wEcDY6NDzDiP/IHGMnyQVoSAJZ27HV9mezzP6uaeOfMVRh5LDw/jlvVkIrudMdAdccnn7rEp4p9mLO39Zr0PV98uJRWxdGG+QqZ9jf8a4ZPv/ZKeLOqu/btAkb6c6tuevtJpQooeq1SKXnPKOQgK0GwcRwgPaEoNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696223; c=relaxed/simple;
	bh=SiUgdxQngw/T5yFa0vsy39MbcKcD3q8S6Z+CM4QwRWk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r2Iu0TnG6XyuxDEtseHK9ut2L/N6FVI1xr8rxg8pJmszb5XZZBK2f8NwDB5Aw9L+Wh6Bd7dNDvzM2C/RGURehvoHUASJl686PiOC8GjYJXBOm+9wwq5GNwb+YJj2Z/9+cnZhzzXYfXNUdLHRbrLccMBkwrArqT+3Mw6UdOgJiY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naqa9CBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naqa9CBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8831B1F00A3A;
	Wed, 17 Jun 2026 11:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781696221;
	bh=cNSauPqspIKorUpVhjB9qEi4i4JZ8YC79hY2mqPfNr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=naqa9CBh/OF4fUZHHgOsmW6ZsNThPBDzKMIaHTxCB83cCkq9ccLmefpmHmiUy1JOb
	 DrDe3rFPy8fIGPHJD/UKMXszpZ+xYznFnxFZzFtzW3tIfvOadC/3LXkUu7zZOQrvQR
	 9X7d35VxraGzfYvpYr1sSjJW2ld80vPx6DAS21VwEo2r45nxetyJn0FeMsAUwOmLhv
	 17hEX97iNIjf0w4l3YYYwgzZK0KzpUB/61dcrfvEtLxpfcJkWtyxqJNmqzMm6Ma8Jv
	 SK4Hbbh6CYR2RCbxWDc3czCXDZzIbGfsGoo4znZOrElbhua09HmG4UA/ryT2+StjyR
	 Zxs0fTqwXC/qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: rng: timeriomem_rng: add width and
 mask properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jad Keskes" <inasj268@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617112642.1897096-1-inasj268@gmail.com>
References: <20260617112642.1897096-1-inasj268@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 11:37:01 +0000
Message-Id: <20260617113701.8831B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Use of non-standard `width` property instead of `reg-io-width`.
--

commit 7dac0db93dcf3017652753bebd5c0a2a7a2a06b5
Author: Jad Keskes <inasj268@gmail.com>

dt-bindings: rng: timeriomem_rng: add width and mask properties

Add optional width (8, 16, 32) and mask properties to the binding. The width
selects the bus access size for reads, while the mask allows filtering out
non-entropy-bearing bits.

> diff --git a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml b/=
Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
> index 4754174e9849b..636305f211c88 100644
> --- a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml

[ ... ]

> @@ -26,16 +40,26 @@ properties:
>        instead.  Note that the default quality is usually zero which disa=
bles
>        using this rng to automatically fill the kernel's entropy pool.
> =20
> -  reg:
> -    maxItems: 1
> +  width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 32
> +    enum: [8, 16, 32]
>      description:
> -      Base address to sample from. Currently 'reg' must be at least four=
 bytes
> -      wide and 32-bit aligned.
> +      Access width in bits.  Determines whether the read is performed as
> +      an 8-bit, 16-bit, or 32-bit bus access.

[Severity: Low]
Should this binding use the standard reg-io-width property (representing the
width in bytes) instead of introducing a custom width property in bits?

Using the established reg-io-width standard prevents fragmentation of the
device tree API conventions for specifying memory-mapped I/O access width.

> +
> +  mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0xFFFFFFFF
> +    description:
> +      Mask applied to the value read from the register.  Bits set to 0 in
> +      the mask are cleared in the output data.  Default (no mask) passes
> +      all bits through.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617112642.1897=
096-1-inasj268@gmail.com?part=3D1
