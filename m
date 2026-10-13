Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D88530E18
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915221; cv=none; b=BZy+BQBRH6PXsGsQYoVjncf6hMQk8O6bFsR6jxcEA+g45SPUKz+6YB1USZll4WkcXui5uvRyI+6a7Rh4NpTmrJGFQizhNBVwm3TpoD7aVXF/OjSEzqLJ2ZJ+r4iLnJ6H2ZpqQVQ0GMpQphMQKM6a7u3zaI8wlys3uMIPlUxrZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915221; c=relaxed/simple;
	bh=k3rIdJVqL3ur5jmQpaf63TM8HphhAnxET+vlFatcsf8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=W0mT69QRfruNGvmIdpSCIJOj0gPygmyBzQqwP/tln8FcI0ATIq2AOQUNO7IGNWXpJFbbN0a8FghZa3n2eOmX6pmZaumgCn/x9y/ZVcmcMcMLbI5L5iqND8ODZaxyZgKbU2RVvQzQS20f4LXG+IFqNKjW8NfGj056an3LKMnNgmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCQ0wJtM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCQ0wJtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E7B1F000FF;
	Tue, 13 Oct 2026 18:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791915219;
	bh=fdoCV0+LozOWSjjPALc1uSQ/bk9WRGZjTb9NOS7s+mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PCQ0wJtMDSRFv71rTunwCzI0U+q8EqX4S4JRlBDzyv2k4y1OFdP84gNeOeeBTZC1i
	 iTHkrQhNdJFO4uNv+7De5oVZ+DVr7yDQXvwNP8AzyBN9QBvPFPU0Z+SrZSiHAfj29l
	 zWETm62TmHwyCKJGd5YWpoH1PIlMvLjoLVAe/2nr0ks6/2P8XbtdhugbsvefI6Q+LL
	 po6MJWYM7NDrvu7wpWQFuQ536Cf2VWzBumeg8uh6QnmggMfQL1aT9lpVcbNcUfhEO/
	 nFYrlTOo8WbzjmJy9K4/I1TNVY3krLo8O2Oo7WmngJD9VlE0UX38kWbjGuRJW2HjE4
	 fG/faJ5OKU5sw==
Message-ID: <sashiko-outbox-170302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] crypto: cmh - add core platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013174847.2192609-3-aousherovitch@rambus.com>
References: <20261013174847.2192609-1-aousherovitch@rambus.com>
 <20261013174847.2192609-3-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:13:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] cmh: Race between asynchronous MBX_COMMAND_FLUSH and new TM su=
bmissions
- [Critical] cmh: TOCTOU race in sync timeout skips MBX_COMMAND_ABORT causi=
ng DMA corruption
- [High] cmh: Missing timeout_jiffies init for sync submissions permanently=
 wedges mailbox
- [High] dma: Memory corruption risk when orphan tracking allocation fails
- [Medium] cmh: Missing R_MBX_HOST_INFO write during MBX initialization
--

commit c7930298939b6ced18687e375218ef4b78b1e3fe
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add core platform driver

Add the Rambus CryptoManager Hub (CMH) hardware crypto accelerator
core platform driver. The driver manages hardware configuration, VCQ
command submission, and asynchronous completions.

> diff --git a/drivers/crypto/cmh/cmh_dma.c b/drivers/crypto/cmh/cmh_dma.c
> --- a/drivers/crypto/cmh/cmh_dma.c
> +++ b/drivers/crypto/cmh/cmh_dma.c
[ ... ]
> @@ -424,4 +424,4 @@ void cmh_dma_free_out(void *buf, dma_addr_t dma, size=
_t len,
>  		/* Rare: cannot park without a descriptor -- best-effort free. */
>  		dev_warn_ratelimited(cmh_dev(),
>  				     "dma: park alloc failed, freeing output buffer\n");
>  	}
> =20
>  	cmh_dma_unmap_single(dma, len, dir);
>  	kfree_sensitive(buf);

[Severity: High]
Does this fallback path risk a DMA memory corruption regression if the
allocation fails?

Because the hardware lacks a DMA-stop primitive, it may still be actively
writing to this physical address. Freeing the memory back to the slab
allocator could allow it to be reassigned to other kernel structures while
the hardware is still writing to it. Is it safer to intentionally leak the
memory here to prevent corruption?

> diff --git a/drivers/crypto/cmh/cmh_mqi.c b/drivers/crypto/cmh/cmh_mqi.c
> --- a/drivers/crypto/cmh/cmh_mqi.c
> +++ b/drivers/crypto/cmh/cmh_mqi.c
[ ... ]
> @@ -201,4 +201,4 @@ static int cmh_mbx_setup_one(struct cmh_mbx_config *m=
bx)
>  	/*
>  	 * Step 6: Readback verify critical registers.
>  	 * HOST_INFO is deliberately deferred to after verification -- writing
>  	 * it tells the CMH eSW "MBX is ready" and the CMH eSW may inspect
>  	 * (and clear) the queue registers immediately.
>  	 */
>  	ret =3D cmh_verify_reg(base, R_MBX_QUEUE_LO, addr_lo,
>  			     "QUEUE_LO", mbx->instance);

[Severity: Medium]
The comment mentions writing to the HOST_INFO register to signal to the
embedded software that the mailbox is ready. However, it looks like the
driver never actually performs the write to this register after the
verification steps, and only writes MBX_COMMAND_RUN.

Will this leave the embedded software unaware that the mailbox is active,
causing a regression on hardware configurations that depend on this signal?

