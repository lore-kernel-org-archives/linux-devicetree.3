Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CA71EEA54
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372319; cv=none; b=gDADluR6HLkjckWYZMKtZJHPL+eat57zIU8pBWIInqqAeA/K0IRXgFso3jbGFhDyJ1fRmMpwen1g3SG2aEGf/RDsOlCSF4CuYsrbJOkH1Kb9f2zMcPK+D5yxz+2a/13A/g/FrqMdL96Stg+5KGIg6rkd2pKiufDeY3U4CTnbWMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372319; c=relaxed/simple;
	bh=UG+AWWYF8+8wcJMCUjbTFh4VwOPAlhF8FZLDzvsNMAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6VBcIdsfXaz5FeujdmMuBEYLCUZWDYCT6bnwLQenmu92ZRluHRFOXHDJYVn/JKZQPNrgfpM9Y+fsssAhH/vxAKXZd9JLMXa6mLZuEezMDyEkBL+TxhH0ntvbTmRLrdcoBYmNeIpqA9xB0rsEToBHHrCVHByscicSFLLuUAfCLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso10239904e0c.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372317; x=1777977117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX0h1Y9Mkq6p8qHdHFJchBdDb8mSjHkwiA1G/+/zjKk=;
        b=JQGrsuyHU8K4+BU+ad4cbGVHe0YhnTwXP5Z7IsiJkHGylgsScOTkbVPbYssizNcF2J
         1jEbtOSixjQ1n8ofFwSMu/ODqq2Cb1my2OySmGxhnG7EzaDgvcuvJmrdvigfpfzFk68o
         UiUpPjK+q2ae5iOgBRmAOoKSrFAY+TjYSu9Fb4ggi5RpP5VK3CwuVYNqUNfL5DgVyogo
         mEd7mHe4RgyJUpmgA9S/7BAE1rIH28hRO5bp4N9TIX9/Gq4Hg78h5jUwXlnAsQ72Cf2m
         b7IUabMZ8elXE+5o4uuYWSUsY8/osn97hvjA9pZFszlxiFgzNLxm2SoXdWvB/fmaQwfW
         peog==
X-Forwarded-Encrypted: i=1; AFNElJ8Mdmdr+0q9VFVGEs62Y0J6K+wxrJy7akho8D2Ltm+0X4wXD15GBWEHHQpbSc9pWwH8MnspPGrIJfJW@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjBwWFjG4F1VO7y9gW8ly8k+QCmScq0c1106dVUbcEQiX4FZN
	blvWGetSqACtv9oW2NwucFNxibfvh1Rmk7cUSALCUEibPny37oZoD5540SKrGEdMgLk=
X-Gm-Gg: AeBDietOYbGgjhx/NGfq+JGZRcLwLTLOhIsBa/qlkWpaWYwcfC5Jk+ZYhXqzrPyfG4U
	yrSs29Rg28JKrJvpXKFpIuTuPY9bnvgpOyKn1E0SD2k75UfYB1sMwvf9MexNtN2n9Y5mYaU8ssw
	/WLYN9WrSr0QZpr7Q4UmXNckCcZQcCOchsr+SkfjFczNuWJyHLjix04DwJ3gMP30umLCxA14DUY
	492Gg/jVeklYr/uqvoglME/CK5Qe6gXH7i3yS+mqpV7e0jQtUjFfcxYAh1FPglQw5gKjuKVrZKt
	XU/M9pUrTveA/VrHjSQufM/lB5TSnKEGwqctECYf3220Wx3uKZ4kDEmLTWOCy8xpvIKosvWKiTZ
	rwCHmRNr/zU9z3UUzUCUo+vexIyutRVlgxO5AQFmqR6egSkRnBnLkDRm4G8N2q7hQ34gU+E4/Qh
	4h3fKGqdZIU/cFc0O0n1cfgzYedapY0L76m+TYaRZ7Wc8OjS7xQpqjH16T/ns+9ogVfTfTMGEEW
	HKK5ljpyEas5g==
X-Received: by 2002:a05:6102:809a:b0:602:8894:b76c with SMTP id ada2fe7eead31-628060be74dmr602974137.5.1777372317065;
        Tue, 28 Apr 2026 03:31:57 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-627f8032e9esm995332137.12.2026.04.28.03.31.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 03:31:56 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56d8a5f0e44so10504533e0c.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:31:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8uDMLxLhgyhMTOY4dkA9kk2QEtRcqqj38x+1mAcOx/Ho2bPf/6b2l9qN8EZF1qa7YbJh+AzEXXUtcN@vger.kernel.org
