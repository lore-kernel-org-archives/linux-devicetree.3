Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82590421A0E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913362; cv=none; b=lqox73TaLmZSaymrR6xOJOoViPG4An7o7cmkIurOoNE7qHxAMnlGLtra8foNAihpdCev6QImOgqjcbUfVXN01VRi0vbXX4hR+3h55XXYT/TaSoTi2bvkTToGAwWJD1rgbraZxolmAHN1A97wquOkE+bJNT9ZbEy2ORXhmXbjJ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913362; c=relaxed/simple;
	bh=QcIXrWyLqTtxC+Opx+/0kEzbm391/yCQ5XK+7q3Gpps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XwhDPW5zB5ZPJ4oqzD9Bdu11ygQO3Gl7GUl4I8vE7z9WGfV6OeFdAjzfYH8ujtqHrMp8zt82RYWLTQVtOgM0If6cyZJapn/8GKEw5rdaG3iJgCNC73NR8cz2t8mPSo5Y/oYpsHvUXDjt7+5jgzXK3kOMwpynLr4EVJiNA21Qtbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrcJbYdP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrcJbYdP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040051F00A3A;
	Wed,  1 Jul 2026 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782913360;
	bh=/mDnIxj/pubsR08f05eOQoO4yFtHCYeXu4xO/i/bVeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OrcJbYdPNfM50CB0RQIzdPuL+Z5YpvlxLTt/6MESur31+cLALZyDLiIhpnzWys5hN
	 qOaK1IiGpn5kEGts/yyQYTHMIcBHTbMWTJvTmOFtU1p4AFA4s+BCLbBSahNUn/w47B
	 CPLWjanOmYu8jB1LPYkYJmVt6FRe+M9vXfLBAyN+ei2RbULWFGWfNjZaNerjYnFyTs
	 AswIpp6lEHNxDXqoPby9regNoW2tEk+7cO12zTOq+pNTMzd5dqUw/x1hE6M5VMeO+V
	 Z9mtLy8JlzulsLj2LI1f+uc2rKkWSuwANw/U30/Cj6lQJu7FQw4nqLFdWVdxUPC/5M
	 IAfmo3rRdCeDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] tee: add MbedTEE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Loong" <xing.xl.loong@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701132514.186953-4-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260701132514.186953-4-xing.xl.loong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:42:39 +0000
Message-Id: <20260701134240.040051F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 16 potential issue=
(s) to consider:
- [High] Calling xa_insert_irq() with GFP_KERNEL without XA_FLAGS_LOCK_IRQ =
causes a sleep-in-atomic kernel panic.
- [High] mbedtee_release() leaks sessions if a TEE context acts as a suppli=
cant.
- [High] Transient GFP_ATOMIC allocation failures cause a permanent hang of=
 the TEE-to-REE channel.
- [High] rpc_routine() silently drops the COMPLETE_TEE notification if mbed=
tee_rpc_fastcall() fails with -ENOMEM.
- [High] Closing any single supplicant context incorrectly aborts all unass=
igned global requests.
- [High] Dereferencing and freeing `call` after transferring ownership to t=
he background completion handler on interrupted wait.
- [High] Double free of `tee_shm` object on error path in `mbedtee_supp_rec=
v` due to missing `NULL` assignment.
- [High] Missing reference acquisition for `req->shm` leads to UAF and doub=
le free in `mbedtee_supp_send`.
- [High] Uninitialized or stale error codes are sent to the TEE when suppli=
cant requests complete or abort.
- [High] The TEE-to-REE RPC hardirq handler sleeps while holding a spinlock=
 if the TEE sends an async supplicant request, leading to an immediate kern=
el panic.
- [High] The RPC ring buffer parser skips only the command header when enco=
untering invalid or oversized async RPCs, abandoning payload bytes in the r=
ing.
- [High] Physical pages backing dynamic shared memory are unconditionally f=
reed to the Linux allocator even if the driver fails to revoke the TEE's ac=
cess.
- [High] The driver initializes its local ring buffer indices directly from=
 unvalidated shared memory, enabling arbitrary out-of-bounds kernel memory =
