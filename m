Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CF4028C4
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661615; cv=none; b=rtdpMbSwelLnv4IJlz/hf6HLiiZ1seKfbMDho/jmIR2rwQoLhS4lACuiw08RrMMJf9Dic58k8NNpdBnWokMMMaRMzJi5OO3ZEnwdzPBq4j/lw8WEWvcLlyZ+N4nk2INOA5ScodR5bXtftKrVU6HYAmCg4+/rypUhRjAHFW5+4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661615; c=relaxed/simple;
	bh=QCWu+1nCsFU3Ed99yMQ8CrBj5gAQSQzojcYoisfIgnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMu/pasQHh1LBIuh7qFWPkCTHsZaFFS6k4SGWDDXRdEKUuD1T4OKmDAXVGg/FBBK1M9FQW2LlOBhI40UvB+t3dSfCK4n8SvQzhloJErdoPrGkmKgAwPeOzaKpMl7focWM/s+JLJ2YqROvUMSNDmNuN07PL8vuBfPCvM5WwUhVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so2618295241.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661602; x=1788266402;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lItA1IXA9IE0IEBaaAVaQ9GLMnrPHs08yepsXMWLXUM=;
        b=e7jqwNqwAZhfu+4XhbhlyxK5Omkh95fWtQbgEGtwV2dDy74xI3hNsIk+ke+VcW2lOQ
         GMqm6DuwOcKWfDRQWIJGFQY59vU0wJE93LnYFsfRXagjtdMNul4P5zsxqMrHv41+kVPL
         mmUg1j/aU5hcg+E7FOi1tGq8wM/+CqgCOt6qkDQUOpy6qpKbxRl4knzPytysJYf4ScNG
         U+gAP8unSQdcvLsPwUevThbDV17uylReehc2HJZToD2uDrxVY1HvuiE2gMGCEAPI47f+
         MKqAkbN0Os0NTXUvnmrUzzkNSuX5/wYVhfvBSp7RqbYCEjipxQhnlwJBgjTKj92AZstp
         TJQg==
X-Forwarded-Encrypted: i=1; AHgh+RrePtuvDrShWyCuTWKBvjokLtWk/Kdppwk4hbBvxAqMkrbkCeZI0HyNJ0+o6oO+7LqiD0B5Uir2v+lL@vger.kernel.org
X-Gm-Message-State: AFuF++kLlpis8B9txlJjP4I43COrlTX1R7VPeoxk+Sgdk/Pk4zzAs0Rn
	gHXA6MqiBx5grNq+oVjOJ26qJJPhKpIpWn3wO3JVJqtGgB6IKOXNINJAd9myDKDNanY=
X-Gm-Gg: AR+sD13UjXpxof0FLjdw+YFTNn0JoKrqtqfx2QE4N40z5ZinoDXJcH7JB8RRY746eMq
	DcI3mLCE1V+JUiWvb6fJI7AkvDfMpMfal/kC1Os62iloMxcr/n8PNZKMlKK5yZyrV1iwkbsdpfp
	iS1kavJU5s6To/jY3VX57UrpxSO+217Llg5V/hBcTBiSobvM0zFae3/bgy8WzDQbWulCkP9xzKR
	qTHbw1ny2ujEiWlJ3qJjV8ZiDh4ATAYFV933lJv5K0r2KKZ3E1vdOH/coD1TmE/wMwWVmAdyKdx
	3FvSD2wlxqOq53fEmyDq5nasRr6djFa0LA5veBHFI2L64G9UGsiK9W+XEqFmue5tZJzzPgYFMdT
	gqXWj1VML5TJmzRqQmFznOA+E/he+AdA/ox79RH2DbPivQlcnnjruxKYrn7msSEVzSJjEWXVIJO
	wFctYEYFSRedidtkVDGGIhWE786kNORE9lLSSfQMGpya4pWDaH8w26KnQmKwW4UPpZxDFhZrouP
	3TTRBuaxr9VCtcfIenHaaVQew==
X-Received: by 2002:a05:6102:3c9d:b0:77b:b14e:b6c5 with SMTP id ada2fe7eead31-77bb14ec487mr9916647137.9.1787661602028;
        Tue, 25 Aug 2026 05:40:02 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cb3970361sm808178241.5.2026.08.25.05.40.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:40:01 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-74ab99038afso3120372137.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHL7giJNdLSlyhV+TecWjuYr+bTjhobiPSx4rkeKicVHQYbutG4dzhPWNdLKvc3ZYx2XUkXmo7yzGK@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:77d:e064:2dc1 with SMTP id
 ada2fe7eead31-77de064341fmr5703801137.0.1787661600596; Tue, 25 Aug 2026
 05:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev> <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:39:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqsO4Y9g+mLdeq4LZ2sosR7r7hXP0swKtRFap4qU3zfw@mail.gmail.com>
X-Gm-Features: AcwNN1W430KgO2INmLr-jl8Vwq7Neq8fxPjRN54TH1O2lbbWeDTKDcjU2n1-28M
Message-ID: <CAMuHMdXqsO4Y9g+mLdeq4LZ2sosR7r7hXP0swKtRFap4qU3zfw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 19 Aug 2026 at 16:36, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - in function rzg2l_ps_to_pwr_reg_val() return power source register
>   value or negative error; due to this, in rzg2l_set_power_source()
>   dropped the val local variable and use ret instead; due to this,
>   to be able to use ret on register setup, moved the rzg2l_ps_to_pwr_reg_val()
>   call after rzg2l_caps_to_pwr_reg()
> - dropped the tags

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This does not apply to renesas-pinctrl-for-v7.4, so please rebase.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
