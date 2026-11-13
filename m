Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547404;
	b=eor6UZO0dgmB0DmkFCqL82EV7jmu4CwlS77dzM5guF3MmF7PZ3S/VfZfy2DpHVOnMSmk
	 d32RV1RE3gHi0xudWKw+GZSvtdOI96E5EOMftgGd9eOANSoy/lc+dPEQQuHCNSrZB5HhG
	 xH2VKEinKGU6hFx/4mFKnTLjmdh/HB/bm1sAOJ+rHFoluZ6e1a/2YVRoloNVr4V+HI+cN
	 b0/4rzTOucTMFBFJDB201INd9bo2uUqpzo8WmG/SlyzXWfxhSW56jad8OGMAnN5993M5w
	 PqmK+rnCWpC4/K7G9eVp0Ne1ndMaH2NBKPVriO3f5IMZYAYeFLf7zF+g1Mn+FiO9ipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
	b=d98wWYLeDR4xPHl7PLCQaUNMTGD0MpoBS0Au1fnIAmFBZezLdO3o5D+2xBiAvtkkaVQX
	 70WmSCnZue+Vdc9ZS3f6tJM3y0xTIrLDFCqHQkzhTqGbzjcAjOCfyeR4kUjCfH/sBWdWd
	 eUafSNEgIfbTm5r0M2XPBombxZ/Gxb3PwSXP5xnQxqmE+IKnWZwNWzAqSh0biSuXF201y
	 8O5J4eQenj+rESvBhTgZDqe+wjoXtVHBasx4HXlmoXf6vKq7X7WRxC/GW0aT3lIyL+68q
	 rxGtdNGaaDv5dV+7eAWwsW5elqaLnAPtHF0Z/NiB3p3jFJsmti5iqF/ocgRMQtZ2cZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y8FNga+v;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891F606A321
	for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C891F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y8FNga+v
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d28f75d62so121163366b.0
        for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794547402; x=1795152202; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
        b=Y8FNga+vcCcCKHUEfRGOlaENwQ5mrXXErdwwwFMG+VWva4gByfMHjudzcJadU41ThR
         PUxr27YQPHCoLPM/C0m7pEkPy5nnYjqH+Bf7vQmP61igxRcrQD4lKZnv0GJJBCduSzrD
         HhzXL2DhgzXGEOFa8cItwaYASVjMsRno4ZMCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547402; x=1795152202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
        b=gb+i6xQL95/PmCEExNG+Jd2+qbQh2Zo+hldsGZc8Kj/SXC5+Ajh7t4KQcBQnuzWDbu
         5etTjmtAGSy8BBlJP3kTO7+g+4VfxJFeuDyVQlDo4KJj2oUUyeH8xRXZOs6/9VfEsYMj
         WaBh7eQlKUKFkHzK9rC4Jh9cgQKTodD4SsE92IgJRtz4WeZkMx9X7l1905dqkPoe6yP9
         YLsu33Fi+u8NN0ET05K95mHS5xEy2taqEOF83S1fXCInNuZMl+r1pMoLVkDgP33Gqie5
         j5bR0bE7ST+Ji+ziu9SlTuUzhcva80MkwRzZDwMfQb1oAMOl9UHlApdzKvq/DFlTC86v
         L0gA==
X-Forwarded-Encrypted: i=1; AL+hErE5OyeRMod6SFfUB8jYFGyNvkLLwSQla7WLSORsaTIuvgb8QfhYZL2yWhmQWRcp/LhZXCJ+FhJIAALH@vger.kernel.org
X-Gm-Message-State: APuU4Z+2LDoNzz9v1zGsVUOGaAoZLghI2+I5/ha2XSBEpqtYfA+QGlWf
	0gZ0EJZHWS8U+tz7cAozUlEEhv8gHfbW3vBj2DRY3/y3rq8U+KpkOd1xHyrtcTwod/MmTXTbLvC
	F2lVFOErz
X-Gm-Gg: AYBFou3JxTVhewr1vBzsc8FZ+ZVBD7vI1Bpumo5UEPRLUpioIVX+W82GxQ79MlYu7wx
	1OTXeEF7rmbvOnh1u1bSR8lDQgpnndvR67LK8JU07FUx1viUkEj48vCxaxPTl19dLMTyn915h/v
	5tYlYVW8wD/g+MbBSpwju07JY6XO6Pda/MD24wdXR/OcDC3HGAWs3yPqEjbgaLQQesLo1xuvTtW
	sMg9wtgYfiwK9Bqw9PNFIPuWfydB/Wc4nER3eDsjwFoJOn3K23ZnTKazTMaiOcUKj67fxnq1FU4
	3QyR38/VdViEpInl4O6Jjd6urQHaR9TxK9nhZNiVBQke9Jgu9s2IJbsok2fHX86w3O5F1+j0UkC
	elqU8PIw3vujsLbKgN24Nf4mLPbNwgd4A5SrMDqnxCqnnR8Kt9rE3jlOi/+JVTFHftqJOfWBRpt
	35cSMzrjesxnlggj+F/GPv6xu4icO8Y2KGYLYtMgCLyEjZR+lrZu6N2u3ERPp8fkdDCS03Z7wij
	7uMOQVaDMRtSPpQ5QlRj9woz8Y66HY3zha9/KQr+FzPDZw4ScKdO3ohIeq/jfToHyYPzMEw1BmU
	qId/PFG5XSto/MX3Lxku78xovcen+VFjXAN3Z8rwKZYt3C2XLs/kqWRz7OJtaGUf3rXecw==
