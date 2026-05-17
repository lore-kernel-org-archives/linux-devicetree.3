Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF7B26F29C
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014337; cv=pass; b=u5BZIZ6HHQpdvjyfMTKqC6RP0tbu9DjfrRx0PlNzJZGjjY0pFEylCgCzDd/fP7FmgpeWFOOtr5s+d1sMNnpkUX8cOYk6QC17ke2o1/qt+1tEajWdo1rbRdphSe7DYy/Yok90XGRPDPmmNHZFUT+QoUMYJ4fOlfYsdpTOXhoSX4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014337; c=relaxed/simple;
	bh=n1P6YmaNGFDv2p6ZmM9LdiN1uTG6FS0M90BEV8DnX6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yp45mKX7LTSeCbCBNh6Sg2tW0dkOVnjqm/9m33CohXS+GpSesfS6hfxIc3QuZW6RmQdkJ+c9NV8JXhrwDOzA6fNCMw6PCgWYcVmAwsC+9tvwj36wd3yAuN2YPUuEnegIAtqTzEYZy5+N8vD4dapLj24HP2Wt+GmA2vLdCu9I8ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+fjeSaH; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+fjeSaH"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44509921fbcso629365f8f.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 03:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779014333; cv=none;
        d=google.com; s=arc-20240605;
        b=PXnEHfwWygEByDeo6VnCH+QQScl9EpcFPkyCA7AmYX4cnm+PTBwEDLCToDzmJmzMFr
         zKqArGge86eOUdcyRQIyuT66m5rDySue/qNGJLlCxkKoyb+kkz6kF33qNtErFk0gOqjb
         loX0L1UpfrMq5Rk38KpzN4jn7h/ukba/rfrcpPsHp6ot2nWsRw/0zjTEyOC5qGe1zuMt
         eR/5mfELaqVfxRzN2Uyojnc8EJh6Ls7Bp8dqHzO9q9BwmWCjIUZUmZpGRq/a7tW8iDLe
         wmORyWeC+Jxya+luWwZTaOYf3ubhX76wVNQu8KhL65ZEc8BP2c7d9Gz/HpGMChrcp7Qo
         rXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z060BpUY7G8SJfI+//kf48WLZodqLy9HAJiIXPtpuwo=;
        fh=9RGJPct/r0saIxNiC+z6nKMZ3UcmnBYeqBnlMV4Kh0o=;
        b=J2E16IpHbCtQHb9qsIZqtSnBtzwXSCC9xV+pS86REmzgpL5ZYs0rMXWFit9MhkeHup
         GHaSGp2SvFa1sRiJoIYyPw31T/VFv9CGiBNXi5iWt1Nu8XV/ltYaYCk74lXkJv2cn4dc
         KRp4ffVZTHipY6MOBxfb7VrvU7W+G30Nhd/RIO5CK0YvaLotHok9+H006sI3ouCzhbdV
         3U95DjJXVF9FnTwqbOQ2caGiTZiePJZoWJfkkXVChng3OLjVxZTnprlrzuBfk0PWpAXc
         IOLTOn4cckDzJEqRIARMPVr0yJJ05dcGSbIl6MLzVhCQQYgUjAIpuso5wXWvr8hB8xPh
         aQHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779014333; x=1779619133; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z060BpUY7G8SJfI+//kf48WLZodqLy9HAJiIXPtpuwo=;
        b=W+fjeSaHXNGv7UMZ961qAjXkrePqdLamQPy2vEcVW/JKKfLQDkNvvwOiy2k2zmzHAR
         4Vw2J3RbNULXxu9vEl4PzCl58rX77+LvSD4nHqmVz9Tbrum+OJjMK0Y36dO8S07IJUyZ
         tDcT3OmQ0mC5WLU6vPNgvHh2X9WqLKPDyZ/r9OZFoYA1LelJ4PYRb8DeE8EW8hAb/JC4
         W8/r13jISSRttfozleBjKSveKIpqjxd0T7Zjb0rSo4QwQH4HLFM3vAOtEVvqo/EXk8az
         j/KgR/VeMrSn5LTx1oUSyXfCvSkZk0Jh6deDMqQC4UUAvb6vJZWHtgCyrVuUHbPoKSxj
         537A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779014333; x=1779619133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z060BpUY7G8SJfI+//kf48WLZodqLy9HAJiIXPtpuwo=;
        b=bXmAHbjNLD6jt+bsQ9RIspZS/G+GNtB4EMMeag6Swtw2Wqe09WQBXjaoq0uyrt/PHH
         CBKVlobYTUFiefC9xstUOi1jZRHBg8Llmrv7DkHGxPkXIPrwi1PIT+z44UO89IbFcMcN
         q2Fyljcdsk45NUJFkDLH1m5h520592/zimePwzONTejNclfsnuWqN/xiPbCn4HYuKfse
         GUxgokkLp08xfWvu4Gxklq5wWt2fO3V0yAs8Sd97rGget4/73lW3WKREcMvqMIFfR5lt
         C2rRBwFYTt1JBCZsUY5uPyphPIuGFjdfBgj5+I0vdqKMLOFM1fwz3yd+FlNRAwVdOBL1
         wOSA==
