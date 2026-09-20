Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1F314B6E
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789878062; cv=pass; b=Lj0EaS7zGZm4JtNJ9PvICoiTMMYMPY37OpdEXQ9fJu7XHT03BT4WOYnyTIsiS6JvRHC8s5/H8Sutdv8p3vSflyQBDLvHct8hTDzgbVp0mrrhhfv/QkTU+FgIgLfcmROrraQBJqpIcE+6GmLXvwQe0Ikbkg9N0KyFmslqOs38sw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789878062; c=relaxed/simple;
	bh=gYUkzjKioAA+f+7IvuUVsZLVTUD+1nYh7rIkFFjMFEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrGcGGXaLkiqAkLTIiUAa+tnNMffJ3fQn67zDO02OfGHB1pnNave0yWpyp/oT0p+yxTZ5Jq0oJ7zB2DjnqT/BDmGSU9bbOvgRJ7XSNtLL70kwiM53/qtp3cyqY5Uq7sGO5TaaTNmnJdbgG800co0WoRhTivTTcsQmfV662XLYBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRDRY5DX; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRDRY5DX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1798885a91.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789878059; cv=none;
        d=google.com; s=arc-20260327;
        b=XXgmQ9UNq+otxYbqiqK6Pey2xPbXgCSaIfHBuaPHd2DXyksDWcbd937+66kjMovtmp
         SVdy87ofA+/vj01XQvtwzaWSmOXzNrlVQUVeYi5eZk1j2MSsMr8p8TwxjGxTHB2R8aVs
         5RveaSaW0y+sAxk2ZdY45SsByiLI1UxumE0xgqQ9WGrMh0oi+vPQYBkFyuwzVHRr8t9z
         Q8gNx0DrFgNZi2zrAzr56AywwUHD/ZwnPtZkP7crEqaaIrmcyB74Hm7PADEMZpIEJNnq
         BU8Zvc8oHeRcjlY9z0FcV8Wp1WTI+AArRPvT25mhRGM9svi85OwT3ygfCR+tdvH/0Cfx
         Wttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H0rQW/fe8BobSDmFnF0tV0bxHOOXEM5zynZeW/RC42Q=;
        fh=176IzeLBmT+fFLUFuyZPB8z1DGzno0bPSb/6WUTszP8=;
        b=IL6rpfT094nCgTw0KLHbawndrISzks1REimJNkSa6Kduaff7mBwPOPqHcMAUsjjoDh
         GRuhovDjCE5DvuwRbqyCfazvrWNbPlw9rhsGsU5QTD9SnFz/+oQlPCeWLPh93P+PNwxo
         P6mIEgQl5Xgzr7ep8fuVjXQ0XYQUBejEuli9SIa+B8Cls6YV0+sVWp2GK+vCQp/fj1Hx
         qznCwfl4edELgzNa3P2mWKVG+cc8zbWH6hqbShZvvH4aDDZKNzpVE3r/NvPugazQfBLX
         CtLFmzwi4l+1z46SewtMpbu4bxQmdq6c7/NYa4Lq0N321cdza/m6CRJ02ZNjZVPNkN/C
         RVrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789878059; x=1790482859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H0rQW/fe8BobSDmFnF0tV0bxHOOXEM5zynZeW/RC42Q=;
        b=jRDRY5DXbM6JX1Vpm91aGQwdQD/gDiOuxtRbbvVSXnNCKDHwcsblT/NLgx2t299OO4
         BO856YZGqWkYWlFhIrQBAOojDJ6qpdQkvztyhHD1lzZMeqgZscoYrM5RdB7EVpHbjWUu
         wtAaKXAVpkK56xYa0dXtZjANX0MPK9CCL8RXSvQF7bZ1kyX4MF5Y/bNBgPKZ7L58zuwt
         rolKdW5LiHKeKE8mT7FBtfE83JMO6FbDhCJvUrsTetaxroNmx+Nv7zXLCp54WRGwhKGD
         zn2WRleiqHf5Cfxdtn29sFedDtHxoaJbXSaiW3yxhlYdBvBKGymstpOjy2CRTOTHwxId
         P8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789878059; x=1790482859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0rQW/fe8BobSDmFnF0tV0bxHOOXEM5zynZeW/RC42Q=;
        b=qcO2hBM6GHMAjVQlkQJwxD/JouSGHFUIhYOzsUgfiiq2tYeAjPEdNJ/q2gGm3lvacU
         sLlVDqJ2h59ii0mZrhBl31HdxVTi8DZ9jUphLogBQDlU2j09qJ7moPMsLILxxU+wBxIr
         avRFjg/wpChn8S9M5sGfVH7Zm6gRhClmaBBmjMhom2yVD8wqXHInjyvorQYVp8uDwoDj
         lwb3RmIqeODZgKZdHpYGyuTkE+Y/9NsJNvJ3KorAMNljaJl5NzGPBzp03XekOFze17Ae
         l0DoMCSv/eU2f0DlpkNhS0sJDS/Zmipg14ld+M4QaimoxSVlfywegVKfTkMwS4guZcMD
         I14g==
