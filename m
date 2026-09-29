Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8DE5012B9
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687297; cv=pass; b=QO+g197rTA5rvVGpI+rC9b+z2DyYVoBxwEwA7qH31P8hRqhoYvI7is6HzGq78/qOK4StETSLAdlqxBA3aoXl2RGiv2KClRXad/99BQFgcvhVpuNJm7nnVBu8ipIpzbySbqvJlBG4RQndvVrov719K0x0PLwikFK637DY+nzj28E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687297; c=relaxed/simple;
	bh=EM0hyZUrB30ui770u2/66WPqaHQ3vUvTAK1vkoxgYQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihB/eOUf6wwnetMVLFt7gO+T8I923652q2SvGuLdGLllhVpYc3PWguZyAsKkPcpDMTr8Ukc7mycpapYsSXmVGWT7eT/halM3tErHH1M+kwWHZRsXeZvSAMEkAM71br2c4bFIjLDRAzAvm0lPw1QOMnDMwIirzNoMj9cE2D111ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib84N902; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib84N902"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-805c194bc92so5065928a34.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687295; cv=none;
        d=google.com; s=arc-20260327;
        b=Q4C1KCxG0QWrj/9X9Wxv/wHmlQfsLmSPSm6M9+0wXE9uOCmQ+cJY+j62Ou9YOYF0HX
         0KSA5NIlqpSGXfuA4+4cKpxTaxRn8l8540VGX3v0TSK2o3UWURIk4wRCvmplX1YhcLeP
         5a67DLvIOszRvVgSs1H6npG+V7/Vh1JtwxAWVL5XSlqyTAu4mpjZ9soT+7MgcRqLRaFp
         qAN5G82q0QeAgDRvNYE5r8TbLwuDJxK7tJirObpQZhom1OQap0v11mtyo96ofS1EufdS
         nv+hGi7kNYxNA7YZieKwTwQh//skYjKcsjUH2lUnfqhn5uU6v3jP3VGBPw18hxVzGeAR
         sbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BzdD5Sss5i6U/JDnnUUjSN/BwY+wJHaWFoU0VMpSGVg=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=f04OJzlBti/C2yaD98jOA1/PqH00isOUawgyaddYghMXzoRfmGhmDgvxdSmfus1gMI
         YEUDLKWRfNc6osjwCvKYYUiQx/3V98ylxF9jsbGrp6/G+P+VvTwohfmrYoJbsnwc5qDT
         OJTTTXm58OAWwP0u/xnNueZdhIAzzRgprnovl+n6zdD98PNO/2Fv+2SAhHPq0PJP6fsl
         EVbF2m45/c1vU1NCsSPlqi8o9YyTzBUi9ne7AkdYa6w0/bH4xkS3ZgUMoKGt8Bkkv2AE
         byixlKj4CoCsLgNW4TWRQ4FkpatDChno6nLrYzSFpRCqYJtKxRzMqHp3V47GsGyIjt/j
         vcLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687295; x=1791292095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BzdD5Sss5i6U/JDnnUUjSN/BwY+wJHaWFoU0VMpSGVg=;
        b=ib84N902BPrIJS0FYkvr4++4ZZMBrszKeEWu9Bu3092qlaZU3WgYdjwAUMANpWq4IR
         KQfXsyyU2ar321rSO93KXgDyctvkrk61CzsfbyZf2xo1nrpQS2t3I/ROiUyr1ro0otVX
         jDpOJPJHr6UrYEEulS85JP/qYSp0u23fSOOdGN2nrm5Qwvm0CTdirj062EIJ9kZspA3w
         O7kuq4c2G6kzm+ebyo80hyzrKPT/Iepp67l5a3JugW8Ev2aKum07+5FFpp/l3rAie8NE
         OMfxnZbjFFVsa4qbDEmWo09o6kxNpZCYGaJ4iw5eoZSseL0qs20ltjVX46SptuZ11yox
         /OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687295; x=1791292095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzdD5Sss5i6U/JDnnUUjSN/BwY+wJHaWFoU0VMpSGVg=;
        b=yAvwRgDC1rQ6r+w4gmZrOhWy7SgoDzPYiZen8+XBuEVhMp0Yfixnjavbv0PvX/xy4X
         tOSAciO+Q256T1lej0Xj5cGhTI7k6vnZjmsXfz6zqd26t7FmaiDKISuQxXAU0CoOW/wk
         f8Hw5kMYhpBhP4OSUb1KoAqUO513lOZ/iq6AFnoQGnCWf3DBgpe2BOtokUJ+0a9ehHFX
         nIE7GMk3v3FhTX33paT6jU24ZJNEYZXy6ay6r2J6WmPx4gzSatQ3xslZFhXqEZRSLJCa
         TnLKn5r0gLN6Z0Q0omJ+t4AOdu1bhhx0ghBcGht7H5f7l2WkoeBpKp3NlyinJ1PLE9Li
         /Xmg==
