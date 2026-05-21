Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763E619CC14
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372013; cv=none; b=c9Vu2IUWCD5LKSo1JeC9pgv2Hawd67PZNkGiNaEV6FMJ2+80rNfrFu6KRkBpkxpRg6oVEZqmDpeOIz7N9wkRZcky3uDRp7BwFW1Zmp5VaSvJB5A//JHAX9JisuPQobNjCBzqjk65DyxkC3EgHg5JiR+/anhsURPtkVXdzgrMZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372013; c=relaxed/simple;
	bh=gVskXIGN0BqDs0yWinJ90RW5cVqzLqjAKOmRxH4PnyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2AD0AnbEgzqBlT9whYkEH5RJpMXxX0D0/4eBhxWRs4iZZ/B2en0CO3StPkgfcDBmite/b/Q46WmqCizvA0pkyQn0SI96K4GY1P4iX+W3omlFwrnl0O4Npk3cdhpVCK1r3UHAkaDEZRNsDypEFg5mPKXlKdrLQwhx2YOAkhjpBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57516e08474so4788563e0c.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372010; x=1779976810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QBlSLdZ09AlcaB/HvoSWDc56hOX7OMfzDXZEtMXz1U=;
        b=XXkeuhrd/d84ZCOwizInvE/KvIL5L+bEWMuAufurfeFEGE6p2nqvPCqR12s0FVXAfd
         h5IKtdXpdKu25SUjhLk6jiKr/VmsKK0iFrQWJuUeqLg10KLMJJ0B5Qtpl6ZrIKpmiaSI
         dqAD0zv4xG54nj8ykrzG6FZzagzD4bvWNv49OZ0VieP5F6WVhkaTDIgoNbZ/pn12zAqE
         fcotgvDP3Ta7i2uQwtzO+0Z2U/HBiTqWRHrx2vrKQB0TyWulfgg8tq12IhDJDI8QePdM
         KM0UT3mCvL1nhVLmg+a5SXF3PpSVkGbFvl1KbeggpVEJWWSnH82j+9mOUlDgIyWInQ5C
         rqJg==
X-Forwarded-Encrypted: i=1; AFNElJ90w5/krxwWakO+uvoWzp4BIQI6yU7nGeQmAkTkVXBo9Fn/ttllGoDtuydRx2h3PsCuHVCGU1LjX30s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7wqJbG9ZycwXtb3PnxgwglUbb7Wo8OSezmZ0eqXs8mfC66Vgd
	liUGsPbfuh3yFu1gnARqAnoFgdBpE1X3dUqQcY0z+nqVZdaiuFaYBxLleJ76U3ex
X-Gm-Gg: Acq92OFB9p65L+yGH94YWFqs5/3Mt0QEYSzMvjtpWmiriKjDvtU24dJgsxfff0wQ0R7
	9F2yG3JncoB9lUyo8Tc0CVE9HXcAKL5Jv83rRBce+BqMNjg5yPXyU40edSrozTO48CAutTstQVE
	rFMgqMppF0s8CeY/cGegWTvvWy2m8Xr0rN5y2XJ92Dn2B6SUl7y5MQgeXpHtUMtLzJhjICntqJF
	U1nCz9ajcJWpAbhpQu5A2k5BKV45FQSVoiWUAk++nNQyG9/5gow0XFTjh0Ricg5r6c313A20kCl
	h5c6vws1PVW/LG4518lR6okZfX3GPn1W10JPhHwcJTUB78+TYSjhvjHliY0LuqcjXEXfWnh9KnB
	gnO+COvwbBPSuR35/3DQCwrhnywX7tZGZ4Qid71J37hFYvrKBthh93iDkc8UMsKzQuuGrJO9BOD
	lv/Grpb1MuATW92I9K8rgTCaaNFEUuBz7S2OhC3AeBqnZLZFK8cQcI327J64Mz
X-Received: by 2002:a05:6122:2190:b0:575:352f:ead0 with SMTP id 71dfb90a1353d-5842214f6d5mr1669843e0c.6.1779372010356;
        Thu, 21 May 2026 07:00:10 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5857477fd4asm789925e0c.14.2026.05.21.07.00.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 07:00:09 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-631a7868228so4260100137.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:00:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9IM+M6iBKjvfV3ZP449ViPZCzeA6T7vuXMj2FSdL6Cxr0CXnW9xzDD/J1XxAFqBEXLlxH17OMvDyF5@vger.kernel.org
X-Received: by 2002:a05:6102:5109:b0:633:4d1a:65e4 with SMTP id
 ada2fe7eead31-6738ef739fdmr1863699137.12.1779372009252; Thu, 21 May 2026
 07:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com> <TYYPR01MB15615A925B2F724C51DD033EA850E2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB15615A925B2F724C51DD033EA850E2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 15:59:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnqDg2nbsfunPL7ED4J6Zp6ECRdrL9a-AgAEc2DGySnw@mail.gmail.com>
X-Gm-Features: AVHnY4Lx1ddrbWovmDBzKTUOriXSP-VOp1hbbdZqlSN3Bwme_D5xMs6oDFejNms
Message-ID: <CAMuHMdUnqDg2nbsfunPL7ED4J6Zp6ECRdrL9a-AgAEc2DGySnw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r9a07g0{43,44,54}: remove
 TCIU8 interrupt from MTU3
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Thu, 21 May 2026 at 15:54, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Hi Geert, is it too late in the cycle for this to be picked up for 7.2?

No, it is not.

> > From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > Sent: Friday, April 10, 2026 7:35 PM
> >
> > The TCIU8 interrupt used to be documented in earlier revisions of the
> > user manuals, but has since been removed. The corresponding entry is now
> > marked as reserved in the interrupt mapping tables of all supported
> > SoCs.
> >
> >  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
> >    Rev.1.40 User Manual
> >  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
> >    Rev.1.30 User Manual
> >  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
> >    and RZ/G2LC Rev.1.50 User Manual
> >  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
> >    Rev.1.50 User Manual
> >
> > Remove the TCIU8 interrupt. This does not cause any breakage as the
> > driver does not make use of the interrupts.
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
