Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004388;
	b=L6fvW0ki2VrQzsYwUadaASQo+w662XZaU+WjavNSzw5ojDc008g1CmhUsP2dVKXf7ifW
	 /9MndhinyJRG+Q33EYDFmZ+Ge9o474IHEeQFfZQ7bN2wLOmPVcDUbJeyGS59bubooE5tN
	 c6Pee2H/Ofq3pxphyty6qvfzSppcFytHalg7JeDSkt/A/AdkKfFCEXPNyBIo61q/ul+j4
	 JsgheSTqQMMouRId/QW6OkPGKKcKykNvmd/KtTbic5JMgCpGj5IMnJ8A77cl2diQJPKPG
	 3q5WG2UzFC1xqIm1dbzurNvwKDHDKIketOsziK2RPyVw0jmemLWlVNLXZmGYNKeTMRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
	b=SVw6Wg5455KRY+D/cIPL7xUpCC9X6OyzATCKJbPGluYioNdT1NAXsNFsxpJe6Eiw5uwu
	 XZdKnr7zB3UAxRSVt3w5Ek5j2Ev3/PANG61zpYVc9v/qqcmuQzvlyFWjDmijTS6YcR4vG
	 A29qQmyCBLFLXZsvBUB0uw61KG2Z3x/KZKnl+dZnK9m9J+Kpf8af7mMA/BHowoLfy3ygp
	 f8fizak9SFZR5qIRhAN+gWRBtQOX4Og3LBya+SDkD1BOOcH/rn86+KRwHmoPNY1Ij4KJe
	 p35nWPxhVPbtr8f2cNTNMeA25OACm8mburKmsK8A6NIB50BhCz8dxZp+6MRD1oM0Nkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KNGrYKqm;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3B606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE3B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KNGrYKqm
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so25633725e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793004385; x=1793609185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=KNGrYKqmfIoQx7G26nK+hU0aEiCpetb+aODEa24JtTAW1UqmeHkN8uRhPqBtcvoyIl
         OM+wsoA4rANZUWbhu+xg1RYG8r+spNwUHybHWEaYQS9F8skZl9NtRhDbMXaK6UpTAerh
         oSIK44IDmEf33YtYLu/VRTt4bz0bXGJHlkCz0H2A/NeXdLB1vepv5ExBs21q5Nl81TV9
         f3VGCHK7T5KM9xIe0O/ZkK0bqbaRq8Hj2wnqleQ9YPUnPXLuzQL4qXi/kEbypit6PmwG
         yJoAYoNsqvjaUBDMf+QucyHqNwXJMlO6Bo8O1RR6yKHzWMOzLSpnF48RXrYKj++avAV/
         uqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004385; x=1793609185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=uNREhjuxWkEfFolrt8kFghYvaDRUw+LrXH9QxtfPXkfImKu4CGIPiQNf6js19ZdnMl
         NQMAaoldGv7/8hjLb+SloQme7CprAVJkAiDxwKCCoaZ2vBbIO65dJmY8IzzOtNCKl2HW
         ODjoH+i+RC4y/PkGzM7UAAL9cxWy6ed/c/eY4nFfRiceSnwn9/iit35PE4tRNJ9sKof/
         r38WhelrMwXB2s4crlT0leqTvT5M9pV4g5FmNMLSlCgYMuO2no55SfGajuBJO4AMwdUZ
         hEU2Iidv/RVxp71QLNacP2rKzvJ7qHRZ1JBjFSL6fabSHrDH/gccHP1FYdrsi2c1ZgHL
         jDmg==
X-Forwarded-Encrypted: i=1; AKwUvBzTgWC5H5ZD2L4AJspooWVjIiEZUBhgNfFdt8bQZ/i7LHHOGK1Chfpq46Qx8bxTCjYjgQHOkzcw4cwR@vger.kernel.org
X-Gm-Message-State: AFq9FYJyCqbJwJPJ7BHtzn3E2XxYwEWt5gAu/bu6XSP7Y6fdKLrt4lj+
	lOk9aHldtNAm1tG+rDBDvUjKWYgn86IleX3CKbw3o7XalJgnHrSLsyT1oFkDaILOakY=
