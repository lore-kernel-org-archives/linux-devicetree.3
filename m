Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909136998A
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782351159; cv=none; b=YO5gxVYt4fJhfAKFz3Ol9AnsN1lZ/k07ZOZXryfUVKz0M42bL78WPcG3zFsHmspPkEsxbZGfm2aueTT3cib0J1Toi7PMJU1LNlIzB3em8h+rFzx9e0fPHZCPTHYVJCuuiYzDYfCQouYu0RUQPNoiCDkUdoJ7BiZl8PJxaiRzDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782351159; c=relaxed/simple;
	bh=n9pgwAr345LZiOxzhaKVl1At4IuERZDbIxjK6hWBcqo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GcXPH8SH6lq2QctXjg5n8qPy2EE7zHj/9+o2aWBBWMQ2neoscUJZlvIoMpZDCHBKSRCN0D3Zx16CJsuNmNlwjH9AQLK4l/k7vvM0GPOxPvp9+TqlzVqXMFwl156FzOQuZyvYs8CXVhtBFzXDDnUyr7vlwDL9bmC16FVxoxv6GBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0iR779N; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0iR779N"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4924f8db066so9646155e9.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782351156; x=1782955956; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pJmX0R8PC4ckpLbRYtZu8jM9oRzly5QdgHVSm/L6aA=;
        b=c0iR779Nk2ZAtj+OcRVN8FBcO947YPZs3ZD5ZcnVT3r8vbC4+l+eLlZFjUo+shhY0Z
         ISCYxqX76nCWDLS4ci5lgWKqA3jaC3HX0Tq9MsREGSrZ41LJaOKtHINtUMJrk/9P8nMA
         8P40nF1nJhjF5VJnyYYkFE1oYdR6QYm5qk5nj1+TFm50f2wmErcjNyqLQW9xpM89cmay
         PPYdPIi37KoJgQrwcTHM1WxeFZOa9nb7uOa8brAwXcqEWlYquCjnQ4RR7Yf+dadMjCjn
         Lk9NcXLJrl3UFD0gCTw1QhFDREk/fA4bxs7PbxwBiUCvigwcyZf4574jm7xF7S3kriGX
         W+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782351156; x=1782955956;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pJmX0R8PC4ckpLbRYtZu8jM9oRzly5QdgHVSm/L6aA=;
        b=dH0E6LzFLcbaRSEX0Ox5aw1p7ZXvb0ty/aqrlXFi6scukw8upv3U/IFFIE+hzgD4Ht
         uVavBUMpSSAUGBR/tR2MAC43/WB0FPBuiWVJRU7VE6+of69ZoLOn/wfVblx9aaSgRqP6
         /zMY9tgdzsgPDIbxB0rzP+5C5Qp5M2bNmnclQFmisAwEKD9gRaFNM7jUV5kbvGOdTTWD
         8rAp991SUKNOklPHxhFuSqCWE5yVPxuidZbRbSle0DSI549xthDmE0OzX4Q9gPEVVTBL
         03uzeLG+0BV/OT5hP9zggzlsa8hj4USByq7OmwwU2YGYm9YSPo1FzR/J2TkHnvFJ26dq
         jNFg==
X-Forwarded-Encrypted: i=1; AFNElJ+w2LkkCgX0OZaLqI3dgCfJgA3Maqm9Z3bBSgelmENFc3cUdUFVQJmYTKS8mrd4IG1q1Jo0S0QShib6@vger.kernel.org
X-Gm-Message-State: AOJu0YxN0RwKQ7MU5e2v4heK/BSywirlACoGJMFLIaRSwHP5/ZWdFRdA
	mP/hL0XvxxtNF7nYxWX+uLopiwJ3gZtF4xX3GwxeEgVne6ja5hi4lAIs6lpaGvUS2Qg=
X-Gm-Gg: AfdE7ckS/v72tmlao0ApueArw4DM4YVmXvhM8NIqVgO+yoPXptiBgb8270e38zwaE0w
	ITNacqwaIJqieRf7ADjrCkqntGK3+lNdMLflPUyvjBlXKKNAoS+8MtYH2E7GqZlhhT38OIWLzuv
	lO6jqqS9kpVL/JNOOn/Y3sP9TlKZNT9VXyKp1/D4hK2udJlNrZRHVCPmOuZl6YkbwKymn8Kp4iZ
	OVi2ryyaqhwo9hviPt60MP+UHApFeKp3GLK4T9ws07A7p/5czvr92PR0fxdjDGt7q5zKVmh1kvm
	wYi/CiwVCGC9XzaJRDffU/fappZ5CvoEBYhYOJ7BmQt1bF9be4RPf/gsnFH7Hnh86DbT2TkJcyi
	8uxsXnjxRECfhqb12qTjfo1P8FUtB6j/SPXS8wzP5HcHcPUhJ/sz3Zlprbl1Y/44MR1qrE2yvel
	erAQ8q4Pg+7BmbBoWoEqlIery9pnX6wLCORTzA7BqSGPIjLjf1cnXvfj1TVlVxne0mSKeTEC2Vu
	g==
X-Received: by 2002:a05:600c:3e8c:b0:492:4a70:fa9b with SMTP id 5b1f17b1804b1-492668985cfmr2555955e9.24.1782351155868;
        Wed, 24 Jun 2026 18:32:35 -0700 (PDT)
Received: from localhost ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660adae1sm15090735e9.4.2026.06.24.18.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 02:32:34 +0100
Message-Id: <DJHQR4IAYPDF.2BOI33M1O4CMO@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>

On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> the Google GS101.
>
> The TMU on the GS101 utilizes a hybrid management model shared between
> the Application Processor (AP) and the ACPM firmware. The driver
> maintains direct memory-mapped access to the TMU interrupt pending
> registers to identify thermal events, while delegating functional
> tasks - such as sensor initialization, threshold configuration, and
> temperature acquisition, to the ACPM firmware via the ACPM IPC
> protocol.

[..]

> +++ b/drivers/thermal/samsung/acpm-tmu.c

[...]

> +static struct platform_driver acpm_tmu_driver =3D {
> +	.driver =3D {
> +		.name   =3D "gs-tmu",

Should it be "gs-tmu" still?
https://lore.kernel.org/linux-samsung-soc/56c1bb6d-54e4-4977-bd88-9ce7a6086=
b1d@linaro.org/

> +		.pm     =3D pm_ptr(&acpm_tmu_pm_ops),
> +		.of_match_table =3D acpm_tmu_match,
> +	},
> +	.probe =3D acpm_tmu_probe,
> +	.remove =3D acpm_tmu_remove,
> +};
> +module_platform_driver(acpm_tmu_driver);

Thanks,
Alexey
