Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3439BFF5
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627542; cv=none; b=iOon6eo0akLxxtl3j/nZKqIWhMN73suwqPLNTcf6440403B+Lm/WME66t1Q8+kJZKzgordhV9nvqv97jHuXjSg+yjGireF48NlsfH/Th8+D+i7k7YCM4FFCVBr+cECx5whpbV35OJTAhrv+WCJ3bPUuEklDVVK90nnT0AKe7y9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627542; c=relaxed/simple;
	bh=QMCGvOgTe1IRUx/r/waxC3kN2j/mbhgWj+jEk5Ocqb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZCbguCNC/MyYrDGE4SspD18GGOiKvsOaJxmTiP3nJtdGtrnTyzIzPZa3MN5gO6aoRoK1hZuLENfkWPbPcKNmbx6G5GZTBrLzyU96GsvizendZHS2y67LxOqh928RWjHT76kLONGGVRT715ZggoDbm0wDXD8SSzS7tZ4Nq+GUC+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yicc5trm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yicc5trm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso42900555e9.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778627537; x=1779232337; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQyBE0OznAhCrRGD3AceNMtDM18TfwDnmYG/NfXXQJI=;
        b=Yicc5trmAnu1E5+8sRNZ/cxtSyWuIIMGj2Ajk+BY/K+Odxw5MQNZgcwpjde36+AO7O
         l2rLlQLFK4YZp5pcZsSQvvB7H0+IYSmH1GcrEjO/18ykr3vHAd05/HP4yL5mqdnwepXs
         ltT/+qgbqaMPPo151MoNFdcc8bvWjwh+Hq9u/Y4iBDaBQViWG/mqZ6+KgKaikhe7VxVM
         hIsaPyjbC815H6dMxM5OuCClMAzwFsm4Aer7mTW3qqUNliwfbcvenYk7eLzVghbotQdy
         YIIWTaXzFtFSYjI7nyc5X5EuS/uhiOVDHrj7+RHjumPUkn3AjlhbYxhq66UtdSOYuzco
         l6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627537; x=1779232337;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQyBE0OznAhCrRGD3AceNMtDM18TfwDnmYG/NfXXQJI=;
        b=qSbz2E+GTe747jRNty/o+6K1WAFcGN++UhivU4TaXYjqdr/yYqgHz3wGxlNpT1aLSG
         n0nsi7et86nb+KGFr5RP7vrFNz2sfpXZ7FHVVuhSTdKsq0T/QZuZ2/DC/2V0SqwWv5+U
         ozFGtp/jp623lQop56/kmRGkn/Cfhnm8A3rwIjErwrhew0jsomI6ahvHk0f/rPD0TE6r
         v3UHf4DZw3dBLEAGMs4NunZ9yAuhdcINKzsQa8LaEDVmK2uIBkaL5zHuZKF4OS+pJVwJ
         ywRgzTkTvsu5voypFPt2SxHUg7UDx/jaMJDfRqQzhVRnOiZ6bdPFkz6+Kb4cmyWFVADh
         5p0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9MV/zf7hRTObJxxTb1cFIYjgh6GqQYU3AzZloK9t+v/jYMSULKtok3ihgmsSATHOBea/Jl9vubl7QG@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKaYXCzOOo+YKJ1O7TKbpmjRu/r1daL39p7HVQzhhmkI6Nulv
	MSN70eRvXgGJec8DnibyFxE7DVQkmpZEOEpKkG0VMc0snp4j1NnXvuEqGO+qD06RWog=
X-Gm-Gg: Acq92OEJ9yzusTQKQCdrbx+p/h+Q+THiV3CtXS42phpcqqHy5OkSQVUVgXt45lCL+T7
	vkbyQqG7ZJzEzafUI2MKFI9S4Y0IhCiQQCCMKTk2tvsCvpqvhHpAkY03ikj5YhskNZEgGwkKA9I
	cakR14F4c3tkZSYg02+ffT2FALLs/u5SOuNNE24tPZ7kyK+yzHesD4mglVC+mUJFG1FnI2fOqJF
	L2L8qcmNqtGb1Qe8dGvyllZX7Lv2e8BJeZVRqd1fbH0ekeEndb2Y4RSAznbe3IwBbJQGkAJhDFx
	758oD4cHESw/lYjfE+IAeFvVw+Aa/8rypaWrhx46G32ZakZ5u3e7QQvBg2EVx7VM/1ka8JQI2Rd
	oF62KZH/fCKBIMyk4ILvWucn4q0eNalb3yFOYfZ0B2wkG24/nYhyjw+57Zo8fSrMy6opd3mSEDR
	EwZ810DCvHdRKj3pHLVHewTRjn1vFctVoL56cXGvQFlyCAc1wW+q/CLJW8pVoWLsyWdMaN01wtM
	ZJADMJY/AEdsnKI
X-Received: by 2002:a05:600c:8b55:b0:48e:51f8:eb39 with SMTP id 5b1f17b1804b1-48fc9a4b074mr10062455e9.28.1778627537139;
        Tue, 12 May 2026 16:12:17 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm20712305e9.14.2026.05.12.16.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:12:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Initial Exynos850 ACPM support for exynos-acpm
Date: Wed, 13 May 2026 00:12:10 +0100
Message-Id: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqzA2oC/3WOwQ7CIBAFf4Xs2TWALZr+iukB6KJEaRHaWtP03
 yV68eJx5vDmrZApecrQsBUSzT77oS8gdgzsVfcXQt8VBsml4rWQSMurH/Kp5qhtDOh8Ck+dCPM
 U45BG5JqcdpXglVFQVmIi55dP4dx+OdFjKqHxK8HoTGiHEPzYsPm4F5ishN8DDfuXt/cbGuqEl
 QejFJlmFtBu2xvqNeR31wAAAA==
X-Change-ID: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds support for the Exynos850 SoC to the Samsung ACPM
firmware IPC driver.

The Exynos850 contains an APM co-processor that handles IPC messages for
clocks, power, thermal management, and PMIC control. While it uses the
same underlying ACPM communication machinery and protocols set as
the GS101, the exact implementation details vary between the two SoCs.

Those protocol-specific differences will be managed individually by the
corresponding protocol drivers. However, a dedicated compatible string
is still required for the core IPC driver because the Exynos850 firmware
utilizes a different initialisation data base offset.

First patch updates the google,gs101-acpm-ipc dt-bindings to include the
new "samsung,exynos850-acpm-ipc" compatible string.

Second patch adds the corresponding match data, base offset, and clock
device name to the exynos-acpm firmware driver.

There is a dependency for driver changes (not for device tree bindings
update) on clk-acpm exynos850 series posted here:
https://lore.kernel.org/linux-samsung-soc/20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      dt-bindings: firmware: google,gs101-acpm-ipc: document Exynos850 compatible
      firmware: samsung: acpm: add Exynos850 support

 .../devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml    |  4 +++-
 drivers/firmware/samsung/exynos-acpm.c                         | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 9e0898f1c0f134c6bad146ca8578f73c3e40ac0a
change-id: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
prerequisite-change-id: 20260512-exynos850-acpm-clk-bed1c23b66eb:v1
prerequisite-patch-id: 223c977406801dde31779f956e33e65e51a0323c
prerequisite-patch-id: 9b11f60e3c53e94e28b5e54fb7bb87e5415d8a05

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