X-Forwarded-Encrypted: i=1; AKwUvBxI4HYViHr5ACEIMuE1DLLBwLRK1CJSoM9lml4rA7IONJgW9KCpPVU5SbaN5j79L7aIZzSK8pJ0++Ad@vger.kernel.org
X-Gm-Message-State: AFuF++lRBTtdOuZ2CY+oUz6lyyMOeVO2NJNLf1r1pisgau6dyUfx6yiM
	ECjnfI02tOdnu14k+aY20JMLEBnTn3eSWPUlXqtmWlDNX09Er9jfmeKUtB+nnBj6xOY3MEgY2ID
	LIPqW5Lr/l2a0sRR4fTYbGPX1rl3PmIo=
X-Gm-Gg: AYBFou1z2fy5MiROSCvGSpbPGFV1xwonYN7Et2Laje0Em6kT6FxvyNAVDrhp6vN+XPS
	gQcmMt7WZ8AfJs4yMOUfCA38rDNhr5gYFi8P/ZDseJaAqDHS9+4gMHbzLYMyDLavUZ2/Tl3wOrv
	0bCmswWeiwXZxwDGD1FzHFfJ7HxJOEg3Rt0e9S1iCjdWZWTvZikuFGvTmiL9w/lnAVrCNUfAkju
	3KeqicmVC9z5hTwayOgIZiV6C16TU4tCPMVXmrdEGDCcudxHd3NOo23mNpH6wttSTn9yOCpPbLB
	5enB2eYCARnHr2GexjrLRaLLc9e5JYKc67NGCkFpbIelwxBXPCIUrPHUnQfOpogm7DA2dBe46YX
	5IrC5LH5ZtRZz6YcHeXOUNGSDqJioaW2aXSqNExns
X-Received: by 2002:a17:90b:4a85:b0:39e:6a80:dd9b with SMTP id
 98e67ed59e1d1-39e6a810c53mr5806147a91.34.1789878059055; Sat, 19 Sep 2026
 21:20:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <c88d0ced0bff5cf29e765cd2c280ce3c10c50988.1789753020.git.kimjinseob88@gmail.com>
 <20260920030352.62526119@jic23-hlaptop>
In-Reply-To: <20260920030352.62526119@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:20:50 +0900
X-Gm-Features: AcwNN1XwUMOHO7d-HTPl9R3DieB_QiBkB93sTGZ-NwPkf20y7940qgwv84fQjLA
Message-ID: <CALMSewLa+UF6khnZDNC+kPJz7EXx9PtCud75UE28_4sZb6CSsg@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] iio: osf: add IIO devices from capability reports
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Using an extra lock is one solution I suppose to the risk
> of this racing with the buffer tear down and the problems
> around active_scan_mask being freed. Could you use
>
>     if (iio_device_try_claim_buffer_mode(indio_dev))
>
> and later a release on that to achieve the same result?
>
> Only the ade9000 is doing similar at the moment so would need
> some testing to make sure no lock inversions occur in general
> but given you don't take any other locks in here it should be fine.

I think that should be a better fit here. I'll test replacing the
private buffer lock and active flag with
iio_device_try_claim_buffer_mode() , iio_device_release_buffer_mode(),
including the existing buffer disable/unregister race coverage and
lockdep checks.

If that confirms the expected serialization against buffer
reconfiguration, I'll use that approach in the next revision.

