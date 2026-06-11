Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DFC3BA235
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170637; cv=none; b=aYCIvaozqJ2/4kaMj34tmSBdZdCYM2P9rG9dIU5nSKDGRMZI9eU9YvMOF5qHa/lvg58CXhdV52Jqkr8R5DSHJudMUlrzUwdDTovi+aG2/dkcvXGnkME1sxwCdVNS5ZMH38JQFoYK9xdxbKoh0E8ctmszS2gVHQxTIZdZTo2IK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170637; c=relaxed/simple;
	bh=GQjYyGJqtEMPVm5k60bgH8AnQwwtqy6vM3m2t8/DQjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIkvg34KeHFKacHk4JVEZ+iczPwlXSNpr3pi75D/bB6jYt324ar5LggdHJKd/WsBZ6fBeMF71cgin5+q+XJb5acz5FxhYj/jQFGfUTOorhg4Ed4bVmWBUsPBzebL148Yk/jDABxZ8IK7YNP8VLzDv/aB+BQlEqX6Pk8x8tczyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9639fa0636bso292512241.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170634; x=1781775434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pxl9qNx6mScAKo27Qf31OCUdFE/UxFOZhTWyYV5PE4=;
        b=fJdkHJakjYXHsU+KVwuyUUadGuI/0ZN3s4/WiHCpa8EJw5Kc/UjUXp7thVa/I+g1wh
         pypdZ/82nSr94SBAKfAoqQ/Jgkb/edtkRI0QevtKp4yBZw1JNhEeg+zKjS+DzxvboYeH
         dfuOvjOqN/VjY8MGYY2qD1kThPTj+WC1LUkjn9nSMrhPYc61y6Z6pe+8PqhVRB+VtVAI
         YDVXegs2rF/d2EtPF5STXwQnAxNe0UT5XaMpkxfeGiclwXWHaYsDoONR3Wt5SEiMTTKg
         ufdist688+O+ATx2ltYM0rRluL3LyifnVRd0C6pBCyt5HQ6tWybjzH2j6JlRc7WoKei7
         qczg==
X-Forwarded-Encrypted: i=1; AFNElJ/XvpQwH14DPz4sgeL4brd7wUMHjBJK0tMLWhNnpIeCoWfeHtLMINjZ6MRL2DmYkCIfmhpDbCRLJHeK@vger.kernel.org
X-Gm-Message-State: AOJu0YyLiByhKauglDpJNqUq5RhVGlQghsDQkXMamqoAcwS/7GuTSBNB
	dg3hETc5rn7wxnAEL82iOSwQgGimixXHfPChiHb3V8JRNFX+dkdFHCD1nKA0sA+KJSk=
X-Gm-Gg: Acq92OEUdQb+64utHfO2cZjZ/1kcIUdSJQDs2UMhv62VBStRE+f6XX5Ttkzr/PsMNII
	p4Wj3kHqrBzQgM1pyIu/b5R++PBGOf+hczOO4vVXd6cPxnTO16Q+OcC7ywaVUxWi9pgR2kQTMoS
	LV69I2CmeLC4hGhb2AYvzzgvEPUqA303gwiFEf3bpe5akNqYleRHd4yDDG+GIh3bsyE+CVe9YSr
	DPDsIzYzysMnJgdQGLmjJWgW8NUububzN447PW2YjD2hCFBm4V0wfRj9fEXzhdC3iO11Vinp3uC
	FxsHlhPN9lBn+5HX/s2m9NxcP+ryuh701O+JaiU5Js/X5JKZNGozdXfAaiR1cjKR09BTZcgmaYe
	Z+Hs9nt+5E6TZT/jl/UycgcGTiy3YksI06GJNjBVZ3f9nx7nNcjc4vUzII+f4wzUG1CPHwFMUCe
	njVBSHob1x1KnpnfpGvkzajJHKg5Cc8Q7xLd1W11c8aHCkXN1wos4v3boZAwAPoXSdURLFD6s=
X-Received: by 2002:a05:6102:1497:b0:634:2450:7998 with SMTP id ada2fe7eead31-71d693bf209mr546642137.4.1781170634327;
        Thu, 11 Jun 2026 02:37:14 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-71d900c43c1sm592041137.3.2026.06.11.02.37.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:37:13 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6c6507549c3so399766137.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+y4fJLNT8i7FLRrROnuWoNyRsBK2Z6egbvJ0UpOmQIgeNJnWrS39hclrpG0ERu8rEqmU1M+KKSrLOi@vger.kernel.org
X-Received: by 2002:a67:f9cc:0:b0:6cf:2b61:3fa9 with SMTP id
 ada2fe7eead31-71d640273d1mr415147137.10.1781170633747; Thu, 11 Jun 2026
 02:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
 <20260611-serious-divergent-sidewinder-ec7ccb@quoll>
In-Reply-To: <20260611-serious-divergent-sidewinder-ec7ccb@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 11:37:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyVDbex1FhkJf_1Xc4QMKvThDQD-3scCCsE+wePpPiMg@mail.gmail.com>
X-Gm-Features: AVVi8CeDuiOEsQzi0FV-mGCz7l2EJP5AYBsrBzx8J8Wiz9IyxZkJS12N-pfg1Qk
Message-ID: <CAMuHMdXyVDbex1FhkJf_1Xc4QMKvThDQD-3scCCsE+wePpPiMg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: cache: l2c2x0: Add missing power-domains
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 11 Jun 2026 at 11:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jun 10, 2026 at 05:29:20PM +0200, Geert Uytterhoeven wrote:
> > On Renesas SH-Mobile and R-Mobile SoCs, the ARM PL310 L2 Cache
> > Controller is located in a controllable power area.
>
> Interesting... so to turn on L2 cache, OS would need to boot, setup
> power domains handling, turn on power domain and then turn on L2 cache?

On R-Mobile A1, the L2 cache is even located in the same power area
as the Cortex A9 CPU core ;-)

> I understand that bootloader actually handles it, but I really doubt
> that it is "controllable".

It may also depends on which CPU core is started first.  These SoCs have
both ARM and SH CPU cores, and the SH core can power down all ARM parts.

But hey, DT describes hardware ;-)

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
