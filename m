Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63701531C8
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784173151; cv=pass; b=ZCy0rjmd5wVLk+tcHALMqxkJM+CSx3qtWv5Thc6mLIOdfQxh9CLh2SjuYcDYO6r+m0tm1cpgv/IFon0GeE1ztJoeeO3OkwiNsTjUZ2DA00B7uQRzx/zOU8I23dKWaZn3NzJnRed90VmyO0GcsZuyoVdRgaqNsZNWJO7qwzusb4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784173151; c=relaxed/simple;
	bh=Uhqa8139JOnKLk54+zEOdrhrIOYk5862I6qAHmICEeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6vBvbTE0YaO6dNIykJmn5+Jq+I9n4ze4Xx2dV/lQgE3Yy975gWCiU++ET9QnbmFQTVssl8D3jt69XDtfXOZbBHguw2GgpjM6a5U9MwsfPjw9U31AscB+d1WujTDaoqxuWe1kJV2ZoXtxawa3pDeMZbSIDiDivq2DgUMTToP0D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUvDcSKI; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUvDcSKI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-476d8e647e9so5715248f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784173147; cv=none;
        d=google.com; s=arc-20260327;
        b=XDJU02AqfaLCXfJUVbcc120ZR8GmWd/bzGfw3invKXtWJUbrc/1SIrnh7l6mdfb2Ey
         H7q8pcGLoUXZeN26bIzCwcrKS1lepkX8u9MAuWf3oRwrRLEJaitF+tVJQlLGHZCiHwIJ
         nPx4uf14V2alTJ6QSsXEcTTpfP/aIaTA3wbP4sMI5zQaTuQjTT0SzaZ0QE4VsUgyuBK0
         pmq56duTarf40pb/2gwC9mgpZRgCF1W8eKs8UEQWHzrIndsY/JJLCH/NGlkc/BMfsXCt
         s6cle6Uq7AEJk0KSd6Owme7VE1TFEZmSEKQDrUNRjeyGAi63V7WqFb0e0sOuJpIzJvMN
         CCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HaAi6r0o04lXEAunGEp84mPQVwuTB4awISro/owjdbQ=;
        fh=bXP9gkCJoCv5T+qTckOvYB5vqQyiTIQnesiF6CO/2kg=;
        b=CmfsXaDyOJziCZrL2STnYuhbiMIz3q0B3GxeYqg55Z9Q4iop4tJoQFQNTzXG84l/90
         P+gNgeYQN421hqNiqHlsP9VUU6DNOw6azpDFLpODhkf6S0W2eKl78jRplbXn75McJ7DD
         +tjEI/kyv21c7fpSxT6I7l/LKCiLvrG+jP1q3VKQbTeoeEuKmGFYQzKwWo7k/NJ8nLA8
         IsgtaQ6Pfdrg15ZT/7VS5AUFLreDGTTZbcu11jpRo9KIvZwa1CFzludPVVWNLZom4Ghv
         tk9Aw5NipI0FVBZWHD9MwOn660VvJ10sf1+p2ZFWSqhRmsuHpu4f3E7xZD+CgaIG/JLP
         3irg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784173147; x=1784777947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HaAi6r0o04lXEAunGEp84mPQVwuTB4awISro/owjdbQ=;
        b=dUvDcSKIDeaU+UCJcfRTR+kPl+ykn+6NUQownCo3iOmvpWFRuEDXBLsTpmLMNj5Wtx
         SAHzaGGAIpMT965kRvfn0JgG9k1zIs05uuDMGBjTgc843sNlAnlPztFEvCyrp3FiB8uL
         unVvcVZUG0xz63bWogGb7j7U6oBuv7AQgJSIa5xUQNwL0coMTEgrQ+P4nxBXaQkuoiM3
         VEeY7x9dhWV28guPmiDaX5/YyHg2y5Jw4v9qgyNB+ary+gjxH0PHd36rf3txXRuFmNb1
         Ix2vWs08br11VBVcMLq43I2vmAduwhptQiYG9HbYViAyZGsPwOzFlmpHw/nMhCsQmVS4
         cIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784173147; x=1784777947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaAi6r0o04lXEAunGEp84mPQVwuTB4awISro/owjdbQ=;
        b=B9z3E22yN6flPrpGfO8Avb6HSYe+ROSUu/NR9lsomf0ghnEJdXgbtlzBek63FICgL3
         PQ44G0qxD/HInmuxgOzlJhATFgEHpohoxA0At47DY4/aAY3WIPH4ZZ9Gm2O8n6xhAQZ4
         rndLUaowCuzpqpdfuEMOTBBV0TyeJ1ttBnIqs+/EVwyfRE+DCX2HUPs1Ou0B04YzmA8a
         504IDqI+Tm7NFW4ye158ZDKN5T+m4qn+9d6E96mM1VTUMVu3NC8zeFjJ8kWQUcyzTSBr
         J2pVku8gC/QpE52Uj8qAI8U5oO+xF06vc4BuRlHAYjyxM/6azlXsczZSXzqqdpeFaMC2
         Wfog==
