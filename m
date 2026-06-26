Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D411419A4
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440810; cv=none; b=W1lgGNS8eLvOGo7fX+YBJOgYOYqRH8dfohadiq81dhBAnoRV63q0M1IIp2yPqiKW9ABbwl+2i8aJOpAkc2rVAuw1SqwiYdBPYu+CPhLGy6R+DlZ6/0qXimaPSwPGE1XazDiTHSqDI8nkSAm8nJf3iKyHIRBEo7seCjuaMIp80jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440810; c=relaxed/simple;
	bh=vaoGzW5e1gJwUQEv8jzoQNa1K5advn6Ccf2DfTE6l64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhetEOvMwmm2ALNMVV2oOyTmvGD0ivyg5+w2e/yHphJ6DEN8Dh4Uoidge7RtvjLsgdbQ43IDs3EzKBVVaeh/0vwyJjFBCczcuCyn/XiST0vb4uZeMGI8v/+A6WuCiY4kaEf3JnkkDI0eRKYLkvdgDaIkJffnWjg9uYT11BwRrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=tIp55UyV; arc=none smtp.client-ip=115.124.28.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="tIp55UyV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1782440805; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=qB8OQzAb/UAgfdSh0zhlBdG9PWiLGbf3G8yQApzy3Rs=;
	b=tIp55UyV17GHWY+WVGXOqAcInpXH7831A7rUXoqnjGW4PwnPwo2cX7g97q/y/OQGd02LVMx8ilWwp6bsTnTvr74uKUk6qiQ6psAZeQ2Fzv0l2G8f7dLEoQHPc3J+xh5Eg5/Wk6D+f0lzh5zFVpEThWW6bCf///qK5E1hxnH96SKZmuvGbBly6h5th25CiEbMJQhVug81Y0RcemBPSTGlbC8mKi0fbCli4ssAPI0jIqnqaTuTo1qBI9Bm8O/jfF7elVwCo730KcguAGiZBMgOq7ON4kET53gfON7rppBlSz7T1mYPv4sVKF/a4y+Ccl+NglplHbKAj5UtflCnTJO7xg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07437244|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0543176-0.00480501-0.940877;FP=16812355890543396106|10|1|9|0|-1|-1|-1;HT=maildocker-contentspam033037017159;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.i65Df9w_1782438951;
Received: from mail-ot1-f49.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.i65Df9w_1782438951 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 26 Jun 2026 09:55:52 +0800
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e936c2473dso845488a34.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 18:55:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9c20R/9Z43y1Bvm7Kfyt8tuL4DpZ1iyfQkEnWyMXYPb5DtudxK0mwodsOIjqyUNa9zswL3CHbzHMmk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6sV0QK96oDccFzGeT8oCBJtynGuYtSW26R3zB+yPWEMvnwPMx
	lMGDJVtU1ZmMSAI8CktGLncz9Tg1CcSHwfDPcdAWJSF5Zp4sbpuhl/fuoW+OkdN75M0eRiTxvEl
	wF7tBkivHMIYc5eec9rQGkf/NKh9mTKA=
X-Received: by 2002:a05:6808:3505:b0:48a:a666:e763 with SMTP id
 5614622812f47-48ee556a028mr8634888b6e.30.1782438951020; Thu, 25 Jun 2026
 18:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508134009.4582-1-syyang@lontium.com> <20260508134009.4582-3-syyang@lontium.com>
 <3188f63f-5358-48d7-b934-af20a8f95c6f@kernel.org> <CAFQXuNbKBfyeQL3N3P5QY=6BWoD3O6DSbXN-WMA1rRG9vCs3Kg@mail.gmail.com>
 <a0352a42-15db-4c7a-ae73-8a4e1543cd50@kernel.org> <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
 <tpqutwzasfwhraxzymorkiot7uryef4l2n32fyo3i3fp337sak@fugghdkcqfrj>
