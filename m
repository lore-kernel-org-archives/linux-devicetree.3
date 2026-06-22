Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794573B6340
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138167; cv=none; b=Qm+wJYn96bphIjd/G/T+JEt8kuokocLAlpmJ2xBFAGeH++9DAMScTno2VFDkrarkelZYDlUn4UYS8Wjz6eJd57yBUzdCFbOb2cptggyODwhpFVOv7T52fmdtkf4fvTAqCBDt2LmN6FJ0TXXtPnYgGoLIbCTnGmoL9qGX94WKBTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138167; c=relaxed/simple;
	bh=Ro4kldSGCj75UbrLEjM6s2V1KehmmbZXkph4aFioNGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9PttKk/4jDG5iyk94Uw8wPDP8DBJ7VpM3ibVsYe9POGcROIuIz5KKg7BaJYsHm6bF5oaKiiiukmyF/BzYY/gNyOdZNM75lgBKJ4ntf5N1zz0CSiKs/wCemDWSlrAsG2CiBvm0oHL+BMpB9MsmxpqA1RkLoghfRW9AgBCxtctbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-96730906293so506686241.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138165; x=1782742965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aOq01qBfWokATPNy4wCdepesNQ6uzH++qL84v4Uj4o=;
        b=giGjnVocE/eJAX7AxJmAKou6s2fg0/7HB9ix0rK+6/5c/xI07xqTIkiLCfTq1Rf9TV
         6Wetu+8DNMN03sJXPpiAEp1FdeOLn050OAC6/lq2j28EnIefDl7VNJlmw05C/gDkO32l
         l/JLEjPkU/MHcqj3xroP3v18Jhctiu4HCjWswjY7SkBThJf3mzjQKIGDRyg7Uzx6NqET
         rl3vkQEGekrzEZviTGy04ldmkBo9Ilk7TY5h6en9qe1OB87seBjWLkQSOhH88y8On1ZL
         X6NFamSjKLZVW7VjeJFK++CCVncpb2ELOik0vSoqe2wakxTqq8BjM86njtz/EqAN9wyc
         XWIg==
X-Forwarded-Encrypted: i=1; AFNElJ8RcVhDjtHeLyVLjygC432FXeU4h8/K/uHoEryG8TM1QIMfSngCc2ZdiP7a7hP3UWpg/al7d9IySF2K@vger.kernel.org
X-Gm-Message-State: AOJu0YxAsAkZc8l1chOK2aJlxu+L9MC4sIpnqsWP1YTjyNXHCY4zGdjU
	FwV5l6IHo+i5aBQu4CUnzrvqdbtJVu8xQbherxDxCShyLZZEY7okiULUtKGqQOatxnY=
X-Gm-Gg: AfdE7cldpPwtiUOeTZBjEJgZerhtw/8Z3V+e4BBkinG50EYQ2cgBQGGH8R2xcc/A+7j
	85EKH0351H7MAwpUmV7Dz2KBVNB8MVzojRN8VdrUcINEN8y0KDUhej3ZhJhFx7KRHuZ4Tw4yh4z
	zRNKeGgIZ4KHJ1rkPcR1UkeqLPcPuEQW54MNRxcfrlhv5wekmyAt3I4KpcjrxOJoEVOmaX0iAfD
	VKyjPSY3f7JxtYlLMRbMnBVsUnQktlJ1rBqNTMotAjo03MmYKYsDiXF8gxbySj8+49lhulJtXb3
	YrOWro0o1RH+grdwsrHDEB0KlxcxUjzy3zNGfkXkvR3GwjT0tdwUnro+Vg+fH6RNb4qf3iOCiZT
	VeTrHhrxcwmgm34uzB1X3JGQxbrX+ob49/fveYAcJf8BXB4fb/eGwPqniLSkx8QA10jYCpQARao
	x44eMSsq1ZkuXayrDOw91PHecj0+O6PSKO3J4oNny3k3ENNgzKnQ==
X-Received: by 2002:a05:6102:f06:b0:6cc:16d2:30f6 with SMTP id ada2fe7eead31-72a76d4e1eamr7250807137.7.1782138165493;
        Mon, 22 Jun 2026 07:22:45 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba229c7fdsm5913073137.2.2026.06.22.07.22.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:22:45 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-72b0c3c72d6so1863173137.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:22:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LfjZ3udX/CDBPC7T0ODVxIVu1V3Ndo8BCOwvzDzPtBKdaciqPv+J+gGLfN8acd0tEkrqGinkzEyKa@vger.kernel.org
X-Received: by 2002:a05:6102:3ec8:b0:65b:c17:70b4 with SMTP id
 ada2fe7eead31-72a737b1e13mr8162349137.0.1782138164258; Mon, 22 Jun 2026
 07:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429115054.158160-1-herve.codina@bootlin.com> <20260429115054.158160-2-herve.codina@bootlin.com>
In-Reply-To: <20260429115054.158160-2-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:22:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsPgy9=n9GOHgPV8de30b2meCYQzSrc1pjukhgzXTNSQ@mail.gmail.com>
X-Gm-Features: AVVi8CcgwVfL1IUsAw20nH_KUPK4EgmpmvX_pvnt0Py4OJDVBYzHBOW9UXb430A
Message-ID: <CAMuHMdWsPgy9=n9GOHgPV8de30b2meCYQzSrc1pjukhgzXTNSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 13:51, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family.
>
> This controller handles 8 timers:
>  - 6 16-bit timers
>  - 2 32-bit timers
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
