Received: from out28-92.mail.aliyun.com (out28-92.mail.aliyun.com [115.124.28.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA93B993F
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468518; cv=none; b=LLLlFwk2q769umUg7Z/74Iu3+FfwcNbsj/N/VDlHZVOLa2aIvnfYYbd7HUpZ4TrCNn5mfvI2aoSQS7VCShrblCPXCnsfrNV6V3CSF3ofoNbwXmv0sTAJyLAELCeXAu+/ZEbB8a1X3yw3yWAPBoA98nD0W8CKIGdCc5hUQWlnfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468518; c=relaxed/simple;
	bh=x30tAGtcnOMMahBRDFljZEUJOHuEyhyPWtq3z7hIBD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2sCueLwKdFv1xVY+udnUJUMuiv3Birer3bQ5I7fF2QFD1sspudAm0OSMoG3nG2vOMA3shFcp1bUUfk4YicIcOD7xvqbO5JSQxkk8URIZ7kvB2vrQF8HKuwITniZNp7+J+XACKMlREBnHHnAbJFwcoZ9kLm7TVABXyLb/7h2dss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=FDDLJO1G; arc=none smtp.client-ip=115.124.28.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="FDDLJO1G"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1782468514; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=VZGeb3GZ31mNdxvxOX7X62UaE8AM0c27Ouv1C4wppo8=;
	b=FDDLJO1GQ/5rL71QuoR6N/SiQhteZ8eF7jmvYOCpE/Z6HkYKcq6H3PYqlUifxhT+oBAKPtk8TwmJkH4k2cccSPfof77OBiq0qRl56Qk+XXnqpHu1JL4Jv1Unrm4iCAJwJyS3YBnCT2s2iCxxFMCu8ExrjptuXNuylp1o+9jh/0M2lUoDaT/hSdavmbesQqJqlSKLAGkH5X5hxzM3lMgH4wVuzXpBeHkBPTQwr7reQeMkk21vJy0IGYTSS3nr7ldIxM5wFz81FzY+YZ8OJ7X+4+wOP+1NpUoWpe9wIgIWdjRdztGLB1Imd1z/945kZpBnnzPvyc+6nVbcijp0kroFiA==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.0506618-0.00407068-0.945268;FP=18253458976429696266|3|1|2|0|-1|-1|-1;HT=maildocker-contentspam033068005250;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.i6U6UAV_1782468511;
Received: from mail-oi1-f170.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.i6U6UAV_1782468511 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 26 Jun 2026 18:08:32 +0800
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4877b2c9e9fso585978b6e.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 03:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9A1uGrdoX4e79USboCuAoLkymKlZZvZ/lw52HwfgKMpMesJvSwtIf1f+aNcZ6r2sWt7reIf2O4drU7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7pMlKgSyhaJE+GRqNi+ojD6ppI9fmGKChwKKlrt4QvHUFYFzp
	u4ql3wfGrLOkFA60h13SN5HxAQvkH3Xl7NM+fPm86y0fKQjt960sLGqQ1Og1Aziv7oJtYqmIu8O
	5v/OHEXqL5DmnQNTnTSr3brik0fe06p8=
X-Received: by 2002:a05:6808:5092:b0:493:b22c:9fb4 with SMTP id
 5614622812f47-493b22ca525mr1102704b6e.6.1782468510919; Fri, 26 Jun 2026
 03:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFQXuNa8bJCpZBkMs_3mtbK_pjVzDdaDaoGk0KDxiG_Pf7txdg@mail.gmail.com>
 <6371d1d8-cdfb-40fa-84c7-ba3ec4e2ac00@kernel.org> <CAFQXuNZtzBu+WiG8n0BeN47zagQmL-iz_6Af7prk-xHLAeRBwg@mail.gmail.com>
 <20260626-zippy-affable-hamster-22101d@houat> <CAFQXuNbN1bW3DVGUtVf7--dW_UhSk4LZdk+v14P=VSbDU4ZzsQ@mail.gmail.com>
 <20260626-flawless-axiomatic-slug-c480c9@houat> <CAFQXuNa330ctD3VgAVxDSzovwyy0hwVPTfm6pKzeLZDGeq=_=Q@mail.gmail.com>
 <CAFQXuNYh95wTQex9zEUfxGBCsfK72+8eM3Mzm8pC2CFn6bJdGA@mail.gmail.com>
 <20260626-tungsten-capuchin-of-serendipity-24c0a9@houat> <CAFQXuNYOcvaiknrFwmxKQdiuWMOZo7mV_Rv7TrMScO_7Y_p8_Q@mail.gmail.com>
 <20260626-hopping-savvy-seagull-cc9626@houat>
In-Reply-To: <20260626-hopping-savvy-seagull-cc9626@houat>
From: Sunyun Yang <syyang@lontium.com>
Date: Fri, 26 Jun 2026 18:08:19 +0800
X-Gmail-Original-Message-ID: <CAFQXuNbdNTF9bHyy4Nf1kmAAGOAfs-zf6GjshBesTFtdcvMJTg@mail.gmail.com>
X-Gm-Features: AVVi8Ce8rt0fSPDRWAx-y8-HstlVzKAFQA4XVT6NBkr6po8PWM0gPNx7CpplnoM
Message-ID: <CAFQXuNbdNTF9bHyy4Nf1kmAAGOAfs-zf6GjshBesTFtdcvMJTg@mail.gmail.com>
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
=A5=E5=91=A8=E4=BA=94 17:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jun 26, 2026 at 05:45:08PM +0800, Sunyun Yang wrote:
> > Maxime Ripard <mripard@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8826=
=E6=97=A5=E5=91=A8=E4=BA=94 17:31=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Fri, Jun 26, 2026 at 05:05:38PM +0800, Sunyun Yang wrote:
> > > > Sunyun Yang <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=8826=
=E6=97=A5=E5=91=A8=E4=BA=94 16:40=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > >
> > > > > Maxime Ripard <mripard@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=
=8826=E6=97=A5=E5=91=A8=E4=BA=94 16:26=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >
> > > > > > On Fri, Jun 26, 2026 at 04:13:18PM +0800, Sunyun Yang wrote:
> > > > > > > Maxime Ripard <mripard@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=
=9C=8826=E6=97=A5=E5=91=A8=E4=BA=94 15:49=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > >
> > > > > > > > On Fri, Jun 26, 2026 at 10:15:03AM +0800, Sunyun Yang wrote=
:
> > > > > > > > > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=
=B46=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 21:51=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > > > >
> > > > > > > > > > On 25/06/2026 15:40, Sunyun Yang wrote:
> > > > > > > > > > > Sunyun Yang <syyang@lontium.com> =E4=BA=8E2026=E5=B9=
=B46=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 21:26=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > > > > >>
> > > > > > > > > > >> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=
=E5=B9=B46=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 21:17=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > > > > > > > >>>
> > > > > > > > > > >>> On 25/06/2026 15:14, Sunyun Yang wrote:
> > > > > > > > > > >>>> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E202=
6=E5=B9=B46=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 20:54=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > > > > > > > >>>>>
> > > > > > > > > > >>>>> On 08/05/2026 15:40, syyang@lontium.com wrote:
> > > > > > > > > > >>>>>> +
> > > > > > > > > > >>>>>> +static void lt9611c_reset(struct lt9611c *lt961=
1c)
> > > > > > > > > > >>>>>> +{
> > > > > > > > > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gp=
io, 1);
> > > > > > > > > > >>>>>> +     msleep(20);
> > > > > > > > > > >>>>>> +
> > > > > > > > > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gp=
io, 0);
> > > > > > > > > > >>>>>> +     msleep(20);
> > > > > > > > > > >>>>>> +
> > > > > > > > > > >>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gp=
io, 1);
> > > > > > > > > > >>>>>
> > > > > > > > > > >>>>> This is just plain wrong. Why do you assert, then=
 de-assert and then
