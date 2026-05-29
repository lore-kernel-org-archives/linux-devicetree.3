Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B733BCD1C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047086; cv=none; b=NVJDy2bAkxzu0nHzrEBmg/Kkb/uhqGTHRGJjN5ZYNudrrr/7jtdDIFinLWfnYMLBjzSM99QN3G+DMA/hFcKepWg1ZqCl3/z/6hMgwzWunyx7NwsoV2UnRLiUwSNfx4iVW/rBWg5Mxp1wzaFj0QV9HRoIaNrYXWyvnOPds7KtRO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047086; c=relaxed/simple;
	bh=fkaQRWlguE1XcB8+mrrOiMJJfeTRiMx6aKZNUDiyeY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgMlEUnWMSVhiCSSrJhD/jZHDEHaGTbtTnx2q5IVx0Np6swi5a+JgKWXhvUkeyrId1PcFQU2cZqlRkUszHBH+HGH3CjPJrCejmkWJ0xMhDDb1TOUTnOYQHEnfYo8Jl+biI9jonhgKimZyA4fMrGLa4JPh522jCZOULkTapvvKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57512b86273so9825358e0c.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047085; x=1780651885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jre8RAaVdOIJ6OFsSp8WRmOCVJOhYOYPv+VFLctcfh8=;
        b=mvGWjoebFd70sPxjRp9t8a11DMUlrgQcw6LVeWbdLFaQVjRlh5zJx8snTfJEZMllei
         x3KHPw8gTFN9wW9YSRzmpCo5EfG9jWjsl8zK8h6ugp9QoTVutsd8s3eaZmkOA+NtmpgG
         3m13DbIpZBT2XrSGJ2T7eOSdmWZvhHZ5TtoWHiNEmQeRw7CEITJ9fYo1sUVsvnuhM3gy
         k8LKxCEh2UfvwLtTp4kGrOplq/4sSuABAPW3EyTVOzhOKiWrMpvcNs5AIBL8aJjz9I7j
         xmh2kBiwAi/K2IhihQv5M5MbhcC1n9i+hj+IAvvKFyC5SJiJZw/ktSOXbdE19hL+JBbf
         4txQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AeJBEGcOPZf4NDvX9bSYy+iH0lVhlHeMSJ3/G+9AQ0GMd2PiflhnaaAg554hX1818BdivOV2zT0B4@vger.kernel.org
X-Gm-Message-State: AOJu0YzITneVamOnGXoRjmbxZcCiDb5w9i4fDMFcOGj4NeR9HlE0eGt1
	rurunIEdJHIA6/9VRdh7rJBCweV2/Pcr8BgDh4xE1oheKapNeRnGDa57vo4TnhZky2U=
X-Gm-Gg: Acq92OHBeb5qKN0lYMhHv/X3icrrf0g2tl5LgnbxwDamHTXiY9X0VJfOA84tFEk5o+P
	C5KvRs/q3fPcKjW7Ys/T61755Id7zwpfxe99tNHbye//hpVDZPntSkSkoE0XgdAS5O0NgINhV5/
	Z94dKXlPfPWLAC3hPNy6yjnIMUNuWy8ebUij92hLSAj238t23zWfAQwC2c+9/aQ38pwo2bAWf7s
	enwDgRd+P/56ACpqGs72m0bjdNUhO95ARrnqqHtfKurdZy3BFAbgBVCSLy1x0Xni48+BPP7ezaE
	Jb0ARYlFP86F7bBr8Ys9x+rsR3XFOokRyquLQM784BMBreYpqDMpgkk4wtYlXuWkzqvL+Oijbu6
	Ro49iwEd27DHhMbURU1hAKk2ONdaebVuaH0bVTBn3ADO7NMi1Y6gLYeWeQ3RmUYY9W3q+rL63Ib
	Bw4qQg1J0ll++kptX1+4oruDX72HKn678xVvz8r4FAK0oMrHIz8Oghg1RdzaQydM98n8c8Y5g=
X-Received: by 2002:a05:6122:4f89:b0:575:3b1b:ef01 with SMTP id 71dfb90a1353d-599f8ff0518mr624460e0c.9.1780047084685;
        Fri, 29 May 2026 02:31:24 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599da3ed0cfsm786148e0c.16.2026.05.29.02.31.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:31:23 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9639d7daff3so879522241.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jJyJX1ako5sCbW81MCQj8bkHkV13e0ZDW2PohzJLySoevzkMdmYXplc0HDtwLl3x0djpSwc2ojr+/@vger.kernel.org
X-Received: by 2002:a05:6102:1498:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-6bf2b42f26emr693736137.3.1780047083481; Fri, 29 May 2026
 02:31:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519100022.116318-1-biju.das.jz@bp.renesas.com> <20260519100022.116318-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519100022.116318-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:31:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULG5KiCrm2cFZoy-kvLEG6qZpLx1fNi44rZgEdFs30Jw@mail.gmail.com>
X-Gm-Features: AVHnY4L71FrecII2P--Vqr75z7vmkHcqqegJs4qIL_cRpsjO8D5Eiqg2zGFC3ew
Message-ID: <CAMuHMdULG5KiCrm2cFZoy-kvLEG6qZpLx1fNi44rZgEdFs30Jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 12:00, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add rsci{0..3} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
