Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7781E633C
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282091; cv=none; b=tbbKNfBOoo2DzOPXIVgI8B8jHSS6B/QFIhtDRsEfqmnczKSF7WiiANxTt3EOA7OK9TV9u+56FKizu1IhTcfsNGh1DglRNCi+dWZiNIuUW3kZ5v/6ZyYVOST/fylyFzexM4zE/wWBhcHiyD+k/9xkgJPLjVZySt9uXuNgQH25o2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282091; c=relaxed/simple;
	bh=glH7Rzcd5G/7guOgIrV477mDkcFrjVlFyLyToGgr+/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aC0wh1Y0zA5MkAbf2emyi8Olwh/4UdvKdv1NLAf30yNZcdpJkDISq6hN8YiPZKuEb6Tg9LPbpT1VKO6kNjG1BHHxFh3NkOQEQoa5CgZCEyXdT8EIEFwvgozoHChbgspGmzunPIc8gZmCXJlYYBbG9o3pHFGEz5Cjog9dHYJ8A50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQU2qufP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQU2qufP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CB71F00893;
	Wed, 20 May 2026 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282089;
	bh=1XFvYyl0QXBlojGZJItYl8Ns8Rx1fP75CiCjY9pFxe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQU2qufPJzFb5P1qoGKCq8fpbr20m/qANe76Z0BMzWv1YmeDvOwPZNGFNO9+nQxlv
	 c8ox95X3KqeLbBru42nXQSnU+3OKD5o0c1GFFHLU1kB4l/C7ZRjFUoMO8NbYmSTEnW
	 o9B7G9yip5Pg7X+afeA/7wdccDr3SReTRXq8sPJR2RSvxGMjr0wROOs6CzlC1HvZeB
	 H6/J6VVt99uDLwSMHf+cUXopa2IEvBTGEQ7Tyc25+Gfhc+BFVXB2dnFzdgZcS8zFF6
	 moLENRMzWBR3Nv6MZkxFvEsOdCls2PcFPexsw+KvQv9iXZEuWTqhz7B7avcQpe/YDF
	 8LtLJz4u4an6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 14/17] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520120022.539913-15-r-donadkar@ti.com>
References: <20260520120022.539913-15-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 13:01:29 +0000
Message-Id: <20260520130129.A2CB71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Data race and waitqueue corruption due to `init_completion()` bein=
g called outside the lock after the `STOPPED` state is set in `ti_csi2rx_st=
op_dma()`.
- [High] `ti_csi2rx_dma_callback` unconditionally overwrites the `TI_CSI2RX=
_DMA_STOPPED` state, leading to endless draining and a 50ms timeout during =
streamoff.
- [High] Removal of the DMA restart logic causes a permanent stream stall i=
f any DMA transaction fails to prepare or submit.
- [High] Pre-existing drain transactions can trigger a premature completion=
 of the barrier wait in `ti_csi2rx_stop_dma`.
- [Medium] `ti_csi2rx_stop_dma` unconditionally blocks on `wait_for_complet=
ion_timeout`, causing a guaranteed 50ms delay on already-stopped streams or=
 error paths.
- [Medium] The continuously draining architecture generates an excessively =
high interrupt rate during buffer starvation.
--

commit 3364f8fb9264e28b1fb58dc86804662c48056485
Author: Rishikesh Donadkar <r-donadkar@ti.com>

media: ti: j721e-csi2rx: Change the drain architecture for multistream

This patch introduces a continuous drain architecture for multistream
CSI2RX scenarios to prevent buffer starvation on one stream from blocking
the shared HW FIFO. It uses a 32KiB drain buffer and waits for a
completion barrier at the end of the stream.

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
[ ... ]
> @@ -608,9 +613,32 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ct=
x *ctx)
[ ... ]
> +	if (list_empty(&dma->queue)) {
> +		if (ti_csi2rx_drain_dma(ctx))
> +			dev_warn(ctx->csi->dev, "DMA drain failed\n");
> +	} else {
> +		ti_csi2rx_dma_submit_pending(ctx);
> +	}
> +	spin_unlock_irqrestore(&dma->lock, flags);
>  }

[Severity: Medium]
For high-bandwidth CSI-2 streams, a 32KiB buffer fills very quickly.
During user-space buffer starvation, this architecture continually loops
32KiB drain transactions.