X-Gm-Message-State: AFuF++mjOBXwEHNgGaOE+edd59QHs/N7gBAeyrxcKrUVC1Y9y0YLGYfj
	RycMrKZeQrGkoc3i7BAV4W1fexiHexGA3CAxkZNxd4tVwVL7HJS+Vs7F478qeBMJXKHk1sexA2w
	ILDRZaV8OtRhmU6lQEVauOi2+eb2sm3o=
X-Gm-Gg: AYBFou2c6Z/OYPn7qYFo0Yu/qb5XLjRhIVRz+YrhGE+FQb6NE+hUF59RtbxWdfb8eGt
	arLaxbAozj2djPYTyS7vmscIsKRYVTFD77JJ1cCUnEsgVvhuMlGEdrJFUWsuUxOo7oIq6SXf9HG
	T4aQqc8Kmy7Btzg0xguKpbH8zLiWSI/ErfttviXmNRsviuLb2H1n0m9+YD2c3I9nyNWa+D+vlqu
	mILX8GffkthUbeihwLeTxh2Ba+mXV7PCu41c4ehA9ZX2kLrU8l8yN2Ii/Gy6/MeS1yKuc2Bu3L3
	Wf9OFDxhKeCDV495/X1ZFVDekdoM0BVaR9csThMyhNhPWM78DZkjIcZ6
X-Received: by 2002:a05:6808:1201:b0:4d6:92b3:c1ba with SMTP id
 5614622812f47-4d73154520fmr15183484b6e.61.1790687295187; Tue, 29 Sep 2026
 06:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
 <20260729114312.3947300-5-chou.cosmo@gmail.com> <20260729115102.B7BA41F000E9@smtp.kernel.org>
In-Reply-To: <20260729115102.B7BA41F000E9@smtp.kernel.org>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Tue, 29 Sep 2026 21:07:47 +0800
X-Gm-Features: AclHuK8qb1XTYKu0Ux_gt77HR3dgzEFvQuRam-gZ16qnagUp_F64jHCsH-lemmA
Message-ID: <CAOeEDyuqPcEdsF3E4pAorAyTb+E0VfAPhDPB8m85c8weHROwWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed: bletchley: Add second source
 ISL1208 RTC
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 7:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Adding the ISL1208 as an active alternative RTC introduces a sys=
tem-level regression on boards populated with the ISL1208. The unpopulated =
primary PCF85263 will register a phantom /dev/rtc0 device due to a missing =
I2C failure check in its driver, causing the ISL1208 to be registered as /d=
ev/rtc1 and breaking userspace time synchronization.
> --
>
> --- Patch [4]: [PATCH v2 4/4] ARM: dts: aspeed: bletchley: Add second sou=
rce ISL1208 RTC ---
> commit 02d65705396424e85939c4fb70bef75dc330e54c
> Author: Cosmo Chou <chou.cosmo@gmail.com>
>
> ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
>
> This commit adds an alternative ISL1208 RTC node at address 0x6f to suppo=
rt
> boards populated with the ISL1208 instead of the primary PCF85263.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > index 3da1cf9bbb990..01dbbda3e4b6a 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > @@ -1269,6 +1269,11 @@ eeprom@56 {
> >               compatible =3D "atmel,24c64";
> >               reg =3D <0x56>;
> >       };
> > +
> > +     rtc@6f {
> > +             compatible =3D "isil,isl1208";
> > +             reg =3D <0x6f>;
> > +     };

This has been addressed in the driver by:

  commit 78acddfde751 ("rtc: pcf85363: Add error checking to regmap
calls in probe()")

pcf85363_probe() now propagates I2C errors, so an unpopulated PCF85263
fails to probe and does not register a phantom RTC. On boards with the
ISL1208, it is registered as rtc0 as expected.

> [Severity: High]
> Will adding this alternative RTC node break userspace time synchronizatio=
n on
> boards populated with the ISL1208?
>
> Looking at the primary RTC's driver probe function:
>
> drivers/rtc/rtc-pcf85363.c:pcf85363_probe() {
>     ...
>         err =3D pcf85363_load_capacitance(pcf85363, client->dev.of_node);
>         if (err < 0)
>                 dev_warn(&client->dev, "failed to set xtal load capacitan=
ce: %d",
>                          err);
>
>         pcf85363->rtc->ops =3D &rtc_ops;
>     ...
> }
>
> The PCF85263 driver ignores I2C communication errors during probe. If a b=
oard
> is populated with the ISL1208 instead of the PCF85263, the absent PCF8526=
3
> will still successfully probe and register a phantom /dev/rtc0 device.
>
> Does this cause the ISL1208 to be registered as /dev/rtc1, resulting in
> userspace services like hwclock or systemd-timesyncd targeting the
> non-functional phantom device by default?
>
> Should this alternative topology be handled via a bootloader fixup, or
> should the rtc-pcf85363 driver be fixed to fail probe when the hardware
> is absent before adding this node?
>
> >  };
> >
> >  &i2c7 {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729114312.39=
47300-1-chou.cosmo@gmail.com?part=3D4
