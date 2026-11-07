Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093553;
	b=isULXItYVqycs5Hsg9oLu3uSTI/T1Gkb16jo8Nt5vDNrql0dr3HcAfgEE9Hm33yLslYU
	 hmigiA2ODvzDgeV+smptuVRXmC9MKS4PCo6pMvI4n2PoqdxhlvsO7Q9CAOURP5g5gYeHO
	 CRoGa7s39IvZ3e48QbYImXEIK58cpFhb4qJPp9fLRQKfDvS0wXECrnCC+VMYgKkzMHrvl
	 jpGjBuyJoebaK4Pyk7vwFXD3T+Jvwuv2LA5x0c445GZZdUlW+W+vPUcaxBkdYgGOmc7ix
	 3VrotqEzIMM49Ssco22i1cHNI1pwjJbgvTkT0WQAQu7PjbW3cLfY1xCGRGah4IK5TBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093553;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tWcNx75LwhDfeUNEvQgoOB1cmF5i/PTtx1XuzgMSdIE=;
	b=EitRlBX/Jy0XLyw71IBJD77F4y1J7CEYQl4gb3uZdI8RMuq+ax4yVIjxaJo6OnnVK5r5
	 XGqRMMsu8jg17MsJ/lRCXMAhwFYTZTkL1DIHyK11UrnZlxEQ7RZu0FVwcaUWZEvPPwJb0
	 GBjCHY5deCYvcseqvrgKAoI6MkaApJ5+kQS7ZnoZPiGCNSc9ArM7M1MNrlpDshvrxZ9yS
	 fZucnYUNHscW8o+8scwhx91ISC0x20XxXv7KiOGoUZ6iTXiiBzU26gRH/UbHtlU5Jj7QZ
	 BD6yRS6Ze8WHeKEASxLSbawWHyz6TbsApWn4vRYqCPZ0Ajij471DziYjDFHiTpiUDbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+2TGl0Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42A606A32E
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 23:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+2TGl0Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9A11F008A1;
	Sat,  7 Nov 2026 23:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794093552;
	bh=tWcNx75LwhDfeUNEvQgoOB1cmF5i/PTtx1XuzgMSdIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+2TGl0QHtG4Y8HmClLD+C9nVQtywbHzpJSVHEKrItasFafiiJoVPSUoqgpsCE2/V
	 t+gxAVnn9rVa+bvRmhYrpSA868NmCzxVEJwFbtB1cNw44RzUdUuhRgR4bPpfwesesa
	 YiAEYNNABIBecopOGk7kGmwLjT5Xt5WsGnmUXTuC5SQT6wEj6WiD1Dljzz/FIXix+l
	 2iC4Cxy5AmXpIusuQo7Mtpks9d4QiAv2/1M3VbqRjnJUQ5vV2LSZXo1CuzV2jTYE3h
	 FaIEcKotRL581vsQoKKUQsuv6Oqm8jjsl0008z5sziiX4t+k2V9S7CgUpPY3+RraaG
	 cS8uxBLOYcv1g==
Message-ID: <sashiko-outbox-203384@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 08/11] onsemi: s2500: Add driver support
 for S2500 MAC-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-s2500-mac-phy-support-v10-8-31b5a69b85b7@onsemi.com>
References: <20261106-s2500-mac-phy-support-v10-0-31b5a69b85b7@onsemi.com>
 <20261106-s2500-mac-phy-support-v10-8-31b5a69b85b7@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 23:19:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] net: oa_tc6: NULL dereference on capability read failure in
  oa_tc6_init()
- [Medium] net: s2500: ethtool -S rx_mismatch_drops duplicates
  rtnl_link_stats64
- [Medium] net: onsemi: s2500: max_adj exceeds 32-bit long scaled_ppm
  limit
- [Low] net: oa_tc6: unchecked oa_tc6_rx_cut_through_enable() in
  oa_tc6_init()
- [Low] net: s2500: multicast filter enabled before programming mask and
  low address