accesses.
- [Medium] mbedtee_release() leaks mbedtee_session objects if mbedtee_close=
_session() fails.
- [Medium] Bypassing wait_for_completion_interruptible() creates an unbound=
ed phantom wakeup accumulation causing CPU spikes.
- [Medium] Permanent memory leak of `mbedtee_rpc_call` structures on module=
 removal for interrupted calls.
--

commit 37902c22c67b16bd6c582807221293c21dc8b899
Author: Xing Loong <xing.xl.loong@gmail.com>
Subject: tee: add MbedTEE driver

This commit adds a new Linux TEE driver for communicating with the MbedTEE
OS. It supports ARM TrustZone and RISC-V IMSIC platforms, utilizing a
shared-memory RPC protocol to interact with the Trusted Execution Environme=
nt.

> diff --git a/drivers/tee/mbedtee/core.c b/drivers/tee/mbedtee/core.c
> --- a/drivers/tee/mbedtee/core.c
> +++ b/drivers/tee/mbedtee/core.c
> @@ -83,10 +83,11 @@ static void mbedtee_release(struct tee_context *ctx)
> =20
>  	if (d->is_supp_ctx) {
>  		mbedtee_supp_release(&mbedtee->supp, ctx);
>  	} else {
>  		list_for_each_entry_safe(s, n, &d->sess_list, list_node)
>  			mbedtee_close_session(ctx, s->session_id);
>  	}
> =20
>  	kfree(d);

[Severity: High]
Does this mutually exclusive block skip session cleanup entirely if the con=
text
was acting as a supplicant? It appears a userspace application could open a
session, act as a supplicant, and close the file descriptor, resulting in
leaked mbedtee_session objects since the else branch is completely bypassed.

[Severity: Medium]
If mbedtee_close_session fails (for example, due to an RPC allocation failu=
re)
and leaves a session in the list, does freeing the context data via kfree
permanently lose the pointers to those session objects?

> [ ... ]
> @@ -195,12 +196,10 @@ static void mbedtee_remove(struct platform_device *=
pdev)
>  	mbedtee_rpc_uninit(mbedtee);
>  	mbedtee_r2t_uninit(mbedtee);
>  	mbedtee_supp_uninit(&mbedtee->supp);
>  	tee_shm_pool_free(mbedtee->pool);
>  	xa_destroy(&mbedtee->rpc_calls);
>  }

[Severity: Medium]
Does xa_destroy only free the internal XArray nodes? If there are any
mbedtee_rpc_call structures left behind by interrupted calls when the module
is removed, it seems this might cause a kernel memory leak.

> diff --git a/drivers/tee/mbedtee/rpc_callee.c b/drivers/tee/mbedtee/rpc_c=
allee.c
> --- a/drivers/tee/mbedtee/rpc_callee.c
> +++ b/drivers/tee/mbedtee/rpc_callee.c
> @@ -224,10 +224,9 @@ static struct rpc_work *rpc_pick_next(struct mbedtee=
_device *mbedtee,
>  skip:
>  	if (cmd.waiter_id !=3D 0 && !rpc_queue_complete_only(ctx, cmd.waiter_id=
))
>  		return NULL;
> =20
>  	/* Bad or unhandled header: consume it to keep the ring moving */
>  	t2r_ring_advance(ctx, sizeof(cmd));
> =20
>  	return NULL;
>  }

[Severity: High]
If an async RPC with an inline payload reaches this skip path, does advanci=
ng
only the header size abandon the payload bytes in the ring? It looks like t=
he
next iteration might mistakenly parse those remaining payload bytes as a new
command header, corrupting the ring buffer permanently.

