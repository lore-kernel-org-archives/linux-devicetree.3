Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A1490C12
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786046489; cv=none; b=NGl05HIOuebYq3F/5xdynehdj23xoaBYL8CKuNHmAps3cEWxijAWBRv7RGHrJ2P8/e+i+UIFmfhs2fdclI5zG1ToPAX0XTqGVwB9qls3HQYWbrOyzAxkBjLvLnviLj5dRBgza0Gv3UqYYr17UHCKajBNqg+F5nUGFN5HCIC98M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786046489; c=relaxed/simple;
	bh=FHeM0lwYAz7jXJg8ujfU83XZLe+pdHsY2kxbFPAoJ2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KzTa9OG/LFHU8RXPYNaZ8epA8tW2c7GhqauH+t+4Gt0IsKf9e/KwlGw2QdXc/URKjMR5uuJQXjbP0PsdL5M5UeiHLB8vqiHsbX42mINd3T9PoMA5W71bPm1qiTz07I1kt/dme1nEJqGiLF309FL/4eArgeRWRGdKuP9gIQ761hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Djzg/e6X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Djzg/e6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475B11F00A3A;
	Thu,  6 Aug 2026 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786046487;
	bh=KmdYkEQJJmpJQwLD93anp2KRDE6+BZP6rQ8D9R7tB0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Djzg/e6X4Y/XtlQ6WBZkaqDTsQev9D0c3Ls0JY6NMGvaQMfbJWFGs7yulkt2+T9lR
	 bOTh/mOYzHPvKP0n64x9GFXXxruif+qgbhZWT/9U8XP55on8L3Iet+HXFZJBsOoXvh
	 1QHijGGsbKyj0+rJDa6R7oOVYe4jCS/Nh9wtG8QpNzpiM6r3zJeJ7PjBnKt6wx9SR8
	 Y6lKVBt3aqkvxyPktD6c4p9B82r5/0HUwA/XngK0YhsBkj16Dl2ykVe1Gx3ppduLz+
	 Isfl4T64RmE9u+40JL/pxwMC1bkhP4JtEEPn89u1CoBI4DKAesCMVmywiQXWeaB9yU
	 9Xh08p5ETc7Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806195519.2703224-2-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-2-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:01:26 +0000
Message-Id: <20260806200127.475B11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `clock-names` schema uses an `items` list that strictly enfo=
rces positional sequence, preventing the valid use of the `rt` clock when t=
he optional `core-div2` clock is omitted.
--

--- Patch [1]: [PATCH v3 01/19] dt-bindings: crypto: add Rambus CryptoManag=
er Hub ---
commit 39b84af1941e37156bac8fca899b75a6fcb16e0b
Author: Alex Ousherovitch <aousherovitch@rambus.com>

dt-bindings: crypto: add Rambus CryptoManager Hub

This commit adds the device tree binding schema for the Rambus
CryptoManager Hub (CMH) hardware crypto accelerator. It defines the
SoC-level node properties and child nodes for hardware mailboxes.

> diff --git a/Documentation/devicetree/bindings/crypto/rambus,cmh.yaml b/D=
ocumentation/devicetree/bindings/crypto/rambus,cmh.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rambus,cmh.yaml
[ ... ]
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +    description:
> +      Functional clocks driving the CryptoManager Hub.  The block gates =
its
> +      clocks internally (integrated clock-gating cell); the host does not
> +      gate them, so these describe the input pins only.  The names, in
> +      order, are "core" (the main functional clock), "core-div2" (a
> +      half-rate clock present only on configurations with
> +      side-channel-protected cores) and "rt" (the real-time tick clock
> +      for the internal timer).  Absent on integrations where a separate
> +      management/power controller owns the clocks and Linux has no clock
> +      handle.
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: core-div2
> +      - const: rt

[Severity: Medium]
Will this strict positional constraint cause valid configurations to fail
schema validation?

Since the description for the clocks property mentions that "core-div2" is=
=20
present only on configurations with side-channel-protected cores, it appears
it can be omitted.=20

If a device tree node omits the intermediate clock and specifies=20
clock-names =3D "core", "rt", the second item in the array will be validate=
d=20
against the const: core-div2 constraint and fail.

Should oneOf sequence definitions or an enum-based array be used here to=20
allow omitting intermediate optional clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D1