> > > > > > > > > > >>>>> finally assert AGAIN the reset leaving the device=
 in powerdown stage?
> > > > > > > > > > >>>>>
> > > > > > > > > > >>>> I am using software to emulate the hardware RESET =
button on our EVB.
> > > > > > > > > > >>>> When the hardware RESET button is pressed while ou=
r chip is running,
> > > > > > > > > > >>>> the signal level changes from HIGH to LOW and then=
 back to HIGH.
> > > > > > > > > > >>>>
> > > > > > > > > > >>>> Of course, we can also use the following:
> > > > > > > > > > >>>> static void lt9611c_reset(struct lt9611c *lt9611c)
> > > > > > > > > > >>>> {
> > > > > > > > > > >>>>     gpiod_set_value_cansleep(lt9611c->reset_gpio, =
0);
> > > > > > > > > > >>>>     msleep(50);
> > > > > > > > > > >>>>     gpiod_set_value_cansleep(lt9611c->reset_gpio, =
1);
> > > > > > > > > > >>>>     msleep(20);
> > > > > > > > > > >>>> }
> > > > > > > > > > >>>
> > > > > > > > > > >>> Makes no sense either and you just did not get the =
point and did not
> > > > > > > > > > >>> answer my question. I asked WHY you leave asserted.=
 Answer "we emulate"
