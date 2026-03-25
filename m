Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C0D3DE456
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448616; cv=none; b=W4Xy82Bqo6OnnqXiinna5OEi5P1AbqHnhxfgebc5HICYVwFYCngPCQltSxkR3boaVBEgLpSJkMnOG3iIzpTqVG40Z2pQbkIQn1UttikpWaDrnsRy1rFoagACpyqjMAV4P+caVfaAJoWuWi7bzD/aGdZhUkRslz9nB/gsnAk3n0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448616; c=relaxed/simple;
	bh=JObBwXeLxUDs8F4FozMvFfqlMMxM8IgJ671ugIszdQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xe0XDuI2yHQqcs7YKKBf41f6xjelQW5spE+hQlvU984QO+w7tXw8r5GroJaAgRIVcK0md3Um+u05WjVYGLkMyK6HBNhM2D+XNYpsqhwKaZ7cvWS1N+YFyslULpZtXS6iQfKmFaq6XVL2mtj3K1vLl2IMdfFADRb6W+4AlD/iRp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94acb3d6cceso3425220241.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448614; x=1775053414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPfKdW44wibRLb8oNCfuNh010t8RCFkKs8K3Sdc1EX0=;
        b=YgCSfh3mSJsdhmBuYAZ/WBeCbaIi0Gl81mVee8md78wzt79j9G0yB2x2smQNLLMrVk
         /C2G1PBJyQohB6f92Q8n735MIlOtIAALbBLCrI8uhgZ+jS8/NGN2aQ+cpoF5Ngs2/IS9
         akXdDqJvjMWZE2YO64E58frorGTonqB8oRKML7R3v026vVnjVHSrEsa1cJ43Jy+0tVTB
         ujJlEQRjqijsdZCMUImJH9KcT5Ntut78VVuAAfjMsjMQ6PjqVE94L8LQWjY67cYAiSh0
         +IvlFDoVM9WQj794p+B8j/yOZtmbO9l0Y4EUEnF0Yqb4W7PeNYk2fO2gAI0/2kYA9FhF
         vkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1p+DoJFpayN0ERsLixClWvuHEuaY+YSMjoYBdrUy6LvoVCSifANWk+nXigrTuviy9yN3L+ryNITg0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Xb+f/Gli7hBntYffmaPzr+d7zfh/kv7NKrXDR2L61fADkaRc
	nCtLPfPWYyXZZHZk0BxAVCfpoeWFF+YoIX8Zd7tS3aYmbNzCTqyXIpi7EwMzxW5nHGo=
X-Gm-Gg: ATEYQzzFf/+tJff4ib+yqokNgdWgf+twnDG9+z6K/KYK31TyeqclZnx3EI0B3JYuVKB
	cMSZqkPCzl/qh13dx4udjx3ZG4eAoHqARfV/K5IpOODr0kTYR9Crb38I6cfpr4exHSiAQVGD2Mo
	Uvg4kDFnyTwzSsgtKc5RCt8IPI99zTnjS5/v+SPm5kZsUf2s5a+Xf4c5uqLKRvLofh63OSLBTsQ
	w19ZRr0tf+vJ3NkqIIpSDRyKqNHg81npj9bdSdViRNyiuEt+3IuFkzwUOVKz/+ydQyqFRU9B9+y
	LOJnZftrx1HJWkUG+SvGHMAe4yWwEv2MjX+e1lrSJBKKpLdL9n4Qn2a4QWFzhX9f/A9gyz8+ehJ
	65Gb5rmNWSQkzqIGIOUlyPt6PpINkL4uYMZvvo1mN8nSwXwAgpGdfIOjRnVPu0E0MgmU4IVyIEV
	LkziFuijV7eqv57JQRiB449qo8o38yT9mJpyMS5LHbfhnmRwBC1FYDKiQiCpkN
X-Received: by 2002:a05:6102:1628:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-60378fe8ab6mr1956844137.5.1774448613898;
        Wed, 25 Mar 2026 07:23:33 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb0740esm14240499137.8.2026.03.25.07.23.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:23:32 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6028bb29cc9so3854038137.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:23:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkWhj5QGJ5cv1tyyKTbwvmhiEhS9nyEDUEVnTfsvIh976zITBDDXVtHrRD7i0Tkia6+F4zJVvzsher@vger.kernel.org
X-Received: by 2002:a05:6102:2c83:b0:602:9977:a4fe with SMTP id
 ada2fe7eead31-6038723803fmr1660070137.19.1774448611693; Wed, 25 Mar 2026
 07:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:23:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtkSWb7nr6R3XEBtzzoXOEOqE3uAAGSfmxXA3eyaUVOw@mail.gmail.com>
X-Gm-Features: AQROBzC97DFZqc_tdbslxD1CrTlsZtSsIxK87YaGhcNdw9L7AipBy4NtEWpck64
Message-ID: <CAMuHMdUtkSWb7nr6R3XEBtzzoXOEOqE3uAAGSfmxXA3eyaUVOw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
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
> Realtek RTL8211F PHY schema indicates that compatible string
> "ethernet-phy-id001c.c916" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
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
