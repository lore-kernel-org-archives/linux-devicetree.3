Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BFB37F305
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593866; cv=pass; b=E5tbvvuIat9ss5qfSYVahIJSCOHlxV2IKleOUBXjoNT3XKwDezMBP+UNoTBTsqh8SO3EqA/HAxVBsIezUI4ZPgaz2ooLYElXMQs+72xdBKJ3CRwTwlSB0uw4x8nMu527qD8NVSN/hxQNfKfBqLEVffGnsYlYWjZz5MsqTEWPG4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593866; c=relaxed/simple;
	bh=JmVOmQAfuc9t3Q2sQM7LHcrIhrhwru9wPUqm4XULBl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OViiLendetqVIOOIrNIONkUt9iGIIGvzdbMUr7rJLC/Q1mXv06IbZlyyUnNyRp2XsNQeoVs63Ff7sXqWsXq7sRZnLNC1QcVNXZ/K4d5hUHfcSTqqGKiPvNw2rDFZbMgojuve9Vdox1EKqYYPr7Xf+qaO4IdG+xNbIJdMtRLo03U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=L9SYbnan; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="L9SYbnan"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-44cb057311bso3494356fac.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787593863; cv=none;
        d=google.com; s=arc-20260327;
        b=mcCSfH74Rs+Ubxe0vBzXlgj/qW+FYiUu4fLa6b9/KmVQEidOrtyhuyq5LNWYuB4vpN
         kTEZ5hc+UamRqVG6H7bBm5Bfr+kphIkMHBL/eREBbbgew3LGvH25rT6QdYyQL13+ocNe
         kHDgYthQrfNgty9p1K6+QrEwCUvjLbVwNWNRALxvUYTBT+2lgfos1mm+nePRMTC0nYBc
         uF/WUXD37AKDA4qD/FpEDPXmKMndvGcHyVQAGacefm7mM8MKQ4pI0DPYxyO080upKPWA
         6eKP82F2B3VjqM7fzy0VJjlgBg1xFKdnx1gF2cJJIodJGTY7zqWV0knAx08qrwk/1Cko
         412A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=368dgGXu/NgX5l7Y6iSl/tG/Vts2sR8oGKwLQvpP0vE=;
        fh=bMXQgZmMpt0/8sYo2g84kvtTQFjwiKbN7OwXV6b/X6k=;
        b=MY2QRM8cCDZA3MKnzKWmFaCnZxb1ozWFJhLQvmh4YGAQmJwFEP38txPzVO7xkihNa/
         fu6tx+Ki7cWSynLRv497Eqsm0sJdtzWATUrLBE+ANkQ0lH0pgWZAw6GIVWr/Y3AtYkEC
         uL1HDxH0McYd31DVc3IQy0cSPNftLTU6e/EZPy80Jv0wBOxKECwcUlNpAci50wSIOIZV
         FYZRDaYozXN3tQf97KpZxn+/JCIezbpdRz8HmxNGGcDV8eJORf8xGp6p3DqGH8xu4pXC
         B4IIAx1EyeavbZRmDQWhmDjAI3k/zQKHOAZZeAgPJ6qWWl1eaAIF/N7LwRBmQYY2zSZv
         MnVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1787593863; x=1788198663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=368dgGXu/NgX5l7Y6iSl/tG/Vts2sR8oGKwLQvpP0vE=;
        b=L9SYbnan3gAfObr+vhP+iO1fOHNoKca9+L2ku7s88NjA+nqGDZcg5mwlIJbUn8+YAM
         P5Oxgb/8wMMU+eQmT4zRun2I7NSDPFD/1l/kKvHPZLc4urxXxMonVyQvRA9YKXC1X/mI
         BoIuKieOJz4gbwCcfXUsZSjvA/d5rd2pBngJMN/5JNwT1kvlFLQY6s6XkkXSeBeAcrJV
         Y4V0peRuGeAsr5h0doxFUdoEwIkY9zQl6hhhl8J3W07rR1Y+QhNyI+1/ZxukNRmTr719
         rkeRxn9E8j9p49DdC5rrxl9d2W3XJr0Fb4NCTeV01YarRLYv/yUqpXxy4X8vXzxT26LE
         rfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593863; x=1788198663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=368dgGXu/NgX5l7Y6iSl/tG/Vts2sR8oGKwLQvpP0vE=;
        b=Gsyq9hQo3ejaq2cfCAc1xkZZFi5Gz4Ddp2vTy9JD/OPoTys7n3mVG27aAy6FowcYMJ
         VY0J9rv+O26FyO2DbG+vMS5YQnmZY5y6XEmVdsq1wo2nIzWEgpvbJmydDyQXg/FgqkpO
         ge3jzHU/bsloAdANT0tx48wqazZG8VU4FQh2tHJ82rgNcAwmIrwtyJFJCcuKsYZVg385
         SkhJT67S0Gs0+HUdZ5P141qMutYQVP5j4vX3Xw0ORYB44KUQDwBMo676PlMs8AEisECb
         MsHQ7vtc2P3mX9um1CJdWocrW3PRxjdQsC2qBijHr3ROXXbMvXm+NKJpxaUWNnVYQkQL
         Xh9g==
