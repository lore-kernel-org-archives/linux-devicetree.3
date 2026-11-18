Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040142;
	b=eUJ9E/TwmJE+Rehe69lFeCfyYJcsBBmMqlFzFYWyVrZ28OvfVrH6H7q2yO/yLSHV28a5
	 b8O6RWccvhOZWqu11rW/k5BrkT0zC1A9CBNwL+D0WpfzqpDiHR6kFsAWpGCJ5SO4YoX95
	 phofEbiE/v2Fsv0wbiGqhtEw8B8bBvBqG1itGdGEaxxF5JhahrBSV+6Ay3mnyoi+NPDRj
	 jFv4akphMN/woGIq4jCOCDC1Ja+DWpB1/dWPFRE2KW5xNpkBji5+j84RK/JT1DucOdwzQ
	 41yeuEBY+RvPkM4qkZ+nsG1larPCbwOYAQ2GXk7nZugbq6Ia4Nm8gzh0t/pxNuF4Ocg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=brabdTB6uyaPfA3qh+/IR51oM3YAfNAZhWDysuFIjeU=;
	b=AuZe6cn5qJqFSrwBSkF0qz8iZio482SjrkFnaRREtAcYCs3ALicAys47hLaV/o0O20fy
	 N2UxXNnM8v2DgJ106U0GhmkhDxZZWhh9KstfCn/uBxO/cIXl3Khiotd5af6FM0pFj7teH
	 7VlqeCeq++Pp3hePKW5RWzzmvFdrVQ4i/bUqdBjm1rYGAdUDI1e8gyNfTeZeOsMi/Gc+j
	 BPFw5+G+1aFRAYjBd6DURVJONfiYqEh2xLHveBAWkquPsKdQzRuJ2Dc5WtNAl1cD7TA/7
	 Hi0hKy2jiEix69w3i3Hr+0/kmJmuZbd5KIlGEVElJqOfeeTHL8avQl/sLEvFqhSdr6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qkbwk5NL;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C33606A333
	for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 22:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C33606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qkbwk5NL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15489715e9.3
        for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795040140; x=1795644940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brabdTB6uyaPfA3qh+/IR51oM3YAfNAZhWDysuFIjeU=;
        b=Qkbwk5NLdsnVZPxeSelNtIgeJrVqy7r5PhORC9tZD8MOHsCcSNldQIgMus8uRtusHF
         vwXviZ/iuCeZYD+oxtKIk8WigYKP2DMjsYKuXOzlYGAjGO3z8JptkEIgzxMnW2BQRION
         hrKV7VEVJkxxWWfRiQx6ngwd9kR+GXUqWGkYMuUybMDVOvSVyMLFcbZFG9Wuh7yaIxzI
         9e7+pSZjmhtdLpUfi5FpDJoEnD+AHyzNId+CwCw5EZj/tAFIjl0qNkiG1HLcP6pmMoIq
         UJwYCCDYfoEvU2kG7eYe5lL46fOE35flqGctaFR6kOIKvZnWxi5z8c6s2KRjpapYsCA+
         re0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795040140; x=1795644940;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brabdTB6uyaPfA3qh+/IR51oM3YAfNAZhWDysuFIjeU=;
        b=NXHJaYIZdAHBEZD4aq5vaiaMZ21HMxBHaZIlCLoRbvNPRxUKsCkbGOfCj79oHrMzND
         Dr55Ln7qfMxefB5gqdXYuNYfZPJa1nGvnDc8LLYYnwfZ8xrln5DqOsUm4l/DNDiNyKns
         cCm6HKUW9QzTiyjkvNKodCtcPvsQo1zIndePvwvseiFNxZmIKIKdn+KDLXaTHHlLJq7F
         UwbNjObLcMs7/lxSWt2IieMzUbz1f6nmVMeGtEu+HinBmVpfqjtxuTs04Y1Stw7wGH9f
         KA0tHEXuWLnMk0/+zoIC8M8ZClB9I4vSRGc0eL2dhGhRQr9l4BtZk40f64tJT7ipEKWI
         p6vA==
