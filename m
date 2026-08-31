Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3393CD8CC
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171305; cv=none; b=ufVhRnumkn0ZETYBbsD6eUwfg6mPfIgw00h8wNBmwvhQhdda/beCpYspkFboVhDMTPQq9OPlET8GM5uPyp0HoUHkE3fAHeI3ZLcchYLwFdXoh7jkh52/uObwCD9208J1FnUSppGFvvtDMV/kzHYtMfxnAKKX1jo8FzZaJ5rDTrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171305; c=relaxed/simple;
	bh=YT9wUVhW0s51vPl9ozRJX5g/Ld0RunnUWVRJcAsZA0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwVH6U+2hEdhoh1JWDGI22cmoeg5sBopySiKtumwtTlHiOy9D8sPRrPnEUxGanlDFku4VFKXO9GHsa3QGeOqeBzArPmnHzg6NyfH9LUkXGjNRiyK7xfq3obQRwxr6ezY8eoCvGa+8ge/AG2PguU+19dYS3BWXdOtPr4vHVSjhX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-782e0fc1e55so799215137.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171303; x=1788776103;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZTsWwYa5UrzyhFWaJ4pYb5oOhsLOCuomvKfycjwVEMA=;
        b=aG4hum3yx78KckYGqYdKlOzpkfHT+hKk9Zhw2Cw4XGrERkdUEP0NiPXbGGgDO0aKYr
         ICxKBB+dLSW29Hxtz3ZSSP95wMVAW1FnLaLzr0tQJhw1uXVuBS5smCjh86tCZr8fKDD+
         SYEYH09c0Yd5iv8dyaYPdpiyHEeW6vQ7LA9njch1+AlxBQbEtQPwc+fkxYPo0Oii+NWP
         JKSLbQuEcSZoBqXtxoF23sO8KTsIzntN4zb0xQVsAvBgum5NBoSIqiq5qsEtyWHWTYPF
         dzo8xvmCguuSSkLtzigBC0EyqOBBzisEhfV6aCpDfdrn2LqeQh5i1g0cBttpE65zg5ev
         EAXQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/V3l3aQdRdnrLZX81gAjsRXGZ2CD3tqI6HTnaz5Ddi308hMHsLB7YO0WJ6nQ8NAIVpnb+gzTSWgP1@vger.kernel.org
X-Gm-Message-State: AFuF++kOiR40k4bgQmWsbfHmJ+OL+1LkvX2jSeX5EJlj4oaLtnZggCV/
	88ZjwK9//KWH8CqeP9xRAeRNYbhy3cwl3u4qnP2WDUKUNVz0uBRK/nIY3luYOQRI
X-Gm-Gg: AR+sD11swbZV3h8jkdr3QbIdOAt0B4haKBJOOch+6lRSjIxeVqbfbgK9X7fjMf4oLkk
	7OJgMT5vW/QbOY8TjLhc6b+RVYSHOSgccZtlsZxFhES3bgQ1xf3VYH+Ar7oq/fPs9i4mtQ2lRrO
	U8cDorcieHsie5YggzsYB5vdWeYZp9DY+dtZ2d8AEZRO0zFrJpjEyFH6/SqU1EYTQQOhbkOPbv0
	kZKK+5N5+Vd8ahYaXKKzdeHROUHVDj+ytUAorgQ+FyN/li/JQ259XFh6KPsR78MIzAEVuk2GofZ
	KR5rxgze2Z0hfdsNpA15eoTKizYMpiL6+tltJPlzSGsegxgG33h96v8yJB33MjBVPlSgMlIiagK
	nOAnCNoE5VTeF674Pt/H5OxQbcJxKuvbWxQTT195CWPVL0vaGo+bTVoR6lkSnvGaL8LZ0cg6L8d
	BhRBMtYmNUCT8KenwNvC811/Wfo87qJ22Xcfe1r16KShSfQBDo8lPee8pB2G1egRaeSQr2My35A
	zJFjQbd4Ca4Ut3WqwWUZSGH/+zylGMIlkJEwoml
X-Received: by 2002:a05:6102:418d:b0:784:b9ec:913f with SMTP id ada2fe7eead31-785976f9c37mr7378501137.5.1788171303175;
        Mon, 31 Aug 2026 03:15:03 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-786b21c60fdsm5350237137.12.2026.08.31.03.15.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:15:02 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c7991578c2so958895e0c.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:15:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrLeODQi0/IAKYcqVfQ0UxkSHDmlFyKWMwkVfX2+TxcKIGeyYZQbojk8Etm4PYyBLQ7j+FTuxnyVyXZ@vger.kernel.org
X-Received: by 2002:a05:6102:1589:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-78593425ac4mr7888488137.0.1788171302452; Mon, 31 Aug 2026
 03:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260824080816.2356E1F000E9@smtp.kernel.org>
In-Reply-To: <20260824080816.2356E1F000E9@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 12:14:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmRMT_cDoDryYyE-3dXZ=sVrP0a1Sad6H3uLfYgx-erg@mail.gmail.com>
X-Gm-Features: AcwNN1X9aQcdw_rxFA2HYxMXnMlsNtXNFy0xLoTIZO4PfOkLwNdTmP2WF8AsNEk
Message-ID: <CAMuHMdWmRMT_cDoDryYyE-3dXZ=sVrP0a1Sad6H3uLfYgx-erg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
To: sashiko-reviews@lists.linux.dev
Cc: Prabhakar <prabhakar.csengg@gmail.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Wed, 26 Aug 2026 at 06:05, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `rtc0` alias is inserted out of alphabetical order.
> --
>
> --- Patch [3]: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support ---
> commit 4c031325b18a88190b2540d40329c1e40cc8033e
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
>
> Enable RTC support on RZ/T2H and RZ/N2H EVKs.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > index e86e6d3aa8a34..add0718f98dcd 100644
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -21,6 +21,7 @@ aliases {
> >               mmc0 = &sdhi0;
> >               mmc1 = &sdhi1;
> >               serial0 = &sci0;
> > +             rtc0 = &rtc0;
>
> [Severity: Low]
> This isn't a bug, but should the rtc0 alias be placed before serial0 to
> maintain strict alphabetical ordering in the aliases node?

Thanks, fixing up while applying.

> >               spi0 = &xspi0;
> >               spi1 = &xspi1;
> >       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
