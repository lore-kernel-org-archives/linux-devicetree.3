Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022694;
	b=yJlUgzW8wq6O69J5vPc2bw8KhGoKgxfDvx6GbsaBVAGZEPEoc0I7lE0eToDtR8yhXCJB
	 xjrroyAGi3FdaA5TFx11y2pNgkENTDpUUa/Ay0iIpRgo2o3FBw9VqPEdYyzy2ri+MzGKZ
	 Km7X0HQbbKBnXwuzhXek7aGz+LoBmY7LNtWo5oDinFoZkMq3HWxKd316qmd/ASm1itJHb
	 0VKtOQ8hBK8bKZDIxr98knOHI3dglYa153u/Jqd9/tRnkVP0YWQVzkJAlz8kS4p5tItxD
	 CF4OWj1/Y25G8YUKMa0P0U2LSarALbf37hDrisQDWVQojaPeC/CGzeMuJyJcRoTgeTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
	b=XON4cNRIULDJ1/k4sxvsgW8aVLavQDe57bTJsIKx46V/Y1euMOnYNJ43YxaRuCdq65YJ
	 HVGUrK9G8KmkypqqUMoA6PS9SYmKC6zBVRyLU5OMub/LYepv4FpOYIv6wMVtE9YQv2jvQ
	 AyEFSMB2n1aVzJYUpBsP7D/+VCfvQ4OJJHaGjlVQ//me43ppyKp0h8j3b97CpAZjNAdKa
	 O+pMNAwCCCg2KSOUaMv5GsovXf5it3QnpGQlowF3PfU9eUXts1Ne69meQrAfd2q7/5cav
	 dL8oPb5f0JTDlazTKgP5Zodhu11G/rVjmuvEDi/c17RC0aH55luEC5dPuvGJD6k8xwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ibrCyxA1;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B043606A32A
	for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B043606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ibrCyxA1
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5118deebcfso128608266b.1
        for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795022692; x=1795627492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
        b=ibrCyxA11Vhxeer6ccecwsPRpTre9QnTE8Xbra+SXfVg9ZcIx6uga51R6c1AtkCm48
         0vBJtcZN39vE/lp7l8txQmnheNIJ7VR64NwNaezrSq3NuZGXET2EsfSykQSwB7MBt5WF
         fjBNfS/urY1iq4yoNnqQjEKA90CfNPoFnuIGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022692; x=1795627492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
        b=cS4zwp5E/eECMs34ukiohNw0+hH0GrSdr6TGnfqHEuNZ7HcYqhwPbSVVyoJyaRracS
         396y338u+yX8uMzMa2o3hlcDju18skgHwc9wmlRe7vSAGSO4f97NjXv21sitQCKQgxgZ
         0M1Zp7Tj42O6PtQ3lBs0wyrf9zb99Gzf7ZSUWXvmGC8HmqculSjDm7yvaE9ZWmUR+up2
         By/IREuNtcS54HkQlXD1ZGGiB6/+AP1fbfe2To7Kzr9jWlCHzzuZ4VRW+6ibHk8eliqi
         0QK7pl9VOYem3PKzlOZhVAKIJ5HRwX4CrgoRjGJ9KudxOmJaXKlE1W2B81pOdeGRNbg4
         Em+A==
X-Forwarded-Encrypted: i=1; AL+hErGPtjIg2a/eklTGrJhoX428OBND00YzdpFHnIyeESVz2xNx4HXJWyl+LBSTXafzMZr6ZBMUlA7Hnhqf@vger.kernel.org
X-Gm-Message-State: APuU4Z84iUMwN3MHRoBCULQT3Vv9/QVXxnWNlqneyZK6flHrnbChWoO1
	E5oDx00g1AQ215Zxp7SGyHno62RGYHWfXzBuQETjhikODuSae6gvbiHjensSjHlbj8ywXmAkPIQ
	qe+iGUaTF
