Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6623AFCFA
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785972592; cv=pass; b=E6mmZ1Doot0oFycmJ6MJJqYisP65LQlS9PMVzBDw8ZC3VI9uAqKapih7e8hH/jtg+/ovgKbYOMCUlEoqtw9dlvkPOjyWeELHBpX/x/QLcPBEo+7amnbwUNmcR2yx0GVYSAyM1kiHjgvyMmDNthvHucxq3RNhpX4Wg5RVzX8vxDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785972592; c=relaxed/simple;
	bh=+luMkJtpQe7ID5UVfqLlRQ2UR47TT/rgDyatf9qK8mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EB1pq/OxXa+JA2IPZqUlb0LNRQD68WH3SWpy6o3p/Zu3s3gvranEW06AHKuOxhIPZc7HWM6yKB9onh2ZhYPpX1+UK2052ksSRX0ptUj2y5qqxGw5o0+z+fK6isGF1B5AMqWsznQnNpNh0Iezd3YgUzLyQIWsecQTnvew2cHNRyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZEapCQR; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZEapCQR"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso2250142a12.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 16:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785972589; cv=none;
        d=google.com; s=arc-20260327;
        b=BNS5NgPJJJKOeW+aBzLzY0x1P0YM4Ub/bwwDnNPkdQsd8L0PmUBUiegGUtnDrR3xhg
         peVNjXDROsfaOg8NMg2vDNF3R8CLepwfKw+agnEigWMX7PlHK8ScW1j65IRdsChF2yGF
         9hzJ/Wf1WzT3AYdYoF+mTeY1+Da4QORhZhOQxgneMVrgwIk1wv7eodzqEva+bvVLBgf1
         HCx6UYuClqHIE50kKHrjiIcEOqoSmdDgXwBgoJG8SaYdNS0UdLeA6y/RsGy51W4nc5hF
         4Tojl75f9a9GAm0veVHiCnvoObVWgzB5hQfk6RZ+ETyduQGrExDdmDga8d7clCemh6ux
         5Z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MTSoKJ2hblhaC6ZNsPcka3G1aJYd4eOopX2GWEssqdE=;
        fh=x6ESYQaUGRPmTP4ZRzxYdfbv0IGgwF6MCJ5Zs6gs6dY=;
        b=buZ+/L3jDN1A1N6XknSm3MPgDvtNibG5LkQdW97kBUmv6JWI41+qLWnl1WmA04eImF
         1aavqSO48ZlLdxNXEpmyZBWQJG47MolTXkUK1hH0MESu9ogxkIMNs34z3T/Ln3iELQRx
         JSGrADKE9pE6Bq+g69BJAICItdHAZtmIH+L1qpdMaSniyFO2bYVqEDU0D+W2RMwOaHm9
         114L/Tnh4uapYlaWJM7UacmTlm7aozWe9OGpp9xLm/eftcBqPUlLMjsO11EQr5D8l067
         59nDPjA4bdKjJC1/Vj+X2TL0nr+sNnKHxE7TTdWaDFuArrJvm3yK0PrpxOIjkyl1dwvI
         64Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785972589; x=1786577389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTSoKJ2hblhaC6ZNsPcka3G1aJYd4eOopX2GWEssqdE=;
        b=dZEapCQRb3FHxW+AwJJ1zk2gF62Z+BFwFnp33qAFqx1o0pVVlhM6VvxJ3hPl9Jtfae
         /4UR/Z7ajy5pLBxXAK43RHgSSXIgi+Z2QUwOJY0Mi3MQ6msVDHxNDS2qhw0CHWS7HjXA
         DkLXQoWWlXzrOFODNZ9NUhsXmrVNr/dklBDEt3iWXOJNgRjuVaJijD6mrCZ9+OCtOExG
         8ePHAcIHb4vq3uzhSRXmVkykxfPSnjJxwag4OgPnICEQRKaD0CGHVJEMiFpY7aSZeBf3
         bOTv+ETqwZuLYelP9uB73t/7Z10Wt2s8yPX8EkwCn5ugvcA6BvWg+bupn9XkGgINA/9O
         +p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785972589; x=1786577389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTSoKJ2hblhaC6ZNsPcka3G1aJYd4eOopX2GWEssqdE=;
        b=OAFSscPogwORbxPXMfC7nR4WWkc1OK/YCT3MePzpf8UaC5NAQXBGRiZbnk6a4tKOR4
         Bl8UGtmevwpg72xB9M0ZaEwa00qlFieH3MHkKn9DT93NRgNO1UntzhR9mCmEVU0dtlgz
         CZBXWkxMz99Tz2awid/1KBf6xKd7ams1URmvx5lBNLmQ7EWOMXtNpW6ourO4fqRE6xjv
         EEZ5IpjWbwa4nVlp14fNw4ptSFZaPewvAgV/LArMm0m8M0EvnbdfppScLRA3YuxsK9RX
         OTvLk7ztSPXUw1ZlVFaewjkvEMIBQ+au3sQ2YSzi2b8N8NueK2TzGZ2+qFTYa+4RXAFh
         IoNg==