Thanks,

Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 11:03, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:44 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Register IIO devices from supported capability descriptors and expose
> > signed raw samples, descriptor scales and software buffers. Keep early
> > capabilities owned by the core until UART and supply setup is complete,
> > and unregister children after the receive producer has stopped.
> >
> > Validate nonzero descriptor scales and sample/descriptor equality, leav=
e
> > discovery open after empty or unsupported inventories, and compare
> > repeated descriptors independently of order. Fault a bound session if a
> > descriptor changes meaning, gating cache and buffer publication togethe=
r.
> >
> > Add initialized active-scan packing and buffer producer quiescence. The
> > production implementation is now complete; subsequent patches only add
> > the existing core and IIO KUnit suites and their build wiring.
>
> No need to talk about what other patches do and that a series is function=
ally
> complete in a patch. If you want to do it, under the --- so it doesn't en=
d
> up in the git log.
>
> >
> > Assisted-by: LLM
> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
>
> A few things inline.  Biggest one is a question (I'm not sure) on
> whether you can use a claim on buffered mode (which will hold it in that
> if it succeeds until released) is sufficient to replace the extra lock yo=
u
> have to block that transition.
>
> Thanks,
>
> Jonathan
>
>
>
> > diff --git a/drivers/iio/opensensorfusion/osf_iio.c b/drivers/iio/opens=
ensorfusion/osf_iio.c
> > new file mode 100644
> > index 000000000000..f4011b8fae14
> > --- /dev/null
> > +++ b/drivers/iio/opensensorfusion/osf_iio.c
> ...
>
> > +
> > +struct osf_iio_scan_3axis {
> > +     s32 values[3];
> > +     u32 padding;
> No needed unless you explicitly write into padding for some reason.
> C rules add it anyway and then we don't need to make sure it remains
> correct if this structure changes in future.
> > +     aligned_s64 timestamp;
> > +};
> > +
> > +struct osf_iio_scan_1axis {
> > +     s32 value;
> > +     u32 padding;
> As above, unneeded.
> > +     aligned_s64 timestamp;
> > +};
>
> Given I think these are only used in one place, moving them to there woul=
d
> avoid need for named structure types.
>
> > +
> > +#define OSF_MOD_CHAN(_type, _mod, _idx)                              \
> > +     {                                                               \
> > +             .type =3D (_type),                                       =
 \
> > +             .modified =3D 1,                                         =
 \
> > +             .channel2 =3D (_mod),                                    =
 \
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),          =
 \
> > +             .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),  =
 \
> > +             .scan_index =3D (_idx),                                  =
 \
> > +             .scan_type =3D {                                         =
 \
> > +                     .sign =3D 's',                                   =
 \
> > +                     .realbits =3D 32,                                =
 \
> > +                     .storagebits =3D 32,                             =
 \
> > +                     .endianness =3D IIO_CPU,                         =
 \
> > +             },                                                      \
> > +     }
> > +
> > +#define OSF_CHAN(_type, _idx)                                        \
>
> Given this is not much used, you could use the IIO_NO_MOD modifier as a g=
ate
> on setting .modified =3D (_mod !=3D IIO_NO_MOD) ? 1 : 0,
> and have just one macro.
>
> > +     {                                                               \
> > +             .type =3D (_type),                                       =
 \
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),          =
 \
> > +             .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),  =
 \
> > +             .scan_index =3D (_idx),                                  =
 \
