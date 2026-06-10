Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D50369D53
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121053; cv=none; b=iB86tYLfIdIwHhvZGuBJuksUJqspOaEvT2zF6FJAYo7h6kiK26rE30zdMA1m7b4UOfg1fWz8riaF7gYX5vDC0ZgUndT+qTJ79dmJZlruyFO7hytnuAU/jR9EWrj+yt6N7U3zaBpmvLImaW2jwV+w3T3sSjPFafcPTRA0mBDMLpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121053; c=relaxed/simple;
	bh=IRY8ns0g9Y1v+CfRHM2Skn9S5KReNOJ9GOnpzFyfkmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cqK1xrbDD6umY1Qq1p7txHU7zVVtMkIneOgGzcs9vAQovRBVW8obmMyCaiApXctcu1pQGZaChH1hgzX0t5ajqb3m+g+L/2I6gOIHkGDTIgRq6nPY/SoR82vfvzj0UP8e8Th0YEIwnVPPozXH6gIBQp/xmqiIOyhjk6o9AY+mSog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k24c8PCY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k24c8PCY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745441F00899;
	Wed, 10 Jun 2026 19:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781121051;
	bh=gD6H/T4JAoK48N6iQhAkED2aUkmantWNjbjjo5BeXP8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k24c8PCYS2P4PTZ7myK6atOdc2tmhB9iHvhlEEC2YCQC+/poUX2SSXSAO3YbJw8Pi
	 EcfRk2Fk5Ewl37bZ1x/tTGl1APnmW9dwfuDUuSW78f4WEWO9CfVi8QXhoEDCmetlm8
	 iITO1xI8Qi7nCbtwieEza5RErl4YoxIq5u80cXS9Y7bQnpykvf17VHNKO7gn1ZOcYd
	 vnI3FWYxZvHshBlSaIVhbKnIEFnyiNx4VctOPIY71E8v3ssb0c4eQcu6gCFk5Llt5S
	 VnE8v+yVDAN8txhiWYX4NYuTmW9ad8HukWcTJWxZ0uHpR28V6YwMk0K3DeFRvKez8O
	 GPhv8/dlma/pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4 3/4] net: ethernet: oa_tc6: mdiobus->parent
 initialized with NULL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-level-trigger-v4-3-6f389abdd192@onsemi.com>
References: <20260609-level-trigger-v4-3-6f389abdd192@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 19:50:51 +0000
Message-Id: <20260610195051.745441F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free during driver removal due to missing devm teardown =
synchronization.
- [High] Hardware-induced kernel panic (DoS) due to unchecked `skb_put()` e=
xtending beyond allocated buffer bounds.
- [High] Race condition freezing the TX queue due to lockless `waiting_tx_s=
kb` check.
--

commit 2c34943e07dcd7c39f87708d303b4633c83360bd
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: mdiobus->parent initialized with NULL
   =20
As "dev" pointer in oa_tc6 structure is never initialized,
mbiosub->parent was initialized with NULL.  This change
fixes the issue.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 20c9e98d1d607..0710a5a8dcdec 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -108,7 +108,6 @@
> =20
>  /* Internal structure for MAC-PHY drivers */
>  struct oa_tc6 {
> -	struct device *dev;
>  	struct net_device *netdev;
>  	struct phy_device *phydev;
>  	struct mii_bus *mdiobus;

[ ... ]

[Severity: High]
This is a pre-existing issue, but could this teardown sequence result in a
use-after-free crash?

In drivers/net/ethernet/microchip/lan865x/lan865x.c:lan865x_remove():

    unregister_netdev(priv->netdev);
    oa_tc6_exit(priv->tc6);
    free_netdev(priv->netdev);

The driver registers a threaded IRQ using devres. This means the IRQ is fre=
ed
after the remove() function completes.

Could the IRQ thread run concurrently with or after oa_tc6_exit() and
free_netdev(), accessing the freed SKBs and netdev structure since the acti=
ve
background thread is not canceled before freeing its resources?

[Severity: High]
This isn't a bug introduced by this patch, but does this code properly
validate the buffer boundaries before appending data?

In drivers/net/ethernet/oa_tc6.c:oa_tc6_prcs_ongoing_rx_frame():

    oa_tc6_update_rx_skb(tc6, payload, OA_TC6_CHUNK_PAYLOAD_SIZE);

Which appends data unconditionally in oa_tc6_update_rx_skb():

    memcpy(skb_put(tc6->rx_skb, length), payload, length);

If a faulty or malicious MAC-PHY continuously sends data chunks without
asserting the end_valid flag, wouldn't skb_put() hit the end of the buffer
and trigger skb_over_panic() since there is no check against skb_tailroom()?

[Severity: High]
This is a pre-existing issue, but could this lockless check cause the TX
queue to freeze permanently?

In drivers/net/ethernet/oa_tc6.c:oa_tc6_start_xmit():

    if (tc6->waiting_tx_skb) {
        netif_stop_queue(tc6->netdev);
        return NETDEV_TX_BUSY;
    }

And in oa_tc6_try_spi_transfer() on the worker thread:

    if (!tc6->waiting_tx_skb && netif_queue_stopped(tc6->netdev))
        netif_wake_queue(tc6->netdev);

If the worker thread takes the lock, clears waiting_tx_skb, and evaluates
netif_queue_stopped() before start_xmit() actually stops the queue, the
worker thread skips waking the queue.

When start_xmit() resumes, it stops the queue and returns NETDEV_TX_BUSY.
Since waiting_tx_skb is now NULL and the worker missed the wake-up, is there
anything left to wake the queue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-level-trig=
ger-v4-0-6f389abdd192@onsemi.com?part=3D3
