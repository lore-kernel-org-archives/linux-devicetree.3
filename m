Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460837;
	b=0kCxpDb/jq4eHUfpHmkDeidTLs0ZgnpO7/T1BPjMqrPcKcDa3PE0jqqVFCFlVtreKvQN
	 Fi4k0DT2UYElh4hK3oM6ilX07yuaf30BTsodP59DNxvt8H+FH7Ro8TxC5Rv4LKCJiFtXh
	 0yM3uPXXZNV2Tc5iCG5ThFeucC5P8OzgPT78GrQUzs2l8+vDIrrdr+YsEWeAslQG1xNzj
	 nT5skeb5ZOP1ynDiEzrZsKpiyl8PLSok2uZ5aNkzlt9HUboLhA3KdHz3ZQ6B1KUm0BGkI
	 zFzSXtOoPqwoI5hgusv3rpw+JshdugS8Xdh6OKogPixUO94004fR+MMilz/I8IPCQKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
	b=1fi8rvQGaGZJVi2++ZCyPdPTlm6e5UFJ7UEpzjWZfLxYQVyu4bUIqpuAl1B8kmKQ4KLI
	 /I+DRn4mo5U4kwtksHstbZ9pgmFGfGMDbxBRBm0osxfsj50h/6wT6wxjmGeb43n5wGf4u
	 v1wIl++Ozo0pY7+2/H9XgSHu0PJBTVjnpzbuzxZlYkkBwxQ9AWLHI/d/WfBjNH6fqYq8Q
	 Vi1u5kQekYiCTDM6f8lTP0HeiVCGM7uuMtX95iNUjGT/j2Z/u5uZagVkiYcRokWvw+h6y
	 3zzX9Faas2kfDCw5kU014tMZoT75iDbJMMa7CSF8UkxxLHvdvddq2+FNY45un38p60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=COkLbHOb;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4C606A31E
	for <Devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=COkLbHOb
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c513a854320so607359566b.0
        for <Devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795460836; x=1796065636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
        b=COkLbHOb1rrofcPfHZW2hLzVKZu8C/JfXyHRXb2patjjYTASF5byFq6UteUpzZ0MEp
         k2f36YNImIGt0RNjJUUf5wbUD63q6odhWWhBz6t4/QWwZGGzNAJirEzWKAgyGP9MqYE2
         7hD6v+L1DxX0Acodbvc5Pq5mxX+Mr04uCU2tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460836; x=1796065636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
        b=xm0+zKRWwP8Knku/jkxG5qBs82VC1BWbFlOweVQ5ygw63x8oCLBj1JkAlXT3+Zam1E
         8sWKHeOIxl8BiKqV8kpXBV5U8xN4YahDSw6KbO8G+M+zCWs/yC0KlxZpGLShUGB6MhF/
         brWSS+2ZXqNWPDrQ0a7pVOUdZHECckOJUPek5C/od1b7GLG/oPHGoPKuKGLplKkDLOYQ
         lsW6BLSGXjR7z1U+0DqKhbtNCxdp8Cn1zVSsH9v5AGiyBVvztVLp/kxky4qABaO6n+LD
         aiPWgP4bOVMOtQlBADYpbAMVBuBV4NwniIJvwWrNUveR3ucYKWrZZpYEBTPYrgjMM6Uf
         r/NQ==
X-Forwarded-Encrypted: i=1; AL+hErF0ZoD6XTmwmTIKQJNzMwE/8D+VYxduh7FSB+/KJlfc5Hn5I79SK2EAdx3tcDYlYzQuBPLNq0kLlwhs@vger.kernel.org
X-Gm-Message-State: APuU4Z/F84en5WBm+uYxcJwWzvppMmbBtcsbCjGci7wxnFMoTmu+HOoF
	vLirNXAQc4mvxHVh3xOgQDrD9uBOKo69eOukQPkxsba9AeBsMzLy0Fefg5+2xBrZaDg53lb8BGa
	Wr2GELauo
