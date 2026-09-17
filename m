Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1B4A6CD7
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687089; cv=none; b=N87yOHjcz2cuu7eYCp3pqrkTSfvrYco1JLG9qxqnPpwcM809Zow30nRsl34xxLSJPZev6vCOJw/qLqlOX9csc5HBdgCjWyG/2bs9UQmSR1LcZiQ6zbRqy0EBT5TenI04zm1TTVeeYZRnUQa3qwtCuM89kxwujR2MUTvwWty4Jo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687089; c=relaxed/simple;
	bh=GchrBnjFuJ8hzdDq6hzjcJG4h07YUUJGqmBBs4cTDrU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aZYsJUEpiLVLZsw7kcUNGa9vl4IzanNuEgKUfl6J/XjlidxV17Q5gRPiae6GccjA4trWT3YvT/1UmjbNy2g1hySEpSQ7WRCugd29/hZ7fJl944MRQ/iJxOgBRPO4mg3ld0pFCzEYN2710MUr656G/czFfLL2+orjTu1GUO3lg5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMq/jy6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMq/jy6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD371F00893;
	Thu, 17 Sep 2026 23:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789687080;
	bh=BU1UCVS+VbCodKUmqNLL2AgozBHDmdKi6MU9WObN9hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMq/jy6uxxHOxjGvmamOR9aLptzZZYljR4Hv5gsDOjX0CRA8AjWNW25/Wmvu61Yrz
	 z7IjQjHUtAKJ5nLeGvNg/VTS3kuCj0rS1BrHvstOGS0s1Klzw1hnRCmcnWYRBcNjGy
	 ZOYc/H0fLrwScB2a8tlSKDwGiotqB30VSwd577O8R5JOU7THcs+PsPcYpIxdRs90sF
	 Zrx8uT/HOEfVS0zDK9jesrkFEzUyI2jNczlAho0Py7TJ5SSTPfWrVnZ022EnAZ8j2M
	 gRTBKD8azEdYD5NIbFo5NdqlH+W2YTVy04IMGlZEGQm+TIML02ioe8/Y4/Ar2dxaLa
	 4c3CICw8AsHaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/19] crypto: cmh - add core platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917225929.2494111-3-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-3-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:17:59 +0000
Message-Id: <20260917231800.5CD371F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] crypto: cmh: DMA use-after-free due to race in tm_submit_sync_tmo =
cancellation
- [High] crypto: cmh: missing interrupt events due to TOCTOU race in cmh_rh=
_thread
- [High] crypto: cmh: infinite loop and DoS when target_mbx is wedged
- [High] crypto: cmh: DMA use-after-free due to uncoordinated VCQ submissio=
n during error recovery
- [High] crypto: cmh: use-after-free during teardown due to flawed module u=
nload ordering
- [High] crypto: cmh: global state corruption and memory leak on multiple d=
evice probes
- [High] crypto: cmh: DMA use-after-free by draining queues before MBX_COMM=
AND_FLUSH completes
- [High] crypto: cmh: TOCTOU race in cmh_tm_flush_mbx enables hardware stat=
e corruption
- [High] crypto: cmh: DMA use-after-free when 5-second ABORT timeout expire=
s in sync submission
- [High] crypto: cmh: DMA corruption on resume due to uninitialized mailbox=
 registers
- [High] crypto: cmh: DMA use-after-free during quiesce by force-completing=
 without hardware abort
- [Medium] crypto: cmh: concurrency bug in debugfs inject_abort_write missi=
ng rh_process_lock
- [Low] crypto: cmh: build error due to undefined kzalloc_obj macro
--

commit 6323a082ef9c58d5cee85659d61674ed5dff3c03
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Subject: crypto: cmh - add core platform driver

This commit adds the core platform driver for the Rambus CryptoManager Hub
hardware cryptographic accelerator. It provides driver registration, hardwa=
re
configuration, a mailbox queue interface, transaction management, and reque=
st
completion handling.

> --- a/drivers/crypto/cmh/cmh_main.c
> +++ b/drivers/crypto/cmh/cmh_main.c
> @@ -181,13 +181,13 @@ static int cmh_probe(struct platform_device *pdev)
> =20
>  	cmh_debugfs_init(cfg);
> =20
>  	/* Initialise mailbox queue interface */
>  	ret =3D cmh_mqi_init(cfg);
>  	if (ret)
>  		goto err_mqi_init;
> =20
>  	/* Initialise transaction manager */
>  	ret =3D cmh_tm_init(cfg);
>  	if (ret)
>  		goto err_tm_init;
> =20
>  	/* Initialise response handler */
>  	ret =3D cmh_rh_init(cfg);

