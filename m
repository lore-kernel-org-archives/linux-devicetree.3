Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F52DCC05
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426142; cv=pass; b=ownX6QmWPEBNRuVG47gz9A3It9Fvqwl73w7191hzcgPTIk11paEYxl3AAESNW1HYIPdSXlvvteEaiqbm1YC2xYZzNJRuMhG2CLlrwhKx/eBkOw1oj6HNUQVoL5LcW6IlVGKRGFrABfO36GIWv3lMOsWrXeXUViN/rpOmUbTyFX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426142; c=relaxed/simple;
	bh=zB4lNaKYpQ2RZphP1kN53sQ22q6B+2T4menfF8kikEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ps4y5E1BC7Jmk8CHNlkTYtn3u9lKl/9FYVkRpkS/uEVoEu5UAM6cEgJOA9VEmZ/sti5LymRNWEZ6OY+udRVfM+TqMKjmm2XEwQ20ToXJ9CVz4ANer7tAivT2qeegXARf2ejxoYe2vsjVYgvMwg2BWWAfbz9Za9Ik2Bq9l3jaln0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XatOiTM+; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XatOiTM+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso4155460e87.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774426139; cv=none;
        d=google.com; s=arc-20240605;
        b=D651h0oHpmq4+/rgsY0XI6CDnXK90/sNtQ12tKnpa3N4HSxFWx7g7nFc2070V7ompj
         e3jqNLNLWWb8O6KLJMSVRFDP26rcSzyxiuQqMcQ/nQo5x5KI8d3y5wC49fOCiRUJkx0C
         iNdS60ytsMhg0nZddF9b5ZoPwpoiUd8HqQLqYYEy6DvMsuMKUBDw8s7gnE2q//GhXbkE
         QNylV4SzYs3RGHTHPxAXSzLJRXTcXX2NzCOJ2zfBGTcLSu9jRVduLKjhp42G3vTVm/eG
         s3+J4r5Mz83HxQ1qVcJ/eOLUN25uYdndmGwdJZMOulgbQpsh4FWW2jiLk/NI++ycD3SZ
         1HYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        fh=RUmEAXLc8ukXMjjy7V8NiSPOkfxKBLZxmxhSt3r1sAM=;
        b=Ypm3fN8ZGWDAUUwkPIlIssUz8euX3pfngqHNs2a63vxdpV5edWL18ViW4oB24Jb0Y3
         NDFkIRAXeTi3R/BR8qFVcu+obJPuM7s96jsezy09AB9Xm6PFCGS8Joy0STEmMtFYzrYZ
         +/9ZjfNHCDTa6MvxYQMyxwS7ZspcbX6SC4GLIB5AeULSxYbjW8SoMGtTAvWfRS019LGS
         nMm2sHpYFgsMBFP3kitvHtYgMRamKWmggqkyc6jTLmV79WdvXBVB0orLihORKXrRJRX3
         1rGjqGKS5fZe42rONk4ZX0ky6ZeDr1xW8iJUH1gpwdRsUU291SWFFQYci2cL8yXYF4K1
         J+Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774426139; x=1775030939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        b=XatOiTM+zP4FCzdlvRTFgXX1QQV6DFUKf3are/qS0kueMARdfmtmlYQQUI30FBx1xL
         6stmF13+g/cxZlbjORLQsgOg32ta8VwDNkZoQu1CvfXUgvnlQyv3dm1kWDGknMiACXJ5
         F090bk698qw3YVDb8gz66Gdg25+zVlYbhVeA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774426139; x=1775030939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        b=csf3k+Ik1EN69jf7+l33cDm6gKmPZWnsuNqDLKHHfIF6UGPD4S1nNeH7P9ydUzc8tl
         UzVMCuzD1HBDeb+HV1EbkMQ7YOORXwTlcrVIjhAhlINublV9321GQHydyp4B1FqGxpav
         O2Ok8PKA8bveczBc7lQb17kUQG8ptoK67YjRF+qYrmv6ERIwD7YT1ZW3dWcKmU3S03BH
         tsBOZG53v4bq4oeKC6+ys4I31Xx8zWVkdK+yCZF43QKnVj24fAoqnZMrpoRV9Om0gEoZ
         AUfpn6PmE+dnJ+3cDdTtWpmygLBVGF6tzu+KdPEvKo2hUHFCwlrNeL/A8PfvsFP+mdeL
         1+nw==
X-Forwarded-Encrypted: i=1; AJvYcCUl73Hij3iEKhSbUFmzk8XJVplMCIX/NQy/tcvPgI1etphyQLUvf1bhcw6YEyGZ/E41FDGXBMQ1Ta8g@vger.kernel.org
X-Gm-Message-State: AOJu0YzcmFXa3voox3JuCfUC4EZA019D6wJwOtu0qhgFXEkX6ZeH6hPr
	w8ZjiFp66f7XEZgAKU3cgpZWdNdGxQ4Xypjpj8O4CxmJC0NRF9GDQ3PmHggAhURTkRZq2bdwdxF
	ZF8+A2LtVIzmU37nQpo5Cr3MSGeJ50LxX+2XzrRy5
