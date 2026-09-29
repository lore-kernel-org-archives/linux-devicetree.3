Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FB04CEE72
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720739; cv=none; b=mC02qiOAFGRRNC/mXmmyoF8Pb1ipIrgY0AujMLvVlxf38nwBoYsPo3fezRcP7UyWzZBSprmzeS8WEA4I+w1M/H4jKnuOp4DH1X2YGz73CVHuHikAjmEYtUoXykOfGiUqxCZ352MvVD6nZSskqcvpM6XQI3pv7sSPVpxk/lmZCfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720739; c=relaxed/simple;
	bh=rqQ7zXE9RtEuCOPP+UadMjcK3lJKMvHDhS9BH5eni1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WUssm1EWh2Fgyw1uaf9a/Jr7tFLHdTu0i+1OI9/6pjkEwnwt3jSuAl0d4vF6WckD0q3xw2vb49PpS/KfyDniBGVQ3Qsm9cMaGBZ4Hte9O9P10nLdFZKzKvGFzRv+Ol1oVgBcCwrbbIhQAqD3LtaV6sqxSFzvvw8eH/mYuMX8Qks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoX38Qen; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoX38Qen"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948AB1F00893;
	Tue, 29 Sep 2026 22:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720737;
	bh=zqQND98kMe1O2BISg5ctS4MKLBzVYz43jDTPd4JIDfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DoX38QenKkkadhRhrm9gAjKywejU3x35x0Yi6aOKGbaAExDPEgowIaSS4SA6zI3pm
	 nZvzJ6Ohvrp9zVwUiXF1k+3iNhl6dZfkllyX25EutceW1A+LiHTTqeuvLI6Ed/yyhe
	 O9Dyp+PsE7hwUQnRbTMwvvdSJ8PtC38KB2U37g2BaKAjVA6iskN5fPAGXZ3QpIDGtT
	 WYL2aHv9/wySyhuDtnZ/UpMi4i5Z1Bn06+ezTs5w7jsC+iFHqs9fdYal+6/F2Vp1dJ
	 YOPMdUEHYkKoThEDf+3R6I31k/62xXoLinKezMGDAr5EWskV1nerMePso5qMsfWKuW
	 DWUb6Yue0AcXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 05/11] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-s2500-mac-phy-support-v8-5-7e011aacc309@onsemi.com>
References: <20260928-s2500-mac-phy-support-v8-0-7e011aacc309@onsemi.com>
 <20260928-s2500-mac-phy-support-v8-5-7e011aacc309@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:25:37 +0000
Message-Id: <20260929222537.948AB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] net: oa_tc6: permanent PTP failure and memory leak on dropped TX p=
ackets
- [High] net: oa_tc6: out-of-bounds shift and unbounded SKB leak for forwar=
ded packets
- [Medium] net: oa_tc6: disabling HW timestamps causes SKB and timestamp sl=
ot leak
- [Medium] net: oa_tc6: 64-bit timestamp statistics are susceptible to torn=
 reads
- [Medium] net: oa_tc6: oa_tc6_get_ts_info drops software timestamping capa=
bility flags
- [Medium] net: oa_tc6: unnecessary bulk SPI read on extended status events
--

commit daeff7785bfd3c494b303f6929065e7237a23200
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for hardware timestamp

