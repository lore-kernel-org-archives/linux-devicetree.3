Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F681E32D6
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354160; cv=none; b=aSgnxftRxa/oQzEscwHtWypxWlxDTgVyCQQJrm+pV4sjuC+ZK2nHjk4Z+Ja/TYV7pKCgk9yUkZoE4oVY23BSdLlD6qNoQQy7CGRKpfKo0Uhi92m0xqV4ZaoH+I9KkL4mPfo9w07ZxuKGwWPGyTL2WoP+BFTsNv/rpezrg2t2sMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354160; c=relaxed/simple;
	bh=AOp5uEr6z6w4Wkp8WfC36bN1Bn8m/wa2Vaoqkth54FI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=X6DFGSqiOjoBCss2jXkcBdRFQoZlpml97y4+YDOh7TdZbugJGS5F7vN1sHYc7E3ZlDQy4DjxhmAK+r1XDx0fTpT8ZTVFcgmdJHfZ7XhrW7g0JcZrDgXEqKVp5sR0KLa92w7JJ2zHcu5njFpSwsLE3B2Kg8wetefUKvg4U5vimhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhT34U7+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhT34U7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCC61F0089B;
	Wed,  7 Oct 2026 06:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791354159;
	bh=PQSicoteFRX7ZVxI14Kb7Ap4c72YchRUx8NB9F8nY44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FhT34U7+8VqbN98qy7h+VHr7vb00ROQLC7DiJGMo0fYaNOJapQzx93t2TDJZghdUs
	 k4aJ/hoAmqrcx+0YmxTl9HNxmo2I2S1CzbQx8E2/z13wF7DP6rXDyOEQwIOqrkr/Il
	 q5CPVaSo5TSAtPz8hSG/OX0+iHzxKRhSpUYOKmruhduUIsPfGjF/ohtn9vp7W93tzT
	 ana1+KWnJ9ecmxT517beVz0d+tCJAdDNy9Ztm98JjALi94FAHdDhyo3vFhhVVuzu17
	 BVKsaWAstJ93yxEJm5Ndp7kH/TyhiUky2OS1pvrkuO1F7rdv/z/q968Q6Sd6ZHg3AL
	 k8IMr9nxFED7Q==
Message-ID: <sashiko-outbox-162667@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261007-edac-v5-6-5c31fc5df4cf@aspeedtech.com>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <20261007-edac-v5-6-5c31fc5df4cf@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 06:22:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] cleanup: mixing goto-based error handling with cleanup helpers
--

commit deee611aba8be1433a92290de22d7d73ee5ad14d
Author: Ryan Chen <ryan_chen@aspeedtech.com>

EDAC/aspeed: Replace regmap with direct register access

This commit replaces the driver's regmap implementation with direct readl()
and writel() accesses protected by an explicit raw spinlock. It also adds
context analysis annotations to ensure hardware register accesses are=20
properly locked.

> diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
> index 610da8aa2a228..124e8a39eaaba 100644
> --- a/drivers/edac/aspeed_edac.c
> +++ b/drivers/edac/aspeed_edac.c

[ ... ]

> @@ -276,13 +248,11 @@ static int aspeed_probe(struct platform_device *pde=
v)
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
> =20
> -	aspeed_regmap =3D devm_regmap_init(dev, NULL, (__force void *)regs,
> -					 &aspeed_regmap_config);
> -	if (IS_ERR(aspeed_regmap))
> -		return PTR_ERR(aspeed_regmap);
> +	scoped_guard(raw_spinlock_irqsave, &aspeed_lock)
> +		aspeed_regs =3D regs;
> =20
>  	/* bail out if ECC mode is not configured */
> -	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
> +	reg04 =3D readl(regs + ASPEED_MCR_CONF);

[ ... ]

>  	rc =3D init_csrows(mci);
>  	if (rc) {
>  		dev_err(&pdev->dev, "failed to init csrows\n");
>  		goto probe_exit02;

[Severity: Medium]
The aspeed_probe() function introduces a scope-based cleanup helper earlier
in the function with scoped_guard(), but continues to use legacy goto-based
error handling here and in other error paths.

The kernel cleanup subsystem guidelines specify that usage of goto and
cleanup helpers should not be mixed in the same function to prevent confusi=
ng
ownership semantics and LIFO ordering bugs.=20

Would it be possible to convert all resources in this routine to scope-based
cleanups (for example, using __free() for the EDAC MC data structure), or
alternatively, rely entirely on the existing goto-based error paths and skip
using scoped_guard() in this specific function?

>  	}
> =20
>  	platform_set_drvdata(pdev, mci);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-edac-v5-0-=
5c31fc5df4cf@aspeedtech.com?part=3D6
