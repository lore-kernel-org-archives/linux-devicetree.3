Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F6383989
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713436; cv=none; b=CU3sZ1kYuv7DF5TgjeBOSE50aCOuCdtn1jVfd2KkAnCJbYWheEIATCrVfnq81JKOLgkJqG7IHs/OWkVPtU7iNzKzRtPA161VhPXL/hYU9PfxWu9dfynOh2vxTdXmBbG+VNQnmhm3plA21hw0FejEuNqmMDVlCG1+wuXGbckRvAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713436; c=relaxed/simple;
	bh=j2bS/h+sguKS9/qgJjI48x6qOqG+tkwy92XDxvAI8yY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ci45V1qcwrHxZSTk8BT52d8NzKOoW4hEAyHpE5iZtHBzpbuQfYaCiLOSolPRAB3IWSye/Bd8aGY02ysh/ncG4JaIOW3F+fyiXXGKzBbvSQeWPmaegkIRk3Cty77pxmE/G3qVVEyee3o89+3oYZlDgbnFGrUo7taHilLo9hJqPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZtCK1oVa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZtCK1oVa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so38541235e9.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713432; x=1780318232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeWjSlPEDikRvLF1aU9lZbkxd+9N7RugqZlM/tjJ0Bs=;
        b=ZtCK1oVakbBOBeF7teScTDXDYTb1wh47DRq3QNmsOu92Aq5LECw0ALWoFn3FU1E4/P
         bkUh2U2obVuEIG2qc7RDwPtio8DFxBLy92TskAwhJ6Lyest5jI3M6fUmxoVV/OwKeXWc
         80nsy9VNDab8k8wOyxPcynbwV4gpmFEd2wLFvn8BBPZR1u0mY9KzyOKs7abX2s3hCbYw
         +3ZRuAWPMJdUkHq6gfWX4Zj6/rBeDD0u3mdhvlOGVSOSqUY/v2keVXnVZIbPEUfY7OJ+
         lWkhRyp7PTcJl2d7/jteiZTD1ZHvkGts1CxZggu6eRv/o0Pm4iVtOmTNpAvPW0gluuad
         MlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713432; x=1780318232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QeWjSlPEDikRvLF1aU9lZbkxd+9N7RugqZlM/tjJ0Bs=;
        b=Ur4fyx0NPSQKhrHMbiPFV00wiMt1AnFiHA4LTluBfFnguMZA4bPfZiSHU/zwGiHWp4
         3osZEUtEVP+aD0FiQNqqvo2CJExMHOCStjzIagNy/sXDMntKMtffb7ZP7D+cKYy+255r
         RuuS/X8XLeYPtGV7hHtcCcyyS6pSBRIdB4MBppqWbemr6BmCPXF/2LVbYZQ9lQ4tfbgM
         ua0sv4299rLieT08/Ds1J2GHp2xTDMYBS97mZTZlqBVslbzSUwt6Q7Ft7lxaPCID7C16
         QeQf2A9qeC0s/dWLAFt4GTXmLXrsWT82WFz11a0VObYG++FZhy16blF7UVElciXJQffN
         1oBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IOSLHTu0DKoOy/PSQs1KdXIr+VaSf1vnSvh901oBnpFVA8XyFtirh2EZTeea86oVdrKJmr4XVIKsY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhshao00zjLPHehiioJ5GkHvOuvTK3gEdWRoUQBTJjen0ZyKm8
	D0mFvX8z9xBkoQmaBMFl2E5n3FKnt8sbqFAHVQYrTwaivE2HhlmCPdaTuJeCT8hYFeY=
X-Gm-Gg: Acq92OHDY4PkyaPPw1wXbwtyQHQKM7gCbio8c6JS4W7Y/Z87CogPAhmQGwUoCJENivt
	Rr1iqRAVRpplcRiWR74hAnR5kB+NA9Ue9Lc4CNE0HleSt3xm6dMyb1cEFa3Ngs5EvualVep0wDZ
	5123e2pEnauIPT8a4zvi6+d7W/lhKgG/laCPQTZC0UZw0T05+aOLaU7ONZQouzZIYhGDsRE+M94
	D7FvkNVoymEFak3Fu1b5XxplDTP+ADSQHoDrJQ9vlGtUS+KwqP0i+AWfUVNmPifxs0Fxkhp4DDB
	jLIO7YAjgNk5nBZAZmi6rtB3iJm7HTHk7NifVvbOYiPPocXPYSJ0tWQg0Li+YmlYDVazDZ8pizs
	J+2Sx7IzL0tJxfc9JqMrAvUWtsapHIWWt2KOS2x2gStjnKgQPPvezPZRF4oUIoDdDZevSdR4Ubm
	I0VNlcFe0tJsodgGXbdGDuymLXLw2GDHcBoXlu1TY1oy/ff9CtkBSfBvDl3hizcrJBJrxdeSHcN
	dK+BQM=
X-Received: by 2002:a05:600c:45ce:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-49052c07823mr151219345e9.9.1779713431711;
        Mon, 25 May 2026 05:50:31 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 25 May 2026 12:50:23 +0000
Subject: [PATCH v5 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpm-tmu-v5-3-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
In-Reply-To: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
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
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=j2bS/h+sguKS9/qgJjI48x6qOqG+tkwy92XDxvAI8yY=;
 b=wGj/ffuuA+IGQ5pRdRuMChnrz10mIrbyGhYYPnunxYqt6E370YQjJM3fCVLiK7mzpJhj+Uf/C
 82tUXkViWFXCDZJnfAcgY+c8oE7hfjIUHprgnbQm2BqPxOtrLUp7s5v
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..7ea3b9d95ccd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23660,6 +23660,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.746.g67dd491aae-goog

