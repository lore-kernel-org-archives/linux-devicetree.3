Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443276;
	b=W6RmFWALkDYLkk56qqKZoqSMAok7QOZNi3LZzkJ46gxnparH8mpHktyswHlZRurzfRl4
	 4zDOf4cBm5/ySqfH8MiudBOOyaABJ4Gn5FykoYn9yZ3act0pR05RA8RZqsPSb21bUU/kf
	 EWYLk6mQU7s/uV2C47BfOBg4nA5UMzrmXnag0tHqTLmrkZJbRU4+qHLFCBOG+OVmSy9PO
	 LxSCaSiShkWwh7xJbnhgIebTFALJKyheZGDYpiUalU08xgjRX7KflCy8FHhpFdoUHg9Sy
	 Yyn9eBaL+P/aUWkUD/TBwZXw/owrsJvdvdk1JAsfP9AdMb0gzfPoOpQOixMY+VauUDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8IRkRbzaMpbwELBdc3WayrNv0eqStaY6Oo07xiTVssU=;
	b=cDW688YmyT6lbm5sKppteSQ6FWgYFJWD7Om/Npg11UtQjk31MDBD3MkRztf+fpHIrVay
	 ybQrjmXy/J8A3SLB+G6rJokBwtjFD87foHoAlzB1bn7YktoBFr9uAZ/txD5r7nr9rhliP
	 XgqxI7fbLObbjGVu2w2/RXi5fcc2cQu7ArmzWTWiXlKyf3lz1J8g7LuUiB4T5xZKaKU1d
	 kbmRkzA8bbPKEyEyeVcgQjyjAS+kYhCh9Jw4X2QDAmNRuwlFMRkA3CcxDFhyQjvi0cyz5
	 N+QvrvfwKd5DPBgYJst3zLiTVXknKYi9CUi5RwL4bEMYB6rAnPSBDLnLXy5ndcxmv3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVQ7UJlC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0884C606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0884C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVQ7UJlC
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-949680e6d83so315050985a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443275; cv=none;
        d=google.com; s=arc-20260327;
        b=emnxFvP039qC/8/WiwioviVGnhWU4aSEBTkB47TUKlO5+7WWfRKxIGI7q2Ctr5XXDv
         svhQIPoaigKiVM9K7KikwCZqoDvetZygf2Pf02NBlhabLhpfPIMP4wDRkyj8vjOMawl1
         k4osX4KgPJp3ACL4bZxF9KwALQ23Gqs4MHwZj2r+XQZMTWveIv58XWd8sr8QZFSA6ndE
         a/ddbQKZ4/Utv3QKvqukqMXp2sXqOY0XHpWG7xXKmlGQD4dwk3ZX0nhz8oJVsTv7CA9f
         LhXb8DCW7t+gImtzQ7YU81dmEofHWCF3F6KBIjkJWf1PKvm6XqFvUt4iQ0G8S5vmCu4s
         fq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IRkRbzaMpbwELBdc3WayrNv0eqStaY6Oo07xiTVssU=;
        fh=RXbeJ9/aAQRSXg2fFTU5ST0/rVt7SMrNrG0LV8u8Q9U=;
        b=qZ2JUh9AMfOgXQOkIZ2ZdBxOyO55RkpBd49GGPIRQ0HWMDMgAZ+8gPQqSD84wiy0wd
         tyBUf0CusYyeip/ee4/AayYWWsJWIrjizrFDPkkdbrYeT51sX6/zCCGlYp0CjuzZBORR
         I31teeIKtRkuwvGa0GRMnF/oiep9zPicA37YvWKvmy+lMpbfvGymAaLt6H02MOsHKrEr
         02A5W2oqVT6TN0TX6a2jEOpwlRIsoiTHV9XjM78p70IiSIImPiL/inCELBi7fHG6ALmL
         CiRoHysB++gGlTK4PyX2WDCl2FDBP9u0FR6H6TmBvm7eZkYKnvfeS2hpq1PATV6k7p2e
         fVcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443275; x=1796048075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IRkRbzaMpbwELBdc3WayrNv0eqStaY6Oo07xiTVssU=;
        b=pVQ7UJlCgo/i8qIJ5r+TI0bhFO9M/AHBAsMBkclyd5JPDNPNAC1ive6ihMUYtf0gRC
         CcJfFPetUu3bIvXWV/40l1p0yytvFY30H42Yb03nKB0vGILT3FB/1j3mHuAFV+J0eeWz
         rNRCsh2lN2uPcOsLWiLnaBH3E1IgfopAAWEJSXAIYCe7POy9dcsSCE1WetJUJKPEiym9
         ZwJERfMKAxexTWdeRfkv8O6zjjhRzUYWsy2m4kQzXSx7RUqby1pwlA9GziUzQePoRCNv
         qlAQpICwDt3FK6zq/XcNFg4oOSdqC+R86t/m0s/mCJ5ub+GpvrLuDaQyyQg7BHu3EQ/I
         nkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443275; x=1796048075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IRkRbzaMpbwELBdc3WayrNv0eqStaY6Oo07xiTVssU=;
        b=GYtMmZo52LKRVpFUCOUqSqbKmXfomnUNz/GUJUPiBrTXfd1kYUN3gV4gNSQrfqI3hG
         Fv7sy3YLzL5ft4AHhj9JhzkV2v33SXxndGeBmYqGK8moeA6U1n3mqTDug5uh4Ob9YGQQ
         l1X/4HNQxPlrfgM8BxDDDBkPtTtFwS/4+hcXSy0oTRBRxC9X1b2lnbuMgYjTyl74Pd9/
         Fe9YPBjc08QC9tkWIYZOB6D/Il+W5kKEhwDRHbcJDO3k58V6Lj8wQXkV1yNDni/axxEV
         uXyxamik53kjLgSYxm/rOdlfq2rC96mUnefvjz0EdH64iW4miOHNV15yHHaB/s4gmpy1
         VMHw==
