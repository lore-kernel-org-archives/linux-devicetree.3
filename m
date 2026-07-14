Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6B46AED8
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035975; cv=pass; b=ojKz6Z2BSzJQXt1izYFwAw3R9A2HIJKRC17fxIqNe5AFRkxfMfD/WmBDZM1Eh3dKIVPtDtZ6H5oCRzN1diNgsQ2W5ZOy4LnCZg9padqmhsU8TPSM4+N5Wn5Ke5e78xSsfO47aQc2SW0lHK1I4qQendRbqRYtg863T+Vs4CKm9W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035975; c=relaxed/simple;
	bh=xMYgbeZWEkYZKWpJP/1b9kbmlPmh5Bba+PqXdvA1L9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sA4NFSpDQufnod8EFqeLlUk71vPatVA6u4agXlBzZHxxgmGnOkHhA5HIsKaeEEoECUHBFjtvnaFvhEMGsFYp9ya2EFpwrCXvoKjVGakqQH1bqATYZmxbjKoUOSo16Vg1E8mWEi6brIkIc6tr1i9OJsrTgXIslLd2+vkNfrOe4A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1KybUSF; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1KybUSF"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso761389b3a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035972; cv=none;
        d=google.com; s=arc-20260327;
        b=j8JJR34joPIRXx4jx5xcEFBPF0EhOyqZLrgib1rVl4HJK4oWl1SY0x/MOmN6OYl8ob
         f1tY6XNbt4j1/CT2A/Cmbx6K89Hf3IkPe4KhQNixyTdSrfPQGSm6uw6ml5ZzFD21Vbe2
         Nwg100rWKKx+CgaiwSC4oQVB4beHxLp7KV6wPZpcZBcFUR4MpBH+JvC024slMB+KKDCY
         dmq8cGIGL2bkAWB9Cfuo/s6ouoHFfElJImOrshsfko00DcVTbJkjC9N+z3wLxU5i68L6
         su07SvvigSEEYf54n3oJBmZ2IiTxPiPKZCjqFrBKWBoOURe0J9tRxijM1XINLKJ5A+Dg
         CXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xMYgbeZWEkYZKWpJP/1b9kbmlPmh5Bba+PqXdvA1L9g=;
        fh=zDqRBiBljKnfWh+SJYkSTLdruyEje36UJSHLKs7yB08=;
        b=ZXInOlGtjnWfMI/b/w76Jz8F/F6lI2Yji9CcJs1qLdTIux9isexnC/yLbNDCe+evJZ
         fTTqXS1TIWZijSwm2a+E9xLKHHuJHMHwwcSXaFtFOGEfbMizlcSTcsOSdbP28yTUkuKd
         URjHkuXnK127IfmTIt3Zu75tfUSSZMwJhva3xv++EOLtua1q8vV1E24MrpGgYlrl93hf
         sAHpRu0WBzV8Lhh6ZnCqPD+OQNpZPVEQlZVP7N2hKfAoHmFuOPUajJ5Nom5pvC8IfZLn
         xKwZeCfDVEbKNW9RVzXWjEuDKJQiYDm021c01jSMWwAP9bVY8ShU4dE7Oysz1mL4wB6Q
         s3BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035972; x=1784640772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xMYgbeZWEkYZKWpJP/1b9kbmlPmh5Bba+PqXdvA1L9g=;
        b=O1KybUSFHz0QdVul2k4o9VEGyKBL6uHP//tdT0Mdcmjy4tIEXxbFxE7c2P00asfBky
         TsnK2HZDQKGxxWs5geoIR9LboD6ul49LJsuU/H9Nf6Y2gVnXejBUBylq14ZHO3g1LNM+
         qCPApxKO1IGmye51vZWYLuoY4PLjFvA/xxcf0N36UoWRCmo/Tk2UwHa8EOcIXENrY132
         Ko1C1T11oYkzeIOg2//cJYwGAA0agX6SGKP9l44NvPtFCO37sS38zYusILJd2w+Aa1aw
         bt8Fs8AZ1FceZqcRsxIrLbmSJEFY4jxT+KU49vyaO9p1MxuEQyJUf4Lioew2GIMLcuef
         s8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035972; x=1784640772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMYgbeZWEkYZKWpJP/1b9kbmlPmh5Bba+PqXdvA1L9g=;
        b=CxJe75tEWaWS6TDAnQo/wyyHBR7r6iBByn459mhyD7e4yw8YWQ9IHUzxTT0WeVNa6c
         xTqC+R9p+iY3lxqh6s7Yezb7fsx9hN9DAizeC8Dn1oJK3vQiaho+OL51ajlurV2PKiUY
         HbkFFvOJYtOo/g12ECdXmnF8ZeR0RXAu7cXFf8TK20oXP5wGvCVGTaAGx8PZCDRVIQG8
         wdwna9vzUFXLNgQduSIvvUJhqIbHBNH4+xCdPYgZPlNfx1w2WwZxhTYtsbAxGv1oW/a2
         IfvFqbt48hllmNXYnjuI5NeQ6Vqx8sTswJWXyEmBN4iw2KupwH/h0mDqxLCMz6sdKw3R
         sT9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoHmShoJtWoqeF7fVDYgWg8tWQN39vhZiPAOtDjVRuwTDgi9wD98eeoCb/QbBMh3Cvw9AzhcQW3ZRam@vger.kernel.org
