Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDFE38E8D3
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990774; cv=pass; b=DnwTHbnpbtfTWBjy665gXs/AvffydQawdlMvg88nvPMD+NZBTQIFWti2bC7Jse7ZYpQTch+pY+ZdGclTWy58MHcwiQQS0ncCn+F5jBb0JewQN0li8mpXayoDpFS9bJi2ELKQKW77+qrCOwtRvxVPjJGZZaAx87lstkOyLks5h8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990774; c=relaxed/simple;
	bh=S5zs7o+IvJ94PTcJ859wDkqWMdgUCMYMIGrDaQPMmSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqhhuVjFEe3w+7fMRKYUqNaR9XyKndzO8WTV5o3UsowcXkkAE5ilrJTBaDhJBJ3DmcHVElSWBO3gI6jPcMwVgHyR4/WPAe5+FnOP1XXeif9gAKGecWVHd3N1w15qKXSmqeIFdXfJ5f2WctQNldg/oT3rvQGJuSeeV7BpZl7ZsDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXfwA3nj; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXfwA3nj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2698141f8f.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791990771; cv=none;
        d=google.com; s=arc-20260327;
        b=Wd3QRQdMfPCN7Y0ytHLZAUudHC0luFDj+V53d+UDyLU9iOIX+1fQcqG+V/ql7nyVgw
         l/tttlaY20QEYySxRTx3lhvnpQvdc7nk4o3EZAt6H0VpkrTOuv6Q0aAy5ThYnLjPyIGR
         yHomwEBndlCT4uJgI9V/DzgF0TheMHABa+RowzOG5m2Q9nGlY9KzXrPgAueMyO94neDe
         tTDBSAHa7mG7/CSYfqGnuXLm7Cb0Wysh3/MeZKlY5L3EUPK0U81HqgKWS1nq2ltq2AWl
         4Q3UQ14MDflP+OIL00YO44XmRzWkCDVXjQu+Y8KQ9TosW5jEw+eY4tzw26POkt77UU35
         GiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WUSTZfpPOOhjEr0q1WimSib8kVLmZYK9NAgp2MPe0uQ=;
        fh=brB/syDNBgFB2bia83nhFQUCRYkBMv9ro8bmJKL1HjI=;
        b=gfENMjZ6UQY+LRlpNHlWDCf77eMNCE+uC2aEyCFd6ktH4rxZET6ay3xEz6KKk8goEu
         N1vBogDRcufbEmRkfraEBVUTQOQS5IFkIAJNBYFixZQxHhUrYYQ4Asg2WavaS1kWNwJT
         fINOCPdTRi/eZmhp5HKqJoxbhVjU53e7wPCHpCH+HZy6/FSk11ocmFtXqCaHLQihFrdZ
         Om7e9ybMpQOGNx+avOsc6N8DfUPi3ge/J/5yObJVqgQ31HMxqZw8UmbrAEwk2WHNcnOO
         t9bXvndUHpUT++KMLns/Lfd0SM58XGYvWy+Va0+aZq++CYMV1qM8oNrdo8EamI7aPk49
         Vr+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791990771; x=1792595571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WUSTZfpPOOhjEr0q1WimSib8kVLmZYK9NAgp2MPe0uQ=;
        b=DXfwA3njbnanK1S+51Hx1cy4UO9CZ0e2Oa4rvzBS+JGEYkWcmjEkvDq+GR1ZTJxFG6
         Oj0EJKJ8bqP+3ok2+Wv85blS/YJh7EES4pYWOqBVUqzyYNVE9ILJovS2AINGN+jgv5pN
         kInj8WcsUElThf793hZrtbeANVHIhdQBFlm437b7Kj9PUPhIt+sNJktS6FYBm+YEIc+V
         jjV9seGNTnk4gP/SHPSzhClmtYryZgyjGb83Jmyfwr/trylUPQhQxcnVZ2f1cwApss1P
         gDGyDuuLZTuus0hnJyC5zHKL48wkJDff9u+ansoalKQRes4I/vvI82ixp54YABQmQISU
         HTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990771; x=1792595571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUSTZfpPOOhjEr0q1WimSib8kVLmZYK9NAgp2MPe0uQ=;
        b=XNGoCXQCWNxmHPvBT2QHYLSA2E3Yi7ZOCcjdogjGg4peXXQ/UqZ4PKBrE3nTih8iB4
         c/Ip5Zum/uGJaZn7KHaPHfWDZVwUoO9ZMyxm21ic164QQ3d8Yu3rtvElFXoKmqjQaJ+E
         3JAdFGWbGEkdu43QoQx5PbyCdd6wKt9pNUTAYYyY+xsvO/nI2VIuV2Wxbs8L/l9Ti8+f
         vrMzmhl12/yWlYEp0VGqnwUiG5QFgDSlIUHPKVIe5oZKSpZMo4ZzGOEQykrE7jIN6Iwq
         j5o7XmfCp4gZs5ZWd3Mvwg/a8G6bfu6yKEdgLlF0knbvJe4jiAN57nwcdl5jTid8VbVF
         iCTg==
