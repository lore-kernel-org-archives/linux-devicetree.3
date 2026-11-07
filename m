Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093551;
	b=LeTY4BagcbUwlM4DBfkGeyoQkvkk8/UYB/bklYuv22lTT3nPp3Qf3hHVcgQXOV7SvaXS
	 KvYFU2jAbp1kHe0FcWgdjLQ5bjahe3qthNrKcUeT2QKTFjCSbOiE6pDIaOPTJxXS44spF
	 4B7ljvRzLVVLtKBKSUytcZlKNgJKjQOz2BaeaZOJs7X7GdFhQlcXeQ5gJjjitMEk79zgc
	 3GHO3WfopJUssoit+zLi8gsXD6nZkdTAtfm1VB2fSRKY67TK6cbM+SDVDv3EmI53FXX3F
	 Nz45jJA6B+cmcRmINNRxwy+dW9EBPMzDnZTRheLetCk2aUfG6Tu74Iq1fsjoFo3Z+AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093551;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YkEpocakllS99vaJb61JHIkGN3+Yy0/OnexaTUL1QMM=;
	b=g5W0xH9cgullo9aylalOisXx5Zr89mTtI1nmh11L2M9t3kZIYjO0oqBWckrbslqLwC2B
	 996pqPnoxKSoH4oj3S+hCaOL+drhDw+XmfdPMFkc4pOA7+on8rU6PdO3xOk0okQf0occp
	 axRAhNIB5+umLUZhgaGG7O+LEF5gl7Qa6zRotLBkrEYnVVMdgDqqJSoTT78mgL6QlPx56
	 U2/O3sJIM8hgEZ5ItlorEfgpWqVqLmcSG/kK4wXdm4lHTA3e0fFIOFuNDBBLj+HIn+Zaa
	 1MRsZbbkbbP9IJTHHnGsIb8Pdj77RlewAOBOxaK9eCKCodbV9zV2Yrydr/GsoxDv7OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glKT3NQ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858A606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glKT3NQ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83C51F0089F;
	Sat,  7 Nov 2026 23:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794093550;
	bh=YkEpocakllS99vaJb61JHIkGN3+Yy0/OnexaTUL1QMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=glKT3NQ0ed1fnA6gM+9GCVU1BZ1O4nro8a6r5HdtYqckLUyjk1gbK4bqLTFn9fjFL
	 MQw8dc4DnZHJ/9d/JlPiA0dxyafTX2iJjjMza+Y6Gb2c77bt1pnZfrQo90Xn6IH9AY
	 UMEUN4uE5gYIhYEz640rfvgeg+stN3t/XzwFtNpCXCillSnOjRHwkr53mlNWvLT/5L
	 ytFI4UGUiWEZsBXFL2PKE9tGCaJoEhHHvhtIbOWqYklAb9oRwQ4GGRrNqSrGmA27UQ
	 H/3Ju1YlX9Ij6O3FcgfDTRqWj/cE0m/5xRJl6XB8giiLUSQuxfQjEbpveYkReN/EJ1
	 znpTPvTG4Te6g==
Message-ID: <sashiko-outbox-203381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 05/11] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-s2500-mac-phy-support-v10-5-31b5a69b85b7@onsemi.com>
References: <20261106-s2500-mac-phy-support-v10-0-31b5a69b85b7@onsemi.com>
 <20261106-s2500-mac-phy-support-v10-5-31b5a69b85b7@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 23:19:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: oa_tc6: NULL deref in oa_tc6_phy_exit() on oa_tc6_init()
  error path
- [Medium] net: oa_tc6: race and partial update in
  oa_tc6_set_hwtstamp_settings()
--

commit 7845a5d180b9f247dce7a81aeca4e94a68402ceb
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for hardware timestamp

This commit adds hardware timestamping and PTP clock registration support
to the OPEN Alliance TC6 10BASE-T1x MAC-PHY framework.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethe=
rnet/oa_tc6/oa_tc6_main.c
> index 45eb896cd986c..e793d7fb0635f 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c

[ ... ]

