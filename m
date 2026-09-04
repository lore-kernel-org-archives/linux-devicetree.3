Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7B32D94B5
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527049; cv=none; b=QQO5gbSc+ZVaMMhY53ub5aGtdZMBDpLJ36UeT57iKmAMVmAqk0fU7MtCNUkMB5tqxetp/9ajrpTCxl/SeWyGqN6xo25SqLwKShXOohmuT1VmP3slMqnca/bG6iCzye1DgDvUb/HswIqJK+Rgziqd4DhLYhK34WBLihxOYHbWXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527049; c=relaxed/simple;
	bh=vJr1h7hsBUyy3vHTeoyngtmQwphQ3WIBheDjPnoTJn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5c1zOAUCxXHG+N5FJMyowO65jbtVbtHDC5CPMh6v8WjlMR+Brx+elDLn1wmMoZtnwQS3on0mYQJKS3hhLSIrhN6oj1OTGYcofhq02P+2ad1lq8ti/wq2vcGWYuFJA5ivOKw0VsBueByPLMhhU6UuwRCNaw1kidbg14PQRAkE4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so924263e0c.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527047; x=1789131847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1FFew0xvwxDBPdHzvarflCtGZCHXcWoG7HxiLXHltg=;
        b=RDbK0+vi2kcMMt4aA7dIE8DWmwy27YsLwRI+yd0bamiaXv0UxnhVSwtBAjtgtJ0PqY
         uYmrtQLR/cLjtckiUJkca+LFgXdOkIbabJqwHVxOEYCYDmaV12sAYNyaK56/IrfQ57LL
         cbEUYVZx0gxhhdKuHlCJUO5ovQltP+9N/oe8Nc6aoJ447t8+pANXcaIN7KNf0by5OQgd
         eOuEUPHufJynHv7HWGrDo742bTtyxNC+uUQt4HH7AVF2U1o6lqvwp1dx1YYQpQ22oiD/
         PnN9twExTYNXeY3eAmWEoStCPNrnLXFL6baUvji2xln7+nb5j3CT8oESOGIiayC8pMYd
         D7TA==
X-Forwarded-Encrypted: i=1; AKwUvBzRQK8UE+DQOJiRp999Z/n2/gl30ER5wDLFoGwmVvNBKax6ubjJAleX7gOB7+Eo/UcFvbQ/Fm5tXfvT@vger.kernel.org
X-Gm-Message-State: AFuF++l8gmSPmWbnuFg272Vp9WCfk8NoYSXRb88tBGgug5bNsFdoH5Wb
	Dz2Cav0h3oXTmgi91tsVMX+XrgIz+9fROFHUbp/2sqWLYpuV6K1USCn9pSQzj6pm8tE=
X-Gm-Gg: AYBFou2yXfbQpfPbN7kc5C7nD8ehn0PP3+uRlepAwB2RwDGeYVce8rrnHjsa/aFGldF
	JesvutoSzEYJvgk/etfeyZEcXIA6tHnYffv4h18Og74uHN+lRKoHCY2am+M+jYZQnKAlaE5MXag
	+7Fz+5Wd0VryvPLorhpksVmFLAkp/rrcdqNKrLaFy25E1mI/CvKhGWkuoCETBO51sSkWQa8tqMr
	vrDNIxkTJUW/k7byn50VzGPkyHTL80+lka1gayiW6vtPZq2q2SZVZQlRoxcBhQ7ODAKCi4pZIrI
	YZKVU/eza+BJH3iTD/nXUzrDayUiJPWC/o//TrP8z3Wv7g4SAww6QLE8m/RepMJprrMYs1/xMRn
	u3fGvcar9Bu6vfSMS6U7ipFTOGqcVSml0VOoG6FwoC6+74YYIB02vCP2tctBRXz0duskIvnwJGC
	YISY6RIMeyvUfwk0SG/XtcEjoJnMiO6voInaGf1tb0lqmocBghrua+pzqpJlvhn6nfPSfMXcxBJ
	ChgQd10tM6B0zfeQTN0YqliVg==
X-Received: by 2002:a05:6122:3b85:b0:5c6:731e:3c8a with SMTP id 71dfb90a1353d-5c7ed4a07bbmr2817180e0c.1.1788527046868;
        Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3874acsm1898980e0c.15.2026.09.04.06.04.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7542a2ee156so565452137.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0okxCyi6ilnvP1Kim/lBpcome11myMWfRoXWn7L/FpW80U2uzWZhQQBXNZuHhVz0hzb/jasREpVuV@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a4a91b269mr2076023137.9.1788527046144; Fri, 04 Sep 2026
 06:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:03:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX83jRBFjArNajU6Mq8NhUV4e0gN3Bn1K7WxHoRQUVb5g@mail.gmail.com>
X-Gm-Features: AcwNN1WMbKpO1qteekuyL9lk6vgBhGsq_Kk0QAeK938uUXzN8wBaXb1U6d7AMAM
Message-ID: <CAMuHMdX83jRBFjArNajU6Mq8NhUV4e0gN3Bn1K7WxHoRQUVb5g@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