X-Received: by 2002:a17:906:8e17:b0:c3f:7ab8:bef1 with SMTP id a640c23a62f3a-c50963b0c26mr114633866b.34.1794547402243;
        Thu, 12 Nov 2026 21:23:22 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b780d6sm50507966b.67.2026.11.12.21.23.19
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:23:21 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so590285f8f.2
        for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFkYrBFmpiLvtwJFALRpWp58+s7BizRSqI07bR/KABTmdu+FYa53fHh7OLLRRB7cnd997sG2qmqjjXD@vger.kernel.org
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id
 ffacd0b85a97d-49c714a2a99mr2054397f8f.24.1794547398778; Thu, 12 Nov 2026
 21:23:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-15-dianders@chromium.org> <avUgDyB9p0_OSxal@gractus.seuss>
In-Reply-To: <avUgDyB9p0_OSxal@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:23:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XdPm0zQJe3rbeKMDnBia4qzuetxn4T2CMeh1+7tLOt+A@mail.gmail.com>
X-Gm-Features: AclHuK9aXeqWfCXMZOPBMpM60f8-snYNUMCFOIZWOgLzWEySRUCP9VJFMXuuRXk
Message-ID: <CAD=FV=XdPm0zQJe3rbeKMDnBia4qzuetxn4T2CMeh1+7tLOt+A@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] fdtfactor: Support compressed DTB inputs and outputs
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 11, 2026 at 6:10 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:21PM -0800, Douglas Anderson wrote:
> > Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> > file extension, transparently decompress them before factoring, and
> > compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
> ...
> Hmm.  Whenever I see a pretty complex chunk of code dedicated to
> auto-detecting and guessing the right thing to do, I worry about it
> doing something weird with an unexpected group of inputs.
>
> How much usability would you really lose, if you required that the
> compression method be explicitly supplied (I'd envisage a single
> option which controls both input and output sides)?

Very little in practice -- build pipelines factoring standalone `.dtb`
files already know which compression format they're using, and requiring
an explicit option catches mixed or unexpected inputs instead of
guessing.

In my draft v4 I've replaced the magic-byte/extension auto-detection and
`--base-compression` with a single `-C` / `--compression` option
(`none`, `lz4`, `lz4_legacy`, `lzma`, `xz`, `gzip`; default `none`)
controlling both input decompression and output compression for the base
DTB and `.dtbo` files (with `--output-base-dtb` defaulting to
`base.dtb.<ext>`). (In `-F` / `--fit` mode, each `/images/fdt-*` node
already explicitly declares its compression via its FIT `compression`
property.) That also lets us drop `detect_compression()`,
`split_dtb_filename()`, and the mixed-compression stats logic.


> > -* `-s`, `--stats`: Print size savings summary.
> > +* `-s`, `--stats`: Print uncompressed and compressed size savings.
>
> I don't think this hunk really adds anything useful.

Dropped in my draft v4.


> >      parser.add_argument(
> >          '-s', '--stats',
> >          action='store_true',
> > -        help='Print size statistics summary',
> > +        help='Print size statistics and compression summary',
>
> To, compression fits already in "size statistics".

Dropped in my draft v4.


> > +    # Compressed (.dtb.gz / .dtb.xz / .dtb.lzma / .dtb.lz4) modes
> > +    for comp_spec in "gz:gzip -9 -k -f:gzip -d -f" \
> > +     "xz:xz -k -f:xz -d -f" \
> > +     "lzma:xz --format=lzma -k -f:xz -d -f" \
> > +     "lz4:lz4 -12 -q -f -m:lz4 -d -q -f --rm" \
> > +     "lz4:lz4 -l -12 -q -f -m:lz4 -d -q -f --rm"; do
> > + ext="${comp_spec%%:*}"
>
> Because we use 4-character indent depth, we should consistently use
> spaces to indent in run_tests.sh, not mix tabs and spaces.  Mixing
> them here has the side effect of making these lines not look indented
> from the for statement in patch format.

Fixed across all patches touching `tests/run_tests.sh` in my draft v4.

-Doug
