Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC450B429
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377387; cv=none; b=KtNY371lG28RuWox4VXc317JZoayxUgFwgvClRVNGLe2976JhhceFlINZ3W9Clk9mQcCJdcrxADO+8UmpLQ2zLG0gZ7KbWLFLsS4ocfkCiTVcEG3xUmqr24eTxy21XPrpsDIejgOGok7rzbKkOiVgpFeBiW5TlQu77aTQxW1o8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377387; c=relaxed/simple;
	bh=W4jxCSP8HzwVPlxBuLIKRCcyoRuHWM4qHGsdp60EIOo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sp9fCiCVne1HzkJ+Kx7tsDGsADUiaqEyoEaoZgL8+a99L3vOT8ecjwnOiXZyqI6kvZgZgj5savQM08nmTZH0OGWAxkUvwKdlj1VIFZGL+mQdwHN02sfd4XrvtTwx7+CQKypTO3jfb0dCdduFVb3gZwaUPuIxX4fvPjqz8x/Onx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iu5qnvyz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iu5qnvyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFDF1F008A2;
	Fri, 25 Sep 2026 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790377384;
	bh=8P7IVxnah382Pqs1hp7mxMtpA+qnQANFfEJCSjDaz9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iu5qnvyz01pNFeY5V+c39MJv40KyFywBRUGJ1zvwuKnZhnuIXlHkamyJUf3wc2F4Z
	 5hRImxWkp6P1LGZCyNESVbbLqPJkW/M/7SXbYTbqHSLh19jnhtBtr8n0RtGonqOx31
	 Z52pf671kldph40TfBBVHzHFonnzBpxVvR15A2++6PVm9MQPbTn1LOQJyF/kWW42Az
	 8W/5ZJntSzJn2fNygLRh3bJC3wtgOxImseCvXBSDPl1zjNssTeRGX2uEORtrPrEKnk
	 bK4u8zO4h7h+nEO/Sl38SczuN6YaXRqBQoFN9T9zyvB9gG9Qz+NJnQ5SCyfvVg9KlS
	 XsdPlh8cNkPcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 03/12] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924230211.11519-4-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
 <20260924230211.11519-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 23:03:03 +0000
Message-Id: <20260925230304.3DFDF1F008A2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: pcs: fwnode_pcs_get() squashes xlate errors, causing silent=
 probe failures
--

commit 20ba7953a0112c9d2c56d0425273bf4e3033798b
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

Implement the foundation of Firmware node support for PCS driver.
This adds a simple Provider API where a PCS driver can expose multiple PCS
with an xlate function. It provides helpers like fwnode_pcs_add_provider()
and fwnode_pcs_get() for consumers.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..39550d9a12a2a
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
[ ... ]
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

[Severity: Medium]
Will this loop fail to break when the correct provider is found but its
xlate callback returns an error pointer? If the provider returns a valid
error (like -EINVAL due to an out-of-bounds pcs-handle index), it looks like
this will overwrite the valid error by continuing to the next provider.

> +	}
> +	mutex_unlock(&fwnode_pcs_mutex);
> +
> +	return !IS_ERR_OR_NULL(pcs) ? pcs : ERR_PTR(-ENODEV);

[Severity: Medium]
Does this forcibly squash any remaining error pointer (including a valid
error from the xlate callback or a subsequent -EINVAL) into -ENODEV? This
permanently erases the original error context.

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
> +			/* Exit early if no PCS remain.*/
> +			if (PTR_ERR(pcs) =3D=3D -ENOENT)
> +				break;
> +
> +			/*
> +			 * Ignore -ENODEV error for PCS that still
> +			 * needs to probe.
> +			 */
> +			if (PTR_ERR(pcs) =3D=3D -ENODEV)
> +				continue;

[Severity: Medium]
Because real errors were converted to -ENODEV in
fwnode_pcs_get_from_pcsspec(), will this logic mistakenly skip the PCS
entirely instead of propagating the error up to abort the MAC driver's
probe?

> +
> +			return PTR_ERR(pcs);
> +		}
> +
> +		available_pcs[found] =3D pcs;
> +		found++;
> +	}
> +
> +	return found;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924230211.1151=
9-1-ansuelsmth@gmail.com?part=3D3
