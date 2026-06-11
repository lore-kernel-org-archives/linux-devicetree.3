Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3143D88EC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781200099; cv=none; b=nHY3niezyb5yqDm5QLEh0Tq4R0adRS5NMrxWE/O8rKYmo+0McP88ehG7PpPM5LQ0DPXMKwDNyBcAyM1NEM40d/igIdegt8XbROMWnk+MZv1iG6O6+j16ZBkOOprrJYYT4yVKmfBecNBDrs7Qdr9Z5Dgw6inFF6caY2KSye0lDuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781200099; c=relaxed/simple;
	bh=0NnpuMH9mRrqKjeW+evfNHbhZ2m/HYQNG2dp962jKrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1wzrfV6jcOWoL4m/TRibkn0qKG7nujezO/7S9Z/JxEN9TYxix3YK09ZutKloFp92+X3trLVWyAK3iLD/vA22NbXfrcISXV1339BjXRY5ONvrlVfvFoTk+Io5qboDY2BVSmUxQ9rQsJ7tSYWnbchgE0sQI4GFMw9gyzw45/xhp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIOSQKBt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIOSQKBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9A81F0089D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781200097;
	bh=/1eVH1A0ZUb/+x3mXdbMrec+jqDfQZJHavxWMtMR4QI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FIOSQKBt2vsmAwv8sxPq/hofX+YM60zhseGh9hqu4r6H1cVhi/mdAQRd0OSyEBP38
	 AfoTEGacsSld/tIuQIwvPnHH9sot6j2hlGIO38DVUkj2ph/Vj9DijcmyrJwpDdytM/
	 t6ZcN/+HOvKWpoGIUIoiQV+aLli4Fkcgw37/RxQoAme4ewlb0wDfEDxwSa8+aeM00H
	 5XdoB4UvUfNdIrxgO4ZdN/9TARKaJim4xICWabFyx9TgI/Kj6MXCNceBSHc04xzPRz
	 XPzkVhQo8ywdCCjLZgwbwt3hQ9lJPTojDczsBqfp3muVu7V/jN1ofnoYm7u9HLdv+N
	 G7cl5HVL8KOsg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-beb1bee8c16so19220466b.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:48:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/7s5fGeH+GX3Z9O7A8py6BXCJN8kbetjH6pgNHTpNoMvTZPKaCya0KcQ54/JMa4NkagdfGq4+uxXHv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7Mpoe32TjvIAueXjp9A6PXXpq/azUL1HWbr+WlxXX2Q4ztgG
	F8NPcdGBO20NlapdqVlx3C7U7DtJV/iJhg0DrQD70YKOYTOHOZ3xyubMc+RMY8v70LgRD9s6Mrj
	s1VEu3aaIpHdwndul8sTZEdVBKC29Ng==
X-Received: by 2002:a17:907:97c1:b0:bd8:bc4e:fb8c with SMTP id
 a640c23a62f3a-bfc7631119dmr169369466b.4.1781200096526; Thu, 11 Jun 2026
 10:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610110051.1228-1-shofiqtest@gmail.com> <20260610165640.411c1477@jic23-huawei>
 <20260610-cytoplast-pessimism-dea888887526@spud> <20260611140640.4b144bc2@jic23-huawei>
 <20260611-spoken-prewar-b5a4b94787cd@spud>
