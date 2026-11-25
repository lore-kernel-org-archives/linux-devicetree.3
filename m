Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644637;
	b=YjBi7dCYgPfSNyFYp8RZ9MP1HJ772TbolHkVOivs7PrTNjokMiaUxUgZPTY7HsUAZnHS
	 FW+MHJedg/eMT2dhhuaaK35mdiLaDroZYAej8bxNu5r9GukByAVh6gKlxX85s5XfSUjKd
	 gx7H14jget1LQttyNbOxa1LPLREX4wUPmyq62bpbrpyiEPvCvLeW5EqQcV2nNHK28V7pZ
	 MYDX/oiNB1t4WsRX7nN/O2d7xnZlFE+m2LHhEDWZmDzbamZiPu067jiz5I+6Whs5/pKTK
	 AOmdxP8D3x0ZXZpWzQFE/Mxy+Q/Und6ThkyM6bdfycOSVwvUETleQkU9U9Rw7nDeztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644637;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iBNb9+0I716M3d6AdJlmzqJPBMjgCZ+sCVMfiwm1LR8=;
	b=cdh8bSzZKs1XbYCnuXoKNxrile4S2ZbZhD0GHhfJBVMXlDiyBmBS7MYK8COayQ3tNIwe
	 CWhIYBgBl8OrnV8iI6gusjM0j/UQ1kztyIbpI+/mvIFVIrh60PVyP4HrS7ldX0cu1vKLJ
	 mAvEr7gAZgGI6c28BQJdPxvFW5Ky1DKTN6lrTuEM02T5jZVgzmCX+RdbKV+u6penKrNAv
	 38pSNZRz/cmHONqIaY7WUTxZvKzqI9w0LJjv16456YanQIcj4aAuGGx6F8/nQ2Dizv3+5
	 nkS8RPjZXLBtm86RiYVWv05RlRQtPfHwShkd3ojNsypu+pV5MMd9CI2nZm7KGhx1s+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jzVtUB/g";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C591C606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzVtUB/g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA981F000C4;
	Wed, 25 Nov 2026 22:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795644637;
	bh=iBNb9+0I716M3d6AdJlmzqJPBMjgCZ+sCVMfiwm1LR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jzVtUB/gTZeu75hdRTcO+H0CT7Dl+4XONCxTG3Q5nI3cOkxXCNYDLDc7JD+8k+DcR
	 j6pJMk85Nv5rofLFZtwXrfnc4cLUAqmTu+bo34wke7eF13Eb7eoHdYkTnA+d2LeU3i
	 XGHeA/LamIgU3qxc8DsQ/SN5MgHkfGe8YiJs12KmuCm5UJQW5xx6VS1lyy+jbtr1p4
	 2QikRQEaR6tWqUFZVlcrWzfk3/mKY3TGWwMQKHh5QBICd3xF+0OSJqgWaaogPlD4mf
	 zyeTe7pedngBDKwgcRg6CkWu8YIWrwFzhUQWFVzrwYZNiv9IeGlvgS9CZuEGgO61lP
	 1VIgztNnhkzWQ==
Message-ID: <sashiko-outbox-234227@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 07/15] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-s2500-mac-phy-support-v12-7-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
 <20261124-s2500-mac-phy-support-v12-7-3575855d99f9@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 22:10:36 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] net: oa_tc6: waiting_tx_skb queued for TX timestamp after
  NETDEV_DOWN
- [Medium] net: oa_tc6: unacknowledged TTSC bits wedge TX timestamping
  and config
- [Medium] net: oa_tc6: unrestored INT_MASK0 on error in
  oa_tc6_set_hwtstamp_settings()
--

commit f233edafb90d63378a53bf6ad12696e270fe67d4
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for hardware timestamp

This commit adds hardware TX and RX timestamping support, PTP clock
registration helpers, and ethtool timestamp callbacks to the OA TC6
MAC-PHY framework.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethe=
rnet/oa_tc6/oa_tc6_main.c
> index 341d13c97f91f..22aaecd814ecd 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> @@ -49,6 +62,236 @@ static int oa_tc6_get_parity(u32 p)

[ ... ]

