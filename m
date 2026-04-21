Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D231985D
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792751; cv=pass; b=S3GMJzmYX8HtY9Y/VsSpFWCUmIKQHOV8BRXcmd5Q5mpq42LDp+JbZfasPXee3F3qBTcV7k406DsSEZkAc5O7KEmeqfWP0cogccUCcQ8TKs1/MxcXitRd0FMKP7o1w2ZjCe+sS97w6SEN1SMje/TmpBdVuamHf+Xcwpv06B6uH6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792751; c=relaxed/simple;
	bh=3opUxn+/WZhxis9gCx5CPLMTFPxNfsZrec7JCcuzKuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke0/M5U2C7N09WSW3V2B9G7x925lu4Gvn5TMWQGNuUmNgHNJVHOQFvNdh1QchqPS9P11Vy9BgLXSOEbyn+vWsmhTvpowMBEx0E4QWcTRQDW+x5GR62tXqnhzfYVsh5xPJ9EKTyJ8NEsVTzEeWXW+a5oSvQ7v5OPztRFPHQMt8RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXtnpz+v; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXtnpz+v"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43eb012ac4fso2760813f8f.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776792748; cv=none;
        d=google.com; s=arc-20240605;
        b=gfMzoKBRySJ782d0O2XQsnVZOOVzHjLFEUXVhEslh4z3POTUV7FQP6PzFjSUX3nOtF
         ndBkwHy9jxlo6mMAT4nHtZgtO+FpWPOR58AcWbFfIF4h5YeeXU5ZkrDCqQ+B5Y+t5yEq
         jkQL9kUIo4za7vwPnVv1cbPfC/x5kTET6odC7bK51jlGM3pAjAaq9+g2ZRQwACbmlbO5
         vcaPJG2r1XcWVYbOwub3nN/kncpkI2YA9cUN5k1p7B0UgC16Qh9BGAKjSJu554PJ9qcT
         XxG+DF0e3NlpYM6FRB5k/dXcdxu31lQjF2GyOYVs09RKw6NbTCV8YEde+SPEmlM1M1n7
         HXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        fh=r5UOfUQlCZEen053dUfqTCiTZMQO8i/TdDPS0s8qYw0=;
        b=TILDfU+gqi7RhLapn3wLh0ny39/9XiCzAo7s4E8HngEK8qIURDqmn7pHKVYwI+y46s
         6NDGKtOovwVOmdcWibqapYbvppZSfaGIrtShEEWw0MJ7546IF0QFjOwVw91Rq+r2/dVu
         whUrxb8FsCCcWtLBRmo+azeND1NJ81dddS0IgwHQ5e9Cmi6+HwIQDE7xEShQIF3JD/wP
         mmf9d5cZpgYakWc/6W2EMHP7GFNjt/GfS9qMPIDz0plmi1fmffjP83FF4OV/LGkr0/RO
         NXe7DzvJqyk38vUIiPINTpQJXjPnOwOS7Of+clxr71N+gRePEUMgoYxFgqgbe2HA5HN1
         JxIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792748; x=1777397548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        b=RXtnpz+vVsfieKGkBLCT524hhYy58bk1vQvzrpJm5mVTZ+ffZbyMFd5NAvxBUyZ5bz
         gOtn/3Azbt27XKOtGRA3h9IDU6TDUdg7vSieHeTllDEqapXeZ8tJKuLnCHa7sHBlBXKk
         Tk9gbWGI8RZDbIthvPRYHBg9cyDsY6RLYyJ3tAN74oCagC/GSRc6jifjdgh0H1DWBQaB
         Tel9o94nHI7nmE5m8uZ0JHEgNuz8QFieOlSJCPwhsuN7OwSHgsXargSXS6geEARw9fRx
         MI2h/mEHGZamV4Rsa5x5i1UCt0X40ZuKyRND7fdlLJAAxOyrMVt0MM/sGUKMiMu82xAT
         hKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792748; x=1777397548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        b=EuEzKC4BHzdUaGCXGAg/bxzCp9RMH4D6BYsNhIuMtxd7npoMxnv4IAuaopK50wWlFk
         2DDjc5FXx3nsNTrmC7AAp3wcnE73za3FxVajm2PUdPhspN1GvZxqV8V0ejF2gHnbPtY7
         fU4GaRVuiyBAT74Z0OtBPpG4B+XASPQV0gLzLUSyWacoNfccfbd+CECCEGXVoqgmHVod
         LFKCL87Nt66nEOMyFFXgENZVrGuQ5mgt9T0ChJE+P659xyQFVXZPfCq+ho7rqKqw1riw
         2DermqT3cj8N3xWNGw2PFkBV7vnbskURMvJCYY+oqjO2trdDlKgvDRTjNLFGxWcoI1Ag
         9iJg==
