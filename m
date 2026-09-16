Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9ED4EA371
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557672; cv=none; b=LXnRIuMd7NBAvDpJ6yjxoFnb1mSrNBunzZp1+jHjZBhOeQA9Hxf+GMr+AHj3yH0MLbCHCgaNhagUEwXXBScaQIXi0uSCYMS92tr+VXub8BPMYFX8kDGvR2amhNAm1FaBLJSNgjrdDk67pMKF9KpJEnTif7i3mxZ8kKlXh6kbPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557672; c=relaxed/simple;
	bh=In3bg6nD1AzYPojGJEWrF7p2DO4d8M3NC9pNpGUguQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ekAcEUC9IypX/1WhPId/XqkLduhI9RuEbbvIeaDng+L8oJlOakAGNbPYvRkIauUDfXhmQu8d26jk331r0mfrWx6XUBIGKx0jZMUJ1LHJUGczYDPB8ZkGuk2IQInlTonp/bpZLyFUTR05v56PZYBcWUeVrntBsvtK3XOfKg8a9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbGJ8Dvz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbGJ8Dvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056C71F0089D;
	Wed, 16 Sep 2026 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557643;
	bh=MuGTO7xoHRG8oa2hRVVZ6JnW5iHJxnSna20OIii0sQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JbGJ8Dvz6ETZ28IQkDw+xEDYSSEChicD4eq9if2TYDu3kpM9GtclPeRgq1kTfszzd
	 o1+VKNFizpPvWc9X+Tr87ILGr36KaS2UgVPLmlJCNCylxAGoXwVzWrEuA/q0xtWW1j
	 1uRBiwoq+OJoze9WAs02NZWH32hLy8VUQepUX2+USHk+9UYaXDhYljhVOMmB5Bwc/I
	 Y07/QOFMKz9G/ZXHugT6oJw+1d1304tbvAU0LJ9n4dABHiA1Qpis7/iF6qfbPrUc81
	 kVN8Xp03oyuUfcZTydnRHG6fqwqQbGMJBUs54IQ87PD59FcXPFlSH9d0RHa1BBgiHv
	 kPn8g1u6Ew4Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/13] drm/mediatek: mtk_dsi: Enable interrupt at
 component bind time
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260916110825.102631-6-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
 <20260916110825.102631-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:20:42 +0000
Message-Id: <20260916112043.056C71F0089D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/mediatek: mtk_dsi: IRQ enablement in bind leaves hardware uncl=
ocked
--

commit 341145986d590feda3b9b8dd572d45aaa3bc1404
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Enable interrupt at component bind time

This patch changes the DSI interrupt to be requested with IRQF_NO_AUTOEN
during probe, deferring its enablement to the component bind phase.
It aims to prevent interrupt storms or premature hardware resets before
the display controller is fully bound and ready.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 28ba532210ff5..6ac6daa61e684 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -1101,6 +1102,8 @@ static int mtk_dsi_bind(struct device *dev, struct =
device *master, void *data)
>  		return ret;
>  	}
> =20
> +	enable_irq(dsi->irq);

[Severity: High]
Does enabling the IRQ here leave the hardware vulnerable to unclocked MMIO
reads if an interrupt fires before power-on?

The hardware clocks (engine_clk, digital_clk) are not enabled until
mtk_dsi_poweron() is called. If an interrupt fires immediately after this
enable_irq() call, or during any power-off state where mtk_dsi_poweroff() h=
as
been called (since disable_irq() is only in mtk_dsi_unbind()), the interrupt
handler mtk_dsi_irq() will execute:

mtk_dsi_irq() {
    ...
    status =3D readl(dsi->regs + DSI_INTSTA) & flag;
    ...
}

On MediaTek SoCs, reading unclocked APB/AHB registers like DSI_INTSTA can
cause a bus hang resulting in a synchronous external abort (kernel panic).

Could this happen consistently if the bootloader asserts the interrupt, or
randomly during suspend/DPMS off if a spurious interrupt occurs?

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916110825.1026=
31-1-angelogioacchino.delregno@collabora.com?part=3D5
