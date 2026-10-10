Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC4D298CAB
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652355; cv=none; b=niHuTnCzUhreSiAQb46nUx58hcyRk56LxSZ8/QOBXdHHng4/2FA8NfOMdX7QAuIXPSfT6Put9LuRyvcLTAqvAbgyuh4iTzgSi185YvZXahYnYPGM/jPeR5W6S7csG96WM5XKvW7Gs3H5A/vfIIZP6cL98Ku30goKcG62KvIxf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652355; c=relaxed/simple;
	bh=AuhSJG3jxEO6AhGSvfYfkj0c2AIjL7j2QSo1cgfsdqE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=M9E0i7BgXYj/2zwza1DCJc57nlP2TCv6ZtQK2+3ZdYoXOadz1VQHODJ+HO0hiX8FkaXigJpBqQGw+vn57KquiMijUvD8tz51Lt/vU6Jh7cerAkix6SMKIko0/5oQMAxow8dmdvqEkNsfjNVTHaiezfqInVED9IjSeCetpg8Xia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibKN7vQ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibKN7vQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC7D1F000FF;
	Sat, 10 Oct 2026 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791652353;
	bh=qvm8aF/SIOH8FVyZPEA2pjF7BxmMXutldjilziY91BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ibKN7vQ1w3G1z4YdHTkbAeMtcica2IcfL8yIyjB7vrQjiflfzQ3gCKfysQgUEsDCr
	 sgdZ8fO0GIYV/eeitd6fPCgJd8bmw8yH5zP7Q4Vst4Z2eU8mOb/C/AYSJyS5di3CE4
	 X/MC06i520tmXhcZ9ANsszxgMM/QxvaTroVQ/iiqmhwIvQG4bULsIuFHnYMHeJuzkp
	 Rw3o1imMTk/OAYbiDm4EUmPjQnck+V6aSTshlaD4+md6LBezDk2XuSslcCnXHtCdBm
	 EI50KwF5JEaVt+z2xayoeTvTs6cs7zGxmJXg/CNMPVl9oRbXk/t/+H2BRbbpZTgBnC
	 MaZe6fkkNX6Lg==
Message-ID: <sashiko-outbox-166770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 05/11] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261009-s2500-mac-phy-support-v9-5-dcefe1d0bf0d@onsemi.com>
References: <20261009-s2500-mac-phy-support-v9-0-dcefe1d0bf0d@onsemi.com>
 <20261009-s2500-mac-phy-support-v9-5-dcefe1d0bf0d@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:12:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] net/oa_tc6: Register address byte offsets incorrectly used as =
array indices
- [High] net/oa_tc6: Uninitialized stack memory leaked to userspace on PTP =
unregister
- [High] net/oa_tc6: TOCTOU race in HWTSTAMP settings unmasks interrupts
- [Medium] net/oa_tc6: Torn reads on 64-bit network statistics on 32-bit sy=
stems
- [Medium] net/oa_tc6: Software timestamping capabilities missing from etht=
ool_ts_info
--

commit cece325e67d27c0cabf74363748b31e08221ae18
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for hardware timestamp

