Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683069;
	b=bwpW0d3P6xq0RJqS0WSxgDJuYfBGgkQXfJpkBBN9wha6EvLnB+9g8GcSVPEROrVaKz1P
	 zzcojzCH90tGxSEB6Wk/0Xvsn551AxlX5nGoEaabz0vUWx/1ip43E7bJfG6uHzGjbQKi7
	 D2H6hrxxoNc/UWySGG2x6AvXaUOumeOF8ECbj/TrvCzNZw0E3rmv37dpoQFYpzl20ceiv
	 DctJFBvAQPRc9p6nxjitvymkewxLMjKCRVJq69CLTpipFC58etKAuqFWYPVF/neUS1Z5u
	 HFuhah8gd3aMRYsoeRwywwhgSW3Mhu1o0UF7LQNou4OxJ6fb/gcQoXN1s7oOyLCZwWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
	b=oIwniOWsb50eLIWygc0UTmJ/bkl3IqRvkJPChDE5yg5rEs8C2IvzAcOgwsn9d3zpfpTF
	 hUlfDsOPtUggk1LMXCRHEiPYxrWCtacZZGFQpeO7s4SA4Ht/2y+3cOKXHF8QjljlBuMRm
	 Uq+FlZfr5K8an2jsP3rAE2DacMA270x724EBe54OeSorFQ2gRu4KIEXXOfiSdIdj5ypXA
	 dAmOP0Jbw2d9znb5awrC1d5Q9GHJxsdnorYuEmWf9zCNto+ScVkTAZT0SoPQeHIKbvODM
	 hbniVk0U4YlshldkT2ZrrOCGpTkx3T/xJsQHKkpxxH5X3VtZWh2/cSa7o7pFxhsn0xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfUauThS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B578606A32E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B578606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfUauThS
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so4862851fa.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:51:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683067; cv=none;
        d=google.com; s=arc-20260327;
        b=Jpfspa9llJcmCeJGwDpeURMn2/MChB7UyFdHXghK/CxRvijph3JLfn5NO/9MQ2kn8z
         AbfSs1K0vXbBTSU7lxqc4HovNN780LvBUeQVB2uFdBsJ7QokoLOKC2N0sFjBrvxcZkbr
         8X1F6lWJIeO3OofwgUi1E5ozA6tv0a5iHac3Et6/X3KLcF040yygh2cx5zx/9jMm1vcq
         soCUCTgOwCygEtc9B78KgQYepoHCo45fddJ2JDDXbn1hanhWOMmRCb8b435AV4SRbhPH
         wKqJB+kV6ZpuYXjzoP68NXDGUEywOyl5+LE5kJlNKiuFrGA2zJp00uDuu3Mrce6u5NiS
         DfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        fh=fCY4Q3XCrOgMbIyQXYW9BuBBEXF+48z9SOCnR65VgUk=;
        b=D/pOddRQb/R10sRNFTk/UKrOpkSDZrvH9SDpEq/s+JE/0wcVsdWkyZFLF+2zEvxJer
         4iKurNekHoH5WhR5ObrjkQWWPI/lNMAeTjLisp4JBbm9OwMnkyEhlfsYeX3/f2hhgaxw
         5gL/6oYUjJ+XsE4vWasySZ86oucNeJ+QUBqBqa4rdn/qCrpWhE6ATA6zTOFMWL9yHOxt
         CFoSCkd9LkLlE8IJoIqYI3oiF4zM7TihPl8zp/cGpRKosV6DlPvRLxoJFI3O9g4ol549
         BWx5I3uPMwT40q3MbbMp2vmITwaKQNAppwDbNBXsI3znofIElTAlRqiwzpoJivXHWgjP
         uwnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683067; x=1796287867; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        b=cfUauThSncIiEHnOeT0QIB19ham0PlGU/bs9OjcRraM5Gqf08Cg3S5EHpvoZY82gqo
         kezXrkIo+xax6JsG8z/6F9WVXv+Grzlqj5lRMOlQ3wB2Uva+fOFvluXapX2+gJvHfBmU
         SRKAlRSR9Y+kW8hboevRGjBP4YIKETwd/EoLVrd8jX7zhp5KnpC3SVEGw1u54yqhbjlP
         0eo+E6i4DP2Zqt8TztTd02OgwPI34GmfYlN6qnOXyDUuwdqbUMPVWi0RXNUqQ9Jc0gP8
         KhusAwPWyYZV7dKWt+uZkCoLI7WdNYdWtNnoQ5szmtm8utVYlb/icPX57VIFHbO93crp
         cbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683067; x=1796287867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        b=cw+6pqwNDsUydw6Min9TY9JhM4vKTa8wLJ+wUX5z2hPmMEklFJgAU+b0pHeAiI33Xb
         HXcHQ6avkQl5v3cgbXIBnT8iWiCZKQDGvWLsBpXygfeRBVxFyJ9hlFe3ET8zbkmpr8Tm
         ZTzTdmfnhgpEi5tD0+guIjlrxpg2nTkmO++WMrzoVum1dFdANl4Q3r2GblZNQYGutuwM
         6EA33lhHMDJ7Tk+J5ieiq1z6veAvIz4Ijl7WZMc2P/7o+YkcRM9oJS3ZjSZJ7W/BX6pd
         b5PM0Okf/fRPj7Nv1ub9AIWLfpHKyv1LCN7GQa3X1MuxFmiS54gxN967L630e7hQQn7I
         TqpA==