X-Forwarded-Encrypted: i=1; AHgh+RrdapIk8AvvL588Vh1RcaljbvJE0oAYUDl5afRqPvBGpnz/hfpiUHZ2XzWqowvLIESC90DJaX1fBpbM@vger.kernel.org
X-Gm-Message-State: AFuF++mmicuCuIJYXcd/NAchCQF181Rk+psGFV6lbj+hwwtC/GeP/bUb
	lblp1iNiwYZFG+qxq6yolQksbjqNhJp3rxkcgBQ9Aq1wmw36MHD8G/QM5irB8V/CD+Mjp0yGaCZ
	IpK2OhbiJV5/fMCLTj4ryduIBlJNiGGDxtSf3JfYmaw==
X-Gm-Gg: AR+sD138WGSJ6h4r1aCE2Bfv6IVPErpE9mPWJUUFcjYDD/YiY/iQ4K6+rj8kf3V77UV
	mGDo8hV9xoGnzsCDftglJ0steGFHkcGTLgUa++sZi2hwtWQiqe9G6TB5hifq6LR/LSGnftLjwMB
	wUgU4I36y7tQxf5y+V7op4DlfNInfIDZjEWm32ZXz5V7KN6Yph3WzH5tB7L7ydiP2oxz/2Kswy3
	hdbHDWQ7nigXomwbCN+bx8ZkbrjQrbFmzGpIbMKbgzqwM7edPdzh2zzoqGNWeE16aypWLX0S+Kg
	NJusXjob93jVa5kas+2oj7ZLGTiB0jbQX6eGxteXrx5/BUb2LI4baH/ky0k7K/+HMofMka2RN9U
	poJKmaDGg8gy0DI7cd866cIvwwbUkd9x0oq1yiUSu8GSnCyLAzvbvqw1iaKED0Q==
X-Received: by 2002:a05:6870:16ef:b0:455:a590:7ff1 with SMTP id
 586e51a60fabf-46351715cb1mr26016442fac.15.1787593862727; Mon, 24 Aug 2026
 10:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-3-lachlan.michael@sony.com> <CAPY8ntCHzT1H3Qpbi9WpAbZc-fY0ezDxLc93jxnD1v+OCNbh0Q@mail.gmail.com>
 <OS7PR01MB17833AD851D9272D1E1CE9AA592A72@OS7PR01MB17833.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB17833AD851D9272D1E1CE9AA592A72@OS7PR01MB17833.jpnprd01.prod.outlook.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 24 Aug 2026 18:50:46 +0100
X-Gm-Features: AcwNN1U5A5aKnLmX9a8fgHDHSyFVT6hoslmGpLyFs4JyttXBm4z_WhpxCSVOaMM
Message-ID: <CAPY8ntC2Wk2PuSk7sKR8J-ARRZJj+po1aEjapOOjNTcj7ew=2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: "Lachlan.Michael@sony.com" <Lachlan.Michael@sony.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, 
	"jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>, 
	"Ryuichi.Tadano@sony.com" <Ryuichi.Tadano@sony.com>, 
	"Kengo.Hayasaka@sony.com" <Kengo.Hayasaka@sony.com>, "Bird, Tim" <Tim.Bird@sony.com>, 
	"Kazumi.A.Sato@sony.com" <Kazumi.A.Sato@sony.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lachlan

