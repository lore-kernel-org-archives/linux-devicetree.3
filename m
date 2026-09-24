Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A82313E21
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259927; cv=none; b=JN/QXWf6w6qHH9dZ64q/jjtxFYnsyvc5ecCZVxtA1oLbH6N0Pn8txRzj/PMhu9ac1IpnEODtFMcE9chNYmqvI6MsUgS7JwB8leMpB6wD2U3+zlSH1iLc+mEEj1DxPnXBbiEYVb1LugfUBYLpHmxdRvrzvEAz+L3t0HTiUEobAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259927; c=relaxed/simple;
	bh=dDUPlNPyInh1xihUbxARMouhkHhpJcY9vHzztHZbpls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fq17xQefzr7GIFLjcnhIGHf+mDs2hJSeA+bOKH3pmTKGfKCohjT4wWRa7Mgzw9JG28H2edVlX/m2GRA6+5MbVvHH0D9WweluJoMJLVzxY3d4+XguRpD8WjBnvjjN+xmXcnqvz7ui93WLSnNIJIYnzKtt29iexQal4wHOH+NWmxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaTuu4CJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaTuu4CJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC771F000FF;
	Thu, 24 Sep 2026 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790259925;
	bh=iZU/r+PQkRBztyXmLF2+vHsMG5IkZPWGFTqUbBDNKEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MaTuu4CJ0RyEvarQgxxoQAu54+J2RJHrwDfdptLxHyJTGNnPrThrCHpOUNOEIeafw
	 nWkPD08fHqAY2iTcn8rQhtkv7EXyO2trtehc4Uud8icbpPp70GUMNoXy/cF2i99bbQ
	 DO1+5ga3TIJgsX0zr3Fm5q5vCpdV0+XOm+IfgxbVXnBl49zcOXH1W7JTKKAov4X83a
	 ePajZOy0iMy9F4aIUpBB3iu5V+EL4WUuGed3d6QuadxIE/PbHAl6WZwgUcGdT7gMvO
	 a/CqkSvFwKL4PpV3QaeCep+JiZ01v++0zipp2Sl60/KtzimGQwAUriZQ49JocgIldD
	 fFg3Zs0CwwwfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v3-2-bd8054a5b180@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-2-bd8054a5b180@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 14:25:24 +0000
Message-Id: <20260924142525.6FC771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: build failure due to non-constant mask in FIELD_MODIFY()
--

commit 15d5e31eb920d20f3a957994bd91676f00f4633a
Author: Paul Louvel <paul.louvel@bootlin.com>

EDAC/cadence: Add Cadence DDR EDAC driver
   =20
Add the Cadence EDAC driver found on the Renesas RZ/N1x SoC. The driver=20
adds support for single bit error correction, double bit error detection,=20
and software scrubbing.

> diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
> new file mode 100644
> index 0000000000000..409cc792b534e
> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

[ ... ]

> +static void cdns_rmw(struct cdns_mc_priv *priv, u32 reg, u32 mask, u32 v=
al)
> +{
> +	u32 regval;
> +
> +	mutex_lock(&priv->lock);
> +	regval =3D readl(priv->io_base + reg);
> +	FIELD_MODIFY(mask, &regval, val);

[Severity: Low]
Will this cause a build failure with certain compiler optimization levels?

FIELD_MODIFY() relies on __BF_FIELD_CHECK(), which requires the passed mask
to be a compile-time constant via a static assertion. Because cdns_rmw()
takes the mask as a parameter and is not explicitly marked inline, if the
compiler decides to outline this function, the mask loses its compile-time
constant property and will trigger a guaranteed build failure.

> +	writel(regval, priv->io_base + reg);
> +	mutex_unlock(&priv->lock);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-paul-v7-3-=
rc1-edac-v3-0-bd8054a5b180@bootlin.com?part=3D2
