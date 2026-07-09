Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048A03BD647
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630169; cv=none; b=cpKvCe5OnacGDRxq+9M9spk0e1XbLVHy94FrJQB9QL/v5wZronNRJugbVG6fwPQ4nGhI6RyFeo68ssuuFMY/tQxjxpyCd1jGLHkcLbyYS2RUDlO1hJ4nzeds2DSe6Yu/JxUoDKyf9W3mM5FurokSbUfQ6dIzZpyAhaFMqbP8MLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630169; c=relaxed/simple;
	bh=0igcCrDdZboemki1d3PxLhQUjlMLz47aGRsS4+JvBHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gV9EpGlOuPR0CzSzmqJZFeDtl6AeZMT0Ez3KR59ZdhvSx2qIkLcvlZliEiioWjtrzBlQpQGWURdljxPIvPCuk0m7Hogfwqil4382a/VkuUIZgJgTutrOpU1xIbY2/2fupiKVpkxRoFCh6/Goafrwqs6VkAK+rg03YudczPsQETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nM1DQiVl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM1DQiVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14611F000E9;
	Thu,  9 Jul 2026 20:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630167;
	bh=BCKoFQ0J2+8huB9xca/v18pbZ3p/ahh0MHG08PpDyug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nM1DQiVl3hWADNvNeBPhzee0mhfgHnMmr3WrOW23gA3IrT1mlKDUIUEKj2rb1W4+r
	 46R2yzx56AdCTAyDFtLdiq9JbOmIZuS6MEUuOWR6VQZmmqebE7KVx9vOXf3mpv+mR/
	 lsw1CH/TdCMdtX3YOI2ABLh4VnRta55ZHsNHH4ER59i+b02yCdMyK/ausN4X4cFpe6
	 /hqoCEJtpmr6o6Q3URs6UhF4w3Q0sVdU/xjsRlUF5YfAlwfkBJOsybdUNLqz8OqMFV
	 CBvoXJq36SUQsOCyr1pc92QbM8F8TOcl7TPvcu568wKxcYa/1+GM10xwTEfVSXT3uN
	 sHYxFVLFAn3JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/19] crypto: cmh - add core platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709203037.1884436-3-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-3-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:49:26 +0000
Message-Id: <20260709204927.A14611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Force-completing transactions without a synchronous hardware stop =
allows the hardware to write into freed DMA buffers.
- [High] Unsynchronized hardware FLUSH commands race with TM thread VCQ sub=
missions, corrupting the DMA queue.
- [High] Concurrent modification of the CMQ drain list during timeout cance=
llation corrupts list pointers.
- [High] TM thread temporarily detaches messages from the CMQ, causing sync=
hronous timeouts to bypass ABORT and allow DMA into freed memory.
- [High] `cmh_tm_quiesce()` frees transaction objects while the active Resp=
onse Handler accesses them.
- [High] The per-transaction timeout timer is armed after the hardware door=
bell, creating a race that leaves the timer armed after transaction complet=
ion.
- [High] Invoking completion callbacks while holding the `tm.cmq_lock` spin=
lock creates a recursive deadlock hazard.
- [High] TOCTOU race clearing the `pending` flag in `cmh_rh_thread` orphans=
 hardware interrupt bits.
- [High] Hardware DMA structures lack endianness conversions, breaking the =
driver on Big-Endian hosts.
- [Medium] Sysfs attributes 'product' and 'algorithms' claimed in the commi=
t message are absent from the code.
- [Medium] The driver masks `-EPROBE_DEFER` from `of_irq_get()`, permanentl=
y degrading to polling mode.
--

--- Patch [2]: [PATCH v2 02/19] crypto: cmh - add core platform driver ---
commit ae92a2a00ed6a125d9d63aee91b693b747943c9a
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add core platform driver

This commit introduces the core platform driver for the CRI CryptoManager H=
ub
hardware crypto accelerator. It sets up mailbox queues, a transaction manag=
er,
and response handlers for asynchronous crypto operations. The driver uses D=
MA
and MMIO to dispatch cryptographic commands to the hardware cores.

> - Sysfs attributes (fw_version, hw_version, product, algorithms)