X-Forwarded-Encrypted: i=1; AL+hErF6QWLN7VzmVYPBtBWRbJ+EUgOU4qqFmJ11v9zYlLgqCe7qgyoHmhzkKLaW/FUz0RzY5ecS/hcEQ5c9@vger.kernel.org
X-Gm-Message-State: APuU4Z80CP0Zz0jywbUXRjBcLo3Tw7m+onViPKwlgyjj0CkEZl0AUMhR
	KsQN6ky2Q2fF7fJZ5S1Gn4Dz8CoNHVI3QH5wm3pD5oSsvwdziq8d2Mj+qlFSwFdCNm1dRCA33gL
	LUwKu/mRdn9/fSyTQ/KUlEGNWvZIyuzc=
X-Gm-Gg: AZFdTZcreC7gtsSqEJ9WrSZApuquPIgWuSyRl21GQzZ6T8o659fBdagFNHdxE+ytpSm
	nBtk3f9zVLOR9f9T35VB4owo5+1ix26JoF3SZeHpnIt8tCp5gZbNzIHHRfwmR9du2F5cEwmxjBZ
	hq94a8cSCQmyv3TqJGUvvEhoQQ3F4B+/bdIqj9QTtVJtLH0ghtS5jgW3GDYSCOg1jJbSFAWwS8E
	g19nJXlowALL1ulKd0pmRzjOFvT6RElGKkjAOdcoNC4x62MoFpdrHM/TNeSgR59fJBUkkWCPqj8
	G4nTeYI5rkObV9m44eoJXzjG/w8Jgf6MbbXdtqJs4W9XmiWzoDKl9kbqCwdpldxEgkUbH0qY1zJ
	bZrzVvkqy3DF7xjGhEixytcZ1pmnafygFnQgzEwjIld7ilIPrZEM7LWRnHLbD8FJ2PDM=
X-Received: by 2002:a05:620a:4041:b0:949:8307:664d with SMTP id
 af79cd13be357-949ba8239a7mr1762779285a.2.1795443274706; Mon, 23 Nov 2026
 06:14:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com> <20261123123546.152162-4-hikmahgumelar@gmail.com>
 <awRDMjtMC74v5zQq@monoceros>
In-Reply-To: <awRDMjtMC74v5zQq@monoceros>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Mon, 23 Nov 2026 21:14:22 +0700
X-Gm-Features: Aa3M54qIm1JJMDMAkwJOVERPLiDKCTfKydQ0A71fCUKBRcUDp_3D9SJp6eBsw4g
Message-ID: <CADA=zOOYzywVAHhSbYQXyfS3m8SRx4x=S4wNi7vSoQBB6GVRUA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: i2c: add s5k5e8 image sensor driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,
Thanks for the review! I had just sent out v3 right before seeing your
feedback; I will drop <linux/mod_devicetable.h> from both s5k5e8.c and
ov12a10.c in v4 along with any further review comments on v3.
Best regards,
Hikmah