- [Low] net: oa_tc6: mishandled 1-byte dropped frame in
  oa_tc6_prcs_rx_chunk_payload()
--

commit e1d66d87726c84e279a61c87e924eb4068490295
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Add driver support for S2500 MAC-PHY

This commit adds a network driver for the onsemi S2500 10BASE-T1S MAC-PHY
with PTP and ethtool support, and extends the OPEN Alliance TC6 framework
with RX cut-through mode and TX credit threshold helpers.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethe=
rnet/oa_tc6/oa_tc6_main.c
> index 5b2454b759740..8231ba0da1586 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c

[ ... ]

> @@ -1167,6 +1169,7 @@ static int oa_tc6_prcs_rx_chunk_payload(struct oa_t=
c6 *tc6, u8 *data,
>  				       footer);
>  	bool start_valid =3D FIELD_GET(OA_TC6_DATA_FOOTER_START_VALID, footer);
>  	bool end_valid =3D FIELD_GET(OA_TC6_DATA_FOOTER_END_VALID, footer);
> +	bool frame_drop =3D FIELD_GET(OA_TC6_DATA_FOOTER_FRAME_DROP, footer);
>  	u16 size;
> =20
>  	/* Restart the new rx frame after receiving rx buffer overflow error */
> @@ -1176,6 +1179,25 @@ static int oa_tc6_prcs_rx_chunk_payload(struct oa_=
tc6 *tc6, u8 *data,
>  	if (tc6->wait_until_start_valid)
>  		return 0;
> =20
> +	/* Drop the frame, if footer sets FD bit. Checking FD bit
> +	 * becomes important, when cut through operation is enabled.
> +	 */
> +	if (end_valid && frame_drop) {
> +		oa_tc6_cleanup_ongoing_rx_skb(tc6);
> +
> +		/* Full frame in this chunk. Nothing to free. Move on to
> +		 * next chunk.
> +		 */
> +		if (start_valid && start_byte_offset < end_byte_offset) {
> +			tc6->netdev->stats.rx_dropped++;
> +			return 0;
> +		}
> +
> +		/* The chunk carries only the end of the dropped frame. */
> +		if (!start_valid)
> +			return 0;
> +	}

[Severity: Low]
Should this check use start_byte_offset <=3D end_byte_offset?

If a 1-byte aborted frame has start_valid, end_valid, frame_drop and
start_byte_offset =3D=3D end_byte_offset, oa_tc6_cleanup_ongoing_rx_skb()
clears tc6->rx_skb, and execution misses all four start_valid/end_valid
branches and falls through to oa_tc6_prcs_ongoing_rx_frame().  With
tc6->rx_skb NULL, oa_tc6_update_rx_skb() returns -EAGAIN, which makes
oa_tc6_process_spi_data_rx_buf() call oa_tc6_look_for_new_frame() after
the chunk loop and discard any frame that started in a later chunk of the
same SPI transfer.

> @@ -1593,6 +1615,58 @@ int oa_tc6_zero_align_receive_frame_enable(struct =
oa_tc6 *tc6)
>  }
>  EXPORT_SYMBOL_GPL(oa_tc6_zero_align_receive_frame_enable);
> =20
> +/**
> + * oa_tc6_rx_cut_through_enable - function to enable receive cut-through
> + * mode of frame transfer from the network to the SPI host.
> + * @tc6: oa_tc6 struct.
> + *
> + * Return: 0 on success otherwise failed.
> + */
> +int oa_tc6_rx_cut_through_enable(struct oa_tc6 *tc6)
> +{
> +	int ret =3D 0;
> +	u32 regval;
> +
> +	if (!tc6->ctc_capable)
> +		return ret;
> +
> +	ret =3D oa_tc6_read_register(tc6, OA_TC6_REG_CONFIG0, &regval);
> +	if (ret)
> +		return ret;
> +
> +	/* Set Receive Cut-Through Enable */
> +	regval |=3D OA_TC6_CONFIG0_RXCTE;
> +
> +	return oa_tc6_write_register(tc6, OA_TC6_REG_CONFIG0, regval);
> +}
> +EXPORT_SYMBOL_GPL(oa_tc6_rx_cut_through_enable);

