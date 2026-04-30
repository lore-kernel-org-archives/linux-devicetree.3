Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820813921CE
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544858; cv=none; b=cSFeu+MOkAH8036Hdh9wNZidqx0CrjVhrxqc8Wj1ZTcS9xG3SAa5GXaTl9UGBrXojBuyahygoUw44HSVgzYo6TE0dk6ZDVKUHL0E2grDVj9tECp/XN+jm8LxCUEWa2skOWcW+ZxbeLNCbctet4GfaUitZVTUepmJExZTwWys3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544858; c=relaxed/simple;
	bh=vENJ+C81bb9efHvds7kbMpLjqIJ06ZgJQ3cEdIMWx6Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Kk/Jcd70T3EyuxqsfVIzr6okIpdX0snz8m0pGrIDZQox73M5Ik6V0+AZLk0/t4ONXiOTrkQ7OnbCIKPOB3/D/OUKZuN2cTYMt79Oi4t1zZ+eyPuNCr1HPfbrr71mQPXWzF2D5tN99xKiYbzufBXuySvNeAPKCBMo0EJmqu9QS50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqV6qhIX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqV6qhIX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-444826c16ffso678295f8f.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777544856; x=1778149656; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJtC8axtxZ6PlTBw/4plYqbYMGHIdhbjoFEFpeBa84g=;
        b=OqV6qhIX3q/VcRiCHjx/JandIIOdYFpMvKdfWQGwbXzhJyfeS7nIWmOaQx3bGEjqI4
         LRPemS7zFMMel9ZGdlB38awxOzzsYMesBQqlQtVLj6+UxHzDuTxDAdu3lzoV+CvnL/cZ
         NT3GFnc+U19nXPIdli9RwT+1QBX1x2ucTfk1CS2fxo3mDWS9oXOr7dT6RjyhQMTr08px
         LuXAVpJ+cDa71SoYxal5PKkxUNoiNJIQly3XgqxoSKtRN4FKKXVPZif+m6p9CFQ9v4kP
         LDt2liBkOIYDg2bD4wrjV/uNI7pq8I5qzgFiEGJA31mI/PChjbE49g+VIjq7ik03czdJ
         oJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777544856; x=1778149656;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJtC8axtxZ6PlTBw/4plYqbYMGHIdhbjoFEFpeBa84g=;
        b=Wv80JKXg5Pvf7K20RcbjDC1DCYc9rGxhUT6Wj42ewZLuM3SKFvgxKWJ+3Ztvo8i4Ag
         KfwQgNw93mi7iHsO5RGmi2+KsBwWu197AJFGqIDn92vI5CQS67ZLUrkY2YlZegNZadHN
         BpGi4z/TB5RTEih7M75ZvP1Rn8V4BCgX3WQo9X+MX/O1g6UNq4fzdnYMDDAjgrXrbarQ
         LZ+t10Xa+B4eNLtE9+tlmHNUvO9TD9TaLuBXcPHcmUqCdzMuXrFZnpQoATtmlBT5gWs3
         hIOpHg4rg71f8cT0JYRFSwfxbfq0aSIiDNi9Cx5eM5AhymaZGLSsslg30Q4wZRKRbgas
         wu6g==
X-Forwarded-Encrypted: i=1; AFNElJ8jGO1xlifbhP0IsBVq8O4Zw+j2SUWAIsn2ApH56oz3ClcXOm9L9qGf21OrNOvcgWiUBeCWSOTTCkqE@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFdTh6lfWymb+h3pedby4z4o3+N2iFQZR8dHtPWNnzFti7vCc
	XrocbhaCultfMS7srnWpaRZeYBRZ34njVir0fSTyZIGjQkomT7JlmSeejjSM5ZHj/xQ=
X-Gm-Gg: AeBDiesjZaGjTXzbUksIvJlYnGfXthMsFAB2dYmM4HYqSgv6NzA3/ktZJwPs4pgAlvz
	zz78he0w+JhRDPic6Bh1pJI8E46ptGBAMXRHCtf4/vA+KQaaW7Gs5iSM2SctGigN0vdDUIuGvxS
	ZQUNiv9iGl2C5qNjcsbPWXM5Gw+Lb0vQo3vsYSndPe9tYAFhEP9ozgMi1VqiOvgYFDCebY66UwG
	11TsLuGqOXiXP9DzvF4IH+vt46hLQppQqb0adWS2x24PTMGntOtT3Pv7OSiu115R1dquc9B0ARf
	abUXpvDR1EgIIYpTLM76q6ChYKGt2fKsu5Z0EzLjNYxxULnO2tpp7VP1az9XvbMj9ogb19djb7e
	XVDRHDHLW+TFdVEwsNAgHlqyxOYwS+8b0o3Vx1xPhg0Ptet22nno8bDibF6p9+tDD0tT/MLRek0
	6fJh7SHLGxIbLFSqxpzReT42EkMuOhuY//LzFQLKSnPK48zDtdnYfo4gL/Wm8uZB04S44YJouY0
	1xYcm0zKsG9riFfwmwy4XON5lvV
X-Received: by 2002:a05:6000:2383:b0:43c:4810:dc4a with SMTP id ffacd0b85a97d-4493ffcb2b1mr3621503f8f.38.1777544855840;
        Thu, 30 Apr 2026 03:27:35 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9e61:b264:2b8d:1e57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7218622sm12070800f8f.21.2026.04.30.03.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 11:27:34 +0100
Message-Id: <DI6F28VL7ZGX.1ZJNLS41FF55N@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Alexey Klimov" <alexey.klimov@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
X-Mailer: aerc 0.20.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
 <20260430-exynos850-cpuhotplug-v3-4-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-4-fd6251d02a17@linaro.org>

On Thu Apr 30, 2026 at 2:56 AM BST, Alexey Klimov wrote:
> Add cpuhotplug support for Exynos850 platforms. This SoC requires
> its own specific set of writes/updates to PMU and PMU interrupts
> generation block in order to put a CPU or a group of CPUs into
> a different sleep states or prepare these entities for a CPU_OFF
> or wake-up out of idle state or after CPU online.
> Without these writes/updates the CPU(s) wake-up or online fails.
> While at this, also add description of Exynos850 PMU registers.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/Makefile                |  2 +-
>  drivers/soc/samsung/exynos-pmu.c            |  1 +
>  drivers/soc/samsung/exynos-pmu.h            |  1 +
>  drivers/soc/samsung/exynos850-pmu.c         | 79 +++++++++++++++++++++++=
++++++

[..]

> +const struct exynos_pmu_data exynos850_pmu_data =3D {
> +	.pmu_cpuhp =3D true,
> +	.cpu_pmu_offline =3D exynos850_cpu_pmu_offline,
> +	.cpu_pmu_online =3D exynos850_cpu_pmu_online,
> +};
> +

Ah, sorry, I forgot to remove blank line here. Will do in the next
update.

BR,
Alexey

