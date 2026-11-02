Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628187;
	b=a++vbwlPydqx1pLu3T+n8lw83qK6JRowLpQBNBT/KAeebsnA6RbRLHn7OcrIXUdL3TdN
	 GW3xlrbBPMvBxWZcESdvcyR2pgzkvjnq8UYn2NitiQ+kEg796oRcjnaq7epN5TfkF0M9A
	 x3gSB24txMr2SukLHDPCE6b5g3pLAN97QLfO77Ukfj61T7ptDjdWacKIwlBhFmPU95+qN
	 k3akSHyveUwvbbXuDZ2Iu9e7qSxMsK6Knp4y7BuWe7/rVGFMm9jFWXnS1R4BhdLF0LxrI
	 LLkzYkbtTVCpoiZKAN+WQFqnW6sfjI7TrXJCMsZ6MQp5Lyz6i5z3EZc9wQefZeNWchA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628187;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Nn/a2LUD35DL0hr7trdqXhTvsge2HkMDMaZy4qOwQBA=;
	b=yR5wLv31afz60XaTUY7FYK1JKpsDOB84dc4A5T2jJ5vfgsMbBBlEAgOcJKsJqe2s2kkh
	 78D4Vk/rhZhhN6678VJ5Ur9X8giidNBRmThtkIQb774SNDS7wRCDznSgNdgZiGhCYOLM0
	 TfdWsHPTDgnLWteEsRtCuuihhZUWpipPuB5bsqUiSalNJDAhvpVqdcCStiSYMfChfyyUp
	 Jp3WxR80WnTEe5u1msIOutFmGtDCf0YDFSDS4lZkaOcbwQPVHItRUc6qQ/YMtci8aWfFk
	 1IVRJtynkaYV5W0yblXmDT0bnX0NI5n1DpX3/yS+XCef9BX90vkOqEkgkDqdGS44lTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YbCJBwAy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4205606A331
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YbCJBwAy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F4C1F00A16;
	Mon,  2 Nov 2026 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628186;
	bh=Nn/a2LUD35DL0hr7trdqXhTvsge2HkMDMaZy4qOwQBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YbCJBwAy9CS0zUCw3hpcQYcyemSl+z9a/MVfXkXN0PpHpOhou/Y+GHrCLY7pNvT63
	 gLHAF18Ay+8zG0CS5W4ByWHgtR24kpt9buyn2s4or/XUBJ0X7++/3v+xIettsQhywT
	 UrI96nURcCQpy97kA9XckStD11ASfHDC8k9uEgy+jSaidFYxC47zGzh6kuvZ3gIZ41
	 2SkPjH71/iaLAfyWbBRHIQDHImWqesEDCvuJIWEm9LlQC+0am+ND9gYSd5CbI4oLIt
	 sZ74ZmNKQ4Rlk66Weusc0CRadS9I+81f9yNxSHBN05f+hECwDiOdvZDpuaugGrzRvW
	 Kxx0kEth8eqvQ==
Message-ID: <sashiko-outbox-193520@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhila Kavi" <akavi@axiado.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
 <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:03:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: mctp: irot_ndo_stop() cancelling tx_work wedges link after la=
te TX ACK
- [High] net: mctp: unlocked netif_stop_queue() in irot_ndo_open() races wi=
th irot_tx_wake()
- [High] net: mctp: irot_rx_work() ACKs IROT_RX_INVALID without updating la=
st_rx_counter
- [Medium] net: mctp: axiado: premature retry exhaustion in irot_discover_b=
uffers()
--

commit c82310d54b9aff23038939986150dc23c6fe72a1
Author: Akhila Kavi <akavi@axiado.com>

net: mctp: Add Axiado AX3005 IRoT MCTP transport driver

This commit adds an MCTP transport driver for the IRoT co-processor on
Axiado AX3005 SoCs, carrying packets through shared-memory windows
negotiated and signaled over a mailbox interface.

