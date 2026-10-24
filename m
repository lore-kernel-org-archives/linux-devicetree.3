Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829840;
	b=bDLJPbwDf5lF7XVI4WkkOjRFeNBOvIaP/uUopTTcK8TwOifCN6NKCZTAryQbv2RBGmSd
	 H7qe6jQz1Xmyo5JMdES4BINc0QsyFPZGjQvOPgeOhHfSN09N3YqI1aYhmsQEGA69KPl8V
	 daduuYaMyHL3DAJkWveoJltqiwajK95ttqMYMWQNtEK+8xNA5hWIGT3vrHeTq75Lt2O95
	 rW8nDkWE9hhZrW/2JfJOjUzm3M0M4x+DTkpZtvoIex6IbZ6i3vZ0cPyheuqMr7b9VMVwv
	 V4a9nM20UVHdAWvIvNr3A4U302T1T/EJtvQhJML6tTHkRh+CPFMI3ypdngpeIoNqDkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
	b=lL6fdNif2YD6vU16sKhUiKuARwZAjVvWolKmacjchaemA1kI89WX4bXkZZSkLFKexRGV
	 +MoH+icprxwsc2XktaNeH1xTtHj2Ivz6KlGIwH2P8xZjwgvH/aOSDVWIJk+CyqTHohwS6
	 ahT3+lgjq1pJpUP5uAOY1kVCC4GXZGll+VnEOeq3YYkGaXoEjE54DVKBAK4D2IXRkYMKX
	 nfZDnWjDDdKc9cGAKNoRy/C8D/mPHMLsuvqPvWWouMqpNozztVSv8EiN2q96VjYFZAv2N
	 ejWlmjMsCy7xVSivA3+2Sk2Db7TaO3wDOW25CgzS9gaMVhFEkQu6Yagf+hHCo4Ts12g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0718606A31F
	for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0718606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd633ef819bso650054a12.2
        for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829839; cv=none;
        d=google.com; s=arc-20260327;
        b=jQWYUreUYB/EZ5FCaEJQTJb3n4Jcw0vbZdHFO/zdjeeqZN9FfTPDT4S7bIpqtl325t
         3RM9DCzt4YZUhHKjWT5nNl/HVDgE9eoWmuI7jyn9DK+E9E+lTcEEVLprWysSRQn1NXaS
         Iq70zPprBwlHBPXnY8VIgqZieqNM8C+wNyclIN1hXnkSBFTSOdr0+sHuuiyWs1B5ALNO
         fkquBjEWeIvsFpi+k7nVobol+wyv8BWm4X15fYQS20SWwMw4HQ4xUphNV6Hn6Xw8fqGB
         KjIeqBzyDi6p8g4ovQGon5uKbIoUa01SIhSP8ej3eBnJ/AZi3yuxkANDC2Lep1neQOAH
         pzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        fh=TF54hso2HL/oXeriMhpJmc/6HAmmlHOS/7FGKzW0oUM=;
        b=Rhag+Kin/kwV6cyr3nHyY3XPOQ6RoA+CI2ChO+AEe0+kafzSs65DhoYebk0BFmO0VV
         c+614eA5erkVc08PZSKtnPy+JjEkXa3q/dzS+ibElo00Zavik3RBzByca7zXG9iz5gH0
         SioU5E+MRkU9pZPL38QHPJR02JW7ugb1PE+qglMdsp/ZxT1X+IAmGRmVRYF2yoVsfmrC
         bFsvSBwWXDqQbhAMa+vpj/TzU2zumd8BToT98DE9xYyqmj1l3dDMAjFztQScVgiIYHBw
         UCXovN2ADECeibtNsJESTlyM56X5z2+2VaVPQlZzT8PlX39JB1ZBiE2VcVtKjFjZ/2zg
         sPbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829839; x=1793434639; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=ErxrGqoPZ/nb9CghxeboTYWi19dHZA+oLth5nqNwXEPLgCivWeROkUq1jgI00pLPis
         mnvEJZESOATfA4bwGakbWHbrbZfTg6q/+BsXRBGx/nCeAqO9mecP3eklEPue7ZRetFgl
         WAQbY6p0/CHxOoA6764p2Z33kLx+HvfLIdMSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829839; x=1793434639;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=MO2fcA1LR0dN8mPMj7kyhiCvmIb+y6dRCdZcQmxiUi2LSupSwAtRwu/yCuzSD/6ueX
         PwT9uO4R/VztP8Q4R+5hYu/uRC7VbViWJaB8Wu0vxL5mRheCS/FQdwYRixioIhrxaU38
         l6Ty5aVUwzK4J4KQNSQyOUfqCJP2ZsnkjUEi7SIMU9t4YsZOdMWQQ04MjsFrAZRLtqII
         AzIFB8uEQSd5dC1EuRa8wA15ggXMMCWSQnTlSkYWki7WAi5A23+3TvvvzbGMGymBcIkN
         FFwTYEholqeFiFWzTD30rImswJQt1detsqC7//cUW/xxuqJKPG/awBYddc2RJb0iChcD
         v2qg==
