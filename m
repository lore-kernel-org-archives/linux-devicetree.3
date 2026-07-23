Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50455473C9A
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818852; cv=pass; b=M6J5Q0ccBx87DoWXrwX5JQaFonx1gElez/eFj+qzCSyGuAt8LpqH8uWygEJptcZdWATy6wI4UECKEJd+335i7BVIzKxk6+g+hrfcO2KOfZiat0ghtVkOhbEK3j5suyE2LfT9kmty8RrayouCgr8lvpvDDAGEs6520U6979rQnu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818852; c=relaxed/simple;
	bh=2AkBNYNX/tQ1gXZHz3dDitynioS5AA/5F2iAOByBdpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRiNxbFOb+YfChZXMpH60VzPirreprt/udmP02uXfGhHozGnCbHgc3eAcaW+UwVeo2HCPbxCJAUb7V4lENJs1LLxKGEyG311QcAaCNPTcEu7pWBrlbaSJd1ECFukhV8e/2QUpLDKKZ02OwyDvGVFUO4QxWeXJWgAeAhErgztEFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOUqgZMC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNZyOF7Z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOUqgZMC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNZyOF7Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvmJ5038591
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlIg+W467RVJGFrpc0J3YtssG8GUv/4ymVj6LQ4sO2w=; b=OOUqgZMCwuuivPeA
	VSP/JF3ZR5W8CpR3DM8W5yBcx80mlO3mGAHIKQB4idOmsLaQMHjTlnuWNaVyKB3n
	fh+T4O0/S7sLxI2OAyZfLfUCHEKC+BCd5oty3QiS8JME9+pa1C8AsaSN1Fw0ZonN
	J7BnF55VHXb291RusbTxCiuTBuKDlPpOwyLG3atSZdqTa5+sFFtJ5B0bFQysGfC5
	a/GmRSgVijLxle85/fYIrBvpqUpyPh4ntrlpkaS4XUdkTbNFXZm/wzz/bFkp+RkW
	pTs6F+FfmJOdk+HB0uTATQLUIhMcKmkTW8BM48iQn9ClZkvqkd9kLEh2tZfZq5Cf
	WDrDIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc3vjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:00:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a098ea19so86478085a.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784818848; cv=none;
        d=google.com; s=arc-20260327;
        b=WJPl0wE4gVzAzdtsvDzwnEgUEXv7qMxmSNeSYlXV+wxYK0qNgJRep53PkB8DNrnPP0
         Ex5n7BTtqw11KsMhab6RS3Xzr6xBIF535WVbcwN3cNHjfWKgaqmrydCReNXARs1Gmn6Q
         6HI0mv+fYkYYgsE8WB5EoT5S2Ak3VWXGIAodlVB/bBmpDtgdV6NAh4yX5w2HtrLUbj9f
         f6QfiVdZRAuZsidSec86G2mnkLDv71FZSJVKZCw7f840XxR2iIAS1dn9cb1S3T3cU563
         Ta1WAaBaZd36OSAXFWyqra1QTW26jiMKR6T87bJD/xRfy4v9rJNEwzrKTL50UpIZyFU2
         B7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GlIg+W467RVJGFrpc0J3YtssG8GUv/4ymVj6LQ4sO2w=;
        fh=Qh3EmkGdFuyILnTB7TtPLTkJgX55PvNbEu+0dEx+8Lg=;
        b=otq7FbM67floJLkEd5KQQOjDxutyn38EZHWRuijjh4tf3cHpuolvvq4BJtkMS5JIbQ
         knp/vwEDrbgNU3s41KXIrXW2xCBmllm1MY3XexpPOJ/lDSdNBCfWmTkDGOPLXmn0GlQM
         UUIuYEsnOpXAKhU8i0/rs+sFTPAKovFem+gUBUoDZCQqCE4rd2N5qZ7R37Rx0NajvcHC
         0sAMx0MdHP2tCqSS42uqRP59TM1dIcErmukSBXJQeHxF/O9U9dkDRNogvSrFt7oqmHcf
         idSDjLWzPQvQnbXV/HTQZu3StTrnSGAc03BTDBsTKrVzw8mTimvqL2iVnzdYreh+rcoP
         vTMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784818848; x=1785423648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GlIg+W467RVJGFrpc0J3YtssG8GUv/4ymVj6LQ4sO2w=;
        b=LNZyOF7ZuefgbNlvmxto2q+E1VpxWYuIkbb3VyUD1cUEFlnyx3zWvzfW0sNuAqyeY2
         T1I2j3mptjt6yGmqoqlImBDlpWLj+/Ei5dmlU3lstk5M5edeewgUgGkEHVJFlo9snyC2
         y62/QU0l55tus98tTInZVcMOjddoN7BQjSiKlIh68PUD5sDtyXcC8EChCRm6Pxkg6IZ/
         naxygNYNfIH8UG/tmW42TP+eo8YfOoqMbQsfpBNrl4py0KfjtCGHWzq9mFNzEvyst/hs
         JTvDvph7P46HcczZy5ZffKr6W4HiGUuxA5JRCnksyfOHxdeTlic5xH7HYk8nYBUxjApG
         kUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818848; x=1785423648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GlIg+W467RVJGFrpc0J3YtssG8GUv/4ymVj6LQ4sO2w=;
        b=c4CaYXlv443nzyT1/+upd57V6lXVFLt3woWaSW/8DJTlSnSPJGw9dYPIWanCqzxiIf
         6oDSa7ILPdb424aehjigP6qFj5QJAo9+Eq8VtmvBlS5vnJ9OvvGLs7KaoCNfWOgVRXRr
         CJ84x0xctKI/s/n6OfKHvqLBfDKxoFOvp+LqtGkBJmBiI4uzCrko0lvWXFXKkuQnVGRY
         b2NJaj1N6Avr62OvLApf0DZ46pDAxFj1s7s/0X0jYOFR5KXrsrTWap7o05rMewUscqJA
         C3Ik4fDCMXziCqk3G9NKWxnKDswmAI5sv8uc95iw/8J3t3aKrZWNISDkM5OZr8Nm7JV+
         oFtA==
