Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC1236E47A
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326946; cv=none; b=GRIgvItSY/t3o1ceCnWjHnxj6zRNnyl0Q/9jiIPiI1zUbEGwv7/FD6jvmXX+vUUCm8QbDDnBCNSAmK+7S3OdDfaS1r66egP7yhXEQ67lFClIcirTzTqvBrGB24OPnx9p9jfa08y9B+7GSuda3B5a+a3IMcuRmBVFJOrStYHfkrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326946; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyydMgkT4cwJJNaiKLqs+y/2VoJmLjiUPKw8ugqNlTTUy75MK8w8+AYs8MOdEOHFOkX7ghsK7BzSVia6Ryn+qHHApiMcj8qYUzPUBf9256eADL/wDm7S/SMWkBdE3qLQufVyHHiyR9kJo95d7zdUkXgv0Ga0drzVeaj1+a+YlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1tHq6Yv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1tHq6Yv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3811f512167so1388274a91.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326944; x=1787931744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=b1tHq6YvPwXtf5nW7b5uSWj9XO+kTtJ/2lNdtA54MYuJaDu+vqHIdmUCeJrTNxhWqk
         N/vfTXI3kLTGzd7nrDzKsDcgbpjfrVccjGAvh0JKGjYIshjzYh0xEQmmijwGeDzJooXC
         UioHgEj6kX3fPMAmH3XrSn6v7++LMIlcUs7SXzuKIj2UeWrRDiatF7spcn+CRjcWLIyy
         gF3M9IrGC1BHSaRU1uJc9mcUasZOLCLzxHENxeKO7zl3V+FjjTHRmANPWfhIhCmDlIyl
         iv3MCAk3Mqg3+/nqeKX+mrvq6k4lizwAYNYrmYRBo3fT48lmbuM6uVctTJACvYheTsBa
         ZNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326944; x=1787931744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=hgGv1KTHNIq0vzDGWXAuP9/igwYbCJKSt+zy31bBR22rIgCQgaJulX7asQoJVS9fgn
         rlUWT8nleA583GwcSYHrKXyMpFFSzO5wDXFn67qvY1J4U+vudKGC0cIzFs/mkzruYYwi
         LDRYyLqcQ/DGBYFw9KA11tcack+qR1u5CoznAQJON1XJL7v6ywN0o9ye3UqluAgwRbA7
         2RwSWhZIHSE/INl3i/iLqtdLr6PUPaGk3KTUzf9ATRgZgCFEWg8wUl+H51jzP3ku+roU
         eyEGBR7VwWKEs3GLXZKEbZZYSASK3AhSEA1TqUSZiMEAPQvJ6Pmj8rugTWhdLXfUxhlz
         oigQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9jh7EE8crtEtaDfsihoTDFhCl4ZTDrIUe8tmExPdSEUxDIpddhMkSDcMNiH70CdYK81gI2IpDVPYk@vger.kernel.org
X-Gm-Message-State: AFuF++m8LRKQfHo+BfemuU3EgNpTzY4NaEcFPQjbJ6iMPqQ4TRfuB02z
	rQXB/gZlTWCrVQVTm+JpwLHN8xHz7uQI9bmxvYWm9UrYhZ2msi6FkwOe
X-Gm-Gg: AR+sD13hZWq6A+DoJ46jUkZXjstml5pnL+zCThha4u/8aQXlcVhnrhgC3ZjA756RGil
	NDcbpn+XBFyclsSmvbdAVTn7dT4apbAiA0iNI2xQuEcJDfqnyqfeYk2yCXxh5WPE1dYRfdWCzS1
	pDw+k4Y7ok521l0l+yLQq8BxMHqPjEiVIN3c0chx0qD4Z391Zs1U9UHIJhVMxwSLB4sMxDwxAj5
	H01E45hjfvyoZtSaxelYGSDj/dK+Gqg+ok9OToKFNGT1pffWBlUj3T8zLaU7ej5GxooyoLEhObd
	Ueea+uS1G//n9wm4G8cxBeuFXyzdpEVm7xnas3AZVK+7ppn7ThxyxSETE8pGwKoEApkC+OUSvhY
	LJQ/cA9vtoZnUH4uFCXfbRKpiHlSuiYVb37Qj9ttikDGxoYCVM7P3csL0QFeaxGo1cuZZbcT1rV
	olpGbfEmJwaXWjzfR8GmaJHnYaQQtFSZNJZ2BhbQhmMuTG27r1jOLIEs/YNoQPa3WtesY2P8XVW
	Wbh0lOGFn2a
X-Received: by 2002:a17:90b:3142:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-395c35e27c2mr12635806a91.9.1787326944265;
        Fri, 21 Aug 2026 08:42:24 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:23 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v4 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Fri, 21 Aug 2026 15:40:26 +0000
Message-ID: <20260821154030.2514-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

