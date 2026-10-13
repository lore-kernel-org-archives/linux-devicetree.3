Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B08155C30C
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930376; cv=pass; b=XV1PwDEvVbX92b9WgPA9XkYlJXcOj+r1p8nA9IfDUrWUFu7rGdvpyOat1Sza4WA/wvZcbQWv4VzUAq5V6hKv+sJ+3acxCfVt1zWMKqas+TwD8NT6SqzmjDhlCoTlS2bFtfzUqLqWxGky8kTu/l7j9cPorRP3An/fDmmat/CtonQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930376; c=relaxed/simple;
	bh=LHKyaN6WUugoUSp5MeLqyUxtlolwPgBXkaD5KlRFm9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdgkR8hcgN5lKFbnsRH/cQ9Hmph2NkeZcFhthQypfyqm1OOLmwT4B0PVimuf2pRKGOAlsL6ILOUbWuqutewW6H+qYNWWYy9cQ1q3hsGwToTy1A+4cHI29LZyFmI2tBIJy4HAh4nlcioNzK4Sc3gP/3BSDVxYc8ORL7x+ricnouo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C4/6EXUW; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C4/6EXUW"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8aca68653e3so1764307b3.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791930374; cv=none;
        d=google.com; s=arc-20260327;
        b=ZyM+lNOdnPl9PdrmSQfhaKJ1Ou50PFhRves034iRodFntP+cK2nWX17d80UjI1hXtW
         Zn32tOnseL74pFuLFYLqVftVLiDY9TfCTbMltbfeR83kd1I21U/r5FrU74PV1Xl31K47
         R6l2kD7F922GY9sqOkuBy5LX/SLVLJgORviN/J5azf3ITxfVGqH4vzL0OdSvgcp6qPvy
         CM6JkHYk5S6J3KnNWZlmCYRzWhEjj3QQnxDGOjmNMbchVhJ9PzMuoDewhC5Z5tAHl+36
         BAlW1p5TBe1clJDHQzSXTLOuDB4bA3Q0UcPtwbSIykU9f8NMf5/X0VIFgPXT8ManrLkp
         bLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        fh=oroSe+I0hOYUg7x0hxzGKOhtzJYmvF0dAMpI4wOX7qU=;
        b=f5FB68bSmZPzeWPVMo1lryOjM/FvdbBIBjHoPvHTZr5ynt5ezxBjjIerrMFwQsld+Q
         wVPr+VsP0i8fHrWGR5qQjJiMsI3EgNUiupNaoTIZrI81xZgQJCECzOpbmxHFkA4eToE1
         DM/2hf4VhlxorrnJOeYuDxR0P2ONwHcZj/QdJAWC+CcIQ0n90pfYqEyrZykklaH9c1Fc
         aSQ/I20FvTYOaSoWJYT8RUC/IU3WpWhliPieVf3groOwan//dK05kYtMoWwvmzEwYqmh
         0Th5/PGLMo14+88fTuQK28CAvEEmLYjrAntWpO8aBTpFHf7fHAMmw2r4nKzau7hYUG9T
         4qIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791930374; x=1792535174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        b=C4/6EXUWLqwBThAGo1onKkHW2BxZrd15xJmVGIULHYLY1nPFF5hv2mrrYcUkuA7RR8
         IhUjXjBsCxcolz6CV0dg8XhSVmMve/TAn8Iev1d7tXkENPi2R8sDAr89/T1YBI130YKh
         IcS6Ly+tY/cTuvFj2Cbai7MhyVANyndbphs84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930374; x=1792535174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        b=fyAE9PB+Heg/D5RaPnemKJxXEbU0xvFazarmxG75EI04mP9KMdGh4h7N8kO81nBchR
         oYn+pM/rk4hOBVbj4QzLCJ+uPlhj48ceSWenU+B20pVen6nCoaacWr519niIhfTo72eh
         3Dw1+Gz+3B0v8bqN6C0YwjRaICvHbF+MDjOxmexEnBYmXHeFgAqvCcfwOh62v9qLJCy5
         27LlfO7X5PkX0yyDadZdW4rxwJRw6VkN7j4Xk7Xoc3qYi+1rM8Zb6Hc7A5VH/Q3kmubi
         y5CT9asa/8JmldWU6tSLONotaFQoFgoYWlV4gTLbupzLKPZ9U+4fqVhrbT8q7EEmdOiG
         vslw==
