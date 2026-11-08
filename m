Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115091;
	b=aucZsdzkHFLwBhGYk2V4SF1dxVhuXxwjgC3z01hX9LPiCNWWwE20lLZeS9R36+exTFz/
	 eNi/0YGPgndeV7mvNJi0UU1i4bMotY31DOCJ3D5+RecWy4EXgY9EiiU6iM8gFdPZgXxhv
	 M9PRVI2EXAFC5tjq2LnYD7xY/LBNfi+9npiMwGgdB3WOg9F7TZkqMPztXL67nR9sfgX5G
	 40AGbCkae5gZ1z9/CyjjTkwsiHn3SXiCm3OR/xVEbPe7QGnA5sj+pL1DmeDeyeh3Rz27M
	 PvI1FIbDj4yTOc+M42Ix0WPXoG+yMtH5NZqA/v9rH3/6KYevRXoqMHkcy9p+Qx1l7wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115091;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m4/rzDwAhDjXEPcp7r5xuRgsZoaP7g3yFm4udny9h5A=;
	b=D2DdtMyRU4Ma7K7bhiiVLHOhwZ9jfyQw8l8f4GPQS20YjST3viRIQ1Ot+fxnAUPy9p/t
	 9QlCa4BS7KjaaPAMn3tia9VmtVlJJ5Hev3vyWA77QXyPo6D1i8zPMYXRD45omjCLf7ytg
	 hSogcysYFrRYeDbhGn1aYB/JZwg/hBD7shvc/kMqBbUOds8sym2qpSZ0etkA9uSbX7oqH
	 t1LpSxC8kT0Za6vK26zb4B8/Kkh+3wLEmNWrb3uvuM8Bn+08Hpqr1V0oQe4ez5wf6S42t
	 DDVzPHTOKGva5fDeFaPGkZ2wE+fzuHcJHcER0QZRB9tDd461aLPH7PAEYnkx4XSDWuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ten+UulA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10E606A31A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 05:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ten+UulA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6A21F0089F;
	Sun,  8 Nov 2026 05:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794115090;
	bh=m4/rzDwAhDjXEPcp7r5xuRgsZoaP7g3yFm4udny9h5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ten+UulA3U0wZzXZfcsGRSAMyfjavgwnLGA0vgYNM2jdbm+PHki9XirEsc6lrLadV
	 igpzDy+iiYrkbsGa5rHKytU4T08e3UsHDurTpUMsQTeRa+LZjza+I9WAdlG5hNZvq5
	 BMrKUR/7nZZt62cTFD+zNQsBSgTN5xiw99GTkNETraY9sHaQmQ9d6NfmTetXPIy425
	 jTXK0sTT5abTRINd/1HjQZFPnKByENGJTjMy+ZmZ+U5Kdim0voOyDe9CE/zs4yqiGV
	 lvt48IbGiq6h1Ef8bQkHNVr9Rho6ySkxxpRCw8Vxr6CzSAPDIKOAVX3eWlqnm9xE4V
	 r7jzbaHkWOrQg==
Message-ID: <sashiko-outbox-203576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107-t603x-spmi-v11-6-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
 <20261107-t603x-spmi-v11-6-322490215f58@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 05:18:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] spmi: apple: dispose of IRQ mappings before domain removal on
  teardown
- [Medium] spmi: apple: race between spmi_raw_cmd() recovery and
  apple_spmi_irq_handler()
--

commit 6198d2cd56367a5447522a621c1df79777ba3ad6
Author: Alba Mendez <me@alba.sh>

spmi: apple: Add interrupt functionality

This commit adds an IRQ domain for SPMI peripheral interrupts and uses the
controller's RX FIFO notification IRQ instead of polling when an interrupt
is available.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index fabccd25aa0da..2390174452ab4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -84,8 +165,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid, u16 param,
> =20
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
>  		spmi->prev_fail =3D false;
>  	}
> +	reinit_completion(&spmi->fifo_rx);
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: Medium]
Can a late SPMI_IRQ_NOTIFY interrupt from a timed-out transaction race with
this recovery path and complete spmi->fifo_rx prematurely?

SPMI_IRQ_NOTIFY remains unmasked when wait_for_completion_timeout() times
out in apple_spmi_wait_rx_not_empty() and sets spmi->prev_fail.  When the
next command enters spmi_raw_cmd():

CPU0                              CPU1 (<hardirq>)
spmi_raw_cmd()
  if (spmi->prev_fail)
    writel(SPMI_ACT_FIFO_FLUSH, ...)
                                  apple_spmi_irq_handler()
                                    val =3D readl(... + SPMI_IRQ_ACK_BASE +=
 ...)
    apple_spmi_irq_ack_raw(...)
  reinit_completion(&spmi->fifo_rx)
                                    complete(&spmi->fifo_rx)
  writel(spmi_cmd, ...)
  apple_spmi_wait_rx_not_empty()
    wait_for_completion_timeout() <-- returns immediately

The new command then wakes before its reply arrives, sees SPMI_RX_FIFO_EMPTY
(or reads a stale reply if the hardware answered just after the flush), and
fails with -EIO.

[ ... ]

> +static void apple_spmi_teardown_irq(void *data)
> +{
> +	struct apple_spmi *spmi =3D data;
> +
> +	for (size_t offset =3D 0; offset < SPMI_NUM_IRQS / 8; offset +=3D 4)
> +		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
> +
> +	synchronize_irq(spmi->irq);
> +	irq_set_chained_handler_and_data(spmi->irq, NULL, NULL);
> +}
> +
> +static int apple_spmi_init_irq(struct platform_device *pdev,
> +			       struct apple_spmi *spmi, int irq)
> +{
> +	int ret;
> +	struct irq_domain_info info =3D {
> +		.fwnode		=3D pdev->dev.fwnode,
> +		.hwirq_max	=3D ~0U,
> +		.ops		=3D &apple_spmi_irq_domain_ops,
> +		.host_data	=3D spmi,
> +	};
> +
> +	raw_spin_lock_init(&spmi->irq_mask_lock);
> +
> +	for (size_t offset =3D 0; offset < SPMI_NUM_IRQS / 8; offset +=3D 4) {
> +		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
> +		writel(U32_MAX, spmi->regs + SPMI_IRQ_ACK_BASE + offset);
> +	}
> +
> +	spmi->irqd =3D devm_irq_domain_instantiate(&pdev->dev, &info);
> +	if (IS_ERR(spmi->irqd))
> +		return PTR_ERR(spmi->irqd);
> +
> +	ret =3D devm_add_action(&pdev->dev, apple_spmi_teardown_irq, spmi);

[Severity: Medium]
Does apple_spmi_teardown_irq() leave mapped peripheral IRQs in spmi->irqd
when the controller is unbound?

Unregistering child SPMI devices frees their irqactions, but does not call
irq_dispose_mapping().  When devm_irq_domain_remove() runs right after
apple_spmi_teardown_irq(), spmi->irqd->revmap_tree still holds any mapped
hwirqs, which triggers WARN_ON(!radix_tree_empty(&domain->revmap_tree)) in
irq_domain_remove(), leaks the allocated virq descriptors, and leaves their
irq_data pointing to the freed spmi->irqd and spmi structures.

Disposing of existing mappings with irq_dispose_mapping(irq_find_mapping())
across 0..SPMI_NUM_PERIPHERAL_IRQS - 1 in apple_spmi_teardown_irq() (and
setting info.size and info.hwirq_max to SPMI_NUM_PERIPHERAL_IRQS) would
avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-t603x-spmi=
-v11-0-322490215f58@chaosmail.tech?part=3D6
