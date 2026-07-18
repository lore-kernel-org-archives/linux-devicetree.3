Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16E2E7360
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365277; cv=none; b=jTjuTAilcolvXLRQywT37/VAMBtFjMBbu6feaHTp1z2PhCKr9fmq7pTAZ14O9DWoH+Zqx+Ql6COm1xMM8xZ5JPpNOWubiCGnF1eNltuCTUeIhORRZzaWs35RLNhXqHQ3LIJusoJuSYL5Q2/jkWUfF50EubhCKSPTG9eIER/2y2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365277; c=relaxed/simple;
	bh=pGb3AqBBbfLU8taF1S1XTHpIpfpNI3X9zh93IjYpvDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NEU0QSNSU/9PAzivASXFoRUB0HIqmll4+BJ4iV38XXHZcBJFl9XcEgPom2AXOTvsEfdPUv84CnlNyYW6amTmuG8euoPjDwKQ47ftijz5KxfUmjG2gRKmvr8GAITI5BykLSIpL6YavyhKmvtlYVFqapYZSs9+cj3oAZ+aZplfziU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXBLxauA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXBLxauA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1B61F000E9;
	Sat, 18 Jul 2026 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365276;
	bh=QXyRXyaOJIna6pamqG+kTjMrwkRZ8hx//wt0fBnAMjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXBLxauA+7If0lIauKCBzK/t1WpjhCAB64oAHTW2oUx0oi1cFv99bANM2Az/QE5e1
	 24x2FeynNR+rUbs949RnLwmUuLT0mY8lKXIaZ3VednnMpQMxHzC/QfydBEWbs6W24O
	 Mt6l8sr0ATD7vdtihFRL5XVTtALnR2KuLCy8sx/G4f9tcd28Wga5UWz8ZoqG6Wo5Xg
	 5n2YmuQI7KcbDo5X4Wgs5nmCQDG+liUilnKemX88O+W7RquM9Fq1cwukBW9nsQeVWz
	 ni2Bt2tctbBHz5byVQla38XjTDOabUj7pkXvNzNSFaCvAqArOi0dinupUxKV0qOYAy
	 pNtllQpeebTbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717065448.1498335-3-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:15 +0000
Message-Id: <20260718090116.1D1B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] phylink_validate_mac_and_pcs() validates an interface as supported=
 even when its required dedicated PCS is missing.
- [High] Missing list_del() in the unlink_pcs_list error path of phylink_cr=
eate() leaves dangling list pointers in externally-owned PCS structures.
- [Medium] phylink_fill_available_pcs() uses list_add() instead of list_add=
_tail(), reversing the intended priority order of the provided PCS array.
--

--- Patch [2]: [PATCH net-next v9 02/12] net: phylink: introduce internal p=
hylink PCS handling ---
commit 867ad4be39467be718a5df59cf2a9739b1c43531
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: phylink: introduce internal phylink PCS handling

Introduces an alternative to mac_select_pcs by shifting the PCS selection l=
ogic
entirely to phylink using the supported_interface value in the PCS struct.
A new pcs_list tracks available PCS instances.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 3464e3ec56997..d96941d4c5235 100644
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
If the MAC requires a dedicated PCS (test_bit returns true) but no availabl=
e PCS
supports the requested interface, pcs_found remains false. Does this wrongly
skip the PCS validation block and proceed to MAC capabilities validation wi=
thout
returning an error?

If so, it seems like phylink_major_config() will later fail when it performs
this same lookup, resulting in a delayed setup failure. Should we return -E=
INVAL
here if pcs_found is false but a dedicated PCS is required?

[ ... ]
> +static int phylink_fill_available_pcs(struct phylink *pl,
> +				      struct phylink_config *config)
> +{
[ ... ]
> +	for (i =3D 0; i < config->num_possible_pcs; i++) {
> +		struct phylink_pcs *pcs =3D pcss[i];
> +
> +		if (!pcs)
> +			continue;
> +
> +		list_add(&pcs->list, &pl->pcs_list);
> +	}

[Severity: Medium]
Since list_add() inserts elements at the head of the list, does this revers=
e the
priority order of the pcss array provided by the MAC driver?

Because lookups return the first matching PCS in the list, would using
list_add_tail() be needed to ensure the highest-priority PCS from the array=
 is
correctly chosen?

[ ... ]
> @@ -1854,13 +1964,17 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
[ ... ]
>  	return pl;
> +
> +unlink_pcs_list:
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink =3D NULL;
> +free_pl:
> +	kfree(pl);
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(phylink_create);

[Severity: High]
If phylink_create() encounters an error and takes the unlink_pcs_list path,=
 does
omitting list_del(&pcs->list) leave dangling pointers in the externally-own=
ed
phylink_pcs structures once the phylink instance is freed?

If a MAC driver defers probe or retries initialization, passing these same
structures back to phylink_create() could trigger list corruption or a
use-after-free since their list nodes would still point to the freed
pl->pcs_list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D2
