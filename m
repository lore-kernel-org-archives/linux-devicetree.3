Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945188;
	b=2n85xmTs8FKYSiPjk6ghyl9W9LjaoHdwa7Jd0EAI2LQTGvtzzx+dEz5UMqD5ur2ztp3z
	 DRDzp6BQnoBehTJpEx2AP/nLnY/ul2WRa/So98c+hLkKe5BKqiLiqdYaE4H9h9Rj2jmiY
	 TjcCBgjWy59iyuskYBZX9gEBboQzXjnbtXG5Os8rISrHMGNo7U9ShC5+Yon22vEpoMW/X
	 0ewWS9Nxdz0EZydXRA3jYJl90gB5yOQpkdvAbBh23K0ZGubBtVd4IExahMeYOX2TXeyh9
	 97KgHoVswhXNszns4P8Cenot31yh6MiYPzhx7b9jBOe19h0rej3LMXmAlDVpCzBhU9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945188;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=n6rL6dfUJMPii8/2PP5He2jwvZ1ynmU0Ynpj9C87toQ=;
	b=oUwIGFkTlDHGIMuTA1HCdH/oVOOko8IjzG1qQqWgNEYhM+yWuFtiQ1v9U+xF2sLYMSdI
	 aMhQyt1RhBmEt//DLNSsjtzgEBb1KtYdVBk1Bj2XKmccYNTaoPUm7QhKffD7IYVN3+D6D
	 rnYRBQPZvyRCa75S91xNxASy6V2qEbKSTyNLzlzr+RSxlolNOJHT6UlyxQmnWolkSNVET
	 YfzIzJ0Ww5zGKAS+GW3JXtg3ePpIbx16s/tSAybB1VlZKIYaLO3F52sk6FJxuqWDBurhF
	 IkLP350SayLkYv+/KJPKNtCAETqWiEz6mie14IVD/a3Jz0P3CgzxTcDfC+sdG3KZT2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHzAuApS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C737606A89D;
	Tue, 17 Nov 2026 19:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHzAuApS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F06F1F000CF;
	Tue, 17 Nov 2026 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945187;
	bh=n6rL6dfUJMPii8/2PP5He2jwvZ1ynmU0Ynpj9C87toQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FHzAuApSM0La/Z5Sqmi8Gw0hxu0VLbK6HIcfSj5NrLPak3l2/KLZbeU56wVRCVXWG
	 H3crcitKQcVUhm42fWCRlF16DUOPKScFYavDHkCqBt4o3FxQUJDdwrUTeNbdrfWQxU
	 4NlPSqBDsgMOWP8GkuN8CquC9OlbAdXkmY16QDG1GzfhPXT7yFdk1LzOedRBm6GeE1
	 VZGnSuFhtdyB0oln0Hm1VxTZdG/NkXJIQ7BRwsrHufLBdn5JaSjX/s8qkzRDdEZZec
	 IfEak3Nm3WgHWG9swZO555kJHLcImv6QlcIfEIlZzPkXcda+RBAygfTrhDLHoiyJ07
	 tUXHoViUjbzQg==
