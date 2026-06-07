Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AFB1EA65
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810979; cv=none; b=h4SpJFxmf2iW/Ly98eTXldf3VhUkB0ecIDI/MFP2QzYeRyj9nNap2OiJsvNT+E1U9wqPSlz2yZbYmx9vsgZ7OE7G1iP0kCDrig7Mp3LdUoN+7VffzjeWxuwXPEd/DVZqg6X4KxpIga+IHexaTJR7zg+23pK7DIsIPgKN/uTte4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810979; c=relaxed/simple;
	bh=i/XO4KBntPlm5eVXJ1RG6AuTwDtsxwpnoqWFUGdukkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hf9lrcbZUzxHX53RSQf4nL5QLeem/h3ATkh6PR0mB06xNq+im7jBEatPK9f/Os5+ravch0p+dYQ036ZDAABt62CRHQhPbgEEIkv3W6Snm+DlGYL+2RWmxYu++DhvbUwPNb5nuTa9g5bmfZYnRzkuaxn20sAfWZgUEA4OyM1gYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRJ4p361; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRJ4p361"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE481F00898;
	Sun,  7 Jun 2026 05:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810978;
	bh=NNUBi96K2sfWY9GOPEprLa8XCPH8VsihDcirVR/BZS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aRJ4p361i7SgPzQQ4p5RYzgS/Ea/lnWvC9yj/rPIRyE+l6/78r6F8GYSuUZJVtyOp
	 UwU46tjlWemlBw1Sbblb4wIfmwDaTlEg8yL6I5hgCI604ytggS/fsuVJHVFXkl6Y9B
	 StNclEG7nerXwO3nLXq6MWxXrz37eOs5KA97MtH4LdbrDfzKWp0qdr5ef6KcUsvtkq
	 fkxOk9SFckhzWrzJE/tTGSLJmeymu4m1R1Z0wR/TjLyc1Q6aLSaDqVBzax6iAunWue
	 9Q9AMXHnPBIY7u1TUkQNcT3CJf99+fOMxcPMP1xL7ghaSWd84tHyoWsqXDf/2NSsn/
	 zMshtySVBpdWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 08/16] net: ethernet: oa_tc6: Remove FCS
 size in RX frame
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-8-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-8-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:42:57 +0000
Message-Id: <20260607054257.CFE481F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Missing length validation before pulling headers from the received=
 packet can lead to out-of-bounds reads and integer underflow on `skb->len`.
- [High] Dereferencing `skb->data` as a 32-bit integer causes unaligned mem=
ory accesses, leading to alignment faults on some architectures.

Pre-existing issues:
- [High] Missing bounds check on `skb_put()` during RX chunk processing all=
ows a malfunctioning MAC-PHY to cause a kernel panic via `skb_over_panic()`.
- [High] A transient memory allocation failure permanently kills the driver=
's SPI worker thread, rendering the interface permanently unusable.
- [High] Processing intermediate or end-only RX chunks when no SKB is alloc=
ated causes a NULL pointer dereference.
--

commit 84d3033631dd42f209b8cf8f2057dce10291f539
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Remove FCS size in RX frame