> [ ... ]
> @@ -245,10 +244,9 @@ static struct rpc_work *rpc_pick_next(struct mbedtee=
_device *mbedtee,
>  		if (off > ctx->t2r_shm_sz - cmd.size)
>  			goto skip;
> =20
>  		new_work =3D kzalloc_obj(*new_work, GFP_ATOMIC);
>  		if (!new_work)
>  			return NULL;
> =20
>  		t2r_ring_advance(ctx, sizeof(cmd));

[Severity: High]
If this transient GFP_ATOMIC memory allocation fails, returning NULL without
advancing the ring or queuing a retry mechanism seems to leave the ring
permanently stalled. Is there a way for the TEE-to-REE channel to recover
from this condition?

> [ ... ]
> @@ -288,14 +286,13 @@ static void rpc_drain_ring(struct mbedtee_device *m=
bedtee)
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
>  		} else {
>  			INIT_WORK(&c->work, rpc_routine);

[Severity: High]
Breaking the loop here on a NULL return from rpc_pick_next due to an
allocation failure appears to abandon ring processing entirely. Will this
leave the TEE waiting for completion indefinitely?

[Severity: High]
For async requests (waiter_id =3D=3D 0), the handler is called inline while
holding the ctx->ring_lock spinlock with interrupts disabled. If the TEE
sends an async supplicant request, does mbedtee_supp_handler end up sleeping
on wait_for_completion in atomic context, leading to a kernel panic?

> [ ... ]
> @@ -328,9 +325,8 @@ static void rpc_routine(struct work_struct *work)
>  	 * Keep retrying rather than silently dropping the completion, which
>  	 * would leave the TEE thread blocked in rpc_call_sync forever.
>  	 * On ARM the fastcall is a direct SMC so -ENOSPC never occurs.
>  	 */
>  	while (mbedtee_rpc_fastcall(c->mbedtee, MBEDTEE_RPC_COMPLETE_TEE,
>  				    (unsigned long)c->waiter_id, 0, 0) =3D=3D -ENOSPC)
>  		cond_resched();

[Severity: High]
Could mbedtee_rpc_fastcall return -ENOMEM instead of -ENOSPC on RISC-V?
If so, this loop exits immediately and drops the COMPLETE_TEE notification,
which might leave the TEE thread permanently blocked.

> [ ... ]
> @@ -420,10 +416,9 @@ int mbedtee_rpc_init(struct mbedtee_device *mbedtee)
>  		memunmap(ctx->t2r_ring);
>  		ctx->t2r_ring =3D NULL;
>  		return -EINVAL;
>  	}
>  	ctx->t2r_ring_sz =3D resource_size(&res) - sizeof(struct rpc_ringbuf);
>  	/* Observe latest producer index only after ring metadata is visible. */
>  	WRITE_ONCE(ctx->t2r_ring_rd, smp_load_acquire(&ctx->t2r_ring->rd));

[Severity: High]
Does reading the initial consumer index directly from unvalidated shared me=
mory
allow a compromised TEE to provide out-of-bounds indices? This might lead to
out-of-bounds reads or writes in kernel memory during ring buffer copies.

