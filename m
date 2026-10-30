Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364640;
	b=EP/C1AqV6n1MH2qIL8H700btNc+V6ACsfxpieXV4J06ZgbB3KNi/BK/8ck9nuA9RRzSi
	 i6I4mbS8N/Wxjpe2iVSuF4dDt9GqNSqwAD1V1ZkRQ9Tx7cOZ6yjlfM55C1x8XBk+CYxQ5
	 XRJhRqaaxvwfosHHLTmsXy3614xHFdbq9tK3pB+HcpGih85IGwDvbaUwBcZgBCGQOYH1T
	 G77ZvRewfzXsLVAwifrVFttqKvMeYW0Y8IlAn6ROQvMr1OPgKG7wKXwQQBDrzKtZ4MSKo
	 NRPn9x13XQnG+6I+41q0sz07v8RKseRYh7oMYj0A0lrkl70TQbmH3EUM+oFDb9T1oVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
	b=MVialGnBGpOCgYan1HkX1S4GpC6vl79nYYVJ/mo7sZN/+z3blsQd/jatvFItzkXSow/A
	 sRiiJDx3rKdnye7apC4lYgiHrvBB1+W6BDrV4ENdJT30ZfPN+HUJQOZ3htKexLUSj2/vv
	 b9GyA4HSIJxY7wUryrsR/I1GSRBztxqimvEMl8sglT60T4+CnpYeHc2c1Hgqna6jRJRV1
	 gd9qS5Nv+BFmfEbPfQX7O6E/P1FrC5N3yojf4dDiAXkeXyeGQjpXhwxOx6v6PdNycXaGn
	 d4PAibniqNpcWdcwhozkV0gaUjWh+HWwc9/IffsNHG+AtolEcjD5aShSgs4n0b314xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DAZ7mjsm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330C860A2633
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 330C860A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DAZ7mjsm
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so1137468a12.1
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364638; cv=none;
        d=google.com; s=arc-20260327;
        b=KMJPlKcbDSeImbBGXdmhG7V9muGkhylU5AVY/UbwymQMqSqWnEF0UdwDnncNdcVLfJ
         vAKIPGCsRJjvMTHr9zDSX3gwFdGSvVz2YW+cetdpCfCie8E/kV8UVTY3H0YXujhatYCF
         5SUoxl+OxAjK7WO7AezTvlpuLmBXQAeu2+1c2BqzuEI0BJ4a3LzBeWb7MaKdoKmU+knm
         8Q/hFX4U3Ued/qw84dk1up/suV6Z8JCKlD6KdZqAGP80ZQuz3+sb4MdKNlCdaDamGSBb
         fvyS5z0QffyHM1epqCIqVLFk13oReqI9d7hvcFT9tAIrl50pXVmYQkEoLlM/TOgrZt34
         +Apg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        fh=FbLNSeGPtsPxbQiUldD8XJmGREYj7fHMNfKWfgmchoI=;
        b=RxNWa0s72eYgS+l56araLxpoUAdWy7kD/lKRcdcImXgqN83v1vkZbnJ1uleopAaw3Y
         gdMSXu5me65p/H1JP/R2rJhZJ+y1FFS+XVbKVBMzs3t5ZMI5VwvYjsHhyUqC2AN7oMLe
         85ANQV1MoDzhm495p1ptExrdE700u/gn5jA0egMAST0HJ4UH8kxooqFb8z2zfxWMaBK2
         6Uh/Ncel45WdkD1hkVZARyRcbA99Ur6y6kiHWP+kiJaY2sCWbizliyMK1mLSIrN0+K/g
         8FNvvgP8M21exShVkm5W2bRzGeXmq5SwyTvhqUIT6ebvCbx3xaA3ad2/hOKtfBRjxrdc
         y8sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364638; x=1793969438; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        b=DAZ7mjsmwL9JHETg8ic2D7uVJPW/H86iM+OjshkUscEZXRjPvGiABUa0n/dop6UeP7
         6DEtoy51xJlFvCcR8RyAH0PgODy3FzHIvo5oLRbh/lVnbO0L05IsS2bT7xEnrLgN+OHG
         FQ3T9muyET2kQk6nKK2NH+rSqEyyOtIK2R86E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364638; x=1793969438;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        b=F+xIQvsumuZrkMh8OJ8669R2kz/E640Fokg7CkmxXCmo25Ttuip4OirQa3/8FJK2FX
         qxgD/S5UqcDb0Ve4XaV/OF7Wis0tS+BwH/q5voSc+eOME7s2XFKsf64ROXrE0Vd2e42N
         1SWbz/kyJeA9A7qHkCNIxTbHPS/rcwxkf2ADBiDhXEHOsV4bJ9yE3uQgmBblHbbDkP7x
         38vTylHQ8aYdUDpPQP5mSkS2JSPTWm5xRhCRt/B4l3a76jsychrQkIZDF+aoXJchBcln
         GSkRs15cMIEO4fYgVRNRDn9Pejt3FUa1KwVNtE7HRN8JciDJSGTTgQPWxCwdJZIXQxc6
         ffzA==
