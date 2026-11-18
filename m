Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034415;
	b=hTPiO+75/pNOwgQt1iEWaMsTULqt5etCHf926VScMvURq54JNW8pdDeEqHbQQCZC/nvv
	 rxWfzs6/GA40yMzbqn+dKt1eGaNCx2eLKtKV1wyKwws9n+DoLotNereOoJEFf0Fv3RX4x
	 VXufaPAU1hzGThjpXimum96juzycC2NTpYGbW7q4hOif6Kt/6+CbYez8Y74vM3hN3rs5N
	 bjBMt58CkGjWV7IWar6qJvwjDRcGXqRZo5cWXurTQlS2+yKqFu81GIL90f2vSEx8r/wvI
	 ruY3a7mhGtTt0vnL6QhiyiXl1IC1ZFYDsEzX98KdpxP61NVwI8O9A3UhSMMj4WOqAOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
	b=BxYyBzj9bX7EWw+P9eTVt7W8/Lj2/H1URgN5ckS62zyG/iGwdqw3TePbyQ3ChOoTd02n
	 0KG7s6/ml5ET+94oSC5BdHX2HARXwTQvfFx4v4aNMfBsUQXoAnEvf7h9VOvcUrSdn1N7V
	 Yz1jy+lMY68VucYh0LOUQt4g7eJEvTkooh0zbxqp3koS9B98U/KB0FCYb3kDItJkVBy07
	 ZVwjZiY9ihjH5AGKjctBwr5eQrxvVCaFJTpixb5ySrXK7eXgVnh8ojod2oXVN6I83Dpdu
	 avfpiUn7JRrAe+GgXr1GmXyhiNjQb2TwFqq6rN0+XPmdOqjs5/bYLOJp5Bl5WlNGPGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h8wVCmxS;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C627606A32C
	for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C627606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h8wVCmxS
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5126505cb3so40925666b.0
        for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795034414; x=1795639214; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
        b=h8wVCmxSF9BCPBPWh9mK5zl16rDQhjS25qnt3tBmbQW9EhCoY9v4ZK5PWjPqA+Scvo
         JiAw7STR9OtyH7a4KN9LRm+ne5awcA7UYQnDQQn4YotnRGCiOil24E2ywA4QNioNXH9X
         X3vvcF4RF173NIWi9CBwmFXU2fCSZTFt2+2YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034414; x=1795639214;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
        b=1O+vHkm1DcGeshF1XcvKdBI64z3e2F07Hqua4Ot3XsRAfw/mxQTCF4lx0gfTTSbiyh
         Iz9e6PGivYjjRs9ltT5GAnuieFs7URq17GLeBgQQJXzFslO8HE9LCosYkviQjpYrKuNu
         BA4E5qhIEVHyH4UThW6JoPXpfaWEKWdDsJjCsnL7hNWOHtkm8K3pAIU9ChJONhIc4I0N
         uLIKOnJMuSXzTA/6WFmwOY5GiiG3TIQnBOgLovyufV8tVvcwL7VCwZodj2Z3fuSpvCZZ
         gr/NJcZueolIGbd6Y6OayD/OTRGbrQqqKjkKHbA0pp6cDbyadoIIpJZP2GEEcZbXqYOM
         mtkA==
X-Forwarded-Encrypted: i=1; AL+hErF+GRytuwSh4sTtHvsY1A/MSA9/J/VlalMq/U/KO+p88Bqbsn8aCYuLxIlzav98Wbrpk9NFxlKo0BYP@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z0JWXIwVP4vtZ7bh0pTmvaKw78mEHUKKNR42+zesJCi7OCzXw
	8pgX9QZ3CqcIj7jBQxzwvmqqZzLt1Io41rAJlmr36JDcC8/2faQZoQIFl8fX68Ky3+ORjXT/2W0
	78V75LFsz
X-Gm-Gg: AYBFou0GeTGnx6ZDH+jjCC7z6yQjN9oM56XE4A8PNTq9lqRd/HlS/u9CdnzR380E59P
	VThT+kKGUda7X12oPCI47oDxiBasIRFzvcYwrfTBlg4z+lAa5b+dKwM/hp0D3fycyx4W9wMCeNR
	WFCQ4tSk03PX5BAWy4mXCUd6bKQ4vROiunHymfvCi4I4x1g0BHUnTy/+xzob2xPKTLR5ZD0zGmC
	ZxwjKnfnR+dxsAXohdu5on5/qSSH+4agBUtTMNh1XBJUbjXqEYGtgPQUG+W6DFpZo/VJ68CKIE6
	bqexdG1s/24Ipex6djgTdgIcS5nCAhoiDIQsVASD+Q04IstcvxibwqpfRn4+C/TPItAIyEfBGXi
	8k5F4WAQVRMziPnTcMBTEgK2y2XgJW0fIvjW9eQd+ENmlXNzf8pLSCBS+wEjL6u1BULdooKnhGB
	U71aFXvFC5n+yHseSEEVSpQXn/1l4cXwtwPeisvI2xJlIUb3DDyWV5EficiI4Kk1Ln3mwsJWzSG
	/hcNWOHQ3NTjwjwJV4HZe4OzNgJ47Q0pD8RzDsd1OIL7aj483JN2HC7K+U0Rg326vzH9+UEUnsC
	ubN1su0M/u90CX0e9MNm+TJk3iE8L6miU17hAUe2XDqGU1ojUugz31aEtCB5WlI1A462PEqaaG0
	+DS4Kh2cA1ktJUQ==