X-Forwarded-Encrypted: i=1; AHgh+RpyX1heUkjV9qFz2FMvIGo7XBv+nlcQRzWZ36MqvKilAl9wi72aa6lI036oy5MoqiArziG75ErohSCv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqi1R13Genhy1bIeoFHLgBUcIK/zAOC8hQ5TjXr81OV0t9N50w
	VwlKryyeKU14y0x2s/KOtD5g/4IihTpUIM1IkesS4VyBJqLpP5mYPEl745CGhOgujbwME5yHSzG
	jxx7aN7ZP4Bzqd0dehRiRBmQAOKz8WRUU/jd6j93STz1AGdMRKm+3afEsduw7WkXBFDBQZ3UZV7
	42ZGi4Bz/M/CPeoUiC4Zqqofv3+0+gBmbU06iq0wJQ1QmfaEC0pnHd
X-Gm-Gg: AR+sD117mINx+1ai8kt8sMVG/MIZytVZMKD1wlj+NBPuywwZj+/odqnOai4Y2SnDNSc
	SGy4y6uFCxw8Gwf8myguEISFWjlhjmfd8F5eKjDbsY8gx+yrtqA7arKY6ufdPa2jTuBsIxZdZP8
	y4XH3zutl0khz3pzCHza5t7dOrv7YMcMcxIj7XvIP75ct9bALXfCE12ij38WtzDmqQ6uC90/NUH
	O2yYmpWjXU9Ls1edyy34w/OrVM10piyDZIBrwIZ+IeHFGdRKFO8Ue0dZ8UA97xSiVvolQLrVlA=
