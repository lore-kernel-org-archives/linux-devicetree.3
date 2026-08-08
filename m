Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328D375F9E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186018; cv=none; b=Lw9Sb3TcvfkOMMMX7XGdpwaC3JQrgh/JitBBCQLZwEIhdpDnK9RcD3Wy4CMhc1JmSLpb2zehaLLZojYhcMNgM01NUTGm0dDLBAOwNVzoXajBWAwuk4fYMrH0LcqLUclAMFCijomo5U8FLkac2WocITnd1O7gjr4uXD3074G/OGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186018; c=relaxed/simple;
	bh=4FZsP2gCtDeE6SxSTlFcF9DeoiKYkmbUx91rVVWLX24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SfZ2dugopzXOqsUfvFwNG+PPqjgZmc3juai+Q8g6D4uJL95xmAZ7owTmmxOyZaRhr6b6xRh/CGNMgfHgshBE+ultlIml6m9Li1/n1+yAX8hNT4NVuMel5DkBvINN+IUJ4tPV/JIiMK/iYYzfvVXbN5PLO/4nc7HMG1F54jhSb0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDmLyJtG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDmLyJtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DA21F000E9;
	Sat,  8 Aug 2026 10:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186017;
	bh=Rlgsn8bLhi6TBQtReJZXE6BMftLx1TeFBdwwuPZYD/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jDmLyJtGQ4gF9F9HNwR+vOkZLZLv6hgGAEuR7p34L1UKX00G/esIYCeyH9A16Vy5m
	 mgdvsScPBAdyZ1rS+9Dx+3fGNOrEPrQoGC06QagBgX6tl4FBgJtSJvyLRkkVwr6Jv0
	 n6CowGc52d9HtRRz2bA2zACmCLptYpUFyZ3t9uYuTBQjaecw/oFzz6/spIO0xA5vbn
	 10LDFudw4AOk53Eq4IjTSzBGNkedQ/dD54D3HKMSz4U+P21Rui/hxSrqe4KgXon3si
	 +Sp0HKMguWC/2FIEL7G5qr+hUxHmapdgGYLG4e01tjNJWwNUXgAeEOdnhpePpMo4Xi
	 ZRKn3KFmM45kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/20] net: dsa: xilinx: drive per-MAC PTP TX/RX
 hardware paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807104431.157230-17-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-17-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:56 +0000
Message-Id: <20260808104657.31DA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The PTP TX timestamp completion logic incorrectly handles sequence=
 number wrap-around, leading to permanent queue stalls and garbage timestam=
ps.
- [High] Calling `dev_sw_netstats_rx_add()` from a hard IRQ context causes =
data corruption and deadlocks in per-CPU NAPI statistics.
- [High] The PTP TX path blindly copies `skb->len` bytes from `skb->data`, =
causing an out-of-bounds read if the SKB is non-linear.
- [High] The RX ring buffer loop incorrectly pre-increments the software po=
inter, permanently desynchronizing the ring and reading uninitialized memor=
y.
- [High] The DSA tagger transmit hook inspects the Ethernet header protocol=
 without verifying the SKB is linearized, risking an out-of-bounds read.
- [Medium] The RX path trusts the unverified `msg_len` field from the PTP p=
ayload to set the SKB length, leaking uninitialized hardware buffer content=
s.
--

--- Patch [16]: [PATCH 16/20] net: dsa: xilinx: drive per-MAC PTP TX/RX har=
dware paths ---
commit f6ee6a9f391562b507051af49ebe647c6ed27583
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
Subject: net: dsa: xilinx: drive per-MAC PTP TX/RX hardware paths

