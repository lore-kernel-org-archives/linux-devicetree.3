Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774052;
	b=mcd+jWuTF0GnswIrm8hRtjrmh/UvKcKDtk0Etax0wJ6wl4BTvgasJ7DANijUiIQGZcud
	 a6eocLOHjyR4k+7kw5OH/vldR3gVlxAwuiFoSIuuK3yPEpflSHLJ5c3pa2ov5bftc9Vwp
	 fvdaCjIcn+9zagF886UvB6fa1lbras806+23q7DXS161WRuUPQelss40pHWzk/Dklek5L
	 NaGHbnIjad413dkLtFR78XVDs9tlj06ptvoNWe8PBg6uawztOlm8RJAMR+lcU5O/fZ+4P
	 SJ3UFyOkE+a/krhQYFteGSGUkXWq2Tom2WKQfSQHLWtx02XBXd78dbh+/5rcJ8YEhfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
	b=F0dwErmPnvBrlAHDCVt/C/x0olsuM1FrcKgP1gRZYaQXpIcBBEGj7s1Tu1/jhAeKfqma
	 kJDHaDi17CklggThpa45684C839tzDS+7MiDThwCQ5/IKLTc0kwQdcPv8NcDP0m0xEDHn
	 VcdWaz4cOn5sfa9bqCnRAmA8BJcUX+lRGYYSoXKITKYeqFwgPSwf9DNKnxQA7qysxd2ZQ
	 2y7WscMUZXCzmrqRsRB5gVH9MLOCpe581Jok0kuBrJFD/KaJIzh5yNplAtfH72W+j1/vr
	 WP3TF6tCjE9Jt+QKa2g35rD6N10NJjD2DoRTuMKk/Ns+NqSBMxfSUIay7Ca58RtBCrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8ZERY7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64445606A335
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64445606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8ZERY7z
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c08539c827so6168440e87.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774050; cv=none;
        d=google.com; s=arc-20260327;
        b=NFd/BvbuqZtISAV3WAblZgDkZQwAIoj16kv8sZbfVjbzFw2zqnujPkYsWCwLRCXOrG
         lS2XqnTwA/mzge0oV+32caG+tu5EBxCC2qN86+AJxPdIbC1SUMJQjNeutT9b9+BvI39Z
         ZVd46Ej1OwGdJL/C+qU2srCP3rm4INsSL8MHJ3XkPTbBV35rFl1h+z9XLU5nHOfRb6mS
         mpeEbH1c3sdk0l7FqkBh/WibD/vcyJQ/lJRn5wtA85VPt8wjZplbEO6Cr56t6Hg0QzMK
         kVGngZK2kKzq9lPKnZhDeHyWcDc8YSqvn6hqb39uVEjA2fDLeyHKpOWNcRW4yoShQ65S
         SlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        fh=xB4ddDsoYFjQ9LExdVE4oXn5+p7Gdh/ZalqUJ24gIp0=;
        b=JHntIhzS2fvmbZgMr7W3yH+tAmrYfB4H7yRPdJjxLbNLMzxcIO24vPKGzAKoRjensp
         5lLsvfZ0bIu/tlh1+ircFrLZ2yOfWR3yY0K88vRiVaGeCa7r9bJCZz+ApZAOyd0VfF/z
         +b4UMoOHVxK4rY1/gAtHJ1e04UidI+XD+V4MItTKLTGP6TDks8PqE6UiiqDBpFn8WOeK
         j5/e3LTnEjkR6iHPtnZ+P3r7jWHqr9ezP49V2EKiPZGGeK7PmoO+jyncgxg2PiIAnr1/
         Sh6ODdoHG/783ZW8aLogIX6GrRXwJ7JS5hjlxvTA9wFmAkfoXYMSgluVWTQdYDPqCdgQ
         5dIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774050; x=1796378850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=T8ZERY7zD/vy0H1Rb2du90/b67CWcF96NyZsqFxOi/RYxzLhB+qwyRH8qcWPBraa8v
         mW2zbzSP49Foraqc+NQDAmXZ1wubTXXFWND6ZtkJhZsKeALOmqaWo2ukNLoEvE2+62ZK
         6cLWHCumugFsUXIOtnP1I6tOsdCFTb7E+KqpznZQ9CJe95VPa1CX5Q3G6qZlNTsxFj7I
         +oKRx6WVXOXR0C9HVFtpTdRHu+eXoKolZFYEVFXpOd1/gQmHnPvjxoxPAEZfwuB0CqQj
         ZwCKClrm4FF4FjWeUhiqnMc9RPcBVLJs6R10KN7KtdHAmOMrEx1LzrMDpPSd3zjZIM7o
         EtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774050; x=1796378850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=X6Cabyx7lMloGC4adUCxwh8728fWJAhQN737XyX8fag1mvyn0WHd0C/dZHbHvPwKay
         xx5xoR7jQ6scErXcD2/oaLhO6bJVboFE9TM65GNUlNqDmLqcT/k2tK7EySqhstpdAwYA
         YFh1+G2PS0c561uUEf2tHt/JSbPwdMPEd4TB9Efs08rUG7cs0+KaSzJ8TTrqZr2R+Qf1
         IKBkI9UCAJuCllDrTUqyGpaw6/3J95yU4Ba0v4fEkg4G93zLi1Eg2Dn0Ym0fpK+fhlFl
         IJfq/oHXLAcdE9TehXpW9Z/4g47+9AKUqnb/fH2p0HDq9J99iQiHyq97P20xi29vDQJp
         nSIA==
