Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10747ECE6
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581144; cv=none; b=WVvFojp8FffqzVla/oGOMZaPZoQQgANNBukL9S/THkEJUeI+cpHRIoTWAhninpVqyspVWJ3QM0NOenkQnzkCkVYyPsq7DHcDS1PO03Fyy83AoaL5P4y+vCGXpW74tF5KYIOYQ9f3oPqPjvSSU1pHxjLIW0qF/ffOJtI4vYI3KbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581144; c=relaxed/simple;
	bh=ZaY5vFxG9aYZCmRrkh4G6IJ/GRp154Miry9zwaOYwzM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r5PdCaW5xyELUrfB17E10g6j6wINiJGG36bPJyIvzXHYkBwzGsZSf89PJoRwO3tvaT3jxBMADKxBy9+UyMoY3HSjgxRJ3YHVN8aiQzK4I9irdOWOAi7drkOFv7A2j6KMeCWraX/i28Pv/hpgb4CeCzdjJttKEaVj8AKHImbA9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9mp3cGz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9mp3cGz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso436538f8f.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780581141; x=1781185941; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr8tJV7XonRe9aqon2KQXf6etaodi+ES5SfBfdU6e68=;
        b=q9mp3cGzn3h2MhRK6XrbG8QMIeXE841LVChyHfXx/v/cDtiOssHcUex4ij4no+uRjD
         vddVlYmG1cGOuUAPBPAAeEF7trsMjG71cu3014VC6TONpgcIj1tfJxm+IdvBzCIOTh05
         M3n0i60J28z1Ii7Y3YtDSm5BTi5YGXjyJv6FzBUPCcPbLeOPPlZ5kWC1qstA4yjSUd7S
         Ix+TjKzndwrHsTgVOoV4H3gD/CKW6WTGMfofWnUiiizqAwpyJwfybW5wO42UJWRMqLhZ
         sb0s8gZAEPhxeUmOfnXRW+dYbPpJ8rbeKjc5knoo4qBC1CJRnHtGd4yJim9yf/MWcxhM
         SyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581141; x=1781185941;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr8tJV7XonRe9aqon2KQXf6etaodi+ES5SfBfdU6e68=;
        b=Ms8BOyqMC2K50xRqHbOpWwhGJ/UWB6lmGOzZybq+7JAS1VMsUdudDsQyR8EYvSKsQE
         fy9YdJifgFHevs7egowEFonKuXrEG7v84gXrNB20ErdwftRiMKNyQReFKXFMR7IVxYmK
         itMglfCVHfRVSDxXChLd5TH2bumSFoNAFVvrXsWdYWPT0YbY9aboA7/zH/i90i6JtGAu
         7UM21XN4P3dVLjbBH5i/9bsaE79KfiEdxRZ6nIRR2nJY8dXgA8KqbT48OSIwKphJPU55
         5y8YjbSGystaVaSNiCB3Ai6iGXTJ/jPuuLuACgJ2zggSbxEqeikVRJv4Rni1Tr7h7/TZ
         WXnA==
X-Forwarded-Encrypted: i=1; AFNElJ9G2OqQwB9N2MFELkBHzcy4DBPFMExBZWRgfVluxzVHwpojVsIk8+s2ZBxTKdOIaSBvmvR9EeWugC/0@vger.kernel.org
X-Gm-Message-State: AOJu0YySgKXa0i4xx/GVFWP4fElTes1rGeXqsBU6D9fk5+1hvKbtnka1
	8AV7e721JIkCogBUqF2Oh7QplOpWxzPNJ5UfA5csnkQkAl65VKrBzKX6qmlk/yxarT4=
X-Gm-Gg: Acq92OGbbMn7pMrh/5AYllSgKR9oGv/7dE5ar+D8tCQDL3NBf2XZ3B4mhbzuhvFCEyh
	GaAkAL5KvjD2Uwiwn1Xjn7lifntQFk04AZ9JDXhcW9yo1fryD61ZoqipbifE94KFSfHKQbacarJ
	Jp37UcqAEfgaFRjTpbbKDFcooyz1BetheeWIkDFhHVyl9AC3y2bWqfP+EFqGJDPRIlQCjizPgzI
	boxRaHvCYOLCPJwtjyPiJQ71kUKGqFRu30D23HcPP3EGDeTOFXSaZZZ2jWerK4i9WXbtJA8m0e7
	XiAKl0XQL1Uzv7AhqR+0+3YqhWsnQ+ijov3/6Bv0bEum52mcoIS+VPL5/mP77eFssk9vC1+oyf4
	PP+XRsLvOdStPeliklloiFW2SljHp4QGDBlZb6AsPZX5AjfCVJLJ+hyOqkEs1ElHnKMagLHD+Vm
	15DoB1w4M+RRjt+wxRlEkLLrQqY4abeyAZlPGS9qyejz+oUTHU2OdY/4ayni+z3TJU1Clz8u3L5
	od+kWWFNhnWJIeuMGVrnu5B
X-Received: by 2002:a05:600c:3596:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-490b5edd71amr146656455e9.24.1780581140625;
        Thu, 04 Jun 2026 06:52:20 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm27268044f8f.27.2026.06.04.06.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 14:52:19 +0100
Message-Id: <DJ0BC2X0G04D.18CIJDSEP0PVP@linaro.org>
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
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

> ---
>  drivers/thermal/samsung/Kconfig    |  19 ++
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 651 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 672 insertions(+)

[...]

Best regards,
Alexey
