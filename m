Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850413B47C1
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519673; cv=none; b=oUnM/nNEJ396sG3xToBWR94mslIaUfmmjV53xA6kgiAhhCHXapqta+cyMtB2GirX215FOPUJ7LW1M9Cig2+0essfYRL4NpB3qeTTFSuyLvvCjfhjJzmFr89K37QP5fNeF61OWFwKOKyddhiIL+ChxUQqn0YsxXRN4ztJvFHJa0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519673; c=relaxed/simple;
	bh=XsGegs66l1CKoLtu/+3QgbtTvmQGUGUmoelFQjWXbtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlBeEwbn/RnSC07BlLdqJWw19WuFSEWZylHRbY9sET/i1Rh0wuk1zvrTPczuG/K+o1X2C/7Mnec8OzRExYkwLVLN6QdNfW9RZUNzmwXb4Za7NspyHTn0NbSzxNn7hmnfmmohxEc1lkvn0DfltiK3Lf5efwpIhg6612V6X+UQcYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5674d8be45eso361638e0c.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519671; x=1775124471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F94y0mp+/D6GVV7M4ewGzosByGn4hznQhChrZ7f2x4Y=;
        b=gedWB7IomDbgoqyQUfKsiTS+mOGiv07PSh2tI802BtARDdJze4WIEtkNK9ToSzbE8w
         cH1+jzAxrlrkggIUqiH4CixbLGBcxSZ7HuullMU1lwMDtPwWdVsfwUZQXYVyupiWkJxJ
         VGk+j0HQJjAbH2c5GT5XZ/8BvgNMUi/U3cBVHa/4uK211vN+qciwA89IluTZxICpCPE/
         tKaKsA9miMcnCbzO1oCvB1ixixo30EUQkP3Uv2cEfq7yvcU3B/MwBV+s8P/LjsTgCEql
         qrpAUFfOhTUMvd7PKPB6yYfm3FlpAw88OqAGaYwryaupov08coSrYjJPJx2HGdfW8imS
         bLuA==
X-Forwarded-Encrypted: i=1; AJvYcCW8FChQIWJJKlyVjZ3vqeQStlDfwk3InZ10N0AyAZOfSJvR4YurEDGl+9ZaWfxTDfIUX422P/GGHh6S@vger.kernel.org
X-Gm-Message-State: AOJu0YwkQJx5OI8GlQPg2sKg8Ni5fniEzC5PYqYgl/2AjCMbq8vixROe
	dUA3p85Qxse1jw08f/ZBNFQ4Qom7UhWxmWaL/5vatQji6DjoV9TbOsaqeYGDY/SA8hA=
X-Gm-Gg: ATEYQzzoEnsl0GEbYZyuheywtbsndi5eiGElelXY+Dy+JcDoEVAhYfnO/VPjeEZCjWQ
	JBUhlkvBZblo4U1ZUT66ScCOLmEzols8jkhKe0w54dPkEmYUPM77vb4CzPmaAjZfCk+m/zTI5gJ
	j/om+sbyVETik71Bo+75AVamNzDpowseDgIcQ8Nt8jArIrZCWcX9WbswBi/xE5IsmWbJk8zcoEh
	2Sy5CPCFwcaeBvWPBd1NOszAuCE8/kEfKGsOMFqb0IGKLyGuj4HJBRDNz6eb4iawJ52TO/AwBhx
	QPqh7vO/8Yv9gIbR9tKAjA0FR9cpnZf2klxNuNtGQd1sF+TpZlvcx0KSGxYmGR+Y3r8LrkHogXE
	q5ZWnwZumLUCLyTKosXEGbGMomhP2xDODGBhbEw4JJs15cxDmlmp1SNRpIcytBnAuwA7UtxedqN
	4sYGAOa1OBTD5IYB9zxVhyK27xgE/mI+xb7AEkTRgfslmbAvOvhUyjj5TUfVbp8Sn3
X-Received: by 2002:a05:6122:a08:b0:559:5dbe:fe29 with SMTP id 71dfb90a1353d-56d21f275d8mr2997824e0c.2.1774519671334;
        Thu, 26 Mar 2026 03:07:51 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf74basm3847739e0c.2.2026.03.26.03.07.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:07:50 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5673804da95so373463e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:07:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqzNCSK42dUD5s+vBBvmq3Uj7jICua5IJazJSVfJA8LEOBJmqwazbO4NOhhsR/M5PTpigwxL1RQ3jj@vger.kernel.org
X-Received: by 2002:a05:6122:3387:b0:56b:5e7e:d3fa with SMTP id
 71dfb90a1353d-56d21f56bcfmr3191484e0c.7.1774519669709; Thu, 26 Mar 2026
 03:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 11:07:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
X-Gm-Features: AQROBzAkfIER99cc95oQTkegA98ufjqQruJaj6kJ10lCtG__AGEprt5eHbo-Ac8
Message-ID: <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your series!

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into DTOs to fix warnings like this:
>
> "
> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "

All of these are dtc W=1 warnings, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
