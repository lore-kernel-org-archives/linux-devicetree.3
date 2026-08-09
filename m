Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0F017B425
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 03:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786246002; cv=none; b=dIaJ/uCoU4rRx7MM/3lyZmRDo52vC3VsJM/eRPHJBZCMxMT0klu/mA1ZXlDF3AJ8pOaXtSblAZmRTT4JXcmgQ2ZCv5ywGFpYxxH0qkILpisSZJEF4pqBHwOk2untG6G8SHUY71DpsvAMZ0Ki0wJmR20CW1/0jTWknhxf4ti3Lzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786246002; c=relaxed/simple;
	bh=PwkRwVu8DgQxChoGdguymS5qtXjGLridD3lojWC38lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF1GpXQKwObg5EE+dNpv5XEC1CbdYdIIQgOs+mAEkhubWvx3mzc1dJ5qw68A1CVeGVPOZPzAiuPplgyDBTM3tyQsTFc+kXQ9YAgUM7XXjOCkd2vvwBj7iJokfncFENfTRM6k6OlPnsuXKe3JtTd4HLuKKRio0saET74oLXOb4RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXI37K5+; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXI37K5+"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-38f25802c19so365143a91.1
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 20:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786246001; x=1786850801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+2ZP2VpD4hdDzBsnG2msnBM+iMSdLsJB7PET2eMgj0=;
        b=DXI37K5+OgAvTtUr1CHzhxkkr5jYxCfjLx2ijWDG66p/12PNSY72IjM9WL8TUpNS+X
         QckAoZ8bXfF0jzkKH7zTNZ5T39wffgFqFetiHmvUEb1bobpaiYDRLUQn72qsxuR9x2Je
         +UYI5yJoE4RA1GSp+UFD4tCMq+5NxPh/m5cT3M7w32mO+PYYu2CQASKVDVagnJZCW3et
         uWtv49y4hecdUmyw4N+jy33ahpQgXdQv+12+9AIsCk9gPMgD3ZBt7llT4FrQGv+MRf1V
         sG+qYZvxHXq4loRAn1fQQKZB3uHBKvmIReSKotwmQuz9lWrMKMxiZQHjWK0Pp+KKnP44
         ZHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786246001; x=1786850801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+2ZP2VpD4hdDzBsnG2msnBM+iMSdLsJB7PET2eMgj0=;
        b=P6WG8bRKzBJHgJ490w5If+wtfXrf6N581hUXHp3eK7J64Ed5SMo6XPRyJzbhHyAmQU
         HoHjlPyxJI5/8BTAfH7BmUWX8YhHwVU2wBC1DPk0WuARqeDAJdYahYyN7YjipZfXNSkX
         dCr+P85dedntT4vPh+4eyIpA9svWWGZgb6cmhZi8iqy5pWFmH5rAU6X19F+u/lTBE6my
         z5kP+qjvWxnwNjzOloIZSf5tFMD49CRHpIjbpzoS5JhykKIr7qzf5nvT80sx2HZomGa1
         YtOz7VTscG0ul+XI7R6hDD5EEUJ9NXi0qUyfGI0u5TVYT3qVJXSfA15KQynxWmXgabsR
         arcA==
X-Forwarded-Encrypted: i=1; AHgh+RrjtJyEMDHuqldBJp4fcCWvy+WlHOPw9sde+yQ5KUWmjv1bZ92c6Mt9QrM6sp8NU5T7DWQyknNtog45@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyp2Ym0vdldAAHSysQwPp0U+yzBKNUqrZc36q1zXqlDQReh4HF
	O12GDqjFhyDAklaZSpsH3XFh1IPxSRu686zq+Pv1vxWoMpGg/drPZyq9
X-Gm-Gg: AR+sD10y902Q4fz/N2oP3hcBZ+iaKZ+rMSIqyNd+0MZtmrRC+CsOCZqR0ZX402RSM5K
	Nsxu8Ksw4YZMKeHet6GEKis0NVqLR9HiBbEtGUP5Qc5n6xA2b7nX0KXqUHkNhHkhEL7bz7XPbO3
	+yHk6o2q38Ax9WNyeqsMNSTKK5gy4yj5ETVn136T2XaTWViBL0Ol0v/lP/cNWIMneYgL8p5ZCx+
	i94OtuORs2TgyOdMMCKBlq3PubeLezyOtUGWCAdu8e3IZ5UjeyEXZICjxzRCtbAvI+WzqrzW5CM
	oH1jE6CeOmTtqlhHrt1PEKwxxyKxc36zLW+95qYu63S+77z1Aomqs+fwjbsNihO9qDK1V5iZrHA
	QgNqNucaJ0rn4+Ha2mF6rsimk8/TzdYELnLaQwd9hxuL3wJcugJaVVwOalRfWmvMSDB/me9e45v
	rjjAfueM/2z9Mwq5SP7pvL2URwFRbSYiHciw==
X-Received: by 2002:a17:90b:390e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-392823ea541mr9657081a91.16.1786246000598;
        Sat, 08 Aug 2026 20:26:40 -0700 (PDT)
Received: from localhost ([2403:2c80:6::10db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b35ca2b7sm3210539a91.4.2026.08.08.20.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 20:26:40 -0700 (PDT)
Date: Sun, 9 Aug 2026 11:26:35 +0800
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
Message-ID: <ko2cc6jyezfyqzg2rdftyebeydw6nfd65ajvu46acfewhnrqxi@om2uhqdlhmzv>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
 <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>

On Sat, Aug 08, 2026 at 01:03:52AM -0400, Guodong Xu wrote:
> On 2026-07-27 09:35, Philipp Zabel wrote:
> > On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > > From: Cody Kang <codykang.hk@gmail.com>
> > > 
> > > +	/*
> > > +	 * Assert before gating: a reset asserted into an already-gated block
> > > +	 * has no clock edges to propagate on and leaves the register file
> > > +	 * untouched.
> > > +	 */
> > > +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> > > +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> > > +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
> > 
> > It looks like these three are mirrored, and could be handled by
> > reset_control_bulk_assert/deassert().
> > 
> > > +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
> > > +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);
> 
> Is there a reason these two cannot be mirrored in order? Please double
> check. As I checked the vendor tree, the suspend/resume side appear to be
> copy/paste rather than a deliberate ordering.
> 
> Please double-check. Unless I'm missing something, I suggest to bulk them.

Agree, I'll check.

Cody

