Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E246627EC7C
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208766; cv=none; b=atpfFJjx0D3+Sz4GborCFG9PoBxEQrzfuKjxWhwqj9k6MdEjYKHuJXMOGvOdlUnj7/bof+h+hP08utE+ZTYauXVYOBUBENQkjxDcPRomlkCRQHPVP8jF30UO6qDjSDteTPqLo93gggnOFENKoTze/LmQZencU+jxkTT7hxIuWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208766; c=relaxed/simple;
	bh=/MuLzlmB23+bqAvycez041qJ1nNU47TvC51Sea4cppg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ThVr6eeO6VW+rPnGmIuXJJa5ztZO3WRBqOA+eioOPEJwdFwETEQIHhkB4bfF1Ri3LettL2n4B2qRcOice9Olh+eQlg+iTUdd0DOzV+wUUGFdHq1j8kIlGT2osTf5uM6QCKvATVZB5Gt1ELgApOUTzUVcp0kdx59b9cExZTUWUiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNcyzT49; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNcyzT49"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B371F000FF;
	Sat, 12 Sep 2026 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789208763;
	bh=JNKzbqERxhaicP4EyKgnD73Gzxmj1qgZkP/zT01py90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNcyzT495SLvKRiR4FqEOh1ma/O8K1wBE9JyrrZC2NMDE5Xs7gOLKmPAI8x5e7QXr
	 wSYM+TheBOBYzS5nqB+kFw4HDmS3nmkg2/DrDAZc/Kp3l5KxEwNI6tu+AKCbQti9T8
	 am2xyn3PNdyfNfs9ENghLFDaTIJOx/WCn+2ULx1BVzObA2LzHRYRmdNxyj6X83szPI
	 yKzJjtwMJllwdR4hwmX5UrzHb8cHG0BZ9beINAFXdOta2LuBFK8ri37gJQsIB+KRI4
	 fkBDvnvOk5f05awyKqayvKbmDajqsoeG0I7uN6rI2htJ6FoM85gvFyUchEyv1TK568
	 nL69diceQKe4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/5] optee: riscv: add asynchronous notifications
 over the signal bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-4-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-4-1d1d35c2a859@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 10:26:02 +0000
Message-Id: <20260912102603.61B371F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Reusing the `rx` buffer without validating `msg.data.out_response_=
len` allows stale data to trigger an infinite loop in the threaded IRQ hand=
ler.
- [High] Failing to drain pending signals on error paths (such as dynamic m=
emory allocation failure) leads to an interrupt storm.
- [Medium] Swallowing `-EPROBE_DEFER` from `platform_get_irq_optional` perm=
anently disables async notifications on unfavorable driver probe orders.
--

commit 0300738ec4be7419d301effc706a11f0f885fbcb
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

optee: riscv: add asynchronous notifications over the signal bus

This commit adds asynchronous notification support using the RPMI TEE signal
bus. It sets up a signal bus between OP-TEE and Linux, using the platform
interrupt as the availability doorbell.

> diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_ri=
scv.c
> index 72c9eb85f4fed..b9bb813adef50 100644
> --- a/drivers/tee/optee/optee_riscv.c
> +++ b/drivers/tee/optee/optee_riscv.c
[ ... ]
> @@ -852,6 +856,242 @@ static int optee_riscv_do_call_with_arg(struct tee_=
context *ctx,
>  	return optee_riscv_yielding_call(ctx, in, rpc_arg, system_thread);
>  }
> =20
> +/*
> + * 5b. Asynchronous notification over the signal bus
[ ... ]
> +static bool optee_riscv_retrieve_signals(struct optee *optee)
> +{
> +	bool do_bottom_half =3D false;
> +	size_t max_signals =3D optee->riscv.sender_signals;
> +	struct rpmi_tee_signal_retrieve_resp *rx;
> +	struct rpmi_mbox_message msg;
> +	size_t rx_len;
> +	u32 flags;
> +
> +	rx_len =3D struct_size(rx, signal, max_signals);
> +	rx =3D kzalloc(rx_len, GFP_KERNEL);
> +	if (!rx)
> +		return false;

[Severity: High]
What happens to the level-triggered hardware interrupt if this memory
allocation fails?

If kzalloc() fails, we abort without draining the pending signals from the
firmware. However, looking at notif_irq_handler() below, it will
unconditionally return IRQ_HANDLED. Will this unmask an uncleared
level-triggered interrupt, causing an immediate interrupt storm?

> +
> +	do {
> +		u32 status, n, i;
> +
> +		rpmi_mbox_init_send_with_response(&msg,
> +						  RPMI_TEE_SRV_SIGNAL_RETRIEVE,
> +						  NULL, 0, rx, rx_len);
> +		if (optee_riscv_send(optee, &msg))
> +			break;
> +
> +		status =3D le32_to_cpu(rx->status);

[Severity: High]
Does this loop properly validate the actual payload length of the response?

Since the rx buffer is reused in this loop, if the RPMI firmware returns a
truncated or empty response, it seems we might read stale fields (like
status, signal_len, and flags) left over from the previous iteration.

Could this lead to an infinite loop if the stale flags still contain the
RPMI_TEE_SIGNAL_RETRIEVE_MORE_AVAILABLE bit?

> +		if (status =3D=3D (u32)RPMI_ERR_NO_DATA)
> +			break;
> +		if (status)
> +			break;
> +
> +		n =3D min_t(u32, le32_to_cpu(rx->signal_len), max_signals);
> +		for (i =3D 0; i < n; i++) {
> +			u32 value =3D le32_to_cpu(rx->signal[i]);
> +
> +			if (value =3D=3D OPTEE_ABI_ASYNC_NOTIF_BOTTOM_HALF)
> +				do_bottom_half =3D true;
> +			else
> +				optee_notif_send(optee, value);
> +		}
> +
> +		flags =3D le32_to_cpu(rx->flags);
> +	} while (flags & RPMI_TEE_SIGNAL_RETRIEVE_MORE_AVAILABLE);
> +
> +	kfree(rx);
> +
> +	return do_bottom_half;
> +}
> +
> +static irqreturn_t notif_irq_handler(int irq, void *dev_id)
> +{
> +	struct optee *optee =3D dev_id;
> +
> +	if (optee_riscv_retrieve_signals(optee))
> +		queue_work(optee->riscv.notif_wq, &optee->riscv.notif_work);
> +
> +	return IRQ_HANDLED;
> +}
[ ... ]
> @@ -1291,6 +1532,13 @@ static int optee_riscv_probe(struct platform_devic=
e *pdev)
>  	if (rc)
>  		goto err_close_ctx;
> =20
> +	if (sec_caps & OPTEE_ABI_SEC_CAP_ASYNC_NOTIF) {
> +		rc =3D optee_riscv_async_notif_init(pdev, optee);
> +		if (rc)
> +			dev_warn(dev, "Failed to initialize async notifications: %d\n",
> +				 rc);
> +	}

[Severity: Medium]
Is it intentional to swallow errors from optee_riscv_async_notif_init() her=
e?

If the interrupt controller driver is probed after OP-TEE,
platform_get_irq_optional() inside optee_riscv_async_notif_init() will retu=
rn
-EPROBE_DEFER.

By swallowing this error code instead of returning it to the driver core,
won't we permanently disable async notifications for this boot session on
unfavorable probe orders?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-rpmi-tee-s=
ervice-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com?part=3D4
