Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4983AB26C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105301; cv=none; b=QlwpRl81lBLBWn5qiSp/o+K/ZWECYXNkknCGjQq7ULW+APEci6mzt8AKoP/tXb1YFgerXmeyq3TtX9d5sqZX/RDQBdDcUkwu9TCz89Yj87OQajbpJhyvmj/FD023amJAzSIpJKLIUiEBoDztmOhADiCl8kXQ5EuOpyobhsQsnvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105301; c=relaxed/simple;
	bh=NvdjJwCZLPtcON7QsVmWJTQJxa+KCxHRB/v2lF7agOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uPRYLOEcw5vBWz57qGtDgRs7Q3sDN2frKqUKEdAzKtG1ZijfHQa6jZJlSk5V3o3T+4JQRhGo+GxFs0C4NZ8vXFV+d+AipnuhOM2jtNSfnmuKLF9zbBTYl8ShNS5EFSGbU6bNc0OrfGmiXaLnkY6yoMlJ+A5NPdtl9hSAu8iWMWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REFeO7B3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REFeO7B3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4C91F00893;
	Wed, 10 Jun 2026 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105300;
	bh=mRv7DGRyIuZ2PI9k0ho8BKZJTxkqez/4wxJNCF4apl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=REFeO7B3tLULCnXPP4m/0WcaFl62th2apm3MyjDjL25G2bAcFc/AHmj/DrpaP63We
	 7Pn4Ur85oFVkqNhaawtKJWCqVbehDW/jNnNXo3FkOoNe9WaCqEDxGk6Ghm45q5bVmT
	 A4P18WMzAvGvk1MWJ8AWE6rU1304MMKkQ8PKv+8MZSagimU0qUubSBUZlNgDOOcTcF
	 05bpyolbGJT4V61WdnpS1BZkDE5s7sFpUAIeoxt8MhtyuOY+/aFds8/F3gdnktjM/D
	 AWkDbVr5EGKz4eRx9+yT0OX5MBXx+glgBbJffd5+O3SlqFIpffXw4ZdeYoT16y33aa
	 /WjJAd0MfhBuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 03/13] net: ethernet: oa_tc6: add
 OA_TC6_BROKEN_PHY quirk flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609-adin1140-driver-v4-3-0753e28ee004@analog.com>
References: <20260609-adin1140-driver-v4-3-0753e28ee004@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:28:18 +0000
Message-Id: <20260610152820.1E4C91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Heap buffer overflow in SPI TX/RX buffer preparation due to un=
validated chunk counts.
- [High] Unbounded `skb_put` calls in `oa_tc6_update_rx_skb` can cause a ke=
rnel panic due to missing frame length limits.
- [High] NULL pointer dereference in `oa_tc6_update_rx_skb` when receiving =
out-of-order chunks.
- [High] Use-After-Free of kthread task_struct due to premature exit on SPI=
 error.
- [High] Use-After-Free in `lan865x_multicast_work_handler` due to incorrec=
t driver teardown sequence.
- [High] Lost wakeup and device deadlock due to TOCTOU race on `tc6->int_fl=
ag`.
--

commit 3db563b67a9fa59e1785134f46c9effcdf6cb05c
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: add OA_TC6_BROKEN_PHY quirk flag

Some MAC-PHY devices need custom MDIO bus access functions to work
around hardware issues. Add the OA_TC6_BROKEN_PHY quirk flag so drivers
can opt in to skip oa_tc6's internal PHY init and manage the PHY
themselves. When the flag is set, oa_tc6 skips MDIO bus registration,
PHY discovery and PHY connection, leaving these to the driver.

> diff --git a/drivers/net/ethernet/microchip/lan865x/lan865x.c b/drivers/n=
et/ethernet/microchip/lan865x/lan865x.c
> index 0277d9737369a..26a2761332a5a 100644
> --- a/drivers/net/ethernet/microchip/lan865x/lan865x.c
> +++ b/drivers/net/ethernet/microchip/lan865x/lan865x.c
> @@ -346,7 +346,7 @@ static int lan865x_probe(struct spi_device *spi)
>  	spi_set_drvdata(spi, priv);
>  	INIT_WORK(&priv->multicast_work, lan865x_multicast_work_handler);

[Severity: High]
This isn't a bug introduced by this patch, but does the teardown sequence
in lan865x_remove() leave a window for a use-after-free?

In lan865x_remove():

    cancel_work_sync(&priv->multicast_work);
    unregister_netdev(priv->netdev);

If a concurrent userspace process calls ndo_set_rx_mode via the RTNL lock
after the work is cancelled but before the netdev is unregistered, could
it reschedule the multicast work? If the remove function then proceeds to
free priv, wouldn't the erroneously rescheduled work access the freed priv
pointer when it later executes?

