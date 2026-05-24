Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41084309DCF
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 21:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779657662; cv=none; b=AC5S5mIk0/5hpQ6MZQVdfxboTpxhdIZCLksbqjCINvoj3skHNKtCZWVUOHz2OUXl89PLKnoY15bxVle1UDkqh95hJR98JMUprck0Vq2gtTs3ysm/UZGvZKy9Nx9XiqAiWMO8K0pv20UIYlmSs8Rn1RWgu3buLKV4hVagt1ALb28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779657662; c=relaxed/simple;
	bh=6w+/iSJRWut/D1sqx5dV3SWtkjaFwtBwoEXiJRSLQ+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGskYRT1g9tu36HjlL+0igq3SYCZOeKkVe5P3XqaH+EThTR+cuIFJwiw0ArXYN58Bwd7oqQogogHjqo2wffl5WXLmCopmcAbGqfKleuOO1ZGpcv/PV7/PSzK1S57JvPAuHf/KvZxISU54t8ranQhVkgp67L0PBAP52Zah/fV/94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so14540782e87.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 14:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779657658; x=1780262458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6w+/iSJRWut/D1sqx5dV3SWtkjaFwtBwoEXiJRSLQ+s=;
        b=OQYUUsAh0nR/NjEQCP9+h6aU+Ch1EAxODNJELrPMNXpXFxWCfL/DS0fL3ShhsLT+kb
         qypFfmzf/kVN61XarqbR2cRxY+WUuwddXkK3m8zb4gPZG8p7dR11HCdS/ABcSW70JV1u
         7i1MA3sDQ2lH9fctE16NXexCl29fqly1fKWh8PolKBKLApPsOg5OYgyKWSDfgqSzciSg
         ghsmZbhUQ+wfoAnC7K2ISAET4WWJ/WFJDznSj3vGPRbM03TcJ58PFB691H9Ob65E95Ja
         P3M9W+FT5wy+nhx1Yv6zkQzTBnGlpV6ew5TSSTp2lAU0uJ+Zkry2rjV6v7Oj/xtuyN5v
         4eJg==
X-Forwarded-Encrypted: i=1; AFNElJ8aWTEoNzWAbtDyq5e6CR2w64ksYNp+frC4sH1V9Egf8Lz7NV1ihj8sxgvtu6h2CCwDKGGOm2CRQX4A@vger.kernel.org
X-Gm-Message-State: AOJu0YxKDbo468CihWfW6EGv6Z+qHFsg+wDEka/GwAxHCMkaxVaH7LPh
	ENiJrYES+sdh5dtbtTds4poun3PbYPt2/DvjXkXB17EXiRQHJ9RWF1InJ0qoiw3900o=
X-Gm-Gg: Acq92OFwfxXyMrNas/Jo/PiGm8yD8fIO36GUAmpieMxioMsobx4MVzHcRdwOBgIzUn2
	aUrgE+aRvkJytiH77X/xgdpwB6zwtSS4QZCiFBOVsUhpyWUY5RIvLvBEX7LMa6sEGvm8zr35Inj
	WgtKWeNmQ5ajzHesB8Wuau0cOqNwy0zqqGCW//7rwZlbRAZnvImxd4pg7qAP3+QpfNcHj56tk3S
	0F398NEPnD02ReCSeAOIUl4qxR48Uw+DS/SOK6CssWkRXDAw9VnTIhKTJH0V0EvIAda7iWoljwN
	aLtGTImoC/aZsag5eztMYrwPR3lTrFiWIIO1vkuYk6VpSpirlEy1lMTxyv8pkwXLA50tGVPn0bc
	i9p2b5Ckkbofe1s1Hq9kIjHxBrCLxOoE/TpcK+1/h8r51v/FXaFvmQNYn//f8/YvESGGi51FRtf
	90M30pfIFhKE3EEqrM5s5eQnWTScCunmqAS+empG9ND0JOHpYu+WKUmZA=
X-Received: by 2002:ac2:44cf:0:b0:5aa:b6b:a3f1 with SMTP id 2adb3069b0e04-5aa323d97f8mr2179351e87.45.1779657658243;
        Sun, 24 May 2026 14:20:58 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2eccsm2193527e87.69.2026.05.24.14.20.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 14:20:57 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3939d2bd739so70311171fa.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 14:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BhATywqzS11cMkRTmF7a2vDeDDp2BCvh2/BNIV4aQwVoXvXK3p5iE/omVTjAUjDWocI4BreXQVXdo@vger.kernel.org
X-Received: by 2002:a2e:b8d3:0:b0:38e:4810:4f44 with SMTP id
 38308e7fff4ca-395d8bd88a8mr40151971fa.4.1779657657216; Sun, 24 May 2026
 14:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-8-jernej.skrabec@siol.net> <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
In-Reply-To: <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 25 May 2026 00:20:42 +0300
X-Gmail-Original-Message-ID: <CAGb2v64UvgqOPuZwayBmSUhQA1VwBBDpFn7ok0d7OVHjhzz=2Q@mail.gmail.com>
X-Gm-Features: AVHnY4LF9PZK6soJXHv0nl5iKDfqAVEgS-xhOR9JBN-5Ngh0yXQO9LbOCoc_jy0
Message-ID: <CAGb2v64UvgqOPuZwayBmSUhQA1VwBBDpFn7ok0d7OVHjhzz=2Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > As it turns out, current H616 DE33 binding was written based on
> > incomplete understanding of DE33 design. Namely, planes are shared
> > resource and not tied to specific mixer, which was the case for previou=
s
> > generations of Display Engine (DE3 and earlier).
> >
> > This means that current DE33 binding doesn't properly reflect HW and
> > using it would mean that second mixer (used for second display output)
> > can't be supported.
> >
> > Remove layer register space, which will be represented with additional
> > node, and replace it with phandle, which will point to that new, shared
> > node. That way, all mixers can share same layers.
> >
> > There is no user of this binding yet, so changes can be made safely,
> > without breaking any backward compatibility.
>
> There is user. git grep gives me:
> drivers/gpu/drm/sun4i/sun8i_mixer.c
>
> which means this is a released ABI. As I understood, the old code was

We held off on merging the DT changes so that we could rework this.
I can't find the actual request though. It was probably over IRC.

> working fine but just did not support all use cases. Why this cannot be
> kept backwards compatible?

AFAIK the "planes" block is shared between two display mixers. As the
commit message explains, this prevents using the second mixer, since
only one of them can claim and map the register space. And on the H700
(which is the same die as the H616 discussed here but with more exposed
interfaces), there could actually be a use case for the second mixer.

Hope that explains things.


ChenYu