X-Gm-Gg: AYBFou0LgJh0VUgMY5u5iQ9mUyfRkv3x9k10Q24OE7qkJQCBoCmHgk3tU6191PzAKdf
	vgl9C3NkPBkcvNT7wu6yT8K9WFyeYOU4T8rRRQEKhl9m9m+LhbeW8VYMGtFjRfF5Se9kbKCa9yk
	y9UXqkS6oDnW+dNEFZ+o1ZLNIZk392xnxT9bidmO75UO5h2FV57JVAX8NHMfgLyHf53yNvW7rPL
	1rp0IBbFphBrwnzPfthzF/Bb2660xpoWwxDu6SeJDAiwnTSietDsMu92uPoGIvRLbkNtTpDVzWZ
	fEPmFvi0g+mlcLkPoc7m7L+PWoSyYJbfylql4tRyWKD4DH4aO6EJC8OJ4at5hIvvxcxiUhpL8k2
	KjlH/IzNQNxzoXIchRZkZF28OH3IgNNTMC7z0Twsk8hI+NkW2S5B1ajZZka0zv/faCBHT53Nrx9
	HcpgkGgQe262zXu64FkWWGlvmSUT29Sc46+DDwsDPnnIu+muoNwdlXfw9NZXTeJFgr3tuK2py4X
	gDr5LNi2T5BUXv2RUyRa60Ce6/tNjXH113/NI7qqvssQxvFptB/oGWTW++QxyXkq5xYQZkP4QgP
	ni7i9ngeKSW+vKwwq3GLG/LvFcLll/RZ32UmNj3OK6Makiasw4fxYci3ou53R4R2yfGK
X-Received: by 2002:a17:907:9811:b0:c2a:cf73:63fe with SMTP id a640c23a62f3a-c510debebf5mr316668366b.6.1795022692411;
        Wed, 18 Nov 2026 09:24:52 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123419838sm24807166b.34.2026.11.18.09.24.51
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:24:51 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1150272f8f.1
        for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:24:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGOhDe55GGaMqS1mPzNQuA/9y8XhmKx9vePAwNXh9JSv19zRvwYXGFbuL2Vc0Rv+fpCBttRTK7b2Zwl@vger.kernel.org
X-Received: by 2002:a05:6000:299c:20b0:49c:9e8a:31ad with SMTP id
 ffacd0b85a97d-4a63ab743f8mr5132205f8f.42.1795022690305; Wed, 18 Nov 2026
 09:24:50 -0800 (PST)
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
In-Reply-To: <20261118095418.51d30ee8@pumpkin>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 09:24:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
X-Gm-Features: Aa3M54qmwNkSUziy75AZiIFWCnPWMk25YyIyR4JL-u3z6SIV6TTagFPK9tSRagE
Message-ID: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
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

On Wed, Nov 18, 2026 at 1:54 AM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Mon, 16 Nov 2026 12:53:05 -0800
> Douglas Anderson <dianders@chromium.org> wrote:
>
> > `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> > across the string table (`for (p = strtab; p <= last; p++)`). When
> > building or modifying trees with large string tables (such as DTBs and
> > overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> > `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> > byte dominates serialization time.
>
> Are those symbols just in a linear list with embedded '\0' ?
> That doesn't scale well at all :-)

I'm assuming from your :-) that your "That doesn't scale well at all"
was intended to be wrapped in <sarcasm> tags? :-P


> > Advance `p` between candidate first-byte matches using `memchr()` (with
> > an explicit `slen == 0` check for empty property names and a `tabsize <
> > slen + 1` bounds check before computing `last`), preserving identical
> > suffix-sharing behavior.
>
> Might it be better to scan for the '\0' that terminated/separates the strings?
> Then you do one memcmp() for each string/symbol rather than for each time
> the first character appears in any string.

Two things work against scanning for `'\0'` here:

1. `fdt_find_string_len_()` intentionally supports suffix sharing (e.g.
   `"controller"` matching the tail of `"interrupt-controller\0"`), so
   scanning for `'\0'` can't check `nul + 1` (the start of the next
   string) -- it has to start at `strtab + slen` and test `p = nul -
   slen` before each `'\0'`.

2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
   a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
   `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
   per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
   3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
   scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
   `s[0]`.

> Even with the code below you want to do the !p[slen] check before the memcmp().

Agreed. Since `p <= last` (`strtab + tabsize - (slen + 1)`), `p[slen]`
is always in bounds, and checking `!p[slen]` (i.e. `p[slen] == '\0'`)
before `memcmp(p, s, slen) == 0` cuts the `memcmp()` call count across
that 855-string replay from 187k down to 14.3k (the exact same 14.3k
`memcmp()` calls you'd get from scanning for `'\0'` with a `*p == *s`
pre-check, just with half as many `memchr()` stops).

Timing 200 replays of that 855-string (11,259-byte) Qualcomm
`dt_strings` block with `gcc 15.2 -O2` on x86_64:
* Original (per-byte `memcmp`): 3.45 s
* Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
* Scan for `'\0'`, `*p == *s` then `memcmp`: 0.36 s
* Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
  0.27 s
* Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)

Since you already applied this patch to `main` (`c954f9dd8357`), so
I'll include a 1-line follow-up patch swapping the check order (with
`Suggested-by:` you) in v5.

-Doug