X-Forwarded-Encrypted: i=1; AL+hErGhylyIRWEvA5yr01wj9d6lXlKXN2d5LrmwCZclFfLhSLf0eDO+oopbpfiXap+qf+eKIcv5/Ve58yH5@vger.kernel.org
X-Gm-Message-State: APuU4Z8pt5zKnwdhbC4J5bujRt5n10GwOH+YBdiBTpEkt3K7o1OOf8oa
	fm4DHTMuBM3hqDt3LsahXp7Nb1PPbA1ke43iJVQ7xQxaot4vpsHB9ldC
X-Gm-Gg: AYBFou3jc8tW3DBeLOUEp4QNnsZiEJ2yb3gZN5GhIrLyF+h99RlYgXil9m7vA6JqHrf
	qxTQHoqoVWutHR1Rl0+LhoyfMeaVqrDbE/aWkJdIMlBxi0qtOwrZgK7UCgzTCAeTvk6LRn+HBbp
	/9gIrSHlIRHi7RxokWzd6nbLNub9/+0parZLx57yp9g5IxoDRV/kq6OuoGvU6v389ksbhUqR7MZ
	tprL5LmYm6PXS6jaJkedQZLhap9Ad2l3Zvf4vKqv53XvZSadsIq6gu/IKzQqtIGDGjdUXBKdu+P
	g3YEokR46LXGHCX1wYqm05eVnix7j57cORx866+ktVJ5z5KKtNCollbbU/ZgbjEyZM1+vf9GijH
	f+9IDLpN6m2tNJlPeOOP+mcjVKrFUTOscRzbJMoqpmarJv1vwd+9CjSbxcwffSfaMH9XSxCemzd
	GFOGgF1GfOPAckRqf9r2k1ZLFeQH/oS1rY7/a/okf16Qwjcc14kxL5ovBnIVBtR6wtMxkV+cdLX
	NLBlis//THuc8Bveh2vaFl3mxXMz54AQG0IC2Z3IK1XPYHASHNu+1KUcNR/qAft5aD99rU7RW43
	qRjZn/s2IlJZRIuMwzU+KK+/Qa8BGFqaHB+Nq/JriBjYOmai6hWiaJLGIFth/IqJfA==
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb7da3a68bmr83410585e9.28.1795040140133;
        Wed, 18 Nov 2026 14:15:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560ab70sm7710131f8f.30.2026.11.18.14.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:15:39 -0800 (PST)
Date: Wed, 18 Nov 2026 22:15:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Saravana Kannan <saravanak@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>, Simon Glass <sjg@chromium.org>,
 linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>, Julius Werner
 <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <20261118221538.4de223fd@pumpkin>
In-Reply-To: <CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
References: <20261116205320.1621386-1-dianders@chromium.org>
	<20261116205320.1621386-9-dianders@chromium.org>
	<20261118095418.51d30ee8@pumpkin>
	<CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
	<20261118191559.7a39c37f@pumpkin>
	<CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 12:39:59 -0800
Doug Anderson <dianders@chromium.org> wrote:

