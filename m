Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675579;
	b=PDP85Vg51AimUEpdtnjH/0n0Saf7btSjvGKlZbApA7JLI81FYVlZNrtijIjVg78MrRrQ
	 znBrTz0TBYWgNOeQ23RTSpfXhyzD5kMB3npA8G5Rx//+J2YmG0G5du2FZuOdzXjfr/1eU
	 3Xg1ZaHrqwtqLunU8WlACWqFgPgeYuArhG757bn/z8vD14zbVjbWQn8ImKw/iGwdlTPV2
	 uc2p74NL5bwmAx4XMU7vE9P0WuXcnXYovnTM48Zzvtpv4ldQA+898iPf3lD2mif+LZtTm
	 zEK+kK+aDHCp3U7tFvFPbKIvFaE0sm3+gbcHjm+Z+5JBEicVcS+++ymvj0GSMfAOO9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675579;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bj5lWIR+O/mL6gOlYE2QikjFE0gY3Qww3R0KhwayJ84=;
	b=sqzEde6hCf54sVArs3E4/fvoIj6C99ZZopDc9mrQfiObMJIlx+67fkHDhVNpL+kyvFqZ
	 dSjkWna8p+4hnIsMaUe/VQG7Ogi+h+TxM9Bk6Aef0XICL+FTTEDnWNMKZ7ZfwwjLEbeu/
	 x+9i/GpOGRGz3VmomBtMBr71QDeKmM/8q/zdTh+tRLFrzbJYahJbqwWvp/cdAdW2SrR93
	 aefVy9wfbt1OGzRFP4yyOhh/s8+TKuYKGh/LjQeaEYC49rnSDt5/q0KwBIi85o9AMPUtC
	 ZZ0Jp7W+mwTX6Q75Ep2YCdqlj93KYkhv/oWUq+ws57DvF0fMGYSa4ueAgrfFSolEgpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGPCj7VW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDE3606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGPCj7VW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B9E1F000C4;
	Sat, 14 Nov 2026 16:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794675579;
	bh=bj5lWIR+O/mL6gOlYE2QikjFE0gY3Qww3R0KhwayJ84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGPCj7VW/kqWc3uzKcFU5DnVzy15LH4OkAUptSeUgmEIY+Z3cRExnFQa73vKO8ykE
	 nFH74dvhpti/gXAov9XoPtrnGihhIt8ga8FjleP6VfglteI6UdEiEEL0AlWq6LAskg
	 k71jFGsAVdCehdHDM30gJMjwULJKgjp439YKzpMqTmtYTnVHUQV3OWBlqlkbSzbgi9
	 XGCYPxX9mMrKlBm+uQeM2nUIJANKxlLOH1dvkqZJjzHN99zNiI7U0hMcw689r3HcCp
	 etl7nDGyhrmlYSOohTJ2OCmWcd22w6ZGTz9riIZpZFi1I5D74DQOGPNKfbESYXD8iB
	 M4ZfEmJLzby3w==
Message-ID: <sashiko-outbox-214800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 07/14] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-s2500-mac-phy-support-v11-7-7a186141952c@onsemi.com>
References: <20261113-s2500-mac-phy-support-v11-0-7a186141952c@onsemi.com>
 <20261113-s2500-mac-phy-support-v11-7-7a186141952c@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 16:59:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] net: oa_tc6: unreleased TTSC slots in
  oa_tc6_req_tx_hwtstamp() wedge TX
- [Medium] net: oa_tc6: partial state update in
  oa_tc6_set_hwtstamp_settings() on error
- [Medium] net: oa_tc6: race and partial update in
  oa_tc6_set_hwtstamp_settings()
- [Low] net: oa_tc6: unlocked 64-bit stats access in
  oa_tc6_get_ts_stats()
--

commit e0da8a70d844cec71943991d3a812fc7925cd09a
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for hardware timestamp

