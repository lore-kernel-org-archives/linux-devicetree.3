Received: from out28-104.mail.aliyun.com (out28-104.mail.aliyun.com [115.124.28.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0173E1D05
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782463261; cv=none; b=NynRj/V8uL1pv4nuCw7W//+GsDXlNiLq/J3pTBowuyVTXgMBedVOmyvumD8xvrIaJCuSTfv5nAntEsIoE+o8oYHQ05gq+CI1ZBSjSAOqICLD/qwTDD2m1rjz2f75ZUY0ptJc1HbRCV6bQvVRK4JU+/mHqdIPaoGSTrxDka4a2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782463261; c=relaxed/simple;
	bh=eebDnKtI0bY9IrYi/ZnIdT2OyZbT4VVJZ91MARYJwhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RrS+JrQAbLceNa4fCgyOd4aDksL2LsQXjq0vKZsSnT02+0z/UrlMynO8qaKOLq6GjDJ+JRWcYsGdgJqa8jaBTubtyBxQsNkwVTC6Esa2AR7gz0YvZw1nvh3bkrA+A+ch9N7Cknhik0jpVFe5Hge0CqTRvgEQ/QJTZMKlcYtWo5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=E+SBrlkV; arc=none smtp.client-ip=115.124.28.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="E+SBrlkV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1782463247; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=jha7Itl/elVcsakSqmKlpFbstUFs8gjxNL9jjF0sNoM=;
	b=E+SBrlkV2Ew03YUxuLHzHYmsjcsKMZreLwqG0sTqLskJjCowh8UPiz/bMu+f61JYEGSCmtGXmj9/tsSe7I5PN1zE/5kfWeOKNPDO332UguNj/ru4qpxlpKaUXyJrhQxBLepyuDKWpiahNg1l9WCIvNDBPofzPFHArbedqPhQhm4lb5Ifvg45XjiF1c2URKuRvzHKUo6zx4y8r0oAH4WdayfoXF6IJDknw54Id1H/RoR0mXUTHyzDhdnDwDNu/DniCqp1bJAJss3/dZX52cQeZaMSQG3neewuFlEfTk3qJXu7DxoO1h/rGKrAY9gkWkcbh9ITsfQusYW77YERapy+zg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436273|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.207552-0.00687721-0.785571;FP=18253502819860030722|7|1|7|0|-1|-1|-1;HT=maildocker-contentspam033032023038;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.i6MfxNt_1782463244;
Received: from mail-ot1-f48.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.i6MfxNt_1782463244 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 26 Jun 2026 16:40:45 +0800
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e93cd4e64bso507748a34.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 01:40:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/05e4giEoOdKOAPWI5MxlmdJf3hkPcd5A/6eY+/g9sHbAA63gA7fHtGDXpC3tWYEknsPDrKETvoA9v@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4T3vHAbJ4t88Sg6zkQ25XsBTaD33MNcPuHHGqgrjiYB5aoj0p
	azNwPXPNtakTVkX+Xn4Y3LDmO4T/ao1eE+JCfp9lBG/FYmkHT0BLWQk/FnDBCgUdzmaP6qhrp63
	c7sV/1IO1WHXHc+NoPsBjKYhUmGfs1qg=
X-Received: by 2002:a05:6808:17a6:b0:492:899f:6435 with SMTP id
 5614622812f47-492899f65a9mr4241463b6e.38.1782463243301; Fri, 26 Jun 2026
 01:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508134009.4582-3-syyang@lontium.com> <3188f63f-5358-48d7-b934-af20a8f95c6f@kernel.org>
 <CAFQXuNbKBfyeQL3N3P5QY=6BWoD3O6DSbXN-WMA1rRG9vCs3Kg@mail.gmail.com>
 <a0352a42-15db-4c7a-ae73-8a4e1543cd50@kernel.org> <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
 <CAFQXuNa8bJCpZBkMs_3mtbK_pjVzDdaDaoGk0KDxiG_Pf7txdg@mail.gmail.com>
 <6371d1d8-cdfb-40fa-84c7-ba3ec4e2ac00@kernel.org> <CAFQXuNZtzBu+WiG8n0BeN47zagQmL-iz_6Af7prk-xHLAeRBwg@mail.gmail.com>
 <20260626-zippy-affable-hamster-22101d@houat> <CAFQXuNbN1bW3DVGUtVf7--dW_UhSk4LZdk+v14P=VSbDU4ZzsQ@mail.gmail.com>
 <20260626-flawless-axiomatic-slug-c480c9@houat>
In-Reply-To: <20260626-flawless-axiomatic-slug-c480c9@houat>
From: Sunyun Yang <syyang@lontium.com>
Date: Fri, 26 Jun 2026 16:40:31 +0800
X-Gmail-Original-Message-ID: <CAFQXuNa330ctD3VgAVxDSzovwyy0hwVPTfm6pKzeLZDGeq=_=Q@mail.gmail.com>
X-Gm-Features: AVVi8CehaFSW3Csx3bS2GZ8IyaSvCFmkbQVoHJHPyqDNojz7E8sHQeH7k3e5c1U
Message-ID: <CAFQXuNa330ctD3VgAVxDSzovwyy0hwVPTfm6pKzeLZDGeq=_=Q@mail.gmail.com>
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
=A5=E5=91=A8=E4=BA=94 16:26=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jun 26, 2026 at 04:13:18PM +0800, Sunyun Yang wrote:
> > Maxime Ripard <mripard@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8826=
=E6=97=A5=E5=91=A8=E4=BA=94 15:49=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Fri, Jun 26, 2026 at 10:15:03AM +0800, Sunyun Yang wrote:
> > > > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=
=8825=E6=97=A5=E5=91=A8=E5=9B=9B 21:51=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > On 25/06/2026 15:40, Sunyun Yang wrote:
> > > > > > Sunyun Yang <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=
=8825=E6=97=A5=E5=91=A8=E5=9B=9B 21:26=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >>
> > > > > >> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=
=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 21:17=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >>>
> > > > > >>> On 25/06/2026 15:14, Sunyun Yang wrote:
> > > > > >>>> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B4=
6=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 20:54=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >>>>>
> > > > > >>>>> On 08/05/2026 15:40, syyang@lontium.com wrote:
> > > > > >>>>>> +
> > > > > >>>>>> +static void lt9611c_reset(struct lt9611c *lt9611c)
> > > > > >>>>>> +{
> > > > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > > > >>>>>> +     msleep(20);
> > > > > >>>>>> +
> > > > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > > > > >>>>>> +     msleep(20);
> > > > > >>>>>> +
> > > > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > > > >>>>>
> > > > > >>>>> This is just plain wrong. Why do you assert, then de-assert=
 and then
> > > > > >>>>> finally assert AGAIN the reset leaving the device in powerd=
own stage?
> > > > > >>>>>
> > > > > >>>> I am using software to emulate the hardware RESET button on =
our EVB.
> > > > > >>>> When the hardware RESET button is pressed while our chip is =
running,
> > > > > >>>> the signal level changes from HIGH to LOW and then back to H=
IGH.
> > > > > >>>>
> > > > > >>>> Of course, we can also use the following:
> > > > > >>>> static void lt9611c_reset(struct lt9611c *lt9611c)
> > > > > >>>> {
> > > > > >>>>     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > > > > >>>>     msleep(50);
> > > > > >>>>     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > > > >>>>     msleep(20);
> > > > > >>>> }
> > > > > >>>
> > > > > >>> Makes no sense either and you just did not get the point and =
did not
> > > > > >>> answer my question. I asked WHY you leave asserted. Answer "w=
e emulate"
> > > > > >>> is just plain wrong.
> > > > > >>>
> > > > > >>> So again please answer:
> > > > > >>>
> > > > > >>> Why do you leave device with reset asserted?
> > > > > >>>
> > > > > >>
> > > > > >>  devicetree:   reset-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>;
> > > > > >>
> > > > > >> GPIO_ACTIVE_HIGH:
> > > > > >>
> > > > > >> gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);   ------   r=
eset pin
> > > > > >> is Low level : Clear the register configuration in the chip to=
 stop
> > > > > >> the chip from working.
> > > > > >>
> > > > > >> gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);   ------  re=
set pin
> > > > > >> is high level:  The chip resumes operation.
> > > > > >>
> > > > > >>
> > > > > >
> > > > > > Our purpose is: pull the level low to clear the register config=
uration
> > > > > > in the chip, and then pull it high to allow the MCU inside the =
chip to
> > > > > > re=E2=80=91initialize the registers.
> > > > >
> > > > >
> > > > > And you do completely opposite... so that confirms your code is j=
ust wrong.
> > > > >
> > > >
> > > > The lontium-lt9611.yaml uses GPIO_ACTIVE_HIGH. I am just following =
the
> > > > rule of this device tree. If I modify the device tree to use
> > > > GPIO_ACTIVE_LOW,
> > > > and use the following code in my driver, then my driver would be co=
rrect.
> > > > However, would the existing kernel drivers lontium-lt9611uxc.c and
> > > > lontium-lt9611.c be affected?
> > >
> > > It might, but then it's a DT problem. The GPIO API for drivers always
> > > considers the logical state of a GPIO, so if you need to assert a
> > > signal, you'll always need to set 1. That's what Krzysztof was trying=
 to
> > > explain.
> > >
> > > The DT will provide with GPIO_ACTIVE_* how that logical state transla=
tes
> > > to a physical GPIO state.
> > >
> > > If the DT says that this particular GPIO is active-high, then it mean=
s
> > > that we need to set the GPIO to 1 to assert reset. Now of course, it
> > > might not make sense for the controller itself, but it might for the
> > > board if there's a GPIO inverter in the middle for example.
> > >
> > > Anyway, in the case you're raising, the issue definitely lies in the =
DT,
> > > and that's what would need to be fixed.
> > >
> > > I also wouldn't be too concerned about lontium-lt9611.yaml, it's just=
 an
> > > example.
> > >
> > > Maxime
> >
> > thanks Maxime, I will modify this code in the next version of the
> > driver, and I hope you can accept these changes.
> >
> > Maxime:
> > I have another question I would like to ask you
> > regarding sashiko-bot@kernel.org. Since sashiko-bot sometimes has
> > opinions that differ from yours, whose advice should I follow?
> >
> > If I do not adopt sashiko-bot's suggestions, will my patches still be
> > accepted into the upstream Linux kernel?
>
> I can't give a blanket answer. It depends on what you ignore exactly.
>

Okay, another question: sashiko-bot is an AI bot. Are its review
comments optional, or must they be followed?

> Maxime