> diff --git a/drivers/net/mctp/axiado-mctp-irot.c b/drivers/net/mctp/axiad=
o-mctp-irot.c
> new file mode 100644
> index 0000000000000..d393a8102f2db
> --- /dev/null
> +++ b/drivers/net/mctp/axiado-mctp-irot.c
> @@ -0,0 +1,1089 @@
[ ... ]
> +/* cc_mctp_buffer: the peer's windows. Write-once; zero mtu means no ans=
wer. */
> +static void irot_cb_buffer_rsp(struct irot_priv *p, const struct irot_ms=
g *m)
> +{
> +	u32 mtu =3D le32_to_cpu(m->data.buffers.mtu_limit);
> +
> +	scoped_guard(spinlock_irqsave, &p->rx_lock) {
> +		if (!p->buffers_valid && mtu) {
> +			irot_region_from_span(&p->host_write,
> +					      &m->data.buffers.host_write);
> +			irot_region_from_span(&p->host_read,
> +					      &m->data.buffers.host_read);
> +			p->mtu =3D mtu;
> +			p->buffers_valid =3D true;
> +		}
> +	}
> +
> +	complete(&p->buffers_done);
> +}

[Severity: Medium]
Should irot_cb_buffer_rsp() only call complete(&p->buffers_done) when mtu
is non-zero?

When the peer replies with IROT_CC_MCTP_BUFFER containing mtu_limit =3D=3D =
0,
p->buffers_valid remains false, but complete(&p->buffers_done) still wakes
wait_for_completion_timeout() in irot_discover_buffers() immediately:

	for (i =3D 0; i < IROT_BUFFER_RETRIES && !got; i++) {
		reinit_completion(&p->buffers_done);

		rc =3D irot_send(p, &req);
		...
		wait_for_completion_timeout(&p->buffers_done,
					    secs_to_jiffies(IROT_BUFFER_TIMEOUT_S));

		scoped_guard(spinlock_irqsave, &p->rx_lock)
			got =3D p->buffers_valid;
	}

Wouldn't this cause irot_discover_buffers() to spin through all
IROT_BUFFER_RETRIES attempts back-to-back without waiting for the intended
timeout window before failing probe with -ETIMEDOUT?

[ ... ]
> +static void irot_rx_work(struct work_struct *work)
> +{
[ ... ]
> +	if (do_rx) {
> +		res =3D irot_rx_deliver(p, &e, &dropped);
> +
> +		scoped_guard(spinlock_irqsave, &p->rx_lock) {
> +			p->rx_busy =3D false;
> +			if (res =3D=3D IROT_RX_DELIVERED) {
> +				p->last_rx_counter =3D e.counter;
> +				p->has_last_rx_counter =3D true;
> +			}
> +		}
> +	}
> +
> +	local_bh_disable();
> +	if (dropped)
> +		dev_dstats_rx_dropped_add(p->ndev, dropped);
> +	if (do_rx && res =3D=3D IROT_RX_DELIVERED)
> +		dev_dstats_rx_add(p->ndev, e.size);
> +	local_bh_enable();
> +
> +	/* Withhold the ACK and the peer resends */
> +	if (do_rx && res !=3D IROT_RX_RETRY)
> +		irot_send_done(p, e.counter);
> +}

[Severity: High]
When irot_rx_deliver() returns IROT_RX_INVALID (for example, when a packet
arrives while !netif_running(p->ndev)), irot_rx_work() still sends
IROT_CC_MCTP_DONE via irot_send_done(p, e.counter), which releases the
host_read window back to the IRoT.

However, p->rx_busy is cleared before irot_send_done() is called, and
p->last_rx_counter is only updated when res =3D=3D IROT_RX_DELIVERED.

If the IRoT resends the same counter before receiving that ACK (or while
irot_send_done() is waiting on tx_chan_lock), irot_cb_mctp() will see
p->rx_busy =3D=3D false and e.counter !=3D p->last_rx_counter:

	scoped_guard(spinlock_irqsave, &p->rx_lock) {
		if (p->has_last_rx_counter && e.counter =3D=3D p->last_rx_counter) {
			/* Resend of a delivered packet: our ACK was missed */
			p->dup_ack_counter =3D e.counter;
			p->dup_ack_pending =3D true;
			wake =3D true;
		} else if (p->rx_busy) {
			...
		} else {
			p->rx_entry =3D e;
			p->rx_busy =3D true;
			p->rx_new =3D true;
			wake =3D true;
		}
	}

