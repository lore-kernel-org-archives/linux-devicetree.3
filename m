Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822C1A6801
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282898; cv=none; b=XsU6vX146ZTRQJIYmLE8FRl3DqAJm8JDxV76bGi1C0lVZFp8PDzilGZQEkVfcnXQtNM91V0tWHLu5X5twjqECWwDs2TR8kXDBrICCOZkvKZBOmeObLgEAkrQVAcYTsN06USuJLS4Z5Baq3d7cOPDmEO1v1web5Rdu0KbR0fTCjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282898; c=relaxed/simple;
	bh=tu+d6m0Yu4IYa8Ns6fYDi6gvTSIvuSu9sEuSZBy5+aA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tq6EZ3xrAWcgvEiB3dyJZ//rB29nechhDTDpnwyNoM38WzcTWb6Y1pHkgNNJ56BDLVoZmG7ySXUOGOpOnLt8cMaH1eLjFDpAx71qoLy7NkQC5cIgcyUkuTNSGqjB5YCRJghymLbaQ+/yhDk0pEP7VH+giiZW9y5Y7A+e3Anr9MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXtgGHEH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXtgGHEH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9FE1F00893;
	Wed, 20 May 2026 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282897;
	bh=38OnKagQN7SDmI16fTYmrs+bY1uTcMv1AfLimQKvZo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXtgGHEHoCbfR61cIX6WVQz+ThJTwHFwNFBuPsroX9U4jbbvb7k9Anxp6wAkcptt2
	 RchX2INbUDbkgLxb8km57N5tWow32ruO8OUF5+RpujF96HxR06wnLexr2uEqvsEHjM
	 QtDlPjb9rUkAdy0njA86C4TXfdiAEKS+Box2o95aLzerliy3COGHJfPyoEFZj9DhZ+
	 NQk+cdnhUKUlO4O4CvWQ3lxgsiB+bw0+ch1wvj1S/hZQNMg+a/RWjPRWF3iSbAZj5l
	 0cmmtKRNrRkgjZ4hMmlnR/Rd1vLLZ13BR/B8lc6Q9KKMbes27Vy2HMHbgOUx2/MVvY
	 U3sxzIYv/F4Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 17/17] media: ti: j721e-csi2rx: Support system
 suspend using pm_notifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520120022.539913-18-r-donadkar@ti.com>
References: <20260520120022.539913-18-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 13:14:56 +0000
Message-Id: <20260520131456.DD9FE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Critical] PM notifiers modify hardware and V4L2 state without holding th=
e context mutex, allowing concurrent userspace ioctls to corrupt state or r=
estart streams during system suspend.
- [Critical] Replacing `.suspend` / `.resume` callbacks entirely with PM no=
tifiers breaks hybrid sleep (suspend-to-both).
- [High] The DMA drain operation in the suspend path is instantly terminate=
d without waiting for completion, rendering it ineffective.
- [High] The PM notifier is unregistered too late during device unbinding, =
creating a race window for a Use-After-Free.
- [High] Lockless runtime PM status checks allow concurrent clock gating du=
ring MMIO access, risking a synchronous external abort.
- [Medium] DMA drains are unconditionally initiated even for already-stoppe=
d contexts, submitting descriptors that will never complete.

Pre-existing issues:
- [High] Calling `pm_runtime_set_suspended()` while runtime PM is active le=
aks DMA channels and violates PM API contracts.
--

commit cb8a02a3113637917c3f826385776d24c0186002
Author: Jai Luthra <jai.luthra@ideasonboard.com>

media: ti: j721e-csi2rx: Support system suspend using pm_notifier

As this device is the "orchestrator" for the rest of the media
pipeline, we need to stop all on-going streams before system suspend and
enable them back when the system wakes up from sleep.

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index d68b8d6ffeb19..21388284cbaab 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
[ ... ]
> @@ -1544,6 +1545,124 @@ static int ti_csi2rx_runtime_resume(struct device=
 *dev)
