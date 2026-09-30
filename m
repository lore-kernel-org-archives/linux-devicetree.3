Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ECD36826E
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757390; cv=pass; b=o8Kdka13aUZDjL6CvUe5POCAvs/am+U8Vy1ThrZ/tLo3eLEr4iC55bdZsFtOTazQn6v39+i66KFCp2Ie2QfVWnsa4FktrTJQ5ZdV6rTK620+lOMY+9AwKS4TpC7aUHMmDysQZooq7OaRjUt/8kYi1MH2eQ+X4BlVz0/scT/yAd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757390; c=relaxed/simple;
	bh=HjdOFxmrol1vUnD9FKIi4UFta8BjlFpXjkromc99kSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYVpIF9teCP/gzX1aS40aBEnoEqrol0NOtGiKAyi7B4knQ284YCrfTa++2hCaHcGRbiMMJpB3GSO68ThHDrwXAtoJfTtnxYNrAkI8/3abih/MFnptFLUJCnK9YvwcIw5Wkul0kjxgymNks9coPvFYw12CEgq3aiULoI7TnaZZmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPP9lv96; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPP9lv96"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4887d3c59ecso735504f8f.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 01:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790757387; cv=none;
        d=google.com; s=arc-20260327;
        b=lF1cczIN7FcRSFufopyxRK/VyRdVr+dKFVTLPNa8yBfrfPsh2Wpeyx+Yybvki4pkf8
         hgos7Fq7cwgfiuTj2eBZhm0A59oGRc4FoejOHyo2UrPdJPhb5lka3FPLnVVReSqp1wy6
         hZkLMQ0t6cFDMkPDDIQoh3ygFkipCsfiruU3ZGlWV/XG1mKENAxvVLui2f/mqTkWOObV
         8iaJSIeHfZvbCSKgP6cflzONCqcKh02Qj1j5aAoEUi3SoRbi7hUbvio9XPMlplllJN+9
         bgtYInWEjQMvdPni04G8WDfPYBzFs5gm6CQ2J7Aw/mg/QlV7sEWzw9JZwyn6Lxs4Pg6M
         J93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        fh=Ozl+kQJL25XamUPCbWsZNi1QzaRCdsNRdGXoyHo/M1o=;
        b=fazCtg5MjUzS+/PahRUtTS6XlEmTgWnqG5Lza7+FvQIqo+rbjxITh5DOEar5raB57a
         WTGM7Cf0+oxak3qq/bX31ZnQJm30dpyVQaPf2XgMhnHp67OguiS9Z8RoaYtWqHPld1Uu
         qK3RPfMtLxehed/iCHihrwIWzQDDA7bmJJZTdP9dR4FS9rTq9WN0mSc93korNiT9cXOm
         FP2b9OCLpkmze6xKxiwqa1D3rQstul3ladXb/44LYtWRmYPdvkdC2nXUmjx+1BoyUJCl
         vfN3riXNhjWaGQbeHpZtdk4nXb8oa0KuK+OzbGyA6N6fIuZ6v2DJ10YQybHfTU9I7vYv
         lXZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757387; x=1791362187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        b=fPP9lv96gucxheuD/UTtuwMLtRAubDXO6WGg74NbhRj4tuAn4KBKQ+RWXrNeSi8GPI
         mfCZqPOC4R3qYvxuSRl8a0qTaw6LpWt6Foq0S+81hAq5LsAf2W6PjsJZGfiSZl/4nSr9
         GcwVDBW3HAa3HSoKBFbNd1v2cC6sgXo97nXeWmbDHwq6zOpW+ywSnscCG8VNMh86gfuM
         q4QWhSJdmrkdfIww3F9Cgr9D/RneVfoD5dZNXEItcwosil4qsfSpZX8iUhKSQ1a2zgWF
         cQO+Z6UJeYPAZnfg2nJPSsMhJ93/Wlc/sNjA/7JKIJo3KiN512Ar3cU8zlXufdC0pW1e
         zlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757387; x=1791362187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        b=KyooFkMd8NqbBo2jRByfsRI1STjlYwqKmMV5xznfcuNv6R44JaK8fnmtpUXgF3f8y4
         xYtcsfFKt8WuePWTD7KpRqh4ZHoGkbkwXk9f0LjmeOE/H+ipiyIqCYtdtuS5HPuGWJSC
         x1Yy5ZF4DNDJL/6p8GlE1eIJMdE20/tVicRY5FKw65Ok+fl5KgE86kiajPJdwRpMeK34
         iS8H8y+OiW+i6LNjNUL+j5AFtPyHbM86/83y5iUwaaNZBOx+3Ysm68a15NHpbjJ1KLE3
         ys3Nt2Kji1n3hWK0+iKhpLrzrFhuCq5439Y/hKQ5j9Wy0296Afd1Zxr6PO4jFIU2ZVCa
         QO6w==
