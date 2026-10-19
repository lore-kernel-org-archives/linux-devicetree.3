Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421777;
	b=IQbPZyJsdDb9wmPtFhy09mshuV0EISgYi3E87ixRJmtMytg4V3G3JC1DmgnfPq9lHMBK
	 +4zd7S7WfOOyoDEROssCFD3k+cDm3I9L0GO6cWcpcjW2MwnsLN7x33g3SIIdwA1e0uVd1
	 oa0ZHj181I+OGaV37mKccxZb4kuBLLlruGP5C7yTJioerBxmZNgVJIYp7HU1ekQQW82US
	 HCu3IuHWeUE0TA9NxKi4Xf566BCbu+MqIVJBMhJX584/yzlTVWd3+TKi2/jSi/F+vOr8a
	 raiTbqbjSWzO0736zlLuMarnjjcZO3QRjCBk+Sl0/l2wk0NiFYfxk3IF/wio2UAM3rA==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421777;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
	b=Ccs2aAIXW1Nn9LAx/2F0bZ5IQxKGuaIYJrVt4nle9qs1OgYt4KP1drfrs4BaxRMGjJ5D
	 QbmlJmaMYzsmMZVFglYilHUI0Y2kg2rMpXye7Dildwc7sO2OI4hoeYrLQ/mNuZv3ZlN4z
	 rS8WBMafo473NSKS/nYMvr4kGTXAOX9OWZxaVScA0db8wRMwUWIItISBl0Z7APtDVk2dg
	 ND92gsQ00tSPkYW0h+v1HgIyfApOL5f/uaJUBVkTbolh01vrXBtC+fwWn0aXYSN1i/xSf
	 6wT3EwuV4PA8dOTSd+pUdRpSyc7IPToaQskrBf+Vv0rdgxKvsugzSy6hrNtddz1Y/6Q==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CHbRAuuM;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8D06072483
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CHbRAuuM
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCED3033E1
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421777; cv=pass; b=ieTDTW0sZkOHI8ozkahpzsKHCRMtp+YZsayK8TV+jBggJ0jIUVSkjB/vmjT5937mFTYqYc06iwpXi3r6nv3nopLFc0OKH3XrwfphtC33TEjFxL9Xf5crQ8ix76yDpkz6B0+qvr7cKcxTHtx/ll2aoI5VNzXFWAExfQb8Gtje71A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421777; c=relaxed/simple;
	bh=ZiWLgE/hDl7NKdkfHl0vrv9PMmfHDU6zMAXwx2zu5ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QObJHhvO6mcaCY3ZgAyuDtvjosKRYvIOI/hvxDjegGWnl+BOdsqLiDgWdzzreyda4IV+Nj8IJ+0VWrq6OMpmBvzHPl4XMwoAtnSToIVI0xaHD45izqK2BPGO76l31CsqyDBE6Ju0+4Lh21cQ9bbyli+zvLf2iV2kdcbDsF4CfNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHbRAuuM; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso119465eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421775; cv=none;
        d=google.com; s=arc-20260327;
        b=e8w7vXvlf4cLabTXg69AX8gg0cOxVPgaa58cpwaXu9KCmEC0duFCw8ecxEWUuRbt+q
         ai0igIntr+nQwIE73j50B9cm/fbNobL19yncGGQIaTS3TlOlRWKKJP/QL4ND8nWxt3Yi
         bzDN9YhY6D32KHtb1JKOrr6xmqo1ZJaosO6qY7XNr9MrcwS/BNvlE7d84O6gO1LZNKCH
         k43xNf9Dl7OikiAGkD/g2wTz+GbPkKOIyikovhTg9Wc1MDY13W8nfmy1BnlfOqHf41kd
         IO2T3OPRNvkaLOY5V78KvujtsX8fqzn2uKyuPcS6IpKcQq/vx/hI1wFcEDQAAA1lxnM4
         drPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        fh=tkALz3jmmkvEpqmeRMTBEYF9PfCQ8HTklmi9rB2WeA4=;
        b=Wcle8a7orVdAWvcpmQfZXXjBKAcQSvm1uhD5VWGxk5MY75mJdH5UDM8UiGV9LtdH1N
         83xxNAI0y2wMm5qwsmmJbYXsVBcn21P9J424fH0qQPLSeRO4XXaMhooCGZnN57FQK37v
         kLpGFTqGMUBsyYGC7nmQSaGxKzRgt1/65UeISobJcIaoDqUOawvovNa8+m+NXm0NoLIz
         WedEXK7KXarIEEwJRK1S161p7dwOgNq3NdnntHWq5/bLC2VUsTNOhSFS0dVABgX+QfP+
         FWKd8t3xXV33UmFKBo7I62G48mLFsulS5vVGtVNcU/7WS7Av9NY2vwgRzqo2jbMFZuh1
         z3/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421775; x=1793026575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        b=CHbRAuuMRKZCvIY0uPgS4dFur46JM/gE//2fMIqO6Xp7uIF+OTG/zR32b4XVbQxcUa
         sMmGKrFYDLcuTmoeXKppaclS5sd7FXxHQQgn4FRH11egu/i1ag6Ms+JQ2qGa2UMBAo9S
         x0Lwd3Bi/hd9EzYTH6oqyNuNUihONSTkZJaBTlcG5ETg5wSB/Fd9jA9WDQ82uv5Yq3yp
         vJ0wOFgRuczAEqYxtIqSCbvY+vGR/HnwIroqNE7Y3cBw7A9BWYvu/fmo91bHrbLiKAHE
         6V36KMNs/tAl9/sT2h4zAg34rke5sUTugNf3Q7Q/2LwgHHljFBlALwzJ5zP9aCv84wyC
         GDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421775; x=1793026575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        b=OkI2ytmV9MqDZabM2B7GKgSCklcDFpGB6vqjF3GKOV9O2G1UW/CXrR6zWfwSViGuqp
         v1SYDAmNpuRipN7+uVwJ82AKxRRma7tHybN9bqSZzuAe7aucgJdFeUBQA6DBc7GV2gfH
         Q4faWVDww/AjSxCUvNcd6+GckQbtR77YF70pim8l2R52gqBhcnB6A5acvnZxiki34/Vw
         q11YcbRsmaMS2CL3fFUnerX2tdpvMfTJAZqPSygL4TOfxQz4vNg0D465dkZqd7SkcK9s
         XGCT+POGtV4iCc3KHrcTD8cTRNESRWnpH3K/BkARljFff+mBStd95O25KROL6nyhccwy
         i4ag==
