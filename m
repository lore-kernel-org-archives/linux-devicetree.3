Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347D93F4DC5
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181115; cv=pass; b=C2lP95b38LId2vMSki5QYPckxCMPfnQXvM/Eb+mLR19rr+EpzlCuhYTiv+zeOazkLxXhDtqKTYDe85UKqByHHPctaGEGpBG6gbdrIEsOCP0efTuRq/E7M/S4Wi5OsDC0rOukz2qb5TJjbeRa6jgLUzcrZEQ+3BNPyJcNYIuCjiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181115; c=relaxed/simple;
	bh=N9w8AQ/izAnL6SZkvE0t7Zg95S0t93+i10d7C13tBDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OiOrWSWf02pnG7jpDIp+gCkHr7ma5bGzFbSrDsFWLCbT+6s7Z6ysiwW70kHXmqZrZKeg8IXYj2tvmM46YSi0ARhYP4eBlGAHAFnCq5dY15HGYx/8DK3ePsYNCAttm9sOPCjeT9gEtsbPoxoVGuoBEJOLk+grn6t+7yBV0TbhptU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMrjbGU/; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMrjbGU/"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137335bc3caso10123649c88.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781181113; cv=none;
        d=google.com; s=arc-20240605;
        b=lxDhYQnEtD3YGKRsJ/UkNupOjm0oFfxBIyQYCoZCbSrh6wdUS9+UyiMlPSnO2kLsyr
         5zgRteckVB+qcG2igZXjT3H0E+LgBHJKaBJRjwdEDYkKIdvnLMvCqd5+kZCo83S0UMsA
         491Mios9PJgseusbZMx0GRpm0NkexL90owean9HJI7jMScFm//NwYbD9+5tNewX/7MjY
         tGMZPOpkk1sguA3J4xVdbrhK4BfHcf+8hKGx9FZ7h+xY+7rZJKiPVNbOSdyR976/qRKI
         v9C9o1V4b3FUkRf1MiURZ3bcQjEmc5xnJa82my15Vi2/Z6Zeel+e7QhuA93oXRZUCmEw
         Gqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4CyzohY6NxCIsHAPrysIwJ2ZeDEULVaTSdexi5v2m4=;
        fh=BdFEywi2WagX/YEYxqnlw/LW/gKArPjf7LRiURDxxUY=;
        b=IaMFt0xVqv20XS5BDj2wWtrcA6SpLLCy61Nb5j5g0Ckby2is0uEC6PsgakkPabNK5F
         JzgUt/xWOOxghmv+y9vpEbAB576o0lLykpmVopIzXAM07bZDuRoENOyTW/lsQ+DSaDZG
         6XC1+mYsVVvQUerzyKQC32yKqiZjVkELl1YKJfUSSNlynwWbHVZOKGIsiG/uTRun6kA8
         UCFQmO5cC9iwhxmvX2yVTYjOSfpC2b3Nl06MJ032+htjFYRLKRcB/ll0gGhy0B6jalUP
         NYeQNxm/7GdiqYP9g5bUJhyXa3R3WtgDSiPEi1BfYNkzSvy/I2s694SoZNTC1FJPqS9G
         4sgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181113; x=1781785913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4CyzohY6NxCIsHAPrysIwJ2ZeDEULVaTSdexi5v2m4=;
        b=jMrjbGU/K/MiY2zpDfjCinZekRAjsHLsioZc4nj7eI4VhBvHnKb1u0mEDXZ6rpWSDc
         AFAhW+U8S/DDVHpdGjmLBtrX60cuCucbfedeMIigZmiyxFnFldmIr6MZ4nxTnrDPDhNk
         Djj0Yrjtf3uuX4fjdVvrEtKWaucr1c71MLU6RrNKuPHywTKCL2i7fnDs79eHmkqVkxgc
         7cwj57+IS/kQ+HMIFG5awsEfTAzAS6H/XvUC0URVujIuLj0WoxmR81MdiiNc0TVjTVbU
         p0UEzyUbVf42N3mVisgHO8vf2ahgMH92KtQOYVcdOJc6n20hj5gecF2MxtIDBesF9yVi
         3sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181113; x=1781785913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w4CyzohY6NxCIsHAPrysIwJ2ZeDEULVaTSdexi5v2m4=;
        b=OFM+wqosGWex+IPjbrgVrPVL1Fch4IHzGZGJLIO86Yn0XVGsJVut8YptJ2GHPQLC3d
         VfavBQVQGmHtQQ5EhkVSw1t0udxezP32cCvKkhYmnJEtfkCeGoPToJmBSZNWQn4RU1o8
         83gnBCgJLGGwh6nbGmPn9ih8otbg9SnIHA7zSXxlfAjZ5Np/kFy3gypV+NrhcIM7N2dy
         by5aNrrnlL9jjlF9VrOq9iFAd/2+bXAMuxvQ6EI2ST1f0PmSQJEP9e+meqcMReoGZtcj
         hnZeRxJAtwGg4Rx1cuLmgATSSN3lu+oS47SaHUfxQiYEPq1HVtBf+qmiMOCTX1UnWFP0
         bojg==
