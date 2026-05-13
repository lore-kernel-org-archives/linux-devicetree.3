Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F13360EC0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677955; cv=none; b=StstVtrDhu+ln2e2PLiGsPqUy/2YE/8ErCjjMR0+mvObncVOgRtn7M/WsC4C+xoyVDd3hy0MjpbdyuwwAwIOwuA2+claGeO6LgDiscwrXY9rZXLbWkiXlMl27he6sSsS4A5SDxWMc++88Dr/VIDHsE92j4dJgedyYceWI8nrC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677955; c=relaxed/simple;
	bh=dzT3V0PJ0EtYExpUBsSJdQaC/ZjisOX3JzhU9ZCaz7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnP1u5wnKoWM8CF4inYb7KTx2qfJs7pw1H4fZskvhFYBCnStJ6QNY5coDrhcKhYH/P+gJqn4RbJsWlpZf8y65k0mIidlQy+wovl9/AOAWbYU4rN98YTdpEz1+nZtw18YjHyZam+KXWRtBGPCeFB88aSOeqO5fZvkq7nuVbbQkTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5752b279662so2219156e0c.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677953; x=1779282753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7kN1iIudHNJUvL4pmKJBVfs8sJZ9FSxEHa1dgQM7WA=;
        b=f31ovdYFR9liKdaQUdW/h89Ykh7rjFK+El7ivgJCZi/Eh2l9+raFVlOlCkbzd5egbz
         oD0uglrgWfsouAI31NXbtm5eOv8Bt/wjpUX+kUl5R/afc3gReRQ70Mkyj4RB5v/ICEj4
         JqZKYSuTXTw62Q7l5bMtUfU7jsDVHTK+91i/BD4Ls1UcI38v/BhEYUxJVL4Kh2bX5olV
         Z4Dpb/XxWa4OvGuayk0smx1lbekA8cLVQZkGbXBqWQRisILamH5Br3xagp2uQxLS2852
         /Yp3nMJpwNMxQStyjQ01ngvxefsU6RKsSuf6/sQhz3xivfpW7DgwtF6wIhkTQXdIJcf6
         d98A==
X-Forwarded-Encrypted: i=1; AFNElJ9yEzMbhjPZwRPEzcCBs5a5vxxMN+syJqIhVfHSe7tpbzO8KihUYk+AZegSZCiqwnwH6B6ZCXA+vnlW@vger.kernel.org
X-Gm-Message-State: AOJu0YxMFYFW/xdqTzzPAruPZ88kM04Go9E2btKNO3hpqklHX3QvjtLt
	DyQyXspHJe79Z4yiRZWN+uUJKN/e8Y6r80AALXW+Td6ydiQ1j3HGPf9Pwq8/ZEyX
X-Gm-Gg: Acq92OGzlf/1WGY1OD0yn+yd+1bZ+xGcm7fZAWBjS5gJU9LEePQwDELBzlfMIXFN2Vr
	UwzSJ1S9iCjEefRtorVOgtoLBeyKs0AdiWj6fgUQlsK9lxhRVZBVqgqSNkEs7Yysl0ZY4X/vKgJ
	cCerA/TgWQEg03cJRtJSiy9dRjEOqJn0MPyWpQOH/gXMmD7OOKWMggrBF0L/JNUFYct0RNkMiU1
	R56G45FA4jXNxM5wt6eJ/a+ora4DsZ8/m6RbEIyaO2MJFLmgTDTyxZvFAEp8wfFnxboHPRM10jX
	XOvc2luvs7l0a6aWh5Z9q7HpkIByWe+qMRkesXFF2F+aB51pON6wyGcEFJbjW+qUpHFJV6hhNgS
	AhUOT3N8jdJLzFx8uJTdqEwI2UVxzwyEO5bDXio0TKDBQGH4Y5P23g0xz3tGkupLixC9GEpXAvC
	3W6JIvDvOtS7QpxF+7vR4WfK1ouDcflzl4flW9GM9cGdxMeZpDYPeM8MBBaaMb
X-Received: by 2002:a05:6122:2229:b0:575:3c93:fac with SMTP id 71dfb90a1353d-575e8679eedmr1083005e0c.3.1778677953230;
        Wed, 13 May 2026 06:12:33 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef4012sm24382160e0c.18.2026.05.13.06.12.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:12:32 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-63270abd14fso1372386137.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/8wCwE+hOiM2SvoZ+mSKvF4uCqUJaPqXnHnNc4SRELciv8RiAYzIL5oPTLO26jI+hEugUEho9y7T6z@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:631:3821:2f12 with SMTP id
 ada2fe7eead31-637a90e2a7cmr951105137.16.1778677952636; Wed, 13 May 2026
 06:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGLtExqCcHiiixw12Yq198HV_s8ZH_cq1gazuw_2hjmA@mail.gmail.com>
X-Gm-Features: AVHnY4LeEF2c4Mc4gMH6K1pQiwZCCHRxKdP-2WPlZmXzSxqkEXKWG-8hJyRfniI
Message-ID: <CAMuHMdWGLtExqCcHiiixw12Yq198HV_s8ZH_cq1gazuw_2hjmA@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on
 R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
