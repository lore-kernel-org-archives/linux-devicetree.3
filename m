Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7745415F3A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657121; cv=none; b=oeMvThYmwUTXpSLMm3zdvpqO+LhaB1x+Nug8p/jOpbRbqs7A3K1hw8bwk+PSneidte8hn6iZB17fqf1tGq0nh76JLsNALzPhKnmBwBxXmABZIeXBpB/xxV74Yo1aLrAUt9CBEt0cjzqRGPH+wOx/+ozgPc2WTMYrgrsxlsMNh5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657121; c=relaxed/simple;
	bh=Bda0p2XSZ4K2+EAN/BeolsgzR/xhAiP0P6Zgwms6yAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A2w+gtCQ8mKk98ymG92oL9PzHqqKVDRAX7z042vgnYAcB5o8TFpy5qoIqwE+D7qspKTwiyN6M2V7PvzIx2knYY74hGT+u6wtl05jT9te7YwIYpG4aeS85Zj7PamXWiih75O0sic1YUpbUQKKUBI8yo18P9GdsDzdRYPymMSIIKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STXXO0SY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STXXO0SY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD241F000E9;
	Tue, 21 Jul 2026 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657120;
	bh=5UAzDGzQS1lnjlNaUZ2HYViYIT+34AopckNgcDjyNTg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STXXO0SYQwCUTrzxM+sOXZlOqVpANQ2atl9je4J7zcKyZFBVnZAyJDOJwzfDxlPNZ
	 0XAdH81DK1vClIKlDZ8wxEoiKZF13HpLtd/adKBbdGaCpQ8RGkBcIFAzc6fo9J+JSh
	 hlcoRG+dwUYaYCAeo28T8lDKNN4Ce8nyaqS60gK4kmUyXuAKRYdhrf1mIJEb6AC0Lv
	 lYhReJyictQOYvsaE1BVEE/f24ldlIZy5itH2q1u0Vv7jJJKixmzWRk/+VwPAWxa37
	 179ZZuKgqy4zLWR80nSu6MBVAW9TSA4eIgKKFbRyVH+PdOAj+jh844Nzq6oEQNQ74n
	 IAf8WqVTVpV0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/10] drm/bridge: synopsys: dw-dp: Fix incorrect
 resource lifetimes in bind callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-1-f0f4a4ede712@collabora.com>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-1-f0f4a4ede712@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:05:19 +0000
Message-Id: <20260721180520.1AD241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing `cancel_work_sync(&dp->hpd_work)` during unbind allows=
 the workqueue to execute after the device is unbound and removed, leading =
to a Use-After-Free.
--

--- Patch [1]: [PATCH v4 01/10] drm/bridge: synopsys: dw-dp: Fix incorrect =
resource lifetimes in bind callback ---
commit ad3d9fe60dfef89b2bbe919cc696921df60e683f
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Fix incorrect resource lifetimes in bind callb=
ack

This commit introduces a new probe helper function to acquire resources ear=
ly
rather than during the bind callback. This aligns resource allocation with
device lifecycle instead of driver bind and unbind time.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
[ ... ]
> +void dw_dp_unbind(struct dw_dp *dp)
> +{
> +	disable_irq(dp->irq);
>  	phy_exit(dp->phy);
> +	drm_dp_aux_unregister(&dp->aux);
> +	drm_bridge_remove(&dp->bridge);
>  }

[Severity: Critical]
This is a pre-existing issue, but could this leave pending work items
running after the device is unbound?

If an HPD interrupt fires right before or during dw_dp_unbind(), the
interrupt handler schedules dp->hpd_work. While disable_irq() prevents
new interrupts, it doesn't cancel already pending work.

When the driver is subsequently removed and the devm-allocated dp structure
is freed, the system workqueue could execute dw_dp_hpd_work() and trigger a
use-after-free on the released memory.

Would it be appropriate to add cancel_work_sync(&dp->hpd_work) here during
the teardown sequence?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-synopsys-d=
w-dp-improvements-v4-0-f0f4a4ede712@collabora.com?part=3D1