X-Forwarded-Encrypted: i=1; AKwUvBy9yNMI1oC34eRPdb7ocPZZxuHXfofpELg5Pmk4MPlMfDjAdTxew8xURu3Yq1ao7rt+BH37h8fbljBs@vger.kernel.org
X-Gm-Message-State: AFq9FYKQwWOi4VDneIElZux2PhrMLXijC/OKkBgrRqBeJT6W7UGkSVV0
	18Rv+w7RChPSxfDg8pIJh39j3pggzl1T9K3UlE3ckuHMZt93Xh43Lhpv4Mjjo4a8Art6wUfGih+
	JYAYR7yxdR4KClQjKHxZhGR+usbnzCO4=
X-Gm-Gg: AYBFou30L/tiOgt421XzkOcMQQ6o5mqmDEXdf/ZXT/SzmlFRBQXcfdCDhmMQSDvVull
	mq9tUvZQzUH5DX6oBkEGFCuATGORAgRfFr6eajQ/HMQxG6859qki/IwA9ZkM2V0XWmO0l668fOo
	K7JDJXbKK3UKiFOhRLxpTp3GCTYLxkCIX5kZBm2HGFtjYH7LyocnVS1q1EElz27GK7vmHuCQY6W
	jqbJBhhNLQCevqBUn7QUkpwYQ4GIaz06OJa0nK4UAx4JdaC9enl1D/cYf86/cotbPVQ2SELGSAj
	byfNMUA9yjlSB10E6M+zXIqGE4bIT9auFsiaLRBwZaBzTNI2d1JrYNnevxyZ/qP1xzSqA9b46Q7
	dScQoRKW8EStOtwkJfjfUq8I=
X-Received: by 2002:a05:693c:20d2:10b0:356:7ddb:2e54 with SMTP id
 5a478bee46e88-361a2349f61mr12825749eec.29.1792421775026; Mon, 19 Oct 2026
 07:56:15 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-4-clamor95@gmail.com>
 <179198329794.839288.10569542357230656958@kernel.org>
