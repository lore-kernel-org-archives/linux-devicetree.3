Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932503;
	b=3UWA372IHGdGYVtxWxpf/RgBAiFtSxL6LqpSeymNrr0sf+2H77wYD3XAb62bDizAKBoX
	 k+kz3aylZKeL5pAg1I4OD79JIY9w9EmStwxvqY5Vf4fmCapN8lGdf59t9mK+t/Xv5QXbl
	 rY1TYM3LRefybVcSMfd1zprGhIcPT3NU55bgs7vrGaPMuEwW8+9UCIRNseyNMAdtbNBaV
	 ESfZY2dflfD9xuI3CVZ3/FZSu4LHhyDxgzwuHxm7Gioy4XLoj8hKyPFG7CToiO09u95C9
	 cw8mPou4TU8PRbKH9C9evIb3kqTJDhsg9XWuCBb+F/4na1Eqzc+r7JzrLOCnjMpLZLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
	b=O+8nZ+qhhfvrcbIhkRuIeWZhSQVyhYJZbMliUdPSgjN9wWTtlzKpEyJkZdO9kNYy1gg7
	 j9odVqlFCTBiogYelSDxJ44xW/Umg6OPAKi4OBadrc8j5L51GC/0E3lpWBBxxQG+W0IqR
	 oMhUjMqYcs+XkyFOVn/qOXVvL+05weUxxjEJwckIgeZ2SrfvE7lr1keJTQ4oqyXBFgRn+
	 yAf/I0islDpHsqWdLTuzfqznXbPb+Yy1aBbjvd351/TmY4s1xXV6HVv+E46rxbusSbphl
	 YCvIPWELG11NcAedKNpJp1LrsDMzkkz7gbDHr1vn6Dl6BnVdXp9BMrrCyGgBXgzoWEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U4ufRRJy;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2143606A32A
	for <Devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2143606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U4ufRRJy
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d21051042so328334666b.0
        for <Devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794932501; x=1795537301; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
        b=U4ufRRJyHnYdpp9914XB0VDbvDPPG3fyZ7vYFNmog7zSfEq/KLJZ2Yyww+WQWuhDsa
         4sJDYjQ67nk1QJ+mESE1yNvPDr9fF8Hb5K2SYK7yZ4NFxidRvhSBxNjZXDwKcGuIv0Oq
         vbvFfaCMtHbCn4r+cm7evJj6tmLR0dGSaDmrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932501; x=1795537301;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
        b=hRZAyFZjYrygaP8WuNBc/c1uPkdYtFYX9zypH80qJu0CuTMoFT0auNHjPvkGE8YLd7
         BBknvSdjir2gFEdhkpJtsVhmKAksz2FhXz/NMS51hN9QT6a9V4fflZbyxxlX9A8vymkj
         0DcZfHlb+8ydomV0U3NJe3bpxxH+tGXIUCt0ZW/02ztLtPzzBRaYOtJU9wYwH+5Lwki2
         2+KQGF0TPDuwr1XbXnjQOjSQmmCYXTGgsEijCQ6BXWiKyaFSXhYRPx1srSV4wXwsLxtT
         Wq2Q63yI0aaKXh5Br4DnJ9GauTffZnpsSkdGcxwa6V0OgTbz5bhNGv+iqw9boS52gRw8
         YWvA==
X-Forwarded-Encrypted: i=1; AL+hErExQwCkbnJxhNCdyB/2LDlqS90TybjFKd9cORdWZN4ZKcH6hHfU60Ms+Rcg3phlsB07WvX0nKWV+FDV@vger.kernel.org
X-Gm-Message-State: APuU4Z/OH0wg31GvD0WPnWE0cG0eh0Ij5GolY2UDYJzdpCsj+vEm0nLV
	o9n6JT64iEkF/7x6GeN+mxJII3+HyycP63TVOwfzpLLAfb1NhLKTjxS2hEgOzc6nPrnoHO/ShaR
	Lc+5+YA==
