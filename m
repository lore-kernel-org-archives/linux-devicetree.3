Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5735405C57
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820243; cv=none; b=q6QGWUpbWxGtdBpXj7p8nWpM+FLbeaxLhkxquGqeYTsjrrHMCYP9I2BAEo5WXuIdLKjEBcuEFdHyZT1hJqW2d9ar/xWPulF3mqha85Yucn4A58uIyjY0T+tuFfwqJa3sXBOrfMSA5CtOocIwQd+lp7V9TJ97QowOOSjCLfY93iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820243; c=relaxed/simple;
	bh=dx0DW8TwqIygstJ9zMPWt3nkbLDwbpec4hVzREE2itU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GR+fHcSL6LsS8eSHrLscP/9OffQEjkOqOUn81jzcXFFl3tD0uBaTYeZ9pa+9s95/+6HeoYy3iLar5aUUd1ylkrIkAPFqOAlqRNyCtJxsT1g4YkCfsdY+LWTIJVwKYDg7wo/5qHgyG5MbfsK3Nlt2bCZFSixMc/1zNNt8tD9H6d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2xJmmWK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2xJmmWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6B81F00ADE
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782820242;
	bh=dx0DW8TwqIygstJ9zMPWt3nkbLDwbpec4hVzREE2itU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f2xJmmWKuIP2NiDSfKQeZ2RRPUBZjoWc3ZpvEiuS6ykxSN7C7gbYGbAWWzpEgXp/W
	 vC2XOMQ4fs+yfzRTsFE2lkXBNQVw7xHPJc5VqE/dDXYubkWZ7JT+oMPkvA4UjycYS0
	 AI6x4Fj6bJmlUp0CUeWSfRbXf175fH9npSuQUNPeUzcA+mKONjzOm3MBlvoegOSP2U
	 IqwhjsTMPpNv1tapf3kfy89KvHDAR33tRtCYt8EkCzdRjomSR6KRdk3085sfLF4dnf
	 BPIktB6C5LHeuW50Zfyd0bRFui5Y3Zc6p0jr2ct1Pvcaz6tOqf1qhcjXdks5ojug/N
	 buEqpeIMJ/ujg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b093b42b4so19571531fa.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:50:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RocG+gNN1pDLeY3yeZmRyTy40wLB6+k5uA/ZgJILeRyitkXvipIkEEVcEUCwnb4DI2LRumAMHY6dESE@vger.kernel.org
X-Gm-Message-State: AOJu0YyTc39ql2FJ7pUJRzMW6r+393oiG/v6sdjL/blQuMt0i2J0TXiP
	1qpSacIEe4YOffvM44V/LQh+DzgVGsC/mJFtzfgd/jobiatQb8Rf+iv30JRFelFEt0FNJTDvuDH
	MDfLyXLpStv3yTE72bRI/cdd4nOq/QLc=
X-Received: by 2002:a05:6512:3b96:b0:5ae:a9eb:c5bc with SMTP id
 2adb3069b0e04-5aec10cd2demr140406e87.54.1782820241366; Tue, 30 Jun 2026
 04:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:50:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=S6vEgSW=V4gu4z=RtuvASNFUiofJb0X+fGYMqNQT7vQ@mail.gmail.com>
X-Gm-Features: AVVi8Cer80S6zjP7PzgocOgzwyDqIkAXmZBTd6RrIFp-jFbe4jJs8f0f-g9bRXQ
Message-ID: <CAD++jL=S6vEgSW=V4gu4z=RtuvASNFUiofJb0X+fGYMqNQT7vQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] gpio: siul2-s32g2: add initial GPIO driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Jun 10, 2026 at 2:21=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> This patch series adds support for basic GPIO
> operations using gpio-regmap.

Sorry for my confused comment on jun 10, these patches all go to the
pinctrl subsystem so I should merge them.

Can you make a v12 based on v7.2-rc1 and I will apply them.
Pick up ACKs!

I will not apply the device tree patch, this will need to be queued
in the SoC tree.

Yours,
Linus Walleij
