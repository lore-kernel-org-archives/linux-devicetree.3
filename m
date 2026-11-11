Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412976;
	b=EiqTOvGgRabsfPwnTTjEX+gW7vyP8Lv9yWGcBCoyJMLjQqQbPigDBY8KiLDpR7qTjXXu
	 E7fq/WuBkPHm7/b/Zta05Zm9J9OTut4xvgeXVzWKkwew/kxjAqp6I9ZU3kxzz3YVuXJ80
	 NSnT+ID+4WyYq1KI5yGGYD6j5yN1hqMb5WZ7goF5I79hQXsEDT8SqMFehLmgMETWuc0be
	 aCC9md8yV96vEdkT/LJ7zdXqCtS8VyBqP4tNeesSybjs+EjSiMMz4NbYMHj8xOiIRaCwo
	 vWcz9Y+2fEbEuU9hBVfgePcYbY08ApbqwQ/bs3dm7Nkjw76d35FRibdL3XaguDeiQRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
	b=3fBTrGtaLDOuWCATFz8wkvgKk28gSbisXsiVxf+EpbZV2rE/xEFOXcL/mKzPEnu3VfP9
	 A+MXB3ajk/8d9cc9E9KGD2ihpDTvplnV7vAhf2t7sgckjjcD9ilV3p9ESt6aBlMTOo1jt
	 1n5FcDH3qv1BmkHGsWwX/hcjg7w1W+gYtWb2rltO1vyO5/kx6iRcUpnwYtTBrvFYADtgN
	 TkLTQLcFucBxKKF/83qDGCtEV5K/vlyRKY0Nm6NF9hfcNdiFkWqLPZFlMljsgLFLw4TJl
	 qc8diu7jMDJlH4KI4rpVu0iG74f/BgO3YU3YUnZNzHIEzCXh6Kfl8lnMvL/kc4tz5Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKJ9UTQl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66FD606A32A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66FD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKJ9UTQl
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a2b5fe87so4022254d50.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794412975; cv=none;
        d=google.com; s=arc-20260327;
        b=CbM3glI78hUXOR0MZMGXAhA/PZu83/8Xv+BoiMgnpjko3x8aReIk3UUkO4C9oSWZST
         uKoEvcnP2Jwil1Ibd2Bvp+/SLjIKVk9OjNZxnnp4rJEnr6nFHtWAI/JuWZGsCPkw1Z+j
         n5ovy2nEPr0letDeZs66HQaiXKpzJnQe+CUMhFQ42zerv6D2WqYYXpNtGFu00fZB5Gzd
         XR9MG4k+yr46bW+DO3771wEwPdAKmF+74k+BMpTKPvUM+bP59JoOlIF02aYEStl4uQ+v
         yGds4OnRw+fFF1wGuzU21owQuvbAEnFOJTr79RXDZeJ74EOxJzWZzamIGykUn+W5Ml4J
         VZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        fh=DMa887qyiu2AfPYYxlCBaJc8i7JsjQWq9Yb/QsFkjCM=;
        b=IILRpxVkEv3iliPsjL5c3VvRdpLU9LlCZhEFgfKI4s/mnahwX9erxqj1LifbFYBMZs
         730ByDsdmeMAkG/okEWdJoOAE0HtvYEo5OOXRfmvNz+BJrOW2TmeQi7CDPheqbWgsvbd
         nOyp/83Q1DYM2lTOlk6cApd3fiyS2oLF0avj98SvK9OpV4eiQxxze6rtR7MszL8Ndv1M
         c6ApCB1PoydxMY3tui11sIBp8wzornPr73fNjptojoC7TYJFnDrtzkuBk5RqVcLa702O
         ZaXrOtwP931vgPiez1JunMVnIgn/A8B600VYqF+/EXYQvdhJ3ykMGLvclBLG2utcvGyB
         MgZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794412975; x=1795017775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        b=FKJ9UTQlkrpHd8aeGx0d+LfMWpdS3QS9TXfFNCiStn36JKFVzAHmMK4DgPyjQLCbxe
         4Yy85tuKfsUxjhpsot4j2CyPm3bwTG7QcrgIW9oNa+8BJQfCzFg5VnxmLS7y6oJvgBfn
         VaQKBuTMK21izUqJTD5060QhtlStG7L2P83NhZ6t3CLaktB0l0oYDHStXijKSIMgJ940
         5DTHy5VKDa181kLWtuC7tm//wjmNVhoLdo8diOMuOIxd4PSR83PPwqHIsOHuNfJ/VD9K
         IQDRdXrELU4dQZOw81p+yE3KAeHqlrCgocrjVYrPYM/pxE9xgbYVSFnE9YchtIdy4j17
         lnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412975; x=1795017775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        b=rCaGVKAxfXiw7BauVCxWoK7bPQwpm0ghAcMFlwBXXKNUTefEJhLLPWKRrAxT6v5k1h
         LuyH2yJims0youSMwyvtSOUtR2dQuCR7A0zvLIOk+0HUQvwHTqozRnGme5qErNC3q6yx
         nHfpE4+pAes1xjQ6ekTZsrIhUsc8UNM9xC5/7HwqXFOl5TMQIb9AtvSQkGAJqy+8JciP
         Si3hw25JMyNJuGz4tDjrClRjGTsRyO3iO+4ljFLiuMZZwrhdkNfDyOszJQEA6GlXqCgN
         PBEEF3W3iOEOvf3OWG7pmTN+SqTcH6Os66yhdJX2ycfE4oJ7A1Bs/0PSDAeh4uRE3Bv5
         zuSA==
