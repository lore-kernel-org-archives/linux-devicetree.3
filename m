Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E482038F230
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398151; cv=none; b=mq0ygitt5IEqVXeJFlN1XaZCs8CJTLqq0GREm4E5vUk/9JFo8hSm19Ufen2lZhzzxpRowsk2PbJf9IIGQujaFcF1Hw3JUzaEEmelr+U5uBe5V1i340zB6HiCeineqM12PuJgZE37LkdB/uR2G7lMkk1zVt9YPJDgzsfOpgJ5bVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398151; c=relaxed/simple;
	bh=o+WhlPVAhKpzYCClAwEqayFJhPQsWilH+/WcLbTlrzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L70zMHg3qHgR/UFsuJ2xuhXLswxfUV8TPFlNLNunafMMtqVXA8+u1Fy7Ht+c4CCwf+nwUr6mlfQr3frQkcs2RFY2pmd1O2lznLdr+/ZAUrFwWdifNh0BOb2Xad92wpfq+GuWAidngtiCcM4AxPuPvnyMrWR4QFjMwNr2dws7XAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-becfa735b9aso309385366b.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398146; x=1781002946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsS2TtZW0aSl0juBsn3FAuO5vMHjnqdOEeqLykjHEtw=;
        b=fn7aVzZ6D1G+FFpiO3gutBhqSVrl5vIljsA+ZRWZ8ByyvcwBGmdqZ1UDtalG5BvaIr
         FPMaHN+9KRDyAml0239Xa4UxRn7KereaOXPmuEGC8VRDuSyEJbTVjtnNiEZbDoMTgZj1
         9Bsby9ZOugM4krSU0gW01B5UE34C8uWc79bbc4Kcyw+KtmFsPXXZqqYWoU3qtMSPX0yn
         2wFQfz1ksTVm8ILUHSYedb3zAQp7tkOKc1sjCm2DcHRPOf7l81wAAzFJTjx0iePSs9MR
         y6o+L77/h2Xi+5W3GfPlhUeBcyNVlZ5gS1WHJGvDzwkXMQBLbibSNxdyPnXWRnDY9u9C
         s75g==
X-Forwarded-Encrypted: i=1; AFNElJ8g8MJJI5mMwXHBFAZDAQr4TvmgSsQRJax9JRozIHaEqQ84HGVvAEcFSpZh8pTId4ag0QO7/5t/sR3y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3qFZJLz6pBmeMD6OnS/j7NL0xhPExS3P5FSIkk4xwkb3bkPcX
	QRT7aJBZXT/3F3zK33hSM/ijo9IX6Uq8trADOFEqKsSScOeFjZ7GfLk1C/R4B19qYEs=
X-Gm-Gg: Acq92OEE5PqnCXLX169OfuVRY6kDXgxBM/o79/W4gUiJ40XJR8dSOIXppgh7ZQopDk1
	2HwtUIyJIG0lvapEqOUSfC3yp257dZB4rqeEtKUrBY8Khn+6xgTlwTEmohyjDaYvJWSdIsYRKKk
	nf+ur1jZvrTP2T7/RGOvbEGOjuczPUyECMJjwQ8reAPtOfOwgy2d7AxXQe4sE4H9wW7ud8E5XYP
	Beb/sISaqzMoSPFkH+UtKFag8ixDjD0LXN1zizWp59o7hk+HjLNlrlPTmpatO2Tl8HsEqWScony
	ag8A8imPt7yVDhxaenRWt6HkGIZIB3/ypRa7YmPPjHkGocEOnNp2XO8GhQzn1PnaavjNud7zIec
	Uf7ggOP6bKJ3MafHrXa1hhj75OdffVnqJRxJhGskNjvsjiLQZKKy2iq1bTcizLuXzvy01BmfahI
	gspFTBkjBo+b+KN7eyJZtjZtkt0eOqIG0ySx4p1WXGXwKbCo7O3YqOCc6FMlqjZqq1zXbEW/Y=
X-Received: by 2002:a17:906:8a69:b0:bef:1df6:12f2 with SMTP id a640c23a62f3a-bef1df61c1fmr122667966b.18.1780398145940;
        Tue, 02 Jun 2026 04:02:25 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beee6b6d623sm119528766b.36.2026.06.02.04.02.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:02:24 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so12827594a12.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8MHEEQT//W9VLgeTyIjh610j4A4TfWeXlmxwHEfC/75EIWlXtwyA/TP0dIXE8Ua4Q8StikRUbBPAtT@vger.kernel.org
X-Received: by 2002:a05:6402:2341:b0:68c:3424:af6c with SMTP id
 4fb4d7f45d1cf-68c8af0be28mr8197350a12.20.1780398144162; Tue, 02 Jun 2026
 04:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529130704.327505-1-biju.das.jz@bp.renesas.com> <20260529130704.327505-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260529130704.327505-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 13:02:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqX0nbO126qkZ9d3Q3dfybGxuoYheh5HQznvbMVF8oCQ@mail.gmail.com>
X-Gm-Features: AVHnY4JjPVZ175DY-spdN4lfI_UThiMlobV81yGcDvskIr0XOywLkltq_xABxIo
Message-ID: <CAMuHMdUqX0nbO126qkZ9d3Q3dfybGxuoYheh5HQznvbMVF8oCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 May 2026 at 15:07, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable RSPI2 on the RZ/G3L SMARC EVK board by adding pin control
> configuration and activating the rspi2 node.
>
> The RSPI2 pins are shared with the DPI display interface and the
> two cannot be used simultaneously and it is controlled by a switch
> SW_DPI_EN.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Collected tag.

Thanks, will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