> > > > > > > > > > >>> is just plain wrong.
> > > > > > > > > > >>>
> > > > > > > > > > >>> So again please answer:
> > > > > > > > > > >>>
> > > > > > > > > > >>> Why do you leave device with reset asserted?
> > > > > > > > > > >>>
> > > > > > > > > > >>
> > > > > > > > > > >>  devicetree:   reset-gpios =3D <&tlmm 128 GPIO_ACTIV=
E_HIGH>;
> > > > > > > > > > >>
> > > > > > > > > > >> GPIO_ACTIVE_HIGH:
> > > > > > > > > > >>
> > > > > > > > > > >> gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);   =
------   reset pin
> > > > > > > > > > >> is Low level : Clear the register configuration in t=
he chip to stop
> > > > > > > > > > >> the chip from working.
> > > > > > > > > > >>
> > > > > > > > > > >> gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);   =
------  reset pin
> > > > > > > > > > >> is high level:  The chip resumes operation.
> > > > > > > > > > >>
> > > > > > > > > > >>
> > > > > > > > > > >
> > > > > > > > > > > Our purpose is: pull the level low to clear the regis=
ter configuration
> > > > > > > > > > > in the chip, and then pull it high to allow the MCU i=
nside the chip to
> > > > > > > > > > > re=E2=80=91initialize the registers.
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > And you do completely opposite... so that confirms your=
 code is just wrong.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > The lontium-lt9611.yaml uses GPIO_ACTIVE_HIGH. I am just =
following the
> > > > > > > > > rule of this device tree. If I modify the device tree to =
use
> > > > > > > > > GPIO_ACTIVE_LOW,
> > > > > > > > > and use the following code in my driver, then my driver w=
ould be correct.
> > > > > > > > > However, would the existing kernel drivers lontium-lt9611=
uxc.c and
> > > > > > > > > lontium-lt9611.c be affected?
> > > > > > > >
> > > > > > > > It might, but then it's a DT problem. The GPIO API for driv=
ers always
> > > > > > > > considers the logical state of a GPIO, so if you need to as=
sert a
> > > > > > > > signal, you'll always need to set 1. That's what Krzysztof =
was trying to
> > > > > > > > explain.
> > > > > > > >
> > > > > > > > The DT will provide with GPIO_ACTIVE_* how that logical sta=
te translates
> > > > > > > > to a physical GPIO state.
> > > > > > > >
> > > > > > > > If the DT says that this particular GPIO is active-high, th=
en it means
> > > > > > > > that we need to set the GPIO to 1 to assert reset. Now of c=
ourse, it
> > > > > > > > might not make sense for the controller itself, but it migh=
t for the
> > > > > > > > board if there's a GPIO inverter in the middle for example.
> > > > > > > >
> > > > > > > > Anyway, in the case you're raising, the issue definitely li=
es in the DT,
> > > > > > > > and that's what would need to be fixed.
> > > > > > > >
> > > > > > > > I also wouldn't be too concerned about lontium-lt9611.yaml,=
 it's just an
