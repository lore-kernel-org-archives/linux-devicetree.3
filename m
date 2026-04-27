Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E53AF670
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 23:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777331233; cv=pass; b=JgceNOHJJBuNgoIUzdjox71mZaYA25Mf4/VUt3gtwQAnOpDADsUyZnyj8kT0p0p2krX523eyy8DB0g5GffR/VdWQshkyMgiwq0hTGKHuagW/NtnYzcnG07ATGGMr9RIICC4rmcTzf4mqbjfUK2fMVhHCRE+tXfi4KSN+jP0w5nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777331233; c=relaxed/simple;
	bh=jMwRezerLVOjcjKD9N+5SgI9ddtVAq1JK9sjY2ne3ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLnYKVBr3ZJ4pzEZ5JJelE0snXXOx/owgITnLmHijP3GHnl5oZ6LP6LMoBimBBmwc/+8x5IPp/G5lQ3esNVZzMM8oY3XEceNLXgzlWO/kr/n0lUQijMT6OCI51Uazzjjjj78ZNbX9/iGZYMNmqi6o+DYEZC7XdSxXc1Rk0tBhIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKPOy0rO; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKPOy0rO"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c1a170a50so13587513c88.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777331230; cv=none;
        d=google.com; s=arc-20240605;
        b=i9Jhckz1V+HpQ67PTTIcWgdZpK8NanJ/rMQs+YdX55bapfI19yXQCXvBNd3jG949uf
         3/fgXvMeYeqTxmWu75eVl6zg8HfYYe1NwoIvoeqftC6yJONryjyKZJBti4FxXnY9jaaF
         mxjIjuZu3he9MZ6kJUfVWFScrtD5FDtEF7KV+ficHOoqU0RgJaeJjBttMFOddYDwjrDr
         8ERs9oVhAemuc7ILi/C2dLDo4gEomnMSzOxNVtqhZRF9iGnO3vK+zLHyC9u12KgGHagE
         wotKcI+5e23BgKJV67aHRENS65ZO/L6jHfHfKX0bK2JtMD4ZTx7k9YBaS1IEhKtsEy7f
         HpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R82R2Yyg9rF7lX21cLco26ggU04BsqeoMAHaBF23ZQs=;
        fh=rrLyo27DJgf+FiGOqzcP2ThJDQo6aCrRx/flw7XQg8I=;
        b=YMOhslaGx6dpHzA2+xzTVEWhQu3xLfCX2VuX67/HZH0yvUw+GQHL9pGnALRl+bH3Nh
         KeXNAYiTDySNJogCOVFgsknc1Al/iMLvrT4GmmBRCg+qogeGPyvVO2U/sDsuTWbKzadM
         bTXxn9HdnKpafMRKnxMt2VIpWeSowNcN21Cxho87J4auL3eMjpAsOugf4Qibkg0IJ+S6
         PpVuEYRpslv+1UEpNBQ5f38zfcvXefdNCdMX/zRiI5VLzjYsm9j2q+FESM1cuD/8w42T
         F5Jt9ULiBECMAkzfKZ3voLHxii88DqyHC7hcO2Lqk+8JJTwc3JqDA8AWldLWMIeb/Kae
         Ch4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777331230; x=1777936030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R82R2Yyg9rF7lX21cLco26ggU04BsqeoMAHaBF23ZQs=;
        b=gKPOy0rOvXVA4zw01/6MG6oTdj/f2FhNPpk98/HbikET942a2sS25xdIpb8eigFE/T
         VOhcDxTtIizhAF/WdjMqBq9cdwi4eqU+0BkchQHi2SUhZpWiM8W+Kusys5vkUvb/Rgr3
         UCm/UxH1O2lBYARLSR0nqxyYVS2pGwLO8bVlRKrJUnKTc4IWD7D3BO25siylys/W0UWY
         SBrodM7uQxoW/XVpxpQqeKHAFhPwErfNhdKSh6FMvHKcnP4awpVOvF2FXfxdpLvQ4Y1C
         1uTOCvBUJxzSTa5oSMuPKKxgLcnDxKD1CGudJvpxL5paG8QFu37sSj871UyIYv3iBTex
         j7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777331230; x=1777936030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R82R2Yyg9rF7lX21cLco26ggU04BsqeoMAHaBF23ZQs=;
        b=hSQEyuVm750UFrU9vJFsvnOP51L56wfgv0JRBKZBhcgtevrrIMKNgqXygRoBMRnJhS
         wCzQL2zDxR4G7MZpM+MavG2y3RGHIf2p/3GeTH22pqlIGxqLHd/qgz5eksTO0MHo2tAh
         SzS903BwzKEz7pGM+q93Wef2PTipDf/58VsRL3cB7OQDoKETvtgiCO4S8Xu99Nj0ih8W
         xzRRnTu7BOoYJrL46UuCVC7ItuA5e9dJydoyo1pTDlq3nximUbEsa66eibZEqbyQzLbC
         R6/BobKlLklCswmmrSq5RCTHec3HkuInT0xMn6WfNO5kiHvBz8TX6wTUXHy/QN1nI3CT
         uo8g==
