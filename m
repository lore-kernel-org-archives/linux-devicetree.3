Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697B446EC6E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387868; cv=none; b=ZBYuGciAkh8t9IA2Y0V/J+qxJByyv1nVHy5LbpV4ZRaNpkynkVhafd3NJbkdDgFqjQ6Ih6DFpy33IBGWbTcosnbn8n6+TvZ5simk7bvFX1UuTwRW1rh6ncSKRqMFc241s/WYuPeqeuQ+Q4VgsZI97jq32xJfzbuJ7WCJDDM0mWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387868; c=relaxed/simple;
	bh=GAjIzxxh1WVvTV7o17zQrPCuJRrflA6FNh3mZT0Ceuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iRC6FNL8o3DPPNj24nlaW/tZYWWnmajX8qCKpMZ4H3/BNSFllSYkGZ0NBE92GC0dbu3yfeDLF6fM9QF1BuYrDwVeg/0xlzu4+JxWfA7aUxQlfAZXNrHr/v2EWWZO16QQAWkzkSnjf2geLxvCnbDSAnM2/vRqPCIkgwhynUeVCyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjOk9pzn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjOk9pzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BF21F00893;
	Mon, 14 Sep 2026 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387865;
	bh=g9boCQT3MsnPj/NEGZBxC5NyaRFO13IZCgLb6bhn340=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hjOk9pznvQyoU6RisAITbSUay7Ypjxvp/gtuodZELKksA4XOvznKTVHKl1de34EKZ
	 /fx3H487xUy3REuLSpZ3kDLqEIg75fLv5AM3uodkjb8XbvH2LUBK6XGr0Ukjt+Q2Xi
	 4ihxa9J+4N6ouTMMtXNuRJ8y+r8dZZAD/cPpkOr9VvTAn/CPgbxpECYuaoN/BoZAQc
	 VWl9+pcBtQN5GY3HHNaEAIqCNkk0wd54O/lMFe1B+ORKYtnJYkqUmu+tsgAB8RFmQP
	 KpvYK/LVFdAr2nsvhZ+nIqf9Emif/zEUJM007liza0WwJLLMVk529NyJKpCwWoD/TW
	 HiWnrrR+KUXIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/13] drm/mediatek: mtk_dsi: Enable interrupt at
 component bind time
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914115812.22751-6-angelogioacchino.delregno@collabora.com>
References: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
 <20260914115812.22751-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 12:11:05 +0000
Message-Id: <20260914121105.96BF21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DSI interrupt is enabled before hardware clocks are turned on,=
 leaving the system vulnerable to a kernel panic or interrupt storm from un=
clocked register access.
--

commit c2f480f41de24a194e9b0ecae5811e54e2bf871e
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Enable interrupt at component bind time

This commit requests the DSI interrupt with IRQF_NO_AUTOEN to prevent it
from firing prematurely during probe. It explicitly enables the interrupt
during component bind and disables it during unbind instead.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 0b167b4411e59..ef1638e77f00e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -1101,6 +1102,8 @@ static int mtk_dsi_bind(struct device *dev, struct =
device *master, void *data)
>  		return ret;
>  	}
> =20
> +	enable_irq(dsi->irq);
> +

[Severity: High]
This isn't a bug introduced by this patch, but does this leave the system
vulnerable to a kernel panic or interrupt storm from unclocked register
accesses?

By enabling the interrupt here at the GIC level before the hardware clocks
are actually enabled in mtk_dsi_poweron(), the mtk_dsi_irq() handler can be
invoked while clocks are off. The handler in
drivers/gpu/drm/mediatek/mtk_dsi.c unconditionally accesses DSI_INTSTA:

mtk_dsi_irq() {
    ...
    status =3D readl(dsi->regs + DSI_INTSTA) & flag;
    ...
}

If a spurious interrupt or a delayed bootloader interrupt fires between
mtk_dsi_bind() and mtk_dsi_poweron(), or indefinitely after the display is
disabled via mtk_dsi_poweroff() (which disables clocks but does not disable
the IRQ), the handler will execute while clocks are off. Accessing hardware
registers while clocks are disabled can cause a synchronous external abort.

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914115812.2275=
1-1-angelogioacchino.delregno@collabora.com?part=3D5