X-Gm-Gg: AYBFou0WxKo1CQGUBqXR4TxtAuQFRVG5jL9Gn4GPDNf5lpbQys+ZUFCKg5zwK2BZdkf
	UAZIB3ID10NzmzKYShZ2iAOS6b0NY1xEbHjvKJ/KPcAunThbgPaKJ1XbMofkCcinwmrByMtNxWf
	lKbK6DfQsO2SAYYLYXNhFLM3JQH34WqUgWY4jBZ333sgxrTdmSy2NYixdLIlN/0FI+1u1UTJyDA
	wDT+kkxHyEpRgWTgl6fO2yu/XjrRrekr8el1UfjSgo6VYxzLnvQYzp6w8EivtAwBaAwiWT5qhgZ
	/Ul1gr8oW2LydrTGzlGIr/YsSuLrQlvi3OpYbo/X540HRnzw9kygGC9wNvA++5ujrz2IUCZwHM/
	KimspKUz06RGJQ+/PSe/l4vPmgPMRXXTVB4ntPOc8TbozO0y6SM/Ud5ZVh+lQ+XqmgRRL+yhN7L
	yt8EeEwXKTnHXyXFB4N/wWCmibVnnxlZBSdVjSREkZxf+/AH2vohsEk/hogvwePtzN82J73oGsA
	N9DKBCGJDc0xOQFy6LjnTZ2dZD2dbTMdXf4TXNfTrqPUGoi8EoaIHsxRMoIEQAHjEecx3mv2VUc
	Ji0ce6bp2NJovmjKnwSnJBF2tWm8M5ljv6gUQvnKrouQpBW1qE6e/1Gmn/t97cvkEA6/
X-Received: by 2002:a17:906:ee85:b0:c4d:2895:e492 with SMTP id a640c23a62f3a-c509636a10dmr1157551266b.21.1794932501129;
        Tue, 17 Nov 2026 08:21:41 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca61615sm1456066b.33.2026.11.17.08.21.39
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:21:39 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2852338f8f.2
        for <Devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:21:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEVEmvxAIGWVvZvCSjRBz9oXbcyKFquk7B+uV/IEFDGbryN+vuIva7EtPrF/4CC2ypWfPzBD/vdweH0@vger.kernel.org
X-Received: by 2002:a05:6000:2584:b0:49d:a36c:2d66 with SMTP id
 ffacd0b85a97d-49da38ab522mr26157470f8f.27.1794932498429; Tue, 17 Nov 2026
 08:21:38 -0800 (PST)
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
 <20261116205320.1621386-9-dianders@chromium.org> <avvRY-nTstFbvTpF@gractus.seuss>
 <avvTEIZQZwra3Zra@gractus.seuss>
In-Reply-To: <avvTEIZQZwra3Zra@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 08:21:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+2wMhc6OALzbHgn8x9AnWUFCay6sGB7sqKqffGLb7ZQ@mail.gmail.com>
X-Gm-Features: Aa3M54pz7DW5yM-a4JW5wjVNliWZLdPpMra5U8vPsgIIoqjo8RSA7Zhl1aOgCMU
Message-ID: <CAD=FV=V+2wMhc6OALzbHgn8x9AnWUFCay6sGB7sqKqffGLb7ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Nov 16, 2026 at 8:07 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
> > > DTBs) this reduced `fdt_property()` time by ~5.6x.
> >
> > What we really want is memmem(), which would presumably have a similar
> > optimization (and likely more) built in.  However, we avoid that to
> > make this easier to environments which lack it.
> >
> > Complexity isn't too great, so this looks reasonable to me
>
> Hmm... actually, thinking about this again, I'm kind of baffled that
> the speedup is so large.  In the old version, if p is at a character
> that doesn't match the start of the string we're looking for, memcmp()
> should return almost immediately (after a single byte comparison), so
> I'd expect both versions to be - roughly speaking - a single scan
> through each byte of the strings block.  At least with gcc builtin and
> inlined mem*() implementations, I'd expect the performance difference
> to be pretty modest between that and the new version.
>
> What was the environment (host CPU, libc, compiler options) you used
> for the benchmark?

Environment details:
* CPU: AMD Ryzen Threadripper PRO 5995WX (x86_64, AVX2)
* libc: Debian glibc 2.43
* Compiler: gcc (Debian 15.2.0-14) 15.2.0
* Flags: default `meson setup build` (`buildtype=debug`, so `-O0 -g
  -fPIC`), though testing at `-Os`, `-O2`, and `-O3` gives the same
  ~16-17x speedup on the string-table scan itself.

There are two things going on even at `-O2` / `-O3`:

