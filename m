Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370563B8D4A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440944; cv=none; b=iDAbOuPH8HtNKUg6FRDfz46Sv1BdndUR4DCY9WSbgU1jc0SlLzqqQWGP+L+c9S1ZL9+Bskz57CMYOh9O6clWPue75NlvuJB3tLjBEjDX0PHLrha27k0Nj4dksV+8YO0C9LfWYB2O6DMRHdOJDA0HCaRU45Gl+u7XPAmo02it6nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440944; c=relaxed/simple;
	bh=vGDNYvjF06Md4Ju9q3LC1FBqBbNV1wVgOxSy1Ztt+kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShM7p8bx56OliK3YDOJy2ZL9JnpvxZUyL6iiwvk1q4xcUk9yisA5DO61BPsuahBwrefhQuO3hlwn3hgFJ451oIDWdJ0UMJNMYAn52wypYtDLOUe7XfrZKiISMTkcoyeEe/v432jTT0EqUOJGehJTkjYpOW45DMx7gkiDMvR5w9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfQC5GRt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfQC5GRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0A71F000E9
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779440942;
	bh=qMZ5uVQSeKp4nOSIgfrXw005H4ImnDWLFAokwE5MQpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfQC5GRtWnQPmUg0AmUxRIkQOuc3vkhRN9AcATjB7sw2h57gqM+kJI6n+PHoxSx9d
	 CLSeT2tTlA29zpxhcE4VoRsJlmVveXq2wlaY4XogC8kpwwp8khpPfGKtMUMPCe+gwg
	 OPs7MnK0oVJveKBLCQxO/iUKMck1X9WTwbQPS33ZE1O69NcdcEuQYiU/6cCv1mVj9g
	 vjOndfpXH7cMIYd1EYyM4MRK7pzgKBF/WWAEC5GXOnj5iqBLMGLLXj/+59Hj7pJqyl
	 ssHWMo8g3raUTGnKk/kczr0rCZqr4xkqQi39r/8gyCdwbG1IR8IuRhNQ746wG25Ia7
	 L3IYIIvK5/I9g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39396f873adso104810561fa.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9zKDPDyFCCeg36RrcJXg6EAJrfI0ihTjcoXf2r57inlWzVf20qvg0fE0ybpiudpCqWWm6G+QRaDbWl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc21QFrxyLhcsEJGocIYc4eS2NZ5VDwdqjlyBY4n2Z8RAtKSCV
	8RQwLUKKDGk4FbyiAUmh009BTLYm4lmk/sO2mk5UZYSYM8ruiqagw2I4949avbGWnnpVsm06CMm
	NKwIJeEiyeD0CQr5G0dVEWUubp5xbqwT7hqlbZXrodQ==
X-Received: by 2002:a05:651c:150f:b0:393:b0c7:db0d with SMTP id
 38308e7fff4ca-395d8d66af7mr9077111fa.30.1779440941340; Fri, 22 May 2026
 02:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com> <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com> <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
In-Reply-To: <20260521162705.GH3591266@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 22 May 2026 11:08:49 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
X-Gm-Features: AVHnY4KEjtS5lwmgChTK038L9jNVBXcpGXq73PwgIc9ndboYTrc3guSx2Szrq4o
Message-ID: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD cells
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 6:27=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>
> > On Thu, May 21, 2026 at 3:24=E2=80=AFPM Lee Jones <lee@kernel.org> wrot=
e:
> > >
> > > >
> > > > I suggested it because of its flexibility. The alternative I had in
> > > > mind is something like a new field in mfd_cell:
> > > >
> > > >     const char *cell_node_name;
> > > >
> > > > Which - if set - would tell MFD to look up an fwnode that's a child=
 of
> > > > the parent device's node by name - as it may not have a compatible.
> > >
> > > Remind me why the chlid device can't look-up its own fwnode?
> > >
> >
> > Oh sure it can, but should it? I'm not sure it's logically sound to
> > have the child device reach into the parent, look up the fwnode and
> > then assign it to itself after it's already attached to the driver.
> > This should be done at the subsystem level before the device is
> > registered.
>
> Leaf drivers reach back into the parent all the time.
>

But drivers don't generally assign firmware nodes to devices they are
already bound to. This is racy as in probe() the device is already
visible to the system. There's no synchronization of device property
access - properties are assumed to be read-only for a registered
device.

Bartosz
