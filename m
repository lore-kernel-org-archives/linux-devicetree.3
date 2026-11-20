Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197592;
	b=HUpDcrSt98pFHSn5Ul4rraXB8rpzRk4o3FpZvsULqunrdFeHbgQkIkkAtkDkxj7UDYWv
	 HZHfwEDa7IqnzEcDrVaz5noSIu+owSPm5xGlZr8czE+xTYJzsA6naEWKhwL0NEvF6YkNn
	 Y3Iv5ifpAH4vJqROyudlhPxctsYG4ZMchTi/f0lKrmpd0Qg37uwaPwQrXA1Gh7gKCb0sx
	 AGpAA6airBi6tHHD34GPgmTIHheFUiFheNytbyHuSdv/4DShdcv1nTFjy7ogxD5kb8peZ
	 cANaBR/hvKypjwmeSHE3Nsovdq6Z65nRh2DY87u6fXvmjp4KChaOSuyYSRL4C7KJgsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
	b=bNuwxkKKKQaUdSwtELzj5btxdm3KOPNg0rr2th2gGshePpol7a+sfmeTp6KfhdxG26jc
	 KpY3wvj4iA6d6eFoMlQpDqVXO0HOoEv3Clo5uu0p8N4O8DGWx/lozl7rJ1OqtaVUoNqzG
	 L8uMEMOVENKmJBAXY2Cud60Zju7RSXgHdEi2WEAvk7pCWBB8xc/M0ymIMVUSAudw4WGod
	 cU3HcInXgXeOkxi5/QAH3ffom/qtosAoTB+7S7RnCtzKw215gzKQQ96KIb5iAdcKFwbDh
	 Aiuykhg+LicoRAxCKEQbyaOhO2jxDByoMXREoB91Nv5xMM+cN7WTlFTNYoP3LByfHYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=equ3l4fI;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0960A2613
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B0960A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=equ3l4fI
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso1452248a12.3
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197588; x=1795802388; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
        b=equ3l4fIVXyM4pWzW7WDR8eEehvQHEXe0ho3mzudXYhMK3OOqIQ5LOHzXto6dm0hND
         UMtejyRgWMLa/iCT+V0n0KQnL0ru1OMOctDEbIN+GKUL2cqsqrpk/FY2F8bjmamHf013
         yDnozDIuI3ebe0Zlh5qXr+q3QyCO+hdJDznJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197588; x=1795802388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
        b=ikK578B8p7XkjbuVNMnsjuhPjAy6kQ7m/CAFb65PAcXsPDUO+fFYWd6eu1cVVJaqTa
         rzDaV0jcSUNh6K7jiehn3qq4hl19U5F41D/3g3rdq5AlubQDG9kt8105H0EU3tkt6GZN
         Rl1QAUcbbsYK4B8QkIle1tQ8zOvWO8L3s7/8wA/RT7fsHIRjgFaOWzfM6Ju+pfjAuPU0
         6LN/WPCvtFjerUG8c5JjxbFvXeDsjEXLrPCxdfY/OG5vs4RiUfgtnFWdogHFd16Pu29d
         Lng/cpvQgM+/VjcIXJabaQXokEjL/A5/pQksYrnElmgmdQ2ESrxYPzsfepmCskMkgEXV
         Xj9w==
X-Forwarded-Encrypted: i=1; AL+hErGYYfdhluy/Vy5O8F8kPHHsZXWI2MRz8hzdFTTwT8TPMbjZ4AC5Ewlz0Kx+eh/a1J0NS7hnXfyGjawJ@vger.kernel.org
X-Gm-Message-State: APuU4Z896SuxDCdC7kdJrrwdtj1rZzZZucPXtKacTxLAVEH/yb8UZ3WI
	lqAfPSr0/pITJcKBArra+Kj8ApgJJoqOA/On8EPXeggpNEPIvn/EoGddbhgIZdAeFllxg+oNjoT
	Slvt3TrNO
