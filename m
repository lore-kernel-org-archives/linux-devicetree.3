Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFEA3F65EE
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786198028; cv=none; b=ThMTjXBPMeWkzBXHlC7Nu4eg6kfFaXSCWVHuKMVyMTK1fDgAmE3bERmXNpWu7E41spqn8plaI9O+LiMzogaDQzRaabKX/oChEPTkPYG8zPNany5WUQIv4KXRXnCtxbph4iEqY2im+p3Ld46KlkPA6vAk88+vFPksUlpb/DYxCOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786198028; c=relaxed/simple;
	bh=Aar1x9JA3i5d5qHNi8WoHCLxzhdIChv9/LTSPfuTPLQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSRoTfzM7aSIh26wUDViw/op51VYdFzbTALYdU23/aTXDs5FL6UlrpFtycxtgDi5eAQZ0tlpUH5n3NXFkq6SfxeP3QaLtZsjA7gQD46Y1L8hSUMgh8eLUU40oQ9AVsHR1qV2/XcssywYbcjYVOCNVjbK0OtLIPnR49gRo2Rw2wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKB2h+7M; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKB2h+7M"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c888c001628so308289a12.0
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786198027; x=1786802827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zrxXzmuLnBiNnwK74e3uO+cSnorKNXKL/VAH2ROuE74=;
        b=iKB2h+7MO3+ED/w0PExW/Ly93Z0Ns5lyKrMj/x9WfVye3lbMiTvyEDZdh2tW1TlhyL
         MOhQVOYKb3zIFdn+qihGsZujD7IL/iF+jwo+a/+oN/QMsfOlHIcm4vE2A0u8p53h7U1M
         dppDMtiAyu6EDlD27T3bGZb19mv40Km1TdOiSnBZziZx+CQyyQrY1A83E9kYtqKIVLrq
         GlsW+uytwaK0u6/noNTc+L20uRvxnrKxvkeVq2jK1fDq7bJJUE3y1+ZUmJ1I1J4QyQYA
         NVq/AIrsGy1ocYhF0REZZqU8nU7a3byTqC+JPUVX0jFXgOGAfUMxgEQ/oSBZytBVPORP
         HYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786198027; x=1786802827;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrxXzmuLnBiNnwK74e3uO+cSnorKNXKL/VAH2ROuE74=;
        b=jjrUdw+pLIbrpB7/6Ono81l7It43pcSMgYdtD5oYtgBjtVZo9B9Rk74ghBHU8LPFeR
         qvCSga3bO6owFJ7T9Nr1D0nuxT8bQBLABOnmq+CFXxK+t5LMy+RkCwSqLdNbX76T1YRi
         Du1JHIEXTaUcO4qCBbd3KwmVC0LeFJnQZPxPGg9kV6rDiB1kLfk+x9RgeD3x0blGmKLJ
         swT1zPvgqtuYrX2usVA96GjZ3MLSV3vkUyKRFp1cpqDBEQf8Pm2HsMRzz5mwsXjkrDEB
         DmiNzYP10vSOpJFNYe5XB+30n6UfT0CL31EuGiuXFlJCTr83EIC5iGzIzW+4FVB9W362
         UZUg==
X-Forwarded-Encrypted: i=1; AHgh+RqcCFDP4BCeKaRE6imQ2Q0OlMO6XH+HKxwDuEhaRBCtNpTWGJmxN8AizIjflFtb0/X1wNmVrfba5mS/@vger.kernel.org
X-Gm-Message-State: AOJu0YxU15tJgEeTYFdOFWx0V04Q8mxhngl+qS29pDbsYiZPeUVgqsQh
	xa2IbYTzzl4PJRurRuI3Ku1k5EGF+GuONBL/RrYU5ucdoBWXxY94F87l
X-Gm-Gg: AR+sD10DgvUBvxk3opH8AVI8XHyLzDRBCwemnpd6r1D8VjpWGOc++ZXbbiBVdrhtDWM
	WdJPmkTSjjkLu5UKI8F+tMXq+x+WqBauxYTcdbOAbx+hXooqxWsJAG2/PJgVuyuS4Boi0fCW9Xe
	bl73jHiGhy3gra6YWXQ1D6sVRHfeMdU7Fk+1zlv95JQTUrGOewpYGNERaEIhRInbs1aG73al/sV
	6utGk8TVbAVUVp1v9bLWOhQobhL4YqW67n95PD7Kbgowc1KJG0N1x39wpl0K7VaO5/uFkJXiKuT
	xHgmJnrvYFmT0WFWv/yEl2a4nU3oRbXBc672VrKnH3UKa0CWChv/l95EDjn4jD73VEvpQuqH6ml
	m3asV0gVhBqnvMehHfjjFIu41JisuhYITB608V/7fnxvCFMK3Vuii+vN9pzZ9v71HpYXU0NSHyh
	ln3Qm6GUvgb87/2O9l6XaqLM8QfbcZcEPZzfnZ/do=
