Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A38406278
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540880; cv=none; b=Hy3cMBJhOBCGjFVXSuKcei4R8UgPdYICBe+/5eW+BOCP0mfFy093kxK2uVzgviFPARo3Mgou88IQbt3bC8pQiHMWBaavoJuvTmI90bhIsIkvwr0OA419p6NiNPIF8XQOQjCYhzEkO3iy3/lWwRhRTTrUnMuB1t1yiA/vm0yabHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540880; c=relaxed/simple;
	bh=nJJ044CFG8WFf7uTek+YoTRHmmGxlXFM1S9hcGLROjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxXmXcFd2wakhcAcgSNXiQfMW83cDmEjFmYKfSSLePOiC3bQBVXPH7ChlkCoW2N4jeWiBMcG3XawxuwX7A+AXdbJD1EVh9xLU9dDW/4jy7H7G8CEimKM4wZ1WkmWIRGUPOX9OuKJcYs8je/m1TScpiKBhJOE9UGkGxYBsunMtwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56ceded5a11so437720e0c.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540875; x=1775145675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjJkfoCYmqHBebtmH7jbwGZvaBZg+X2t2r1EMwQ2wHs=;
        b=Zcmg+ev5qbxCoby8TDkYN0xUgNSYtcDcic4dGahWpa6ni+44V9mmixJfbo6Y2B+n+v
         jGxC+ZjlaYOrmxI2wFVXAcmaPMXiLZM1UP6MJG9Buuy1r/ywMQP3QrYUSXhdcJW1L1QJ
         wrBOqO2igPaLAzJNbu+daRQLTcnBELK5jceGE+i7LDZMcQ5DbdjnCuNvNSy3GTeBer5X
         eQ3h8l9BokzslqBWwh3yY9fNSf/cI3xQ0uYd9gZpoka+TDF5/v4NTZhIMEwlChkStxOu
         g3k8Jkz7RnuhSuSYtXcmW6vYiPXoM/Wl/b+/5lZ64VB8tjs0G6psrECFmjtBbMikN/ff
         GMWg==
X-Forwarded-Encrypted: i=1; AJvYcCWmKKVwIILCf6XH199XKQ8+nm/MdW0VvqesqdCOlpUNH5isbTz/eGX0qmlmWM4GkNyzSewa4mFeNu9R@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXylzRgN+Tth9AasQ5IDtt/6gRXYw+AMJhkzgNyHO9U5fWSML
	2wC7zyQVx6R2mU2pdgZzWUf9z5i4cl7YqaNoMIkJNiZtxww5eeEuJlqD4nfJbv9xjNE=
X-Gm-Gg: ATEYQzx2uErO0ZX74t+oMNqdPfo7fqO8ayOr3e5di1CwZTNy27uARjA/7w4WwOrId1f
	t6hFP4P2x9eiQGL+q2M1FsXFlrdK7SQHhk2bz5B/D0CPJ0alKY49aA7NgIR6iw2i7cCSyAZrhY/
	iaWXIXQCR1QKx5qDlcHENY92jdQrYLI7+37ZktxETDA4fXWhthaMLKJzvs/B3GYPaxnI5MNSG8U
	qmS0SwKXgxfvVrTx6JoxIjWeBChZ0dzz7lIVERlUlei1cO4GginYTP88cd/5RdtIVGFVKlryvSv
	r3Acj5+2JRjA2/RxmKEMaUuEWrVL2a9aMUjJooiBprPIbbbbl7nFmqXDT38mizcbO6oNIKaJ+Zc
	Cl5I2xb+lXTbnq6MMSRxeQ8ht2DHduPQBzEEkzQ+Fw/r9PyRbHDWcr0RC3ZZ4/IK+hsQCVhV4dL
	6vt17DQzXBiBQ8RquJjOeurMY0XXu1Ugdkr4zcFFc8h9qARVC9YqJhlT+7cBi30FTd
X-Received: by 2002:a05:6122:32d5:b0:56a:fc35:966d with SMTP id 71dfb90a1353d-56d21fb12c5mr4010762e0c.8.1774540875233;
        Thu, 26 Mar 2026 09:01:15 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be56f28esm3957929241.10.2026.03.26.09.01.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:01:13 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5637886c92aso596982e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd6BHPKy9qIzr/HNKJ0wEwhFviHPPzT7Q4hnfmb/q0EgeNEe9m20O6/UfytWnKoChiwobPm+nbW9T/@vger.kernel.org
X-Received: by 2002:a05:6122:8c13:b0:56c:ce0b:fecd with SMTP id
 71dfb90a1353d-56d2208bef0mr4303675e0c.12.1774540872761; Thu, 26 Mar 2026
 09:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 17:01:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXeRRWi1g72p_2Rq-dYO=pD6aLkWC-x5fZpHa7WMQZR2w@mail.gmail.com>
X-Gm-Features: AQROBzAu-o_sjRBfd6AHvLbmqr0rTNnVFjjdYlB7t2PFooSBjTFI7oEHrcpJ_Zc
Message-ID: <CAMuHMdXeRRWi1g72p_2Rq-dYO=pD6aLkWC-x5fZpHa7WMQZR2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document
 pin configuration properties
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the pin configuration properties supported by the RZ/T2H
> pinctrl driver.
>
> The RZ/T2H SoC allows configuring several electrical characteristics
> through the DRCTLm (I/O Buffer Function Switching) registers. These
> registers control drive strength, bias configuration, Schmitt trigger
> input, and output slew rate.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit description
> - Switched to using the standard drive-strength-microamp property
>   name instead of a custom one
> - Added a description for slew-rate property

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
