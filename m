Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364639;
	b=CGdWJMOuxDt/w0Lq76XGGsNliqY49erMoMJvOoujeT5Vm5XrBk7o9xWpFjdZmd1Lxy/F
	 Y5/WmPJCPfKvuHrzzV9PSBVbwvH4YK9AJQ9AFpTtPa/F1CBX9i/H2X/rtePHgQMcrIfbY
	 0m8WdbqKHsUBRjevQBvA1WVgPzDtPpsCKMITLnCe3lwhylWy+aGUKZLb/vy9PglksyGLc
	 30Murx8cusaDel9bgZgP9Gdt9dzOxewWLMRDCzTY4VjGZwxUlo5dV/9uN7VMzMA/uQBpv
	 FlLWONJ/McTwoavFPFFuNA14A1IcO2j6zZUmbKGVpI2xchn3oGPOouA5WjbgVkufm8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
	b=WuGWTf5aHLF4f8eyUKfMyObt9KSV1tROTNwsnLiX009OLElDCbpMFWYdA8koX7VSCiSm
	 KC3ZhAuCpPGtWBtlKm/2nDIp67zTdbo5hIbaapq2Z7QU5uyWa/yvIj4d+tAdCOSVh6CPF
	 zizcwKo4wiWnI7lKGij23WxsXpaGmolAy5YENmIqXthT1ay3kLuEM4RBJ8SDVyD0wHlSE
	 VHhAu0AFVXNzlH4wkORPc/4iLEn/jyK9tWx335Yc8Wza3rQRo2h/CBlxGxOcP7TGESjrO
	 8Zr9UoyG3ojDPzukabm9lmdS/VoGJJPNz2FvV3L6f9VZHPVFT0dFZrtw2ACef9TwDpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CswuN4e4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7B560A2625
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7B560A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CswuN4e4
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso900723a12.2
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364636; cv=none;
        d=google.com; s=arc-20260327;
        b=PVv5FoYQuaOt4S7Md/voqTHeSbfv6q2lHJlI4SF71Ju8LNC8OW8GRhAd9GOLrgGg6f
         1V3np2EmYuVVgKq1gHv4zaZpiM0Is6IniJnnhDQfIVSQaifAs2/lpiJdEHXi+z70HM/2
         WQpuhn9vRBkIA4QbbZ2ZYTeHF0hxCOA0YZoM/VRD/kJ2cUX5MBgt+uqXi68XcZn9YJiS
         jjn5UXVUCrkS4drSkzRhfY5N4D+xzuUvfVVzYj/twC8cZNBC0/KGvCYdVHGlNPVMu7dP
         tZsqjArogon5A0HjYpBDrQCQ+hQpRGMZW56pg3sLVhw/vKDJM5YbDzBEjFBOC4171Hkg
         TTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        fh=hQQRVytavPCPXUsUPUy4cL2IvruTg4FKp2rk3jgffgI=;
        b=hZJtdfPilbmxi9yNWrpsR51nuS0ydmWPgfLB64xkgz+Asz1LFvYb7ut0Xcp2qUOaeq
         VhZ2pCvU+jZV2OLPakOtbhPgcKi/Ff3iXVrZR/wTMr3mTKCK6Y+a7ODvjaBOwjAxNLiU
         7QdtQG2ja9j7rLiGq+oBAnA2VYYmw02bb9Yt2T5RHCzSWQ6SdqSobHSZQQ50effvUNx5
         sCKNiqcUVGcGmd5NwPDDPtBebAwEDSVxJwJZJqBdOdZD1gqA96bA0ZofZnBfc0xG9UUi
         58sN1U0csWEG+Yl3Ogwb0FNC6k+Sq6qGs14VsIXi+/1efO6SDjEBA1mn34vz+fyfQbjI
         yvCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364636; x=1793969436; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        b=CswuN4e4SFhY65NI69nl0lKvSPx7/6/t+bfGIiMz6r7+Ht1mJaNA0sot1+MowGI1K0
         f0OXoZcyZlsSF4f+3xZTO/IuR6bFuNrCZa2OCCgDu2eoZ9D8khmOtRCgZ0Wp+bZTXThE
         C4Td8iq7wAYo5YfYC4XsMDwP/X/O9TLiduZmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364636; x=1793969436;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        b=Q89265Y/TqbtE/rpYeyd4umWPKtY4cmgLivsYIUqtEJ8/KlptLUSOUWTRlDqrwZM53
         G0NdUKPf+b6vRRAXzpRgMsbBXcUY+Z2zWs9QqjTpa7/k0l7JGQSREQi1/0On1UHcOPei
         zllu3Zuhg28iM1smqQM98bcSjOQKLGEz39z3iYp+jeBpAwPDWT8Xk7+Tsvo5EurFcdH8
         8/AFojKB6VZ0wBD8R0ko6WuNP9219EIF/0qDP3bhqR7/OxWmzdaPK19yhqCgkrKzyJJV
         BH1gLPHpYjjfgW2hwH5V9ZyFGOhXTNWh7pu95TCpZApfvVdQEIS019jyiHL4fo6ZA5jI
         XEBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr5LBFbZtcEGtqQj12KY/Y8+UCzHNNumXQFiih/spas1bXa7CnOEFbZdaZBf/3mv1mgfnJsjX62q3M@vger.kernel.org