X-Received: by 2002:a17:907:1611:b0:c41:7e99:c6c2 with SMTP id a640c23a62f3a-c510e4d8fc1mr375398766b.44.1795034413747;
        Wed, 18 Nov 2026 12:40:13 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a22eacesm1508552a12.32.2026.11.18.12.40.12
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:40:12 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso17123935e9.3
        for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:40:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtW0fQ6WRFxBpV7N0qoidYgBekeonFByJmHL9zI0xIh3/yLPyUtH5kcckNmP13z+nuJxv0a9oEJxzh@vger.kernel.org
X-Received: by 2002:a05:600c:3485:b0:4a2:5267:3cd4 with SMTP id
 5b1f17b1804b1-4bb7d5d4ec7mr74358925e9.3.1795034411072; Wed, 18 Nov 2026
 12:40:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org> <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com> <20261118191559.7a39c37f@pumpkin>
In-Reply-To: <20261118191559.7a39c37f@pumpkin>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 12:39:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
X-Gm-Features: Aa3M54qPWjb0LuTmUz02ixp8KHKLIDWhYST35zoNbnN5SMvzy4vFcTOqvK5_r1Y
Message-ID: <CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Laight <david.laight.linux@gmail.com>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 18, 2026 at 11:15 AM David Laight
<david.laight.linux@gmail.com> wrote:
>
> > 2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
> >    a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
> >    `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
> >    per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
> >    3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
> >    scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
> >    `s[0]`.
>
> You need to count the number of times that a letter that is the first
> character of a string you are going to lookup appears in the entire buffer.
> There might only be one 'j' in the entire buffer - but you never look for it.
> (But I might still be wrong)

That 3.9% (`187,315` `memchr()` calls across ~4.77M scanned bytes) was
actually measured directly by replaying those 855 real lookups (`s[0]`
of each string being inserted), not an unweighted 1/26 average across
the alphabet. Even though common prefixes like `'p'`, `'u'`, `'q'`, and
`'s'` get looked up a lot, 26.6% of the `dt_strings` block (`2,139`
bytes of `'_'`, `'-'`, `'0'-'9'`, and `'#'`, plus `855` NUL bytes) are
characters that almost never appear as `s[0]`, which pulls the
lookup-weighted hit rate back down to 3.9%.

Intuitively, `'\0'` hits once per string (`1 / L`), so `s[0]` wins as
long as average string length `L` stays below the ~22-26 byte crossover
-- and even on plain non-`-@` DTBs without `/__symbols__`, property
names average ~12-14 bytes (`'\0'` still made 1.6x-2.2x more `memchr()`
calls than `s[0]` across plain DTB `fdt_sw` builds, `/chosen` fixups,
and `.dtbo` overlay application).

> Have you tried an open coded scans instead of calling memchr() and memcmp()?
> With an average of 13 bytes per string (26 for your memchr()) the code loop
> might be faster.
> But beware, gcc is likely to convert the code back to a call to memcmp()
> - it certainly does for strlen and memcpy.
>
> Oh - and if this code runs in kernel the timings will be significantly
> different to glibc - it uses some magic avx instructions for strlen()
> and memchr() is effectively the same.
> The kernel functions are likely to be out of line byte loops.

Out of curiosity I timed all of those across 200 replays of the same
855-string (11,259-byte) Qualcomm `dt_strings` block with `gcc 15.2` on
x86_64 (`gcc -O2` kept the open-coded loops inline and didn't turn them
back into `memcmp()`):

* glibc `memchr` + `!p[slen]` + glibc `memcmp`:
  0.25 s (`-O0`), 0.23 s (`-Os`), 0.22 s (`-O2`)
* glibc `memchr` + `!p[slen]` + open-coded inner compare:
  0.23 s (`-O0`), 0.21 s (`-Os`), 0.21 s (`-O2`)
* Fully open-coded (`p[0] == s[0] && !p[slen]` + inner byte loop):
  0.91 s (`-O0`), 0.62 s (`-Os`), 0.40 s (`-O2`)
* Out-of-line byte-loop `memchr` + `!p[slen]` + byte-loop `memcmp`:
  0.86 s (`-O0`), 0.90 s (`-Os`), 0.50 s (`-O2`)
* Original per-byte out-of-line byte-loop `memcmp`:
  3.31 s (`-O0`), 1.87 s (`-Os`), 1.86 s (`-O2`)

Even with a ~25-byte average stride, glibc's AVX2 `memchr()` handles
almost an entire stride in a single 32-byte vector load + compare, so it
beats the open-coded scalar loop by ~1.9x at `-O2` (and ~2.7x at `-Os`).
Open-coding just the inner compare barely moves the needle since
`!p[slen]` already cut `memcmp()` down to 14.3k calls across the 855
insertions.

On the kernel / bootloader side, `fdt_find_string_len_()` is only called
by `fdt_sw` and `fdt_rw` when adding new property names to `dt_strings`
-- normal read-only DTB parsing (`fdt_ro.c`) never calls it. And even
with a naive out-of-line byte-loop `memchr()`, `memchr()` + `!p[slen]` +
`memcmp()` is still 3.7x faster at `-O2` (`1.86 s -> 0.50 s`) and 2.1x
faster at `-Os` (`1.87 s -> 0.90 s`) than the old code, so keeping the
simpler `memchr()` + `!p[slen]` + `memcmp()` seems like the right
tradeoff.

-Doug
