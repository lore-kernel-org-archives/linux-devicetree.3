Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871964D09FD
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565083; cv=none; b=sU9ZnwimumhPKOqI53/6Gi82iPEzWEAwBpIsNg/pGR92pUiQRhXY5s/iv7VnxZPBgGukXYcOKKStbLzvRAPmSM+6mKXBZZKYxnpmKtJlWffnebjSFMVth/pm+h2unGw8lo6adHbtycMIGsrI9dTc36lvfpvkkoBi4gdm5/hf13k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565083; c=relaxed/simple;
	bh=2sE36QpcrfvxXArJ8GEwh8xkTNR5ml6No1e+wSNTgZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fwt3FoG9jUaPuP0p/j51RGnzNHHAU8NT9jLYUHV2IM5gvg9lrpPwr1bPMRRpI/9PKjNqJNYuEP/JRssrB4BQ/aDOuSVPEDu6rs4BUU898wkpjheXCNGZ6UeIENs1ixzllYpCgmWJJVCQKBuuIwpqYqcfYkAidR7uTxfaqnp+fLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059faso321335e0c.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565073; x=1790169873;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VX4C74fwnFsyoib4BzaTdWMpIPzbVi9atYccVkCkD1g=;
        b=Ub2MZkO7a4oFYWDQ5Ax94VyiMBYHTTXoYfcrPNWZUX5wsODp3HEfKFIsH3qcfEduhK
         LxpuPPDAU8kx0F9drE76rhy7XAYLLqeQVugTJBsYCeEiQC0LgndTx5V1FoJEtHd4iH1m
         yDzfxgIDckdt++mA8SJp0sxcZLlc4TIoxn5T7Opaepx5jcrT/qNV2kwQFjeLAS55UTng
         614vKtgmM/ee8Ki+GMf8FJbYX4vJ80fAJDfSynkJqAkIErjG7kqTG3O96ZA3M0q/I/eB
         17DD1hQHKYJliLS+U+YqAI+RtmwbTm896XGeV5X1bLDNUhSRA8ylyNt0u7bn5FebSJCd
         xGOg==
X-Forwarded-Encrypted: i=1; AKwUvBw+lvYtdhPq4ZKlzssNIQwLO9QhScRf+3jZ1vOTd6eVpscJ2tDoNveIJ+im0/ERwk5t02x6Ca70H7qV@vger.kernel.org
X-Gm-Message-State: AFuF++lEXp91Ws79gQScMTd1zR6LkR2Ui/4WD86nZGu4khTersMeSo1b
	2vXPQqaNUxZ7gAfemvx3eG+7GlvrqSemzpkqS+SK/So6snBtTlHnHHLwTs6045s6n+Q=
X-Gm-Gg: AYBFou15MdWsCHf3kTJiZku6S8WjOqxXcLEyQ8yOPkclRvJVfpEz8b46qmbu38Az+kX
	P2xUMooKk4ApEvPgg3pdpQGpGOgS2GDkRipKJqn+sESl8PkZ5JHq/SaYEwKqWzCLYDMOylVWS49
	7I+AjWTo4Gur/jMMIHRqm5mO24Kk6c+9/EkC+zqVl3TVxn59i2twbscY9Uf2vttlT38aND543Ak
	9EFzyW4NLTMHR6eRdM8C68fhSiIGo5It6VSlx4q/IYabugTm57HQpIWEm4FsgZ5QS+lMjaVFRtD
	li8Tzm7CR6iTsPTfiDrBEkCsBvA2lUOO2BxP3NUqL23u3OVnKhEaF9x1Nz2nqoE0kh+NPk7/psW
	Y4PHyAbpL7EYGXzSYuZvt41bjAI2lb1eu4p/RgXnFXCUY9Ze4TCFWVzZvgdm14BLtkYgNxtmYhY
	FRYhBLIPtOoT+YM9HYjVhhVpRJILwNtIeY+WRZ/6TDOaLoVA3+Not3rWxKj97S1Lkpg3fmWWOax
	GAi2zISsQ/5BP2aUJu1T2PjtmuEr02pDA9W
X-Received: by 2002:a05:6122:21a5:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5c99ada3e81mr2076243e0c.5.1789565073226;
        Wed, 16 Sep 2026 06:24:33 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c998adebf7sm2661263e0c.16.2026.09.16.06.24.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:24:32 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e5059fbso287917e0c.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:24:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy1NbnT+FA8/whOZs5C1wwk2sk+LXLdtiIfhz9JllxsyMP80lBRnPTECUiQPGs5WvBnTu/JgebPxOdO@vger.kernel.org
X-Received: by 2002:a05:6122:21a5:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c99ada3e81mr2075973e0c.5.1789565071973; Wed, 16 Sep 2026
 06:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 15:24:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoGX-0m84OpGa+mYd2TiZTDC78FB0jfOf+G5wd-pAF8w@mail.gmail.com>
X-Gm-Features: AcwNN1Upz0AiTN6Fi0olgdVADB8csOI6lykesiycSiLGWDxtF2vw93S3VRE-mkw
Message-ID: <CAMuHMdUoGX-0m84OpGa+mYd2TiZTDC78FB0jfOf+G5wd-pAF8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: rtc: rzn1: add SoC names next to
 their IDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 12:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This helps maintaining because the numbers are easy to confuse.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