In-Reply-To: <tpqutwzasfwhraxzymorkiot7uryef4l2n32fyo3i3fp337sak@fugghdkcqfrj>
From: Sunyun Yang <syyang@lontium.com>
Date: Fri, 26 Jun 2026 09:55:39 +0800
X-Gmail-Original-Message-ID: <CAFQXuNaOkDADrnUNMWt9JL0R9yAPrSUN1M08Z5CT=J3uXqwhkw@mail.gmail.com>
X-Gm-Features: AVVi8CcBMJd5tnV9CcZVmih9yHEbFd_Nru3jA9XKcANqlxTU-8aU2AoO7h8XO8A
Message-ID: <CAFQXuNaOkDADrnUNMWt9JL0R9yAPrSUN1M08Z5CT=J3uXqwhkw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
6=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 22:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jun 25, 2026 at 09:26:47PM +0800, Sunyun Yang wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=882=
5=E6=97=A5=E5=91=A8=E5=9B=9B 21:17=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On 25/06/2026 15:14, Sunyun Yang wrote:
> > > > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=
=8825=E6=97=A5=E5=91=A8=E5=9B=9B 20:54=E5=86=99=E9=81=93=EF=BC=9A
> > > >>
> > > >> On 08/05/2026 15:40, syyang@lontium.com wrote:
> > > >>> +
> > > >>> +static void lt9611c_reset(struct lt9611c *lt9611c)
> > > >>> +{
> > > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > >>> +     msleep(20);
> > > >>> +
> > > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > > >>> +     msleep(20);
> > > >>> +
> > > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > >>
> > > >> This is just plain wrong. Why do you assert, then de-assert and th=
en
> > > >> finally assert AGAIN the reset leaving the device in powerdown sta=
ge?
> > > >>
> > > > I am using software to emulate the hardware RESET button on our EVB=
.
> > > > When the hardware RESET button is pressed while our chip is running=
,
> > > > the signal level changes from HIGH to LOW and then back to HIGH.
> > > >
> > > > Of course, we can also use the following:
> > > > static void lt9611c_reset(struct lt9611c *lt9611c)
> > > > {
> > > >     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > > >     msleep(50);
> > > >     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > > >     msleep(20);
> > > > }
> > >
> > > Makes no sense either and you just did not get the point and did not
> > > answer my question. I asked WHY you leave asserted. Answer "we emulat=
e"
> > > is just plain wrong.
> > >
> > > So again please answer:
> > >
> > > Why do you leave device with reset asserted?
> > >
> >
> >  devicetree:   reset-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>;
>
> It should be GPIO_ACTIVE_LOW, if the pin as active-low.
>

Yes, I understand that.

I used GPIO_ACTIVE_HIGH intentionally, because I did not want to
modify the existing reset-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>
property in the lontium-lt9611.yaml device tree file that was
submitted by others. If I used GPIO_ACTIVE_LOW, I would have to change
that line in the device tree binding, and also update the driver files
lontium-lt9611.c and lontium-lt9611uxc.c accordingly. That would add a
significant amount of extra work for me.


Moreover, in much earlier versions, I had added a separate
lontium-lt9611c.yaml file to decouple this new chip from the existing
lontium-lt9611 / lontium-lt9611uxc support. However, Dmitry Baryshkov
considered that unnecessary and asked me to merge lontium-lt9611c
together with the existing drivers. He also told me that the
differences in reset=E2=80=91pin and VDD/VCC supply did not matter.


The existing device tree and driver code already had issues, and I had
raised them with you before. At that time, you did not seem to care,
and the community reviewers insisted that I must follow your
directions. So I did exactly what you told me to do.

> >
> > GPIO_ACTIVE_HIGH:
> >
> > gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);   ------   reset pin
> > is Low level : Clear the register configuration in the chip to stop
> > the chip from working.
> >
> > gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);   ------  reset pin
> > is high level:  The chip resumes operation.
> >
> >
> >
> > > Best regards,
> > > Krzysztof
>
> --
> With best wishes
> Dmitry
