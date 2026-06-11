Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3713A3BCD34
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181374; cv=none; b=EwF1ym9T3TBJEcMwLCbKq3nrF0phmgRo0LNsIoq1IBlQxkl358fjUD+ir7wpB2BZBel/UUgaph6geCUDysHxaD6u+IZzAf4KhyJjvBxs2NbkR3mgJDjJV9fNKI3C+X2n/GbV+XuQRNr9jdckvLfzTOTnHbBtTs8yaydpL4sVOwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181374; c=relaxed/simple;
	bh=8jA5tE5GObY9th2yxnDSqEtZEeO14+brrdEJoDq+kTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XY9adxBD1Q/a8t403k0vN+6LegsaqSZnsHZNqWiGkLPPftoIM5mxvqoaOlhpf7XlEL0tptpFYfzQol/MqJUocubzg9qTifLIfTNHm6oyk9tGMTQPxA582njjD96Bi7/bzOCHL/B4vRsZRV2GsuG5UtUFbM84aNRwyHs5b25uMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtQuyL/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtQuyL/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D75E1F008A2
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181371;
	bh=8jA5tE5GObY9th2yxnDSqEtZEeO14+brrdEJoDq+kTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BtQuyL/T+DgmSxbopOE1ikbM/wWGHnZD+RDeV5bsdR3MXTqTfRQ4Ghe8e7zUAu/Gu
	 skvRvRH/GMy90YnlJSvVwuSLQa6wYFQC36urbXjNenZFlf/mRsMgEQtTvgbVfeJeOH
	 uQuxWKlij4pmjbFjAI/hrbrJyehgB2EuyOtD2c/k5pLFzd1Bt6wxY/yQOzxLvHNXIy
	 SbE34r8iYtOu2rNpK6lwUcbPDS5qLu0jTqF7eRj5eQhBUsi/36tpNRd7q5vTWiIYWK
	 Matp0OUTjw3jCdv9+LK3OoGccq9od4P2FxegSm7VSVSqMjONOYOPoeIEEYESEiNAjZ
	 3/RK+EaYTEKKw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso8270468e87.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:36:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iGF1QiUIbMZ8PHN9PePm/NMjKasHmfLQRV3pzIU36cAUVqPI5gMVsTcJHQ2a0Uz8syFL4KqRtedFL@vger.kernel.org
X-Gm-Message-State: AOJu0YxFXb4VxrrUHGDuDkxeuVBrA6bpvNj4ARaNRZmS+hCjgq6u/ytA
	E0DS2OGz1ffKVwQmW7lmX79Y++/QDUoiXcT43hjLc3FQoSWISVlT4/T07OvLL/GGO9KpKnpzruC
	T1XcxRHh1xwDEjKAd/5zqYGAvNLxZfCs=
X-Received: by 2002:a05:6512:1282:b0:5ad:abf:1d36 with SMTP id
 2adb3069b0e04-5ad27fb6be6mr805889e87.27.1781181369702; Thu, 11 Jun 2026
 05:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:35:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmHEsAQhz0_A4mHPme7sMRjcoXqvRhGUHo6zCF53mWDQ@mail.gmail.com>
X-Gm-Features: AVVi8Cfk5zjtlQGfzXSRHsrRy2dcg85kGX6xo32PNPp4FsSewMqe7c0byeEdCG0
Message-ID: <CAD++jLnmHEsAQhz0_A4mHPme7sMRjcoXqvRhGUHo6zCF53mWDQ@mail.gmail.com>
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

On Wed, Jun 10, 2026 at 3:21=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> This patch series adds support for basic GPIO
> operations using gpio-regmap.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

This is definitely merge material, I would disregard Sashiko nitpicking at =
this
point and just merge it. Any additional fixes can be handled in-tree.

Yours,
Linus Walleij
