Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1113E3DB9
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968190; cv=none; b=pfcVqMDTDtJmKyhrTlAJBetMpn45ZaHFH0Im8bgbqG6ZZqJo4mLa03SNJZVk83UvVCGs2GtC4wO12g4N8EHG+eVlpmUPvAe9XfRYWi6Z2Q0kleTCTF5j+jCVdXth/wj0paldXpUyYdZp0ztvGkw8mWmAECaGdd8dAmj/9nruO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968190; c=relaxed/simple;
	bh=Aobvj69DN8F6w0+Jb0r9TFQ6oCGfBu7fy/EjQhPy1lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dx7RNhQKDigmHVeDLWTdNGeS+qqsCOG+jCSsKT7k/xuze7E/a3ZsbaSvG2PQgswMlp9f+EBzJYpPOW4UjSpOCugWLaR3oQ6+jUIzt54wGlbnK46K5Pcco/kTmppaeGKp1iSF081OD2l6Tu1TtgKbAnHogv5s0DEfofJaKrNExjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JS80tqNZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JS80tqNZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso60332215e9.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968183; x=1780572983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpUOS+9fsWY0UqlgRlGBSremc/v/5gxyA5J8k3968CI=;
        b=JS80tqNZjTwx+lUJcz3qQiVMLsMc6hrU6LFf9NvYdWVr8mxXyg3rHxnIcJNkOg7OEO
         creHdT/CzuN+IbwOun69wCtQvMuJtT9BEj3Dzc0533ZsFZCSgMLGsvyVJvroiy1EFXFJ
         5AgxNjKVnKnBv6Y3ocT7vso1iCyrGue6okSRqIuFNkUtHDLzpdTcCSndrG/Xa8eW/mO3
         lM/h8kbs5PalzV6AZ1m9ZjADEOuflA2xeZsO54iISgBUxv9XYb5U7wlpYOFU4eh1ugCS
         aw1hm0EXiaImxpkSd2x3KytsgicKWobpSSek9RO+bBQOlZyYksEiKfjT4cOsDvtBxJAr
         3tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968183; x=1780572983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wpUOS+9fsWY0UqlgRlGBSremc/v/5gxyA5J8k3968CI=;
        b=OzT6mDpOUK414cs+xWaOEF6wPLuzDT0C5+YHdU7/4UQpVpNNo0OXGFY50yb8om6A+I
         p3anu0E5uIqiBvvkAxqXO82iMBtFWe72CRhvgw00HfwfmMy2i0Mk4J41K658xbHm+nNx
         ndc3Ab4/9wQpiNMYo1ZBvrPRh6245NuVa0pf9o9ekHlDVl+iJ5AspPErx0/32hH82iZ9
         HaaQGIJcI9m58eMMreosjOq0H6GJj9krD0FhsJQw5HsQgHYoLoFNk9+Z73wU+FZmTpei
         ZgvZ3LBMs7otYD4Uk6jYBYXCM6+PeMPvRAV2b231WM00yoGfvhUBDcxDfxYKJx01c+WC
         8rTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lVnOkO5aiJj0VScJwhzZiXYP1BQKmNBbevkEt3y8Rilwk8Rbo/ON2CBN8sGa58Mq1M8DPGmANJwWl@vger.kernel.org
X-Gm-Message-State: AOJu0YzVr7oGy1MtdC2yhjflYFsiWPaLYc6S9TEOr+4sLM+xOjgB9jaD
	Xi9VwKDctiTNxk2BfBcVqDc19+aE8AIShxfH+PGWC7ts4JXzBqCl67YYY2Ozn6reYig=
X-Gm-Gg: Acq92OGOZOoX9PSbF96zvEI9OAVxKEK5DqShZ+d+WXbEUon+IXpRv00/+Va5p+jiGjC
	HD76D5mbiZqm4+r48Ow4KG76cnXXODDObIQVZDoRkqzt9rbx1Gt/ECfMhJJKNx6Y6DNaGkJQtgQ
	E44LEbuQHmIsRN+t6wraM8kkygMMbQgXQCfW+n67KM8o5Y029uBqhojIm2d5gNCKxWjqP3YK1zh
	hfc8aL1OfZp3zEyiUbk+1TvK0HCDdV8aD2LZ8ZpuA/bcC3kyTdrpxHNPr7eFvUEik/sATKRSp6c
	eWKFJN0/FqYNpQADTG9kDayoMu5ycL8MLGy0o3YWw18/bcCmiiiJFajK5fZ5qRBQPj1rN5tiOmz
	qozNhJhKwcLQtph1MdhvGlIUpbWxYJSbhAmffj5l/TVoUKaHIU/DE+rXqY0XmtF3OvLqaJvpjcE
	2oQBSYaA3vHhVsWEiTLDYbgVVKnOLfQGYG2KGf6b3oKq2+U0e/MBoBtN9apO6mSEqqgUIjSaTv0
	xlhDKgbMoo3Uo4F//bGsCUWax2l
X-Received: by 2002:a05:600c:8484:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-490426cd8c4mr466725355e9.20.1779968183364;
        Thu, 28 May 2026 04:36:23 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 28 May 2026 11:36:18 +0000
Subject: [PATCH v6 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-acpm-tmu-v6-5-b4d7ce57594b@linaro.org>
References: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
In-Reply-To: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=794;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Aobvj69DN8F6w0+Jb0r9TFQ6oCGfBu7fy/EjQhPy1lI=;
 b=IrVw2lxVCkAd6zW/JJPCyuIUKwWUWmwU9qRVAfB/8ZYIYZEo8nd4c6wq7R9RZmeF123hMczZw
 7EaqfiU+KYjBsr+EB35bTx2qZFhGyzz8N0BhvF5UIvxX1zl1H7Zm7/j
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs (like Google GS101), used on pixel phones.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.794.g4f17f83d09-goog

