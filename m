Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CF638F62F
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 21:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301364; cv=none; b=f77ZbuJviet6dpFpp7JJAOgtLafiSV/AHkDGWFhpCVYURJUuPODD+XdPOoHhtXwnrFxQA+AZrWRAqaB95hEBdNyahgjA5/wKHkxZcyKeU8e01o32SA4ryizNEy9c5Wb74yFxJidwwz92bHTA4mWxEyaTklEp33ly8R5H3SuKyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301364; c=relaxed/simple;
	bh=0Bw4XjxfmU/WkNaEEOIbKVO1axWfaOPUzeNJgkSXEFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MsOP9LZ3RKcqHr+hds+rB7AZRiycO8j4qedCW7NqMIdDVh+wYiFdQHrM4iicJX7ekvXUIzeh56bUvtHge5+TcS1VrTGnINDG/l6yHYaa59wShzQYSngQV3Dr969OYj9YdPO6SmEs15GipPK0QEbnM8aS1yJj7DiXnGbmd6bdLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9QqfiUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9QqfiUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC7D1F00A3A;
	Fri, 12 Jun 2026 21:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301363;
	bh=ncjcAwBo4xtf7e1plqEVxVZlQNjEO9rXASTuaoZ7hhk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P9QqfiUB4lLxeIuOAyXQYlIHVSwiLIORUm+ljcJhCEc/6KVMhoq32tnvUB2lg41K5
	 aFkARfsOJ/mhsSPml2bFFEAa9V5Q3af006jPxwuLgwyDqLYnxKSjH4N0sL67L559/P
	 HmkcYbVSkoHTDiVT8jQMTCZLTbz4dNlhJiAZcb0T0X4mwpFTPMzprho0ZVknX0uMH2
	 G7PicyY5+tQ8/idsxBbyghFpa4VzPZhB/KDfPFf43VWF8kbh9BciEKwWHnAG7fHif+
	 j1k9as64VfA82TK0l8e2VEe2vUkO4/pvJS8utULT4rTGzh8K+1RrJHW2Cik4WJODNp
	 /Pvj44BqC2Aig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v5 1/4] net: ethernet: oa_tc6: Interrupt is active
 low, level triggered.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-level-trigger-v5-1-4533a9e85ce2@onsemi.com>
References: <20260611-level-trigger-v5-1-4533a9e85ce2@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 21:56:01 +0000
Message-Id: <20260612215602.1DC7D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Lockless access to `tc6->waiting_tx_skb` causes a data race and =
SKB memory leak on the error path.

Pre-existing issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition between `oa=
_tc6_start_xmit` and `oa_tc6_try_spi_transfer` permanently stalls the netwo=
rk TX queue under normal load.
--

commit 6fa7a5c7acb261bf354f20bcc76ccf99dc36a384
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Interrupt is active low, level triggered.

According OPEN Alliance 10BASET1x MAC-PHY Serial Interface
specification, interrupt is active low, level triggered.

Code used edge triggered interrupt which has the risk of losing an
interrupt on instances like when interrupt is disabled. Level
triggered interrupt won't be deasserted unless handler runs and
clear the interrupting conditions.

Interrupt handler mechanism is changed to threaded irq from
interrupt handler and kernel thread waiting on work queue.

Introduced a logic to disable the device interrupt on error. Error
could be due in data chunk's header and footer or SPI interface itself.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 91a906a7918a2..f3ac2875adfb7 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c

[ ... ]

> @@ -669,6 +671,38 @@ static void oa_tc6_cleanup_ongoing_tx_skb(struct oa_=
tc6 *tc6)
>  	}
>  }
> =20
> +static void oa_tc6_cleanup_waiting_tx_skb(struct oa_tc6 *tc6)
> +{
> +	if (tc6->waiting_tx_skb) {
> +		tc6->netdev->stats.tx_dropped++;
> +		kfree_skb(tc6->waiting_tx_skb);
> +		tc6->waiting_tx_skb =3D NULL;
> +	}
> +}
> +

[ ... ]

> @@ -1202,7 +1240,7 @@ EXPORT_SYMBOL_GPL(oa_tc6_zero_align_receive_frame_e=
nable);
>   */
>  netdev_tx_t oa_tc6_start_xmit(struct oa_tc6 *tc6, struct sk_buff *skb)
>  {
> -	if (tc6->waiting_tx_skb) {
> +	if (tc6->disable_traffic || tc6->waiting_tx_skb) {

[Severity: High]
This is a pre-existing issue, but does this lockless check open a race
window that can permanently stall the network TX queue?

If oa_tc6_start_xmit() sees tc6->waiting_tx_skb as populated, it prepares
to stop the queue. Meanwhile, the SPI thread running
oa_tc6_try_spi_transfer() might transfer the SKB, clear waiting_tx_skb
under lock, and check netif_queue_stopped():

oa_tc6_try_spi_transfer()
    if (!tc6->waiting_tx_skb && netif_queue_stopped(tc6->netdev))
        netif_wake_queue(tc6->netdev);

If the SPI thread checks netif_queue_stopped() before oa_tc6_start_xmit()
actually calls netif_stop_queue(), it reads false and skips waking the
queue. oa_tc6_start_xmit() then stops the queue, but waiting_tx_skb is
already cleared.

Could this leave the TX queue permanently deadlocked until an external RX
packet triggers an interrupt?

[Severity: Medium]
Could this also lead to a data race and an SKB memory leak on the error
path?

If oa_tc6_start_xmit() observes tc6->disable_traffic as false and proceeds,
and concurrently the IRQ thread hits a fatal SPI error, it will call
oa_tc6_disable_traffic(). This invokes the new lockless cleanup in
oa_tc6_cleanup_waiting_tx_skb().

If the cleanup happens while waiting_tx_skb is still NULL, it does nothing.
Then oa_tc6_start_xmit() continues, acquires the lock, and assigns the new
SKB to waiting_tx_skb.

Since disable_traffic is now true, the IRQ thread will skip processing, and
the SKB will be leaked indefinitely.

Additionally, oa_tc6_cleanup_waiting_tx_skb() locklessly reads, frees, and
clears tc6->waiting_tx_skb, which appears to cause a data race against
these concurrent accesses.

>  		netif_stop_queue(tc6->netdev);
>  		return NETDEV_TX_BUSY;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-level-trig=
ger-v5-0-4533a9e85ce2@onsemi.com?part=3D1