X-Received: by 2002:a05:620a:46a1:b0:92d:a06c:de5a with SMTP id af79cd13be357-931036d17a0mr374965885a.45.1784818848014;
        Thu, 23 Jul 2026 08:00:48 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:92d:a06c:de5a with SMTP id
 af79cd13be357-931036d17a0mr374954485a.45.1784818847192; Thu, 23 Jul 2026
 08:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
 <20260715-monza-leds-v6-3-d1724bb7fe3d@oss.qualcomm.com> <20260723141859.GN3363113@google.com>
In-Reply-To: <20260723141859.GN3363113@google.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 17:00:35 +0200
X-Gm-Features: AUfX_mw9fsPFUECYqKYsBIA19fM4Fsj8BmvlS3UCLTuP5lUDzFPMBemSrJdBgfc
Message-ID: <CAFEp6-2JwiuWYi9ww13eTR-Fk=aGdgh6JZCv1apopHhHtPWHQw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] leds: pca963x: add multicolor LED class support
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: iqcVAxf8Y3PNLFqQP-4OFwyzXU_pi2UH
X-Proofpoint-GUID: iqcVAxf8Y3PNLFqQP-4OFwyzXU_pi2UH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0NyBTYWx0ZWRfX4Hjim2Uhg++9
 sx5zxlJoj8JbNT8c45dbuDENwMeeL9x2YhkyQllb/25/0ryDOqLsTrkhnN+pK4lF3+EW+/UEGtc
 uOPJradLaYihgqZrkxAXm7taavTB+7Y=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a622ca0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rGzcncMGTsyUfZFf4pUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0NyBTYWx0ZWRfXzfd2bcB6m9gb
 14araqlVmRQ4GOBBWryzefKUKWuJwwGmljMbmoZaIRmGHR/A+dijUXnuIs2bHZaVDXXFiSWnADP
 Bp726/lbqAQXx8Jtvfvqy8sTY9CXO74vL/C2FUKB5JEhqcyyfsPPbnHdY7vYhl0XIoccnuBbmor
 X8WNX4G4BP3mj74wDPtBCUvHd8yY9twKTEaWqxgrNBySgdecnXGk6Q5NsZyI8td5+90xaHJLl4y
 stW9DO8AI2yiZv4/158mssGVB9fl8EohhZTW0LQWhgya2Y4KAOeyNvF5ivScV5B/rvxSHZTHaHe
 TgRyu4M6tH9lyHwDalNjsZBMQKQxtBpCZ+i93IpAVibQlTEHJ8ceA8JuaWWeDgVUR2E4UPBfw4i
 dXVFp1mK/TjoJqSv7XAP2Id98EupFj2WJ8VeWNL7SuMx2e1LPNu9ZMQIEnJzz0dbU0PTpTUtnAc
 HXAw4U78GvRH7D10adg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230147

