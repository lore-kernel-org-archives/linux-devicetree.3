Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4521E9B1A
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652681; cv=none; b=D8m8+q/gecQm+ZCatyuJCSHJ2Go1gDe+9I26FdmNY62QUB4wNoguyX2qYnrohB2ik3uFC9gCeBkNAHjusDFGs3ZXfF78FtimvoGvFjMHzbWB+aMAsJOEVy5o90xaNl47RgzxdAhmp2PECGXwn066qfYfwtJLeyd5TNSlVdnJbVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652681; c=relaxed/simple;
	bh=MnvjT3sKa2JMIX+RRPE9E2QEpQpd1EErh94JSgIA7KA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ewByaU4kFIrLUGOjwM7DW78n1BD7zAFi4LFpGSP7UwelSGJ8EVdyiuYnZdZv0Lbtp3ua/nLQQ5SY4wYgYpZki87/OW8dF/bs8+VmpPicMu1F/I+CfBx492YTZNXkbXnMiHUZS12EnT9BmfV4bsN+yLsjH6JA/wuBPJADjud4BOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSRa5Eo8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSRa5Eo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDDB1F000FF;
	Tue, 29 Sep 2026 03:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790652680;
	bh=E2DkiKPq0UHEU7FOGuBUe/+N4cz8+lqvSDiTpHfprzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HSRa5Eo826FxQ68ISOdx86MP0fSYk31RwIwftr1UK8KrEIZqPOnP9hIIE+lj9+hkx
	 0qn8bUf3fKhtb29UZlSPGpAfxRlskWD/qMOesgL0wpr92banengimJmibKP/nmZ595
	 5OFwa8EaAouovAc+FDwM8U7UcH4QZuYFw9Pbepg1luGd8Nitelb+V4Kv6ReY9CNDAz
	 Q3UKLJbEB3READV7v4dKJ45965LD9qhBy3l649sTdE5ty6Q9j1R0jzbRE1I4FZtgBN
	 HfUEtGg6aD0/0FFK/+ltmSZJOpL5cmgLDEud8kqoY6cCTYFe3QDwWVwUSY7mTkd1V9
	 yMRmmsE8GTDNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/10] mailbox: mpxy: add direct synchronous send
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-2-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
 <20260928-riscv-rpmi-tee-abi-v1-2-04908b81d885@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 03:31:19 +0000
Message-Id: <20260929033119.EDDDB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mailbox: mpxy: data corruption in per-CPU shmem during synchronous=
 message send
--

commit bcfd2dc6803abf5903a075709bb8a16e026dbe2c
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

mailbox: mpxy: add direct synchronous send

Implement send_data_sync() for RPMI MPXY channels, reusing the existing
RPMI message dispatch and returning its status directly instead of going
through mbox_chan_txdone(). Factor per-hart shared-memory acquisition into
mpxy_shmem_get()/mpxy_shmem_put() so both paths pin the CPU. Add
rpmi_mbox_send_message_sync() as the RPMI counterpart.

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
Since get_cpu() disables preemption but leaves local interrupts enabled,
can a hardware interrupt preempt this code and re-enter the mailbox driver?

If an interrupt handler queues an asynchronous message, it will re-enter
mpxy_shmem_get() on the same CPU. Because it receives the exact same
mpxy_local instance, could it overwrite the per-CPU buffer?

> +	if (!mpxy->shmem_active) {
> +		put_cpu();
> +		return -ENODEV;
> +	}
> +
> +	*out =3D mpxy;
> +	return 0;
> +}

> [ ... ]

> @@ -239,16 +274,17 @@ static int mpxy_send_message_with_resp(u32 channel_=
id, u32 msg_id,
>  				       void *rx, unsigned long max_rx_len,
>  				       unsigned long *rx_len)
>  {
> -	struct mpxy_local *mpxy =3D this_cpu_ptr(&mpxy_local);
> +	struct mpxy_local *mpxy;
>  	unsigned long rx_bytes;
>  	struct sbiret sret;
> +	int rc;
> =20
> -	if (!mpxy->shmem_active)
> -		return -ENODEV;
>  	if (!tx && tx_len)
>  		return -EINVAL;
> =20
> -	get_cpu();
> +	rc =3D mpxy_shmem_get(&mpxy);
> +	if (rc)
> +		return rc;
> =20
>  	/* Message protocols allowed to have no data in messages */
>  	if (tx_len)
> +		memcpy(mpxy->shmem, tx, tx_len);
> =20
>  	sret =3D sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
>  			 channel_id, msg_id, tx_len, 0, 0, 0);

[Severity: High]
Could the shared memory be silently corrupted here if an interrupt fires wh=
ile
the CPU is executing the message send?

For example, if an interrupt occurs after copying the request but before
invoking sbi_ecall, or before reading the response, it might overwrite
mpxy->shmem with its own payload. This could lead to incorrect firmware
requests or corrupted responses for the interrupted synchronous transaction.

> [ ... ]

> @@ -516,12 +562,21 @@ static int mpxy_mbox_send_data(struct mbox_chan *ch=
an, void *data)
>  {
>  	struct mpxy_mbox_channel *mchan =3D chan->con_priv;
> =20
> -	if (mchan->attrs.msg_proto_id =3D=3D SBI_MPXY_MSGPROTO_RPMI_ID) {
> -		mpxy_mbox_send_rpmi_data(mchan, data);
> -		return 0;
> -	}
> +	if (mchan->attrs.msg_proto_id !=3D SBI_MPXY_MSGPROTO_RPMI_ID)
> +		return -EOPNOTSUPP;
> +
> +	mpxy_mbox_send_rpmi_data(mchan, data);
> +	return 0;
> +}
> +
> +static int mpxy_mbox_send_data_sync(struct mbox_chan *chan, void *data)
> +{
> +	struct mpxy_mbox_channel *mchan =3D chan->con_priv;

[Severity: High]
Does this new synchronous entry point need IRQ protection?

It appears mpxy_mbox_send_data_sync() is invoked without holding the
channel lock and executes with interrupts enabled. This would expose the
underlying per-CPU buffer logic to the concurrency issues mentioned above.

> +
> +	if (mchan->attrs.msg_proto_id !=3D SBI_MPXY_MSGPROTO_RPMI_ID)
> +		return -EOPNOTSUPP;
> =20
> -	return -EOPNOTSUPP;
> +	return mpxy_mbox_send_rpmi_data(mchan, data);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-riscv-rpmi=
-tee-abi-v1-0-04908b81d885@oss.qualcomm.com?part=3D2
