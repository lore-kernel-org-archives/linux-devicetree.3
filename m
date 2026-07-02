Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCAD2F8EBF
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006335; cv=none; b=NrdWb/SIzgQKo2b5l2lN5mqPG+lLj1BKY1abXJO2xiYgtM/YcvTgBotr5rsGUmXxNkbVw9zrwaZm7DlK04wt5hpKfebe+LZWX7bNQbuY5/2nChICkoj/IOdXKrbU7itPo6JvBgQBeZj3dxrj2kUi9laz0b7jmJaXMfY32093kv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006335; c=relaxed/simple;
	bh=AkFYEjBBryvT7TlJFIWrHBqktOWJKv1fWUjtMhgxiNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iOss/5Z9kZ10+LemEUH2TqOW/ap1GzzUruUVYhozbeMKkETU82+DuvrgP/Xkz26n57iz74fvCbWTO3X6XiWxg9Loh7zYrCSR6EO31NhVxyKaXo+7XYQtSvdPLJzb12Tcn2W1ZDEeC6zvbhZeLkl8OU/UJCnqlwN4YWPWXMDRbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+71fHft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+71fHft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0725A1F00A3A;
	Thu,  2 Jul 2026 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006333;
	bh=GcssZ2lsZ8ScULOjCSDFxPtb3KRMlDnNrtHdRQy37dQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+71fHft9aLFuoYSmuJUF+AOYXCO3a8RW3VBDDGmaw81/XlrBZ53lP/ruOSxttLIY
	 qVP5NUd9UDQkayHZwUCRo4tllDyjyJkPFI+w8d/p8SAKHPwtwLnA8Ii6R+jh4iAUug
	 RIGl7EW39ALH+hAhO+j0twTFDlmqgCU43OQ/a/2DqWEoljOwQXZ4jjcsYZAESERWgV
	 Rc3PYvokTCxw1r65vEQh8lM67mdTMCufxlUv95gpEwqjcghGptnPymZtfY/e9uMhC7
	 mPRI/UacxJ3wm7EYIitTI8A5D7ulNvCjmBNf+Eat2TPsinNZvOOIQhwoQnA3DeZkEl
	 gh9djfZytvvsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] tee: add MbedTEE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Loong" <xing.xl.loong@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702151115.544016-4-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260702151115.544016-1-xing.xl.loong@gmail.com>
 <20260702151115.544016-4-xing.xl.loong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 15:32:12 +0000
Message-Id: <20260702153213.0725A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] Malicious or malformed asynchronous supplicant RPCs will execu=
te sleeping operations in a hard IRQ handler, causing deadlocks.
- [Critical] The `req->shm` reference is under-retained in `mbedtee_supp_re=
cv()`, leading to a Use-After-Free and double free.
- [Critical] Unvalidated `cmd.size` for rejected async RPCs causes the cons=
umer index to exceed ring buffer bounds, leading to massive memory corrupti=
on.
- [Critical] Type confusion privilege escalation via TEE-controlled paramet=
er attributes.
- [High] Unhandled MSI migration on RISC-V causes lost TEE interrupts and h=
anging RPCs.
- [High] Physical address of the RPC command is silently truncated on 32-bi=
t ARM with LPAE.
- [High] The tee-supplicant's return code is lost and never propagated back=
 to the TEE.
- [High] Module removal deadlocks because the T2R interrupt is torn down be=
fore aborting supplicant requests.
- [High] Initial ring buffer consumer and producer pointers are read from u=
ntrusted shared memory without bounds checking.
- [High] Unaligned memory access in `mbedtee_ree_time` can trigger alignmen=
t faults and kernel panics.
- [Medium] The required buffer size is not returned to the tee-supplicant w=
hen -EOVERFLOW occurs.
- [Medium] Leaking TEE sessions if a context acts as both a client and a su=
pplicant.
- [Medium] Encountering an invalid or unhandled RPC command in the TEE-to-R=
EE ring causes a state machine stall.
--

commit e35eb394dcd64d2ef130e20e3614fccbb5021a07
Author: Xing Loong <xing.xl.loong@gmail.com>

tee: add MbedTEE driver

This patch adds a Linux TEE driver that communicates with MbedTEE OS via a
fixed shared-memory RPC protocol over architecture-specific transports.