On Thu, Jul 23, 2026 at 4:19=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 15 Jul 2026, Loic Poulain wrote:
>
> > Allow grouping of individual PCA963x PWM channels into a single
> > multicolor LED device by adding support for the LED multicolor class.
> >
> > A child node with sub-children is treated as a multicolor group,
> > others are treated as single leds, keeping full backwards compatibility=
.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/leds/Kconfig        |   1 +
> >  drivers/leds/leds-pca963x.c | 162 ++++++++++++++++++++++++++++++++++--=
--------
> >  2 files changed, 128 insertions(+), 35 deletions(-)
> >
> > diff --git dur/leds/Kconfig b/drivers/leds/Kconfig
> > index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67=
f9480cf23056e27e2 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -596,6 +596,7 @@ config LEDS_PCA963X
> >       tristate "LED support for PCA963x I2C chip"
> >       depends on LEDS_CLASS
> >       depends on I2C
> > +     select LEDS_CLASS_MULTICOLOR
> >       help
> >         This option enables support for LEDs connected to the PCA963x
> >         LED driver chip accessed via the I2C bus. Supported
> > diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> > index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f3e4d65e48b4c3eefa147a7=
fb5c9fe81ce569731 100644
> > --- a/drivers/leds/leds-pca963x.c
> > +++ b/drivers/leds/leds-pca963x.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/string.h>
> >  #include <linux/ctype.h>
> >  #include <linux/leds.h>
> > +#include <linux/led-class-multicolor.h>
> >  #include <linux/err.h>
> >  #include <linux/i2c.h>
> >  #include <linux/property.h>
> > @@ -101,8 +102,11 @@ struct pca963x;
> >  struct pca963x_led {
> >       struct pca963x *chip;
> >       struct led_classdev led_cdev;
> > +     struct led_classdev_mc mc_cdev;
> > +     struct mc_subled subleds[4];
> >       int led_num; /* 0 .. 15 potentially */
> >       bool blinking;
> > +     bool is_mc;
> >       u8 gdc;
> >       u8 gfrq;
> >  };
> > @@ -199,20 +203,24 @@ static void pca963x_blink(struct pca963x_led *led=
)
> >       led->blinking =3D true;
> >  }
> >
> > -static int pca963x_power_state(struct pca963x_led *led)
> > +static void pca963x_track_power_state(struct pca963x_led *led, unsigne=
d int led_num,
> > +                                   enum led_brightness brightness)
> >  {
> > -     struct i2c_client *client =3D led->chip->client;
> >       unsigned long *leds_on =3D &led->chip->leds_on;
> > -     unsigned long cached_leds =3D *leds_on;
> >
> > -     if (led->led_cdev.brightness)
> > -             set_bit(led->led_num, leds_on);
> > +     if (brightness)
> > +             set_bit(led_num, leds_on);
> >       else
> > -             clear_bit(led->led_num, leds_on);
> > +             clear_bit(led_num, leds_on);
> > +}
> >
> > -     if (!(*leds_on) !=3D !cached_leds)
> > +static int pca963x_sync_power_state(struct pca963x_led *led, unsigned =
long cached_leds)
> > +{
> > +     struct i2c_client *client =3D led->chip->client;
> > +
> > +     if (!led->chip->leds_on !=3D !cached_leds)
> >               return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
> > -                                              *leds_on ? 0 : BIT(4));
> > +                                              led->chip->leds_on ? 0 :=
 BIT(4));