This commit adds PTP TX/RX hardware path support for the AMD/Xilinx TSN
Endpoint Ethernet MAC switch. It implements direct per-MAC PTP packet
transmission and reception, bypassing the switch fabric via a custom
tagger handoff.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn_ptp.c b/drivers/net/dsa/xi=
linx/xilinx_tsn_ptp.c
> index 75c177f752f1b..740d92e3e80dd 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn_ptp.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn_ptp.c
[ ... ]
> +void xlnx_tsn_ptp_tx(struct dsa_port *dp, struct sk_buff *skb)
> +{
[ ... ]
> +		mac_iow(m, TSN_PTP_TX_BUFFER_OFFSET(free_index), cmd1);
> +		mac_iow(m, TSN_PTP_TX_BUFFER_OFFSET(free_index) +
> +			TSN_PTP_TX_BUFFER_CMD2_FIELD, cmd2);
> +		memcpy_toio_32(m,
> +			       TSN_PTP_TX_BUFFER_OFFSET(free_index) +
> +			       TSN_PTP_TX_CMD_FIELD_LEN,
> +			       skb->data, skb->len);

[Severity: High]
Does this code handle non-linear socket buffers correctly?

The driver copies the buffer length directly from the data pointer. If a
buffer is non-linear, for example when injected via packet sockets or BPF,
the data pointer only holds a portion of contiguous bytes. Reading the full
length could cause an out-of-bounds read and a kernel panic.

> +
> +		skb->cb[0] =3D free_index;
> +		__skb_queue_tail(&m->ptp_txq, skb);
[ ... ]
> +static void xlnx_tsn_ptp_recv(struct xlnx_tsn *sw, int port)
> +{
> +	struct net_device *user =3D dsa_to_port(&sw->ds, port)->user;
> +	struct xlnx_tsn_mac *m =3D &sw->mac[port];
> +	unsigned long frame_base;
> +	struct sk_buff *skb;
> +	u16 msg_len;
> +	u8 msg_type;
> +
> +	if (!user || !netif_running(user))
> +		return;
> +
> +	while ((m->ptp_rx_hw_pointer & 0xf) !=3D (m->ptp_rx_sw_pointer & 0xf)) {
> +		m->ptp_rx_sw_pointer++;
> +
> +		frame_base =3D TSN_PTP_RX_BASE_OFFSET +
> +			     (m->ptp_rx_sw_pointer & 0xf) *
> +			     TSN_PTP_RX_HWBUF_SIZE;

[Severity: High]
Does this pre-increment logic synchronize the software and hardware pointers
correctly?

If the hardware pointer is 1 and the software pointer was initialized to 15,
the loop condition (1 !=3D 15) evaluates to true. The software pointer
increments to 0, reading slot 0. However, the loop will run again because
the condition now evaluates to (1 !=3D 0), incrementing the pointer to 1 and
reading the empty slot 1. This guarantees the driver reads exactly one extra
uninitialized slot per packet and drops valid data.

> +
> +		skb =3D netdev_alloc_skb(user, TSN_PTP_RX_FRAME_SIZE);
> +		if (!skb) {
> +			DEV_STATS_INC(user, rx_dropped);
> +			continue;
> +		}
> +
> +		memcpy_fromio_32(m, frame_base, skb->data,
> +				 TSN_PTP_RX_FRAME_SIZE);
> +
> +		msg_type =3D *(u8 *)(skb->data + ETH_HLEN) & 0xf;
> +		msg_len =3D get_unaligned_be16(skb->data + ETH_HLEN + 2);
> +
> +		if (msg_len + ETH_HLEN > TSN_PTP_RX_FRAME_SIZE) {
> +			dev_kfree_skb_any(skb);
> +			DEV_STATS_INC(user, rx_length_errors);
> +			continue;
> +		}
> +
> +		skb_put(skb, msg_len + ETH_HLEN);

[Severity: Medium]
Can a malformed packet leak uninitialized hardware buffer contents here?

The driver copies 252 bytes from the hardware buffer into the buffer, and
then trusts the unverified payload length field from the PTP header to set
the buffer length. If a packet specifies a length larger than the actual
received data, this could pad the buffer with leftover trailing bytes from
the hardware buffer and leak them to userspace.

> +		skb->protocol =3D eth_type_trans(skb, user);
> +		skb->ip_summed =3D CHECKSUM_UNNECESSARY;
> +
> +		if (READ_ONCE(m->hwtstamp_rx_filter) !=3D HWTSTAMP_FILTER_NONE &&
> +		    !(msg_type & TSN_PTP_MSG_TYPE_MASK))
> +			xlnx_tsn_read_tstamp(m, skb_hwtstamps(skb),
> +					     frame_base +
> +					     TSN_PTP_HW_TSTAMP_OFFSET);
> +
> +		dev_sw_netstats_rx_add(user, skb->len);

[Severity: High]
Is it safe to call dev_sw_netstats_rx_add from a hard IRQ context?

This helper protects 32-bit seqcounts using a mechanism that disables
preemption but not hard interrupts. Since normal data plane traffic updates
these same per-CPU statistics in softirq context via NAPI, this hard IRQ
can interrupt the softirq mid-update. Could this corrupt the seqcount and
cause deadlocks or torn reads?

> +		netif_rx(skb);
> +	}
> +}
[ ... ]
> +static void xlnx_tsn_tx_tstamp_work(struct work_struct *work)
> +{
> +	struct xlnx_tsn_mac *m =3D container_of(work, struct xlnx_tsn_mac,
> +					      tx_tstamp_work);
> +	struct skb_shared_hwtstamps hwtstamps;
> +	unsigned long ts_off;
> +	struct sk_buff *skb;
> +	u8 tx_packet, index;
> +
> +	guard(spinlock_irqsave)(&m->ptp_tx_lock);
> +
> +	tx_packet =3D FIELD_GET(TSN_PTP_TX_PACKET_FIELD_MASK,
> +			      mac_ior(m, TSN_PTP_TX_CONTROL_OFFSET));
> +
> +	while ((skb =3D __skb_dequeue(&m->ptp_txq)) !=3D NULL) {
> +		index =3D skb->cb[0];
> +
> +		/* HW writes ascending slot indices into the TX status field
> +		 * as frames depart. Any queued skb with index > tx_packet
> +		 * has not been timestamped yet, so requeue it and stop.
> +		 */
> +		if (index > tx_packet) {
> +			__skb_queue_head(&m->ptp_txq, skb);
> +			break;
> +		}

[Severity: High]
Does this index comparison handle sequence wrap-around correctly?

The hardware slot index is a 3-bit value. When the hardware pointer wraps
from 7 to 0, this check fails for new frames. For example, if a new frame
is assigned index 0 and the last departed frame was 7, 0 > 7 evaluates to
false, causing the workqueue to assume the frame has transmitted
prematurely. Will this lead to stalled queues and garbage timestamps?

> +
> +		ts_off =3D TSN_PTP_TX_BUFFER_OFFSET(index) +
> +			 TSN_PTP_HW_TSTAMP_OFFSET;
[ ... ]
> diff --git a/net/dsa/tag_xlnx_tsn.c b/net/dsa/tag_xlnx_tsn.c
> index de352aa3d9a8f..6f487ad7bcf96 100644
> --- a/net/dsa/tag_xlnx_tsn.c
> +++ b/net/dsa/tag_xlnx_tsn.c
[ ... ]
> +static struct sk_buff *xlnx_tsn_xmit(struct sk_buff *skb,
> +				     struct net_device *dev)
> +{
> -	return skb;
> +	struct xlnx_tsn_tagger_data *tagger_data;
> +	struct dsa_port *dp;
> +
> +	dp =3D dsa_user_to_port(dev);
> +	tagger_data =3D dp->ds->tagger_data;
> +
> +	if (!tagger_data || !tagger_data->ptp_tx)
> +		return skb;
> +
> +	if (eth_hdr(skb)->h_proto !=3D htons(ETH_P_1588) ||
> +	    skb_vlan_tag_present(skb))
> +		return skb;

[Severity: High]
Does this code verify the buffer is linearized before dereferencing the
Ethernet header?

The tagger transmit hook inspects the protocol header but does not verify
that the buffer contains at least enough contiguous bytes in the linear data
area. Dereferencing the Ethernet header on a short or fragmented packet
without a prior linearity check could cause an out-of-bounds memory read.

> +
> +	tagger_data->ptp_tx(dp, skb);
> +
> +	return NULL;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D16
