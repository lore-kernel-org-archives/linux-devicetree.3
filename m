Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18F1632E7
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697268; cv=none; b=sO2BpQZYVvSBITnRmjR696Yb2xrdKGluu1FsUYYA2hVtAhNkdxTI6BXLs5WvWJbE4uw9ZmNO45jTCm4rl6+/8JAVpTQVeC96eDZIqKxBazo/iXHg8LIrVMZwpGwujOogXy2ZbsjgBnqPOEQoKkbufpgIMDlliXDj6RwhzFaLLG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697268; c=relaxed/simple;
	bh=nG5n6SafZSRk7xtHZXvir99KL2OXoDDSWlUNXRwEM90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hu3wlhVNTaihesf+dNfbmUQrLeZUj8KQhWEUWujjmXM0W+RGuVuJqOQCAWGrYHi4/I3KVDbqL+1cELLFJH8xVn44bxlyR6SWyuEOgwlhpdCgs6wUGreqnPU+FgZz/2iwJ1NX0iwoiTHohnZZSoC5DISEeYuWYGyePP+0EUBy0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRSmc5sP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRSmc5sP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C3E1F000E9;
	Tue, 25 Aug 2026 22:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697266;
	bh=2x1c34rW68ymrfwQZGTcg16xNOArwJjJWWontGzNsB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NRSmc5sPk8Gmex1t2/PjJd0ozly48sc3fRjjILC62Wm0tqqnpd7GwAPTCU1qcGp5v
	 VDJ3hDe9cfx9hQWTT09u+1nn91ky2qX1dW6KROBXHlh/Fv7UE4EwN0qrmiV9CJuF1r
	 J0HAxohyDbf6fGSIHk3x/OD2hXGUc6V4J7Ra3vP1tWbqdvYgUuegNErE8WqQbkejpV
	 naTeblK2bGh+AHIf7kpe/+TmIbTctNpyPck6OYLbEIjhaMS61mWZKaZTwxqN2+5+cH
	 5nacNdRfkLWkaAZBbBTRh4SdvQ21i7+ejN589lamad91fIGblfn96TesLvrNaZoOXM
	 AKW4B4GI7d9Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/19] crypto: cmh - add core platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260825221539.255951-3-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-3-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:34:25 +0000
Message-Id: <20260825223426.52C3E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] The synchronous submission timeout handler suffers from a TOCT=
OU race allowing Use-After-Free, and an unconditional abort that corrupts u=
nrelated transactions.
- [Critical] Error handling for multi-VCQ transactions causes DMA Use-After=
-Free by completing the transaction early while the hardware continues exec=
uting its remaining VCQs.
- [Critical] Concurrent read-modify-write of the `R_MBX_QUEUE_TAIL` hardwar=
e register overwrites newly submitted VCQs.
- [Critical] Mailbox `FLUSH` commands silently discard in-flight transactio=
ns, which the Response Handler falsely completes with SUCCESS.
- [Critical] A TOCTOU list manipulation race between the TM kthread and the=
 sync submit cancellation path allows hardware to DMA into caller buffers a=
fter they have been freed.
- [Critical] The DMA scatter-gather descriptor array is allocated with `kza=
lloc`, which does not guarantee the 64-byte alignment required by the hardw=
are.
- [High] Head-of-line blocking vulnerability in the Transaction Manager thr=
ead when submitting an oversized transaction.
- [High] The `rh_watchdog` timer re-arms itself during teardown because `ti=
mer_delete_sync` is called before clearing the `rh.active` flag.
- [High] Completion callbacks are invoked with the internal `rh_process_loc=
k` spinlock held, risking AB-BA deadlocks with external subsystem locks.
- [High] A TOCTOU race in `cmh_tm_post_command()` checking the `tm.running`=
 flag outside of the queue lock allows messages to be leaked during teardow=
n.
--

commit a1ed650ae307bbc8b4d1ebd0580bf2977503fc8f
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Subject: crypto: cmh - add core platform driver

Adds the Rambus CryptoManager Hub (CMH) hardware crypto accelerator core
platform driver. This includes platform registration, a Virtual Command Que=
ue
(VCQ) interface via mailbox, transaction manager, response handler, and
sysfs/debugfs integration.

> --- a/drivers/crypto/cmh/cmh_dma.c
> +++ b/drivers/crypto/cmh/cmh_dma.c

[ ... ]