X-Forwarded-Encrypted: i=1; AHgh+RqiZL6eGBMxqE2v7z+RXJXTBVNJrm55dmYHMmhOZo+p7blwwaA6Q88mP8WZNyBCBQQ3CqAzVJ+Gp0Zg@vger.kernel.org
X-Gm-Message-State: AOJu0YxK+XQLGmGG3z1T8qEDQrxbH9wYuY95Pz9TTs26dDtvsDNtsvM5
	GcQD61thWdU/Et7Q6/M+B0UhZ5uDywfBWYRzy56fVch8yks1sqDayVsgNgBg1Rn+okPv7n6HUIY
	0YXYk81IMSy581WPshI4CM4V+KnS9/hw=
X-Gm-Gg: AR+sD13nKrFgfZRz9/VCiVoUWVG+twz9gdVGRIgxRDqmz+rh+7zErtVDJri1V+UXJl9
	Wyz1v2UMRyTISwHaUPTET6OjpzJbBdjNpkbb45cznRlNStfybiL+sVloH9QeJ7F74aZyIHhzn3p
	PD12h1RQ+F3QPxH2v8UEnFZ2s4Qgz1BocaoxBJ+na7t9QE2FmqtSH1Om6bYgZ5t+VBJsiQ2E79a
	bvC5U3iiHWP66UCjm8XxCDOqREas5lLFckAX53TJy9eQzmGxZtG2J5D+WdJlcKTRa9Ha0s6zL3j
	GNwJIT+9BD+CkfENo17c/RoOnHMuqzaf2bx8xD4CHGop
X-Received: by 2002:a05:6402:c45:b0:6a0:8885:e6ea with SMTP id
 4fb4d7f45d1cf-6a14f0c51dfmr5738361a12.6.1785972588952; Wed, 05 Aug 2026
 16:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804225617.264861-1-maximpedraza@gmail.com> <20260805140941.GA495716-robh@kernel.org>
In-Reply-To: <20260805140941.GA495716-robh@kernel.org>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Thu, 6 Aug 2026 03:29:35 +0200
X-Gm-Features: AUfX_mwz5ayJK-cjMOmnYRs5QzSleK6Vf1I78jG8sHW7TJviplVzPHQLkrOC4xU
Message-ID: <CAEUXW=HQA7Hwo7m1s5=6mNsbLg3doc4rgg+_+6tTPD2sUxTQdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Boot logo supplied by the device tree
To: Rob Herring <robh@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mi=C3=A9, 5 ago 2026 a las 16:09, Rob Herring (<robh@kernel.org>) escrib=
i=C3=B3:
> Why is this linux specific? Don't people want to do a splash screen in
> u-boot or other firmware?

You are right, and I had not questioned the name. Looking at chosen.yaml,
the split is clear: the "linux," properties are kernel-internal structures
(initrd, kexec handover, the UEFI memory map), while anything a second
implementation could reasonably consume has no prefix at all -- bootargs,
bootsource, stdout-path, kaslr-seed. A boot logo is squarely in the second
group, and simple-framebuffer, which this sits next to, carries no vendor
prefix either.

There is a second Linux-ism in there that your question made me notice:
the 224 in the format. That is 256 minus the 32 palette entries fbcon
reserves for the console, which means nothing outside Linux. The 32 entry
offset itself is already applied by the kernel rather than by the binding,
so it is only the limit that leaks.