X-Forwarded-Encrypted: i=1; AFNElJ+9vJaLL2XakRkoCZAg8r2TzFspffyRj8RgYUuYAP7aNFQ9/yQz9hj8ih78QWdcHh7mSi01O/uFbjEj@vger.kernel.org
X-Gm-Message-State: AOJu0YwZOuwfrvMcW/qyaxE1yzST+LkVDSQLJl3B/Lc3YXGnc/TQkKNd
	7Y4ZKbaVkoTURbwtnpGFJmZJzjVMDVZJOJNnpSk9zZxDD+yzoW/ND0n4XbzuFn/jQyM3w++S4J2
	94+H81t7f1K+akT2XKmThyaoUwzy140WcWp4S
X-Gm-Gg: AeBDiesNlEzsgY6plOkG8N0sFuejd21TbBnO/5Yp9Idf2YEe8PVFF8cm7iAKNXzuRLP
	thSxG27f4sY/OHhLoXsDUzXyXEE/9oO0LCInQz5m14qLwO1pPk2GJCnSxwnEvKEdP8WVU4VXHfY
	fku3f1dr5DjCGuKQQr/xPHQzx/X/3vWtolWpyBhtoG1gdUbUDksGawipEdWJRsOGaYhvlOkldvY
	l7RFimxR4YJHJOP2f81SzqOXTIB7ACXHPSKlgmInOpv6+2xJu3RqzOhJUlzjbTZ4rgiMJjpABH+
	3LLn1tcfWVaNumHM+9KtuXExFadfkdziD/ugd6f2aFTz3qQtr9BbI5eEkeWYZda9nEP4WBEuK5A
	fqTM=
X-Received: by 2002:a05:7022:522:b0:12a:6a64:81d9 with SMTP id
 a92af1059eb24-12ddd977cc0mr393622c88.13.1777331229410; Mon, 27 Apr 2026
 16:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
 <20260427100950.33936-8-piyushpatle228@gmail.com> <ae90BqnY6_dhRn1F@ashevche-desk.local>