Can this cause the resend to be queued as a new packet in p->rx_entry,
allowing irot_rx_work() to read from host_read concurrently with the IRoT
writing the next packet after receiving the first IROT_CC_MCTP_DONE?

[ ... ]
> +static int irot_ndo_open(struct net_device *ndev)
> +{
> +	struct irot_priv *p =3D netdev_priv(ndev);
> +
> +	/*
> +	 * A busy or stalled window keeps the queue stopped; tx_work wakes it
> +	 * once the ACK arrives, since netif_running() is already true here.
> +	 */
> +	if (irot_tx_ready(p))
> +		netif_start_queue(ndev);
> +	else
> +		netif_stop_queue(ndev);
> +
> +	return 0;
> +}

[Severity: High]
Can irot_ndo_open() race with irot_tx_wake() and leave the TX queue
permanently stopped?

In irot_ndo_open(), irot_tx_ready(p) checks !p->pending_write &&
!p->tx_stalled && !p->tx_skb under p->tx_state_lock, and then releases the
lock before calling netif_stop_queue(ndev).

If a packet was in flight from before the interface was closed and its
IROT_CC_MCTP_DONE arrives right after irot_tx_ready(p) returns false:

CPU0                                    CPU1
irot_ndo_open()
  irot_tx_ready(p) -> false
                                        irot_tx_mark_done()
                                          p->pending_write =3D false;
                                          queue_work(p->wq, &p->tx_work);
                                        irot_tx_work()
                                          irot_tx_wake()
                                            lock(&p->tx_state_lock)
                                            netif_wake_queue(p->ndev);
                                            unlock(&p->tx_state_lock)
  netif_stop_queue(ndev);

Since p->pending_write is now false and no further ACK will arrive,
wouldn't netif_stop_queue(ndev) leave the queue stopped forever?

> +
> +static int irot_ndo_stop(struct net_device *ndev)
> +{
> +	struct irot_priv *p =3D netdev_priv(ndev);
> +	struct sk_buff *skb;
> +
> +	netif_stop_queue(ndev);
> +
> +	/*
> +	 * Do not touch tx_timeout_work: a packet in flight still owns the
> +	 * window, and the stall and late-ACK handling must keep running.
> +	 */
> +	cancel_work_sync(&p->tx_work);

[Severity: High]
What happens if a stalled TX transfer receives its late IROT_CC_MCTP_DONE
just before irot_ndo_stop() runs cancel_work_sync(&p->tx_work)?

When a TX transfer times out, irot_tx_stall() sets p->tx_stalled =3D true a=
nd
calls netif_carrier_off(p->ndev). When the late ACK arrives in
irot_rx_callback(), irot_tx_mark_done() clears p->pending_write and queues
p->tx_work:

	scoped_guard(spinlock_irqsave, &p->tx_state_lock) {
		if (!p->pending_write || p->pending_tx_counter !=3D counter)
			return;

		p->pending_write =3D false;
	}

	cancel_delayed_work(&p->tx_timeout_work);
	queue_work(p->wq, &p->tx_work);

Clearing p->tx_stalled and calling netif_carrier_on(p->ndev) only happens
when p->tx_work runs irot_tx_wake():

	scoped_guard(spinlock_irqsave, &p->tx_state_lock) {
		if (p->pending_write || p->tx_skb)
			return;

		if (p->tx_stalled) {
			p->tx_stalled =3D false;
			recovered =3D true;
		}
		...
	}

	if (recovered) {
		dev_dbg(p->dev, "late TX ACK arrived, link up\n");
		netif_carrier_on(p->ndev);
	}

If irot_ndo_stop() cancels p->tx_work after irot_tx_mark_done() has already
set p->pending_write =3D false, irot_tx_wake() never runs. Does this leave
p->tx_stalled =3D=3D true and the carrier off permanently, causing subseque=
nt
irot_ndo_open() calls to see irot_tx_ready(p) =3D=3D false and keep the TX
queue stopped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-mctp-trans=
port-irot-ax3005-v1-0-36ceb822f01e@axiado.com?part=3D2
