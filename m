Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A444C518
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887069; cv=none; b=mdNMVG1AA2k5UwPVXROIpYdmsz6sCHJi0QFkY//nv32jvQJTbCQcH50wdarRIpINr6CC5m0AyNRj4po2HeqERZ7zF8qk0I7d8oOfEJI3welP0QcHbW2lfbPn/QjBgfC7YKd2Dla32UW7m11nYjVM+7BWJYhV7Vh/gQ2RcU+lb9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887069; c=relaxed/simple;
	bh=km1G/HHhK4mc4byWSgOHYVTFBTlTfLPGrUqU5+gvS1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUpxm1oJ05eb2b60VmxsOj2+Wh4vR6XKenx3FpMKyZM8jQivRHwzfaJR4TPfsHsAW6++Zn4PDQTHGFdslxuPB2u8VrXt9qRZAVnmw/BRuXoXHRHASOKY9kdtYLG7rj4qHSzsGWqLIqXmgTzxRLB2irrlnC11aimR4lH93ZdLpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso1380255241.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887067; x=1792491867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGQ/GpRO6vnxq7fb84hh6aj2KXsZIXY1TgeovdND5Hc=;
        b=DT9mwWilgjQNwFDsV/3C4inzEG9eir6mG2qyCyKm85VE1YNxKCEnSw2QXR5Tz+YAP+
         OsmOoNQdEbHvcQLv768DfTCcBLs1FUx0PBOyIbhoUlA5EFK+XLqqR9Kn2mwUQ9mvbqY/
         fiR78PugaurfQRYSqu6Y5ABhU/LhP0jjqPzafDYiAL74LdAeaxdocvZ2wqZ/lzxYXaPD
         BSRhMEYP0aa+McagVS/jCmoTjRhzKYqPLNiFVdb1mF0ORnXKF2Yyq2RxKK+KeJyFuP9W
         RKYML3V/TJYri9+B5vSA74y8YF2FFp0hVBZnqDep3JgyhGAVwpmeAzLVws8iFyVXOHDw
         3nfQ==
X-Forwarded-Encrypted: i=1; AKwUvByM8UB9+eKGEVtYYLxMbNaPp587gJjk8p8iNdqjocYfFecYtEOEcBjBFby6gH1h8XIb+fsVI1gnIq71@vger.kernel.org
X-Gm-Message-State: AFq9FYJRNSPexDk1zjLbHLs5q5b8CdmZOLkgjQCYVNN2VRvr7aI1DzEu
	FGylDWL++3aDJaqK0xqhAXPQtUizN6jm7wdZDolBHJagvTd6gC14/RF6yj+0/8vN
X-Gm-Gg: AYBFou0aGWZbKD5E8qf+MMAE5/unLJVgC4ayBwzoqz5eR8JDMJ1fv2PuSyNIYPdNatf
	lX2w35+hncqf+gYDWZjagJzEzZ+zQc45HTTeLRaGabyirHSzwicLzxKuH1WnrmcWo92J6ZeNRTu
	KZx4UoUdb7vLUPAjpqCGfV+kEJgu1tdgXIcPnnAkN4iUHvTVeqfY6kegCT9XZRexGMcQQKvsRNH
	L6wDgaFgyD81SATJjDDGUG64tiKh+3MOudAkU6UnqDV6EXOq7xnJjFLdHeov8TA+xcnqQrqOXlF
	Odhkwt4+jaBp8Q9mBcpM2Rznfj/kBuR2WXk5a5KOMDD7tF4gM6JnpXxxvyeK1ERGQsEJe34/zGm
	YStwTsl5NRMiJwbUGnDcZ7IPq2RMH8mqdsDCEA/3tNwKrVNeiNzkIMW3TpKba7Dd0Fh1D2lsL4X
	OfJho1n/E0YyYybOr08R8GMXpqL/5DdGbpbw4fBZu/FLlyuK+NZUfQkkvrQPhOITZm0V1cBs/D/
	prnGemyVZMWpNGUjjc4IIABqtsGcq2rNwjG
X-Received: by 2002:a05:6102:579a:b0:7c3:440e:6240 with SMTP id ada2fe7eead31-7cb3730b013mr3470611137.18.1791887067030;
        Tue, 13 Oct 2026 03:24:27 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb35471536sm8264178137.11.2026.10.13.03.24.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:24:26 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-980c4258105so1250578241.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:24:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwm8f9o5eeafjh169oV8gWz7/Z6vijPHUgxu94N0bQHMfdcv6q1PeHGu2f7JAd0xUZD2NvuRLAIGRl6@vger.kernel.org
X-Received: by 2002:a05:6102:149d:b0:7a7:ad9f:53e2 with SMTP id
 ada2fe7eead31-7cb36987a53mr4125862137.1.1791887065725; Tue, 13 Oct 2026
 03:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718152500.2656391-1-demonsingur@gmail.com> <20250718152500.2656391-22-demonsingur@gmail.com>
In-Reply-To: <20250718152500.2656391-22-demonsingur@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 12:24:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
X-Gm-Features: AclHuK9EzHrMNGZ9VqEt7mZlsF4wljWQ4a5mjitwSzx9DSYBvOK99D8Xhx8xmLo
Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
Subject: Re: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 18 Jul 2025 at 17:33, Cosmin Tanislav <demonsingur@gmail.com> wrote:
> The staging MAX96712 driver will be removed as its functionality has
> been moved to the MAX96724 driver which makes use of the Maxim
> GMSL2/3 deserializer framework.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Thanks for your patch, which is now commit e8d5a57e6d0ce827 ("arm64:
defconfig: disable deprecated MAX96712 driver") in media/master.

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
>  CONFIG_GREYBUS_BEAGLEPLAY=m
>  CONFIG_STAGING=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_VIDEO_MAX96712=m

As Niklas has already pointed out in a reply to v5, you forgot to enable
the replacement CONFIG_VIDEO_MAX96724, thus breaking operation.

>  CONFIG_VIDEO_MESON_VDEC=m
>  CONFIG_SND_BCM2835=m
>  CONFIG_CHROME_PLATFORMS=y

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
