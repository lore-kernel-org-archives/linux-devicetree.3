Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B72BF3F3
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108186; cv=none; b=QHVmvZncQTo/4zM6fNzrxzJ3+BtIbjTvQIiC3aM5nBB0nSD7qq/jFayddoL5yvpIFDLQHSZ5zYhJoRS6KZQ+HW3nQONLsVgh5wnLEoQpbHYbsLUzYd+wofVpmKhnkoMPYz4TsoVonDMfC5QGEz34UHfMpWGNVBD5uXG+om4PKpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108186; c=relaxed/simple;
	bh=abdbajGVyQ8OIVQkWWIu7JgktO3YxlJPyDtsqDtJL1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cJUua5DnBIJQl0vfYdrpxMSl/lxfN6MD1GUOJQ1CN+eP17gQTWo6MSY7Z6KYWD+JqDe+/Otop1nBFdlLGf+dhE5FPKT8Zywl+ZJt0Gow2LW5NPivCHU1haMp9oQEKoxheBzohnsxb1QMjLyBAI+GMGeVWuVV/5VO9RXM6Bhijl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYFUpNk0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYFUpNk0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272F61F00893;
	Wed, 10 Jun 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108185;
	bh=gaRMkL9YzHGSUJLBB/Fev0REPcwsg3uSIg3Hn4r3rSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UYFUpNk06+fAq1+w8ClpLCbfcUqvscD5muzyDIBpFL3o9qr9QdLgnTD9dU4qZSIHY
	 HvcYiovgGPByrQaavflujOXwK0tV3g4LMDnV89lSsJUuSxbFLseKto/HdoITCigTCE
	 ijq2M7SyqUqcYinrB2oqdCFhUC/Hjs7xX4jea5p1ymcIF51Hzaknq/iVRGNQl46Zg4
	 knd97V8Ie2eKZjufxspD/+Bip9Z+OQZvvSV6lKCwT5pcSnJ29rPo8iaWOhKr40ebwR
	 sDPDzuqMLTcE3z9SS/MakqW0+ZbDghIYlPnge8NqaqWBB6yJqsN69/HshW3EGuTCKZ
	 233MXKgTn0ClQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609151212.29469-4-ansuelsmth@gmail.com>
References: <20260609151212.29469-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:24 +0000
Message-Id: <20260610161625.272F61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unsynchronized modification of `pl->pcs_list` and TOCTOU access to=
 `pl->pcs` in `phylink_release_pcs()` leads to data races, list corruption,=
 and use-after-free.
- [High] `phylink_release_pcs()` silently fails to remove the PCS from `pl-=
>pcs_list` if the interface is stopped, leading to a Use-After-Free.
- [Medium] Releasing an actively running PCS bypasses `phylink_pcs_disable(=
)`, leaving the hardware permanently enabled.
--

commit ef373ddee33a54496ae5ebacb3521d9195428672
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add phylink_release_pcs() to externally release a PCS

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 4d6ffda0cdd61..b45bee9273007 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -923,6 +923,55 @@ static void phylink_resolve_an_pause(struct phylink_=
link_state *state)
>  	}
>  }
> =20
> +/**
> + * phylink_release_pcs - Removes a PCS from the phylink PCS available li=
st
> + * @pcs: a pointer to the phylink_pcs struct to be released
> + *
> + * This function release a PCS from the phylink PCS available list if
> + * actually in use. It also refreshes the supported interfaces of the
> + * phylink instance by copying the supported interfaces from the phylink
> + * conf and merging the supported interfaces of the remaining available =
PCS
> + * in the list and trigger a resolve.
> + */
> +void phylink_release_pcs(struct phylink_pcs *pcs)
> +{
> +	struct phylink *pl;
> +
> +	ASSERT_RTNL();
> +
> +	pl =3D pcs->phylink;
> +	if (!pl)
> +		return;

[Severity: High]
Does this early return cause a use-after-free if the interface is stopped?

When the interface is brought down, phylink_stop() clears pcs->phylink =3D =
NULL
for all available PCS instances, while keeping them linked in pl->pcs_list.

If phylink_release_pcs() is called while the interface is stopped, it encou=
nters
a NULL pointer here and returns immediately without executing
list_del(&pcs->list). The caller likely assumes the PCS was successfully
detached and frees its memory, leaving a dangling pointer in pl->pcs_list.=
=20

When the interface is later brought up, phylink_start() will iterate over
pl->pcs_list and dereference the freed memory.

> +
> +	list_del(&pcs->list);
> +	pcs->phylink =3D NULL;
> +
> +	/* Check if we are removing the PCS currently
> +	 * in use by phylink. If this is the case,
> +	 * force phylink resolve to reconfigure the interface
> +	 * mode and set the phylink PCS to NULL.
> +	 */
> +	if (pl->pcs =3D=3D pcs) {

[Severity: High]
Can modifying the list and checking pl->pcs outside the state_mutex race wi=
th
the workqueue?

While this function enforces the RTNL lock, pl->pcs_list is concurrently
traversed by phylink_major_config() from the phylink_resolve workqueue, whi=
ch
holds only pl->state_mutex. Modifying the list outside of pl->state_mutex c=
ould
cause the workqueue to dereference LIST_POISON1.

Additionally, checking if (pl->pcs =3D=3D pcs) before acquiring state_mutex=
 creates
a Time-of-Check to Time-of-Use race. A concurrent phylink_resolve could upd=
ate
pl->pcs between the lockless check and acquiring state_mutex, causing this =
code
to inadvertently clear a newly configured PCS.

> +		mutex_lock(&pl->state_mutex);
> +
> +		pl->force_major_config =3D true;
> +		pl->pcs =3D NULL;

[Severity: Medium]
If pl->pcs is cleared to NULL here, will the released PCS ever be cleanly
disabled?

During the subsequent reconfiguration triggered by phylink_run_resolve(),
phylink_major_config() detects a PCS change and attempts to disable the old=
 PCS
by calling phylink_pcs_disable(pl->pcs).=20

However, since pl->pcs was already cleared to NULL here, the
pcs->ops->pcs_disable() callback will never be invoked for the released PCS,
leaving it hardware-enabled.

> +
> +		mutex_unlock(&pl->state_mutex);
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
> +	phylink_run_resolve(pl);
> +}
> +EXPORT_SYMBOL_GPL(phylink_release_pcs);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D3
