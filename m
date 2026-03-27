Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055873E929A
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620581; cv=none; b=pFwGeYSQofnFsk3VXWr2g3wwPT7ykxstaR56/aHEMBJLMJbZvnFOw82Kq2HnAy4DidsxsA0B5vaCT3B4T/W3WqUOgLwMYe5dJk3uU7J+ZtCrclfXhRKS0kbBU6A7/6TEze4V8qxInSbRC5ZvZYUtoiPBk9dBfVjWQuq0ceDLw4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620581; c=relaxed/simple;
	bh=d1eKvqR2jm8j79I/laEc5/eGaX0VLDdRHXg8u2WAXu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZXD642diaWRodIdUMtjwdmjNRWXILnqOAN0nZhDW15iTVp10Wf1cbTHOHyjx/rjL/TAq26g5Ctn4Pd8mq1gAsHBDz/KSbcV9dMWwdQhbYwdUziz0yAhuQGYXqXakwt6T9jmBxZmb+x9i0Ui0kGKpouy2505uSpNdxqxjgPyHzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O86m/URy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O86m/URy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62E0C2BCB5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620580;
	bh=d1eKvqR2jm8j79I/laEc5/eGaX0VLDdRHXg8u2WAXu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O86m/URyRCtyar8s4uTy8/83jn/4yQEXIpOHGo3Wpvgq+3uAAkegEjZcoiuPnYR+l
	 NAMeeCYBfgNjFQm3URHDqgT/laQxtQgukgm25lm/vlBXy3G5mF7OVk+LmIDIwOKXsw
	 evF0kMknaGEDqwZUmKqnWqJRjDKSkb0ooOE2+uq4F3C5jhl1rfcT8n9qTdUKpPNre4
	 VDR7q2FZbsFJNubuY403XRGwZLP0/37bOnIMkXR8MwjoPYL+m9LpNuVquY5/iC6bKH
	 f7flB0Ymgl8WCcXseDAU88dDGPGT1mdsquyqg0Ub0QBITAavCC2xWg7YlBre5sHNxb
	 o2/ypZ0DN06zQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a10d130b37so2023175e87.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 07:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkVPA9LaHIMatOAm1kRKAa2PzsV+PtQ1j0d1uYJ3lyB9WtP9rLcGSmqa6AaUvUuPpSYgt3ELZTCHFj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Z7WZjvhELU4ADVIbRJNyJCwMDakV04LQmNeMWCLfj/Nsdz+3
	c138EvFGEDQwEwsYU+QPjsQuz5ra93cz7KvovaXqNppqV56M8UJxtvlgPnfFPNc83OYfQknxM9n
	0jWGkOGAx1zTpbWydnkmKsmmRtKg0NU2M1BoNujN3Rg==
X-Received: by 2002:a05:6512:3983:b0:5a1:1de6:bc66 with SMTP id
 2adb3069b0e04-5a2abd50231mr704477e87.18.1774620579288; Fri, 27 Mar 2026
 07:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
 <1f75b250-c3b5-45da-bc82-aeadf44dfea4@oss.qualcomm.com> <CAMRc=McUdboG0ziWmUf+h9mUiuGesaFk2v27z_Opbw-AF33C0g@mail.gmail.com>
 <acaPSW6VeYceoMnO@lpieralisi>
In-Reply-To: <acaPSW6VeYceoMnO@lpieralisi>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Mar 2026 15:09:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdT9CR-nFdg5Oaj-Kz_0+wSYjszV7VXgMPubtyBhgFsXQ@mail.gmail.com>
X-Gm-Features: AQROBzAeK-ifh_eB2c9LxTiqer-4pFaaDK_H1nIMxWkpvl_eX-PbHfPGxDMGKOA
Message-ID: <CAMRc=MdT9CR-nFdg5Oaj-Kz_0+wSYjszV7VXgMPubtyBhgFsXQ@mail.gmail.com>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 3:08=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> On Fri, Mar 06, 2026 at 02:32:46PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Mar 5, 2026 at 6:07=E2=80=AFPM Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> > >
> > > >
> > > > You should pass the address of this function in faux_device_ops ins=
tead of
> > > > calling it directly.
> > >
> > > In last patch, we were using a probe function. As faux_device_create,
> > > calls the probe from its internal operations, "of_node" can only be
> > > assigned from inside of faux device probe.
> > >
> > > As our primary requirement is to assign reboot-mode of_node to the fa=
ux
> > > device, thought to make it this way. (As we did not want to assign it
> > > inside the faux device probe).
> > >
> >
> > TBH This sounds like a limitation of the faux device API. I'll Cc you
> > on a patch proposing to extend it with the ability of using a firmware
> > node to describe the device. If it works for you, you can integrate it
> > into your series and use it.
>
> What's the status on this matter ?
>

I looked around and didn't find any good reason for adding this after
all so I dropped it.

Bart