[ ... ]

> @@ -1746,6 +1820,12 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi,=
 struct net_device *netdev,
>  		goto phy_exit;
>  	}

[Severity: Medium]
Does jumping to phy_exit when oa_tc6_update_standard_capability() fails
cause a NULL pointer dereference?

oa_tc6_phy_init() has not run yet at this point, so unless
OA_TC6_BROKEN_PHY is set, oa_tc6_phy_exit() passes NULL tc6->phydev and
tc6->mdiobus to phy_disconnect() and mdiobus_unregister():

drivers/net/ethernet/oa_tc6/oa_tc6_main.c:oa_tc6_init() {
	...
	ret =3D oa_tc6_update_standard_capability(tc6);
	if (ret) {
		dev_err(&tc6->spi->dev, "Failed to read capability\n");
		goto phy_exit;
	}
	...
	ret =3D oa_tc6_phy_init(tc6);
}

> +
> +	/* Cut through bits must be configured before SYNC bit is set
> +	 * in CONFIG0 register.
> +	 */
> +	if (tc6->quirk_flags & OA_TC6_CONFIG_RXCTE)
> +		oa_tc6_rx_cut_through_enable(tc6);
> +
>  	ret =3D oa_tc6_unmask_macphy_error_interrupts(tc6);

[Severity: Low]
Should oa_tc6_init() check the return value of
oa_tc6_rx_cut_through_enable(tc6) and return ERR_PTR(ret) on failure?  If
the SPI control read or write of OA_TC6_REG_CONFIG0 fails, initialization
silently continues with RX cut-through disabled.

Also, since OA_TC6_CONFIG0_RXCTE must be set before OA_TC6_CONFIG0_SYNC is
set inside oa_tc6_init(), oa_tc6_rx_cut_through_enable() cannot be called
by drivers after oa_tc6_init() returns and can be static rather than
exported.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> new file mode 100644
> index 0000000000000..062cab9460dcf
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c

[ ... ]

> +static const char s2500_mac_stat_strings[][ETH_GSTRING_LEN] =3D {
> +	"rx_mismatch_drops",
> +};
> +
> +static const u8 s2500_mac_stat_map[S2500_NUM_MAC_STATS] =3D {
> +	S2500_MSTRXDROPPED_IDX,
> +};

[ ... ]

> +static void s2500_get_ethtool_stats(struct net_device *ndev,
> +				    struct ethtool_stats *stats, u64 *data)
> +{
> +	struct s2500_info *priv =3D netdev_priv(ndev);
> +	int i;
> +
> +	s2500_update_stats(priv);
> +	for (i =3D 0; i < S2500_NUM_MAC_STATS; i++)
> +		data[i] =3D priv->stats_data[s2500_mac_stat_map[i]];
> +}

[Severity: Medium]
Should S2500_MSTRXDROPPED_IDX be reported via struct rtnl_link_stats64's
rx_otherhost_dropped instead of a custom ethtool -S counter?

S2500_REG_MAC_STRXDROPPED counts frames dropped due to destination MAC
address filter mismatch, which matches rx_otherhost_dropped in
struct rtnl_link_stats64.  As noted in the v9 review discussion,
Documentation/networking/statistics.rst requires counters with a standard
netdev representation to use the standard interface rather than
ethtool -S.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_main.c b/drivers/net=
/ethernet/onsemi/s2500/s2500_main.c
> new file mode 100644
> index 0000000000000..03495fedac98c
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_main.c

[ ... ]

