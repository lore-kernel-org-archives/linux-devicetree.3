Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDD3C76A3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055142; cv=none; b=k8q6HgfvCuqTHRCRHyj6d3hkueOEM3jdl54J31c5DX31bf3klXHlCSbip48MPTqKjU206I/i+FaFya/qW8m9dv7sWP4NvnLppgLGmySY1fEh7yqirqDltE7nAwNqUfECkaobO/x3Kz2LQpqPabS0132Px+tMvvAVrTDbt6uQgVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055142; c=relaxed/simple;
	bh=uQ4PvHJVfbTOZrFWm2Q/Py0yYq70+Va6RDcoUzVbHXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1FcZofzhZZZ/QnlmDo6G8bUsJjLTzmterusFe8kcXt5PDR3IjOGpUZBp7JWt/NkQMh/2IFEmsrNBxJUaNV/cTIkk0sOf4bAiiLZ7jRr7QnIEz0P5QwGXJCBb5O/t6wuuniDTfwReEu2Da5DZKdgUElfVmIHuaNlgZQZZIjhX7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57602a2d80aso4420252e0c.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780055140; x=1780659940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI1s7RBWZ86LPvUzgArfAozo8RX0QfMdUCXZm64P2Is=;
        b=srZFWsRu4bhpKV2yfe/QuLlL361GK4UIJaCdv9HvmTKYWqztE0EVGo0CJF7tbBUZOw
         JhaGWEb2YkxgSa0U9x0Eb9xOsW0dWzGNy7vL1QMs1tpWpsJl7OLshvbRDM5fK/T3AhHV
         5WJVx9EojXJpf9uq1fB9fJMLF6yBZZ34KZA+iq4n6nP0Zy8vceGgtgxk8Hbma2bKAMJH
         Nk0mzruq5qwRH4aSKqm+MEd7C4r5+knLX+A+blVNPQMowhDH43BJjF6llSkmCW78YeE0
         vWS/92sVkTHpjef6KeTMAnbnGd0D/BW8N9D5Y+3wFAiF5F942eqVTd2xz7TiQuOjwcCu
         Tq+g==
X-Forwarded-Encrypted: i=1; AFNElJ8r7ezbI4EP2ve2DI+WhWsIEgKWqmUHf09jIz2KHUTEkHvYOgAGKZ2kwqgXzHQE67CzvG9TZVwj6ko1@vger.kernel.org
X-Gm-Message-State: AOJu0YzRC3dcmahxOmgww2ilvb2CVSXrzP6mMTtHVqVReEucd+a8PDti
	AlUvoGxp4N1Udsh8aJ+CuFPAgaVQX0i/mHM6PzhvhaIgTyS6ehhL1LzYsVDCOwkyaqM=
X-Gm-Gg: Acq92OGOBgC68kV5gd9HH/7S+1JmSPNZxmKASJwNPDgRY1a6mRDWaoaFdAgnwIXj7Zs
	UfTdb1CpJh+JGJhv3K2WJbCZsWFzB/Xj7dbL7xQpChT4nPRAiusVOs0/It0uaB1RBky1p84NSB9
	jzfig0imLI42KxCWQVFmsgZkXLT077acZPWk87/2V+GdswKn2gvbEr3pBiUpfIeXEsSp+FLGLAX
	wJD9chEqyHh/W8IlpORSmBk2HslkouauxrKvZ+/aUoBSRVSInSqGwgPcp5wbcREG3oz15LD1Ou5
	8AEBQgO2q31tnglviYPoJYFmLphPPB6ATt6kksYkION/16GIGnPhAAsKovm/bf73bukZ93mHnDI
	pvtpBNcUbkx/VqQGh7QU2/eSHHP1RaGL0ReGVPdxIGLH23bA3kmK+wRh/j9W8HcCk4pPy8xcEfR
	oRylvVMm0c4yHlqQFdrYCpN4uAFVLj6X9bEL2qh/kR1V0SM0Iq/Aqe/9hezcbW3Ygd/DYQd0g=
X-Received: by 2002:a05:6122:180d:b0:575:3b9e:db3e with SMTP id 71dfb90a1353d-599f5c1bd2bmr708482e0c.1.1780055139789;
        Fri, 29 May 2026 04:45:39 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d9e10e4asm987857e0c.15.2026.05.29.04.45.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 04:45:39 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9617940274bso2594426241.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:45:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8h2YIURFqu1cuLTAic/UAeg/DBnY+rohaTy8lhzNE+hYEguYvwjQ0CJRvZ4C3ylL0ytQxLAApmutu6@vger.kernel.org
X-Received: by 2002:a05:6102:1591:b0:650:aa33:5dd7 with SMTP id
 ada2fe7eead31-6bf2d2f8f9amr796853137.2.1780055139478; Fri, 29 May 2026
 04:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <1ba6a98ace4ad9525d054cbaa308d3aeeecfa22a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408113217.GD1928916@killaraus.ideasonboard.com>
In-Reply-To: <20260408113217.GD1928916@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 13:45:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZqJw=T7voOnJjsh-Y1e79Mr9wK6zoGxwojzidDxMycw@mail.gmail.com>
X-Gm-Features: AVHnY4KloFUS2B9LQzF4TBeNYZgidRaM7YLq9hAhtI_KcqQjkDOZSbYAGjwtGrU
Message-ID: <CAMuHMdXZqJw=T7voOnJjsh-Y1e79Mr9wK6zoGxwojzidDxMycw@mail.gmail.com>
Subject: Re: [PATCH v6 18/21] arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 13:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Apr 08, 2026 at 12:37:03PM +0200, Tommaso Merciai wrote:
> > Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