X-Gm-Gg: AZFdTZeravtTIY+GsVTQrCTnWN55VP6diGL2MkmFMOJ2EbRhOa4JVmOc/6PJadJrm81
	kVWQOLEsHwCRAtrHI9BpdUcyC5s79Dtv0zKfR1NSsW9rPhSyBNQ6MXKAqNKcOSVJe4sT7IgEPyA
	kXzoyzGudKNtP8RRcY8ygMvh6kB229XYZdLPSZFDso8W3rdmlLmZnpOoEV8RTpR7LAdXH9BM6W3
	oqw88HkijuYHKTHnY8E/tDasXeEk4yXVUZU8lqxSCePeAcS46LYfM77U2XsvuocRSw9lqj/9usa
	rkRDjL8YffcEcpOU4v5y8KQchJBL28qo5a2+AbWBQViCmvzjAZ+8EQv6F9hjvWESdReFhF/aVBf
	rwuu17XnOTh4XsGxp2POQwDLBVD/18lMaUv+NuOzPYeJaNE+SC8vYadH2uy890P01S8+tcayHhS
	Yr2EMk6X32bbIR3p0U77o6Oa6kkn+Nw+7HZaS8LJax2D8O5dXDeNelT/yBaRyZtAQAj4qZEox5Y
	Z/R8KFgJl2VvQwyz4Sh9/SdZx5QLCcVIEVDmBVo1zbyEfeV0AFGWNVqjhwBE+Y0zo1PHEeXnH4A
	oumFSjvTPAcLYljBK2fJGK8+lnOmO45HpOkOWrK/BSgaEnQK+lCp6cFoOio4qkfpGxM6
X-Received: by 2002:a17:906:da0e:b0:c46:a72:e0c3 with SMTP id a640c23a62f3a-c513a84dd04mr831970366b.16.1795460835866;
        Mon, 23 Nov 2026 11:07:15 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3701sm451244366b.48.2026.11.23.11.07.14
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:07:14 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1718471f8f.1
        for <Devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:07:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH325wetV62jpYkUFCQEZ0WCU2aBr1X4D5iZ3DCXOiXffairgBQ0174mxG2lsaqZyoyo51NvDUyxqFy@vger.kernel.org
X-Received: by 2002:a5d:5847:0:b0:49d:1ce3:1849 with SMTP id
 ffacd0b85a97d-4abb47b2449mr22428102f8f.21.1795460833131; Mon, 23 Nov 2026
 11:07:13 -0800 (PST)
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
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com> <av6J47fOAYxejSgr@gractus.seuss>
In-Reply-To: <av6J47fOAYxejSgr@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 11:07:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
X-Gm-Features: Aa3M54rVuIOpXpREPYHEaLP2UUxHM1aMZ8x1gcb9luvKIP99K21qY4Li68E5VW0
Message-ID: <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: David Laight <david.laight.linux@gmail.com>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 18, 2026 at 9:38=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > Agreed. Since `p <=3D last` (`strtab + tabsize - (slen + 1)`), `p[slen]=
`
> > is always in bounds, and checking `!p[slen]` (i.e. `p[slen] =3D=3D '\0'=
`)
> > before `memcmp(p, s, slen) =3D=3D 0` cuts the `memcmp()` call count acr=
oss
> > that 855-string replay from 187k down to 14.3k (the exact same 14.3k
> > `memcmp()` calls you'd get from scanning for `'\0'` with a `*p =3D=3D *=
s`
> > pre-check, just with half as many `memchr()` stops).
> >
> > Timing 200 replays of that 855-string (11,259-byte) Qualcomm
> > `dt_strings` block with `gcc 15.2 -O2` on x86_64:
> > * Original (per-byte `memcmp`): 3.45 s
> > * Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
> > * Scan for `'\0'`, `*p =3D=3D *s` then `memcmp`: 0.36 s
> > * Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
> >   0.27 s
> > * Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)
> >
> > Since you already applied this patch to `main` (`c954f9dd8357`), so
> > I'll include a 1-line follow-up patch swapping the check order (with
> > `Suggested-by:` you) in v5.
>
> Uh.. "you" seems to be referring to two different people here.  I
> applied the patch, David Laight suggested the optimization.

Whoops, that's embarassing. I definitely glazed over the last names.
Who could have expected two people named David?!? I will read more
carefully.


> Fwiw, since this further optimization is essentially free in terms of
> code complexity, I'm certainly happy to apply it.  I am absolutely not
> keen on further micro-optimization of this.

OK, fair. Do you want me to drop the 1-line patch from my v5 draft
then? It's basically this:

-               if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0')
+               if (p[slen] =3D=3D '\0' && memcmp(p, s, slen) =3D=3D 0)

While it is a micro-optimization, the code is no harder to read so it
feels like a nice free speedup. ...but fine to drop it, too. ;-)

-Doug
