Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720AF3D25D2
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405933; cv=none; b=oRQD3xUKRtf1TDdM8b8zJYuO7dhqtcXfyrHZh4Jr/dJMr61Bo5lGnuNbwz1SZ+J6qVpQ6AbUdJWzDPs55+XCiadsaY8W9DmmwwOt2ZcNAwUc3HNloLNow+pe7P6ISoGLEuS5wIKtCi1tuNn6IuUlmvrYLnboOWMxlpLgK8RvsiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405933; c=relaxed/simple;
	bh=p1I1FOiMZHroMNPcQE8p/XRIRy2TRvsMw8fFFn1Jm8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rLH8+zS/Sy59xTajXTeoRXq4NWthBdm/2HNUKcakJQx86da319MG607uw1y6UrVr3iNUzLAX90ErBPvQtOu/dPf6W2XhLzO9wc0u/S8s2WYONKKJZJX/y+eXPCwr0qw5m9pVROL6RaQyK5crPtlgms/Z2dkVKXL0lxXHN56KOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYKCv5Ft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYKCv5Ft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BDF1F00A3D;
	Thu, 30 Jul 2026 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405932;
	bh=B7J3CxXUjSq4CHExfxUSo91bsC5u915CT80BnvZlhd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cYKCv5Ft23cmRytO7E++rLy7GZKVLmw3OCMc4iMZpIwBzBcjL8QfvN2K1rmgHb2jv
	 SZPhQAUNMNCc+6POdu5RadUvCvPJUCl3h15UJu0MRvybqaDNJssIP/KeXEPYxwlsjm
	 YdDvEwv6h02lpu10/3dJXClJP/ciLz+RRmGVzBalwWVpbIf6zciOD7GPj+h+8zZRyW
	 VbB4J6Uo3oUVBpdIaD9E7SjzhQVr2WTYwux5LTyNz9npTHP/brFU4BLMXQP0WNpbZ4
	 ermh3bnAVFuGfBBwGBd/Q1lsfv1gCbMIlGDhGzz2XHjtA1Tjk9iG+zqzPWXeVIOGdq
	 1VV0EosHdsEBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/24] clk: mediatek: pllfh: Add configurable clock
 ops to mtk_pllfh_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-13-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-13-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:31 +0000
Message-Id: <20260730100531.E3BDF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing function exports make it impossible to implement custom =
clk_ops for PLLFH without breaking frequency hopping.
--

--- Patch [13]: [PATCH v4 13/24] clk: mediatek: pllfh: Add configurable clo=
ck ops to mtk_pllfh_data ---
commit 3ac21b55d82d370931f28f17cf6b5de73f938fdf
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
clk: mediatek: pllfh: Add configurable clock ops to mtk_pllfh_data

This commit introduces a new ops field in the mtk_pllfh_data structure.
It allows drivers to provide a custom clock operation set instead of
using the default mtk_pllfh_ops, which is necessary for SoCs like MT8189
that require set/clr enable support.

> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-=
pllfh.c
> index aa95cd9197b3c..4878ac6da7da0 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -153,6 +153,8 @@ static struct clk_hw *
>  mtk_clk_register_pllfh(struct device *dev, const struct mtk_pll_data *pl=
l_data,
>  		       struct mtk_pllfh_data *pllfh_data, void __iomem *base)
>  {
> +	const struct clk_ops *pllfh_ops =3D pllfh_data->data.ops ?
> +					  pllfh_data->data.ops : &mtk_pllfh_ops;

[Severity: Medium]
Will this allow drivers to safely implement a custom ops struct?

A correct pllfh ops structure must use mtk_fhctl_set_rate to maintain
frequency hopping and spread spectrum clocking functionality. However, it
seems mtk_fhctl_set_rate is static and unexported.

If a driver provides a custom ops struct (such as mtk_pll_setclr_ops)
without being able to reference mtk_fhctl_set_rate, wouldn't it silently
bypass the fhctl hardware when setting the rate, potentially causing
glitches and breaking spread spectrum clocking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D13
