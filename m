Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37150385509
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711179; cv=pass; b=O6c8d8C28zJbPwYDbpbYW7SRl7kBG9KLFyBEJFyiTgw8EgeDmCLl64QmpXvvM+D/NO9odujM6UsUDul3OW2in6kd2a5Ptre9sLKmXLrcVntP/IL1xEF37wUcoaPpwLIMiLR2uWL1KP5hSSQxa+bX33848sjHwahUOjW+MFHpntA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711179; c=relaxed/simple;
	bh=BLf9RFIv5pi/wJMaN0h+Ctg6fapOu6Q9G57hFPSuT04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nm83Yth++Qr4MZA8zK8GBGrFr8DOrVqvP8byHikJ2bVeLDPeTeWQf8yGNt3TkF5DaVajhEZYLZouppE/d1Q9h4A2qZDtpgcQRbkmS8TzU/ciP4e/GKdYrty7fG8hP+qNHhDGWoG55G7xrtRhQV553jWXBr3slb2f3NylsWoTzm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kPihRLOv; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kPihRLOv"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664db84f074so15448699d50.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784711177; cv=none;
        d=google.com; s=arc-20260327;
        b=kzLZyqutoK+LDn8qYBjr1UlyKRGGz2pMllp9A/6FcXZnvoLupYJii979wvfJ+7W6Ye
         OGJHgOb7f2GOktLvcdZ71GddhUh+9T6n8qYXMbbca5t538KiXXMBa7tKIszWT+YMpjbm
         RC86Xa3xniizkyqO4/8ansA36b1DXdCbSv+VZ+aV2DuaATtWQGa/0+wYJlrHq+/UWCxg
         Roa+5eqHSvGiQfDOZJ38qQjKaVosB3vD/G5xEtpF1/Gt0hl1EQk10jXrByjwG96a6jI8
         9xMOw8QatYYK3hFkXXE+aQOJdFVcynzuOsGbtTodlPak6gAL0SLUFcXZ0mAo/+zbIzSO
         DoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        fh=XNg7ep+yl96uWLMwn8DMoecyWmhrvGYaYau50c6fI7I=;
        b=q8oXREPWlSeDHSllS5youErwZIdYa9YeyLOSX5hgt78fbdVuUF/3+6K043ktO4SMUL
         91Vkmp875xJhiLEoVgAcjXfrPwj7SnNaT1dexodE+naVuHv5aKiGbpAom1IXBvm2BLhU
         KSLASHZsiKFxOmuQqVoAM713WV6nGHePi1SMxhgwIzIxhPcWIcNDNVYH57hJrqRBwlas
         p5JKBPwhB7PCaPHc2eepDfbCSqJXoDIRwKIZcRrmCv3cqbeBHCjpHe2+nnzTccXN81e7
         ZW0iC0oDSiOCW6qBC+WL9TGlv01HY6NEvCSxizZzgLFMMlFFrTfoQPsAV1GcFEam2BtX
         B7Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784711177; x=1785315977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        b=kPihRLOvc9nNrQgH4XazHoHuE2iqpX+vJGu6Pr49lRHuhJTmoKBaQNvid7LlV31955
         7E2pZRieWFEzZJnqzodaIWODl52P0OlTgYewDVWUwy6XQMRUgLkMOjnp4+BbI7qpOReh
         /xtwXA94fcpHMRRkyOvCJTOWRaayyhcLhclSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711177; x=1785315977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        b=BgAwRp0ROLXp6NH5xohR7Sw2bHZCxl87FLkEgbD7kSlZvcxigQQgPzYwJRdibI3CBF
         2sQQQiL0t0LiIS/kzphih2vp6L/Tp0vOGZN7Dm2AN/1CnVzja6fms3ELZhmbyphIwsBr
         VYPndim1T5KIiXHY6751NLbNaDKzvXl59SpSCmQh1CURqZ5FPm/cuv/OSKnZpDoDaI10
         eEQIoZaTy6bwxxhnOHuJaDU92nBnkJc39DuwKoJ9SIxB+TbPvJLnBTtR9zNqhak2JdTe
         P/1E8nXCQbKCfL0SWVUH70ETYcV2ZOveSkiwYfuOWPZJq4LYn2b9W3v72LQNYSLTiigW
         cYxg==
X-Forwarded-Encrypted: i=1; AHgh+RqVK3dr+oT3iz6/vgFmpcSG8gBT6y+yDJRfwoRQO0MTIOPizXNRowPrv+ejzzlWNOarzGEC2tiIBGpr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6rBKNMYv0tU/rA//gpf9rZ39ozXgWDYqN/BhpYrB+moPcCUnv
	GCb18E5nNAOF0/9+7n25uENuSdKtYTtS6HWxIIDQN2UO5t8XXJlUx5aUveoQvHZh7can6YYF4yg
	Q6gWndqQfvZy10/g7TtJFqpJkp1UWzQr/UhrZk8ho