> +/* Pause new timestamp requests while an off request is pending. */
> +static void oa_tc6_req_tx_hwtstamp(struct oa_tc6 *tc6, struct sk_buff *s=
kb)
> +{
> +	u8 tsc;
> +
> +	lockdep_assert_held(&tc6->tx_skb_lock);
> +
> +	if (!skb || !(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
> +		return;
> +
> +	if (tc6->ts_cfg.tx_type !=3D HWTSTAMP_TX_ON ||
> +	    (tc6->ts_cfg_req &&
> +	     tc6->ts_cfg_new.tx_type !=3D HWTSTAMP_TX_ON))
> +		return;
> +
> +	tsc =3D tc6->ttsc_current_id;
> +	if ((tc6->ttsc_pending | tc6->ttsc_held) &
> +	    BIT(tsc - OA_TC6_TTSCA_REG_ID)) {
> +		tc6->tx_hwtstamp_err++;
> +		return;
> +	}
> +
> +	tc6->ttsc_pending |=3D BIT(tsc - OA_TC6_TTSCA_REG_ID);
> +	tc6->ttsc_current_id =3D oa_tc6_next_tsc(tsc);
> +	oa_tc6_tsinfo_tx(skb)->tsc =3D tsc;
> +	skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> +}

[ ... ]

> +static void oa_tc6_cleanup_tx_tstamp_skbs(struct oa_tc6 *tc6, bool hold)
> +{
> +	struct sk_buff *skb, *tmp;
> +
> +	spin_lock_bh(&tc6->tx_skb_lock);
> +	list_for_each_entry_safe(skb, tmp, &tc6->ttsc_skb_list, list) {
> +		list_del(&skb->list);
> +		dev_kfree_skb(skb);
> +
> +		/* The frame was transmitted, only its timestamp is lost. */
> +		tc6->tx_hwtstamp_lost++;
> +	}
> +
> +	/* A frame still being sent can also produce a capture after close. */
> +	if (hold)
> +		tc6->ttsc_held |=3D tc6->ttsc_pending;
> +	tc6->ttsc_pending =3D 0;
> +	spin_unlock_bh(&tc6->tx_skb_lock);
> +}
> +
> +/* Release timestamp skbs on down, but keep their capture registers
> + * unavailable until the corresponding TTSC events are acknowledged.
> + */
> +static int oa_tc6_netdev_event(struct notifier_block *nb, unsigned long =
event,
> +			       void *ptr)
> +{
> +	struct oa_tc6 *tc6 =3D container_of(nb, struct oa_tc6, netdev_nb);
> +
> +	if (event =3D=3D NETDEV_DOWN &&
> +	    netdev_notifier_info_to_dev(ptr) =3D=3D tc6->netdev)
> +		oa_tc6_cleanup_tx_tstamp_skbs(tc6, true);
> +
> +	return NOTIFY_DONE;
> +}

[Severity: Medium]
Can an unacknowledged capture bit in tc6->ttsc_pending or tc6->ttsc_held
permanently wedge TX timestamping and block disabling HWTSTAMP_TX_ON?

The MAC-PHY only sets OA_TC6_STATUS0_TTSCAx when a frame is transmitted on
the wire.  When an interface goes down, ndo_stop() stops the PHY and
disables MAC TX before NETDEV_DOWN runs oa_tc6_cleanup_tx_tstamp_skbs(),
which moves tc6->ttsc_pending into tc6->ttsc_held.  If a frame already
transferred to the MAC-PHY buffer was not yet transmitted on the wire (or
if a multi-chunk ongoing_tx_skb is later dropped by
oa_tc6_cleanup_ongoing_tx_skb(), which only clears tc6->ttsc_pending), the
TTSC interrupt never arrives and that bit remains set in tc6->ttsc_held.

Once any bit in tc6->ttsc_pending or tc6->ttsc_held is stuck,
oa_tc6_req_tx_hwtstamp() returns early when tc6->ttsc_current_id reaches
that register without advancing tc6->ttsc_current_id to the other capture
registers, so all subsequent TX timestamp requests fail.  At the same time,
oa_tc6_hwtstamp_req_process() waits for !(tc6->ttsc_pending |
tc6->ttsc_held) before turning TX timestamping off, causing every later
HWTSTAMP_TX_OFF request in oa_tc6_hwtstamp_set() to fail with -ETIMEDOUT.

[ ... ]

> @@ -1102,6 +1397,7 @@ static u16 oa_tc6_prepare_spi_tx_buf_for_tx_skbs(st=
ruct oa_tc6 *tc6)
>  			spin_lock_bh(&tc6->tx_skb_lock);
>  			tc6->ongoing_tx_skb =3D tc6->waiting_tx_skb;
>  			tc6->waiting_tx_skb =3D NULL;
> +			oa_tc6_req_tx_hwtstamp(tc6, tc6->ongoing_tx_skb);
>  			spin_unlock_bh(&tc6->tx_skb_lock);
>  		}
>  		if (!tc6->ongoing_tx_skb)

[Severity: Medium]
Can a packet sitting in tc6->waiting_tx_skb when the interface goes down be
queued onto tc6->ttsc_skb_list after NETDEV_DOWN cleanup has already run?

CPU0                                  CPU1 (threaded IRQ)
oa_tc6_start_xmit()
  tc6->waiting_tx_skb =3D skb
__dev_close_many()
  clear __LINK_STATE_START
  ndo_stop()
NETDEV_DOWN
  oa_tc6_netdev_event()
    oa_tc6_cleanup_tx_tstamp_skbs()
                                      oa_tc6_prepare_spi_tx_buf_for_tx_skbs=
()
                                        tc6->ongoing_tx_skb =3D tc6->waitin=
g_tx_skb
                                        oa_tc6_req_tx_hwtstamp()
                                          sets ttsc_pending, SKBTX_IN_PROGR=
ESS
                                      oa_tc6_add_tx_skb_to_spi_buf()
                                        oa_tc6_queue_tx_tstamp_skb()
                                          list_add_tail(..., &tc6->ttsc_skb=
_list)
                                          <-- queued after NETDEV_DOWN clea=
nup

Because oa_tc6_req_tx_hwtstamp() does not check netif_running(tc6->netdev)
and NETDEV_DOWN does not drop or flush tc6->waiting_tx_skb, the skb (and
its socket reference held via SKBTX_IN_PROGRESS) stays stranded on
tc6->ttsc_skb_list while the interface is down, and its new
tc6->ttsc_pending bit blocks HWTSTAMP_TX_OFF in
oa_tc6_hwtstamp_req_process().

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c b/drivers/net/et=
hernet/oa_tc6/oa_tc6_tstamp.c
> new file mode 100644
> index 0000000000000..aaffa18c4128e
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c
> @@ -0,0 +1,304 @@

[ ... ]

> +	ret =3D oa_tc6_write_register(tc6, OA_TC6_REG_INT_MASK0, irqm);
> +	if (ret) {
> +		dev_err(&tc6->spi->dev, "failed to write IRQM register\n");
> +		return ret;
> +	}
> +
> +	ret =3D oa_tc6_write_register(tc6, OA_TC6_REG_CONFIG0, cfg0);
> +	if (ret) {
> +		dev_err(&tc6->spi->dev, "failed to write CFG0 register\n");
> +		return ret;
> +	}
> +	spin_lock_bh(&tc6->tx_skb_lock);
> +	tc6->ts_cfg =3D *ts_cfg;
> +	spin_unlock_bh(&tc6->tx_skb_lock);
> +
> +	return 0;
> +}

[Severity: Medium]
If writing OA_TC6_REG_CONFIG0 fails after OA_TC6_REG_INT_MASK0 has been
updated, does this leave OA_TC6_INT_MASK0_TTSCA_MASK out of sync with
tc6->ts_cfg?

When disabling HWTSTAMP_TX_ON, a failure on the OA_TC6_REG_CONFIG0 write
leaves TTSC interrupts masked in OA_TC6_REG_INT_MASK0 while
tc6->ts_cfg.tx_type remains HWTSTAMP_TX_ON.  oa_tc6_req_tx_hwtstamp() will
continue queueing TX skbs for timestamps that never interrupt, and a retry
of oa_tc6_hwtstamp_set() with HWTSTAMP_TX_ON cannot unmask the interrupts
because oa_tc6_hwtstamp_post() sees that the requested config already
matches tc6->ts_cfg and returns 0 early.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-s2500-mac-=
phy-support-v12-0-3575855d99f9@onsemi.com?part=3D7
