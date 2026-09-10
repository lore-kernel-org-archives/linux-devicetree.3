Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ADE562609
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061512; cv=none; b=lB3RY9eJko9HD73fiOni3tgOeSn/wJubGOHbM3r2RbVtB5DEVjLXGSa/C0iquAbyEFjYNOePgFr031NSs6pgvlESyXiRcU0kiH3EAKvJzn5d5kJJELvaUOVFOsk9EbsjzaUqaKkj7+dzA0mJNdbaM9YV0tn8J14NoO6NcKGhQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061512; c=relaxed/simple;
	bh=NVARBOu0INuy8s3tsB6YlWweeCJEVYyVTjZaWFGkiTg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sd5jzanfbcSVXkVJaWz32eU1MhOrJra2jXP8sRCIQIdTwIKttMSh9Zp/mPCKRT4QAq4aKVU5tlV1xlvb99aJj9RdsaSqoKKQjcy+6KxmGcbfN+fNBjYq4IbF1bSTcenJb+HNx1lbvzkfnMMkyiPVCOyuXnFly3ZzCdMmsnCo3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McS85ehi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McS85ehi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE23E1F00893;
	Thu, 10 Sep 2026 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061502;
	bh=VuisQ1verkdB7kL5b2LGtAoZLLbDi6d/ZfxiXp1b7eU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=McS85ehikb9YsWL7RuPYR/n6oUFwVWTPZWDEoe32yQee9YGxEGOwy9VZuM50mLXsZ
	 azfMKLHNXB8amCtvlie7viKV//r1/k99iDMU8l/2/HvO2dlVAGtTHN34dn1AcwNivX
	 XHVRUXH/5l5baeaTAB2AZL6SiIxMFkEXyfWvkQ1+uP9DFsadKzZ5tEV6AEgdJvgEUj
	 B3Tcmg8dPsku13XVu7rcO7vvBEhMeveu2zay5c2ZpL5dO84mk17aLISjoF7sq65xWO
	 bCbNXJ17xU22JwGSVxG0bqbm73Y0C6E647ypTjRjus5nFXFw/Pl1PUPlpD7Yvkd211
	 buqxTrPQyH13g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 01/10] net: ethernet: ravb: Remove gPTP
 control from WoL setup and restore
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260909173027.2201560-2-niklas.soderlund+renesas@ragnatech.se>
References: <20260909173027.2201560-1-niklas.soderlund+renesas@ragnatech.se>
 <20260909173027.2201560-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:41 +0000
Message-Id: <20260910173141.DE23E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Meaningful code and commit message mismatch leading to unintende=
d PTP clock lifecycle.
--

commit d9a97079fb4ac0a52b7c3683f3c046c7743362d3
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Remove gPTP control from WoL setup and restore

This commit removes the explicit gPTP stop/start calls from the Wake-on-LAN
(WoL) suspend and resume paths. It asserts that opening and closing the
netdev already handles this clock control.

> As the ndev will always be closed and re-opened when
> suspending and resuming the system.

[Severity: Medium]
Is this assumption in the commit message accurate? Looking at ravb_suspend()
in drivers/net/ethernet/renesas/ravb_main.c, it appears to bypass
ravb_close() entirely when WoL is enabled:

	if (priv->wol_enabled) {
		ret =3D ravb_wol_setup(ndev);
		rtnl_unlock();
		return ret;
	}

	ret =3D ravb_close(ndev);


> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -3182,9 +3182,6 @@ static int ravb_wol_setup(struct net_device *ndev)
>  	/* Enable MagicPacket */
>  	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
> =20
> -	if (priv->info->ccc_gac)
> -		ravb_ptp_stop(ndev);
> -

[Severity: Medium]
Since ravb_close() is skipped for WoL suspend, does removing the explicit
ravb_ptp_stop() leave the gPTP clock running?=20

It looks like this might introduce an unintended asymmetric lifecycle on
ccc_gac platforms, where the clock stays running during WoL suspend but is
then unregistered during resume when ravb_wol_restore() invokes ravb_close(=
).

>  	return enable_irq_wake(priv->emac_irq);
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173027.2201=
560-1-niklas.soderlund+renesas@ragnatech.se?part=3D1
