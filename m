Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE71744E046
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047106; cv=none; b=Tdhn1Ou42yJ5Z5CSEDyUMOlDKA5/QATi9h2Cp1DUpEOa+cu7+q7hcBoWK7cnmC230XUl/nLhKLspltxCbGOuXm/vCnkApsMSoi+9jX+9sFyzrCzq25ggMHD6PlEW0l6LQdj0N1kQtvh2VbvgosBynTgYXVuQBx5OipOaJMGdnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047106; c=relaxed/simple;
	bh=iBV296Cf/bF1l4zKqm3XDyO1r/OCo8hHmpGBDYKMsyw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BzrCfiiiUtjVqWgPS+nd6Xq6cj2aoK41Rp580yw5Z3LvzqhZ5bEtP7dSoHg2zo47BHiQ7fip7ooyYplZqeFVtlIUuALojeGP52qmOlN8RaFdafg04xEloB3pu8JWvbUra3O0SEugH+DSS2nnYeQRrFIN9ucxVaUsNJyodbQ/sjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwDPctXv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwDPctXv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EB71F000E9;
	Thu,  6 Aug 2026 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047104;
	bh=kGGDgEoNPh6Y68fz5a04HSU4UxI72txWSQ0NEwsR2Ck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UwDPctXvVCavxVLF/AV4qlcyQAsurcJelf7it/KfYaEdpZ2Mm0aM/BZbMnj7ZqoNS
	 A7JTpmij7wkE9KdENbm0Jexibs2zfFNHVQ/AX//BlUlxgJJ928R8/LJ3ZRH7hAKyyo
	 jNVXrL+MlbhR597KA/34yluhb0m3ltpqLIY09kmvjDQM+WcMWuiMAHRIKrqfLksb3U
	 Px6J4ND7Tbhkuvhv/G0hxn7R7QI8MFurbZhf0Db09mg5F9tfG9L/tJD9mi+FLOC2RG
	 x6PenUm/58W6mzSl50QSgC5/X2oY9iVo3VwzuLsxdH8T6Jqy/KBYcwJfjYubWjoXth
	 vnZiItW2h2sRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/19] crypto: cmh - add core platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806195519.2703224-3-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-3-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:11:43 +0000
Message-Id: <20260806201144.64EB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Unconditional algorithm registration leads to a division by ze=
ro crash if the requested hardware core is not present.
- [High] Arming the transaction timeout timer after ringing the hardware do=
orbell creates a race condition leading to an orphaned timer and kernel pan=
ic on module unload.
- [High] Synchronous VCQ submission returns `-ETIMEDOUT` without transferri=
ng DMA buffer ownership to an orphan callback, leading to DMA memory corrup=
tion.
- [High] A TOCTOU race in `cmh_tm_submit_sync_tmo()` reading `msg->actual_m=
bx` allows bypassing the hardware ABORT command, leading to DMA use-after-f=
ree.
- [High] Driver teardown and suspend routines abandon in-flight transaction=
s without halting the hardware, causing DMA writes into freed memory.
- [High] Synchronous submission timeout logic issues a blind ABORT which ma=
y incorrectly stop an unrelated transaction, leaving the timed-out transact=
ion in the hardware queue.
- [High] Watchdog-initiated FLUSH recovery races with the Transaction Manag=
er, allowing new VCQs to be submitted to an actively flushing mailbox.
- [Medium] The response handler fails to probe if mailboxes share an interr=
upt line, breaking the shared IRQ path.
- [Medium] Missing bounds check on embedded VCQ headers causes an out-of-bo=
unds read of kernel heap memory during multi-VCQ dispatch.
--

--- Patch [2]: [PATCH v3 02/19] crypto: cmh - add core platform driver ---
commit c465b95a1402d4dad19cb4fdc8839741bcef0196
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Subject: crypto: cmh - add core platform driver

This commit adds the core platform driver for the Rambus CryptoManager Hub
hardware accelerator. It provides mailbox interface management, transaction
handling, threaded IRQ completions, and device tree parsing.

> diff --git a/drivers/crypto/cmh/cmh_main.c b/drivers/crypto/cmh/cmh_main.c
> --- a/drivers/crypto/cmh/cmh_main.c
> +++ b/drivers/crypto/cmh/cmh_main.c
> @@ -215,8 +215,8 @@ static int cmh_probe(struct platform_device *pdev)
>  	/* Register hash algorithms with the kernel crypto API */
>  	ret =3D cmh_hash_register();
>  	if (ret)
>  		goto err_hash_register;

[Severity: Critical]
Can this unconditional algorithm registration lead to a division by zero
crash? If the underlying hardware core is physically absent, its
num_instances remains 0. If userspace requests an operation via AF_ALG, it
will eventually call cmh_core_select_instance() which performs a modulo
by num_instances.

