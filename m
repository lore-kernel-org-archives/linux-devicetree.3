Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C6C303C8A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787540263; cv=none; b=jOM48/WQLaLVQyBe2pD+BWoIPlOTh5V5lKQz2Sl16quaSPuQlPdE/4UsAF6PTbVb0ntrgSDYI6f6Cs2+oT9fNwB/nNa8QJk6YzN6qCFB+yIuL+rBJOeg4a1mZRfLIEP19SvDCzVMlD/P6RzAXdyQD5BU9pJhF0B+rycrePoon4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787540263; c=relaxed/simple;
	bh=yK/5EF1fZ7O6Hl17mfYdd+lCaWscqcKUGipob+Pg3Mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D/+6OfUw/nDmHjI8Va3csDersVR87pMNBX76aXQZQ/CLQgs4z0s4sN2dFXjMr83qgQoDF3BVARJs6lMlpEX2U29ygGHdvJ0xrtCWwsseDBWkBzzrBgGZMJ0t9VCVAc3Ivd978qNt0+C6kCibOten/7+UQH1ERM3YunEKt9hZZGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTZ3qMAL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTZ3qMAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344181F000E9;
	Mon, 24 Aug 2026 02:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787540261;
	bh=eyypdOYIeuWCxFeN78GYIfRva5CNb69jbLRN9JrB9Nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DTZ3qMALms+1ptcfQXoHw59MLGUF9/PgEPSXs25BA5ukwnGnmctCuhs5KV4xboFRp
	 fVGvdrPQszlYjTrWNbrdTAqnIb1tOlwOn/mMQK4WaikAggFMUAslQ13axCUmSuXLcX
	 GtU+ScCUB5cagUV+MHc3uNLP1T0SFPjEf0LwITvfSvwwwYBadCU37AcyCx8njIP/05
	 6dDJ3ryEPT7LdZ4a/ho/esr6tt6tx7RdxXxTfsLj71pnRqfWlyrtDhrM64ua1nkVno
	 5TbEM6fUprhYne7VNVxOuAsZBEgAJyboRrTa1r/Xw+FFXfEDGVB6uCeQZNjtJJh1bM
	 BMoPbN4BehokQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] EDAC/aspeed: Replace regmap with direct register
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-edac-v2-6-c8d8bb693586@aspeedtech.com>
References: <20260824-edac-v2-0-c8d8bb693586@aspeedtech.com>
 <20260824-edac-v2-6-c8d8bb693586@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 02:57:40 +0000
Message-Id: <20260824025741.344181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mixing scope-based cleanup helpers with traditional goto-based erro=
r handling within the same function.
--

--- Patch [6]: [PATCH v2 6/8] EDAC/aspeed: Replace regmap with direct regis=
ter access ---
commit 707abf914ceaccc2e73503abf17a6380b0fc949b
Author: Ryan Chen <ryan_chen@aspeedtech.com>

EDAC/aspeed: Replace regmap with direct register access

The driver instantiates its own regmap purely as an MMIO wrapper: it has
no register cache, uses custom .reg_read()/.reg_write() callbacks, and is
not shared as a syscon with other drivers. So it brings nothing here
beyond the spinlock that regmap takes around each access when fast_io is
set.

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
Is it okay to mix scoped_guard() with goto-based error handling in this
function?

According to include/linux/cleanup.h, the expectation is that usage of goto
and cleanup helpers should not be mixed in the same function.

In aspeed_probe(), we introduce scoped_guard() here, but the function still
has goto probe_exit01 and goto probe_exit02 later on:

aspeed_probe() {
    ...
    scoped_guard(raw_spinlock_irqsave, &aspeed_lock)
        aspeed_regs =3D regs;
    ...
    rc =3D init_csrows(mci);
    if (rc) {
        dev_err(&pdev->dev, "failed to init csrows\n");
        goto probe_exit02;
    }
    ...
probe_exit01:
    edac_mc_del_mc(&pdev->dev);
probe_exit02:
    edac_mc_free(mci);
    ...
}

Should the remaining error paths be converted to scope-based cleanups, or
would it be better to avoid using scope-based cleanup helpers here?

> =20
>  	/* bail out if ECC mode is not configured */
> -	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
> +	reg04 =3D readl(regs + ASPEED_MCR_CONF);
>  	if (!(reg04 & ASPEED_MCR_CONF_ECC)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-edac-v2-0-=
c8d8bb693586@aspeedtech.com?part=3D6
