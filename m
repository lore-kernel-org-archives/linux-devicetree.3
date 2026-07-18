Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA1A2E7360
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365276; cv=none; b=c3GngeCZqsVCSSfwd2gFf9d69r5oekbtS4e7AU1CUkVkPF6qKN3AK0rypI/DiKySzHacVqUnVnz7OFoYdK3kRPkUrWtnjSPKWrXyR5zsnzE7c9t+n/rq9/1JPLp0pa29ktrK+2qksfkQpr+iRId+P4vmOuhK5xw/FEbuS3ubZBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365276; c=relaxed/simple;
	bh=7Ftoj8fmvCXpKS9smRC6Eem+AnJ//nJfNnhWRUHSfWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cVFzX8To/g3xGK8FzHiOaoZ2wpwJYqhXNc6CRptGbTBqur2Hok85am+mSh+lezc+jZ+WdLgrK1CMhpHW0GHt542k29AoZ+kdevh9xndw+r4UTbF00p/veGdUExGFXXS6OYCRjO9yY74Ief5vPqt2VegDLZ63xUCWqp31eFrUwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHsnjKOq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHsnjKOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AB11F00A3A;
	Sat, 18 Jul 2026 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365274;
	bh=X20JZm2lqVIvP6wSG1Jxw12lO9cD8ZtU0FEbiD48Upg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHsnjKOqKjlL/4+AN8uLuv8xICVeA3zucP7sRVqJKLViWx1Kv21QJm5AKK/WIaSh5
	 Y0AK09JD1tjSfMcGjoVLXWYBCMdydAvugTHE64llqHhRwDCKMRJBn76JBcQpdJ1GDA
	 wOdL1+m1+YBvL7s16KlezUztPj1VQrJd8olfjQcOgycxG2NPJdGBDM52jBqbxGITPI
	 w+1S6j4KVLLJ8tORuORUcfhfpqFrbI4bDxclh5v2KYZ0SBYHae95dXW8M1+wfH89v7
	 8zhtEf6uWoBCzVofp3v8sgtq+JNyB9hmctc2T2uySd18BQ+VRSw9foleJca8CPzZkM
	 s1sh3C6h3L5cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717065448.1498335-4-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:14 +0000
Message-Id: <20260718090114.81AB11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unconditional call to phylink_link_down() without updating old_lin=
k_state leads to multiple mac_link_down() calls and state machine desynchro=
nization.
- [Medium] The phylink instance's supported ethtool link modes and advertis=
ing mask are not updated after a PCS is removed.
- [Medium] Polling timer is not stopped when the active polling PCS is rele=
ased, causing a runaway timer.
- [Low] Reusing the function parameter 'pcs' as a loop iterator variable vi=
olates C scoping best practices and kernel coding standards.
--

--- Patch [3]: [PATCH net-next v9 03/12] net: phylink: add phylink_release_=
pcs() to externally release a PCS ---
commit 3d6c63e283b60421054ef189e8d1a2deb1f29536
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add phylink_release_pcs() to externally release a PCS
   =20
Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index d96941d4c5235..986e0c1e3d678 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -917,6 +919,60 @@ static void phylink_resolve_an_pause(struct phylink_=
link_state *state)
[ ... ]
> +void phylink_release_pcs(struct phylink_pcs *pcs)
> +{
> +	struct phylink *pl;
> +
> +	ASSERT_RTNL();
> +
> +	pl =3D pcs->phylink;
> +	if (!pl)
> +		return;
> +
> +	mutex_lock(&pl->state_mutex);
> +
> +	list_del(&pcs->list);
> +	pcs->phylink =3D NULL;
> +
> +	/*
> +	 * Check if we are removing the PCS currently
> +	 * in use by phylink. If this is the case, tear down
> +	 * the link, force phylink resolve to reconfigure the
> +	 * interface mode, disable the current PCS and set the
> +	 * phylink PCS to NULL.
> +	 */
> +	if (pl->pcs =3D=3D pcs) {
> +		phylink_link_down(pl);
> +		phylink_pcs_disable(pl->pcs);
> +
> +		pl->force_major_config =3D true;
> +		pl->pcs =3D NULL;
> +	}

[Severity: High]
Does calling phylink_link_down() here without also updating pl->old_link_st=
ate
cause state machine desynchronization?

If pl->old_link_state is true when the PCS is removed (such as for DSA swit=
ch
ports where there is no netdev), the link is logically brought down, but
pl->old_link_state remains true. This could cause subsequent link-up events=
 to
be ignored because phylink thinks the link is already up, leaving the
interface permanently dead.

[Severity: Medium]
When the active PCS has polling enabled (pcs->poll is true), does clearing
pl->pcs and triggering a resolve leave a runaway timer?

If phylink_major_config() is called by the resolve task and no replacement =
PCS
is found, it may return early on error and bypass the phylink_pcs_poll_stop=
()
call. Could this cause the original timer to continue firing and re-arming
itself indefinitely?

> +
> +	mutex_unlock(&pl->state_mutex);
> +
> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: Low]
This isn't a bug, but does reusing the function parameter pcs as the list
iterator variable overwrite its pointer value?

When the loop terminates, pcs will point to an invalid structure offset
derived from the list head. Using a separate iterator variable would avoid
corrupting the parameter.

[Severity: Medium]
While pl->supported_interfaces is updated here, is it also necessary to
update the phylink instance's supported ethtool link modes and advertising
mask?

Without calling phylink_validate() or similar to update pl->supported and
pl->link_config.advertising, these masks might continue to advertise the
capabilities of the removed PCS. Could this lead to runtime connection
failures if userspace or the PHY attempts to negotiate these now-unsupported
modes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D3