> diff --git a/drivers/crypto/cmh/cmh_rh.c b/drivers/crypto/cmh/cmh_rh.c
> --- a/drivers/crypto/cmh/cmh_rh.c
> +++ b/drivers/crypto/cmh/cmh_rh.c
> @@ -462,11 +462,11 @@ static void cmh_rh_watchdog_fn(struct timer_list *t)
>  [ ... ]
>  					cmh_reg_write32(MBX_COMMAND_FLUSH,
>  							base,
>  							R_MBX_COMMAND);
>  					cmh_rh_poke_tail(base);
>  					cmh_rh_drain_mbx(i, -EIO);

[Severity: High]
Does this watchdog-initiated flush sequence race with the transaction
manager? Because this runs in a timer context, it immediately drains the
mailbox without waiting for the hardware flush to complete.=20

This wakes the TM thread, which sees empty queue pointers and selects the
actively flushing mailbox as available, allowing new VCQs to be submitted
while the hardware is still flushing. Could this corrupt the mailbox ring
state? (The same sequence is also present in cmh_rh_force_drain_mbx).

> @@ -840,11 +840,11 @@ static int cmh_rh_resolve_irqs(struct cmh_config *c=
fg)
>  {
>  [ ... ]
>  	for (i =3D 0; i < cfg->mbx_count; i++) {
>  		rh.irqs[i] =3D cfg->mailboxes[i].irq;
>  		dev_dbg(cmh_dev(), "rh: MBX%u -> IRQ %d\n", i, rh.irqs[i]);
>  	}
> =20
>  	rh.nirqs =3D cfg->mbx_count;
>  	return 0;
>  }
> =20
>  int cmh_rh_init(struct cmh_config *cfg)
>  {
>  [ ... ]
>  		unsigned long irqflags =3D (rh.nirqs =3D=3D 1 && cfg->mbx_count > 1)
>  					  ? IRQF_SHARED : 0;

[Severity: Medium]
Will this logic ever allow the shared IRQ path to be active? Because
cmh_rh_resolve_irqs() unconditionally sets rh.nirqs to cfg->mbx_count,
the condition for IRQF_SHARED evaluates to false.=20

This prevents probe on platforms where mailboxes share an interrupt line,
as the second request_threaded_irq() call will fail with -EBUSY.

> diff --git a/drivers/crypto/cmh/cmh_txn.c b/drivers/crypto/cmh/cmh_txn.c
> --- a/drivers/crypto/cmh/cmh_txn.c
> +++ b/drivers/crypto/cmh/cmh_txn.c
> @@ -263,11 +263,11 @@ void cmh_txn_finish(struct transaction_obj *txn, in=
t error)
>  {
>  	int old;
> =20
>  	old =3D atomic_cmpxchg(&txn->state, TXN_INFLIGHT, TXN_COMPLETE);
> =20
>  	/* Dequeue the timer if still pending; drop timer ref if we did */
>  	if (timer_delete(&txn->timeout_timer))
>  		txn_put(txn);

[Severity: High]
Could this timer cleanup logic race with the timer setup in submit_vcq()?

If the hardware completes the VCQ instantly after the doorbell is rung
but before mod_timer() is called, cmh_txn_finish() will be called while
the timer is not yet pending. As a result, timer_delete() returns 0 and
leaves the timer reference.=20

The TM thread then resumes and arms the timer on the already popped
transaction, creating an orphaned timer that can trigger a kernel panic
on module unload.

> @@ -472,11 +472,11 @@ struct core_dispatch cmh_core_select_instance(enum =
cmh_core_type type)
>  {
>  	struct core_type_info *ct;
>  [ ... ]
>  	ct =3D &core_types[type];
>  	idx =3D (u32)atomic_inc_return(&ct->next_instance) % ct->num_instances;

[Severity: Critical]
Does this modulo operation cause a division by zero crash if the
hardware core is physically absent? Since algorithm registrations in
cmh_probe() happen unconditionally, userspace can request an operation
for an absent core, leaving num_instances at 0 here.

> @@ -682,11 +682,11 @@ static int submit_vcq(struct command_msg *msg, u32 =
mbx_idx)
>  {
>  [ ... ]
>  		if (num_vcqs =3D=3D 1) {
>  			vcq_cmds =3D msg->vcq_count;
>  		} else {
>  			const struct vcq_hdr *hdr =3D
>  				(const struct vcq_hdr *)&cmds[offset].hwc;
>  			vcq_cmds =3D hdr->cmds;
>  		}
> =20
>  		copy_size =3D vcq_cmds * sizeof(struct vcq_cmd);
>  		if (copy_size > stride_bytes) {

[Severity: Medium]
Is a bounds check needed here to prevent an out-of-bounds read? For a
multi-VCQ message, hdr->cmds is read from the array to determine the
copy_size.=20

Without verifying that the accumulated offset + vcq_cmds does not exceed
msg->vcq_count, a malformed array could cause the driver to read past the
end of the msg->vcq_data allocation.

> @@ -782,11 +782,11 @@ static int submit_vcq(struct command_msg *msg, u32 =
mbx_idx)
>  	/* Ring doorbell: advance tail by number of VCQs submitted */
>  	cmh_reg_write32(tail + num_vcqs, mbx->reg_base, R_MBX_QUEUE_TAIL);
> =20
>  	/* Arm per-request timeout after doorbell (async only) */
>  	if (msg->timeout_jiffies)
>  		mod_timer(&txn->timeout_timer,
>  			  jiffies + msg->timeout_jiffies);

[Severity: High]
This appears to be the other side of the timer race condition noted
earlier. Could arming the timer after ringing the doorbell create a
window where the hardware completes the command before the timer is
armed, leading to the orphaned timer issue?

> @@ -1067,11 +1067,11 @@ void cmh_tm_cleanup(void)
>  {
>  [ ... ]
>  				old =3D atomic_cmpxchg(&txn->state,
>  						     TXN_INFLIGHT,
>  						     TXN_COMPLETE);
>  				if (txn->complete) {
>  					if (old =3D=3D TXN_INFLIGHT)
>  						txn->complete(txn->completion_data,
>  							      -ECANCELED);

[Severity: High]
Does abandoning in-flight transactions here cause DMA writes into freed
memory? The transactions are force-completed with -ECANCELED and their
callers will proceed to free the DMA buffers.=20

However, no ABORT or FLUSH command is issued to halt the hardware
execution, meaning the engine will eventually DMA its output to the
freed memory. The same pattern exists in cmh_tm_quiesce().

> @@ -1433,11 +1433,11 @@ int cmh_tm_submit_sync_tmo(struct vcq_cmd *vcq_cm=
ds, u32 vcq_count,
>  			   u32 num_vcqs, s32 target_mbx,
>  			   unsigned long timeout_hz)
>  {
>  [ ... ]
>  		if (cmh_tm_try_cancel_command(msg)) {
>  [ ... ]
>  		} else {
>  			/*
>  			 * TM has dequeued msg and the VCQ is in-flight.
>  			 * Issue MBX_COMMAND_ABORT to force-stop the VCQ;
>  [ ... ]
>  			s32 abrt_mbx =3D READ_ONCE(msg->actual_mbx);
> =20
>  			if (abrt_mbx >=3D 0 &&
>  			    (u32)abrt_mbx < tm.cfg->mbx_count) {
>  				dev_warn(cmh_dev(),
>  					 "tm: aborting mbx[%d] cmd=3D0x%08x\n",
>  					 abrt_mbx, msg->command_id);
>  				cmh_rh_abort_mbx((u32)abrt_mbx);
>  			}

[Severity: High]
Is there a Time-of-Check to Time-of-Use race here that bypasses the
hardware abort? If the TM thread has dequeued the message but is
delayed before writing msg->actual_mbx, READ_ONCE() returns -1. The
waiter skips sending the ABORT and returns -ETIMEDOUT, freeing the DMA
buffers while the TM thread resumes and submits the command to the
hardware.

Additionally, could this blind abort terminate the wrong transaction?
The ABORT command stops the operation at the head of the mailbox queue.
If this timed-out transaction is queued behind a slow operation, this
aborts the slow operation instead, leaving this transaction in the
hardware queue to eventually corrupt freed memory.

>  [ ... ]
>  			left =3D wait_for_completion_timeout(&sync->done,
>  							   5 * HZ);
>  			if (!left) {
>  				/*
>  				 * ABORT did not complete within 5 s -- HW
>  				 * is wedged.  The eSW may still be writing
>  				 * to DMA buffers owned by the caller, so we
>  				 * cannot let the caller free them.  Transfer
>  				 * ownership to the sync_ctx orphan mechanism;
>  [ ... ]
>  				dev_err(cmh_dev(),
>  					"tm: abort timeout (5s) cmd=3D0x%08x - DMA buffers orphaned\n",
>  					msg->command_id);
>  			}
>  			cmh_sync_ctx_put(sync);  /* drop waiter ref */
>  			command_msg_put(msg);    /* drop waiter ref on msg */
>  		}
>  		return -ETIMEDOUT;
>  	}

[Severity: High]
Does returning -ETIMEDOUT here without transferring DMA buffer ownership
lead to memory corruption? When this expires, the caller unmaps and
frees the DMA buffers.=20

However, the function does not attach an orphan_cb to the sync context
here. If the hardware is merely slow rather than fully wedged, it will
eventually complete and DMA its output into the now-freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D2
