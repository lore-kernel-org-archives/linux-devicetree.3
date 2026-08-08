Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85768239085
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195858; cv=none; b=GQlvmsmyqPZ2z2LxiNbxVzqTZZ2AAcU6LvlgxykD/7C9Svz3Vdgfvgac2vRFpZ7mGiT5ncqqfjBeqI66HlenXtrUC7lUXcWOiaV3tzU9fAyQuecZEDv181QO1k9W4Usdtjcd4KtsVkB2sleUyacK+qhMw5uVqjJIUkn6lM5jKpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195858; c=relaxed/simple;
	bh=GcFnNVCqGghgN6FJ2JiRi+jSktMU9+DvANABx3igE7g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AwUj1elBaI1AIYzQ2inZy6Oa/mqhgpMMfYK5dQFCYiv394UzOxeX2lBhd2j1EVUMLR/9TVCMdbERuPWYGAQNyW1YGGzhWhV6dOavwtWB704mx1Cy+xpzsNmVSwT/byXSm2/CmYQlR3TU41efpquv5oWSkAKeA2HgTrPdw3hSKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPRZKcz5; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPRZKcz5"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca8758e7e94so26223a12.0
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195857; x=1786800657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zYCYgrPHJ1R0IyDM9ZJHQW95fmf52/M7XVvd8snhDU=;
        b=lPRZKcz5DZfPwizcnIy3fTvzqVQabECS5QZMahpWlyQmMtJYCNXXyYYOBSYPxV4FvQ
         KFoYgZHfU+rmu333i8cCD8RBbcNBZ8tu9JYBMLegSs0XQbumoPvMDL68OUS5v12+N5xU
         LJ0Sl6qmf8dBYy46wkjERihiDt6c/YwNHWoFsaCfnHM79wIAQJCr8r0pUnFJwcoqScRt
         AcXB8ecjM3QMjo2mW010L+AZRFF0gOwPa13SMo/9vrrJHnIBM6eShvX3/JmJ7ar4JFX5
         fqXXNcGyV0UF7F6UPX4wiK/q05dOHgEoj0dL6m4rCdcKwRzYv8F8Orv24jw2ZCFGTk2W
         X6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195857; x=1786800657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zYCYgrPHJ1R0IyDM9ZJHQW95fmf52/M7XVvd8snhDU=;
        b=A840xc/5DbjtyxZtiugVVt0ScUPW/mKJZJ4bttkrf2O8nOVlZ+4IOpStefBDdQVtxL
         6uWb70bJwEynpg7lAMfxamO8Y9PUyCHArsge3cleWgavf5c3E56eUN6yyR6VlYO8rIKK
         CR6hc+LHl0MX8HegzjdF/tpEpbIh1O/kpn5zN6VN8gSP+Qduzk9nLzapsEf09Nyj0HTJ
         C9s3FU6tESe3gssn0lDuopeYsg5zqHOUxuNzq9u8x7w0EaftBhgINBGLRJCjzg8NbogM
         v9hQQe773OBqUmOX68cHgxzsT7OMl7EALLtkPyjX471lDbW/hIQLfD5Mn1m2eM+5AvwO
         DYbA==
X-Forwarded-Encrypted: i=1; AHgh+RpJW2KxK/X4SYT7j8+jPZp3JcHezZY193RfJn+ghN1qU4gFp5cpZXFE/lyy3ZtkoWRnPj1lC88g9h1O@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4TGVSYWkxQHN1WX5s5oewVSZJGtSsgUQoou29VjVyH/f+92Y
	QMwAjQwciE/yCj6c3pzHD4UMlbLIgRIPsmUUFbCWYuL0BzXWe2lbeLeB
