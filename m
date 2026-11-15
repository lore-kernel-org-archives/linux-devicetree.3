Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739515;
	b=RmsoAykV97tBnO6EtwMitxHII7+iI3v906BopXPoRxMzEzWTro6Tlcdtvhbb08fH/6Ex
	 u3ga6Nu2EhDj6aQhqBSrYEQTWP5NWZtt0vaCcR0i29IteNyNAuFqQHxXQzBnM3Sgmzwju
	 N52kPvOOARRU+2B+lXDh1wXaQnohryzjSE4G9R+zjH0OG1ivnbeq7qYk++XtrqeR+n0Bz
	 qkmLYUH0tNFtYSc/6LwfCW29F61Zsr8OFNfoc4AddA6QCEM3rpsGLEsLuyX+9VlaqTVBC
	 +MYB8liOcn3Eig8x+ePDR4vFPsYaBSvDZmwumcsjDqye+qKu2kvsRCwaOYHpoIofu0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YCYk00gP2fAWKaN/JvC8ee6SoIY3q6TGA0CXVRXdrHM=;
	b=m0zh7MXxeDZDUHRL+7Wfo0GC2VXb5Aff4mGx0Z/fYZKA9V+s4+Wkhu3rV05rw2tT4L/6
	 zUNpfoNSieukhQk237JtK4XpUVhFv+0TKVB3f3m3uI2vDd6T4Nnt34E069AddVAEAzHt5
	 dXHbBSc2meRUjP+NgTQRmluGVegzM1nNSsFKm2BCujimL76yj9QAY421EmbGdDcktNovr
	 zjZEgrkOuZgb1pbvHpDGNzOqBZPaMEIwe2Gwk7Ud27PRnaxj7GRtz70jRoXhlWgbLpyqs
	 bzJFPNarPl2HiyQcoJTFlp0PHl2tx7J6bmAygAXeVacdetADORMOI6Dp28fE3uDqTUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eM5LuvE9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93066606A338
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eM5LuvE9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE061F000D1;
	Sun, 15 Nov 2026 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739515;
	bh=YCYk00gP2fAWKaN/JvC8ee6SoIY3q6TGA0CXVRXdrHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eM5LuvE9MkvBCsXM+8t7SAdjjS3ygoXB0T8xD8rTfjFzLtVaSUzFVSLwT0Xa/qiht
	 ahvQWgNocPkWqiFCCu2gWxQPayJSyTm7V2JVnxgVzUmfmcXPM0ICOLXyyW0H5/Eh1U
	 dn0CSDu8i9A5U1idmXtQvcHWs7EIdZFhc20VGbEA/5HHriDix4RbiNqgbq957lo8jQ
	 ApZbiLQ8KXuubrYT2JhkOhhgtkXbYzSSLNerqhbyS1prUawNtE944lDBgJT6m+pmOK
	 dld0jCloFw05dgIpghigPH6NjZvgD2DDCau/CYEQh58FFs0r/smSPSCMZu4DNOx/xL
	 sc+RfBF245Plg==
Message-ID: <sashiko-outbox-215395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 04/15] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-5-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: pcs: fwnode_pcs_get_from_pcsspec() clobbers
  fwnode_xlate() error codes
- [Low] net: pcs: dead name lookup in fwnode_parse_pcsspec() uses
  pcs-names
--

commit 523a51dc25f7a5757d1f8012e38a5161ca8187b6
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

This commit introduces firmware node provider and consumer helpers for PCS
drivers, allowing MAC drivers to look up and parse PCS instances referenced
by "pcs-handle" properties.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..39550d9a12a2a
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
[ ... ]
> +static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
> +				int index, const char *name,
> +				struct fwnode_reference_args *out_args)
> +{
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	if (name) {
> +		index =3D fwnode_property_match_string(fwnode, "pcs-names",
> +						     name);
> +		if (index < 0)
> +			return index;
> +	}
> +
> +	return fwnode_property_get_reference_args(fwnode, "pcs-handle",
> +						  "#pcs-cells", 0, index,
> +						  out_args);
> +}

[Severity: Low]
Should this match "pcs-handle-names" (as defined in
Documentation/devicetree/bindings/net/ethernet-controller.yaml) instead of
"pcs-names", or can the name lookup be dropped since __fwnode_pcs_get() is
only called with con_id set to NULL?

> +
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
Does fwnode_pcs_get_from_pcsspec() overwrite errors returned by
provider->fwnode_xlate() with ERR_PTR(-ENODEV)?

When the matching provider's fwnode_xlate() returns an error pointer (for
example ERR_PTR(-EINVAL) on invalid #pcs-cells arguments), !IS_ERR(pcs) is
false so the loop keeps iterating, and the return statement turns any
ERR_PTR(pcs) into ERR_PTR(-ENODEV).  Because fwnode_phylink_pcs_parse()
treats -ENODEV as an unprobed provider and skips it via continue, invalid
PCS specifiers are silently ignored instead of failing parsing.

Checking provider->fwnode =3D=3D pcsspec->fwnode directly in the loop and
returning provider->fwnode_xlate(pcsspec, provider->data) (or
ERR_PTR(-ENODEV) if no provider matched) would preserve the error code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D4
