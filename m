Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDDF3612FE
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128918; cv=pass; b=U2TfJY7s9MLodwG7EYt7ltOylGHLAafKm+N4prKRuvO3XizAQsP0Te6z5VmSCctgZ5RUrNvIugpC/nNRTBZ+CuYiqrJSG8X++2FE5NlTfZGqxuWVIZTvmvFEyt11TcD2AcL8RNs/0VngfKcsoLgUAiBU50WGHX5P6aKiUt3luEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128918; c=relaxed/simple;
	bh=3BfFiiwAf1+/kI1Muyq6ShT+hfYrO86ZTzfarrG9ptA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOjZOgOGlCTDm6tdH4bwJJtjrSCmWPKJSInspkFutTM3WS7MkBgHfZGfZm/R+G7AxNQC8Ykp7/uMWXbULCiIxwx5KVL4kjAODBEmtMV+G7/k7Rr1UcYio2KiDf/5940bK+BNVx2xrBTZBafrxiu91/ilkvLBmjL3/f1KfuRtNAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vl45wzhD; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vl45wzhD"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bf959b820cso544268e0c.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787128916; cv=none;
        d=google.com; s=arc-20260327;
        b=F+TBwaPkvhJgjzeLzkd+Q6OaadeHztV+vEnYZ8ERt73wh3UVGMOna4ocN2n8ZLOMwI
         pfAJgWkCqJjhOhoxEiAD67oNHSDK3niCnTy3gv41dorMCsJ9SGcl3Kt3E+AeWUESiJY+
         Bhnpgszt35+oGs/ZmkVczn0i5OMsu3jyoleGgEAmDU62dlydrIj3Hv91nqoYIRsFndwW
         ZM2zioVaMJ/hx01rSyfTPbQZmKeecB9z28f2lXYW6Xf8di3yU2+B85vxkifza50GbIOJ
         vtVBEkdURmiVeNyzw9vR8zxKhSSpr9Tcy8LBMOvb+Y0wara/lxLdZQkim4TsXV1hL+Al
         ehXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8urY59pjNjHLqA+vvLXnOI8KDExgE9Nk3kW1BcVqWQI=;
        fh=JK96jJCRfGvOJgKqccAye+RXc0XItuW+5BcKFGE6n5c=;
        b=bc39oOtEXkSlzBBs8Dp6FN3ipGsm7VtebWasFCI33pKl1n6u6UnT784ae3JuOg47mQ
         hNZADVLFBGDms0IaGCETeEqzomtEaFPTnj3lqaqwSuJ+RHd6yxO+sOC1++mIQVYUp1Hs
         6PFnI42g3I8uHBqRSCKhZOdS/exNsDS5UGvnyLa3iZ7NuXMmTNkKVGuN2/CKLq4GoHGU
         BxVFod4/IHXdsWPS4rxgBjz7wDRC96Z0NhadrQWUi4/AAjvUSeyJwsS5bUi4wSYKwX0K
         DORUaBUlXqN8lGK6iEAhcCcZpQNGfmeyAxzsmEBUf3D/y/nzUkrAj8q2n9Vh/gfO2YV5
         EHjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128916; x=1787733716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8urY59pjNjHLqA+vvLXnOI8KDExgE9Nk3kW1BcVqWQI=;
        b=Vl45wzhDfonyKLJeWgrusN5lX8bIa/JVlm9f+lDm3AaAiMzsbnCLWyxPwrn3cE46L+
         jS49OnTm626AKAU7eC681EUPSaDYMNjAqJvUEqcwbef/szsASQapgU4W+w0UVcEHC2ca
         snUsyQN474E9DNDE3vOA0BB/217oBVg7O5ilgUnZKE0tfQifK0aQZTDw4DLNRb2JWwPz
         JUQEdTnXT3lGHxZX4KUtp+j0e4Rpdj2BDav/Va4epp4JT4yDBeK609rsNiN7StdmwefN
         sPdGr6Bl6r1Jl34i1401zNUDeJ4Intj4U/7yx+CKIHSERM9uZHNNSDL3oAvVTPwhm1dC
         1GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128916; x=1787733716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8urY59pjNjHLqA+vvLXnOI8KDExgE9Nk3kW1BcVqWQI=;
        b=sxGMP64RauVKXKIktrE8tB4p6THN95u6eZjN9+nB9WwVd89Cf3Iw5jZx6uPju9HZX7
         R23QJH+x70RM4pNcYqNQGDLJoiQ2qaW6hZ1P2tEjyEDAx8afBRhLrzeet33OYAC0ZhSy
         XLYMDOWhFTShfbSwtUDMJH/HXI6aGq7nGQHacDT3BRTWM+Zw0SaG5NPbWggQabo15Jqm
         Cy9x5VsMSFGlYjR+b/bm9QoBV4tooWeieLdnEwIv1NWjVXOrLAeev7hBnpj5r/teMWmw
         e1L0/uzjwsNeZPPu6sYXha5duleP2blkn0eUfEfkqYhE3tQB9ir0Sd+aHxWIrQcobnSe
         STkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5I6p/ObAYjfuZjjWYurjOblGv6zbE4mqqx2dQT9yPEkOu5nYCjb8kiKkjfFApDeNEUgXJ/e89nhPq@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZPfPw8bPCumuSLvqjXSuAVUwj3NCPiSOk2eDrn5dv19njpNn
	fXqWHzcql/serrlgaDKVFC9+8IbpvKix+ZbcOcumEF0usHn1nvUFIccrPXS3UfgyT3TYNO9SzBO
	4w4O1voylXN5s4gxV+TgAcBD2/+L0BULbw1PK