X-Received: by 2002:a05:6a00:2286:b0:848:76af:db37 with SMTP id d2e1a72fcca58-84f694200b5mr7899614b3a.7.1786198026809;
        Sat, 08 Aug 2026 07:07:06 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f372b5bsm1905209a12.25.2026.08.08.07.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:07:06 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:07:03 +0800
Message-ID: <7b4b8457715c2e447f3b3522e519f0af.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Yao Zi <me@ziyao.cc>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
In-Reply-To: <amdPPBOH-Dk4oU7y@pie>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com> <amdPPBOH-Dk4oU7y@pie>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Yao Zi,

On Mon, 27 Jul 2026 12:29:48 +0000, Yao Zi wrote:
> On Sat, Jul 25, 2026 at 12:51:21AM -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Add the DP/eDP controller that sits downstream of the Saturn DPU. Two
> > identical instances share one compatible; the eDP-vs-DP role is board
> > wiring, so it is taken from the devicetree: an eDP panel always sits
> > under an aux-bus child node, an external DP connector never does.
> >
> > The link is driven through the generic PHY framework, so the controller
> > never touches a PLL register. The controller's HPD interrupt is gated by
> > the DP pixel clock, which can be off exactly when a plug has to be
> > caught, so the connector is also polled and the interrupt path re-reads
> > the live level when it does fire.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/Kconfig            |   19 +
> >  drivers/gpu/drm/spacemit/Makefile           |    3 +
> >  drivers/gpu/drm/spacemit/spacemit_inno_dp.c | 2443 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_inno_dp.h |  328 ++++
> >  4 files changed, 2793 insertions(+)
>
> ...
>
> > +static int inno_dp_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *aux_bus_np;
> > +	struct spacemit_dp_dev *dp;
> > +	struct resource *res;
> > +	int ret;
>
> ...
>
> > +	dp->pxclk = devm_clk_get(dev, "pxclk");
> > +	if (IS_ERR(dp->pxclk)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->pxclk),
> > +				    "failed to get pxclk\n");
> > +		return ret;
> > +	}
>
> It seems pxclk is only enabled in probe() and disabled in remove(),
> please consider using devm_clk_get_optional_enabled().

Thanks for the review. You are right that the disable belongs to
devres. I will move the disable to a devm action registered
after the populate.

But the _enabled part of devm_clk_get_optional_enabled() doesn't
fit here: it hands the disable to devres at get time, before the
PHY child is populated, so on unbind pxclk would be disabled only
after the PHY PLL it is parented on is gone, and the clock core
would warn.

I will keep the non-optional getter, since the binding requires
the clocks.

> ...
>
> > +	if (dp->pxclk) {
> > +		ret = clk_prepare_enable(dp->pxclk);
> > +		if (ret) {
> > +			dev_err(dev, "failed to enable pxclk: %d\n", ret);
> > +			goto err_reset;
> > +		}
> > +	}
>
> So this check could be dropped.

Yes, all the if (dp->pxclk) guards are dead code; will drop them
in v2.

> ...
>
> > +	/*
> > +	 * The PHY exposes its PLL as the APMU pixel-clock mux's external
> > +	 * parent.
> > +	 */
> > +	dp->pll_clk = devm_clk_get(dev, "pll");
> > +	if (IS_ERR(dp->pll_clk)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->pll_clk),
> > +				    "failed to get PHY pixel clock\n");
> > +		goto err_clk;
> > +	}
>
> Same for the "pll" clock.

We never enable "pll" ourselves (it is only a parent and rate
target), so it will stay a plain non-optional devm_clk_get().

> > +	if (dp->pxclk) {
> > +		ret = clk_set_parent(dp->pxclk, dp->pll_clk);
> > +		if (ret) {
> > +			dev_err(dev, "failed to route eDP pixel mux to PHY PLL: %d\n", ret);
> > +			goto err_clk;
> > +		}
> > +	}
> > +	 */
> > +	ret = devm_request_threaded_irq(dev, dp->irq, spacemit_dp_irq_handler,
> > +					spacemit_dp_hotplug_event_handler,
> > +					IRQF_NO_AUTOEN, dev_name(dev), dp);
> > +	if (ret) {
> > +		dev_err(dev, "failed to request irq %d: %d\n", dp->irq, ret);
> > +		goto err_clk;
> > +	}
>
> Since 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()") devm_request_threaded_irq() automatically throws
> an error message when it fails, so this error message is redundant.

Right, will drop it.

Cody
