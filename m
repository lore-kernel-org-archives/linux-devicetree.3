Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D18371875
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534269; cv=none; b=E0oSqsz8jps5lJ5q6RqxFe2zsAy4qfRmioHVps6aebCF5OnQFEBWgZSTqT6y2ndX0negzoj7qYPJOkIZWKytw2s2UwKDeyWZJaG31IA7sUn7fwYXXckfmlkHkCWv0poF9n7hdZdol8aI5zaPvd132qIJP7OU1ag5mf+AI6dlP+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534269; c=relaxed/simple;
	bh=mFU2c0LbIRehA7BI2cm6F9oxSoh6uyssNcntKmKFElY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nR6spiAcRqfaT4sicqxkrWu+Wz1LLLpA/8gY5+mLcBj0rgCARFDce5DIGQ8gUlNg/eMu+zdEvCAA5c2iYMgzP7JC8/x9bBg1miy+m8JQKIF1KBxWi3u37A4bJ2lTHlXXF/gKLTd5JBInlpOV3NvgcWXIruSZ4KVh2poZdiWkwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso287863241.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534263; x=1775139063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+bKV+ZQocjR4wxZ5VtPX9Yx9FjCc2fmvfO12wKPoP8=;
        b=tNKvemVSuDgmR3lXdD4YGpstx/Wd3kmz9edY7ucKWHVhdFeOQwQDWe1aKim/ey57kb
         Q6E2H7I0F4M6sr5ZRyMK1E6dlHs+SG8HMr6s20Le6IwPksviAP7mtzrenZd4+9emDoYG
         RAx04/bA57bJ+PJPq2j8vIT3Ze5XZ5Lj09KTYWEQd4Swe/b7WPSFBxzkSMH/m0bzVmdW
         Ka44Xr1GMP/FEZNQzkox53Y9/KudL/7zOjGwullGyWBlciP1uJ58884hwRwJdCr6nDi6
         4j318axUOre593+aAX/LDD179lkQlg3GxqqaG3Xl6RzYrhYU7fPh/xJiBOGDTPDXH1/+
         KMig==
X-Forwarded-Encrypted: i=1; AJvYcCW5uDzegLR0XjEZnjerl56iF7+uQvNkzC3vJRLY8TIEb0G+rXo7/PW07rfZuB1lJM6DjJI3Tm0yKhg3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy60Rz6ZxRoKqDklC8ukNAcBVAqJa+0PrFDgv6OlCSjp3Ac6G+b
	GGQnAMDQ/znKanHfmXRVmgaD7aDeBr3MLSGVzTag5IvjVhKTQ1sIBeGtW/xJa48+JTo=
X-Gm-Gg: ATEYQzykkwdHnSr9qjdrsTOGYC3j/l/slRqQjaD/5Uz2IlxE+vSVxMtHAc4zDmgTDiW
	565PbqH4RM/fm1ey7mNL8nA3ioTylVKMh191MMQLr5c+4IPLLVnFQ3dU+9Wh4VQzHylFtmx6d5S
	VhFIjq5i6EDn53TqnWzw8yMc67Wy8XjnNJvC2RxoU7yduboutUZdgr+9eheT0HrO7d174a5SZwN
	YzEOLF/1hBct/3rQ6wN2nusBuPazsE3KYhkXc7LM+joGLU5m7nGBhCx/vfFHFC/YcCQmnZkDSWx
	NY4Dgtfen5ZkSXF0+2JcGv8YOwFoM03uyGiDha8ZO6T6zeux9xLAxoXvGyQIasxtyGs7cLBXF56
	CZZBlGsI+B/7m5DCX3MnIh/wXw4ZK/DpHKLiuGb6GIHE66vTNpnhQYs+e3kFXog74WEvb+4dnm9
	8wggShJTFgGcgoeANC5tqKOMHaRqMp0jNrX9qmd4jYVHsi9qm4bWwmBgN9dNnK
X-Received: by 2002:a05:6102:5:b0:604:dfe4:8486 with SMTP id ada2fe7eead31-604dfe48ce7mr572618137.31.1774534262929;
        Thu, 26 Mar 2026 07:11:02 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d5105e59sm3181879137.6.2026.03.26.07.11.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:11:02 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94ac5cb71feso298441241.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:11:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhbiorwbZSuwZJCV6/OvxsEjl1j772yDSiGhvOpgLbHS7tAG8/2aShfR38ycZbfRE1Kal9abHZFuo7@vger.kernel.org
X-Received: by 2002:a05:6102:3976:b0:5ff:e769:44bb with SMTP id
 ada2fe7eead31-60387319018mr2792199137.30.1774534262074; Thu, 26 Mar 2026
 07:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com> <20260320164158.487406-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260320164158.487406-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:10:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqgVmugEVV=k2_u1xKRswu+e8Hhi7dKD=E4Lep9S96OQ@mail.gmail.com>
X-Gm-Features: AQROBzCL0y_jZA3BBZ1V00Z_wgTT1ywsDaOPuag8T0_jf1tfWGKQ90rerqBeNPg
Message-ID: <CAMuHMdWqgVmugEVV=k2_u1xKRswu+e8Hhi7dKD=E4Lep9S96OQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Mar 2026 at 17:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a compatible string for the Renesas RZ/G3L SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
