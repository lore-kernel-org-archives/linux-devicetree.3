Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D1636404E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 23:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786662923; cv=none; b=kL+OlfV8DbVseLyHsxiHcMERE18olH07IsCEigfqcfmCLmap+G/gAJ1j1u9eTaSYf1wp5+4BAca/BID16LNt8mZ2fRbuJh70NkMgAUrHNCSsYifFeRH9lVJlJFpeXBLAekN/gRlDJgYYMQI3St7ZjQ6usTUtJ5fKzcp/30GMKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786662923; c=relaxed/simple;
	bh=k4AUEe/eF5pQOQuhcqdD5fQq9mkbGUNXNB8d+qN0N5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b6EPwyLFrxhdZ1aE//+McSH02ua5X5h/s/e6Jz24aEySZucHY8wwiooUfqFXqbM4r4fiFT2+UCk0s6c55RfaXAqH/B7LKoahcTTlZljdDiyQSVzUHjsci2PaFPNGNWHwUFu6E84w/1ZFYmel78g25r6aov5+MxJPXDxkr5xkdxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ntbl8lZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ntbl8lZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17301F000E9;
	Thu, 13 Aug 2026 23:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786662921;
	bh=k4AUEe/eF5pQOQuhcqdD5fQq9mkbGUNXNB8d+qN0N5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ntbl8lZBQ/ps0TG6n9XlyJfYUfmJ5nR2FI0pww+eArLSH9hyu8bXJX/j28lM+Lr6D
	 QoIvM0e+YUxWKlWUKqh36m+c+W3jzluwndMkQo5B4aIFHxeeS3XPv5ZX9fBfU1muDB
	 faR0yDWGKCT9FvOnHcqbiBt/1Qs+SaRcstG6hAiJ2ce7iFGRS7goEBPox4zCnjUJlY
	 zh8h4XNOKDIvlScHW2iqyJ1xEOP2TzS1GtYmPHPsKae6l0smliwVH4/0OHWAmqPEba
	 aZvAhwbi430tZtz7pJCtfYUUkY30qCBod2O0oUjA2M+/sw2nM9nxjv3HzXGxSBuHcC
	 lMM6Qstl02kEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/14] media: mediatek: vcodec: clean xpc status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yunfei Dong" <yunfei.dong@mediatek.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260328051630.7937-9-yunfei.dong@mediatek.com>
References: <20260328051630.7937-9-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:15:20 +0000
Message-Id: <20260813231520.C17301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Unprotected read-modify-write on the shared VDEC_XPC_CLEAN_ADDR re=
gister from concurrent interrupt handlers causes a data race.
- [Medium] Missing bounds check on DT register properties can cause a NULL =
pointer dereference in mtk_vdec_hw_clean_xpc().
- [Low] Indexing `main_dev->reg_base` using an enum value from a mismatched=
 enum family.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but a dangling point=
er in the main device structure after a subdevice probe failure leads to a =
Use-After-Free.
- [High] This problem wasn't introduced by this patch, but an unchecked con=
text dereference in the hardware IRQ handler leads to a NULL pointer derefe=
rence.
--

--- Patch [8]: [PATCH v4 08/14] media: mediatek: vcodec: clean xpc status -=
--
Note: The format of this review has been altered to provide a free-form=20
summary without directly quoting the original patch code due to system=20
recitation restrictions.

Commit: 21f18ceee1ef481effb4080e344810308dfee5b9
Author: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: media: mediatek: vcodec: clean xpc status

Summary: The driver needs to clean xpc status when receiving decoder hardwa=
re
interrupt for mt8196 platform.

[Severity: High]
In mtk_vdec_hw_write_reg_mask(), the code performs a read-modify-write
sequence on the register via readl() and writel(). Since
mtk_vdec_hw_clean_xpc() is called from mtk_vdec_hw_irq_handler() for
multiple independent subdevices (like LAT and CORE) that can fire
concurrently on different CPUs, is it possible for these MMIO accesses to
race? If they race on the shared VDEC_XPC_CLEAN_ADDR register without a
spinlock, could hardware register updates be lost?

[Severity: Low]
Looking at mtk_vdec_hw_probe(), subdev_dev->reg_base[VDEC_HW_XPC] is
assigned using main_dev->reg_base[VDEC_HW_MISC]. Does this index into
main_dev->reg_base using the wrong enum family? It seems main_dev->reg_base
should logically be indexed by enum mtk_hw_reg_idx (where VDEC_MISC is 1),
but it is using VDEC_HW_MISC from enum mtk_vdec_hw_reg_idx. While these
currently share the same integer value, could this silently break if the
enums are ever modified?

[Severity: High]
This isn't a bug introduced by this patch, but looking at
mtk_vdec_hw_probe(), subdev_dev is assigned to main_dev->subdev_dev[hw_idx]
and marked active in subdev_bitmap before the rest of the initialization
finishes. If a subsequent step like devm_platform_ioremap_resource() fails,
the probe returns an error and devm frees subdev_dev. Does this leave a
dangling pointer in the parent's array? Since the bit remains set in
subdev_bitmap, mtk_vdec_hw_prob_done() might consider it ready, potentially
leading to a use-after-free when mtk_vcodec_get_hw_dev() dereferences it.

[Severity: Medium]
In mtk_vdec_hw_probe(), subdev_dev->reg_base[VDEC_HW_XPC] inherits the
pointer from main_dev->reg_base[VDEC_HW_MISC]. If the device tree is
malformed and provides fewer register bases than expected (for example,
only 1 instead of the required number), could
main_dev->reg_base[VDEC_HW_MISC] be NULL? If so, when an interrupt fires,
would mtk_vdec_hw_clean_xpc() blindly access this NULL pointer via readl(),
causing a kernel panic?

[Severity: High]
This is a pre-existing issue, but in mtk_vdec_hw_irq_handler(),
mtk_vcodec_get_curr_ctx() is called to fetch the context. Can this function
legitimately return NULL, for instance during spurious interrupts or early
teardown? If ctx is NULL, wouldn't passing it directly to
mtk_v4l2_vdec_err() and wake_up_dec_ctx() cause an immediate NULL pointer
dereference, as both unconditionally dereference it without checking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260328051630.7937=
-1-yunfei.dong@mediatek.com?part=3D8