In-Reply-To: <ae90BqnY6_dhRn1F@ashevche-desk.local>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 28 Apr 2026 04:36:30 +0530
X-Gm-Features: AVHnY4KTMf2oV28K7iHeZup8qcgMgQ5fhyhgs17989uPODfe3A3iJIhRUYEqFP0
Message-ID: <CAMB+xkYWR5ny51RgHTWfardKFKhZcAo_zyALAjqt-Me8hL8gxw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] iio: adc: hx711: add support for HX710B
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: ak@it-klinger.de, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 8:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Apr 27, 2026 at 03:39:38PM +0530, Piyush Patle wrote:
> > Add support for the AVIA HX710B ADC, which shares the HX711 GPIO
> > interface but has a fixed gain of 128 and uses trailing PD_SCK pulses
> > to select the active channel rather than the gain.
> >
> > The HX710B has three operating modes controlled by the trailing pulse
> > count after the 24 data bits (Table 3 in the HX710B datasheet):
> >   25 pulses (1 trailing): differential input at 10 SPS
> >   26 pulses (2 trailing): DVDD-AVDD supply monitor at 40 SPS
> >   27 pulses (3 trailing): differential input at 40 SPS
> >
> > Model the HX710B with its own hx710b_chan_spec[] and hx710b_iio_info.
> > Store the trailing pulse count in chan->address so hx710b_set_channel()
> > can switch channels without a separate lookup table. The supply monitor
> > uses .channel =3D 2 to avoid aliasing the channel2 terminal (index 1) o=
f
> > the differential pair.
> >
> > The HX710B has a dedicated VREF pin for the ADC reference voltage. The
> > driver tries vref-supply first; if absent it falls back to avdd-supply
> > (for boards where VREF is tied to AVDD). The HX711 uses AVDD as its
> > reference and is unaffected.
> >
> > Add fixed_gain and fixed_gain_val fields to hx711_chip_info to carry th=
e
> > gain into the scale calculation. Store a per-instance scale in
> > hx711_data for HX710B and use it in hx711_read_raw() when fixed_gain is
> > set. Update hx711_reset() to reset channel_set on HX710B after a
> > power-down cycle.
> >
> > Enlarge the trigger buffer from 2 to 3 channels plus a pad word to keep
> > the timestamp naturally aligned; HX711 continues to use only the first
> > two slots.
>
> So, missed types.h should be in this patch.
>
> ...
>
> >  /**
> >   * struct hx711_chip_info - per-variant static configuration
> > - * @name:         IIO device name
> > - * @channels:     channel specification array
> > - * @iio_info:     IIO info ops for this variant
> > - * @num_channels: number of entries in @channels
> > + * @name:          IIO device name
> > + * @channels:      channel specification array
> > + * @iio_info:      IIO info ops for this variant
> > + * @num_channels:  number of entries in @channels
> > + * @fixed_gain_val: fixed PGA gain (used when @fixed_gain is true)
> > + * @fixed_gain:    true if the variant has a fixed ADC gain (e.g. HX71=
0B)
>
> No, make sure there will be no '-' lines here.
>
> >   */
>
> ...
>
> >  struct hx711_data {
>
> >       int                     gain_set;       /* gain set on device */
> >       int                     gain_chan_a;    /* gain for channel A */
> >       int                     gain_scale[HX711_GAIN_MAX];
>
> > +     unsigned int            channel_set;    /* HX710B active channel =
*/
> >       const struct hx711_chip_info    *chip_info;
> > +     unsigned int            scale;          /* HX710B fixed-gain scal=
e */
>
> Semantically the scale is closer to the above gain_* ones AFAICS.
>
> >       struct mutex            lock;
> >       /*
> >        * triggered buffer
> > -      * 2x32-bit channel + 64-bit naturally aligned timestamp
> > +      * up to 3x32-bit channels + pad + 64-bit naturally aligned times=
tamp
> >        */
> >       struct {
> > -             u32 channel[2];
> > +             u32 channel[3];
> > +             u32 pad;
> >               aligned_s64 timestamp;
> >       } buffer;
> >       /*
>
> ...
>
> >  static int hx711_reset(struct hx711_data *hx711_data)
> >  {
> > +     const struct hx711_chip_info *info =3D hx711_data->chip_info;
> >       int val =3D hx711_wait_for_ready(hx711_data);
> >
> >       if (val) {
>
> The rule of thumb is to split definition and assignment for the variables=
 that
> are going to be validated.
>
> Here I expect to see
>
>         int val;
>
>         val =3D hx711_wait_for_ready(hx711_data);
>         if (val) {
>
> But since it's not related directly to this change, make a preparatory pa=
tch.
> Because now with two variables this looks worse and adds more potential t=
o be
> mistaken in the future.
>
Will add a preparatory patch before the HX710B patch that splits
int val =3D hx711_wait_for_ready(hx711_data) into a plain declaration
followed by a separate assignment.

>
> > +static int hx710b_set_channel(struct hx711_data *hx711_data,
> > +                           const struct iio_chan_spec *chan)
> > +{
> > +     int ret;
> > +
> > +     if (hx711_data->channel_set =3D=3D (unsigned int)chan->channel)
> > +             return 0;
> > +
> > +     ret =3D hx711_read(hx711_data, chan->address);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D hx711_wait_for_ready(hx711_data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     hx711_data->channel_set =3D chan->channel;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > -     ret =3D hx711_set_gain_for_channel(hx711_data, chan->channel);
> > -     if (ret < 0)
> > -             return ret;
>
> > +             ret =3D hx711_set_gain_for_channel(hx711_data, chan->chan=
nel);
> > +             if (ret < 0)
> > +                     return ret;
> > +             trailing_pulses =3D hx711_get_gain_to_pulse(hx711_data->g=
ain_set);
> > +     }
> >
> > -     trailing_pulses =3D hx711_get_gain_to_pulse(hx711_data->gain_set)=
;
> >       return hx711_read(hx711_data, trailing_pulses);
>
> Instead of the above, first split these lines to a helper
>
> static int hx711_set_hx711_channel(..., *tp)
> {
>         int ret;
>
>         ret =3D hx711_set_gain_for_channel(hx711_data, chan->channel);
>         if (ret < 0)
>                 return ret;
>
>         *tp =3D hx711_get_gain_to_pulse(hx711_data->gain_set);
>         return 0;
> }
>
> And name your new function something like
>
> hx711_set_hx710b_channel()
>
Good idea. Will extract the existing gain-switching logic from
hx711_reset_read()
into a hx711_set_hx711_channel() helper in the iio_chan_spec refactor
patch (patch 6), then add hx711_set_hx710b_channel() symmetrically in patch=
 7.
The current hx710b_set_channel() name will change to hx711_set_hx710b_chann=
el()
to match the naming convention.
> ...
>
> > +     /*
> > +      * The HX710B uses the VREF pin as the ADC reference; try vref-su=
pply
> > +      * first and fall back to avdd-supply when VREF is tied to AVDD o=
n the
> > +      * board.  The HX711 uses AVDD as its reference.
>
> I think we use a single space in the comment, but double check that.
> The rule of thumb is to keep the original driver style and change it
> separately if required.
The rest of the driver uses single spaces. Will fix
>
> > +      */
>
> ...
>
> >       /*
> >        * with
>
> While at it, with --> With.
Will fix.
>
> > -      * full scale differential input range: AVDD / GAIN
> > +      * full scale differential input range: VREF / GAIN
> >        * full scale output data: 2^24
> >        * we can say:
> > -      *     AVDD / GAIN =3D 2^24
> > +      *     VREF / GAIN =3D 2^24
> >        * therefore:
> > -      *     1 LSB =3D AVDD / GAIN / 2^24
> > -      * AVDD is in uV, but we need 10^-9 mV
> > +      *     1 LSB =3D VREF / GAIN / 2^24
> > +      * VREF is in uV, but we need 10^-9 mV
> >        * approximately to fit into a 32 bit number:
> > -      * 1 LSB =3D (AVDD * 100) / GAIN / 1678 [10^-9 mV]
> > +      * 1 LSB =3D (VREF * 100) / GAIN / 1678 [10^-9 mV]
> >        */
>
> ...
>
> > -     for (i =3D 0; i < HX711_GAIN_MAX; i++)
> > -             hx711_data->gain_scale[i] =3D
> > -                     ret / hx711_gain_to_scale[i].gain / 1678;
> > +     if (chip_info->fixed_gain) {
> > +             hx711_data->scale =3D ret / chip_info->fixed_gain_val / 1=
678;
> > +     } else {
> > +             for (i =3D 0; i < HX711_GAIN_MAX; i++)
> > +                     hx711_data->gain_scale[i] =3D
> > +                             ret / hx711_gain_to_scale[i].gain / 1678;
> >
> > -     hx711_data->gain_set =3D 128;
> > -     hx711_data->gain_chan_a =3D 128;
> > +             hx711_data->gain_set =3D 128;
> > +             hx711_data->gain_chan_a =3D 128;
> > +     }
>
> Looking at this I'm wondering wouldn't be easier just to have the array, =
but
> feel it with the same data.
>
Yes, agreed.
In v5 I will drop the separate scale field and the
fixed_gain special-casing in hx711_read_raw()
For HX710B, probe will populate gain_scale[] with the same
scale value for all entries based on the fixed gain, and
set gain_set to fixed_gain_val. reusing the existing
hx711_get_gain_to_scale() path without any variant-specific handling.

> ...
>
> > -     { .compatible =3D "avia,hx711", .data =3D &hx711_chip },
>
> > +     { .compatible =3D "avia,hx711",  .data =3D &hx711_chip  },
>
> Why?! This is stray change.
>
Will drop stray alignment spaces.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