X-Gm-Gg: AR+sD13rFM+SnQkr0YhFvaaL+i8h6xZoCetzmBRxFSfiExpARhEPBH2gAQZQ8lmSACM
	UZl1q0QEMbKOgODuN3gDUYLzAgX9my9lf6RFKVzAYaP/rG11DSmcDqmTJsDVMNGy1TZ2XsqoxA1
	PnKbPKENXeMW7cSC8JQv7CFSv7rjqMYv/mPQZLqcc6leEPH+Z7vISXj9fJdqO4TEuIOe9+JPU9x
	tqo8lp5dmfmkqKL5QtjTwpSVmBDhah8vv/VH018g6OKUyubPkpFJAOW6/NFkFR/4MJkA6f/ohdz
	AZpfw8BVUKP5n72JJ9Dgx3vf/V8ez44yFn5l02zD6JfMQTx1q07dEHJ89oT+1GK5D77fR3UTQAk
	+xg65uIdxS7Hv/t5cczWn0d58EbRj7crPM9tpFcVicHmQSv/4FQfjeXC6MKZ6AG8R6+eXf5cC2W
	+phwwQH5XlGOTVfQHne5DRjEkfWd/cIOJ5+ue7rOnEKfQOb4+qdw==
X-Received: by 2002:a05:6a00:240c:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-84f6b778b44mr5395163b3a.11.1786195856790;
        Sat, 08 Aug 2026 06:30:56 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9a9sm2125357b3a.37.2026.08.08.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:30:56 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:30:52 +0800
Message-ID: <b66d3009f9cf310ca0f068999bd475ac.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
In-Reply-To: <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
 <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Philipp,

On Mon, 27 Jul 2026 09:49:58 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
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
> >
> [...]
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_inno_dp.c b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> > new file mode 100644
> > index 000000000000..e88731d9b18b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> > @@ -0,0 +1,2443 @@
> [...]
> > +static int inno_dp_probe(struct platform_device *pdev)
> > +{
> [...]
> > +	dp->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
>
> Since this is only asserted in probe and deasserted in remove, you
> could use devm_reset_control_get_optional_exclusive_deasserted() [1].

Thanks for the review. Will do in v2. The binding marks resets as
required, which means I shouldn't use _optional in the first place.
I will use the non-optional devm_reset_control_get_exclusive_deasserted().

> [1] https://docs.kernel.org/driver-api/reset.html#c.devm_reset_control_get_optional_exclusive_deasserted
>
> > +	if (IS_ERR(dp->reset)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->reset),
> > +				    "failed to get reset\n");
> > +		return ret;
> > +	}
> > +
> > +	dp->pxclk = devm_clk_get(dev, "pxclk");
> > +	if (IS_ERR(dp->pxclk)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->pxclk),
> > +				    "failed to get pxclk\n");
> > +		return ret;
> > +	}
> > +
> > +	if (dp->edp_mode) {
> > +		dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +		/*
> > +		 * OP_DETECT is required: without it
> > +		 * drm_bridge_connector_detect() hard-codes CONNECTED for any
> > +		 * eDP connector and fbdev wedges at bind.
> > +		 */
> > +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > +				 DRM_BRIDGE_OP_HPD;
> > +	} else {
> > +		dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> > +		/*
> > +		 * No OP_HPD: the HPD interrupt is gated by the DP pixel clock.
> > +		 * Leaving it out marks the connector POLL_CONNECT |
> > +		 * POLL_DISCONNECT instead.
> > +		 */
> > +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > +				 DRM_BRIDGE_OP_MODES;
> > +	}
> > +
> > +	if (dp->reset) {
>
> This check is not necessary, reset_control_deassert() handles NULL
> pointers.
>
> > +		ret = reset_control_deassert(dp->reset);
>
> If the _deasserted() variant is used above, this can be removed and the
> reset control doesn't need to be stored in dp.
>
> > +		if (ret) {
> > +			dev_err(dev, "failed to deassert reset: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> [...]
> > +	return 0;
> > +
> > +err_clk:
> > +	clk_disable_unprepare(dp->pxclk);
> > +err_reset:
> > +	if (dp->reset)
> > +		reset_control_assert(dp->reset);
>
> Same as above. Remove the unnecessary check or manual assertion
> entirely.

Agree, all of these will be fixed in v2.

Cody