X-Forwarded-Encrypted: i=1; AKwUvBxc/UrDKeDBMmV0HPQonjJ2qebkScabqEHBvM3WKzr/7iPqHivH07HlRZwu3MgAaF+5hcs8zjd6wmuD@vger.kernel.org
X-Gm-Message-State: AFq9FYIAA+mPcHGJ7ZyFQfM0fVY4zLiGR3CvcLa+a60sef6wJpjTBHwA
	7wYg64sm1n+WT/aN1CphSTGEoZaBa1at51sAtA1S/6qAHyQ0GXLhkZX1a3JN34FZ+qR7fuNMkqB
	MnqREAzzM1ZaRrlWPYGI8r3m0mBC8e/Y=
X-Gm-Gg: AYBFou2Hi5Njr1yyQnTxXjgqjrCYAN07wLIfMDeWiSibAJsIFeY9nBaiFSo0ArbR47/
	P/X21T4xN8QBZi7C+2M5aMxWMdeqedkbuzGPNa7la9ZXOD3pQ2JNcdVOFxR4ShNDI0j7Fw5iXsv
	ZctjW/dszu9rzOIHEHjx9dJVYKGq7hyr1G0Sd2ZfsW16rl5XukmerJYK4eGTEXzrs6r2RodX0+Z
	GSnBF71Ab2v/lEHV+jGfvAhBGCAitTg1f7Qj9IHkhugpOEUjnuZAyPkAkoG10PwEhLTcjgr4nJV
	F9vsEV0ErdGed0gmdvGAlPPwCfsP671F1H8CTSgilMsFB/qNIC5i4ahOjMYL5HASyNWYAUSLtWX
	gjCI5C1+qcGO0gi9eveVN/FOmxwoWf7DPOKFUoT34fCIZQFSQ2B7X0Z3TjFJFoPibj0HwT1W4d5
	vAaBeCJDPO
X-Received: by 2002:a05:6000:2085:b0:488:7496:15b5 with SMTP id
 ffacd0b85a97d-48dbacf126amr30278767f8f.47.1791990771057; Wed, 14 Oct 2026
 08:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <as5LQ6zFzkft2zNJ@ashevche-desk.local>
In-Reply-To: <as5LQ6zFzkft2zNJ@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 16:12:24 +0100
X-Gm-Features: AclHuK_fe1o3s5DtDV5FGIwilMVE-kQkfjxo_HHCOHYJ4usL-K9N52nyOxeW19E
Message-ID: <CA+V-a8vV80UfHtfrxMFDk_UFH04F=evyAqTvHEMSOiRNTJd+Kw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.


On Tue, Oct 13, 2026 at 4:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Oct 09, 2026 at 07:41:22PM +0100, Prabhakar wrote:
>
> > Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which share=
s
> > the RZ/T2H ADC IP but differs in channel count, sampling, calibration a=
nd
> > resolution support.
> >
> > The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
> > 20 ADCLK cycles, does not support calibration, and supports selectable
> > 12-bit and 8-bit conversion resolution.
>
> ...
>
> > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > +                              struct iio_chan_spec const *chan,
> > +                              int val, int val2)
> > +{
> > +     struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> > +     unsigned int i;
> > +     u64 scale;
> > +     u32 rem;
> > +
> > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT))
> > +             return -EINVAL;
> > +
> > +     for (i =3D 0; i < chan->num_ext_scan_type; i++) {
> > +             scale =3D (u64)RZT2H_ADC_VREF_mV * NANO >>
> > +                     chan->ext_scan_type[i].realbits;
> > +             if (div_u64_rem(scale, NANO, &rem) =3D=3D val && rem =3D=
=3D val2)
> > +                     break;
>
> Hmm... AFAICT we can use multiplication as the result of the division is =
just
> used to compare.
>
Agreed, I will drop it.

> > +     }
> > +     if (i =3D=3D chan->num_ext_scan_type)
> > +             return -EINVAL;
> > +
> > +     /* The scan type changes with the resolution. */
> > +     IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> > +     if (IIO_DEV_ACQUIRE_FAILED(claim))
> > +             return -EBUSY;
> > +
> > +     adc->resolution =3D i;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +     ret =3D reset_control_assert(adc->rstc);
> > +     if (ret)
> > +             pwrseq_enable(adc->pwrseq);
> >
> > -     return reset_control_assert(adc->rstc);
> > +     return ret;
>
> Hmm... If it was added in the previous patches, add with unfolded check a=
nd
> explain in the comments that the code done this way to avoid churn in the
> future changes.
>
Ok while adding reset support I will check the return value to avoid this c=
hurn.

Cheers,
Prabhakar
