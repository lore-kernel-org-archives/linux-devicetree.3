Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438513644CB
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697068; cv=pass; b=ZbiFATB1zboWpv8+ItPNMu5+/WYZR4++Dl6ULukdYpOluSkfJ4g43kXNsqDTAsyKQTIYzAO1jXYXmktQhsXjYTmdZwB5XVNBaVBm6rKSCjDT+RvKmvQa42JM9iDRL3DiBw6vYpJLEDZ/OUAWp9sXigFP+VFgP/Si/MnuBsoedDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697068; c=relaxed/simple;
	bh=EqyqUxpIYNWHP1s0GX+47xMaDhlkc859gdGdTZYGzl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sgs7DF/4fontJRYkR3aqMK2aNi6EY9Wz7PoYy97ovMAdhGjaItli/d5Lc6tQKgERnUXZsRR0TBT00kr2CC4xKvnBTYjkENEkUvdicyl4WaXoUHxEHUKKKg+4L/53Rf6yPpGCXgTpcUc1SmIhshINPBVMBcGKBP/mpv6/In+Ohkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKFjtHwc; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKFjtHwc"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso640241a12.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783697067; cv=none;
        d=google.com; s=arc-20260327;
        b=m4jXdlEy/AaePYYcCB3gnVD3bUSRUaGzvYln2vnw2h4N3RTYuvDJRxOyBgacl7KXiM
         LcvP0oqBCYvMukrbDfhFw9yjqeOjaHAnZRksT726TV+dsLIgT+jZHMjRMnJ0UdYwwf6c
         Z2cgb68QtIPh1/BQfTacjTqNl2dHu+ZLWUIzgCogxIh2Ro9I5KDKPiZYfsscck5qqGVo
         yKiXa7SdAibV82QmV/kIZ3RfxGsP+/FdeGj5XaQiC4rQOJ92KB8tr3tHY4AlVf3Cp0mg
         Cq7Svhm8lN2SbkuC3dI09VzL9YVcyKdlOCcq3OPHog6jCDydmEIHa9PlzPUb1Z/taiqG
         BlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EqyqUxpIYNWHP1s0GX+47xMaDhlkc859gdGdTZYGzl8=;
        fh=zPgLC8GqrrVAGKtXv3FH4jfCMGK/rRhqNNrgyr3ujIU=;
        b=m+fOsTO5kwAvNq5x/jHmzJbUzibHwGC7l7zxnMBj09GOO4hpyP4CM807OExL+fVQZ8
         zzVK3mdzGORFTUD6WTqFJbbjpzAY7ZrkfQg7rq7U+4qc38wv3UYMMVQaksTH2ZZldz0b
         BN/295RS2oTK3sDmz/r9JBAP5lLzmStUiqQUjH6AAbQPXSDyR+9KQ24AeatUhUqMvAw7
         L2Kb5sEKZYFhzMhq7W1f71Utk/jKTb9CBZEOzXeLWp58iXkt7OdY7bpzzolkYI4UTq3H
         tRwovbOHAPNNMkD6w+vs0uSP4VGvLjRpwq8BOizIBS9n+tf8LwGSQYOHz/bcpCztii9d
         IHXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783697067; x=1784301867; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EqyqUxpIYNWHP1s0GX+47xMaDhlkc859gdGdTZYGzl8=;
        b=TKFjtHwc0C/UCtAWzmS5fCt4F1AaLrSWXByvKBvD/ctrsW7DXdTWlqCSqeEH1kCoYJ
         z3qt2vJuIJ/fM1HFweqyoRGyMWVobPTBa/CqSlWEiWKrZJOufkYGdPV7U3ImZNglXGwK
         80Sl+DSBRgEwrl7bNU7d5d9+KFXYUtW+K6juNlbcLroVM3InCWgYgQV3FtaOpkJWx/eS
         1uvHzTOsB+JMQ5o/E3oQ0BDTTU35wyzzoZL4/5zgQ3r+NvklqYBu8BDt2YF8uSnh0Y0o
         d0SEj1HOxtwQrUW1WuAcJ98MI97Zqh4apzWcmRorHMAprFwufwAEhUhDU1WKzCbQiRlr
         Inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783697067; x=1784301867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EqyqUxpIYNWHP1s0GX+47xMaDhlkc859gdGdTZYGzl8=;
        b=IYh1+pWr0wl9EqZnKNzeMQRa5Cv4tTLcC/AIV9wEU84IVFvrOHTCWxtZQmqkitFvxD
         TuFAwyp/gc2sRKlorYP7z/RL7DPvcdU9R8DRBkY5LUYZknDedAZG+ONBNiSrSSgqEUhR
         NFzOe5duej7pllPbeB92JtWzZo5xS0Lsue/ZH0Q0D85tfb58gYmg+Y4v1C/ydxibzuaU
         fwKx5QywlA9aVEEcxSzUSVLwf2Kdc5RKqiBdZjD5mG8MxjCcnhnpyvAXAXwgJ/wuMtpE
         lJiEA35t76dvpmLJxnCWQqJSFR3F9ynRQjK+4eVWXPiRLM97DN2UOPyj8ASlroog5Izl
         zjWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrD2JJFa5LXaazwQXalHlFWsG6vlBblStlaX+KKKrxr3yCaiVMsraN/WDOwA3aEvkr37sH5yetaFtzc@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVpuy4kFeFcpDMG0XkLZSuEgGEx/WAvq20AXDJzTECLMyMasX
	mqYfpwxS2WtMop2r/GNNAYpbODoCKOq0C/zaURJowOkQYVSes9gzktitIgwLaS0M7mc/OWU61HC
	T3nAv4BJ8W6ikfs6Mzrtl5lCd0DzMWls=
