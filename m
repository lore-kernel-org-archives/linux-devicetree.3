Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546401;
	b=12ks4u9bhL/NI4WLaXeCvz8e3RnPJh98VfeYuxocpc5DfsVHKEvdjC/OfDNd7biC5Ujh
	 rjnxADc+6Cmkn8BtGzUKrl5e/qlwjIk9Werzzrb/Y16mCZg46OR7BnVi9QLRdRa5rqjjt
	 Zl8TFNzyKRpDhDNlwi4fENqFeN1JGvenFgy2HzBixYho47vuzBvpQIRbs05STM+WnCIL1
	 qw1NzcWvMnidVEKR46WKqBsuCHaNxPAV5ts9Pb8iImf7mVOiuqhPhWH20TLWMVzLwMAxQ
	 h5rPdJpGtMiEJ4kVbFo0Y9P+BstwJQ+MQKyXHgQXlHudQyEPFUc2QrCh8/bPLqoPVzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546401;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=z91gPIWU03oHradzfsGgymcWPE/E/jUuuZGawInZ83s=;
	b=glx0l9B1qy28ykUj+ruETxiF5k9zDkv6NIMb0ePE73QsY8loJ5A1QNN6OKSz+BYgurQO
	 UPbvsXW5fDjuskVEAJnQzKbetn++FBCFIvdN/NuFJy4bgZvNh4QpiBm2GoqshJI1LSZfq
	 uOQuXuj1ijQfTvLZF99nF0ic4TxEKSuPt5WO/FNuhcPAqYBkVy/xNlyyZDAuJ7sW6byRo
	 BSswdCWWIQAqBwiGANST05icGuIRFkbnDBXoBGPNbj2PZThp75fDCJVzPpnE890aQd6qY
	 OKr/PavDEF5ZpyTGbpFa/G7+rPTpysbCo/tc3q+60ZVnqKs4AtPXwAuKDg5dkd83KyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YDKupR4B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBA8606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 18:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YDKupR4B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB6B1F000C6;
	Tue, 24 Nov 2026 18:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795546401;
	bh=z91gPIWU03oHradzfsGgymcWPE/E/jUuuZGawInZ83s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YDKupR4BgKLiVkRUPpVGMR/P+d2R8mIVDGOxPzaNhaXyZ71PRJ/IiMVswrBeWKF48
	 9V05r6k19aLRloHPtCGFTHYVcdYDUmlpTnQVh+QLil3n1lEOJwTkV56xQAihpdFbWQ
	 oLAxSKwX2BAinCsEinjXldsS5aYyZeOHRi7wiU/lHderbFKscyVd54b+4LuPiFC5Al
	 cIAx9iMgiafP7Y5lZpmZ2Y04+ERdRmUkVDvK7W0J+bv3DE01qsVMeSYLg8E64TWPUl
	 V+eUmJFf/J5Wk9M8rd8kLMa4v/1ffJ8ROqNmZmbVkbdGxECes2/LDnADRxgkdTV2J9
	 FXYqg0fpnMNAw==
Message-ID: <sashiko-outbox-231860@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 4/5] net: cortina: Add CS7542 CPU network
 datapath
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 18:53:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] net: cortina: RX DMA buffer leak on oversized frames in
  cs_ne_rx_poll()
- [Medium] net: cortina: shared MAC prefix registers clobbered in
  cs_ne_set_hw_addr()
- [Medium] net: cortina: unlocked RMW on shared NI registers in
  cs_ne_mac_link_up()
- [Medium] net: cortina: unvalidated napi_budget parameter in
  cs_ne_probe_port()
- [Medium] net: cortina: lost RX interrupt for queued XRAM packets in
  cs_ne_open()
- [Medium] net: cortina: unchecked command errors in cs752x_sch_init()
- [Medium] net: cortina: BM bypass bits cleared after init in
  cs752x_tm_bm_init()
- [Medium] net: cortina: unreaped TX SKBs left in ring by cs_ne_stop()
--

commit 82b05afd45239de80ea534b48d615861a3fd0a56
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: cortina: Add CS7542 CPU network datapath

This commit adds an Ethernet driver for the Cortina CS7542 network engine
GMACs, including CPU XRAM RX queues, QM buffer management, a shared TX
descriptor ring, and FE/SCH/TM hardware initialization.

> diff --git a/drivers/net/ethernet/cortina/cs752x_ne.c b/drivers/net/ether=
net/cortina/cs752x_ne.c
> new file mode 100644
> index 0000000000000..126dcdd6c5c54
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs752x_ne.c

[ ... ]