X-Gm-Gg: AR+sD12CztQvCGziqx2gG4WJNyoMgoe8bCayTUx11sEXe4OXArUAASoDy/hBd+7zvwF
	Q72Piq8ESwDNzcdiDK5iEkm4nlEgWwAqNo37/+/NUdHXpCC0c1IoO8UHXIokHt76CHbrqOHMDue
	+9mfmPANAY2U6Yd1W90WSGOR8y1/1Id4N52yERtLBTPYuqOuOynw6J6cxbtFx9ZO0PdJA+jyKz1
	FHYGPc3fMZzbb5ibeasjXogRkN7SKcgwuh91CiL1NjUbj33YUYAkLoaVGDUCZ5BQHNW14RQSteF
	4SK/cSEX+e2lYcr2c5QAAUbBsqVT3LMfl++z9t7z1K+FKQ==
X-Received: by 2002:a05:6102:161f:b0:778:86f2:9f26 with SMTP id
 ada2fe7eead31-77886f2a082mr37416137.9.1787128915750; Wed, 19 Aug 2026
 01:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-ti-ads112c04-driver-v5-0-79dff9e249cd@gmail.com>
 <20260813-ti-ads112c04-driver-v5-2-79dff9e249cd@gmail.com> <aoK0TKBFZOM6A-c9@ashevche-desk.local>
