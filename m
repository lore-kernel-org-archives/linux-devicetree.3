Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64271238C2A
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194832; cv=none; b=hwiBy7oVHVC9t7LN+ywAGchUyaTyt8VfqN5reH6khZnZhJszjnWi7VwnKW7uKFpTsK1pnRE3wztccXpJEgoYo4XA2BqYduK8eCS2E06yVqZATzQnVoxcPpELEn3odwBp/zJXLVxZuXM0V1+SilqzyiLeExO9mx5MzCzTyAuHL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194832; c=relaxed/simple;
	bh=rUEu0DIOxuQ8LXv51WOj+KIJ2uNsnH6IgrxzfrFrSUI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VwkpwqhvwUYGhWwoEXRQVt4Fd0Jl9EZtQh40MjwUTEPsWfClCD6GYRrytJamrkTdyhKowfNZM7/FtDnM7iU2HD1q0Kpu/j9Lmsh3PHk0B63BSqTRUWZw/qYIxvh9mLQsQK+wQq82IM1zUv96XTAAy2TdvGDwVj9g0hy8qrcWzPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h14fFWSo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h14fFWSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A18E1F000E9;
	Sat,  8 Aug 2026 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194831;
	bh=GqA3CcGUqprmau5CjdVtTe64ZiAIdEYP4JZQ75SREF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h14fFWSo6Kg2eNQ0f41CzoWCBYcu6tW7igBgq/W1Je6qcF0iNcbbEp+ga8OKUWtiH
	 83PLV7qcS8S6cJOrU1FM3qU1inXJhCFUdFVnhrg9jQL5EY7OtqFTs6OW3294Stfzde
	 V4AAUtpcBpecnt2tQ81frHX3l9GsojINZAPlXj+YUk8LAVH2y04547FzJyNRkpCKsm
	 iZO3k8pcXApy13KC6sj6R9WPC2xTL7F7KQbb9G21kbhvg7HKGKfA8M1D0od7A7/UVQ
	 p7jET0pbHy/rjUQ2gNtFQVr2MWMP+9bCDIbYR5YBW2nro42H+kpfqXIB0hqITrahDO
	 dippZ95t3n/uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807131301.192060-3-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:49 +0000
Message-Id: <20260808131350.4A18E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] phylink_validate_mac_and_pcs() fails to return an error when a req=
uired PCS is missing, leading to subsequent fatal errors.
- [Medium] Accidental deletion of MAC supported_interfaces validation in ph=
ylink_create().
--

--- Patch [2]: [PATCH net-next v11 02/12] net: phylink: introduce internal =
phylink PCS handling ---
commit 73e85e119d9228a55571bdc2d1bafc5c5ee4b1fa
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling
   =20
This commit introduces internal handling of PCS for phylink using a
linked list of available PCS instead of relying solely on the
.mac_select_pcs callback. It updates major configuration and validation
paths to search the available PCS list when the MAC requires a dedicated
PCS.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index b7180ae76cc84..9decd7333c702 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -530,9 +552,24 @@ static int phylink_validate_mac_and_pcs(struct phyli=
nk *pl,
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs))
>  			return PTR_ERR(pcs);
> +
> +		pcs_found =3D !!pcs;
> +	/*
> +	 * Find a PCS in available PCS list for the requested interface.
> +	 *
> +	 * Skip searching if the MAC doesn't require a dedicated PCS for
> +	 * the requested interface.
> +	 */
> +	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
> +		list_for_each_entry(pcs, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(pcs, state->interface)) {
> +				pcs_found =3D true;
> +				break;
> +			}
> +		}
>  	}
> =20
> -	if (pcs) {
> +	if (pcs_found) {

[Severity: High]
If a required PCS is not found in the list, pcs_found remains false,
but doesn't phylink_validate_mac_and_pcs() then fall through and continue
to validate MAC capabilities instead of immediately returning an error like
-EINVAL?

Later in phylink_major_config(), trying to apply this configuration
could fail fatally and leave the link in a broken state.

[ ... ]

> @@ -1854,13 +1964,17 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  			       phy_interface_t iface,
>  			       const struct phylink_mac_ops *mac_ops)
>  {
> +	struct phylink_pcs *tmp, *pcs;
>  	struct phylink *pl;
>  	int ret;
> =20
> -	/* Validate the supplied configuration */
> -	if (phy_interface_empty(config->supported_interfaces)) {
> +	/*
> +	 * Make sure either PCS internal validation or .mac_select_pcs
> +	 * is used. Return error if both are defined.
> +	 */
> +	if (config->num_possible_pcs && mac_ops->mac_select_pcs) {
>  		dev_err(config->dev,
> -			"phylink: error: empty supported_interfaces\n");
> +			"phylink: error: either phylink_config .num_possible_pcs or .mac_sele=
ct_pcs must be used\n");
>  		return ERR_PTR(-EINVAL);
>  	}

[Severity: Medium]
Was the validation check for an empty supported_interfaces mask intentional=
ly
removed here?

Without it, it looks like misconfigured MAC drivers might initialize
successfully but fail silently later.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D2
