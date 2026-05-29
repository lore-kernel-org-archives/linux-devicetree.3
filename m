Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467753C379C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052192; cv=pass; b=aybGgAgYxZYeEixJAF7BzSwTX2AuIYAviq1seneCj9YNIXRyJYIfKBUHo3UcaMsYay8vyWOPD0fa7iDBFu7Fr6K8QSZ3KlzkpJdzybGcUqCRfH2tLU3ExYsxUIqIAjrCgM+tXORBRAaj5N4lOAG1QZHMtWNLjpLo4Fq6wkHAzP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052192; c=relaxed/simple;
	bh=Y7dc5LHP74ZYKK/a6Hv5SvYo8Aw44DNxbmzdGSGer2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqeFSqot4J9ZtCLp6pUMbKEa+d4khPLa3mXzOnSPSB6+uJJUplM71fzBhA/8PqxfIR7M0WLp1beRahUrKaz8pj9uRgBfYhC3oPQAoqrSeMfazCEmTYQ3Mv8ShTQjykfwcKgoMkC6ZLFyUClP4YmDCKjKlgejLedUz6VW9cMdEQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lbu8DpMo; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lbu8DpMo"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d8e3bb72so221438eec.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780052189; cv=none;
        d=google.com; s=arc-20240605;
        b=WIrhVTET/Wges+TQ8hdx4baHjnIT85pFXm2guSVVuueVxLJpW/awiXQlwo1qrOPOG2
         DqkLyIfNgp6n55VtW83KzXCqrLmSJ0ZwQVAgL6/iaUjECYx/AqkDWpUNivo2dNGYGlvr
         hNbc+V8X5T9pyaGdpZ8XNEw5T0k6+3iEQkL40zOCqMq4GJofUdrC8ls/4859IWgk69MZ
         NZp1OkEC9W1I+OiSx0NTggY9wrvC8DKrKuS4/JF16kYp25g9Ry0Ka1zwWGpgdBI+aPZh
         5yoCuimnVm84qmsOn+l+Un8o0pE+YHf9SaYPNXhhr038lQHKSIGa87jr4l1rfYeRaQU2
         nbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QT9o7z8njCzuauXIRpTZNkDYlGBM5NI3aWAig5/bi7I=;
        fh=JC6bFJm/l5VT6/fJgrnnGXuF+skqcUS0TxgvczyNJnQ=;
        b=Ub66H6QBwKw0TSLOfw0JV6b9JBCcATGWdb2YxlWZjCK1Qb3YFaXat4E++di12bxij+
         /LcJ8KqHBAW9k6m+xDQB97BL9BAVaDikoMD7DTS46uh+k1p8of8LlvuJe45sUnabWT5d
         qR5RlO62pD8DY/ITM07rePQKv7mzps1EWF0iYXaZcMcNYZieMLamCJqmGOtwwdc/EOvk
         pH/zkMhZMHP2GObkFyWhcZ4hA66wy0/B3DQmUHaQW0/GV/lILYSuhowiVnDmHxMMJIXk
         9ItplSnY5eqOBq64q9gUqBFQc6+hC2XUuQexrFxX6FLpJFwOR3JeHv+g68UaGQz/d/rn
         GKFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052189; x=1780656989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QT9o7z8njCzuauXIRpTZNkDYlGBM5NI3aWAig5/bi7I=;
        b=Lbu8DpMo4pxqcsBXVtbqLe0NhbTjFp50POcVMm48mQVhtTSnx0CscTWnpEanSdshzS
         RkLGTJ2ta28nxAuIvrp/aTEswQScWUYjm2RxHPRwWmXJAvbtQeAnstVlu3d0C4lLms3s
         8F8Jn7/FHkuu7Jkm6ytH94infdSRNx1jXu6eKBu2CpGJIpQdNBZLvNzWQIUlaqfZMUV2
         tNZpqfBXzY7Or/6IYF342HTinVEb1ATIF9GPqXibUvuNqanXTqcVEwda5B89Dv4jxmMG
         9hNy6Hsht1Qc4oCp0EV9sIb0FtTtNCgIKdPRUZQBZ6COtvZjFvzJ96rgyTuVsB0s19r6
         OthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052189; x=1780656989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QT9o7z8njCzuauXIRpTZNkDYlGBM5NI3aWAig5/bi7I=;
        b=ixjQq0StQ6SkIVsfkbBo4TiJCHiGu4pBhbab6K9ffLSxBHBX5Bts11CqylXzCuGuUy
         Rz0ZtMr/RT93xpLvh8ZGXIwGCNNsPnavwyDA9suurxAj3sYQrEv3McpkWL4r0LbRyIuZ
         6dfECW/06F5JzcRHB4rXxALP7DrwlMsKP32PeYw/aURKgO5nbqXv/4/wywG7oVNP8yh8
         9BVWxjNJeq/NP3dDwhvvDXjT2mlDRU1l7rRKAXnZhhC4WSJVUSyl0rOS5ul5ReUhStwB
         exf9Of06OyLXr9YTdtkVE6loAdILfq2bHeWaizdSnD4diYUhPtqc4kGPu7+nk18ppe5t
         glhg==
