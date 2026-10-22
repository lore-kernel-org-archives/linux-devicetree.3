Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654123;
	b=pJUub3PWBoyUjr3appWO8rDagTlPFdfVXrHuK83c7sncOV+Rrs/EggFry8aY3cOAYprj
	 r0zBulXuleIz6wJeJglI0nC/nnxnJfxAPAfkObQ6ISZTnfadhqu7Izo33BslXg5sPia8I
	 o7Xz+CBz/eMPMeYyq0jwNBcklF66nXQsDxPX1UuDsxdqzVwMBwvxisKex24J4umLp2sQz
	 1F8sK1L/6hM++onPE+M/h1Yx3W+uIVHPF4I7Pwhw34nBx8ZeoiKrZ2Qb8D7jUVDJjdAy7
	 MZVeFoqm34gPW47wDrm5jjsnmGjBg1wEiDUnxan9qtgTJVtWy1SwCTcwjFj84VCtwQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=u87gTMnKrw+5wwB7Owh+xGxsBZeu7l24WbHaLHBaNMc=;
	b=rOKF23sMd71uCuOu6Q2TI8fcdWJVoZnszFJ+jGKtzq0LGmZEYBUWl1M3W6fR43JmdZso
	 PjBlmZg++YYHfuELJOHHS8cAl/BEFvJ7n9bsrpOXq7GvIztZ5e5TQH6Wg5QLZmYdv0sbx
	 IbuPo7Z+sKRxXqHsLncedd8Tuo6B3Vvuy8nl1JRjAhZlcOg8/Teek2bgdFMNRgDXfNVRw
	 OKWPexMvzebXYW48slaXpUV4oSkdwXaZ23JF8fftSpmyQxFo1QfnKxTQcEqIVSlGb0UxV
	 hwT8Q3Dq1x4w2+sy7OY/KPRNogxel+yQtyN7P6KQEIJh87IClUl6OIr38h2taHrW8jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aT2dPJNY;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B940606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B940606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aT2dPJNY
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so10720265e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792654119; x=1793258919; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u87gTMnKrw+5wwB7Owh+xGxsBZeu7l24WbHaLHBaNMc=;
        b=aT2dPJNYvwXMj55NQLktkv6OrKNvDilyU4rFPqPQbTLHDfRmY8Y5gOZNRKw+9aRe+4
         xWv4BZGxBeGEHdJbqOykH3roKU1u5AWUGPA0egG6M5fc2kSisAGaHJuDafRjoXrzwmMZ
         9l605oe6K5IlFtbNUnp/YzN0FhLbdd4gP7Cx6k481U4LVJwWr2+H9AvRvDJ4x14+LwGD
         Z3pEYgB722ZdAzxGyiiWFYk24YN6JuLptwcP8n2D8CBTy40dTs2bNO1CAnDJfWWrJXJQ
         KVW/4PKfiAuTtzKNLVGGKQLhMVdm79RVCk/Ac7aSWe93f+0ympTNq9UhUkfLYTflngiI
         vT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792654119; x=1793258919;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u87gTMnKrw+5wwB7Owh+xGxsBZeu7l24WbHaLHBaNMc=;
        b=YjPbRgXnUSKKs3EBmZIago/FzXqNNocEL1c75AB97inqv5NVwsKxHJaIS7+tkQrRGM
         yvxJfRWXtDj9RNlcwuvCujC4m2MAlrjTz1C80jEelcEKkmAA9w5PGGY6qpJtX727DJ1I
         Pu/5LHHTZgv44/zlz4YqW6QcNJtGltUHc4rzR6Cv0kwpSAW6QHTloVLcHw5j4+1nAp1d
         B9oqo1UskBD8P1AnW6Q93zn6lywYRcGtXqY0iKnLMG5yehjaIAry//7sL+bindTA7ZQw
         NWQxtawpwVMcNSYrZ6jPW6U8+3AjcZw4VqlFgJtkyhMXq/wAX74d4ZfYIaRqI9B7CeZ/
         B3Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzR/JGljXAtBiWqaZ10oH3iWLlmA38KHG5IsKIh2sqy76WFOyjQMiLd75lQ3GRMlr/b4k9Gf8pp10v2@vger.kernel.org