> >
> >       return 0;
> >  }
> > @@ -221,22 +229,54 @@ static int pca963x_led_set(struct led_classdev *l=
ed_cdev,
> >                          enum led_brightness value)
> >  {
> >       struct pca963x_led *led;
> > +     unsigned long cached_leds;
> >       int ret;
> >
> >       led =3D container_of(led_cdev, struct pca963x_led, led_cdev);
> >
> >       mutex_lock(&led->chip->mutex);
> >
> > +     cached_leds =3D led->chip->leds_on;
> >       ret =3D pca963x_brightness(led, value);
> >       if (ret < 0)
>
> Should we check 'if (ret)' here instead of 'if (ret < 0)'? It is generall=
y
> preferred to only check for negative values if a positive return value ha=
s
> specific meaning that needs handling.

That code was already in place, but I can update it to align with the
other usages.

>
> >               goto unlock;
> > -     ret =3D pca963x_power_state(led);
> > +
> > +     pca963x_track_power_state(led, led->led_num, value);
> > +     ret =3D pca963x_sync_power_state(led, cached_leds);
> >
> >  unlock:
> >       mutex_unlock(&led->chip->mutex);
> >       return ret;
> >  }
> >
> > +static int pca963x_led_mc_set(struct led_classdev *led_cdev,
> > +                           enum led_brightness value)
> > +{
> > +     struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(led_cdev);
> > +     struct pca963x_led *led =3D container_of(mc_cdev, struct pca963x_=
led, mc_cdev);
> > +     unsigned long cached_leds;
> > +     int ret =3D 0, sync_ret;
> > +
> > +     led_mc_calc_color_components(mc_cdev, value);
> > +
> > +     guard(mutex)(&led->chip->mutex);
> > +
> > +     cached_leds =3D led->chip->leds_on;
> > +     for (unsigned int i =3D 0; i < mc_cdev->num_colors; i++) {
> > +             led->led_num =3D mc_cdev->subled_info[i].channel;
>
> Why does this get set twice?

Right, the first assignment is useless and has been forgotten during
the latest rework.

>
> Question from AI:
>
>   Would it be better to re-factor 'pca963x_brightness()' to accept the ch=
annel
>   number as an explicit parameter? Temporarily overwriting 'led->led_num'=
 in the
>   shared structure feels a bit fragile.

That's not a bad idea tbh, so I will do this for v7.

>
> > +             ret =3D pca963x_brightness(led, mc_cdev->subled_info[i].b=
rightness);
> > +             if (ret)
> > +                     break;
>
> Deserves a comment.  Why are we syncing power state on failure?

Some channels may already have been updated before the error, so we
still sync the global on/off state to reflect what actually changed.
I will add a comment.

>
> > +             pca963x_track_power_state(led, mc_cdev->subled_info[i].ch=
annel,
> > +                                       mc_cdev->subled_info[i].brightn=
ess);
> > +     }
> > +
> > +     sync_ret =3D pca963x_sync_power_state(led, cached_leds);
> > +
> > +     return ret ? : sync_ret;
> > +}
> > +
> >  static unsigned int pca963x_period_scale(struct pca963x_led *led,
> >                                        unsigned int val)
> >  {
> > @@ -300,6 +340,77 @@ static int pca963x_blink_set(struct led_classdev *=
led_cdev,
> >       return 0;
> >  }
> >
> > +static int pca963x_parse_mc_subleds(struct device *dev, struct pca963x=
_led *led,
> > +                                 struct fwnode_handle *fwnode,
> > +                                 const struct pca963x_chipdef *chipdef=
)
> > +{
> > +     unsigned int num_colors =3D 0;
> > +     int ret;
> > +
> > +     fwnode_for_each_child_node_scoped(fwnode, sub) {
> > +             u32 color, subreg;
> > +
> > +             if (num_colors >=3D ARRAY_SIZE(led->subleds))
> > +                     return dev_err_probe(dev, -EINVAL, "Too many LEDs=
 for node %pfw\n", fwnode);
> > +
> > +             ret =3D fwnode_property_read_u32(sub, "reg", &subreg);
> > +             if (ret || subreg >=3D chipdef->n_leds)
> > +                     return dev_err_probe(dev, -EINVAL, "Invalid 'reg'=
 for sub-LED %pfw\n", sub);
>
> Why are you masking the real error?

Because I try to handle two errors at a time, I will add proper
reporting for each in v7.

>
> > +             ret =3D fwnode_property_read_u32(sub, "color", &color);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "Missing 'color' f=
or sub-LED %pfw\n", sub);
> > +
> > +             led->subleds[num_colors].channel =3D subreg;
> > +             led->subleds[num_colors].color_index =3D color;
> > +             led->subleds[num_colors].intensity =3D LED_FULL;
> > +             num_colors++;
> > +     }
> > +
> > +     led->mc_cdev.subled_info =3D led->subleds;
> > +     led->mc_cdev.num_colors =3D num_colors;
> > +     led->mc_cdev.led_cdev.max_brightness =3D LED_FULL;
> > +     led->mc_cdev.led_cdev.brightness_set_blocking =3D pca963x_led_mc_=
set;
> > +
> > +     return 0;
> > +}
> > +
> > +static int pca963x_register_led(struct device *dev, struct pca963x_led=
 *led,
> > +                             u32 reg, struct fwnode_handle *fwnode,
> > +                             const struct pca963x_chipdef *chipdef,
> > +                             bool hw_blink)
> > +{
> > +     struct i2c_client *client =3D led->chip->client;
> > +     struct led_init_data init_data =3D {};
> > +     char label[32];
> > +     int ret;
> > +
> > +     led->led_num =3D reg;
> > +     led->is_mc =3D fwnode_get_child_node_count(fwnode) > 0;
>
> Deservers a comment.

Ack.

>
> > +     if (led->is_mc) {
> > +             ret =3D pca963x_parse_mc_subleds(dev, led, fwnode, chipde=
f);
> > +             if (ret)
> > +                     return ret;
> > +     } else {
> > +             led->led_cdev.brightness_set_blocking =3D pca963x_led_set=
;
> > +             if (hw_blink)
> > +                     led->led_cdev.blink_set =3D pca963x_blink_set;
> > +     }
> > +
> > +     init_data.fwnode =3D fwnode;
> > +     /* for backwards compatibility */
>
> Because ...
>
> Which part?
>
> Sentences start with an upper-case char.

This is a direct copy of the existing chunk in pca963x_register_leds
(subsequently removed below). That said, I'm happy to improve it.

>
> > +     init_data.devicename =3D "pca963x";
> > +     snprintf(label, sizeof(label), "%d:%.2x:%u", client->adapter->nr,=
 client->addr, reg);
> > +     init_data.default_label =3D label;
> > +
> > +     if (led->is_mc)
> > +             return devm_led_classdev_multicolor_register_ext(dev, &le=
d->mc_cdev,
> > +                                                              &init_da=
ta);
> > +
> > +     return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_=
data);
> > +}
> > +
> >  static int pca963x_register_leds(struct i2c_client *client,
> >                                struct pca963x *chip)
> >  {
> > @@ -338,37 +449,18 @@ static int pca963x_register_leds(struct i2c_clien=
t *client,
> >               return ret;
> >
> >       device_for_each_child_node_scoped(dev, child) {
> > -             struct led_init_data init_data =3D {};
> > -             char default_label[32];
> > -
> >               ret =3D fwnode_property_read_u32(child, "reg", &reg);
> > -             if (ret || reg >=3D chipdef->n_leds) {
> > -                     dev_err(dev, "Invalid 'reg' property for node %pf=
w\n",
> > -                             child);
> > -                     return -EINVAL;
> > -             }
> > +             if (ret || reg >=3D chipdef->n_leds)
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "Invalid 'reg' property for =
node %pfw\n", child);
>
> We should be propagating the real error instead of investing our own.

Yes, same as above, will do.

Thanks for your review.

>
> > -             led->led_num =3D reg;
> >               led->chip =3D chip;
> > -             led->led_cdev.brightness_set_blocking =3D pca963x_led_set=
;
> > -             if (hw_blink)
> > -                     led->led_cdev.blink_set =3D pca963x_blink_set;
> >               led->blinking =3D false;
> >
> > -             init_data.fwnode =3D child;
> > -             /* for backwards compatibility */
> > -             init_data.devicename =3D "pca963x";
> > -             snprintf(default_label, sizeof(default_label), "%d:%.2x:%=
u",
> > -                      client->adapter->nr, client->addr, reg);
> > -             init_data.default_label =3D default_label;
> > -
> > -             ret =3D devm_led_classdev_register_ext(dev, &led->led_cde=
v,
> > -                                                  &init_data);
> > -             if (ret) {
> > -                     dev_err(dev, "Failed to register LED for node %pf=
w\n",
> > -                             child);
> > -                     return ret;
> > -             }
> > +             ret =3D pca963x_register_led(dev, led, reg, child, chipde=
f, hw_blink);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "Failed to registe=
r LED for node %pfw\n",
> > +                                          child);
> >
> >               ++led;
> >       }
> >
> > --
> > 2.34.1
> >
> >
>
> --
> Lee Jones
