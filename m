Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC0945D5FF
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089707; cv=pass; b=CK95H9sAO4q8JctqJb3a3kDHuysXucxZngYGpfVGTWvsxHZqw9Ijbmt5PNvC3+Zur2J+JcMQ9/gWjPlwWNKW+JUZkgDK4R+sSIoV3j/wBMtqCv4NYQSOq7JDkybG1v7VnCSYVq/n17UQWaXSndsLbF6MHoAWwJ859H+eRUaqBYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089707; c=relaxed/simple;
	bh=xauoRU92rayWXBiUnhY4lqEI/RzVYWTkJ5X0x3hjblE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQW1gZbISfsF+zlNuqZec9P57ZpOdUSIoJRA7SbmHsK2Z/z3SIKkzh8UP0P5bxBAlDo/4yn8oRlpilNGUUR6H1O/P6Vcc3eZcotm4HPcnDjU8Q8zKVEF2pFv/K5ljrcPxqwJOuhutzK2He3/Ic/YdfWWq/G/O1q/I0HhhLfRdj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+x9goKG; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+x9goKG"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35ef6b49813so2522410eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792089704; cv=none;
        d=google.com; s=arc-20260327;
        b=pK6vwq4TLQeTG3JkF5q6Tc5voDSjYrVoy3U5JaruXRFdraYXMAf90uiGvsVlZCSbG3
         ZDilfVjjGP/EcNd7jJyYqhqznF0qKTqTkRQsLqdmCLco8RATm1zkutzovKaEmEbkYsol
         nk9zJxptBt1zqb7NC0vh7uMTD+ydwriD28EdNpsYoD20KDOoC3ImTsO9axViruFViCjL
         pzQGees5WZW/u2g29t7UEKErg6+q/Ih1L9slDbVpjmg77Gmw7Dqa55vMmQjklNApebCZ
         jl9wvncTNPMUKbp13VqYPE6fXxjLOOCqeOF5jaz42CKxBxB6LeQeJBwSZqCCEjYGhrKo
         A1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        fh=6fzqusTKb/4pKHWNZDiyFfVAmZUVguZkoWvWEZQyV+8=;
        b=qxbL/O0/5YvsK7yd6MOeTH+qHhIDynP5Zeprd2gRr5bDFw4x9uBATkRk1Yiy0Zd1KR
         ntdivA3nPgbMQvaOwkBotPRcpyfAWg2DB93I7a3oIb6799Oxez6AVO82SjZkdnfHeOcd
         IkwnBg/2qrggFIUCki6vUvA3qycEM/LX5au1Qik1JEm+KfEYUF+DGfI6lNwYbbI+78zI
         UsagQhyOWZ4HQe4p6L1up9RMSmAlM9w+kwA7PYnPAON3CxeLj3d71hPB+eWVbGRzPuTx
         uuzUCJoe40ElSD8NIFYxvoIA9lHP8xPVYxCzyf2Ec0Shsx5NVbXWk0jjdzYCWsXxsv/J
         bqEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792089704; x=1792694504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        b=D+x9goKGpfvnl9hCynIoU/Y+0NFqZ7WirIuX6nMhBfHcDA2HUKIJVwq665QzT/6/Ap
         A/+Lm1PdYvR37sHqfiRmmbNUORvFIIqxOzbKh1NPcc9zHysO1RKfLlxwVDQoPLblq2BS
         oYRsCOP/iKDu9u7N4MRx1K2zgUKTkrr7oj0dHgtC76Dp+qycvi7ewwrGSe6r7RAsgwh4
         x15HDivoawBFaFdgcmvz5+L5fOTcV6n6Rxuq+wPN+O7o+0UuIiw5PyKLfWrUtlb0G9O8
         wIyrudOcUFKeZNt1XX0/P4qWEJm4QmV1xnN0lPQVDNi56AwZamHh+5OL5h8eaUxEhO/K
         EytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089704; x=1792694504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        b=Xo6mOv+YlWiV4JER211eNWJjjQSnBt1pZz1yx1Mb84+ZT5PV6TvQlShCP/aUD+ZWo2
         Cg+IHllZcZx6i6H8eVeymPw7ATIF4U07Dj3BGAuQumrfoA2hPZQIZngL6+PpBqkE+eKT
         fdyae9iHz1xn6P7OWgOYOXNHyISEkIUJyW+9aE36nk0ypOSlsqHa7XhHhQpQP7mW/jZy
         7Xh448QOQNfjg+Jq1jDqDsvv5VS4Mu6LzZPatpYEdPBKd4u0vhLlWzXGFYaQFTZuLieg
         dKWU/bgr1g9/r0nxKgqy9CF7WCf4pgJpLDz+0g5ASJHvs7evNe9ghLZe+uWTJrl+vqAL
         5nHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsVhM+cX5oHJ6nK98KUB4amPA6x0kP2IR78/bsS5pWWkNR/7jluLtdJ8dyqrSXyOCA8NAGk0KQnfq6@vger.kernel.org
