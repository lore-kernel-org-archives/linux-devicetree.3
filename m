Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49C6EEC3
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810978; cv=none; b=NC5ewU4ixU2tzqdlXVXcTRZ9XFHtznIkboaCxlBnhYg8Fk6QV8/LlmL/2a0+4Kq/yyHZhyXEDA4sGWJykpqc58WQegvFE2rWr34kNyL+VJZ1GlqnnGTrz21/Ml4fuG0jYS3rQ+boDOkPgqrjBYlB6uDmDxbY+zuNWAoryPThfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810978; c=relaxed/simple;
	bh=nwo/kGPtWjNgm3MBfd0vc60Mm/UrkgPgMf0KWo+p0FE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TI74LGSmPJv8KaXQgBBnpqYVGKaMUMeUnJytDp5T8aFZsRUr+ORbnFN9Sy/Q5R/3I8NFuDwLlvQjH+6lZ3f535YkAWpWr/jLCiuGlsXFvsZ8FzmIXXTaEyLfcXrzQJ219Agl0FXsNuvXTQXT68ZTCKS/CWPWlZ/4f7XRVDZmetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFdcRA0L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFdcRA0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8BD1F00893;
	Sun,  7 Jun 2026 05:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810977;
	bh=bRQz5vOIOwPxodyIlsiEk4rNnvDYAZgdMgZLJTlIBvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QFdcRA0LRDph8RX3GU8eR+XQlrSBGtfZc/8Jk/JP2Xwq13LMqaGUAfLUkxi1p1jsr
	 vup+Ft4m2hhlaNgn0FM0vTO3PS1aoAgb79A6VMKBmp3yc8uvVvNGUP1NLv+wqvELF8
	 Vt7uxnTUNmqGz17oZzvD6ypWrCFG9U7nl1iH7PTK2uwQSFnDftk90AtxoqGK5bJqq8
	 0jXorp4f886qzB1wxC2fjk+r1ikleSsXlJuYOhqUYmtck3zETFY87O2xddptzyR+0c
	 KBm/AKHROFsPkU1PvjC+rtKsn4OY0Rh5RdnotQCxU0WpJj+bDAiVFXOcuSCrg+ZkWN
	 8yir3ouWP7udg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 07/16] net: ethernet: oa_tc6: Support for
 vendor specific MMS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-7-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-7-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:42:56 +0000
Message-Id: <20260607054257.1D8BD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Dangling pointer in the timestamp queue causes a critical Use-=
After-Free during error recovery.
- [High] Use-After-Free when stopping the SPI kthread if it exited early du=
e to an error.
- [High] Memory leak of pending timestamp network buffers during module tea=
rdown.
--

commit 68e8c3a781a6a1a8716a6a44f875d674c0ba927a
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for vendor specific MMS

This commit allows vendors to map a custom memory map select (MMS) value
between 10 and 15 to MDIO_MMD_VEND1 as per the OPEN Alliance 10BASE-T1x
Serial Interface specification. It adds an API interface to perform this
mapping during initialization.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6.c b/drivers/net/ethernet/=
oa_tc6/oa_tc6.c
> index 9410cecfdc2aa..2f9ace655e81c 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
[ ... ]
> @@ -1281,6 +1294,7 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, =
struct net_device *netdev)
>  	SET_NETDEV_DEV(netdev, &spi->dev);
>  	mutex_init(&tc6->spi_ctrl_lock);
>  	spin_lock_init(&tc6->tx_skb_lock);
> +	tc6->vend1_mms =3D -EOPNOTSUPP;
>  	tc6->tx_ts_idx =3D OA_TC6_TTSCA_REG_ID;
>  	INIT_LIST_HEAD(&tc6->tx_ts_skb_q);

[Severity: High]
This is a pre-existing issue, but does unconditionally calling
kthread_stop() in oa_tc6_exit() risk a Use-After-Free?

If an error occurs during an SPI transfer, the kthread loop terminates and
exits early:

oa_tc6_spi_thread_handler() {
	while (likely(!kthread_should_stop())) {
		...
		if (ret) {
			...
			oa_tc6_cleanup_ongoing_tx_skb(tc6);
			...
			return ret;
		}
	}
	return 0;
}

When a kthread exits on its own, the kernel automatically frees its task
structure. However, oa_tc6_exit() unconditionally calls
kthread_stop(tc6->spi_thread) during module teardown. Could this dereference
the potentially freed task pointer?

[Severity: High]
This isn't a bug introduced by this patch, but does the module teardown
leak network buffers that were queued for hardware timestamping?

During teardown, oa_tc6_exit() frees the main transmission and reception
buffers but does not clean up the buffers in tx_ts_skb_q:

oa_tc6_exit() {
	...
	kthread_stop(tc6->spi_thread);
	dev_kfree_skb_any(tc6->ongoing_tx_skb);
	dev_kfree_skb_any(tc6->waiting_tx_skb);
	dev_kfree_skb_any(tc6->rx_skb);
}

If the hardware drops a packet and no interrupt is generated, or if the dri=
ver
is unloaded before the timestamp arrives, won't these stranded buffers leak=
 and
prevent the networking core from releasing the device?

[Severity: Critical]
This is a pre-existing issue, but does oa_tc6_cleanup_ongoing_tx_skb() leave
a dangling pointer in the timestamp queue that causes a Use-After-Free?

When an SPI transfer fails, the buffer is freed on the error path to reclaim
memory:

oa_tc6_cleanup_ongoing_tx_skb() {
	if (tc6->ongoing_tx_skb) {
		tc6->netdev->stats.tx_dropped++;
		kfree_skb(tc6->ongoing_tx_skb);
		tc6->ongoing_tx_skb =3D NULL;
	}
}

However, the buffer is never unlinked from the tx_ts_skb_q. When the hardwa=
re
subsequently triggers a timestamp interrupt, the interrupt handler iterates
over the queue and dereferences the destroyed buffer:

oa_tc6_process_deferred_skb() {
	...
	list_for_each_entry_safe(skb, tmp, &tc6->tx_ts_skb_q, list) {
		... accesses freed skb ...
	}
	...
}

Could this list traversal logic process the dangling list pointer and crash
the kernel?

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D7
