Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CDB81ACD
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745942; cv=none; b=JupJ93It2wlWFAP6X+T3t4dndlbjyJ8572lZR3EPP6R0beNTlWlNCv46x86SxX+pO/o4cfg2HRbx/lXXLVHeH9MCy0w5XKi67axNLfp/vfoHdOCtFF0I7/KkRQbp7UqZYcyk/qNBAIiiW+f96splUAKyCdxfIxVo242CJme3otY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745942; c=relaxed/simple;
	bh=OOb3wEWvI4H5Afl5+vVATt8nACZskd1f4sXndfJsktg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iizNcgCAdMIofcEJAYQeFKW3yH9YWgtUV3eaBEp/NBo53klOwUjDLhQlxZft5KAbm/yHoOyNyfRlZgdDoUj1TdxYnTLFA2QsWHTyHD0UrbZKOL6PlIdWkQxEdmJ2Tgw7pkytnkcMgeIltVDyp85qStVdAeFAURZeuuRw0ODAQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftrUczTB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftrUczTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFE01F000FF;
	Wed, 30 Sep 2026 05:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790745939;
	bh=ivbtUy2ZxJcdZD720j+5Z4bX3uRyU6rdp/R0iPMKDlk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftrUczTBzyxVuwayc4XU7hqGKxT8t8NDiNfveyh9y4uRX5ShFR4NUnT/8duu+CaE3
	 SSO0pQNeXkna/lUhwMoUYXx2KrsH7COT7jnF81AQUTCnbgetEMnE6e5fGCHIuFRuaN
	 qmDKQ4JTLa//yi/A/+nytTpeT/QTuMVhxbqJhofjFbIvXcx+nr9O9dC4WKB4s9KngV
	 sb5QkY1p+lNLY7WiNllwxawiJHoCx8OEGpTX/1X7Azi03OL30LbJNDy/aJGc8dAmW1
	 p3uNMcEg3nQUAIPmGyzURPoKMClJc0/UdpQ735DOIQxGr3yl6t/djK4yTcX0Xgf8sp
	 XULTnh9XgtdQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-edac-v4-6-c2e526f3ed79@aspeedtech.com>
References: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
 <20260930-edac-v4-6-c2e526f3ed79@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 05:25:38 +0000
Message-Id: <20260930052539.6FFE01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] edac: aspeed_probe() mixes goto-based error handling and scoped_gua=
rd
--

commit 5981bc9267f2b868500abbb2d7007597303a275a
Author: Ryan Chen <ryan_chen@aspeedtech.com>

EDAC/aspeed: Replace regmap with direct register access

This commit drops the regmap abstraction in favor of direct MMIO access
using readl()/writel() protected by a raw spinlock. It also adds compiler
annotations and uses cleanup helpers like scoped_guard() to manage the
lock.

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
Does this mix goto-based error handling and scoped cleanup helpers in the
same function?

The subsystem cleanup guidelines state that the expectation is to never mix
goto and cleanup helpers in the same function. The guidance is to convert
all resources that need a goto cleanup to scope-based cleanup, or convert
none of them.

Looking at aspeed_probe(), it still uses goto labels for error handling
further down:

	rc =3D init_csrows(mci);
	if (rc) {
		dev_err(&pdev->dev, "failed to init csrows\n");
		goto probe_exit02;
	}

Should the goto labels in aspeed_probe() also be converted to use cleanup
helpers to avoid mixing paradigms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-edac-v4-0-=
c2e526f3ed79@aspeedtech.com?part=3D6
