Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53E3CDBBF
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795896; cv=pass; b=uTsrkGGCzo1UwRyitAzZAhWzjd0bVkRo+zx0KP5a3CeOR/EunQEQq/VzJUNqn7j/x+EaKBlW8Bi6L7IYQS3KLQzJ6nQ7uvZ1zrA6mlyeICwi8udOllwL72SX2q9o5+ckR02sakm0hTZzRmzkj+YPONO/sM22QdTIZtJsVrhBSuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795896; c=relaxed/simple;
	bh=JSmL/2riPz7JdDua22+DrV1rd4FHdRa+ItDrM60NlcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/dd0Us+N5NBduN0ewCad8K0OgVEvFr0L4aS77C4iPQkRE6W5Nw4Iz37aCY0UNlts9eHvNca2BxJhfrXxUBpxkPVSOeOckH4eXQjNsQli2WiHbwsMOoVrOJVAiWtmzjVAq/ETJqJvRN2qR2R14AxHSdIl5QZtcdx1+4VEDeS84k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7s3oo86; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7s3oo86"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-139f71a5201so259666c88.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782795895; cv=none;
        d=google.com; s=arc-20260327;
        b=VKfLDnuYjwXxKdOFl6sBUVcqXDBALjMkqRfWKKnZxlW3InJRltQ5KuSc9rd9JZRdpr
         dhtIJYSlKjhXHIiPQdY9HBLoYiV++kXyYjWa4D429n45HcHfsMrSmlxuOWo2uOuNuQ1l
         8IVfc+CRbMTavjrcm7fq5uYvaYX01fNk+Z/Ar+8GwfoUmVfvFy4dxV0H4IDTZGVdWWBP
         k88jzRoo0VLCBTv+U981+io2juTmjyAXuNvLi7Mmqf2X56SQVwl6Wt7sp4E2yPer9ll1
         mHN4HEkIfQrbiaKhE4uvSZdeWgCnDxrt2/GWy+zzGpT0dIq6uHiiPV1pNDPnRxqrEFtI
         S7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+C6hj2XUPcZex4S9rTTRGwiYoI9zoWRu+B/pN0fu6nI=;
        fh=L15OiUSQEHPY2M4GxP0+V2Ka6MsprkZeKEd+nyUF2cc=;
        b=WWamdPUYpuJdJhN1zkKqdxRfmAQxb94EoNq3DPU5wvj1zvcteJsI41Q61wNb/fvnCO
         y37mmdoNH/gbnSx4aD7pYNqdy+ynZXH93OHM3SYN3qbJ+oFIW/moWGT/YUEGkODjLMHm
         Q4Xq81ZEqWxnhUUYrBVxTRbEv9exCiqnhlaADTTJaoKB15x0iRMPNlCAmvJ6fwOdMWKU
         OELFZR8Hk6ZGGhh17rlrdjj6Y/EjwKSao9Shiuj8BY07y6juHx7ABL3xGq25ehAyYAL/
         gVHcEIR90/LuZceBst7iHSHZbqhZyeM9J4OB9wf16LXsLfiRGipCaCulZLiH70iVGgvr
         9+3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782795895; x=1783400695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+C6hj2XUPcZex4S9rTTRGwiYoI9zoWRu+B/pN0fu6nI=;
        b=Y7s3oo86WY2u1SY/lSGxsVtfwox4MP/6Y7P25p+l6waC6Q0lX7o9PciRgFhJ0XjYCB
         2nTP+DED86f2daE0LKwQt//ZS9MdvDQpMuUDZZvjSXk1o4zoW+YOzXlWV59Q7Cm9ZNY6
         Fgw57QW7pOSb4EfxZlXOfKU03szIOsLREhEy4S495VIcjDwxAqNGMoEqAyS6SrlDrKgm
         GG6GUWcH2rmujjBkOjlL2XgHubMqBRYBh54hv/cHeiUhMG/876QCAbgAGBUggWaFiqRo
         d/2NYelJwXwFKiR2iJ28z/FK7ZcSDS8NWFnBmZNzLkYjIegwL+wQ8UZC6usNcgWPgOTM
         xgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795895; x=1783400695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+C6hj2XUPcZex4S9rTTRGwiYoI9zoWRu+B/pN0fu6nI=;
        b=Fkfp0mZbdAL6pHiY8jZakD1YZ/vrZ6XdN1wlmiMMKcm6cTQUIEr5e3+NthNrCdgDIo
         Dtdp1cMy8WgCD/+2DIeTqcx0r7njg+6XBAStI10+kTNNzDORVp6gsGvLw4t+EeKpUSHp
         vxYsEvHqu2Js9GBWRgmRKUgYfeCOxgYRq4CTTB36cNIKFO9XXJXJzbrreqJAEGOO3bmI
         TK0svCvkmPrDFnHxBdrin7EAkgcXFLx8mL6YfviCGkuvNbf5ksSojQcsuVuNcfbKoT9U
         ceUEtL1V4/t+ukR2CYhWFOfdY3LRhKv7q98yHLLMQkt5cljBneaPCqXDwlErxSxuvnQd
         GrJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rokec8qAlx2hHnQ1mg4lFso3fiMwuel7smqGFYqThfNKx31BWguyQ/YqXlIwD0jYp1dI5ZZITFgcPW0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp3/8YJ02Z2uZCuQuq06wRQqj1oe3zUNNro8q5rsfJr2IIHO75
	XHzRXwauiShAhMN2vZokx7A8WYZW2wikYbpUv+JMoSmtCRcT09EElLrTxIO8iBTbxUC6Fp0/j2B
	c4bMr9h1cshXzVQ01V33ikqdvPWqSCNjeLEbGx+RaKg==