This commit implements PTP hardware timestamping for the OA TC6 framework.
It introduces functions to handle TX and RX timestamps, registers the PTP
clock, and provides ethtool callbacks for timestamp configurations.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6.c b/drivers/net/ethernet/=
oa_tc6/oa_tc6.c
> index f8e9309a72f11..5cbe049f76efd 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
[ ... ]
> @@ -50,6 +61,195 @@ static int oa_tc6_get_parity(u32 p)
>  	return !((p >> 28) & 1);
>  }
[ ... ]
> +static void oa_tc6_events_handle(struct oa_tc6 *tc6, u32 val, const u32 =
*ts)
> +{
> +	struct skb_shared_hwtstamps tstamp;
> +	struct oa_tc6_ts_info_tx *ski;
> +	struct sk_buff *skb, *tmp;
> +	LIST_HEAD(deliver);
> +	LIST_HEAD(drop);
> +	u8 tsc, bit_num;
> +	u32 handled =3D 0;
> +	u32 event;
> +
> +	spin_lock_bh(&tc6->tx_skb_lock);
> +	list_for_each_entry_safe(skb, tmp, &tc6->tx_ts_skb_q, list) {
> +		ski =3D oa_tc6_tsinfo_tx(skb);
> +		tsc =3D ski->tsc;
> +		bit_num =3D tsc - OA_TC6_TTSCA_REG_ID;
> +		event =3D OA_TC6_STATUS0_TTSCAA << bit_num;

[Severity: High]
If an SKB is forwarded or tc-mirrored to this interface with the
SKBTX_IN_PROGRESS flag already set, its tsc will be 0. When tsc is 0,
bit_num becomes 255. Does this out-of-bounds shift result in undefined
behavior where event evaluates to 0, causing the SKB to evade the 3-slot
cap and leak indefinitely?

> +		if (!(val & event))
> +			continue;

[Severity: High]
Does this logic only handle successful events and lack a timeout mechanism?
If the MAC-PHY drops an outgoing packet or fails to transmit, it will not
generate a timestamp capture event. Since there are only 3 slots available,
would dropping 3 packets permanently exhaust the slots and break PTP until
a device reset?

[ ... ]
> +	if (val & ~handled) {
> +		tc6->tx_hwtstamp_err +=3D hweight32(val & ~handled);

[Severity: Medium]
This increment occurs outside of spin_lock_bh(&tc6->tx_skb_lock). Can this
lead to torn reads when ethtool reads the 64-bit tx_hwtstamp_err on 32-bit
systems without u64_stats_sync protection?

[ ... ]
> @@ -686,15 +900,28 @@ static void oa_tc6_disable_traffic(struct oa_tc6 *t=
c6)
> =20
>  static int oa_tc6_process_extended_status(struct oa_tc6 *tc6)
>  {
> +	u32 regs[OA_TC6_STATUS0_TTSC_REG_COUNT];
> +	bool ts_valid =3D !!tc6->ptp_clock;
>  	u32 value;
>  	int ret;
> =20
> -	ret =3D oa_tc6_read_register(tc6, OA_TC6_REG_STATUS0, &value);
> +	/* When timestamp is disabled, there is no behavior change
> +	 * as it reads only STATUS0 register. When enabled,
> +	 * TTSCA_HIGH..TTSCC_LOW are fetched together with STATUS0
> +	 * to avoid having to make second SPI transaction. Reading few
> +	 * extra registers, even it may not be needed every time this
> +	 * function is called, it is more efficient than making second
> +	 * SPI transaction, when needed.
> +	 */
> +	ret =3D oa_tc6_read_registers(tc6, OA_TC6_REG_STATUS0, regs,
> +				    ts_valid ?
> +				    OA_TC6_STATUS0_TTSC_REG_COUNT : 1);

[Severity: Medium]
Since ptp_clock merely indicates support and is set during probe, does this
cause an unnecessary bulk SPI read on extended status events even when
timestamping is actively disabled? Should this check tc6->hw_tstamp_enabled
instead of !!tc6->ptp_clock?

[ ... ]
> @@ -1081,17 +1332,30 @@ static void oa_tc6_add_tx_skb_to_spi_buf(struct o=
a_tc6 *tc6)
>  		tc6->tx_skb_offset =3D 0;
>  		tc6->netdev->stats.tx_bytes +=3D tc6->ongoing_tx_skb->len;
>  		tc6->netdev->stats.tx_packets++;
> -		kfree_skb(tc6->ongoing_tx_skb);
> +
> +		/* Free the ones that are not saved for later processing,
> +		 * like timestamping.
> +		 */
> +		if (!(skb_shinfo(tc6->ongoing_tx_skb)->tx_flags &
> +		    SKBTX_IN_PROGRESS)) {
> +			kfree_skb(tc6->ongoing_tx_skb);
> +		} else {
> +			spin_lock_bh(&tc6->tx_skb_lock);
> +			list_add_tail(&tc6->ongoing_tx_skb->list,
> +				      &tc6->tx_ts_skb_q);
> +			spin_unlock_bh(&tc6->tx_skb_lock);
> +		}

[Severity: Medium]
If ethtool is used to disable hardware timestamping while a packet with
SKBTX_IN_PROGRESS is in tc6->ongoing_tx_skb, timestamps will be disabled
and masked. Will adding this in-flight SKB to the tx_ts_skb_q queue cause
it to leak permanently since the completion event will never arrive?

[Severity: High]
Does trusting the SKBTX_IN_PROGRESS flag instead of checking if a tsc slot
was actually assigned (tsc !=3D 0) cause forwarded packets with the flag al=
ready
set to be enqueued and leaked?

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c b/drivers/net/et=
hernet/oa_tc6/oa_tc6_tstamp.c
> new file mode 100644
> index 0000000000000..d83f6ad9373a7
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c
[ ... ]
> +static int oa_tc6_set_hwtstamp_settings(struct oa_tc6 *tc6,
> +					const struct hwtstamp_config *ts_cfg)
> +{
[ ... ]
> +	/* The TX timestamp completion interrupt is masked now. Time
> +	 * to release the queued skbs.
> +	 */
> +	if (ts_cfg->tx_type !=3D HWTSTAMP_TX_ON)
> +		oa_tc6_cleanup_tx_tstamp_skbs(tc6);

[Severity: Medium]
This flushes tx_ts_skb_q, but does it fail to handle tc6->ongoing_tx_skb
which might be currently in flight and will later be unconditionally enqueu=
ed
to tx_ts_skb_q by oa_tc6_add_tx_skb_to_spi_buf()?

> +out:
> +	return ret;
> +}
[ ... ]
> +void oa_tc6_get_ts_stats(struct oa_tc6 *tc6,
> +			 struct ethtool_ts_stats *stats)
> +{
> +	stats->pkts =3D tc6->tx_hwtstamp_pkts;
> +	stats->err =3D tc6->tx_hwtstamp_err;
> +	stats->lost =3D tc6->tx_hwtstamp_lost;
> +}

[Severity: Medium]
These 64-bit values are updated by the SPI kernel thread and read here
concurrently from process context. Should these be protected with
u64_stats_sync to prevent torn reads on 32-bit architectures?

[ ... ]
> +int oa_tc6_get_ts_info(struct oa_tc6 *tc6,
> +		       struct kernel_ethtool_ts_info *info)
> +{
> +	if (!tc6->ptp_clock)
> +		return ethtool_op_get_ts_info(tc6->netdev, info);
> +
> +	info->so_timestamping =3D SOF_TIMESTAMPING_RAW_HARDWARE |
> +				SOF_TIMESTAMPING_TX_HARDWARE |
> +				SOF_TIMESTAMPING_RX_HARDWARE;

[Severity: Medium]
By overwriting info->so_timestamping, are the software timestamping flags
(SOF_TIMESTAMPING_SOFTWARE, SOF_TIMESTAMPING_TX_SOFTWARE,
SOF_TIMESTAMPING_RX_SOFTWARE) incorrectly omitted, falsely advertising that
software timestamps are not supported?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-s2500-mac-=
phy-support-v8-0-7e011aacc309@onsemi.com?part=3D5
