Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC594314B6D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232613; cv=none; b=edZTQNdrarD4wq0Cer7yHDof5xAGidguXm3NIl1oIiatfV4BwusR6pdXEylgsmQ5IUmOoyqIoOhnl7HGO1eU3mc1nisMoxbgQJ8zjm9xOEdc4TOxZtkLhHU9nYkc8OSlqY4Fux98Px/8JuP6isk0OhjqCg/6uaFxkwhVALXrlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232613; c=relaxed/simple;
	bh=lJzc+7lL1QXD1IFxjC1Z9qIdO7OSarHkIAf34fxLhXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pIfRk08Wdco99om5oIEG+7bntx7s9U5si9mZPOn84hUW+4ncvUNc2x1u4dseWHsWZ2PhXA7NpRHJPzg37Q2+W0HdOTmdaoT+7YRnTlPQ7mPvaKv2cZiCa5SPEM6Q1V0zdSgEd8NQNph5UFINW+0iBPKEZv+c8WdwdqU4ZuhzMnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bD3tmPUZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bD3tmPUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DEA1F000E9;
	Tue, 28 Jul 2026 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232612;
	bh=XBrLxPo5mtl0YKXG7o8ydDjao1N8y4QQ+AY440S6qGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bD3tmPUZ6I2z+GNZDgy55rv+D6TPrIWtOaMRpKD2xIKRZ/yKbO/Sa+8rH5PO3E8EO
	 5lTqs5CIt/1hngMNMJmFTH4tM0AkKt9SvhdN4a3dfViNL1hDrdXOQgicNRq5Exzows
	 fpiR1sAbLnoMVtXIs9QDG/NE/yEwW3+1CL1d11DDMcvhSlWj7Phhf2Bb7lHQ+nXkEf
	 Foz1MGeAqqNY/GSEWzS3dD7sLmJHZZLVFWXLfcEI+3mB0bU1j/9rjf1vYG9daKA5vX
	 W1BlYXUkYmg6fz9V+1uXw2Kol+Z4jZxy75xTm/oYatfeTJ3nPuE1M1/qayERCOCxIo
	 D+/6UrULw0qqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] mailbox: mtk-cmdq: add mt6572 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728-6572-gce-v1-3-750bba32689e@protonmail.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
 <20260728-6572-gce-v1-3-750bba32689e@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:56:50 +0000
Message-Id: <20260728095651.43DEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing `mminfra_offset` translation in `cmdq_task_handle_erro=
r()` causes the GCE hardware to jump to a garbage physical address on error=
 recovery.
- [High] Unbalanced `of_clk_get()` for multi-GCE platforms leads to a leak =
of clock references in error paths and during unbind.
- [High] Potential NULL pointer dereference in the IRQ handler due to unini=
tialized `thread->chan`.
--

--- Patch [3]: [PATCH 3/3] mailbox: mtk-cmdq: add mt6572 support ---
commit 125c66f031e1e0c9602b803f39b71e1fb66eb336
Author: Roman Vivchar <rva333@protonmail.com>

mailbox: mtk-cmdq: add mt6572 support

Add legacy_isa field forwarding to the cmdq helper and a platform data
for the mt6572 GCE.

> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index e523c84b48088..5e7bc52baaa13 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -99,6 +99,7 @@ struct gce_plat {
>  	bool control_by_sw;
>  	bool sw_ddr_en;
>  	bool gce_vm;
> +	bool legacy_isa;
>  	u32 gce_num;
>  };
> =20
> @@ -119,6 +120,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struc=
t cmdq_mbox_priv *priv)
>  	struct cmdq *cmdq =3D container_of(chan->mbox, struct cmdq, mbox);
> =20
>  	priv->shift_pa =3D cmdq->pdata->shift;
> +	priv->legacy_isa =3D cmdq->pdata->legacy_isa;
>  	priv->mminfra_offset =3D cmdq->pdata->mminfra_offset;
>  }
>  EXPORT_SYMBOL(cmdq_get_mbox_priv);
> @@ -787,6 +789,14 @@ static const struct dev_pm_ops cmdq_pm_ops =3D {
>  			   cmdq_runtime_resume, NULL)
>  };
> =20
> +static const struct gce_plat gce_plat_mt6572 =3D {
> +	.thread_nr =3D 14,
> +	.shift =3D 0,
> +	.control_by_sw =3D false,
> +	.legacy_isa =3D true,
> +	.gce_num =3D 1
> +};
> +
>  static const struct gce_plat gce_plat_mt6779 =3D {
>  	.thread_nr =3D 24,
>  	.shift =3D 3,
> @@ -848,6 +858,7 @@ static const struct gce_plat gce_plat_mt8196 =3D {
>  };
> =20
>  static const struct of_device_id cmdq_of_ids[] =3D {
> +	{.compatible =3D "mediatek,mt6572-gce", .data =3D (void *)&gce_plat_mt6=
572},
>  	{.compatible =3D "mediatek,mt6779-gce", .data =3D (void *)&gce_plat_mt6=
779},
>  	{.compatible =3D "mediatek,mt8173-gce", .data =3D (void *)&gce_plat_mt8=
173},
>  	{.compatible =3D "mediatek,mt8183-gce", .data =3D (void *)&gce_plat_mt8=
183},

[Severity: High]
This isn't a bug introduced by this patch, but there is an unbalanced
of_clk_get() for multi-GCE platforms that leads to a leak of clock referenc=
es.

When cmdq->pdata->gce_num > 1, additional clocks are fetched in
cmdq_get_clocks():

drivers/mailbox/mtk-cmdq-mailbox.c:cmdq_get_clocks() {
	...
	for_each_child_of_node_scoped(parent, node) {
		...
		clks->clk =3D of_clk_get(node, 0);
		if (IS_ERR(clks->clk))
			return dev_err_probe(dev, PTR_ERR(clks->clk),
					     "failed to get gce%d clock\n", alias_id);
	}
	...
}

Unlike the first clock which uses devm_clk_get(), of_clk_get() returns an
unmanaged clock reference. If the loop encounters an error on a subsequent
clock, does this return immediately and leak the references for the clocks
already successfully fetched?

Furthermore, during driver unbind, the driver unprepares the clocks but nev=
er
calls clk_put() to release them:

drivers/mailbox/mtk-cmdq-mailbox.c:cmdq_remove() {
	...
	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
}

Should clk_put() be called on these unmanaged clock references in error pat=
hs
and during unbind to prevent a permanent resource leak?


[Severity: High]
This is a pre-existing issue, but is there a potential NULL pointer derefer=
ence
in the IRQ handler due to an uninitialized thread->chan?

The driver unconditionally registers cmdq_irq_handler() with IRQF_SHARED
during cmdq_probe(). When an interrupt is delivered, the handler iterates o=
ver
the active threads and attempts to lock the channel:

drivers/mailbox/mtk-cmdq-mailbox.c:cmdq_irq_handler() {
	...
	for_each_clear_bit(bit, &irq_status, cmdq->pdata->thread_nr) {
		struct cmdq_thread *thread =3D &cmdq->thread[bit];

		spin_lock_irqsave(&thread->chan->lock, flags);
		cmdq_thread_irq_handler(cmdq, thread);
		spin_unlock_irqrestore(&thread->chan->lock, flags);
	}
	...
}

However, thread->chan is only initialized dynamically when a client requests
the channel via cmdq_xlate():

drivers/mailbox/mtk-cmdq-mailbox.c:cmdq_xlate() {
	...
	thread->chan =3D &mbox->chans[ind];
	...
}

If a shared interrupt line fires, or a spurious interrupt arrives, or the
bootloader left the hardware in an interrupting state before the client has
requested the mailbox, could the handler dereference a NULL thread->chan he=
re
and cause a kernel oops?


[Severity: Critical]
This isn't a bug introduced by this patch, but does cmdq_task_handle_error()
miss applying the mminfra_offset translation, potentially causing the GCE
hardware to jump to a garbage physical address on error recovery?

When an error occurs and the driver attempts to skip the failed task, it
evaluates the next task's execution address by simply right-shifting its
physical address and writes this directly to the hardware:

drivers/mailbox/mtk-cmdq-mailbox.c:cmdq_task_handle_error() {
	...
	next_task =3D list_first_entry_or_null(&thread->task_busy_list,
			struct cmdq_task, list_entry);
	if (next_task)
		writel(next_task->pa_base >> cmdq->pdata->shift,
		       thread->base + CMDQ_THR_CURR_ADDR);
	...
}

This ignores the cmdq->pdata->mminfra_offset adjustment which is required f=
or
correct conversion, as handled properly elsewhere in the driver:

drivers/mailbox/mtk-cmdq-mailbox.c:cmdq_convert_gce_addr() {
	...
	return (addr + pdata->mminfra_offset) >> pdata->shift;
}

On SoCs with a non-zero memory infrastructure offset (such as MT8196), will=
 the
hardware receive a severely truncated and incorrect address, leading to mem=
ory
corruption or a catastrophic system hang when the thread resumes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-6572-gce-v=
1-0-750bba32689e@protonmail.com?part=3D3
