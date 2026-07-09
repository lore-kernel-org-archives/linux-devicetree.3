Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A039E19A
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617168; cv=none; b=rxvQWBCBd0IwVU6ko5xFAoR7sKfNgrbI0/AwJaduxo3uqv1gwWgFOaoCWWNOb+8ZNwXj+nvZmkG6w3iihXQQO7+x0cXOqQGVFH2SG9SnpG9ouT2AFD+on9ZoE70RkYuzeCGFLdxYLfB1fZdf0xItntyMLFAWPi/DPfcghnDhNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617168; c=relaxed/simple;
	bh=FqoBW7RAWFX082Z6VJGlo87g+wgcZwqCpTCnb43oA3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fklcx6n3dO41SjONyVN2KBzdAsssUlkaELf2P5SEl1Oit6N3C+vXiWwJoqSDDF8ts0Ec+HsHLodIuutuuitrN5kgweu90rYAV/38LmE3r2XTyP402YS3r54Cr5Fn/lUMezoigrsxbGqaufL4vYC+oUkD6cmF3G2G9QO6VXzVjEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZR8fh0Zq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZR8fh0Zq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E141F000E9;
	Thu,  9 Jul 2026 17:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617166;
	bh=yqPxBe7LCaCT4FqgLHbSPOBmT7E5TtTSnbZEdJF7eRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZR8fh0ZqVvsnmEXmB38fFLRagVPT7uEZSOLkJdqPRrKrIwitQil/SmZpM53RE9DPZ
	 9pk2ELzOj5745DTzjCyZ6TDi1qYhJ5O4tN23RibqJMBxLnyNn1ijGb60nKF36bsmRJ
	 G41tDAxokHZ6JTNDFryMwxrYr4RqyX6QLXh3lGUpb2y0VYfvsyhuV23Oisim/3y1I8
	 3RpR9N1xCnoIJb90hU6xmnGHiABxf09tW6Qu3nCphv/b+6exUIj854wgVgZdmJ1vPT
	 2kLImTRK3NYXRy7xeLlweF/URAUwZx06spup6pDwOMYj/6Utt/YH5h4fyx0OXvgrLm
	 bmyoPOy/+ixfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 08/15] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-s2500-mac-phy-support-v7-8-478c877aa1a9@onsemi.com>
References: <20260708-s2500-mac-phy-support-v7-0-478c877aa1a9@onsemi.com>
 <20260708-s2500-mac-phy-support-v7-8-478c877aa1a9@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:12:45 +0000
Message-Id: <20260709171246.34E141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Use-After-Free in TX path due to `tsc` wraparound in hardware time=
stamping queue.
- [High] Kernel panic due to storing and dereferencing `ERR_PTR` on PTP clo=
ck registration failure.
- [High] RX frame corruption and packet drops when hardware timestamping is=
 disabled or timestamp is invalid.
- [Medium] Incomplete updates to standard `kernel_hwtstamp_config` structur=
e and missing capabilities in ethtool info.
--

--- Patch [8]: [PATCH net-next v7 08/15] net: ethernet: oa_tc6: Support for=
 hardware timestamp ---
commit 731981c874dbe9e51dcf5c38facf74ebc8f25066
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Date:   Wed Jul 8 17:12:38 2026 +0000

    net: ethernet: oa_tc6: Support for hardware timestamp

This commit adds hardware timestamping support to the OPEN Alliance 10BASE-=
T1S
MAC-PHY Serial Interface framework. It implements PTP register/unregister
calls and provides ioctl and ethtool callbacks. Helper functions handle
header and footer timestamp data processing in the rx and tx paths.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6.c b/drivers/net/ethernet/=
oa_tc6/oa_tc6.c
> index bf96e8d1ccb9a..939935cb170d6 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
[ ... ]
> @@ -48,6 +57,156 @@ static int oa_tc6_get_parity(u32 p)
>  	return !((p >> 28) & 1);
>  }
> =20
[ ... ]
> +static int oa_tc6_process_deferred_skb(struct oa_tc6 *tc6, u8 tsc)
> +{
> +	struct skb_shared_hwtstamps tstamp;
> +	struct oa_tc6_ts_info_tx *ski;
> +	struct sk_buff *skb, *tmp;
> +	bool found =3D false;
> +	int ret =3D 0;
> +
> +	/* Size of data must match OA_TC6_TSTAMP_SZ */
> +	u32 data[2];
> +
> +	list_for_each_entry_safe(skb, tmp, &tc6->tx_ts_skb_q, list) {
> +		ski =3D oa_tc6_tsinfo_tx(skb);
> +		if (ski->tsc !=3D tsc)
> +			continue;
> +		if (found) {
> +			dev_warn_ratelimited(&tc6->spi->dev,
> +					     "Multiple skbs. tsc =3D %d\n",
> +					     tsc);
> +			tc6->tx_hwtstamp_err++;
> +		}
> +		found =3D true;
> +		list_del(&skb->list);
> +
> +		/* Retrieve the timestamping info */
> +		ret =3D oa_tc6_read_registers(tc6,
> +					    OA_TC6_REG_TTSCA_HIGH +
> +					    2 * (tsc - 1), &data[0], 2);
> +
> +		if (!ret) {
> +			tstamp.hwtstamp =3D ktime_set(data[0], data[1]);
> +			skb_tstamp_tx(skb, &tstamp);
> +			tc6->tx_hwtstamp_pkts++;
> +		}
> +
> +		dev_kfree_skb(skb);
> +	}

[Severity: High]
Can this loop free an SKB that is still actively being processed?

Looking at oa_tc6_defer_for_hwtstamp(), the hardware only provides 3
timestamp tracking IDs (tsc), and tx_ts_idx wraps around. If more than 3
packets are transmitted before the MAC-PHY generates interrupts, a newly
queued SKB could be forced to reuse the same tsc as an older waiting SKB.

When the interrupt fires, this loop doesn't stop after finding one match.
It will unconditionally free all SKBs matching the tsc. Could this free the
newly queued SKB while it is still referenced by tc6->ongoing_tx_skb and
actively being copied in oa_tc6_add_tx_skb_to_spi_buf(), triggering a
use-after-free?

> +	return ret;
> +}
[ ... ]
> +static void oa_tc6_update_ts_in_rx_skb(struct oa_tc6 *tc6)
> +{
> +	struct sk_buff *skb =3D tc6->rx_skb;
> +	struct oa_tc6_ts_info_rx *ski;
> +	__be32 ts_val[2];
> +	u32 ts[2];
> +
> +	if (!tc6->hw_tstamp_enabled)
> +		return;
> +	ski =3D oa_tc6_tsinfo_rx(skb);
> +	if (!ski->rtsa)
> +		return;
> +
> +	memcpy(&ts_val[0], skb->data, 4);
> +	memcpy(&ts_val[1], (u32 *)skb->data + 1, 4);
> +
> +	ts[0] =3D be32_to_cpu(ts_val[0]);
> +	ts[1] =3D be32_to_cpu(ts_val[1]);
> +
> +	/* Check parity */
> +	if ((oa_tc6_get_parity(ts[0]) ^ oa_tc6_get_parity(ts[1])) =3D=3D
> +	    !ski->rtsp) {
> +		struct skb_shared_hwtstamps *hw_ts;
> +
> +		/* Report timestamp to the upper layers */
> +		hw_ts =3D skb_hwtstamps(skb);
> +		memset(hw_ts, 0, sizeof(*hw_ts));
> +		hw_ts->hwtstamp =3D ktime_set(ts[0], ts[1]);
> +	}
> +	skb_pull(skb, sizeof(ts));
> +}

