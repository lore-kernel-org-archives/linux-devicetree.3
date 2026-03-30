Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E343DC4D4
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891488; cv=pass; b=GXAuHktrMKXt3EYAh1IFSiAMH+qf0av1PdVIaWMij9dfEnSXgAg34ZVqCsjzu8Z6DiYw3gU445d0cliwD2wbIKNhBgvm/dC+zn+6qtCclptXNdZFZNEoZ+7X1KoHBzz93bZbALWH39igC1roy6t+kOg8/Fw3Yqk4seygw5l9FxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891488; c=relaxed/simple;
	bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1Fk5zImhvYodrxFqXMya5L2g+X7QH5xcLkFaX9s7B+i0bD7bk8E+tMPFP7goXlxANvh4jSAVBPvamS0RqlJiYaALDSCwUqQBsH2ijLEN9eVgVY48LpGs/lakTqcSb8K/S6pwnFkAdpaPVPtQXaUKawspGOA2x8M50UQPVyvvFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V76BZqIs; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V76BZqIs"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b982b0889d8so565751066b.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774891486; cv=none;
        d=google.com; s=arc-20240605;
        b=EpIcoc1kn9+jDAWkJgzcKfGJYRX2kx8A/xrUyCu48p00REUnIHc9YUmM1Ki/+ww9EY
         0UQ97NGVlKwvBE6jPzOGvvYWGCdNBkdNj10Y5paWfOEUy5HIL22u5q0VK9inLGvw5bDC
         Lcnw0XCX1xMDKy2K+umWIqO1GvmxXQmdVgvrC7zEtGqmuq9Dqoy+amK6Ubc1CZwy6a3/
         opUCuBJQsCoDmkP+N320+jBqX+i578R2jn0FSCGZuByBul5sOAnrHnYM9iso8Eq4+SAi
         e1oSTpsBCa1R7N0NKOLTEjyj+mSDUjV5mwE3B7lnA4mZvLR1tAFGUNZU02L1k8jjES92
         qFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        fh=K9tHC1Tm2lWHcALrMwruzidCBNkULie7LIGiJ9hL/+8=;
        b=KQefSOlSIKPiQDbIViYV3TGBqq2poBR6H0elRvTTyjA5W1lzw2m2EugZElA/Vo5EOH
         9Uur9edIW4Txrb4MEP3CFp+IuCYYknfx/UNztfKZi2i6XBP3Z6UMzWQT8Px8RRNN2okn
         ngDyYz3+7mb+X0Zrs2OAl5x1zH7JaQjcg+Ef0fiwyVv7/JM1TpvbC/HXJsDZ3oPruV6Y
         yB6HRcLlrWMxw/JQKKb2T8CnX/f0fMNP+8X6P8JAiAw4aq2/fg6+86mtyHR7aBuN6XnZ
         ckJkGCIRfcUQdrqQkJ71ezWYRAzvJ+5CXoc+zIUz7Vek+oQStiVizL372jvLe7QnjuV+
         UwXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774891486; x=1775496286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        b=V76BZqIsg6SY28n+CDDu+IH++PLSb8MJSlRIvY02cnLUWXpaxB91LN/qlH3xzlIxCx
         OJpm0KiBuf6pIWl4hS1tBcqhmkha9q0QN7jpVlN/RWZSajGpxmqtZstQppDr8zTLHfCl
         7/3yLIORDyGDv/FwB7cjm/RynB6KgTd3CbCbcKooE15JDQcnwXYC3TG/cD+TSmFNry9y
         qase5dwhuuHQDJ75vNqql1kmgBxzGIcszCChHk74hP53Qdi5sFznMywjfIRhJmz89xoa
         FPIC0Py+qZ9XjashK4KXSbxEdCIEca9UEaypsvN6Gb+8PtPdnCYX4WzuDT0B1re+KOEK
         PpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891486; x=1775496286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        b=bZSHM874FiVkAQJliYMfjp2Fqo+SbNyjl5nyULGJgPVvh50tf72D0+Ix97YWIuF4wN
         xiEPB8Jv3dO5r6WYXLPyPf6uNiHu1RSGtFDw7zJAbpAvSLlwPdmJs9y/HDLSYSzCvgrc
         zv6Rv6ojwSek4nObhzcYWraSxMuJ07W1Js6HwTNi1oap+bbe3ANzqktJV/bierZDk39+
         z4Lzr40k4DTN/UcGHYwAIwvQkfzCqbqM7ImJmrQSDmGo6X5xwz6b2Yq8257vUBpV8BLg
         6ET9efBff9CvaS8XXad5RtsK6lr4BHcBsTE60QTcFaaQ1pgYjm/jQAuiNJhQJWM1eGu1
         O9fA==
