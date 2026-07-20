Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EBE3C98AF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534116; cv=none; b=mg/FTANpCjZLNerwV8YMa/+We/U26W8d4lpDOhZMmQoKCP4DiPQGA9HTb/Ze2Kenfpk1B9GqC8BIBex6NYUlok1sHygKYKVo71ymovCF3RHQ1S9aVh68bp/nXNlaALfRdMayAQyJpDvOpC8h8uQ9nJjwvi/p0ToI+ig7llWFK6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534116; c=relaxed/simple;
	bh=+syXaFjIkuYbhqaVzYfnqCZmsIL/auc/WqERWjrhROw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MN6GdV0P+LuK/PvsnzCyZ0QTGh2bwYCyenhO1pabAKadCrKZ6zv2UmZGghi0N+2/VunBjvMU2pr0NdaGPJI2ukG1AUyNytJpu4L6dA0nCpw3bxbWYmC9NJ1VNlAAWMUDyUY3I7E/6HAzbIzMWgDNMx6HU7HShmnXmSnsdk9F12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5205bTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5205bTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C0A1F000E9;
	Mon, 20 Jul 2026 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784534114;
	bh=oygBPNxdQQcp7wWoGKNOVav81ZHrXdALSS5SwKO5+oo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R5205bTA9k1lhTLi1XsAD6vXxnu34KqElYJdVDNWLByCfa4Ac78EQdUG9Y7Sbt7KB
	 1EvM7oUIo5jn5GICyL+jRd8QK63hB2KrZINM08ubwnLm7mgoTP/KrrhFlvgplTPVnq
	 iNR3U8zUrkfZ0RZsULFMo0YS6qUP2S97yuggGjA3w9Oz4Szc5zGX/DkvDSyI4a/EC9
	 LMhdEs4d2+hx9BLtJLTIa4aY9pk33VWKlh+yQ3aXp0FLcvoo5f5ii5td7EqZeyguR8
	 Af0TD0QlnvWn83/+7HtxGNTTP1zUbgycBFdHyaT5qI9kK5Kh1c1XokgieaF4JArDqM
	 FZIxFWnbomqTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] tee: add MbedTEE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Loong" <xing.xl.loong@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720073558.799755-4-xing.xl.loong@gmail.com>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
 <20260720073558.799755-4-xing.xl.loong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 07:55:13 +0000
Message-Id: <20260720075514.29C0A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] Unvalidated cmd.size in the rpc_pick_next error path causes ke=
rnel stack buffer overflow.
- [High] xa_insert_irq() called with GFP_KERNEL causes sleeping in atomic c=
ontext.
- [High] Early parameter validation failure in mbedtee_supp_send() hangs ke=
rnel worker threads.
- [High] Malicious TEE can deadlock the kernel by sending supplicant reques=
ts as async RPCs.
- [High] RPC call object is accessed after being freed when wait_for_comple=
tion is interrupted.
- [High] UAF and list corruption in mbedtee_supp_recv due to unprotected ac=
cess.
- [High] Unvalidated parameter attributes from the TEE allow an attacker to=
 permanently leak shared memory object references.
- [Medium] RISC-V yield calls fail spuriously with -ENOSPC when the REE-to-=
TEE ring is transiently full.
- [Medium] The required buffer size is not returned to userspace when a sup=
plicant buffer is too small.
- [Medium] Infinite retry loop in workqueue on TEE failure blocks teardown.
- [Medium] Leaked RPC calls on module removal due to xa_destroy without ele=
ment freeing.
- [Medium] Data race on complete_work_pending between IRQ and workqueue con=
texts.
- [Medium] Transient memory allocation failure in rpc_pick_next stalls the =
ring buffer permanently.
--

--- Patch [3]: [PATCH v3 3/3] tee: add MbedTEE driver ---
commit a7be6b832a5cd2c0d320336aea6907717da8717c
Author: Xing Loong <xing.xl.loong@gmail.com>

tee: add MbedTEE driver

This patch adds a Linux TEE driver that communicates with MbedTEE OS via a
fixed shared-memory RPC protocol. It supports ARM TrustZone and RISC-V IMSIC
platforms.

> diff --git a/drivers/tee/mbedtee/core.c b/drivers/tee/mbedtee/core.c
> --- a/drivers/tee/mbedtee/core.c
> +++ b/drivers/tee/mbedtee/core.c

[ ... ]