X-Forwarded-Encrypted: i=1; AFNElJ/fkqkofT68ANSXJnXSdWnf+ziiBD1GHIvqW9RBkHosq4fmt7t+KKjsxOI66Qg9f8wTOTBozJPa6Spa@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBbPg5Jd8L0jgTRfYSAWdmFMV+agMz0scqvlGytEwrYdb/AvC
	6aG920Od274DBVKr92JVUgkeZETnFCdCdv1FLk7/JAZ+Ku5I2FB563eZAZXEtoTd0OeTXbi5/oU
	/tErpPg5LpwsQUsWUn+IK6DHWT0ZZB8c=
X-Gm-Gg: Acq92OHwxmb3c+gJ+UxxSwpGNfAdFnTGQQJuTfRME0I2t6di0i+h1h4zYozRZOoSpl0
	VVhbHK8DBw+2/Y5qeq0N0sGYM27G39S0cBb9wEtDDGOdoxO3Oll1eELuzS1xzNB7hr2puufSZ77
	VFST+IGhYB3fnOVWVqpixg7rhl4Dkkf6SoggOZZNQQx5ebDm5MeTiyvT6MUak90WZuobyrts2td
	VN4f1pFszvafx20a1IHUVbk3JJgTxn3NhjX2eRMqHvRJN2fWRQBZyN+UKgf+aNC95OYjOVOkBML
	yIq2qkdOzVq+3AAww0o=
X-Received: by 2002:a05:7300:2205:b0:304:13f3:e461 with SMTP id
 5a478bee46e88-308047892c8mr1778310eec.3.1781181113170; Thu, 11 Jun 2026
 05:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-8-clamor95@gmail.com>
 <aihl9yIqN3adKWLr@ashevche-desk.local> <CAPVz0n2+27QVeWNgPm3PH6V2Ceuym6sbMtUrh7hSHe9PcRmfMA@mail.gmail.com>
 <aimxK3asZjebYrNt@ashevche-desk.local>
In-Reply-To: <aimxK3asZjebYrNt@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 11 Jun 2026 15:31:41 +0300
X-Gm-Features: AVVi8CfaCeDkKO_UpXhT478yTj8VjHK953EzmbL2Rc52Hp0WrpWg7gTbUSSSXw4
Message-ID: <CAPVz0n0z_6fuoxBzLcN0VdUBUWZB1c0VGsAkDW3xXnPuwZj-3w@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] mfd: lm3533: Switch sysfs_create_group() to device_add_group()
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

=D1=81=D1=80, 10 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 21:4=
7 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 10, 2026 at 05:38:38PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 2=
2:14 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Sat, Jun 06, 2026 at 07:57:31AM +0300, Svyatoslav Ryhel wrote:
> > > > Switch from sysfs_create_group() to device_add_group() including de=
vice
> > > > managed where appropriate.
> > >
> > > This should use .dev_groups member of struct device_driver.
> >
> > Specify pls, device_add_group literally uses dev_groups, I don't
> > understand what is wrong.
>
> dev_groups of the struct device_driver. It means that the data should be
> static and be available before driver probe is called.
>
> ...
>
> > > > +     ret =3D devm_device_add_group(&bd->dev, &lm3533_bl_attribute_=
group);
> > >
> > > This will make Greg KH very grumpy. (For the record, original code as=
 well
> > > but it already is in upstream. So, thanks for trying to address this,=
 just
> > > needs a bit more of work.)
> >
> > In the prev iteration YOU asked to me to adjust this. I have adjusted
> > and now you say that this is not appropriate. I will just drop this
> > commit altogether.
>
> Yes, and I still tell that this is the way to fix that issue.
>
> You can even do it yourself in a few clicks (hint: `git log --grep` is th=
e tool
> of the day): 93afe8ba9b01 ("ACPI: TAD: Use dev_groups in struct device_dr=
iver").
> This is an example of what I meant.
>

Oh, very nice, thanks!

> > > > +     if (ret < 0)
> > > > +             return dev_err_probe(&pdev->dev, ret,
> > > > +                                  "failed to create sysfs attribut=
es\n");
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
