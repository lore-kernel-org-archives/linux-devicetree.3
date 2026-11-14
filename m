Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675579;
	b=kDAsixyoRE+6J6dqnbJnbt8pra1acYoEtuuawKHLzKvYJ0xaGfTZYdpxYZVEE16nZr99
	 r3OJWyA6LRiHVaoYWxtBLJBE2IurJ4zAS+JCojfIGfi5mRgb51GPCwsSm/KwgnxFM06gl
	 nJIkQIhkoeqsSc2bFtV8H0b76w4j1i4sQrbOlYNIjJzKv/N6cOOzB+iaeidWbtvh4t6GB
	 TBJqNaPmayhf5rECblLY8nJ3INPy9SrJasHD5BmBtwn8AqGoRPR1C/25bEf19yk5yLcfV
	 k7VckGWg0ezPwZ0ZasontLuWOKxWltjXIt/kGuBFZTc6PxquIVm5twiGbEWBtIAKLCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675579;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Jxwxept0+MZgi2SYRj3inpd87pZij+PB0cR2XK0u/uo=;
	b=zLF42YHm1Gqs7ravgcTV3rXS0rjQ/Ep2idv9A8HNsSHiTGKzXza1gfjw3MUk3bpEjiQD
	 s0SGwLUBvIdIkE2JV4NXYIu8cnJCou3kLn20QmlwO96aGegcYVS0NEgKx1P2A/0d6q+6v
	 ThoSYenKrfe4kpAJdyYP1/T7JUjiqL5MX26AOq3IKA7/tN1GmZyxk2e43+MeOCHv2K0Q1
	 nF1YECiVPV90z2UdeFdjmKubSoXeL3588vCeQHThLlLqN4s+lag4BJiIgMFeijBgAL3h8
	 G7vzZqWPzkZ0VgORAZndSBOce2Beouqpi+xVFJw/QXFiMp4XuJEukqosYTnCBkjdSkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oHHIihIA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1A2606A336
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oHHIihIA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757971F000C5;
	Sat, 14 Nov 2026 16:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794675579;
	bh=Jxwxept0+MZgi2SYRj3inpd87pZij+PB0cR2XK0u/uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oHHIihIA3MK6stkKt38mumBZEDT3A5CZ7Nq5grrGRM/xi9y7dwITvRcqSxmborjy3
	 Y+hBY7qOF9TePGjfHVvFk2MJ1oZbuyWOyaNMWkT0xc+7SdoTri10w2g73ggFilOVSI
	 XEyEwi+TLEdZXImjx/DrNgfJRHJ2hcmq3Mib3kok/+AW7AZq8r5k2C4X63EvmHJTvC
	 aIDBqfpUmrV3WwWwbAc9GpKNyb3XlIjTqeTMHduEuFKzO5nWyf7eEZGf8j3yE/5Ppl
	 YFUnl46u6WjzYr5tcXkxPPB6rJG1oaJmQdHozLx0lsnMkrroxu+8KH3Sup+HKUAdSV
	 DJhTJkfVW71Tg==
Message-ID: <sashiko-outbox-214803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
References: <20261113-s2500-mac-phy-support-v11-0-7a186141952c@onsemi.com>
 <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 16:59:39 +0000
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
- [Medium] net: s2500: ethtool -S rx_mismatch_drops duplicates
  rtnl_link_stats64
- [Medium] net: s2500: S2500_PTP_MAX_ADJ_PPB overflows 32-bit long
  scaled_ppm
- [Medium] net: s2500: s2500_set_multicast_mode() enables MCSF filter
  under IFF_PROMISC
--

commit 98b1718831c733b46bf9d80e2766e580982ab454
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: onsemi: s2500: Add driver support for S2500

This commit adds driver support for the onsemi S2500 10BASE-T1S MAC-PHY,
including ethtool statistics, multicast filtering, and PTP hardware clock
operations, along with RX cut-through and TX credit threshold helpers in
the OA TC6 framework.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> new file mode 100644
> index 0000000000000..2fc09107aed3e
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
Should S2500_MSTRXDROPPED_IDX be reported via rx_otherhost_dropped in
struct rtnl_link_stats64 instead of a custom "rx_mismatch_drops" counter in
ethtool -S?