Subject: Re: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
From: netdev-bot+sashiko@kernel.org
To: Selvamani.Rajagopal@onsemi.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 parthiban.veerasooran@microchip.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, richardcochran@gmail.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 edumazet@kernel.org, piergiorgio.beruto@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, jerry.ray@microchip.com, ciprian.regus@analog.com
Date: Tue, 17 Nov 2026 19:53:06 +0000
Message-ID: <179494518602.3136.1163755342884279987@kernel.org>
In-Reply-To: <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
References: <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The driver exposes a private `ethtool -S` counter
  "rx_mismatch_drops" (s2500_mac_stat_strings[] mapped through…
- [Medium] s2500_init() raises TXCTHRESH from the spec default (>=1
  credit) to >=8 credits.
- [Medium] The MAC statistic registers clear on read (as the driver's own
  comment says) and are 32 bits wide, except the two 64-bit octet pairs.
- [Medium] net: s2500: S2500_PTP_MAX_ADJ_PPB overflows 32-bit long
  scaled_ppm
- [Low] The S2500_MACPHY Kconfig adds `imply NET_SELFTESTS`, but this
  commit has no selftest consumer.
- [Low] s2500_set_mac_filter() reprograms unicast filter slot 0 without
  disabling it first.

--

net: ethernet: onsemi: s2500: Add driver support for S2500

This adds a driver for the onsemi S2500 10BASE-T1S MAC-PHY on top of the
OPEN Alliance TC6 framework, with PTP, ethtool MAC/RMON stats and
register dumps. It also adds oa_tc6_tx_credit_threshold_set() and an
OA_TC6_CONFIG_RX_CUT_THROUGH quirk to the framework, which the driver
uses to raise the TX credit threshold to 8 and enable RX cut-through.

> diff --git a/drivers/net/ethernet/onsemi/s2500/Kconfig b/drivers/net/ethernet/onsemi/s2500/Kconfig
> new file mode 100644
> index 0000000000000..4bd28dc560e64
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/Kconfig
> @@ -0,0 +1,20 @@

[ ... ]

> +config S2500_MACPHY
> +	tristate "S2500 support"
> +	depends on SPI
> +	depends on PTP_1588_CLOCK_OPTIONAL
> +	imply NET_SELFTESTS

[Severity: Low]
This isn't a bug, but does this patch need imply NET_SELFTESTS?
s2500_ethtool_ops has no .self_test in this patch. Also,
s2500_get_sset_count() and s2500_get_strings() don't handle ETH_SS_TEST
yet.

The next patch in the series ("net: ethernet: onsemi: s2500: Add selftest
support") adds .self_test = net_selftest and the ETH_SS_TEST handling.
Could the imply move to that patch too?

[ ... ]

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
> new file mode 100644
> index 0000000000000..2fc09107aed3e
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
> @@ -0,0 +1,379 @@

[ ... ]

> +static const char s2500_mac_stat_strings[][ETH_GSTRING_LEN] = {
> +	"rx_mismatch_drops",
> +};
> +
> +static const u8 s2500_mac_stat_map[S2500_NUM_MAC_STATS] = {
> +	S2500_MSTRXDROPPED_IDX,
> +};

[Severity: Medium]
Does "rx_mismatch_drops" duplicate a standard counter? It reports the
hardware count of frames dropped by the MAC address filter, and
include/uapi/linux/if_link.h documents rtnl_link_stats64 as:

 * @rx_otherhost_dropped: Number of packets dropped due to mismatch
 *   in destination MAC address.

s2500_netdev_ops has no .ndo_get_stats64, so userspace can only read this
value through the private ethtool -S string.

Could the cached counter be reported as rx_otherhost_dropped through
ndo_get_stats64, and the private string dropped? The string is still
there at the end of the series.

[ ... ]

> +static void s2500_update_stats(struct s2500_info *priv)
> +{
> +	u64 *data = priv->stats_data;
> +	u32 *regs, *rptr, addr;
> +	int ret;

[ ... ]

> +	ret = oa_tc6_read_registers(priv->tc6, addr, regs,
> +				    S2500_NUM_STAT_REGS);
> +	if (ret)
> +		goto out;
> +
> +	priv->stats_read_at = jiffies;
> +	rptr = regs;
> +
> +	/* Counters are cleared by the hardware when read, so each read
> +	 * returns only the delta since the previous read. Hence the
> +	 * values are accumulated.

[ ... ]

> +	for (rptr += 2; (rptr - regs) < S2500_NUM_STAT_REGS; ++rptr)
> +		*(data++) += *rptr;
> +out:
> +	kfree(regs);
> +}

[Severity: Medium]
Can the 32-bit hardware counters wrap before anything reads them?
s2500_update_stats() is the only reader of these clear-on-read registers,
and it runs only when userspace queries ethtool stats. No delayed work or
timer reads them on a schedule.

At 10 Mb/s with minimum-size frames (about 14,881 frames/s), a 32-bit
frame counter fills in roughly 2^32 / 14881 seconds, about 80 hours. If
nobody queries stats in that time, the totals in priv->stats_data[] lose
counts without any warning. That covers FramesReceivedOK, the broadcast
and multicast counters, the histogram bins and the error counters.

A smaller, related point: oa_tc6_read_registers() can fail after the SPI
transfer completes, for example with -EPROTO from the header echo check.
The goto out path then throws away deltas the device has already cleared.
The data may not be reliable in that case anyway.

Do these counters need to be read periodically, for example from delayed
work?

[ ... ]

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_main.c b/drivers/net/ethernet/onsemi/s2500/s2500_main.c
> new file mode 100644
> index 0000000000000..f176475cfd7ed
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_main.c
> @@ -0,0 +1,498 @@

[ ... ]

> +/* Writes MAC address to macphy registers */
> +static int s2500_set_mac_filter(struct net_device *ndev, const u8 *mac)
> +{

[ ... ]

> +	val = get_unaligned_be32(&mac[2]);
> +
> +	ret = oa_tc6_write_register_mms(priv->tc6, mms,
> +					S2500_REG_MAC_ADDRFILTL(0),
> +					val);
> +	if (ret)
> +		return ret;
> +
> +	val = S2500_MAC_ADDRFILT_ENABLE | get_unaligned_be16(mac);
> +
> +	return oa_tc6_write_register_mms(priv->tc6, mms,
> +					 S2500_REG_MAC_ADDRFILTH(0),
> +					 val);
> +}

[Severity: Low]
Slot 0 stays enabled while ADDRFILTL(0) is rewritten. For a short time
the hardware matches the old high 16 bits plus the new low 32 bits,
which is neither address.

If the final ADDRFILTH(0) write fails, s2500_set_mac_address() returns
before eth_hw_addr_set():

	ret = s2500_set_mac_filter(ndev, addr->sa_data);
	if (ret)
		return ret;

	eth_hw_addr_set(ndev, addr->sa_data);

Could dev_addr then keep showing the old address while the hardware
filter holds the mixed one, so unicast reception stops?

s2500_set_multicast_mode() already clears ADDRFILTH first and enables the
slot last. Would the same order work for slot 0?

[ ... ]

> +static int s2500_init(struct s2500_info *priv)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Configure MAC-PHY's behavior */
> +	ret = oa_tc6_tx_credit_threshold_set(priv->tc6,
> +					     OA_TC6_CONFIG0_TXCTHRESH_8);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Can this threshold stall transmit? The framework only learns about new
TX credits from a data footer or after an IRQ. Once the cached tx_credits
reaches 0, the loop in oa_tc6_macphy_threaded_irq() stops:

	while (tc6->int_flag ||
	       (tc6->waiting_tx_skb && tc6->tx_credits)) {

The irq_wake_thread() call from oa_tc6_start_xmit() doesn't help, since
tx_credits is still 0.

oa_tc6_prepare_spi_tx_buf_for_tx_skbs() uses every available credit, so
it can stop partway through a frame. Only RX cut-through is enabled, so
that partial frame can't leave the MAC-PHY buffer. Only the complete
frames queued ahead of it can free credits.

If those frames add up to fewer than 8 chunks, for example one or two
small frames, free credits never reach the threshold. IRQn then never
asserts for TX, and the queue stays stopped until unrelated RX traffic
arrives. s2500 has no ndo_tx_timeout to recover.

This depends on the S2500 TX buffer size. It looks like it needs a buffer
of about 30 chunks or fewer, since a max-size frame takes about 24 chunks
and the threshold is 8.

What is the S2500 TX buffer size? Could the commit message explain why
8 credits is safe?

[ ... ]

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c b/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2026 Semiconductor Components Industries, LLC ("onsemi").
> + * onsemi's S2500 10BASE-T1S MAC-PHY driver
> + */
> +
> +#include "s2500_hw_def.h"
> +
> +static int s2500_ptp_get_time64(struct ptp_clock_info *ptp,
> +				struct timespec64 *ts,
> +				struct ptp_system_timestamp *ptp_sts)
> +{
> +	struct s2500_info *priv = container_of(ptp, struct s2500_info,
> +					       ptp_clock_info);
> +	u32 data[2];
> +	u32 addr;
> +	int ret;
> +
> +	ptp_read_system_prets(ptp_sts);
> +	addr = FIELD_PREP(S2500_REG_MMS_MASK, S2500_VS_MMS12) |
> +			  S2500_REG_VS_PTP_SEC;
> +	ret = oa_tc6_read_registers(priv->tc6, addr, &data[0], 2);
> +	ptp_read_system_postts(ptp_sts);
> +
> +	if (!ret) {
> +		ts->tv_sec = data[0];
> +		ts->tv_nsec = data[1];
> +	}
> +
> +	return ret;
> +}
> +
> +static int s2500_ptp_write_time(struct s2500_info *priv,
> +				const struct timespec64 *ts)
> +{
> +	u32 data[2];
> +	u32 addr;
> +
> +	lockdep_assert_held(&priv->ptp_adj_lock);
> +
> +	if (ts->tv_sec >= (1ULL << 32))
> +		return -ERANGE;
> +
> +	data[0] = (u32)ts->tv_sec;
> +	/* bit 31 = execute set command */
> +	data[1] = ts->tv_nsec | BIT(31);
> +	addr = FIELD_PREP(S2500_REG_MMS_MASK, S2500_VS_MMS12) |
> +			  S2500_REG_VS_PTP_SETSEC;
> +
> +	return oa_tc6_write_registers(priv->tc6, addr, &data[0], 2);
> +}
> +
> +static int s2500_ptp_set_time64(struct ptp_clock_info *ptp,
> +				const struct timespec64 *ts)
> +{
> +	struct s2500_info *priv = container_of(ptp, struct s2500_info,
> +					       ptp_clock_info);
> +	int ret;
> +
> +	mutex_lock(&priv->ptp_adj_lock);
> +	ret = s2500_ptp_write_time(priv, ts);
> +	mutex_unlock(&priv->ptp_adj_lock);
> +
> +	return ret;
> +}
> +
> +static int s2500_ptp_set_freq(struct s2500_info *priv, long scaled_ppm)
> +{
> +	u32 sign_bit = 0;
> +	u64 adj;
> +	u32 val;
> +
> +	if (diff_by_scaled_ppm(S2500_PTP_ADJ_BASE, scaled_ppm, &adj))
> +		sign_bit = 1U << 31;
> +
> +	/* check overflow */
> +	if (adj > S2500_PTP_ADJ_MAX)
> +		return -ERANGE;
> +
> +	val = (u32)adj | sign_bit;
> +	return oa_tc6_write_register_mms(priv->tc6, S2500_VS_MMS12,
> +					 S2500_REG_VS_PTP_ADJ, val);
> +}
> +
> +static int s2500_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
> +{
> +	struct s2500_info *priv = container_of(ptp, struct s2500_info,
> +					       ptp_clock_info);
> +
> +	return s2500_ptp_set_freq(priv, scaled_ppm);
> +}
> +
> +static int s2500_ptp_step_time(struct s2500_info *priv, s64 delta)
> +{
> +	struct timespec64 target, now, delta_ts;
> +	ktime_t start;
> +	s64 elapsed;
> +	int ret;
> +
> +	start = ktime_get_raw();
> +	ret = s2500_ptp_get_time64(&priv->ptp_clock_info, &now, NULL);
> +	if (ret)
> +		return ret;
> +	if (delta >= 0) {
> +		delta_ts = ns_to_timespec64(delta);
> +		target = timespec64_add(now, delta_ts);
> +	} else {
> +		delta_ts = ns_to_timespec64(-delta);
> +		target = timespec64_sub(now, delta_ts);
> +	}
> +
> +	/* Adjust the time to take the SPI transaction time into
> +	 * account.
> +	 */
> +	elapsed = ktime_to_ns(ktime_sub(ktime_get_raw(), start));
> +	timespec64_add_ns(&target, elapsed);
> +
> +	/* The subtraction above can take the target below the epoch */
> +	if (target.tv_sec < 0)
> +		return -ERANGE;
> +	return s2500_ptp_write_time(priv, &target);
> +}
> +
> +static int s2500_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
> +{
> +	struct s2500_info *priv = container_of(ptp, struct s2500_info,
> +					       ptp_clock_info);
> +	int ret;
> +
> +	/* Nothing to do */
> +	if (delta == 0)
> +		return 0;
> +
> +	/* The device has no add-delta register, so the offset is applied as
> +	 * a read-modify-write of the time registers.
> +	 */
> +	mutex_lock(&priv->ptp_adj_lock);
> +	ret = s2500_ptp_step_time(priv, delta);
> +	mutex_unlock(&priv->ptp_adj_lock);
> +
> +	return ret;
> +}
> +
> +int s2500_ptp_register(struct s2500_info *priv)
> +{
> +	struct ptp_clock_info *info = &priv->ptp_clock_info;
> +
> +	info->max_adj = S2500_PTP_MAX_ADJ_PPB;
> +	info->owner = THIS_MODULE;
> +	info->adjfine = s2500_ptp_adjfine;
> +	info->gettimex64 = s2500_ptp_get_time64;
> +	info->settime64 = s2500_ptp_set_time64;
> +	info->adjtime = s2500_ptp_adjtime;
> +
> +	return oa_tc6_ptp_register(priv->tc6, info);
> +}

[Severity: Medium]
Can max_adj be larger than the PTP core can pass through on 32-bit?
S2500_PTP_MAX_ADJ_PPB is GENMASK(27, 0) / 8, which is 33,554,431 ppb.
ptp_clock_adjtime() converts tx->freq with scaled_ppm_to_ppb() and then
calls ->adjfine(). Both take the scaled_ppm value as a long:

	long ppb = scaled_ppm_to_ppb(tx->freq);
	if (ppb > ops->max_adj || ppb < -ops->max_adj)
		return -ERANGE;
	err = ops->adjfine(ops, tx->freq);

On a 32-bit kernel, LONG_MAX scaled_ppm is only about 32,767,999 ppb.
max_adj advertises requests between +32,768,000 and +33,554,431 ppb as
valid, but their scaled_ppm value truncates to a negative long. The
result still lands inside [-max_adj, max_adj]. s2500_ptp_set_freq()
then gets a large negative scaled_ppm, and diff_by_scaled_ppm()
programs S2500_REG_VS_PTP_ADJ in the opposite direction from the
request. The clock runs away from its reference instead of catching
up.

At the other end, scaled_ppm == LONG_MIN (-32,768,000 ppb) can't be
negated in diff_by_scaled_ppm(). The result sign-extends to a huge u64,
adj exceeds S2500_PTP_ADJ_MAX, and the request fails with -ERANGE even
though it is within the advertised range.

This only affects 32-bit kernels. On 64-bit, a long holds the full
range.

Would it make sense to cap max_adj to what a 32-bit scaled_ppm can
represent, for example 32,767,999 ppb? Or is there a reason the full
28-bit range of the register needs to be exposed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-s2500-mac-phy-support-v11-0-7a186141952c%40onsemi.com
