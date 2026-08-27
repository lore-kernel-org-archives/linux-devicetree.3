Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F131F98B
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 05:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787807085; cv=none; b=vDULaZgoOIbjoHQFbXFmYO94UG9OLcvYjCQM03MsDGiSuDiQn42mEdkO+aerOXtNvTQf+7Nxp/0ORaxnShLhM8wZTGOwlUNweMozfquhxzhS5vWDw8qmwGhyRg9HzpVo6fsvjkqus6bUnYXXK8FZjx4DWhFVRMGJSS2GnX8a7Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787807085; c=relaxed/simple;
	bh=gCKBW/tFA6PbCzt5m9nqSHErtXxfR+Of+zTI+yZLSEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tyqQ2xRblvfgQPPBejUjYMA0AA/+kuVDJJgCJLCN09L5tqJQZPvn68VCIKiqReJ3KLe4/kg8UNdmycqWUSoITmUPXHZwhPHQVn8HfbuJ0eFWLckdD0HITJRah70LK91d56Bw/lLPIDKBHpqIRpeL2vZvc3RzBy0vW0ySXJGCj2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCjGRlQt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCjGRlQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6644A1F000E9;
	Thu, 27 Aug 2026 05:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787807083;
	bh=yt+48EuYJgfZmJe2zrmot8+7pRygMXJyfjs/w/dZ8s4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCjGRlQttXlDZWZV9Efe6IFEpFqx0lWiyeb+TpBCJwxaRqYMugRyezAJwITIYEVgJ
	 Eo8gUAUWaRjenxI0qwhCE8JJiKyM1Q7kajypL//ZIwb3HkgWJhQcQi3eV0eOWiWyD5
	 QQQGWWeMQEozZSXazbudDwXS6wno/Tw9M6WqIIRIX8jM0oqUTaBB6TbX88Mi08dvKA
	 NjFlI98/iOz1v8Nix0WMhc3mueol2XMPP5z+8tkPk0/mRK/CMvV0+5yfm/FtaSrM8H
	 21pztQA50ZhXo9s6W0Pipp5Ms2BB7wiW2nPrlt19N5hYx3O57wn+65yEmZWfvcmQ2r
	 VfGOSGIRLNomA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260827044349.826534-3-pavitrakumarm@vayavyalabs.com>
References: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
 <20260827044349.826534-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 05:04:42 +0000
Message-Id: <20260827050443.6644A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Teardown race in `spacc_crypto_remove()` allows the crypto eng=
ine to dispatch requests to the hardware after interrupts are disabled and =
DMA pools are destroyed.
- [High] Deadlock and missed wakeup due to late `atomic_inc` of `dma_ref_cn=
t`.
- [Medium] Silent failure if `spacc_xof_stringsize_autodetect` fails.
- [Medium] The `aad_copy` flag is silently dropped for buffered jobs.
--

commit 20cca9a22d8fa57ea670b157f7fd94bce9ee94e2
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
crypto: spacc - Add SPAcc ahash support

This commit adds ahash support to the SPAcc driver. It introduces multiple
hashing algorithms, including AES-CMAC, SM4-CMAC, and various SHA/MD5 varia=
nts.
It also sets up DMA pools and adds the corresponding hardware interaction
routines.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
> @@ -539,26 +539,24 @@ static int spacc_hash_do_one_request(struct crypto_=
engine *engine, void *areq)
[ ... ]
>  	rc =3D spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
>  			&ctx->src, &ctx->dst, req->nbytes,
>  			0, req->nbytes, 0, 0, 0, false);
>  	if (rc < 0) {
[ ... ]
>  		return 0;
>  	}
> =20
>  	/*
>  	 * Job accepted by hardware. Balanced by the atomic_dec in
>  	 * spacc_digest_cb() when the completion callback has run and the
>  	 * job's DMA buffers are safe to reclaim.
>  	 */
>  	atomic_inc(&priv->dma_ref_cnt);