This commit adds hardware timestamping and PTP clock registration helpers
to the OPEN Alliance TC6 10BASE-T1x MAC-PHY framework.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethe=
rnet/oa_tc6/oa_tc6_main.c
> index 341d13c97f91f..2b31370da2d2b 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
[ ... ]
> @@ -49,6 +60,212 @@ static int oa_tc6_get_parity(u32 p)
>  	return !((p >> 28) & 1);
>  }
> =20
[ ... ]
> +static bool oa_tc6_req_tx_hwtstamp(struct oa_tc6 *tc6, struct sk_buff *s=
kb)
> +{
> +	u8 tsc;
> +	u8 i;
> +
> +	lockdep_assert_held(&tc6->tx_skb_lock);
> +
> +	if (!skb || !(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
> +		return false;
> +
> +	if (!tc6->hw_tstamp_enabled ||
> +	    tc6->ts_config.tx_type !=3D HWTSTAMP_TX_ON)
> +		return false;
> +
> +	tsc =3D tc6->ttsc_current_id;
> +	for (i =3D 0; i < OA_TC6_TTSCC_REG_ID; i++) {
> +		if (!(tc6->ts_ttsc_pending &
> +		      BIT(tsc - OA_TC6_TTSCA_REG_ID)))
> +			goto slot_found;
> +		tsc =3D oa_tc6_next_tsc(tsc);
> +	}
> +
> +	/* All the three slots are waiting for their event. This skb
> +	 * can't request timestamp. Marking it to be dropped.
> +	 */
> +	tc6->tx_hwtstamp_err++;
> +	return true;
> +
> +slot_found:
> +	tc6->ts_ttsc_pending |=3D BIT(tsc - OA_TC6_TTSCA_REG_ID);
> +	tc6->ttsc_current_id =3D oa_tc6_next_tsc(tsc);
> +	oa_tc6_tsinfo_tx(skb)->tsc =3D tsc;
> +	skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> +	return false;
> +}

[Severity: Medium]
Can unreleased slots in tc6->ts_ttsc_pending permanently wedge TX hardware
timestamping?

Once a frame is queued on tc6->tx_ts_skb_q, its bit in
tc6->ts_ttsc_pending is only cleared during normal operation when the
MAC-PHY signals a capture in OA_TC6_REG_STATUS0.  If a frame buffered in
the MAC-PHY is aborted on the medium or flushed when the interface stops,
no capture event arrives and there is no timeout or ndo_stop cleanup to
reclaim the slot.

After three lost captures, all three bits stay set, causing
oa_tc6_req_tx_hwtstamp() to fail and oa_tc6_prepare_spi_tx_buf_for_tx_skbs()
to drop every subsequent SKBTX_HW_TSTAMP packet while the old skbs remain
pinned on tc6->tx_ts_skb_q.  Restarting the PTP daemon with HWTSTAMP_TX_ON
will not recover either because oa_tc6_set_hwtstamp_settings() returns
early when the requested config matches tc6->ts_config.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c b/drivers/net/et=
hernet/oa_tc6/oa_tc6_tstamp.c
> new file mode 100644
> index 0000000000000..b3cc032311a9d
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c
> @@ -0,0 +1,224 @@
[ ... ]
> +static int oa_tc6_set_hwtstamp_settings(struct oa_tc6 *tc6,
> +					const struct hwtstamp_config *ts_cfg)
> +{
> +	u32 regs[CFG0_TO_IMASK0_REG_COUNT];
> +	u32 cfg0, irqm, status0;
> +	bool disabled;
> +	int ret;
> +
> +	if (tc6->ts_config.flags =3D=3D ts_cfg->flags &&
> +	    tc6->ts_config.tx_type =3D=3D ts_cfg->tx_type &&
> +	    tc6->ts_config.rx_filter =3D=3D ts_cfg->rx_filter)
> +		return 0;
> +
> +	spin_lock_bh(&tc6->tx_skb_lock);
> +	disabled =3D tc6->disable_traffic;
> +	spin_unlock_bh(&tc6->tx_skb_lock);
> +	if (disabled)
> +		return -EIO;
> +
> +	/* CONFIG0, STATUS0 and INT_MASK0 span one register block, so a
> +	 * single control transaction covers all three.
> +	 */
> +	ret =3D oa_tc6_read_registers(tc6, OA_TC6_REG_CONFIG0, regs,
> +				    ARRAY_SIZE(regs));
> +	if (ret) {
> +		dev_err(&tc6->spi->dev, "Failed to read CFG0 block\n");
> +		goto out;
> +	}
> +
> +	cfg0 =3D regs[CFG0_VAL_OFFSET];
> +	status0 =3D regs[STATUS0_VAL_OFFSET];
> +	irqm =3D regs[IRQM_VAL_OFFSET];
> +
> +	/* Hardware timestamp feature supports 64-bit timestamp only */
> +	if (ts_cfg->tx_type =3D=3D HWTSTAMP_TX_ON ||
> +	    ts_cfg->rx_filter =3D=3D HWTSTAMP_FILTER_ALL)
> +		cfg0 |=3D (OA_TC6_CONFIG0_FTSE_ENABLE |
> +			 OA_TC6_CONFIG0_FTSS_64BIT_TSTAMP);
> +	else
> +		cfg0 &=3D ~OA_TC6_CONFIG0_FTSE_ENABLE;
> +
> +	if (ts_cfg->tx_type =3D=3D HWTSTAMP_TX_ON)
> +		irqm &=3D ~OA_TC6_INT_MASK0_TTSCA_MASK;
> +	else
> +		irqm |=3D OA_TC6_INT_MASK0_TTSCA_MASK;
> +
> +	/* STATUS0 is write-one-to-clear, so this acknowledges a capture
> +	 * without delivering its timestamp. Skip it while TX timestamping
> +	 * stays enabled, where a capture may still be outstanding.
> +	 */
> +	status0 &=3D OA_TC6_STATUS0_TTSCA_MASK;
> +	if (status0 && (tc6->ts_config.tx_type !=3D HWTSTAMP_TX_ON ||
> +			ts_cfg->tx_type !=3D HWTSTAMP_TX_ON)) {
> +		ret =3D oa_tc6_write_register(tc6, OA_TC6_REG_STATUS0,
> +					    status0);

[Severity: Medium]
Can oa_tc6_set_hwtstamp_settings() race with the threaded IRQ handler when
disabling TX hardware timestamping or disabling traffic?

CPU0                                  CPU1 (oa_tc6_macphy_threaded_irq)
oa_tc6_set_hwtstamp_settings()
  oa_tc6_read_registers(CONFIG0..)
  oa_tc6_write_register(STATUS0)
                                      oa_tc6_prepare_spi_tx_buf_for_tx_skbs=
()
                                        oa_tc6_req_tx_hwtstamp()
                                          /* hw_tstamp_enabled still true */
                                      /* frame transmits, latches TTSCA
                                       * in STATUS0 */
  oa_tc6_write_register(INT_MASK0)
  oa_tc6_write_register(CONFIG0)
  spin_lock_bh(&tc6->tx_skb_lock)
  tc6->ts_config =3D *ts_cfg
  spin_unlock_bh(&tc6->tx_skb_lock)
  oa_tc6_cleanup_tx_tstamp_skbs()
    tc6->ts_ttsc_pending =3D 0
                                      oa_tc6_process_extended_status()
                                        oa_tc6_events_handle()
                                          /* unmatched TTSCA bit ->
                                           * Unexpected event warning */

Because tc6->ts_config and tc6->hw_tstamp_enabled are updated only after
the blocking SPI register reads and writes, the threaded IRQ can keep
allocating TTSC slots and latching new capture bits in OA_TC6_REG_STATUS0
after STATUS0 was sampled and cleared.  Once oa_tc6_cleanup_tx_tstamp_skbs()
empties tc6->tx_ts_skb_q, those late captures trigger false unexpected
event warnings and increment tx_hwtstamp_err, or can be matched to a newly
queued skb if TX timestamping is re-enabled before STATUS0 is read.

In addition, tc6->disable_traffic is only checked before the SPI reads, so
if oa_tc6_disable_traffic() runs concurrently on CPU1 and writes
OA_TC6_INT_MASK0_ALL_INTERRUPTS to OA_TC6_REG_INT_MASK0, CPU0 can
overwrite OA_TC6_REG_INT_MASK0 with its stale irqm value and re-enable
interrupts.

> +		if (ret) {
> +			dev_err(&tc6->spi->dev,
> +				"failed to write STATUS0 register\n");
> +			goto out;
> +		}
> +	}
> +
> +	ret =3D oa_tc6_write_register(tc6, OA_TC6_REG_INT_MASK0, irqm);
> +	if (ret) {
> +		dev_err(&tc6->spi->dev, "failed to write IRQM register\n");
> +		goto out;
> +	}
> +
> +	ret =3D oa_tc6_write_register(tc6, OA_TC6_REG_CONFIG0, cfg0);
> +	if (ret) {
> +		dev_err(&tc6->spi->dev, "failed to write CFG0 register\n");
> +		goto out;
> +	}
> +	spin_lock_bh(&tc6->tx_skb_lock);
> +	tc6->ts_config =3D *ts_cfg;
> +	if (cfg0 & OA_TC6_CONFIG0_FTSE_ENABLE)
> +		tc6->hw_tstamp_enabled =3D true;
> +	else
> +		tc6->hw_tstamp_enabled =3D false;
> +	spin_unlock_bh(&tc6->tx_skb_lock);
> +
> +	/* The TX timestamp completion interrupt is masked now. Time
> +	 * to release the queued skbs.
> +	 */
> +	if (ts_cfg->tx_type !=3D HWTSTAMP_TX_ON)
> +		oa_tc6_cleanup_tx_tstamp_skbs(tc6);
> +out:
> +	return ret;
> +}

[Severity: Medium]
If writing OA_TC6_REG_INT_MASK0 or OA_TC6_REG_CONFIG0 fails when turning
off TX timestamping, does jumping to out strand queued skbs in
tc6->tx_ts_skb_q and leave hardware and software state out of sync?

At that point OA_TC6_REG_STATUS0 has already been cleared (and
OA_TC6_REG_INT_MASK0 has already masked TTSCA interrupts if the
OA_TC6_REG_CONFIG0 write fails), but the error path skips
oa_tc6_cleanup_tx_tstamp_skbs() and leaves tc6->ts_config.tx_type set to
HWTSTAMP_TX_ON.  Any in-flight skbs whose capture bits were cleared or
masked will never complete, leaking their TTSC slots until all three slots
fill and subsequent timestamped TX packets are dropped.

[ ... ]

> +void oa_tc6_get_ts_stats(struct oa_tc6 *tc6,
> +			 struct ethtool_ts_stats *stats)
> +{
> +	stats->pkts =3D tc6->tx_hwtstamp_pkts;
> +	stats->err =3D tc6->tx_hwtstamp_err;
> +	stats->lost =3D tc6->tx_hwtstamp_lost;
> +}

[Severity: Low]
Can oa_tc6_get_ts_stats() read torn 64-bit values on 32-bit architectures?

tx_hwtstamp_pkts, tx_hwtstamp_err, and tx_hwtstamp_lost are plain u64
fields updated under tc6->tx_skb_lock (except in oa_tc6_events_handle(),
where tc6->tx_hwtstamp_err +=3D hweight32(val & ~handled) runs after
spin_unlock_bh(&tc6->tx_skb_lock)), while oa_tc6_get_ts_stats() reads them
without holding tc6->tx_skb_lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-s2500-mac-=
phy-support-v11-0-7a186141952c@onsemi.com?part=3D7