> +		pkt_size =3D FIELD_GET(HDRE_PKT_SIZE, hdre_lo);
> +		off =3D CS_NE_BUF_HDR_OFF + 8 + 16 + 2;
> +		total =3D pkt_size > 20 ? pkt_size - 20 : 0;
> +		valid =3D total >=3D ETH_HLEN && total <=3D CS_NE_MAX_PKT_LEN;
> +		nbufs =3D 1;
> +		if (valid && total > CS_NE_BUF_DATA_MAX - (off & 0xff))
> +			nbufs +=3D DIV_ROUND_UP(total - (CS_NE_BUF_DATA_MAX - (off & 0xff)),
> +					      CS_NE_BUF_DATA_MAX);
> +		if (nbufs > CS_NE_RX_MAX_BUFS) {
> +			valid =3D false;
> +			nbufs =3D CS_NE_RX_MAX_BUFS;
> +		}
> +		for (i =3D 0; i < nbufs; i++)
> +			dma[i] =3D readl(desc + 40 + i * 4) & XRAM_BUF_MASK;
> +		valid =3D cs_ne_rx_claim(ne, dma, bufs, nbufs) && valid;

[Severity: High]
Does gating the nbufs calculation on valid leak trailing RX DMA buffers
when total > CS_NE_MAX_PKT_LEN?

cs_ne_qm_cpu_path_init() configures QM_MAX_CPU_PKT_LEN to
CS_NE_MAX_PKT_LEN + 16, so hardware can deliver oversized multi-buffer
frames to XRAM.  When total > CS_NE_MAX_PKT_LEN, valid is false and nbufs
stays 1 (which also makes the nbufs > CS_NE_RX_MAX_BUFS check unreachable).
Only dma[0] is claimed and recycled, while the remaining buffers in the
descriptor stay in CS_NE_RX_HW state permanently, depleting the fixed RX
pool allocated at probe time until reception stalls.  Also, if the 4-byte
FCS subtracted from pkt_size is stored in buffer memory and crosses a
CS_NE_BUF_DATA_MAX boundary, computing nbufs from total rather than the
stored byte count will undercount nbufs by one and leak that final buffer
as well.

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
Does cs_ne_set_hw_addr() overwrite the upper five MAC address bytes for
all sibling ports?

NI_MAC_ADDR0 and NI_MAC_ADDR1 are controller-wide registers shared by all
three GMACs, while only NI_ETH_MAC_CONFIG2(port->id) is per-port.  Probing
multiple ports with different 5-byte prefixes (such as when
cs_ne_probe_port() falls back to eth_hw_addr_random()) or changing one
port's MAC address via cs_ne_set_mac_address() silently clobbers the
hardware MAC prefix of the other ports, desynchronizing them from their
ndev->dev_addr.

[ ... ]

> +static void cs_ne_mac_link_up(struct phylink_config *config,
> +			      struct phy_device *phy, unsigned int mode,
> +			      phy_interface_t interface, int speed, int duplex,
> +			      bool tx_pause, bool rx_pause)
> +{
> +	struct cs_ne_port *port =3D container_of(config, struct cs_ne_port,
> +					       phylink_config);
> +	struct cs_ne *ne =3D port->ne;
> +	int p =3D port->id;
> +	u32 val =3D 0;
> +
> +	cs_ne_mac_enable(port, false);
> +	if (speed =3D=3D SPEED_10)
> +		val |=3D NI_MAC_SPEED_10;
> +	if (duplex !=3D DUPLEX_FULL)
> +		val |=3D NI_MAC_HALF_DUPLEX;
> +	if (!rx_pause)
> +		val |=3D NI_MAC_RX_FLOW_DISABLE;
> +	if (!tx_pause)
> +		val |=3D NI_MAC_TX_FLOW_DISABLE;
> +	ni_rmw(ne, NI_ETH_MAC_CONFIG0(p),
> +	       NI_MAC_SPEED_10 | NI_MAC_HALF_DUPLEX | NI_MAC_RX_FLOW_DISABLE |
> +	       NI_MAC_TX_FLOW_DISABLE, val);
> +	ni_rmw(ne, NI_ETH_INT_CONFIG1, NI_INT_CFG_GE_MASK(p),
> +	       NI_INT_CFG_GE(p, speed =3D=3D SPEED_1000 ? NI_INT_CFG_RGMII_1000=
 :
> +			     NI_INT_CFG_RGMII_100));
> +	ni_rmw(ne, NI_ETH_INT_CONFIG2, NI_INT_CONFIG2_GE_MASK(p),
> +	       NI_TX_INTF_LP_TIME_GE(p));
> +	cs_ne_mac_enable(port, true);
> +}

[Severity: Medium]
Can concurrent cs_ne_mac_link_up() calls race on NI_ETH_INT_CONFIG1 and
NI_ETH_INT_CONFIG2?

