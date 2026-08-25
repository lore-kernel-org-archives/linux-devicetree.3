Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23BF449995
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662844; cv=none; b=bBFp30pPYTtnwxyUcYYJv7Ltp1ylmw58jNyXFD2G5SPnAeJvdHutg7kcnDylyX3TJR3Q3wJSK7sKB22kPBoEH8QXYQNxjSWn6ZtzaU2Uru+3fEtnvBwBgQWIteOX8CXQ9OzUoNjvnf1N8vNKKgZ94QCnONtlgqQVtxNiFT8r0tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662844; c=relaxed/simple;
	bh=VO1GZ4gCp/y9o2rb+D3PA8tXGec2JaV9n1iCQ0jrsiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWH/6k0SWIZd8RrvEFSm545ih3HXBWrJMMt9vBC1T+h+tVuuA+PqiI8xz3GEULgRGhhzyWSPpR6wf5irvvfzmnoASH83FQKbgMGpf2i/8BrtG+nuFEyk2Oma+t3ue9y5SUQhkSW3s/RYwZy4Yd5hmFsc1Kcw6sPY+dvBtbI5LlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so7467564a12.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662841; x=1788267641;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/VL+GrO3wM2oN8yF9pczuQ0vsJ4YOEv+mk062nltpg=;
        b=oEtI27NfPGSXFk8q21s6zK5WO1oQ1xIgoQN1+lBKX0tf1Cq6eDV/goStsJ6CXOfQdD
         kMo/T5TRczahT6sJvEcxYA2J5zkd1CDpgFWCpXAt4fmxvkRq4YsFgyQ4KEKS05LDx47j
         BBLCg79cehRRoyeK8hfn/Rn/gunEw593p7NQRTSIaoYh9eqe6RfTO9o+7wmqKfFJ1d1J
         ALgRHPmRKKWkQdoFRu0DpRl+xpNF3ZTO14zkiiDWc/Yy7BE3uIUgplS5HWGOANlYSR5j
         MRa1N5FPaj/5aHVHhJKwAUZVgeApLeR3ToRWcEirmA0i08yVX/zUp1j/h0H4/aEYGBom
         c2hA==
X-Forwarded-Encrypted: i=1; AHgh+RrBuzKFopOH7tJoZVtnM0oHgMLLwbZEJekP5L1LJbx3YPykLx8TjnOMKqxI6bvJ0mg95Qzpg2o13gvV@vger.kernel.org
X-Gm-Message-State: AFuF++nHpo0xjZ7WjcUjXDMvyZAeBb5L66jVqBDbPdnV7UKPqOYpDvTF
	ptRxWheALW5pDrZct2Pm/UoDE5CmIpNXdqzZowSw2Gv9bU9FGGriCf4vZyF6Sem+lBI=
X-Gm-Gg: AR+sD10CroAWwB6x+89pyY8ZzDJ+yCn6uWz0uuM5crCJfhx2kXX0a9DJSPWuS8OM3df
	dDjkgdZkW84p9ZIPc5sKVgZTCwXOuSS00ULJfc2BLQ6T1vcbVLl9qWuvTdOd2mOk6U1onM2ShfM
	P40xGdzQPZ5vLq1hXuzXqovgskz14TLkBOKWFAnSClBvzV68x9J0KebzpaXxmTEG1i4vZKKtp10
	murIRPmtay0I+cmUR2izoUGE/ZGZjb91pSIoZ+NBa3wSCNWRQ3qObFtubzQhbyL3nZ+t1UJjBik
	UR/KdsyyGOGI9LcbVSUfAMsM07RrUrRvborvIc1TL/G3E/MfKhS8BBsGxGAsb2BB1ZO66NScK3L
	CatFK3IHRdnQxBwqJEbmHB1wz2Z6bswNrcBjUWxpQByv+k4kwemF1tt5tonCgCdehZ0EmXumInH
	wdP2XL3Clczyc+GD0W3DSMVW64gJ8Tyz1q8Os48enKIOSiDgJQUT69CUirxXRqeHrbybcIqQZM/
	jfPsA+XykPX/cYzDumjrKeHrw==
X-Received: by 2002:a05:6402:e93:b0:6a0:584f:454c with SMTP id 4fb4d7f45d1cf-6a42f28ebaemr39721255a12.16.1787662840909;
        Tue, 25 Aug 2026 06:00:40 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm16808881a12.1.2026.08.25.06.00.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:00:39 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c26d7e951so711604866b.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/1Q7cFT3LOFjkLQQrG1Y2QJlh3cCzN5qEl6GpM1pmeL9s9Z2f6N5roEmWxS1lfETpPAM1ayDzglNc@vger.kernel.org
X-Received: by 2002:a17:907:60cd:b0:c24:c22c:6372 with SMTP id
 a640c23a62f3a-c24c22c6490mr1589458466b.5.1787662838829; Tue, 25 Aug 2026
 06:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev> <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:00:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSDg2EUhnzVtcrLaL3kyZK-wJ8UfZzcFXmS=O1RZE3MQ@mail.gmail.com>
X-Gm-Features: AcwNN1VEuaPMxcxWs3RbjdyN-p7dmv63o4Gq5Re74moLFekdRIJP2iC2c_m_pgo
Message-ID: <CAMuHMdVSDg2EUhnzVtcrLaL3kyZK-wJ8UfZzcFXmS=O1RZE3MQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
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
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - due to patch 3 from this series:
> -- dropped the definitions for PVDD_I3C_1200, PVDD_I3C_1800
> -- dropped available_i3c_ps[] array and fill everything in available_ps[]
> -- dropped the adjustments from rzg2l_pwr_reg_val_to_ps() and
>    rzg2l_ps_to_pwr_reg_val(), rzg2l_ps_is_supported() and
>    rzg2l_pinctrl_pinconf_set()
> -- dropped the tags

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only */
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only */
>  #define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only */
> +#define PIN_CFG_IO_VMC_I3C             BIT(22)

BIT(22) is already taken, please rebase to renesas-pinctrl-for-v7.4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