Does this generate an excessively high interrupt rate (tens of thousands
per second) that could degrade overall system performance?

[ ... ]
> @@ -702,14 +720,24 @@ static void ti_csi2rx_dma_callback(void *param)
[ ... ]
> -	if (list_empty(&dma->submitted))
> -		dma->state =3D TI_CSI2RX_DMA_IDLE;
> -
> +	if (list_empty(&dma->submitted)) {
> +		dma->state =3D TI_CSI2RX_DMA_DRAINING;
> +		if (ti_csi2rx_drain_dma(ctx))
> +			dev_warn(ctx->csi->dev,
> +				 "DMA drain failed on one of the transactions\n");
> +	}
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  }

[Severity: High]
If ti_csi2rx_stop_dma() concurrently sets the state to
TI_CSI2RX_DMA_STOPPED, does this blindly overwrite it?

If the state gets overwritten to TI_CSI2RX_DMA_DRAINING,
ti_csi2rx_drain_callback() might observe DRAINING instead of STOPPED,
triggering recursive drains and causing the streamoff operation to hit
its 50ms timeout.

[ ... ]
> @@ -754,6 +782,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *=
ctx)
>  	dma->state =3D TI_CSI2RX_DMA_STOPPED;
>  	spin_unlock_irqrestore(&dma->lock, flags);
> =20
> +	init_completion(&ctx->drain_complete);

[Severity: High]
If a concurrent drain DMA completes precisely after the lock is released
but before init_completion() is called, its callback will observe the
STOPPED state and call complete(&ctx->drain_complete).

Can this concurrent execution of complete() and init_completion() cause a
data race on the completion's waitqueue spinlock or lost completion events?
Should init_completion() be called before modifying the state?

[Severity: High]
Additionally, if the state was already TI_CSI2RX_DMA_DRAINING when
ti_csi2rx_stop_dma() is called, there may be a pre-existing drain
transaction currently running.

When this pre-existing drain finishes, its callback observes the new
STOPPED state and immediately calls complete(&ctx->drain_complete).

Does this wake up the wait_for_completion_timeout() below prematurely,
causing the driver to abort via dmaengine_terminate_sync() before the
actual barrier drain has finished clearing the hardware FIFO?

[ ... ]
> @@ -762,11 +792,19 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx=
 *ctx)
[ ... ]
>  		ret =3D ti_csi2rx_drain_dma(ctx);
> -		if (ret && ret !=3D -ETIMEDOUT)
> +		if (ret)
>  			dev_warn(ctx->csi->dev,
>  				 "Failed to drain DMA. Next frame might be bogus\n");
>  	}
> =20
> +	/* We wait for the drain to complete so that the stream stops
> +	 * cleanly, making sure the shared hardware FIFO is cleared of
> +	 * data from the current stream. No more data will be coming from
> +	 * the source after this.
> +	 */
> +	wait_for_completion_timeout(&ctx->drain_complete,
> +				    msecs_to_jiffies(DRAIN_TIMEOUT_MS));

[Severity: Medium]
If the stream was already stopped (e.g., during error handling) or if
ti_csi2rx_drain_dma() failed to prepare a descriptor, no DMA transaction
is queued.

Since no callback will ever signal ctx->drain_complete in these paths, does
this cause the function to unnecessarily block for the full 50ms timeout
every time?

[ ... ]
> @@ -829,57 +867,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffe=
r *vb)
[ ... ]
> -	/*
> -	 * Usually the DMA callback takes care of queueing the pending buffers.
> -	 * But if DMA has stalled due to lack of buffers, restart it now.
> -	 */
> -	if (dma->state =3D=3D TI_CSI2RX_DMA_IDLE) {
[ ... ]
> -	} else {
> -		list_add_tail(&buf->list, &dma->queue);
> -	}
> +	list_add_tail(&buf->list, &dma->queue);
>  	spin_unlock_irqrestore(&dma->lock, flags);

[Severity: High]
The previous architecture actively restarted the DMA engine if it was idle.
By removing this restart logic, the driver now relies entirely on an
unbroken chain of DMA callbacks.

If ti_csi2rx_drain_dma() fails to prepare or submit a descriptor (e.g., due
to memory pressure), the active DMA chain breaks and the DMA engine halts.

Without a way to kickstart the DMA here, do newly queued buffers just
accumulate in dma->queue, resulting in a silent, permanent stream deadlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D14
