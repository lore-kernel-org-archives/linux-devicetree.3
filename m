Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE01F39B497
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301363; cv=none; b=qHvQSmlBetw6xGJwjG8ltiK1QKGPYcfWA+bPGmtSkhn2cNdU14OyKEfzbFtGa9JLjvOiTNQlh7FyvtowhNofO4Rkhr9qX1/MX1rXMgt9RpY5yyuaFL4lGURiu6mJyKqNZKzgd9pNKQl0x36kqmAMesmNoN7e33jD9Qj3I4HD+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301363; c=relaxed/simple;
	bh=VEBImEnk4A1GOlgQCxcsBgt1wdYL+vXSuSIf1OyZKwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C4327Mipl+R01LZiQt3OmndCt4WRN1UgGSeqs6gbXzOQm5VTRS9tSeEgfUO1A6IIsfWV1Tp0ElPzYGjyp5pHbzm3DsRgpBgr1D0dkDj7MU8eNLEDAu2szwaDx4SEUrJma3h+uMOp8sp4m7zv8UMuAYjoOACV7gqD55lzd2cecGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbVyCGcC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbVyCGcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677C71F000E9;
	Fri, 12 Jun 2026 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301361;
	bh=imiJY4k/O2bQhYeBAhwTv3tNp31/BvBVvyxL/DQpKiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TbVyCGcCz8ve7Hqa+klQaY6zfARucpimGBbU8bbfqznG6Ys7R6Xi4R1kAmHgT8m/o
	 scvg4aAHUMQ83qVUJONR4ztnjhAKKJs/piG2YXe807GZHHsWZlMzObTZuRRcq78vOy
	 8qHem283s5dGD/B9aZMbrtA09NpQJK0DnURAPYTw2j6f7Z1/lljBr0KwCo9+MELCav
	 syzjh883+4fGC71cZ9NScGeuTyKWncgrmu36VcDOTbNwvrXL3kJGXBPT3UEryFnKxb
	 iqAtBr6RJpwFNsBboQWcQCDW9xXHE+4xxGTXtbn/ZUllytxDrcmLgGA52kD+PxzBph
	 baiwkh5lIJUEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v5 2/4] net: ethernet: oa_tc6: mdiobus->parent
 initialized with NULL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-level-trigger-v5-2-4533a9e85ce2@onsemi.com>
References: <20260611-level-trigger-v5-2-4533a9e85ce2@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 21:56:00 +0000
Message-Id: <20260612215601.677C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check before `skb_put()` can lead to kernel panic v=
ia `skb_over_panic()` if an oversized frame is received or infinite chunks =
are streamed.
- [High] Race condition caused by ad-hoc synchronization flag and lockless =
SKB access leads to leaked TX socket buffers.
- [High] MDIO read failures are incorrectly treated as successful reads of =
value 1.
- [High] Unexpected RX chunk from MAC-PHY causes immediate NULL pointer der=
eference via `skb_put`.
- [High] A transient `-ENOMEM` from SKB allocation causes the network devic=
e to permanently disable itself.
- [High] Memory leak of `tc6->rx_skb` when receiving multiple RX start chun=
ks without an end chunk.
--

commit 965184b0f5c3d3772f6dd68237d5d4a9d23389f0
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: mdiobus->parent initialized with NULL