>  	return 0;
>  }
> =20
> +static int ti_csi2rx_suspend(struct device *dev)
> +{
> +	struct ti_csi2rx_dev *csi =3D dev_get_drvdata(dev);
> +	enum ti_csi2rx_dma_state state;
> +	struct ti_csi2rx_ctx *ctx;
> +	struct ti_csi2rx_dma *dma;
> +	unsigned long flags =3D 0;
> +	int i, ret =3D 0;
> +
> +	/* If device was not in use we can simply suspend */
> +	if (pm_runtime_status_suspended(dev))
> +		return 0;

[Severity: Critical]
Since PM notifiers like PM_SUSPEND_PREPARE run before userspace tasks are
frozen, is there anything preventing userspace from calling VIDIOC_STREAMON
concurrently?

Because this function does not hold ctx->mutex or set a state flag, could
userspace restart the streams and DMA engine immediately after this suspend
notifier finishes, leaving active DMA transfers to memory when the system
actually enters sleep?

[Severity: High]
Can a concurrent userspace operation trigger a pm_runtime_put() and drop the
usage counter to zero while this PM notifier is executing?

Because the status is checked locklessly here without acquiring a runtime PM
reference, the device could runtime suspend and gate its clocks while this
notifier is actively writing to memory-mapped registers, which might cause a
synchronous external abort.

> +
> +	/*
> +	 * If device is running, assert the pixel reset to cleanly stop any
> +	 * on-going streams before we suspend.
> +	 */
> +	writel(0, csi->shim + SHIM_CNTL);
> +
> +	for (i =3D 0; i < csi->num_ctx; i++) {
> +		ctx =3D &csi->ctx[i];
> +		dma =3D &ctx->dma;
> +
> +		spin_lock_irqsave(&dma->lock, flags);
> +		state =3D dma->state;
> +		spin_unlock_irqrestore(&dma->lock, flags);
> +
> +		if (state !=3D TI_CSI2RX_DMA_STOPPED) {
> +			/* Disable source */
> +			ret =3D v4l2_subdev_disable_streams(&csi->subdev,
> +							  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> +							  BIT(0));
> +			if (ret)
> +				dev_err(csi->dev, "Failed to stop subdev stream\n");
> +		}
> +
> +		/* Stop any on-going streams */
> +		writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> +
> +		/* Drain DMA */
> +		ti_csi2rx_drain_dma(ctx);

[Severity: Medium]
Will this unconditionally submit a DMA drain even for contexts that are alr=
eady
TI_CSI2RX_DMA_STOPPED?

If the DMA stream was already stopped, could this submit a read descriptor =
that
waits for hardware data that will never arrive?

> +
> +		/* Terminate DMA */
> +		ret =3D dmaengine_terminate_sync(ctx->dma.chan);

[Severity: High]
Does this instantly terminate the DMA drain operation submitted just above?

Since there is no wait for the drain to complete, the DMA channel is aborted
immediately, which defeats the purpose of draining the FIFO and leaves stale
data in the hardware.

> +		if (ret)
> +			dev_err(csi->dev, "Failed to stop DMA\n");
> +	}
> +
> +	return ret;
> +}
[ ... ]
> +static int ti_csi2rx_pm_notifier(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct ti_csi2rx_dev *csi =3D
> +		container_of(nb, struct ti_csi2rx_dev, pm_notifier);
> +
> +	switch (action) {
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_SUSPEND_PREPARE:
> +	case PM_RESTORE_PREPARE:
> +		ti_csi2rx_suspend(csi->dev);
> +		break;
> +	case PM_POST_SUSPEND:
> +	case PM_POST_HIBERNATION:
> +	case PM_POST_RESTORE:
> +		ti_csi2rx_resume(csi->dev);

[Severity: Critical]
Does replacing the dev_pm_ops suspend and resume callbacks with PM notifiers
break hybrid sleep (suspend-to-both)?

During hybrid sleep, the system creates a hibernation image, triggers the
PM_POST_HIBERNATION notifier which restarts the streams here, and then dire=
ctly
transitions to S3 suspend without firing the PM_SUSPEND_PREPARE notifier ag=
ain.

Because there is no suspend callback to notify the driver of the S3
transition, could the device be actively performing DMA to RAM while the sy=
stem
goes to sleep?

> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
[ ... ]
> @@ -1644,6 +1777,8 @@ static void ti_csi2rx_remove(struct platform_device=
 *pdev)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);

[Severity: High]
This is a pre-existing issue, but does calling pm_runtime_set_suspended()
earlier in this function cause ti_csi2rx_cleanup_ctx() to leak DMA channels?

By forcefully setting the status to suspended, ti_csi2rx_cleanup_ctx()
evaluates !pm_runtime_status_suspended(ctx->csi->dev) as false, causing the
driver to skip the dma_release_channel() calls.

> =20
>  	ti_csi2rx_cleanup_notifier(csi);
> +	unregister_pm_notifier(&csi->pm_notifier);

[Severity: High]
Is there a race window here that could lead to a use-after-free?

Since unregister_pm_notifier() is called after ti_csi2rx_cleanup_ctx(), whi=
ch
destroys V4L2 structures and releases DMA channels, if a system suspend is
triggered concurrently during this window, the PM notifier could execute
ti_csi2rx_suspend(). The suspend callback would then dereference ctx->dma.c=
han
and call dmaengine_terminate_sync() on a freed channel.

> +
>  	ti_csi2rx_cleanup_v4l2(csi);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D17
