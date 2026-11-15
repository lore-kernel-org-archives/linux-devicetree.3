Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767498;
	b=iJRw5UrZ7twh1iQaVYPICUCxSY2n6MKZJuDeC6hX4zOu9i5rizMpA+YQj19rb2+b2xty
	 dnrcHSD5eedWhaWSTQ/3mxFCgppGbgYyGyog+P4e8yluM0gWFGQNf/jRnHzO6cXCSqYfP
	 NrJQp1sps0MXNM+KgVrW8e0QWJoG7c/cPMIyXKl57Dhf40PPmywPd6pOdEDiMyqh1N7BQ
	 b1sU3ohVfhQFiLb+eJXqSrL+w3AtQ1We13T8HbuFsiGOQySal36Ni6CYVPoOUGBtJNsvE
	 xUnQ0B4WNHBTi82PivnNO90hZGkO2GteSq5T7eI1Em1ycpnZ1vE8mb160FKA/+CylYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767498;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A5bGjomsYKct0jjUkadcGKwJwVz1xx5iqlCAQ4/uQXg=;
	b=x6r0SQFamwo8+WkMWk0kvQPvsPLg+25dvoB5nb+GeUO8I8zVaXEk74TqwVhxiqILLxF3
	 ID9bS2Bfa8xwGgEnnphzUoZlhnWbsWX2ZC1vNIUhmOV2FXvLYIRtLILjU+c2/MF0oOpsW
	 5qmItt4p2HYgDWkSkLIgNEZhxu/VzOwcm/GV+H4+NVu90VFYYgiQ5CID8SgSVarZkrk16
	 LnfnVqj2BlZN6HfactkzbKDatyMuvfMPYgZtM0hA3pBjdqYyjP9IcIlquvH5V858plAoX
	 Y6t4OWiIaRl+c50Fx1o9v7WGwRdu726hkMaCwVtMoKMa9bSLXN12MxD168p0N6yihkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fYc4k03a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988B606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fYc4k03a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DD11F000C4;
	Sun, 15 Nov 2026 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767498;
	bh=A5bGjomsYKct0jjUkadcGKwJwVz1xx5iqlCAQ4/uQXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fYc4k03a0lI+gSYtfIUg/2IZ6Mu7lpoVcB0PkVnsyuxeR1DU/PabtLy/BrrqCdBU3
	 v/rz3NQSDIefPkov+IJ/2HI/tG7EQ/DO4MIrljzng1fn0zw3Tj2o9k/Hz0eoem2aH6
	 WYoYzyQAG/D8bmPQcgcOyZixNHUBiPz/JEmmnsf2j6vSKqJ2ppifrXze9ZnShD9BC1
	 5LbCOAp2xuAm9RLYkED4OPBYNBhPdUwD+tHIdfAoPXA1hBg1a/5xcCQ9MFSqE0kAAr
	 RBjmaat1VJ6dqp1buOuW8jz0+FWsx6MFSifoJU0R/PH/jurlvwzqpw3ETPl6BN4xJy
	 j6lMrpj9KlHqg==
Message-ID: <sashiko-outbox-215725@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 6/6] net: xilinx: axienet: Add statistics
 support for XXV ethernet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114182947.2908628-7-suraj.gupta2@amd.com>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
 <20261114182947.2908628-7-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 18:31:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: xilinx: axienet: wrong RX bad-FCS offset in
  axienet_xxv_get_stats64()
--

commit 460172ab6de68521ff2c9e9d0c5b3adf14de408f
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Add statistics support for XXV ethernet

