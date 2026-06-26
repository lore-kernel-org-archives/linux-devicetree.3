Received: from out28-109.mail.aliyun.com (out28-109.mail.aliyun.com [115.124.28.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A463AB298
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461934; cv=none; b=N4/qHFovZpg5N7CEJoK+3l09Zr5zYzpCzAW01ox2c81pRxZTw62F8NPtO0LWnOYjrDBae9M6DaVqrBrxuP8YAwRQyC3Js07QHGjA9MyjkOiHf2AW5utbA4tvhIfzG24GzsXmjEBiPN/J5/AjZpbsxKPAEntqj7AroJhoWf6clGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461934; c=relaxed/simple;
	bh=gQb9tomqIwes42vV/XXwrMknW5aKZwC68aRU1hkpFNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAfF86K81fHo95JZT11CAPsPmmNoJIhElYgO8+wyavCRtKEHJFcF8ofdflZf8IW5hU6s2ip368F0QtqvBdf1t04XhikCUshWyooBIvPdwOfol1ERkkPEjcSyZ0zSAfN70F02weS7ORKKEo5bAZZOq5tyEnT9CJbhC8L3ek7BcRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=P7fSlnfA; arc=none smtp.client-ip=115.124.28.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="P7fSlnfA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1782461930; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=Hz7GoxRrDOeP6izzI+KPGlftBZo8WhaNw4ObLmMqKhs=;
	b=P7fSlnfAQWsCr0HO13Sp6JsaisF4ONN+jZoxod3vmBPBab0l486miVATWlBQXwUCVnegYR1suuBh3AdzlzdJoD7imUfSI95eUj5qEmy9YInCsqGA1jBILGli+2QxwBLQaegieNKvS6Y6VJHx7KMvOMPbajDDc485kX1Tw7vioXy7/yeDD9v06E0DQKLPG7B89RrZzTaAks7+KvCqMAkRBi7rYNPkDowg6W9/i5oCZ8zQ07kKs+f7yXrXWivSN5ff40OhGs/n8/WdzU6gcJgkFCTPz+9wMoiXcE+UvdcUn0j2vcf55uegbB3zlrrWG8DEoxy0hjBEJ+C327ulTkqsXg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436325|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.230135-0.00832398-0.761541;FP=18253502819858982146|8|1|7|0|-1|-1|-1;HT=maildocker-contentspam033045018182;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.i6MfSZ1_1782461609;
Received: from mail-oi1-f171.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.i6MfSZ1_1782461609 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 26 Jun 2026 16:13:30 +0800
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-487167d083bso414407b6e.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 01:13:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+UcCoLJMsdKyGj/zFKr0kao9IHIgu0rsrxYG7LSIgW8vv0QQ+evEe3CHfIXO8Jxg6F33L5bcGzRrHM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1hOP8Qfvl3TOr7c95ZyySrLmEOCzikFDRhRWp5qVSurGXf3ma
	uZjHYTKY+v/y/yMmiH/sz/bNS3aBWOO3Im67ko+YVQwJ3iuFPtNL4GM32b6NaJL8uX6KdVifI/6
	1e1E+aRAkHmtMMFjze2FWcOEQdU61qCo=
X-Received: by 2002:a05:6808:c185:b0:490:a66f:9aac with SMTP id
 5614622812f47-492190fc5b3mr5591967b6e.14.1782461609193; Fri, 26 Jun 2026
 01:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508134009.4582-1-syyang@lontium.com> <20260508134009.4582-3-syyang@lontium.com>
 <3188f63f-5358-48d7-b934-af20a8f95c6f@kernel.org> <CAFQXuNbKBfyeQL3N3P5QY=6BWoD3O6DSbXN-WMA1rRG9vCs3Kg@mail.gmail.com>
 <a0352a42-15db-4c7a-ae73-8a4e1543cd50@kernel.org> <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
 <CAFQXuNa8bJCpZBkMs_3mtbK_pjVzDdaDaoGk0KDxiG_Pf7txdg@mail.gmail.com>
 <6371d1d8-cdfb-40fa-84c7-ba3ec4e2ac00@kernel.org> <CAFQXuNZtzBu+WiG8n0BeN47zagQmL-iz_6Af7prk-xHLAeRBwg@mail.gmail.com>
 <20260626-zippy-affable-hamster-22101d@houat>
In-Reply-To: <20260626-zippy-affable-hamster-22101d@houat>
From: Sunyun Yang <syyang@lontium.com>
Date: Fri, 26 Jun 2026 16:13:18 +0800
X-Gmail-Original-Message-ID: <CAFQXuNbN1bW3DVGUtVf7--dW_UhSk4LZdk+v14P=VSbDU4ZzsQ@mail.gmail.com>
X-Gm-Features: AVVi8Ccy1Vot-JXWqeZuZ9hQ6HBLxv1b4oTaGEUoItSLAk3USIt4bCYDgyYi4Os
Message-ID: <CAFQXuNbN1bW3DVGUtVf7--dW_UhSk4LZdk+v14P=VSbDU4ZzsQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Ripard <mripard@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8826=E6=97=
=A5=E5=91=A8=E4=BA=94 15:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jun 26, 2026 at 10:15:03AM +0800, Sunyun Yang wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=882=
5=E6=97=A5=E5=91=A8=E5=9B=9B 21:51=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On 25/06/2026 15:40, Sunyun Yang wrote:
> > > > Sunyun Yang <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=8825=
=E6=97=A5=E5=91=A8=E5=9B=9B 21:26=E5=86=99=E9=81=93=EF=BC=9A
> > > >>
> > > >> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=
=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 21:17=E5=86=99=E9=81=93=EF=BC=9A
> > > >>>
> > > >>> On 25/06/2026 15:14, Sunyun Yang wrote:
> > > >>>> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=
=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 20:54=E5=86=99=E9=81=93=EF=BC=9A
> > > >>>>>
> > > >>>>> On 08/05/2026 15:40, syyang@lontium.com wrote:
> > > >>>>>> +
> > > >>>>>> +static void lt9611c_reset(struct lt9611c *lt9611c)
> > > >>>>>> +{
> > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > >>>>>> +     msleep(20);
> > > >>>>>> +
> > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > > >>>>>> +     msleep(20);
> > > >>>>>> +
> > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > >>>>>
> > > >>>>> This is just plain wrong. Why do you assert, then de-assert and=
 then
> > > >>>>> finally assert AGAIN the reset leaving the device in powerdown =
stage?
> > > >>>>>
> > > >>>> I am using software to emulate the hardware RESET button on our =
EVB.
> > > >>>> When the hardware RESET button is pressed while our chip is runn=
ing,
> > > >>>> the signal level changes from HIGH to LOW and then back to HIGH.
> > > >>>>
> > > >>>> Of course, we can also use the following:
> > > >>>> static void lt9611c_reset(struct lt9611c *lt9611c)
> > > >>>> {
> > > >>>>     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > > >>>>     msleep(50);
> > > >>>>     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > >>>>     msleep(20);
> > > >>>> }
> > > >>>
> > > >>> Makes no sense either and you just did not get the point and did =
not
> > > >>> answer my question. I asked WHY you leave asserted. Answer "we em=
ulate"
> > > >>> is just plain wrong.
> > > >>>
> > > >>> So again please answer:
> > > >>>
> > > >>> Why do you leave device with reset asserted?
> > > >>>
> > > >>
> > > >>  devicetree:   reset-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>;
> > > >>
> > > >> GPIO_ACTIVE_HIGH:
> > > >>
> > > >> gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);   ------   reset=
 pin
> > > >> is Low level : Clear the register configuration in the chip to sto=
p
> > > >> the chip from working.
> > > >>
> > > >> gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);   ------  reset =
pin
> > > >> is high level:  The chip resumes operation.
> > > >>
> > > >>
> > > >
> > > > Our purpose is: pull the level low to clear the register configurat=
ion
> > > > in the chip, and then pull it high to allow the MCU inside the chip=
 to
> > > > re=E2=80=91initialize the registers.
> > >
> > >
> > > And you do completely opposite... so that confirms your code is just =
wrong.
> > >
> >
> > The lontium-lt9611.yaml uses GPIO_ACTIVE_HIGH. I am just following the
> > rule of this device tree. If I modify the device tree to use
> > GPIO_ACTIVE_LOW,
> > and use the following code in my driver, then my driver would be correc=
t.
> > However, would the existing kernel drivers lontium-lt9611uxc.c and
> > lontium-lt9611.c be affected?
>
> It might, but then it's a DT problem. The GPIO API for drivers always
> considers the logical state of a GPIO, so if you need to assert a
> signal, you'll always need to set 1. That's what Krzysztof was trying to
> explain.
>
> The DT will provide with GPIO_ACTIVE_* how that logical state translates
> to a physical GPIO state.
>
> If the DT says that this particular GPIO is active-high, then it means
> that we need to set the GPIO to 1 to assert reset. Now of course, it
> might not make sense for the controller itself, but it might for the
> board if there's a GPIO inverter in the middle for example.
>
> Anyway, in the case you're raising, the issue definitely lies in the DT,
> and that's what would need to be fixed.
>
> I also wouldn't be too concerned about lontium-lt9611.yaml, it's just an
> example.
>
> Maxime

thanks Maxime, I will modify this code in the next version of the
driver, and I hope you can accept these changes.

Maxime:
I have another question I would like to ask you
regarding sashiko-bot@kernel.org. Since sashiko-bot sometimes has
opinions that differ from yours, whose advice should I follow?

If I do not adopt sashiko-bot's suggestions, will my patches still be
accepted into the upstream Linux kernel?
