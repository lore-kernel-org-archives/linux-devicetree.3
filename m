Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9C409298
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925348; cv=none; b=nIGyXG//N+f4wiePRvoBI5UhR8OQ++n8dcadDX2xmI8eb5mp1pvWPQburEg/QKmgLKHsCu3hHPHd87rfI1Ci9n6EoAIIygoQ8RnhfmuEjD8x2vJkMwMVJSCyoLVe6UClq0yaqiUGL/+a5/rMgADmjxY4vxhlwG/n4VNTax4W/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925348; c=relaxed/simple;
	bh=MWqCPtvfB+LdCtKPtplNPjmVs147OA1w3ZqGh98Kq90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g1ov9BnVIQMSo3G0KPFid+iWGYX7hnpUfXhc6ZyNtK6QMM1d57RsevV4+xrjES0dEknqe5gGRsOg0xr+bkiFXbShCXTROIdh6BcZZrIDA6vCfxdNx30f/07I+p6o7WxfsQB+73PamhXAtsujeHJDhql1hXAZQUp5srpjGRU89tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxNLdbYF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxNLdbYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4040D1F000E9;
	Wed,  5 Aug 2026 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925346;
	bh=SEWc+PzvEfseWHvuCsOchbtx5qkBZjoaE9DVAgyfxYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KxNLdbYFY4xqbF0xICfZIhFtp7GQao7TJm8ADLOrhQ/QNgLYB1oai/a8UDlVba5yO
	 f3blgj5Qd+ee7ahFnVoSKYHU6dIjcJ15ZZT8RnKZhX+2Fm0iSJuD/CxueDjn8vX2in
	 1pVZEr/L50CrPtr0VeygRYogjMJHA8i3zcWjGOq09BbW7KktCZDtA4uLJEzLfVFYnl
	 KeB4R6R6nugGs/jwVZTvrybWqUREINZx1AupVtRQarRZ0ntyKWCJAaUXUOOjaY2soP
	 iOwNHg0Y41zy88ABYVEQJzZ9v62gjZH5wfHl2JzeAiu3zaHMrCfMYNv+6sh6LN9qfa
	 Yk7A2gjtD4pTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805-t603x-spmi-v4-6-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-6-c15a12d9a7d1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:22:25 +0000
Message-Id: <20260805102226.4040D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing hardware mask and synchronization in the driver unbind pat=
h causes an interrupt storm and Use-After-Free.
- [High] A time-of-check to time-of-use (TOCTOU) race condition exists betw=
een the timeout error recovery path and the interrupt handler, causing spur=
ious failures.

Pre-existing issues:
- [High] The error recovery logic writes the flush command to the wrong har=
dware register, rendering the FIFO flush ineffective.
--

--- Patch [6]: [PATCH v4 6/6] spmi: apple: Add interrupt functionality ---
commit e606557ef28a4c4b211e2c324dc5cf458fc57741
Author: Alba Mendez <me@alba.sh>

spmi: apple: Add interrupt functionality

Add support for interrupts sent by slave devices and use IRQ for
RX FIFO if possible, as that IRQ fires as soon as the reply is
available, which is usually takes a few us instead of the 10ms sleep
interval for polling

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index c3bc1f6d57417..7e86d7983fb48 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -85,8 +166,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
> =20
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);

[Severity: High]
This is a pre-existing issue, but is this writing the flush command to the
wrong hardware register?=20

The code writes SPMI_ACT_FIFO_FLUSH to SPMI_RSP_REG instead of SPMI_ACT_REG.
If a command times out, wouldn't this fail to flush the RX FIFO and cause
subsequent commands to incorrectly read the delayed response?

> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
>  		spmi->prev_fail =3D false;
>  	}
> +	reinit_completion(&spmi->fifo_rx);

[Severity: High]
Is there a race condition here between the timeout error recovery path and
the interrupt handler?=20

If a delayed response arrives just as we call reinit_completion() for the
next command:

apple_spmi_irq_handler() {
    ...
    if (val & BIT(SPMI_IRQ_NOTIFY % 32)) {
        apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
        complete(&spmi->fifo_rx);
    ...
}

Could the interrupt handler call complete() concurrently, causing the new
command to be falsely signaled as complete and potentially reading corrupted
data from the previous timed-out command?

> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[ ... ]

> @@ -188,6 +271,164 @@ static int spmi_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid)

[ ... ]

> +static void remove_chained_handler(void *data)
> +{
> +	unsigned int irq =3D (unsigned int)(uintptr_t)data;
> +
> +	irq_set_chained_handler_and_data(irq, NULL, NULL);

[Severity: High]
Does this unbind path need to mask the hardware interrupt and synchronize
with in-flight handlers?=20

When the driver is unbound, clearing the handler without masking
SPMI_IRQ_NOTIFY in the hardware or calling synchronize_irq() could leave
the interrupt firing concurrently.=20

Could this cause an interrupt storm or a use-after-free when the handler
accesses unmapped device memory?

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-t603x-spmi=
-v4-0-c15a12d9a7d1@chaosmail.tech?part=3D6
