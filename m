Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5A4398EC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784228924; cv=pass; b=bHRqgWbeXE+vwja0lBq3FWiKQ45d0RxPRtwlLMfZdMlBYvwL8kWgAok6WiTMkJfAU6z1ECpzXf7ExNxJGwTYcrssmVJz63SrstNoSvsLH2aRgSfs8hJ0g4RlU5c8SRQBTw2z2KRfjycFXtxSGi9q/ySABxjivucMEFdN+ZC34bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784228924; c=relaxed/simple;
	bh=jLdFeRnLlFspnZwXeo9oBcZZ/8ssWumYg5r20QmYeNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQWRp23kdkTDp1kj+DjT7+hNemSsj2ZCTnsevduNUq25Oe7Eboo7q+OiDVW/aRPQU/4PAEFpPwAkHarPD3vvD1Pmwvz1jgVQzgMHNGIO5Q0VEiGVnpAHsf7/+WSmwxtX8Qj90RC4WPKUe2sWxoujwiGe9GeoSmsPXdgyGy/Z2AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWedmSFm; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWedmSFm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f75f7172so51581235e9.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784228921; cv=none;
        d=google.com; s=arc-20260327;
        b=ZRgUtmPrrkGuiGcWCWagf8Fo+ZsdjuLrV6fM6FNg2rVwP7ix5vCX3B9IvQ8Qy0eFaD
         QQWigTdNx/FPWynhALbrwGfHwd0SyY2x/HeUmo7nVibUAp9/TdB0S686xD+6dDpfaY9g
         7jjAUm/RqqgfJCtnTYc9O0Oug1OKSWVEXmn3FtptUBEXi5h3pjoHIyiK/tE3vtxN97Iu
         OKrQG+VnbVsGYCSl+r5ydb5ERjs64ZaTUHB7b6e97fke/S1gtrxwEpsJp2rjhbY9ofgL
         37BFrykdPob1uStAY7tRZSbHOJb+3TDk+ZJg7NU6DkhA6Bjz5soGRQqw3b4m4reBMDrv
         W3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5fFbXpQ6cgL1W+wXgp57WxL1BMwiS9aV1pLY4h9zMNk=;
        fh=Ahj/zu0vHKV+VBWSwIp1qxP4XZAaRmj238q9pL1sjIc=;
        b=NfrC2k/DazP5QIhWZ0KKDlYk7Z4g5RHo76AE51uVG/HSACU2CHRCHNXSnmwNEA8BMZ
         EzIlY9pvSkVoQtXZZKf1q0Qtbm5FTX0sbKuZdwFe8PT1T9PiXeyCSfsfQ5D/ytJTwjoE
         6Q8UTefprAIBanQebYsn6i8C/X8BxdrTbYZWNIRod/YD8F/b6eTHC3i1A2WuQgTLF7r2
         POAOL+PjzAIgWwa118NSUnA7EVktJYKzeBPfwgbpjCUj85A3kZ7GItrqT4mwL3R/FWqb
         04aaW6MT2niS63i5Voh4Imm6eieKm1AUtbjjItwebXqUJxXUsqrsomGmvTlffjVTgA8f
         lNXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784228921; x=1784833721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fFbXpQ6cgL1W+wXgp57WxL1BMwiS9aV1pLY4h9zMNk=;
        b=YWedmSFm80jIjFcKxqJ4AC0eHC5iHFykx0HicwhLkCsVcI6/tpozRbDnF9YpbUjIWj
         qr+0nEDMhxaUpP5M7oqP0B/l5kcQgPdCavGAqqzF3WMgkibB+EmTGZmEiJ9Bm6zZRQE5
         PZSqj+SRgYfpsIvy64xC5pu5/juS4AgUVnJHTSP0R4AwAiAgOETG9a+yymSRxSmXOlZx
         hzm4Cv5d1zoSoLEHPOT9L/+41cxh6QV/rU+ZvBcpkc2xFzQw8GkhG/TIN1pKu0zWXh9K
         jEFHbmF+yufJy97+Ouzq2JOVpc413pgnhuv4vt5X9IRg52f/IXpihxqN5jxyDsxszcWR
         HA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784228921; x=1784833721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5fFbXpQ6cgL1W+wXgp57WxL1BMwiS9aV1pLY4h9zMNk=;
        b=WKP3rK0bkLLAiEvzaEqIu/HPG8psD3mH3VLKCW20Z4O98V7ZUP1qg8o5DGUhcDNmyJ
         ONmCeUu8NUxsQAKNpAHPrBuDX/hkEtPV6shYd8yY/Oojn2qDZKDLVtsn8HtJ43fYNgZO
         zcEOnzhWk97Mz2EHzrSv4U79bcI8o4sGxjDGFIvI8mxg6JTuRN83zapWFgK/NIrdCx3S
         /Y2UyN4Wxws4Duf9INIcnwJhECctORVEhhN01NgqcP3Ti6hPEG4w5apmg6bOTxF+XC9l
         kObl6jgpVBI31qYjEr1PlWcsIOa3ZUOgQksI/zU4Ic8ToVwCnblHWo5w20FqVNziHOyF
         qiHg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+PMtdGrDdG1wAyqhELZGNskxQN/NtpSBFNe7af7bqH9dPySOSOfAnMEfSlLM6pKCvwXxKRGmymdxa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2giHlYSYQva8UHqckrCkQs962fx458V65QUr5hXrJsgxO5+wm
	7WBfTNr+ZWWEfz7neBjmtIRwIwH1HR6gK3x/bKI8sb5ytRWiFcrUBK8qwML7n7naFS88kauwiXz
	NoxcrGh5F1rAHFZaj++nbkSiBKytyzZg=