> diff --git a/drivers/tee/mbedtee/core.c b/drivers/tee/mbedtee/core.c
> --- a/drivers/tee/mbedtee/core.c
> +++ b/drivers/tee/mbedtee/core.c
> @@ -80,5 +80,6 @@ static void mbedtee_release(struct tee_context *ctx)
> =20
>  	if (d->is_supp_ctx) {
>  		mbedtee_supp_release(&mbedtee->supp, ctx);
>  	} else {
>  		list_for_each_entry_safe(s, n, &d->sess_list, list_node)
>  			mbedtee_close_session(ctx, s->session_id);
>  	}

[Severity: Medium]
Does this skip session cleanup for mixed-use contexts? If a userspace
process opens standard TEE sessions and then calls TEE_IOC_SUPPL_RECV,
d->is_supp_ctx becomes true. When the file descriptor is closed, the
mutually exclusive else branch is skipped, which appears to leak the
sessions in d->sess_list and leaves them permanently open in the TEE.

> diff --git a/drivers/tee/mbedtee/rpc_callee.c b/drivers/tee/mbedtee/rpc_c=
allee.c
> --- a/drivers/tee/mbedtee/rpc_callee.c
> +++ b/drivers/tee/mbedtee/rpc_callee.c
> @@ -245,6 +245,5 @@ static struct rpc_work *rpc_pick_next(struct mbedtee_=
device *mbedtee,
>  skip:
>  	if (cmd.waiter_id !=3D 0 && !rpc_queue_complete_only(ctx, cmd.waiter_id=
))
>  		return NULL;
> =20
>  	t2r_ring_advance(ctx, sizeof(cmd) + (cmd.waiter_id ? 0 : cmd.size));
> =20
>  	return NULL;
>  }

[Severity: Critical]
Does this blind advance allow a malicious TEE to corrupt the ring read
pointer? Because cmd.size is not validated on this error path, an arbitrari=
ly
large value could cause t2r_ring_advance() to jump far outside the actual
ring bounds, leading to integer underflows and out-of-bounds memory accesses
in subsequent operations.

[Severity: Medium]
Does returning NULL here cause the rpc_drain_ring() loop to break entirely?
If an unrecognized command is skipped, returning NULL will unconditionally
stop the processing loop, leaving subsequent valid commands stranded until
another interrupt fires, which could stall the protocol.

> @@ -267,7 +267,6 @@ static void rpc_drain_ring(struct mbedtee_device *mbe=
dtee)
>  		c =3D rpc_pick_next(mbedtee, ctx, &rw);
>  		if (!c)
>  			break;
> =20
>  		if (c->waiter_id =3D=3D 0) {
>  			c->func(mbedtee, c->data, c->size);
>  		} else {

[Severity: Critical]
Can this sequence cause a deadlock in hard IRQ context? The rpc_drain_ring()
function runs in mbedtee_rpc_irq_handler() with the ctx->ring_lock spinlock
held. If a TEE sends a synchronous supplicant RPC like MBEDTEE_RPC_REEFS wi=
th
waiter_id =3D 0, this inline execution will route to mbedtee_supp_handler(),
which performs a GFP_KERNEL allocation and calls wait_for_completion().
Sleeping in a hard IRQ handler while holding a spinlock will crash the syst=
em.

> @@ -400,6 +400,5 @@ static void mbedtee_ree_time(struct mbedtee_device *m=
bedtee,
>  			     void *data, size_t size)
>  {
>  	struct timespec64 *ts =3D data;
> =20
>  	if (size < sizeof(*ts))
>  		return;
> =20
>  	ktime_get_real_ts64(ts);
>  }

[Severity: High]
Does this cause unaligned memory accesses? The data pointer points directly
into shared memory at an offset controlled by the TEE. Writing 64-bit fields
into an unaligned timespec64 structure can trigger alignment faults and
kernel panics on architectures with strict alignment requirements.

> @@ -486,4 +486,5 @@ int mbedtee_rpc_init(struct mbedtee_device *mbedtee)
>  		return -EINVAL;
>  	}
>  	ctx->t2r_ring_sz =3D resource_size(&res) - sizeof(struct rpc_ringbuf);
>  	/* Observe latest producer index only after ring metadata is visible. */
>  	WRITE_ONCE(ctx->t2r_ring_rd, smp_load_acquire(&ctx->t2r_ring->rd));

