Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8EB446BE8
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388499; cv=none; b=qlOOF+DkYlb8fJ+ExiXFS7T+62TQt15CaDDjQR168Ot7ZXLUqcEvvBISBBMi0h2szHXR8daP+iDjsOoXWEljyzFYIs3Vs0XbxGR2/Spz7uxspk73Z3RgaHVTNESuDjMkjH45o+wGHx/FpnbT6zbUCrSdEjxFPyurpe05fzPK9XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388499; c=relaxed/simple;
	bh=J8NrYo21n7l+1rmggLvz05II49AL0f2jq9trrLh+IhE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DSmqwsN9IVFq80af9kqr2Ci24pSvWcJuOfx8jmOItaD4H/dqaf5nWzfmiZYcFhAyqAy4TcR2gHSLgSN+mE7DiZSZYCHRNvEmdyjD+dRfhskgc9Vagrtz1PtQZzXiif49fRmiBM57RQmdNL/EUgDqTyMdlk7kGKlQXPy/RiwFTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyzITosm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyzITosm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3351F000E9;
	Wed,  2 Sep 2026 22:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788388489;
	bh=PfqTiu7xTCi0eI/DTXOAcAh9w1mINffaK2nnp/3qkTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyzITosmRBcmq7/zFQa+qMxRTJBaHvyeT2P/Yg49WaeEyclNndQ3W1g/ZiXp+/MaX
	 OVSVOl9mQypo8r+mMrQaikJO8AmQQRDOF9PQurFeo5nvqB60z9yg2sC++vr4gxe2U2
	 5pJSX30qcQia8yDMYZscsyc6k2pg8TxyGfLIGA2AOoEfbldXZi33IVUkg4oQjwxMO/
	 O2t2MYGcCOL6F5B9+a/73VXLlnR+CDncZzgMlitoBi8mKJ2Wr85ukbUc1c5BnKmYXU
	 tay9U8jvyvyzetlp9hpzGNcKItiyLSW8iebxB3WZFJlzp6WOgZ6+WxPoZ9PYe8RMHJ
	 Gg/ApMR4pc/+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902222759.736124-4-jm@ti.com>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-4-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 22:34:49 +0000
Message-Id: <20260902223449.8B3351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Architectural coupling of unrelated vendor platforms by hijackin=
g the Socionext Uniphier driver for a TI AM62p device, and potential synchr=
onous external abort due to unaligned MMIO access.
--

commit 72b4a8c2f112a40ac42acd9e0e7de236103e4616
Author: Judith Mendez <jm@ti.com>
Subject: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible

This commit adds the "ti,am62p-efuse" compatible string to the
uniphier-efuse driver. It leverages this nvmem provider to read
silicon revision information for the AM62p device.

> diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efus=
e.c
> index 6ad3295d31951..35977e1864135 100644
> --- a/drivers/nvmem/uniphier-efuse.c
> +++ b/drivers/nvmem/uniphier-efuse.c
> @@ -60,6 +60,7 @@ static int uniphier_efuse_probe(struct platform_device =
*pdev)
> =20
>  static const struct of_device_id uniphier_efuse_of_match[] =3D {
>  	{ .compatible =3D "socionext,uniphier-efuse",},
> +	{ .compatible =3D "ti,am62p-efuse",},

[Severity: Medium]
Does adding a TI K3 compatible string to the Socionext Uniphier driver crea=
te
an architectural coupling between unrelated vendor platforms?

This forces TI hardware to depend on a Socionext driver. If Socionext
maintainers add vendor-specific quirks in the future, it might break TI
devices.

Also, the Uniphier driver accesses MMIO using readb() in uniphier_reg_read(=
).
Could this trigger a synchronous external abort on the AM62p? TI K3
interconnects frequently enforce strict 32-bit access requirements.
Performing byte-level accesses on these MMIO regions might lead to bus erro=
rs
during device probe at early boot.

>  	{/* sentinel */},
>  };
>  MODULE_DEVICE_TABLE(of, uniphier_efuse_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902222759.7361=
24-1-jm@ti.com?part=3D3