On Mon, 17 Aug 2026 at 10:21, Lachlan.Michael@sony.com
<Lachlan.Michael@sony.com> wrote:
>
> Dear Dave,
>
> Thanks for your review.
> I was on summer holidays last week so sorry for the delay in replying.
>
> >Hi Lachlan
> >
> >These comments are made without having access to the datasheet or
> >software reference manual (I have requested them), so are based on my
> >experience of other Starvis sensors. Feel free to dismiss them if not
> >applicable to this sensor.
> >
> >And some are personal preferences, so feel free to disagree there :-)
> >
> >On Thu, 6 Aug 2026 at 08:12, Lachlan Michael <lachlan.michael@sony.com> =
wrote:
> >>
> >> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> >> with a MIPI CSI-2 output interface, configurable as either 2 or 4
> >> data lanes.
> >>
> >> Add a V4L2 sub-device driver for the sensor. The driver supports
> >> RAW10 and RAW12 output formats, exposure and analogue gain controls,
> >> horizontal and vertical flipping, horizontal and vertical blanking
> >> controls, window cropping and test pattern generation.
> >>
> >> HDR modes and RAW16 output are not currently supported.
> >>
> >> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
> >> ---
> >> Changes in v2:
> >> - Treat the pixel rate as a fixed sensor property (594 MHz, 8 px/clock=
),
> >>   read-only.
> >> - Compute HMAX from both the array and MIPI link floors.
> >> - Express HBLANK in pixels with a step of 8; keep HMAX fixed in crop
> >>   mode.
> >> - Drop struct imx908_mode; cache hmax/vmax directly.
> >> - Change the link-frequency table to s64.
> >> - Fix the probe error-unwind ordering.
> >> - Be silent on success (chip ID print is now dev_dbg).
> >> - Drop redundant comments.
> >> - Kconfig: fix a "module will be called" typo.
> >> ---
>
> <snip>

<snip>