[Severity: High]
Are we missing a bounds check on the initial read pointer? Loading this
directly from TEE-controlled shared memory without validating that it is
within ctx->t2r_ring_sz could allow a compromised TEE to instantly trigger
out-of-bounds accesses during driver initialization.

> @@ -585,5 +585,6 @@ void mbedtee_rpc_uninit(struct mbedtee_device *mbedte=
e)
>  	mutex_unlock(&mbedtee_cpuhp_mutex);
> =20
>  	if (mbedtee->rpc_ops)
>  		mbedtee->rpc_ops->uninit(mbedtee);
> =20
>  	/*
>  	 * Work queued before IRQ teardown may be blocked in the supplicant
>  	 * path. Abort those requests and reject later ones before draining the
>  	 * workqueue. R2T must stay alive until destroy_workqueue() returns
>  	 * because rpc_routine() sends COMPLETE_TEE replies over R2T.
>  	 */
>  	mbedtee_supp_abort_all(&mbedtee->supp);

[Severity: High]
Will this sequence deadlock during module removal? Unregistering the interr=
upt
via uninit() happens before mbedtee_supp_abort_all(). If aborting requests
triggers shm unregistration, that process makes a synchronous RPC call to t=
he
TEE. Since the interrupt is already torn down, the completion response will
never arrive, causing the removal thread to block indefinitely.

> diff --git a/drivers/tee/mbedtee/rpc_callee_riscv.c b/drivers/tee/mbedtee=
/rpc_callee_riscv.c
> --- a/drivers/tee/mbedtee/rpc_callee_riscv.c
> +++ b/drivers/tee/mbedtee/rpc_callee_riscv.c
> @@ -34,6 +34,5 @@ static void mbedtee_rpc_write_msi_msg(struct msi_desc *=
desc_msi,
>  				      struct msi_msg *msg)
>  {
>  	struct mbedtee_device *mbedtee =3D dev_get_drvdata(desc_msi->dev);
> =20
>  	if (mbedtee)
>  		mbedtee->transport.rpc_msi_msg =3D *msg;
>  }

[Severity: High]
Does this fail to propagate the new IMSIC target to the TEE? When the IRQ
subsystem changes affinity, this callback updates the local message cache,
but it does not write the new callee_imsic_id and callee_hartid back to the
shared ring buffer header. The TEE will continue sending interrupts to the
stale target, leading to lost notifications and hanging RPCs.

> diff --git a/drivers/tee/mbedtee/rpc_caller.c b/drivers/tee/mbedtee/rpc_c=
aller.c
> --- a/drivers/tee/mbedtee/rpc_caller.c
> +++ b/drivers/tee/mbedtee/rpc_caller.c
> @@ -182,5 +182,6 @@ static int mbedtee_param_decode(struct tee_param *par=
ams,
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			p->u.memref.size =3D rtp->memref.size;
>  			break;
>  		default:
>  			return -EINVAL;
>  		}
>  		p->attr =3D attr;
>  	}
>  	return 0;
>  }

[Severity: Critical]
Could this lead to type confusion and privilege escalation? Blindly overwri=
ting
p->attr with the TEE-supplied attribute without verifying it matches the
original request allows a malicious TEE to change a VALUE parameter to a
MEMREF parameter. The generic subsystem will then interpret the user-contro=
lled
value fields as a kernel pointer during tee_shm_put(), allowing arbitrary
kernel memory dereferences.

