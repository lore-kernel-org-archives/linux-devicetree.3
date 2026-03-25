Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAC83E0C54
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448980; cv=none; b=YKBeDBBnjj6wSwDaVPJU0A92UsyMSAf8sVVK/4d1QnvxkwQisfDaYQjJCrMp9fC6jc7BSbS2GULam0aPV3rRhfgQjoi08+nulRHrE8QEG+RiJP/JAUmCcaHsazm5ZzAYMaFB3nQRMWFpY6u+yY6ybKvAotqyzmfsjhMDaB8j44A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448980; c=relaxed/simple;
	bh=pC3PtyrMmcEpGp+hfMhfoNh9MzNjqP+1TIbBKnXeEMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SE9fx0s34pZzb9UxCoFydISk/XSM7A/M/uMUELcSUWQ7A06kl8tB/QoIXfCHKcGtTTH1INQQN6AdXqRojSC3zjXA91Ly/eglDX+yIj2xbkW0KlNrea5c9+ZHVVZKZdYObsHaDvu/JW0F70f4akSw8sl2LCdHuL1nAQ6gxWkrcEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so4104941e0c.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448978; x=1775053778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7isK/Dbl65EI3Rm86FPt2M8EyGlg1PW9pqCn5jlwq8k=;
        b=BsWqNENIJUDnZpcmF8F1CMnhl1TKkzheAOZL4JnwJ+TkeNduDaeJTwHgXkJX7sge+9
         DNDA5elXYDy7gWwkXrc6f4kq96pdWVuwejiGkN5Zc68ptYRzB9dzAIEWhFFolnUMdw02
         pvbiqzyOMXnAehaeUxyh+3j/0Pq8a+6LQI6qSYEtUQlF5X+s8GOiuqFHhrl5HOEQMFCd
         Bzs3X7EJNO4zDxSyd7e7EgFPrfn2QcT7iVo9QsilgvvvwAFeutiGD9GMjbcAGQ/m3DNQ
         zn/1MWv09qzzOQUfUDI26X8D+T5BXs2ZobjCvvHfPMaM23PjveDLagASslF35UQ1K2yW
         Icng==
X-Forwarded-Encrypted: i=1; AJvYcCUpjax1pgHi0/doIf6pwimd33Cf+3BPF2vQ/YUmKjuiXRyXt+zC+fJJX+/oH90qc5vKmASdXLVkkgeV@vger.kernel.org
X-Gm-Message-State: AOJu0YzjNyCZGwc8+I1ooa3ZWdkoWROz5l/Fr00yIeuzY9iFV66MHUxU
	zv2yEZFaA47dnWkaHxzRUE9NM/0SJVygJGVFlwlqeG2jzQFuY0FrZ0G16nyqj7JQEH0=
X-Gm-Gg: ATEYQzwIqUyuP/x8jsupIC2vJE5D6QAPrIaiT1Pn2MKC7aWu5gDLxmEaPcscRQQ07cw
	bGQ6trYW+pm5WZ3zJvgyBdc7lpyWT+QSRJ/k56UjQZ4gC6sZa5X11pn1YX/l05nTRfUQzpIDVBk
	rntfOuc/XPCZlZEIrh0Cg8BGeR+GSHyAK0BjR2b5EsDpvWFk/HS6qr9uBVVrdBXTURERNkgfSMy
	9i3LMzfGGWbJIKBE8pvZ/2aQd4AIDppWOQJmXXwtOpNugsYuIc/l5ZLT2V/GitmHoCA7nZkmfZZ
	XNVJkDDmvRBeQCQ8py2nCZ6qOgcsy4Qgv9Iu+eQG14RNhqxkUwZAHFlBoo0EloX+nXnhH26gNj/
	lZEc0XLxeFwDFKIkSC3CIzMqxDCTF/UWFcY3TGD/MNdmBra36TYmfTsF3coDvnEEpePXgclXEZE
	yE6A2QFP3t2NU7zJcducikjG/pApW+8cZPKaWNxkwB3PDgAzE6VyKO/Kthe+56Ua4VYlAWF94af
	qs=
X-Received: by 2002:a05:6122:4f9a:b0:56b:8ba0:fd6a with SMTP id 71dfb90a1353d-56d21d07a9dmr2121520e0c.0.1774448978327;
        Wed, 25 Mar 2026 07:29:38 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f877sm20580154e0c.10.2026.03.25.07.29.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:29:36 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5675d609621so4993538e0c.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:29:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSePUS/oFt3r4vs21L44Eow9OXcwY7xMiGytomvFAJOafhrx1WZk1oWnulnQ9ZuO+jwGyAJRmnUz5B@vger.kernel.org
X-Received: by 2002:a05:6102:4bc5:b0:602:7627:6c4f with SMTP id
 ada2fe7eead31-60387238034mr1950349137.17.1774448976166; Wed, 25 Mar 2026
 07:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:29:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViXzq0H0UwZori2gh2Tcd6o4ssoGkXmJfFFwiL5AwHwg@mail.gmail.com>
X-Gm-Features: AQROBzAzZX42-SVVM7_zKELfgnu5iQhGBNJzdGqfYMua7CEfqTRedVMpWqUArVY
Message-ID: <CAMuHMdViXzq0H0UwZori2gh2Tcd6o4ssoGkXmJfFFwiL5AwHwg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus
 txdv-skew-psec property
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9131 schema does not document "txdv-skew-psec" property, neither
> does the kernel driver support this property. It does however document
> and support "txen-skew-psec" property. Fix what is likely a copy-paste
> error from the matching "rxdv-skew-psec" property, use "txen-skew-psec"
> property instead of "txdv-skew-psec" property.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