> @@ -198,16 +198,15 @@ static void mbedtee_remove(struct platform_device *=
pdev)
>  {
>  	struct mbedtee_device *mbedtee =3D platform_get_drvdata(pdev);
> =20
>  	tee_device_unregister(mbedtee->teedev);
>  	/*
>  	 * Drain T2R before tearing down R2T: queued RPC work may still need
>  	 * to send COMPLETE_TEE over R2T. Destroy the supplicant mutex only
>  	 * after RPC work can no longer enter mbedtee_supp_handler().
>  	 */
>  	mbedtee_rpc_uninit(mbedtee);
>  	mbedtee_r2t_uninit(mbedtee);
>  	mbedtee_supp_uninit(&mbedtee->supp);
>  	tee_shm_pool_free(mbedtee->pool);
>  	xa_destroy(&mbedtee->rpc_calls);

[Severity: Medium]
Are the elements in the xarray leaked on module removal? Calling xa_destroy
frees the internal nodes of the xarray, but it does not iterate over and fr=
ee
the elements themselves. Any RPC calls left in the MBEDTEE_RPC_CALL_INTERRU=
PTED
state would be permanently leaked.

>  }

> diff --git a/drivers/tee/mbedtee/rpc_callee.c b/drivers/tee/mbedtee/rpc_c=
allee.c
> --- a/drivers/tee/mbedtee/rpc_callee.c
> +++ b/drivers/tee/mbedtee/rpc_callee.c

[ ... ]

> @@ -148,15 +148,15 @@ static void t2r_ring_read(struct mbedtee_t2r_ctx *c=
tx,
>  }
> =20
>  static bool rpc_queue_complete_only(struct mbedtee_t2r_ctx *ctx,
>  				    u64 waiter_id)
>  {
>  	if (ctx->complete_work_pending)

[Severity: Medium]
Is there a data race on complete_work_pending here? This variable is read a=
s a
plain C variable in this IRQ context, but it is modified using WRITE_ONCE in
rpc_routine from a workqueue context. This could allow the compiler to cache
or reorder the read, potentially leaving the driver perpetually thinking a
completion work is pending.

>  		return false;
> =20
>  	ctx->complete_work_pending =3D true;
>  	ctx->complete_work.waiter_id =3D waiter_id;
>  	queue_work(ctx->rpc_wq, &ctx->complete_work.work);
> =20
>  	return true;
>  }

[ ... ]

> @@ -215,9 +215,9 @@ static struct rpc_work *rpc_pick_next(struct mbedtee_=
device *mbedtee,
> =20
>  		if (off > ctx->t2r_shm_sz - cmd.size)
>  			goto skip;
> =20
>  		new_work =3D kzalloc_obj(*new_work, GFP_ATOMIC);
>  		if (!new_work)
>  			return NULL;

[Severity: Medium]
Does a transient memory allocation failure here permanently stall the ring
buffer? If kzalloc_obj fails with GFP_ATOMIC, the function returns NULL and
rpc_drain_ring breaks out of its loop without advancing the read pointer.
The TEE thread would block forever since the entry remains unprocessed and =
no
retry is scheduled.

> =20
>  		t2r_ring_advance(ctx, sizeof(cmd));

[ ... ]

> @@ -279,11 +279,11 @@ skip:
>  	if (cmd.waiter_id !=3D 0 && !rpc_queue_complete_only(ctx, cmd.waiter_id=
))
>  		return NULL;
> =20
>  	/*
>  	 * Bad or unhandled entry: consume header plus any inline payload
>  	 * (async RPC payloads follow the header in the ring) to keep the
>  	 * ring moving.  For sync RPCs payload is in t2r_shm, not the ring.
>  	 */
>  	t2r_ring_advance(ctx, sizeof(cmd) + (cmd.waiter_id ? 0 : cmd.size));

[Severity: Critical]
Can this advance the read pointer by an unvalidated size and cause a stack
buffer overflow? In rpc_pick_next, if an async RPC jumps to the skip label,
t2r_ring_advance is called with 32 + cmd.size without checking if cmd.size
exceeds the ring buffer capacity.=20

If a malicious TEE sets a very large cmd.size, the read pointer wraps. On t=
he
next iteration, t2r_available_size underflows and t2r_ring_copy executes
a memcpy of up to 4GB directly into the cmd struct on the kernel stack.

> =20
>  	return NULL;
>  }

[ ... ]

> @@ -296,14 +296,14 @@ static void rpc_drain_ring(struct mbedtee_device *m=
bedtee)
>  	spin_lock_irqsave(&ctx->ring_lock, flags);
>  	while (READ_ONCE(ctx->t2r_ring_rd) !=3D
>  	    /* Pair with producer store-release after ring write. */
>  	    smp_load_acquire(&ctx->t2r_ring->wr)) {
>  		rw.data =3D ctx->rpc_data;
>  		c =3D rpc_pick_next(mbedtee, ctx, &rw);
>  		if (!c)
>  			break;
> =20
>  		if (c->waiter_id =3D=3D 0) {
>  			c->func(mbedtee, c->data, c->size);

[Severity: High]
Is it possible for a malicious TEE to deadlock the kernel by sending
supplicant requests as async RPCs? The TEE-to-REE interrupt handler runs in
hard IRQ context, and rpc_drain_ring relies entirely on cmd.waiter_id =3D=
=3D 0
to process a command inline.=20

If the TEE sends MBEDTEE_RPC_REEFS with waiter_id =3D 0, the driver invokes
mbedtee_supp_handler inline while holding the ring_lock. That function
allocates memory with GFP_KERNEL and calls wait_for_completion, both of
which sleep in atomic context.

>  		} else {
>  			INIT_WORK(&c->work, rpc_routine);
>  			queue_work(ctx->rpc_wq, &c->work);
>  		}
>  	}
>  	spin_unlock_irqrestore(&ctx->ring_lock, flags);
>  }