This commit adds hardware timestamping capabilities to the OA TC6 framework.
It introduces PTP registration, ethtool callbacks, and handles timestamp
capture registers within the data path.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6.c b/drivers/net/ethernet/=
oa_tc6/oa_tc6.c
> index f8e9309a72f11..0b6e216de8a1b 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
[ ... ]
> @@ -50,6 +61,193 @@ static int oa_tc6_get_parity(u32 p)
[ ... ]
> +static void oa_tc6_events_handle(struct oa_tc6 *tc6, u32 val, const u32 =
*ts)
> +{
[ ... ]
> +		tc6->ts_ttsc_pending &=3D ~BIT(bit_num);
> +
> +		ski->hwtstamp =3D ktime_set(ts[2 * bit_num],
> +					  ts[2 * bit_num + 1]);
> +		tc6->tx_hwtstamp_pkts++;
[Severity: Medium]
Is it possible to experience torn reads on this 64-bit statistic on 32-bit
systems?=20

Since this is incremented in a threaded IRQ and read locklessly in=20
oa_tc6_get_ts_stats(), it appears this counter and the related err/lost
counters might require the u64_stats_sync infrastructure to prevent returni=
ng
corrupted values to userspace on 32-bit architectures.

> +		list_move_tail(&skb->list, &deliver);
> +	}
> +	spin_unlock_bh(&tc6->tx_skb_lock);
[ ... ]
> @@ -686,15 +897,28 @@ static void oa_tc6_disable_traffic(struct oa_tc6 *t=
c6)
[ ... ]
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
>  	if (ret) {
>  		netdev_err(tc6->netdev, "STATUS0 register read failed: %d\n",
>  			   ret);
>  		return ret;
>  	}
> +	value =3D regs[0];
> =20
>  	/* This function is called for each chunk received in a given SPI
>  	 * transaction. In case, extended status bit is set in more than
> @@ -703,6 +927,11 @@ static int oa_tc6_process_extended_status(struct oa_=
tc6 *tc6)
>  	if (!value)
>  		return 0;
> =20
> +	if ((value & OA_TC6_STATUS0_TTSCA_MASK) !=3D 0)
> +		oa_tc6_events_handle(tc6, value &
> +				     OA_TC6_STATUS0_TTSCA_MASK,
> +				     &regs[OA_TC6_TTSC_REG_OFFSET]);

[Severity: High]
Can this sequence leak uninitialized stack memory to userspace?

If oa_tc6_ptp_unregister() is called, tc6->ptp_clock is set to NULL, which
makes ts_valid evaluate to false. This means only 1 register is read into
the regs array.=20

However, if a pending hardware timestamp event fires shortly after, the
event bit in OA_TC6_STATUS0_TTSCA_MASK might still be set. This would result
in oa_tc6_events_handle() receiving a pointer to the uninitialized portion =
of
the regs stack array (&regs[OA_TC6_TTSC_REG_OFFSET]), which is then
interpreted as a ktime_t and passed up to userspace via skb_tstamp_tx().

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h b/drivers/net/e=
thernet/oa_tc6/oa_tc6_std_def.h
> index 403a9c22b5f14..92e936a18490b 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
[ ... ]
> @@ -70,6 +76,33 @@
> =20
>  #define OA_TC6_REG_MMS_MASK		GENMASK(19, 16)
> =20
> +#define OA_TC6_TSTAMP_SZ			8
> +
> +#define OA_TC6_TTSCA_REG_ID			1
> +#define OA_TC6_TTSCB_REG_ID			2
> +#define OA_TC6_TTSCC_REG_ID			3
> +
> +/* STATUS0 and the TTSCA/B/C capture registers are contiguous in MMS 0, =
so
> + * they are fetched with a single control transaction while timestamping=
 is
> + * available.
> + */
> +#define OA_TC6_TTSC_REG_OFFSET		(OA_TC6_REG_TTSCA_HIGH - \
> +					 OA_TC6_REG_STATUS0)
> +#define OA_TC6_TTSC_REG_COUNT		(2 * OA_TC6_TTSCC_REG_ID)
> +#define OA_TC6_STATUS0_TTSC_REG_COUNT	(OA_TC6_TTSC_REG_OFFSET + \
> +					 OA_TC6_TTSC_REG_COUNT)
> +
> +/* Useful for reading all the registers between CONFIG0 and INT_MASK0
> + * in a single SPI transaction
> + */
> +#define CFG0_TO_IMASK0_REG_COUNT	(OA_TC6_REG_INT_MASK0 - \
> +					 OA_TC6_REG_CONFIG0 + 1)
> +#define CFG0_VAL_OFFSET			(0)
> +#define STATUS0_VAL_OFFSET		(OA_TC6_REG_STATUS0 - \
> +					 OA_TC6_REG_CONFIG0)
> +#define IRQM_VAL_OFFSET			(OA_TC6_REG_INT_MASK0 - \
> +					 OA_TC6_REG_CONFIG0)

[Severity: Critical]
Are these macros computing byte offsets instead of array word indices?

Since the registers are 32 bits, subtracting the register addresses
(e.g., OA_TC6_REG_INT_MASK0 which is 0x000C minus OA_TC6_REG_CONFIG0
which is 0x0004) yields a byte difference of 8.

When these offsets are used as indices for a u32 array (like regs[8]), they
access wildly out-of-bounds memory instead of the intended sequential index.
Should these offsets be divided by 4 (the register size)?

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c b/drivers/net/et=
hernet/oa_tc6/oa_tc6_tstamp.c
> new file mode 100644
> index 0000000000000..539cbd36a1d04
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

[Severity: High]
Does this unlocked read-modify-write sequence introduce a TOCTOU race
that could unmask hardware interrupts during an error condition?

The lock is dropped just before oa_tc6_read_registers(), allowing concurrent
execution of oa_tc6_disable_traffic() from the SPI threaded IRQ if a hardwa=
re
error occurs. If oa_tc6_disable_traffic() runs here, it sets disable_traffic
and writes ALL_INTERRUPTS to mask interrupts and prevent an interrupt storm.

However, this function will continue, read its locally-modified irqm, and
write it back below, silently undoing the emergency masking.

> +
> +	cfg0 =3D regs[CFG0_VAL_OFFSET];
> +	status0 =3D regs[STATUS0_VAL_OFFSET];
> +	irqm =3D regs[IRQM_VAL_OFFSET];

[Severity: Critical]
Does this code write out-of-bounds stack memory back to the device?

As mentioned in the previous comment regarding the macro definitions,
STATUS0_VAL_OFFSET evaluates to 4 and IRQM_VAL_OFFSET evaluates to 8.=20
The regs array is only 9 elements large (0x0C - 0x04 + 1 =3D 9). Because
these are not proper array indices, this reads from incorrect offsets
and subsequently writes that corrupted state back to the device's
configuration registers.

[ ... ]
> +	ret =3D oa_tc6_write_register(tc6, OA_TC6_REG_INT_MASK0, irqm);
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
Does this assignment inadvertently clear the software timestamping
flags for this interface?

By directly assigning these hardware flags to info->so_timestamping, the
capabilities for software fallback (like SOF_TIMESTAMPING_TX_SOFTWARE and
SOF_TIMESTAMPING_SOFTWARE) are not included. This might cause ethtool and
userspace applications like ptp4l to assume software timestamping is comple=
tely
unsupported when the hardware clock is active.

Should it OR the hardware flags with the default software capabilities, or=
=20
perhaps call ethtool_op_get_ts_info() first to prefill them?

> +	info->phc_index =3D ptp_clock_index(tc6->ptp_clock);
> +	info->tx_types =3D BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
> +	info->rx_filters =3D BIT(HWTSTAMP_FILTER_NONE) |
> +			   BIT(HWTSTAMP_FILTER_ALL);
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-s2500-mac-=
phy-support-v9-0-dcefe1d0bf0d@onsemi.com?part=3D5