As dev pointer in oa_tc6 structure is never initialized, mbiobus->parent
was initialized with NULL. This change fixes it by initializing it with
device pointer of spi.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index f3ac2875adfb7..477ceefde2c54 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -110,7 +110,6 @@
> =20
>  /* Internal structure for MAC-PHY drivers */
>  struct oa_tc6 {
> -	struct device *dev;
>  	struct net_device *netdev;
>  	struct phy_device *phydev;
>  	struct mii_bus *mdiobus;
[ ... ]

While reviewing this patch, I noticed a few pre-existing issues in this file
that might be worth addressing:

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for skb_put()
to exceed the allocated size here?

In oa_tc6_prcs_rx_chunk_payload(), when processing ongoing frames:

    oa_tc6_prcs_ongoing_rx_frame(tc6, data, footer);

This eventually calls into oa_tc6_update_rx_skb():

    memcpy(skb_put(tc6->rx_skb, length), payload, length);

If the MAC-PHY hardware sends continuous chunks without an end_valid flag or
sends a frame larger than expected, will this trigger an skb_over_panic()
since there is no bounds checking against the SKB's tailroom?


[Severity: High]
This is a pre-existing issue, but is there a race condition with
tc6->disable_traffic that could leak the waiting TX SKB?

In oa_tc6_start_xmit(), disable_traffic is read locklessly:

    if (tc6->disable_traffic || tc6->waiting_tx_skb) {
        netif_stop_queue(tc6->netdev);
        return NETDEV_TX_BUSY;
    }
    ...
    spin_lock_bh(&tc6->tx_skb_lock);
    tc6->waiting_tx_skb =3D skb;
    spin_unlock_bh(&tc6->tx_skb_lock);

Concurrently, if an error calls oa_tc6_disable_traffic(), it sets
disable_traffic =3D true and calls oa_tc6_cleanup_waiting_tx_skb() without
holding tx_skb_lock:

    if (tc6->waiting_tx_skb) {
        tc6->netdev->stats.tx_dropped++;
        kfree_skb(tc6->waiting_tx_skb);
        tc6->waiting_tx_skb =3D NULL;
    }

Could the cleanup path observe waiting_tx_skb as NULL before the assignment
in start_xmit() completes? If so, start_xmit() would then assign the SKB,
but since traffic is disabled and the queue stopped, the SKB would never
be transmitted or cleaned up.


[Severity: High]
This isn't a bug introduced by this patch, but does oa_tc6_mdiobus_read()
mask read failures?

In oa_tc6_mdiobus_read():

    bool ret;

    ret =3D oa_tc6_read_register(tc6, OA_TC6_PHY_STD_REG_ADDR_BASE |
                       (regnum & OA_TC6_PHY_STD_REG_ADDR_MASK),
                       &regval);
    if (ret)
        return ret;

Since ret is declared as a bool, if oa_tc6_read_register() returns a
negative error code like -ENODEV, it evaluates to true (1). Will this cause
the MDIO layer to misinterpret a failed register read as a successful read
returning the value 1?


[Severity: High]
This is a pre-existing issue, but what happens if a chunk arrives without
start_valid set when rx_skb is NULL?

In oa_tc6_prcs_rx_chunk_payload(), if a chunk bypasses the start_valid
allocation:

    /* Process the chunk with ongoing rx frame data */
    oa_tc6_prcs_ongoing_rx_frame(tc6, data, footer);

This directly invokes oa_tc6_update_rx_skb():

    memcpy(skb_put(tc6->rx_skb, length), payload, length);

If tc6->rx_skb is NULL because it was never initialized by a start_valid=3D1
chunk, will this cause an immediate NULL pointer dereference?


[Severity: High]
This isn't a bug introduced by this patch, but is it intended for a
transient memory allocation failure to permanently disable the device?

In oa_tc6_try_spi_transfer(), if oa_tc6_process_spi_data_rx_buf() returns
-ENOMEM from an SKB allocation failure:

    ret =3D oa_tc6_process_spi_data_rx_buf(tc6, spi_len);
    if (ret) {
        if (ret =3D=3D -EAGAIN)
            continue;
        oa_tc6_cleanup_ongoing_tx_skb(tc6);
        oa_tc6_cleanup_ongoing_rx_skb(tc6);
        netdev_err(tc6->netdev, "Device error: %d\n", ret);
        return ret;
    }

The error bubbles up to oa_tc6_macphy_threaded_irq():

    ret =3D oa_tc6_try_spi_transfer(tc6);
    if (ret) {
        disable_irq_nosync(tc6->spi->irq);
        oa_tc6_disable_traffic(tc6);
        break;
    }

Does this mean an -ENOMEM error permanently shuts down the MAC-PHY
interrupt and data processing, completely breaking the network interface
until the module is reloaded?


[Severity: High]
This is a pre-existing issue, but does this code leak the rx_skb if
consecutive start_valid chunks arrive?

In oa_tc6_prcs_rx_chunk_payload():

    /* Process the chunk with only rx frame start */
    if (start_valid && !end_valid) {
        size =3D OA_TC6_CHUNK_PAYLOAD_SIZE - start_byte_offset;
        return oa_tc6_prcs_rx_frame_start(tc6, &data[start_byte_offset],
                                          size);
    }

This function calls oa_tc6_allocate_rx_skb():

    ret =3D oa_tc6_allocate_rx_skb(tc6);
    if (ret)
        return ret;

If the driver is already processing a frame and tc6->rx_skb is already
populated, won't receiving another start_valid=3D1 without an intervening
end_valid=3D1 overwrite the tc6->rx_skb pointer with a new allocation and
leak the previous one?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-level-trig=
ger-v5-0-4533a9e85ce2@onsemi.com?part=3D2