X-Gm-Gg: AYBFou1gSrNCtA5x56vo50fhYxfR/fW4wXVcvZyjJbjRwHtJQ/gXZOCY1o/Rf4rSP4a
	J88snIyvGhPAal7YKeK0z38bmJ2PnGwci6d/Hp7EfyK6GOM4QtUu57XsfTVUmoBGC1dSGG8WIJ9
	RdKrOfcoXq6Ki4UzonFzj2L+GFmyLBoksQa5uLu7vhnw/AJXQuAvh/u0B5cA5KroS1MDCCMPd0A
	Tdajg6dFIlzPegBsGMf89vFT0ZEmw2BsmMPmydv+EZEiZw2sL8Sup5OyrUbyp1KVd5Nj4GEvT6B
	Nyeo5ip89xKLrTcnwHQa3ks25S6h7R8UDRf2jcLKGYUnC3be5gkESkJBYzhSW04fBgHNt0abWmt
	Zfub7qrNeSpQlCWMmMwYjOO8iDpHYKzPdP6eOlpy/tGN6viTGI0l+T0kili7NsiPBBQEuGLTALO
	D1yQnNTdhMyKawlJVGs5RrbISYjEzpV8csBJV6lOU5jdbB5ovfg9/rfPDhsXRbXo4fjkZx8KoJ6
	bjdDf0dIXxSuvdQ4i5N8mz23S9KpGGQsplVeJ3CCvjFYXC485OYGHQUOYDprDoVo79/Aa/1aNo=
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr105232365e9.3.1793004385073;
        Mon, 26 Oct 2026 01:46:25 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm146277845e9.2.2026.10.26.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:46:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 0/7] Add support for S4 audio
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:46:21 +0100
Message-ID: <1jik2okfxe.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 25 oct. 2026 at 20:23, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> This picks up Jiebing Chen's "[PATCH v6 0/4] Add support for S4 audio"
> (and the tohdmitx S4 patch) unchanged apart from rebasing, with
> Jiebing's authorship kept, and adds one fix on top:
>
>  6: g12a-toacodec: fix the S4 source mux read-back. The S4 DAT_SEL
>     field moved, so the mux always read back as input A and DAPM never
>     powered the selected path.
>

Jiebing has posted a v7 already.

Using AI is certainly nice but I would advise that you slow down a
little and get used to working with the mainling before sending 7 series
in a matter of hours.

> [ckoever: Jiebing, if you have a newer version or prefer to post this
> yourself, I am happy to rebase the fix onto that instead.]
>

For example, instead of this you could have tried to ping him privately
before trying to takeover from him. He would probably have told you
that he has already sent a v7 and (I suppose) is working on v8.

So please be patient.

> Tested: HDMI audio up to 192 kHz; the TDM-C to internal codec path
> plays without errors at 44.1 to 192 kHz (not listened to).
>
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
>
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
>
> Christian Stefan K=C3=B6v=C3=A9r-Draxl (1):
>   ASoC: meson: g12a-toacodec: fix the S4 source mux read-back
>
> Jiebing Chen (6):
>   dt-bindings: clock: meson: Add audio power domain for S4 soc
>   dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
>   ASoC: meson: g12a-toacodec: Add S4 tocodec driver
>   clk: meson: axg_audio: add S4 support
>   ASoC: dt-bindings: amlogic,g12a-tohdmitx: add S4 compatible
>   ASoC: meson: g12a-tohdmitx: add S4 support
>
>  .../clock/amlogic,axg-audio-clkc.yaml         |  18 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
>  .../bindings/sound/amlogic,g12a-tohdmitx.yaml |   1 +
>  drivers/clk/meson/axg-audio.c                 | 165 ++++++++++++++++++
>  sound/soc/meson/g12a-toacodec.c               |  51 ++++++
>  sound/soc/meson/g12a-tohdmitx.c               |  80 ++++++++-
>  6 files changed, 312 insertions(+), 4 deletions(-)
>
>
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
> --=20
> 2.56.0
>

--=20
Jerome
