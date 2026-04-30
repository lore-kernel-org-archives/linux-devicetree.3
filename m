Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3173947B8
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535676; cv=none; b=lGKM9LAkSlve0NBkm5djpChC5OwbC0CoM8PnGeU4swJcliO54X4TRyJiA68VgAk6pKEsI19NtK7b/ZIszh5/jycYzQd1A4/ugtPqRLCYOAuknBvJukiXRQGrrILNxhSHApvaBlu8DKk2QdVgPhR8aDiObl9/56H1Qqryu2m6PZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535676; c=relaxed/simple;
	bh=Qx7N7XiwMTRZOnlR3A3+kreNFdqkjoXXuGIkHSLG/HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca8aslTeu4q7/2ZY1SQzjWXNcd7A2ixC9qpBKoTAkCP74Z/Oou1qBAAjQ+SvO4z0K2H7uZUeo1FeKBTGXGKSHBILU9PE+Qj+mj3QBF0Hom+8j2gHRbjQdrE9el83XZO0i9fQJC/8xP5TXtc5GDJDo2tSDFwgkeZI31oGveXR9zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-47c35be031dso425398b6e.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 00:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535674; x=1778140474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE8U24d9+nmbb0Ym2Vjd+YsrRui7aXN0DwD087novig=;
        b=rRwKtvkeez0R8ym+38x14/N7HZhduMnlNgsuX77rIf+F28FMQhKTz4CCJxGqiRT5kZ
         TqBtU7s7Il2evOA1V881o1xlG0084Eka7mEIykMFbRdtrp8TnWPBlFo2JzmAWVqVchl8
         IgeDMe06NkuCiDipjAzmYG8Nya8szCeXN03YM6HJPO8OQp+KIL4MjS7IuN/tcA4xr5PD
         d35X+xwLvWGJcCtBPeraaqYqhKvMzEYybuzNww04cKEjana1TYZPghs2gcJ31SyXnZC+
         US8tSZU7waK7MK/i8YsnHjnOOIqihpUQrYv7aFlS1L3BSavVJADMw2h5PxTgF+CYs63R
         qgeg==
X-Forwarded-Encrypted: i=1; AFNElJ8A9kFEYTFdlJhLF7+pXeVX7w6OlpGvfEJuKi01ElZYFVgPIO+evf7fIHxAuUZ4p27q4+zC8U0LmwI5@vger.kernel.org
X-Gm-Message-State: AOJu0YzH4lUgEu3a9e/22FE3XVnXrasfjwOdS6U+AAgx/GmAmNn/jZ45
	l1Tz4VOhIfNyhE754f/tmsriq7V6mROl4SJ9Mw9c2kNkBRzjJ2oHAjEPBUXRs75JbW0=
X-Gm-Gg: AeBDieudS3Hzz88NYWzn6BPXyIl6uDvh6plt5dHhEa5614R1lDr5cm9e9e3RCl94Rt5
	kkBRgF1ZqxtNoo6XJEdGgTQSVQLxub0hh0WqW9/QjNHlNz+MjE5y0ZhSyfA5CxE97RF0f2PfsUr
	9/qeRYFsDNLgqblWTNU6Y+ZWIcbtrXQWgqBLZRTYOUgrRdh5OPbqoX4fp2z0pO0hKXt8EakFqu8
	3kUduoZoaTgQsSYdaU8Y6dEbiLCjcXZxLv8V8xeNmuQsUfIfsVRZSHZde/IuwK2K6HGpNFEx1mx
	FrGQEtZW6pVeqTjvoftCn74qaB6g9WhLi9r3u5XNML5ffT5gtP1ahFJuP8L822OnWFF7Ks21Oxz
	ne9IiVVgz+GPY/jDkJ4vnHPSH4E4at6zGiw0QQyam7j1B4vuHAoPwYVl6mpdIA7vFPQxZrJWk5U
	q94wT4FzSDZz45Tkoy3QRIEls/g5BtmeBsd7qjnGFRQnpqYGm0R4OCHibZAizkGcQjSGMZcF4=
X-Received: by 2002:a05:6808:e657:b0:479:c81f:8e18 with SMTP id 5614622812f47-47c60dfb99dmr577620b6e.3.1777535674397;
        Thu, 30 Apr 2026 00:54:34 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c43ee0400sm2467119b6e.7.2026.04.30.00.54.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:54:34 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-42fbf95cca8so504360fac.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 00:54:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+AC6JUHCq4aPbizvSCHyIc7dP8u6Nc5LHRiUf1vyg8pmt4pg+e06m8Q5rCmoMieeyFpzL+tzGBsW8O@vger.kernel.org
X-Received: by 2002:a05:6102:2c03:b0:607:97b7:c283 with SMTP id
 ada2fe7eead31-62adc184803mr537851137.14.1777535299133; Thu, 30 Apr 2026
 00:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 09:48:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUne5vUermQ7NnN67-QL_PM-SxJQogFpmSVUo1ussohXw@mail.gmail.com>
X-Gm-Features: AVHnY4JziB5Cy-6q6RNu-Sgl0OAxCbsRcDaFW7edOENQcMoEBistztZzpXDIEcw
Message-ID: <CAMuHMdUne5vUermQ7NnN67-QL_PM-SxJQogFpmSVUo1ussohXw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: renesas: rz-du: Add support for RZ/T2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 29 Apr 2026 at 19:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/T2H (R9A09G077) SoC includes a DU with a DPI interface,
> supporting resolutions up to WXGA with two RPFs for layer blending.
> Unlike earlier RZ/G2L SoCs, RZ/T2H requires explicit assertion of a
> DPI output-enable signal (DU_MCR0_DPI_EN) during CRTC startup.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -20,6 +20,8 @@
>  struct device;
>  struct drm_property;
>
> +#define RZG2L_DU_FEATURE_DPIO_OE       BIT(0)  /* Has DPIO output enable control */

Note that this addition conflicts with

    #define RZG2L_DU_FEATURE_SMUX2_DSI_CLK BIT(0) /* Per output mux */

in "[PATCH v6 15/21] drm: renesas: rz-du: Add RZ/G3E support"
https://lore.kernel.org/11313371ef0b31cb5f014e171ba0d9868eb0710d.1775636898.git.tommaso.merciai.xr@bp.renesas.com/

> +
>  enum rzg2l_du_output {
>         RZG2L_DU_OUTPUT_DSI0,
>         RZG2L_DU_OUTPUT_DPAD0,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