This commit adds hardware statistics collection and reporting for the
Xilinx 10G/25G (XXV) Ethernet MAC via ndo_get_stats64() and ethtool
statistics callbacks, gated on the "xlnx,has-statistics-counters"
devicetree property.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/n=
et/ethernet/xilinx/xilinx_axienet_xxv.c
> index 3c204dbbf6aec..83782bfbce4ce 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
[ ... ]
> @@ -335,6 +411,204 @@ static int axienet_10g25g_clk_init(struct axienet_l=
ocal *lp)
>  	return 0;
>  }
[ ... ]
> +static void axienet_xxv_get_stats64(struct axienet_local *lp,
> +				    struct rtnl_link_stats64 *stats)
> +{
> +	unsigned int start;
> +	u64 tx_hw_errors;
> +
> +	do {
> +		start =3D read_seqcount_begin(&lp->hw_stats_seqcount);
> +		stats->rx_crc_errors =3D
> +			lp->xxv_stat_base[XXV_STAT_RX_PACKET_BAD_FCS];
> +		/* Both in-range length errors and frame-too-long (oversize)
> +		 * frames are IEEE 802.3 length errors, so fold them together
> +		 * into rx_length_errors; rx_over_errors is reserved for receiver
> +		 * FIFO/ring overflow, which the XXV MAC does not expose.
> +		 */
> +		stats->rx_length_errors =3D
> +			lp->xxv_stat_base[XXV_STAT_RX_INRANGEERR] +
> +			lp->xxv_stat_base[XXV_STAT_RX_OVERSIZE];
> +		stats->rx_errors =3D lp->xxv_stat_base[XXV_STAT_RX_UNDERSIZE] +
> +				   lp->xxv_stat_base[XXV_STAT_RX_FRAGMENT] +
> +				   lp->xxv_stat_base[XXV_STAT_RX_JABBER] +
> +				   stats->rx_crc_errors +
> +				   stats->rx_length_errors;

[ ... ]

> +static void axienet_xxv_get_eth_mac_stats(struct axienet_local *lp,
> +					  struct ethtool_eth_mac_stats *mac_stats)
> +{
> +	unsigned int start;
> +
> +	do {
> +		start =3D read_seqcount_begin(&lp->hw_stats_seqcount);
> +		mac_stats->FramesTransmittedOK =3D
> +			lp->xxv_stat_base[XXV_STAT_TX_TOTAL_GOOD_PACKETS];
> +		mac_stats->FramesReceivedOK =3D
> +			lp->xxv_stat_base[XXV_STAT_RX_TOTAL_GOOD_PACKETS];
> +		mac_stats->OctetsTransmittedOK =3D
> +			lp->xxv_stat_base[XXV_STAT_TX_TOTAL_GOOD_BYTES];
> +		mac_stats->OctetsReceivedOK =3D
> +			lp->xxv_stat_base[XXV_STAT_RX_TOTAL_GOOD_BYTES];
> +		mac_stats->FrameCheckSequenceErrors =3D
> +			lp->xxv_stat_base[XXV_STAT_RX_PACKET_BAD_FCS];

[ ... ]

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h b/drivers/n=
et/ethernet/xilinx/xilinx_axienet_xxv.h
> index 6530344e40c7f..83682d1524ede 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h
> @@ -66,6 +66,36 @@ struct axienet_config;
[ ... ]
> +#define XXV_STAT_RX_UNDERSIZE_OFFSET		0x00000898
> +#define XXV_STAT_RX_FRAGMENT_OFFSET		0x000008A0
> +#define XXV_STAT_RX_OVERSIZE_OFFSET		0x000008A8
> +#define XXV_STAT_RX_JABBER_OFFSET		0x000008B8
> +#define XXV_STAT_RX_PACKET_BAD_FCS_OFFSET	0x000008C8

[Severity: Medium]
Should this read STAT_RX_BAD_FCS at offset 0x08C0 instead of
STAT_RX_PACKET_BAD_FCS at 0x08C8?

Per PG210, STAT_RX_PACKET_BAD_FCS (0x08C8) counts all received packets with
bad FCS regardless of length, which includes frames shorter than 64 bytes
with bad FCS (STAT_RX_FRAGMENT at 0x08A0) and frames longer than the config=
ured
maximum length with bad FCS (STAT_RX_JABBER at 0x08B8).  Using 0x08C8
causes axienet_xxv_get_stats64() to double-count received fragments and
jabbers in stats->rx_errors, and includes undersize and oversize bad-FCS
frames in stats->rx_crc_errors and mac_stats->FrameCheckSequenceErrors,
whereas STAT_RX_BAD_FCS (0x08C0) counts only valid-length frames with bad
FCS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114182947.2908=
628-1-suraj.gupta2@amd.com?part=3D6
