Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0126541C2E2
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948406; cv=none; b=rohvJXxlRWHpMJfVouhbaTtN2sMTz4teOI11ukkXjWlrc0FHep/UUpUOZ/DzNJKXUazc42fq0si3NwTgMjZxGL/AeDJ7ut14x38WHualLOBQoE3IegYeUjUVX5XWjLNhLc5c7of4zbmk/xXZS88KQmQ4MyTV6WSCWcEzfOB1R0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948406; c=relaxed/simple;
	bh=+xxGO5oYPaJXeNDMjXfBCTHi+4QNniobaaSoCgy6huk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GhlR1s1UDm8iDAsWxvuCdD6WKUUXT/dT3LvzSPuNdQsc2NxZpVehPU+R7OYgI22WX9PAuj7sqvRLKOHoioJSBzBjiPFJGFsSze6DSg+SIms5ktyFVBWE9i3D+FONjuz+5JeeQhhF/18+KG/E1sLNle5DcDfKHUccNknU7Bt2RGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4P7dMN4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4P7dMN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CAC1F00A3A;
	Mon, 13 Jul 2026 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948404;
	bh=xKuLx5hdwNwogybYGDWzfQB8Wq9jPzMMcdqfYTlkphs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V4P7dMN4+SnP/AYl7Wg0RQ2q9//dRnVig+vkWMMrjOqi9dJRBPuIkEsOXxlelIBlw
	 kanUyjRZMzXvy56O0y+/GoZld+SD5y1/CaSfHovlhJ99uMbOL8PLmxFZap9cK7Pq0+
	 KdTcye0N9rCg9m435CwYSzXBT7BHCUjXjMhJeEnRMVlcXcNEODYBDMkK0k4rGPxF+z
	 7ydoWT+sw4+OD53Ol4ugXXoFekFOtAwOl+b5g9jRPRfGEIugPgNlTQFDAF5xNVvhJ+
	 /+kVD1KbGE2zut37wP4kUuagMYdFdUu2M4eDJCtuynLucC7huTxn4DAgNgntClI9Sb
	 HVwDtXEE0AOWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/10] drm/mediatek: mtk_dsi: Enable interrupt at
 component bind time
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260713130103.34654-5-angelogioacchino.delregno@collabora.com>
References: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
 <20260713130103.34654-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 13:13:24 +0000
Message-Id: <20260713131324.79CAC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Enabling the DSI IRQ before hardware clocks are enabled, or leavin=
g it enabled while clocks are disabled, risks bus hangs from spurious or pe=
nding interrupts.
- [High] Unprotected read-modify-write operations on `dsi->irq_data` can le=
ad to lost interrupts and spurious timeouts.
- [High] Signal interruptions during DSI transfers are incorrectly treated =
as successful completions, potentially leaking stale hardware register data.
--

--- Patch [4]: [PATCH v3 04/10] drm/mediatek: mtk_dsi: Enable interrupt at =
component bind time ---
commit 9bfbf9137c89977bfb322670b9598bed791b5832
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
drm/mediatek: mtk_dsi: Enable interrupt at component bind time

This patch changes the DSI interrupt initialization by requesting it with
IRQF_NO_AUTOEN during probe. The interrupt is then explicitly enabled
during component bind and disabled during unbind. This prevents spurious
interrupts and storms before the hardware engine is fully initialized.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index ec5b94f7fa68e..bdb9ea2e7b6f6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c

[ ... ]

> @@ -1088,7 +1089,13 @@ static int mtk_dsi_bind(struct device *dev, struct=
 device *master, void *data)
>  	if (ret)
>  		return ret;
> =20
> -	return device_reset_optional(dev);
> +	ret =3D device_reset_optional(dev);
> +	if (ret)
> +		return ret;
> +
> +	enable_irq(dsi->irq);

[Severity: High]
This is a pre-existing issue, but does enabling the IRQ here risk a bus
hang if an interrupt fires before the hardware clocks are fully enabled?

Looking at mtk_dsi_bind(), the IRQ is unmasked here, but the engine_clk
and digital_clk are not enabled until mtk_dsi_poweron() is called later.
If a spurious or pending interrupt fires during this window, the handler:

mtk_dsi_irq()
    status =3D readl(dsi->regs + DSI_INTSTA) & flag;

will access clock-gated registers, which can cause an unrecoverable system
error or bus stall on MediaTek SoCs. A similar window seems to exist in
mtk_dsi_poweroff() where clocks are disabled without masking the IRQ.

> +
> +	return 0;
>  }

[ ... ]

> @@ -1372,17 +1380,15 @@ static int mtk_dsi_probe(struct platform_device *=
pdev)
> =20
>  	platform_set_drvdata(pdev, dsi);
> =20
> +	ret =3D devm_request_irq(&pdev->dev, dsi->irq, mtk_dsi_irq,
> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), dsi);

[Severity: High]
This isn't a bug introduced by this patch, but are there data races in how
the interrupt handler updates the status flags?

The irq_data field is modified concurrently by process context and hardirq
context without locking:

Process context:
mtk_dsi_irq_data_clear()
    dsi->irq_data &=3D ~irq_bit;

Hardirq context:
mtk_dsi_irq_data_set()
    dsi->irq_data |=3D irq_bit;

If mtk_dsi_irq() fires between the non-atomic load and store in process
context, the flag set by the interrupt handler would be overwritten and los=
t,
potentially causing spurious timeouts.

[Severity: High]
This is a pre-existing issue, but does the wait condition correctly handle
signals?

When waiting for the interrupt:

mtk_dsi_host_send_cmd()
    if (!mtk_dsi_wait_for_irq_done(dsi, flag, 2000))
        return -ETIME;
    else
        return 0;

If wait_event_interruptible_timeout() in mtk_dsi_wait_for_irq_done() is
interrupted by a signal, it returns -ERESTARTSYS. Since !negative evaluates
to false (0), the error check is bypassed and it returns 0 (success). This
could cause the driver to read uninitialized RX data from DSI registers and
corrupt the communication state machine.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713130103.3465=
4-1-angelogioacchino.delregno@collabora.com?part=3D4