[ ... ]

> @@ -339,12 +339,12 @@ static void rpc_routine(struct work_struct *work)
>  	 * Keep retrying rather than silently dropping the completion, which
>  	 * would leave the TEE thread blocked in rpc_call_sync forever.
>  	 * On ARM the fastcall is a direct SMC so -ENOSPC never occurs.
>  	 */
>  	do {
>  		ret =3D mbedtee_rpc_fastcall(c->mbedtee, MBEDTEE_RPC_COMPLETE_TEE,
>  					   (unsigned long)c->waiter_id, 0, 0);
>  		if (ret !=3D -ENOSPC && ret !=3D -ENOMEM)
>  			break;
>  		cond_resched();
>  	} while (1);

[Severity: Medium]
Could this loop infinitely if the ring buffer remains full? If
mbedtee_rpc_fastcall repeatedly returns -ENOSPC (which occurs on RISC-V when
the R2T ring is full), it retries indefinitely. If the TEE crashes and stops
draining the ring, this loop never terminates, and destroy_workqueue during
module removal would block forever waiting for the hung work item.

> =20
>  	if (c !=3D &ctx->complete_work) {

> diff --git a/drivers/tee/mbedtee/rpc_caller.c b/drivers/tee/mbedtee/rpc_c=
aller.c
> --- a/drivers/tee/mbedtee/rpc_caller.c
> +++ b/drivers/tee/mbedtee/rpc_caller.c

[ ... ]

> @@ -35,12 +35,12 @@ int mbedtee_rpc_call_alloc(struct mbedtee_device *mbe=
dtee,
>  	rcall->rpc.ret =3D -EOPNOTSUPP;
>  	rcall->rpc_phys =3D mbedtee_virt_to_phys(&rcall->rpc);
> =20
>  	do {
>  		rpc_index =3D atomic_long_inc_return(&mbedtee->rpc_call_seq);
>  	} while (rpc_index =3D=3D 0);
> =20
>  	ret =3D xa_insert_irq(&mbedtee->rpc_calls, rpc_index, rcall, GFP_KERNEL=
);

[Severity: High]
Does this code sleep in atomic context? The driver initializes
mbedtee->rpc_calls with XA_FLAGS_ALLOC1. Calling xa_insert_irq with
GFP_KERNEL drops the spinlock but leaves hardware interrupts disabled, then
calls kmem_cache_alloc with GFP_KERNEL which can sleep, violating atomic
context rules.

>  	if (ret !=3D 0) {
>  		kfree(rcall);
>  		return ret;
>  	}

[ ... ]

> @@ -170,14 +170,14 @@ static int mbedtee_param_decode(struct tee_param *p=
arams,
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			p->u.memref.size =3D rtp->memref.size;
>  			break;
>  		default:
>  			return -EINVAL;
>  		}
>  		p->attr =3D attr;

[Severity: High]
Can a malicious TEE permanently leak shared memory object references by
returning unvalidated parameter attributes? The kernel decodes the parameter
types returned by the TEE and unconditionally overwrites the local p->attr
with the TEE's value.=20

If userspace passes a MEMREF, a compromised TEE could return a VALUE type f=
or
that slot, causing the TEE subsystem to skip dropping the reference during
cleanup because tee_param_is_memref will see a VALUE type instead.

>  	}
>  	return 0;
>  }

[ ... ]

