Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF402E06E6
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692324; cv=none; b=KCV3SppRWL/1vzZ+cUrpyIPGYiF575crdMiqbITE8f6kcbISATRG/HYUxeV0jLZGHSBT8kYs7pPyKTDFe4r7+uWP3qSyZhFXqkgRxMktv6BEXsstZ4dou/l8M7yN2WeC3qWLgmQyDO7gtPa4WU+iXfrrWLYhDCMRSVN9yTjVy78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692324; c=relaxed/simple;
	bh=8Rr/LZPjQNWK26R3u9OdMlu9QyLXd1bgrkYBRlPeVt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gcBRimV2GFmCmQpn72E1G3ALfUNEVH3k9FLxUNWktAoPrsPxGQYuzJcv5OL8TC1uFCIhNKYHtijoJV+ufw+1lJoqItXQWpSnXH54qCKJdhQsT7ergQNNtJLXqoHFzRFQMk3oROyk5JWHOyVL+ynGYnZDyu5pedG6Ez8yC2gYKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGr8ea3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGr8ea3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE001F000FF;
	Fri, 18 Sep 2026 00:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789692322;
	bh=pRm7V98PvwW9xLiOlvimzvDvfSy9/QSFtEIoTpgQEXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dGr8ea3s5kMSRR9u2yTDtrdEb8cvZ2iNaC5VPg2RMT9r4TANGGMgkNMXZm3cz239v
	 YQ/DXrw37Y1scCCAsHvks44i8MS8WM1Y3UalHHs1SnGKIi7HNFX5opB3D9D4LPg3J3
	 brzzABFbuxWqFFI50EPTxX/3Q/koEKxL2Wn9NNdJVeekT6Rpu5XNsQbmJzI7NDrXdU
	 n9znjsjvB2OtsAH6vc7yTP7uyrZqeTFXIKntMko5cS2UJr1Icp0GoT8IxnvUwKJ4AW
	 oIgX2COLL6kf6DRj3pEffELruN6Brw2icCB0wdYRcXL8yzVg4PeYXrVS1qvafG/58j
	 pVPvDehp4xSjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 03/12] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916235200.20712-4-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260916235200.20712-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:45:21 +0000
Message-Id: <20260918004522.0EE001F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: pcs: fwnode_pcs_get clobbers xlate errors breaking probe defe=
rral
--

commit d550ff71d0bd4e8598c8df7253dec52309a1c719
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

Implements the foundation of Firmware node support for PCS drivers. This
provides a simple Provider API where a PCS driver can expose multiple PCS
with a fwnode_xlate function.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..39550d9a12a2a
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

[Severity: High]
Does this loop clobber errors returned by the matching provider's xlate
function?

Looking at __fwnode_pcs_get_from_pcsspec_provider(), it returns -EINVAL if
the fwnode doesn't match, or the result of fwnode_xlate() if it does. If
fwnode_xlate() returns an error like -EPROBE_DEFER, !IS_ERR(pcs) evaluates
to false, causing the loop to continue.

The original error is then overwritten by -EINVAL from subsequent
non-matching providers. Should the loop break if the provider matches the
fwnode, regardless of whether the returned pcs is an error?

> +	mutex_unlock(&fwnode_pcs_mutex);
> +
> +	return !IS_ERR_OR_NULL(pcs) ? pcs : ERR_PTR(-ENODEV);

[Severity: High]
Does this unconditional return of -ENODEV squash probe deferrals?

If pcs holds an error pointer (like -EPROBE_DEFER) at the end of the loop,
this statement masks the original error code by always returning -ENODEV.

This breaks module load ordering and prevents MAC drivers from correctly
deferring probe until their PCS is ready.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916235200.2071=
2-1-ansuelsmth@gmail.com?part=3D3