[Severity: High]
Could the atomic_inc() of dma_ref_cnt here race with the interrupt handler =
and
cause a missed wakeup? Since spacc_packet_enqueue_ddt() drops the spinlock
before returning, a fast hardware completion could trigger spacc_digest_cb()
and its atomic_dec_and_test() before the atomic_inc() runs here. This would
decrement the counter from 0 to -1 (missing the wake_up), and the subsequent
atomic_inc() would return it to 0 without waking up any threads waiting in
spacc_crypto_remove().

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
> @@ -775,12 +775,10 @@ int spacc_init(void __iomem *baseaddr, struct spacc=
_device *spacc,
[ ... ]
>  	/* autodetect and set string size setting */
>  	if (spacc->config.version =3D=3D 0x61 || spacc->config.version >=3D 0x6=
5)
>  		spacc_xof_stringsize_autodetect(spacc);
> =20
>  	return 0;

[Severity: Medium]
What happens if spacc_xof_stringsize_autodetect() fails here? It appears the
error code is ignored, meaning that on an allocation failure,
spacc->config.string_size could remain 0, which would leave XOF hashing
operations misconfigured. Should this check the return code and handle the
error?

> @@ -1277,13 +1277,10 @@ int spacc_packet_enqueue_ddt_ex(struct spacc_devi=
ce *spacc, int use_jb,
[ ... ]
>  	if (_spacc_fifo_full(spacc, prio)) {
>  		if (use_jb)
>  			goto fifo_full;
>  		else
>  			return -EBUSY;
>  	}

[Severity: Medium]
Will the aad_copy flag be lost for jobs that get buffered? In
spacc_packet_enqueue_ddt_ex(), if the hardware FIFO is full, it jumps to
fifo_full before setting the aad_copy flag in the control register. The
spacc_job_buffer struct doesn't have a field to store this flag.

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
> @@ -242,15 +242,16 @@ static void spacc_crypto_remove(struct platform_dev=
ice *pdev)
[ ... ]
>  	wait_event(priv->drain_wq, !atomic_read(&priv->dma_ref_cnt));
> =20
>  	spin_lock_irqsave(&priv->spacc.lock, flags);
>  	spacc_irq_glbl_disable(&priv->spacc);
>  	spin_unlock_irqrestore(&priv->spacc.lock, flags);
> =20
>  	devm_free_irq(&pdev->dev, priv->irq, &pdev->dev);
> =20
>  	if (priv->spacc_wq)
>  		destroy_workqueue(priv->spacc_wq);
> =20
>  	if (priv->engine)
>  		crypto_engine_exit(priv->engine);

[Severity: Critical]
Is it safe to exit the crypto engine after waiting for the inflight hardware
jobs to drain? In spacc_crypto_remove(), wait_event() will succeed when the=
re
are no jobs actively running on the hardware (dma_ref_cnt =3D=3D 0). Howeve=
r, the
engine may still have jobs queued in software. Because crypto_engine_exit()=
 is
called after interrupts are disabled and DMA pools are destroyed, couldn't =
the
crypto engine dispatch those pending software requests to the hardware duri=
ng
teardown, leading to memory corruption or a device hang?

> diff --git a/drivers/crypto/dwc-spacc/spacc_manager.c b/drivers/crypto/dw=
c-spacc/spacc_manager.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_manager.c
> @@ -274,13 +274,10 @@ int spacc_process_jb(struct spacc_device *spacc, un=
signed long *lock_flag)
[ ... ]
>  		if (spacc->job_buffer[tail].active) {
>  			ret =3D spacc_packet_enqueue_ddt_ex
>  			      (spacc, 0, spacc->job_buffer[tail].job_idx,
>  			       spacc->job_buffer[tail].src,
>  			       spacc->job_buffer[tail].dst,
>  			       spacc->job_buffer[tail].proc_sz,
>  			       spacc->job_buffer[tail].aad_offset,
>  			       spacc->job_buffer[tail].pre_aad_sz,
>  			       spacc->job_buffer[tail].post_aad_sz,
>  			       spacc->job_buffer[tail].iv_offset,
>  			       spacc->job_buffer[tail].prio, false, lock_flag);

[Severity: Medium]
Additionally, when spacc_process_jb() unbuffers the job, it calls
spacc_packet_enqueue_ddt_ex() with aad_copy hardcoded to false. Doesn't this
corrupt data for any crypto operations that originally required aad_copy?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827044349.8265=
34-1-pavitrakumarm@vayavyalabs.com?part=3D2
