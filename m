Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9462448BB4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820596; cv=none; b=RV3+4rXFkS87kdMARJv8sV8TxNXCBLLLtfznZJPG7CeoD7cTbJfVf2kAduG5FQLmlwuNz/LRrLwNZxco2Dkj4z4vCYd1P8iqzbiy2BiZVJz6NQxu+UcaxYxN2dIIWZqcuQyqmqo03N+o5DqsqhP/Sf7m3+jtxT7XbkRQMLBQI3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820596; c=relaxed/simple;
	bh=F5ba9LQe5XM6kG9e4NQUbj1wSUrQm/myCErbTEpasGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fpp3h/XLshwxrtz7l7TJxp6nt7TA3p74qexRRvkh2LwFxjOduYrDq93YnWXAox9EG/dn+ja3RquoKLYND4MHLgmh3U79zPl3a8FgnnYSCWZtLroGnaaq+ZM+OQ4PMaVa0cCd2zYm7eldYnSiARDXLy4S3CeG97sv6Apg80Z+B4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jO3kYuOX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jO3kYuOX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so6143895e9.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820593; x=1785425393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ7DrWSeI6duZxzkpJi6xcP41u69UUs7TUTlnDPTSiw=;
        b=jO3kYuOXU2UwVq8jrdNAnE3CmgO9i/YW+aLwJN3Id4I0uX2saRUDXy1m7XgviHEMbI
         RVEMMc2I+ngmG6fW/3GjTFJc9/5gv9oO+2rhudaM2lrkBjrIrj6DjP+43hkCxaUWuq9S
         X+cbLrYf/jhg6mop+9Q7uMG/weFWyjTrgIQvoUy0/2ZukIfbcZRli9xlPArxtCHt7Yfw
         6/KB+2NdkBdpIWMkpyXE7otI0UjuLnHBduYKSFVj9RLIjIiaMjIYgKIGuxSF6GgTN8MP
         lzy0MuR38SZE2kIUA/fO8ddKYjIfDFDxEoqnpiiG91lDtYC7fG+rGTGk6scnwjrvRAhK
         dQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820593; x=1785425393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZ7DrWSeI6duZxzkpJi6xcP41u69UUs7TUTlnDPTSiw=;
        b=jBfIB7PAK5Ny4QqWmnjKY5GyDPOSJqHbpGIguvOEPcwbASVIAUNDq/sl2Orj8+zVvg
         uNd2k+RBH/uTQ/8fJjf7npizul76XlOOgE4gmxK3WazZKh+mAZopSbDs812IbdruCkH6
         aIcyJqXuenS2XWEKGPxi8ygeoMkG2iUoJEqeVAmtUiAnBTEHmXUj0SmCDSvw5aIYPjAo
         vucInX7B2GFYFtEssnHls1xU243KjTfOqgUTQWstgLNRgRzecZVPOejbyIrt/dOYIQ8b
         fVSPk2sZKUdqKlOEFaLxUSC71gWfSwgbV4Rn2TrjE7D25cAd9WGuAbhXEFak+V43pBkh
         gKgA==
X-Forwarded-Encrypted: i=1; AHgh+RpkoBur2l4sQZ407XpGXlUh81PjaNLf+YgRuIyUG6rAe/RjsNj7vxqGfZGewdHn67uk1n10RAMSv5zl@vger.kernel.org
X-Gm-Message-State: AOJu0YxAveyX6il6xlP7APqNgCGxxuFQrIulMjhxacmS3hC8ioFclSR5
	oNb0etN5iE9JGidhi9xsVG7xFHb+brZmbA/UUO4FjOlP/jYeFLGKLLWcvPhnv1Vhf98=
X-Gm-Gg: AR+sD12kmlnDquiRKepRBvUmtXqE7aMvI13qcjYHABAXsuqHkfDTj7gQW3wvmwjkh0/
	RsUtIZAhgXKlF8IY7Pm9JGRE9vKR12SzKOq70mafq/FfefFH+CyPxsfz05BdtxxnJmgSYncUdkH
	OKRkWJ0pi5WJa9ZQM9c4Kb0mHWcR/Hsr21UxM0JwhDHmFKOb6DcKJ7TGzDA3KTL9B/hzZaBNoj9
	3u/TEPwlf4TjSUMVkyRo0zZte1c6wgetLW1AD49Ei9ozZRLZPq8bCFx8wW1NM+RDLMFzZuUCNCI
	x4vKVA4G6AtkWCgbjSUoYipPUDTtyu1MZJE/54SeFMKmrckE/GibhcKRs/ZI81GyC5qzRndfQKd
	opu8jK6KbU9TeRd22AQnf7g3d/NSC9CUxJOf0OZOIHIUs/ZUf1clHozJrVKZwhrIN/46kRYWWDG
	zF2Z2VEYsYn4k41sfOCAzxiVT700OigYidTxluI058LmYhmNlig6ArojjUM5cB+VMKMw==
X-Received: by 2002:a7b:c446:0:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-49573cc18bcmr28824395e9.2.1784820593118;
        Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 23 Jul 2026 16:29:46 +0100
Subject: [PATCH v2 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos850_sram-v2-1-c94968e52f42@linaro.org>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
In-Reply-To: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0

