Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB523E51E2
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337859; cv=none; b=hMt7mwRpZuJtzXxrjQFUwU8BSGNFOBrS4tW8PsJuBv6jp1uVVi+UzxtxNdRtcMXt8B/Mcsm6PYag4K7lgJiCFnhUY5ChlCQiJVb7T3AU6GqZSsGfMh4AgWCAy4eViT7j6/eA8w6ENA0gRynLiIVfQQekr2vmWLFBUTz01+RYGVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337859; c=relaxed/simple;
	bh=GopxhqjKQKZ3+dDUM3xaVlb9GTo8rN6PsZ4rq7HT+wQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tUay36aLj2rZR1SJ0UWAL1LkAHkgfacbfMBrMxkVdDraVLWzUt16ka1FhmeoASpaI8o3VqlEt07H+mQyhkgDxrH8GGze1We1TFe8Me2FQJOYnmXesDSb/s7ai0ih4aekCuBtEKuRBb3xA5ib0nug5wv629C1Vb5pKaFZUvhvRa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpnKawuv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpnKawuv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7703C1F00A3A;
	Wed,  2 Sep 2026 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337856;
	bh=ojl3gSW+fPObP9RX+9hgtg3aYPJGlG6yBwHidqxkX/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpnKawuvAaUXnMAj/6gvSPVFLLzXJ7qdIXxCdhSogDDQv1Y5VPsfWGztJ5TcuwmnA
	 F6ggzs/IJW7amh7fH/ceGn4WgdhZbIS4Bq5eUc/gQVd7HyE27zyZCCyHcp6rDso5rz
	 OCjGAYuewBKPPCJmsjLgxBzSs3VHEhd7aE1Rm8EbuLCR8UZxIsfzBGi9SgWqUrQcgH
	 L7OKDKUFIiaJTSOqJIGrRzmjGK3ebgTtuGYw0ugii1URr49Z8ggZZHtC31S1qOc1dX
	 iroi/yE/w1rfLZ2AiM/Ab2iL3aTHRBnPp1/lamWS1108mUODFa5walqAS+SyzV8mE+
	 DZw6y9XeQHhwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 03/12] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901083001.8044-4-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
 <20260901083001.8044-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:30:56 +0000
Message-Id: <20260902083056.7703C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Provider xlate errors are improperly masked to -ENODEV, breaking=
 error reporting.
--

commit bda5aa3be050e19dfc3117135971734f3811b538
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

This commit implements the foundation for firmware node support for PCS dri=
vers.
It introduces an API for PCS drivers to add providers and for consumers to
retrieve a PCS by passing a firmware node pointer and an index.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..39550d9a12a2a
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
> @@ -0,0 +1,245 @@
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
> +	}

[Severity: Medium]
What happens if a matching provider's xlate function legitimately returns
an error?

Looking at __fwnode_pcs_get_from_pcsspec_provider(), it returns -EINVAL
when the firmware node does not match. Because of this, checking
!IS_ERR(pcs) successfully skips non-matching providers.

However, if a provider does match but its xlate callback returns an error
(like -EINVAL or -EPROBE_DEFER), pcs will also be an error pointer. This
causes the loop to incorrectly continue searching instead of stopping at
the matching provider.

> +	mutex_unlock(&fwnode_pcs_mutex);
> +
> +	return !IS_ERR_OR_NULL(pcs) ? pcs : ERR_PTR(-ENODEV);

[Severity: Medium]
Does this unconditionally overwrite the error code from the xlate callback?

Because the loop does not break on xlate errors, any specific error code
returned by the provider is discarded. Even if the matching provider was
the last one in the list, its error pointer is replaced with -ENODEV here.

This causes fwnode_phylink_pcs_parse() to silently skip the PCS (treating
it as an unprobed/late PCS) instead of propagating the actual error.
Returning the actual error pointer could allow the caller to handle it
appropriately.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901083001.8044=
-1-ansuelsmth@gmail.com?part=3D3
