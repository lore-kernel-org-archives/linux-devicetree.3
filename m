Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5274772B9
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840934; cv=pass; b=EzU2sigLkJbmeoVOdCcGwwof9BsuEbxEP8MMHyy3hoKL71rEntuwqYkcAqXbWhUB5SM1t1x7s8cZRMgyi3AJAn0CSK+yn9ugC2RoOGg/2gP28PvK0UokOrNZv+rgyZsb0omY3PVrBwMJKjVyuI1T5tPVFirx0wvndZ9Rfzs+3Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840934; c=relaxed/simple;
	bh=vhi9ep+bQeVrexD8hO9D7KsCbKUp25LBBrjX+Y5IaQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZJRQFk39sgUxyQB3oox3s/NqkR4fb/jSrcc1u6Mdhshl0cQUbBhSu2IQZwmwAw7bswg6WRoAMhAUe1JqTKYr04WNR0nlIjMKpPJup/ow7ge6Vau8SRuM44B0fuM3Dv97YMnyWztx8nIlrL51DNWbIZG1gvhRGJmQ2LxRdqlvxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ad0ZxIPI; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ad0ZxIPI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso342015566b.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 07:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787840929; cv=none;
        d=google.com; s=arc-20260327;
        b=LR0/bL5SmB9+gSmP/ghbxrPHv/Zq4bXVzaCfLGoDNeTKryjYnce46Z+03/eECyd0Qv
         NMyk4GwaA67Yi6b2Ll3dOu7TOydAf0J7etyHHunW+ZZCRAV0kjhgCzR9qK8mpEXCBntj
         FJThAaLmkV7uw4yRuNxuX1uxB0jsy0i4LYe0BTUqblZMJ0lCXGWtTu7C+jiqcQXL79fD
         zgSdO0IOGRG04aFXyHsLIjwoZwb0tbPgBmMAK/5jy/LD6juW7Qd95QDZiLkfA6B79Rk8
         qbSZkBiG9X0PiVtvMgbLOPt6J3Sc3TFAw6bURwh96cVY9B8e1dCpIAK8z2sHZEQCouEW
         GtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        fh=yk4E059WKNa9Tc1L0HW9WkMOIInjGjSTEshWUxd9N00=;
        b=R5oNwq6RY+4t16l3VhTXQHMd4j42UEe87Evw/57Jxi+AsOuK/NIx6pSzSAf1CxWRDK
         glFg5ku9DLWvp/bnSVmlv+5H0pAEVoCrl2iMoRHmHieSzcE5HWf2budvFrzD0NywwOmS
         242z59WnO/mmOrGHCyj/f/rDU2YWnye3Kfl8J6cREQXIsY04ExgND9DF5ExiI2xXii4q
         YBAgE+S7jmz1LoWPkB+5nceJkMWsYFhIw781+kPJkGkZj+HG41qQrk+Xv9oLvZvk9+MP
         MsM391M9aHGXbiWd9R/wbp/WqzOYxUB2RciiLc5PPD4N0b97+iq7kaykllIzt8obGPvv
         h1zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787840929; x=1788445729; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        b=Ad0ZxIPID+Ol7soMh/NZC59Kn55HP3nXZEokv94wlOkP6L5LvdQhbkb33O8C7/JApy
         XXq2xVzCsHHU2SEAytiAI21UaDWrnmQKWBr//sIfnS1H/8JurLfVKSsLw96MlsSw5SRs
         RWloO7hBuQmJrGKZLrbye7xRUA9XBmvoel/3VDQUfrAVCQ+lYLGZHIxTPphZ4vX7E+zq
         gKSU46alGeuhZEnCdRTqZj2qES3QJuPpwurO/gMVIAtWftPet53eUK94XDA9rvqWSWFB
         URRLOtGhjJ6MYjbkW/YMoNMP9bKx5u91OItlqQPn1Zqay1V0JU+aDao+LpvdhPaQ9vDb
         xSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787840929; x=1788445729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        b=XdcQKRSOmc2yzIEg6ZRnXrqbYGGL7nn0z2QwwbZJXqiGtkzOLh7TTqqo6MegW6QHgy
         G8LHZpdDFkgsy9313+A2myAvyTb6TMNrFnC4gX+9YVckSAISGE0zrKsx1KX/nJLOKedZ
         9Bm3J6f05Nr90JcuJScKrbaJIvCu0dZ2k7b5PTO6qKhYvbWzN8v6kEEfLbZ90FV3AuOA
         evzaHSb2GeaE/ZuU/6m46L26a5aqiYHVetjNkuLkl6KTztT5gTuN6PGbu+KM22GVpsEM
         atpBS4OA1uMVp6E30yeUZyu0C0+XHHjvM4GZowxwdR0+JxcPWBgv+Fye9d0B1xMTB66D
         tNfw==
