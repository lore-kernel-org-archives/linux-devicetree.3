Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA035B631
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620344; cv=none; b=DEFOHDm4OfJsZdinxiIicn/fEg41rSkgueAV6tW9NI6wzH69TImqoIncAWSV4rLZo3VxGTvpJQf+btAVYhWpDYGG25d+VqyW1ZE9CKA1nkgOXupC5wnIWUvUBRvRjH8JED4mBikIQNDdAun/s2Rt4as9tX1Cjan+EH966qiOn8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620344; c=relaxed/simple;
	bh=f4cIqzWJ6F7qBtCE3k8qZl3Tc/eyKa/WDYo64qiTzVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CYOtiGgzKJSQ95C+yhGIIgi+iFVAesQYzuvEsjSpnwHcR3Z728m4Rae0agH/lJphXj/uKnHtFmfuSZtr2aKd8IXf4E6l745hKc8qmrauPqw2vuE//PrGmzrqht2Mil+LfdEIzlXaapFVH8Mj4Mde1eLM8hbs//KX99QZ8dZJtfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiSilRwg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiSilRwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABAB1F00A3A;
	Tue, 16 Jun 2026 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620342;
	bh=A79wyxRG8YcDgHZeGZ/4WFKqK1OdPMIpSB4DUmlAZjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aiSilRwgSI8IkEkw41nL1BPNwXqhbOxk9dHhfaGhAuJ90/ijh6Y88pLLS4zndoyVF
	 TYt4W6Z9f9/ClqG0jN4tO9LVSUfA7uBe4itS7xxV2bP60OaVIjXlB/c9PjghSV88rq
	 GDxqy2IDqGGTTc6ye8EDNZybOYaWS1iB6ew2Zwm7KHtv4Y7850wnUQMefgy+rkHKlK
	 Q5wMPwCqtp9xCGwKnrZaCbQks4W5j5ZyWhAqAyICb/oWs/PgPTFdg1kPNN/JSx7HcW
	 sPdeOlBFp1af/6UQTgCFdUo9YphaaeJDHUO/WEi1jHP2zSjyhZXFwFCVxv6KinPFsm
	 pjOKxP0kHTeig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 06/12] net: Document PCS subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615122950.22281-7-ansuelsmth@gmail.com>
References: <20260615122950.22281-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:32:22 +0000
Message-Id: <20260616143222.8ABAB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Error paths in `phylink_create()` free the `phylink` struct withou=
t unregistering the PCS notifier.
- [High] The PCS notifier is registered before the `phylink` instance is fu=
lly initialized, allowing concurrent notifications to dereference a NULL po=
inter.
- [Medium] Always-false unsigned comparison in `fwnode_parse_pcsspec()` mas=
ks actual error returns.
- [Medium] `fwnode_phylink_pcs_parse()` fails completely if `num_pcs` excee=
ds the actual number of entries in the device tree.
--

commit 8a4a6df4b5091984f40b8415d9bca38cf005d9f4
Author: Christian Marangi <ansuelsmth@gmail.com>

net: Document PCS subsystem
   =20
Add extensive documentation of the new PCS subsystem and the fwnode
implementation with producer/consumer API.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..713b2ec22c97e
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
> @@ -0,0 +1,257 @@

[ ... ]

> +static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
> +				unsigned int index, const char *name,
> +				struct fwnode_reference_args *out_args)
> +{
> +	int ret;
> +
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	if (name) {
> +		index =3D fwnode_property_match_string(fwnode, "pcs-names",
> +						     name);
> +		if (index < 0)

[Severity: Medium]
Since index is declared as an unsigned int, will this check for < 0 always =
be
false, potentially masking error returns from fwnode_property_match_string(=
)?

> +			return index;
> +	}
> +
> +	ret =3D fwnode_property_get_reference_args(fwnode, "pcs-handle",
> +						 "#pcs-cells",
> +						 -1, index, out_args);
> +	if (ret || (name && index < 0))
> +		return ret;
> +
> +	return 0;
> +}

[ ... ]

> +int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
> +			     struct phylink_pcs **available_pcs,
> +			     unsigned int num_pcs)
> +{
> +	unsigned int i, found =3D 0;
> +
> +	if (!available_pcs)
> +		return -EINVAL;
> +
> +	if (!fwnode_property_present(fwnode, "pcs-handle"))
> +		return -ENODEV;
> +
> +	for (i =3D 0; i < num_pcs; i++) {
> +		struct phylink_pcs *pcs;
> +
> +		pcs =3D fwnode_pcs_get(fwnode, i);
> +		if (IS_ERR(pcs)) {
> +			/*
> +			 * Ignore -ENODEV error for PCS that still
> +			 * needs to probe.
> +			 */
> +			if (PTR_ERR(pcs) =3D=3D -ENODEV)
> +				continue;
> +
> +			return PTR_ERR(pcs);

[Severity: Medium]
If num_pcs exceeds the actual number of entries in the device tree array,
fwnode_pcs_get() will return -ENOENT for the out-of-bounds index.

Will returning the error here cause the entire function to abort instead of
breaking gracefully and returning the valid entries found so far?

> +		}
> +
> +		available_pcs[found] =3D pcs;
> +		found++;
> +	}
> +
> +	return found;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_parse);

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 087ac63f9193d..0734c98498a99 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1867,6 +2093,33 @@ struct phylink *phylink_create(struct phylink_conf=
ig *config,

[ ... ]

> +	/* Register notifier for late PCS attach */
> +	if (!phy_interface_empty(config->pcs_interfaces)) {
> +		pl->fwnode_pcs_nb.notifier_call =3D pcs_provider_notify;
> +		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +	}
> =20
>  	pl->config =3D config;

[Severity: High]
If a PCS provider is registered concurrently right after the notifier is ad=
ded,
pcs_provider_notify() could execute before pl->config is initialized here.

Will the callback attempt to dereference a NULL pl->config->dev and crash?

[Severity: High]
If an error occurs later in phylink_create() (for example, if
phylink_parse_mode(), phylink_parse_fixedlink(), or phylink_register_sfp()
fail), the function calls kfree(pl) and returns.

Does this error path leave the notifier registered to freed memory, leading
to a use-after-free regression when the next PCS provider is added?

>  	if (config->type =3D=3D PHYLINK_NETDEV) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122950.2228=
1-1-ansuelsmth@gmail.com?part=3D6