> diff --git a/drivers/tee/mbedtee/rpc_caller.c b/drivers/tee/mbedtee/rpc_c=
aller.c
> --- a/drivers/tee/mbedtee/rpc_caller.c
> +++ b/drivers/tee/mbedtee/rpc_caller.c
> @@ -37,10 +37,9 @@ int mbedtee_rpc_call_alloc(struct mbedtee_device *mbed=
tee,
> =20
>  	do {
>  		rpc_index =3D atomic_long_inc_return(&mbedtee->rpc_call_seq);
>  	} while (rpc_index =3D=3D 0);
> =20
>  	ret =3D xa_insert_irq(&mbedtee->rpc_calls, rpc_index, rcall, GFP_KERNEL=
);
>  	if (ret !=3D 0) {
>  		kfree(rcall);

[Severity: High]
The XArray for rpc_calls is initialized with XA_FLAGS_ALLOC1 but lacks
XA_FLAGS_LOCK_IRQ. When xa_insert_irq is called here with GFP_KERNEL, it
disables local interrupts and might attempt to sleep during memory allocati=
on
if the array needs to expand. Could this trigger a sleep-in-atomic panic?

> [ ... ]
> @@ -58,10 +57,9 @@ void mbedtee_rpc_call_free(struct mbedtee_device *mbed=
tee,
> =20
>  	/*
>  	 * If interrupted/completed, complete_call owns this allocation
>  	 * and will xa_erase + kfree when the TEE eventually finishes.
>  	 */
>  	if (READ_ONCE(call->state) =3D=3D MBEDTEE_RPC_CALL_INTERRUPTED)
>  		return;
> =20
>  	xa_erase_irq(&mbedtee->rpc_calls, rpc_index);

[Severity: High]
If ownership is transferred to the background completion handler upon an
interrupted wait, could the background handler free the call object
concurrently while the caller is still accessing it?

> [ ... ]
> @@ -382,10 +380,9 @@ int mbedtee_invoke_func(struct tee_context *ctx,
> =20
>  	ret =3D mbedtee_rpc_yieldcall(mbedtee, MBEDTEE_RPC_INVOKE_SESSION, call=
, true);
> =20
>  	dev_dbg(mbedtee->dev, "invoke session ret %d gp_ret %d\n", ret,
>  		call->rpc.ret);
> =20
>  	if (ret !=3D 0) {
>  		arg->ret =3D TEEC_ERROR_COMMUNICATION;

[Severity: High]
If mbedtee_rpc_yieldcall was interrupted and transferred ownership of the c=
all
object to the background handler, is reading call->rpc.ret here susceptible=
 to
a use-after-free?

> [ ... ]
> @@ -416,10 +413,9 @@ int mbedtee_close_session(struct tee_context *ctx, u=
32 session)
>  	ret =3D mbedtee_rpc_call_alloc(mbedtee, sizeof(*rp), &call);
>  	if (ret !=3D 0) {
>  		/*
>  		 * RPC allocation failed but the session is still alive on
>  		 * the TEE side. Leave it in the session list so a future
>  		 * close attempt can retry; warn so the condition is visible.
>  		 */
>  		mutex_unlock(&ctxdata->mutex);
>  		return ret;

[Severity: Medium]
If this returns early leaving the session in the list, the caller
(mbedtee_release) ignores the error and proceeds to kfree the context data.
Does this permanently leak the mbedtee_session objects?

> diff --git a/drivers/tee/mbedtee/rpc_caller_riscv.c b/drivers/tee/mbedtee=
/rpc_caller_riscv.c
> --- a/drivers/tee/mbedtee/rpc_caller_riscv.c
> +++ b/drivers/tee/mbedtee/rpc_caller_riscv.c
> @@ -170,9 +170,8 @@ int mbedtee_r2t_init(struct mbedtee_device *mbedtee)
>  	}
>  	ctx->ring_sz =3D resource_size(&res) - sizeof(struct rpc_ringbuf);
>  	/* Read initial writer index with acquire for coherent ring bootstrap. =
*/
>  	WRITE_ONCE(ctx->ring_wr, smp_load_acquire(&ctx->ring->wr));
> =20
>  	dev_dbg(mbedtee->dev, "rpc-r2t-ring %pa\n", &res.start);

[Severity: High]
Similar to the T2R ring, does accepting this unvalidated write index from t=
he
TEE-controlled shared memory pose an out-of-bounds memory access risk?

> diff --git a/drivers/tee/mbedtee/shm_pool.c b/drivers/tee/mbedtee/shm_poo=
l.c
> --- a/drivers/tee/mbedtee/shm_pool.c
> +++ b/drivers/tee/mbedtee/shm_pool.c
> @@ -62,10 +62,9 @@ static void pool_op_free(struct tee_shm_pool *pool,
>  	if (!(shm->flags & TEE_SHM_PRIV)) {
>  		struct mbedtee_device *mbedtee =3D tee_get_drvdata(shm->ctx->teedev);
> =20
>  		if (mbedtee->yield && shm->sec_world_id)
>  			mbedtee_shm_unregister(shm->ctx, shm);
>  	}
> =20
>  	free_pages((unsigned long)shm->kaddr, get_order(shm->size));
>  	shm->kaddr =3D NULL;

[Severity: High]
If mbedtee_shm_unregister fails to revoke the TEE's access (for instance, if
the RPC ring is full), the memory pages are still unconditionally freed to =
the
Linux allocator. Could this allow the TEE to maintain access to memory that
gets reused for other kernel processes?

> diff --git a/drivers/tee/mbedtee/supp.c b/drivers/tee/mbedtee/supp.c
> --- a/drivers/tee/mbedtee/supp.c
> +++ b/drivers/tee/mbedtee/supp.c
> @@ -73,10 +73,9 @@ void mbedtee_supp_release(struct mbedtee_supp *supp, s=
truct tee_context *ctx)
>  	 * interfere with each other.
>  	 */
>  	list_for_each_entry_safe(r, n, &supp->reqs, node) {
>  		if (r->ctx && r->ctx !=3D ctx)
>  			continue;
>  		mbedtee_supp_complete_req(r);
>  	}

[Severity: High]
Unassigned global requests waiting in supp->reqs will have r->ctx set to NU=
LL.
This makes the condition evaluate to false. Does this mean that whenever any
single supplicant context is closed, it incorrectly aborts all unassigned
global requests across the system?

> [ ... ]
> @@ -156,10 +155,9 @@ void mbedtee_supp_handler(struct mbedtee_device *mbe=
dtee,
> =20
>  	/* Wake up the supplicant daemon to handle this request. */
>  	complete(&supp->reqs_c);
> =20
>  	wait_for_completion(&req->c);
> =20
>  	kfree(req);
>  }

[Severity: High]
When the request finishes, req->ret contains the completion status. Is this
return code ever copied back into the wire-format cmd->ret in shared memory
before freeing the request, or is the TEE receiving uninitialized data?

> [ ... ]
> @@ -206,10 +204,9 @@ int mbedtee_supp_recv(struct tee_context *ctx,
>  	if (ret !=3D 0)
>  		return ret;
> =20
>  	shm =3D tee_shm_get_from_id(ctx, shm->id);
>  	tee_shm_put(param->u.memref.shm);
>  	if (IS_ERR(shm))
>  		return PTR_ERR(shm);
>  	param->u.memref.shm =3D shm;

[Severity: High]
If tee_shm_get_from_id fails, the function returns the error without cleari=
ng
param->u.memref.shm. Will the TEE core caller's cleanup path call tee_shm_p=
ut
again on this same pointer, causing a double free?

> [ ... ]
> @@ -217,10 +214,9 @@ int mbedtee_supp_recv(struct tee_context *ctx,
>  	d->is_supp_ctx =3D true;
> =20
>  	while (true) {
>  		ret =3D supp_pop_req(supp, &req);
>  		if (ret !=3D 0)
>  			goto err;
>  		if (req)
>  			break;

[Severity: Medium]
If a request is already queued, this bypasses
wait_for_completion_interruptible entirely. Could this leave the internal
completion counter un-decremented, causing phantom wakeups to accumulate and
creating a high CPU spinning loop later when the queue is empty?

> [ ... ]
> @@ -238,10 +234,9 @@ int mbedtee_supp_recv(struct tee_context *ctx,
>  		goto err;
>  	}
> =20
>  	*func =3D req->func;
>  	req->shm =3D shm;
> =20
>  	memcpy(shm->kaddr, req->data, req->size);
>  	param->u.memref.size =3D req->size;

[Severity: High]
This assigns the shared memory pointer to req->shm without bumping its
reference count. If the TEE core drops its reference when returning to
userspace, might this memory be freed prematurely?

> [ ... ]
> @@ -295,11 +290,10 @@ int mbedtee_supp_send(struct tee_context *ctx, u32 =
ret, u32 num_params,
> =20
>  	if (param->u.memref.size > req->size) {
>  		req->ret =3D TEEC_ERROR_COMMUNICATION;
>  	} else {
>  		req->ret =3D ret;
>  		memcpy(req->data, req->shm->kaddr, param->u.memref.size);
>  	}
>  	if (req->shm)
>  		tee_shm_put(req->shm);

[Severity: High]
Following up on the previous question, if req->shm was freed because a
reference was not acquired in mbedtee_supp_recv, does this memcpy and
subsequent tee_shm_put result in a use-after-free and a double free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701132514.1869=
53-1-xing.xl.loong@gmail.com?part=3D3
