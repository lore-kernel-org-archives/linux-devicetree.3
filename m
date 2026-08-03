Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA47239E7E
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764272; cv=none; b=NLYsvkbQt40GAUMv8+hFGGdg5F1xQtXWKcM/v6UKT5t3yKiQKIUmsJzaDE16nyDawLzKWWWHbhc9pls3jXQ9AYNWcfzuc0Tu3er6S+cohHvOrN2lV8Fc28fuvX+DcGSRVsZ97EyumJwcbwy+SAZ2TmnM+QJDoB1QqkG3qCMx75A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764272; c=relaxed/simple;
	bh=xFCtp7XnC8XybZKVwVcLqLVytpIor/aRgRziwjYQTOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HBvHWQH4NeLCmzh/4Wsy6sdZF2fI/s36iS6ytOJD+66/2UMbgxZw2EGa10Qck6vFX5M66f5XA5YSeAZZcb14+u5oXcaSxfaMzWS0z28+mP7OMHB0A7BQjQTRs5ARZaezmEO8T1JUSm5PFyXxur7Awc7gr7pVsiJy5lwoLYT9QQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQma9ziz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQma9ziz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787D11F000E9;
	Mon,  3 Aug 2026 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764270;
	bh=cPA7x7s34X2RjiFqx7aqHH4GhFJ/Ay9LrKweuk2Xqtc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DQma9zizUHlRZzpk7oOXIIgGsH7lhpQe4Mv5df2XnBEhnSMA7I4XlPP2bYHIxuiEU
	 AIusRo6zaiwYiWvCaB6p17DyUiIXn7Ie9KhAA5ckst2QB9bnNHlIA8R90orGqVvXcX
	 4m2pjC8zODqaPPZruUje2l24oMr0G3XirU4Gpvl25mv1rC+IOm2ldNZQO7Uukm0ohn
	 plz0JOT8026pXxTUhmH579KzVjk6wwZDiAUj82EeqvfNWiFTEHreQR2xzj2mlpopjB
	 dVr8Mol4PuVUrtoY4AG22obb7t4Glca9JqdEjHdidHkYonYvBiUu+AXtL50RdNKsPK
	 o1nal36sa/6dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-t603x-spmi-v3-6-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
 <20260803-t603x-spmi-v3-6-c17b506d91a1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:37:49 +0000
Message-Id: <20260803133750.787D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] 64-bit MMIO access (`readq`) on 32-bit registers causes SError=
 on Apple Silicon.
- [High] Use-After-Free on probe error path due to un-cleaned chained IRQ h=
andler.
- [High] Level-triggered interrupt not masked in handler causes interrupt s=
torm.
- [High] Command timeouts race with `reinit_completion`, causing state corr=
uption.
- [Medium] Unconditional deregistration of potentially negative IRQ in `app=
le_spmi_remove()`.

Pre-existing issues:
- [Critical] Buffer overflow in `spmi_raw_cmd` due to integer underflow.
--

--- Patch [6]: [PATCH v3 6/6] spmi: apple: Add interrupt functionality ---
commit 36738a2961c152dbbdb4e4ffe86859f785d88e60
Author: Alba Mendez <me@alba.sh>

spmi: apple: Add interrupt functionality
   =20
Add support for interrupts sent by slave devices and use IRQ for
RX FIFO if possible, as that IRQ fires as soon as the reply is
available, which is usually takes a few us instead of the 10ms sleep
interval for polling

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 74d4b5d98b113..340d28126b3d4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -91,6 +122,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
> =20
>  	guard(mutex)(&spmi->fifo_lock);
> =20
> +	reinit_completion(&spmi->fifo_rx);

[Severity: High]
Can this reinit_completion() race with a late hardware interrupt?

If a previous command timed out and left the RX FIFO un-flushed, could a la=
te
reply trigger complete() concurrently with this reinit_completion(), allowi=
ng
the new command to bypass the wait and read stale data?

[Severity: Critical]
This isn't a bug introduced by this patch, but is there a potential buffer
overflow in spmi_raw_cmd() when calculating the reply length?

While reading the data reply:

	while (len_read < ilen) {
		...
		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
		i =3D min_t(size_t, sizeof(spmi_cmd), len_read - ilen);
		memcpy(ibuf + len_read, &rsp, i);
		len_read +=3D i;
	}

If a caller requests a small read where ilen is less than 4, the condition
len_read < ilen ensures len_read - ilen is negative. Will this underflow to=
 a
massive positive value when cast to size_t by min_t(), causing it to select
sizeof(spmi_cmd) and overwrite the buffer bounds?

> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[ ... ]

> +static void apple_spmi_irq_handler(struct irq_desc *desc)
> +{
> +	struct apple_spmi *spmi =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	bool handled =3D false;
> +	unsigned long val, offset, bit;
> +
> +	chained_irq_enter(chip, desc);
> +	val =3D readl(spmi->regs + SPMI_IRQ_ACK_BASE + (SPMI_IRQ_FIFO_RX / 32) =
* 4);
> +	if (val & BIT(SPMI_IRQ_FIFO_RX % 32)) {
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_FIFO_RX);
> +		complete(&spmi->fifo_rx);
> +		handled =3D true;
> +	}

[Severity: High]
Does this leave the level-triggered interrupt unmasked?=20

If the RX FIFO isn't drained immediately before returning, could the persis=
tent
hardware level condition re-assert the interrupt right after exiting the=20
handler, creating an interrupt storm that starves the thread trying to drain
the FIFO?

> +
> +	for (offset =3D 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset +=3D s=
izeof(val)) {
> +		val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);

[Severity: Critical]
Will using readq() on a 32-bit initialized MMIO region cause a synchronous
external abort (SError) on Apple Silicon?=20

Since these registers are expected to be 32-bit regions, does a 64-bit acce=
ss
trigger a hardware trap?

[ ... ]

> @@ -209,6 +441,15 @@ static int apple_spmi_probe(struct platform_device *=
pdev)
>  	ctrl->write_cmd =3D spmi_write_cmd;
>  	ctrl->cmd =3D spmi_cmd;
> =20
> +	spmi->irq =3D platform_get_irq_optional(pdev, 0);
> +	if (spmi->irq < 0 && spmi->irq !=3D -ENXIO)
> +		return spmi->irq;
> +	if (spmi->irq >=3D 0) {
> +		ret =3D apple_spmi_init_irq(pdev, spmi, spmi->irq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D devm_spmi_controller_add(&pdev->dev, ctrl);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret,

[Severity: High]
If devm_spmi_controller_add() fails, will this leak the chained handler
registered inside apple_spmi_init_irq()?=20

Since irq_set_chained_handler_and_data() is used without a devres cleanup=20
action, could a subsequent interrupt dereference the freed spmi structure=20
on this error path?

[ ... ]

> +static void apple_spmi_remove(struct platform_device *pdev)
> +{
> +	struct apple_spmi *spmi =3D platform_get_drvdata(pdev);
> +
> +	irq_set_chained_handler_and_data(spmi->irq, NULL, NULL);
> +}

[Severity: Medium]
Can spmi->irq be negative here?=20

If platform_get_irq_optional() returned -ENXIO during probe, wouldn't we be
passing a negative value (which becomes a very large unsigned integer) to
irq_set_chained_handler_and_data() on removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-t603x-spmi=
-v3-0-c17b506d91a1@chaosmail.tech?part=3D6