X-Gm-Gg: AfdE7cn/EhZQuCr5xQm4VHB0B608w9wiqz2xcfFMjcKylfDlyiv7P8dxVlq/rRfNyyV
	adq0suTeXqv5XuPG3Srlt79/QAFiZ3jiPI86LFWrghq1onq++L16IG5tV+ddtYGUyvLVvbhrjv5
	5nWxv86ZO/QuZ37//1r+lYKp7psgXRVtGILNo3YgO2Eqd8nn0Q0WzMDEWrtqXOk50HVWVT9k63p
	2XgUAmgDhQZz5GNNm0LJIk2FNo1KRZzFzvPQkb6sIKYID+PdoMInbrtAI04qdAMpcghHouZvW5N
	Uwbi9ExPuWzbW6iyHRGTyKUSfFsk+TSxbjitW+u2DvsiTR9rFGqzMDAg4WkR
X-Received: by 2002:a05:6a20:258d:b0:3c0:b55a:80ff with SMTP id
 adf61e73a8af0-3c0bcfc669cmr15058954637.24.1783697066297; Fri, 10 Jul 2026
 08:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707014525.1015-1-kimjinseob88@gmail.com> <20260707014525.1015-5-kimjinseob88@gmail.com>
 <ak0cVeEUhNP1wTkQ@ashevche-desk.local>
In-Reply-To: <ak0cVeEUhNP1wTkQ@ashevche-desk.local>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sat, 11 Jul 2026 00:24:12 +0900
X-Gm-Features: AUfX_mxU46GPfSBn7INGwH9DSFKpdE3Tct9lB7NY0v2qLaRw04FyfJBrzDmLygk
Message-ID: <CALMSewLACs7+QEq=3Pp=Wo6dvmEu0hFjmuOx8oe0AGoZHPmADw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] iio: osf: add authenticated stream parser
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why so complicated? le32_to_cpup() + just integer comparison should work, no?
> Alternatively get_unaligned_le32() if the buffer is unaligned.

I have reworked this in my local next revision. Complete four-byte
candidates are now compared using get_unaligned_le32() and
OSF_FRAME_MAGIC.

A small separate check remains only for preserving a trailing one-,
two-, or three-byte "OSF0" prefix when the magic is split across
receive callbacks. I added a comment explaining that case.

> Seems like reinvention of min() from minmax.h.

Agreed. The open-coded minimum calculations are now replaced with min().

> I believe I have commented on this already. Please, go and double check all comments.

> My comment was to use the same pattern as in _init() above.

osf_stream_reset() now uses the same early-return pattern as
osf_stream_init(). I also re-audited the earlier comments, including the
common magic definition, loop-local variables, redundant casts, GENMASK(),
Kconfig wording, and partial-frame statistics.

> Why all this dances? first_err is 0, we all know this.

The zero-length path now directly returns osf_stream_process(stream).

> This error checking and handling is unusual. It requires a good comment
> explaining what's going on.

The parser continues processing the current received chunk after a
recoverable framing error so that later valid frames in the same chunk are
not delayed until another callback. Only the first error is retained for
diagnostic logging, while the serdev callback still reports the complete
byte count as consumed.

I added a source comment documenting this behavior and verified that
CRC-valid frames ignored by the core are consumed in full without
resynchronizing into their payload.

thanks,

jinseob