Pada Sen, 23 Nov 2026 pukul 20.56 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> menulis:
>
> Hello,
>
> On Mon, Nov 23, 2026 at 07:35:42PM +0700, Hikmah Gumelar wrote:
> > diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
> > new file mode 100644
> > index 000000000000..80931e5a1c6b
> > --- /dev/null
> > +++ b/drivers/media/i2c/s5k5e8.c
> > @@ -0,0 +1,500 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
>
> <linux/i2c.h> already provides of_device_id, so please drop
> <linux/mod_devicetable.h> (which adds a lot of unneeded dependencies).
>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/unaligned.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +
> > +#define S5K5E8_CHIP_ID_REG           0x0000
> > +#define S5K5E8_CHIP_ID                       0x5e80
> > +#define S5K5E8_REG_MODE_SELECT               0x0100
> > +#define S5K5E8_MODE_STANDBY          0x00
> > +#define S5K5E8_MODE_STREAMING                0x01
> > +#define S5K5E8_REG_VTS                       0x0340
> > +#define S5K5E8_REG_EXPOSURE          0x0202
> > +#define S5K5E8_REG_ANALOG_GAIN               0x0204
> > +#define S5K5E8_REG_TEST_PATTERN              0x0600
> > +#define S5K5E8_XVCLK_FREQ            24000000
> > +#define S5K5E8_LINK_FREQ_418MHZ              418000000ULL
> > +#define S5K5E8_PIXEL_RATE            167200000ULL
> > +
> > +struct s5k5e8_reg { u16 address;
> > +u8 val;
> > +};
> > +struct s5k5e8_mode {
> > +     u32 width, height, hts_def, vts_def, vts_min, num_regs;
> > +     const struct s5k5e8_reg *regs;
> > +};
> > +
> > +static const char * const s5k5e8_supply_names[] =3D { "avdd", "dvdd", =
"dovdd" };
> > +#define S5K5E8_NUM_SUPPLIES ARRAY_SIZE(s5k5e8_supply_names)
> > +
> > +static const struct s5k5e8_reg s5k5e8_common_regs[] =3D {
> > +     { 0x0100, 0x00 }, { 0x3906, 0x7e }, { 0x3c01, 0x0f }, { 0x3c14, 0=
x00 },
> > +     { 0x3235, 0x08 }, { 0x3063, 0x2e }, { 0x307a, 0x10 }, { 0x307b, 0=
x0e },
> > +     { 0x3079, 0x20 }, { 0x3070, 0x05 }, { 0x3067, 0x06 }, { 0x3071, 0=
x62 },
> > +     { 0x3072, 0x16 }, { 0x3203, 0x43 }, { 0x3205, 0x43 }, { 0x320b, 0=
x42 },
> > +     { 0x3007, 0x00 }, { 0x3008, 0x14 }, { 0x3020, 0x58 }, { 0x300d, 0=
x34 },
> > +     { 0x300e, 0x17 }, { 0x3021, 0x02 }, { 0x3010, 0x59 }, { 0x3002, 0=
x01 },
> > +     { 0x3005, 0x01 }, { 0x3008, 0x04 }, { 0x300f, 0x70 }, { 0x3010, 0=
x69 },
> > +     { 0x3017, 0x10 }, { 0x3019, 0x19 }, { 0x300c, 0x62 }, { 0x3064, 0=
x10 },
> > +     { 0x3c08, 0x0e }, { 0x3c09, 0x10 }, { 0x3c31, 0x0d }, { 0x3c32, 0=
xac },
> > +};
> > +
> > +static const struct s5k5e8_reg s5k5e8_2592x1944_regs[] =3D {
> > +     { 0x0100, 0x00 }, { 0x0136, 0x18 }, { 0x0137, 0x00 }, { 0x0305, 0=
x06 },
> > +     { 0x0306, 0x18 }, { 0x0307, 0xa8 }, { 0x0308, 0x34 }, { 0x0309, 0=
x42 },
> > +     { 0x3c1f, 0x00 }, { 0x3c17, 0x00 }, { 0x3c0b, 0x04 }, { 0x3c1c, 0=
x47 },
> > +     { 0x3c1d, 0x15 }, { 0x3c14, 0x04 }, { 0x3c16, 0x00 }, { 0x0820, 0=
x03 },
> > +     { 0x0821, 0x44 }, { 0x0114, 0x01 }, { 0x0344, 0x00 }, { 0x0345, 0=
x08 },
> > +     { 0x0346, 0x00 }, { 0x0347, 0x08 }, { 0x0348, 0x0a }, { 0x0349, 0=
x27 },
> > +     { 0x034a, 0x07 }, { 0x034b, 0x9f }, { 0x034c, 0x0a }, { 0x034d, 0=
x20 },
> > +     { 0x034e, 0x07 }, { 0x034f, 0x98 }, { 0x0900, 0x00 }, { 0x0901, 0=
x00 },
> > +     { 0x0381, 0x01 }, { 0x0383, 0x01 }, { 0x0385, 0x01 }, { 0x0387, 0=
x01 },
> > +     { 0x0340, 0x07 }, { 0x0341, 0xb0 }, { 0x0342, 0x0b }, { 0x0343, 0=
x28 },
> > +     { 0x0200, 0x00 }, { 0x0201, 0x00 }, { 0x0202, 0x03 }, { 0x0203, 0=
xde },
> > +     { 0x3303, 0x02 }, { 0x3400, 0x00 }, { 0x323b, 0x02 }, { 0x3301, 0=
x00 },
> > +     { 0x3321, 0x04 }, { 0x3306, 0x00 }, { 0x3307, 0x08 }, { 0x3308, 0=
x0a },
> > +     { 0x3309, 0x27 }, { 0x330a, 0x01 }, { 0x330b, 0x01 }, { 0x330e, 0=
x00 },
> > +     { 0x330f, 0x08 }, { 0x3310, 0x07 }, { 0x3311, 0x9f }, { 0x3312, 0=
x01 },
> > +     { 0x3313, 0x01 },
> > +};
>
> Is this a reverse engineered table of initial register values? A comment
> would be awesome.
>
> > +static const struct s5k5e8_mode supported_modes[] =3D {
> > +     {
> > +             .width =3D 2592, .height =3D 1944, .hts_def =3D 2856,
> > +             .vts_def =3D 1968, .vts_min =3D 1968,
> > +             .num_regs =3D ARRAY_SIZE(s5k5e8_2592x1944_regs),
> > +             .regs =3D s5k5e8_2592x1944_regs,
> > +     },
> > +};
> > +
> > [...]
> > +static int s5k5e8_enum_frame_size(struct v4l2_subdev *sd, struct v4l2_=
subdev_state *sd_state,
> > +             struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +     if (fse->index >=3D ARRAY_SIZE(supported_modes) ||
> > +         fse->code !=3D MEDIA_BUS_FMT_SGRBG10_1X10)
> > +             return -EINVAL;
>
> ARRAY_SIZE(supported_modes) is one. Does supported_modes really need to
> be an array?
>
> > +     fse->min_width =3D fse->max_width =3D supported_modes[fse->index]=
.width;
> > +     fse->min_height =3D fse->max_height =3D supported_modes[fse->inde=
x].height;
> > +     return 0;
> > +}
> > +
> > [...]
> > +static int s5k5e8_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct s5k5e8 *s5k5e8;
> > +     u32 val =3D 0;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     s5k5e8 =3D devm_kzalloc(dev, sizeof(*s5k5e8), GFP_KERNEL);
> > +     if (!s5k5e8)
> > +             return -ENOMEM;
> > +     s5k5e8->dev =3D dev;
> > +     v4l2_i2c_subdev_init(&s5k5e8->sd, client, &s5k5e8_subdev_ops);
> > +     s5k5e8->xvclk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> > +     if (IS_ERR(s5k5e8->xvclk))
> > +             return dev_err_probe(dev, PTR_ERR(s5k5e8->xvclk), "xvclk\=
n");
> > +     clk_set_rate(s5k5e8->xvclk, S5K5E8_XVCLK_FREQ);
> > +     s5k5e8->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIO=
D_OUT_HIGH);
> > +     if (IS_ERR(s5k5e8->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(s5k5e8->reset_gpio), "r=
eset\n");
> > +     for (i =3D 0; i < S5K5E8_NUM_SUPPLIES; i++)
> > +             s5k5e8->supplies[i].supply =3D s5k5e8_supply_names[i];
> > +     ret =3D devm_regulator_bulk_get(dev, S5K5E8_NUM_SUPPLIES, s5k5e8-=
>supplies);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "regulators\n");
> > +     ret =3D s5k5e8_power_on(dev);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D s5k5e8_read_reg(s5k5e8, S5K5E8_CHIP_ID_REG, 2, &val);
> > +     if (ret || val !=3D S5K5E8_CHIP_ID) {
> > +             dev_err(dev, "failed to identify s5k5e8 (ret=3D%d, id=3D0=
x%x)\n", ret, val);
>
> Use dev_err_probe() for error messages in the probe function.
>
> > +             ret =3D ret ? ret : -ENXIO;
> > +             goto err_power;
> > +     }
> > +     dev_info(dev, "identified Samsung S5K5E8 sensor (0x%04x)\n", val)=
;
>
> Degrade to dev_dbg() or drop. Once the driver is considered ok, messages
> of this kind only clutter the kernel log with very little value and add
> to the boot time.
>
> > +     mutex_init(&s5k5e8->mutex);
> > +     s5k5e8->cur_mode =3D &supported_modes[0];
> > +     ret =3D s5k5e8_init_controls(s5k5e8);
> > +     if (ret)
> > +             goto err_mutex;
> > +     s5k5e8->sd.internal_ops =3D &s5k5e8_internal_ops;
> > +     s5k5e8->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     s5k5e8->sd.entity.ops =3D &s5k5e8_entity_ops;
> > +     s5k5e8->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +     s5k5e8->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     ret =3D media_entity_pads_init(&s5k5e8->sd.entity, 1, &s5k5e8->pa=
d);
> > +     if (ret)
> > +             goto err_ctrl;
>
> Use newlines to separate function call + its error handling from the
> other code.
>
> > +     s5k5e8->sd.state_lock =3D &s5k5e8->mutex;
> > +     ret =3D v4l2_subdev_init_finalize(&s5k5e8->sd);
> > +     if (ret)
> > +             goto err_media;
> > +     ret =3D v4l2_async_register_subdev_sensor(&s5k5e8->sd);
> > +     if (ret)
> > +             goto err_media;
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_enable(dev);
> > +     pm_runtime_idle(dev);
> > +     return 0;
> > +err_media: media_entity_cleanup(&s5k5e8->sd.entity);
> > +err_ctrl: v4l2_ctrl_handler_free(s5k5e8->sd.ctrl_handler);
> > +err_mutex: mutex_destroy(&s5k5e8->mutex);
> > +err_power: s5k5e8_power_off(dev);
>
> A label should be on its own line.
>
> > +     return ret;
> > +}
> > +
> > +static void s5k5e8_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct s5k5e8 *s5k5e8 =3D to_s5k5e8(sd);
> > +
> > +     v4l2_async_unregister_subdev(sd);
> > +     media_entity_cleanup(&sd->entity);
> > +     v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +     mutex_destroy(&s5k5e8->mutex);
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             s5k5e8_power_off(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static const struct dev_pm_ops s5k5e8_pm_ops =3D { SET_RUNTIME_PM_OPS(=
s5k5e8_power_off,
> > +             s5k5e8_power_on, NULL) };
>
> This looks strange. I'd add a \n before SET_RUNTIME_PM_OPS. In general
> align continuation lines to the previous opening brace or parenthesis.
>
> > +static const struct of_device_id s5k5e8_of_match[] =3D { { .compatible=
 =3D "samsung,s5k5e8" }, { } };
>
> Please fix the layout of this struct. It should look like:
>
> static const struct of_device_id s5k5e8_of_match[] =3D {
>         { .compatible =3D "samsung,s5k5e8" },
>         { }
> };
>
>
> > +MODULE_DEVICE_TABLE(of, s5k5e8_of_match);
> > +static struct i2c_driver s5k5e8_i2c_driver =3D {
> > +     .driver =3D { .name =3D "s5k5e8", .pm =3D &s5k5e8_pm_ops, .of_mat=
ch_table =3D s5k5e8_of_match },
> > +     .probe =3D s5k5e8_probe, .remove =3D s5k5e8_remove,
>
> This also lacks newlines.
>
> > +};
> > +module_i2c_driver(s5k5e8_i2c_driver);
> > +MODULE_DESCRIPTION("Samsung S5K5E8 5MP sensor driver");
> > +MODULE_LICENSE("GPL");
>
> The same critics apply to (at least) patch #5, too.
>
> Best regards
> Uwe



--=20
Best regards,
Hikmah Gumelar