> +		/* Slot 0 holds the unicast MAC, multicast starts at 1 */
> +		i =3D 1;
> +		netdev_hw_addr_list_for_each(ha, mc) {
> +			const u8 *mac =3D ha->addr;
> +			int slot =3D i++;
> +
> +			addrh =3D S2500_MAC_ADDRFILT_ENABLE |
> +				get_unaligned_be16(mac);
> +			addrl =3D get_unaligned_be32(&mac[2]);
> +
> +			addr =3D S2500_REG_MAC_ADDRFILTH(slot);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr,
> +							addrh);
> +			if (ret)
> +				return ret;
> +
> +			addr =3D S2500_REG_MAC_ADDRFILTL(slot);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr,
> +							addrl);
> +			if (ret)
> +				return ret;
> +
> +			addr =3D S2500_REG_MAC_ADDRMASKL(slot);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr,
> +							0xffffffff);
> +			if (ret)
> +				return ret;
> +
> +			addr =3D S2500_REG_MAC_ADDRMASKH(slot);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr,
> +							0xffff);
> +			if (ret)
> +				return ret;
> +		}

[Severity: Low]
Does writing S2500_REG_MAC_ADDRFILTH(slot) with S2500_MAC_ADDRFILT_ENABLE
first activate the filter slot before its low address and masks are
programmed?

When transitioning from IFF_ALLMULTI (or > 3 multicast addresses) to 1..3
multicast addresses, the disable loop only zeroes S2500_REG_MAC_ADDRFILTH,
leaving ADDRMASKL(1) =3D 0 and ADDRMASKH(1) =3D 0x100 in hardware.  Enabling
ADDRFILTH(slot) first makes the slot match against stale mask and low
address registers while the remaining SPI writes are in flight, or
permanently if one of those writes fails.  Writing the mask and
ADDRFILTL registers before ADDRFILTH, as s2500_set_mac_filter() and the
IFF_ALLMULTI branch do, avoids this.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c b/drivers/net/=
ethernet/onsemi/s2500/s2500_ptp.c
> new file mode 100644
> index 0000000000000..07db928dd732a
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c

[ ... ]

> +static int s2500_ptp_set_freq(struct s2500_info *priv, long scaled_ppm)
> +{
> +	u32 sign_bit =3D 0;
> +	u64 adj;
> +	u32 val;
> +
> +	if (diff_by_scaled_ppm(S2500_PTP_ADJ_BASE, scaled_ppm, &adj))
> +		sign_bit =3D 1U << 31;
> +
> +	/* check overflow */
> +	if (adj > S2500_PTP_ADJ_MAX)
> +		return -ERANGE;
> +
> +	val =3D (u32)adj | sign_bit;
> +	return oa_tc6_write_register_mms(priv->tc6, OA_TC6_PHY_C45_VS_MMS12,
> +					 S2500_REG_VS_PTP_ADJ, val);
> +}

[ ... ]

> +int s2500_ptp_register(struct s2500_info *priv)
> +{
> +	struct ptp_clock_info *info =3D &priv->ptp_clock_info;
> +	int ret;
> +
> +	info->max_adj =3D S2500_PTP_MAX_ADJ_PPB;

[Severity: Medium]
Can S2500_PTP_MAX_ADJ_PPB overflow a 32-bit long scaled_ppm on 32-bit
kernels?

S2500_PTP_MAX_ADJ_PPB is (GENMASK(27, 0) / 8) =3D 33,554,431 ppb, but
ptp_clock_adjtime() passes tx->freq as a signed long to
scaled_ppm_to_ppb() and info->adjfine(), and LONG_MAX on 32-bit kernels
(2,147,483,647 scaled_ppm) is only 32,767,999 ppb.  On 32-bit systems, a
frequency adjustment between +32,768,001 and +33,554,431 ppb truncates
tx->freq to a negative 32-bit long within [-max_adj, max_adj] and programs
a large negative adjustment into S2500_REG_VS_PTP_ADJ, while -32,768,000
ppb (scaled_ppm =3D=3D LONG_MIN) overflows -scaled_ppm in diff_by_scaled_pp=
m()
and fails with -ERANGE.  Capping S2500_PTP_MAX_ADJ_PPB at 32767999 avoids
both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-s2500-mac-=
phy-support-v10-0-31b5a69b85b7@onsemi.com?part=3D8