[Severity: High]
Does this sequence safely handle multiple device probes?

The driver's subsystems store their state in global singleton static
structures (like tm.txqs and rh.mbx). If the device tree contains multiple
nodes, it looks like a second probe call will unconditionally overwrite
these global pointers, permanently leaking the memory and kthreads of the
first instance and leading to double-frees or use-after-free conditions.

> [ ... ]
> @@ -201,11 +201,11 @@ static void cmh_remove(struct platform_device *pdev)
> =20
>  	if (!dev)
>  		return;
> =20
>  	cfg =3D &dev->config;
> =20
>  	cmh_rh_cleanup(cfg);
>  	cmh_tm_cleanup();
>  	cmh_mqi_cleanup(cfg);
>  	cmh_debugfs_cleanup();
>  	cmh_dma_cleanup();
>  }

[Severity: High]
Could this teardown order cause a use-after-free in the running transaction
manager thread?

The call to cmh_rh_cleanup() frees the rh.mbx array, but the transaction
manager kthread isn't stopped until the subsequent call to cmh_tm_cleanup().
While the array is being freed, the running thread can call
cmh_rh_mbx_is_wedged(), which directly dereferences the now-freed rh.mbx
memory.

> [ ... ]
> @@ -271,11 +271,11 @@ static int cmh_resume(struct device *dev)
>  	if (ret) {
>  		dev_err(dev, "resume: CMH eSW health check failed (%d)\n",
>  			ret);
>  		return ret;
>  	}
> =20
>  	/*
>  	 * cmh_rh_resume() is void: it only re-syncs MMIO head pointers,
>  	 * clears stale interrupt status bits (W1C), re-enables interrupt
>  	 * masks, and re-arms the watchdog timer -- none of which can fail
>  	 * after the SIC health check above has confirmed HW accessibility.
>  	 */
>  	cmh_rh_resume(&cmh->config);
> =20
>  	ret =3D cmh_tm_resume();

[Severity: High]
Are we missing a step to reprogram the mailbox configuration registers upon
resuming from sleep?

When the system resumes from a state like S3, the device might have lost
power and reset its internal registers to defaults. Because registers like
R_MBX_QUEUE_LO and R_MBX_QUEUE_SLOTS are not restored before restarting the
transaction manager thread, the hardware queue engine might use
uninitialized base addresses, resulting in IOMMU faults or memory
corruption.

