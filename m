Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359AA388369
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786301765; cv=pass; b=FX0tI2yhk4fMbF0eZRADCd4gsXR5yJQG6kBqgxtSkF1rbsEBBXROJEZjCyo+Fvt/GFyHJ9+QMXug7Tzzd14HKr7UYO70oFR2D4dbTRqdGrlIQqbDOzHTn+xWGV/EfXrYq9FOZlvbxskW5gXgQ9XCx0bBlBeQnD8gtYF7FzRNGeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786301765; c=relaxed/simple;
	bh=IdyFU4nUNYjMMnXZPL+V9LxnoFaNd6/XEOxFvE07zBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKt6ErVXzgA7eUSRhjUihV5c0gSadof9fbo3Jomz75KjmR/2D+C5qW/CphlO3H/CwuOp1btW56pt66TYHPh+Yw1mdNLuTk9jMi92oYlIUdkj0uSEEi2txdIf7nQnaLjlgRjOzZYKxsMAZPtNJrsJdTVnyEZdpUk5fyqFNySkgVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igKEKwhh; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igKEKwhh"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20755e8295so217143366b.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 11:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786301762; cv=none;
        d=google.com; s=arc-20260327;
        b=HhbFIzDRtpKNwBIYeNpU2fYM6JUUBK71h7Xx4dZtKP4vpsxzTWDg1zLOPM1xyMGTzJ
         d741MARJSv0XS0uZJkmyBFWUPzoQfzwkD1BKmKPU2MVUzhBfy8/DtO+Uhk1CF8o8BfxY
         PAnqOud9Ru9X4kzibDE8Mp679+M3dn5gAFMKm0E+qeLrO9e0n8xwu+PkYZ1YOgOBJSE6
         sjI6ihwBHTeYXGAEO5viQkqzUNGDyCRKuaVLitgmjTE5X11TUkUeewkdupz5er34Ks9u
         JThtEY3PzXOsnl+5NiqdZ0VH+nTw6VfKSVrUoTNXcM0K5Ws06Zymhh3qpNHdGDJnVie3
         gTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        fh=xQWbA/Kph090g0mMt+1s5vpu3xxPOcytDLq3tkCzKa8=;
        b=ngHguQvFQXqH0terToAlbDu7OpdHDbrZAoFff01GuqqZn4GKN9t8m78ZDuamPshlYw
         pYxlfZP1DyDWG1IjTP0lU1XBpAz18VCX9eRaZuRkiqISiTJ5u7wgkUlCakQSj/+sn7/i
         kdgPdd1Jjz4xJCmJbXE8MsoRifb1mG1/sLxsLMpgIkEs6UplX9wAkQL9rDkG5EAUiRqN
         v0yDwIK15s/R1XCYUJAN1z6gyy+iJPjLoIiBqhATpbqZ+hbEFj5kl9zq9ixa2or9EJcf
         UoSOKnKYJErDwoTexxQfhW08KTIDQPPC2UNQrM8wgjoi9zqPzv1ds8sUU6AHzvg5PZ3s
         B7eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786301762; x=1786906562; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        b=igKEKwhhpKdo8JzARV0rrzII7QLKfrtD8d4H/fxhSxIhn3R/LUhblqvJE//sxEbqly
         n8LkDJhXwqnvcR2Plw0vwBtjEBFnG2WXGJk/Z7jvNNultSKm2ZzFa2SYfHpaIC/wqMYh
         +bGjTQoPMAL2m6ioYWVxYijEjesCe5G+S1VkkWH7JplrkjFcHhCeprwQkHZYBxVBNCer
         MSRXDo1NuhiO6wstx0AGfFbB3sGPu4CtSt98VNuUtsIBhdu3KZ5t+5om42dqS5sdH9fx
         vIPC2vi8T/QSzM1FI1ZSPDeUIcZnlQgVy8qF/k5JdEHTN3YJp/wWFe79vWvFgwYhMdcW
         X/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786301762; x=1786906562;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        b=MvKEqlj6scnLSxzbj6/NA+bwmWh9wtPP2GdzI2JJN8NMKCiT2dFJJmSo0yghOoULF3
         +Qm88KUeqqHy1HNSjBbhM3CDmDoKj9nkopZCCF0fPDyVCLJMhERWIQ49oseqCfRyDuyw
         Omg0pFC37dcgn3GcdiaiyeKB7fYiIF/UwD7OYGG9cJiQSt1HAUEWEuh9UjDIclRCeSMj
         VVlLLB9aWZaSxy1XXKdCVIiVvFhquWL6mKZmqLPex8bJZENq7LMwuMoVWYI4se/C+EQt
         4l/z0vG3+P9dAKtEZjIcXbQWLo4gDroh3UsTirHYPLDdHgZRznFiUwGBce8Lt0RbXUhP
         HSlw==
