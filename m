Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829829;
	b=w0XdWmHjaI2zXrFBj+nzB1G6z3WEf0y2WVjZGvo0VSUbfIB5lahrE3Ma4fjOuJ+gZiFf
	 WUHQSjqGVNm2kR/jiBnLtSElcA4KKr7YDbIZDZfxIuIGGqG8Wi8yZsUXqc9fj7Hsr2GT6
	 aEP3IXdIhECEdOWmRxvRd7Y933NvpC+7p2EhQ0t9IM9gYMJFiaDIiybiR5JlZ7CtkE9Y1
	 Z0nbLhMPUoupAIi1pubOautV62HckIiIeHA5PH5f8/nZ1mJhp0rxeBp5n9RJSpdWsGb1x
	 /dNy3spRFhe/2/Hbt2xSknMmBms8C6XmvpbkxAoOh0tKU3DsME+UwHojy0AEnS1XSyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
	b=ixE0zJpsJBSSWCVhOQkdgUz5hvKxhqzh2qQKCLBxsI2XBemFfTvxf3pxN6EAvVAQaOM4
	 JzNW8g/jcWA9Kx7ZwB57zYU9gQhlEbrIFA3ghBcZnuYHsvu7l7GpWhp+BwQEpEEIqbNDE
	 TXhwSAIrkpMBLDgetRgz7ADXcgcGBK4ufjB70HpoxZwYGP9we6RwXyz+QCeCTQEAhlMZE
	 vRfZAxUR9T0YUBOg4LP5wgoCY86yL11WcDuc9wRdvDVxrPONwulpfdekEMB3tvr6eh1px
	 97JsTj9eurOsa0Wi9sWtSS0rtwV3y0Qs1vucR89wge1pWol9UpUnZfZisyTDKNCNlRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51C606A339
	for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB51C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2209384a12.1
        for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829827; cv=none;
        d=google.com; s=arc-20260327;
        b=eM/C9vGIoV8NDQtnEz1WKo8cHrkTjig2VRUjRu+ZPrmfMjMD7cbwnjMeQa9haGGucR
         DK9Eoy5YQADz8qhlo99PbgS9bZYb7+5Gdz8tygquEW9eK3To3GoS3u/MMa5Iy98a22S+
         MUT1f9i5dOSJAz4NsFRXd+Vd+etjB0jyG20R4tXnE4aH9H4hvVnLET5Rmzaih2KkjB6Y
         BgxpHJJvbKi2d/M+wEv/UrEP8cpE4bSSrWl+m6zWI3qREuaVH6LYZaSb+znZFUDAfHsL
         90Q6VsBzptUK7J8lMA7jWWixMq9lG64LbjpMzt0nlnV0wvgiGFiZGvKf5JHOMQ7Wl30n
         hUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        fh=KDzqhL44DMOPlnjdeYfSz0dMwUztn4z5/bTypASkzcQ=;
        b=YvMD/WJc2LTvYS3UHhzAFtorpGetC5l8PPfNlMXhAORRElX05r/OA8SvQvxz1DmZI2
         NzXqOeMPh4Hw20Dydme83Q6y/jxjjIy/yJp3oYxD8DcdBipcisOhatK3hjZfP+SqJ9mb
         9X/Qq7mpfL9Iz4Cpf9ZFJyXHcVG2NelFPLiFPLa4S5A6HpD6BzyFjTNrA4gBlQgYyDvF
         0+JiwouDyNZpqx701dKQ19QcvvOgDPi0Cu6wMsJt/Bj9fiacxw5LKLnLYTWmm/zUChSh
         XfHkc48ssuUhnFZc9RENPiUGuOvk+zmdiPTl0ui2Tv+hDPYx35PtcEvOndRDofSPCSF2
         2fxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829827; x=1793434627; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=QwTwqqUYzR4KMcjZ6tN3E7hw4q93B9dRCKd+92TnzApqiNKVxy9e3nOyWW54DY3jbg
         Ojsm+hc5971JCcfIrnwHh5AOki5VuhkbJKi2mOzK7wpGE4KFLMdJKywO6CuWLrvqLilv
         4iZB7FUgOsGFsggrv3fVelxSSBSYmX9hCrd+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829827; x=1793434627;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=SH+N1Sn39ZZjapqJuCAMn8SCITGeP8qwqx5tAD8BNc9Tor7hsbz5kFJ/+yPtvuIEWI
         wlJXr8ewfFBOs055uwxh4VV9ocww+BdlqTtbUG8esngmgUlF2ByuqJlC1SUa1UvTiloF
         T0c4dMWHexZOJbEsjobhseHHNk+RYQ4E0XI3S0dAovb+Xq15fN7mqroUEp+o+CdEYfwR
         3msHmWbZR6TyyXOF4YUksUNyHM/e0mVQPI0eoimafrIfzwCv3wvDdqX+gKTrhb2rL5D0
         Qmqv5CvXZHNNUSxW5sDOugXXPlZDIUafAIYKfHG5IIT10sKfxYg8gJa+JJrSxTGr1n+d
         wBGw==
X-Forwarded-Encrypted: i=1; AKwUvBxE2t4+SrFNdDCMl6+8j0JIJQZTG2aqnmcdk0zdY3Tatpu8TomFvQ4ovq00xX0+u5zyXr78h5e3RWLj@vger.kernel.org
X-Gm-Message-State: AFq9FYI8YV0fhl2mdeQHuybhIu6Tb99nlJ/sJMHbb7zubN7VaBIOkeTH
	4G2zD2031JjXccWl95YAOMUHgY16MRcR4tZsNA7BpJqLEXTKSOnDLPgiSr+UBmJgmz3SjsprnFc
	Y2giTgO8n0d6rUyT8ENcskh0dZMspcnCmzL/xZpP6
