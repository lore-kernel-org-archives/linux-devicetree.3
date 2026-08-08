Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D6416102
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194447; cv=none; b=isacaWLC7MY3q7V9WHGfyuTzHeCGMJxmY8wcX7MUpZbvZ6GzQvsGlaCnVvQZzOyvJ05fzqRRW7cbhcbQHlKgF3RBXiBML+0Cybqbbfnnj4LMvo9/2RkOkuBX9lT8A/74pwk69zunudlphjTzaFmFa9UfBs/gw08JixtBx4oXpJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194447; c=relaxed/simple;
	bh=JF1VrshOLJIpCGHfhuBKPN9sL6QGMmedrDFOC/XBzjg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmsxEQV3C68lXIR7QLYO+BR51Hk/0uiUu/3k2MRjzFS5KlUhfavg49wbuhiuVTNXlhMJ2dW0JK8XNA6xB3v9+iwkvdYEUCOWeHpMI4tb75RKI0IFSOfnOBo98yDRMz+FlYqLf1j6qt/xG/CgzWPkxPiTxeJZsiV5EaZFExppsco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gng7h15w; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gng7h15w"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-380feaa05dcso258431a91.0
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786194443; x=1786799243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=izR+Nrw48bEezTRpqIz/ECOoUps8WA+iQCICJD/Q9lE=;
        b=gng7h15w7qqew4cq7audX4Eg7PV+ya/IzTA8CCk8HXjViSabdPYJSzrgU7vdgwZAiH
         R3b5uymr+8XX3bVgz3JTuPjNZfIwHFe06PqJlI7as7Ic1LKnFs230PkKSePzrcD8UgHC
         PY5XGBGT5NFp50ThLA41qPOB+iUD4CY7IqqNXGwtat7tVeeFr46LkbgMlHlUYr3gzq2p
         wf4o4UyEwF/xIVJ0DR0LvlkbTj4m9iv4xhN4mT3lr8W9+AWgVv8orepn8P0QTi3pZ2wG
         Jo4OdiHczTarIaLyk2BPRg4RRxLJb/H2a5QKuUHx90s+MSJXrh6NfXXPYrnKazH+PS9s
         BTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786194443; x=1786799243;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izR+Nrw48bEezTRpqIz/ECOoUps8WA+iQCICJD/Q9lE=;
        b=hJib34SYYt3VYztr1DeVKWoQslWFTLs+sRIBdou56Tfq5eOeFj+fQt+Tn39uMRnzrU
         pdJL3yURnk843SzO/bLhdAWFQqBuWChBD0zWfcGk7KcwQ19F6VzYP1hlZy83p8xFZrCX
         HlbAQB66uI9Pux3KxHPQGianc7W8bCl+7qE296E21VDDmiqNFn82a1FNU12W6MEHXk8B
         L+ISQoZAPVRxhCxzwajCTjNrR4sWQ0dHHPwPd9D0XXPXFgSWIkeUG/zSLsf9e78fRH+7
         Hx+SA+j55BXmMlit4xej2Dbw23jEUqhrEeEYkzpLKGbxtH1/uB92OjYffD/kxO2zA68n
         /oMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqs33PaOB+wWydXaXvW0hwmUtBgYUExnTUCt5jh6q6WfKe0+QClm3pDDmwtEwBrQR1a70uWHWvcviPI@vger.kernel.org
X-Gm-Message-State: AOJu0YyX3L8v41c5vPQJMdalcw1q1NawMczrttC0p/7aU2vecPcAkIse
	ZzvBMdrOTBbnVdVKwSCzXK7AP1ib7aPXm7BKTZivPQEN1qRIQ5/EKoAN
