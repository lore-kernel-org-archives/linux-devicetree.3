Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793370874;
	b=AaHNjABk6GTWqtsjUUhFZepUOv1vG5BBlT21QuYQSPF1utx8WgVamV1cuAhqW/MVDa7d
	 HLi9k6DPculIN0Vyn9g9x/aDW6VPb9EOBwQ1FUuux9lLDJuxH5+w+Vebw8g08iZWCzaUL
	 MHbXqTbu+MGGvgZT8kF2xttna7zhvEvHYGShYkWaIbTqSQbcodPJ6mIzs91a5fprCiyTs
	 6rNd63LE+HjuCRUC8YDBgzHaPT4nudVWd5vTs4qhihN1Lg4cEFXeMHq8lcQlsqDrEdDbu
	 JyYXnPxsybBNXpAtCNsbgUqW1MVKjt/Xy81O6tqB2vjl5mNjISZsLLbIyhj/W69v0Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lFTOgQZG4mIHctrB0aORwynv7cySmH6M2kM+pz/yXfU=;
	b=wFdR9Ym+0j2z1KPnKW3myaxP26/DBIzMjPIGwrMvFBpcihAilnWc/Y5mz7mK4PSYcs8W
	 irQ7qcHAW5+vH42C8c2H7R2fSXRrw74wNBBgSlMXAX6K9Bwds/GGn8TcE5tZFHFn8PUjJ
	 e2bBvbl+Ap6IF+n0lfdwsyF963aT6Sa6xS4jjmdxdTYRC8dt4DHZXlV6tUCMvCXJrLv/7
	 7yq8tVDheE73m6QjClgU/SOz1812nXxdCqBLeQIC4M7WNKWrlrdigqRxAjjkTw2Ne6Bpi
	 Knr6tjL0qUR5JZ2xybojymV3/mFbAKwDBeggqYgqXQYH6/A6RrQVDw8q2gH4nUt+Jpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvyyby5i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B8606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 177B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvyyby5i
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso7618451fa.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793370872; cv=none;
        d=google.com; s=arc-20260327;
        b=sbnHC48AvuqpYzoA4F44qxIfSH3NfMldEZUcXkM7nQSdt+KUT39MK37O50nGYIvMx2
         XMlSYhiJiQY/VCUSqWZGVxyCSnnGICd/fM8KkSeTimvwxlbOT8IMk5WwKKhOVpvKGYT1
         jwAcVkShR6DEbbZUP0sR/3oQYiEoUulAehjezXOOU6DbDftevj7lUO2YXRpbRdiOHYPc
         2la1c5xc83A5SV4bSMZWIYWbI2knTXfJuHN++Lh9DssabmAlrq/fstL91U/flUXYbD+U
         O0/GDMEl3zngDlrCMocsRnatinm31QUi7vHUI9LNvdK9XUIChN9TzmM+pebmnRuBHAqR
         ChAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lFTOgQZG4mIHctrB0aORwynv7cySmH6M2kM+pz/yXfU=;
        fh=iQetiEfzSDOycLT/iREwiBrRcJskO9Pd3cbox5jA0x4=;
        b=FT+3v9ihqrypuSiQxWhGt8uoyzacNies8DM/kABoHUOmeR+UBvpHABSq6D2oRGXPrY
         QxJyXCEIEB/wT801u5qc8aoHk8TtVI1V4qs7O86aMwHw/VJuq093VEXeT8qsrFqOwLY1
         lSqjyUiMyaDtXDVifcbGbPNn6PXNeJ12OapQl7YiWGIaBkYzJY5hKZIlJuCsMoudt5jj
         S+VvfEQiaqRQ/do9FuHYzqrVfZ4Su6pjaf94fSfINWiItmM7k/zitQihigUDWk8TP0Vs
         7NqjYW0YndE/yC9BM65AefLZtf81JC/NNHFMNr2Shz6LQsWJKfyKj3oMmt/JxC3liXFg
         GvCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370872; x=1793975672; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFTOgQZG4mIHctrB0aORwynv7cySmH6M2kM+pz/yXfU=;
        b=nvyyby5iSvj9vPr/RlViH2O81w/aEYocJwAZ/aYUkV7r8rD08aAV8jsmGlGkx63UMQ
         yGLcLMv9evOvo3HAwfAlPK39Ih2L1Sgjn0FhWD/NQ3D7W/7/N14WR9LmcjkyFopGI0Oa
         qSmRyl8U0VcbtYDlfjzguVp58CntUBvhkVZtFZ35L2BUiQy594so3ypjJrNT9ql/VNmm
         iiAAnoBEdvuGkh61R7ll1XT2OILnWy2Xq4psYYhU/9m4cDf2PxzqDml2V77IYiRQOsg9
         /slctc8paSZeS2BcqpIPhE5pDcC30+8NBagCMmnqHgeaX3YtTT0jiNnehBWvSCgP/kin
         DZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370872; x=1793975672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lFTOgQZG4mIHctrB0aORwynv7cySmH6M2kM+pz/yXfU=;
        b=BbhAWm33sXGU+Kt/75nym6y7C3yoZmx/L1OM9vAfw6Hv8ex02d3Fkh+pP92pycBq1j
         HsbNEa2/g8YjHtu/aKFUsynC8LB7uXWMJlekYcl2AaFpPAIwgJGotCZSZm1nDdC52yxE
         kn8tlhRYFZObhtbSK/l6oHGhYPUaROdNttoPxWdrMiJgjkYYdGTTb37/Y7Fhdu/Aasqt
         9ykfI7c18rRUVfi04xpPxuEprhN2U7pTJdQnDz5VDbAQcvPcXoah2GBDz5R956W2BG5r
         idahHn6WJOCWKVuMpifS1vD7AvIeUIgwxMgKO7soamFg4dGbQvKmGHECBHO7JTtKJHJT
         T/rQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiVDYV6TZvZhNKcAliLNCZvkA8XvA2ElWWMiyvpMz7ZuF/gWWoD20h/EhnyWfjHU3ic8kTO3UChC/P@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3cd534JO5n7TgOUvVR2H61jk4/zk6x8znYwMfTCIbMJfgp5Kj
	hZK6B4WRJ6TYizJ8wzdDUO9I5TpIckZd4D/A41o6q9ESl+krJNonA9ShoQ3BJy+9sE4BFprNQYD
	ZcJi0ppTUmTfpdBzLO/NV0d2PjLIh3LY=
