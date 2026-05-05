Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329492E62B3
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985207; cv=none; b=BeDWUlKEv7ZFyFibMoLJts4gK3WFUR5TJ95RUtAXkoFoeq87wbqnRairJudAhL3lwC3nv8xGESLOu9UQebAtzdID77GbnEyXvA1L39A27QGS6Unx8ZR+9RmPaCFx75Ji0KGdj+k0YLHm86Z6KyBlbQcDDnD53Un2tJOMHEqc6Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985207; c=relaxed/simple;
	bh=rVnkmHVd+pu9S0anEsS4r4bfU6M1ddOgx2neCXzbhZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ON9dZMY71nyRzgUMMraXRjUBQK4KcsVBP3dFFC7TCmGdH24fwENO2cJ2dIowhMKg9B/S4J5xkexNhOHaw/PDRqbAOOLPtynzLWTR9WsMYvVseKwt4pKeHAZlglVzUfcY5a3zm1FTZq1W9rQ4GyLYERJtz6bT2frRpnM6IiTIMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INi32TgY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INi32TgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F21C2BCC9
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985206;
	bh=rVnkmHVd+pu9S0anEsS4r4bfU6M1ddOgx2neCXzbhZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=INi32TgYrcSqTHVt7vnxQFwVSjyEIe3rwoX9uqkTMVnUvEGTMX759j7k2kK1moZxm
	 XpObfQII2FjjUwIxkXTmUTI1d9ezjyZ05W+EwJxxsclBmwX6OE9Mh8xyHp6TeQ0sk9
	 936dZDH1psxRiQyVLuf22yAXvbbF2gpT0j359uUWUh9VDu63mcsoIZeLrkE3UEGAl4
	 8lj3cETjMLUecvx6VmgGxt9SuiCVQKZ+GcDvOY+AGPxURivenYI85XTHOdEvR9k3yh
	 4up/9Rvp0Jfr5RRkEz6xFlUBGug7Vm7GADqOstosqxVhsuqdCyxXM47VR8Qoy7ohVz
	 5VdIUeISkIwhA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso5491977e87.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/YxZC0dqBmYj+z6vA0TAGjV4fAmPmIFtIlc4PGJyZ65WqU+iAnMxi3kvKmLSKLbnyrhHiUFDwlIMnP@vger.kernel.org
X-Gm-Message-State: AOJu0YwPwVdxdzVYnHbopLPwe9kSx3+849d45XjBcfURQzNYQoGgFdZL
	ZJDWUjaoBxii+4ltffyzoLV+UHfhOjaO5bEbYOfSQOYvGxdD93m65hGAmPfK7I0yHsRMOA1ektf
	7X+AuM1gWmP1vJb24n42chFfDpuaEV5Q=
X-Received: by 2002:a05:6512:3b10:b0:5a3:feed:31cc with SMTP id
 2adb3069b0e04-5a8631b9e85mr4464601e87.24.1777985205388; Tue, 05 May 2026
 05:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:46:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
X-Gm-Features: AVHnY4JlHoGXQmSjsgZFXuRe_ND9OHcbw2Ietb05k05PsECGSoH_v05qU7tRmbI
Message-ID: <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khristine,

thanks for your patch!

On Mon, May 4, 2026 at 3:12=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Add basic GPIO functionality (request, free, get, set) for
> the existing pinctrl SIUL2 driver since the hardware for
> pinctrl&GPIO is tightly coupled.
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandr=
eea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Same comment about GPIO_REGMAP here.

Maybe this has been brought up before so it's just sigh rolleyes,
but my memory is short.

Of course gpio regmap conversions can be done later, after this,
but the problem with such things is that they tend to end up on
the back burner and never actually get done then.

Yours,
Linus Walleij