[Severity: High]
Will this cause frames to be corrupted if hardware timestamping is disabled?

When the MAC-PHY prepends the 8-byte timestamp to every frame, it appears
this function is responsible for removing it via skb_pull(). If
tc6->hw_tstamp_enabled is false, or if ski->rtsa is false, the function
returns early without pulling those 8 bytes. Does this leave 8 bytes of
garbage at the start of the payload that the network stack will misinterpret
as the Ethernet MAC header?

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_ptp.c b/drivers/net/ether=
net/oa_tc6/oa_tc6_ptp.c
> new file mode 100644
> index 0000000000000..0cde5545ee27a
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_ptp.c
[ ... ]
> +int oa_tc6_ptp_register(struct oa_tc6 *tc6, struct ptp_clock_info *info)
> +{
> +	/* Not supporting hardware timestamp isn't an error */
> +	if (!tc6->hw_tstamp_supported)
> +		return 0;
> +
> +	snprintf(info->name, sizeof(info->name), "%s",
> +		 "OA TC6 PTP clock");
> +	tc6->ptp_clock =3D ptp_clock_register(info, &tc6->spi->dev);
> +	if (IS_ERR(tc6->ptp_clock)) {
> +		dev_err(&tc6->spi->dev, "Registration of %s failed",
> +			info->name);
> +		return -EFAULT;
> +	}

[Severity: High]
Should tc6->ptp_clock be set to NULL on failure?

If ptp_clock_register() fails, it returns an ERR_PTR which is stored
directly into tc6->ptp_clock. Later, functions like oa_tc6_ptp_unregister()
or oa_tc6_get_ts_info() check if (tc6->ptp_clock) before using it. Since
an ERR_PTR is not NULL, they will attempt to dereference the error pointer,
which can cause a kernel panic.

> +	dev_info(&tc6->spi->dev, "%s registered. index %d", info->name,
> +		 ptp_clock_index(tc6->ptp_clock));
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c b/drivers/net/et=
hernet/oa_tc6/oa_tc6_tstamp.c
> new file mode 100644
> index 0000000000000..f80f1a4916a3e
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c
[ ... ]
> +int oa_tc6_hwtstamp_set(struct oa_tc6 *tc6,
> +			struct kernel_hwtstamp_config *cfg)
> +{
[ ... ]
> +	hwtstamp_config_from_kernel(&tc6->ts_config, cfg);
> +
> +	/* Supports timestamping all traffic */
> +	if (cfg->rx_filter !=3D HWTSTAMP_FILTER_NONE)
> +		tc6->ts_config.rx_filter =3D HWTSTAMP_FILTER_ALL;
> +	return oa_tc6_set_hwtstamp_settings(tc6);
> +}

[Severity: Medium]
Should this updated filter be copied back to the user configuration?

The standard network API expects the finalized configuration to be written
back to the caller-provided structure. If the filter is broadened to
HWTSTAMP_FILTER_ALL, does cfg->rx_filter need to be updated so that
the caller is aware of the applied state?

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
> +	info->phc_index =3D ptp_clock_index(tc6->ptp_clock);
> +	info->tx_types =3D BIT(HWTSTAMP_TX_ON);
> +	info->rx_filters =3D BIT(HWTSTAMP_FILTER_ALL);
> +	return 0;
> +}

[Severity: Medium]
Are we omitting the supported OFF and NONE capabilities here?

The info structure is unconditionally hardcoded to only the ON and ALL bits.
Since the interface supports having timestamping disabled, should
BIT(HWTSTAMP_TX_OFF) and BIT(HWTSTAMP_FILTER_NONE) be included to accurately
report the interface's capabilities to userspace tools like ethtool?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-s2500-mac-=
phy-support-v7-0-478c877aa1a9@onsemi.com?part=3D8