X-Gm-Gg: AYBFou15JKUgFlzFL1Dw52VBOYc98i8trVC48j/w5DalF/ws1Wf41E2EqLwooBjZqNs
	wAHNxqZKwlWi37kT7YXgo6T6OLfJddtcrbp2hQ71fULgG0GLOMlkPTOpqLQOy7kb9q5jl9/9X6W
	CkMhUHkwcZYT5JlrwSYrQyNSbyiWLRefAh4uIUS77yei75omFrI8DdRFPZVuFGjjf/Cy2Si7nx/
	lfasMFGxM9WU5B0PY3+1k29/QxSC1kfgTMxeJM1PACu6NkGPMmPrzGRChT7lUUkfvpCziHwTRda
	HM04zuuWpJnOKfZpOJoQI33o2+l7Kfy1gBMeQPICFrc80K57KA9iJjD0xBYArNiahs5XLUrut96
	KmlaMbjBc7pdKBSX6iyyJraXkP3kCaywYKXhj
X-Received: by 2002:a2e:a551:0:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3acb7a65105mr5694271fa.7.1793370871985; Fri, 30 Oct 2026
 07:34:31 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029205751.3513474-1-holofermes@gmail.com>
 <20261029205751.3513474-2-holofermes@gmail.com> <20261030-dynamic-oarfish-of-dignity-feaef6@quoll>
In-Reply-To: <20261030-dynamic-oarfish-of-dignity-feaef6@quoll>
From: Fabio Piparo <holofermes@gmail.com>
Date: Fri, 30 Oct 2026 10:34:02 -0400
X-Gm-Features: AclHuK9dxvx1UcAhGMn9zzLe_VKDjbdEcAcVGd7o5Y08vLu8QcCLZKL1cDzYAik
Message-ID: <CAB3Lz5a67uvP3+1fXd8iUeJWzH8wUoPdauu8zVW4t4KXMbTN8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: solomon,ssd132x: Add col-offset
 and dclk properties for the SSD1322
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Barzilai <amit.barzilai22@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2026 at 8:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Oct 29, 2026 at 04:57:50PM -0400, Fabio Piparo wrote:
> > +  solomon,dclk-div:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
> > +    default: 2
> > +    description:
> > +      Clock divisor.
>
> Why this cannot be deduced from clock frequency?

On this module the SSD1322 runs from its internal oscillator, and the
external clock pin is not on the ribbon. These two values only set how
often the panel redraws.

> > +  solomon,dclk-frq:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Use either existing properties or - if there aren't such - existing unit
> suffixes.
>
> > +    minimum: 0
> > +    maximum: 15
> > +    default: 9
> > +    description:
> > +      Clock frequency, higher value means higher frequency.
>
> Why would the frequency be fixed/static?

Right, it doesn't need to be, and I'll drop both properties in v2.

I still need the redraw rate to be adjustable. I drive this panel at
about 200 FPS, and at the default clock it redraws at about
115 times a second. One way would be to offer the 256x64 mode
at a few refresh rates and set the clock divider from the mode
userspace picks, the way panel-newvision-nv3051d offers
640x480 at 60, 100 and 120 Hz. The rates would be approximate
since the panel's oscillator is not exact, is this a good way to do it
here?

Thanks,
Fabio
