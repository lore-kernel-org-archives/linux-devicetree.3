Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F3A43F8D9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128741; cv=pass; b=KqvuxRLE0fWHzWxHdaRRp17SHfNKRhcDMfid+Ivks+6oqiWArciCsmCSi6753+3oy4BFFHFI42HttwG522Q/2fDINx07lMG835TUQME1LcBsUlVkXHMFaqxukljlTvRQYwS8MAc+T8Z3I6IkonkBo7m9LfY7vidWrWb20KCwYkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128741; c=relaxed/simple;
	bh=y0XIFCeENQJqN8g/vbt7VAjbJq+Nz3Xv9yF4zfVVk+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwEs5AJf3BpLZIND30mQdg3yPWBpWbvObyNaaY5Di50o6DQP893Q5MG1U5x5+WkrJF7J3k1eV8abNSh/iYTFCGWZy4l+W/JN7C9NRFaFedPFlq2Py8SS/M2uG8dfQokbkwX8oTiLoXZc3RCCSEJBZZIBNBhoXpusrBgWO3lixhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5qY8lxc; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5qY8lxc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so4290555e9.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128737; cv=none;
        d=google.com; s=arc-20260327;
        b=ZzLrf3fqWeJ4UjQUa6HnsvG9eLAZH1XCDXPgjgabT4+JNgvhunNJ6H4vX9NOw0AVhF
         lL3CPcBeEhS9Ze2NYpNHAVJH2it/2fN63a21EJYNK/RWYZthmLQDCC2e16AeXJox2fJH
         t9GBWlTu8awmcwqqyHvIcUsvJcDGUDHm1EglUCecS5W1gP0GM5SOvSa21M1EzMx2kJ6c
         XdhJgdOQ06sUPTXWwJNshiBG0+lYuECWspoiu0j6pteZ9gvhUQlnOvQXwDtKooBjKpbX
         h8bTwQYs68yiZZSRKr5+Ba8s0tqmGxvdkk5l/KDRWmlZl7hKYvwTxWagb8crLMH5wvKC
         bP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lNwnWJHPLgasWdBDmLTUGAni7FNn6xt21s/9H9MyjEs=;
        fh=c+PbEk8LwpxIyKySa6ko5RtI9PQq28LZhTuL56gha1c=;
        b=A3cwhgiOFcmV4nDwUGh8k42pZCMWyFPKB/PsSn0K0mZoTJnIYqHttK9Pg3gLr9oYKe
         ew/+sURXXTcWGxnzuL5r9hz29MKqyWM2qPvjZxElMIsVJXjONAOUpfoG7iPjW36MivfG
         eH45IwnLwcVuHG1/uMNQoIc4JkOw5Z2h6IyNbO7sKWspLg21eBIC0F0x2G6tBhTTwQzy
         bfc6yisw2pEic91Cntv7ybP5FyjahCsL+Zl1wVZaNYTTtI55TDZfWC/L38bePJQO/9uW
         bUBHD7wNTZiwism+1dNc6p7P1XGPylyWALKkOesLirBhknNsNlhakxKFNvB04FbBimH6
         2u+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128737; x=1789733537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lNwnWJHPLgasWdBDmLTUGAni7FNn6xt21s/9H9MyjEs=;
        b=V5qY8lxcYRx5ZkIgRmvJ9ikvQM9tfa1YVpHh6YCgYiAmdE6HSAt5KOhaMYdaJQQzCa
         Hj8dI0T54rgkj+2XeN0gpFjo6DOZTdu57sTzoCn3XKHn2mBfyk+agK9tVCBoAb0iXt17
         C2toev6+JdfrF7feTUBAheboKY64UOpMslY9Lm4C+7aN9yKRFPFwgGh6YdYrnG8YAijH
         46Kl1Dmxsbwmn+KtFd6qxEFx8cf3gsjhCjpQFjkLcyrBkIgJGbf9LFt2qbLk+aT8dosn
         sVjlm3KmBoAKqRT0EqZVfLydjEQTE+uKcqmtqBAvS5bFW0KntWKPlVV9CSwsCPir5FBt
         9XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128737; x=1789733537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNwnWJHPLgasWdBDmLTUGAni7FNn6xt21s/9H9MyjEs=;
        b=lj5nPUUpqz9yzHlCFPvoAQMpn1FjKrfJy/HR1DKMfKwNfjGFdg9pYu1yf2Hoxq29Rl
         5Ze2yt0wYvdLHwng+Tt1zn5SxnsNu0JqvsEzi6lFoSopNGTjFL2rnRbnuoREjw4VyFon
         FqvD5HbnTwJndyW3wdhTYXqVMANzqy8I1PraBfXF505ZMjClal89hoZDRVVJNoDydbcq
         RbMqowCtjkaDPXvXOOj/UpcXXGoWG1vRXfLSDeYKKe9/TH1DoZUDsDxxCzw2aPDxaBip
         qAI32LM+oyUV4V6y9BxHAuMFhTd8HOXtZBdSSvHoe1YV5zDYInq8vAdxPNqFBXLIeLCa
         yUZw==
X-Forwarded-Encrypted: i=1; AKwUvBwQajtxxfhGGByXCdUyQDIjwtOuXR4qaS1bXgw4MlwLaMZ3gWkc5hWkcK7GjuhVpkyDKsYU0K3BaBli@vger.kernel.org
X-Gm-Message-State: AFuF++nAFjt7UTMN72WV8lbKtUN6u2nk88zwUuNAny1OvEm2PxRvoNBy
	J8jPj/JrCm8fp0+JKS3kC61a/26XWloC7L0xcERkDLtWnG1KtZVZrtIY8haPIS3z6k2jb95DVmk
	UMZoj92gU+EkksboL8nwEQzvyRFPMx3U=
