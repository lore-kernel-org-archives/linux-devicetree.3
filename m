Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60450AC18
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377383; cv=none; b=htyiMl/tD3a3n2f4BsH7B0B+TWKXYjUB97PguEAkhXIAdoHl0g35FmiFl3EXuGWcLaE2Fcd4K8J9cVbGb4+h/caFkTZ6eyFT6rF9wi/tPNBhxv27cQXEv4zdxdFyIC5EBHHuePM7MKlOJbRyfc2k8bXWftV0UYmZAdzbg56k+qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377383; c=relaxed/simple;
	bh=CZpZUsmIp+TCI+ZMDwn4HcZSfBX/PZiPJhpuClB09k8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V6qtXHE4ubSVqU9/HN+s7snCxEIm56TwpXlJN1b+ccKiCCezyHikhwIQFpObUsczcykmRNvJJTKDipUMMmyCXZ9NMewo7Li2pJGqZuIZim56lQeKk5C6sTapr+bZRQ7wKs81zdhH3Sa0UBY98PBnKl6Mk9AybC0gtXaiY5qEbwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxZa59xL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxZa59xL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7104E1F000FF;
	Fri, 25 Sep 2026 23:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790377381;
	bh=ieN0yjV7eKAKmnm/ZTtAg71Yw21B8CLQ17XCuLr73ds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oxZa59xLUWoTm1Zfe2WfRlxOSsQFuCrQ/x8JZ62g/GKRfCZTOOZRvPmzX5Sf4Wy7M
	 AKxI7yM9xv9l759pZL4+bN0X1pJrgLOBE0wXwwKO971LrG409ZFojoxRoq3K5uIlBT
	 qm81aphVMtF3sp1Ag0B9bHG1PtNZ9ybO4W1ONDTyEVaPNW+uSwbCBeM9XNd5C8OfWB
	 sTEoLwIVvEMovqkbp1vFykSycacfDWG0z5Z2RkpQjWcogRw7N9bdQfNhXzQ5wm8Vtn
	 O3vYUo9KukMhXXfvZW5VpaVDthTZ/b8R40qMGV6QXBVnkzpydRiluUG5T6kw+zL2A6
	 6UbqgpsDSHKkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 05/12] net: phylink: support PCS provider
 release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924230211.11519-6-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
 <20260924230211.11519-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 23:03:00 +0000
Message-Id: <20260925230301.7104E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: phylink: data race on pl->link_config.advertising in pcs_prov=
ider_notify()
- [Medium] net: phylink: manual ethtool advertising mask is destroyed on PC=
S hotplug
--

commit 54f6a8bb94be99e3cfebd46ca4bf449e65e57693
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support PCS provider release

This commit adds support for releasing fwnode PCS from a PCS provider using=
 a
global notifier. The notifier is handled by pcs_provider_notify(), which
iterates over phylink instances, deletes the matching PCS, and recalculates
capabilities.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 9441afe372c33..019ce3d89da04 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1939,11 +1964,95 @@ static int phylink_fill_available_pcs(struct phyl=
ink *pl,
>  	}
> =20
>  out:
> +	mutex_unlock(&pl->state_mutex);
> +
>  	kfree(pcss);
> =20
>  	return ret;
>  }
> =20
> +static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
[ ... ]
> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{
> +	struct phylink *pl =3D container_of(self, struct phylink, fwnode_pcs_nb=
);
> +	struct fwnode_pcs_provider *pp =3D data;
> +	struct phylink_pcs *pcs, *tmp;
> +	bool resolve =3D false;
> +
> +	rtnl_lock();
> +
> +	mutex_lock(&pl->state_mutex);
> +
> +	/*
> +	 * Loop all the PCS for phylink instance and check if
> +	 * this notification is relevant for some of them.
> +	 */
> +	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> +			continue;
> +
> +		phylink_del_pcs(pl, pcs);
> +		resolve =3D true;
> +	}
> +
> +	/* Exit early if nothing has changed */
> +	if (!resolve) {
> +		mutex_unlock(&pl->state_mutex);
> +		rtnl_unlock();
> +		return NOTIFY_DONE;
> +	}
> +
> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);
> +
> +	mutex_unlock(&pl->state_mutex);
> +
> +	/* Recalculate capabilities */
> +	linkmode_fill(pl->supported);
> +	linkmode_fill(pl->link_config.advertising);

[Severity: High]
Does this introduce a data race on pl->link_config.advertising?

pcs_provider_notify() drops pl->state_mutex before modifying
pl->link_config.advertising via linkmode_fill().

However, phylink_resolve() can execute concurrently and reads pl->link_conf=
ig
by performing a full struct copy while holding only pl->state_mutex:

phylink_resolve() {
    ...
    mutex_lock(&pl->state_mutex);
    if (pl->phylink_disable_state) {
        ...
    } else if (pl->link_failed) {
        link_state =3D pl->link_config;
    ...
}

Could phylink_resolve() observe a torn state where all capability bits are
temporarily set to 1, causing an invalid configuration to be sent to the
MAC/PCS hardware?

[Severity: Medium]
Does unconditionally filling pl->link_config.advertising overwrite manual
ethtool settings?

When a PCS notification matches, pl->link_config.advertising is completely
reset using linkmode_fill(). This appears to discard any user-configured
manual speed or link advertisement limits applied previously via ethtool,
reverting the link to advertise the maximum supported capabilities.

Should hotplugging an unused or secondary PCS destructively alter the manual
configuration state of the active link?

> +	phylink_validate_mask(pl, NULL, pl->supported, &pl->link_config,
> +			      pl->supported_interfaces);
> +
> +	rtnl_unlock();
> +
> +	phylink_run_resolve(pl);
> +
> +	return NOTIFY_OK;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924230211.1151=
9-1-ansuelsmth@gmail.com?part=3D5