Rather than guess at the shape you would want, I would rather ask, since
both the name and the format follow from your answer.

On the name: dropping the prefix would give something like
"boot-logo-clut224", or "boot-logo" with the format named by a property.
Is a bare, unprefixed compatible acceptable here, the way
simple-framebuffer is, or would you rather see this described some other
way entirely?

On the format, two options that I can see:

  a) Keep a palette, but allow the full 256 entries, so that the limit
     Linux applies is a kernel limitation rather than part of the binding.

  b) Reuse the simple-framebuffer vocabulary, format =3D "r5g6b5" and so on=
,
     with raw pixels.

I lean towards (a), because the palette is what makes carrying the image
in the device tree viable at all: our own 800x480 logo is 17 KiB paletted
and 768 KiB raw. But (b) reuses an existing vocabulary instead of adding
one, and if you prefer it the reserved memory form still covers our case,
so the in-tree image could go entirely.

I will follow whichever you think is right; I would just rather not
respin the binding twice.

> What does /options/oem-logo look like? Why can't that be used?

Two reasons, and the second is the real one.

It is fixed at 64x64 monochrome (IEEE 1275-1994), stored in NVRAM. As a
precedent for "firmware may carry a logo" it is exactly right, which is
why the binding cites it, but it cannot express a product logo on a
modern panel.

More importantly, /options is the wrong node for something the kernel
reads. Its own schema in dt-schema says it is "for passing data into and
between firmware components" and that "it is ignored by operating
systems", while /chosen is firmware to OS. So the oem-logo precedent
argues for the idea and /chosen for the location, which is where Geert
pointed the node in v2.

> If you are going to put it in memory, why not just draw it into the
> simple-framebuffer?

I did not know about simplefb, and that is worth saying plainly: this
started as a patch against 4.19 for a product, simpledrm did not exist
then (5.14), and I never went looking for what the alternative would be
today. So thank you for the question.

I spent today testing it on the board rather than arguing about it. The
result is that it does not work here, and I could not make it work:

  - Added a simple-framebuffer node under /chosen pointing at U-Boot's
    framebuffer, with the region declared in reserved-memory. simpledrm
    binds cleanly at 0.62s and registers fb0. Nothing is visible.

  - The panel is dark for that entire window. The backlight is a
    pwm-backlight owned by the panel, and it is drm_panel_enable() that
    calls backlight_enable() (drm_panel.c), which only happens at the
    native driver's modeset, around 2.2s. So for as long as
    simple-framebuffer is the only driver, there is no light.

  - Forced the backlight on from probe with a local hack to pwm_bl.c, so
    the panel is lit from about 1s. The image is still not there.

  - Disabled the LCDC target module in the device tree entirely and booted
    with clk_ignore_unused, so that nothing in Linux touches the
    controller and it keeps whatever U-Boot left. Still nothing.

  - Repeated all of it with simplefb instead of simpledrm. Same result.

  - Read back the framebuffer memory through fb0 after boot: all zeros.

So the pixels are gone by the time Linux can show them, and I have not
found what clears them. I can say what it is not: not the choice of
driver, not the modeset, and not the backlight. Somewhere between U-Boot
jumping to the kernel and simpledrm probing, this platform stops
displaying that memory.

One smaller thing I noticed on the way: tilcdc came up as card1 and
simpledrm stayed on card0, with no conflicting-framebuffer removal
between them. Two DRM devices with the real one second is not a state I
would want to ship either.

There is also a case against this that does not depend on our hardware at
all. U-Boot's Falcon mode boots the kernel straight from SPL, skipping
U-Boot proper, and display initialisation normally lives in U-Boot proper
rather than in SPL. On a Falcon boot there is therefore no firmware splash
to hand over and nothing for a simple-framebuffer node to point at. That is
not an obscure corner either: Falcon mode exists to shorten boot time,
which is the same reason one cares about how early the logo appears in the
first place. A logo the kernel can draw itself works the same way in both
cases.

I am not claiming the experimental result above generalises. It may well be
specific to AM335x, or to how our U-Boot hands over. But on the hardware
this series exists for, a firmware-drawn splash does not survive into the
kernel, and the logo has to be drawn again once the native driver owns the
display. That is the gap the series fills, and the reserved memory region
is what gives the kernel the pixels to do it with.

Max
