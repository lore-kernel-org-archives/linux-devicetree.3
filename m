Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177781;
	b=k7mn6tqF+++VkVKIbpjrDQdfTzewlfHcCJ1ZlwQYD+8jHPRXYuD6a5awGI96Xq7giPHC
	 XBFf9pgMO9UN9hnL0zRWC9bwx0oxLVsPPqHbTQAkPdPxohMF+MzHWM5PQVHW1WmRogivB
	 EoyzmsL2bh7SEv6oW24UBmlJ7kopTb5eAobZFQRPI66oZh3hR+Mxxz6z3KRscjpIIjQqS
	 ngsUKDLBbDbWbsg7YbVgGwgBmrZcDBRXtXtpXr6N+fn0nvtwyneSZhKGH9NW/AjRHbaac
	 vhatsHLp0K721jXQMvgZdD4VJSRkIsIaSLrUq4qnxZWRX3GBuyV70Hdw4aWUhcjYFcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
	b=mMr77XqC7baYKMdi+fw9wAQXxOcORsArjnwNEfXwOsTHxEm+Lz5gQEl1dyE1LiGrirBz
	 wA51412P7ZYuEvHuCnfswe6NblRUSGu92S4LLKro2gxrf9KXHbGvDeHRmgwJ2Fr+dA4nv
	 WVXzSinlKUnxUWmOGO+pzCgsS2b9qG1LzNBalaBbTZuQYpNF0EXREZv4VI1BtXP0bksMZ
	 LT3OOmlzTSvNHyqwdh7xfXZ7YIkMaUFe/wZiSlCnMTahP9ClYb6QXckI+LpL/aZOfN+Rz
	 O8aNuKsZxl0D0upkyFOYG41Q/VBZpFbslQU4WOvI3ndZtJgYHM201OKWHBS4Yo4AEsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mruVMPJ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3281A606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3281A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mruVMPJ/
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6acbdf8e70dso144356a12.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793177779; cv=none;
        d=google.com; s=arc-20260327;
        b=KH318BthcplGLNEp9WqWiZsAqxZM7hCqLsJ2Tpsr6qI3X8PwcWDKJuxdZFQabsGWia
         T64EU0oSjlRrQCJaBT0hT7q2MEfG82AxhOkxDPbSn5JkJ9FuFPSRAEi097Hk6sFBA+VC
         Kb42Mjd3J+R/4r/N17AtItN87REA3TyPh4z3fjFA8Ljs+Ihy7X7hUUceDamR5jpjkxMr
         IvJqKHkJB8DpiTDF4zGoPpCkDn2CQs6UXygBMwJBpCXtHc3UoPoPkdJ9DJJiv5b60l+O
         LCdXRATnPSDulAvfI4wWZzSxiTYerGmPfziLG9KBL8HIIzt/lZdPsEBAy7+ZILq9fyCd
         XuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        fh=303Jz09IWaxUPeWigYqreFIaZwvvtn8tLyOU4VS9qcI=;
        b=Y9++S66OPPusqML5MczVkZ8TMhVqSFp5NrMnI3eiRlpFgkKPRuA5xKRLfZOXPPqhHn
         5Ajx3HX1igPHt8jPDwtS+UvBMLKQ3Bckf5k8y7200IG0sQSwc+4y2ZXS4polnux/Jnk8
         rLJmzqVesEUHtlBpRUPc7x+hBMLpDE095+Z3cjYFV4R5l5yAn9N/kkcLzpCo0HHYxHQt
         UcYPgBHjdL05eYQVSn3yhVHkjBVwjjrSOT8AAAD8UXpgNvPvKriAurUGUUsVjT0JhawL
         Cm1m6fQXM9KQuRDYY/tHXQ4NdbWlsYY+gdrbVN9hV0BE9rO0BoNbs+rl2c+Wb3DegtQt
         E4AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177779; x=1793782579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        b=mruVMPJ/9OpbsKV1VDevagR40Axv0wmAtsiJf0F5Lzs3d6b9TnCUMU8i/r++T5oRdV
         8XDmcKovaWNTcKRPxiqTONWZ07h5jLkjB10BeAiccbaM0fHVDzm4/FzpOEDTNQLlV8/T
         a0Cm+alaI3p+pOSafXohx3DX5FpPRwJ33jPVh8TOqiLJz4WDSxcASwh3A2Wo0+9Eh8Kp
         GSuuTSO6aGerjRdr3dbq3arqUDmiZyWlQhfQ5XmvYhkpaMFWrBhNhM4eGhjojUT4cPJr
         Adw+UdNpq158nHVlr7efmydS/d60bpNI6ObgblDxYAf0UyP7gfHUTtcKsod5860oXiiv
         GEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177779; x=1793782579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        b=om/4AmfR1/ywogLtveSQBMq2GTMamRK4bphNrBqpxf0tM8rUrA4au+f7D/POlTtB+A
         oS+3hVFSgrxg+rGi14uLCEpMxpD9Y3GDcrETgb7O0XtOKjU0teDy11JaL+Z86dFUuWX2
         QFiO5+wX0+KqiEFI0SsKW751JLa2Lt+8sV6iccwCBtf/LHCrHJqrKXjCglxZDKm8wEiV
         tdMwufvT29+L6K/b7Arn2xKiwO/SKpazmqJmrv1om0oOjErByYMV7IkZppFy3qAN64GH
         gSt/JUb6lyqxF1OdPiY9f0+OF7l7XwmxrKINA5uTLXI1Rs9MY/yp307yoaRecZ6WOKJG
         m/lA==
