Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566487;
	b=tk7YXOe4rhJOXWw9YPvd6ieDtA0YtpQlf4nrHj8WWFzNShCz3VNjhysQQT5A2D8rgN0o
	 auR63cL165ETLN0avNbhe0kkJnjGb3G2gdr2GMZQ85F0L/m3ow+GwBZDAJjTzSYv4kXdT
	 f2o3TfexF5m1aCoR3YQcVPv+QbJt4XRSxgcuT8gBPSNUOBEOWHNhRcfqSLXzcV29PpUyZ
	 lr4yqRDzYKrI7C6u7K0VWuCeXiZIUh9ZCM4XzJ9Ggz82MZVesW2pMhNvKDK2U5s3xD6bO
	 DjzMQFfBKzOAb64VxElxjemcgRzdIImSoVWVM0nDuke7UORiycR5cZWEx6J3cgUIhqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566487;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=45XYvXCnsTztfQJbckdOLzVgr9QtBfYxpIN2pBuk+co=;
	b=g0ZrtIftw6uuku2b2dUhaNe7KMuFKlYDxvWBBZF4UR1eOEJVCRP5GXeXfGL6Tn36ZRH2
	 H0H3pM+KffN9wXxZgOZfFNlBxWaSbqA9Uchx0DXbYDYs0m8ERjfd5IZUn/uJoRGskSDM9
	 F2OhnvZNRL+LahUnR8yv34PbxA8LZguTr1xH5yFZegl8L/igQaYA8mAhJIiyeYyThO+df
	 PpDZvUNmXKiyp9NMsdl5uKP+BEgD9DyTNMiTj2BeQcSfpYArpgc9DSNaTa7R0YRONUclF
	 ZAc/gSFXhjvN5zVkXwXOZrqUUr1l0aFWoV2YfAVWCNR93AXBN/RH9tzRxnGfKvfz/yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXnpKpIm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3940606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXnpKpIm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAB91F000C4;
	Wed, 25 Nov 2026 00:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795566487;
	bh=45XYvXCnsTztfQJbckdOLzVgr9QtBfYxpIN2pBuk+co=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mXnpKpImFz2pcqBjHafud6WD94ZHOtfoocmrzxkw8NZTdFH2kjYuEdebsltmMJp7T
	 rEIicILNqlQuMebovHXAjzCIo8Qq5ICLBga7sOVnuonSXYlZSgoVmHZv+igygJrhTy
	 1IH8/veav+GnoETefrf31WdA59JD0WihYKCNbKJMqfIIjxsOe5/L3CcWUMZRuGNJzH
	 tDWIQTtqNAwiUfQYZgClUbHjW6TwYTeIWB0cW//Yh13F3o85BNrj3lJBHTOxwZbce2
	 ZOvoqXL2lDe14GXgLTBDzTYlECwZaIGMK6Tpg/tF0uAu71g/ESwZtCTLtka0SM68gL
	 DMQ7APZBZogzQ==
Message-ID: <sashiko-outbox-232292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] misc: fastrpc: query the dsp capabilities during
 probe time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anandu Krishnan E" <anandu.e@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-fastrpc-hpass-support-v1-3-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
 <20261125-fastrpc-hpass-support-v1-3-cb1d46b29e3b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 00:28:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] misc: fastrpc: NULL deref and teardown race in
  fastrpc_cap_query_work()
- [High] misc: fastrpc: leak of ctx, DMA buf, fl, and cctx in
  fastrpc_cap_query_work()
- [Medium] misc: fastrpc: race duplicating ADSP sessions after
  misc_register()
- [Medium] misc: fastrpc: misuse of WQ_MEM_RECLAIM on per-channel cap_wq
  in probe()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] misc: fastrpc: NULL pointer dereference in
  fastrpc_remote_heap_alloc() [1]
--

commit 5d26fca6a35553f861e698fe1de404c633098aee
Author: Anandu Krishnan E <anandu.e@oss.qualcomm.com>

misc: fastrpc: query the dsp capabilities during probe time

This commit moves the DSP capability query to an asynchronous per-channel
workqueue at probe time and registers the FastRPC device nodes once the
query completes.

> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index c515097c3d3ba..59ef755feeaf0 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
[ ... ]
> @@ -2704,6 +2708,159 @@ static int fastrpc_init_reserved_mem(struct fastr=
pc_channel_ctx *cctx,
>  				  cctx->vmperms, cctx->vmcount);
>  }
> =20
> +static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
> +				    struct rpmsg_device *rpdev)
> +{
> +	struct device *rdev =3D &rpdev->dev;
> +	int err, i;
> +
> +	switch (cctx->domain_id) {
> +	case ADSP_DOMAIN_ID:
> +	case MDSP_DOMAIN_ID:
> +	case SDSP_DOMAIN_ID:
> +	case HPASS_DOMAIN_ID:
> +		cctx->unsigned_support =3D false;
> +		err =3D fastrpc_device_register(rdev, cctx, cctx->secure, cctx->domain=
);
> +		if (err)
> +			goto err_depopulate;
> +		break;
[ ... ]
> +	/* Duplicate the last session so multiple processes can share
> +	 * the same compute bank.
> +	 */
> +	if (cctx->domain_id =3D=3D ADSP_DOMAIN_ID && cctx->sesscount > 0) {
> +		struct fastrpc_session_ctx *last_sess;
> +		struct fastrpc_session_ctx *dup_sess;
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&cctx->lock, flags);
> +		last_sess =3D &cctx->session[cctx->sesscount - 1];
> +		for (i =3D 0; i < FASTRPC_DUP_SESSIONS; i++) {
> +			if (cctx->sesscount >=3D FASTRPC_MAX_SESSIONS)
> +				break;
> +			dup_sess =3D &cctx->session[cctx->sesscount++];
> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
> +		}
> +		spin_unlock_irqrestore(&cctx->lock, flags);
> +	}

[Severity: Medium]
Can an open() right after fastrpc_device_register() cause memcpy() to mark
all duplicated ADSP sessions as used?

Before this patch, fastrpc_device_register() ran before
fastrpc_cb_devices_create(), so cctx->sesscount was 0 when the miscdevice
appeared.  Now cctx->sesscount is already populated when
fastrpc_device_register() exposes the device node:

CPU0 (kworker)                    CPU1 (userspace open)
fastrpc_register_devices()
  fastrpc_device_register()
    misc_register()
                                  fastrpc_device_open()
                                    fastrpc_session_alloc()
                                      session[sesscount - 1].used =3D true
  spin_lock_irqsave(&cctx->lock)
  last_sess =3D &cctx->session[cctx->sesscount - 1]
  memcpy(dup_sess, last_sess, ...)
    /* copies used =3D true into all 4 dup_sess slots */

Those duplicated session slots have no owning fastrpc_user and remain
unallocatable for the lifetime of the channel.  Duplicating the ADSP
sessions before calling fastrpc_device_register() avoids exposing the
partially initialized session table.

[ ... ]

> +static void fastrpc_cap_query_work(struct work_struct *work)
> +{
> +	struct fastrpc_channel_ctx *cctx =3D
> +		container_of(work, struct fastrpc_channel_ctx, cap_query_work);
> +	struct rpmsg_device *rpdev =3D cctx->rpdev;
> +	struct device *rdev =3D &rpdev->dev;
> +	u32 *dsp_attributes;
> +	struct fastrpc_user *fl;
> +	unsigned long flags;
> +	int err;
> +
> +	fl =3D kzalloc_obj(*fl);
> +	if (!fl)
> +		goto register_devices;
> +
> +	spin_lock_init(&fl->lock);
> +	mutex_init(&fl->mutex);
> +	INIT_LIST_HEAD(&fl->pending);
> +	INIT_LIST_HEAD(&fl->maps);
> +	INIT_LIST_HEAD(&fl->mmaps);
> +	INIT_LIST_HEAD(&fl->user);
> +	fl->cctx =3D cctx;
> +	fl->pd =3D ROOT_PD;
> +	kref_init(&fl->refcount);
> +	fastrpc_channel_ctx_get(cctx);
> +
> +	fl->sctx =3D fastrpc_session_alloc(fl);
> +	if (!fl->sctx) {
> +		dev_warn(rdev, "no session for capability query, skipping\n");
> +		fastrpc_user_put(fl);
> +		goto register_devices;
> +	}
> +
> +	dsp_attributes =3D kzalloc_objs(*dsp_attributes, FASTRPC_MAX_DSP_ATTRIB=
UTES);
> +	if (!dsp_attributes)
> +		goto err_cleanup_register;
> +
> +	/* Linked into cctx->users so fastrpc_rpmsg_remove() can abort us
> +	 * via fastrpc_notify_users() instead of waiting out the timeout.
> +	 */
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	if (!cctx->rpdev) {
> +		spin_unlock_irqrestore(&cctx->lock, flags);
> +		goto err_cleanup_noreg;
> +	}

[Severity: High]
This problem wasn't introduced by this patch, but fastrpc_rpmsg_remove()
clears cctx->rpdev without waiting for in-flight invocations [1],
which can cause a NULL pointer dereference in fastrpc_remote_heap_alloc().

fastrpc_internal_invoke() checks fl->cctx->rpdev locklessly and does not
hold the lock across argument allocation:

CPU0                              CPU1
fastrpc_internal_invoke()
  if (!fl->cctx->rpdev)
                                  fastrpc_rpmsg_remove()
                                    spin_lock_irqsave(&cctx->lock, ...)
                                    cctx->rpdev =3D NULL
                                    spin_unlock_irqrestore(&cctx->lock, ...)
  fastrpc_get_args()
    fastrpc_remote_heap_alloc()
      rdev =3D &fl->cctx->rpdev->dev
      __fastrpc_buf_alloc(..., rdev, ...)
        <-- NULL pointer dereference

> +	list_add_tail(&fl->user, &cctx->users);
> +	spin_unlock_irqrestore(&cctx->lock, flags);
> +
> +	err =3D fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_A=
TTRIBUTES);
> +
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	list_del(&fl->user);
> +	spin_unlock_irqrestore(&cctx->lock, flags);
> +
> +	if (err =3D=3D -EPIPE) {
> +		/* Channel is going away; remove() will tear it down. */
> +		goto err_cleanup_noreg;
> +	}

[Severity: High]
Can a concurrent fastrpc_rpmsg_remove() trigger a NULL pointer dereference
or register device nodes on a removed channel in fastrpc_cap_query_work()?

fastrpc_rpmsg_remove() sets cctx->rpdev =3D NULL and calls
fastrpc_notify_users() once before waiting in
cancel_work_sync(&cctx->cap_query_work).  At the top of
fastrpc_cap_query_work(), rpdev =3D cctx->rpdev is read without holding
cctx->lock or checking for NULL:

CPU0                              CPU1 (kworker)
fastrpc_rpmsg_remove()
  spin_lock_irqsave(&cctx->lock)
  cctx->rpdev =3D NULL
  spin_unlock_irqrestore(&cctx->lock)
  cancel_work_sync(&cctx->cap_query_work)
                                  fastrpc_cap_query_work()
                                    rpdev =3D cctx->rpdev  /* NULL */
                                    fastrpc_session_alloc() -> NULL
                                    goto register_devices
                                    fastrpc_register_devices(cctx, NULL)
                                      fastrpc_device_register(NULL, ...)
                                        <-- NULL pointer dereference

Even when cctx->rpdev is non-NULL at the locked check before
fastrpc_get_info_from_dsp(), dropping cctx->lock allows
fastrpc_rpmsg_remove() to clear cctx->rpdev and run fastrpc_notify_users()
before fastrpc_context_alloc() adds ctx->node to fl->pending;
fastrpc_invoke_send() then dereferences cctx->rpdev->ept while cctx->rpdev
is NULL.

Also, if fastrpc_rpmsg_remove() clears cctx->rpdev after
fastrpc_get_info_from_dsp() has already returned (for example with 0 or
-ETIMEDOUT), err is not -EPIPE, so fastrpc_cap_query_work() falls through
to register_devices and registers the miscdevices during teardown.

[ ... ]

> +err_cleanup_register:
> +	kfree(dsp_attributes);
> +	fastrpc_session_free(cctx, fl->sctx);
> +	fl->sctx =3D NULL;
> +	fastrpc_user_put(fl);
> +	goto register_devices;
> +
> +err_cleanup_noreg:
> +	kfree(dsp_attributes);
> +	fastrpc_session_free(cctx, fl->sctx);
> +	fl->sctx =3D NULL;
> +	fastrpc_user_put(fl);
> +	return;

[Severity: High]
Does fastrpc_cap_query_work() leak the invoke context, its DMA buffer, fl,
and cctx when fastrpc_get_info_from_dsp() fails with -ETIMEDOUT or -EPIPE?

fastrpc_context_alloc() takes a reference on fl (released only in
fastrpc_context_free()) and a reference on cctx, and fastrpc_invoke_send()
takes a second reference on ctx for the rpmsg reply callback:

drivers/misc/fastrpc.c:fastrpc_internal_invoke() {
    ...
bail:
	if (err !=3D -ERESTARTSYS && err !=3D -ETIMEDOUT) {
		/* We are done with this compute context */
		spin_lock(&fl->lock);
		list_del(&ctx->node);
		spin_unlock(&fl->lock);
		fastrpc_context_put(ctx);
	}
    ...
}

On -ETIMEDOUT, fastrpc_internal_invoke() leaves ctx on fl->pending without
dropping its reference.  fastrpc_user_put(fl) here only drops fl->refcount
from 2 to 1 because ctx still holds a reference to fl, while fl->pending is
only drained in fastrpc_user_free(), leaving fl and ctx in a reference
cycle.  In addition, fastrpc_session_free(cctx, fl->sctx) releases the
session back to the pool for reuse while ctx->buf is still mapped on that
session's IOMMU context bank.

On -EPIPE from fastrpc_notify_users(), fastrpc_internal_invoke() removes
ctx from fl->pending and calls fastrpc_context_put(ctx) once, dropping
ctx->refcount from 2 to 1.  Because the channel is being removed and the
rpmsg callback will not run, the second reference taken by
fastrpc_invoke_send() is never dropped, so ctx, ctx->buf, fl, and cctx are
never freed.

[ ... ]

> @@ -2804,31 +2933,27 @@ static int fastrpc_rpmsg_probe(struct rpmsg_devic=
e *rpdev)
> =20
>  	err =3D fastrpc_cb_devices_create(rpdev);
>  	if (err)
> -		goto err_deregister_fdev;
> -
> -	if (data->domain_id =3D=3D ADSP_DOMAIN_ID && data->sesscount > 0) {
> -		struct fastrpc_session_ctx *last_sess;
> -		struct fastrpc_session_ctx *dup_sess;
> -		unsigned long flags;
> +		goto err_unmap_heap;
> =20
> -		spin_lock_irqsave(&data->lock, flags);
> -		last_sess =3D &data->session[data->sesscount - 1];
> -		for (i =3D 0; i < FASTRPC_DUP_SESSIONS; i++) {
> -			if (data->sesscount >=3D FASTRPC_MAX_SESSIONS)
> -				break;
> -			dup_sess =3D &data->session[data->sesscount++];
> -			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
> -		}
> -		spin_unlock_irqrestore(&data->lock, flags);
> +	/* Probe returns immediately; the capability query and device node
> +	 * registration happen asynchronously on this channel's own queue.
> +	 */
> +	data->cap_wq =3D alloc_ordered_workqueue("fastrpc_cap_wq_%s",
> +					       WQ_HIGHPRI | WQ_MEM_RECLAIM,
> +					       domain);

[Severity: Medium]
Should this workqueue be allocated without WQ_MEM_RECLAIM, or use a shared
system workqueue instead?

WQ_MEM_RECLAIM spawns a dedicated rescuer kthread per channel that stays
alive until fastrpc_rpmsg_remove(), and requires the work item not to enter
direct memory reclaim.  fastrpc_cap_query_work() is not part of a memory
reclaim path and performs GFP_KERNEL allocations in kzalloc_obj(),
dma_alloc_coherent(), and misc_register().  Queuing cap_query_work on
system_highpri_wq (or system_dfl_wq) would run queries for different
domains concurrently without a per-channel workqueue or rescuer kthread.

[1] https://sashiko.dev/#/bug/linux-94614a33-7b4b-4011-a75a-fc1470b783b0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-fastrpc-hp=
ass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com?part=3D3