X-Gm-Gg: AR+sD11DT6uZRIaW92WuGm7+wj5qmCQAUSrT6efq2bJx9ZXbbxhcAMwY3ng6n5H4goD
	kLLCqgsST9u6jKN0teEO4knMpz7YFYTpajhi8FR87jw/XpY0jzKoP+pW7sPjtMnzzo2FHqhsEFY
	K/XZBVIf1mHMG40GYtOZeEAXB2Xku6I4SgVjK/DjRBQ1CiC46ZJ5LrfuMLWrUlg/i9pKM73snul
	jUGeZq7j8cYB6Y/nmC362E0a9zlyt9Rgdvrd37zJ0hJYUuIw3ERo+WKmc9u1lqOVjlpRD+SzTpD
	hbWzUx3ma9OCli3Z
X-Received: by 2002:a05:690c:6c8d:b0:81e:6d03:40cf with SMTP id
 00721157ae682-81ef26ae40bmr73897997b3.54.1784711177267; Wed, 22 Jul 2026
 02:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-2-wenst@chromium.org>
 <al9BwHbG5IX0mIem@ashevche-desk.local>
In-Reply-To: <al9BwHbG5IX0mIem@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:06:06 +0800
X-Gm-Features: AUfX_mw54F9BihKerjVbrM-HX0v6EAfSTuk3G7vvEfoFi_SJki_3pQoN0j1OPTM
Message-ID: <CAGXv+5HXtSovddkws58oUfUcucC3GKqTt-GgvXs27ALFjyFRrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 5:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:15PM +0800, Chen-Yu Tsai wrote:
> > In device power sequencing and initialization use cases, it is common
> > for the driver to enable the regulator and then wait for a certain
> > period of time to pass before continuing.
> >
> > In cases where the regulator supply is always on, or has been turned on
> > or left on by another consumer, the driver could shorten the delay or
> > skip it altogether, provided that enough time has already passed since
> > the regulator was _actually_ turned on.
> >
> > Tracking this requires support from the regulator core. Introduce a
> > "last turned on" timestamp field to the regulator device, and "enable
> > and wait" functions to the single and bulk regulator consumer APIs.
> > The existing "enable without wait" functions are then converted to
> > macros that expand to the new functions.
> >
> > One case in particular is not optimized yet: a regulator left on either
> > by hardware reset default or by the bootloader, but does not have the
> > "regulator-boot-on" property set. As the enable timestamp only gets
> > updated when enabled by a consumer or by the core, the first enablement
> > always needs to wait.
>
> ...
>
> > -/* locks held by regulator_enable() */
> > -static int _regulator_enable(struct regulator *regulator)
> > +/* locks held by regulator_enable_and_wait() */
> > +static int _regulator_enable_and_wait(struct regulator *regulator, uns=
igned int wait_us)
>
> Hmm...
> This comment a bit confusing, perhaps adding some lockdep annotations hel=
p?
>
> ...

It's already there, just outside the diff context, the first line after
the variable declarations:

        lockdep_assert_held_once(&rdev->mutex.base);

> > +     if (wait_us) {
> > +             ktime_t end =3D ktime_add_us(rdev->last_on, wait_us);
> > +             s64 remaining =3D ktime_us_delta(end, ktime_get_boottime(=
));
> > +
> > +             if (remaining > 0)
> > +                     fsleep(remaining);
>
> This style is discouraged as it makes maintenance harder. Better
>
>                 s64 remaining;
>
>                 remaining =3D ktime_us_delta(end, ktime_get_boottime());
>                 if (remaining > 0)
>                         fsleep(remaining);

Ack. FYI this will be rewritten based on concerns from Sashiko. The
wait will be pushed over to regulator_enable(), i.e. outside the scope
of the lock.

> > +     }
>
> ...
>
> >       /* private: Internal use */
> >       int ret;
> > +     unsigned int wait_us;
>
> If you want to make it more private (the above is only for kernel-doc) ad=
d
> __private annotation that will affect how sparse will check this.

Nice. Will add that.

> ...
>
> > -int __must_check regulator_enable(struct regulator *regulator);
> > +int __must_check regulator_enable_and_wait(struct regulator *regulator=
, unsigned int ms);
>
> ms or us? Please, double check all units.

Yeah this should be us.


Thanks
ChenYu