X-Gm-Message-State: AFq9FYKvrK1yWEwX/WpP/gOiDiBhxIctZKHIb1um3odQNNT+YguJv8Ga
	beU14HFrs1zlgBKHPK3eX7Kcu8bmDzbSuIMAy1V8g6O8Pt9cpZRhjFY2BpapFrA0nyHnhISF1/7
	Kg03nT4KpRCUSenjpvIu9oIJ0oSBkwss=
X-Gm-Gg: AYBFou204T5bCS+lfQlSE4d9maU2JSJMuYSiOjY2JtyI+OYgPopXR9e7ScOmq3s8igD
	Y2Q3kbBychGhUSbXhn7ZEy0DzF1qpmvYPADzDgYeKDDMw45r5u+aTSEoP7m17UhCAcahbqRtcuB
	8wazw5Y3hjS0Xi2xFRaZ2e7d+kJ3lRde5n8YG2d1IEMphuf0Y5zrKdKJtRq6Htc7PSqwTQSeAJ8
	a++xtSdRw6luiskvD7q3+ff+Sel7Kx3Lqcl+0rSM98/EpaUdPRcb278wLgwNjQFKXxrPM7hT3Fx
	Xz8XF0yHY5Q0k6krjOyEQC4g+LlM7r0KpVS7OVXnLUnuuXqKBGkZf/WbqW+XzWemcE9wkj4P30L
	XiyQfl9UX2rHm
X-Received: by 2002:a05:693c:2a12:b0:35d:2c2b:215a with SMTP id
 5a478bee46e88-35d2c2b2220mr10102451eec.35.1792089703889; Thu, 15 Oct 2026
 11:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013173504.451391-7-clamor95@gmail.com> <f26b6bba-2c2e-46b3-9350-0ba0785cf3ba@web.de>
In-Reply-To: <f26b6bba-2c2e-46b3-9350-0ba0785cf3ba@web.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 21:41:31 +0300
X-Gm-Features: AclHuK-9dwgzuV_rOZ05ZsN-0-b2YgDg6QoraK02oNxRoGvJeYL0q4NRa-SbCE4
Message-ID: <CAPVz0n2ubBgOGO5q4ZBYkw-eDSuNh-MpdBk7uoWW69m2QduSgQ@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	linux-pm@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Krischer <florian.krischer@fkr.dev>, Ion Agorria <ion@agorria.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
6 Markus Elfring <Markus.Elfring@web.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =E2=80=A6
> > +++ b/drivers/power/supply/asus-transformer-ec-battery.c
> > @@ -0,0 +1,289 @@
> =E2=80=A6
> > +static const unsigned int asus_ec_battery_prop_offs[] =3D {
> > +     [POWER_SUPPLY_PROP_STATUS] =3D 1,
> =E2=80=A6
> > +};
> > +
> > +static int asus_ec_battery_get_value(struct asus_ec_battery_data *priv=
,
> > +                                  enum power_supply_property psp)
> > +{
> > +     int ret, offs;
> =E2=80=A6
>
> The referenced array provides unsigned integers.
> Would you like to specify a more appropriate data type for the correspond=
ing variable?
>

This is a nitpick, it does not affect anything.

> Regards,
> Markus
