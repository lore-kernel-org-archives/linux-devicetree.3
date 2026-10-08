Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F90305692
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430729; cv=none; b=s0/Rurb78BuvsCQEZlIFDnJcV/grhVS5ezr9rGbOe/tYLqZcZ2Y8unmfkmXbXfBp/UoNFfH8FwXBI39FIX0KPchfdtu7MBXJ5j2J2pD8hbJgj2IJGwppLg4QKtXEm9AONEVy1OE302pAldLK/iWe58XRdtUTkpOhadRmK3P+TCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430729; c=relaxed/simple;
	bh=suNMb5IrvanM+XaK0pzNSTeDyr6TUkwak8Et1Sm74h0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=agZfjqroc2u02zc4Wxj6bc1aK/VeFHpA6zxIm97KS/acmNaxGZZYTbLhnkVftKB22sbf13xiKq2uhiriIuKPkq7xg/GmLATWwTyEgcZyrC04LwKe+Sx6/1gqdZGtbZptTgTNkEFtYLNZ2oO8RMohF4r/9X6/CfS7hL4cOY+iJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJYR3Yv9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJYR3Yv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713351F000FF;
	Thu,  8 Oct 2026 03:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791430723;
	bh=KlHx4L5xOkqtJP6T1rwV+bwxGSg9s8+q7UgDyfMjat4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KJYR3Yv9x8M8hleaif70l238oipcozhl09/qminXe8rnfAxCvtBxgHj7BMxY4Imsr
	 Xy6q9KlnKhiIZNejZnL6Fs8gQ62AK1SoPq61yICki5HrjJBsYk3oLy3ykyeF1rDiHW
	 3dBbUjnS8lhDzGWwTwB4tnI0/25PHfJhigog50oGqQ2lAeHQtdl2ZOcXzF6CX89d+q
	 +UxeErFulwWLAWZEaH6KKvOHVWkEf9Q0BWvF7wr9xoqaOIAt4klr39UuIZOcEGN6Bj
	 +NPdK3/6CBzakqNzyLzyi9ZUA5fTNYTA/yBJo39qdP300GACroQBfZ6d1vQLDFZFGM
	 jztXqgF1Aclsw==
Message-ID: <sashiko-outbox-163567@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 02/10] mailbox: mpxy: add direct synchronous send
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-2-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
 <20261007-riscv-rpmi-tee-abi-v2-2-45939a13d223@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 03:38:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mailbox: mpxy: interrupt re-entrancy corrupts per-CPU shared memory
- [High] mailbox: mpxy: out-of-bounds reads from shared memory due to unval=
idated firmware lengths
--

commit f39e41c9bf232ff624a7e653d9065bd9586d45d9
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

mailbox: mpxy: add direct synchronous send

This patch implements send_data_sync() for RPMI MPXY channels, allowing=20
RPMI messages to be dispatched synchronously. It factors per-CPU shared
memory acquisition into mpxy_shmem_get() and mpxy_shmem_put(), keeping
requests and their responses on the same CPU. It also adds a counterpart=20
helper rpmi_mbox_send_message_sync() for the TEE transport.

> diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/risc=
v-sbi-mpxy-mbox.c
> index ea69c6b6b4f99..5ca1b6d87f5c6 100644
> --- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> +++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> @@ -125,54 +125,83 @@ static DEFINE_PER_CPU(struct mpxy_local, mpxy_local=
);
>  static unsigned long mpxy_shmem_size;
>  static bool mpxy_shmem_init_done;
> =20
> +static int mpxy_shmem_get(struct mpxy_local **out)
> +{
> +	struct mpxy_local *mpxy;
> +
> +	get_cpu();
> +	mpxy =3D this_cpu_ptr(&mpxy_local);

[Severity: High]
Does this leave per-CPU shared memory vulnerable to interrupt re-entrancy?

Since get_cpu() disables preemption but leaves hardware interrupts enabled,
what happens if an interrupt fires on this CPU while a request holds the
mpxy->shmem buffer?

Because the new mpxy_mbox_send_data_sync() runs with interrupts enabled, and
the async send path (e.g. from clock or power management interrupt handlers)
also drops the channel lock before calling send_data, an async message could
interrupt the synchronous send.

The async path would then re-enter mpxy_shmem_get() on the same CPU, receive
the exact same mpxy_local buffer, and silently overwrite the interrupted
task's request payload or response buffer.

Should mpxy_shmem_get() use local_irq_save() (or local_lock_irqsave())
to disable local interrupts and prevent this same-CPU re-entrancy?

[ ... ]

> @@ -182,55 +211,61 @@ static int mpxy_get_channel_ids(u32 channel_count, =
u32 *channel_ids)
>  		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, coun=
t);
>  		start_index +=3D count;
>  	} while (remaining && start_index < channel_count);
> +	rc =3D 0;

[Severity: High]
Can firmware trigger an out-of-bounds read here?

The number of returned channels is derived from the firmware's
sdata->returned. While count is bounded by the total remaining channels
expected, it doesn't appear that count * sizeof(u32) is checked against
mpxy_shmem_size.

If a buggy or compromised firmware provides an unusually large returned val=
ue,
will memcpy_from_le32() read past the end of the mpxy->shmem page into
adjacent kernel memory?

[ ... ]

> @@ -259,8 +295,8 @@ static int mpxy_send_message_with_resp(u32 channel_id=
, u32 msg_id,
>  	if (rx && !sret.error) {
>  		rx_bytes =3D sret.value;
>  		if (rx_bytes > max_rx_len) {
> -			put_cpu();
> -			return -ENOSPC;
> +			rc =3D -ENOSPC;
> +			goto out;
>  		}
> =20
>  		memcpy(rx, mpxy->shmem, rx_bytes);

[Severity: High]
Does this memcpy() lack a bounds check against the shared memory size?

The response size sret.value is assigned to rx_bytes, and while it is
checked to ensure it fits within the client-provided max_rx_len, it does
not appear to be checked against mpxy_shmem_size.

If a client requests a large response and firmware returns a length that
exceeds the shared memory allocation, will this read past the end of the
mpxy->shmem buffer and leak kernel memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-riscv-rpmi=
-tee-abi-v2-0-45939a13d223@oss.qualcomm.com?part=3D2
