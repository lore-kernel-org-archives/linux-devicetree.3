Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13720519917
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797869; cv=none; b=li/Q+lte6X6jtZYRRaR5TaQeudXqXeUWQmj+LCMW5YJFu/6tMjDH05Anyk62kHSLYSga7KoG9G8IqMKVeaTE0iKogplmMN5DTYvcM7rmSePVSxLDCltj1hUMITfVxotLuaWQsvCncGc+E4roFJftaJOY4NqRkizTnJObqUbwTMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797869; c=relaxed/simple;
	bh=Q6Y2DfhmS2orc2PhAj/tWnHP1g7QDN9PORPhM5HuHcE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U2zXXN4N7BPpU3BD/Y3bPLk2qrXt7CO7DWqSBaR00AHoQvDUB7yGuxvxmJSw+u2/2unCFdN19aTGZNeVU1cTQljkSkvpYYABoTk4R/MEPcZVJnwzGqc82h5bpWVh57DnPb1xtlz61tRFG6xjX1h+xYQI2YBdOYVW2gpYYtcliuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdi5rLGI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdi5rLGI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4E11F00A3A;
	Mon,  7 Sep 2026 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788797868;
	bh=pY2dOqDZgXFW73hRJJkT224NZ81ZARppeMJnnABNxeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kdi5rLGIVJsRqsS2ql6e4ec6ybPhU3ftM0AHQcX/ufTo/rfwaFtgPwsBBF3xddFpb
	 fvEr3moiow9/a9b2Dctri+hdC9j99jR3LrsmybPqrOmuN7j+9JQ+4mXV5Bl4qpgg0g
	 2RpgNC5PIAuguQ0sj810LSJYbnI1jN81856HNs6kNO4wQHpoHGEfJnhcA1FO4IjLka
	 Ofm0lAYIJnsVx5JzjiwyKQsPCQcepKu/dTd/B1CKGh3OaPa0myiuGgTyPUKQOW9Qie
	 ybo30l6kkfdk124exzrYZ7gBve9poC5Gxz1Q+MKLOV7eq1mfucTyBEid83C6W6sEFW
	 gPyaplmZpYjwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907155916.999153-3-pavitrakumarm@vayavyalabs.com>
References: <20260907155916.999153-1-pavitrakumarm@vayavyalabs.com>
 <20260907155916.999153-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 16:17:47 +0000
Message-Id: <20260907161747.BB4E11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] System crash (Use-After-Free) on sysfs device unbind due to devres=
 and TFM lifetime mismatch.
- [Medium] Watchdog counter (`wdcnt`) drifts upward when workqueue executio=
n is delayed, permanently degrading interrupt handling performance.
--

commit bcf8c57c68ae9fb20253e0cf9ae9110bc28b8790
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

This commit adds ahash support to the SPAcc driver. It introduces
multiple supported hash algorithms including CMAC, XCBC, HMAC, SHA
variants, and SM3/4 variants.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> new file mode 100644
> index 0000000000000..ec038c7774e7c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
[ ... ]
> +static int spacc_hash_digest(struct ahash_request *req)
> +{
> +	struct crypto_ahash *reqtfm =3D crypto_ahash_reqtfm(req);
> +	struct spacc_crypto_ctx *tctx =3D crypto_ahash_ctx(reqtfm);
> +	struct spacc_priv *priv =3D dev_get_drvdata(tctx->dev);
> +
> +	if (!priv || !priv->engine)
> +		return -ENODEV;
> +
> +	return crypto_transfer_hash_request_to_engine(priv->engine, req);
> +}

[Severity: High]
Could this lead to a use-after-free if an administrator unbinds the
driver via sysfs while a user-space process keeps a crypto tfm open?

Since priv is allocated via devres in spacc_init_device(), it is tied
to the driver binding lifetime and will be freed after spacc_crypto_remove()
completes.

If a user process concurrently submits a request that reaches
spacc_hash_digest(), it could check priv and priv->engine just before
they are freed, and then dereference the memory after devres frees it.

Does the driver need to refcount the hardware state or block removal
until all active tfms are destroyed?

[ ... ]
> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> new file mode 100644
> index 0000000000000..910916a1fe000
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> +void spacc_pop_jobs(struct work_struct *data)
> +{
> +	int num =3D 0;
> +	struct spacc_priv *priv =3D container_of(data, struct spacc_priv,
> +					       pop_jobs);
> +	struct spacc_device *spacc =3D &priv->spacc;
> +	unsigned long lock_flag;
> +
> +	/*
> +	 * Decrement the WD CNT here since
> +	 * now we're actually going to respond
> +	 * to the IRQ completely
> +	 * (under spacc->lock -- spacc_process_irq() increments/resets
> +	 * this same counter under the same lock from IRQ context)
> +	 */
> +	spin_lock_irqsave(&spacc->lock, lock_flag);
> +	if (spacc->wdcnt)
> +		--(spacc->wdcnt);
> +	spin_unlock_irqrestore(&spacc->lock, lock_flag);

[Severity: Medium]
Will the watchdog counter drift upward permanently when system load delays
the execution of the workqueue?

In spacc_process_irq(), spacc->wdcnt increments for every watchdog
interrupt.

If multiple interrupts coalesce before the workqueue finally
executes, spacc_pop_jobs() only decrements the counter by 1.

Over time, these unmatched increments could accumulate until the counter
artificially hits SPACC_WD_LIMIT, causing the driver to fall back to an
inefficient polling mode.

Is there a way to ensure we decrement by the actual number of handled
events?

[ ... ]
> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> new file mode 100644
> index 0000000000000..f4e4f8b7f3525
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
[ ... ]
> +static int spacc_init_device(struct platform_device *pdev)
> +{
[ ... ]
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);

[Severity: High]
Hardware state is allocated here using devm, tying it directly to the
driver binding. As mentioned in the spacc_hash_digest() comment, this
lifetime mismatch with the extended tfm lifetime creates the race condition
leading to a use-after-free.

[ ... ]
> +static void spacc_crypto_remove(struct platform_device *pdev)
> +{
> +	struct spacc_priv *priv =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +
> +	/* Stop the crypto API from handing out any new tfms. */
> +	spacc_unregister_algs(priv);
> +
> +	/*
> +	 * Must run before IRQ/workqueue teardown as  crypto_engine_stop()
> +	 * waits on engine->busy, which only clears via the IRQ ->
> +	 * workqueue -> callback completion path.
> +	 */
> +	if (priv->engine)
> +		crypto_engine_exit(priv->engine);

[Severity: High]
Can this engine teardown occur while active tfms are still attempting to
submit requests?

Because unbind can occur while tfms are active, tearing down the engine
here before active tfms are tracked and finalized could disrupt in-flight
requests and contribute to the memory corruption issue.

[ ... ]
> diff --git a/drivers/crypto/dwc-spacc/spacc_interrupt.c b/drivers/crypto/=
dwc-spacc/spacc_interrupt.c
> new file mode 100644
> index 0000000000000..c6febd585ee2a
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

[Severity: Medium]
This is where the counter is incremented for every watchdog interrupt. As
noted above for spacc_pop_jobs(), multiple fast increments here will outpace
the single decrement in the delayed workqueue, corrupting the logical state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907155916.9991=
53-1-pavitrakumarm@vayavyalabs.com?part=3D2