X-Received: by 2002:a05:6122:4b81:b0:56f:b831:909c with SMTP id
 71dfb90a1353d-573a54f6dd3mr738558e0c.1.1777371942065; Tue, 28 Apr 2026
 03:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com> <20260415124731.3684773-15-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260415124731.3684773-15-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 12:25:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnZhUeY+498Ot4wCjRKM3YEpq9C1vcqbyKe=_Rt4O3Aw@mail.gmail.com>
X-Gm-Features: AVHnY4JGBNGTte30b8cNYuVFq1Ftrjan7Mckgl-ml10MKOiPXuleAlM2Dd1l_54
Message-ID: <CAMuHMdWnZhUeY+498Ot4wCjRKM3YEpq9C1vcqbyKe=_Rt4O3Aw@mail.gmail.com>
Subject: Re: [PATCH v5 14/14] ASoC: rsnd: Add system suspend/resume support
To: John Madieu <john.madieu@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 15 Apr 2026 at 14:47, John Madieu <john.madieu@gmail.com> wrote:
> Add per-module suspend/resume functions following the existing driver
> architecture where each module manages its own resources in its own
> file. core.c provides common clock/reset helpers and orchestrates the
> calls in the correct order (reverse probe for suspend, probe order
> for resume).
>
> Infrastructure clocks (ADG, audmacpp, SCU) are managed globally
> using optional APIs to remain transparent to platforms that don't
> specify these clocks/resets.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

This causes a crash on Gray Hawk Single (R-Car V4M), but not on
Salvator-XS (R-Car H3 ES2.0):

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000008
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    user pgtable: 4k pages, 48-bit VAs, pgdp=00000004879ed000
    [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 0 UID: 0 PID: 675 Comm: s2idle Not tainted
7.1.0-rc1-arm64-renesas-03756-g4cf47bc1e3d7 #3579 PREEMPT
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : rsnd_src_suspend+0x60/0x98
    lr : rsnd_suspend+0x44/0x6c
    sp : ffff800082e03ab0
    x29: ffff800082e03ab0 x28: ffff000444022ac0 x27: ffff8000817d9050
    x26: 0000000000000002 x25: ffff80008073dd64 x24: ffff800080ab0b20
    x23: 0000000000000000 x22: ffff0004408a84a0 x21: 0000000000000002
    x20: ffff0004402d6e80 x19: ffff0004402d6e80 x18: 0000000000000000
    x17: 003fffffffffffff x16: ffff800082d8bc18 x15: ffff0005bef86f00
    x14: ffff000444022b40 x13: 0000000000000112 x12: 071c71c71c71c71c
    x11: 00000000000000c0 x10: 00000000000009f0 x9 : ffff800082e03880
    x8 : ffff000444022ac0 x7 : ffff0005bef86f80 x6 : 0000000000000000
    x5 : 0000000000000084 x4 : ffff000444022ac0 x3 : 0000000000000000
    x2 : ffff000444022ac0 x1 : 0000000000000000 x0 : 0000000000000000
    Call trace:
     rsnd_src_suspend+0x60/0x98 (P)
     rsnd_suspend+0x44/0x6c
     device_suspend+0x134/0x3d8
     dpm_suspend+0x164/0x268
     dpm_suspend_start+0x4c/0x64
     suspend_devices_and_enter+0x1c8/0x544
     pm_suspend+0x194/0x1e0
     state_store+0x7c/0x100
     kobj_attr_store+0x14/0x24
     sysfs_kf_write+0x78/0x8c
     kernfs_fop_write_iter+0x128/0x1d0
     vfs_write+0x210/0x390
     ksys_write+0x6c/0x100
     __arm64_sys_write+0x18/0x20
     invoke_syscall+0x50/0x104
     el0_svc_common.constprop.0+0x3c/0xd4
     do_el0_svc+0x18/0x20
     el0_svc+0x24/0xd8
     el0t_64_sync_handler+0x98/0xdc
     el0t_64_sync+0x154/0x158
    Code: 6b13001f 54ffff0c f94013f5 f9402e80 (f9400413)
    ---[ end trace 0000000000000000 ]---

> --- a/sound/soc/renesas/rcar/src.c
> +++ b/sound/soc/renesas/rcar/src.c
> @@ -848,3 +848,29 @@ void rsnd_src_remove(struct rsnd_priv *priv)
>                 rsnd_mod_quit(rsnd_mod_get(src));
>         }
>  }
> +
> +void rsnd_src_suspend(struct rsnd_priv *priv)
> +{
> +       struct rsnd_src *src;
> +       int i;
> +
> +       for_each_rsnd_src(src, priv, i)
> +               rsnd_suspend_clk_reset(rsnd_mod_get(src)->clk,
> +                                      rsnd_mod_get(src)->rstc);
> +
> +       clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu_x2);

Apparently rsnd_priv_to_src_ctrl(priv) is NULL.

> +       clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