Frames dropped due to destination MAC address filter mismatch match the
standard rx_otherhost_dropped counter (see
Documentation/networking/statistics.rst), and exposing them only as a
driver-private ethtool -S string hides them from standard netlink tools
like ip -s link.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_hw_def.h b/drivers/n=
et/ethernet/onsemi/s2500/s2500_hw_def.h
> new file mode 100644
> index 0000000000000..cb9c53b936b83
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_hw_def.h
[ ... ]
> +/* Frequency adjust magnitude, 1 LSB =3D 0.000125 ppm =3D 1/8 ppb */
> +#define S2500_PTP_ADJ_MAX		GENMASK(27, 0)
> +#define S2500_PTP_ADJ_BASE		8000000000ULL
> +#define S2500_PTP_MAX_ADJ_PPB		(S2500_PTP_ADJ_MAX / 8)

[Severity: Medium]
Can S2500_PTP_MAX_ADJ_PPB (33,554,431 ppb) overflow the 32-bit signed long
scaled_ppm parameter on 32-bit architectures?

ptp_clock_adjtime() passes tx->freq as a signed long to
scaled_ppm_to_ppb() and info->adjfine().  On 32-bit kernels, LONG_MAX
holds at most 32,767,999 ppb, so requesting an adjustment between
+32,768,000 and +33,554,431 ppb wraps scaled_ppm to a negative value that
passes the max_adj check and programs S2500_REG_VS_PTP_ADJ in the wrong
direction.  When scaled_ppm is LONG_MIN (-32,768,000 ppb), negating it in
diff_by_scaled_ppm() also overflows and fails with -ERANGE.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_main.c b/drivers/net=
/ethernet/onsemi/s2500/s2500_main.c
> new file mode 100644
> index 0000000000000..f176475cfd7ed
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_main.c
[ ... ]
> +static int s2500_set_promiscuous_mode(struct s2500_info *priv,
> +				      unsigned int rx_flags)
> +{
> +	u32 val =3D S2500_MAC_CTRL_ADRF;
> +	bool clr =3D false;
> +
> +	if (rx_flags & IFF_PROMISC)
> +		clr =3D true;
> +	return s2500_mac_ctrl_modify_bits(priv, val, clr);
> +}
> +
> +static int s2500_set_multicast_mode(struct s2500_info *priv,
> +				    unsigned int rx_flags,
> +				    struct netdev_hw_addr_list *mc)
> +{
> +	struct netdev_hw_addr *ha;
> +	u8 mms =3D OA_TC6_MAC_MMS1;
> +	int i, ret =3D 0;
> +	int mc_count;
> +	u16 addr;
> +	u32 val;
> +
> +	mc_count =3D netdev_hw_addr_list_count(mc);
> +
> +	if ((rx_flags & IFF_ALLMULTI) ||
> +	    mc_count > S2500_N_MCAST_FILTERS) {
> +		/* Disable multicast filter */
> +		ret =3D s2500_mac_ctrl_modify_bits(priv,
> +						 S2500_MAC_CTRL_MCSF,
> +						 true);
[ ... ]
> +	} else if (mc_count =3D=3D 0) {
> +		/* Enable multicast filter */
> +		ret =3D s2500_mac_ctrl_modify_bits(priv,
> +						 S2500_MAC_CTRL_MCSF,
> +						 false);
[ ... ]
> +static int s2500_set_rx_mode(struct net_device *ndev,
> +			     struct netdev_hw_addr_list *uc,
> +			     struct netdev_hw_addr_list *mc)
> +{
> +	struct s2500_info *priv =3D netdev_priv(ndev);
> +	int ret;
> +
> +	ret =3D s2500_set_promiscuous_mode(priv, ndev->flags);
> +	if (ret)
> +		return ret;
> +
> +	return s2500_set_multicast_mode(priv, ndev->flags, mc);
> +}

[Severity: Medium]
Does s2500_set_multicast_mode() leave S2500_MAC_CTRL_MCSF enabled when
IFF_PROMISC is set?

s2500_set_rx_mode() calls s2500_set_multicast_mode() after
s2500_set_promiscuous_mode(), and s2500_set_multicast_mode() only checks
IFF_ALLMULTI.  When IFF_PROMISC is set without IFF_ALLMULTI and mc_count
is 0, the else-if branch sets S2500_MAC_CTRL_MCSF and disables the address
filter slots, which can filter out multicast traffic while in promiscuous
mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-s2500-mac-=
phy-support-v11-0-7a186141952c@onsemi.com?part=3D10
