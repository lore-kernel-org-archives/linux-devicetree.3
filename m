Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E273921DB
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636142; cv=none; b=u2sD4dtysdrAHkyUSR57aMgH0Sqs3n7hvgsv+rodvA5WRZtKyqTZKVf/i5aQr1hVMxO7y9jFqvyrdwWJI0XEUV3tpJc+iXK0miPDxz+fpmEaRASGQUlxrGQKFPPEFbjimm4IDZC6DJq3o2Kg4MJQZG0+loH/w7a+kS5a0mn3hvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636142; c=relaxed/simple;
	bh=GsMvELF4opNDWlGTEpj8mpTFySqFsau7fk/PwQYpXII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGJmcZmfdzCzCWvNmIFTAH9dTk7ccMWd6n4Tk2idAiUChDeAm9gy/Gxscw5raIyuJ7dkvodHFZtdTgHxmUGxMWnjA3r9PSP2TT3cHigP5phrzVqQdEQ9dKrjcN7UfHPzBJCvgqcsa7O+x+6FZqYJ8muS8mNfYGNJgiaAb61ViQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso3324505a12.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636137; x=1787240937;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBt/Jg+qpyyE8AdxLGWQ3O9/mbvgjD10TBEWdEpAJOw=;
        b=Fcyfd+sne/+qn7QliYHDGsyQoV6PN9/tDjDjgWeBowe3J8co+Dlc8jpCi5ftsP1Dl8
         ORC1us6zmasUsfAS7tKDKDq+DL+3mzEC29SRIMTzTnlLZSvwktpcRKL5W0WZb0kmbJPT
         MzRZgmMXcIycrA63QNxKlJndZIvORoZ5Cswj4++6tphncC7LOsYBciy8jmEYkclDBfJQ
         hj2v3JELoAqggzFnNw1W/zDEd52DvRgWxxHNfVnNNT1fT0VkrH/6C1NXgm5/In0bCCaa
         ARLyu4/WWuFfqAXfbzPMQ9cBpwlZQejmgfFE7XdPEs7jkzoQh0rudVpR3dFz4aHIDlfJ
         fsxg==
X-Forwarded-Encrypted: i=1; AHgh+RqeCpzNM86LHr/4fG/1Mb1QPsjh95HngCUEC4WmA1CMxUH7vqPvybqjg/HBVGoPpki5mAz+kJ2oiu/x@vger.kernel.org
X-Gm-Message-State: AOJu0YzrFuS9+mvTJN4Tj6vpqH5fGJAwCKiOjNKCYZeZypm8fAomhhS/
	97ElhQNkoNfCg0uQ0Cm1QpYf61sckraBsR3l2PS1GxBIacRFEUMNS9UOHWK1ByytYgk=
X-Gm-Gg: AR+sD10Y+Fh8fjw9K3aGBA8CXv7op44BpsNW7uhsnEP32PPCmt7i2UEkatg37CnDkKx
	cBEYEGTM19gwW3umZya12Grq+wu3I7X9oszl3HpNsn1JCqhBm0ZFV/9dkJdXuwLhJYbTdSmFoYG
	RylC7tGGzE1ZADeOum8wuAf/y2I+fNGhGyYAESQm1HzysibopfWdD5/3FDYHLR4WS8ElE4bUPY7
	e2QfBv4R+cqgjNJdf/46bnoQPzyot9OSDf8JtXqZfyNYz+XxNc8kApvtQi+c93zc0Cziews+F7u
	+emTIW8L/Jy08cWgdwaAT9dG6XAkdifpQc0+dNenmz5GUk1EWglQ0h8C1mQDavlvie5h5gQOlx9
	ZDKhkTeAk6WqU1j/CTQfJr0rSGyTzCucbadakR2fqePQBA9cy3/4ouDTnSiIOvzlup3xZuD9MOY
	ONzidm/mx9L8ZwXb1JsT352d37xqE3UnuXnu8Qpx2bon8cc7DhtBb4iweOGTHmb4Q6RtCTSzIQL
	GGu8UU3bklt6HjpJos9WUTNCA==
X-Received: by 2002:a05:6402:2311:b0:69e:2d56:690a with SMTP id 4fb4d7f45d1cf-6a3805c27eemr2362868a12.8.1786636137266;
        Thu, 13 Aug 2026 08:48:57 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f8a23ddsm1213258a12.16.2026.08.13.08.48.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:48:56 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso3500627a12.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro1bkisw1YdWkQ+vmq4BUDdwR75Awey4M3YLDrjOmIDIcnqP0fxpTbyGpZ+pcRryGqxKgRsOI2bVtvm@vger.kernel.org
X-Received: by 2002:a05:6402:20db:b0:6a1:2863:ad84 with SMTP id
 4fb4d7f45d1cf-6a38062323dmr2974868a12.11.1786636136389; Thu, 13 Aug 2026
 08:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:48:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWznqK2oeyX1WmtryYCz2wBH8wZ5c2H2_ShMDvrfO+C8w@mail.gmail.com>
X-Gm-Features: AUfX_mzi3GOWB6cpfoDeWmlHrS4hYhgS8E2rVsGg-6r06p1J_56QOvXSHTzn4Fc
Message-ID: <CAMuHMdWznqK2oeyX1WmtryYCz2wBH8wZ5c2H2_ShMDvrfO+C8w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:37, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
> Enable I3C.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