X-Gm-Gg: AfdE7ck4npU73QsYBPYZQex0rHshF0JMQph+Dw0WDiKvFIZuhLIF6CzJU0Eg+Zgkn8c
	Ul9/TnwtMXFsu5oUWZ+dp4rFmsb/UOC2qis+39BoWmVugav2VvGQKoh9GjIMAWggKhacHo24jIq
	xh384pc4KYFfUt1wGyt5KCSirGCuE3O4zGqFCt1NvZbmHVGoBZc+B8FzwWAVu6VDIur65so4O+0
	KcKcucmV4p4xh/pHe03yDj0LpvWF06sGqfMXqx69c2RxTfxy986F2BbpkM0CD5Sjs0ednnYK+ko
	LmajR+d//LKCiQGnYR0T/lvMZgXw3H2cLdd7+/XAc36rE+vh03LhHmcDRpRd
X-Received: by 2002:a05:693c:3b04:b0:30e:d66a:3faa with SMTP id
 5a478bee46e88-30eea052cdfmr313611eec.15.1782795894553; Mon, 29 Jun 2026
 22:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628191337.937-1-kimjinseob88@gmail.com> <20260628191337.937-3-kimjinseob88@gmail.com>
 <20260630000254.1d1cf422@jic23-huawei>
In-Reply-To: <20260630000254.1d1cf422@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Tue, 30 Jun 2026 14:04:43 +0900
X-Gm-Features: AVVi8CdiEieYKWqJIPC16G_ZpvLkF5ev-gruUCYcVF1FK7T-4gCgQd__iRhQI3A
Message-ID: <CALMSew+=8P851Wdc=zDLsU5T9YC_ZeTHRotCzYiFP=LNznZhDQ@mail.gmail.com>
Subject: Re: [PATCH RFC v6 2/5] Documentation: iio: add Open Sensor Fusion
 driver overview
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will remove "initial" there in the next revision.

Thanks

Jinseob

2026=EB=85=84 6=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 8:03, J=
onathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, 29 Jun 2026 04:13:34 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Document the Linux IIO mapping for Open Sensor Fusion devices.
> >
> > The overview explains that sensor channels are discovered at runtime
> > from mandatory capability reports. It also documents that OSF0 is a
> > wire-format detail and that protocol_major and protocol_minor carry
> > protocol compatibility information.
> >
> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
>
> One small thing inline.  Otherwise looks good to me!
>
> Jonathan
>
> > diff --git a/Documentation/iio/open-sensor-fusion.rst b/Documentation/i=
io/open-sensor-fusion.rst
> > new file mode 100644
> > index 000000000..832901f5e
> > --- /dev/null
> > +++ b/Documentation/iio/open-sensor-fusion.rst
>
> > +Timestamps
> > +----------
> > +
> > +OSF frames include a device-side ``timestamp_us`` field. Buffered IIO =
samples use
> > +an IIO timestamp captured on the host when samples are pushed to IIO b=
uffers.
> > +The initial driver does not correlate the device timestamp with the ho=
st IIO
> > +clock.
>
> Really small thing but I would avoid talking about 'initial' driver.
> It can cause confusion about when something is true and when it is not
> as we may have multiple non 'initial' drivers before you get to changing
> this handling. So just remove that word.
>