In-Reply-To: <179198329794.839288.10569542357230656958@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:56:02 +0300
X-Gm-Features: AclHuK-So1fk-SufXF9ELHqjLzJsGlTnieaKofgBf88_CnYDM-h4bTkcCd70Qok
Message-ID: <CAPVz0n3cfh3LcYwARJ-5gkvQZj3cPVG8XGwH+YkPaOrW36cJ-A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mfd: aat2870: Convert to use OF bindings
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
1 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 13 Oct 2026, Svyatoslav Ryhel wrote:
>
> > Conversion of the AAT2870 driver to use OF bindings requires a few comp=
lex
> > changes that should be done simultaneously.
> >
> > The AAT2870 essentially provides two functions via child devices:
> > backlight and regulators. Both functions are fairly self-sufficient and
> > may not be populated on the final board. Consequently, the MFD
> > registration API was replaced with of_platform_populate(), and each
> > sub-device was given its own compatible string.
> >
> > Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
> > was converted to use modern gpiod/OF helpers, allowing the redundant
> > aat2870_enable() and aat2870_disable() helpers to be removed.
> >
> > The aat2870-regulator driver was updated to register each of the four L=
DOs
> > from a dedicated OF node using modern regulator framework.
> >
> > The aat2870-backlight driver was changed to populate all required
> > properties from a dedicated Device Tree node. Its channel map was updat=
ed
> > to use u8 instead of int. Furthermore, because the maximum current is n=
ow
> > parsed as an absolute value rather than an enum entry, the calculation =
and
> > application of the maximum current were updated accordingly.
> >
> > All of the changes above allow platform data to be removed entirely.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/aat2870-core.c            | 115 +++++--------------
> >  drivers/regulator/aat2870-regulator.c | 159 +++++++++++---------------
> >  drivers/video/backlight/aat2870_bl.c  |  51 +++++----
> >  include/linux/mfd/aat2870.h           |  95 +--------------
> >  4 files changed, 121 insertions(+), 299 deletions(-)
> >
> > diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
> > index 0d56cd6fbc6a5..909c14ee60323 100644
> > --- a/drivers/mfd/aat2870-core.c
> > +++ b/drivers/mfd/aat2870-core.c
> > @@ -16,8 +16,15 @@
> >  #include <linux/gpio/legacy.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/mfd/aat2870.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/regulator/machine.h>
>
> Since we are moving away from legacy GPIO and MFD APIs here, does it
> make sense to replace '<linux/gpio/legacy.h>' and '<linux/mfd/core.h>'
> with '<linux/gpio/consumer.h>'?
>

Sure

