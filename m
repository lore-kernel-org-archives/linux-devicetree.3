Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B13D45CB
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690381; cv=none; b=PhsTKDgnlxlOEb+JSG1ntsetszmZQyMCk9OsF1MwkF9FpOCc4ENgo/azo49OS8P+AmvxfPbrhUUBoB+6drWlfr1WMqHCnPs9kGRwNwcDYlXLm2+rdBg4mN8wxv85d5hSHXm2h9tRyQLwmhyvc651pdWVfc6zrnyZAwgIlGntcXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690381; c=relaxed/simple;
	bh=vxkw8XvuuW0zW1Wfmu+OsdLiisNK4i8ADw399bCV/F4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pylM6yrRTokSzYY6/zJsutB4SqITvYjeot9G72td7nB6wta6fvSN9iCXUWcgwwmMOdbrIPmAuZMHFAQuqPzp3aK0Sb+qVx+p3x8b4zxitrAv1maNz4W/T+M/IswId9amI66mcL8c4EBc0rvi3DPqXWCTVvjLamQXOVTT4CyfRDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNmshquw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNmshquw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212311F000E9;
	Wed, 17 Jun 2026 09:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781690378;
	bh=aZGxYfOht8yQWyhKKmxpniD+FQNp8uNkUu0Pj7RuSOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cNmshquwOh1wdI1vPdVMkq0PYVDeJlZBm6ckKzBblvRlBQKq6hyjim1/Ecs3d08QB
	 0XyGIsNn0owhsyBKvHxl7bhW1wiEJtsK0L64zHKXvlUVXoZCIOLnggCTwSpN4XNmHF
	 08zPFQV42kxU8SczUzK3fat81TGn5c0YdyS0qjJd58l4KXUYkRL9MlpdzCys/CoS/5
	 2YI38gYWeLAx2E6jd6bCmo3btyjYcXL5jCHgCBBCx7keImZ8qu1C7WbcOK1vJVPpqB
	 2m4T+hMO8SojUAWNdvW/ubuo9j5i0bSKisUebW6N4eICo5DaN0XYtlSC2uBnOhY4tx
	 6aNOSJfAAXJlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] mfd: mt6397-core: add mt6323 EFUSE support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617-mt6323-nvmem-v2-3-4f30e36aa0f4@protonmail.com>
References: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
 <20260617-mt6323-nvmem-v2-3-4f30e36aa0f4@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 09:59:37 +0000
Message-Id: <20260617095938.212311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unchecked grandparent pointer dereference in mt6323_efuse_probe.
--

commit 9ff4fcd2490678b446194f62f1baf75c41828eff
Author: Roman Vivchar <rva333@protonmail.com>
Subject: mfd: mt6397-core: add mt6323 EFUSE support

This commit adds the mt6323 EFUSE to the mt6323 devices array in the MFD co=
re.
This registration allows the corresponding efuse driver to probe using its
compatible string.

> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 3e58d0764c7e0..362737a1c4a9a 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -125,6 +125,9 @@ static const struct resource mt6323_pwrc_resources[] =
=3D {
> =20
>  static const struct mfd_cell mt6323_devs[] =3D {
>  	{
> +		.name =3D "mt6323-efuse",
> +		.of_compatible =3D "mediatek,mt6323-efuse",

[Severity: High]
Does adding this compatible string expose an unchecked pointer dereference
in the efuse driver?

Looking at mt6323_efuse_probe() in drivers/nvmem/mt6323-efuse.c:

mt6323_efuse_probe() {
    ...
    regmap =3D dev_get_regmap(dev->parent->parent, NULL);
    ...
}

If the driver is instantiated directly from a top-level device tree node via
this compatible string instead of as an MFD child, dev->parent will point to
the root platform bus. Because the platform bus has no parent,
dev->parent->parent evaluates to a NULL pointer.

Passing this NULL device pointer to dev_get_regmap() causes devres_find() to
unconditionally dereference it. Would it be safer to add a NULL check on
dev->parent and dev->parent->parent in the driver before doing this lookup
to prevent a kernel panic?

>  	}, {
>  		.name =3D "mt6323-rtc",

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-mt6323-nvm=
em-v2-0-4f30e36aa0f4@protonmail.com?part=3D3