> --- a/drivers/crypto/cmh/cmh_debugfs.c
> +++ b/drivers/crypto/cmh/cmh_debugfs.c
> @@ -70,9 +70,9 @@ static ssize_t inject_abort_write(struct file *file,
>  				  const char __user *ubuf,
>  				  size_t count, loff_t *ppos)
>  {
>  	u32 idx =3D (u32)(unsigned long)file->private_data;
>  	void __iomem *base;
> =20
>  	if (!dbgfs.cfg || idx >=3D dbgfs.cfg->mbx_count)
>  		return -EINVAL;
> =20
>  	base =3D dbgfs.cfg->mailboxes[idx].reg_base;
>  	dev_warn(cmh_dev(), "debugfs: injecting ABORT on mbx[%u]\n", idx);
>  	cmh_reg_write32(MBX_COMMAND_ABORT, base, R_MBX_COMMAND);

[Severity: Medium]
Should this register write be protected by rh_process_lock?

Writing directly to R_MBX_COMMAND without holding the lock creates a
concurrency race with the watchdog timer or response handler threads, which
also write to this register for recovery commands. Using the exported
cmh_rh_abort_mbx() would safely take the lock.

> --- a/drivers/crypto/cmh/cmh_rh.c
> +++ b/drivers/crypto/cmh/cmh_rh.c
> @@ -391,9 +391,9 @@ static void cmh_rh_process_mbx(u32 mbx_idx, u32 new_h=
ead, u32 irq_bits)
>  		txn =3D cmh_tm_peek_transaction(mbx_idx);
>  		if (txn && txn->first_vcq_id !=3D txn->last_vcq_id) {
>  			dev_warn_ratelimited(cmh_dev(),
>  					     "rh: mbx[%u] multi-VCQ error vcq=3D%u..%u -- FLUSH+drain\n",
>  					     mbx_idx, txn->first_vcq_id,
>  					     txn->last_vcq_id);
>  			cmh_rh_stat_inc_errors(mbx_idx);
>  			cmh_reg_write32(MBX_IRQ_MASK, base, R_MBX_INTERRUPT);
>  			cmh_reg_write32(MBX_COMMAND_FLUSH, base, R_MBX_COMMAND);
>  			cmh_rh_poke_tail(base);
>  			cmh_rh_drain_mbx(mbx_idx, error);

[Severity: High]
Does draining the mailbox synchronously immediately after writing the FLUSH
command risk a use-after-free on the DMA buffers?

The hardware FLUSH command is asynchronous. Calling cmh_rh_drain_mbx()
right away completes the transactions and signals the callers to unmap and
free their DMA buffers. The hardware engine might still be actively
processing the aborted commands and writing to those freed addresses until
the flush is actually acknowledged.

Additionally, is there missing mutual exclusion between this error recovery
path and new VCQ submissions?

This executes under rh_process_lock, but the transaction manager thread
submits new VCQs under txq->dispatch_lock. This allows the TM to ring the
hardware doorbell and enqueue a new transaction while the RH is draining
the queue. The RH will blindly pop the TM thread's new transaction and
complete it with an error, while the hardware proceeds to execute it on
freed memory.

> [ ... ]
> @@ -536,11 +536,11 @@ static irqreturn_t cmh_rh_thread(int irq, void *dat=
a)
>  		for (i =3D 0; i < cfg->mbx_count; i++) {
>  			u32 new_head, irq_bits;
> =20
>  			if (!READ_ONCE(rh.mbx[i].pending))
>  				continue;
> =20
>  			irq_bits =3D (u32)atomic_xchg(&rh.mbx[i].irq_bits, 0);
>  			WRITE_ONCE(rh.mbx[i].pending, false);

[Severity: High]
Could unconditionally setting pending to false here introduce a race
condition that loses interrupt events?

If a hardirq fires exactly between the atomic_xchg() and the WRITE_ONCE(),
the hardirq will set pending to true and accumulate new bits into irq_bits.
The WRITE_ONCE() then overwrites pending to false, causing the threaded
handler to ignore the new interrupt on the next pass, leaving stale error
bits in irq_bits.

> [ ... ]
> @@ -714,9 +714,9 @@ static void cmh_rh_watchdog_fn(struct timer_list *t)
>  					dev_err(cmh_dev(),
>  						"rh: watchdog: mbx[%u] RESTART unresponsive after %u ticks, escala=
ting to FLUSH (attempt %u/%u)\n",
>  						i, rh.mbx[i].restart_retries,
>  						rh.mbx[i].flush_count,
>  						CMH_RH_FLUSH_MAX_FAILURES);
>  					cmh_reg_write32(MBX_IRQ_MASK,
>  							base,
>  							R_MBX_INTERRUPT);
>  					cmh_reg_write32(MBX_COMMAND_FLUSH,
>  							base,
>  							R_MBX_COMMAND);
>  					cmh_rh_poke_tail(base);
>  					cmh_rh_drain_mbx(i, -EIO);

[Severity: High]
Similar to the processing path above, does draining immediately after
escalating to a FLUSH command cause a DMA use-after-free?

The watchdog completes the transactions and causes their buffers to be
freed without waiting for the hardware to process the FLUSH command.

> --- a/drivers/crypto/cmh/cmh_txn.c
> +++ b/drivers/crypto/cmh/cmh_txn.c
> @@ -652,10 +652,10 @@ static int resolve_mbx(struct command_msg *msg)
>  {
>  	u32 slots =3D msg->num_vcqs > 0 ? msg->num_vcqs : 1;
> =20
>  	if (msg->target_mbx >=3D 0 &&
>  	    (u32)msg->target_mbx < tm.cfg->mbx_count) {
>  		struct cmh_mbx_config *m =3D
>  			&tm.cfg->mailboxes[msg->target_mbx];
> =20
>  		if (cmh_rh_mbx_is_wedged((u32)msg->target_mbx))
>  			return -EAGAIN;

[Severity: High]
If the pinned target mailbox is permanently wedged, this returns -EAGAIN.
Will this cause an infinite loop in the transaction manager thread?

In cmh_tm_thread(), any negative error code other than -EMSGSIZE is treated
as a temporary queue full condition. The thread will place the message back
at the front of the queue and sleep, indefinitely blocking all other
requests in the command message queue.

> [ ... ]
> @@ -716,11 +716,11 @@ static int submit_vcq(struct command_msg *msg, u32 =
mbx_idx)
>  	u32 tail, stride_bytes, offset =3D 0;
>  	unsigned long flags;
>  	u32 v;
> =20
>  	mutex_lock(&txq->dispatch_lock);
> =20
>  	/* Read current tail (first VCQ ID) */
>  	tail =3D cmh_reg_read32(mbx->reg_base, R_MBX_QUEUE_TAIL);
>  	stride_bytes =3D 1U << mbx->stride_log2;
> =20
>  	/* Allocate transaction tracking object */
>  	txn =3D kzalloc_obj(*txn, GFP_KERNEL);

[Severity: Low]
Is kzalloc_obj a macro defined somewhere in this tree?

It doesn't appear to be a standard kernel memory allocation function, which
will cause a build error.

> [ ... ]
> @@ -832,10 +832,10 @@ static int submit_vcq(struct command_msg *msg, u32 =
mbx_idx)
>  	spin_lock_irqsave(&txq->lock, flags);
>  	list_add_tail(&txn->list, &txq->head);
>  	txq->depth++;
>  	spin_unlock_irqrestore(&txq->lock, flags);
> =20
>  	/*
>  	 * Arm the per-request timeout BEFORE the doorbell (async only): once
>  	 * the doorbell rings, HW can complete and the TXQ can pop and free the
>  	 * txn concurrently, so arming afterwards races that free and can leave
>  	 * timer_delete() in cmh_txn_finish() unable to drop the timer ref.
>  	 */
>  	if (msg->timeout_jiffies)
>  		mod_timer(&txn->timeout_timer,
>  			  jiffies + msg->timeout_jiffies);
> =20
>  	/*
>  	 * Ring doorbell: advance tail by number of VCQs submitted.
>  	 * Serialise against cmh_tm_poke_tail() so a concurrent re-poke
>  	 * cannot roll TAIL back over this advance.
>  	 */
>  	spin_lock_irqsave(&cmh_mbx_tail_lock, flags);
>  	cmh_reg_write32(tail + num_vcqs, mbx->reg_base, R_MBX_QUEUE_TAIL);
>  	spin_unlock_irqrestore(&cmh_mbx_tail_lock, flags);

[Severity: High]
As mentioned earlier, does this enqueue and hardware doorbell sequence need
to be synchronized with the response handler's error recovery path to avoid
submitting VCQs into a flushed queue?

> [ ... ]
> @@ -874,10 +874,10 @@ static int cmh_tm_thread(void *data)
>  	while (!kthread_should_stop()) {
>  		/* Wait for work or stop signal */
>  		wait_event_interruptible(tm.cmq_waitq,
>  					 !list_empty(&tm.cmq) || kthread_should_stop());
> =20
>  		if (kthread_should_stop())
>  			break;
> =20
>  		/* Dequeue one command message */
>  		spin_lock_irqsave(&tm.cmq_lock, flags);
>  		if (list_empty(&tm.cmq)) {
>  			spin_unlock_irqrestore(&tm.cmq_lock, flags);
>  			continue;
>  		}
>  		msg =3D list_first_entry(&tm.cmq, struct command_msg, list);
>  		list_del_init(&msg->list);

[Severity: High]
Does temporarily removing the message from the list here break the
cancellation logic in cmh_tm_submit_sync_tmo()?

If the caller's initial wait_for_completion_timeout expires while the TM
thread has dequeued the message to evaluate mailbox availability, the
caller's cmh_tm_try_cancel_command() will return false. The caller then
assumes the transaction is owned by the hardware and proceeds to abandon it.

> [ ... ]
> @@ -1241,11 +1241,11 @@ void cmh_tm_quiesce(void)
>  			spin_lock_irqsave(&tm.txqs[i].lock, flags);
>  			list_splice_init(&tm.txqs[i].head, &drain);
>  			tm.txqs[i].depth =3D 0;
>  			spin_unlock_irqrestore(&tm.txqs[i].lock, flags);
> =20
>  			list_for_each_entry_safe(txn, tmp_txn, &drain, list) {
>  				list_del(&txn->list);
> =20
>  				if (timer_delete_sync(&txn->timeout_timer))
>  					txn_put(txn);
> =20
>  				old =3D atomic_cmpxchg(&txn->state,
>  						     TXN_INFLIGHT,
>  						     TXN_COMPLETE);
>  				if (txn->complete) {
>  					if (old =3D=3D TXN_INFLIGHT)
>  						txn->complete(txn->completion_data,
>  							      -ECANCELED);

[Severity: High]
Does force-completing the remaining transactions here cause a use-after-free
if the hardware is not actually aborted?

If the drain timeout expires, this signals the caller to free their DMA
buffers by returning -ECANCELED. However, since the hardware mailbox was
never issued a FLUSH or ABORT command, a slow hardware operation could
eventually finish and corrupt the freed memory.

> [ ... ]
> @@ -1543,10 +1543,10 @@ int cmh_tm_submit_sync_tmo(struct vcq_cmd *vcq_cm=
ds, u32 vcq_count,
>  	dev_dbg(cmh_dev(), "tm: submit_sync posted cmd 0x%08x, waiting...\n",
>  		msg->command_id);
> =20
>  	left =3D wait_for_completion_timeout(&sync->done, timeout_hz);
>  	if (!left) {
>  		dev_err(cmh_dev(),
>  			"tm: submit_sync timeout (%lums) cmd=3D0x%08x\n",
>  			timeout_hz * 1000 / HZ, msg->command_id);
>  		if (cmh_tm_try_cancel_command(msg)) {

[Severity: High]
As mentioned earlier, does this cancellation check fail incorrectly if the
TM thread temporarily removed the message to evaluate mailbox availability?

> [ ... ]
> @@ -1599,10 +1599,10 @@ int cmh_tm_submit_sync_tmo(struct vcq_cmd *vcq_cm=
ds, u32 vcq_count,
>  			 * wait for the RH completion (ABORT triggers
>  			 * MBX_ERROR_IRQ within microseconds).  Fixed
>  			 * 5 s ceiling -- not configurable because if
>  			 * ABORT doesn't complete in this window the
>  			 * HW is wedged and more waiting won't help.
>  			 */
>  			left =3D wait_for_completion_timeout(&sync->done,
>  							   5 * HZ);
>  			if (!left) {
>  				/*
>  				 * ABORT did not complete within 5 s -- the HW
>  				 * is wedged.  Unlike cmh_tm_submit_sync_noabort,
>  				 * this path sets no orphan_cb, so the caller's
>  				 * DMA buffers are NOT orphaned here: the caller
>  				 * frees them on the -ETIMEDOUT below.  If the
>  				 * eSW later recovers and DMAs into them that is
>  				 * a use-after-free -- an accepted residual for a
>  				 * path that cannot be reached unless ABORT
>  				 * itself hangs for 5 s (HW already wedged).
>  				 */
>  				dev_err(cmh_dev(),
>  					"tm: abort timeout (5s) cmd=3D0x%08x - HW wedged\n",
>  					msg->command_id);
>  			}
>  			cmh_sync_ctx_put(sync);  /* drop waiter ref */
>  			command_msg_put(msg);    /* drop waiter ref on msg */
>  		}
>  		return -ETIMEDOUT;

[Severity: High]
Does returning -ETIMEDOUT here after the 5-second wait expires create a
guaranteed use-after-free if the hardware eventually recovers?

Since the caller frees the DMA buffers without the transaction transitioning
to TXN_TIMED_OUT, the watchdog's abort-stall detector won't forcibly flush
the mailbox. If the hardware is stalled and later recovers, it will resume
executing the VCQ into the freed memory.

> [ ... ]
> @@ -1931,10 +1931,10 @@ int cmh_tm_flush_mbx(s32 mbx_idx)
> =20
>  	/* Ensure no command is already pending */
>  	if (cmh_reg_read32(base, R_MBX_COMMAND) !=3D 0) {
>  		mutex_unlock(&txq->dispatch_lock);
>  		return -EBUSY;
>  	}
> =20
>  	cmh_reg_write32(MBX_COMMAND_FLUSH, base, R_MBX_COMMAND);
> =20
>  	/* Poll until eSW clears the command register */

[Severity: High]
Could a concurrent RESTART command overwrite this FLUSH command?

This function acquires dispatch_lock but not rh_process_lock. A concurrent
error detection in the response handler watchdog could write
MBX_COMMAND_RESTART to the exact same register. The register would
eventually clear when the RESTART completes, causing this function to false=
ly
assume the hardware queue was successfully flushed. This can lead to memory
corruption when the hardware continues processing the remaining items in
the queue while the caller has freed them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D2
