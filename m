Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423EE3AAF49
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345053; cv=pass; b=CAaJNXuv7ykpGVeAqyiE/87JwLgUJDrvgpQ1UMKVunWwG5g+nceRL+eOYBvTx/0ONZbpfuZMKIVhVeKMDL1YFe8qyQVMwHujYCGy9obthIU9lrEn7HoE6ZChdDQCwd913ntI46GxxueWxQ48m0FuRRr/FYyLeY5LcP/x6s5SOM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345053; c=relaxed/simple;
	bh=pfqUIoW7PHPIYNNgFH4u6pCoFZSchCOkft0xZM8GW1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHn7XUNUEVAEXGnuv9DntFcyZ50B7vc4uXo0uVbsiXfj1I6LT+HBgVHbOTeuxWHdRD/B3nPptNLWiXHRe4boTZVYf40G9c6747TssoKRucIt50kXiaiBcix/ypymCaZctzAIklzBU7FRYZIjkBXWsHEJbnr5Nimifkw8JPsB388=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4RUZzef; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4RUZzef"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1368253f8f.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787345049; cv=none;
        d=google.com; s=arc-20260327;
        b=OtqqG/XZAzdTO0D9YG2Eo+Rb6k5tD8rgEqbSWgF09n9x6927E1TzC3PwlK55aqYZsT
         dqcdLwvi4v6rXGEOAKeJp7TTtQimllqVsFFnWHuXlQkoYqpNsbu0IjL3UjL05yiOs9ZG
         S9q64jCw3OeJD53p4LILpZ4UEr10AjJR8geuKcm1o9T7m2TaEGzYbwoRmmeoWPpNHdkD
         JWUk0vI/j3cnmWQkB2SxO73Ht8us/9bx443xfgaSQx0tK9sQWqmF5tqJJwP0DzpGajGc
         UhaJ7bCc75DNlySCQdOBhPNU08cdCG+ED/5PpSldIm9BeNiIJUpZWv7vGxebnFE2HKqB
         qSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+341h6DEBK5z4wanMXZy9KI3GcewBIrOEEjNnpvxUQE=;
        fh=/VkTR9T4S6CdBAZl2QtsvgcD7SOnQDtzadt5wnqGM9Y=;
        b=mBlWK5BnaS8JnQcMd5z9aGU7IzFPUpJU1c7b5gd5C3lHOwZsqUCobCVFYk8psNA5qb
         lE3PEhLnp4Aq2A0TRXP4953qDOikxN667r2/ESXX6NUoSfVVjFnSgYTG6woKMJ/cf/RC
         8iBP1R2nYi5Oki4tAE//oybiE8frV5Wg9nP/H+TtjmVVO796pYyq+NsynrGldukzQczs
         C1LBTWQ55KO8bvRhIr+w/vaShfrprydRfe7Wtnzf/sd76RubwwrfK8XtMrNXkocLpDMN
         CkUXiu4uXs+sTVvWs9xDtJgDBTii/YxhBm2olQTybIBr6g/kqNd3hcaIokXAY8CLRC3W
         DOfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787345049; x=1787949849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+341h6DEBK5z4wanMXZy9KI3GcewBIrOEEjNnpvxUQE=;
        b=J4RUZzefrcYjBbdgV5g4UJmBLQK/FJeHaTUbMM5mP4bshfUBERauh8Qm179Csr7PM8
         P+CfowNPWCI2fbsUAzzwjDoJfhMDd8kfAoSsQ/EC4IhKlT+OkZe8i+QfvKv1HX4fdZn/
         OIuU8/BJ1QOgVvMgJu6Wp/k7xyrnQLhdmWQrpgdyoS0wU+A6yRCN00HQBmDhp1K/aplG
         SJo7lh+gUJP7d5DRA5cGJOlIfuhNp1xsgSKbO53UIn9Aeh1l4GZd5fINfxnHzYBlmkj3
         pkOGWiRMIdKjSnIwTqKs/bUdAgsmE5Z3ANpQiAaXbVJvtM7c0w66NVkDYs18rkk9W/v7
         GIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787345049; x=1787949849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+341h6DEBK5z4wanMXZy9KI3GcewBIrOEEjNnpvxUQE=;
        b=hpaACkOOSkwnpAdsnC+NGHPoyL+vqvJ/NFkL+b0KE3PVMS2LymCV0THES+KwEPqYnj
         dj/Req2WTmBSw7iaMJCVqNyu+bMpScDbM19OqsWpjQxKoN0weGFOhsJPqbktZTxKn6Qu
         Co4RemidtfIo8XvW71v1bdraWLOr5heo95ofmeKPij1B+owzIxenp0HmGZ7jdL/0tZLR
         vgrnqVkt3/pN86hGxF/bmbjn9iDGZ8EYf2WXCIK2gFSul1OBHPZFMIhyiTeiH3KdkBj5
         sSrDAX0Jpn0wR6tvUenBb+k7FgqLnCl2UgZbGqZ6YDiMJTV8mhEJli7dT3b9pvWj7j/X
         fHog==