> > +struct aat2870_register {
> > +     bool readable;
> > +     bool writeable;
> > +     u8 value;
> > +};
> > +
> >  static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] =3D {
> >       /* readable, writeable, value */
> >       { 0, 1, 0x00 }, /* 0x00 AAT2870_BL_CH_EN */
> > @@ -61,34 +68,6 @@ static struct aat2870_register aat2870_regs[AAT2870_=
REG_NUM] =3D {
> >       { 0, 1, 0x00 }, /* 0x26 AAT2870_LDO_EN */
> >  };
> >
> > -static struct mfd_cell aat2870_devs[] =3D {
> > -     {
> > -             .name =3D "aat2870-backlight",
> > -             .id =3D AAT2870_ID_BL,
> > -             .pdata_size =3D sizeof(struct aat2870_bl_platform_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOA,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOB,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOC,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOD,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -};
> > -
> >  static int __aat2870_read(struct aat2870_data *aat2870, u8 addr, u8 *v=
al)
> >  {
> >       int ret;
> > @@ -196,22 +175,6 @@ static int aat2870_update(struct aat2870_data *aat=
2870, u8 addr, u8 mask,
> >       return ret;
> >  }
> >
> > -static inline void aat2870_enable(struct aat2870_data *aat2870)
> > -{
> > -     if (aat2870->en_pin >=3D 0)
> > -             gpio_set_value(aat2870->en_pin, 1);
> > -
> > -     aat2870->is_enable =3D 1;
> > -}
> > -
> > -static inline void aat2870_disable(struct aat2870_data *aat2870)
> > -{
> > -     if (aat2870->en_pin >=3D 0)
> > -             gpio_set_value(aat2870->en_pin, 0);
> > -
> > -     aat2870->is_enable =3D 0;
> > -}
> > -
> >  #ifdef CONFIG_DEBUG_FS
> >  static ssize_t aat2870_dump_reg(struct aat2870_data *aat2870, char *bu=
f)
> >  {
> > @@ -332,9 +295,7 @@ static inline void aat2870_init_debugfs(struct aat2=
870_data *aat2870)
> >
> >  static int aat2870_i2c_probe(struct i2c_client *client)
> >  {
> > -     struct aat2870_platform_data *pdata =3D dev_get_platdata(&client-=
>dev);
> >       struct aat2870_data *aat2870;
> > -     int i, j;
> >       int ret =3D 0;
> >
> >       aat2870 =3D devm_kzalloc(&client->dev, sizeof(struct aat2870_data=
),
> > @@ -348,60 +309,29 @@ static int aat2870_i2c_probe(struct i2c_client *c=
lient)
> >
> >       aat2870->reg_cache =3D aat2870_regs;
> >
> > -     if (pdata->en_pin < 0)
> > -             aat2870->en_pin =3D -1;
> > -     else
> > -             aat2870->en_pin =3D pdata->en_pin;
> > +     aat2870->en_pin =3D devm_gpiod_get_optional(&client->dev, "enable=
",
> > +                                               GPIOD_OUT_HIGH);
> > +     if (IS_ERR(aat2870->en_pin))
> > +             return dev_err_probe(&client->dev, PTR_ERR(aat2870->en_pi=
n),
> > +                                  "Failed to get EN GPIO\n");
> >
> > -     aat2870->init =3D pdata->init;
> > -     aat2870->uninit =3D pdata->uninit;
> >       aat2870->read =3D aat2870_read;
> >       aat2870->write =3D aat2870_write;
> >       aat2870->update =3D aat2870_update;
> >
> >       mutex_init(&aat2870->io_lock);
> >
> > -     if (aat2870->init)
> > -             aat2870->init(aat2870);
> > -
> > -     if (aat2870->en_pin >=3D 0) {
> > -             ret =3D devm_gpio_request_one(&client->dev, aat2870->en_p=
in,
> > -                                     GPIOF_OUT_INIT_HIGH, "aat2870-en"=
);
> > -             if (ret < 0) {
> > -                     dev_err(&client->dev,
> > -                             "Failed to request GPIO %d\n", aat2870->e=
n_pin);
> > -                     return ret;
> > -             }
> > -     }
> > -
> > -     aat2870_enable(aat2870);
> > -
> > -     for (i =3D 0; i < pdata->num_subdevs; i++) {
> > -             for (j =3D 0; j < ARRAY_SIZE(aat2870_devs); j++) {
> > -                     if ((pdata->subdevs[i].id =3D=3D aat2870_devs[j].=
id) &&
> > -                                     !strcmp(pdata->subdevs[i].name,
> > -                                             aat2870_devs[j].name)) {
> > -                             aat2870_devs[j].platform_data =3D
> > -                                     pdata->subdevs[i].platform_data;
> > -                             break;
> > -                     }
> > -             }
> > -     }
> > +     gpiod_set_value(aat2870->en_pin, 1);
>
> Is this needed when 'devm_gpiod_get_optional()' already requested the pin=
 with
> 'GPIOD_OUT_HIGH'?
>

I will check, most likely it is not. I will adjust in v5.

> >
> > -     ret =3D mfd_add_devices(aat2870->dev, 0, aat2870_devs,
> > -                           ARRAY_SIZE(aat2870_devs), NULL, 0, NULL);
> > -     if (ret !=3D 0) {
> > -             dev_err(aat2870->dev, "Failed to add subdev: %d\n", ret);
> > -             goto out_disable;
> > +     ret =3D devm_of_platform_populate(&client->dev);
> > +     if (ret) {
> > +             gpiod_set_value(aat2870->en_pin, 0);
> > +             return dev_err_probe(&client->dev, ret, "Failed to popula=
te cells\n");
> >       }
> >
> >       aat2870_init_debugfs(aat2870);
> >
> >       return 0;
> > -
> > -out_disable:
> > -     aat2870_disable(aat2870);
> > -     return ret;
> >  }
> >
> >  static int aat2870_i2c_suspend(struct device *dev)
> > @@ -409,7 +339,7 @@ static int aat2870_i2c_suspend(struct device *dev)
> >       struct i2c_client *client =3D to_i2c_client(dev);
> >       struct aat2870_data *aat2870 =3D i2c_get_clientdata(client);
> >
> > -     aat2870_disable(aat2870);
> > +     gpiod_set_value(aat2870->en_pin, 0);
> >
> >       return 0;
> >  }
> > @@ -421,7 +351,7 @@ static int aat2870_i2c_resume(struct device *dev)
> >       struct aat2870_register *reg =3D NULL;
> >       int i;
> >
> > -     aat2870_enable(aat2870);
> > +     gpiod_set_value(aat2870->en_pin, 1);
> >
> >       /* restore registers */
> >       for (i =3D 0; i < AAT2870_REG_NUM; i++) {
> > @@ -436,6 +366,12 @@ static int aat2870_i2c_resume(struct device *dev)
> >  static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
> >                               aat2870_i2c_resume);
> >
> > +static const struct of_device_id aat2870_match_table[] =3D {
> > +     { .compatible =3D "skyworks,aat2870" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, aat2870_match_table);
> > +
> >  static const struct i2c_device_id aat2870_i2c_id_table[] =3D {
> >       { "aat2870" },
> >       { }
> > @@ -444,6 +380,7 @@ static const struct i2c_device_id aat2870_i2c_id_ta=
ble[] =3D {
> >  static struct i2c_driver aat2870_i2c_driver =3D {
> >       .driver =3D {
> >               .name                   =3D "aat2870",
> > +             .of_match_table         =3D aat2870_match_table,
> >               .pm                     =3D pm_sleep_ptr(&aat2870_pm_ops)=
,
> >               .suppress_bind_attrs    =3D true,
> >       },
>
> --
> Lee Jones
