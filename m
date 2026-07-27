Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E2F15E5BB
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175805; cv=none; b=FYjgqSreke6dBinBZ8ShCXGVLpziyvW3rP0vI7v4dvxvs3QngBaCAOBLMmUp8GqeRo28ok5H5yscAir1QeerRI2UBwZ4si4U5C0CYp3Aq7BmeNNcWvbW2fsoH5isdgm0RsiDEXqYJZsv9ehf38bXzv9yBrpcR4NrOWiYzT0/OtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175805; c=relaxed/simple;
	bh=KYhDW7cytOTbOYZLx/wBNR97EQhj9mpbfERcmDrSSqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y2Q+S2PSp87IQF6ScDgP3sDZoKXsflsJTfuwYGGgX0uHhfKXn/uuK1DFs33dGvzrDQcs/MeP5/nB9NFyVehylTFF11k2IN7pYedIWIl50Taig8JDYcmvGrVVZ1Cfe6zxSyYymryHrqVdPCR8rbeGSY5iGcmvAfGjhUwHF9x5CX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnaSMUrA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnaSMUrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C954E1F000E9;
	Mon, 27 Jul 2026 18:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175804;
	bh=dCXjCjDL47lHXCXkpGErvgw5LxJiDpBsOM3DVHI2rAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SnaSMUrAI46pwF7msWl+ulNQXCaI0x/7qo0N7zvalYjuV4ZbiKUey2F8+cSvV81qZ
	 tLMVp6R6lhK42qTIxWfE2fC/jp5o597OG9v2oGM55wR8AJ3bkEAomeW0iOpCfJrWGj
	 ClZ1dRzw5jY7BCDDOvZs4OXfHwuRe9GpcEU1+FyR0TxEzhG4TOKhpe80bUuEz7eOoR
	 wPWupsGO0jX+gZs0+8TjCMu2F1G+T5jhzVvKHJ517QsbBM561y0FqWFjT+6xPzjzWP
	 +RMGWcY18TlRKT7icNeshVQ8Kl8H2GPjR16FJQG2M2yNlxZsS6+Vuj2BnTZQ9baqwE
	 s4GLo2xO0Lzsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 17/35] pinctrl: airoha: add missed IRQ resource
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727174141.664933-18-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-18-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:10:03 +0000
Message-Id: <20260727181003.C954E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Edge-triggered interrupts can be permanently lost because the pare=
nt IRQ handler acknowledges (clears) the interrupt status after the device =
handler finishes execution, compounded by the static assignment of `handle_=
simple_irq`.
- [High] Level-triggered interrupts will cause an unmitigated IRQ storm bec=
ause they are unconditionally processed using `handle_simple_irq` instead o=
f `handle_level_irq`.
--

--- Patch [17]: [PATCH v8 17/35] pinctrl: airoha: add missed IRQ resource h=
elpers ---
commit d8f541ef887ee539be72e7927e8fefea2a72a17e
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add missed IRQ resource helpers

This commit hooks up .irq_request_resources by adding
GPIOCHIP_IRQ_RESOURCE_HELPERS, which allows gpiolib to properly set
GPIOD_FLAG_USED_AS_IRQ. This prevents userspace or other drivers from
reconfiguring active IRQ pins as outputs.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 6561f288dbf05..f11ec77f6e338 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2671,6 +2671,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  	.irq_mask_ack =3D airoha_irq_mask,
>  	.irq_set_type =3D airoha_irq_type,
>  	.flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
> =20
>  static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,

[Severity: High]
This is a pre-existing issue, but since we are fixing IRQ handling here, can
edge-triggered interrupts be permanently lost with the current handler setu=
p?

Looking at airoha_irq_handler(), the status bit is cleared after the handler
runs:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
    ...
    generic_handle_irq(irq_find_mapping(girq->domain, offset));
    regmap_write(pinctrl->regmap, pinctrl->gpiochip.status[i], BIT(irq));
    ...
}

Because airoha_pinctrl_add_gpiochip() statically assigns handle_simple_irq,
it lacks the .irq_ack flow control necessary for edge interrupts. If a new =
edge
interrupt occurs while generic_handle_irq() is executing, the unconditional
write-1-to-clear in regmap_write() will wipe out the new event after the
handler returns.

[Severity: High]
This is also a pre-existing issue, but does this driver risk an unmitigated=
 IRQ
storm for level-triggered interrupts?

In airoha_irq_type(), the callback records the trigger type but fails to
dynamically assign the appropriate flow handler via irq_set_handler_locked(=
).=20

Because girq->handler is statically initialized to handle_simple_irq in
airoha_pinctrl_add_gpiochip():

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
    ...
    girq->handler =3D handle_simple_irq;
    ...
}

If a peripheral uses a threaded IRQ handler for a level-triggered interrupt,
handle_simple_irq wakes the thread and returns immediately without masking =
the
interrupt line. Since the peripheral hasn't cleared the condition yet, the =
line
remains asserted, which could cause airoha_irq_handler() to fire continuous=
ly
and lock up the CPU before the thread can execute.

Should airoha_irq_type() call irq_set_handler_locked() to set handle_edge_i=
rq
or handle_level_irq based on the requested type?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D17