X-Forwarded-Encrypted: i=1; AFNElJ8eZX7bHKZMLgb1ucLifigFMcLfM88tvoue9hxV/aNYw89Kk+wXMxrFzGUgoAgnFz0WLm3c39qjYGV/@vger.kernel.org
X-Gm-Message-State: AOJu0YyvkgjOmEP+0jySA3cPYKdD2XLIcc0e+6GqCkn0uNg1UhCIx3kS
	50NapqjKa76OMkaLtBoSFN1Ly+MkXQau8T7SEi+h2BbKeMfPljRkc+HjWZEgUikDU5O/UJ4+hPw
	n+wT5II0vP1Xu+CWDLc/vh8CPawPH/xA=
X-Gm-Gg: Acq92OG2H63bzS1T7eyL9SZmu7nCT8PKWhDEJUgpIs2g19xMhnm7Og+O58lqiW3M6b0
	iwGvZb8B8uS/0nSPh0yjLhAJT5NPUTMP+XDgwc8+p8b6UEITgVe8TTf0pJNJjZjWaTJ7ZwA8rEo
	Zzr2fqHMfK3BAKq5xTt96aXp6FPBBoNFc9sZYicteEAwj4goywVK+XGkTMBSX1DYw3AIxn13k3V
	2N7taRFvQGOc7tasrLkOAOLWOf2q/Mw/bwazu/VtwxOwPtPnfaeLWVgRCSZ49qGmK9zsMb39BVM
	ZTcEMxZ2pM881LmeoHiLuqNN7JG5Pmv7M7s9IXRytHIADhgJsxDKU5uqlmIZrO8E9ZJYS3D1iK/
	zFL3sIE/R7KWt1VnEjx6JEgbEk1wSBK+DT/CJvf2ruL65tLB9JxxlXY2Lyl43hmphvoy3QI53xG
	JV01PpWmg=
X-Received: by 2002:a5d:5d0d:0:b0:43c:f583:126a with SMTP id
 ffacd0b85a97d-45e5c5a0cf8mr16303135f8f.14.1779014333289; Sun, 17 May 2026
 03:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com>
 <20260516-veml3328-v1-1-1d4b663e2fe3@gmail.com> <4d1d9af9-af4d-4cb9-bcc6-e70d7640b98d@kernel.org>
In-Reply-To: <4d1d9af9-af4d-4cb9-bcc6-e70d7640b98d@kernel.org>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 17 May 2026 12:38:40 +0200
X-Gm-Features: AVHnY4KbWsiBarDYOBilUYCXGbEJfRgtCEQQHOGQDOyTn-3HuUsAQpQo0iHsNyM
Message-ID: <CALoEA-xQJ+JyJ0HHpNzed2NTXgnVnP14yVb0FHVCG=tC=DuuqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: light: veml3328: add devicetree binding for new sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 May 2026 at 10:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 16/05/2026 23:50, Joshua Crofts wrote:
> > Add devicetree binding for the Vishay VEML3328 RGB/IR light sensor
> > connected via I2C (SMBus compatible).
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> And then:
> drop second/last, redundant "devicetree binding for new". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
> >
> > Additionally, add an entry in MAINTAINERS.
>
> Drop, no need to describe what you did. We see that in the diff.
>
> >
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > ---
>
> ...
>
>
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        light-sensor@10 {
> > +            compatible = "vishay,veml3328";
> > +            reg = <0x10>;
> > +            vdd-supply = <&vcc_3v3>;
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d6c3c7d22403..134690aa9866 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28386,6 +28386,12 @@ S:   Maintained
> >  F:   Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
> >  F:   drivers/iio/light/veml3235.c
> >
> > +VISHAY VEML3328 RGB IR LIGHT SENSOR DRIVER
> > +M:   Joshua Crofts <joshua.crofts1@gmail.com>
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/iio/light/vishay,veml3328.yaml
> > +F:   drivers/iio/light/veml3328.c
>
> There is no such file at this point.

Thanks for the review, will address these in v2.

-- 
Kind regards

CJD