In-Reply-To: <20260611-spoken-prewar-b5a4b94787cd@spud>
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Jun 2026 12:48:04 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+DmxwmA0RT3LGiatioo9_tJzkSZV-Nko6ojicb-rKg6A@mail.gmail.com>
X-Gm-Features: AVVi8CcUq-hF14IYKJrkCRRUQp5ZXm6YA64TylY6ZXaHAH6s5RwlXdSY6lEtClI
Message-ID: <CAL_Jsq+DmxwmA0RT3LGiatioo9_tJzkSZV-Nko6ojicb-rKg6A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: accel: Convert lis302 binding to YAML schema
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Md Shofiqul Islam <shofiqtest@gmail.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 12:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Jun 11, 2026 at 02:06:40PM +0100, Jonathan Cameron wrote:
> > On Wed, 10 Jun 2026 17:40:04 +0100
> > Conor Dooley <conor@kernel.org> wrote:
> >
> > > On Wed, Jun 10, 2026 at 04:56:40PM +0100, Jonathan Cameron wrote:
> > > > On Wed, 10 Jun 2026 14:00:51 +0300
> > > > Md Shofiqul Islam <shofiqtest@gmail.com> wrote:
> > > >
> > > > > Convert the STMicroelectronics LIS302DL/LIS3LV02D accelerometer d=
evice
> > > > > tree binding from plain text format to YAML schema format.
> > > > >
> > > > > The binding covers two variants matched via their respective bus =
drivers:
> > > > > - SPI: st,lis302dl-spi (drivers/misc/lis3lv02d/lis3lv02d_spi.c)
> > > > > - I2C: st,lis3lv02d   (drivers/misc/lis3lv02d/lis3lv02d_i2c.c)
> > > > >
> > > > > Document all vendor-specific properties read by the driver via
> > > > > of_property_read_*(), including click detection, IRQ routing, fre=
e-fall/
> > > > > wake-up engines, high-pass filtering, axis remapping, output data=
 rate,
> > > > > and self-test limits.
> > > > >
> > > > > Also correct the click threshold property names: the driver reads
> > > > > "st,click-threshold-{x,y,z}" but the old .txt documented them as
> > > > > "st,click-thresh-{x,y,z}".
> > > > >
> > > > > Validated with: make dt_binding_check   DT_SCHEMA_FILES=3DDocumen=
tation/devicetree/bindings/iio/accel/st,lis302dl.yaml
> > > > >
> > > > > Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
> > > >
> > > > Hi.
> > > >
> > > > So the conundrum here is whether we want to keep carrying this bind=
ing
> > > > as it dates to a previous era.
> > > >
> > > > The driver never made it to IIO and is still in drivers/misc.
> > > > The majority of what is the text document should never have been
> > > > in DT in the first place. I'll guess this dates all the way back
> > > > to the wild west days before we had regular binding review.
> > >
> > > I'd say this should be treated like a staging binding but for the fac=
t
> > > that this has a user in arm. Problem of course is that it's probably
> > > impossible to get that board and so doing any rework is probably not
> > > realistic for this submitter?
> > > Is there a general policy for iio devices in misc? Do they get rework=
ed
> > > to be moved?
> >
> > It is tricky if we have upstream users because the ABI will change on t=
hem.
> >
> > I'm not sure how easy this would be to add to the existing st sensors d=
river
> > as these are very early parts.  If we could maybe we'd do so and just d=
eal
> > with the mess of having to disable one or other driver.
> >
> > My gut feeling here is ancient part, let it get dropped in a year or
> > two and not worry about adding support to a standard IIO driver unless
> > anyone actually has hardware and wants to do it.
> >
> > >
> > > The user funnily enough has the binding's click-thresh properties:
> > >             st,click-single-x;
> > >             st,click-single-y;
> > >             st,click-single-z;
> > >             st,click-thresh-x =3D <10>;
> > >             st,click-thresh-y =3D <10>;
> > >             st,click-thresh-z =3D <10>;
> > >             st,irq1-click;
> > >             st,irq2-click;
> > >             st,wakeup-x-lo;
> > >             st,wakeup-x-hi;
> > >             st,wakeup-y-lo;
> > >             st,wakeup-y-hi;
> > >             st,wakeup-z-lo;
> > >             st,wakeup-z-hi;
> > > Dunno what that ultimately means in terms of which should be used
> > > though.
> > Set those as defaults in the driver if all upstream users have those
> > values and then drop reading them from dt?
>
> Actually, there's more than one user in arm, but there's a mix of
> compatibles and properties used. Probably not really viable unless these
> are all unique compatible + property combinations. FWIW, there's more
> compatibles used than those documented, that fall back to the documented
> ones.

There's only 1 for SPI. For I2C, I guess it is a question of which
driver is used:

drivers/iio/accel/st_accel_i2c.c:               .compatible =3D "st,lis3lv0=
2d",
drivers/misc/lis3lv02d/lis3lv02d_i2c.c: { .compatible =3D "st,lis3lv02d" },

Rob
