Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846394;
	b=d4jKOKhYTVxH+FIWTQXpZWqwe9tgg8js2LhB5YlmfyREgeI2oKR5d7PehYOaksTrbdxl
	 FakRe/LILxLFDFyAYvH89u+uayZ5nLW0HWO5Z4yEJLuL3drWtvWYtIfEWDfKUWYU6wDot
	 ZZaklhVJ3BYeVyp8eT/wtTwL+ppSIMXkl7BOMY/pCicr2no+gn4DO4eWMg8i9334fmJW0
	 hzhsnkbPgmGx6VCjzmA9hmo9m0bznHDSfx9fe61USvKhy15aC0QEyfo/54FM87w8ARGtK
	 VDPTc9ggy57cDXd3yhBfYvAuEgqY9mAuuu9Z9H/nfLg6BTLD9rE6l8Ze4UV9rzKM3xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846394;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=GHi/AZr9Bw5Nl2wR5ZsX8HITZarozlIL0hMf5VA0HveCcQmn1sH+zwk2joUlUQF7wEkt
	 C5DIAITNSqtxYltFH5WRfoktzeloD9rlntYbQVcfzyzIllYV53JnyIt8MOVww8IwCpZPp
	 DXZ/izRzmVZ6Odco6YFG3fvtT2pB4/EMT81Vebr5X+kTSdLqVZW966P6Jk93/PsQJOZ1v
	 U2EbQdM/Bh+9Ydej+CjW/0y0/pS3aqb8Eym9O7Jr0SgWefs6Y19hiE9eUhL6oWbHQhTbr
	 wpHBkIvimjMgW93JnJw5aO6b6UR3AZoBQBYSHusj05OjCXcVVeKx7Quj8HASUKRGNiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KM6jG51j;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19B606A32F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 02:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD19B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KM6jG51j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846388;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=KM6jG51jfXUoSCb57V4cpBGaTQ+dTrgtvDKc7ult3QhPfcC4XqYOot3xI8+s56T5F
	 4p78QdFKgK1wTJxD2na7iIGYuuw6fGfVhGkO0ZdIlBOgi/OtzDf3u8aEo1FEXJiFys
	 Y9/rnd3Z+0HSwmDAR1GMB01LNKfhtvmSxzyyVA4M=
X-QQ-mid: esmtpgz15t1793846385t5eabd6f8
X-QQ-Originating-IP: GiR20t/Dk/XobU0ZaxIXLgU+WmkZ9iB/EmVJ8u8OlZg=
Received: from mail-pj1-f51.google.com ( [209.85.216.51])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7807684342501865025
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso697636a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzVbrL//k08pIrlBeTcv7EFqct9Pjl1Crjw/03Yti4/jTjDECemlse+g4fZpOaSBs1Imoi3c4e/TqPK@vger.kernel.org
X-Gm-Message-State: APuU4Z9S54Q+58A070O3XAZdc4a5GMIPkVkIpClN+NtoUbaWTO8E0A7u
	PH1z76A+lIrskV/73m+gRQdC/9JiNM++iwd4H6e6lEqsxJoP/WIkXnM9lAAQyhGMG34K47Q9gh6
	T+CCdjm+LDidjPuFSaNYL/QGpmpprMd8=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
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
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
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
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: ML7hI/AG5toPW0l7UGfbhYEGlKoiD2viynCWhwLBsACYEH0wmPc5Dv5f
	JfI6iCVDKTATo76aRJIm66FHMG8EnBrFaX6JKWDzzwdcTL55r6WMOBZ+oCWaR89z3l1e/Tg
	mhcbe2gAuw8pTZovgJdvBKr7FhY/cXpM8uYTsyagD6ocgYAdlcXua0FK5iXZ59H05QfgaMy
	dZ92dEM6PDwwKgypJeMuI8iqVnlcF2fpv4teCP00AwjJnTXniLx8M3SvmbEpSZ7jFTi6Di0
	VMpEz4PVdLJzsHbKWz3nl6a9f34zCqUKWVE8yFt9HoirJAOFkyaGABimVjyqFZfcwOvOx38
	HDz2u9Ya59A+ixbbLCv6Ft8GUEAd+qV893YVjs9N10Y4gkdqSuZeYpLjyrTxoqJVnKDTZgt
	8nxoOyKMH0H/VK8pu0jk1TzhWdQuKL7i1l0AImuguTP2k/JYYTGrmcWwyDvlvpzK9YMEAia
	cGNLndr7CTGFeJtSuliKI96WT9j0L4TSyubW6ppcVV7Oza0Et3VorIwiaqG9ZlrMXrNfGGC
	F85ma/RWBgEEMh6rZ5oCkE8s/EWOgTEeEsm/mF6irVfDLyMc7f6M62OhU4EYoKVhDG+Ctwy
	ovKsEfsHSTrJYRqibxYuixujVfVXnLfNy5Z3JvBMfDOpsGv5R0mcYOEvq939rE6WTIM7gTu
	T9PTphkkNNI3ogp9yEqqwmamME04tlHW+AN4hvBGCJP4D7x+WVQHWfTe9rqq87JpcZAY/eL
	aoTg4ACv4Gzhg6XD3zsKVRsekYdr4vczBDY/1GwBztedK2f62gPK9l+el7j50epi8/9ZBW5
	ElbwgKGfVaO+7pukKmT6pFNMlvBfivJSj2nZAqlQeG07bgYMxleDjEPD/L31kT1ZSz53p4I
	aSfKJsuRTAiN4BEmanR9gfB44YEP7z3nmhf1IS9YzNBK35MAkChFTGj4c/Rw6y9WL0N2tj4
	uV2n+BVU4On7QY3njNpvdI2VZue3jp5hVK2Fyvpma8Awm4skyHQ4IB6pNisZzDGGugEu9kp
	mnhc0usLUFSmR6AsAqVRyCFV/TTt/uEgSnbPnOKYZUOaCtFhk7
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
