Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192C35839E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121052; cv=none; b=ByHIqfcP2fyUqoyXS9JW/QrjMvDFsn1XgksP02ZjaXgzlDMpzn3JDmqmNCJjnfjCdknx20fUviwvleDqirnNxLR26u7jpRmZ5HSOH/iFIa/3T1PMldiG2vguejqnaqyeo4TGl8KT1nsjt7/WMBTQyn8X4zTDIkD5OFs84hHXUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121052; c=relaxed/simple;
	bh=BW8Yte5VoH/W/fXnYNoc1KTV0Nq1zrkvUgQ7yG+jUiM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cI6FU4RChfaF1zwAfSUvtIyCPTuGJGZ1hObtwlE/t7oXtD20ucEV36w0qzKa8ISZlIu8Himotj8kMbq77mWLUgGPPPF7X86UA/RlGIepIPIm4V9x+ad3xhk4ziUlyb9nbfqdo6QG5Pn0ytJMpCS4JOxc+YQSZm35rbiqHa0syNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHovQnzM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHovQnzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42631F00898;
	Wed, 10 Jun 2026 19:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781121051;
	bh=LmANJe4yyGi3jV0Q88iTVKjAjeYv6/ik8hBVBKUiteg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHovQnzMMrl8HjUVnLrUHzaN3QKjYLo88Tj/8m9pYeqLmQjyNkXuampUuk981mnTZ
	 Z12jWCncwkpwSSlCOfJeH3ux9A+TWJ6DyLa6UIDj3QUHZa3pXkWEMxwYu12gQkyhrh
	 DXNmu/OIpCz+Ag6bgLJc9sYCyqwAXrLp5HKY+A3/4cPNF3W5lsfSWVG8tS5wAwl6jv
	 Z/xqvCLCkNnZHto7VGlaU4Un+n/kmMB1FBpkiryJlO+lINzDKsrk3JpTci2ecGUenV
	 eItNAcQXW4ArDeqd/n432dYSENJZkBNqsyQ1YKpxHJgOQYi6B/2iyYMrqLbDv21TC+
	 ekEtk4YfNaZyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4 1/4] net: ethernet: oa_tc6: Interrupt is active
 low, level triggered.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609-level-trigger-v4-1-6f389abdd192@onsemi.com>
References: <20260609-level-trigger-v4-1-6f389abdd192@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 19:50:50 +0000
Message-Id: <20260610195050.B42631F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing IRQ teardown in `oa_tc6_exit()` allows the threaded IRQ to=
 run concurrently with or after driver teardown, causing Use-After-Free of =
SKBs.
- [High] Unmasking a level-triggered interrupt without clearing the hardwar=
e condition causes an interrupt storm on SPI/protocol errors.
--

commit 5c9cbbecd5c1eb1d5efb41b338ac224d42d08b34
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
net: ethernet: oa_tc6: Interrupt is active low, level triggered.

This patch modifies the interrupt handling mechanism for the oa_tc6 driver.
It replaces the kthread-based SPI transfer approach with a threaded IRQ, and
configures the interrupt trigger type from edge-falling to level-low.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 91a906a7918a2..e2c0843207f24 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c

[ ... ]

> @@ -1105,29 +1104,18 @@ static int oa_tc6_try_spi_transfer(struct oa_tc6 =
*tc6)
>  	return 0;
>  }
> =20
> -static int oa_tc6_spi_thread_handler(void *data)
> +static irqreturn_t oa_tc6_macphy_threaded_irq(int irq, void *data)
>  {
>  	struct oa_tc6 *tc6 =3D data;
> -	int ret;
> -
> -	while (likely(!kthread_should_stop())) {
> -		/* This kthread will be waken up if there is a tx skb or mac-phy
> -		 * interrupt to perform spi transfer with tx chunks.
> -		 */
> -		wait_event_interruptible(tc6->spi_wq, tc6->int_flag ||
> -					 (tc6->waiting_tx_skb &&
> -					 tc6->tx_credits) ||
> -					 kthread_should_stop());
> -
> -		if (kthread_should_stop())
> -			break;
> =20
> +	while (tc6->int_flag || (tc6->waiting_tx_skb && tc6->tx_credits)) {
>  		ret =3D oa_tc6_try_spi_transfer(tc6);
>  		if (ret)
> -			return ret;
> +			break;
>  	}
> =20
> -	return 0;
> +	return IRQ_HANDLED;
>  }

[Severity: High]
If oa_tc6_try_spi_transfer() fails (e.g., due to an SPI transfer failure)
and returns an error, the loop breaks and returns IRQ_HANDLED.

Since the IRQ is now configured as level-triggered, returning IRQ_HANDLED
will cause the genirq core to unmask the interrupt. If the hardware conditi=
on
was not successfully cleared due to the transfer failure, won't this result
in an immediate interrupt storm that locks up the CPU?

Should the IRQ be explicitly disabled (e.g., via disable_irq_nosync()) when
aborting on an unrecoverable error?

[ ... ]

> @@ -1357,7 +1331,6 @@ EXPORT_SYMBOL_GPL(oa_tc6_init);
>  void oa_tc6_exit(struct oa_tc6 *tc6)
>  {
>  	oa_tc6_phy_exit(tc6);
> -	kthread_stop(tc6->spi_thread);
>  	dev_kfree_skb_any(tc6->ongoing_tx_skb);
>  	dev_kfree_skb_any(tc6->waiting_tx_skb);
>  	dev_kfree_skb_any(tc6->rx_skb);
>  }

[Severity: High]
Does this code introduce a use-after-free window?

The patch removes kthread_stop(), but it doesn't explicitly disable or free
the newly added threaded IRQ here. Since the IRQ was requested with
devm_request_threaded_irq(), it will remain fully active until the devres
cleanup phase, which occurs after the driver's remove path finishes.

If the threaded IRQ runs concurrently with or after oa_tc6_exit(), can it
access tc6->ongoing_tx_skb, tc6->waiting_tx_skb, or tc6->rx_skb while they
are being unconditionally freed by dev_kfree_skb_any()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-level-trig=
ger-v4-0-6f389abdd192@onsemi.com?part=3D1
