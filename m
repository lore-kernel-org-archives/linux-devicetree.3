Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B82347536
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430300; cv=none; b=Ov0+pJ8HISikgFq5zJNob2Hpa6wv3I6Ghjktf0f4WYVhbfgXiOdfSlONORZWjhPDRByN0VaV3T3uzf5TG+4uRwRlTrVpiJwgVY8xaW+9DgtDl/9Drl8AU97wxo3hDp9PfC28bym5EKaPVgeGUIxJjps53P9N3RJZN4mTKJVyO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430300; c=relaxed/simple;
	bh=qrYKJpnV5q5wsZW/KCJEGBve3p9zylQB/0fgxRV8QwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6YcRi4R3NISahCs6a4SLRGN4TkYhkLFEleplbdaOON8TieGVm/D7DOkztG2GU5xBqlh5sDGlH0N4xBsOe7EHljeSuQoUVBNF8h8vvFMig0r/OmKYqqtEVn6cMeUnB1Nd874eFcUomw1lrL3SL1ocFcpQacHr01d21f3KYkID2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ee82e853cso400244d50.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430298; x=1775035098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqw4hGAptzQW40hqgwgs8wt06iUhcX/hjN2fKnH5lLk=;
        b=DDVDcZyGPv1YI/0MnpKRefom4HhTHc2s+A6OOxA2h+cJlZjtP7N2zY9LJhWPUqxD/r
         UF9U36aLaZsaaxdrndZvJ4WuzyKSTtoFBFBDi0nw8aqNvTv79djwXpnIpo0qWUUJG2BN
         tRLyfNZskvej3Vf17ePEpYxG1nbvjEFVx9xo5BlNpB8bKkrlw+omx8VQ+otEDkT+9MgE
         cNIx9bvzxteQHFc3LILUxi2OHUlJY4eXM4g8EjrUouDngwLsln5nF0EwvFgVqCSTt/Qd
         88TEJI5Glaoa/Lw+S9QyYR8rWEAqRvEa8UNHPU1M4mYdP3xilQEz1z8R+EeRZTqwffjA
         4UUw==
X-Forwarded-Encrypted: i=1; AJvYcCWk8R5RON9+PVckeg23PUI1KfL7IoMSWYqzlgGQdb/LW4XisW8Af8SOOgMCIS5sUb7jtTSgKYT+hw8b@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg/6bligai1MEYCeEPhl5t35gBWN3YQ+EeN7vFFCOC3rtkpMLw
	qKBliCMH2RibHzTHy1ZOyeLb6omoVEmvgJ68ifnWQiBcx8XnEdgFsCB7J5Xew4A8
X-Gm-Gg: ATEYQzzz9aPbQojQD4IdTHiG6koHZx7qxiit2dfCuYRNZ+CmPzPHYLqeMBxDD/4+RCF
	uD3Osagc39lU46OyySD7wg/hnm4wucxsvV162YMd7pZg1ap6+w7JN4T9yYBNgzCPI16YgU7itcP
	j7myI2TD/rkxqGoC/KytRxkZRNiBFLY6FNjNVh4fAxtOuJNrjKXAJ7V5QXxMDZzmVXcifXHTgEj
	lz8WAaZOS/NZY64AOi9qMcZb8z37Iq+NeuvIvUetDlW6NuwezALI3KccjLqbpcymp0NgHBwf+9b
	VhUd7qpPgCt88cPIJ680WzNUfV2X7Mtr4oRZN9IToSVNo7wyHgYSkO+9vb3yUQGwnkRrfn7pXCZ
	Vmdho6O4w41yj+szH+qESV4hSEME23MAOfK/WtIK2NhSFP00XFkHtHpUXm7zNyYojkdAC+88Qvu
	IL39x6DOIAN9ixg7/Z2Hm0ZbP6wNc/dMrbf8HvjjfVSW98SbUa16aAvFsDeHXPIOjuldh4wJwdH
	aJI/JD3tYw7DN9INwj8veezY6EIQ16jPtisvoRXko4RKw==
