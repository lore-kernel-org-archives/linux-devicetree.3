Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A334D2ED4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026781; cv=none; b=JeLeqMczKF+geZ3Y8q0bfzUeH5QRu9giYC8L+r10mgb36v3PZnqtdo5Uv1zFa6ieYyZqKnsnRy0AvuyamzLIgAw+VOHRFMwljoZTH90X5r5TyixFX8FCMvzh3nUDmGq8kJguq/quppFiOS1eV+mcaDeMS8jjwcizNCoxYouR3/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026781; c=relaxed/simple;
	bh=2Hl09FruWGr6pjACeuq5DjMb5si4CPaD6fjJlZmzP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxySK/zTE5Z7xTnXmOcxmD/9DsiYs5Td0QL0HH3fpotcOIype9oDXEGFsuR6a6LANhB+nccHb1A9nohHVLCkw/BpfcGOQmG9bGeCdIOQMFzNUGbS4oalkixTJCPFMxUkrcRXHlMzr9vobGNMgOxhuEqxKk0SJ+MWN2SYETGS3GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZchO2r36; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZchO2r36"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b3e03939so48870775e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026777; x=1781631577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=ZchO2r36Lyrt8dS0ugE1SecmWTalo9zuAfM8aXyKjyNbrF3PLXucX3IBxxUTBAAFoY
         8oGLPCfiFnpv6Fq3hj5YjPnr4Rp0NbktqduzhxBwBR8R2ogOKSWwmArS5pNfGXXccHxv
         0nIIuhmuvMIv5ncH2wHzdIW7v2+FjlFzmIkVfrS79EEF0r4CFhgjbaYy/A2t8JIXKVs7
         26l1DI/DZgCnfuS8cNICTjEEQywiSFcbjh3nweCQBdR06Q6oLaz9jDf+yQo0ksCuKFcO
         4UsariVjPMV/a8fOuzwRVePLXn4ozO0c0GD2gB1cin1BQVx0C5jRPazvio+gZ0ntRAg0
         Wvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026777; x=1781631577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=lbTgN2cx1C4Hk4nrZiYo65+erZf3zxIWSowibdF8R7MPG+rESIaYexyn9Fban/rjoY
         GPLD2d9QPIfc/iUWsJRz1fida9b4bVvYfquqoBID81itCavvO9y+G/F9RUvu7wnO4urO
         INBwcWI+3zF5Uns2kmKEc52E2bHENKub2Otffl66kViUHcFyS5eC+yaGMhOSUS3eG+kq
         hkZxK29+iKFNlh2Kl1Z0xxjpSqsaqMfWkonbichVOXb1Veb8xK+WXkw2VIXEeTDg3tQl
         dXtn2+zLzNB6XVnggzd+ssIF6OnIqVgD1alTMZG3/ThWEmWKuAA0FBSV+KY5tKa0/RH4
         mKbA==
X-Forwarded-Encrypted: i=1; AFNElJ9NUQWU5W3jGOq0UQQ6Sei9tGBhQhDijZT2iAq8n++fzj5LTmEsNcnWhEtkOn4Cwy89qeLemL1nR2Tb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6jF3rNLlSOkDsUqJuIXHwnJPQYWhEgn9BYMxKK14NFBsjJAW
	sc4mvtgySwYMFYh9iQqkhsNynpqxYGL6gFl41FM4P0xeqdMO1QaBcb1K+N2L7ih6/vU=
X-Gm-Gg: Acq92OH6jeOUp3s4AGA7/LMqU6yOpihV4A2xZcI8mtX55LXhXMr4Mofkvwsq6X2skKO
	+UlRKP9xNyk1tzLpn2GbGxAB9NIExwSEiQQZ2tnGj/bnIJ48BDT5tsIUAZSka8H7mkK1bKaFaKw
	Py0zaxesGfB4zScGrUxS1URkZmI9xdB4ed+if2GB+d+UnsZQLg680hxjP0F4zkT4kuqeyGNdonq
	KtCCI3RJnIOnHSnC4SG1ihE9Zr8Nwrqp0CIkYn5rS9TdS1BsCjhcQChBQFM845rNcBqBl/ItNAk
	drukStH0ZG8ZWw3fW6qwLV7bZmy9FrlykOQ6bwVaFgEa6fCdq7/6cRk34TCwre4YsIMMUO5uxYl
	AXUcY/5zkpS7SyXI85g+g6Vz2rmLEWTEH6apRwYn2V2nuzOds3XVQ3xwXnJbgdq3IVl6MgwT+4U
	/EQvd/QcvsTEMQz+fgWj3Ohye0KuodRUgN4Dfe/q37ovdIc1L4UjWILOQp+KUudrSQF3ihMcIgI
	8hFFPyHO1zMvXfjeRJNarCxcgkoPK1qZCWgGw==
X-Received: by 2002:a05:600c:1c29:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490c2ceb6f6mr309457655e9.8.1781026777516;
        Tue, 09 Jun 2026 10:39:37 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:37 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:27 +0100
Subject: [PATCH v5 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-5-8422cf80d43b@linaro.org>
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

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 498ca30a00c5..60c25fed8ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23645,6 +23645,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0

