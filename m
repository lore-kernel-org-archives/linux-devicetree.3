Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7573AC0C7
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147548; cv=none; b=fAXcSIP0qwMrIJwpnj/Y1fCmOS8cyv8LK+AoLjB+uQC1u5XWr1qZCPAiss7C357Ywr9E3bfZ9raXMR19wHitSS8mve3WzgEjSCFVr7oO95bh0NkyWSdh2Jz+HsvKjitbdXyrHruUnfgESEwKz/tRUBXIm77m9cjpLen2JSn4YOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147548; c=relaxed/simple;
	bh=iiCjcMKQDb6dh1Z2nARM6SLN843hq3vWmsi9ZYCMshM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4ITfahWJ94wht2GttpELyXT0I1yM3MjM/7wAyNfU6IJTGclI3QDv9gp2kFdoF6K/LfNR8TkuCcjb5R6Ddxb5Dvs1G61dJbmzUQg44mvgtiDZ2C7qVlo6eddnaTuM/F2hQXMghJBNAwIrixFAFXVMMY6DjjCW4UyYn6s8P9DVl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5751a9020faso423464e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147545; x=1778752345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+tvqFUkK77BUXjUfjU3WlAimu0K87l+Oc8QxPKsLbc=;
        b=WghUxCisxqOr8CpDqCL+in1JIXp25B5SnQch/GqEdUMRLMPPb7Om/wNAh3Y0M7LISx
         0XoslwWNL3KBQPL3O7vY5R8G0F1vbJ4Lj2Kev9n2KDbzMMLs4QdD1oOKznxo+2gcpgaE
         aMDVWPvQQVk0iYQCH19wp4xraRm71Z9tMmx74f1kmxN2vekjI8S9BMwXkOp+VsKZ83/M
         YbfZfQryhgvTdQliTHoXdf9+z9aJi4SZYLCBgur4pG02Lw245AEuiE2bGC13eR3MS/RN
         CQoDUGKBmKu6DJzyHmh9olB88AgR/grML3Ls3yhIWx9+A1Vp5l4X6cSMTqi1nfKau/Pb
         px8w==
X-Forwarded-Encrypted: i=1; AFNElJ8aa6iGzC6rZbA0V0MiD1TjEF29qYvZwYSmGJQXYQVTtssRR2tmqx7fyEWzacTJGkEHhOdwvFy5OUek@vger.kernel.org
X-Gm-Message-State: AOJu0YyKSVpoYSQxp4jHkB7C9v8R5xKEyTTjvbjIBBR9VdRh0jbXgOa7
	IMne5xlaqrLczTufCXf2v4dIvUfwi7n6bwEXziWBZiYp4eUJsI/kCTb+XyLcBZhS5/E=
X-Gm-Gg: AeBDieshCyTdwdHScINlJrkKlJcr34vRdpTDJB1SYh9ikEPkUYT9KjsZYhwePE3zNSB
	NzTIMcYSrkuHR2HgKzgUMxtfIdJgxYtgcVu5TRh26fZpR8VIRu8f4G0xtaldnNOKDoG7GRxx547
	c8bdZGry/iPTE/eiIYLbSb/Nsxb3vLlVYV4UXWIQ014dP1fkB7b6EqFjL5fCio/hOTu1Gs9KyK1
	vxJKj+aPnEOOo/LMo+ZoAQFC0/NsGEVm4vBbclvwmmIDWsg8Brx8SWhdf55zSNYSunpx420SK7c
	gAFNV8XCkWh/Qx/tZ0IYfGm5MIakZ3SWmF5gCliCIbRr9uVJfX7thrMRPXCWDzWFBrreuMm1v3r
	yKJLPsR9pLX6F/1Wr/E9oKdXRi7gMi9dRQIk/Z4UsQckz7+mEcQIcCp2tppvlFTXl1DFHF2IMmd
	0VQmCMYm585O8XB3nV/SgmR9SxBNKPExEYmqkBupt+RGgo2LiqhQA7gix1USy29sRBzv/iB375m
	ugYpf3xkw==
X-Received: by 2002:a05:6122:4089:b0:56f:2f47:4e69 with SMTP id 71dfb90a1353d-5755960af8amr4195594e0c.10.1778147545310;
        Thu, 07 May 2026 02:52:25 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57560c80bafsm2463261e0c.3.2026.05.07.02.52.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:52:24 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6137374b106so460349137.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gnUmOZJXKRqKIofdJ6dNIwjjZR6NhDB2DqmBhF4uDsL7wLCQ51ag/3GCwprESW3+lYdMuaFRXkC5l@vger.kernel.org
X-Received: by 2002:a67:e102:0:b0:602:9977:a4f5 with SMTP id
 ada2fe7eead31-630f90ee36amr3499863137.27.1778147544736; Thu, 07 May 2026
 02:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326111953.31024-1-biju.das.jz@bp.renesas.com> <20260326111953.31024-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326111953.31024-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:52:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1M6D=1TvJs5a2BPUH7DqeBks5gSi8E+jYfTdw29wRdg@mail.gmail.com>
X-Gm-Features: AVHnY4KE3t_QeJUhj6FrfQKOY76vzo6G6nbw5yB_AuakYbQaBIAxN1jj6MHUy4A
Message-ID: <CAMuHMdX1M6D=1TvJs5a2BPUH7DqeBks5gSi8E+jYfTdw29wRdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0
 (GBETH0) interface
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 12:19, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Gigabit Ethernet Interfaces (GBETH0) populated on the RZ/G3L
> SMARC EVK. The eth1, pincontrol definitions and hotplug support will be
> added later.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped ethernet-phy-ieee802.3-c22 from compatible.
>  * Fixed the typo txdv-skew-psec->txen-skew-psec.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