> >> +/*
> >> + * Link (consumer) floor: the line period must be long enough for the=
 MIPI
> >> + * burst (width * bpp bits) to drain over num_lanes * link_freq * 2 (=
DDR).
> >> + */
> >> +static u32 imx908_calc_link_min_hmax(struct imx908 *imx, u32 width, u=
8 bpp)
> >> +{
> >> +       u64 link_hz =3D imx908_link_freqs[imx->link_freq_idx];
> >> +       u64 num =3D (u64)width * bpp * IMX908_XHS_HZ;
> >> +       u64 den =3D (u64)imx->num_lanes * link_hz * 2; /* DDR */
> >> +
> >> +       /*
> >> +        * den can exceed 32 bits (e.g. 4 lanes * 720 MHz * 2 =3D 5.76=
 GHz), so
> >> +        * DIV_ROUND_UP_ULL / do_div would truncate the divisor to u32=
. Use a
> >> +        * full 64/64 division.
> >> +        */
> >> +       return DIV64_U64_ROUND_UP(num, den);
> >
> >It's unlikely to make that significant a difference, but don't you
> >need to account for the LP to/from HS transitions on the MIPI link?
>
> A more accurate minimum is really drain_time + framing + LP/HS_transition
> and you're right that here I am only calculating the drain_time. It's mea=
nt as
> a safe lower bound for the HBLANK range rather than an exact line time.
>
> At 1440 Mbps/lane (720 MHz link) for 4K RAW10 the floor is about 495
> clocks (~6.67 us):
>  - CSI-2 packet header/footer is 48 bits on top of width*bpp, ~0.1%.
>  - the LP/HS transition, from the D-PHY timings, is a few hundred ns per =
line,
>    ~7% of the floor at 4 lanes (~3% at 2 lanes).
>
> Both terms are strictly positive, so folding them in only ever raises the=
 floor,
> so this is more about accuracy than safety.
>
> Given that, do you suggest I should add in the packet framing and/or the
> LP/HS transition into this floor, or is it ok to leave it as the payload-=
only
> bound (as-is)?

As long as the calculation gives a value that is expected to work,
then that's fine.

> >> +}
> >> +
> >> +/* HMAX must satisfy both the array (producer) and link (consumer) li=
mits */
> >> +static u16 imx908_calc_min_hmax(struct imx908 *imx, u32 width, u8 bpp=
)
> >> +{
> >> +       return max(imx908_calc_array_min_hmax(width),
> >> +                  imx908_calc_link_min_hmax(imx, width, bpp));
> >> +}
> >> +
> >> +static u32 imx908_calc_min_vmax(const struct v4l2_rect *crop)
> >> +{
> >> +       /* In window crop mode constrain VMAX (from datasheet) */
> >> +       if (!v4l2_rect_equal(crop, &imx908_active_area))
> >> +               return max_t(u32, crop->height + IMX908_VMAX_CROP_MIN_=
MARGIN,
> >> +                          IMX908_VMAX_CROP_MIN_LIMIT);
> >> +
> >> +       return IMX908_VMAX_DEFAULT;
> >
> >VMAX values in the Starvis datasheets always seem to be "let's give a
> >nice round frame rate", not "this is the minimum that is valid".
> >If run in window mode at 3856x2176 then VMAX would be 2176+70 =3D 2246,
> >so I guess not such a big difference, but default is not the same as
> >minimum.
> >
> >(IMX662 runs quite happily with a margin of 40 which gives an extra
> >10% on the frame rate compared to the default. I ought to check
> >against the datasheet for that one though)
>
> You're right =E2=80=94 2250 is the 30 fps operating point, not a stated m=
inimum,
> but the +70 margin is only given for window-crop mode in the datasheet.
>
> There's no documented all-pixel VMAX minimum, so for crop mode I keep the
> datasheet restriction (height + 70, >=3D 1206) and for all-pixel I leave =
the
> floor at the 2250 default as a conservative bound rather than inferring o=
ne.
>
> I added a comment:
>         /* No datasheet min for all-pixel; use 30 fps default as safe flo=
or */
>         return IMX908_VMAX_DEFAULT;

Any chance you could ask your colleagues?
If height + 70 can be used in all cases then it just simplifies things.

<snip>

> >> +static int imx908_program_window(struct imx908 *imx,
> >> +                                const struct v4l2_rect *crop)
> >> +{
> >> +       bool all_pixel_mode =3D v4l2_rect_equal(crop, &imx908_active_a=
rea);
> >> +       int ret =3D 0;
> >> +
> >> +       cci_write(imx->cci, IMX908_REG_WINMODE,
> >> +                 all_pixel_mode ? IMX908_WINMODE_ALLPIX : IMX908_WINM=
ODE_CROP,
> >> +                 &ret);
> >
> >This one knocks on to several other checks of the active_area / all-pixe=
l mode.
> >Why switch into the pre-defined all-pixel mode at all? What advantage
> >does it give you over always using window mode?
> >
> >To my mind it just gives the possibility that the crop defined in the
> >structure is incorrect, therefore you aren't getting the pixels you
> >thought you were.
> >(I learned the hard way working on IMX675).
>
> All-pixel mode has variable HMAX; in window-crop mode the datasheet says
> to keep HMAX at the drive-mode value, so collapsing to always-window woul=
d
> lose that. The test pattern generator is also all-pixel only. On the crop=
-accuracy
> concern: the advertised active_area (2176) is the datasheet's active heig=
ht, distinct
> from the 2180 effective height (the extra 4 lines are the ignored effecti=
ve-pixel area),
> so all-pixel mode does read out what we advertise.

Not supporting a variable HMAX in window-crop mode rather defeats the
purpose of cropping to reduce the line time and increase frame rate.
Does it really not work? Again can it be checked? Datasheets so often
get copy/pasted from previous versions.

Extending HMAX in all-pixel mode adds the possibility of increasing
the line time and hence allows for longer exposure captures. I haven't
checked the limits for exposure time if HMAX is fixed vs variable, but
I'd be tempted to drop it and make V4L2_CID_HBLANK read only. It can
be revisited at a later date if someone does want extra long
exposures.

The test pattern only working in all-pixel mode is largely irrelevant
as it's only used for test purposes. Trying to gate use of the test
pattern on cropping not being applied starts to get messy.
(I do have the datasheet and app notes for IMX908 now, but none cover
the pattern generator)

Thanks
  Dave
