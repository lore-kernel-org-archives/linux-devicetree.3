Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D7E42A163
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555451; cv=none; b=EKwkxmmOGYipLgXKjriwLlqJ25UTcyLZpl6Fg3tbMc6ElGT93hBOodnNGxFd3a+d3qnNOWP5in/q+/i5yCKDBJikb5jNe2SGazxOTGddtLek/QTZvVyFw7OMi0BWXKguBuCnuU7yMmpEAt5e3s9K4qPv0ki866X8FctwM5Vt9vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555451; c=relaxed/simple;
	bh=3IxvsioRmv+3OdR5XIyOOeJFoNg3baeSlmiEDlcbqfw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g/8uTfFqeAscRTVdncOc3K+IBfnSNtmZY1wqsw6vVXiFf3sc3EboPqpCjQsWW8aebOGUFZkZ2d1P5eaOyvNYoHbufT/jjv/NPivFtseR4Nswx6Yl7GcUZbzyDMSkFf90m8gn31f91727nloxE2ftF1SuUNvxNX+Ynb+B/uzzHuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfzrXA0U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfzrXA0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC231F00A3D;
	Mon, 20 Jul 2026 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555450;
	bh=3LZZtVBf3O7ViI6J6aSZ990U+CiLLnApCg/TB1MuF84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XfzrXA0Uh4pBIVD24bVbLQhHPudmydfr+aNCVbVxo6LV6s9+oU1jslQSru0a225Ld
	 r3xgVUh3d1yl/f7GUBAueX5te/1lgDMeQ6u9nyW71noHEpnwwje8BY6p56rLKgmRZi
	 YKe6HIuADwGjOXv/IabCbPTsXIAtUxceiylHPSNuaELYEZIh+gnSm2yYkOI/MlkUiG
	 rULIsIXJoM8M/SN79elEqI25mTDMSivWbDQxcfOFjc9AOQMqBj4C3e92Jj2m9K/jiO
	 ThQbhaUUlFuY+F/Pf8ggBAS1xu8DjuO68yCVcKBZY+tt0xYyADta7kVGaWviOn/tE7
	 TtcW34mnhohHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 phy-next 2/8] soc: fsl: guts: add a global structure
 to hold state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260720133642.136324-3-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:50:49 +0000
Message-Id: <20260720135049.8AC231F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Dereferencing a NULL pointer during error cleanup if the initial a=
llocation of `soc_dev_attr` fails.
--

--- Patch [2]: [PATCH v3 phy-next 2/8] soc: fsl: guts: add a global structu=
re to hold state ---
commit dce21fc9192bcf2ec7c5c2e9639e43b7a6c53c57
Author: Ioana Ciornei <ioana.ciornei@nxp.com>

soc: fsl: guts: add a global structure to hold state

This commit introduces the fsl_soc_guts global structure to hold the DCFG C=
CSR
mapping and endianness state. It maps the memory once at initialization so =
it
can be reused during runtime operations instead of repeatedly mapping and
unmapping the space.

> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index f87ee47c15035..a2b4c477b064b 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
[ ... ]
> @@ -199,24 +202,23 @@ static int __init fsl_guts_init(void)
[ ... ]
>  	/* Register soc device */
>  	soc_dev_attr =3D kzalloc_obj(*soc_dev_attr);
>  	if (!soc_dev_attr)
> -		return -ENOMEM;
> +		goto err_nomem;

[Severity: High]
Will jumping to err_nomem cause a NULL pointer dereference?

If the allocation of soc_dev_attr fails, the code now jumps to the error
handling path which dereferences soc_dev_attr to free its members:

> @@ -269,6 +271,8 @@ static int __init fsl_guts_init(void)
>  	kfree(soc_dev_attr->revision);
>  	kfree(soc_dev_attr->serial_number);

Since soc_dev_attr is NULL when this allocation fails, won't evaluating
soc_dev_attr->revision and other members result in a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133642.1363=
24-1-vladimir.oltean@nxp.com?part=3D2
