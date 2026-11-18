Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005769;
	b=4aCp6Gynkfvzsb1cKJYcP/k0OYjw7T3HlpfAjuKfItBDuX028TP0Z9A4uBEXlPhYF3qf
	 4NPMO55fJksWKZvEFQ375X09cjfczPZRUBazFCuKbYuzN7jX6iEes3NlI/7fnZKz+tXad
	 jWbfrGSXRxxuUzWe9mtmniLpZ6hzCL+qHD+rQJ1p4rENBULtpcEiM5OH0nduKKPKuJ/wq
	 vEbGokPmgMhAMncbExFFF3dFZ0j+bJz/H47LTodF8ZhdoCaL1BJDqLZPG9LcB6k6taqCL
	 s8BEe/ZRzoNwCTXh1Bn1x5yjPth5IL3sOoXkmdlLAxWcNLVrFAIzq9t2tXHRNx/ldKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005769;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MgFNU5C40TPfrBUTmNx+hqb4PiNyRSw3kYfOCNVzPY8=;
	b=dMGd3uFBacOClg3J2vWh3raiElCJ38apQYsh473hNq9PvoXzT6E8n86gNo+0Gp7Kau02
	 QOLpwehBKv8Tzhsyn2dbVtlGWXPGXbKLnMaIsGST3TSdsH0M0cqLi8GFCPiIRysCnGTKg
	 KwsI+kU5pQJ/+eyuX8nkCsyXPvc+G9lkdyPFkmjFd3SR3R2rMcT1K16609+nyg/69qvrO
	 GC9ZQq4BmO1Vj5U36NC+KW2d6aPbFmG+NWBXQQgjFILTxgEfG9CKVx1ZQPEpKBVrqadIz
	 Fuhs6tbW5Q3/nR4O3C0+E95H8qGtJmMts7Rp5IHIL3+ADte7o0jdT+XvvYBsbXf8/iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxDMY+Wm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF35360A2601
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxDMY+Wm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDD51F000C4;
	Wed, 18 Nov 2026 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005769;
	bh=MgFNU5C40TPfrBUTmNx+hqb4PiNyRSw3kYfOCNVzPY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxDMY+WmzUUfI5N73s2tLKRRXF0VD0KKBBfe/TERe+mqdAiG1mqBDkOFnUnqEdRZT
	 KTfHdzk1kEcteUkmbvi4DnxaIDgwU4cC9Jyoklhs/4KtG+YHECY5xS4XoFv2ZMOV77
	 nT/T5Fp64a9+xPIL0cKjXla2C5OA9Ih9WGHnohe/PTzEGS3HJoHb20rceeHPl9MY13
	 33pZyL5uE74VhoF5jq6uxjh2DJtERacZyddOZLs50DbBwOJAB+tF7/bs7SUiIM/CtC
	 Jb3jSHaLuSLsSsymad2+1dJ8YoU4yK/D/G+IhZmOs8LiKNacMO8axudmcr3UV+/11w
	 Z0UXq4JT1CkRQ==
Message-ID: <sashiko-outbox-220924@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 04/15] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117123956.11981-5-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <20261117123956.11981-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:42:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: pcs: fwnode_pcs_get_from_pcsspec() clobbers
  fwnode_xlate() error codes
--

commit e6f4f8b873c7eec5313ef7cfbc2796106104d93a
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

This commit adds a firmware node PCS provider registry and consumer helpers
to look up, count, and parse phylink PCS instances from firmware nodes.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..b1d48f6eee7f1
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c

[ ... ]

> +static struct phylink_pcs *
> +__fwnode_pcs_get_from_pcsspec_provider(struct fwnode_reference_args *pcs=
spec,
> +				       struct fwnode_pcs_provider *provider)
> +{
> +	if (provider->fwnode !=3D pcsspec->fwnode)
> +		return ERR_PTR(-EINVAL);
> +
> +	return provider->fwnode_xlate(pcsspec, provider->data);
> +}
> +
> +static struct phylink_pcs *
> +fwnode_pcs_get_from_pcsspec(struct fwnode_reference_args *pcsspec)
> +{
> +	struct fwnode_pcs_provider *provider;
> +	struct phylink_pcs *pcs =3D NULL;
> +
> +	if (!pcsspec)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&fwnode_pcs_mutex);
> +	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
> +		pcs =3D __fwnode_pcs_get_from_pcsspec_provider(pcsspec, provider);
> +		if (!IS_ERR(pcs))
> +			break;
> +	}
> +	mutex_unlock(&fwnode_pcs_mutex);
> +
> +	return !IS_ERR_OR_NULL(pcs) ? pcs : ERR_PTR(-ENODEV);
> +}

[Severity: Medium]
Does fwnode_pcs_get_from_pcsspec() overwrite error pointers returned by
provider->fwnode_xlate() with ERR_PTR(-ENODEV)?

When the matching provider's fwnode_xlate() callback returns an error point=
er
such as ERR_PTR(-EINVAL) for invalid #pcs-cells arguments, !IS_ERR(pcs) is
false, so the loop continues and the return statement replaces any ERR_PTR()
with ERR_PTR(-ENODEV).  Conversely, if fwnode_xlate() returns NULL,
!IS_ERR(pcs) is true and stops the search early.

Because fwnode_phylink_pcs_parse() treats -ENODEV as an unprobed PCS provid=
er
and skips it via continue, fatal fwnode_xlate() errors are silently ignored
instead of aborting parsing and returning PTR_ERR(pcs).  Checking
provider->fwnode =3D=3D pcsspec->fwnode in the loop to invoke
provider->fwnode_xlate() once on the matching provider and returning its
ERR_PTR() directly (defaulting pcs to ERR_PTR(-ENODEV) when no provider
matches) would preserve the error code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117123956.1198=
1-1-ansuelsmth@gmail.com?part=3D4