X-Forwarded-Encrypted: i=1; AKwUvByZNzi8Zv4gnlcU48y7xTEM3vXXaJzjVA4I3W97J8fzF6qDKmW/kYZRHJefx/pKlZUZjz7XduBXpeGd@vger.kernel.org
X-Gm-Message-State: AFq9FYIpW/aEC8AXhjF+/7UazEAFv1sW6w4ZkA6dGcn24EiGIJgFThXw
	HW4i71XKJ1EIFoIcZmddOusdcGvrJCztLNJ7/xt5FADgVM3pqI0NhE5+Cah48+Uj6EVq5edoQah
	j2kAwc5d7Z9Ir4aJNNJdu3Sgbve4iuuQ=
X-Gm-Gg: AYBFou37OV2k1th6TuwrNjh1k+fuTxOUZ7H4LBJtQzssCBQdS7JiLFAm6dEeL5ylefV
	gpzs6M8vTParAbpX9cXR4Sdayr3oWpuqC1+FUOOcVlLdLsilWPS8p1Bd96smfPOTXOEcgOb1aXV
	Zf83hk1oxatKfExWjpDmJ/BKfxlcxAir76ioXEcHwhxRp6iudwSH2RGV/ReB9mc58g+W9qeirc7
	FGAYXZM+7u3uPJNhPWOnybTIewmoAR6fTpPlrstOVtupgCMmUmy3u9A3cHwWcF6UESP+R7fhgkY
	Z6wq7g1wjC8bP6jCEw9vKiW25CFwSUGdeEGq9czvbRawN+OWLlTJ4Sq8UqhLGR9uLP9Fz9yHkI3
	ofqosInkTsZb1GRElfduWr0eldrkat+I/yJNWslQUK0icVwXmCm0xRSRaTA==
X-Received: by 2002:a05:6402:a6d2:10b0:6b1:da27:34cb with SMTP id
 4fb4d7f45d1cf-6b49cbce701mr976968a12.2.1793177778791; Wed, 28 Oct 2026
 01:56:18 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <25254818.ouqheUzb2q@diego> <20261021024239.GA3667411-robh@kernel.org>
 <3435698.oiGErgHkdL@diego> <850be915-d42b-427e-a036-907b9364f9d2@collabora.com>
In-Reply-To: <850be915-d42b-427e-a036-907b9364f9d2@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Wed, 28 Oct 2026 16:56:06 +0800
X-Gm-Features: AclHuK9Sjf7k3U-KBE-ExwCBQXl-_hQw7npOFvb6IJVRf4k6WS3oRrSiOtSkTyI
Message-ID: <CAPwA33J1nud++bYV1JnPJqvA+ocz5H1=DnyJy3HGX4np6JxaEw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Michael Riesch <michael.riesch@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guochun Huang <hero.huang@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

I have just started drafting the code changes and comments following
the discussion above
(including your comments on patches 3 and 5 in v6), so it will
probably take one to two weeks.

Best regards,

Jason