X-Forwarded-Encrypted: i=1; AKwUvBwtQqd7hSUr7Oy2VzNiHMRlNJbEIz8kAH6N6ID7sGjrgJYLguXLxF5mTdUVpQCWDP8Kx8FTVxQkMinp@vger.kernel.org
X-Gm-Message-State: AFq9FYL31GOhbHRjnamtoXr4QjcDSkwbZ6UESxwbO88CosXmlT+xqvGB
	2l0tyHRdPxzVZ13p8sgtCHgdUWv8b+/iwYdKLhY8PAoARs0Kk7fLbCA43kEefGqa50EquHBLmmE
	JSL/lKROY2Ukxka1Dec0yioPst/tJcGroDvjhBqE=
X-Gm-Gg: AYBFou19hoE9Tp4z+Lzf8IphdZS1VV19UCJ2fskiCF2KEzWcnTFTPanyTuzCFvohQfR
	ZfqHAswB7WvTmt+knPJYIoE9d3hjZTD+BsF1OOXqbiwPgSxL2SzKnCuXnCF8df0zHBZUeBXFD8s
	hrcBafvWAehhfZvA2KCeEWs8BKzrJywRJFqjYjHAT8POJRRAsU21OWpoOozRuQojgGhQS6IAN5D
	K9F7opqfvxPLaYCRkBmcWzNokgYeybw+EkXUq3KwvvgQicCzAuu5s21DTT63LWvSiBGb8ki6/Po
	kIJp1H5WxmiOQ9rx8lDNzAlY6MbsASJke3IzimNDEYlROLhxukiflDqmeuwLmi7JWUSlS2ZIS1J
	bnZsoVgrCWLGhUMMxwyCP+Vlj3/DbHbKd+/ehLWLjTGXntSnpiKxOZBiqmts9AUrGczqhguMQ5g
	==
X-Received: by 2002:a5d:588c:0:b0:48a:f11e:6d5e with SMTP id
 ffacd0b85a97d-48b024a6d19mr1630952f8f.11.1790757387095; Wed, 30 Sep 2026
 01:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929105021.542730-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929110602.D533D1F000FF@smtp.kernel.org>
In-Reply-To: <20260929110602.D533D1F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 09:36:01 +0100
X-Gm-Features: AclHuK8CCNO96WytW0FDoK4wkycLlbK69yfsHonOrEjdyZiIwv_YOfKHdgyoR20
Message-ID: <CA+V-a8sNsgCP6icoYd8irORb9OGMAFG+RrgMOEtAiMoX9gFFdA@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] watchdog: rzv2h: Drop enabling clocks in the
 restart handler
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Tue, Sep 29, 2026 at 12:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] watchdog: unintended system reset during suspend due to permanen=
tly enabled clocks
> --
>
> commit 465743d35253a3a281f9ce8cea373ed0c3ae3e5a
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Drop enabling clocks in the restart handler
>
> The commit drops dynamic clock enable/disable operations from the watchdo=
g
> restart handler to avoid deadlocking on the clock framework's global
> enable_lock. Instead, it keeps the peripheral and oscillator clocks enabl=
ed
> for the lifetime of the device using devm_clk_get_enabled() and
> devm_clk_get_optional_enabled().
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index f247e42d54f54..55ac11fcfcabd 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -292,11 +279,11 @@ static int rzv2h_wdt_probe(struct platform_device=
 *pdev)
> >       if (IS_ERR(priv->base))
> >               return PTR_ERR(priv->base);
> >
> > -     priv->pclk =3D devm_clk_get_prepared(dev, "pclk");
> > +     priv->pclk =3D devm_clk_get_enabled(dev, "pclk");
> >       if (IS_ERR(priv->pclk))
> >               return dev_err_probe(dev, PTR_ERR(priv->pclk), "Failed to=
 get pclk\n");
> >
> > -     priv->oscclk =3D devm_clk_get_optional_prepared(dev, "oscclk");
> > +     priv->oscclk =3D devm_clk_get_optional_enabled(dev, "oscclk");
>
> [Severity: High]
> Does switching to devm_clk_get_enabled() and devm_clk_get_optional_enable=
d()
> prevent the PM framework from fully gating these clocks during suspend?
>
> By permanently incrementing the CCF enable_count by 1 here in probe, it a=
ppears
> that pm_clk_suspend() will only drop the count from 2 to 1 during system
> suspend, leaving the clocks physically enabled.
>
> If the clocks remain running while the system is suspended and the ping w=
orker
> is frozen, won't the hardware watchdog counter inevitably underflow and t=
rigger
> an unintended system reset?
>
The driver doesn't currently support dev pm ops so I can't test this
scenario. My current intention is to add syscon support so for now
I'll drop this patch and revisit it when adding pm ops.

Cheers,
Prabhakar
