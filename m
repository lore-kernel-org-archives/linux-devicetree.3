Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE33736C9D0
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326967; cv=none; b=OoCeTwO3zFWRpZ2Rny+NVOeJwiDsihrtYsBnngDTC2gdts9MUxpHPm0SCOaN97zoCE9oVu+J/9n88322TX4t7s/0gw56yGwCUlBaQg71AOgE0PPyRaDLudE0cvN1afzncsegJfy+P2UXnzX53DqEihrLVKj0Reofn8Izcy0k5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326967; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oN7yNyYoURnjhHQKyM3hrjC3heOkAEMty8gaoPdj6pX0cmy7fvvJxgAQZi3+06LmSd18tmfmVt58aRGnur7S885ekA7tMcRsBSqyEH13c6R4hgpbqd/l+Cja0CmVOCZ096jkLFuRD7dyGiJgdZACJGeB0mlGcdkMZepL0v3oqSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNs/3m3U; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNs/3m3U"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so946464a12.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326965; x=1787931765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=kNs/3m3U/hh6FK5lKOcRQHOU4uM7XhgCXIyqGeiW7LzdvC8da2/DKA26+u75/2DzI6
         Q+pKPKLbL71j/6+rkBdW73+fnRDfOFhVQeCGlWoNbHH4MwRfdRgmtFtOra3RzCJylGvy
         qT5rAkZ8KX0gde/8TLbAM0r3rKX+j/Q2eZ7row7pNOp1MlVMQIJM6L+OcP/Kixwu8Z16
         bZfYBUEsUWmQR2ZrhnI1eyCsuYwCw8XM0h2lbKq8/McZ7j36X4gDHcGNgm9A6utEAzbr
         horcuxjMwlNwr7QgifdDp6gTNNbuJdlenpoEc+73Z44aJTeC9Mlfwx1N2S99y8S9C3ze
         6wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326965; x=1787931765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ar9dBUcoSjv9eLjjSs1mhS5eJ/qKxlPnw1CiAGN99BbKy/Sq4KBtfO0NwUkslPuKiy
         zwImxyauIxcMw7nPrsLQlEdjhgDAW814UNghSJRuZY8nA4nNE+BQqvhquYuuShQ7sTpm
         bY8Ur+vd2npAe4V8CYU06SQCDAAncujAeHSkvpN2y6T76KX8z3dkW2WjwnOD92NR/qst
         oExr2bvj45JRHmcmd2iXDhGBvVTwZnXDiiBb7UCLwSyVmD9GmM5VPKMSf1CJu/f73MNE
         5t2b8IDC5+ECcv4ILIrlFLVGty8ezLq5lkyAHWwnGWBDUfCbD9IIkWOUh0HzaG+hLgMk
         78tw==
X-Forwarded-Encrypted: i=1; AHgh+RpGqgJ1F13Yo4nJpGiC681z5dDV5rp+T5+X0Aa6jUyJtp38D8hqPb7Y91lRIZRkRqDwGda1Dtr9bVAI@vger.kernel.org
X-Gm-Message-State: AFuF++kNg5xHBXLHbMD831gbojXpxhQlsSmYLgYUOB1AT57vij2vkVln
	nNXWpMB+pvfaMz8/mJ0/FRsu5l2igg6vmH2PGqmFpEX9EYOaaUoniKVn
X-Gm-Gg: AR+sD11XyJSzrLX5QSA4JAArMXra9MeApyc7QMJsL4J5qbJkrO9fv0s6tw8eSLhhfxn
	t2lFSv4Ho9EFa8PkAzfqL55QJdYQPIad/GDxv3NrdAz7M+RHXRG5Du06ygN1S+grpCYKPjLLGml
	JxhAeQrbpU4mK1TOOlKjpHM8ngVptt7cznsPmK84BlHKTIne3LRjY9Y8zX3Glf8OMh2EQSRy7xa
	4DTLu2YACjI+qfzFTD1HJ9qYOYl01tmmjg1ojnFg6uXqwQvIZT44YEoZJsMGRPxUHrt+Msfi6gx
	2GIOD2DHiPhoSmagI+Wjz5GIsiDZpNmi6u6+Je2vpdtCsUlwz6eQ8Q52mkaW3YpTqfJAotKDgmw
	22iL4XN0Mk4tIRwrmolzXtFlHl2myIIkq0Z0m+nFuwB8JPcFy6Yg3/cBq4Uq525wNO+/qpvo4YI
	/2vUg+1L0viW7dF7VXOmjYQNoTstKZ7+XYv3qb3R8FxCVcu8f3LLkpaEolLLA/p46boinhQi9mG
	nfkvbbmYD1/Aslz2muxYsg=
X-Received: by 2002:a05:6a21:4514:b0:3cc:9162:6bfe with SMTP id adf61e73a8af0-3cd302e127fmr14339879637.0.1787326964897;
        Fri, 21 Aug 2026 08:42:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:44 -0700 (PDT)
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
Subject: [PATCH v4 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Fri, 21 Aug 2026 15:40:28 +0000
Message-ID: <20260821154030.2514-12-sreeshankar0910@gmail.com>
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

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

