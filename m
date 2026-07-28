Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DDB41A515
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231736; cv=none; b=p4+m2vauyw+3TkaWEIN9Em1s/gXw9I0zy3WxY/4lmFRoBqu0JAuKh1weWcGZXAtigTv5nsrZsjQgcyounQy2qv9BZCY399LqCQnOwHUiRKW/V2RwmH3tTJ39uhMb6TY9737AHecAvc9KAKfDV2f/wT36459vV8OJo+jAH7MoqGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231736; c=relaxed/simple;
	bh=/DhLIuOMx3hPnbn1tXB+NV2NI8sz8sjUvDq5MVibKH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HWCckW7xLwT8CV3bZdGcCFE6k7hJeGnk9e8pSZqK/4IFGr6O3byEsBX52h6WRPq3tFJYNVlZfTPfJl9Uk4jcUxy0/hWvMPEK0R4eO5iJL1Q+T07vaYW+Xg04I4j5Nz/dcghtbL1mxVkeVezljNzpgaANtE3K/Ba2dScBbHcqVQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAP7yvLk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAP7yvLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406911F000E9;
	Tue, 28 Jul 2026 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231734;
	bh=CD/FEaWicfHHfsmfFw3J9T6UxaqBOIW+O6ZLhXUotrU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SAP7yvLkYV5NvU5vtXdg4fPzS9jPcXvDHXNFRcKzV64YLMNBrLavzh6gAUmx0ZERf
	 gytEhnSUnwLeUm3abfICVqta8nPaKuPQzP5QWysOPc9PiYVnajO0YrJ0JOHa+tRuPN
	 SUbfNVAs/TBNT7ANj1F4jO9DJe5txfa2eKeGhTiivVQF9Pm+6jke/MwRWO/lubyfhE
	 M/w+lHRonI88XSfWIUji3C/0/ZMExAMhkzUdHnUlxQ5dvk2VDkHhZER8BI7okvgRlM
	 n+P4AJ3BEBI08Ri7iy6sKnbnKWixEj9pr0R1T805HMrltxF/J2g2IFxc8kgT3ZfCs8
	 ak3DQpjJBTIkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] spmi: apple: use IRQ for RX FIFO if possible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260728-t603x-spmi-v2-6-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-6-f43e5f10e583@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:42:13 +0000
Message-Id: <20260728094214.406911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Data race between `reinit_completion()` and `complete()` due to un=
handled hardware timeouts, causing completion state corruption.
- [Low] The static function `apple_spmi_irq_mask_raw` is defined but never =
used, leading to `-Wunused-function` warnings.
--

--- Patch [6]: [PATCH v2 6/7] spmi: apple: use IRQ for RX FIFO if possible =
---
commit fa2cb405f77a7400cdbd89375c67fa8b1bc2c296
Author: Alba Mendez <me@alba.sh>

spmi: apple: use IRQ for RX FIFO if possible

This commit modifies the Apple SPMI driver to use an IRQ for the RX FIFO=20
when available, instead of relying on a 10ms sleep interval for polling.=20
This reduces the latency to process replies to a few microseconds.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 2cd4ed1803d40..109c5d2c735d4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -77,6 +99,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid,
> =20
>  	mutex_lock(&spmi->fifo_lock);
> =20
> +	reinit_completion(&spmi->fifo_rx);
> +

[Severity: High]
Does this completion handle late interrupts correctly if a previous command
timed out?=20

If wait_for_completion_timeout() times out in apple_spmi_wait_rx_not_empty(=
),
an interrupt could still arrive later. If a delayed interrupt fires while a
subsequent transaction is calling reinit_completion(), could the late
apple_spmi_irq_handler() call complete() and cause the new transaction to
finish prematurely with incorrect data?

>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
>  	while (i < len) {

[ ... ]

> @@ -181,10 +205,68 @@ static int spmi_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid)
>  	return -EINVAL;
>  }
> =20
> +static void apple_spmi_irq_ack_raw(struct apple_spmi *spmi, u32 irq)
> +{
> +	u32 __iomem *reg =3D spmi->regs + SPMI_IRQ_ACK_BASE + (irq / 32) * 4;
> +
> +	writel(BIT(irq % 32), reg);
> +}
> +
> +static void apple_spmi_irq_mask_raw(struct apple_spmi *spmi, u32 irq)
> +{
> +	u32 __iomem *reg =3D spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
> +
> +	writel(readl(reg) & ~BIT(irq % 32), reg);
> +}

[Severity: Low]
Is this function used anywhere in this patch? It looks like it is defined as
a static function but never called, which might trigger a compiler warning
when building with CONFIG_WERROR.

> +
> +static void apple_spmi_irq_unmask_raw(struct apple_spmi *spmi, u32 irq)
> +{
> +	u32 __iomem *reg =3D spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
> +
> +	writel(readl(reg) | BIT(irq % 32), reg);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-t603x-spmi=
-v2-0-f43e5f10e583@chaosmail.tech?part=3D6
