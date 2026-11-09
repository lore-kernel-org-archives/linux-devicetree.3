Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210020;
	b=5t7JMFuRg2Kji4F1EVXLVEUoy6HVsLNTXT9L6Errsti/dJMxTpGOsGrqkrumfG92ZYvr
	 Z1wQ6fhXPx18qaUJRmvMdBVTThpg18ESOfh8/MyIbwl/3vXiOkJPd/59ROBXtXwOjyMYe
	 xq1QSNXirQw+g43IOsoXG5DlkZHsV3PWIJ+6AAJFRAuDmsGgeIcYhtVn7QM2Fe5qenSG7
	 lTOezMLFz02TvKM0B5+P+EL9P81e+V4ruwmNFC+yZy5Em2kNbl+ZODM4QoLQzicIp/s7r
	 1TZlVCFvfVq5ll2Ud9OpWCoF2K7DBDxYKOM3Y7IO0q7ElrN4h0WWGvtAEafqm0Hj9cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=w5v68o6sZ4HpHogc+gPP4gMkUXAFF0Mb78wygM8Z4ySt/HPG37rp0FBGShiGVbJh3XCj
	 TKTZ1cKCGJq1v6yKzVPeZ4eCAd8m3vwjE4HsSIPdc6G0dA0AnkPt+uiJ7irG0jBDc+8/G
	 G00kB409QRip2kXY3kD6EfvAwQgp5g6PWPtZFQfLq1sriEe8Uwaio5g8ex28BvWul6OWi
	 6lNQcACUTGGbBjsuR7AP2+gEycuEJ4XL2BBCnFADM5deiDRGEr2hQClE3kah6OP3iZ52s
	 MwfBTwQVPcbO+2an7P5Dgu9PlrRX+weUvRhvBc6DzBK+tm7r7A757hsZaTHAcvk8twg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA53606A32A
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA53606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so265487a91.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=hIm/DXIqsrGqo/fcQ9k2i1V0nptXgEhE5Es63MELo2zs2hDdkXFlKOHYe0cEz2QQom
         ULeRjQftrVM3Ag8J6D/zf8AtiWcnla/QKDB65IVkH1Mg80eOsOp1mttmBmB/cnQCFG47
         34YRnnq8wHXJhdkVy2yR5+6u6eY64HRgU2vMBfs94B3lWsqd3qfdzwmC9fcXacajmgx3
         dGcZdol8cMgnQv3A6ach2PevlWoaYEzqdIEFoGTbGoILP3XwtITHOmeMxjrBVvttm/aF
         /wmiyiII3ILtFrFT4km/eIEqiYi5Pbotj2HrYX5sv+myjJjnZRZR+WPqJlKcJyt5EulZ
         KEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=hNM4FqkPGRfl9VKQWZiQnOa53LZaj9bwFwxsMK4CS08=;
        b=lH8OJu0FEGt85YBXVXv6EU02T8wCL03ETebLwm/JYfntRgiYccQ9aItRUHyT4luVE5
         ec5QB5wgUGUcLtfDoDC9g5JxwlXMyZitGap4diGM3sntXWIBosf0nMMHCvZF+6wnSFVt
         llnZVA1u96a0h7oyY1tAlUTgwEzXSaVRopTIzw+jbY91ekX5BmnLcObwpFEqBtIgEMn7
         nrQ56Tw0gOhW2FUVNotIJ3hjRzaqDq6nyy/mFAFl7J4cjSo2HFRLClLZ4VnnnkCRyYTT
         2WAgUmhvWBBcso8BkIX3KbUxSSLMwiggLvPyvPW8xqq5aMIfgej9NFJmiI9qbVpMlfPS
         Podg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=Fw1HJ3eBrEG+YcG2OfXIKNyXLbtxL6pFyShNR64xnTBicLVJTLcqI70PP7XlmXPNx6
         VWmQ662eksYGc8vJo+lcMpjTIaYcJB9aokKPIxavS8OWhjpOs8W89bix1ozwYvKeb3b4
         M7C1Y4n+R7cdsAeFDh3I3fT0WNvzf0CnRZWDlQZYC+5M2rSyX8wMQx9uS+vQs8QSo0d/
         2FLip2Uo0zLuYIubK7TNTBZ4sl8ZrZ+JeHk7SDm/ZlHHFtWu1M3YyNEi+YttPBGWC2RM
         X/hXAhXzRlZNf20NwByFmIPl+GnzmQCqAB4nehLzmm3jWxLA5k3xC+msTg/JbR6XvUqv
         ep4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=qH6kq61Fq4Hn1Km4pUGJsDGNyWT7DXTrJZZrTRgmLMADaTes+tn3CSF3PIXo9eILHJ
         g8CrYAsMWRIHm9NG2D07Tn2IPFlZNp7xXhcZhXPS8y0yuxZx+L1rS87rL6CAkCvl2IF1
         jciu+KR4VdjSIwSx4paFfBGd3C6mLX6LJSmdLPtgRD/ACHt9HXuae54jHhFh4zPtT+uV
         venxF2Q18PWhyAguGTgfpiKmHNJpvpArtVFPeT/LTuhh8iDRSNi0occdggsoYx+iQHjS
         cglmOm5vp0xdDqN/dAsQBkPkDoepIT8W+K5N6+q1JYY42OBeNPr/MKYMv2aXyu6jVkHk
         a06w==
X-Forwarded-Encrypted: i=1; AL+hErFMIzz1dmnwrT9WaNhk4rjmfRVplj4STJq1X28MAnjUEyi6ke2X5umXrMzGQrTLwJjckEBMdR2K4vFX@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q7gJHe+q0akECSOJYSfUiEDZmYttW7HHJ4dZIB5vXHIzMboVl
	A/dv/ydpNm1hQmvHZONR3j9U26mWIfm5KCFyjTAW3eDdq1KaXmYWEZ4+AG3pNIREzyyRMNZZR8x
	+2n0uX4czXmAGAHhWPwtzEv4df2XHh9s=
X-Gm-Gg: AYBFou0lbbfMbBO4f1QYdXFuI0DNrv1UELCHW7x2dW5VIyDIceDZCP12fLJcnBr2PXl
	TD9QmFFdp5cGRI/bvqV5YIL3BCYbsoJEWaztLKSApNQsYntONVu2+2ym7t8GkJvYvC0VwrS8J0E
	P5Fafb4M+r/cXgwmForUzVQ9ATfJMVohbnqukzW3zWJ0kN9RrO1oEIMqXGRsh/4AzIxysGsB+Ok
	j0Xsvrzbz0EWUrIXPAilpubEGCkNYT7qUMWk73Esi/PvnpO3i9e4mcnwvlhx7rbhzsVmhl6RvgM
	JHK/LZy8V9ZW4mEJxMbbcHXoTknvS5qXFv1/nYf/enceQDKCvQ+jEPR3L/94FK1XzmpdYmD8YH6
	qDHK9CHy0m5FhteE2aqdgIXx3iQm0Jo1KLlU=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