X-Gm-Gg: AZFdTZeYNZOBBpDf16vqVNVioGFfXMWiiiQYvTJECccbDWTGnDKdBIyYJCWXTVq9f7u
	UDcyOO7b5qVKcrwfdLV2Q63S9J1Rp4ZZ1tjYkKbTQTMVC8rDUnbyKnjinrhLro8voCvZZJ74r+c
	toi8vjcZt01fGGU1KprOtjvBXygc3GaBCKRNqx9WS79Cp09cjyBERSrronuSvpDAjT3lEKxgOJr
	KhfkqJGrVLlTmbmViShF7BRRsHTlaU7DzVxMCVSlM/RLF8WlzKKURRt8+YPSjXUFlqcXcljY3mV
	R/yL75QpJRL26ErP2OZ+BpNwPIzHyckrICNd84Z1AMKRueUvzivIxQ5bP9X9Z+uwhH0TijgeluK
	Q3yTylgWICtfYj2GfT0WQyVE/84H6t6My8ckS+GfxGpuugos3f2wI81mfg0QaQVTbSp0eFp05+h
	08GrDOnfMP1mdowWy3v4DwL6e26FOZr1urCBSl3dhD96iWaNIKvb+SrHwaphIeCePYALRhsvaFf
	qwR5HhO9WN6bp/XlL7QdCtaYPmmCWTHu7qfKvqnE2kCF+e95EfMNNmFpxVd/QSZlm+bHu0z1NmK
	T7CN4OfC18/Jg7hjgN8ogJI1HLgLX/Vqf0HYgujmjx9rBfXdBAzLSkGtvgLDcEEVLEXl
X-Received: by 2002:a05:6402:5005:b0:6b8:791e:5d4d with SMTP id 4fb4d7f45d1cf-6ba638a6273mr298759a12.27.1795197587819;
        Fri, 20 Nov 2026 09:59:47 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc2b0sm1419467a12.24.2026.11.20.09.59.47
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:59:47 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d427836e9so187753466b.1
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:59:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFcFS5K9aremsdGSd3lx+xPfADwYyviexzrII434YKNuYccI054MuaeI1InqZlwgMAf0NimBPsRWv27@vger.kernel.org
X-Received: by 2002:a05:6000:4607:b0:48e:69ff:ba36 with SMTP id
 ffacd0b85a97d-4abb2fc3fcbmr7271207f8f.28.1795197097454; Fri, 20 Nov 2026
 09:51:37 -0800 (PST)
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
 <20261116205320.1621386-10-dianders@chromium.org> <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
In-Reply-To: <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:51:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VWy3wJOFA1O4_S8WKZx5mVX7j3tYMkqdL=o0s3-3EOUA@mail.gmail.com>
X-Gm-Features: Aa3M54og9uNzW7OTwraRJ_B2FTsV1ta7iDBWw_xV6LJGkyirIXgcCMCsJjFCpNo
Message-ID: <CAD=FV=VWy3wJOFA1O4_S8WKZx5mVX7j3tYMkqdL=o0s3-3EOUA@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] libfdt: overlay: Update base /__local_fixups__
 on apply
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:28 AM Simon Glass <sjg@chromium.org> wrote:
>
> The test suite passes for me with -Doverlay-local-fixups set to 0, 1 and 2.
>
> One thing I'd like to check is the 'zero code-size increase' claim,
> which no longer holds now that fdt_add_empty_subnode_() is split (see
> below).
>
> [...]
>
> > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > @@ -405,9 +397,32 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> > +int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> > +    const char *name, int namelen)
> > +{
> > + char *namep;
> > + int offset;
> > +
> > + FDT_RW_PROBE(fdt);
> > +
> > + offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
> > + if (offset >= 0)
> > + return -FDT_ERR_EXISTS;
> > + else if (offset != -FDT_ERR_NOTFOUND)
> > + return offset;
> > +
> > + offset = fdt_add_empty_subnode_(fdt, parentoffset, namelen, &namep);
>
> Since fdt_add_empty_subnode_() is not static, every build pays for the
> split, including IGNORE ones. With gcc -Os on x86-64 the text size of
> fdt_rw.o goes from 4610 to 4743 bytes for me (I have not tried other
> compilers or architectures).
>
> Please can you either avoid the growth when FDT_OVERLAY_LOCAL_FIXUPS
> is not UPDATE, or update the commit message and the comment in
> libfdt_internal.h to give the real cost?

Ah, right -- `.text` itself grew by ~37 bytes from the out-of-line
split, and `size` also counts the second function's `.eh_frame` unwind
entry (plus `endbr64` with `-fcf-protection`).

For v5 I added a small `VISIBLE_IF_LOCAL_FIXUPS_UPDATE` macro in
`libfdt_internal.h` (modeled on Linux's `VISIBLE_IF_KUNIT`) so
`fdt_add_empty_subnode_()` is `static` when `FDT_OVERLAY_LOCAL_FIXUPS !=
FDT_OVERLAY_LOCAL_FIXUPS_UPDATE` and inlines back into
`fdt_add_subnode_namelen()` (+12 bytes of `.text` from register
scheduling on x86-64 `gcc -Os`, zero `.eh_frame` growth). I also
tempered the wording in `libfdt_internal.h` and the commit message from
"zero" to "negligible code-size impact".

-Doug
