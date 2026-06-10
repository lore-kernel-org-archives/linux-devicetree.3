Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811941930F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102133; cv=pass; b=a1MesW9FBTi0hb+LYP13r8ieSbwdFXN7C7jYeq+FBPxHIL6VPGy2xFlhrvBmSd2P8CG6XvUUSWlrnZzzNeKWdA44O02apJIKJcWz/eYh+vGxz0S9NQt9bJwZ0qtzuBXztqswAQaSn0ofRiyHnAiTdJom+YhxuERbLmwUFUajjiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102133; c=relaxed/simple;
	bh=QQx6HdrZCLg1/bCUL3imDIU0SHjoIZfIndkzDKlCI1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IejwnMWEh3fU/ZfAW9MM/vhr5Igl+FEKOhoWdUWM/NLzf2xwUGGLvOFKsR1yBgN6tztKNrU1bt97WBYZC6tHGB+8wfNhP79M4V04UgLaD7zOK/IiKlglEqov8gdQ8KARlP3pR57nqku2X2H+BIhdbjKKAJgtmS8K6OMmeFdHViw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQm7/gRU; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQm7/gRU"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304f0039c02so12353231eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102132; cv=none;
        d=google.com; s=arc-20240605;
        b=fMInfrHDA5iDJcmO4Wg1RkR25elxvEJ6uB7oSd8AxvFhInzUUuG+zMqi8oTWDjfodq
         KLdpcMQlTvyJiRiStUjvRYhNY+45eAHJ4vVIUqAkKuKdtR9mpIeuu5U+jgdn3rXm40fb
         08TvsDDxIViRtb8HZuGeajzj3iE0DziLV8W5w+/2svXw+8H2pxPUx6jbO1s798kjclPC
         ih8kGgYpB/PF1YNIsp6/Pmmt7Oo1BQD0qbIqu+JANE3bPJbzWn+dPhsCPAtupevHBc/a
         6AtlFO8SFsqlNnOA5s7QCkY0nluSphENQEkO1MUr/yfuNv8Ot+HMkwYHXiRdvaFTf6Zm
         V3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5u4rWfzB/dXcaizEq3FSq09DXlW+GebEr04lNWgXuHI=;
        fh=cscJMTxFJM3cNHSE3ch8MmGoPhY59eGVaCv7QoVHQdU=;
        b=an7Ifz7P3BHQ33u5FvDjtmYJIXJz8I9IHOlzecltX2remX6Y85BK/oBISNT9jlqQhZ
         tz76pz8aYymv/2uWXpCz8leXjjql01XV3MeZzTe++2uJfnMRf22gm4qvCN1pz4i0+uIJ
         CDLr/bfHA3lYXnAMWdFUjQziXv/eTDRzE5BI+a1kuSkSbx8bVHFS0OFXGzvH9Y8MG5fS
         AHqIZfBSAfuINLgSy2yL5/vHF1Z/HYjvya/C6Km35y2/xg30zfExEwBiz6SdCl0Tnlga
         lxPcgzU+aLKh8v4BbDb/DbjnC42ZF6G6K7UGz9uWN7HB6rGzIHSW8gGyKQU7JU7R4Cpu
         zpUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102132; x=1781706932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u4rWfzB/dXcaizEq3FSq09DXlW+GebEr04lNWgXuHI=;
        b=KQm7/gRUZfsFKZqtrRX/8Gv0F6bhmSvFCeIsHmKzg4zXiy5wml4L2DCsSYXvR9y6VT
         dakAcxRGvyiyeLEmi/m/zwtHybvTK2vGxqItzgALr+8oc4OGZyYciXirvN9GSOw2RLkK
         49Vn92bndAK2aGF8/CBb1krYV8XgERip/wUWOu/2gqfs+ZtfENmUS6MNzPv1lIc8FRIX
         sC8lAPSWJ2RzX3/CQeIgHwZpONkaUhzMNPtYIc1hOpnirAwqodCd4glpOxDEpUKLRR35
         ws/Yz+J9Dp50xOxLOKTmZ38zDkB6qSGaeeevLFcfTPWN5pVFpAZuUXlPzW8qBX5pAkNk
         eTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102132; x=1781706932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5u4rWfzB/dXcaizEq3FSq09DXlW+GebEr04lNWgXuHI=;
        b=YvxMG8i9JbmIx5zenIPima7uTT6H2YIMeiQDTs0L4XedIYk+34p89rOCczs93Ddlf6
         AnR/wqd73/bm2sHJY2GJKXLy+xAT8i9n2ONzHkc3Wnw5KEqHdkIhHsAP6MGJCqXP6KUa
         oyf7BrCGAPZWk323S7xdYp9mAWbh4KRQM+6dFUO7tjo9dWEeLXflF0Ray139WL/i8MAv
         p42mmZZdxphbeJvB+cqsNFdiUcMp35O+gEut7BvF97M6mZCZTTetqf+R+WVXSOB3mWh+
         SDrwNNWEFtxazkgXPYH+oJjlQmkSwzQIXeAM6QnK1Rvoo3mIW5xU33ptDiqjB96H8UL/
         CMeA==