Each port has its own phylink instance whose resolve work runs without
rtnl_lock or a shared controller lock.  Because NI_ETH_INT_CONFIG1 and
NI_ETH_INT_CONFIG2 pack per-port fields for all three ports into shared
registers, unlocked read-modify-write updates in ni_rmw() when two links
come up at the same time can overwrite one port's RGMII speed or timing
configuration.

> +
> +static const struct phylink_mac_ops cs_ne_phylink_ops =3D {
> +	.mac_config =3D cs_ne_mac_config,
> +	.mac_link_down =3D cs_ne_mac_link_down,
> +	.mac_link_up =3D cs_ne_mac_link_up,
> +};
> +
> +static int cs_ne_open(struct net_device *ndev)
> +{
> +	struct cs_ne_port *port =3D netdev_priv(ndev);
> +	struct cs_ne *ne =3D port->ne;
> +	unsigned long flags;
> +	int ret;
> +
> +	/* RTNL also protects the final probe activation. */
> +	if (ne->rx_stopping)
> +		return -ENODEV;
> +	if (READ_ONCE(ne->txq.fault))
> +		return -EIO;
> +
> +	ret =3D phylink_of_phy_connect(port->phylink, port->np, 0);
> +	if (ret) {
> +		netdev_err(ndev, "phylink connect failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	port->rd =3D ni_rd(ne, NI_CPUXRAM_CPU_CFG_RX(port->id)) & NI_XRAM_PTR_M=
ASK;
> +	napi_enable(&port->napi);
> +	ret =3D request_irq(port->irq, cs_ne_rx_irq, 0, ndev->name, port);
> +	if (ret) {
> +		napi_disable(&port->napi);
> +		phylink_disconnect_phy(port->phylink);
> +		return ret;
> +	}
> +	spin_lock_bh(&ne->txq.lock);
> +	if (ne->txq.fault) {
> +		spin_unlock_bh(&ne->txq.lock);
> +		free_irq(port->irq, port);
> +		napi_disable(&port->napi);
> +		phylink_disconnect_phy(port->phylink);
> +		return -EIO;
> +	}
> +	WRITE_ONCE(port->opened, true);
> +	ne->txq.stopping =3D false;
> +	cs_ne_tx_arm_timer(&ne->txq);
> +	/* A concurrent TX fault must be able to stop this queue permanently. */
> +	netif_start_queue(ndev);
> +	spin_unlock_bh(&ne->txq.lock);
> +	spin_lock_irqsave(&ne->rx_lock, flags);
> +	ni_wr(ne, NI_CPUXRAM_RXPKT_INTERRUPT(port->id), 1);
> +	ni_wr(ne, NI_CPUXRAM_RXPKT_INTENABLE(port->id), 1);
> +	spin_unlock_irqrestore(&ne->rx_lock, flags);
> +	phylink_start(port->phylink);
> +	return 0;
> +}

[Severity: Medium]
Can clearing NI_CPUXRAM_RXPKT_INTERRUPT in cs_ne_open() strand unread RX
packets in XRAM?

cs_ne_stop() disables NAPI without draining descriptors remaining in the
XRAM ring (and port 0 can also receive frames via the FE catch-all rule
while down).  When the port is reopened, cs_ne_open() clears the pending
interrupt bit without checking whether NI_CPUXRAM_CPU_STA_RX is ahead of
port->rd or scheduling NAPI.  Queued packets stay unread until a new frame
arrives, or forever if the XRAM ring is already full or at its
backpressure threshold and cannot accept another frame to trigger an
interrupt.

> +
> +static int cs_ne_stop(struct net_device *ndev)
> +{
> +	struct cs_ne_port *port =3D netdev_priv(ndev);
> +	struct cs_ne *ne =3D port->ne;
> +	unsigned long flags;
> +	bool last =3D true;
> +	int i;
> +
> +	/* Serialize queue wakeups before waiting for ndo_start_xmit to finish.=
 */
> +	spin_lock_bh(&ne->txq.lock);
> +	WRITE_ONCE(port->opened, false);
> +	for (i =3D 0; i < CS_NE_PORTS; i++)
> +		if (ne->ports[i] && READ_ONCE(ne->ports[i]->opened))
> +			last =3D false;
> +	if (last)
> +		ne->txq.stopping =3D true;
> +	spin_unlock_bh(&ne->txq.lock);
> +	netif_tx_disable(ndev);
> +	phylink_stop(port->phylink);
> +	spin_lock_irqsave(&ne->rx_lock, flags);
> +	ni_wr(ne, NI_CPUXRAM_RXPKT_INTENABLE(port->id), 0);
> +	spin_unlock_irqrestore(&ne->rx_lock, flags);
> +	free_irq(port->irq, port);
> +	napi_disable(&port->napi);
> +	phylink_disconnect_phy(port->phylink);
> +	if (last)
> +		cs_ne_tx_cancel_timer(&ne->txq);
> +	return 0;
> +}

[Severity: Medium]
Does stopping the last open port leave transmitted SKBs pinned in
ne->txq.bufs[]?

TX completions are only reaped from cs_ne_rx_poll(), cs_ne_tx_timer(), and
cs_ne_start_xmit().  When the last open port stops, cs_ne_stop() disables
NAPI and cancels ne->txq.timer without a final cs_ne_tx_complete() pass,
so any SKBs and DMA mappings still in the TX ring remain held (pinning
socket sk_wmem_alloc accounting) until a port is opened again or the
driver is unbound.

[ ... ]

> +	ndev->dev.of_node =3D np;
> +	ndev->netdev_ops =3D &cs_ne_netdev_ops;
> +	ndev->ethtool_ops =3D &cs_ne_ethtool_ops;
> +	ndev->hw_features =3D NETIF_F_SG;
> +	ndev->features =3D NETIF_F_SG;
> +	ndev->vlan_features =3D NETIF_F_SG;
> +	ndev->min_mtu =3D ETH_MIN_MTU;
> +	ndev->max_mtu =3D CS_NE_MAX_PKT_LEN - ETH_HLEN - ETH_FCS_LEN - 16;
> +	netif_napi_add_weight(ndev, &port->napi, cs_ne_rx_poll, napi_budget);

[Severity: Medium]
What happens if the napi_budget module parameter is set to 0 or a negative
value?

napi_budget is a signed int passed directly to netif_napi_add_weight()
without validation.  If napi_budget <=3D 0, cs_ne_rx_poll() returns 0
without draining packets or calling napi_complete_done() (since done <
budget is false), and __napi_poll() sees work >=3D weight and repolls
forever in softirq context.

[ ... ]

> diff --git a/drivers/net/ethernet/cortina/cs752x_sch_tm.c b/drivers/net/e=
thernet/cortina/cs752x_sch_tm.c
> new file mode 100644
> index 0000000000000..e0213c7999cef
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs752x_sch_tm.c

[ ... ]

> +	for (port =3D 0; port < SCH_PORT_NO; port++) {
> +		cpu_port =3D port >=3D SCH_CPU_PORT0 ? port - SCH_CPU_PORT0 : 0;
> +
> +		cs752x_sch_enable_port(dev, sch, port);
> +		cs752x_sch_set_port_burst(dev, sch, port, 0);
> +		cs752x_sch_bypass_shaper(dev, sch, port + SCH_LT_BASE_ID, 0);
> +		cs752x_sch_bypass_shaper(dev, sch, port + SCH_ST_BASE_ID, 0);
> +
> +		for (q =3D 0; q < SCH_MAX_PORT_QUEUE; q++) {
> +			cs752x_sch_enable_voq_drr(dev, sch,
> +						  port * SCH_MAX_PORT_QUEUE + q,
> +						  SCH_DEFAULT_QUANTA, cpu_port);
> +			cs752x_sch_bypass_shaper(dev, sch,\n+						 port + SCH_DRR_BASE_ID,
> +						 cpu_port);
> +		}
> +	}

[Severity: Medium]
Should cs752x_sch_init() check and propagate the error returns from the
scheduler command helpers?

cs752x_sch_enable_port(), cs752x_sch_set_port_burst(),
cs752x_sch_bypass_shaper(), and cs752x_sch_enable_voq_drr() all return the
status from cs752x_sch_cmd(), which can fail with -ETIMEDOUT or -EIO, but
their return values are ignored here and probe succeeds with an
incompletely configured scheduler.  Also, cs752x_sch_bypass_shaper() for
port + SCH_DRR_BASE_ID does not depend on q and is re-issued on every
iteration of the inner queue loop.

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
Does writing cfg back to TM_BM_CONFIG_0 clear the BM1/BM2 bypass bits that
were just set?

The three bypass flags (TM_BM_CONFIG_0_BM1_BYPASS_CA_PROCESS,
TM_BM_CONFIG_0_BM2_BYPASS_DEST_PORT_PROCESS, and
TM_BM_CONFIG_0_BM2_BYPASS_VOQ_PROCESS) are masked out of cfg and only ORed
into the writel() that asserts TM_BM_CONFIG_0_INIT, so the final
writel(cfg, ...) that clears INIT also disables those bypasses.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-cs7542-=
ethernet-v1-0-fdb5e8c2d508@gmail.com?part=3D4