X-Forwarded-Encrypted: i=1; AL+hErE2wAb1hXQnAv6hTwNmRIOgt0r9aHMKY1D2BbrPwzgIBJYob8qExn11THo0FxL7VEE6GjgLJUa7IE/3@vger.kernel.org
X-Gm-Message-State: APuU4Z+jAWJhMp98hriEQmvgTNF+3tvaxEqAG8oX4M7o0NwUy3zPpfcz
	V+q4KPfJRoMNDKpHDsZ6nJylaZYzqkDa+TjhdurjG2AGcjz1VXVlXtjz3Dsw6MC3CpRiP2nqymG
	pXHi4YoHEnNUzgm1erGrdkEtAeOw7/f4=
X-Gm-Gg: AZFdTZeAiQfiJ9EHgVEYxbmrTjFbjRuoQhMVBKsYp5Rg79eWO1kZDQg+l4VpNG965ke
	4+tfNuiHPhMSq3FsewYyIG6+dEtQ3jbgs6QhGF3eeYIVP/8oTTKaWjSUH9IyAfi2fpNrckBQlxZ
	dHNfVXu49DmHgB77IpmVXVUp9m6cR1kJWnC0vXssQ3fyPbVu7dAN2c45XqgWLpl3rRNpZnZg81y
	Uhd0TahFCIBUgTKpLN4cBIrgT+5tNc8uE3HeCEXKof4JjK1esw+dh74E5SuwEEzdbmKR3L1KY/0
	mz4aueeKt5gPIJWN34AFtuMjbolsNdmO8I8FoAi/Aoke0bUROthQNWE64sG5cq34QCYhQmwOMUq
	gq8Xcbw0Afaa3RVyXphF4eadMScJ4hvpugNk2duXn9bTwYEzipwH6cbo5Z/ImLUKgbzWppvQKlL
	qVd+xIYkbnsXAa+rfqigmdiC6O1mLGsYE=
X-Received: by 2002:a05:6512:10cd:b0:5bf:f8fc:7b5e with SMTP id
 2adb3069b0e04-5c1bc89c61fmr6700305e87.55.1795774050347; Fri, 27 Nov 2026
 02:07:30 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com> <awQEP9bHA0RPfRUA@monoceros>
In-Reply-To: <awQEP9bHA0RPfRUA@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:18 +0900
X-Gm-Features: Aa3M54o3XA2vGbw-lT3h-QsKcDE27T0mWx-80FMotXTw-keuMBkBtHCZ9WsWU5c
Message-ID: <CAJGK9zaVJ-42c-AnZuXBW1uskvmRQv1ePHQsx=BMz55RfznomA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:16:56AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touch=
screen/at550-ts.c
> > new file mode 100644
> > index 000000000..89c2d2701
> > --- /dev/null
> > +++ b/drivers/input/touchscreen/at550-ts.c
> > @@ -0,0 +1,124 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 =
draft. */
> > +#include <linux/bits.h>
> > +#include <linux/input.h>
> > +#include <linux/input/touchscreen.h>
> > +#include <linux/io.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks for pointing this out. I verified both built-in and modular
builds without <linux/mod_devicetable.h>, and I'll drop it in v3.

Best regards,
Yuugo
