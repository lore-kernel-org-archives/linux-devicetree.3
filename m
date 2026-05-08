Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC16D30BF4F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282705; cv=none; b=EfP7DR+7GlXcAgk76kyxZfixHEUHSa8oSUhD4ASz5JdheJ0pjruYQDu0hE1Pq2p0fkMI9yvbtbRDK5AXowX+FUqnZOgvQ0cMUq9Exsl4SamAdIehJj3VT5ugN/Bf5QQLOQ60e5ZnzFGVbZpMeO1aVV6IXs0rhY9tbTeV/Q1OqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282705; c=relaxed/simple;
	bh=bj33KNMV+YOOV/Sx9czmJlWkby1PB+60hjWF9tQGiIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XFYiXb1QOT79v2uPoA5jewNTE6nowJLTaG1tYPT5bCWZU8D4uBbhj9DBucshwlueLn545QQQbX6IF7ygFHVjVjYDbhFhCIVxRD1AnfEtVBd1j+fcCLSLVf4y4CV8c2o5XEApWLnRp9eHkLtpzDexiF6LtFHTgA3zN3sU8VRjLW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbpdnkN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbpdnkN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444AEC2BCB0;
	Fri,  8 May 2026 23:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778282705;
	bh=bj33KNMV+YOOV/Sx9czmJlWkby1PB+60hjWF9tQGiIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BbpdnkN1n4sfcvglGX+pN6tHoP06LB6SLOMuZVdjaL76sd7euqGPtMQMR2H9AmQgs
	 AvbyKbJxRtB3hsGh8lzlW4QyajqQAdgYkvD27nWqCKJ8md5xhM0sJXQ30ZSLy4J5Su
	 YwGo3qrh7E3AMp7Hyq5G7rRhd4Db0n8k49KX+18QDlrOy0qpq/lT6sni+nHEfpxPMz
	 ECO1NRlYsaRI5zmkLl3PTRcCY8F7SAEOkvrlADbrpyO2WDJOLlW5+pHkYQGEhZE+bI
	 SBopuK4FrA1RRTVQonV+/DnwAbl4Zw3gURJRYwiAg5LwOJScKJKMsSNi1vzhPnAVLH
	 dkn4z1w4maYOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 14/15] can: grcan: Update echo skb handling to match
 variable length CANFD frame
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508070121.6918-15-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-15-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:25:03 +0000
Message-Id: <20260508232505.444AEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Flawed queue space check artificially limits TX queue depth to 1 p=
acket.
- [High] Decoupled echo SKB tracking corrupts TX completions and leaks SKBs=
 when multiple frames are batched.
- [Medium] Data race on echo SKB indices between transmission and completio=
n contexts.
--

commit 0d1b72a766dc2d38f5550398f1494cc94c0dd17e
Author: Arun Muthusamy <arun.muthusamy@gaisler.com>
Subject: can: grcan: Update echo skb handling to match variable length CANF=
D frame

The commit refactors echo socket buffer management in the grcan driver to
support variable length CANFD frames. It introduces echo_skb_idx and
next_echo_idx to decouple the echo skb index from the ring buffer slots, and
adjusts the echo skb allocation based on the number of slots.

[ ... ]

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index eba52701c882e..06ef081970a24 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c

[ ... ]

> @@ -604,19 +613,22 @@ static int catch_up_echo_skb(struct net_device *dev=
, int budget, bool echo)
>  	for (work_done =3D 0; work_done < budget || budget < 0; work_done++) {
>  		if (priv->eskbp =3D=3D txrd)
>  			break;
> =20
>  		priv->eskbp =3D grcan_ring_add(priv->eskbp, GRCAN_MSG_SIZE,
>  					     dma->tx.size);
>  		txrd =3D grcan_read_reg(&regs->txrd);
> +
> +		/* Grab the packet once the packet is send or free untransmitted packe=
t */
> +		if (priv->eskbp =3D=3D txrd) {
> +			if (echo) {
> +				/* Normal echo of messages */
> +				stats->tx_packets++;
> +				stats->tx_bytes +=3D can_get_echo_skb(dev, priv->echo_skb_idx, NULL);

If multiple frames complete at the same time, the hardware will advance txrd
by multiple slots. The condition if (priv->eskbp =3D=3D txrd) will only be =
true
for the last frame, skipping any intermediate frames. Does this logic miss
tracking and leak the skbs for the intermediate frames?

Additionally, priv->echo_skb_idx is a single scalar value updated in
grcan_start_xmit() to point to the most recently queued packet. If multiple
packets are in flight, wouldn't this echo the newest packet repeatedly
instead of the oldest, breaking FIFO ordering and leaking the earlier ones?

Finally, priv->echo_skb_idx is read here in the completion context, but it
is modified in grcan_start_xmit() outside of any lock. Is a lock required
here to prevent reading a stale or partially updated index?

> +			} else {
> +				/* For cleanup of untransmitted messages */
> +				can_free_echo_skb(dev, priv->echo_skb_idx, NULL);
> +			}
> +		}
>  	}
>  	return work_done;
>  }

[ ... ]

> @@ -1504,11 +1519,9 @@ static netdev_tx_t grcan_start_xmit(struct sk_buff=
 *skb,
> =20
>  	txwr =3D grcan_read_reg(&regs->txwr);
>  	space =3D grcan_txspace(dma->tx.size, txwr, priv->eskbp);
> -
> -	slotindex =3D txwr / GRCAN_MSG_SIZE;
>  	bds =3D grcan_numbds(len);
> =20
> -	if (unlikely(space < bds)) {
> +	if (unlikely(space < bds || priv->can.echo_skb[priv->echo_skb_idx])) {

At this point in the function, priv->echo_skb_idx still holds the index of
the previously queued packet (it is only updated to priv->next_echo_idx at
the end of the function).

If the previous packet is still in flight, its slot in priv->can.echo_skb
is occupied. Does this cause the condition to evaluate to true, returning
NETDEV_TX_BUSY and artificially limiting the transmission queue depth to a
single packet?

>  		netif_stop_queue(dev);
>  		spin_unlock_irqrestore(&priv->lock, flags);
>  		return NETDEV_TX_BUSY;

[ ... ]

> @@ -1588,7 +1601,13 @@ static netdev_tx_t grcan_start_xmit(struct sk_buff=
 *skb,
>  	 * can_put_echo_skb would be an error unless other measures are
>  	 * taken.
>  	 */
> -	can_put_echo_skb(skb, dev, slotindex, 0);
> +
> +	priv->echo_skb_idx =3D priv->next_echo_idx;
> +
> +	can_put_echo_skb(skb, dev, priv->next_echo_idx, 0);
> +
> +	/* Move to the next index in the echo skb buffer */
> +	priv->next_echo_idx =3D (priv->next_echo_idx + 1) % priv->can.echo_skb_=
max;

These variables are updated here outside of the priv->lock critical section
that was unlocked earlier in the function. Since they are read concurrently
in catch_up_echo_skb() during softirq, does this introduce a data race?

>  	/* Make sure everything is written before allowing hardware to
>  	 * read from the memory
>  	 */
>  	wmb();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D14
