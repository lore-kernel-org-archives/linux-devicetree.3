Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A68B377AAA
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861165; cv=none; b=UQ+iqwEO9drK/h/v4xabOhRIytBHmxPJJxdA/VX70xcvM5iUL7v5eQBKiOuXvXuaGmwN0b5Mbsb8NdqlcGQ4SyFu2p9lHQ6AavjvmW3RhnhgrIWwMzO9O2Mxd2Rs/5nGSjoZawfiU3skF5QMO2Xv7p1yd7Wvw6Cw/eZBq/PZLpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861165; c=relaxed/simple;
	bh=HTqsmqwl1Vj1Wvam5cc34RZ9yysF+txLCfg4IDk4PRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nQKikmhvyrAHi7zsmzMtJCFcBN3l2xxKK2G3TvPN3D1mQSUvsm9B0TbHMu3fG1vYTSnddPwdwckAY6Tb28Ovsv9tfNuoNOCY/kdxJ3SH+kZTAggKiinxP/j+v/d9IPgBtxbcfQByHMZzTqKY42n4BWhaGuR1X8qDvubhxUuZZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpQUBtFe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpQUBtFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805E41F000E9;
	Tue,  4 Aug 2026 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861163;
	bh=MacA77bae37BzsS3Nu8k2h+nzKoRzs4J0KWNvdIQxoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HpQUBtFe8y5QTt7Rop2chEEhk2RbvmIzVs/SOSZzeAEKoK2HMeY97A3Ki8Jp4WmUv
	 PPlKXIxcbN7j5HRFTThc7Xk0i2Qc85+T8qv3jcVljhPWhyqm7RLGe9phyHe9ZKPBJj
	 FvrcTB7U75b6DF//XWeP0H3za4N3UZNWr0zmIBeLjB2VRig7F+yh+jWXCenVYoBeAT
	 oqLMBo6wyBmA1WZtVgWNH165tGIbn6ThuRwks3iYu+hutn+BeW0cldrTNrM67r2srV
	 TnGB3geDboz2OMRjKzQXFdB5VtpgY5vts3Kpr2vv1wxX3cDGS8C2gGza6aREKR0Jwq
	 +MdcA6Kfur1fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 19/36] pinctrl: airoha: fix IRQ mask/unmask code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804160419.3592327-20-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-20-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:32:43 +0000
Message-Id: <20260804163243.805E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] gpiochip_disable_irq() and gpiochip_enable_irq() are incorrectly p=
laced in .irq_mask and .irq_unmask, removing output protection during level=
-triggered IRQ handling.

Pre-existing issues:
- [High] The driver unconditionally uses handle_simple_irq for all interrup=
t types, leading to hard-IRQ storms for level-triggered interrupts.
- [High] Edge-triggered interrupts can be lost because the hardware status =
register is cleared after executing the child ISR.
- [High] regmap_update_bits/clear_bits is called within raw spinlock contex=
t without a raw spinlock-enabled regmap.
- [High] Use-After-Free and NULL pointer dereference of irqdomain due to in=
correct devm registration order.
--

--- Patch [19]: [PATCH v9 19/36] pinctrl: airoha: fix IRQ mask/unmask code =
---
commit a13f62731221613018aaaa7a5f563131118288c9
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: pinctrl: airoha: fix IRQ mask/unmask code

This commit adds gpiochip_enable_irq() and gpiochip_disable_irq() calls
to airoha_irq_unmask() and airoha_irq_mask() respectively. This ensures
gpiolib tracks the interrupt enabled state and prevents
gpiod_direction_output() from mistakenly assuming the pin is not actively
used as an interrupt.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 261180b656392..42ae588e6343b 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -2629,6 +2630,7 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);

[Severity: High]
This is a pre-existing issue, but does using regmap_clear_bits() here cause
lock nesting violations on real-time systems?=20

The interrupt core calls airoha_irq_mask() with a raw spinlock held. Becaus=
e=20
pinctrl->regmap is a syscon regmap, it does not use raw spinlocks by defaul=
t.
This means it becomes a sleeping lock on real-time kernels.

Acquiring a sleeping lock while holding a raw spinlock can lead to a panic.

> +	gpiochip_disable_irq(gc, irqd_to_hwirq(data));

[Severity: High]
Does calling gpiochip_disable_irq() here remove output protection during
level-triggered interrupt handling?

When the irq core handles level-triggered interrupts, it temporarily masks
the interrupt by calling airoha_irq_mask() during handler execution. Since
gpiochip_disable_irq() is placed here, the GPIOD_FLAG_IRQ_IS_ENABLED bit is
cleared.

This would allow a concurrent call to gpiod_direction_output() to succeed
and mistakenly reconfigure the active interrupt pin as an output. Should
these calls be placed in dedicated .irq_enable and .irq_disable callbacks
instead?

>  }
> =20
>  static int airoha_irq_type(struct irq_data *data, unsigned int type)

[Severity: High]
This is a pre-existing issue, but does the driver fail to handle
level-triggered interrupts properly?

In airoha_pinctrl_add_gpiochip(), the handler is set to handle_simple_irq:

    girq->handler =3D handle_simple_irq;

However, airoha_irq_type() doesn't call irq_set_handler_locked() to upgrade
the handler to handle_level_irq for level triggers. Since handle_simple_irq
does not mask the interrupt before executing a threaded handler, will the
unhandled hardware interrupt loop infinitely and cause an interrupt storm?

[Severity: High]
This is a pre-existing issue, but can edge-triggered interrupts be lost due
to the status clearing order?

In airoha_irq_handler(), the code clears the hardware status register after
executing the child interrupt handler:

    generic_handle_irq(irq_find_mapping(girq->domain, offset));
    regmap_write(pinctrl->regmap, pinctrl->gpiochip.status[i], BIT(irq));

If a new edge interrupt occurs for the same pin while the child handler is
running, the hardware latches the new edge. Will the subsequent
write-1-to-clear operation unconditionally clear the status bit and erase t=
he
newly latched edge without it being processed?

[Severity: High]
This is a pre-existing issue, but is there a risk of a use-after-free or
null pointer dereference during teardown or early probe?

In airoha_pinctrl_add_gpiochip(), the shared interrupt is requested before
the gpiochip is added:

    err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
                           dev_name(dev), pinctrl);

During driver removal, devm_gpiochip_add_data() unwinds first and destroys
the irq domain. The shared interrupt remains active until
devm_request_irq() unwinds.

If an interrupt fires during this window, airoha_irq_handler() will
dereference the freed girq->domain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D19