X-Gm-Gg: AfdE7ckMEFTwgSIh7HKkf9c4m+hYpqi4JEqz7E09hO7z1IyadUGRDsjMdh+puaHAIih
	4Y1zIvsjqoANPTVxKkFU4JWbArp7sISvjC1pWewXhmwC/ONgEWwJ+rzXQO78qzMIEqfVaIxOuHH
	7mzmGaSxJBJaLkaRJ/li/mQzJ8NY0PTVqvHD0lZnKRPi/U3ylXW07/oFvAEM3zLwgnN8cwToAVW
	6fYzgrfIL6v7gtkRl7Y2kt0353C3t+e/m1o30N4f01b6G72svJ2PgGt71wOlfKXBpaZvo7ZyKet
	OpEffqc0Coopv1YF+u2TTf6yJAlO/hzMkkQn9mKRgx7QV/4dygxBq2DMUbsLsv8+wuuWm/+4XPf
	A5jHYbvoLRWKBiVaBpGGDeEvNfS7QzzytuwX69hOrFrmJ/DB2QuAmtYFm+VtBGgPO64Hhj3kZK1
	4VUNcw4wwlEcEVkx/UFMoXzQgLiuQWeEe5XyjjrhuYOIjsnqC4FDD7JtY1JvGghA==
X-Received: by 2002:a05:600c:1507:b0:493:9b02:484c with SMTP id
 5b1f17b1804b1-4953c289549mr63624915e9.29.1784228920599; Thu, 16 Jul 2026
 12:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
 <20260716-ad5686-new-features-v8-2-ebb0051af5e5@analog.com> <alkmAcDvSXr_COc_@ashevche-desk.local>
In-Reply-To: <alkmAcDvSXr_COc_@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 16 Jul 2026 21:08:29 +0200
X-Gm-Features: AUfX_mxCntOtogOB2qZP4BBtfm04CggLYlXKnLS_glyM7cRaPGIAoMal3mZWjak
Message-ID: <CALoEA-wQwxjG860Y9u-vBkGn=Y=82UBX4bG1rvaed_A-qZu6Yg@mail.gmail.com>
Subject: Re: [PATCH v8 2/8] iio: dac: ad5686: missing NULL check on match data
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 20:42, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 01:14:18PM +0100, Rodrigo Alencar via B4 Relay wrote:
>
> > Verify that chip_info pointer is not NULL. If a user binds the driver
> > using driver_override via sysfs with a device name not present in the
> > id_table or of_match_table, match data will be NULL.
>
> ...
>
> >       struct iio_dev *indio_dev;
> >       int ret, i;
>
>
> Move an assignment here as well.
>
>         chip_info = ...
>
> > +     if (!chip_info)
> > +             return -ENODEV;
>

Enough reviewing for me today, considering I let this slip past me.

-- 
Kind regards

CJD
