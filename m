Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4E1F92E
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206927; cv=none; b=QLGdwRk2rHGT9eJt9YX/QlUi6SSTQKaM8tdsYLnQFAYaee36KPJrBasBUMKeXOzQ5Aiqk5A5fDTPwTry55ube2iLlee6bkanb3QnJTw/hvbY711nLlWt1Jw9oM/RwMxE1v0xZi2BHPIthxdV6FtWLZx74qtbSqY9CNKF5bjV5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206927; c=relaxed/simple;
	bh=Mo191O7E9T+4RM1pvPEGJkHX0h7C/nugkZdEy+VTOts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+rrqKVlSkPyRugke1iMAkCCSAWAoUxUiD2b0ngr1S1EuWaqIcduYbmvCJmjUtW0bCF2QTY+K/Q+vBzpYVKJ/tBpTNtWymGqGdf7sl2AMe4CqAIrtSxNsRXSNhH2ZtPM/157maAogXtECca566zGBxI6E1SJYJpYuUxzuAZ0i40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6054ce34c0fso554934137.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206925; x=1775811725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qsj1RGLAszaRKzpMsR2E+ns4h5R80DTAT3PdStNjiP8=;
        b=K40RnRg3ZOlWMnMrcWd2mVeEogtlYwn39dXtIHlODOgTNv5qNYSIw2wmfrbqdnbj1K
         pas3e5pCavgo9Wf2G4q6GNr4vmZJ6g7DwqwOvnMQh5QgYfFuVljvPRruYGK22UQdXEEe
         clfHnbyC8rZJ4+6MZeJdlfqjJ4aRgZ2FmzxyzBojzfB0nc1nGGWV7uljdKxyY7e7VLdG
         gg1l40D0e/5yL0MXQW9aVMBOMMgbyAw3AWsDmALL/mY5RHB7vT7bN8RVJ6SOVz7qdSp1
         tiUVYE5Y1Wg8ktnPGCE7Q/BLWzxCth8fBFPxTYdDDYloB9lSfl++8PTAtf83nRDywvYa
         Bpag==
X-Forwarded-Encrypted: i=1; AJvYcCXPYCQxY/HJDYGvZQo7VIKiHvi6qhI8cvLntWNA4Kc5vT9BrOGrdA/8tUN9d4zIDFld4RPlNaY9y/Nm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/EwCQal1CWej6KQ0RlpJNRz1OXyk8UlL5BG3zH11kGLvYr9Z
	LJy0T1TPSpXS4U9N3M8CucmPL6+S0Ns2jR/a/GMDoXxdiOJqpGeugF8ItagnWElr
X-Gm-Gg: AeBDietqsum1drLEvTfhGp5aJiNTC7j0Scyh/rtOScpeSF3dSUbYo8pRI6j2aiFeFEL
	2w7pCHUJdLcZWhGUmcmiy2jBbJ0e/WHF9OSQUUfbogmflurkdoeLx8Jg5N+pdKvhTE//lNTipVU
	PIYtu+GrvEUyDnR5MAwdCvrxG5pDQhfxFtnBdZTeufvWsVTXgfbhNvcrPrYQXxDqsmAJ9VGyxE7
	eGnY0mlGYpVCV43draNDybNpvfP7VSaMCaMHiMuVBSy/qt2qVOgSC1fgT/ATKj4EvzYYDWps/Dn
	qpy6ftLa8WBCbEHGWU2CGjAIxmM5g3+nGAbOB1lXtyGkQ2isjqFWApieXfxTfre/peSGyDCXdR/
	XOuYXSgAlj4Hp4ne2NFQecBcowBun0CSJHV0UDaAUzSzvstKEMsxhpcXlTlAdcJY/T7j7PsQyI+
	Cxyz/7pn1dgoc/hyq6LzOtKCjfF11XZ4TpuAsAtxh87uv9OnzCLAK2rxpj/yK3H8cc
X-Received: by 2002:a05:6102:9d7:b0:5ff:ba2d:17a6 with SMTP id ada2fe7eead31-605a48923f3mr767178137.0.1775206924867;
        Fri, 03 Apr 2026 02:02:04 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm5468851241.7.2026.04.03.02.02.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:02:04 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso645946e0c.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:02:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3LCW6vSulXkWlJrOc/PNJl/+EeWaIBuadPAJfjB7MbG0gJLWNHDcI9d/GtD7+pZkgZpIcaTnXjZyE@vger.kernel.org
X-Received: by 2002:a05:6122:d1e:b0:56c:ca38:ebeb with SMTP id
 71dfb90a1353d-56dab8243c8mr760736e0c.2.1775206924117; Fri, 03 Apr 2026
 02:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:01:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCRCbqWdJMMEsJCbk2TFVxUurjOmFxwLMYxHzPdDCo5Q@mail.gmail.com>
X-Gm-Features: AQROBzAnTN9lYrSaM9ZtCA2x2wm4A4eG7aiOhMzuh5U7vdK_Tlzo08dmx-AhkbM
Message-ID: <CAMuHMdXCRCbqWdJMMEsJCbk2TFVxUurjOmFxwLMYxHzPdDCo5Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: Fix missing cells and reg in
 Draak/Ebisu panel DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into Draak/Ebisu panel DTO to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
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