> -	priv->tc6 =3D oa_tc6_init(spi, netdev);
> +	priv->tc6 =3D oa_tc6_init(spi, netdev, NULL);
>  	if (!priv->tc6) {
>  		ret =3D -ENODEV;
>  		goto free_netdev;

[ ... ]

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index baba5aad84dfa..2a72f0c4b0095 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -134,6 +134,7 @@ struct oa_tc6 {
>  	bool rx_buf_overflow;
>  	bool int_flag;

[Severity: High]
This isn't a bug introduced by this patch, but does the handling of
tc6->int_flag have a race condition that could lose wakeups?

In oa_tc6_try_spi_transfer(), the flag is checked and cleared non-atomicall=
y:

    if (tc6->int_flag) {
        tc6->int_flag =3D false;

If the hardware asserts the interrupt exactly between the check and the cle=
ar,
and the ISR sets tc6->int_flag =3D true, wouldn't the kthread immediately
overwrite it with false? Could this cause the kthread to miss the event flag
and hang indefinitely?

[Severity: High]
This isn't a bug introduced by this patch, but can an uninterrupted stream =
of
ongoing chunks with DATA_VALID=3D1 and END_VALID=3D0 continuously append up=
 to 64
bytes to tc6->rx_skb without bounds checking?

Looking at oa_tc6_prcs_ongoing_rx_frame(), it calls:

    oa_tc6_update_rx_skb(tc6, payload, OA_TC6_CHUNK_PAYLOAD_SIZE);

This unconditionally calls skb_put():

    memcpy(skb_put(tc6->rx_skb, length), payload, length);

If a device sends an endless stream of ongoing chunks, could this exhaust
the SKB tailroom and cause the core network stack to trigger a BUG() via
skb_over_panic()?

[Severity: High]
This isn't a bug introduced by this patch, but what happens if the MAC-PHY
sends an ongoing chunk (DATA_VALID=3D1, START_VALID=3D0, END_VALID=3D0) wit=
hout a
preceding start chunk?

In oa_tc6_prcs_rx_chunk_payload():

    /* Process the chunk with ongoing rx frame data */
    oa_tc6_prcs_ongoing_rx_frame(tc6, data, footer);

If tc6->rx_skb is NULL because no start chunk was processed, wouldn't
oa_tc6_update_rx_skb() dereference a NULL pointer when calling skb_put(),
leading to an immediate crash?

>  	bool prot_ctrl;
> +	enum oa_tc6_quirk_flag quirk_flags;
>  };

[ ... ]

> @@ -1279,11 +1286,13 @@ static int oa_tc6_check_ctrl_protection(struct oa=
_tc6 *tc6)
>   * oa_tc6_init - allocates and initializes oa_tc6 structure.
>   * @spi: device with which data will be exchanged.
>   * @netdev: network device interface structure.
> + * @quirks: device specific modifiers for the OA TC6 protocol.
>   *
>   * Return: pointer reference to the oa_tc6 structure if the MAC-PHY
>   * initialization is successful otherwise NULL.
>   */
> -struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *ne=
tdev)
> +struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *ne=
tdev,
> +			   struct oa_tc6_quirks *quirks)
>  {

[Severity: Critical]
This isn't a bug introduced by this patch, but is it possible for unvalidat=
ed
hardware registers to cause out-of-bounds writes in the SPI data buffers?

In oa_tc6_update_buffer_status_from_register():

    tc6->tx_credits =3D FIELD_GET(OA_TC6_BUFFER_STATUS_TX_CREDITS_AVAILABLE,
                                value);
    tc6->rx_chunks_available =3D FIELD_GET(OA_TC6_BUFFER_STATUS_RX_CHUNKS_A=
VAILABLE,
                                         value);

These are read directly from the hardware as 8-bit values (up to 255), but
the SPI data buffers (spi_data_tx_buf and spi_data_rx_buf) are allocated for
a maximum of 48 chunks (OA_TC6_MAX_TX_CHUNKS).

Later, in oa_tc6_prepare_spi_tx_buf_for_rx_chunks():

    needed_empty_chunks =3D tc6->rx_chunks_available - tx_chunks;
    oa_tc6_add_empty_chunks_to_spi_buf(tc6, needed_empty_chunks);

If a device reports unusually high values, wouldn't these loops write past
the end of the ~14KB buffer allocations?

[Severity: High]
This isn't a bug introduced by this patch, but could an early return from
oa_tc6_spi_thread_handler() lead to a use-after-free during teardown?

In oa_tc6_spi_thread_handler():

    ret =3D oa_tc6_try_spi_transfer(tc6);
    if (ret)
        return ret;

If an SPI error occurs, the kthread exits and its task_struct is freed.

Later, during device teardown, oa_tc6_exit() unconditionally calls:

    kthread_stop(tc6->spi_thread);

If the thread already exited, wouldn't calling kthread_stop() on the freed
task_struct cause a kernel crash?

>  	struct oa_tc6 *tc6;
>  	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-adin1140-d=
river-v4-0-0753e28ee004@analog.com?part=3D3
