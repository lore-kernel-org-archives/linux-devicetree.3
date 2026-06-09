Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56F4D2ED3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026775; cv=none; b=h2QBMEz+gjwc/D9TC3uCdburOq+j13f+JMIhsdgX3JofyX96vtU06fSb21iG90n7/XWqflV4F2zVrNEOo8fiyehtRo1b6VmjxLNAD1+XOjPybchjfBwgFF9M2n+gxofC9F2EmWhsbJNzHfKFHX9jQZod7atADgDStDh1b76u5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026775; c=relaxed/simple;
	bh=DNx2DsjINuyPqrUb+Ejo7Pkkik27ZEapCFCzu2jeQ40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FExQNMaXwpzciONcw4WfJsDHmvwO7L1Zl29OuGyb8xa07yKGnMQTtZVecvDsn68cPBRXwRJH+p6dm/Z6bGQYonA7HEj9EMdc9FZDzHXlMoi8XvrXoUz70sQXBBs+k2SPK2q7BVEzavzab2j72HBe6nDzUBXGqNGRxA5QjCP3lKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nIlWf/X3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIlWf/X3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so48329015e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026773; x=1781631573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=nIlWf/X3uoEU5xMFPrOwXxaLTZc5M2MjULKvL1iDqc6ZZzboxDrvBufEx5jwm+eOsj
         qB/BuI8wxkoLvtC4RsOwhYmAxSaVBDWN+dtsUKjWh4fsFREk0ymlkazwpG6YyPB0Tb2N
         pyO/z0Kc5i5noYrZJAt9K1rAWJuyCoLr2nx9pZqC2YHIDv5z5QRTXvIAfkAbKzSVwyvz
         DUwggOL3v3SKvlXXc4w9Bs1NP2HwTNm+RCT/QU72MxYlOhgRDpQuLbvcEH5y2TRCqQCf
         m7NdZqFLcghQHxzawhNyO3hYgOX1GTDtKanMfHFp1teLHV++ZwiyZ7q3yV7+GcQvi0oQ
         vZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026773; x=1781631573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=YpPOq4yKH0qIz1HI2885GozIJsX0CM6Gq5TKpjAZ4ZPwTpOQwly9AhvPZOPA1J9GOZ
         +vULRuOCD8BJAFV9cyH2HfAH+q/NXOVaNEkSCDyj4v7PsJvdyRIQYRHU+2AY390sdXaD
         wvx9GJVW/B2fyt3lwlByLFeCPoezEYhe15118ArgkDdScj3YdgdfTaR8GIVgy4Gex/yg
         8HWhtnKEk3wRSfSNvcX/pOa/2Y6R2x7C+xDKVkS6oBazXgQwsS3+dOFEYgxN97tL87Jo
         e9q/FH30GyY9aQYHzt39ApxsLT8yn0wXwZnWIlIskx+nX+mPCV0RB1zdbgmEOaZO1aGY
         HhXg==
X-Forwarded-Encrypted: i=1; AFNElJ+iV8rRzlvSTsbrKjwlU1N3ztCrTgZrhrWEvzB/0HZ0c6V4dR+EQl1WuhMGk5j2Xn+Hxi052scDz73y@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmC8bDUBjIzwLYh+ORxyXqFnYCXWcgrxdKZnu3Y+bFO0KOvvT
	uLOxngydYTCPpY2aPcBIQOOLHY5NDFzc4TfMFxm0EPWpyOahd0Uln9idVLqc8dkiPc8=
X-Gm-Gg: Acq92OEpiqeR/2+sfALsm88hJEovp5oEs0qamoWxn9/60FETDFwBtvoNwsyxiY8pQWt
	ROXmkNY34VaCtN6ahgJtJatolHCOF6aA9JFGYbrtKUA5M8cCUn+PV1v6f/mrgAKFOSHie2prruu
	EWwZ27zm2llGNfqiUro2I30obG6M8Gxz09lqreanwJvaOWBQgYMNn7c1qtj5FJC8JPWovaSm39C
	Y80AYI1qVrzVUwlVRym0GLObp12vQHCwzWqIamWHksSTHkJ5+W9gQIZ4ulXT0VT+vTXYpg7PVDt
	36JYgIBFZR9Y0BJTZ/pLzW18sk6TyHM+stxKxqejWsWJzoj1PdgGjLMeykFHUXch+WgH/Jops90
	/l5XTvchJIiT+oFik7RAH9MR+CEWbbvEW/pnFUk9pIIV3izgcgOhpc9DpcHO7GLmbfKYNcvnvj0
	2hQ3rUOupsdjyGVbBc0PMueYHl7Rolqi50qLVitnmppqwfRCGslCZYstEKlthKGW9uQPnfEfAHA
	0NV9/I2wqnENVxOM28rP5a7HK+3H8TwWaRgbQ==
X-Received: by 2002:a05:600c:3e0a:b0:490:b724:dbe3 with SMTP id 5b1f17b1804b1-490c25a07c4mr328438815e9.8.1781026773036;
        Tue, 09 Jun 2026 10:39:33 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:32 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:24 +0100
Subject: [PATCH v5 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-2-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..6550c3736a3b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -182,6 +182,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       required:
         - google,pmu-intr-gen-syscon

-- 
2.51.0

