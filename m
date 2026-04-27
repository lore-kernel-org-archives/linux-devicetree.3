Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88920355F36
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777329547; cv=pass; b=t5iPDd93zo6YUJDscglBJMKhXxZhhmaG9GYIhgWv4ZWusfM2INh4m+OSJEvmwCnuPWWnQlFBE4qtu+b16inihpIu0OITAvDpcYC0QPuYTybgMWGryDwpTN6hM4dBC03p/SuLdhyC5Pfp6Ntr84DHCSDL0mJFzlQcFA9BZaVJsiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777329547; c=relaxed/simple;
	bh=1lyRXw2Br8iVqp8I+jWo0tncE5X7WAQeoUM0ZQ6/GT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJC9YObRgZAIbGhTibbOD4Q24pvReszXzRGvuXupWgP7PetIzOzsp3aaQw9NCapLoGnRbTF2pNcCQYAzpZj999fBJRONBvhgxQjpQ4/jHgSf23C6GZFjSR+EZlU22mvnI8DiXBp+rfDIj9grVgMycOazFFzSFnVEqcxu7DXP+r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWZuTjM4; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWZuTjM4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a4113ab355so11597763e87.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777329544; cv=none;
        d=google.com; s=arc-20240605;
        b=gO5lQS5rDPkaoW4Oa8+OhCtpkF+NMZYmtSrHFSzqw7JlLa32M0aWg4VJxO1HOGZKsS
         vEv15i+E6THBO2dEah782lQWRqyD8aG7E+66vtsISM4lW+nIFFa6A/2DTm6hQmof/wRQ
         0/B2ulAJYL00twJgJFk2kRrCQQG/+/LCQqUHP+E/VOhG6zH4ymgpUFPS75WapPH9tJnw
         sJfSGckO94SvB2keQJCUvBaF3ctTebloH1DFAHT6SAvyPhOwuXuCAAq9THB3lTV2VNgZ
         aEtblHXkoucJ4ACmGysEurW0G08mY3LeeMuBzT0NoYVpvnhrM3QCYQ2srJk0IafWKU8z
         PuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vYwwmAdm5UCPWDH/Mw/jP5EYuNFOTrm/hsQP5z9qgM=;
        fh=mQPZaqPOXX07ZrGBCl1WMnVgEoWiPAoa/0sKCYeN9ME=;
        b=jQ9GosVbiCaONGMlroAbQE9JxfckcjNG1MqVZ0I0xx9BPe0FadiRFSAyMEj9qXsJjf
         X+jfCIQSJtTVrZYjc+QKNyAJxd9ZunkxYx5aOvynciZnIS0U+gr20cMf/lod20FxdGQW
         5zRqGiAiKTpS9amSyZ5Ja8CRKymV2XB7AeIhOzd6ulJDYqh2cqrurRMc3I1HUs+zf6uL
         jJ8IzirobIFbTjAXciqbVr6Aax6L2bAOqEnTCuRrjkPHAV0afwICS53skhK5AKPWACYk
         tgHMaw7SaL9V04OVb4PNoAYW3LCHCWcVEacmjeU6evq3/3VPWCPHWtzuXwC1KnmNUTVS
         BhnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777329544; x=1777934344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vYwwmAdm5UCPWDH/Mw/jP5EYuNFOTrm/hsQP5z9qgM=;
        b=YWZuTjM4Cqcw7P+Y8GF1ctCxITbWKkW7slbZmfsJ7Hu1hBKikqAJhi4+KLbjvG7B6a
         IqHEoJMMlBalDPsc80f7OC9bxz0tQB1Z6EvHFElA3cp2UL0qOtm0X9uMKo4vEA3tNri2
         oNFQ/wyIy+wkUfzcGgp8bNd9LDq1PH7KsRuUMg5QxSrF6sQU41m+NZUkTKnAnUNAOrSr
         lTHusN6KpUFchZf9W6iyTS1wkJaILycazYfc8RaPH9s+XWZIpif9jTWbpMD6R794vX61
         XZ8OfhvBkcMkfEjfxOodcOJ7js4pOxRjUR9f1kATV8oBBUQpL+ZOTVxhsOEzC+ySUnNh
         E+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777329544; x=1777934344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vYwwmAdm5UCPWDH/Mw/jP5EYuNFOTrm/hsQP5z9qgM=;
        b=ZkIYoWMpG4RE9f6c5sjE27r4bffRP0sYdNpB3DYni2fclHwQjGdLhNDivwuGqb2mQh
         SKBLeijYLMKnqVCfUqCrViNGFF4gSvVg7L1dT1TpjP0mddpElu/smg1s3A8ldemrPcfX
         8l/Q6Fb+kT06iTVp3GuKBGQR6hVy8d0OZbipVVpxMPuPLl5nSYGzmSDb+Nrl0dJQ+eOp
         2m4gO0SbzU/CKhsyaDRziJFtT1BYIk8FNDyC1ssvpZ6RffuTUiFkwTV/pskL6pfFWIBE
         Lb/wWRi6mYZ0mPxwyQWYUmCrcIbwx1GtZUBhkCEVmN4jar6IhO7vsP0e0Xt5YSXDATf3
         iwtA==