> diff --git a/drivers/crypto/cmh/cmh_rh.c b/drivers/crypto/cmh/cmh_rh.c
> --- a/drivers/crypto/cmh/cmh_rh.c
> +++ b/drivers/crypto/cmh/cmh_rh.c
[ ... ]
> @@ -429,4 +429,4 @@ static void cmh_rh_process_mbx(u32 mbx_idx, u32 new_h=
ead, u32 irq_bits)
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
>  			return;

[Severity: High]
Does this sequence introduce a regression involving a race condition with t=
he
transaction manager?

The hardware flush command appears to be processed asynchronously by the
embedded software, but the software queue is drained immediately without
waiting for the flush to complete or marking the mailbox as offline.

Could the transaction manager thread concurrently acquire the dispatch lock,
write a new transaction into the ring, and advance the hardware tail doorbe=
ll?
If so, when the embedded software eventually processes the flush, it might
discard the new queue state. The response handler could then interpret the
advanced head pointer as a successful execution, completing discarded
transactions with no error.

This same pattern also occurs in cmh_rh_watchdog_fn() and cmh_tm_flush_mbx(=
).

> diff --git a/drivers/crypto/cmh/cmh_txn.c b/drivers/crypto/cmh/cmh_txn.c
> --- a/drivers/crypto/cmh/cmh_txn.c
> +++ b/drivers/crypto/cmh/cmh_txn.c
[ ... ]
> @@ -1500,4 +1500,4 @@ int cmh_tm_submit_sync_tmo(struct vcq_cmd *vcq_cmds=
, u32 vcq_count,
>  	msg->command_id =3D vcq_cmds[1].id;  /* first real command's ID */
>  	msg->vcq_count  =3D vcq_count;
>  	msg->num_vcqs   =3D num_vcqs;
>  	msg->target_mbx =3D target_mbx;
>  	msg->actual_mbx =3D -1;
>  	msg->first_vcq_id =3D U32_MAX;
>  	msg->complete   =3D cmh_sync_complete;
>  	msg->completion_data =3D sync;
>  	refcount_set(&msg->refs, 2);       /* waiter + TM subsystem */

[Severity: High]
Is the timeout_jiffies field intentionally left uninitialized for synchrono=
us
submissions?

Since the command_msg is allocated with kzalloc_obj, msg->timeout_jiffies
remains zero. The transaction manager thread skips arming the timeout timer
when this field is zero.

Because the watchdog's abort-stall detector explicitly relies on a transact=
ion
reaching the TXN_TIMED_OUT state, which is only set by the timer callback,
could a stalled synchronous request remain in the TXN_INFLIGHT state
indefinitely and permanently stall the mailbox if the hardware wedges?

[ ... ]
> @@ -1546,4 +1546,4 @@ int cmh_tm_submit_sync_tmo(struct vcq_cmd *vcq_cmds=
, u32 vcq_count,
>  			 * cmh_rh_abort_mbx() serialises the write under
>  			 * rh_process_lock, preventing clobber of a
>  			 * concurrent RESTART/FLUSH from the watchdog.
>  			 */
>  			s32 abrt_mbx =3D READ_ONCE(msg->actual_mbx);
> =20
>  			/*
>  			 * Only ABORT if our VCQ is the one currently at the
>  			 * mailbox HEAD.  ABORT stops whatever executes at
>  			 * HEAD, so aborting while a different (older,
>  			 * possibly long-running) transaction is at HEAD would
>  			 * kill an unrelated request.  If ours is queued behind
>  			 * it, the HW has not started ours yet -- leave it to
>  			 * the completion wait / watchdog rather than abort
>  			 * someone else.
>  			 */
>  			if (abrt_mbx >=3D 0 &&
>  			    (u32)abrt_mbx < tm.cfg->mbx_count) {
>  				void __iomem *abase =3D
>  					tm.cfg->mailboxes[abrt_mbx].reg_base;
>  				u32 head =3D cmh_reg_read32(abase,
>  							  R_MBX_QUEUE_HEAD);
> =20
>  				if (READ_ONCE(msg->first_vcq_id) =3D=3D head) {
>  					dev_warn(cmh_dev(),
>  						 "tm: aborting mbx[%d] cmd=3D0x%08x\n",
>  						 abrt_mbx, msg->command_id);
>  					cmh_rh_abort_mbx((u32)abrt_mbx);
>  				}
>  			}
> =20
>  			/*
>  			 * Wait for the RH completion (ABORT triggers
>  			 * MBX_ERROR_IRQ within microseconds).  Fixed
>  			 * 5 s ceiling -- not configurable because if
>  			 * ABORT doesn't complete in this window the
>  			 * HW is wedged and more waiting won't help.
>  			 */
>  			left =3D wait_for_completion_timeout(&sync->done,
>  							   5 * HZ);

[Severity: High]
Does reading msg->actual_mbx here create a race condition with the transact=
ion
manager?

If the transaction manager thread has dequeued the message but is preempted
before setting msg->actual_mbx and submitting it to the hardware, the
cancellation attempt will fail because the message is no longer on the list.
The waiting thread will then read the transient -1 value for actual_mbx.

Could this cause the waiter to completely skip issuing the abort command and
proceed to free its DMA buffers after the 5-second wait? If the transaction
manager thread later wakes up and submits the request to the hardware, the
hardware might write crypto output directly into the freed DMA buffers,
causing a memory corruption regression.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013174847.2192=
609-1-aousherovitch@rambus.com?part=3D2