X-Forwarded-Encrypted: i=1; AL+hErHuUxZdH9sO7mTKcnM3OdkwKDyTvoLjnMzpvfHybizNGp7bvwUnNvir7l3zCd/rHukpTy04WclJ2Igf@vger.kernel.org
X-Gm-Message-State: APuU4Z/nqxv8Kiyr3sPgirm5DYRfPwmjHzJgtpi2GFDBVOQoqx/oBves
	7Q7QYwNKI8eou9xo/3zDn5dNAPOBpjvR3PCZJoaODmhqnJWXHpjTCbnVImzBsfv/4qidrcA9S4Q
	F11U8lx04E3JK5DPM+l//NETwaB/+0A0=
X-Gm-Gg: AZFdTZcMiNl6yBb3BEtqx0CvjwA4R//uSBMtRZiA+gROy6yj4uO0YMHis3xBbHLKdUx
	+8fnO2XuLGPgHZzKz9uF1IGH81zpZi3soIYSuQ2baEMCqp6Y6B9hGKR6BzkiefiyTLv3bGXh86a
	Mona976FiKMCqK98bjoefjXZy+w+fXlMJ6LCn25dIOtw9JDtNW6aKReM0sMLGFR4ewZAsEWGSJa
	MUQRrKKPhrzXRL2gtuFA764SNUdU6a0k8suaVkTvi3lZ2PDwykxt5yUNOlY1wF2YnidBsOph+cK
	vB9jW8fAEPxfDoaX1cl7lx5nqC0kb/IVoTTui7ZNy/ZgsonkDsvJDfPjy5jSVy6x1FurAZXamQ2
	TnxZhN/eo+SEcvpDjW4aj4poy97vZ5sufpnjdKvHTh4XAKLB96n18Xo6++0eIPXJCWMoZUrU=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id
 2adb3069b0e04-5c1bc85b735mr7624851e87.4.1795683067065; Thu, 26 Nov 2026
 00:51:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
 <179533990370.107225.5765165679182115805@gmail.com> <20261122094050.GB2739410@killaraus.ideasonboard.com>
In-Reply-To: <20261122094050.GB2739410@killaraus.ideasonboard.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 26 Nov 2026 00:50:56 -0800
X-Gm-Features: Aa3M54qYbt6ioFRQuuBcY-nINhYnmyO69wxHem1cDdgKrz6EAiep7-lR2zDaAac
Message-ID: <CAEy9hNWKmcr9qsvrS3t-UkG3igA_eYdQY_Q0sxWK7fccpWWeow@mail.gmail.com>
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Yan <andyshrk@163.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 11:40:50AM +0200, Laurent Pinchart wrote:
> There's something missing here. You may have reviewed (whatever that
> means) and tested it (probably), it doesn't seem you've understood it.
> All of this screams of a big hack.

You're right, I withdraw it. drm_dp_dpcd_access() already retries a
timed-out transfer up to 32 times, and my test only counted
per-transfer timeouts under an artificial RT hog; it never showed a
DPCD read that actually failed. Sorry for the noise.