This commit modifies the RX path to strip the Ethernet FCS from incoming
frames before passing them to the networking stack. The stripping is skipped
if the user has requested to keep the FCS via NETIF_F_RXFCS.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6.c b/drivers/net/ethernet/=
oa_tc6/oa_tc6.c
> index 2f9ace655e81c..26033373f16fc 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
> @@ -782,12 +782,22 @@ static void oa_tc6_submit_rx_skb(struct oa_tc6 *tc6)
>  {
>  	oa_tc6_update_ts_in_rx_skb(tc6);

[Severity: High]
Can an undersized frame cause an integer underflow on skb->len?

Looking at oa_tc6_update_ts_in_rx_skb() in drivers/net/ethernet/oa_tc6/oa_t=
c6.c:

    ts[0] =3D be32_to_cpu(*((u32 *)(skb->data)));
    ts[1] =3D be32_to_cpu(*((u32 *)(skb->data) + 1));
    ...
    skb_pull(skb, sizeof(ts));

This sequence reads 8 bytes from skb->data and pulls them without verifying=
 if
skb->len is at least 8.=20

Later, eth_type_trans() will pull ETH_HLEN. If a small or corrupted frame is
received, could these pulls subtract past zero and wrap skb->len to a huge
value, leading to out-of-bounds accesses?

[Severity: High]
Is there a risk of unaligned memory access faults here?

In oa_tc6_update_ts_in_rx_skb():

    ts[0] =3D be32_to_cpu(*((u32 *)(skb->data)));

The receive SKB is typically allocated with netdev_alloc_skb_ip_align(), wh=
ich
offsets skb->data by 2 bytes to align the IP header. Casting this unaligned
pointer to a 32-bit integer and dereferencing it can trigger alignment faul=
ts
on architectures lacking hardware support for unaligned accesses.=20

Would using get_unaligned_be32(skb->data) prevent this issue?

> +	/* MAC-PHY delivers each frame with its Ethernet FCS attached.
[ ... ]
> +	if (!(tc6->netdev->features & NETIF_F_RXFCS) &&
> +			tc6->rx_skb->len > ETH_FCS_LEN)
> +		skb_trim(tc6->rx_skb, tc6->rx_skb->len - ETH_FCS_LEN);
> +
>  	tc6->rx_skb->protocol =3D eth_type_trans(tc6->rx_skb, tc6->netdev);
>  	tc6->netdev->stats.rx_packets++;
[ ... ]

Looking at oa_tc6_update_rx_skb() in drivers/net/ethernet/oa_tc6/oa_tc6.c:

    memcpy(skb_put(tc6->rx_skb, length), payload, length);

[Severity: High]
This is a pre-existing issue, but does this skb_put() call need a bounds
check?

If a malfunctioning MAC-PHY sends an unexpectedly large frame or continuous=
ly
sends intermediate chunks (where start_valid and end_valid are false), the
accumulated length could exceed the allocated SKB buffer size.=20

Will this trigger skb_over_panic() and crash the kernel?


Looking at the interaction between oa_tc6_allocate_rx_skb() and
oa_tc6_spi_thread_handler() in drivers/net/ethernet/oa_tc6/oa_tc6.c:

oa_tc6_allocate_rx_skb():
    if (!tc6->rx_skb) {
        tc6->netdev->stats.rx_dropped++;
        return -ENOMEM;
    }

oa_tc6_spi_thread_handler():
    ret =3D oa_tc6_try_spi_transfer(tc6);
    if (ret)
        return ret;

[Severity: High]
This is a pre-existing issue, but how does the driver recover if memory
allocation fails?

If oa_tc6_allocate_rx_skb() returns -ENOMEM, the error propagates through
oa_tc6_try_spi_transfer() to oa_tc6_spi_thread_handler(), which then exits
its loop and terminates the kthread.=20

Since this thread handles all communication with the MAC-PHY, does a transi=
ent
out-of-memory condition cause a permanent denial of service for the interfa=
ce
until the module is reloaded?


Looking at oa_tc6_prcs_ongoing_rx_frame() and oa_tc6_update_rx_skb() in
drivers/net/ethernet/oa_tc6/oa_tc6.c:

oa_tc6_prcs_ongoing_rx_frame():
    oa_tc6_update_rx_skb(tc6, payload, OA_TC6_CHUNK_PAYLOAD_SIZE);

oa_tc6_update_rx_skb():
    memcpy(skb_put(tc6->rx_skb, length), payload, length);

[Severity: High]
This is a pre-existing issue, but what happens if an intermediate or end-on=
ly
RX chunk arrives when no SKB is allocated?

If a chunk arrives with start_valid=3Dfalse (for example, due to dropped
previous chunks or an SPI transport error) and tc6->rx_skb is NULL, the dri=
ver
unconditionally calls oa_tc6_update_rx_skb().=20

Could calling skb_put() on a NULL tc6->rx_skb result in an immediate kernel
panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D8
