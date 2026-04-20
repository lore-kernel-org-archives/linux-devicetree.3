Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A33A7F75
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706819; cv=none; b=VI2VXo3yXaAOsVWieVtWTTJMDmFIeT/3RJF6KzKOSpOGcWTzsRU3yEmuyeeemD+6RtNAzUaiNciPkXydAp8bSQdhX70fOopuggyYLF0IYVeWb/QqkG/nUnoiyVgZJmsM10xiwpqbJAcqgQV7kPqguwy4azfeCtAmhzsSyAYtOkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706819; c=relaxed/simple;
	bh=b4zN6V69pfC0jSn1B6TPnsLWLax41ajhjGEGhYeLmtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3pZXultBPT5s9K5DGNaGKPArEMbGcsU1XENexEkBUBFQzBvdtA+q4ansIbF/S0KrC7q5zrVq7gFTA31l+g5jeHzLsKfFSA/WtUb6aBPrUItBq+7n8w3HgnPkmiAVfPE0oxXuRu9wshPZCLyWvPOWm4Ywm5NEWckgZeFOrxCPxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CAupjM4Z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAupjM4Z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso8048005e9.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706812; x=1777311612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fwlZkaqAkipgy6piybX/zlZcoSztD08jPD+bFmkPvg=;
        b=CAupjM4Z1Cnnk5+fUwu87eU5F0dqCJ4DBy5J9OWidnQGgRD9cM/KpImYqzvDJVoR0y
         qK25eH4CxGXCSHFOi7ojOdumtqNojW2f7h3fBBkoDdesm5MiMRaAJaQK3HvFzDd3Mao2
         9V4isxGMmC2yBBzQeHsC5YZDls1NzsnuA9MkcJWJB/TM/gTolma2J26Ye5KQvUA5MjHH
         7bHzCATBvSXp0Vi1ij6ibGXYd4nmZR241kra+6TBuL4NyDm1Jht0Qh/a03zGYfHK2FpQ
         E971bDsl75zhjMpNJ6/lYn1iujfcc4LPG+Rd0qzCtk3rTW7c4Ka/3YKGQ63jh8xC33/l
         rHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706812; x=1777311612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/fwlZkaqAkipgy6piybX/zlZcoSztD08jPD+bFmkPvg=;
        b=AVYYYaOC1D3eQaqg1GAU+wFpJL91nwpL1vddjfiBHxelJ8sO7b819mm1QKNxFa0h4J
         mm8U9FAmGsqnkWCkn5vyw6829KUDz3dFJVkxRW+AJCmkEA50LsUQGgjusA09IGcNNehn
         SWlgj1fOiSEhkwKjfuJxzv4hWwrw+dvSLoKgFDDOzObpPJ6nYs2JFX0azWiInwqgIDXy
         kTwFe62Sd9z64W+Nb5ruXnbf9emESi7OzzeXp7JRCq4PSdWOkJFWpdhnMctGTU3t0J2w
         QERtYvjpS61dcTQK5IDtdl6pVc1sKnlOCNlgy0TcthLzGobyb38qvGitc219LkWuimBT
         l69w==
X-Forwarded-Encrypted: i=1; AFNElJ/GXXD/hMTPG72XGSDCHwJg56u4j0ZxY+n44ZPbKFMrxq49X9XnO0F90FXJKW4JSpAMTBqTpEdA2atZ@vger.kernel.org
X-Gm-Message-State: AOJu0YypwQSvjL7B5O7nFQNQwNZ6ky2e5fhJmLT+cuXgSSViqMdcYYx2
	6qjmTKAzEROUAKSPWgHggnC3Z14lUhj2ZEH5a/cuJvA+CkjKyxukRRd7UqgRDuxEYxI=
X-Gm-Gg: AeBDievu8aTDlPo+Skanewet1H2VDE+lk/Q44SXcXijptyM/FZ0sOr34TFIFXfNG+er
	9kGtNVLchsV8JmdOBmWstFCfSzIOOln06CjvKeHwD/GBj9iZ80YixmMlhXbCbRCKToLPtNKgeCw
	4qBK7UdCwZuD3QXmUgph8eZNKbxIhdjN7G5q9kyKp35QqT9mkjIE8wVoE+mq/brdxBqMkiDBa1t
	yrP+xKM250As6sBRpuL5eoJ9jqpjVuyuoCw33Gi7Ek5CjPdyRrCFtYqgVdBxYyUO8OEHBXyqA1S
	TWsdEvm1YOaHKo33xNrb5fkMfZQPw8k2RG+9efMr6jTz0i0a5qcttfkifXtcMw3VpTjzUYv1J4k
	1ZkGQ8mxbxUf1GmRgxCtsq+rbwU1Z9X1GWtsJl+47AsxBEufP1OfD2OukVr6f1euEBNqrZWdnr5
	rSp+exaF4WWtLyTOA0ymGV3UcKdah72LTsoeE4Wf0Y4+VfXbHi/VU9bmAAS90IQFCiI3ecMVZz3
	WitKmZJ6MXnybvRcw==
X-Received: by 2002:a05:600c:a108:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488fb78ba6fmr175032275e9.24.1776706812164;
        Mon, 20 Apr 2026 10:40:12 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:56 +0000
Subject: [PATCH v3 10/10] arm64: defconfig: enable Exynos ACPM thermal
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-10-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=816;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=b4zN6V69pfC0jSn1B6TPnsLWLax41ajhjGEGhYeLmtA=;
 b=WOxgRvOtzj9KL76srvu0GVEREFLVVJ/F/w3yzCSjd20IjCwgYQ6jiBj/Qn2GHV5jR3DQEJmfQ
 HziKyX9JAqtC2Ws4BV2sIldy6WYYbWuh1/1Pc0VmL0pBFzg1xMme3pe
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

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
2.54.0.rc1.555.g9c883467ad-goog

