Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F02D1F44
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514226; cv=none; b=gJFZjlILVAkU+9cVxElaXHUbCsWbLfZiA7tzLeqglv45ghfiIG5fMc+SuMfddRll7hd9vYmv21E3E4iQOzwVFNOVJa6etj9yg6p5Fzt2Tj9zcmoiY0dRYDYRwmqVwOYJbzXKzClcqwL0YR4bXnZzE+x4Fp3tY5xcgy48naTTPWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514226; c=relaxed/simple;
	bh=2Hl09FruWGr6pjACeuq5DjMb5si4CPaD6fjJlZmzP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1uOfMFFW/rsq7UqWfaArweJVTC9rhkeoT8sh2dhC7O/PqKaPROFb+fv22htU+JOklJwF2N8uMgGluSlHRnJfXow/tZH5EiqZhybgs2Nc5jIArMvE7o1OvNKqFRHBdr/Nr0sp0/unp502rmo3txG7mTIaGtqJApUpj3TVLj7eFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFR7mU45; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFR7mU45"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so346676f8f.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514223; x=1778119023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=IFR7mU45nPGnb5plmWjmqVXFi1kQQMKdsfsDjn9Kfm+CYFAqsYL0v/i5wl2GE5mNpK
         O1AccpX2jdIUquoiJzZv1diJkB6kwnrnayk5x2Hb+S3ZBQOvgJ1L4hiyxHyxgTYJD76u
         90g6cWlvJVfH2UsDtJkqlWJmxH2B/j3Z/GKK2r+XdABJjyoUHFLMpj1p71uBPsEFW51U
         HFfQPadbJcWgUikO6qxdsRQQQGC16bBM4jA565WmlyfPytNRDCiOU/3OxWthabOx6VIQ
         EmHHiBFliYpyEPgjM+i2hcTc/Clp3z1eNdffcpywpXIlmof0XvM0/Q8xnX7uqtChBBh1
         iRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514223; x=1778119023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=MKpMK4WRyQ85LFWpEJ5pPLPPIxAe7FrgXc97Qw43CZ+47GyqYxOQ5hcL9C/Dut/lzL
         f2ldkEIrKRNPoTCGIaP6pYpPTM+SBLOLElPHAGuST1T3X0UJ1sUH4kV7OAZm5gs+mMka
         I/OhKw0WLtEvVYwxI82XYuHoMykhbjcHEu2qJFrqhKvV5u1GvhvyPfVBfGQLdxVFg1ia
         7PKPbrHKIWvm5Ab+34HgoCoFfiljWm6LLpJxKg4Lxmg8+YAU1JrA8vINJVWAy63T83R5
         TEpWfEyAgT7NRggKXslXGbAVl8dN4e6+tkYfzUN/jzKukbih6uXSYUrbQzdeYRVQjjhb
         aS5g==
X-Forwarded-Encrypted: i=1; AFNElJ8lCrI2SJedGR63OgM5WMsiTGbegOpHN6oQNBizHSmcpLa6GFK/w+GXyIrButxIDdbceSqCpRmbtdbM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6AkaPzOnwgimoqJCLGTXvBzg+Mlf3yXHEWkC2E+TogFNFo0/w
	U2Uvy8Tv/GWgsVPjE0zrF83fjZSfUSMMHrPY2wHBv/3aB9FAGAQo/2gA/W7/mSKIdyQ=
X-Gm-Gg: AeBDiesNtDZSxnk0UlD6oxE0QJ8YP0PxLOmRI6SLqGCvA1UPyC7vXbU7KC1zG59LR6K
	lQPQuM3XWPdCTU2zrBOdB77HkB99fP9vSOTVEfjGghD+/gaTyB1RsHXMYhhYneoVyEanTOUBuvb
	yxJGv1oodekcwBHOMtW8Tnb5DK5/h04qvB4MF8JiaQVepZIfVNbzXwTRQzGmiUGORNxsRA3pq0B
	XKlFg2Dsm55/2xcO77I7O3UqIRi7PCTBjz3NADgTWbAtg+Bfy9FWoP3qCOmsYIUeewTMHFeK9DY
	Q1l/EhQwqTDjRHMfmrfqdCyRd0V0gNfKBmD94v1S7aT8oGdZbXKeHPNkaZ+hdgb2lHNuRlfDdoD
	2yvEzkXt6NV7979N7bSthO6LRo3X2PYE9PZIWA4tB70eNI3yhmiisa+YfYtYbOWC4jXPi+LOq3y
	7HeFEa32aATqouY67XRNw7uPF2jj0+JmqZul4Tb624wX54eXCCW5RMkAEctBnUn1BXdiju4zR04
	YN/S7eWxojm/7hPsS4Ip5eaTUg=
X-Received: by 2002:a05:6000:178e:b0:43f:e934:50ac with SMTP id ffacd0b85a97d-4493d7f9979mr1191141f8f.7.1777514222943;
        Wed, 29 Apr 2026 18:57:02 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:57:01 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:55 +0100
Subject: [PATCH v3 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-5-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
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