> @@ -1435,6 +1725,12 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi,=
 struct net_device *netdev,
>  		return ERR_PTR(ret);
>  	}
> =20
> +	ret =3D oa_tc6_update_standard_capability(tc6);
> +	if (ret) {
> +		dev_err(&tc6->spi->dev, "Failed to read capability\n");
> +		goto phy_exit;
> +	}
> +
>  	ret =3D oa_tc6_unmask_macphy_error_interrupts(tc6);
>  	if (ret) {
>  		dev_err(&tc6->spi->dev,

[Severity: Medium]
Does jumping to phy_exit here cause a NULL pointer dereference in
oa_tc6_phy_exit()?  oa_tc6_phy_init() has not run yet at this point, so
tc6->phydev and tc6->mdiobus are still NULL when oa_tc6_phy_exit() calls
phy_disconnect(tc6->phydev) and oa_tc6_mdiobus_unregister(tc6).  This error
path should return ERR_PTR(ret) directly, like the surrounding pre-PHY
checks.

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

[ ... ]

> +	/* STATUS0 is write-one-to-clear, so this acknowledges a capture
> +	 * without delivering its timestamp. Skip it while TX timestamping
> +	 * stays enabled, where a capture may still be outstanding.
> +	 */
> +	status0 &=3D OA_TC6_STATUS0_TTSCA_MASK;
> +	if (status0 && (tc6->ts_config.tx_type !=3D HWTSTAMP_TX_ON ||
> +			ts_cfg->tx_type !=3D HWTSTAMP_TX_ON)) {
> +		ret =3D oa_tc6_write_register(tc6, OA_TC6_REG_STATUS0,
> +					    status0);
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
When disabling TX hardware timestamping while packets are in flight, can
clearing OA_TC6_REG_STATUS0 before updating tc6->ts_config and before
purging tc6->tx_ts_skb_q leave stale capture bits latched in STATUS0?

CPU0                                    CPU1 (irq thread)
oa_tc6_set_hwtstamp_settings()
  oa_tc6_read_registers(CONFIG0..IMASK0)
  oa_tc6_write_register(STATUS0, ...)
                                        oa_tc6_prepare_spi_tx_buf_for_tx_sk=
bs()
                                          oa_tc6_req_tx_hwtstamp()
                                            /* assigns tsc slot */
                                        /* frame transmitted, hardware
                                         * latches TTSCA bit in STATUS0 */
  oa_tc6_write_register(INT_MASK0, ...)
  oa_tc6_write_register(CONFIG0, ...)
  spin_lock_bh(&tc6->tx_skb_lock)
  tc6->ts_config =3D *ts_cfg
  spin_unlock_bh(&tc6->tx_skb_lock)
  oa_tc6_cleanup_tx_tstamp_skbs()
    /* purges tx_ts_skb_q */
                                        oa_tc6_process_extended_status()
                                          oa_tc6_events_handle()
                                            /* no matching skb for TTSCA bi=
t:
                                             * "Unexpected event",
                                             * tx_hwtstamp_err++ */

Because tc6->ts_config and tc6->hw_tstamp_enabled are only updated after
the blocking SPI register writes, oa_tc6_req_tx_hwtstamp() can continue
allocating timestamp slots (and frames already in flight can finish
transmission) after STATUS0 has been read and cleared.  Once
oa_tc6_cleanup_tx_tstamp_skbs() frees the queued skbs, the newly latched
STATUS0 bit has no matching skb in tc6->tx_ts_skb_q, causing
oa_tc6_events_handle() to report an unexpected event and increment
tc6->tx_hwtstamp_err.

In addition, if writing OA_TC6_REG_INT_MASK0 or OA_TC6_REG_CONFIG0 fails
after OA_TC6_REG_STATUS0 was already cleared, the function returns early
without calling oa_tc6_cleanup_tx_tstamp_skbs(), leaving the corresponding
skbs stuck on tc6->tx_ts_skb_q with their tc6->ts_ttsc_pending bits
permanently set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-s2500-mac-=
phy-support-v10-0-31b5a69b85b7@onsemi.com?part=3D5