X-Forwarded-Encrypted: i=1; AL+hErHmsT30ufh7s1ONujeh1UiMKU8LdYy3V7rNyY9daECJcNfb/isiRObSgc+4YeMA+Y58wQr+ztzmSwDz@vger.kernel.org
X-Gm-Message-State: APuU4Z+bgOovhig7togVeAVx8m5eVIzX8A5f+Tj5ivhooo2Bwaj5U2Zo
	LYW2ZLzI0A0O3iGp6SpDe616QY0AhKODUzlnWI1Ffb5W5B1v9mG8ZpK1xib7trj2/9siO3eVmzR
	QBnj2DBEqOZAYS5xK6XwH99bVKW0/A9k=
X-Gm-Gg: AYBFou3yRPHxbSahbY+TYs6uGT20nA2dNzXaUBkmOqRCXis1SjqpRIC6QFgDPD/Hq22
	goePX8JnKHj5v1SDWphVkJ/0TGhbO7ePx18rOf7A7bEoLX/fqqyUmCDJ94qGUblhge0o9mwgzrd
	WeyTwhm+6jQMZzZ07xyUfD/z8X1T7SEeWHbPG9WQd13Codh8JnPnE7NJ1AFwG/NscwuEIjrZ3q2
	4LGlaRaxdfQQgF5kPm6TyJXH8qOWQMgw4OqTqrjzYUpIMbK+KG5jNI+zh9VcpCezl+E+qE644kP
	PNyhPmPM5vNkL5SNhYfq923e0b7r6aKeJFvQqffkoRqvqalhvdUJYSyYuwyqT5yKlxka+1MhylG
	SJa8BuBjALVqHX2HlbEe05BwT26owK9BTYL9+RbfAVrx6NdkW74l+PPQGJmew/YRFxJUqdg==
X-Received: by 2002:a05:690e:169b:b0:67c:33d9:7927 with SMTP id
 956f58d0204a3-67c67cb7cd5mr1503453d50.12.1794412974424; Wed, 11 Nov 2026
 08:02:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-lm3630a-led-max-microamp-v1-0-ec9e441d9b2c@gmail.com>
 <20261107-lm3630a-led-max-microamp-v1-1-ec9e441d9b2c@gmail.com> <20261111-cute-impetuous-otter-0d70c2@quoll>
In-Reply-To: <20261111-cute-impetuous-otter-0d70c2@quoll>
From: Michiel van Beers <michielvanbeers@gmail.com>
Date: Wed, 11 Nov 2026 17:02:42 +0100
X-Gm-Features: AclHuK-qKY6zTrJn_1i0uQfpLRmaZpJ8hHHbOyKs16JHL3o_cT2giJuDjxuxfRc
Message-ID: <CALcvxfH8N554Pn3uN+cms5zuq+LPGj4rnV39-5G3G9yzhXTfgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: lm3630a: Add led-max-microamp
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On Sat, Nov 07, 2026 at 01:13:54PM +0100, Michiel van Beers wrote:
> > [...]
> > @@ -77,6 +77,14 @@ patternProperties:
> >          minimum: 0
> >          maximum: 255
> >
>
> I do not see in this node reference to LEDs common.yaml. You need it for
> any common properties.

Thanks, I'll add the reference to leds/common.yaml in v2.

Warm regards,
Michiel