> @@ -250,7 +250,7 @@ struct cmh_sg_map *cmh_dma_build_sg(const struct cmh_=
dma_buf *bufs, u32 count,
>  	/*
>  	 * Allocate descriptor array with kmalloc and map for streaming DMA.
>  	 * We map first to obtain items_dma (needed for .lli pointers),
>  	 * then sync-for-cpu, fill descriptors, and sync-for-device.
>  	 */
>  	sgm->items =3D kzalloc(sgm->items_size, gfp);

[Severity: Critical]
Is it possible this allocation could cause a hardware DMA fault?=20

The hardware LLI format strictly requires 64-byte aligned descriptor chain
pointers, but kzalloc() only guarantees the architecture's minimum DMA
alignment (typically 8 or 16 bytes). Small allocations here might not satis=
fy
the 64-byte requirement.

> --- a/drivers/crypto/cmh/cmh_rh.c
> +++ b/drivers/crypto/cmh/cmh_rh.c

[ ... ]

> @@ -152,5 +152,5 @@ static unsigned int watchdog_ms =3D CMH_RH_WATCHDOG_M=
S_DEFAULT;
>  static void cmh_rh_poke_tail(void __iomem *base)
>  {
>  	u32 tail =3D cmh_reg_read32(base, R_MBX_QUEUE_TAIL);
> =20
>  	cmh_reg_write32(tail, base, R_MBX_QUEUE_TAIL);
>  }

[Severity: Critical]
Could this sequence corrupt the hardware ring buffer?=20

If cmh_rh_poke_tail() runs concurrently from softirq/watchdog contexts and
interleaves between submit_vcq()'s read and write of R_MBX_QUEUE_TAIL, it
might read the old TAIL and overwrite the newly advanced TAIL written by
submit_vcq().=20

This would roll back the hardware queue state and cause the next submission=
 to
overwrite unexecuted VCQs.

[ ... ]

> @@ -395,5 +395,5 @@ static void cmh_rh_process_mbx(u32 mbx_idx, u32 new_h=
ead, u32 irq_bits)
>  		/* Now pop and fail the transaction that actually errored */
>  		txn =3D cmh_tm_pop_transaction(mbx_idx);
>  		if (txn) {
>  			dev_dbg(cmh_dev(), "rh: mbx[%u] error-complete vcq=3D%u..%u\n",
>  				mbx_idx, txn->first_vcq_id,
>  				txn->last_vcq_id);
>  			cmh_txn_finish(txn, error);
>  			cmh_tm_txq_completion_notify();
>  		} else {

[Severity: Critical]
If a multi-VCQ transaction encounters an error on a middle VCQ, could
completing the transaction here cause a use-after-free?=20

When cmh_txn_finish() is called, the caller will unmap and free its DMA mem=
ory
buffers while the hardware might still have subsequent VCQs left to process.

[ ... ]

> @@ -420,2 +420,2 @@ static void cmh_rh_process_mbx(u32 mbx_idx, u32 new_h=
ead, u32 irq_bits)
>  		cmh_reg_write32(MBX_IRQ_MASK, base, R_MBX_INTERRUPT);
>  		cmh_reg_write32(MBX_COMMAND_RESTART, base, R_MBX_COMMAND);

[Severity: Critical]
Following up on the early completion above, does issuing MBX_COMMAND_RESTART
here force the hardware to resume execution of the remaining VCQs from the
failed transaction?=20

If the DMA buffers were already freed by the caller, this would lead to mem=
ory
corruption when the hardware processes them.

[ ... ]

> @@ -435,5 +435,5 @@ static void cmh_rh_process_mbx(u32 mbx_idx, u32 new_h=
ead, u32 irq_bits)
>  	while ((txn =3D cmh_tm_peek_transaction(mbx_idx)) !=3D NULL) {
>  		if ((s32)(new_head - txn->last_vcq_id) <=3D 0) {
>  			/*
>  			 * Not yet complete.  An intermediate HEAD within a
>  			 * multi-VCQ group is normal (the eSW advances HEAD
>  			 * per VCQ), so log at debug level and wait for the
>  			 * group to finish.
>  			 */
>  			if (txn->first_vcq_id !=3D txn->last_vcq_id &&
>  			    (s32)(new_head - txn->first_vcq_id) > 0)
>  				dev_dbg_ratelimited(cmh_dev(),
>  						    "rh: mbx[%u] head %u mid-group %u..%u\n",
>  						    mbx_idx, new_head,
>  						    txn->first_vcq_id,
>  						    txn->last_vcq_id);
>  			break;
>  		}
> =20
>  		txn =3D cmh_tm_pop_transaction(mbx_idx);
>  		if (!txn)
>  			break;
> =20
>  		dev_dbg(cmh_dev(), "rh: mbx[%u] complete vcq=3D%u..%u err=3D%d\n",
>  			mbx_idx, txn->first_vcq_id, txn->last_vcq_id,
>  			 error);
> =20
>  		cmh_rh_stat_add_completed(mbx_idx, txn->first_vcq_id,
>  					  txn->last_vcq_id);
> =20
>  		cmh_txn_finish(txn, error);
>  		cmh_tm_txq_completion_notify();
>  	}

[Severity: Critical]
When a MBX_COMMAND_FLUSH command forces the hardware to discard the queue a=
nd
set HEAD =3D TAIL, won't this loop misinterpret the discarded transactions =
as
successful completions?=20

This would return garbage data to the caller instead of appropriately faili=
ng
the aborted requests.

[ ... ]

> @@ -446,5 +446,5 @@ static irqreturn_t cmh_rh_thread(int irq, void *data)
> =20
>  			spin_lock_bh(&rh_process_lock);
>  			new_head =3D cmh_reg_read32(cfg->mailboxes[i].reg_base,
>  						  R_MBX_QUEUE_HEAD);
> =20
>  			if (new_head =3D=3D rh.mbx[i].last_head && !irq_bits) {
>  				spin_unlock_bh(&rh_process_lock);
>  				continue;
>  			}
> =20
>  			cmh_rh_process_mbx(i, new_head, irq_bits);
>  			rh.mbx[i].last_head =3D new_head;
>  			spin_unlock_bh(&rh_process_lock);
>  		}

[Severity: High]
Since cmh_rh_process_mbx() eventually invokes the caller-provided completion
callback via cmh_txn_finish(), does holding rh_process_lock here risk an AB=
-BA
deadlock?=20

If the crypto API callback acquires an external lock, and another thread
holding that same lock calls into the driver (e.g. executing a timeout path
that calls cmh_rh_abort_mbx()), they could deadlock.

[ ... ]

> @@ -1023,7 +1023,7 @@ void cmh_rh_suspend(struct cmh_config *cfg)
>  {
>  	u32 i;
> =20
>  	if (!rh.active)
>  		return;
> =20
>  	/* Stop the watchdog before masking HW interrupts */
>  	timer_delete_sync(&rh_watchdog);
> =20
>  	/* Mask MBX interrupts at the hardware level */
>  	for (i =3D 0; i < cfg->mbx_count; i++)
>  		cmh_reg_write32(0, cfg->mailboxes[i].reg_base,
>  				R_MBX_INTERRUPT_MASK);
> =20
>  	/*
>  	 * Ensure no threaded IRQ handler is still in-flight.
>  	 * After masking, a handler may already have been scheduled.
>  	 * synchronize_irq() waits for it to complete before we
>  	 * proceed with suspend (which tears down TM state).
>  	 */
>  	for (i =3D 0; i < rh.nirqs; i++)
>  		synchronize_irq(rh.irqs[i]);
> =20
>  	rh.active =3D false;
>  }

[Severity: High]
Does calling timer_delete_sync() before setting rh.active =3D false open a
window for the timer to incorrectly re-arm itself?=20

If cmh_rh_watchdog_fn() is spinning concurrently on another CPU, it will
complete, see rh.active is still true, and successfully call mod_timer(). T=
his
re-armed timer could later fire on freed memory.=20

The same pattern exists in cmh_rh_cleanup().

> --- a/drivers/crypto/cmh/cmh_txn.c
> +++ b/drivers/crypto/cmh/cmh_txn.c

[ ... ]

> @@ -611,6 +611,6 @@ static int select_mailbox(u32 slots_needed)
>  {
>  	u32 count =3D tm.cfg->mbx_count;
>  	u32 start =3D tm.next_mbx;
>  	u32 i;
> =20
>  	for (i =3D 0; i < count; i++) {
>  		u32 idx =3D (start + i) % count;
> =20
>  		if (cmh_rh_mbx_is_wedged(idx))
>  			continue;
> =20
>  		if (mbx_free_slots(&tm.cfg->mailboxes[idx]) >=3D slots_needed) {
>  			tm.next_mbx =3D (idx + 1) % count;
>  			return (int)idx;
>  		}

[Severity: High]
If a request is submitted with a slots_needed value that exceeds the absolu=
te
maximum capacity of the mailbox ring buffer, won't this condition permanent=
ly
fail?

[ ... ]

> @@ -829,3 +829,3 @@ static int cmh_tm_thread(void *data)
>  			spin_lock_irqsave(&tm.cmq_lock, flags);
>  			list_add(&msg->list, &tm.cmq);
>  			cmq_depth++;
>  			spin_unlock_irqrestore(&tm.cmq_lock, flags);
> =20
>  			tmo =3D usecs_to_jiffies(CMH_TM_BACKOFF_MAX_US);
>  			wait_event_interruptible_timeout(tm.cmq_waitq,
>  							 kthread_should_stop() ||
>  							 atomic_read(&txq_completion_gen) !=3D gen,
>  							 tmo ?: 1);
>  			cmh_stat_inc_tm_backoff();
>  			continue;
>  		}

[Severity: High]
If the message failed to resolve a mailbox because it requested more VCQs t=
han
the queue can ever hold, putting it back at the head of tm.cmq will cause t=
he
kthread to retry it endlessly.=20

Could this create a head-of-line blocking livelock that stalls all other
crypto operations on the system?

[ ... ]

> @@ -1238,6 +1238,6 @@ bool cmh_tm_try_cancel_command(struct command_msg *=
msg)
>  {
>  	unsigned long flags;
>  	bool cancelled =3D false;
> =20
>  	spin_lock_irqsave(&tm.cmq_lock, flags);
>  	if (!list_empty(&msg->list)) {
>  		list_del_init(&msg->list);
>  		cmq_depth--;
>  		cancelled =3D true;
>  	}
>  	spin_unlock_irqrestore(&tm.cmq_lock, flags);
> =20
>  	return cancelled;
>  }

[Severity: Critical]
Could this check return false incorrectly if cmh_tm_try_cancel_command() ru=
ns
exactly when the TM thread has temporarily dequeued the message using
list_del_init() to resolve a mailbox?=20

If the cancellation fails here, the caller might drop references and free D=
MA
buffers, but the TM thread could subsequently re-add or submit the request,
causing the hardware to DMA into freed memory.

[ ... ]

> @@ -1266,4 +1266,4 @@ int cmh_tm_post_command(struct command_msg *msg)
>  {
>  	unsigned long flags;
> =20
>  	if (!READ_ONCE(tm.running))
>  		return -ENODEV;
> =20
>  	spin_lock_irqsave(&tm.cmq_lock, flags);

[Severity: High]
Is there a window here where a thread could check the tm.running flag, get
preempted, and resume after cmh_tm_cleanup() has already stopped the TM thr=
ead
and drained the queue?=20

The preempted thread would then acquire the lock and enqueue its message in=
to
a dead queue, leaking the memory and potentially hanging the caller
indefinitely.

[ ... ]

> @@ -1453,7 +1453,7 @@ int cmh_tm_submit_sync_tmo(struct vcq_cmd *vcq_cmds=
, u32 vcq_count,
>  			 * rh_process_lock, preventing clobber of a
>  			 * concurrent RESTART/FLUSH from the watchdog.
>  			 */
>  			s32 abrt_mbx =3D READ_ONCE(msg->actual_mbx);
> =20
>  			if (abrt_mbx >=3D 0 &&
>  			    (u32)abrt_mbx < tm.cfg->mbx_count) {
>  				dev_warn(cmh_dev(),
>  					 "tm: aborting mbx[%d] cmd=3D0x%08x\n",
>  					 abrt_mbx, msg->command_id);
>  				cmh_rh_abort_mbx((u32)abrt_mbx);
>  			}

[Severity: Critical]
Is it safe to issue an unconditional MBX_COMMAND_ABORT here based solely on
msg->actual_mbx?=20

If the TM thread dequeued the request but hasn't updated actual_mbx yet, th=
is
skips the abort entirely, returning -ETIMEDOUT and letting the caller free =
DMA
buffers while the hardware continues executing.=20

Conversely, if actual_mbx is set but this transaction has already completed,
issuing an abort might spuriously terminate a completely unrelated transact=
ion
currently executing in the hardware.

[ ... ]

> @@ -1609,4 +1609,4 @@ int cmh_tm_submit_async(struct vcq_cmd *vcq_cmds, u=
32 vcq_count,
>  	msg->command_id      =3D vcq_cmds[1].id;
>  	msg->vcq_count       =3D vcq_count;
>  	msg->num_vcqs        =3D num_vcqs;
>  	msg->target_mbx      =3D target_mbx;

[Severity: High]
Should there be validation here to reject the request if num_vcqs is larger
than the maximum capacity of any mailbox?=20

If an impossibly large num_vcqs is accepted, it triggers the head-of-line
blocking livelock described above.

[ ... ]

> @@ -1836,4 +1836,4 @@ int cmh_tm_flush_mbx(s32 mbx_idx)
>  	/* Ensure no command is already pending */
>  	if (cmh_reg_read32(base, R_MBX_COMMAND) !=3D 0) {
>  		mutex_unlock(&txq->dispatch_lock);
>  		return -EBUSY;
>  	}
> =20
>  	cmh_reg_write32(MBX_COMMAND_FLUSH, base, R_MBX_COMMAND);

[Severity: Critical]
By issuing MBX_COMMAND_FLUSH here without verifying if the software
transaction queue is empty (e.g. checking txq->depth =3D=3D 0), aren't acti=
vely
running VCQs silently destroyed?=20

Since submit_vcq() only updates TAIL and leaves COMMAND as 0, this check
incorrectly assumes the mailbox is idle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D2