X-Gm-Message-State: AFq9FYLFQSVQevW2AtjQK9pjCvjw6MEAiRfwc0FJgFMqKGznMX7vntNt
	KPIyyiqJJwGKXY+ly7Pd/7USHUoOOWPuummlqziA1JcAH9X8Hwy3CyCHSmbYsgAyTxQ=
X-Gm-Gg: AYBFou2a3GlY+Yvasm1rXOUZBPHnGCmrwjCeUXx26Xme8zCY1JuQF0BXV2J8fCeif+O
	8b0HMSWWrgBYSuEqiYkmmg82AB4BnMlX9sTLRgUXANCXmO4fQdNqsi9Spk96e4HONSj2yvx2D9n
	I+xnLcbxEvErCKzTUm+wehAnGeCGo+7Ht3VDuSg/mWBRBydelZhpJnjhDM+MnXlC+lJY+R5pPgo
	E53l+s6IN69HQGxfndgQi3Winvlk0CQY4r1coPNKgBRSk5SnNgk8+UsUgucrgzTOxxxbpktIhYT
	5pK9q3kB2VI5veblWlUXyfG7bnYhbeyQora6UehW9GDZo3l/Ro+KxuxWFaTl65T0q9FfCzpsH02
	VnKjhx0ZnJsrShG1rlypk0qQryMIXqeQ7Bb5MI0KAEWdSs+dF3+b2ImSy1PTjJXZ+0sZKUvCxgL
	+LBc+Fk9hLu4FSExeT0p6NdBwVTf8dLcm/6jbcIbbd+YetdUOzh7xZNLFgPrknJeX6z8Jwh/NDg
	AEJk9dVH6GYWv2Ja9xoCwqgPQvYugbbKkDI+yJ1pmkvaQoDftM=
X-Received: by 2002:a05:600c:3e8e:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a1fdd2c16amr86892955e9.25.1792654119089;
        Thu, 22 Oct 2026 00:28:39 -0700 (PDT)
Received: from localhost ([2001:4090:a244:81d0:bc85:7836:468a:a1a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b37df4sm49911655e9.6.2026.10.22.00.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:28:37 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1df50d76efba72e33c25952a6ad8edefb7920dae8cc1c3f139c1ceb795f9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 22 Oct 2026 09:28:30 +0200
Message-Id: <DMB6UH6R51LW.1TRHK4HV4GGE9@baylibre.com>
Cc: <msp@baylibre.com>, <s-kochidanadu@ti.com>, <a-kaur@ti.com>,
 <s-tripathi1@ti.com>, <vishalm@ti.com>, <linux-input@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] Input: gpio-keys - support wakeup pinctrl state
 on suspend
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20261005-upstream-gpio-wakeup-v4-0-96f092de4690@ti.com>
 <20261005-upstream-gpio-wakeup-v4-2-96f092de4690@ti.com>
In-Reply-To: <20261005-upstream-gpio-wakeup-v4-2-96f092de4690@ti.com>

--1df50d76efba72e33c25952a6ad8edefb7920dae8cc1c3f139c1ceb795f9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Oct 5, 2026 at 10:47 PM CEST, Kendall Willis wrote:
> GPIO can be used as a wakeup source for TI K3 AM62 devices during
> suspend to RAM states. The GPIO controller is powered off in these
> states, so a wakeup enable flag must be set on the GPIO pin in the
> pinctrl in order to allow wakeup.
>
> If the device is wakeup enabled, select the wakeup pinctrl state on
> suspend and restore the default pinctrl state on resume.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Reviewed-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

Best
Markus

--1df50d76efba72e33c25952a6ad8edefb7920dae8cc1c3f139c1ceb795f9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCatm7HhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOW
6gD9HrdUBVOx10eNENGmC87DdSVjcxmdzYuAxOfxX58o+lYBAM1LWM+m+3hSU4Ah
LmcKRriuYGDt5w/aDK/CIdWJS4AJ
=PCfQ
-----END PGP SIGNATURE-----

--1df50d76efba72e33c25952a6ad8edefb7920dae8cc1c3f139c1ceb795f9--