> Hi David,
> 
> On Wed, Nov 18, 2026 at 11:15 AM David Laight
> <david.laight.linux@gmail.com> wrote:
> >  
> > > 2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
> > >    a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
> > >    `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
> > >    per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
> > >    3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
> > >    scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
> > >    `s[0]`.  
> >
> > You need to count the number of times that a letter that is the first
> > character of a string you are going to lookup appears in the entire buffer.
> > There might only be one 'j' in the entire buffer - but you never look for it.
> > (But I might still be wrong)  
> 
> That 3.9% (`187,315` `memchr()` calls across ~4.77M scanned bytes) was
> actually measured directly by replaying those 855 real lookups (`s[0]`
> of each string being inserted), not an unweighted 1/26 average across
> the alphabet. Even though common prefixes like `'p'`, `'u'`, `'q'`, and
> `'s'` get looked up a lot, 26.6% of the `dt_strings` block (`2,139`
> bytes of `'_'`, `'-'`, `'0'-'9'`, and `'#'`, plus `855` NUL bytes) are
> characters that almost never appear as `s[0]`, which pulls the
> lookup-weighted hit rate back down to 3.9%.
> 
> Intuitively, `'\0'` hits once per string (`1 / L`), so `s[0]` wins as
> long as average string length `L` stays below the ~22-26 byte crossover
> -- and even on plain non-`-@` DTBs without `/__symbols__`, property
> names average ~12-14 bytes (`'\0'` still made 1.6x-2.2x more `memchr()`
> calls than `s[0]` across plain DTB `fdt_sw` builds, `/chosen` fixups,
> and `.dtbo` overlay application).
> 
> > Have you tried an open coded scans instead of calling memchr() and memcmp()?
> > With an average of 13 bytes per string (26 for your memchr()) the code loop
> > might be faster.
> > But beware, gcc is likely to convert the code back to a call to memcmp()
> > - it certainly does for strlen and memcpy.
> >
> > Oh - and if this code runs in kernel the timings will be significantly
> > different to glibc - it uses some magic avx instructions for strlen()
> > and memchr() is effectively the same.
> > The kernel functions are likely to be out of line byte loops.  
> 
> Out of curiosity I timed all of those across 200 replays of the same
> 855-string (11,259-byte) Qualcomm `dt_strings` block with `gcc 15.2` on
> x86_64 (`gcc -O2` kept the open-coded loops inline and didn't turn them
> back into `memcmp()`):

Once you are doing timings, adding a few more doesn't take long.

> * glibc `memchr` + `!p[slen]` + glibc `memcmp`:
>   0.25 s (`-O0`), 0.23 s (`-Os`), 0.22 s (`-O2`)
> * glibc `memchr` + `!p[slen]` + open-coded inner compare:
>   0.23 s (`-O0`), 0.21 s (`-Os`), 0.21 s (`-O2`)

So that one is a marginal win.

> * Fully open-coded (`p[0] == s[0] && !p[slen]` + inner byte loop):
>   0.91 s (`-O0`), 0.62 s (`-Os`), 0.40 s (`-O2`)
> * Out-of-line byte-loop `memchr` + `!p[slen]` + byte-loop `memcmp`:
>   0.86 s (`-O0`), 0.90 s (`-Os`), 0.50 s (`-O2`)
> * Original per-byte out-of-line byte-loop `memcmp`:
>   3.31 s (`-O0`), 1.87 s (`-Os`), 1.86 s (`-O2`)
> 
> Even with a ~25-byte average stride, glibc's AVX2 `memchr()` handles
> almost an entire stride in a single 32-byte vector load + compare, so it
> beats the open-coded scalar loop by ~1.9x at `-O2` (and ~2.7x at `-Os`).

Using avx2 is 'cheating' ...
Someone at Intel realised that strlen() does matter and threw some silicon at it.
They finally did the same for integer divide (but I think AMD did it first)
and did a divide that generates move than one bit per clock. 

> Open-coding just the inner compare barely moves the needle since
> `!p[slen]` already cut `memcmp()` down to 14.3k calls across the 855
> insertions.
> 
> On the kernel / bootloader side, `fdt_find_string_len_()` is only called
> by `fdt_sw` and `fdt_rw` when adding new property names to `dt_strings`
> -- normal read-only DTB parsing (`fdt_ro.c`) never calls it. And even
> with a naive out-of-line byte-loop `memchr()`, `memchr()` + `!p[slen]` +
> `memcmp()` is still 3.7x faster at `-O2` (`1.86 s -> 0.50 s`) and 2.1x
> faster at `-Os` (`1.87 s -> 0.90 s`) than the old code, so keeping the
> simpler `memchr()` + `!p[slen]` + `memcmp()` seems like the right
> tradeoff.

Seems reasonable.

David

> 
> -Doug