> @@ -415,12 +415,12 @@ int mbedtee_invoke_func(struct tee_context *ctx,
>  	if (ret) {
>  		mbedtee_rpc_call_free(mbedtee, call);
>  		return ret;
>  	}
> =20
>  	ret =3D mbedtee_rpc_yieldcall(mbedtee, MBEDTEE_RPC_INVOKE_SESSION, call=
, true);
> =20
>  	dev_dbg(mbedtee->dev, "invoke session ret %d gp_ret %d\n", ret,
>  		call->rpc.ret);

[Severity: High]
Does this introduce a use-after-free if wait_for_completion is interrupted?=
 If
mbedtee_rpc_wait_for_completion is interrupted by a signal, it sets the
state to MBEDTEE_RPC_CALL_INTERRUPTED and returns -ERESTARTSYS. The caller
here then reads call->rpc.ret and calls mbedtee_rpc_call_free.

Concurrently, mbedtee_rpc_complete_call can see the INTERRUPTED state, erase
the XArray entry, and free the call structure, causing the original caller =
to
perform UAF reads.

> =20
>  	if (ret !=3D 0) {
>  		arg->ret =3D TEEC_ERROR_COMMUNICATION;

> diff --git a/drivers/tee/mbedtee/rpc_caller_riscv.c b/drivers/tee/mbedtee=
/rpc_caller_riscv.c
> --- a/drivers/tee/mbedtee/rpc_caller_riscv.c
> +++ b/drivers/tee/mbedtee/rpc_caller_riscv.c

[ ... ]

> @@ -75,10 +75,10 @@ long mbedtee_rpc_yieldcall(struct mbedtee_device *mbe=
dtee,
>  	call->rpc.id =3D fn;
> =20
>  	spin_lock_irqsave(&ctx->lock, flags);
>  	if (!rpc_ring_enough(ctx, sizeof(u64))) {
>  		dev_err_ratelimited(mbedtee->dev, "rpc ring full\n");
>  		spin_unlock_irqrestore(&ctx->lock, flags);
>  		return -ENOSPC;

[Severity: Medium]
Should this implement a wait queue or backoff instead of failing immediatel=
y?
On RISC-V, mbedtee_rpc_yieldcall returns -ENOSPC if the r2t-ring buffer is
full, which mbedtee_invoke_func translates to TEEC_ERROR_COMMUNICATION.
Without a polling backoff or wait mechanism, high concurrency from userspace
will easily fill the ring and cause spurious, unrecoverable failures.

>  	}
> =20
>  	phys =3D call->rpc_phys;

> diff --git a/drivers/tee/mbedtee/supp.c b/drivers/tee/mbedtee/supp.c
> --- a/drivers/tee/mbedtee/supp.c
> +++ b/drivers/tee/mbedtee/supp.c

[ ... ]

> @@ -232,18 +232,18 @@ int mbedtee_supp_recv(struct tee_context *ctx,
>  		if (wait_for_completion_interruptible(&supp->reqs_c)) {
>  			ret =3D -ERESTARTSYS;
>  			goto err;
>  		}
>  	}
> =20
>  	/* Record which supplicant context owns this request. */
>  	req->ctx =3D ctx;
> =20
>  	if (req->size > param->u.memref.size) {

[Severity: High]
Can this cause a use-after-free and linked list corruption? After
supp_pop_req removes a request and drops the mutex, the function accesses
req->ctx and req->size locklessly.=20

If mbedtee_supp_abort_all runs concurrently (e.g. on module removal), it
could remove the request from active_reqs, complete it, and free it, causing
UAF reads here. If the size check fails, it then takes the mutex and
manipulates the list links of the freed node, corrupting the supp->reqs lis=
t.

[Severity: Medium]
Does this code fail to return the required buffer size to userspace? When
req->size is larger than param->u.memref.size, it correctly returns -EOVERF=
LOW
but fails to update param->u.memref.size with the required req->size. The
generic TEE framework relies on this updated value to inform userspace how
much memory to allocate, breaking buffer renegotiation.

>  		/* Return the request to the queue so it isn't lost */
>  		mutex_lock(&supp->mutex);
>  		list_del(&req->node);
>  		list_add(&req->node, &supp->reqs);
>  		mutex_unlock(&supp->mutex);
>  		ret =3D -EOVERFLOW;
>  		goto err;
>  	}

[ ... ]

> @@ -262,11 +262,11 @@ int mbedtee_supp_send(struct tee_context *ctx, u32 =
ret, u32 num_params,
>  		      struct tee_param *param)
>  {
>  	struct tee_device *teedev =3D ctx->teedev;
>  	struct mbedtee_device *mbedtee =3D tee_get_drvdata(teedev);
>  	struct mbedtee_supp *supp =3D &mbedtee->supp;
>  	struct mbedtee_supp_req *req;
>  	struct mbedtee_supp_req *_req;
> =20
>  	if (num_params !=3D 1)
>  		return -EINVAL;

[Severity: High]
Could this lead to a permanently hung kernel worker thread? If userspace ca=
lls
TEE_IOC_SUPPL_SEND with invalid parameters (like num_params !=3D 1),
mbedtee_supp_send returns -EINVAL early. Because it does not pop the active
request or complete it, the worker thread executing mbedtee_supp_handler
would remain permanently blocked in wait_for_completion.

> =20
>  	if (!tee_param_is_memref(param))
>  		return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720073558.7997=
55-1-xing.xl.loong@gmail.com?part=3D3
