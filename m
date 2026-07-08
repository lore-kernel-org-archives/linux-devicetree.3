Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF763FFFBD
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550098; cv=none; b=twhHYEE+Y96Yl0CPkjvrBpOrlnBlEuBEovyUusQpUBKABfzT9LWZhaL+U/17GS1FlaSR+Fx2nNqm1M+DrtMundKGUmHKdQqVJQHxxpD6un+Ov7d+bqCEirsFhITq73rRs4RpVNVBwV3rEU1v7WlY5QJuipCkg3KCoUGbpuEu1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550098; c=relaxed/simple;
	bh=lxqx9nGrTHhPX8JP1Ln+yeHkMygAYhJ6SxiSGH//evQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P0FuA8L8h+wZFlXlscGxhTd6eTOB7BsrzSSDMKhPsjhD2ozaRFY4FVJCFkWKErtkZTXuXHG4ahdM8pfiqcVg80n7cDnXM8WVPyUvWyOSgsOjW6iTFejSIXOj08ThzxRstAqDYixPTYVRmoW2LVMbwfHOahpaNaqJNyl/YA5WCGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xy92Oq+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xy92Oq+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3241F00A3A;
	Wed,  8 Jul 2026 22:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783550096;
	bh=28JehZwQtJc8tityUz0pKKfE01r4y9fdA9YdGU7BeIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xy92Oq+cdsBxfFnV8U7aT2aMAvtSX3G8/8B+CnsS4yHGcd1phX6Hf4/xHOq0YSXfk
	 SPmhwI2Xv87cEuP92XgAOHo2Z1HKGIxHRzR0AkDIGs4PxU8+CJfmWmeTO71XYXJ10Y
	 XGHP5aaSPBXe0Jl3UvBINfCil7aHh7ayg0yjNqr6mBvd5pihH12CKF503HCSr71YI+
	 ti+fgAMNXm1YqjxhEei3uFFgh3thYIBbAvN6HHVs9gGqTry73aebz+vHC9XgCuIHs7
	 FJ4hNfiUWoJBYVTgT2op4iUgjCMtb378nh0gpa9RgyhQOCkkZi0G4N1b96HOBkn/M3
	 dfZYMNPvxqqjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 03/13] net: ethernet: oa_tc6: add
 OA_TC6_BROKEN_PHY quirk flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus" <ciprian.regus@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-adin1140-driver-v5-3-4aca7b51a58b@analog.com>
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-3-4aca7b51a58b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:34:56 +0000
Message-Id: <20260708223456.8C3241F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Workqueue canceled before netdev unregistration, leading to potent=
ial Use-After-Free of private data.
- [Medium] Lockless modification of waiting_tx_skb in oa_tc6_free_pending_s=
kbs causes an skb memory leak.
--

--- Patch [3]: [PATCH net-next v5 03/13] net: ethernet: oa_tc6: add OA_TC6_=
BROKEN_PHY quirk flag ---
commit bf2392954a9b18d08ae43c154ebae75b683c36c6
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: add OA_TC6_BROKEN_PHY quirk flag
   =20
Some MAC-PHY devices need custom MDIO bus access functions to work
around hardware issues. Add the OA_TC6_BROKEN_PHY quirk flag so drivers
can opt in to skip oa_tc6's internal PHY init and manage the PHY
themselves. When the flag is set, oa_tc6 skips MDIO bus registration,
PHY discovery and PHY connection, leaving these to the driver.
   =20
Drivers that do not set the flag retain the existing behavior. Update
lan865x and the framework documentation accordingly.

> diff --git a/drivers/net/ethernet/microchip/lan865x/lan865x.c b/drivers/n=
et/ethernet/microchip/lan865x/lan865x.c
> index 0277d9737369a..26a2761332a5a 100644
> --- a/drivers/net/ethernet/microchip/lan865x/lan865x.c
> +++ b/drivers/net/ethernet/microchip/lan865x/lan865x.c
> @@ -346,7 +346,7 @@ static int lan865x_probe(struct spi_device *spi)
>  	spi_set_drvdata(spi, priv);
>  	INIT_WORK(&priv->multicast_work, lan865x_multicast_work_handler);
> =20
> -	priv->tc6 =3D oa_tc6_init(spi, netdev);
> +	priv->tc6 =3D oa_tc6_init(spi, netdev, NULL);
>  	if (!priv->tc6) {
>  		ret =3D -ENODEV;
>  		goto free_netdev;

[Severity: High]
This isn't a bug introduced by this patch, but looking at the driver's
teardown order in lan865x_remove(), is there a risk of a use-after-free of
the priv structure?

drivers/net/ethernet/microchip/lan865x/lan865x.c:lan865x_remove() {
	...
	cancel_work_sync(&priv->multicast_work);
	unregister_netdev(priv->netdev);
	...
}

If user-space changes the interface flags (e.g., promiscuous mode) while the
driver is being unbound, .ndo_set_rx_mode (lan865x_set_multicast_list) could
be invoked, unconditionally rescheduling priv->multicast_work.

If this happens after cancel_work_sync() but before unregister_netdev()
completes, the rescheduled work could execute after free_netdev() has freed
the priv structure.=20

Could unregister_netdev() be called before cancel_work_sync() to guarantee
no further callbacks will be invoked?

[ ... ]

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 8b96558834960..fa1359224535c 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c

[ ... ]

> @@ -1327,11 +1334,13 @@ static int oa_tc6_check_ctrl_protection(struct oa=
_tc6 *tc6)
>   * oa_tc6_init - allocates and initializes oa_tc6 structure.
>   * @spi: device with which data will be exchanged.
>   * @netdev: network device interface structure.
> + * @quirks: device specific modifiers for the OA TC6 protocol.
>   *
>   * Return: pointer reference to the oa_tc6 structure if the MAC-PHY
>   * initialization is successful otherwise NULL.
>   */
> -struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *ne=
tdev)
> +struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *ne=
tdev,
> +			   struct oa_tc6_quirks *quirks)
>  {

[Severity: Medium]
This is a pre-existing issue, but could this sequence result in a memory le=
ak
of a single SKB in the error handling path?

Looking at oa_tc6_disable_traffic(), tc6->disable_traffic is set to true
locklessly. Immediately after, oa_tc6_free_pending_skbs() calls
oa_tc6_cleanup_waiting_tx_skb(), which checks and clears tc6->waiting_tx_skb
without holding tc6->tx_skb_lock:

drivers/net/ethernet/oa_tc6.c:oa_tc6_cleanup_waiting_tx_skb() {
	if (tc6->waiting_tx_skb) {
		tc6->netdev->stats.tx_dropped++;
		kfree_skb(tc6->waiting_tx_skb);
		tc6->waiting_tx_skb =3D NULL;
	}
}

Concurrently, oa_tc6_start_xmit() evaluates tc6->disable_traffic and
tc6->waiting_tx_skb locklessly. If oa_tc6_start_xmit() reads false/NULL just
before oa_tc6_disable_traffic() modifies them, it will acquire the
tx_skb_lock and overwrite tc6->waiting_tx_skb with a new skb:

drivers/net/ethernet/oa_tc6.c:oa_tc6_start_xmit() {
	...
	spin_lock_bh(&tc6->tx_skb_lock);
	tc6->waiting_tx_skb =3D skb;
	spin_unlock_bh(&tc6->tx_skb_lock);
	...
}

Since traffic is disabled and oa_tc6_cleanup_waiting_tx_skb() has already
executed, will this new skb be left in the queue and leaked until the device
is explicitly unbound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-adin1140-d=
river-v5-0-4aca7b51a58b@analog.com?part=3D3