X-Forwarded-Encrypted: i=1; AHgh+RoFuXJkyLpTjr7pRZ6f+q3TrxJg26avg85ncuWw6yWJ2YJRVJXn/wD/U7VjZvpPgM0mQuPzd9jQEPKi@vger.kernel.org
X-Gm-Message-State: AOJu0YzM+kxg3PQMnqjcc2LfSJxVYirBKJqy5SP9VhaWMQn608roNGBm
	AgPN0TGAG3yK+dhVdZStoB/L543SgvkQ6lazL2hapOTLYmLLC+dfRlB70NFOyaNstFkO1EC372z
	esndX27HMXvO/yvPkbpZBcJf6vfqw7T4=
X-Gm-Gg: AR+sD137I3lGw0XoxlYTO6HwCL7oFxZleQfVAMWpj+7w2OriwDlH4lTu1z/tAL0GEOF
	bsOT8d6ueNynCRrlj1b6Vjrx6wi/7uWwcPgw26NQ0z5EYl+9v3QcSwE7AN/Y+9mAwlWIlsLSiIs
	sQtnWKwYjmKz6/1PS0H7eOhg0w5L8W4vWUrDIJnT/J72lSrioQ/sjxQx9uM9lWl6bEWf2TNXHYR
	TwKyuu2NvXaIxei9FPgZxzB9rs31SQTSpJR+SE2IY+XUjEsiNpx6fP19nearcWVyOnbi1Um491R
	S25ww4h5USvFPDKMKw5ynoudzV6HJNYVEw3tjxqXOxhW5iMArAQYVgLF0E1bFJzy3W1VI1qjPdu
	zHYfjxVh/Hg==
X-Received: by 2002:a17:907:962a:b0:c12:b58c:fd7a with SMTP id
 a640c23a62f3a-c208d4b5c1bmr643267266b.9.1786301762159; Sun, 09 Aug 2026
 11:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd> <0e4dfe8b-af67-4dcf-92fc-cd564d7c3744@roeck-us.net>
In-Reply-To: <0e4dfe8b-af67-4dcf-92fc-cd564d7c3744@roeck-us.net>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 9 Aug 2026 20:55:51 +0200
X-Gm-Features: AUfX_mw2G_pgmXXoJxjvv-8va564k6KXHRWKZyjeue4zkg_p1JWDElM0hRbQ6kQ
Message-ID: <CAORyz2+op80Tj1Ax1PD8wN9fAT5QfAev+vEPBgihvM0O-tWXPA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Guenter Roeck <linux@roeck-us.net>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>, linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,
I added his Signed-off tag as he provided basically this same patch in
a separate series [1] slightly before this submission and I wanted to
acknowledge his work. As far as I understand, this attribution is
within the guidelines.

[1] https://lore.kernel.org/linux-mediatek/20260716161923.266315-8-akkun11.open@gmail.com/

Il giorno dom 9 ago 2026 alle ore 19:49 Guenter Roeck
<linux@roeck-us.net> ha scritto:
>
> On 8/9/26 10:04, Akari Tsuyukusa wrote:
> > On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> >> Enable the toprgu reset controller feature for the mt6589 SoC. This
> >> allows generating reset signals for the 12 subsystems managed by its
> >> top reset generation unit.
> >>
> >> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> >> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> >> ---
> >>   arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> >>   1 file changed, 2 insertions(+)
> >
> > I provided "Acked-by", not "Signed-off-by"...
> > https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
> >
> > PS: I am also fine with this patch carrying my Signed-off-by.
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> >
>
> That is completely inappropriate and unacceptable. You are not in the
> Sign-off chain.
>
> Guenter
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