X-Gm-Gg: ATEYQzxBqLSQJVMDigcZWP1/eyR5UTnQrqM/RJWHUGiXGoaEIJ8qqM4rCi3v3kDLbLs
	tojpJpJHD43D6AFs9beccz60xorp3QAvYd/DPaJpkJTIGiHHdcQEuh4u3OHWPGXZlq++FV66Lp5
	v/syl6AtM/ckT6mxCvLyoEjZmWmpRLIPQDt0C9pTEFYX8CMbK0+O1Cy/sBTNs50E6WNIDF3qHie
	tJ+NX87PJvKd0llGR4fUZJmwGllcw6XrlY+cx44DSV9pZ+CcdAp0b1XFkS6b/jrhHOSQIoQm9n4
	ij5kF35teRrLh7v4ynYDNS/mp4C9qYsYicR8
X-Received: by 2002:a05:6512:2206:b0:5a2:7ddd:ec16 with SMTP id
 2adb3069b0e04-5a29b99baa7mr981433e87.40.1774426138566; Wed, 25 Mar 2026
 01:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325071951.544031-1-wenst@chromium.org> <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
In-Reply-To: <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 16:08:47 +0800
X-Gm-Features: AQROBzAcEDSwfaWS447vAKoAeNwXBwZATTBP1wT6QXTz02f-QcFivNXEvPY79i4
Message-ID: <CAGXv+5FL2rs35V4F0bwq-a4ccvFaWKcr1cuKxT6sfTj9h+d6iA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] powervr: MT8173 GPU support
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:04=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 15:19 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi everyone,
> >
> > This is v2 of my MT8173 PowerVR GPU support series.
> >
> > Changes since v1:
> > - Adapted to changed DT bindings
> > - Dropped driver change
> > - Use same power domain for "a" and "b" GPU power domains
> >
> > This update was requested by Icenowy.
> >
> >
> > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > some Chromebooks.
> >
> > This version is different from the initial powervr driver submission
> > [1]
> > in that it splits out the GPU glue layer support out of the powervr
> > driver and into a separate clock and power domain driver. The glue
> > code
> > is otherwise the same, and also the same as found in the ChromeOS
> > kernels, with some extra comments and macro names added where
> > possible.
> >
> > Patch 1 adds a binding for the glue layer, called mfgtop. The glue
> > layer
> > contains clock and power controls for the GPU.
> >
> > Patch 2 adds a driver for the glue layer.
> >
> > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the
> > PowerVR
> > binding.
> >
> > Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.
> >
> > Patch 5 corrects the clock for the GPU (called MFG) power domain.
> >
> > Patch 6 adds device nodes for the GPU and glue layer to the MT8173
> > dtsi
> > file.
> >
> > Patch 2 and 6 depend on patch 1 to build. I suppose some common
> > immutable tree would be needed from the MediaTek maintainers.
> >
> > The kernel driver successfully probes the hardware and loads the
> > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies
> > [2].
> > Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
> > the powervr vulkan driver enabled. `vulkaninfo` gives some
> > information
> > about the GPU (attached at the end), but running the `triangle`
> > example
> > from the Sascha Willems demos [3] with -DUSE_D2D_WSI=3DON as
> > recommended [4]
> > failed with:
> >
> >     Can't find a display and a display mode!
>
> I think when using D2D the demos want width and height to be explicitly
> specified, otherwise it seems to hardcode 1280x720.
>
> If you're using an elm, could you try to add `-w 1920 -h 1080` or for
> hana `-w 1366 -h 768` ?

I only did the basic `vulkaninfo` test this time around. To do anything
interesting probably requires the Mesa 26.1 release.

    PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
        vkmark --winsys kms -D b81f54f8568deb0fb70a6a1ed845b65d

just reports "Error: Device specified by uuid is not available"

This is with Mesa 26.0.2 packages from Debian testing. At least now
have the powervr vulkan driver enabled by default, so I don't have
to rebuild the packages again.


ChenYu

> Thanks
> Icenowy
>
> >
> > Same program worked correctly on a BeaglePlay and displayed a color
> > gradient triangle. Not sure what went wrong here.
> >
> > Anyway, please have a look and test.
> >
> >
> > Thanks
> > ChenYu
> >
> > [1]
> > https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@=
imgtec.com/
> > [2]
> > https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powerv=
r
> > [3] https://github.com/SaschaWillems/Vulkan
> > [4]
> > https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@=
imgtec.com/
> >
> > Chen-Yu Tsai (5):
> >   dt-bindings: clock: mediatek: Add mt8173 mfgtop
> >   clk: mediatek: Add mt8173-mfgtop driver
> >   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> >   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
> >   arm64: dts: mediatek: mt8173: Add GPU device nodes
> >
> >  .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
> >  .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
> >  drivers/clk/mediatek/Kconfig                  |   9 +
> >  drivers/clk/mediatek/Makefile                 |   1 +
> >  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 243
> > ++++++++++++++++++
> >  include/dt-bindings/clock/mt8173-clk.h        |   7 +
> >  7 files changed, 363 insertions(+), 1 deletion(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
> >  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