X-Forwarded-Encrypted: i=1; AJvYcCV6P61V6CowaY2HajnI6VxMQNuZjSMWGCRg+2au+T7IGgQAuzd6CS+q+Q/f+nsuTPxjWGd/xni1wdIx@vger.kernel.org
X-Gm-Message-State: AOJu0YycaCLt8PKckFokEZ16iTb/JKLdtgb5w2GpYWv13H2+liGQ+vjG
	2Qx/oZvVsHS1fXTtQxMssJWZ738B1IMHSbtyxrnhT7phOfxkz4lyJaR9sLzojZEDiF3/3MLFQXb
	nFUlzad08UYeiZMdXVxHPLXGaHXxGrLw=
X-Gm-Gg: ATEYQzzmR+jKfG2UEWl9lAiiuQjV11HuFT3xk5YQ09dMthmBWzuJNBALSuqZQn09V2i
	Oni/0IhgGw96O4vwrWdrS4YApBTBLbOexrNWma/m2YLuXvXPYJAV6haen+lcynocMTxlTfmYr7D
	voL3VFGhjyzQWaUI0DdVsb8/1CcnwqOjpy5MOvUSYqMwMexB5YNCFpJzzvFGy1Z/isNFxWEDIrY
	ASd7oxNGuot+4Dfq93Gls9QxERCgtKZabc0dDpOUKpFBtcYec1xkllKXv083NAIa3Zoxw9UMQxc
	S0pKZU1wvf/N4P3dh6zCqpqG5rjOP9RZohvjqqs2LedqViQLQccbNJxR9m6k/dn6g8H8YCiPweK
	9/QFefMo=
X-Received: by 2002:a17:907:9626:b0:b97:554:f12e with SMTP id
 a640c23a62f3a-b9b50350860mr690721166b.14.1774891485468; Mon, 30 Mar 2026
 10:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-ad4692-multichannel-sar-adc-driver-v5-0-11f789de47b8@analog.com>
 <20260327-ad4692-multichannel-sar-adc-driver-v5-2-11f789de47b8@analog.com>
 <acZrthJYQX-h_9p5@ashevche-desk.local> <LV9PR03MB84143540CE505514E1CD84B4F752A@LV9PR03MB8414.namprd03.prod.outlook.com>
In-Reply-To: <LV9PR03MB84143540CE505514E1CD84B4F752A@LV9PR03MB8414.namprd03.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 20:24:09 +0300
X-Gm-Features: AQROBzDi52qTqIm1Vf3lVJqwmlc9iA41VGN7nD3k385cLEOQCXsLlg-VEZ4M7zs
Message-ID: <CAHp75VcUCM8aeUpNaFEXnS+Cm08Mq5j+Qp2gYqWP9vCO+9CtQA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] iio: adc: ad4691: add initial driver for AD4691 family
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	"Hennerich, Michael" <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, "Sa, Nuno" <Nuno.Sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 5:20=E2=80=AFPM Sabau, Radu bogdan
<Radu.Sabau@analog.com> wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Sent: Friday, March 27, 2026 1:36 PM
> > To: Sabau, Radu bogdan <Radu.Sabau@analog.com>

...

> > > +#include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> >
> > Hmm... Is it used? Or perhaps you need only
> > dev_printk.h
> > device/devres.h
> > ?

> I have checked this out and it seems device.h doesn't actually need
> to be included anyway since spi.h directly includes device.h, and since
> this is a SPI driver that's never going away, it's covered. Will drop it!

No, this is the wrong justification. IWYU principle is about exact
match between what is used and included in a file (module). spi.h is
not dev_*() provider and may not be considered for that.

--=20
With Best Regards,
Andy Shevchenko
