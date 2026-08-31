Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F23BD62F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180522; cv=none; b=MK+GMZS2rHuJ5BNL8HPZ4fbCRulL5n7gH61jn9S4FoLful1kk3+CptTCY2jBDzpmzYt5aaA/BTwDEc6qu/ABvjicPYOpdujhmLyXoER07tg0t5rFL8cNeHIp0lTLH2EDIuur2eSSR4fl4rvqmFJsrUOPyn4AC53SRbPggUs4Qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180522; c=relaxed/simple;
	bh=Y2569ltssAENqiUv1i8zOPsNbmPLmBAytfD0r2TM9L4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i3dzhYMzX6UEGMRof5yIY9pP/Y4INHrjWCl90gXst2DQBeqla1Jn8zYqZVs8mYKQvm/FP58mqjSYYJ8tyjH0wh0WfVVDHqg8rc9e49Z/aZd+DvYgiaR8VPP9j03L/bZNxFNfNT+jyecS30j2mmqlo9XW6FSzFR7vI9Yz8eyZtH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rky8u0G4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rky8u0G4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60C11F000E9;
	Mon, 31 Aug 2026 12:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788180514;
	bh=A+sW/EJQn//bT5MdzKmybsJhFXkpdd181tahybX5ezM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rky8u0G4a+XNscvyyuyXftz1wUqYK5HvbJFfhmdxbfuHloviByspSvIsYRluCmi29
	 EvjbzZyZlbVOrUO2kCWt2L1x0QoPDIsl3ALbnV0XjHisVPTicujQEftNQjKSWiQpMm
	 yZa7N2YSJVt34Y/za10giw4cFL3QMSeTVzRxsJrButuH9fpC4kEPDfm61TTPVf0LLW
	 PEJcF8GNZSG1KNDFjFI13BL6WsB2WbWMcrZarT6aPoCr6jVStyqbwzo8qeS911Ca0U
	 tf1DjX5Fctk+jNCQVTeXCdCo8boJejWUgv0puf5KBLSrtsKrVjWqr/pbBh4Z4OFRYP
	 80x0sYbQfazRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831123113.870832-3-pavitrakumarm@vayavyalabs.com>
References: <20260831123113.870832-1-pavitrakumarm@vayavyalabs.com>
 <20260831123113.870832-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:48:33 +0000
Message-Id: <20260831124833.D60C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Watchdog timer backoff is broken due to missing state update.
- [Low] Type mismatch in `min()` macro causes compiler error on 64-bit plat=
forms.
--

commit 582ebadfc066f6a5f98367003336816ef043c202
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

This commit adds asynchronous hash (ahash) support to the SPAcc driver.
It introduces support for a variety of hash algorithms including AES and
SM4 CMAC/XCBC, MD5, SHA1/224/256/384/512, their HMAC variants, and SHA3.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> index 0000000000000..98b8f6bc0d070
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c

[ ... ]

> +static int spacc_hash_do_one_request(struct crypto_engine *engine, void =
*areq)
> +{

[ ... ]

> +fallback:
> +	kfree(tctx->tmp_sgl);
> +	tctx->tmp_sgl =3D NULL;
> +
> +	if (tctx->shash_fb) {
> +		SHASH_DESC_ON_STACK(desc, tctx->shash_fb);
> +
> +		desc->tfm =3D tctx->shash_fb;
> +
> +		rc =3D crypto_shash_init(desc);
> +		if (!rc) {
> +			struct sg_mapping_iter miter;
> +			unsigned int remaining =3D req->nbytes;
> +			int nents =3D sg_nents_for_len(req->src, req->nbytes);
> +
> +			if (nents < 0) {
> +				rc =3D nents;
> +			} else {
> +				sg_miter_start(&miter, req->src, nents,
> +					SG_MITER_ATOMIC | SG_MITER_FROM_SG);
> +				while (remaining && sg_miter_next(&miter)) {
> +					unsigned int len =3D min(miter.length,
> +								remaining);

[Severity: Low]
Will this type mismatch cause a compiler error on 64-bit platforms?

The min() macro in the Linux kernel enforces strict type checking. Passing
a size_t (miter.length) and an unsigned int (remaining) can cause a
compiler error on 64-bit platforms where these types differ in size.

> +
> +					rc =3D crypto_shash_update(desc,
> +							miter.addr, len);
> +					if (rc)
> +						break;
> +
> +					remaining -=3D len;
> +				}
> +				sg_miter_stop(&miter);
> +
> +				if (!rc && remaining)
> +					rc =3D -EINVAL;
> +			}
> +		}

[ ... ]

> diff --git a/drivers/crypto/dwc-spacc/spacc_interrupt.c b/drivers/crypto/=
dwc-spacc/spacc_interrupt.c
> index 0000000000000..6029a7257d03f
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_interrupt.c

[ ... ]

> +u32 spacc_process_irq(struct spacc_device *spacc)
> +{

[ ... ]

> +	/* watchdog IRQ */
> +	if (spacc->op_mode =3D=3D SPACC_OP_MODE_WD &&
> +			irq_status & SPACC_IRQ_STAT_STAT_WD) {
> +		if (++spacc->wdcnt =3D=3D SPACC_WD_LIMIT) {
> +			/*
> +			 * This happens when you get too many IRQs that
> +			 * go unanswered
> +			 */
> +			spacc_irq_stat_wd_disable(spacc);
> +
> +			/*
> +			 * We set the STAT CNT to 1 so that every job
> +			 * generates an IRQ now
> +			 */
> +			spacc_irq_stat_enable(spacc, 1);
> +			spacc->op_mode =3D SPACC_OP_MODE_IRQ;
> +			spacc->wd_cnt_limit =3D true;
> +		} else if (spacc->config.wd_timer < (0xFFFFFFUL >> 4)) {
> +			/*
> +			 * If the timer isn't too high lets bump it up
> +			 * a bit so as to give the IRQ a chance to
> +			 * reply
> +			 */
> +			spacc_set_wd_count(spacc,
> +					spacc->config.wd_timer << 4);

[Severity: Medium]
Does this logic fail to properly backoff the watchdog timer?

The hardware register is written with spacc->config.wd_timer << 4, but
the software state spacc->config.wd_timer is never updated. Since the
internal state is unmodified, subsequent timeouts will use the same static
value instead of exponentially increasing, potentially causing the driver
to poll or fallback to IRQ mode prematurely.

> +		}
> +
> +		SPACC_IRQ_STAT_CLEAR_STAT_WD(spacc);
> +		if (spacc->irq_cb_stat_wd)
> +			spacc->irq_cb_stat_wd(spacc);
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831123113.8708=
32-1-pavitrakumarm@vayavyalabs.com?part=3D2