X-Forwarded-Encrypted: i=1; AHgh+Rpz68XNn8pLHA4DMG7sqGoCAWWOB/JWQTlczg3Xy4qzleimu8iHJiEcY0Vpy+TR7eUzKYh/gDiky7ln@vger.kernel.org
X-Gm-Message-State: AFuF++mNwyBQdg/prtTRQakwQRZQL9WxiWBWyKEkbqB+Zz+Iusbs6Pvh
	CM4nf0+Zr0DhFyD4oDX7XFAYUhZsetdcdkgXhDeb72c9bs/9lTnsCGfR0f4kjpApz/xEecHDeUc
	syq/EokOyeKT2iTpL57CPkcibj5Fjg+I=
X-Gm-Gg: AR+sD11ROXXlQzhCgtc5mt+xiaWYu7PGDPMEqUSRkqdCurKqxyPFZ1KI+hTpbH9hLKK
	u9hM5JUh1WguJGkC1/JWp8O0BJo8TI2l16SYMjsA/peSdrxK5iPqk307Ju5dhrOa4BKLI+hSg4r
	fANECjynNC+WEOGRUBkQdS65n5HPqILp0+AInKp6Uoj9d9eAxC2HIFpAvUuv1v99yTS44c9h027
	pxO5b7dkO+Y63J37eJ8H3hK1tQdoOo3bwbpEu4adJh2HbZxXHDM8ssqr6f+4MIXA7ICXd6CWMvw
	2PFEPpKbBeYl/Q0cWZdawn4amwASuE4eJ9w5uh2SPQ5z+XHWVGFCfx3+J0v6DoZYhhddgVEPdJS
	1vWgDyxHzIdtAY+F1ws9D5VeFEUfZcuJ2SJiows0VmBtSwg==
X-Received: by 2002:a05:6000:4b16:b0:47f:f1ab:9075 with SMTP id
 ffacd0b85a97d-482c0bb16f4mr14946126f8f.20.1787345049436; Fri, 21 Aug 2026
 13:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260821135608.275233-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <aohqChLVqwiTpICo@ninjato>
In-Reply-To: <aohqChLVqwiTpICo@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 21:43:42 +0100
X-Gm-Features: AcwNN1UV5kbjb7HhnjD6pQaN2t78NxQ2bOmzAO_X4_DwzDdyb74TPzJRrq4RttY
Message-ID: <CA+V-a8tAUirxWKyCx9yvYgp0EkysxgkgK20-RArzFFKOXuHSvg@mail.gmail.com>
Subject: Re: [PATCH v5 04/17] rtc: rzn1: Handle unset alarm weekday in rzn1_rtc_read_alarm
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

THank you for the review.

On Fri, Aug 21, 2026 at 4:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Fri, Aug 21, 2026 at 02:55:55PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > RZN1_RTC_ALW is a weekday bitmask where bit N represents weekday N.
> > When no alarm has been configured, the register has its power-on-reset
> > value of zero.
> >
> > rzn1_rtc_read_alarm() uses fls() to convert the weekday bitmask into a
> > weekday number. When RZN1_RTC_ALW is zero, fls(0) returns zero and
> > fls(wday) - 1 evaluates to -1. This invalid weekday is then used to
> > calculate the alarm date and can either leave tm_wday set to -1 or
> > produce a fabricated alarm date.
> >
> > Treat a zero RZN1_RTC_ALW value as an unset alarm weekday and return
> > without calculating the alarm date. Move reading RZN1_RTC_CTL1 before
> > this check so that alrm->enabled is updated for both configured and
> > unconfigured alarms.
> >
> > On a cold-booted board with no alarm configured, the following was
> > observed before the fix:
> >
> >     root@rzn2h-evk:~# cat /proc/driver/rtc
> >     rtc_time        : 00:00:19
> >     rtc_date        : 2000-01-01
> >     alrm_time       : 00:00:00
> >     alrm_date       : 2000-01-07
> >     alarm_IRQ       : no
> >     alrm_pending    : no
> >     update IRQ enabled      : no
> >     periodic IRQ enabled    : no
> >     periodic IRQ frequency  : 1
> >     max user IRQ frequency  : 64
> >     24hr            : yes
> >
> > After the fix:
> >
> >     root@rzn2h-evk:~# cat /proc/driver/rtc
> >     rtc_time        : 00:00:25
> >     rtc_date        : 2000-01-01
> >     alrm_time       : 00:00:00
> >     alrm_date       : 2000-01-01
> >     alarm_IRQ       : no
> >     alrm_pending    : no
> >     update IRQ enabled      : no
> >     periodic IRQ enabled    : no
> >     periodic IRQ frequency  : 1
> >     max user IRQ frequency  : 64
> >     24hr            : yes
>
> The output of the tests could be dropped IMO, but I'll leave this for
> the RTC maintainers.
>
I'll drop it.

Cheers,
Prabhakar

> > Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Other than that:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
