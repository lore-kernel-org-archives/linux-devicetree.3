Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165F370AF1
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786663273; cv=none; b=VEBruslRZajq/d730xtvvFY733ix0Cweo91apSH0cIkI01SKSa4vzyEE6Xrw9g1XdJhg6D8P1ZzyA7sGeIdgZPKZfNGTGiF/E3nsxIXhK2s/dfntclsX5DgtBUSv84PcneKTxiYG78un3V60Wu8z0dMuzFlZ5XUx218YJle9G1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786663273; c=relaxed/simple;
	bh=fzLGDkBnmKqOVTqDzI5VN4iBd9IXmgYYHIMyn5nmEeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OCOZiQ/kw6GX3gsYTQvIIvYmeLkzxQ5x86e64mxr/ZlEu/bLYkbkZ36RiR/LZ4eXgBUwB8x6fOHD1Rga3Xw1F7ltf/uMy3MX4LfLeRGMhHRmC5rq3j8MXyRQ/eJKHIuxl995uAEufdBe4yZw5NxnQ4vuwD2wtXV3CzU6Qnokejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cz3q/ogC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cz3q/ogC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001F41F000E9;
	Thu, 13 Aug 2026 23:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786663272;
	bh=LA8ltVWCbTBhuoXfH+DvZEn8k+vIF4HVFyLA+daX4XA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cz3q/ogCo8AKqH596HX8OTvZhbhJWrlFQde1+nw+Zjh9s4kgRv1T5iBdv7Tts6txC
	 OXU3xc1rDnlnl4UZKEuJ+a3LcJ6AAnt/JFbc5kk3WKL0sJitm7cD4qudTd5Sh6ZOkh
	 Lpf/Y0zhpFMs9Pl2nie74MLRnEuvQPnub/Nc/zt9qYDE0lB0zpKBQozb8UHfzdrDA0
	 I5sDx6Bn3RirJ9xXBkFnk340zzXh49qG4uJbEeZsYVluEHn+gUvZXCGmi2HbwfGFK8
	 uZ5YFA0k4qmQCQW+ZJygDAm/RgZ9wfL21lxc5waDBCZ6O26wtRGy8mY40MNg3X8Xnw
	 WEAoWRg4XRENg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 04/11] net: airoha: Rely on net_device
 pointer in HTB callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260401-airoha-eth-multi-serdes-v2-4-ac427ae4beeb@kernel.org>
References: <20260401-airoha-eth-multi-serdes-v2-4-ac427ae4beeb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:21:07 +0000
Message-Id: <20260813232108.001F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] An off-by-one error in `airoha_tc_remove_htb_queue` disables the h=
ardware rate limit for the wrong queue.
- [High] Unconditional linear increment/decrement of `real_num_tx_queues` c=
ombined with sparse statically mapped queue IDs causes out-of-bounds queue =
indices and silent truncation of active queues.
- [High] Missing collision check during HTB leaf queue allocation leads to =
silent hardware state overwrites and permanent leaks of `real_num_tx_queues=
`.
--

--- Patch [4]: [PATCH net-next v2 04/11] net: airoha: Rely on net_device po=
inter in HTB callbacks ---
commit 358f6f560341ad816e004d993767ab86443f985e
Author: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: net: airoha: Rely on net_device pointer in HTB callbacks

Remove airoha_gdm_port dependency in HTB tc callback signatures and rely
on net_device pointer instead. This patch does not introduce any logical
change and is a preliminary patch.

> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2503,21 +2504,21 @@ static int airoha_qdma_set_tx_rate_limit(struct a=
iroha_gdm_port *port,
>  	return 0;
>  }
> =20
> -static int airoha_tc_htb_alloc_leaf_queue(struct airoha_gdm_port *port,
> +static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
>  					  struct tc_htb_qopt_offload *opt)
>  {
>  	u32 channel =3D TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
>  	u32 rate =3D div_u64(opt->rate, 1000) << 3; /* kbps */
> -	struct net_device *dev =3D port->dev;
> -	int num_tx_queues =3D dev->real_num_tx_queues;
> -	int err;
> +	int err, num_tx_queues =3D netdev->real_num_tx_queues;
> +	struct airoha_gdm_port *port =3D netdev_priv(netdev);
> =20
>  	if (opt->parent_classid !=3D TC_HTB_CLASSID_ROOT) {
>  		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
>  		return -EINVAL;
>  	}
> =20
> -	err =3D airoha_qdma_set_tx_rate_limit(port, channel, rate, opt->quantum=
);
> +	err =3D airoha_qdma_set_tx_rate_limit(netdev, channel, rate,
> +					    opt->quantum);

[Severity: High]
This is a pre-existing issue, but is there a missing collision check when
multiple TC classes map to the same channel via the modulo operation?

If this occurs, could it silently overwrite the active hardware rate limit
and incorrectly increment real_num_tx_queues a second time for the same
channel? When the classes are eventually deleted, the first deletion will
clear the bit in qos_sq_bmap, causing subsequent deletions to fail the
check and permanently leak the inflated queue count.

>  	if (err) {
>  		NL_SET_ERR_MSG_MOD(opt->extack,
>  				   "failed configuring htb offload");
> @@ -2527,9 +2528,10 @@ static int airoha_tc_htb_alloc_leaf_queue(struct a=
iroha_gdm_port *port,
>  	if (opt->command =3D=3D TC_HTB_NODE_MODIFY)
>  		return 0;
> =20
> -	err =3D netif_set_real_num_tx_queues(dev, num_tx_queues + 1);
> +	err =3D netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);

[Severity: High]
This is a pre-existing issue, but does incrementing real_num_tx_queues
unconditionally by 1 cause out-of-bounds queue mapping in the network stack?

The qid is statically assigned based on the channel, which could result
in a sparse ID that exceeds the new real_num_tx_queues value, causing the
enqueue path to wrap around.

>  	if (err) {
> -		airoha_qdma_set_tx_rate_limit(port, channel, 0, opt->quantum);
> +		airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
> +					      opt->quantum);
>  		NL_SET_ERR_MSG_MOD(opt->extack,
>  				   "failed setting real_num_tx_queues");
>  		return err;

[ ... ]

> @@ -2716,44 +2718,47 @@ static int airoha_dev_setup_tc_block(struct net_d=
evice *dev,
>  	}
>  }
> =20
> -static void airoha_tc_remove_htb_queue(struct airoha_gdm_port *port, int=
 queue)
> +static void airoha_tc_remove_htb_queue(struct net_device *netdev, int qu=
eue)
>  {
> -	struct net_device *dev =3D port->dev;
> +	struct airoha_gdm_port *port =3D netdev_priv(netdev);
> =20
> -	netif_set_real_num_tx_queues(dev, dev->real_num_tx_queues - 1);
> -	airoha_qdma_set_tx_rate_limit(port, queue + 1, 0, 0);
> +	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);

[Severity: High]
This is a pre-existing issue, but could decrementing real_num_tx_queues
blindly during out-of-order queue deletions silently truncate higher-number=
ed
queues that are still active?=20

This might result in qdisc_reset_all_tx_gt() improperly destroying active
queues.

> +	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);

[Severity: High]
This is a pre-existing issue, but does this off-by-one index clear the
hardware rate limit for the wrong queue?

The allocation path configures the hardware using the exact channel index,
but the removal path passes queue + 1. Will this leave the deleted queue's
rate limit orphaned while unintentionally disabling an adjacent active
queue's rate limit?

>  	clear_bit(queue, port->qos_sq_bmap);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260401-airoha-eth=
-multi-serdes-v2-0-ac427ae4beeb@kernel.org?part=3D4