X-Gm-Gg: AR+sD13oGbqPHKaCPY+9lVOE8lodhipO7/uxgyKaQOxwtf6ectvVIBPUl51ooAJYUys
	jY9irQQjPwZMTLzWSs/jCcRrJB5ZZ009WfK1VFOoJ9JwRgkk9ZbHRSaje9oOCcWQ+2fL5EBGCzV
	uzHO8NaWwXhyLO0HZpY6zmShKeTMtyoXzUmY80XpxA2gSh/txAkVdgdHvYfWz+lT4U4xjRaYWSK
	TmMlqqZw9Ud7Xf2Da0HLreEweNFJkKj3MO0FP69qGH4gHcaOxjoMOIpU/Uz3fg5r872fh386jIA
	F6oj9OHOVgZA/MYr3MnpEyhoTvJXk743z7GaUZGWjCNQiJ7KoIIPrheADZJCNRTT4rIqbJD2RQw
	Z61ZXJPt5FXDwiPspO+MyV8rLAntvH/76jyXBpIZcUan3ELxT9wnrFUQeP8xegPaFFD+EoOQFUC
	BD9ut16rhcuQdUN9B79in91Nq2NUV/gUQlP968Vmo=
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr26378580a91.0.1786194443454;
        Sat, 08 Aug 2026 06:07:23 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm6117441a91.2.2026.08.08.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:07:22 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:07:20 +0800
Message-ID: <c8634d5b486e8d9eaa1a46aedb853438.codykang.hk@gmail.com>
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
Subject: Re: [PATCH RESEND 08/17] drm/spacemit: add Saturn DPU core types,
 cmdlist and display MMU
In-Reply-To: <3d4204dbd1c73d50193144d1944d8237c625f6e3.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-8-6de34d80e86c@gmail.com>
 <3d4204dbd1c73d50193144d1944d8237c625f6e3.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 27 Jul 2026 09:35:35 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Register programming of the Saturn DPU is batched: the driver builds
> > per-module register lists in memory and the hardware command-list
> > engine replays them at frame boundaries, while scanout buffers are
> > mapped through the DPU's private address translation unit (DMMU)
> > rather than scanned out by physical address.
> >
> > Add the shared driver types, the MMIO field accessors, the trace
> > events, the command-list builder and the DMMU table code. Some DPU
> > configuration registers are write-only, so a read-modify-write would
> > corrupt neighbouring fields; byte- and halfword-aligned fields are
> > therefore written at their native width instead.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/dpu/dpu_saturn.h   |  35 +++
> >  drivers/gpu/drm/spacemit/dpu/dpu_trace.h    | 350 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_cmdlist.c | 304 ++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_cmdlist.h | 146 ++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_crtc.h    | 259 ++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_dmmu.c    | 103 ++++++++
> >  drivers/gpu/drm/spacemit/spacemit_dmmu.h    |  40 ++++
> >  drivers/gpu/drm/spacemit/spacemit_dpu_reg.h | 108 +++++++++
> >  drivers/gpu/drm/spacemit/spacemit_drm.h     |  68 ++++++
> >  9 files changed, 1413 insertions(+)
> >
> [...]
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_cmdlist.h b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> > new file mode 100644
> > index 000000000000..d5acdbeb3b0e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> > @@ -0,0 +1,146 @@
> [...]
> > +struct spacemit_crtc {
> > +	struct device *dev;
> > +	struct drm_crtc crtc;
> > +	const struct dpu_core_ops *core;
> > +	struct dpu_mmu_tbl mmu_tbl;
> > +	int dev_id;
> > +	int irq_online;
> > +	struct timer_list cfg_rdy_timer;
> > +
> > +	bool is_1st_f;
> > +	bool first_modeset;
> > +	struct dpu_clk_context clk_ctx;
> > +	u32 aclk;
> > +	u32 out_format;
> > +
> > +	struct reset_control *mclk_reset;
> > +	struct reset_control *lcd_reset;
> > +	struct reset_control *esc_reset;
> > +	struct reset_control *aclk_reset;
> > +	struct reset_control *dsc_reset;
>
> Why are these duplicated from spacemit_drm_private?
> dpu_pm_suspend/resume() in patch 10 have access to priv.

You are right, they are plain 1:1 copies. Will drop the five
pointers from struct spacemit_crtc in v2; the reset sequencing in
spacemit_crtc.c and the suspend/resume paths will take them from
spacemit_drm_private instead.

Thanks for the review.

Cody
