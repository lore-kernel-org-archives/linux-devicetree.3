Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2659411685
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542890; cv=none; b=fkEXBHrShUrG8LiuwHzLW3zDPCfSX04sBdOh1WIPvRR2DU6OZ1qtBh8aLnsECSW1yO+GYHeIOIIKngZ8obPOi2lqChUHwTOv/gsFyK7qBOSsBoSVw3KCxyccxY2jvzV4qbCB+pbiBpOFlpWi6ffUKPETp46HUXMR857DT6vtScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542890; c=relaxed/simple;
	bh=Jsz3Db/YvBHk2/1ccp4GG5nWIFSfqsxBDx55RoAD3Z4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CbH1KP+/dTuh890GFI8Dy+2dg3rPd3nigWW+4WPBkVMPRXGZqch2IGSt5sFWBlXbHmfvFQNs16e5HsF9bKVyWMxfvKjJuI02eqx+BqhEYITuJJqeAvmBRB/3udq00NOwgd+3k1AgC+agf8kVb6L0bT9dN1lgQImRRuHgCxhjxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhgkI1X5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhgkI1X5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4AE1F00A3A;
	Mon, 15 Jun 2026 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542889;
	bh=P2DvhsrlohspRnvSDrey7w8scAXR7MWZNFdGuEMn3ZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nhgkI1X5lWf0rih5rl9lD44RqnH75pALxjaQq8UvXaFDS1NnxsotyCuNuCtajcLhE
	 UPkmQB68ePhlzrEHDI3wL84RWNyVWThoqtn/Xb2axmprjAVCX4HnG0UB1A9YiIsArK
	 ixFjWyYl/6z1X1jpo3EE8e45tvpumqlIqWTELR8YwdtQhoxMzCytu6JFNp6VU5kKZQ
	 320vViLdIrGkBnbB1z/me7nXRfuPt8J3reKkMQyMUAg6ywLa9fID4qFkTcp4vXt8ag
	 GbufpMeDVbpvEQTspz3JnA+yBOEExQjCDSvFtPf11cdtlEQcz2t/pYIGaHPiJKkblQ
	 q2rxfJGBT4cjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 08/15] net: ethernet: oa_tc6: read, write
 interface with MMS option
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614-s2500-mac-phy-support-v5-8-89874b72f725@onsemi.com>
References: <20260614-s2500-mac-phy-support-v5-8-89874b72f725@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:01:28 +0000
Message-Id: <20260615170128.DC4AE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown order in lan865x_remove allows a race condition=
 leading to a use-after-free on the private netdev structure.
--

commit 6ac71b4b2fa47efef74336ba2f488f113f5cdd43
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: read, write interface with MMS option

This commit introduces new read/write APIs to the oa_tc6 framework that
accept the Memory Map Selector (MMS) as a parameter. This allows vendors
to use any memory map selector without having to manually encode the
address prior to calling the API. The lan865x driver is updated to use
these new functions.

> diff --git a/drivers/net/ethernet/microchip/lan865x/lan865x.c b/drivers/n=
et/ethernet/microchip/lan865x/lan865x.c
> index 0277d9737369a..3b555ee698041 100644
> --- a/drivers/net/ethernet/microchip/lan865x/lan865x.c
> +++ b/drivers/net/ethernet/microchip/lan865x/lan865x.c

[ ... ]

> @@ -235,7 +240,8 @@ static void lan865x_multicast_work_handler(struct wor=
k_struct *work)
>  		if (lan865x_clear_all_multicast_addr(priv))
>  			return;
>  	}
> -	ret =3D oa_tc6_write_register(priv->tc6, LAN865X_REG_MAC_NET_CFG, regva=
l);
> +	ret =3D oa_tc6_write_register_mms(priv->tc6, LAN865X_REG_MAC_NET_CFG,
> +					OA_TC6_PHY_C45_MAC_MMS1, regval);
>  	if (ret)
>  		netdev_err(priv->netdev, "Failed to enable promiscuous/multicast/norma=
l mode: %d\n",
>  			   ret);

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the changes
around the multicast work handler, I noticed an issue with the teardown ord=
er
in lan865x_remove().

Can a use-after-free occur here?

drivers/net/ethernet/microchip/lan865x/lan865x.c:lan865x_remove() {
    ...
    cancel_work_sync(&priv->multicast_work);
    unregister_netdev(priv->netdev);
    oa_tc6_exit(priv->tc6);
    free_netdev(priv->netdev);
}

Since cancel_work_sync() is called before unregister_netdev(), couldn't
user-space trigger a configuration change (like toggling promiscuity via
ip link) during this window?

This would call ndo_set_rx_mode and reschedule the multicast work.

When free_netdev() subsequently frees the priv structure, the queued work
would remain on the workqueue, potentially accessing the freed priv pointer
when it later executes.

Should unregister_netdev() be called before cancel_work_sync() so the device
is no longer visible to user-space, preventing further ndo_set_rx_mode call=
s?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-s2500-mac-=
phy-support-v5-0-89874b72f725@onsemi.com?part=3D8