X-Forwarded-Encrypted: i=1; AKwUvBzCQxTPJgnf4zdij75iVy4n6ShyudDQAVFOY3RYzFWy0RpcDvqGdEOLg7LhnpVLN1osQKP+jKFjIZIl@vger.kernel.org
X-Gm-Message-State: AFq9FYLSJcgoOv1PfYrf7jsDV7hz1Vsb+owwtes6uFuqFCPcojRcBcMv
	Z5yKQ6Ez5Sf5Kq+RIoC+3r12XlovS33l0jUXsWJlkCWat0SvPmij766BJb+tmGtt/M1NrF5AWJB
	nFp/fnBWMTbjjOU+jUHOq8iz7dTlRDjcMBk/5WmbI
X-Gm-Gg: AYBFou1JLlEQ7UkPX+izrXMGU75wwj1Yo0OfWDUhWNvIhbTekEC2euzapCU+7Oym8Nq
	y/0wLq3hP0XXNjlFKK1QeORku35z8ISDOHgzHkxaOIgfXmhE5Os/MFLbkqJf8wPgwnHeZWcPnZT
	oNWlqk2RNzxMGlzayVATRCjgTcJI6vgdmxvoMO8XH52kPDMGGwBLnEGu9UKevlhOhv8E1OyWsSj
	ChXpx1BQnlO+7cF5R/APjaO5LBYwAGf1HSFMlfdRVjjTF09xPig7OgdMA3MRvZ23zWMeUfNAqnk
	KcfCmJMbrZSss02Ncv6Q53SJB9nWJg/MFYqIB85N+F5eMWlNmW/e3fAnoFagYnVqkf0O+q1MBGj
	nqKgYPrZ2J/pVRkS66EoRgBOfQFQzCz/w9LHb
X-Received: by 2002:a17:90b:2891:b0:3ad:4a8b:c6e1 with SMTP id
 98e67ed59e1d1-3adea9dca56mr1447422a91.19.1792829839011; Sat, 24 Oct 2026
 01:17:19 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:14 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:13:02 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:14 -0700
X-Gm-Features: AclHuK-tg0PdtuvuCVecn4H2MwI1d9lfukkzfH1KNqgDlJ_Y2JdAvjK8N50Iivk
Message-ID: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
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
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
>
> Add opt-in support for factoring the DTBs inside a compiled FIT image
> into shared base DTBs and per-board overlays using `fdtfactor` when
> `FIT_FACTOR_DTBS=1` is passed to make:

Please can you add a short paragraph at the start saying why this is
wanted (the bootloader needs a base DTB plus a per-board DTBO) and
where fdtfactor comes from? It is not in scripts/dtc, so someone
reading the git log won't know where the tool lives or which version
is needed. A link to the dtc series would help.

>
> - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
>   included in the FIT image so they retain `/__symbols__` and
>   `/__local_fixups__` metadata needed for factoring.
> - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
>   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
>   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/Makefile.dtbs |  8 ++++++++
>  scripts/Makefile.lib  | 18 ++++++++++++------
>  2 files changed, 20 insertions(+), 6 deletions(-)

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
>  MAKE_FIT := $(srctree)/scripts/make_fit.py
> +FDTFACTOR ?= fdtfactor
> +FDTFACTOR_ARGS ?= --strip-local-fixups

Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
host. So FIT_FACTOR_DTBS=1 uses whatever fdtfactor happens to be on
the PATH, and the build does not depend on it. Is the plan to sync
fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
be worth saying so under the --- line.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
> +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
> +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> +ifneq ($(FIT_FACTOR_DTBS),)
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +DTC_FLAGS += -@ -L
> +endif
> +endif

One thing I'd like to check is composite DTBs (the foo-dtbs :=
base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
is that fdt_overlay_apply() merges the overlay's __symbols__ into the
base but drops its __local_fixups__ after using them to renumber
phandles inside the overlay. So the __local_fixups__ in a composite
DTB only cover the base part, even though both inputs were built with
-L

This doesn't affect lga or trogdor, but the make_fit.py path packs
every DTB in dtbs-list, and qcom has lots of composite entries
(lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
to find phandle properties, it may silently produce a bad overlay for
these. Please can you check this? It might be enough to detect such
DTBs and skip or refuse them.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
> -		done
> +		done \
> +		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
> +			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)

Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
nodes with compression = 'lz4' as in sc7180-trogdor.its from patch 7?
If not, FIT_FACTOR_DTBS=1 with that .its will either fail or silently
skip the DTBs. Either way, it would be worth mentioning in the commit
message.

Regards,
Simon
