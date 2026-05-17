Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C62E414
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997494; cv=none; b=LmdyybIvslfqcLMWdFRhOYuE+iScccdi+GidGDxCq/EK3BDzRQagKnbMgMi/lJ1LAEETKBoG1z4FDyQfiilTC29V9dj280soliPmjPqP+Xrl2IDXb0viwS7p/IWmKwUV+NBHbQVTBLoM60e7PIBULkizSRp0oLDqyobZbhuFgwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997494; c=relaxed/simple;
	bh=K88ZJiLw5ctd0Di2P9lDQyM+4QJGSnXaUU8/IYFroyw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tWwYtIOJqIqz/c5p8cDmLhRwgJcY/HxnoGekLX5KKI9TidUw4FTqZ2DbALA3NqJ4qMvgTO+dk2fvuF/L961T3h+YBdim+DVi0MB8UGkslz5dITg2FCN5dwGntamkqpp7QPmeqtYyZl7kiqCpNXR+oJdyJWCoWcJKAR1Cc6CCXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJzF51UA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJzF51UA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D107C2BCB0;
	Sun, 17 May 2026 05:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778997494;
	bh=K88ZJiLw5ctd0Di2P9lDQyM+4QJGSnXaUU8/IYFroyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tJzF51UAEqhwwtSFCxlj9KxUjF1hIfXUs9SeWIzMMHiYfVoeNJXcxaXLIgJWux7tM
	 VgdgrZ3ZzdUhXx2JUPThjaQbzkq+laBfGgFQS+M68HJRbNdOjH3zsSeFl2vUaLNS8k
	 CrNRzfUineVTTGjOPL9zHXlictJyB5iJb+3Aq3GpNIenRb9slhu+5Pis6oyNDex65G
	 U7xFhLGwGC97Uyyrx48fF1D6jt6m/lAmhYlU3obfNCm4G18kNRGHYsN2AkRBdmW45d
	 Z2tPmAra9s0invhoyEQrA7Jf+2OZi5g3Piv9t4kwTz9R1rcFcyyJ+INkAGMa4AXDkb
	 lThymkpuhpnHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 05/10] net: airoha: Move qos_sq_bmap in
 airoha_gdm_dev struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260516-airoha-eth-multi-serdes-v7-5-99e0093303e2@kernel.org>
References: <20260516-airoha-eth-multi-serdes-v7-5-99e0093303e2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 05:58:13 +0000
Message-Id: <20260517055814.3D107C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Off-by-one error in airoha_tc_remove_htb_queue when clearing hardw=
are rate limit.
- [High] Blind increment/decrement of real_num_tx_queues breaks HTB offload=
 for non-sequential queue IDs.
--

commit 7088e1abda5f2f9f4a048fc5586684fdaf382845
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct

This commit moves the qos_sq_bmap field from airoha_gdm_port to
airoha_gdm_dev to prevent overwrites when multiple net_devices share a GDM
port. It also adds qos_channel_map to track QDMA channels in use.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index b90fc1cbfbc48..2a2a30dbad27e 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2597,44 +2597,61 @@ static int airoha_qdma_set_tx_rate_limit(struct n=
et_device *netdev,

[ ... ]

>  	err =3D netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);
>  	if (err) {
>  		airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
>  					      opt->quantum);
>  		NL_SET_ERR_MSG_MOD(opt->extack,
>  				   "failed setting real_num_tx_queues");
> -		return err;
> +		goto error;
>  	}
> =20
> -	set_bit(channel, port->qos_sq_bmap);
> +	set_bit(channel, dev->qos_sq_bmap);
>  	opt->qid =3D AIROHA_NUM_TX_RING + channel;

This problem wasn't introduced by this patch, but is a logic flaw that
breaks the offload functionality.

When allocating a QoS channel, real_num_tx_queues is blindly incremented by
1 while the qid is derived from the channel. If a user allocates a
non-sequential classid (for example, mapping to channel 3 when it is the
first allocated queue), real_num_tx_queues will become
AIROHA_NUM_TX_RING + 1, but qid will be AIROHA_NUM_TX_RING + 3.

When transmitting, netdev_cap_txqueue() strictly validates that the packet's
queue_mapping is < real_num_tx_queues.

Since qid exceeds the blindly incremented count, will the stack log a warni=
ng
and forcefully route the packet to queue 0, silently bypassing the HTB
hardware rate limit?

Additionally, does blindly decrementing the count when deleting queues
immediately invalidate any active higher-indexed queues?

> @@ -2815,11 +2832,13 @@ static int airoha_dev_setup_tc_block(struct net_d=
evice *dev,
>  static void airoha_tc_remove_htb_queue(struct net_device *netdev, int qu=
eue)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_qdma *qdma =3D dev->qdma;
> =20
>  	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
>  	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);

This problem wasn't introduced by this patch, but the patch exposes it to
cross-device corruption.

In airoha_tc_remove_htb_queue(), the driver attempts to disable the hardware
rate limit for the removed queue by calling airoha_qdma_set_tx_rate_limit()
with queue + 1. However, the queue is originally allocated and configured
using the channel index (where channel equals queue).

Passing queue + 1 fails to clear the rate limit of the actually deleted que=
ue,
permanently leaking its hardware state. Furthermore, it incorrectly zeros o=
ut
the rate limit of the adjacent queue.

Because this patch allows multiple net_devices to share the same QDMA block
and its channels, could deleting a QoS queue on one interface unexpectedly
corrupt the QoS hardware state of another interface actively using the
adjacent channel?

> -	clear_bit(queue, port->qos_sq_bmap);
> +
> +	clear_bit(queue, qdma->qos_channel_map);
> +	clear_bit(queue, dev->qos_sq_bmap);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-airoha-eth=
-multi-serdes-v7-0-99e0093303e2@kernel.org?part=3D5
