Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2D21767D
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988027; cv=none; b=PhLdHZ8sMxOy43G9O2/yK/a6WFaHWifjW77C9ismwVAGT1LTz5+Yt0FIu7tuT5uFFJ5tvB2hOSuQHfB20R7r4f2N4dmV1g0IpUnpaYQLrAs9xYfZ8ySvSJgwyr1z6CwQOmIVtFaXccBhChNZVXo8XD529VHibWR6itjK0s64BJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988027; c=relaxed/simple;
	bh=TsNl2dOantfs8vDEfjVn/7lLHmRELTXS6P6iW6mIkLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SwOlsbKLGNHrAJ138HZHaPkaCyGPUHjemGoo/uiU2GRsX1NMskABrGwfzV9yIAUn1sLvYoLBC239piDUEnDu8i6KdWUErkzQF2qCjJHkmqdedEHYkPKQi2LSpn4U7yHVKoc+gKh9MeGoMBolOCUePPhaKr0FnZTp6IGmaMqT45w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hklFdEBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hklFdEBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F5C1F00A3A;
	Sat, 25 Jul 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988026;
	bh=hAdoTP1bdCuavVWij0ykeIRXBF1MC7EFwQP/PCSAX1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hklFdEBPY4H/nj+nK3Av/WHkxRWDWtzhxA4nwTFUvf8BbxHhQadWWFZPEw2jQ8TBF
	 zksVTb/plF3dqrCaVqNy8DmLgnXgnwWS8AFUc/IjfjW+JQN3E3U2bUKi5CQs7JnhZo
	 QOS+NxvY+dc4BsE51P4Cfdz4d5c4YApZftY7259PZT+ZcWOeMPWYb198Fil6LONose
	 rgIDR1E34GSWcgEnqm/rJEKo1Y6pg/oGDPc8WDO9MYoocqipg4xgE/aJnwewqxIW8K
	 RbGooDrSOOjisRBnMbIdy0xiCrxPQwqz1uLFgLfjpki6E2TvWRqcWezR0L1SAYBmGV
	 dRJkISXETsOow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] spmi: apple: use IRQ for RX FIFO if possible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 14:00:25 +0000
Message-Id: <20260725140026.44F5C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Data race between lockless reinit_completion() and concurrent comp=
lete() from late interrupts.
- [High] Race condition in interrupt handler due to calling complete() befo=
re acknowledging the hardware interrupt.
- [Low] Unused variables `offset` and `bit` in `apple_spmi_irq_handler`.
--

--- Patch [6]: [PATCH 6/7] spmi: apple: use IRQ for RX FIFO if possible ---
commit 42f2435868ad30ce7de25280762bfba2c6169e13
Author: Alba Mendez <me@alba.sh>

spmi: apple: use IRQ for RX FIFO if possible

The IRQ fires as soon as the reply is available, which is usually takes
a few us instead of the 10ms sleep interval for polling

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index d8509f027df69..d627187b3ac00 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -79,6 +101,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  	if (ret)
>  		return ret;
> =20
> +	reinit_completion(&spmi->fifo_rx);
> +

[Severity: High]
Does this code risk a data race if a previous SPMI command timed out?

If a prior command times out, it returns without masking the interrupt or
flushing the hardware. When a subsequent command acquires fifo_lock and
calls reinit_completion(), a delayed interrupt from the previous command
might concurrently execute complete().

Since reinit_completion() modifies the completion state locklessly without
taking the waitqueue lock, this race could corrupt the completion structure
or cause premature returns.

>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
>  	while (i < len) {
[ ... ]
> @@ -183,10 +207,68 @@ static int spmi_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid)
[ ... ]
> +static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
> +{
> +	struct apple_spmi *spmi =3D dev_id;
> +	bool handled =3D false;
> +	u32 val, offset, bit;
               ^^^^^^^^^^^

[Severity: Low]
Are offset and bit intended to be used here?

They appear to be declared but never used in the function body, which might
cause unused variable compiler warnings.

> +
> +	val =3D readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
> +	if (val & BIT(SPMI_IRQ_FIFO_RX)) {
> +		complete(&spmi->fifo_rx);
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_USER_SIZE * 8 + SPMI_IRQ_FIFO_RX=
);

[Severity: High]
Could acknowledging the hardware interrupt after calling complete() cause
subsequent interrupts to be dropped?

The complete() call wakes up the waiting thread, which can immediately issue
a new SPMI command. If the hardware completes this new command and re-asser=
ts
the IRQ before the handler executes apple_spmi_irq_ack_raw(), the ack
operation might clear the new interrupt assertion.

The second command would then time out indefinitely. Should the interrupt
be acknowledged before calling complete()?

> +		handled =3D true;
> +	}
> +
> +	return handled ? IRQ_HANDLED : IRQ_NONE;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-t603x-spmi=
-v1-0-e1a29fcd2d38@chaosmail.tech?part=3D6