In-Reply-To: <aoK0TKBFZOM6A-c9@ashevche-desk.local>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 19 Aug 2026 16:44:57 +0800
X-Gm-Features: AcwNN1U1qO4YlqvB8O0_hUo3PGFSVQ-Z3F4l0I7bSc9D15VtcM0F22sunImImrQ
Message-ID: <CAF7HswNz9a86ZooYmSghh8w1c5Y0VitBhOOAasm04-Ln8K4O2Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] iio: adc: ti-ads112c04: Add support for TI ADS112C04
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 3:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Aug 13, 2026 at 11:06:03AM +0800, Kyle Hsieh wrote:
> > Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
> > delta-sigma ADCs.
> >
> > The driver implements:
> > - Single-shot conversions using the IIO raw read interface.
> > - Dynamic parsing of single-ended and differential channels from
> >   device tree child nodes.
> > - Hardware interrupt support via the DRDY pin, falling back to
> >   software polling if no IRQ is provided.
> > - Per-channel reference source selection (internal 2.048V, external
> >   REFP/REFN, or AVDD) via the reference-sources device tree property.
> >   refn-supply is not yet supported.
> > - Hardware reset via the reset controller framework, falling back to
> >   the RESET command when no reset controller is present.
>
> ...
>
> > +static int ads112c04_wait_for_data(struct ads112c04_state *st)
> > +{
> > +     int ret, err;
> > +     u8 val;
> > +
> > +     if (st->client->irq > 0) {
> > +             /* Timeout is 100ms (slowest data rate is 20 SPS) */
> > +             if (!wait_for_completion_timeout(&st->completion, msecs_t=
o_jiffies(100)))
> > +                     return -ETIMEDOUT;
> > +
> > +             return 0;
> > +     }
> > +
> > +     ret =3D read_poll_timeout(ads112c04_read_reg, err,
> > +                             (err < 0 || (val & ADS112C04_CONF2_DRDY))=
,
>
> Better to split logically, also the outer parentheses are redundant.

Fixed in v6.
>
>         ret =3D read_poll_timeout(ads112c04_read_reg,
>                                 err, err < 0 || (val & ADS112C04_CONF2_DR=
DY),
>
> > +                             1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC, f=
alse,
> > +                             st->client, ADS112C04_REG_CONFIG2, &val);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +     case IIO_CHAN_INFO_SCALE:
> > +             switch (st->vref_source[idx]) {
> > +             case ADS112C04_VREF_SOURCE_EXTERNAL:
> > +                     *val =3D st->ext_ref_mV;
> > +                     break;
> > +             case ADS112C04_VREF_SOURCE_AVDD:
> > +                     *val =3D st->avdd_mV;
> > +                     break;
> > +             default:
> > +                     *val =3D ADS112C04_INT_REF_mV;
> > +                     break;
> > +             }
> > +             *val2 =3D 15;
>
> Seems like this being used in one of the above functions already. Perhaps=
 you
> want a defined constant? (I haven't checked if that 15 and this one are
> semantically related, though.)

They are - both come from the 16-bit signed conversion result. Added
ADS112C04_RESOLUTION_BITS and used RESOLUTION_BITS - 1 in both places.
>
> > +             return IIO_VAL_FRACTIONAL_LOG2;
>
> ...
>
> With
>
>         const char *sp =3D "single-channel", *dp =3D "diff-channels";
>
> The below...
>
> > +             if (fwnode_property_present(child, "single-channel")) {
> > +                     ret =3D fwnode_property_read_u32(child, "single-c=
hannel", &channel);
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "failed to read sing=
le-channel property\n");
> > +
> > +                     if (channel > 3)
> > +                             return dev_err_probe(dev, -EINVAL,
> > +                                                  "single-channel must=
 be 0-3\n");
> > +
> > +                     spec->channel =3D channel;
> > +                     spec->address =3D ADS112C04_CONF0_MUX_AIN_SINGLE_=
BASE + channel;
> > +             } else if (fwnode_property_present(child, "diff-channels"=
)) {
> > +                     ret =3D fwnode_property_read_u32_array(child, "di=
ff-channels",
> > +                                                          pair, ARRAY_=
SIZE(pair));
>
> + array_size.h

Added.
>
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "failed to read diff=
-channels property\n");
> > +
> > +                     if (pair[0] > 3 || pair[1] > 3)
> > +                             return dev_err_probe(dev, -EINVAL,
> > +                                                  "diff-channels must =
be 0-3\n");
> > +
> > +                     spec->channel =3D pair[0];
> > +                     spec->channel2 =3D pair[1];
> > +                     spec->differential =3D 1;
> > +
> > +                     if (ads112c04_diff_mux[pair[0]][pair[1]] < 0)
> > +                             return dev_err_probe(dev, -EINVAL,
> > +                                                  "invalid diff-channe=
ls combination\n");
> > +
> > +                     spec->address =3D ads112c04_diff_mux[pair[0]][pai=
r[1]];
> > +             } else {
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "channel node must have sing=
le-channel or diff-channels\n");
> > +             }
>
> ...can be written as
>
>                 if (fwnode_property_present(child, sp)) {
>                         ret =3D fwnode_property_read_u32(child, sp, &chan=
nel);
>                         if (ret)
>                                 return dev_err_probe(dev, ret, "failed to=
 read %s property\n", sp);
>
>                         if (channel > 3)
>                                 return dev_err_probe(dev, -EINVAL, "%s mu=
st be 0-3\n", sp);
>
>                         spec->channel =3D channel;
>                         spec->address =3D ADS112C04_CONF0_MUX_AIN_SINGLE_=
BASE + channel;
>                 } else if (fwnode_property_present(child, dp)) {
>                         ret =3D fwnode_property_read_u32_array(child, dp,=
 pair, ARRAY_SIZE(pair));
>                         if (ret)
>                                 return dev_err_probe(dev, ret, "failed to=
 read %s property\n", dp);
>
>                         if (pair[0] > 3 || pair[1] > 3)
>                                 return dev_err_probe(dev, -EINVAL, "%s mu=
st be 0-3\n", dp);
>
>                         spec->channel =3D pair[0];
>                         spec->channel2 =3D pair[1];
>                         spec->differential =3D 1;
>
>                         if (ads112c04_diff_mux[pair[0]][pair[1]] < 0)
>                                 return dev_err_probe(dev, -EINVAL, "inval=
id %s combination\n", dp);
>
>                         spec->address =3D ads112c04_diff_mux[pair[0]][pai=
r[1]];
>                 } else {
>                         return dev_err_probe(dev, -EINVAL,
>                                              "channel node must have %s o=
r %s\n", sp, dp);
>                 }
>
> (but it also makes sense to check with bloat-o-meter to see how much code=
 is
>  added and how much data space is saved).
>

Applied - it also keeps the error messages in sync with the property
names automatically.
> ...
>
> > +     /* Datasheet: POR releases ~500us after supplies are stable */
> > +     fsleep(500);
> > +
> > +     reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> > +     if (IS_ERR(reset))
> > +             return dev_err_probe(dev, PTR_ERR(reset), "failed to get =
reset\n");
> > +
> > +     if (reset) {
> > +             ret =3D reset_control_reset(reset);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "failed to reset d=
evice\n");
> > +     } else {
> > +             ret =3D ads112c04_write_cmd(client, ADS112C04_CMD_RESET);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
>
> Also a comment here?
>
> > +     fsleep(1 * USEC_PER_MSEC);
>

Added.

Thanks,
Kyle Hsieh
