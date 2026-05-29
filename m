Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8EA318BB5
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046284; cv=none; b=NbHjxUSP9avgnPM7RZXZQV7P/huAKyCEydghFiQ/iL3rfhk6JWDXqy7fSCoQ4gGT5JoueVMLqvMBQn0Npd2FCeRWBzYNCJZh3uBWJX4TKjEcqym4FP9PwcWKFw+cH54MRne4VmvN+9d2TvJIpMdaAwqdnuk3NEF253onOKxq1iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046284; c=relaxed/simple;
	bh=kYtLbUZvRD5QePWdGHp0WVDYoPyTCBDBRy7vdesLO3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qETkcFyvG0o4S8ytVFPQiMXcO3/dbpnkjifXFCjXqeSpkDW9GSNWQREFL5z6GfWF6QRVg4njeqjFfm2y8jsDfkD6sMcxdpFmE4p4Fds3H0cpbKCYCKdaUnrtP0i44kX/OLlu4Z28wmVwkqTZwySAL9URhrJuQYPkdM1v81wRKZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9638d15f871so858584241.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046282; x=1780651082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwHBv15OT5TkseUB+tc7tXoD4HnKtGFO1se+kWCuJgQ=;
        b=pi5nanwvcDIiouojDv7TcDZscY7oNCX+OhuzlCLDMcGmqJv4Q1muv2LQs/PRP3+whp
         2WoloJoukUg08jL79PflaNLnicLpwRZj4bGyblgayASrkCJnSLe03XkhKlMKPZGkCVci
         EGSZkbksxuIHML+4e8U95Ve5Ne1zsfURoomLvREILcfS8qVbni3R+voWw3ypTOAWzWP4
         0o2uK4NK7FL07y/fEk6Ouey/pMlzaRjqyFhMmgxUEb+lrF/9RkPwev158Kzcipicmzlg
         RI2lPjqjn1ZwNUDo0nzgxyuVCSGGblpTRDlU8WMoTjNkFR14ujdtcCXMkkCozrrfqjE1
         AaXA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZoY0RdnRIc7UmZooeJ3tPG+TZgkAGZHalVc+86EUIy/Mgit74N/nkBv29yMmCzVloeuYGEKXk11XM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn7V5GD6rOrNmA/QwW4tZFVb1z30Hj0aFkYZ94Z0A7f4PJUqKm
	EquC+J/tbtZCoaCJiQiYRllYfcaJgmef+ExQBcTmJryNVWXOATqZyyxChdJQ5510NvI=
X-Gm-Gg: Acq92OFaAX1zYyytPySXY13PWcLllZCX1MtdFVjwNt4O93Y19TScR9WIoF2OiPrhcIz
	vblDK31tGHW/HSCz0amU9t/1X4yoybU/HRdnSuGsHSLzbbU/B0y3/wy8ent/1XpM8C5So6axjp0
	Wr2xmNITVLjb4RUUhbJJ58+QWHPgYLNNigLg3Iz+aQWAjL/z1YFX+sP4cJgt/oYtNLxEg5gn0CR
	pDsQ/V0CsOq51tS42JyvJDLG6eTKU5thgzGxNzCJ5+6q/NzpnvEy9xwSKiQZHf6YihZKttyBS5j
	JoWt6dGxK4H45C4f6wbca0+SVuEjApSkN9qUPIRvg3vHqxJ9lzkMYfhCfALSUua0Iv53x1DF2hA
	4gb7iCdgM5FC9pwXTHuzkh1YYhNhKZdeDaE2f8ZVgbyLODaFIzKdheDUk3LaRl5OsUIA6SzgRtf
	wTcsuMFttNVni2W7JdPZfkoXJDsbUQhtb8y0vG07o5+PeHEsR75Doji7GAvYk6a98Y57Gn5ig=
X-Received: by 2002:a05:6102:4b08:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-6bf43bb6136mr592751137.14.1780046282241;
        Fri, 29 May 2026 02:18:02 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba8b912sm491441241.5.2026.05.29.02.18.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:18:01 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95f6b47b309so2827001241.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8m2uJ+4sEpIvomwNlf04swQ6n6ENOoydQJPdXhwYyZdvDMWeXPvFd8BwzxYiE+56o9MuNiX195VZzF@vger.kernel.org
X-Received: by 2002:a05:6102:5ccb:b0:633:8fa:19b1 with SMTP id
 ada2fe7eead31-6bf43bb762bmr656029137.15.1780046280143; Fri, 29 May 2026
 02:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528070239.33352-1-biju.das.jz@bp.renesas.com> <20260528070239.33352-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260528070239.33352-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:17:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX28+OpM0T22iJgoLuXS+F2oKih8sGxx9ySuzR=RUCWmg@mail.gmail.com>
X-Gm-Features: AVHnY4JqtqHJO0ps3n_Z4z8T2KGnf7vMdJofiS6JAPVhu9xbTRTYGd5mxlydslQ
Message-ID: <CAMuHMdX28+OpM0T22iJgoLuXS+F2oKih8sGxx9ySuzR=RUCWmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3L SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
> USER_SW3. Instantiate the gpio-keys driver for these buttons by
> removing place holders and replacing proper pins for the buttons.
>
> The USER_SW{1,2,3} configured as wakeup-source, so it can wakeup the
> system during s2idle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated the macro value for RZ_BOOT_MODE3, so setting the switch ON
>    pulls low, selecting SDIO {CD,IOVS,PWEN} and GPIO4 active.
>  * Updated comment for SW_GPIO4 as it uses a single-pole double-throw
>    switch.
>  * Updated macro value for SW_GPIO4 such that SW_GPIO4 == 1 would mean
>    that GPIO4 is enabled.
>  * Updated keys device node with !RZ_BOOT_MODE3 || !SW_GPIO4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