X-Gm-Message-State: AFq9FYK3PGa9akSEc5gg0Dlu6LJfjB3UhJ6jWY1CTjK0kDSjFtcPKqiK
	bJjTEYqfyfMgE5AdJc4kuSeYlJxyxIMOH2sFe1uYvfZCYUutg4heAL7XX3bg6zBOoxfDI9XBUGe
	q3DDYJIiFwB2Mvf2hKx48/Q+YzHE36o/1Oj1VBO2e
X-Gm-Gg: AYBFou2rukAGyeE3zJvSXySUrYhuzmVxyRQ9mUlIiZJWyrFa0ty33aMbVjHIqO9nz9X
	X669f9+E//i0sK1kAJQ5yqDjVp9AG4wRPiZNXO9lzm92owUIVlcf39teVnnDyzL7vFGZ1mTKOYT
	I+K18jMQW8uDwx96nsew/Cy5ghcBrXxJvRBM7Mb+KzHsJ9y2xoHt8H7ffVt8wvvuAVQDHNqM70g
	M1q8iGjPtjSrWqZkDAacvqUqf+xRBk2UN4uber93fpn1lGko7MGaVtT6bzfM5U1Pw4uRi8lW1KX
	aiqDG21a5/FdE6604mmXa0MNF/nezDERc9WFszrRTq6GhU932TlG7bMEdIBt1pofBUAnlMoX0NC
	dH704wscUblxnpyRjFvKltiRip9bc1oHC53pLjC8oCavOh7K/UY/6gvK77XTxcoTuGIspNHxU
X-Received: by 2002:a05:6402:c4d5:20b0:6aa:a040:cbd3 with SMTP id
 4fb4d7f45d1cf-6b4d337d51cmr1265781a12.3.1793364636473; Fri, 30 Oct 2026
 05:50:36 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:35 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:42 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-10-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:34 -0700
X-Gm-Features: AclHuK8Q6LSStP9w_jyKcuIwAnO4J0Fv84SaEEt_21aYQDW37VQYsqL6XDDTA-w
Message-ID: <CAFLszTgS0Bp9KncngS7Nw7A5dXroXywiDkoHfUtWpCEexecqPQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] fdtfactor: Support compressed DTB inputs and outputs
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Support compressed DTB inputs and outputs
>
> Firmware and FIT image build pipelines frequently store device tree
> blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).
>
> Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> file extension, transparently decompress them before factoring, and
> compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
>
> - Support `.lz4` (including legacy `-l` frames via the `lz4` CLI),
>   `.lzma`/`.xz` (via Python's `lzma` module, using `CHECK_CRC32` for XZ
>   compatibility with kernel/bootloader decompressors), and `.gz` (via
>   Python's `gzip` module).
> - Preserve the input compression format on generated `.dtbo` files and
>   compress `base.dtb` according to `--base-compression` (which defaults
>   to `auto`, auto-detecting from `--base-dtb`'s filename extension such
>   as `-b base.dtb.lz4`).
> - Report compressed size savings alongside uncompressed savings when
>   `-s`/`--stats` is specified.
>
> On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
> `fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
> (87.5% savings).
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md            |  17 ++-
>  fdtfactor            | 312 +++++++++++++++++++++++++++++++++++++++++++++++----
>  tests/Makefile.tests |   5 +-
>  tests/run_tests.sh   |  77 ++++++++++++-
>  4 files changed, 379 insertions(+), 32 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