> > > > > > > > example.
> > > > > > > >
> > > > > > > > Maxime
> > > > > > >
> > > > > > > thanks Maxime, I will modify this code in the next version of=
 the
> > > > > > > driver, and I hope you can accept these changes.
> > > > > > >
> > > > > > > Maxime:
> > > > > > > I have another question I would like to ask you
> > > > > > > regarding sashiko-bot@kernel.org. Since sashiko-bot sometimes=
 has
> > > > > > > opinions that differ from yours, whose advice should I follow=
?
> > > > > > >
> > > > > > > If I do not adopt sashiko-bot's suggestions, will my patches =
still be
> > > > > > > accepted into the upstream Linux kernel?
> > > > > >
> > > > > > I can't give a blanket answer. It depends on what you ignore ex=
actly.
> > > > > >
> > > > >
> > > > > Okay, another question: sashiko-bot is an AI bot. Are its review
> > > > > comments optional, or must they be followed?
> > > > >
> > > >
> > > > For example, in my driver, there is a function for upgrading the ch=
ip
> > > > firmware. During debugging or production, upgrading the chip firmwa=
re
> > > > will acquire a lock, which will block the DRM callback and affect
> > > > display. It will be fine after the upgrade is completed and some
> > > > devices are restarted. As long as there is no subsequent upgrade,
> > > > display can work normally.
> > > >
> > > > From a purely software perspective, the AI bot considered this
> > > > approach unacceptable and proposed synchronizing the pre-upgrade st=
ate
> > > > to the DRM framework. From my personal perspective, I think the AI
> > > > bot's suggestion would only make my driver more complex and redunda=
nt.
> > > > Do you think I need to adopt the AI bot's suggestion?
> > >
> > > You're right it's wrong, but there's also no reason to allow that
> > > firmware upgrade during the driver lifetime either through a debugfs
> > > file. So you should get rid of the debugfs file and now you won't hav=
e
> > > to bother with that comment anymore.
> > >
> > > > In addition, if I follow the AI bot's suggestion, the
> > > > lontium-lt9611uxc.c and lontium-lt8713sx.c drivers that have been
> > > > merged into the upstream Linux kernel would not meet the AI bot's
> > > > requirements.
> > >
> > > Maybe, but it's not relevant either way. These drivers are merged, yo=
urs
> > > isn't. Feel free to fix these if you spot any issue though.
> > >
> > > > When I get a reviewer's Reviewed-by flag, can I ignore the opinion =
of
> > > > sashiko-bot (the AI bot)?
> > >
> > > Again, it depends on the comment. If you feel like one can be ignored=
,
> > > you should at least argue why.
> > >
> >
> > sashiko=E2=80=91bot (AI bot) does not communicate or interact with me.
> > Even if I explain the reasons, the AI bot never replies to me, and it
> > only sends its review comments to me alone.
>
> Then put it into the cover letter?
>

thanks Maxime,
I will modify the driver patch, include the relevant explanation in
the cover letter, and then submit it.



> > If I do not make changes according to the AI bot's suggestions, will
> > that affect my driver being merged into the upstream Linux kernel? I
> > would like to know the answer to this question.
>
> I told you twice already.