X-Received: by 2002:a53:d005:0:b0:64e:71b7:58b5 with SMTP id 956f58d0204a3-64ee60b5687mr2223664d50.32.1774430298291;
        Wed, 25 Mar 2026 02:18:18 -0700 (PDT)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com. [74.125.224.49])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eef9b34b9sm55089d50.21.2026.03.25.02.18.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:18:17 -0700 (PDT)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ae222d978so6469194d50.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:18:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdybLem6STkNM3+66Vn+P79HqFHWywRR5XGFzbtoezwezPee6TzdMYDng2W98YVVn6y3eyDb5X/Tzb@vger.kernel.org
X-Received: by 2002:a05:690e:dc9:b0:64e:a7bd:b9d0 with SMTP id
 956f58d0204a3-64ee6180639mr2634258d50.68.1774430297013; Wed, 25 Mar 2026
 02:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325063254.18062-1-email@sirat.me> <20260325063254.18062-2-email@sirat.me>
 <20260325-gentle-earthworm-of-progress-1f9f46@quoll> <CANn+LW+Y6j0xk2x02-BUL9qNq2gf-PXspi4wP_KGd7Abz3hOYw@mail.gmail.com>
 <4d10b6c0-d599-4fc5-b9ed-ce669ac46e84@kernel.org>
In-Reply-To: <4d10b6c0-d599-4fc5-b9ed-ce669ac46e84@kernel.org>
From: Sirat <email@sirat.me>
Date: Wed, 25 Mar 2026 15:18:05 +0600
X-Gmail-Original-Message-ID: <CANn+LWJQM45rAT+mzS9ZEGBgmqChbxUtStdzhbzthXUPJ=2csg@mail.gmail.com>
X-Gm-Features: AQROBzDJdQ9Ro-BvrJ9gUlQ4zZ0Q8A9d8tMT9v5AumlPlE1K2xslZ-F-ZXsII98
Message-ID: <CANn+LWJQM45rAT+mzS9ZEGBgmqChbxUtStdzhbzthXUPJ=2csg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: iio: proximity: add ST VL53L1X ToF sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 2:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 25/03/2026 09:48, Sirat wrote:
> > On Wed, Mar 25, 2026 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Wed, Mar 25, 2026 at 12:32:22PM +0600, Siratul Islam wrote:
> >>> Add device tree binding documentation for the STMicroelectronics
> >>> VL53L1X Time-of-Flight ranging sensor connected via I2C.
> >>>
> >>> Make vdd-supply required. The device requires power to operate
> >>> and the property should have been required from the start.
> >>
> >> That's ABI break and device for many years was working fine, so this
> >> should not be changed.
> >>
> > Jonathan and David asked that vdd-supply be made required. I feel like
> > there is a conflict here that I am not able to resolve myself.
> >
> > What I think about it is the binding does not correctly describe the
> > hardware and we should consider this a bug and fix it.
> > The driver worked because of a fallback mechanism (dummy/fake
> > regulator) and not because power was optional.
> >
>
>
> I looked at v6 and v5 and I do not see such comment for binding that
> existing device should change ABI. Can you point me to it?
>
"Make it required and add a note to the commit message to say why the
requirement should always have been there. Devices tend not to work
with no power." - Jonathan (v3:
https://lore.kernel.org/linux-iio/20260322115704.10b2e0d4@jic23-huawei)

"No, bindings should not depend on driver implementation." - David
(When I asked if I should  drop the hard requirement in the binding,
v6: https://lore.kernel.org/linux-iio/55e92148-b5de-4fb8-af0b-9476235341bc@=
baylibre.com/)

"From the point of view of the devicetree, it doesn't matter what the
driver does. It matters that the chip can't work without power. ;-)" -
David (v1: https://lore.kernel.org/linux-iio/d0ec6a2f-6d30-4774-8950-15dd3c=
4b020b@baylibre.com)

I'm not sure if this is the correct way to quote. But I have added the link=
s.

Thanks,
Sirat