> > +             .scan_type =3D {                                         =
 \
> > +                     .sign =3D 's',                                   =
 \
> > +                     .realbits =3D 32,                                =
 \
> > +                     .storagebits =3D 32,                             =
 \
> > +                     .endianness =3D IIO_CPU,                         =
 \
> > +             },                                                      \
> > +     }
> > +
> > +static const struct iio_chan_spec osf_accel_channels[] =3D {
> > +     OSF_MOD_CHAN(IIO_ACCEL, IIO_MOD_X, 0),
> > +     OSF_MOD_CHAN(IIO_ACCEL, IIO_MOD_Y, 1),
> > +     OSF_MOD_CHAN(IIO_ACCEL, IIO_MOD_Z, 2),
> > +     IIO_CHAN_SOFT_TIMESTAMP(3),
> > +};
> > +
> > +static const struct iio_chan_spec osf_gyro_channels[] =3D {
> > +     OSF_MOD_CHAN(IIO_ANGL_VEL, IIO_MOD_X, 0),
> > +     OSF_MOD_CHAN(IIO_ANGL_VEL, IIO_MOD_Y, 1),
> > +     OSF_MOD_CHAN(IIO_ANGL_VEL, IIO_MOD_Z, 2),
> > +     IIO_CHAN_SOFT_TIMESTAMP(3),
> > +};
> > +
> > +static const struct iio_chan_spec osf_mag_channels[] =3D {
> > +     OSF_MOD_CHAN(IIO_MAGN, IIO_MOD_X, 0),
> > +     OSF_MOD_CHAN(IIO_MAGN, IIO_MOD_Y, 1),
> > +     OSF_MOD_CHAN(IIO_MAGN, IIO_MOD_Z, 2),
> > +     IIO_CHAN_SOFT_TIMESTAMP(3),
> > +};
> > +
> > +static const struct iio_chan_spec osf_temp_channels[] =3D {
> > +     OSF_CHAN(IIO_TEMP, 0),
> > +     IIO_CHAN_SOFT_TIMESTAMP(1),
> > +};
> > +
> > +static const struct osf_iio_sensor_spec osf_iio_sensor_specs[] =3D {
> > +     {
> > +             .sensor_type =3D OSF_SENSOR_ACCELEROMETER,
> > +             .channel_count =3D 3,
> > +             .name =3D "osf-accel",
> > +             .channels =3D osf_accel_channels,
> > +             .num_channels =3D ARRAY_SIZE(osf_accel_channels),
> > +     },
> > +     {
> > +             .sensor_type =3D OSF_SENSOR_GYROSCOPE,
> > +             .channel_count =3D 3,
> > +             .name =3D "osf-gyro",
> > +             .channels =3D osf_gyro_channels,
> > +             .num_channels =3D ARRAY_SIZE(osf_gyro_channels),
> > +     },
> > +     {
> > +             .sensor_type =3D OSF_SENSOR_MAGNETOMETER,
> > +             .channel_count =3D 3,
> > +             .name =3D "osf-magn",
> > +             .channels =3D osf_mag_channels,
> > +             .num_channels =3D ARRAY_SIZE(osf_mag_channels),
> > +     },
> > +     {
> > +             .sensor_type =3D OSF_SENSOR_TEMPERATURE,
> > +             .channel_count =3D 1,
> > +             .name =3D "osf-temp",
> > +             .channels =3D osf_temp_channels,
> > +             .num_channels =3D ARRAY_SIZE(osf_temp_channels),
> > +     },
> > +};
> > +
> > +static const struct osf_iio_sensor_spec *
> > +osf_iio_find_sensor_spec(u16 sensor_type, u16 channel_count)
> > +{
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(osf_iio_sensor_specs); =
i++) {
> > +             if (osf_iio_sensor_specs[i].sensor_type =3D=3D sensor_typ=
e &&
> > +                 osf_iio_sensor_specs[i].channel_count =3D=3D channel_=
count)
> > +                     return &osf_iio_sensor_specs[i];
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +bool osf_iio_sensor_supported(u16 sensor_type, u16 channel_count)
> > +{
> > +     if (osf_iio_find_sensor_spec(sensor_type, channel_count))
> > +             return true;
> > +
> > +     return false
>
>         return osf_iio_find_sensor_spec(sensor_type, channel_count) !=3D =
NULL;
>
> > +}
>
> > +
> > +static int osf_iio_buffer_postenable(struct iio_dev *indio_dev)
> > +{
> > +     struct osf_iio_state *state =3D iio_priv(indio_dev);
> > +
> > +     guard(mutex)(&state->buffer_lock);
>
> These transistions are already guarded by the core, so see the question l=
ater
> on whether you can just claim buffered mode in the data handler
> to avoid the need for this. That might not work but the way you did
> this got me thinking about a more general solution to the problem.
>
> > +     state->buffer_active =3D true;
> > +
> > +     return 0;
> > +}
> > +
> > +static int osf_iio_buffer_predisable(struct iio_dev *indio_dev)
> > +{
> > +     struct osf_iio_state *state =3D iio_priv(indio_dev);
> > +
> > +     /* Wait for the current push before the IIO core changes its buff=
ers. */
> > +     guard(mutex)(&state->buffer_lock);
> > +     state->buffer_active =3D false;
> > +
> > +     return 0;
> > +}
>
>
> > +
> > +int osf_iio_push_sample(struct iio_dev *indio_dev, const s32 *values,
> > +                     u16 channel_count)
> > +{
> > +     struct osf_iio_state *state =3D iio_priv(indio_dev);
> > +     s64 timestamp;
> > +
> > +     if (channel_count !=3D state->spec->channel_count)
> > +             return -EPROTO;
> > +
> > +     guard(mutex)(&state->buffer_lock);
>
> Using an extra lock is one solution I suppose to the risk
> of this racing with the buffer tear down and the problems
> around active_scan_mask being freed. Could you use
>
>         if (iio_device_try_claim_buffer_mode(indio_dev))
> and later a release on that to achieve the same result?
>
> Only the ade9000 is doing similar at the moment so would need
> some testing to make sure no lock inversions occur in general
> but given you don't take any other locks in here it should be fine.
>
>
> > +     if (!state->buffer_active || !iio_buffer_enabled(indio_dev))
> > +             return 0;
> > +
> > +     timestamp =3D iio_get_time_ns(indio_dev);
> > +
> > +     switch (channel_count) {
> > +     case 1: {
> > +             struct osf_iio_scan_1axis scan =3D {
> > +                     .value =3D values[0],
> > +             };
> As suggested above, this structure type is only used locally here. So
> make the definition local as well.
>                 struct {
>                         s32 value;
>                         aligned_s64 timestamp;
>                 } scan =3D { };
>
> > +
> > +             return iio_push_to_buffers_with_ts(indio_dev, &scan,
> > +                                                sizeof(scan), timestam=
p);
> > +     }
> > +     case 3: {
> > +             struct osf_iio_scan_3axis scan =3D {
> > +                     .values =3D { },
>
> Setting values doesn't add anything useful as =3D { }
> zeros the whole structure (including any holes - they kernel is
> built with specific compiler options to ensure that last bit
> as it wasn't required in older c specs).
>
> > +             };
> > +             unsigned int channel, index =3D 0;
>
> Please split declarations that assign and ones that don't on to separate =
lines.
> Ends up a little more readable.
>                 unsigned int index =3D 0;
>                 unsigned int channel;
>
> > +
> > +             /* Pack the active channels; unused storage remains initi=
alized. */
> > +             for_each_set_bit(channel, indio_dev->active_scan_mask, ch=
annel_count)
> > +                     scan.values[index++] =3D values[channel];
> > +
> > +             return iio_push_to_buffers_with_ts(indio_dev, &scan,
> > +                                                sizeof(scan), timestam=
p);
> > +     }
> > +     default:
> > +             return -EPROTO;
> > +     }
> > +}
>
> > diff --git a/drivers/iio/opensensorfusion/osf_serdev.c b/drivers/iio/op=
ensensorfusion/osf_serdev.c
> > index 8a747c01ff9d..3d5e90d83967 100644
> > --- a/drivers/iio/opensensorfusion/osf_serdev.c
> > +++ b/drivers/iio/opensensorfusion/osf_serdev.c
> > @@ -23,7 +23,7 @@ struct osf_serdev {
> >       bool vcc_enabled;
> >       struct osf_device osf;
> >       struct osf_stream stream;
> > -     /* Protects the parser and all RX counters. */
> > +     /* Protects the parser, all RX counters, and the registration gat=
e. */
> >       struct mutex rx_lock;
>
> Just name it 'lock' given it has scope beyond rx.  Do that in earlier pat=
ch
> though rather than changing it here.
>
> >  };
>
> >
> > @@ -139,5 +144,5 @@ static struct serdev_device_driver osf_serdev_drive=
r =3D {
> >  };
> >  module_serdev_device_driver(osf_serdev_driver);
> >
> > -MODULE_DESCRIPTION("Open Sensor Fusion UART receiver");
> > +MODULE_DESCRIPTION("Open Sensor Fusion IIO driver");
>
> Just have that being slightly missleading in earlier patch to reduce chur=
n here.
>
> >  MODULE_LICENSE("GPL");
>