1. **GCC can't inline `memcmp(p, s, slen)` when `slen` isn't a
   compile-time constant**: Because `slen` is a runtime variable (and
   GCC also can't synthesize a `*p == *s` pre-check on its own since
   `slen` could be `0`), GCC at `-O2` / `-O3` emits a full PLT call to
   `memcmp()` on every single byte `p` of `strtab`:

       .L10:
           movq    %rbx, %rdx
           movq    %rbp, %rsi
           movq    %r15, %rdi
           call    memcmp@PLT
           ...
           addq    $1, %r15
           cmpq    %r15, %r12
           jnb     .L10

   Even though glibc's `__memcmp_avx2_movbe` returns quickly on a
   first-byte mismatch, paying a PLT call/return and function prologue
   on every byte of a ~14 KB `/__symbols__` string table (~5.8M
   `memcmp()` calls per 800-symbol DTB) dominates runtime. Just adding a
   scalar `*p == *s` guard ahead of `memcmp()` already speeds up the
   test below by ~8x at `-O2`.

2. **SIMD scanning inside `memchr()` (~2x faster than a scalar byte loop
   at `-O2`)**: Instead of stepping one byte per scalar loop iteration,
   glibc's `memchr()` (`__memchr_avx2` on x86_64) broadcasts `s[0]`
   across a 32-byte YMM register (`vpbroadcastb` + `vpcmpeqb`) and scans
   32 bytes per iteration inside a single call, only returning on the
   ~4-6% of offsets where `p[0] == s[0]`.

(In the commit message, overall `fdt_property()` time dropped by ~5.6x
rather than ~16x because ordinary repeated property names like
`compatible`, `reg`, and `phandle` hit near the beginning of `strtab`
right away, and `fdt_property()` also includes copying the property
value and header bookkeeping.)

Here is a small standalone C program (`bench_find_string.c`) that models
building an 800-symbol string table 200 times (~4.2s -> ~0.25s at `-O2`
on my machine):

---8<---
// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
/*
 * Build & run:
 *   cc -O2 bench_find_string.c -o bench_find_string
 *   ./bench_find_string
 */
#include <stdio.h>
#include <string.h>
#include <time.h>

typedef const char *(*find_fn)(const char *, int, const char *, int);

__attribute__((noinline))
static const char *old_find_string_len(const char *strtab, int tabsize,
                                       const char *s, int slen)
{
        const char *last = strtab + tabsize - (slen + 1);
        const char *p;

        for (p = strtab; p <= last; p++)
                if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
                        return p;
        return NULL;
}

__attribute__((noinline))
static const char *new_find_string_len(const char *strtab, int tabsize,
                                       const char *s, int slen)
{
        const char *last;
        const char *p = strtab;

        if (tabsize < slen + 1)
                return NULL;
        if (slen == 0)
                return memchr(strtab, '\0', tabsize);

        last = strtab + tabsize - (slen + 1);
        while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
                if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
                        return p;
                p++;
        }
        return NULL;
}

static double bench(find_fn fn, char names[][32], int nsyms, int iters,
                    int *out_tabsize)
{
        struct timespec t0, t1;
        char strtab[32768];

        clock_gettime(CLOCK_MONOTONIC, &t0);
        for (int it = 0; it < iters; it++) {
                int tabsize = 0;

                for (int i = 0; i < nsyms; i++) {
                        int slen = strlen(names[i]);

                        if (fn(strtab, tabsize, names[i], slen))
                                continue;
                        memcpy(strtab + tabsize, names[i], slen + 1);
                        tabsize += slen + 1;
                }
                *out_tabsize = tabsize;
        }
        clock_gettime(CLOCK_MONOTONIC, &t1);
        return (t1.tv_sec - t0.tv_sec) + (t1.tv_nsec - t0.tv_nsec) * 1e-9;
}

int main(void)
{
        static const char * const prefixes[] = {
                "clk_gcc", "reg_vdd", "pinctrl", "i2c_bus",
                "usb_phy", "pcie_ep", "mmc_sdhc", "gpu_opp",
        };
        enum { NUM_SYMS = 800, ITERS = 200 };
        char names[NUM_SYMS][32];
        int tabsize = 0;
        double dt_old, dt_new;

        for (int i = 0; i < NUM_SYMS; i++)
                snprintf(names[i], sizeof(names[i]), "%s_node_%04d",
                         prefixes[i % 8], i);

        dt_old = bench(old_find_string_len, names, NUM_SYMS, ITERS,
                       &tabsize);
        dt_new = bench(new_find_string_len, names, NUM_SYMS, ITERS,
                       &tabsize);

        printf("%d trees x %d symbols (final strtab = %d B):\n",
               ITERS, NUM_SYMS, tabsize);
        printf("  old (per-byte memcmp): %.4f s\n", dt_old);
        printf("  new (memchr + memcmp): %.4f s  (%.1fx faster)\n",
               dt_new, dt_old / dt_new);
        return 0;
}
--->8---

-Doug
