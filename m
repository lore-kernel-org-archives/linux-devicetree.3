Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6627E792
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502096; cv=none; b=eAI9mTpyvV4IVHAv3TOrgdDjf6oBIjWTMzUHAGSHcr6hZW6J1RyfEfC1NV2Gevns6DXJp1qUvu+52862Yro7MmYfN9oYlZ4qrtmBty9+UQt5NA7JHbTcdnSI4L/GAqiAFStUxdwzR6Hf7n0j473O8fLPJHgXjqEhR/gZIByKKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502096; c=relaxed/simple;
	bh=Hwms4iOqHy2Nf4HR+vNO72wtKMQ2Eum3A0bTIG0X0mE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qNDRBf1rYCCpdVYCXsxpz8ZvnTb61b56uPTHhqLFHi25hw++4offUVgcMJDcJRSabcSr4Bj2eatyL3x6eg8GDGIM3CxQR0fj1I1yv6NegsVcTo5xDq6VbCLbDBqZCdz95o3mzjKQ29zuyhImbt5PQ1YxG0RSGJltK8d7WLTSims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G848S7jk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G848S7jk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5561F000E9;
	Fri, 31 Jul 2026 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502094;
	bh=Y1Ry1pQk+AJwfa+pe1Iv+03wUTZrEEdmF6epQ/08J0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G848S7jkAh5VAVOyHr1oRc1nkWE6r5mbbt0xBN99gHLLEJgkfRG+VbhiZeoqNMDJx
	 vcBYG0h+1gYLQYlSC337/JPSilC+IKW+tElH06kpkqpKx529TyZ0ZPFWjZvedVGj5O
	 XrgwoCOUZqlt9DbTpv+lr6/UO7uEctZjVhWOjycvP2v1Uv4WuDLd7FVSzJsebnDHnf
	 wh1b4AShH3epe61izA0e8zQbYJBz31Q4po6TOW2ex74q6nLprBOIQuTzQ1zr7rg6Js
	 rbLWLqnqZwKFRm8KLvHmQYnngJsnQiMkjPjvSCJ6wKphRurE80jNEi5HbVT4zurPPn
	 S6iL7cGuoOf6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 02/11] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730102444.1967900-3-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:48:14 +0000
Message-Id: <20260731124814.8E5561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phylink_validate_mac_and_pcs() incorrectly validates unsupported=
 interfaces when a required PCS is missing.
--

--- Patch [2]: [PATCH net-next v10 02/11] net: phylink: introduce internal =
phylink PCS handling ---
commit 523b36754a7978492b9869c650925bee50a978c5
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

Introduce internal handling of PCS for phylink. This is an alternative
way to .mac_select_pcs that moves the selection logic of the PCS entirely
to phylink with the usage of the supported_interface value in the PCS
struct.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 3464e3ec56997..a5e2d342a92e1 100644
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

[Severity: Medium]
If the interface requires a dedicated PCS (the test_bit check is true)
but no matching PCS is found in the list, pcs_found will remain false.
Does this inadvertently skip PCS validation and fall through to MAC
validation?

It appears this allows phylink to incorrectly report that an interface
mode is supported even if the mandatory PCS is missing. Any subsequent
attempt to configure the link with this mode will then fail at runtime
in phylink_major_config(), which correctly aborts if the required PCS
isn't found.=20

Should phylink_validate_mac_and_pcs() return -EINVAL when a required=20
PCS is missing?

>  		/* The PCS, if present, must be setup before phylink_create()
>  		 * has been called. If the ops is not initialised, print an
>  		 * error and backtrace rather than oopsing the kernel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730102444.1967=
900-1-ansuelsmth@gmail.com?part=3D2
