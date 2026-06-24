Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C6D1DF736
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307443; cv=none; b=usxDzWfdLB8V8ja/twNkm2zvWc8X5uD6niCxxPEitoVn673MbclEL+1+xULo2JAcAuNV6QKv4/gB29miL4V9DJJtuuNgoWpCALjkEh7vFkdROKqieHSQwHEbBihlZA9VAaEx2BhlRo4A0b9KEwcBBx1z0T2ocMqCskJzxhZZEf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307443; c=relaxed/simple;
	bh=8OZs/3aYZE26lDlP1g6HVE9S8OvFdAoqeKt+7UfwzZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gK9WXdAjktWJhavJx4Yl/RB8Qe1++mb0zDDV/7+03fnyF2/6W4cN/TCL/wzR2En2nRbmQa+keRJRAZ+AwBquTSMB0YI9ODbXoj1nlrWBGOo2ht6VXEhrFPwApZGLDYo2aYCySwT/x3kdJu6wFhlQJOtqim+f1veJsp/MBVV+py0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8dd6e530061so15499996d6.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307441; x=1782912241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg1Wcx6kQ6soA89yd1uZgMly7AFGnM5Vo9LWO71DzuE=;
        b=OHsAVdrSLa7PR7oV7OXcACb4OCvapBQ/u/5PTTmsIl+Z8BZ0BqO8AQSRDAy8rFxfQB
         1Y2bfh856yOdQh8Jd9iulrOtJVlV3ye+9Kb59FkjAgMpwS1b7pw0IGnugKu7dRTiroU+
         72JX/UZ+I1gpZHp4H/U+Um2AKTq9ENvPejGEAPATAQuobGUgVmsyjKzExu5j8w+r6MoE
         3nbbQYvVEt8q5QewO1eVj+mWvrwzxz+4ovQVjoQYo/RyTGAlct60w5M3dkZhyQpfX/Wm
         A/azc5zbdldPMWqCljBEyGs6CDE2E6uqX/0zdhM5GTFK0u+P7iNhuCSkzNjGcJVPtuzc
         yHLg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3wSY7WcALWLEZq64ltyoD6KtafCUGyoG7KidjzVYuIDlVFQfsv4DOWmuUGULeyKxa2prR0rw5EoYz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QrHdl5+9c2LISKddnqPBKm+XyYvp86cFOjd3F+8YuoeDaoIA
	HlYoW9Aal+ZYmRqMFa/9lj1qymu/gygRJrTPDERhVLn0YDCKzY203Jr5tra6DK/z
X-Gm-Gg: AfdE7clyB9CXfacT0KZ2yxRVd3JbbaEsgxZ8y2ArSakB3+fUDJ73mcGUE6v3KWXolqG
	AakR+uYQK1cEZKolJ2GFfZGymgW6r3ywbbLOkrJapmDZ8b2qFtaohmrz275t+90nnpOGB2hTg9o
	emlRCXkq8DD3OPW+FZJ/Rv2YMk443KZgfyYcOOykPDxP37hIOlHeMFHrFk5BhCobOLuNZcLsxob
	ow8DEDzArNUEhxrmmfYIrpuUT/7btQC1l6yopUJkIPo94ztgVar/WasupPjUdz+9IUYvDhs3jrg
	g49IO35+eK2nnsYQ3g2sqJgpSK+ZS+AABniEqJTbjWFb2BNGc95S9AdDCYf3KOx0Ysm+SUlGZ6y
	cOYyG6LMd0QscQ1mVRxxL3xhRx+RYyxlgV/b7SHK1H6s72jjudPMbefhQ8i+85v10bG+lZzbsQt
	vjTnBM4+5W/TxgXIe2e2CDGJk7aOnnDVvjj86Ra6ili/2Wd2Bj8dGYdQ==
X-Received: by 2002:a05:6214:1bc5:b0:8dd:1779:4d11 with SMTP id 6a1803df08f44-8e52d7d621cmr59499546d6.7.1782307440590;
        Wed, 24 Jun 2026 06:24:00 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f603b7asm154478636d6.11.2026.06.24.06.24.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:24:00 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-519eced8cbeso12517321cf.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+mvMDyVcbuazWG205NJvtjoKDpECAGbKvHKpyWW3gsXf9LQl6qif1umyIxwb4nFCytAHDF2QShH1oK@vger.kernel.org
X-Received: by 2002:a05:6102:644c:b0:6c4:5bdb:5e34 with SMTP id
 ada2fe7eead31-73110289029mr1451557137.0.1782306976253; Wed, 24 Jun 2026
 06:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
 <20260624-advanced-pink-dinosaur-ebe720@quoll> <TY3PR01MB11346659E1A238C232E29946686ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <77976912-b0b0-4e08-ad9c-5080c4d8adcc@kernel.org> <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jun 2026 15:16:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV67ZuhpSjiu-rWrgyPAMafEDVALD5b0k_bFMYkfQnP8A@mail.gmail.com>
X-Gm-Features: AVVi8CexLBXpgGHtP-P_1U1b_dd2B8tjjEWGvz_S2PVq7GutBSnqHQxq1klHKgs
Message-ID: <CAMuHMdV67ZuhpSjiu-rWrgyPAMafEDVALD5b0k_bFMYkfQnP8A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, Brian Masney <bmasney@redhat.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 24 Jun 2026 at 11:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > On 24/06/2026 11:46, Biju Das wrote:
> > >> From: Krzysztof Kozlowski <krzk@kernel.org>
> > >> Sent: 24 June 2026 10:42
> > >> Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
> > >> maintainer
> > >>
> > >> On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
> > >>> From: Biju Das <biju.das.jz@bp.renesas.com>
> > >>>
> > >>> Alex's email is bouncing. Update the maintainers list with my
> > >>> contact details to take over the schema maintenance.
> > >>>
> > >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >>> ---
> > >>> Ref [1]
> > >>> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
> > >>> ---
> > >>>  .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> Please also update MAINTAINERS file.
> > >
> > > It is taken care in [1]
> > >
> > > [1]
> > > https://lore.kernel.org/all/CAMuHMdW0-WsZuuc7PoVNC5DBUoY9dP+ULmGTQ76VW
> > > MO_SjpbuQ@mail.gmail.com/
> >
> > Just squash them together.
> >
> > When you fix such issue like wrong email, fix it everywhere, not just one-by-one where the maintainers
> > need to poke you to fix in other places as well. It is generic rule for bugs as well. The wrong email
> > address is the most obvious example here, because it is also extremely easy. Just use git grep.
>
> Ok, but both patches were already queued by Geert for 7.3.

I will squash them while committing.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
