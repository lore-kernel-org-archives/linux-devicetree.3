Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298CD2045AD
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550000; cv=none; b=PKaGLWuzUSO+2Sz0yQf1FxahIPk8UtSA8pb3QDDp23we03gwyU6ZUjJFsvSW8I7aNOJmiLYTz/nNKU8CHjGjpls3fl7Owasqn9NdI4qb/TZr8a5iZoQL/VA8vQF9gtrx79UMp8O/IKtv7tgnD5Lxj9Wg3XrDHXEF02P8kvacCu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550000; c=relaxed/simple;
	bh=Cz5Kia7l1JVpormx9PnpguA10TtRBRRcYgWwea62nzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lgng+JXu0iVTnKAFHW+lefIa9Ub0lgDmN+kXX5KAnF3bda3VTkp1cv2rLMGEz0anviQhBhOn/UQ6SoqcvHN6iQc86tguz5UzcTRlkp0LRyR4Khipt7j6qhFlwjP9cHQqGIoLc6InT0OHQ9TyQ6w1yKu+79dPggNMYVFohq4+VhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOjY+ZnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOjY+ZnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661F41F000E9;
	Wed, 12 Aug 2026 15:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786549998;
	bh=3o5mkkrUj6Bv0Z7TbueX8ouok9qHdB3lSW32jYdARrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOjY+ZnI3MmQcsDQMB4b3oSGQdw64ab+SDylmrB2V6f2o9Ym4Dru3kiXqY8Wrz26C
	 g884cEqDjeTkBPokeO5hndz2WhJDirjTQ0ykXWgqYMvCH3M7AhffaNqmeQUDSUV0kt
	 E0VRY+KoFQ272ZI4uvDNTzULJSkSxy7paQ9HWMPa2Eq1hCepJuszn93WpIVeC6v3j5
	 e2QMrWlBn5mNtiIdd+Il3JJRXDeIfh5fEw9TIfU+NkpardbH2wbl9Fn809cua6lta6
	 CctPwqcJHLaPnKEANaziGP3s+5S2ZPyQ/zVhUhrlI/oUQ/WeJqXa7DYSIT4o4Gg25P
	 SceF3OW4yFTUg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812154442.3379851-2-jm@ti.com>
References: <20260812154442.3379851-1-jm@ti.com>
 <20260812154442.3379851-2-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:53:18 +0000
Message-Id: <20260812155318.661F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `ti,am62p-efuse` compatible string is defined as a stric=
t enum, which restricts the device tree to a single compatible string and b=
reaks either schema validation or driver probing.
--

--- Patch [1]: [RFC PATCH 1/3] dt-bindings: nvmem: uniphier-efuse: Add ti,a=
m62p-efuse compatible ---
commit 01e7317fd79335e120dd2b35a4568250c0ecab6c
Author: Judith Mendez <jm@ti.com>

dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible

Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
The uniphier-efuse driver can be used to read AM62P efuse registers as
well for GP_SW silicon revision detection.

> diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-e=
fuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efus=
e.yaml
> index e27cbae2d63a0..5e1b90fc1ae45 100644
> --- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.ya=
ml
> +++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.ya=
ml
> @@ -16,7 +16,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: socionext,uniphier-efuse
> +    enum:
> +      - socionext,uniphier-efuse
> +      - ti,am62p-efuse

[Severity: Medium]
Will this strict enum definition prevent the driver from probing or fail
device tree validation?

Looking at the driver's match table, it does not include the new
ti,am62p-efuse string:

drivers/nvmem/uniphier-efuse.c:
static const struct of_device_id uniphier_efuse_of_match[] =3D {
	{ .compatible =3D "socionext,uniphier-efuse",},
	{/* sentinel */},
};

If a device tree uses a single compatible string "ti,am62p-efuse", the
driver will not bind because the string is missing from this table.

If the device tree instead uses a fallback string like
compatible =3D "ti,am62p-efuse", "socionext,uniphier-efuse" to allow the
existing driver to bind, schema validation will fail because the enum
constraint expects a single string and rejects arrays.

Should this binding define an items list with a fallback, or should the
driver be updated to include the new compatible string?

> =20
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812154442.3379=
851-1-jm@ti.com?part=3D1
