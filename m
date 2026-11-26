Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689410;
	b=jJ5i3SR1e9WMHnilWiMlIo9bnsPyf4smGSBro52tNiv4ltz5Gyl9wWfAebJDqiz58E0S
	 WS8XUybN0cWzNaegNo8w7PcTq11bm8KA72DpltohHwY02P9ECSNy5SlvpFQKM4VuKk7Ik
	 xIRDE/tVtgOMBn2U4KcEIeV/h0ViUylX32xpBMGXH59b/J8X/Rk/43rgIAYrEuKlsaYy4
	 mpQsUKvyn0IBS1y/UbQxbcuKYYMwBiCQ100G6J0fR4qCtBwX21YnBK69brP4wdja0f91t
	 CW4FgVzrA6FoYKf9DEUPbkeR59o+9gDBKheqgIO7C8S+TGbrOUg85M193k/k8MXwIxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689410;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KFh732M+jZzy5oX1MPaDaWiUvrfZpVppipnUN/wY7pk=;
	b=40/mdepKb6DW9mwG0e+ZaHYlnQSQNX2Uvuh1vdTw01ozo+5cTNndgjIGgMV/7huoVp3S
	 1gNE2HHyH0rwS38ifQYcw2GvR7qLwKYX4f2YgDxqETVnw39bm/AUO3m32Q7ckUY4cP4e+
	 N8cc5bpYq+N2D2pm8Uvm4AdRiHwAAZHVt1OTvDFsa/j9LSXbtB7OI+U2gNXyBi+NveY0I
	 mFJmIzpRSzWhOGDhuxNPr4b7jl90VuCKUZTIcK/z5bHB+l/e44NO8bVcZPC2SM/SB0lYe
	 JnQjrTtqod6vr4cACNkQ+y+Om99iFIS83ga7HzxfMh0dh2bc9qXObItmhfi5ZcWS7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uk4fpKuO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1845C606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uk4fpKuO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6391F000D0;
	Thu, 26 Nov 2026 10:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795689409;
	bh=KFh732M+jZzy5oX1MPaDaWiUvrfZpVppipnUN/wY7pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uk4fpKuOa1Nc7ZX1BM3TcKlsmrIC1jyFkHHsnXqeT7G4837clRanZtHFbNnsnNHWj
	 tLZ8b+lOvKZV0r4gdBPi+ojycnc+2N44Zf3wvuGFZ5DUFAQ9u+ss3p07qa7BX5VmXg
	 IWCnOky7AulAOttavl0GTIsnYlnHVifCcGh/i75hdPmEq+7IRHb0cbRzDxZkjAfdEM
	 qgqf6mKjQ6EqR2tBf6ESFRI4hkrFYV/HFZbDFM78K867jM10TD+T9vz0+mPWPVTZtz
	 yEM75dyB7AjbbkEeIGp5mECPqU9XyN4TpEY5mTEuj3AsGkTBnGNJzt80qNXdIjWLHG
	 fT1wc6+tNO5tw==
Message-ID: <sashiko-outbox-235301@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/3] net: cortina: Add CS7542 CPU network
 datapath
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-b4-cs7542-ethernet-v2-2-d0ea3c6eb375@gmail.com>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
 <20261125-b4-cs7542-ethernet-v2-2-d0ea3c6eb375@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:36:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] net: cortina: RX buffer leak in cs_ne_rx_poll() when FCS spans
  buffers
- [Medium] net: cortina: missing TX_DESC_OWN check in
  cs_ne_tx_complete()
- [Medium] net: cortina: RX stall in cs_ne_rx_poll() after XR_OWNERSHIP
  break
- [Medium] net: cortina: BM bypass bits cleared after init in
  cs752x_tm_bm_init()
- [Medium] net: cortina: shared MAC prefix registers clobbered in
  cs_ne_set_hw_addr()
--

commit 6a57a4063dd740b5d790fca88be11e9fe060a608
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: cortina: Add CS7542 CPU network datapath

This commit adds the Cortina CS7542 three-GMAC network engine driver with
phylink support, per-port NAPI RX, a shared TX ring, and FE, QM, TM, and
SCH initialization.