X-Forwarded-Encrypted: i=1; AFNElJ/qtmnmF4VEnu4RuvA9/HS1mz/iid0UMsqjfzjO3hEhR54uSCK2givalRVRd93G8nL0XfHC00ahvgmT@vger.kernel.org
X-Gm-Message-State: AOJu0YzZsr3SJfU/8JabHCdIpibZ/KDjw7UrnyAAwoSGJlq+wwcp1Kd0
	Q5aZ0/3XGp74KvDVDSHuDrA8jm8ORUru8zDi/cimCUUUU3lDkG5JK2RJMDtimVM7kRWr1Bga/AR
	k8JAi59/o4cVNLLycSwqyMwPUhJjX3mU=
X-Gm-Gg: Acq92OEbgR+8WiUkeyvZWYy0jJHsPPM0M2B7QOWDBXHheXNT66qT2IW+tW/xOmBSTaw
	FVZju2+nK6INBfHRw5mzV8opbs09Oyp+9JE/zIVutS7KcdUr9IBK3uUjgPEEWWEewIJGMVgsCaL
	ZNatznYMG4+q45ubMJ7DVtUqnODSTH6R7yuuijuWU7SnXXEPYSLwvJaAX8Y1PGejyy35vnLV07x
	M1LTp/6dnqxNaWa+IdRGzpwI0Hvx1ATSPms2pAu98GcIsQ3F/V2/2/nLpKbCuEjEbnHggsq6eQH
	Bhm1sVV+Qx42QvYZ6SiUCIYTyFc0Bw==
X-Received: by 2002:a05:7301:688a:b0:2da:4216:7ea3 with SMTP id
 5a478bee46e88-304eb16c784mr1065135eec.14.1780052189412; Fri, 29 May 2026
 03:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-2-clamor95@gmail.com>
 <ahlhinOh3NxB7FY_@aspen.lan> <CAPVz0n3C8D+amSRkF=Koj6Niu6u8uz4LbMoRYEX32_ECm5-tSQ@mail.gmail.com>
 <ahludIZPMUlPDTG_@aspen.lan>
In-Reply-To: <ahludIZPMUlPDTG_@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 13:56:16 +0300
X-Gm-Features: AVHnY4J2FFsbeePVzhdaZr1L7xTMY9M_-IQ9RntYfCEGWE3LHkP9pzzQ1jAxVDc
Message-ID: <CAPVz0n0XvQwLd6gv2kiVHfSTyM_jF142beSwWb3L9sBLEQDzZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: leds: Document TI LM3533 LED controller
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
6 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, May 29, 2026 at 01:07:50PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
12:51 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, May 28, 2026 at 04:51:18PM +0300, Svyatoslav Ryhel wrote:
> > > > Document the LM3533 - a complete power source for backlight, keypad=
 and
> > > > indicator LEDs in smartphone handsets. The high-voltage inductive b=
oost
> > > > converter provides the power for two series LED strings display bac=
klight
> > > > and keypad functions.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++++
> > > >  .../bindings/leds/ti,lm3533-leds.yaml         |  66 +++++++
> > > >  .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++++++=
++++
> > > >  3 files changed, 304 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/backligh=
t/ti,lm3533-backlight.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm353=
3-leds.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm353=
3.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm=
3533-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,l=
m3533-backlight.yaml
> > > > new file mode 100644
> > > > index 000000000000..866b0fb8ed04
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-ba=
cklight.yaml
> > > > @@ -0,0 +1,68 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3533-backli=
ght.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: TI LM3533 high voltage series LED strings
> > > > +
> > > > +description:
> > > > +  This is part of the TI LM3533 MFD device. It represents two high=
 voltage series
> > > > +  LED strings for display backlight controlled by the TI LM3533.
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/leds/backlight/common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: ti,lm3533-backlight
> > > > +
> > > > +  reg:
> > > > +    description: Control bank selection (0 =3D bank A, 1 =3D bank =
B).
> > > > +    maximum: 1
> > > >    <snip>
> > > > +  ti,pwm-config-mask:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: |
> > > > +      Control Bank PWM Configuration Register mask that allows to =
configure
> > > > +      PWM input in Zones 0-4
> > > > +      BIT(0) - PWM Input is enabled
> > > > +      BIT(1) - PWM Input is enabled in Zone 0
> > > > +      BIT(2) - PWM Input is enabled in Zone 1
> > > > +      BIT(3) - PWM Input is enabled in Zone 2
> > > > +      BIT(4) - PWM Input is enabled in Zone 3
> > > > +      BIT(5) - PWM Input is enabled in Zone 4
> > >
> > > This is optional and the drive implements a default (zero) that is no=
t
> > > documented here.
> > >
> > > Is zero a sane default from a DT binding point of view?
> > >
> >
> > Yes, if property is missing then PWM input is disabled which is
> > equivalent to setting all bits to 0.
>
> So the default should be documented in the bindings?
>

Ye, sure, I can do that.

>
> Daniel.
