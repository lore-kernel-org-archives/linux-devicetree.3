Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426DD3976A3
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429476; cv=pass; b=XA7fyTiwjgT72NTZyz5CksRZAwFnpOB1/480eDgRWKCw5AWfCRtIQgHbxLuTUDRpDfVZZ+xCejeAAGe3vfq7lOiLjIWIxHFJ/CJBy1f7O6GOAauV03wnOf+498yFhmoGf1gm70FSuDms3gUnlI2h76BK9aS9rA4C4ODgYvqgT04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429476; c=relaxed/simple;
	bh=oIu6DN+Yo1GS9V6OFVEhLzwsWKEJ4+izexh3mPX7P/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZpH7vawCAzawJknVUKw7TI2l3XN/dPaFkzyXFmHodGZfVQt/wrEgpvbZ9j6rxbT5geXaEAB28sSYMIrmkalbHjmQ9AdwBdlmxQZHjQ1Hhxk9LIcQTetDrQkmZfH1lVZxtx8nnvxKmXAiwHehxWEEPPEGg06BjUR8f+EurqPdJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKvfZEOF; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKvfZEOF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so470927f8f.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776429470; cv=none;
        d=google.com; s=arc-20240605;
        b=f2WrL+zYnuPBmyusJUicnTEJwZujHrKOT5IIfgymPsK+0HbmsnIQYWhV3BDhX2jh0T
         WREDboCPMKW/teHBdNleTplRXlVzXi2vXA4gtFKSSsE4XDlnYNW9zdqeb/oZSDMyaOGR
         LGI4uO8U0XPvzJ6PZNDysG70WWuRBiKbow7oTh/4bi7Xiw5zYnnr49Hce85up6hP/Fdf
         HI2N60IqJPDJmUE1CT7WntS0wq+jJgVlW3qUYjuu/VbwKUkV2+z1/5lfxc7ky8UYdG0A
         stS+tfM6gPX22trMKn2vYUaE8KozFxKgcWR73clXupF8rxXiqyI/PhcG/+pXge6oIcf6
         QRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        fh=qqYFEOhWDcUPhIhlqaMrd5x1waxPiDsjpP79a6EsWRU=;
        b=Ji7GLCvl8leQ0W1oNBNhxjk+X/x70VOC9sn6qlC+m3S+SvbrOs9l6rWl7iBqb9YbuC
         JUWrOPKO0Pp/gM6t9AMXn5wuarWnuqnScdg1K2OIxUdaUezAKHJrz+evRYHXNbfw7j2g
         0+YFYroz7H8grULWhgA/apACgxnqda7FRsqnr4xWOAQ/cg98RazUMuZ8m2RmKZ9BYG6e
         J4l7TyOH/VIKGPpUmiDkyVciTFtJy4iuOaOc1mpPRjHFAp4FfgJI6qIPmgLGNcb2vzdO
         kCl4rFSY7se/UrERteRCX8wQCru/3igJ0qVScr7hP0vHp7c+6F0JPr68CSt9/P9+/K1a
         almA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776429470; x=1777034270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        b=DKvfZEOFlif43UowkBTiqnBqo4w51hQ1NFE+e3B9wKKJmkL4Dnk3gfxApDI3ObV9i1
         RzS9mvQ3X/R7E+DPEnUSs2AhquNJuCPY7v4Fxdp8ID6l7VihnPSBXV/V2o7+atG/TYUa
         g39OwaJop8TMOXSsDrdpQ3o+v2t1jlG4ca0YMuHBJs4c/CBiaquJ6nJka/DLSi7f3z3r
         H7uduTF2cSl4ZGjxgWcMrkdG3VD0TrbK3IwHaBDau7r7ziu/S4aLEZO9lVqZxwmHLo7V
         KB6FZ1EI9zs93NgzJjHfneT8GEXgZ5lwX8sbwzrv//QnhECprjlcu8U/PC7ctZzyjQ9W
         Xjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776429470; x=1777034270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        b=N3/YH356MOOCdPJzbqBw3go/A5t4dwxfqQhuQN/hIkoaHWd/VH11vA0/cI5Gbhg3EP
         eg7JDoRlFI+Yw9Wcmy8UdMA0wczAq2fxBzrxYDaFRMTDOIgp5Nx2OslLb984POd1/ImD
         lKhSfj3Vpu1GYm/ed5ZIaT34f9fyeN9QGK42wTZ4lujYYy4j0pni6L3hSEkB6FSu8E1G
         R9/mzrExIxt03/Qf0/mMeoFJSPYnZr9dJhevlrQHUBJ3dfJn4McyBQlHxrAg7nqjEMeL
         WDmcTSBwgnnqSlhn4+1H8HtVFNoIFX7B/aPlQdF5HMcJ7vxcnQ63Zjgw6H6R2xXAN5tV
         o/dA==