X-Gm-Message-State: AOJu0YyX75Gz8BSVa3RFBB3u5v7+Fy364Kekp91+q4PIuRSmSAM9zJgq
	gaJ7cPL9xfWGzCTJ3VZLkG8Yb0srj2NWDYHPwWoNuFY1l0dWuYoGyL+s5Lh5zRynxTwCUmsYVUh
	sTSR/BiEZ6CAtRgyGt+sN6u1vy3ZyGr0=
X-Gm-Gg: AfdE7cng6R9q/wbwSKjkflFkSy2IMWhanLCIW0139fsojSWFLmTUjiP8EPdnk1FbJ0P
	M1UX88Kk4wz+oZZIdSJuhMitS1gUeRRw4w60hnXIM3e3gx+vrja2K3FyaCnpgAOJm6Sa23ct/mf
	Kp1KJ3bCsWBqWx0dHnf2cEsnDPkj3gejoxvkXSs1ucZOwlMqX+ExIelj7sxB637e4yRyC7kHbzu
	xoDVeEUbB2Db4udJhTj+eEgyabqQE5EMYOAi0D5QU9YaKywTwm/laPwGUMmCDek5KFUyw3qkNxU
	rm+Dv/X/oIPyUzI0DQWT9GJP99J6mA==
X-Received: by 2002:a05:6a21:398d:b0:3c0:9c19:65c2 with SMTP id
 adf61e73a8af0-3c110a7780amr14294440637.74.1784035971780; Tue, 14 Jul 2026
 06:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-7-clamor95@gmail.com>
 <akeHfV45fs_wabFl@hovoldconsulting.com>
In-Reply-To: <akeHfV45fs_wabFl@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:32:40 +0300
X-Gm-Features: AUfX_mybrBIYYttKuc4kdlGjodzpsKD3b6Tkn0zZS6Q6ac4kDrP0-C3ai8FD94Q
Message-ID: <CAPVz0n1groC-4MxU-sjyPEDHYWqAweyBmVNC+iX4mVa_D3SnDA@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] mfd: lm3533-core: Remove redundant pdata helpers
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:57 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:23AM +0300, Svyatoslav Ryhel wrote:
> > The lm3533_set_boost_freq() and lm3533_set_boost_ovp() functions are us=
ed
> > only in lm3533_device_setup(), which in turn is only called by
> > lm3533_device_init(). Incorporate their code directly into
> > lm3533_device_init() to simplify driver readability.
>
> Again, this isn't needed. Why are you removing abstraction that improve
> readability?
>

Adding helpers to wrap custom regmap wrappers seems redundant. Regmap
operations are pretty self explanatory without need in one-time-use
helpers.

> Johan