X-Forwarded-Encrypted: i=1; AKwUvBxnfl4uw+BxmSm31iH0128pZpw2lz7dW+JYeR3nKgRTHaEpMU2NgyIJYNUtbxgRsc6pAfwbr+6qdWxe@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Fl+L+wRu7d9OpfRnuqphodE9e7bkT40RxYa+GShPXiZecZ0A
	23FLBCguWrCUp8Yadg7Y85Jb+dH5pfm/f8I/BrU6S8oenoba8PbuxXDjva2DSBznVUuLNWylOh0
	qkEheRbpH+2Wi0f1ES+kiZNMQWWPB2HS/nECAoUsT
X-Gm-Gg: AYBFou04Bh4pCJobXcb0ZbC0yMDdixYKE72Skevwteqwq3nsMKiWrZDd7jCaAx6waA8
	+gvfNZbhaIomWrB/3m+V9YsPTX47i+lUAVe6eWEwNYtZ4VJ28o/itPURg/hVl0a4GK1rkNNUyiA
	rPFeLzTy5GA4CJuBGRA55iVMmp6eSxPnmNYWcqGeWnLJeLOVA8HFRHCkJOIRjNhlvFf6BVy0AD7
	QIwG2PrT0jo+eOtQKU5FGDseqARsNxud9wC7oSDf0/hNS0INbdaptw0ZL4eyfAmSwrzAFM6ncAE
	eIr/HAn6bZde0+v6hFeOQckYjw6KkXXhpOJy5l15ucIGfCVDrrqbU44dNKOC3ikpHDy2T+UCThd
	6peqrYCwzY6s302KgwSF+yIjRtn8EWUKDdeJaxFEoLBBJypNTi8kcwIj8EIyUAsCVe2T1T+E=
X-Received: by 2002:a17:907:1b0e:b0:c46:a5bb:5740 with SMTP id
 a640c23a62f3a-c4ca7935979mr211532566b.5.1793364638552; Fri, 30 Oct 2026
 05:50:38 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:36 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:06 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-11-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-11-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:36 -0500
X-Gm-Features: AclHuK8TuSBAtrZecOD2tH8pJthaXl3o4LfHFWTO4xNv6q-hCysffxjLZ6tbXlg
Message-ID: <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] fdtfactor: Add compiled FIT image factoring support
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
> fdtfactor: Add compiled FIT image factoring support
>
> Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
> Image Tree (FIT) images to bundle a kernel image with multiple board FDT
> blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.
>
> Add `-F`/`--fit`, `--outfile`, and `--single-base-dtb` options to
> `fdtfactor` to factor a compiled FIT image directly:
>
> - Parse non-overlay `type = "flat_dt"` nodes under `/images`,
>   decompressing their `data` blobs according to their `compression`
>   property (`none`, `lz4`, `lzma`, `xz`, `gzip`).
> - Reject FIT images containing `signature*` subnodes under `/images/*`
>   or `/configurations/*`, as modifying FDT blobs and configurations
>   would invalidate cryptographic signatures.
> - Partition the `flat_dt` blobs into compatible factor groups (by
>   compression, architecture, FDT header fields, and node-path overlap)
>   so a single FIT image containing multiple board/SoC families produces
>   a separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
> - Support `--single-base-dtb` to force all `flat_dt` blobs into a single
>   base DTB regardless of node-path overlap, failing only if their FDT
>   headers, architecture, or compression differ.
> - Insert each `fdt-base-N` node into `/images`, replace each factored
>   `fdt-*` node's `data` with its compressed `.dtbo` overlay, recompute
>   any `hash*` subnode digests, and prepend `fdt-base-N` to each matching
>   configuration's `fdt` string list while preserving all other
>   configuration properties (`description`, `compatible`, etc.,
>   populating `compatible` from the board DTB's root node when omitted)
>   and any pre-existing overlay entries.
>
> Add uncompressed, LZ4-compressed multi-family, signed-FIT rejection, and
> `--single-base-dtb` FIT image test cases to the `fdtfactor` test suite.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md                  |  17 ++
>  fdtfactor                  | 588 ++++++++++++++++++++++++++++++++++++++++++---
>  tests/Makefile.tests       |   2 +-
>  tests/fdtfactor_lz4.its    | 109 +++++++++
>  tests/fdtfactor_other1.dts |  33 +++
>  tests/fdtfactor_other2.dts |  33 +++
>  tests/fdtfactor_test.its   | 109 +++++++++
>  tests/run_tests.sh         | 158 +++++++++++-
>  8 files changed, 1018 insertions(+), 31 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

BTW, 'FIT image' actually means an image in a FIT, so I think you
should try to call the whole thing a 'FIT' instead.
