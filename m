Received: from out28-115.mail.aliyun.com (out28-115.mail.aliyun.com [115.124.28.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5082F1E98E3
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394348; cv=none; b=Bw/EQ0ZvuCBHsJx8cx3pdST2B22xlyUW6TBvjnjH+dj0rnhGWCLY+yoXPbfWVkD3bfvTVEgi1AejxusQd3vIHfZ+h5oldsHBFhGcHNY0dnAIELXf2CFtnqeH6LBVe/wUt81jZKumM6XdK2DsjPpbLI3k812FLmSPWdKJwBaOtbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394348; c=relaxed/simple;
	bh=3/G28DdnYc9HLNSxtSSdFJui5pJtbyuKORnAbCeIKBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OuvpZXxEqHRTKfPee1YSpU7ttLrBQi5QLydzhtfCloSR+sy8RfzIdpyC9KKrVf0kXCoCECYDcTjZIUErexNeVKhZgx4l9kMBLvM22+nTME76TBBVBD/Xv4XcTYX3JyOC6u2vF/9mAa/EOwrWuRTY+Ig/XiWEZ0DDdVnZlpMrO+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=mgBz6syL; arc=none smtp.client-ip=115.124.28.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="mgBz6syL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1782394338; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=gRSJ4CRS8OCB04rZdFrPRMpEbw/Vc3lgI3K6YTTYbew=;
	b=mgBz6syLTfhuqEb31wE5SwN7jAAsCDbzQjk8a9NYiyvARrv/ctUzoZWoJTPZh0ZVF6QxTwkDynakZ4gMCrqo4AtgHCid/izrl9kflatX8XEBAVHo5KpP7dGCvKT4c/CvadDABmrY4VqP9/c9tp3n9WFKO4Pekry0v8Sybf8wX2HfYvDOHC01tZXqULUwLCoYwasFozt964elYQFlvXzM0cxeWA+VaTjb2g7YCbLqIjPGFgX+kHtP/GsHlyp2Fz1Gl5j6G5wswEr0Rw85VTX0u1Nw8mruvFyff593HYizJTGJOcCqUwNt4a5PIXauwHYTXKk7fY9uUtQ8VBGaESyIcw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07516154|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.110469-0.00242109-0.88711;FP=18109304622815978754|13|1|11|0|-1|-1|-1;HT=maildocker-contentspam033023018039;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.i5Q1H4d_1782394020;
Received: from mail-oi1-f177.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.i5Q1H4d_1782394020 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 25 Jun 2026 21:27:01 +0800
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-48f0e5e6698so1549355b6e.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 06:27:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8IAatK6wdtQRAbR6ZUnFBRj2ekpfxiTDDgp/g4PPO0wY8FdPQNfhLRZ8YTdDUMiVkY8E+t0K1RAJJV@vger.kernel.org
X-Gm-Message-State: AOJu0YxOB0jy4E8VAAKOaZi/kQKzkeMXZr4hyQG+luWYcGug4sNM8lK9
	yp0WFN2UgmCnqCKQin2IyKK4AyTIyudwG/bUgGlIkWtt1hDbhRt1edRilV/VZOoZMvDEMHFkDIv
	fAubTqqNCXwoqtAQ/BIzZWVJ2RsdN3Ec=
X-Received: by 2002:a05:6808:c2b6:b0:490:315d:e0d5 with SMTP id
 5614622812f47-4921791c07bmr2492458b6e.16.1782394019404; Thu, 25 Jun 2026
 06:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508134009.4582-1-syyang@lontium.com> <20260508134009.4582-3-syyang@lontium.com>
 <3188f63f-5358-48d7-b934-af20a8f95c6f@kernel.org> <CAFQXuNbKBfyeQL3N3P5QY=6BWoD3O6DSbXN-WMA1rRG9vCs3Kg@mail.gmail.com>
 <a0352a42-15db-4c7a-ae73-8a4e1543cd50@kernel.org>
In-Reply-To: <a0352a42-15db-4c7a-ae73-8a4e1543cd50@kernel.org>
From: Sunyun Yang <syyang@lontium.com>
Date: Thu, 25 Jun 2026 21:26:47 +0800
X-Gmail-Original-Message-ID: <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
X-Gm-Features: AVVi8CdcsgeQPjqxnZ4gT207zSP4WZU_6qclErTnYRUAvVG4BxkgLFK7wlIGlqc
Message-ID: <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
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

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8825=E6=
=97=A5=E5=91=A8=E5=9B=9B 21:17=E5=86=99=E9=81=93=EF=BC=9A
>
> On 25/06/2026 15:14, Sunyun Yang wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=882=
5=E6=97=A5=E5=91=A8=E5=9B=9B 20:54=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On 08/05/2026 15:40, syyang@lontium.com wrote:
> >>> +
> >>> +static void lt9611c_reset(struct lt9611c *lt9611c)
> >>> +{
> >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> >>> +     msleep(20);
> >>> +
> >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> >>> +     msleep(20);
> >>> +
> >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> >>
> >> This is just plain wrong. Why do you assert, then de-assert and then
> >> finally assert AGAIN the reset leaving the device in powerdown stage?
> >>
> > I am using software to emulate the hardware RESET button on our EVB.
> > When the hardware RESET button is pressed while our chip is running,
> > the signal level changes from HIGH to LOW and then back to HIGH.
> >
> > Of course, we can also use the following:
> > static void lt9611c_reset(struct lt9611c *lt9611c)
> > {
> >     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> >     msleep(50);
> >     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> >     msleep(20);
> > }
>
> Makes no sense either and you just did not get the point and did not
> answer my question. I asked WHY you leave asserted. Answer "we emulate"
> is just plain wrong.
>
> So again please answer:
>
> Why do you leave device with reset asserted?
>

 devicetree:   reset-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>;

GPIO_ACTIVE_HIGH:

gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);   ------   reset pin
is Low level : Clear the register configuration in the chip to stop
the chip from working.

gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);   ------  reset pin
is high level:  The chip resumes operation.



> Best regards,
> Krzysztof