X-Forwarded-Encrypted: i=1; AFNElJ/65dEi4Anty6+gpwQ94Ezy1EKO5UuWI8ui0zrXnr28UzdzAiDsivl8E7IiFQVlOuVMUiOnsuEJl247@vger.kernel.org
X-Gm-Message-State: AOJu0YwVpNIBda+7Wm0hE5rK0jc2AXSEHYUlmqZso7azyC24jnagK+yF
	wgRAzH5MUJ91gl6uEyLZylcMrEwVCDlZObemAgpOKAYV+6JSlwvmIZbDl6Ex8NAhUO9R0VQeLc3
	uhnlZL8r2bufuMj+aPkJWdQ0IUb7l4XI=
X-Gm-Gg: Acq92OEkOn/5O2xz1HFwjSKfiLsc+VvvwZvvPP5ecfQc34GtxGAY5KOC5GJn3ACTtQK
	Y2z6TJf3HPqQgqEISU0miyx3S00qvw7nLGjTVpJ0fvvOwiRFzZn/e6HLd7ZUnWuMfvPBgs8ChNy
	gEph23lMN8gZR7mTa0jCoUifN/Z4pITveB9LIVOCZQ+HxgIsHIUW5ir3V03OshHferzh1n1SCqR
	SY+TXrVMcPI5HaVTCfcWrQedBXVCnyNuv0jDEVxgEIlKSSKEMcfXj54gxT4FwQ34h0CeOuMiRdI
	tT90Qr9KipN3U+PTYlI=
X-Received: by 2002:a05:7301:4186:b0:2ef:9961:27fa with SMTP id
 5a478bee46e88-307d62ddc77mr6085557eec.18.1781102131738; Wed, 10 Jun 2026
 07:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-6-clamor95@gmail.com>
 <aihlDGNZRuHI-vMR@ashevche-desk.local>
In-Reply-To: <aihlDGNZRuHI-vMR@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:35:20 +0300
X-Gm-Features: AVVi8CeF2WtE8NAfRo3Ry4_ONFpQ60FlY7Ry_ggOsna45f4Sc2pO4GqWSxBW8Fo
Message-ID: <CAPVz0n17uAvpyuF5_E1L49eoz8LvHULE0-SVjJpHvu4veWWjEQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:10=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:29AM +0300, Svyatoslav Ryhel wrote:
> > The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
> > used only in lm3533_als_setup. Incorporate their code into
> > lm3533_als_setup directly to simplify driver readability.
>
> Use func() when referring to a function in the commit message.
>

I must have missed, thanks.

> ...
>
> >  static int lm3533_als_setup(struct lm3533_als *als,
> >                           const struct lm3533_als_platform_data *pdata)
> >  {
> > +     struct device *dev =3D &als->pdev->dev;
> >       int ret;
> >
> > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > +     ret =3D regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
> > +                              LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_m=
ode);
> >       if (ret)
> > -             return ret;
> > +             return dev_err_probe(dev, ret, "failed to set input mode =
%d\n",
> > +                                  pdata->pwm_mode);
> >
> >       /* ALS input is always high impedance in PWM-mode. */
> >       if (!pdata->pwm_mode) {
> > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select);
> > +             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > +                 pdata->r_select > LM3533_ALS_RESISTOR_MAX)
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "invalid resistor value\n");
> > +
> > +             ret =3D regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR=
_SELECT,
> > +                                pdata->r_select);
> >               if (ret)
> > -                     return ret;
> > +                     return dev_err_probe(dev, ret, "failed to set res=
istor\n");
> >       }
> >
> >       return 0;
>
> Wondering if it would be better to
>
>         /* Bail out when in PWM-mode */
>         if (pdata->pwm_mode)
>                 return 0;
>
>         /* ALS input is always high impedance in PWM-mode. */
>         ...
>
> as the above changes almost every line in that conditional.
>

This is a decent idea, thank you!

> --
> With Best Regards,
> Andy Shevchenko
>
>