> diff --git a/drivers/net/ethernet/cortina/cs752x_ne.c b/drivers/net/ether=
net/cortina/cs752x_ne.c
> new file mode 100644
> index 0000000000000..081b4207928e4
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs752x_ne.c
[ ... ]
> +static int cs_ne_rx_poll(struct napi_struct *napi, int budget)
> +{
[ ... ]
> +	wr =3D ni_rd(ne, NI_CPUXRAM_CPU_STA_RX(port->id)) & NI_XRAM_PTR_MASK;
> +	rd =3D port->rd;
> +	while (rd !=3D wr && done < budget) {
> +		desc =3D ne->xram + rd * 8;
> +		w1 =3D readl(desc + 4);
> +		if (w1 & XR_OWNERSHIP) {
> +			ndev->stats.rx_fifo_errors++;
> +			break;
> +		}
> +		next =3D FIELD_GET(XR_NEXT_LINK, w1);
> +		if (next =3D=3D wr &&
> +		    (ni_rd(ne, NI_CPUXRAM_CPU_STA_RX(port->id)) & NI_XRAM_PTR_MASK) =
=3D=3D wr) {
> +			/*
> +			 * The next link reaches the unchanged hardware write pointer:
> +			 * this is the current tail packet. Retain the vendor's 16us
> +			 * DDR-arrival guard before reading its header and payload.
> +			 * NAPI softirq context cannot use a sleeping delay here.
> +			 */
> +			udelay(CS_NE_RX_TAIL_SETTLE_US);
> +		}
> +		hdre_hi =3D readl(desc + 8);
> +		hdre_lo =3D readl(desc + 12);
> +		rd =3D next;
> +		pkt_size =3D FIELD_GET(HDRE_PKT_SIZE, hdre_lo);
> +		off =3D CS_NE_BUF_HDR_OFF + 8 + 16 + 2;
> +		total =3D pkt_size > 20 ? pkt_size - 20 : 0;
> +		valid =3D total >=3D ETH_HLEN && total <=3D CS_NE_MAX_PKT_LEN;
> +		/* Drop policy must not hide trailing buffers in this descriptor. */
> +		nbufs =3D 1;
> +		if (total > CS_NE_BUF_DATA_MAX - (off & 0xff))
> +			nbufs +=3D DIV_ROUND_UP(total - (CS_NE_BUF_DATA_MAX - (off & 0xff)),
> +					      CS_NE_BUF_DATA_MAX);

[Severity: High]
Does computing nbufs from total (which subtracts the 4-byte FCS) rather
than total + ETH_FCS_LEN leak the trailing RX buffer when the FCS crosses
a buffer boundary?

The first buffer holds CS_NE_BUF_DATA_MAX - (off & 0xff) =3D 3558 bytes of
frame data, so when total is 3555..3558 bytes (or 7139..7142 bytes at the
next boundary), QM writes the trailing FCS bytes into an extra buffer that
cs_ne_rx_poll() never claims or recycles, leaving it stuck in CS_NE_RX_HW
until the port's RX pool is exhausted.

[ ... ]
> +	cs_ne_rx_kick(ne);
> +	ni_wr(ne, NI_CPUXRAM_CPU_CFG_RX(port->id), rd);
> +	port->rd =3D rd;
> +	if (done < budget && napi_complete_done(napi, done)) {
> +		spin_lock_irqsave(&ne->rx_lock, flags);
> +		if (READ_ONCE(port->opened) && !ne->rx_stopping)
> +			ni_wr(ne, NI_CPUXRAM_RXPKT_INTENABLE(port->id), 1);
> +		spin_unlock_irqrestore(&ne->rx_lock, flags);
> +	}
> +	return done;
> +}

[Severity: Medium]
Can breaking out of the loop when XR_OWNERSHIP is set and then calling
napi_complete_done() stall RX on this port?

cs_ne_rx_irq() already cleared NI_CPUXRAM_RXPKT_INTERRUPT(port->id) before
scheduling NAPI, and an already-queued XRAM descriptor does not generate a
new interrupt edge, so completing NAPI while rd !=3D wr leaves that
descriptor unread until another packet arrives.

[ ... ]
> +static void cs_ne_tx_complete(struct cs_ne *ne)
> +{
> +	struct cs_ne_txq *txq =3D &ne->txq;
> +	struct cs_ne_tx_buf *buf;
> +	u32 rptr;
> +	int i;
> +
> +	if (txq->fault)
> +		return;
> +	rptr =3D readl(ne->dma + DMA_LSO_TXQ_RPTR(0)) & DMA_PTR_MASK;
> +	/* Never consume unsubmitted descriptors or loop past the ring boundary=
. */
> +	if (rptr >=3D CS_NE_TX_DESC_NUM ||
> +	    ((rptr - txq->tail) & (CS_NE_TX_DESC_NUM - 1)) >
> +	    ((txq->head - txq->tail) & (CS_NE_TX_DESC_NUM - 1))) {
> +		txq->fault =3D true;
> +		cs_ne_tx_stop_all(ne);
> +		dev_err_ratelimited(ne->dev, "invalid TX completion pointer %#x\n", rp=
tr);
> +		return;
> +	}
> +	while (txq->tail !=3D rptr) {
> +		buf =3D &txq->bufs[txq->tail];
> +		if (buf->len) {
> +			if (buf->page)
> +				dma_unmap_page(ne->dev, buf->dma, buf->len,
> +					       DMA_TO_DEVICE);
> +			else
> +				dma_unmap_single(ne->dev, buf->dma, buf->len,
> +						 DMA_TO_DEVICE);
> +			buf->len =3D 0;
> +		}

[Severity: Medium]
Should cs_ne_tx_complete() verify that TX_DESC_OWN is clear in
txq->desc[txq->tail * 8] before unmapping buf->dma and consuming buf->skb?

The commit message notes that the driver never releases descriptors whose
hardware ownership remains set, and if DMA_LSO_TXQ_RPTR(0) advances when
the descriptor is fetched before completion writeback clears TX_DESC_OWN,
this loop will unmap an in-flight buffer.

[ ... ]
> +static void cs_ne_set_hw_addr(struct cs_ne_port *port)
> +{
> +	struct cs_ne *ne =3D port->ne;
> +	const u8 *a =3D port->ndev->dev_addr;
> +
> +	ni_wr(ne, NI_MAC_ADDR0, a[0] | (a[1] << 8) | (a[2] << 16) | (a[3] << 24=
));
> +	ni_rmw(ne, NI_MAC_ADDR1, 0xff, a[4]);
> +	ni_rmw(ne, NI_ETH_MAC_CONFIG2(port->id), 0xff, a[5]);
> +}

[Severity: Medium]
Does cs_ne_set_hw_addr() clobber the upper five MAC address bytes of the
other ports?

NI_MAC_ADDR0 and NI_MAC_ADDR1 are shared across all three GMACs while only
NI_ETH_MAC_CONFIG2(port->id) is per-port, so probing multiple ports with
different 5-byte prefixes (such as the eth_hw_addr_random() fallback in
cs_ne_probe_port()) or changing one port's address via
cs_ne_set_mac_address() silently overwrites the hardware MAC prefix of the
sibling ports.

> diff --git a/drivers/net/ethernet/cortina/cs752x_sch_tm.c b/drivers/net/e=
thernet/cortina/cs752x_sch_tm.c
> new file mode 100644
> index 0000000000000..da156349678d4
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs752x_sch_tm.c
[ ... ]
> +static int cs752x_tm_bm_init(struct device *dev, void __iomem *tm)
> +{
[ ... ]
> +	cfg =3D readl(tm + TM_BM_CONFIG_0);
> +	cfg &=3D ~(TM_BM_CONFIG_0_DISABLE |
> +		 TM_BM_CONFIG_0_RECALCULATE_GLOBAL_BUFFERS_USED |
> +		 TM_BM_CONFIG_0_BM2_BYPASS_CA_PROCESS |
> +		 TM_BM_CONFIG_0_BM2_BYPASS_DEST_PORT_PROCESS |
> +		 TM_BM_CONFIG_0_BM2_BYPASS_VOQ_PROCESS |
> +		 TM_BM_CONFIG_0_BM1_BYPASS_CA_PROCESS |
> +		 TM_BM_CONFIG_0_BM1_BYPASS_DEST_PORT_PROCESS |
> +		 TM_BM_CONFIG_0_BM1_BYPASS_VOQ_PROCESS |
> +		 TM_BM_CONFIG_0_ENQUE_HDR_ADJUST |
> +		 TM_BM_CONFIG_0_INIT);
> +
> +	writel(cfg | TM_BM_CONFIG_0_BM1_BYPASS_CA_PROCESS |
> +	       TM_BM_CONFIG_0_BM2_BYPASS_DEST_PORT_PROCESS |
> +	       TM_BM_CONFIG_0_BM2_BYPASS_VOQ_PROCESS |
> +	       TM_BM_CONFIG_0_INIT, tm + TM_BM_CONFIG_0);
> +	ret =3D cs752x_tm_wait_init_done(dev, tm, TM_BM_STATUS_0,
> +				       TM_BM_STATUS_0_INIT_DONE, "bm");
> +	if (ret)
> +		return ret;
> +
> +	writel(cfg, tm + TM_BM_CONFIG_0);

[Severity: Medium]
Does writing cfg back to TM_BM_CONFIG_0 here clear
TM_BM_CONFIG_0_BM1_BYPASS_CA_PROCESS,
TM_BM_CONFIG_0_BM2_BYPASS_DEST_PORT_PROCESS, and
TM_BM_CONFIG_0_BM2_BYPASS_VOQ_PROCESS right after initialization finishes?
Those three bits are masked out of cfg and only ORed into the
TM_BM_CONFIG_0_INIT write, so deasserting INIT disables the bypasses.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-b4-cs7542-=
ethernet-v2-0-d0ea3c6eb375@gmail.com?part=3D2
