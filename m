Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768EF38F624
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146384; cv=none; b=N+ag/plcAfU8YZxuCBxhwfW12qoOo85FKg1x9dUpO/qPpVdeYrD8mJnQICi9uR1zT5zRfoevbeGfIwvNuXB0zU1m1Bf/DfifAY7ps0Za1+ODiZozED06Ykna0NH+WECFTqifmczQrDM/yc1unrRpBEi8zb9509jqbTcbYNYGFkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146384; c=relaxed/simple;
	bh=EXL7itBy7SwyvckKg0HkmhYL9VAg/83tgztOvMxg/2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TM2s6SxtFU+q36oZoFg2RhZI09hYnbtp/yo+UZYAfQNoIg3P2Go8/Z+fO1QE3TxMosLQwEmhcPEMvOqFcSV3UOQ0pz17qRsOT49aKJrkVn4VSYJtlrhCvicr3pN6Ad6bqWrTfvdwoXgqiiUxDjoJ00zssTcyTV+6CoFE14uSQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso393557241.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146382; x=1778751182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg18/DzPAz6n2EUKFraCzWPc1dvLgfrdplVOvzpq5g0=;
        b=dLudlVSxNeBLluZLQuy2+c3CCUsovV3kdJkBBIRcqpgChkqLRY7Hh9RJQbflgdxPnd
         pckdkEG3utEMseExLvEXqxeO5sQ06duyzJXCOmnSpP3vL4i7wnqHzNrsI4DkfYLmG2il
         Aqmty8Np+i1Z9IS1FogFOzOBVPYRMPmhfW0XJwqlQu529eG3uqnUymOLk/uUcOMFdNs5
         pkJXWWmi+qUTmyrTLPAGm0XAnOFzUJS6M2REkQ8YegKQ1SkAKDEEvUk/+76zPOQqbNAg
         dKGgSSA0U35Pz6E4K6ym82gxsGMZT8ivnt0LkRsw9m4nc9VKrGFpbmXAU1xt6tFjNIdK
         OrBg==
X-Forwarded-Encrypted: i=1; AFNElJ8lh4HlziNwZLmgUS+dYDTzLH4mc+oxuA5VH6DzcThyuQaE60Mkw4HtJxjRC8kCFqnW2++Lnw4epaOc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0aOTuAmHsqycWRnmZLqiVh5ge2T6Mtq4bzKJW80CdTDAcnbLN
	FGr50POn886nj20DeB7j9RU1PAxhBz5GT9vf8lPyEml8b3AehFBCUTo6AkTtLmrep7A=
X-Gm-Gg: AeBDieuwF9VlunUy7wK2f4MjU2aX6GvooAS7oWQbIjyaJXEPsYW/PoW14k8rcwljXuk
	BQh0EdEK85qcokb4YaQ3zY3dC34LEgwnfORpREap4WdBGClSnwdDjEKD8E/Rh9zn2pQNgWc2qrg
	LiAlmdnjLx7RYgx7S58IWIbIAIqQ3hAOzwHCq68gQLKuLtY61OjjyCRwQMxlaBaFdrHK9l0DgpG
	pamjq0aN08wvjPZGCo01OJ9+yvkCsVqjOYxN96kCfBcEiR32M5+9y56UBhQDfXoI/ZA00CwXk+M
	3BSoqBu665I+3qX3N4juh729OcgE/IH7Ov6kkHI5QZQUgZ9HQ+wLsqxXn5rtsd6xA/gLVC9Q7h1
	sX/quRjz8GYgs4w6gueZhKbjCoH+ZcTmIgpGkhKzVJ76BEp+/RRR8GIZrCvsCN+lUubiIziWKZ5
	kuFE8tMOetB6y16XXzauIeAk5SR9ZwcJwahVnQhDUUSy0gtGgUvTCnfddbUcADGcVYSiieUGFuh
	FgdojKmCBORvQ==
X-Received: by 2002:a05:6102:418a:b0:60f:f543:232a with SMTP id ada2fe7eead31-630f8e78525mr3282286137.2.1778146382343;
        Thu, 07 May 2026 02:33:02 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfd8b5aeesm10868379137.7.2026.05.07.02.33.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:33:01 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56f70865797so347621e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:33:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Hub9YXrCMETWYne70rtoEIvyqKN/a2Fuzt7jfg6bvPQNzzVDrKKOC0KrzafWrjkBkMToL5jIFUMM2@vger.kernel.org
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id
 71dfb90a1353d-575591f7b22mr4356016e0c.0.1778146381121; Thu, 07 May 2026
 02:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:32:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAdnYVDiMFURqU9G5yuZ+spWcYwDXrawQ_NrL2-djW2Q@mail.gmail.com>
X-Gm-Features: AVHnY4I81FuHD6OzqE5oUv509FsnV6J3hu2KKPzKBtXEztsz99ISGa-m61fGNHM
Message-ID: <CAMuHMdWAdnYVDiMFURqU9G5yuZ+spWcYwDXrawQ_NrL2-djW2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: ebisu: Sort sound node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Sort /sound {} node in the correct order alphabetically.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
