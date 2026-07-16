Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BBA2EA154
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199940; cv=none; b=iSgnNWENeVq9IQtlpnFYo/Az/hWDz1mF5iBz8/Qoqv4sOLM8+2WQjz9XyJCVhLB1OGePrXdKKhAvwO3NSm/H1Q03eWs0XgZUvD4adVnbK/5ZHrndMhxKWxI72Y9WkTqrN9pDK3R6W/5696ngJYS42QmMxIdm6jLfOl1CCDApxiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199940; c=relaxed/simple;
	bh=ynIhMjGDixdnR3Owb00aFGOJlCj1PlTo8D961yjvORo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ojoEHHhKeDHAQM0jSj4gTbFYocXFm3hW3xd0o6mAn64c4ncq/1t8xQViCY2SfdCqyr6CqRpt44bxLEIVW0xwxRHpXuTaNZJ3OP5068Jq6iiOD0TKO5Xb/z9TFh6jbkhCtUP9W4NTI9/r7sGki/btcVtycKvECIygTAcKXrWTzGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOQyVICZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOQyVICZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21AFC1F000E9;
	Thu, 16 Jul 2026 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784199939;
	bh=tvj0xAlNasnALYasJl64Cqf2swfTh/MvUmAZSpXEov4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cOQyVICZqwjV6dvWNRwRPRlBXH/+PJ9CxjKJiQl9463SLwuzOprKQ3PImtB0n+ytO
	 iZZaIRK2ZWO6N1erL7UbxGeMu4zKrxJLe3xRGxDT9wbdQmDTJs3Z9AxxQcp6k/K3+y
	 o2ZAj92XVQpaR++TF2v02/Fo62hdPfKgaXDR0wlSE6EH5/bAQxZRMvmN0b5nGlTgWw
	 obET29XSYgO8cYbYjE4xiq8FCKed44nLK9wv/qqCGMfluccJkGGV5rX/i8uSmz18G3
	 6i38aWFr8hRUvKq5m/Wv2q+qIAyx4t4/A4QEfSTRnQo5HpMcGwG2D1PzF15JTyVGKY
	 rmtU38ZY7VQXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of: base: Handle optional argument in
 of_parse_phandle_with_args_map()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260716-schneider-v7-2-rc1-eip-of-fix-v1-1-9b9383f936c6@bootlin.com>
References: <20260716-schneider-v7-2-rc1-eip-of-fix-v1-1-9b9383f936c6@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 11:05:38 +0000
Message-Id: <20260716110539.21AFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check on `list_size` causes an out-of-bounds stack =
write and read when `#<list>-cells` exceeds `MAX_PHANDLE_ARGS`.
--

--- Patch [1]: [PATCH] of: base: Handle optional argument in of_parse_phand=
le_with_args_map() ---
commit 22223dd6c28b67c741e12313ce0dc7dc5d351701
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

of: base: Handle optional argument in of_parse_phandle_with_args_map()

This commit handles the optional NULL out_args argument by providing a local
on-stack fallback object. This avoids unconditional null pointer dereferenc=
es
when the caller only wants to verify if the lookup works without keeping
the result.

Closes: https://lore.kernel.org/all/20260710183359.61D3A1F000E9@smtp.kernel=
.org/

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
[ ... ]
> @@ -1554,6 +1554,8 @@ int of_parse_phandle_with_args_map(const struct dev=
ice_node *np,
>  	const __be32 *map, *mask, *pass;
>  	static const __be32 dummy_mask[] =3D { [0 ... (MAX_PHANDLE_ARGS - 1)] =
=3D cpu_to_be32(~0) };
>  	static const __be32 dummy_pass[] =3D { [0 ... (MAX_PHANDLE_ARGS - 1)] =
=3D cpu_to_be32(0) };
> +	struct of_phandle_args _oa =3D {};
> +	struct of_phandle_args *out_args =3D _out_args ? _out_args : &_oa;
>  	__be32 initial_match_array[MAX_PHANDLE_ARGS];

[Severity: High]
This is a pre-existing issue, but could a malformed device tree cause an
out-of-bounds stack write to initial_match_array?

Later in of_parse_phandle_with_args_map(), the #<list>-cells property is
read directly into list_size without being bounded to MAX_PHANDLE_ARGS:

	ret =3D of_property_read_u32(cur, cells_name, &list_size);
	if (ret < 0)
		goto put;

	/* Precalculate the match array - this simplifies match loop */
	for (i =3D 0; i < list_size; i++)
		initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);

If a device tree node defines a #<list>-cells value greater than 16, this
loop will read out of bounds from out_args->args and write out of bounds to
the initial_match_array stack buffer.

Does list_size need to be validated against MAX_PHANDLE_ARGS before being
used as a loop limit?

>  	const __be32 *match_array =3D initial_match_array;
>  	int i, ret, map_len, match;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-schneider-=
v7-2-rc1-eip-of-fix-v1-1-9b9383f936c6@bootlin.com?part=3D1