X-Forwarded-Encrypted: i=1; AHgh+RpweEP/F9gwb+BOIn1RM55/x0zdV6j7Th9w6gqm4PdH6N9v/7FPLY2ykmd5ecjhoBEEpKoXDv4dY+ZB@vger.kernel.org
X-Gm-Message-State: AFuF++liei2jduOJMR+F7t15MMksEpR4sOMO1b9R2AM0hPqpnBAYLH3r
	W76UFR2o3X95mg92RTyuY0VvyQ72ohgvS+NC9TJZzC2OKq0N+TidIH4MeAaWTQ2e+RBhAq1ljE/
	gse3Jhs2Bd+yMTrmGEOunRRlIA3XR+hs=
X-Gm-Gg: AR+sD13jrn7mAtTFGTLufBFbtOebR6Nw3Xv0E8xZOKzheK4c2OHOxhauEfiyCxOTvd3
	yaWs9TP/Do4RX4r2MMcQ2eoDThRMBsT9T/BdWrRxxEQfzSF4uZjNLwfnT7bhzXXODpUNkcNJK4q
	BDWTejstayzDi26VPQTIIufhz4ewezQTnygQ6eNO7MjZjxTiPR9VvAZQKcVWmwnbNzEAsXgAACs
	AkwWbhCjuOrQ7lTimo25JnPLvkFm7zjuQ+v+5cekvEnDvvoVzXxk9JN4pFv+ETYSwKwq2LmsWol
	AbSlTiZDemtx+UXKfMZ7Gl30usDZ55cyf7/83ZjAALQ=
X-Received: by 2002:a17:907:e98b:b0:c15:ee0d:9a32 with SMTP id
 a640c23a62f3a-c250c2e545amr1440724266b.21.1787840928409; Thu, 27 Aug 2026
 07:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <20260819101853.44681-3-l.scorcia@gmail.com>
 <20260827-clever-cherry-zebu-6a98f1@quoll>
In-Reply-To: <20260827-clever-cherry-zebu-6a98f1@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 16:28:36 +0200
X-Gm-Features: AcwNN1WwMj244ofyHxGC6S8z0K_T3xrDTw62tkx0k_I8FGnpAKJxs0-SepEND74
Message-ID: <CAORyz2KCAzEEsCifDF4+_wKmi=M6t4EKVVqys-H5wOQqzBeVzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] watchdog: mediatek: Add wdt/toprgu resets for mt6589
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> >  drivers/watchdog/mtk_wdt.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index 91d110646e16..f8208fb0f723 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <dt-bindings/reset/mt2712-resets.h>
> > +#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
>
> I do not see how you use the bindings here, so my previous comments
> stay. You just ignored it and never replied. In such case:
>
> NAK

The mtk_wdt driver requires the total number of available resets to
register the reset controller. This was defined as
MT6589_TOPRGU_SW_RST_NUM in the binding header, therefore the need for
including it.
In your review for patch v4 1/7 [1] you mentioned that that define
should be dropped as it's not really a binding, so for the next
revision I'll drop that define from the binding header and move it
directly inside the driver. The include won't then be necessary.

Thank you for your help!

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-August/112272.html
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