> diff --git a/drivers/tee/mbedtee/rpc_caller_arm.c b/drivers/tee/mbedtee/r=
pc_caller_arm.c
> --- a/drivers/tee/mbedtee/rpc_caller_arm.c
> +++ b/drivers/tee/mbedtee/rpc_caller_arm.c
> @@ -30,5 +30,6 @@ long mbedtee_rpc_yieldcall(struct mbedtee_device *mbedt=
ee,
>  	call->rpc.id =3D fn;
> =20
>  	arm_smccc_smc(fn, call->rpc_phys,
>  		      0, 0, 0, 0, 0, 0, &res);
>  	ret =3D res.a0;

[Severity: High]
Does this silently truncate the physical address on 32-bit ARM with LPAE?
The call->rpc_phys field is a 64-bit phys_addr_t, but arm_smccc_smc() casts
its arguments to a 32-bit unsigned long. If the memory resides above 4GB,
the upper bits will be lost, giving the TEE an invalid address and causing
memory corruption or crashes.

> diff --git a/drivers/tee/mbedtee/rpc_caller_riscv.c b/drivers/tee/mbedtee=
/rpc_caller_riscv.c
> --- a/drivers/tee/mbedtee/rpc_caller_riscv.c
> +++ b/drivers/tee/mbedtee/rpc_caller_riscv.c
> @@ -166,4 +166,5 @@ int mbedtee_r2t_init(struct mbedtee_device *mbedtee)
>  		return -ENOMEM;
>  	}
>  	ctx->ring_sz =3D resource_size(&res) - sizeof(struct rpc_ringbuf);
>  	/* Read initial writer index with acquire for coherent ring bootstrap. =
*/
>  	WRITE_ONCE(ctx->ring_wr, smp_load_acquire(&ctx->ring->wr));

[Severity: High]
Is it safe to load the initial write pointer from shared memory without bou=
nds
validation? A compromised TEE could set this to an out-of-bounds value prior
to driver initialization, leading to immediate out-of-bounds memory accesse=
s.

> diff --git a/drivers/tee/mbedtee/supp.c b/drivers/tee/mbedtee/supp.c
> --- a/drivers/tee/mbedtee/supp.c
> +++ b/drivers/tee/mbedtee/supp.c
> @@ -153,6 +153,5 @@ void mbedtee_supp_handler(struct mbedtee_device *mbed=
tee,
>  	/* Wake up the supplicant daemon to handle this request. */
>  	complete(&supp->reqs_c);
> =20
>  	wait_for_completion(&req->c);
> =20
>  	kfree(req);
>  }

[Severity: High]
Are we missing a step to propagate the supplicant's return code back to the=
 TEE?
After wait_for_completion() returns, req->ret holds the execution status, b=
ut
this value is never written into the shared memory cmd->ret before req is
freed, causing the TEE to lose the actual result of the operation.

> @@ -203,6 +203,5 @@ int mbedtee_supp_recv(struct tee_context *ctx,
>  		return ret;
> =20
>  	shm =3D tee_shm_get_from_id(ctx, shm->id);
>  	tee_shm_put(param->u.memref.shm);
>  	if (IS_ERR(shm)) {

[Severity: Critical]
Does this pattern lead to a use-after-free and double free? The code acquir=
es
a generic SHM reference and immediately drops the previous reference. This
results in a net zero reference count change, meaning the driver does not t=
ruly
own the reference it assigns to req->shm. When the IOCTL finishes, the gene=
ric
layer will put the reference again, leaving req->shm dangling.

> @@ -231,9 +231,8 @@ int mbedtee_supp_recv(struct tee_context *ctx,
>  	req->ctx =3D ctx;
> =20
>  	if (req->size > param->u.memref.size) {
>  		/* Return the request to the queue so it isn't lost */
>  		mutex_lock(&supp->mutex);
>  		list_del(&req->node);
>  		list_add(&req->node, &supp->reqs);
>  		mutex_unlock(&supp->mutex);
>  		ret =3D -EOVERFLOW;
>  		goto err;
>  	}

[Severity: Medium]
Is the required buffer size missing from the -EOVERFLOW response?
If the user-provided buffer is too small, the driver returns -EOVERFLOW but
fails to update param->u.memref.size with req->size. The userspace supplica=
nt
daemon relies on this updated size to know how much memory to allocate for a
retry.

> @@ -298,5 +298,6 @@ int mbedtee_supp_send(struct tee_context *ctx, u32 re=
t, u32 num_params,
>  		req->ret =3D ret;
>  		memcpy(req->data, req->shm->kaddr, param->u.memref.size);
>  	}
>  	if (req->shm)
>  		tee_shm_put(req->shm);
>  	req->shm =3D NULL;

[Severity: Critical]
Because the reference was not correctly incremented in mbedtee_supp_recv(),
calling tee_shm_put(req->shm) here drops a reference that belongs to the
userspace process, completing the double free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702151115.5440=
16-1-xing.xl.loong@gmail.com?part=3D3
