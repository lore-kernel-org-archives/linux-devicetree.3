Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743074;
	b=v7FCy8bq8uiNz7MjTMTe0c2ECXUnG224gqQFQIPa7qI1T3qk4MCIRRYV6uYbztqFJEo8
	 eOcwyrmxoO3L3C54SL1CDR0PfZhtM/3a4SnA+54VKfTFfJ8ot+VA7/v4j1KcIzYOaVBqI
	 89L8OT3ahdrkSlTyo64ukB/sMMf1v3cSWMbX7i58w/VAHTt6o3awkseDf5+QfQwsxN6xt
	 bK3Z39faZdjcNhzM/r3PtzCwDh9dKuFVmQrTvQsm7k9AGP/0Pd4N3GvPI68GUydwW6EC4
	 Iz15P/ZzTOBXabtWxCPrJOotGRhmWkcvthBlyAUWTgcjwEAs/ITbP+JWgAuzJxaGmRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743074;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4H8eU6z2JR3iXPnaXPV2uTwunMPI539+3YmBBPsTqq8=;
	b=XTSAje0hrwAeo1wtgjtsKWR3jG5yeGCobXl9A3+kSLQtkw+mjACJl78x9ilIUo9/qEQM
	 fjefuAubNQqnfo7tY7Q4SlaGgcMiNGtMY4U/s7xMEp5nvElZwQc6RlPIKCMJWdRa2MJlW
	 8cWXFirWZSE/Kbgw6Pkgjzbb5gh1t0O1EJG/axZ98SBKlNx8xiwb7J4mD+NVKAAKvbG97
	 oTCLG5MOTtOFLX8ltfaS9uNIAZbDoH1wxcuWcXI2sEwX32zoXjBN5i++NnrqTrmPBABHT
	 wR0SQcawCZ0hJkt9JLUOti4lS9NyoavLzl/YF4J3DLQuK/KPrscZjvWeVNVcVLDKXFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KahvjGle;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4227B606A33D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KahvjGle
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7601F00A18
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793743073;
	bh=4H8eU6z2JR3iXPnaXPV2uTwunMPI539+3YmBBPsTqq8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KahvjGlehMHjoebJcxO/t3h58L7/qpUpxiWE0L2ukOdqdSIwTXVi4iX4x+Tq8bVPq
	 YCxZQVJNZ9G/CPTdq2RUg2Ox/MrWr0uYiaFr17waPMkKMNvRLZpBOzQk183fIdxL5k
	 LX5jYuDlVdnENMXPuYNsf0n6+Y32C1svNhtzEUe5ZzUfUkRM55shi0XdYAu/a7+3dB
	 XZ79OMbF1X5P83mNsriI32imupSqnnas7sglQYi2r+eYr09pmfSCESFprVGuzOmrT6
	 eQvByBMQ/ZNT3Rm49nC2wx5eCxUIff7DRGN70ID1lU/29uVRLBTg76Ast0vDK1KIXm
	 P9QocOI0+f6vA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso11533e87.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:57:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxzixcwbNKfmG2WfTpgizoBW6avqFYX6oLaS7q1lSPKhk2rnw1NBUsg/B0mE/AQdfGsCBX8q6b+nNUH@vger.kernel.org
X-Gm-Message-State: APuU4Z/y93ImHi9/I1VpiZ2hxbtQwLCBSUAgnf9lS5NJ+dOE6Jo3vDcE
	81roZMyKTMYyB/t72BFJkhRzcMyf/mDqSUtvRFWSOjNIKcTpwmjfVz5odyB5Uy1UUDlwSVr/6Fm
	dcB+Elw4UxYxQ7H+TfJaA4yz4or3nR4Q=
X-Received: by 2002:a05:6512:a94:b0:5bf:b246:87a2 with SMTP id
 2adb3069b0e04-5bfd957b610mr4953868e87.10.1793743072116; Tue, 03 Nov 2026
 13:57:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Nov 2026 22:57:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLm10TL4FkkyhvyF-CKNREA-mOSjbR5zKUisC_Wx1-nqgg@mail.gmail.com>
X-Gm-Features: AclHuK-xZTzLWXlPWAOCiWHBj5C4K-MSmY2Fnjjj517UPimoWDCn2vjwhrapfPU
Message-ID: <CAD++jLm10TL4FkkyhvyF-CKNREA-mOSjbR5zKUisC_Wx1-nqgg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Shawn Guo <shawnguo@kernel.org>, Chanh Nguyen <chanh@os.amperecomputing.com>, 
	Alistair Francis <alistair@alistair23.me>, Julius Werner <jwerner@chromium.org>, 
	Paul Cercueil <paul@crapouillou.net>, Dmitry Osipenko <digetx@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:53=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
