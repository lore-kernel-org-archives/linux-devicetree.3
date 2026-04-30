Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E7028642B
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514220; cv=none; b=MQlgZdwrpT2EM2RDLchjPEVy10IUkxTHgtuZjK1Yb/wBdc5Wnn05dckjpB8Xo5Tb0hV8LdBFqJoh+XSiFk2X382xCk0MMEoPihNINDwqr18lMFuuZ+joKBjCoD4ud2fD3KCkPTpwYDsKZF7L2bluTRfqM4OU9y/7NctG7lUJ0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514220; c=relaxed/simple;
	bh=AZshoggdy3zuO7uepA6tlCKjsxngbTlPbeDHx2gxaXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYcDHFgzRdSkMIZVdZmmG4SpWWNOphU3jj27NNF51etorFM3+tt4Cc3ostch2ePb332wFO22x3FESIwgR1rpw/cjK69tpNvbQpRa2YPF35fgSDMG+aJBLZmN1KalAczTEWV7fbpjaaIht272IuFXE0HSHK0VYGRnCzG75JWPJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmLcXreL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmLcXreL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-441209fb77eso214974f8f.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 18:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514218; x=1778119018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYgTJ4k5gmQwMKcZEcvg88X5/usv5yCN60/fnybmGoU=;
        b=tmLcXreLSvG4ldoVOjGWfd6yaEy51tNzlZbgU7o17GywjqbninHPE4XzHFlyyDRjiq
         kufARGXGlck1MuQ/Rwt2TF9vO1YQRJcaenRLCjbk0DV2Of4UK168qabCEhkz7ppJfK9H
         VgbokmnZWVVhQIRBBXWNg4AqP6yjU9jVj9FxqEh+XhKDBDXtJpXHHkCx+Io08g4fm/MU
         qLp71LKLDkDKX0BZdj7Qq8xdJwKDP9RbOfyjffrZfD81BIOcjBLwb9/ShTlexjOnroCG
         qxVjjasZ6FcxbkwecuRAwkott49nD/URxyF6P/TlfM7eMlJRQnDT2o70qUwo6cp1fiFg
         zeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514218; x=1778119018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EYgTJ4k5gmQwMKcZEcvg88X5/usv5yCN60/fnybmGoU=;
        b=RQCzpKVGv6dHjMrC3GLvA54sDQa+gv0Y0/v6tCdvToEHNTdWLqxEDor6EjFHnsEmLx
         8T/xmAxR6mB8IH9tVItoEFQOYXmTAZ6/tU6K5mpE1pwlJRvmBVzNZLwGELfunIj5oWOG
         dBpMdD/svdyVDjuo7YUQvgb3HRwAZe4RyGh+MvlXtpBBp5m1ZfysCn9n9G3RfGCyjNTx
         nmhA48jqqC83Bp3d/2EpMhFQQeXNw1WnBSy3yqogu8uUDX28pxDFa7LueJN07S/CjzwE
         KWggmnn6Bsk3cgJADzX1h1WFLnD8sWHOJpUZROLwNxeB16fQeu3C3ddXpx2UCG+rIHws
         J1Eg==
X-Forwarded-Encrypted: i=1; AFNElJ8SaUS3A9S/EedEjIjm7yFWp0oLyNq/Y+WtaDi5N8jZf4zKVoXf28MMMVT5U+rYNg/jHQmw+Amf07yW@vger.kernel.org
X-Gm-Message-State: AOJu0YyU4/fiIjKRTScGigkIe2ghLHYlB2AapJ5TMhFauOiHYrN/WcDs
	zZSP4UfhDHwibgUObzqeiqLYa81M+TewJaA8+pULRP1q9A5bOEbHyDVVFTKrfzOJfkM=
X-Gm-Gg: AeBDiettziStKgVfBo2ngKmjxu4XAugdrcrsNZNpfAriGZmUUGt+Cjo+EExchKEjCly
	czSRuVt/c0peexXuytsD9kCcrtTLjji2JiVEtfstLDOiEB593zF1crclvPWsvzvz2jisKsqYbmz
	02G5RRygh4XLqWqNJTd4NyGygtZbOEHe9uiiAoVq1mbG0mqEtCPfQVu5SwSTUVlW5JMR8wX7mOQ
	MuZNV04QhJJlQMwe1iKxYnXNeuk2/J/N9FiOFsCyGC+iaV919FH5oN0fkmyw5XzF5AwA+k8Psku
	0H/8/apht2ZrAtqENQmxlpLAH0IgsqkV7BMY40pjviT9DG3HK5ebm30RmSBZK+yOxlzOwIos0tU
	bVNCCsB1eT8j+w5RuvIaKa+z/cr2M2M8QSvxSxLRRAtxcpA8p2cl0Kpq7kYiJUBMRrTVn3IRADk
	EF9l7cUwDlgt/SayksG2CjM0t8a3h0xZdgbrXqRnwRApyF6KPMNRw05C75ikgbIBSH7cHzYvIKm
	zDsjpSsXbfRVeyg8Zx2dNYit5A=
X-Received: by 2002:a05:6000:15d8:b0:448:6b5f:ce9b with SMTP id ffacd0b85a97d-4495025ddfbmr548070f8f.19.1777514217658;
        Wed, 29 Apr 2026 18:56:57 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:56:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:52 +0100
Subject: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
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

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

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

