Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BCB47DD61
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490586; cv=none; b=fZxnGXHQkTl5ounfFnZnp9+mKQDz5tqINwEle1kpMTgkqNQEgxuAKifAww6J9EX0skf5lQhWYyS/TPl1/fxC9gs64yt+cUbItPthF+KPMpBxw8O6d2bVlPGVc44TCMHAjbDZva0q1BcUd5oEXImPyGNDRyefM48ZZNpvDieny+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490586; c=relaxed/simple;
	bh=k13aCs1RdoPqecPo1wr59qkqrbO+R83+DXAj56G2grg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXvamCHLetwcnoQZIcOKhXIjhLLteGOYu1pmhGaBfphXdKxj22tHTgX3e0xrDIXXD0PN0peyXMP4HwvL6vPNS0DHqKIiI+OYOX7j8C0KKbYqrvZyRXznJRH3xopYM+av8U34KSMRyzygOjYzVnM1wBcr1sboNmaBUgPeQpWWhdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59d541955f8so1581720e0c.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490583; x=1781095383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWxBYc1IVZbFBqFpe+a7OXnuXHa/My8CwptPt7UTNAk=;
        b=H1Nnws+v/HlP41G0aKBjKncNLqmIAaOuo74jAmYgq0UbHDaicaYqr7jN1zo3JJ+xVT
         LsGE7IzgljbbSCPX+3M3DQbW9jbfmG+smWgc3bRP9iJoPOMVHGQJ6hadT+uBiImpJq25
         92vs5FWFzBRklsL8ML77fZp41s24t8UCyBdRFBb/yV3wqav1QUHgzc0WcnJRGBOaPVID
         N5HV9M6lG8/5FIxN0/84WFP49o4hWJ0fKOx6SfzNwfL0HqR4MOSp42Mz6tjjj2FATmIQ
         wE4hRGzzut4DrLdPbi1kuTZAnIiM9GpNtOXiif59kKrTeJLW19iwift6N5t/3u9O6f3d
         0MnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xGavTRhDEn8mcceYAKAzd2T2IF5WrKV6DCgKNYS27nO8E1HyG76rjliPvqwsFZKQdwqn5bvtGrfr8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PjAllkMTuYuP37XUROaq5+imUTNu5njSyMG+Gp1K4rVp0mtd
	j0A4dQrXZgWT6z0G6z+FEMpH3XJUOc+fgfaMhtj/sKk6I8IH2Oafx50Sqop3KheYwHQ=
X-Gm-Gg: Acq92OFfdeAizHM8KjOU6/eakqB8vbHxOIgevw+VtI44DnVVeuTD6SFMmxwuwySGSrZ
	ZXTYFvgQXiQKcW88yPclqFwbRLgfvX0SMsxZNQcENqq9KcIpVFeVuBSceM4luKSJHHmwgGji59+
	kUN0ZdV8N9pvSADkQX5a/6Z22S0MAKNtnQ08jlPQnk9uMYkpkM4EbKeZNn/BqASbrvFlKi0nzpP
	pEdQMNSd4PxX4p/OCuarlflBDRNwumvl9MENfRCSnMyuxUgEDgM+mTPEl8IFaLlXi3gEzj/LSxt
	D5j2Oy0euhYR5g+dzqaMUjF9vjX68Px9zZuJLkHmVZ33TtcKIwXChYsbY1I8ZRyLFwQCfVQ7flm
	4Ully1948QjMMV14850+NKBIGhapeHHRy6fu9+AzuWeh5VVzat66cFNw3uSmefDjcm1T1aHb3m0
	wx8vYPYCRBdRQUbKmdcyf43rquAg1hlTwnw2FM6qM/XcRBcqSruIUji9fHXniJpmQ32ckEmECpK
	rRqZQqIeg==
X-Received: by 2002:a05:6122:8291:b0:5a5:4166:67e8 with SMTP id 71dfb90a1353d-5a6e9aa165cmr1414900e0c.12.1780490583426;
        Wed, 03 Jun 2026 05:43:03 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d65080a2sm2176479e0c.2.2026.06.03.05.43.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:43:01 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cec1485789so1258448137.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:43:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9uRcxkJ2vnROpRK+eynE0iit1NC5cgl+uatMIXdNnukclPRvRQCPHOHxrbfC9pxqFy9iEFZdxrgd7f@vger.kernel.org
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-6ec490c3d34mr995887137.24.1780490581062; Wed, 03 Jun 2026
 05:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jun 2026 14:42:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
X-Gm-Features: AVHnY4IY7ZyzpnX56PnrLKeT4Q6f6pff2bdlvBxWDQkSl_14GHUg_sgrQjRBUyI
Message-ID: <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Enable application CPU
 cores via PSCI
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 1 Jun 2026 at 13:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add PSCI "enable-method" DT property to all application CPU cores.
> This allows the OS to bring application CPU cores up and down.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

> NOTE: This depends mainline TFA 2.15 or newer (or SDK TFA version
>       which includes b950bc09f5e9 ("plat: rcar_gen5: Fix multicore
>       boot by ensuring fixed address for plat_secondary_reset"))
>       and on SDK 4.32 or newer SCP firmware.

I assume SDK 4.32 includes a sufficiently new TFA, as that works for me?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