X-Forwarded-Encrypted: i=1; AFNElJ/cHDda7NqbVbHeSLGiKMroQGZXoxdEzu69jhfS29Vg2vQqvpcy4bUbHnJa7ODWRrAogThlzyK7R4vD@vger.kernel.org
X-Gm-Message-State: AOJu0YxoM3qeZtrEX7OyMc/eUCCUWvv6wujUFL6NMvSWPp8lE8BD9AH0
	pCEFgw4OyRDu+SnK4GWhQyvj7pDEGx+VlemXJYxfaAcunuhOxZBthMvwxTl6eoEcx9cpAEH4AA5
	AbjB4Z2o6CD2JD4iL0UdAwuMlJ/2maow=
X-Gm-Gg: AeBDiesmZlskqsJlHDhLfQ9mFq78EC8b3gal0hnBflTbvRP/0azgyd20rZ70HabQMNx
	/WcaTVsgCfexnuflhjXAqSykfOkYaoo1FSQ5Eyc8KuglELRkpx3W0I/aI5YcZMThH+Y3Aog8fei
	KXLDZLMEZGlEuIqelI7jFQ1Eqfx+1abmOZttcTCD2JFj+z5ZGFiylxexUv3nRI0f2DD2sXGGWOY
	EdJnCWkuxl9VHOAFRINwIKW4IejPptjAFZZ8D6JOnU3Q3jQmuvm37IxX2zq0PgWDyoGdykaMh6r
	1XOD41+E0mJbUUp2hNxThs0VQE3xZsaeBUz9/xFc3YEiMXzriSKWiHZm4jHJdjQEItY6yMXMYOF
	FtkA=
X-Received: by 2002:a05:6512:1396:b0:5a2:864a:bebb with SMTP id
 2adb3069b0e04-5a74660ed88mr188878e87.20.1777329543300; Mon, 27 Apr 2026
 15:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
 <20260427100950.33936-3-piyushpatle228@gmail.com> <ae9sZonxK7HTXsUT@ashevche-desk.local>
In-Reply-To: <ae9sZonxK7HTXsUT@ashevche-desk.local>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 28 Apr 2026 04:08:26 +0530
X-Gm-Features: AVHnY4L2tKQeEwjE2kh5QapimnpeLQ3gAeOSo8vfc9e1zowXkFqUOwFxPYY8pQo
Message-ID: <CAMB+xkZQS4qZTafrqJBkZZWR=M4W_L1+1WezgL=Wq8yrXL7W1w@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] iio: adc: hx711: move scale computation to
 per-device storage
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: ak@it-klinger.de, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 7:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Apr 27, 2026 at 03:39:33PM +0530, Piyush Patle wrote:
> > The gain-to-scale table hx711_gain_to_scale[] is a global array whose
> > .scale fields are overwritten in hx711_probe() using the AVDD voltage
> > read at probe time. When two HX711 sensors are connected to supplies at
> > different voltages, the second probe call overwrites the scale values
> > computed for the first sensor, silently corrupting its readings.
> >
> > Fix this by removing the .scale field from the global table, making the
> > table const, and adding a per-instance gain_scale[] array to hx711_data=
.
> > Populate gain_scale[] in hx711_probe() using the device's own AVDD
> > regulator voltage. Update hx711_get_gain_to_scale() and
> > hx711_get_scale_to_gain() to take the per-instance array as a parameter=
,
> > and update hx711_scale_available_show() to retrieve it via iio_priv().
> >
> > No functional change for single-sensor configurations.
>
> ...
>
> >  /*
> >   * .scale depends on AVDD which in turn is known as soon as the regula=
tor
> > - * is available
> > - * therefore we set .scale in hx711_probe()
> > + * is available; it is stored per device in hx711_data.gain_scale[]
> >   *
> >   * channel A in documentation is channel 0 in source code
> >   * channel B in documentation is channel 1 in source code
> >   */
> > -static struct hx711_gain_to_scale hx711_gain_to_scale[HX711_GAIN_MAX] =
=3D {
> > -     { 128, 1, 0, 0 },
> > -     {  32, 2, 0, 1 },
> > -     {  64, 3, 0, 0 }
> > +static const struct hx711_gain_to_scale hx711_gain_to_scale[HX711_GAIN=
_MAX] =3D {
> > +     { 128, 1, 0 },
> > +     {  32, 2, 1 },
> > +     {  64, 3, 0 }
>
> I would leave trailing comma, as it is semantically is not the terminator=
 entry.
>
Will add trailing commas to all three initializer lines.

> >  };
>
> ...
>
> >  {
> >       struct iio_dev_attr *iio_attr =3D to_iio_dev_attr(attr);
> >       int channel =3D iio_attr->address;
> > +     struct hx711_data *hx711_data =3D
> > +                             iio_priv(dev_to_iio_dev(dev));
>
> First of all, please preserve the reversed xmas tree order.
> Second, it's more than enough room to have it a single line.
Works , will do in v5

>
>         struct hx711_data *hx711_data =3D iio_priv(dev_to_iio_dev(dev));
>
> >       int i, len =3D 0;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
