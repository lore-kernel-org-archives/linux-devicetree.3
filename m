Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ACB37FF50
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537212; cv=none; b=qOfHCTsRVeYzK7XpLtzwoCRHz6ouY9j0ESn+6KUc7qke2Uj7ajMOZULUmXh9OCa3axplzKBkL3DpRBNHOKdmjpO660gWTpq2+nupS4lVuVlpQ4Z9GBadkpMVJq2pXx0Roj6oCdHKIIrxxXs/aT/rt4+b6Um5Z59mYIGn07NtlPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537212; c=relaxed/simple;
	bh=mx7mLPsaw7bF5okwV7PIc9RtwDm0H7dwTaaN3r7ig1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oAExWdgrCp0YoBwBqTcZlOkVscw2w0QV6Fwzt0RCoZfeGBebcRNKlASO+mpYDxP0eRcefBKIe0fiextIilnai9TzZmsKgnx2tOIMGS8MMWdUJ9Hpx4CdYSro4gLMn6VdNvGrTOj+gPPp/l82ISq+HV2YTnptE/i4XroGc8mMZzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HacZH3z+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HacZH3z+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADE81F000FF;
	Wed, 16 Sep 2026 05:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789537211;
	bh=O3n8Q3qIZ0krQy6rBiVNkMh2kC/miN09qqD/ANWrs7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HacZH3z+xAppQOYxWmYA4bwcaLb+ST1llGH65t+4GY2xA2dBy6fdm/GTcQtVqmkoI
	 zQlvsNR4aXLrYZ2lDgueE042UyEf5ff6c72CMTI6bjn3zxo30lxX/nrmzGH27uPx/H
	 m8iGtGCy/LeuRYo/h+sbFEkuGi3tOCSQhL9j/l+CXQL8j3VeeOv/LMjAFklwZQ+RhT
	 h++xUFBE6W9TqnArqNrkjLf1AmzscDy8ERbBmlF0AJ0yReuT7bhm1FznyJALA5YaZV
	 tAlnZS9tc3LG9Bb17AewsbJQJmELRYN3TT28gNlwDQTQS8E6RbYUuCcl/nUJ3SfCVa
	 0QN9bDtxA2+Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916-edac-v3-6-23e9ed2fbdf9@aspeedtech.com>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
 <20260916-edac-v3-6-23e9ed2fbdf9@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 05:40:10 +0000
Message-Id: <20260916054010.AADE81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] cleanup: mixing goto and scoped_guard() in aspeed_probe()
--

commit c14b25ad0230e696e88f285c08700b9c02f83c19
Author: Ryan Chen <ryan_chen@aspeedtech.com>

EDAC/aspeed: Replace regmap with direct register access

This commit replaces the regmap-based MMIO access in the aspeed-edac driver
with direct register access using readl()/writel(). It introduces an
explicit raw spinlock and annotates the register base with __guarded_by()
to allow compiler-based context analysis checks.

> diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
> index 352910e1defc5..26d2c456cc0d6 100644
> --- a/drivers/edac/aspeed_edac.c
> +++ b/drivers/edac/aspeed_edac.c
[ ... ]
> @@ -274,13 +246,11 @@ static int aspeed_probe(struct platform_device *pde=
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

[Severity: Low]
Does this mix scope-based cleanup helpers with goto-based error handling in
the same function? The subsystem cleanup guidelines explicitly forbid mixing
goto-based error handling with scope-based cleanup helpers (like
scoped_guard) to prevent ownership confusion and leaks.

Looking further down in aspeed_probe(), the function still relies on goto
for error cleanup:

> -	/* bail out if ECC mode is not configured */
> -	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
> +	reg04 =3D readl(regs + ASPEED_MCR_CONF);
[ ... ]
>  	/* register interrupt handler and enable interrupts */
>  	rc =3D config_irq(mci, pdev);
>  	if (rc) {
>  		dev_err(&pdev->dev, "failed setting up irq\n");
>  		goto probe_exit01;
>  	}
> =20
>  	return 0;
> =20
>  probe_exit01:
>  	edac_mc_del_mc(&pdev->dev);
>  probe_exit02:
>  	edac_mc_free(mci);
>  	return rc;
>  }

Should this function either be completely converted to scope-based cleanup,
or stick entirely to goto-based cleanup to avoid this pattern violation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-edac-v3-0-=
23e9ed2fbdf9@aspeedtech.com?part=3D6