X-Forwarded-Encrypted: i=1; AHgh+RobpgBD2qzbfC+VElHBE1IRDVR7gsiJUIC3K+8clSqVn55l11cexgnZOhnLyHZa9VOoF15NeeUjAZMw@vger.kernel.org
X-Gm-Message-State: AOJu0YxPnIb7UcizNs7c8tndySlLYzKhc4DmQ0D2oQ/VKM13fjptRbzk
	aSK5X91jMBsBmoM/tcG/IaOT5waglMR+fIiMJrcBeeEScrOo5ZSb3qPqX4ZI8kC1YHvPF7XfU9o
	RJJl0G271IKH3JD3GSgJqtle+DAMpce0=
X-Gm-Gg: AfdE7clcnpcoMgfTsudgktiHjDyeN/WuDEC6YB4tvbKuQ1+mMob8k9rcjQP+bbO8lcG
	6SKwKWtDspzRHjUMlPhCNtUp1SkKQfdIDHvS86BRq81J4LgYMRvKGUhAaDFRzEfhqT1/84BZn/a
	vSIK8J7QysOlovWkiXtndHuBfiqTCSuJlrFycmBg0xxYLYztq77FG8UEhKjOnSfyuFtq0s3uBrh
	8KaoqyAURVXD9r8oNcIc2+vXiqN+oiPknTAoEoM3cz2UdufO9ZEE1TD9BZCp8JSAOpRy6xa
X-Received: by 2002:a05:6000:461c:b0:473:506a:e47c with SMTP id
 ffacd0b85a97d-47f4886399amr11638724f8f.26.1784173146909; Wed, 15 Jul 2026
 20:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
 <CANbgqATR-V0rRGfzj0hdJ2hsJex-iWzHMwD1L4vavTi2Jd79Kw@mail.gmail.com>
 <alfV1691ZgZ6KylX@venus> <2301403.NgBsaNRSFp@phil>
In-Reply-To: <2301403.NgBsaNRSFp@phil>
From: Andy Yan <andyshrk@gmail.com>
Date: Thu, 16 Jul 2026 11:38:53 +0800
X-Gm-Features: AUfX_myr_sOq7hYE4m85iq51mdLC4kRmODLTYq7q95ypFNA8vqcVX-4llt0DR9M
Message-ID: <CANbgqASSwGjnUsqmpyPgYQ8Qy_6++krbVMQQywB8oJv8Jziz-g@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] drm/rockchip: dw_dp: Add runtime PM support
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, yubing.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello =EF=BC=8C

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B47=E6=9C=8816=E6=97=
=A5=E5=91=A8=E5=9B=9B 03:30=E5=86=99=E9=81=93=EF=BC=9A
>
> Am Mittwoch, 15. Juli 2026, 21:00:12 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sebastian Reichel:
> > Hello Andy,
> >
> > On Tue, Jul 14, 2026 at 06:08:06PM +0800, Andy Yan wrote:
> > > > @@ -58,6 +59,8 @@ static void dw_dp_rockchip_hpd_sw_sel(void *data,=
 bool
> > > > force_hpd_from_sw)
> > > >
> > > >         dp->hpd_sel =3D force_hpd_from_sw;
> > > >
> > > > +       ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
> > >
> > > This can triger  HPD irq for USB-C DP AltMode, but for a standard
> > > DP port, this is no way to acquire runtime, so there will no irq
> > > when plug in.
> >
> > Right. I don't have any RK3588 or RK3576 system exposing a DP
> > connector directly. This this is non-trivial to test for me :/
> >
> > I see the following options:
> >
> > 1. Only enable runtime PM when running in USB-C mode
> > 2. Mux the HPD pin as GPIO to support waking up with the controller
> >    being suspended; either remux when the controller is awake or use
> >    the same mechanism as USB-C to do software based HPD on top of the
> >    GPIO (which would allow using any GPIO as HPD).
> > 3. Have a poll function, which wakes up the controller regularly to
> >    check the status
> >
> > I consider going for option 1 for now, which allows option 2 to be
> > implemented as a follow up. Mostly to avoid that the series becomes
> > as big and messy as the USBDP PHY series became.
>
> I'd agree with that solution.
> I think we can all agree that option 3 is baaaad :-) .

  I'm also in favor of moving ahead with 1.

  About Option 2: we've got a GPIO-based HPD workaround in our  BSP
tree, but it's a bit flaky in some use-cases=EF=BC=9A
  According to the DP spec, there are two types of interrupts:
  1.  HOTPLUG_IRQ: A level-transition pulse that must be sustained for
at least 2=E2=80=AFms.
  2. HPD_IRQ:  A low-level pulse with a duration between 0.25=E2=80=AFms ~ =
2=E2=80=AFms.
 With the GPIO-based solution, it is difficult to reliably detect such
short pulses.


>
> So with 1, functionality keeps working, and then someone can put the
> special HPD handling on top later - the Rock-5-ITX does expose the DP1
> (on a hdmi port)
>
>
> Heiko
>
>