X-Forwarded-Encrypted: i=1; AFNElJ/kWdJGVP5Ny7e79DOx2YRrltwDYP2RLFwsQV9L+Llf8GHQXfKoTxOHdvSJDvi2AIEVYqmTOEc0j3OQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjqCtos+2GJrHMCq+ByCE8MZpgaDEwMzHjkVjEJSYPDzkskMq
	GmltW6Bg+x2Xdq5sWI0UL0CA6APy+f/FHgfh//xDLZfIt83/4LFE6Zh7fAiO7no7nDR7TTFoHGP
	9lNRmqR3HHlno4hJwwFURaE5B0/UG3enq1rcW
X-Gm-Gg: AeBDiesxXY3PtcVLoxmft2YJE8be8rzeAPbHCrbHxwVIPGkMkVGAk0TDhS/ZYuGhw4r
	UblhTGpr4EdojbgTSgUCp+nH9Nws+A84pROTYMFI6J1EBHzyHgj7up6WZ0q8knk23RWC4IT3TOF
	cEAaYDLnZWW/b0g/8ze0e78cNYhbkS4im8Rn7IlwIANk2IaWSjKTAXhRlc6mBJjR7Sfc3WwijZV
	O0vcmVnRcOSSdVS8Y+hxnFrINKku69TIv0Ay/8weo+M8JOCG+W0fwT7Hq3D+mRGA2IYitmj8GYO
	xqSiEUuoKC473hqlLaA=
X-Received: by 2002:a05:6000:1ac5:b0:43d:73d4:b1a with SMTP id
 ffacd0b85a97d-43fe407c0d8mr4468477f8f.19.1776429470199; Fri, 17 Apr 2026
 05:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417114226.100033-1-clamor95@gmail.com> <20260417114226.100033-3-clamor95@gmail.com>
 <aeIk3z8f4dvjEXBQ@kekkonen.localdomain>
In-Reply-To: <aeIk3z8f4dvjEXBQ@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 17 Apr 2026 15:37:37 +0300
X-Gm-Features: AQROBzCGajxfHOMdb-jAWC2IPNr-tHIUYgt6Ny8fWbZU1eaEM3yL-TGQmmJHhU0
Message-ID: <CAPVz0n0vf_Re-4s4ygOP8aAMA+b=o7yM+UYVZiRUfkrJ931J2A@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] media: lm3560: Add IN supply support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
7 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Fri, Apr 17, 2026 at 02:42:23PM +0300, Svyatoslav Ryhel wrote:
> > Add IN supply (2.5V - 5.5V) found in LM3560 to ensure its proper work.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/lm3560.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > index e6af61415821..a2674af6c9fb 100644
> > --- a/drivers/media/i2c/lm3560.c
> > +++ b/drivers/media/i2c/lm3560.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/mutex.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/videodev2.h>
> >  #include <media/i2c/lm3560.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -434,6 +435,11 @@ static int lm3560_probe(struct i2c_client *client)
> >               return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gp=
io),
> >                                    "failed to get hwen gpio\n");
> >
> > +     rval =3D devm_regulator_get_enable(&client->dev, "vin");
>
> I'd also enable this via runtime PM.
>
> Sensor drivers such as imx219 serve as a good example here.
>

Would you mind if I squash adding hwen, vin and pm into single commit?
It would be tricky to separate them from PM addition. I will add
descriptions of what was changed.

> > +     if (rval)
> > +             return dev_err_probe(&client->dev, rval,
> > +                                  "failed to enable regulator\n");
> > +
> >       rval =3D lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
> >       if (rval < 0)
> >               return rval;
>
> --
> Kind regards,
>
> Sakari Ailus
