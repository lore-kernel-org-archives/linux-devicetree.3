Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428816;
	b=IMIs2Wj314C8kKLMpGI2JVeQqqyYOUfeQdgWr6kP1b10W/+CEn+kUtrxjoBiA4RqaTQS
	 YoMJpxir164baP6sKYH6MvWiuluz2cqAfYpfJGeWsLpjZiSbudODNFERCeoMgisddrWUW
	 rHKMEz1GswYmN7g3q1jdjZRVVoj9BuXyWJkn17qpnq+5CaVxdihtX6FjE9LI6UnzL817u
	 1Qbg5QEbYj6U2rbYOW21IJJbLRm54P40xlBzYQ5ObyUS0TjISVE8g4wrU3Hl99YZK1HxM
	 9SzFz6J1jXOdjYrtAxMh4Ih7LJmAtKkemWduurg/y77XzNyZDLP7zS/YfNRjkvJsw+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VqUS8uGbGvCmGI1oiuulfU1O58aPVjoGRSMyR6XdiGs=;
	b=b7VnqWvitfZr/Ks9yOL1wwKUR2eohWjyIIpsOWGTfkjE6ywdZIK9UFJXHIZFMF1/2S/f
	 TKm0evf5BL2tGQJ0VtuX/Vq0iYC0PpGBAS6I0lvoYMIxE1EsmOouMwuPnjRbsbc3vQcaj
	 f7Lr9UdyYOHR0YrIQqgiOIthYY+1vMI1IH2HdNUfp5r2KSQDuZ4bnyloxwu3VKtJJPxvD
	 aKLs60VkXFrSXRw+i+dPsZ4Ops2SthIP4oKYKxGJns8fNwgBOq9L2W8HMEAWaPgYzBOx/
	 dM9tF8x5bVM9pMdn4dJrWK9L2UgogF7LTap1APthgQJdDub+eduTWfaomaD6rIwpdbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwW8vDkX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6063606A332
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwW8vDkX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368EF1F00A05;
	Wed, 11 Nov 2026 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428816;
	bh=VqUS8uGbGvCmGI1oiuulfU1O58aPVjoGRSMyR6XdiGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EwW8vDkXodVCvO1FTj/CiomcvCh/x4aSz9c0v2fFDjGbZ2sXW/U/4HT2B/GCEcmpC
	 XXa0HKmTxC/pOCca2kuYQ9GdLetnPvyMJac8dTSIA5kQIXBwwFtLlJRaM2NDd/8OeO
	 f75VOgwavX6QmdtazAgvwJPZURpbWr6Nq3CJS+eI53W85ejHXNUxn+oYUKLIzGRdHb
	 UaVO5P4p6eVCq38iSsBAYZDOOZuJRnWIxZUv2T/E6kvIGF5aPreOct/SzqvyoBjAT+
	 imGABlejSo/dhu0EtXcExoM9NcM6xI2QezGNqb4a9cm++LCdOdPaZ9qrlhqn58qCOL
	 yKKtqDzBveP0g==
Message-ID: <sashiko-outbox-209663@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 12/13] dpll: sit9531x: add support to get
 phase offset on the connected input pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110202607.55744-13-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-13-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:26:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dpll: sit9531x: track key_pending in
  sit9531x_chan_routed_ref_read()
--

commit 4157ae757748960930773aef1f00d28b5cffb1f4
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to get phase offset on the connected input pin

This commit adds phase_offset_get support for SiT9531x input pins by reading
the phase difference between a PLL and its active reference from the on-chip
time-to-digital converter via the debug registers.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index e6271ebd47ac1..ba4ac5e7d365d 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
> @@ -488,6 +488,122 @@ sit9531x_dpll_input_pin_prio_set(const struct dpll_=
pin *pin, void *pin_priv,
>  	return 0;
>  }
> =20
> +/*
> + * Report the loop's residual phase error, sampled with the loop closed.=
 The TDC
> + * compares against a signal the PLL drives, so a PLL driving no output =
returns
> + * -ENODATA.
> + */
> +static int
> +sit9531x_dpll_input_pin_phase_offset_get(const struct dpll_pin *pin,
> +					 void *pin_priv,
> +					 const struct dpll_device *dpll,
> +					 void *dpll_priv, s64 *phase_offset,
> +					 struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	rc =3D sit9531x_chan_routed_ref_read(sitdev, sitdpll->id, &routed);
> +	if (!rc && routed =3D=3D dpin->id) {
> +		rc =3D sit9531x_phase_offset_read(sitdev, sitdpll->id, &offset);
> +		if (!rc)
> +			rc =3D sit9531x_chan_routed_ref_read(sitdev, sitdpll->id,
> +							   &routed);
> +		if (!rc && routed !=3D dpin->id)
> +			rc =3D -ENODATA;
> +	} else if (!rc) {
> +		rc =3D -ENODATA;
> +	}

[Severity: Low]
Should sit9531x_chan_routed_ref_read() also update chan->key_pending when
re-locking SIT9531X_PLL_REG_DEBUG?

sit9531x_phase_offset_read() updates chan->key_pending when closing the
debug window, but sit9531x_chan_routed_ref_read() unlocks and re-locks the
same register without updating chan->key_pending:

drivers/dpll/sit9531x/core.c:sit9531x_chan_routed_ref_read() {
    ...
relock:
	lock_rc =3D sit9531x_write_pll_close(sitdev, pll_idx,
					   SIT9531X_PLL_REG_DEBUG,
					   SIT9531X_PLL_DEBUG_LOCK);

	return rc ? rc : lock_rc;
}

If sit9531x_phase_offset_read() closes the debug window (setting
chan->key_pending to false) and the immediately following
sit9531x_chan_routed_ref_read() fails to re-lock SIT9531X_PLL_REG_DEBUG,
the PLL debug window remains open with chan->key_pending left false, so
sit9531x_tap_back_retry() and sit9531x_tap_pending_retry() will skip
closing it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202607.5574=
4-1-arouhi@sitime.com?part=3D12
