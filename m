Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6594B330647
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 06:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113015; cv=none; b=MRj+5Q4TGNvTaYX9nulVoWekAr60SRxgI6nApkw0uTdYTHyzgsq1WbFJEwcng8AarH0P5QuY8gTrgujgRGuXzzqIMJijWujHyz9X/9k80M5fqDBRn1cPfY+vp0Py2EaqvAX0g3p3EoHBjgoevXoz/H/s0hiN94E2F7T6hbseG2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113015; c=relaxed/simple;
	bh=ePSGLsiMhmFVR8HfoS82y6dWU7vjGnh0+ppzLHlH0T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKNd9KUfIh+a9FZzxd+YgxjippKHGSLEgIAZXMPdSLLbpmbNCtmjGMl6xz664SsEnMgzgdbZCCd+pP6kFZ9DwvJC0fb1oyom5yqIFpPjyS4dIZqUWhuyJvUfcba71bU+Xi7ImzPjpr6+ivetz5d6seEdH8KVrvP/SIEDIcka24g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so286176241.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 23:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113013; x=1775717813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yg/9zln3oOsSy7dvNy1b6XIOWPnJXqk+HqcDI8SZtzg=;
        b=VR+9zWqcUtM8efBkYH7S0Yvk9TXAUO7uI1in/mTyXnJVoBOyo4lDMMkKaE2cTwwMxf
         ifc5WouUh80hZhoAWU4/7Wi27FAodsYsFvu7fvuhGV8fWxIxpDL+anVVWA1wspNcP7ZT
         jiLddV0tdj6Fc2nmjZmrrcPwgR/0CJhjQrlo+KVNfW2sZE9ijIkFXr1/jkwbB5Z5P5V4
         ZzWZPjta1PXmvYAjNzdV0nD6XNkGwb5bbkcGMjcYRz+EYo0ukGtAhI1JIJjLwSEMu8e2
         lrvdhcuThRX9RdiQKMzMfAzmLSekvm9mUMDCaxLibQ7/f6TiOz14rnEk75VoAKYU+V/U
         j7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVinm2d/BZ7bPECNqq3KyT0pdOiOiMHGn1dSgTBM45evLDZxenSeKTAozuxJTR/aQUAGI8iQgaYOxK6@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLZmHn/mi9K7VpGNGeYzsgXZ3JNfL+lXv0F3owhZIZBfQGMxZ
	wrRAmdDtu+bngX7wc4TbHZEBW4so3+iDNwZ5u3rfxWtdPTBcUwLUqrHeXWZlhfgpL2c=
X-Gm-Gg: ATEYQzyBuWKH/77BM80Zj8tYpxnvIJzSc7BOMSSOLHuQg/t9e6O0bfUoJISHkfG7TJY
	wx2yGiXK+1tmxJnMIIOAa+SNmhKOXBT2biqkX1PtBQp87lNI+POxU8Gbdm71JlogQqR8uDiybXs
	FoMitxoBoYE05328knTCH5cXeI6r7pg+4d+Idcb57uhKoC9O7LeFKHIM/CxmIjv2ZeezbvIuHlc
	2LNiM67nyXNr1bvuRz8tKwXppAPyOj+KEEVCyGrIdZ1/pqV625ihcyi3ujjiKvJF1M/E78P4lcD
	JL4AYtiFj2a7rH9BO16D2ScB6zu/AsuWifAGmHwt8iB9xTXaGKtOH1FDJIhfoBTDyCJFEXD/rqD
	nwQVFjDUwd6aI8XUt+177EFNzz7J+ULXnVGxV6UCT1Osk3fu7+LVrkC82rxeasWL8qfM7dFjO/p
	atqy3U+ZyTUV+8/aXNN9RrvJbyIeGtbyQMzzUP4YUhFiNpYDebzsaMqQjwLQ+pL5B1
X-Received: by 2002:a05:6102:2922:b0:5ff:c64d:2283 with SMTP id ada2fe7eead31-6056820812bmr2796496137.30.1775113013270;
        Wed, 01 Apr 2026 23:56:53 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582b562bfsm2642353137.0.2026.04.01.23.56.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:56:52 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso449571e0c.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 23:56:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAcpIJOwFt5Ee/vZh+GlcpsLFf2T6pNP7H1HkZ66bVPLzqLRsDOyqUVAGQUj1dpa3RQ743V/PYHuHY@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:5ff:d434:b507 with SMTP id
 ada2fe7eead31-6056811633cmr2908434137.17.1775113011410; Wed, 01 Apr 2026
 23:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306104025.43970-1-phucduc.bui@gmail.com> <20260306111912.58388-1-phucduc.bui@gmail.com>
 <20260306111912.58388-4-phucduc.bui@gmail.com> <ac37o-N5lqFMwDCC@google.com>
In-Reply-To: <ac37o-N5lqFMwDCC@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Apr 2026 08:56:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6y4MkCYR-rgn=FA38ZUE_X=3oQWNOvfdyMo=D5_xoxA@mail.gmail.com>
X-Gm-Features: AQROBzDLl0x19_opYuA1X41uZg8W0wbeRV35EXp5674jHgoujIYpObmm59iBhFs
Message-ID: <CAMuHMdW6y4MkCYR-rgn=FA38ZUE_X=3oQWNOvfdyMo=D5_xoxA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] input: touchscreen: st1232: add system wakeup support
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: phucduc.bui@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jeff LaBundy <jeff@labundy.com>, Bastian Hecht <hechtb@gmail.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Thu, 2 Apr 2026 at 07:17, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> On Fri, Mar 06, 2026 at 06:19:12PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The ST1232 touchscreen controller can generate an interrupt when the
> > panel is touched, which may be used as a wakeup source for the system.
> >
> > Add support for system wakeup by initializing the device wakeup
> > capability in probe() based on the "wakeup-source" device property.
> > When wakeup is enabled, the driver enables IRQ wake during suspend
> > so that touch events can wake the system.
> >
> > If wakeup is not enabled, the driver retains the existing behavior of
> > disabling the IRQ and powering down the controller during suspend.
>
> I do not believe this patch is needed: i2c core already handles
> "wakeup-source" property and manages wakeup IRQ.

No, it is not needed, as mentioned in the cover letter of v4[1],
and as tested by me[2].

[1] https://lore.kernel.org/20260309000319.74880-1-phucduc.bui@gmail.com
[2] https://lore.kernel.org/CAMuHMdUqiaP=COTkKU_jK6Hdii+YJ5+zXnxFkOOnhLri5NakTw@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
