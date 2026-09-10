Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082DC3101D4
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 01:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003316; cv=none; b=g/xHCQBgpKy/PaZrZ4o+XuXr047Nc0gEfeQHHpzm4I1/Bfa9W5F6JfEoEoZIyUi8ohwDidGRE4Xl9ZulFkIbNklC9atxSFXm/rySWPTqjX/kRiwf1IKA0v7NY1nqN22hU+IhD6q4rIdw5JRIIx7DtWQJbAhNcADnkmzz89ID/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003316; c=relaxed/simple;
	bh=m+90trWW4dl8qW8FyqjwYkGw6iRPtwUp8pGMkbC9ANQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bO/19uFCkbbt+qzCxwA+ORdh9JlodgJDi+L3ckwhdYjN04ZZNe0wwmZWgN1jasH/+VtKUwIqu7bmTfYZ7Z/zUZ5PHQbq6V1OdULyM4nE1XK9fptAqmr+K1MmkXeum895AHvDchNRpGACtlGfc/UiMmDTihZNUzWC935P2q2boNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtcmLh6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtcmLh6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741D41F000FF;
	Thu, 10 Sep 2026 01:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789003314;
	bh=WoMzWC/VbbdvXmrd+z9xRnCL2ERpn9/c/5g8jacFkWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mtcmLh6Z2ZOeBF65wRbH0tvBckd2CLG9/+/coAI9X2jKfrwAOZyyRGIkjTfOgYGGL
	 noGbq23nhAAN+Zz+Q26ofG1Fqv8Y756Qh3Zf2KFWL08+2bpHgBoJ71bTKVGcTQgCgW
	 rovU871sY+vTRyDneDKhKG84aC4atZeAPuh3d4qT12bGlD1Ftoayb2eLxbJZ1GbXls
	 gySpoExAG5iGpNR1BTyu17YsDisW94i1Dqp4PixK9CvcUZUYscxVY4gvDN5BCLA2oY
	 IAO7W39KhWAVfT7GZQI1ERWhACU/OMwbnaS9qEaawPjTcz/zgsvJ2dIz16n7HKBE8K
	 Pjx+9kpDNaIaQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 1/6] mailbox: riscv-sbi-mpxy: add
 riscv_sbi_mpxy_mbox_call() for hart-local requests
Reply-To: sashiko-reviews@lists.linux.dev
To: marouene.boubakri@oss.nxp.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910012057.106966-2-marouene.boubakri@oss.nxp.com>
References: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
 <20260910012057.106966-2-marouene.boubakri@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 01:21:54 +0000
Message-Id: <20260910012154.741D41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The per-hart shared memory (`mpxy->shmem`) is vulnerable to corrup=
tion by MSI hardirqs due to insufficient interrupt masking in multiple code=
 paths.
- [High] Multiple functions evaluate `this_cpu_ptr()` before disabling pree=
mption, risking cross-CPU memory corruption if the task is migrated.
- [High] Missing bounds check on the firmware-supplied response length agai=
nst the actual shared memory size allows an out-of-bounds read of kernel me=
mory.
- [High] Missing bounds check on firmware-supplied `returned` count in `mpx=
y_get_channel_ids()` leads to severe out-of-bounds read.
--

commit 47c5774a19a0d62c9200c1c19adf1be0e5a99331
Author: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

mailbox: riscv-sbi-mpxy: add riscv_sbi_mpxy_mbox_call() for hart-local requ=
ests

An SBI MPXY message send is not queued in a hardware mailbox: it is an
ecall executed on the calling hart with the calling hart's shared memory
which returns once the SBI implementation has processed the message.

> diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/risc=
v-sbi-mpxy-mbox.c
> index ea69c6b6b4f99..2c80e6fd19b6d 100644
> --- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> +++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
[ ... ]
> @@ -719,6 +720,65 @@ static const struct mbox_chan_ops mpxy_mbox_ops =3D {
>  	.shutdown =3D mpxy_mbox_shutdown,
>  };
> =20
> +/**
> + * riscv_sbi_mpxy_mbox_call() - Send an RPMI message directly on an MPXY=
 channel
> + * @chan: SBI MPXY mailbox channel owned by the caller
> + * @msg: RPMI message of type RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE or
> + *       RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE
[ ... ]
> +int riscv_sbi_mpxy_mbox_call(struct mbox_chan *chan,
> +			     struct rpmi_mbox_message *msg)
> +{
> +	struct mpxy_mbox_channel *mchan;
> +	unsigned long flags;
> +
> +	if (!chan || !chan->cl || !chan->mbox || !msg)
> +		return -EINVAL;
> +	if (chan->mbox->ops !=3D &mpxy_mbox_ops)
> +		return -EINVAL;
> +	if (msg->type !=3D RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE &&
> +	    msg->type !=3D RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE)
> +		return -EINVAL;
> +
> +	mchan =3D chan->con_priv;
> +	if (mchan->attrs.msg_proto_id !=3D SBI_MPXY_MSGPROTO_RPMI_ID)
> +		return -EOPNOTSUPP;
> +
> +	local_irq_save(flags);
> +	mpxy_mbox_send_rpmi_data(mchan, msg);

[Severity: High]
This isn't a bug introduced by this patch, but is a severe pre-existing iss=
ue
in the modified file.

The driver heavily relies on mpxy->shmem, a per-CPU shared memory buffer, f=
or
communicating with the firmware. Existing functions such as
mpxy_get_notifications(), mpxy_write_attrs(), and
mpxy_send_message_with_resp() protect this buffer solely by disabling
preemption via get_cpu(), leaving local hardware interrupts enabled.

As explicitly noted in the patch's commit message, mpxy->shmem is also
accessed from hard interrupt context (e.g., by the RPMI system MSI irqchip
via mbox_send_message()). If a hardware interrupt fires while a thread is
executing one of these functions (for example, reading notifications in
process context), the hardirq handler will re-enter the driver on the same
CPU, overwrite the shared memory, and silently corrupt the payload of the
interrupted thread.

For example, in mpxy_send_message_with_resp():

	get_cpu();

	/* Message protocols allowed to have no data in messages */
	if (tx_len)
		memcpy(mpxy->shmem, tx, tx_len);

Preemption is disabled but hardware interrupts remain enabled. Can an incom=
ing
hardirq re-enter the driver and corrupt the payload just written to the sha=
red
memory?

[Severity: High]
This is a pre-existing issue, but multiple functions evaluate this_cpu_ptr()
before disabling preemption, risking cross-CPU memory corruption if the task
is migrated.

Functions like mpxy_read_attrs() and mpxy_get_notifications() evaluate
this_cpu_ptr(&mpxy_local) at the very beginning of the function while
preemption is still enabled. Preemption is only disabled later when get_cpu=
()
is called.

For example, in mpxy_read_attrs():

	struct mpxy_local *mpxy =3D this_cpu_ptr(&mpxy_local);
	struct sbiret sret;

	if (!mpxy->shmem_active)
		return -ENODEV;
	if (!attr_count || !attrs_buf)
		return -EINVAL;

	get_cpu();

If the thread is preempted and migrated to another CPU during this window,
will it resume on the new CPU with preemption disabled, but the mpxy pointer
still pointing to the shared memory of the old CPU? Could this completely
break per-CPU data isolation, allowing two different CPUs to concurrently
read/write the same shared memory page without any locking?

[Severity: High]
This is a pre-existing issue, but missing bounds checks on the
firmware-supplied response length against the actual shared memory size all=
ows
an out-of-bounds read of kernel memory.

In mpxy_mbox_send_rpmi_data(), the driver fails to validate that the
caller-supplied msg->data.max_response_len does not exceed
mchan->max_xfer_len (the capacity of the shared memory page):

		if ((!msg->data.request && msg->data.request_len) ||
		    (msg->data.request && msg->data.request_len > mchan->max_xfer_len) ||
		    (!msg->data.response && msg->data.max_response_len)) {
			msg->error =3D -EINVAL;
			break;
		}

This unvalidated length is passed down to mpxy_send_message_with_resp() as
max_rx_len.

If the firmware executes the ecall and returns a response size in sret.value
that is less than the caller's huge max_rx_len but greater than
mpxy_shmem_size:

		rx_bytes =3D sret.value;
		if (rx_bytes > max_rx_len) {
			put_cpu();
			return -ENOSPC;
		}

		memcpy(rx, mpxy->shmem, rx_bytes);

Does this read out-of-bounds past the allocated mpxy->shmem page into adjac=
ent
kernel memory, leaking data to the caller and potentially causing a page fa=
ult
if it crosses an unmapped boundary?

[Severity: High]
This is a pre-existing issue, but a missing bounds check on the
firmware-supplied returned count in mpxy_get_channel_ids() can lead to a
severe out-of-bounds read.

mpxy_get_channel_ids() reads the number of returned elements directly from =
the
firmware-populated shared memory:

		returned =3D le32_to_cpu(sdata->returned);

		count =3D returned < (channel_count - start_index) ?
			returned : (channel_count - start_index);
		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);

Neither returned nor count is validated against the physical capacity of the
shared memory page (mpxy_shmem_size).

Since channel_count is also derived from an unvalidated firmware response,
both values can be arbitrarily large. Will a malicious or malformed firmware
response cause a massive out-of-bounds read from mpxy->shmem, likely causing
a kernel page fault panic when crossing into unmapped memory?

> +	local_irq_restore(flags);
> +
> +	return msg->error;
> +}
> +EXPORT_SYMBOL_GPL(riscv_sbi_mpxy_mbox_call);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910012057.1069=
66-1-marouene.boubakri@oss.nxp.com?part=3D1