X-Forwarded-Encrypted: i=1; AKwUvBwG/sO2m7Z3pleq45RA0Q+Bp4J5JY4MORubISqQ7gE6jv84LAn906FKBGS7W1tIpGP+E6r7r8abGRvh@vger.kernel.org
X-Gm-Message-State: AFq9FYJu6aPMYW8LMHrD0gIEpZpoBQvt+Ez6GCySBbIlyYXUcwZnPiAU
	ho8Cy+VnDdw3WSR2ySlLArGRQw29jwcaFd0nK4J5jTSlTTrKsPuP0zSjKCoDi3lMCG7slT7+f0X
	h3TzP0fPZHvZD58qZs6EVtqUw9a/xGnhO/FNFNo52
X-Gm-Gg: AYBFou0ZhGsWckX+YRp46RdgkDw6Y0K+TzKTpJV7vpSBmfckeQX5VfHb18IsX3VfBVi
	1I/lOB2/H6SIci+3rGlZ4EDUfRKtLVkFvRbyhOgzcKuLvsGEqjDn9eUNw5HXnIQjcqLqFmmPn6R
	5QaaKCM5XRFDnSdNhS+aneYYWRaRkZcwfYh5IF3O1S0eb1gN1V1iLyNVg5/XlT7/em3bdeMvBjv
	sSqIO6Q/pnKkZfet2bSlA2WgKaxcRAv41A99UUGLDSyBMbEd5z0yzzn8fcNQaO6Nskd6p75cRGw
	fd9KyZKHW4gjDfGSkhAZHzMBFIpvdXC8Fa17bpQYbaYhdkFymQwXLdxsLW9toGUZkXKBJcpR3/r
	eLZIQ08cIYA==
X-Received: by 2002:a05:690c:39a:b0:8ae:8877:9ef6 with SMTP id
 00721157ae682-8b07edcf6f8mr55863427b3.10.1791930374515; Tue, 13 Oct 2026
 15:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-8-384af01da3ee@chromium.org> <aszWnnc6RR9d5SYw@monoceros>
In-Reply-To: <aszWnnc6RR9d5SYw@monoceros>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:26:03 -0700
X-Gm-Features: AclHuK_tyUehVA205WXB_Og5y1P8AMIMPFMlhjQ2Y9FOhmh_U9e-FbL8LEin36M
Message-ID: <CAEe3GZHB_mDcdz3gcoAzOu6mO7ua3muESOJcaZi6Z45Q8J77rQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] HID: spi-hid: add device tree support for HID
 over SPI
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:49=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Fri, Oct 09, 2026 at 10:25:33PM +0000, Jingyuan Liang wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/spi/spi.h>
>
> Drop <linux/mod_devicetable.h>, the spi header already provides the
> needed *_device_id with less dependencies.

Thank you. I will drop it in v6.

>
> > +static const struct of_device_id spi_hid_of_match[] =3D {
> > +     { .compatible =3D "hid-over-spi", .data =3D &timing_data },
> > +     {}
>
> { } please

Will fix it in v6.

>
> > +};
> > +MODULE_DEVICE_TABLE(of, spi_hid_of_match);
> > +
> > +static const struct spi_device_id spi_hid_of_id_table[] =3D {
> > +     { "hid", 0 },
> > +     { "hid-over-spi", 0 },
> > +     { }
> > +};
>
> Please use named initializers and drop the unused zeros.

Thank you. Will fix it in v6.

>
> > +MODULE_DEVICE_TABLE(spi, spi_hid_of_id_table);
> > +
> > +static struct spi_driver spi_hid_of_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D "spi_hid_of",
> > +             .owner  =3D THIS_MODULE,
> > +             .of_match_table =3D spi_hid_of_match,
> > +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +             .dev_groups =3D spi_hid_groups,
> > +     },
> > +     .probe          =3D spi_hid_of_probe,
> > +     .remove         =3D spi_hid_core_remove,
> > +     .id_table       =3D spi_hid_of_id_table,
>
> Very inconsistent alignment of =3D, if you ask me, just use a single spac=
e
> before a =3D.

Will do in v6, thanks.

>
> > +};
>
> Best regards
> Uwe
