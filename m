Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84D7371CE4
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777330236; cv=pass; b=CQcIuatVmjucMQtqY5OAC2RWCfLBRSqmW3PAG55cv1wcXaP6m84vnO8Jh25OXa/GijYB7nyWOCX+KlLvEwEToU4k8gbX1g26NRnyKJRgeYIUZvFv0Qaljl7Y/m/nMM8todoZHGuiZ8YKzYX8TXMK5fFEI1dq5G2RFvz7ouvvpKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777330236; c=relaxed/simple;
	bh=RXTZV68O3DRCGKhAyGkFPFkd/p8Lig2G8UNsio5gTc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tyh72RZAbmu2PdENm/OjvXUf5vi4jeR7qV0/GMh7X1bYGGtIh2UGzQEzObmQcvOmVTQqm15UrmmVBprPhBpS62r+da8GT1TSLiHpKqcsiyCVDHR8UXWPUR6XN9DLde8NSVLle39BUbh6Mim3kqaOzfkc2z7XwvZpOjsgWSK/+sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+8lxpje; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+8lxpje"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a62a049c1fso7987454e87.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777330233; cv=none;
        d=google.com; s=arc-20240605;
        b=OGZpuv8hidLC5wWZ4NMQi1F4b8xWkdGqnFTpdvdpiBjoJ5SLj3xyfJU5ORUdlX/0bH
         SZPyYRL3zDawof5JOdcZWAA0DIuSD7VZVYzfLa4BmmSYPpP5tuwr/i1dhYeLSXomGaRE
         AQnHzmH3Cov+d5PDoQw8iOf1/CS31SevyyaL4WEX/xovti78u3cNsQ98D+jV7OC1Ahp9
         01FzlLPKCSNQGNRZxZFz5tvwpS0LDdKyBA6Koz73lwdZpMKionU8+2Lah36j0029tFXR
         M3xL3XGt/wY5QKp7YrTQFU+1vP3CnGNgCDrgugTBK21Ol2thbEwSn0oDsHb8G4P3p1cD
         230Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9i7kiC0TtYAjKQnNhk3lcaZ89x21BmcthCPfYmj70U=;
        fh=79IuBxy/NxnBNJvPIE0oEyycAWLa3gGWPSaFIBJL6rs=;
        b=gbAX/NOxJzNskglF6DQnnC5W0mTSPyXEUXtnb/9aZw5u15l2cj+PqGhNuWnGOY1luH
         ggAjJDRhiaLQW58OmUfiQsF9fkJe2ZHrjpmjPX0obFQPNgIpkBcPdPoJpF9eyBeOzZ1K
         v83aHaAZ0y1mk9v1dPLh7vKd4rtxNf0X+v17y4zihXKnp55ReW4cpbFv9mIAhIw34ZK9
         LZio0XCgStytApj+JwnyBzlMf/Eyd3pgLv6FKiVHsM+KOoRd/GNAbazh/VqwgaSyJKIC
         u7C6HsBcmHrbfEJMCn8p8+sTPJyVhkj/zOH9VghlEvvK08yxralKZ8HnSDHhdZRLE4k3
         ZBJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777330233; x=1777935033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9i7kiC0TtYAjKQnNhk3lcaZ89x21BmcthCPfYmj70U=;
        b=H+8lxpjeUGy0Klt/tvVskRThpFVyQOIKpaHMEcBzC0OQVWbaMYtU0M9wMn7I5ZHhhY
         gYaNdQkkofWgm9dcJMKqRwvqGa9SiQrOmBy6JH7aAF92BOBHcplaObgdv8xb3OWPZLrl
         uwa9CxF8PSGEIip35E07tGmLf4GwFxBtGyc5x1pszSIXvKINyRU1pCe2o7uYKM5so+jd
         OJSWtbFWENph55+jzzn8dG4efEV/OUdSu0bsHd7HsY4WCFEehfC5uNLu+swbaYaqIT02
         pt/hMVcTc2kbOxMF1iaQ0hLONrFEj2u1xubIzqJVuYT+y2bhWjojHurHcWUtVsivWW22
         TQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777330233; x=1777935033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9i7kiC0TtYAjKQnNhk3lcaZ89x21BmcthCPfYmj70U=;
        b=QFiWxHgOSg2UVubovV+y6ELBy058bxyPenTShNscfEl/IifeFj7BMVtS9XqVyKDIqL
         GTAprRp0jZFDJXdyE3FXxi5AJfUMeRKO0pgMCtd12UTR3/lS2ymyvl12nRLnG+aN8DH9
         lec7JWEcNxoGw/XI/mqPS4PkLBD9btV7pauygW3crXS8DSi4lVoqh51wmUE/BSk0lYDo
         6ZIiaTqOwiyfIyuehBngKTmaPCVYcvucQ1jLlme/aBqSLOQTSWAyPiAzsx0SCx0R2sjr
         WenizMUevgFIZlI0W4+X3bQdfzFWXryfPWC1ANpSMn3neSIZ4ciG4+KKB7XfV58H+EvD
         PqvA==
