Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1483FD139
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457089; cv=none; b=kCiTi6SKmVcB+KAm3CjWHIJ7JYQ/iu4pWDuyxc0eSJChXUIORZ9FeKfntmjZp3dIBduXgeF5ZBNCKBPen54imY/iH3e8cbXrQ5BlsbmwKbsRyim5QdlSOyxNkOPz5bNzREGd1ibdCYExPq13uWQg3T6UqvjK6CsaF2WlV/4BXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457089; c=relaxed/simple;
	bh=gP3RZMg0f5hdPp8eid35xVd97zHLBBEBxi52czKLWfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgoNvU0ASjRg744AyNYRSQ77p3Lb0bXpLUBHfgk8Y/Kmgj0Je5YTat0wnGUCWYiglvo6WGY5IAkch/X8dWYANDwALlTa9nF08vsebhg3Lq4SjebDMP/rMVmm7HtW1+K8cpLXyG4P0M8up6BQOiAbJseoMfzQrpzItSwevP8Wl7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57611a6a69eso2172671e0c.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457087; x=1780061887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGdu3wpW+ZJZXf46bMhLaZa6JyGhCTigibu3dWPaA6w=;
        b=f+t35LLEHOSXfs8yDc7kVCnIqGK4Eo3bKzQrozdH+Gt3DHN7rdDua7K1xoOI9oHkYa
         Ogm8HrikHVgUnTjyLcwPgxZkpvI2gvP/Dmq6fDthK5rtSppM2TG+aawmu+1MEHREFkGt
         2AGYCNqoDglTiYBBJ7TgqrHo09E9ZQXAQgUsHcbwQko2hr/MixpWRX8NR414qc/tKXAv
         hdZjPflpxmV/6jpUGf7Ultw+MGTh5zPNMYvDsAs0DI+R1422NNs9HDMNZvLtaWsbhmGq
         gcGyXCazxQTnLSja2uqfx6pfcRxXEhgJ/elNnI8rYFM78jMrnu8qokhUklF+0tD4YF23
         l3Tg==
X-Forwarded-Encrypted: i=1; AFNElJ8VZBzilhgd7GMUi7pyTRmbSAgu0aYgMroEVM5QGbQV+BfmbPLP42LayKsUuFL6Q0JF5fuCuI6+GTN3@vger.kernel.org
X-Gm-Message-State: AOJu0YyA8q4CI/VB1VlAZ1O8xB5lThO7qHiOzC7EMcfTdhtYPP8tlYGz
	1fmOb7sYCJl/AqM/xtq11YlfsGLFe11F3az3+2ofst586/jhxxR2ks2pUUW3t4o1+NU=
X-Gm-Gg: Acq92OFtgm2owNKonWSuZPc+xGWOQqBSzckiCiXgcLSkNKCb5+kFWHDUPARHJ8XQffw
	vdHGGexhemei+7H9Yc73EdqX8xsI+x5MKSdDx91FBBIhfq0KlAR7ethgZi/gk+3mjPtNVzZwalX
	s1WzW2nR+vNKPGH3NJme7UZTjCYmu/o2Q0n6PMwnRRWnSGz/kvp1VlY0EvzToneQPXcqPlPCfSS
	PqIeFivuWlFM75LdwcwLOmd1RCayUBDV6G5EPBVjdkRP7Dv9ZWLRqbc6dKrinSt4TqGAM6ddnJZ
	0XWkUYzPy8Odr17PHgOF8XLlZMUB68bJEXCSH1TpFQfHpAypNqUB4AqJO8jI10Mstqt7qE+8asg
	wBWRw4P572aMR4vcmINOG4dCbp6EEN4nEHHl1zODWu2+bp1I1E917VVttUpVu2oLUHXiqAg/Smk
	mJC6iSeYhn/MmDmBB+dLbPywAje4nYiN9xcdYCjjsnTiYiYZbeCeeQJo1J/UtH
X-Received: by 2002:a05:6122:2896:b0:575:24a9:78da with SMTP id 71dfb90a1353d-586626beb3fmr2007854e0c.11.1779457087028;
        Fri, 22 May 2026 06:38:07 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f719sm2110842e0c.11.2026.05.22.06.38.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:38:05 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-63130466364so2662174137.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:38:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LP0VwJ4Oie0h6kKPuSPTtNMLnmDyNRvCAdrTa5YxD9A6t480ZL4zYt/d43ChKXYUdBL8Tc3liVH/f@vger.kernel.org
X-Received: by 2002:a05:6102:2b97:b0:611:e0c2:1604 with SMTP id
 ada2fe7eead31-67c7ffec83emr1436561137.19.1779457084863; Fri, 22 May 2026
 06:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:37:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4HZcZ_uwbJ=4T8if4=ZvCt7ZeXqD-nN6gjKrcuTec-w@mail.gmail.com>
X-Gm-Features: AVHnY4JyuuJKUuuemzD_PPOU5Ss1XbJjkcK4kiycmX05BQOKw3A-M4TvFlP_g7Y
Message-ID: <CAMuHMdW4HZcZ_uwbJ=4T8if4=ZvCt7ZeXqD-nN6gjKrcuTec-w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU
 port configuration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Apr 2026 at 15:22, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The SoC dtsi already defines the du node with its ports hierarchy,
> including the du_out_rgb endpoint node under port@0. There is no need
> to redefine the entire ports/port@0 structure in the board-level dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