X-Gm-Gg: AYBFou3z8ldXXXWmlJp4LV7EVKlmtTlN2rTdaKMH0/nJJpXtLL2iJDGeDSJuKYG37Yx
	MboVt3pLje5GI+I5XvRfkZAv7TjoGy2CjwMyPrkED0ySB369eWt5FONgTh19GN5lwyNd45525dt
	A5iFM6LLpSM+XK+pd5+8JDekRCxNFIqfSZcylOVLdxW+cujRurTR/n+QFEpGKN4G7bAmMVtrXCx
	sC13xOgPyOSLjogncdWE9zU2+NXxjrEJtX8PNhmHmfz8G2xynNLXSZrX+4f6IkCAbXx18Z9ix6M
	P3iyV5GuisAqxh98gb8lT0XUt5qhJt9RS8uB3KAP6PyoXjdCkTtd4xvqe4DnZcjpC9RrIyyc7rZ
	58s2hlF6JOkJ5KK0Lod6OzLh/wRB2PK9ppV7ixZPt6uguxOkARRyYYZWHT9UaPZSoijBuQ6IGdt
	k+x0mW0hXc
X-Received: by 2002:a05:600c:1385:b0:499:a5c8:c6f3 with SMTP id
 5b1f17b1804b1-49e61878ab9mr68367055e9.3.1789128736767; Fri, 11 Sep 2026
 05:12:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911112713.355FA1F00893@smtp.kernel.org>
In-Reply-To: <20260911112713.355FA1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 13:11:50 +0100
X-Gm-Features: AcwNN1XOUOwZDNjKd0fMCAdW1pC8fPronyNs541sSWVf7U32M71-UP3UfDUWtnw
Message-ID: <CA+V-a8vH1yC_7V2F9HGMaP2QhuyU+qSXd_J2BAvn5aT-0CH61A@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] watchdog: rzv2h: Use pm_runtime_put_sync()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-watchdog@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 11, 2026 at 12:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete fix: rzv2h_wdt_stop() still uses asynchronous pm_runt=
ime_put() during driver unbind, risking a race with pm_runtime_disable().
> - [High] Kernel panic from division by zero when the optional 'oscclk' is=
 missing from the device tree.
> - [High] Missing NULL check for of_device_get_match_data() return value l=
eads to a NULL pointer dereference.
> --
>
> commit a446e675679ece36ef9554b71239f1b2c12cce73
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Use pm_runtime_put_sync()
>
> pm_runtime_put() may trigger the idle check after pm_runtime_disable()
> is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
> runtime PM active.
>
> Use pm_runtime_put_sync() to ensure the idle check runs synchronously.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index cbf414e0c9a3c..4a5a856060e91 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> > @@ -270,7 +270,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_de=
vice *pdev,
> >
> >       ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> >
> > -     pm_runtime_put(&pdev->dev);
> > +     pm_runtime_put_sync(&pdev->dev);
> >
> >       return ret;
> >  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but it seems there is another
> instance of this same issue in rzv2h_wdt_stop(). During module unbind, th=
e
> devres cleanup triggers watchdog_unregister_device(), which calls
> rzv2h_wdt_stop(). This function issues an asynchronous pm_runtime_put():
>
> drivers/watchdog/rzv2h_wdt.c:rzv2h_wdt_stop() {
>         ...
>         if (priv->of_data->wdtdcr) {
>                 ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
>                 if (ret) {
>                         reset_control_deassert(priv->rstc);
>                         return ret;
>                 }
>         }
>
>         pm_runtime_put(wdev->parent);
>         ...
> }
>
> Should this also use pm_runtime_put_sync() to ensure the idle check compl=
etes
> before the devres cleanup calls pm_runtime_disable()?
>
Agreed, I will update rzv2h_wdt_stop() to use pm_runtime_put_sync() call.

> [Severity: High]
> This is a pre-existing issue, but I noticed a potential NULL pointer
> dereference in rzv2h_wdt_probe(). The return value of
> of_device_get_match_data() is not checked:
>
> drivers/watchdog/rzv2h_wdt.c:rzv2h_wdt_probe() {
>         ...
>         priv->of_data =3D of_device_get_match_data(dev);
>         ...
>         switch (priv->of_data->count_source) {
>         ...
> }
>
> If the driver is bound via sysfs without device tree match data, could
> priv->of_data be NULL here and cause a crash?
>
> [Severity: High]
> This is a pre-existing issue, but could the clock rate calculation result=
 in a
> division by zero?
>
> drivers/watchdog/rzv2h_wdt.c:rzv2h_wdt_probe() {
>         ...
>         priv->oscclk =3D devm_clk_get_optional_enabled(dev, "oscclk");
>         ...
>         switch (priv->of_data->count_source) {
>         case COUNT_SOURCE_LOCO:
>                 count_clk =3D priv->oscclk;
>                 break;
>         ...
>         priv->wdev.max_hw_heartbeat_ms =3D (MILLI * priv->of_data->timeou=
t_cycles *
>                                           priv->of_data->cks_div) / clk_g=
et_rate(count_clk);
>         ...
> }
>
> If the optional 'oscclk' is omitted in the device tree, priv->oscclk will=
 be
> NULL. When count_clk is assigned this NULL clock, clk_get_rate(count_clk)
> safely returns 0. Will this cause a kernel panic due to division by zero?
>
As replied in the previous patch, I will add a new patch to check the
clock rate to avoid division by zero.

Cheers,
Prabhakar
