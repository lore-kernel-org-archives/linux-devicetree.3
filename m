Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904A3F39EA
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 23:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785887353; cv=none; b=cb84V24y4rjFu7lhmBCNpM+qoAs4oawLi89mzq3Li1FHVr+aZjSECd8CPRWvCNxRtxBVwZUUkdSzelJUpPQ1Voh1IeB54Tg9QjQABM7aShfAEQcefGPGRE3vYvVPY7b+TSFPRK2IAKioL7laESTC3BVHhcpsuKQeFSLd99O9vqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785887353; c=relaxed/simple;
	bh=soqX5MdTNMGI5/Di23cfEXk5ZulLvxXWVbseDnqDBQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WaMBMT9rqwrYR5xidElqvqatjLnuMYxPzFM/zDoCYH6f0lu5xHQpTcyFV5PwTlychGgp+vtmNwZ8BjqUjKdMUqiWac58a/RpKsPpQmRU+zbGmX4wAhdleSiJ2uZnDf+2ZprRlksVDfOqMiW48v1uAK7avJe2akJySOGa712qvpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/Hv2j7h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/Hv2j7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C731F00A3D;
	Tue,  4 Aug 2026 23:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785887350;
	bh=d+2D6ZD44jEDte4UF4g5P4szNoQ0J5d8KtZ8mE/57FM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/Hv2j7hwt4OOqWSAqGQV9pmHVbNjDcDrqUqhAQKsqMfnjhwGSaFviq2LU8hzhj7y
	 Ecqr26WinDYY9zBsUfu3sVweF0PvawDcDdDecjzfi/THWabR3DossBork7RG/GdGVM
	 6Vhhjg5xQFOPwepvP80Z2UanSSz+e/OXoFVX9Oo1mJlqci+W89ViJebsqVUSs8oVTt
	 TLvon9w1AOSdCuzykBG6Slojp0pOZ765IZwlp64PmzjPEf7yMTes1/upRDO90ULBjR
	 xz9tIf+4xD2xnnelEopyZLCWWZ8bP+xRLWMWxmmh3c7CKnlp4/r+cGNtV82SzmClpm
	 ff0PggVWZ1rdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/3] net: mdio: support dynamic OF device
 changes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-submit-mdio-of-dynamic-v2-v2-3-f8841f3124d7@gmail.com>
References: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
 <20260803-submit-mdio-of-dynamic-v2-v2-3-f8841f3124d7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 23:49:09 +0000
Message-Id: <20260804234910.44C731F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The global OF overlay notifier inadvertently blocks the removal of=
 any overlay containing non-MDIO nodes, and any overlay whose underlying MD=
IO bus is unregistered.
- [Low] Data race on `of_mdio_reconfig_owner` in the recursive lock impleme=
ntation.
--

--- Patch [3]: [PATCH net-next v2 3/3] net: mdio: support dynamic OF device=
 changes ---
commit c037ead180706f6895d9e354b94ae56ca7628104
Author: James Hilliard <james.hilliard1@gmail.com>

net: mdio: support dynamic OF device changes

This commit adds dynamic OF device support for MDIO buses. It enumerates PH=
Ys
on OF reconfiguration addition events and handles removals by unregistering
devices attached to removed nodes. It also introduces serialization and ove=
rlay
preflight checks.

> diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
> index 051e449bbe7c0..c89f88aacd8df 100644
> --- a/drivers/net/mdio/of_mdio.c
> +++ b/drivers/net/mdio/of_mdio.c
[ ... ]
> @@ -27,6 +30,52 @@ MODULE_AUTHOR("Grant Likely <grant.likely@secretlab.ca=
>");
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("OpenFirmware MDIO bus (Ethernet PHY) accessors");
> =20
> +#if IS_ENABLED(CONFIG_OF_DYNAMIC)
> +/*
> + * OF changes can nest when probing one MDIO device enables another node=
 on
> + * the same bus. Serialize independent changes while allowing that nesti=
ng.
> + */
> +static DEFINE_MUTEX(of_mdio_reconfig_mutex);
> +static struct task_struct *of_mdio_reconfig_owner;
> +static unsigned int of_mdio_reconfig_depth;
> +
> +static void of_mdio_reconfig_lock(void)
> +{
> +	if (!mutex_trylock(&of_mdio_reconfig_mutex)) {
> +		if (of_mdio_reconfig_owner =3D=3D current) {

[Severity: Low]
Since `of_mdio_reconfig_owner` can be updated to NULL in
`of_mdio_reconfig_unlock()` concurrently, does this lockless read trigger a
KCSAN data race?

Would it be safer to use `READ_ONCE()` here and `WRITE_ONCE()` in the unlock
path to satisfy concurrency rules?

> +			of_mdio_reconfig_depth++;
> +			return;
> +		}
> +		mutex_lock(&of_mdio_reconfig_mutex);
> +	}
> +
> +	WARN_ON_ONCE(of_mdio_reconfig_owner);
> +	WARN_ON_ONCE(of_mdio_reconfig_depth);
> +	of_mdio_reconfig_owner =3D current;
> +	of_mdio_reconfig_depth =3D 1;
> +}
> +
> +static void of_mdio_reconfig_unlock(void)
> +{
> +	WARN_ON_ONCE(of_mdio_reconfig_owner !=3D current);
> +	WARN_ON_ONCE(!of_mdio_reconfig_depth);
> +
> +	if (--of_mdio_reconfig_depth)
> +		return;
> +
> +	of_mdio_reconfig_owner =3D NULL;
> +	mutex_unlock(&of_mdio_reconfig_mutex);
> +}
[ ... ]
> +/* Overlay entry notifier errors cannot stop removal after the tree chan=
ged. */
> +static bool of_mdiobus_live_node_is_busy(struct device_node *node)
> +{
> +	struct device_node *scope;
> +	struct mii_bus *mdio;
> +	bool busy =3D true;
> +
> +	scope =3D of_mdiobus_get_removal_scope(node);
> +	mdio =3D of_mdiobus_find_parent(scope);
> +	if (!mdio)
> +		goto out_put_scope;

[Severity: High]
If a removed overlay contains non-MDIO nodes (for example, I2C devices),
`of_mdiobus_find_parent()` will return NULL.

Since `busy` is initialized to `true`, doesn't jumping to `out_put_scope`
return `true` in this case?

Because this overlay notifier is registered globally, does this inadvertent=
ly
block the removal of any overlay containing non-MDIO nodes system-wide by
falsely claiming the non-MDIO node is a busy MDIO device?

> +
> +	if (!mdiobus_device_change_begin(mdio, true)) {
> +		busy =3D of_mdiobus_node_is_busy(mdio, scope);
> +		mdiobus_device_change_end(mdio, true);
> +	}
> +	put_device(&mdio->dev);
> +
> +out_put_scope:
> +	of_node_put(scope);
> +	return busy;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-submit-mdi=
o-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com?part=3D3