[Severity: Medium]
The commit message mentions 'product' and 'algorithms' sysfs attributes, but
are these actually implemented in the code? Looking at the cmh_sysfs_attrs
array in cmh_sysfs.c, only fw_version, hw_version, boot_status, mbx_availab=
le,
and mbx_count appear to be present.

> diff --git a/drivers/crypto/cmh/include/cmh_vcq.h b/drivers/crypto/cmh/in=
clude/cmh_vcq.h
> --- a/drivers/crypto/cmh/include/cmh_vcq.h
> +++ b/drivers/crypto/cmh/include/cmh_vcq.h
[ ... ]
> struct dma_scattergather_item {
> 	u64 lli;
> 	u64 src;
> 	u64 dst;
> 	u64 len;
> };

[Severity: High]
Will this driver operate correctly on big-endian architectures? The DMA
scatter-gather items and VCQ command structures are defined using native u64
types. If the hardware expects little-endian layout, do we need explicit
endianness conversions here and when copying data to the DMA slots in
cmh_dma_build_sg() and submit_vcq()?

> diff --git a/drivers/crypto/cmh/cmh_txn.c b/drivers/crypto/cmh/cmh_txn.c
> --- a/drivers/crypto/cmh/cmh_txn.c
> +++ b/drivers/crypto/cmh/cmh_txn.c
[ ... ]
> static int submit_vcq(struct command_msg *msg, u32 mbx_idx)
> {
[ ... ]
> 	/* Ring doorbell: advance tail by number of VCQs submitted */
> 	cmh_reg_write32(tail + num_vcqs, mbx->reg_base, R_MBX_QUEUE_TAIL);
>=20
> 	/* Arm per-request timeout after doorbell (async only) */
> 	if (msg->timeout_jiffies)
> 		mod_timer(&txn->timeout_timer,
> 			  jiffies + msg->timeout_jiffies);

[Severity: High]
Can a concurrent mailbox flush operation corrupt the hardware queue here? I=
f a
watchdog or debugfs routine issues a flush command asynchronously after the=
 TM
thread reads the tail but before writing the new tail to the doorbell, could
the hardware reset the tail to zero only for it to be overwritten with an
advanced value pointing to empty DMA slots?

[Severity: High]
Is there a race condition with the timeout timer being armed? The doorbell
is rung before mod_timer() is called. If the hardware completes the operati=
on
extremely quickly, could cmh_txn_finish() process the completion and delete
the timer before it gets armed here, leaving an active timer on a freed
transaction?

[ ... ]
> static int cmh_tm_thread(void *data)
> {
[ ... ]
> 		/* Dequeue one command message */
> 		spin_lock_irqsave(&tm.cmq_lock, flags);
[ ... ]
> 		msg =3D list_first_entry(&tm.cmq, struct command_msg, list);
> 		list_del_init(&msg->list);
> 		cmq_depth--;

[Severity: High]
Could this temporary removal from the message queue lead to a use-after-free
on timeouts? The message is detached from the list before checking mailbox
availability. If a synchronous caller times out during this detached window,
the cancellation attempt will fail. Because the actual mailbox is still
unassigned, the timeout handler skips sending an abort command and frees the
DMA buffers. However, the thread might later re-add and submit this message,
instructing hardware to write to freed memory.

[ ... ]
> 		if (!list_empty(&tm.backlog)) {
> 			struct command_msg *bl;
[ ... ]
> 			if (bl->complete)
> 				bl->complete(bl->completion_data,
> 					     -EINPROGRESS);
> 		}
>=20
> 		spin_unlock_irqrestore(&tm.cmq_lock, flags);

[Severity: High]
Can this recursive spinlock acquisition cause a deadlock? The code calls the
completion callback with the in-progress status while holding the command
queue lock. If the crypto framework consumer responds to this callback by
submitting a new request, won't the submission attempt to acquire the exact
same spinlock on the same CPU?

[ ... ]
> static void cmh_tm_stop_and_drain_cmq(void)
> {
[ ... ]
> 	list_for_each_entry_safe(msg, tmp_msg, &cmq_drain, list) {
> 		list_del(&msg->list);
> 		if (msg->complete)
> 			msg->complete(msg->completion_data, -ECANCELED);
> 		command_msg_put(msg);
> 	}

[Severity: High]
Is it safe to iterate over the spliced local drain list without holding a
lock here? If a synchronous request times out simultaneously, the cancellat=
ion
function will acquire the queue lock, see that the message's list node isn't
empty (since it is on the local drain list), and call list_del_init(). This
concurrent modification could corrupt the list pointers during iteration.

[ ... ]
> void cmh_tm_quiesce(void)
> {
[ ... ]
> 			list_for_each_entry_safe(txn, tmp_txn, &drain, list) {
> 				list_del(&txn->list);
>=20
> 				if (timer_delete_sync(&txn->timeout_timer))
> 					txn_put(txn);
>=20
> 				old =3D atomic_cmpxchg(&txn->state,
> 						     TXN_INFLIGHT,
> 						     TXN_COMPLETE);
> 				if (txn->complete) {
> 					if (old =3D=3D TXN_INFLIGHT)
> 						txn->complete(txn->completion_data,
> 							      -ECANCELED);
[ ... ]
> 				txn_put(txn);
> 			}

[Severity: High]
Could this lead to a use-after-free race with the response handler?
Transactions are being iterated and freed via txn_put() without holding the
process lock. Concurrently, the active watchdog might peek at the head
transaction. If the transaction is freed here before the watchdog reads its
state, memory corruption could result.

[Severity: High]
Does completing these transactions with the cancelled status leave the
hardware in a state where it might overwrite freed memory? The driver
forcefully completes abandoned requests here (and similarly during module
cleanup), which prompts callers to free their DMA buffers. Since the hardwa=
re
engines haven't been synchronously stopped, could they continue executing a=
nd
write into these newly freed buffers?

> diff --git a/drivers/crypto/cmh/cmh_rh.c b/drivers/crypto/cmh/cmh_rh.c
> --- a/drivers/crypto/cmh/cmh_rh.c
> +++ b/drivers/crypto/cmh/cmh_rh.c
[ ... ]
> void cmh_rh_force_drain_mbx(u32 mbx_idx)
> {
[ ... ]
> 	cmh_reg_write32(MBX_COMMAND_FLUSH, base, R_MBX_COMMAND);
> 	cmh_rh_poke_tail(base);
> 	cmh_rh_drain_mbx(mbx_idx, -ECANCELED);

[Severity: High]
Similar to the quiesce behavior, does issuing a flush and immediately
draining the mailbox allow the hardware to access freed memory? If the
flush command completes asynchronously, the hardware might still be accessi=
ng
the buffers when the drain completes the transactions, prompting callers
to release them prematurely.

[ ... ]
> static irqreturn_t cmh_rh_thread(int irq, void *data)
> {
[ ... ]
> 			irq_bits =3D (u32)atomic_xchg(&rh.mbx[i].irq_bits, 0);
> 			WRITE_ONCE(rh.mbx[i].pending, false);

[Severity: High]
Is there a time-of-check to time-of-use race window here? The thread reads
the interrupt bits using atomic_xchg and subsequently clears the pending fl=
ag.
If a hardware interrupt occurs strictly between these two lines, the hardirq
handler will set the pending flag to true, but this code will immediately
overwrite it to false. Could this result in orphaned interrupt bits and mis=
sed
completions?

[ ... ]
> static int cmh_rh_resolve_irqs(struct cmh_config *cfg)
> {
[ ... ]
> 		int virq =3D of_irq_get(np, dt_idx);
>=20
> 		if (virq <=3D 0) {
> 			dev_warn(cmh_dev(), "rh: failed to map IRQ for MBX%u (DT index %d, rc=
=3D%d)\n",
> 				 i, dt_idx, virq);
> 			return -ENODEV;
> 		}

[Severity: Medium]
Does swallowing the deferral error cause issues with interrupt controller
readiness? If the IRQ controller is not yet ready, of_irq_get() will return
-EPROBE_DEFER, but this code converts it to -ENODEV and falls back to polli=
ng
permanently. Should this propagate the deferral so the driver can be probed
again later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D2
