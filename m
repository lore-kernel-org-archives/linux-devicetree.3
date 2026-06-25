Received: from out28-126.mail.aliyun.com (out28-126.mail.aliyun.com [115.124.28.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD90149C6F
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394859; cv=none; b=qSYF4I3EwNuT/wDhpAGZ/YwExq/dqNvbDxR6NquUtAmS4C6nRzCLQuqkDeEz2AfjqLSdSuCZ24ad8H1XUq6FqQMHYBUEZZCK1dQoEql0lxCvOisKpGQtoT1LUHC8EtaVkgaMvJ4sxNvOO9ELYIfCNQtLBV4O/Mu5E33LcO6JEp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394859; c=relaxed/simple;
	bh=QHWbY8ixn4UqbBUiJUBxYSrZq+dCWAw2m6w8kgaZZ0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7yUKq+Y9qH7yj2tE9Rew7CUsDJ/Mht2vJsW8kFFIwCeB+nxe1dKlwzP3fQSZQoVRBtn8nmS+58TDtPklOZRqrE8FoFrebUa6MWawbRVJhEBYsxRpNjUmRmTBa37EMYAhPsAnxOf7Sxhnk4CkqHSuKF3G8ADdVXoZ6RbElB6gQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=OVoc+406; arc=none smtp.client-ip=115.124.28.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="OVoc+406"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1782394850; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=r6Xx0NfFQAySM0PRNTDErUFEPOAC05qJkfQxdCWSqzE=;
	b=OVoc+406Ns9XUuYm+hbAxx4LPVMGzSevtdxokt+mjCNWP6Zw0aOpE9/MizNOZePH4+/bX977E0LIO5+ckoqIO/eQjdwfgijO88WGInMkNfNfaeoNiIBV9zKeIGZykcDCrnXWkwVv4B1JEaB1tAv4wvBL0mGLYbjngLk0IrGZc1nlXS8DenuIsEaf3xJfWpqvcxsybOqHSbhk5DUpDoncvuZBSy9zZmupjR7Z5cId4fuR8PLMmSGiYrb7F6tIYjW+hS4AcCmIrPEMm2CSlTIUGBddNRYN6Cde9GwV6HUB5QM6EQwVguLfaGF9obNOThEDS9oSkuOFEhqoUxQMOQsAkQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0746977|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.145739-0.00323627-0.851025;FP=18109321665246209298|14|1|11|0|-1|-1|-1;HT=maildocker-contentspam033037025160;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.i5hSY3d_1782394846;
Received: from mail-oi1-f169.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.i5hSY3d_1782394846 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 25 Jun 2026 21:40:47 +0800
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4871618372cso1286006b6e.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 06:40:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92u/e0mZSEx6nHomXBAR7sRVHGQ6UM3tGOlCMn67KaP2Hsz04FqgZt354DAPBDfylALlcbRC0ydAJ5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjo1uydOJqyCb1SZgFI3UN1N5pWQhURbcErhXvwMYsECZQ+IcD
	8XQW2aocOunuO/tTvoQ9Gc1BEagDUX6GLyNho6194atKVUpkJPHLn8E+Vf0b5sQ1wI8b4FljcPG
	oErhNxuq5paj5N+5uvwDDS7fsyxz9TAw=
X-Received: by 2002:a05:6808:2f10:b0:492:c931:4d66 with SMTP id
 5614622812f47-492c9316c66mr544834b6e.18.1782394845754; Thu, 25 Jun 2026
 06:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508134009.4582-1-syyang@lontium.com> <20260508134009.4582-3-syyang@lontium.com>
 <3188f63f-5358-48d7-b934-af20a8f95c6f@kernel.org> <CAFQXuNbKBfyeQL3N3P5QY=6BWoD3O6DSbXN-WMA1rRG9vCs3Kg@mail.gmail.com>
 <a0352a42-15db-4c7a-ae73-8a4e1543cd50@kernel.org> <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
In-Reply-To: <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
From: Sunyun Yang <syyang@lontium.com>
Date: Thu, 25 Jun 2026 21:40:33 +0800
X-Gmail-Original-Message-ID: <CAFQXuNa8bJCpZBkMs_3mtbK_pjVzDdaDaoGk0KDxiG_Pf7txdg@mail.gmail.com>
X-Gm-Features: AVVi8CcVIOgE8ToOf8-IAnxNW55nWpBwzycER8it0Uh4EDS4UnWSE0MAl-bvPXA
Message-ID: <CAFQXuNa8bJCpZBkMs_3mtbK_pjVzDdaDaoGk0KDxiG_Pf7txdg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com, 
	tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sunyun Yang <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=8825=E6=97=
=A5=E5=91=A8=E5=9B=9B 21:26=E5=86=99=E9=81=93=EF=BC=9A
>
> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8825=
=E6=97=A5=E5=91=A8=E5=9B=9B 21:17=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On 25/06/2026 15:14, Sunyun Yang wrote:
> > > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=
=8825=E6=97=A5=E5=91=A8=E5=9B=9B 20:54=E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >> On 08/05/2026 15:40, syyang@lontium.com wrote:
> > >>> +
> > >>> +static void lt9611c_reset(struct lt9611c *lt9611c)
> > >>> +{
> > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > >>> +     msleep(20);
> > >>> +
> > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > >>> +     msleep(20);
> > >>> +
> > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > >>
> > >> This is just plain wrong. Why do you assert, then de-assert and then
> > >> finally assert AGAIN the reset leaving the device in powerdown stage=
?
> > >>
> > > I am using software to emulate the hardware RESET button on our EVB.
> > > When the hardware RESET button is pressed while our chip is running,
> > > the signal level changes from HIGH to LOW and then back to HIGH.
> > >
> > > Of course, we can also use the following:
> > > static void lt9611c_reset(struct lt9611c *lt9611c)
> > > {
> > >     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > >     msleep(50);
> > >     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > >     msleep(20);
> > > }
> >
> > Makes no sense either and you just did not get the point and did not
> > answer my question. I asked WHY you leave asserted. Answer "we emulate"
> > is just plain wrong.
> >
> > So again please answer:
> >
> > Why do you leave device with reset asserted?
> >
>
>  devicetree:   reset-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>;
>
> GPIO_ACTIVE_HIGH:
>
> gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);   ------   reset pin
> is Low level : Clear the register configuration in the chip to stop
> the chip from working.
>
> gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);   ------  reset pin
> is high level:  The chip resumes operation.
>
>

Our purpose is: pull the level low to clear the register configuration
in the chip, and then pull it high to allow the MCU inside the chip to
re=E2=80=91initialize the registers.

>
> > Best regards,
> > Krzysztof