X-Forwarded-Encrypted: i=1; AFNElJ+1PAipH1t8W2RspGF61dSbyyg53avK0MGsLlWC5ml3/7YVsbC87t+qeUvCyEKS2m043r7aiQQeURf7@vger.kernel.org
X-Gm-Message-State: AOJu0YyscTn/WfqdXiRjxezqvlCWngsR2rY01Sq79v28AzUKOV+lXNzl
	y/neIRrxNH0Pz1LTGzOci2/hMQx4ud8wkIu8NHhYmZqMuAfevdB81oINN6xrGh/u2lCwP0WXFdk
	rjQgm+LXYTdnT3k0yF5j9ord/n/8hIik=
X-Gm-Gg: AeBDiesm7G3ea5HJ/cvLJift+YvFQNozonz/CKUzkFZmlNXfyQTtiyOxiFYvjUBIXPC
	pJEGIGIjEh3f4WPkJvWZyCODAj9kNyUeU/d4ppREOfUrbRjT6ZhdZy99/ya+md7DMQ4V6L7GgPl
	al8Ez0gCqr+aZKibaPt4XwfZdZ2DYZQljXl2gCOlZnoVDjyVeidFq8q9EpLj0m1Fvs+ugBky1xQ
	RFeXdCQMUEBBpHiT1FYaSIwJ4R1pLkW95JKidsACBXxplRSpRREw+8eaYbU/uv6v8cYG3EGtYo1
	HtxLFFO7wDlqOaLxprPxYrzayKCyyXNp8m8P9VhlKANZxXw2/B8sxd4MmAHU+u3QkU4XIE33ZFo
	2Tvl/eqkgJif40A==
X-Received: by 2002:a05:6512:3f15:b0:5a2:afbe:4aaf with SMTP id
 2adb3069b0e04-5a746618205mr203474e87.21.1777330232575; Mon, 27 Apr 2026
 15:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
 <20260427100950.33936-6-piyushpatle228@gmail.com> <ae9usdn2rhyehzX6@ashevche-desk.local>
In-Reply-To: <ae9usdn2rhyehzX6@ashevche-desk.local>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 28 Apr 2026 04:19:55 +0530
X-Gm-Features: AVHnY4IcQUbpuyx0RBKiWGnyz-7MVXUid1BHQkGvh2X5EkzoPMZ9zsqYVT7Yamg
Message-ID: <CAMB+xkY40wKVRsDwsLD21bK-hc1YnmghBDej=twJ7t2vCeiEyg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] iio: adc: hx711: pass trailing pulse count into hx711_read()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: ak@it-klinger.de, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 7:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Apr 27, 2026 at 03:39:36PM +0530, Piyush Patle wrote:
> > Move the trailing-pulse computation out of hx711_read() and into the
> > callers. hx711_read() now takes an explicit 'trailing_pulses' parameter
> > so the HX710B support patch can pass the per-channel count stored in
> > chan->address without adding a separate code path in hx711_read().
> >
> > Use scoped loop variables (for (int i =3D ...) / for (unsigned int i =
=3D ...))
> > to tighten the scope of the loop counters.
> >
> > No functional change.
>
> ...
>
> > -static int hx711_read(struct hx711_data *hx711_data)
> > +static int hx711_read(struct hx711_data *hx711_data, unsigned int trai=
ling_pulses)
> >  {
> > -     int i, ret;
> > +     int ret;
> >       int value =3D 0;
> >       int val =3D gpiod_get_value(hx711_data->gpiod_dout);
>
> Try to follow the reversed xmas tree order.
Will reorder hx711_read() locals
>
> > -     for (i =3D 0; i < 24; i++) {
> > +     for (int i =3D 0; i < 24; i++) {
>
> Why is 'i' signed?
Will change to `unsigned int i` in the scoped-iterator patch.
>
> > -     for (i =3D 0; i < hx711_get_gain_to_pulse(hx711_data->gain_set); =
i++)
> > +     for (unsigned int i =3D 0; i < trailing_pulses; i++)
> >               hx711_cycle(hx711_data);
>
> With the above the both seems like a candidate to a separate change (afte=
r this
> trailing_pulses patch).
>
> >       return value;
>
> ...
>
> So, split this to two:
> - trailing_pulses (without touching 'i')
> - localising loop iterators
>
Will split in v5.
> --
> With Best Regards,
> Andy Shevchenko
>
>