X-Gm-Gg: AYBFou1t7eGxsiOVUXf/ZJqgQ6vQGd4HSsK3EbYmleUNci0ivtIWH/zrTBxaPaNAQxl
	zYsbbqHPu9EUrfK3Bfupw6YWDQbtsn0kEsqYlhiYSEQ9ktayaQImOd3nmBOtnDDZKubew1BfSfG
	kS5QfNEJcWSVM0sYyWz48j9uFPpCfLbutVRt5rVzJQ1ydmoZkszFYxb0X7OahEtd/8GcDQ6Get5
	NTol+VsU8V74WoFNs8/dcxr0BRsN2ED1qKcZ+7lwq/+XuSfALFQNMG/EQpdFRwIJHJ0Qy1SkGpd
	T/2urBo0WsxjzUWxdWFfKywX63XWelzkU9pc6STOHAwFRR9xGb4wcY42hLe6t3jtBkt6hSlWtVL
	8ZxmmZiLZooZzFdTj00C9uTPJqBrTzg3bQUmC0dO9aGaNZ0QzAi86j7vf
X-Received: by 2002:a05:6402:e0d:b0:6b4:20bc:f94 with SMTP id
 4fb4d7f45d1cf-6b442fd5c0emr1861005a12.19.1792829827097; Sat, 24 Oct 2026
 01:17:07 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:03 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:35 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:03 -0700
X-Gm-Features: AclHuK9YCJ7Mk4mSQDTbJDAZNMre28fNrdZjyMOx5ekb1ShhYgH8OFHnaV7iO1Y
Message-ID: <CAFLszTg6B2p30-RcmO6fk+2mdHwSdghU6PXotz0m=gqdk5dRNg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] arm64: boot: Support building image.fit from a
 specified FIT_ITS script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: boot: Support building image.fit from a specified FIT_ITS script

Most of this patch is generic kbuild rather than arm64: the top-level
Makefile clean pattern, cmd_lz4_frame, the compressed .dtb rules, the
dtb-y filtering in Makefile.dtbs and the FIT_ITS handling in
Makefile.lib. Please can you split the lz4-frame and compressed-DTB
rules into their own 'kbuild:' patch, with the kbuild maintainers on
Cc?

>
> Allow passing `FIT_ITS=<path>` on the make command line (relative to
> either `$(srctree)` or `arch/arm64/boot/dts/`) when building `image.fit`
> to assemble the FIT image from a checked-in `.its` script via `mkimage`
> instead of auto-generating a FIT image with `scripts/make_fit.py`. When
> `FIT_ITS` is not specified, `image.fit` continues to be built using
> `scripts/make_fit.py` as before.
>
> Supporting a checked-in `.its` script includes:
> - Adding `cmd_lz4_frame` (`Image-framed.lz4` and `%.dtb.lz4`) for
>   standard LZ4 frame compression (magic `0x184d2204`) expected by FIT
>   bootloaders such as U-Boot and depthcharge, plus generic compressed
>   DTB rules (`bz2`, `gz`, `lz4`, `lzma`, `lzo`, `zst`, `xz`) in
>   `scripts/Makefile.dtbs`.
> - Restricting `$(dtb-y)` to the DTBs referenced via `/incbin/(...)` in
>   `$(FIT_ITS)` and automatically building the referenced kernel image
>   target (e.g. `Image-framed.lz4`) and any compressed `.dtb.<ext>`
>   blobs.
> - Populating any omitted `compatible` property on
> [...]
>
>  Makefile                 |  2 +-
>  arch/arm64/Makefile      |  3 +++
>  arch/arm64/boot/Makefile |  9 +++++---
>  scripts/Makefile.dtbs    | 43 ++++++++++++++++++++++++++++++++++-
>  scripts/Makefile.lib     | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 111 insertions(+), 5 deletions(-)

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -5,6 +5,26 @@ all-dtb := $(dtb-y) $(dtb-)
> +ifdef FIT_ITS_FILE
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +its-dtb-files := $(notdir $(shell $(call fit_its_incbin,\.dtb)))

Just to check, is it intended that this also restricts 'make dtbs' and
'make dtbs_install' whenever FIT_ITS is set, not just image.fit? If
so, please say so in the commit message. Also, matching on notdir
means a DTB with the same name in another vendor directory would be
built too. There are no such duplicates today, but comparing the
directory with $(obj) would be more robust.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -429,6 +436,58 @@ quiet_cmd_fit = FIT     $@
> +			fdt=$$(fdtget $@ $$conf fdt); \
> +			inc=$$($(call fit_its_incbin,\.dtb,$$fdt)); \
> +			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
> +			compat=$$(fdtget -ts "$$dtb" / compatible); \

A FIT configuration can list more than one fdt (a base followed by
overlays, e.g. fdt = 'fdt-1', 'fdt-2'). Then $$fdt is 'fdt-1 fdt-2',
the sed range never matches, $$inc is empty and fdtget fails on
'$(objtree)/.dtb', breaking the build. Please can you use only the
first word here, since the base DTB carries the root compatible?

> +		configs=$$(fdtget -l $@ /configurations); \
> +		for c in $$configs; do \

BTW, adding 'compatible' to the configuration nodes after mkimage runs
would break any configuration signature, since the properties of a
signed config node are hashed. mkimage isn't given -k here, so signing
isn't supported anyway, but a comment would stop someone adding
signing later without noticing.

Regards,
Simon