X-Forwarded-Encrypted: i=1; AFNElJ860RcnI0qhVR6gBrOyGs13IQhYtJFEAntcXv9bq+Mhv8iYkjrVAkPSUypAZTVrUWE+ywTxtVppl47p@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5SxZMgk1d3lMZDTVf2PSLzkmzuF1WB/yAD40k+yXQCZmWM50
	rQI6N8RTt4MjAIfK5G4yqzJghItppIVMRAImlRHky7ydHiRH2SLvmaJx0QBaolzzxzLTa9TDFye
	STw/dY+7TQhFHSF8H2Gg9RMx9S+ANun8=
X-Gm-Gg: AeBDies3PnSh4bUVcovXo3fa2jjFef1RwQd6YVZzGkJERNSDfHDmZCHrlSC242EdCML
	CjWVA/cB3GkzZ7RzFq9GjptcEUbMWdZH8hc2+BX/sS4JYoq2ib/6dk8RiArSmv0G1aqw6lQQrlV
	O3olWio0suTEpS4gBSCM5GKewf9c4D6nU7RI+TFYS+yLP6jspLvOShM52HVo1uBPTgdGlMT6ruu
	8DaDRzb/E5VCdwKu+b4MZ9nXNOmQZCKuVZBUryoexOawH14Lqq431itPjiIxHt6vOV4fk8YSfBa
	13WeoNPiS8CTIcEd3Lk=
X-Received: by 2002:a5d:5f87:0:b0:43d:1c21:ead4 with SMTP id
 ffacd0b85a97d-43fe3dcb248mr30377905f8f.18.1776792747978; Tue, 21 Apr 2026
 10:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain>
In-Reply-To: <aeepbB72uWDxvnE_@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 21 Apr 2026 20:32:16 +0300
X-Gm-Features: AQROBzCbB1odtYIeJLEi8nmSeUo4a_e5KdU6vNd6lzpNhb-P2paG9uccQadFGds
Message-ID: <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:4=
4 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Shyvatoslav,
>
> On Sun, Apr 19, 2026 at 12:34:12PM +0300, Svyatoslav Ryhel wrote:
> > @@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_flash =
*flash)
> >       return rval;
> >  }
> >
> > +static void lm3560_power_off(struct lm3560_flash *flash)
> > +{
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > +     regulator_disable(flash->vin_supply);
> > +}
> > +
> > +static int lm3560_power_on(struct lm3560_flash *flash)
> > +{
> > +     int rval;
> > +
> > +     rval =3D regulator_enable(flash->vin_supply);
> > +     if (rval < 0) {
> > +             dev_err(flash->dev, "failed to enable vin power supply\n"=
);
> > +             return rval;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > +
> > +     rval =3D lm3560_init_device(flash);
> > +     if (rval < 0) {
> > +             lm3560_power_off(flash);
> > +             return rval;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused lm3560_pm_runtime_resume(struct device *dev)
> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +
> > +     return lm3560_power_on(flash);
> > +}
> > +
> > +static int __maybe_unused lm3560_pm_runtime_suspend(struct device *dev=
)
>
> Could you change lm3560_power_o{n,ff}() take struct device pointer as the
> argument?
>

What benefit it will bring? Unless you propose to use on/off functions
in pm directly, I don't see any benefit in this change.

> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +
> > +     lm3560_power_off(flash);
> > +
> > +     return 0;
> > +}
> > +
> > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D LM3560_LED0; i < LM3560_LED_MAX; i++) {
>
> You could define i here.
>

You mean:
 for (unsigned int i =3D LM3560_LED0; i < LM3560_LED_MAX; i++)?

If yes, I would like to keep it as is, it looks cleaner to me, and
this part was transferred from remove as is.

> > +             v4l2_device_unregister_subdev(&flash->subdev_led[i]);
> > +             v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
> > +             media_entity_cleanup(&flash->subdev_led[i].entity);
> > +     }
> > +}
> > +
> >  static int lm3560_probe(struct i2c_client *client)
> >  {
> >       struct lm3560_flash *flash;
>
> --
> Kind regards,
>
> Sakari Ailus
