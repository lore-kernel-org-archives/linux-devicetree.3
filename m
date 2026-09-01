Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066F94772B1
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254724; cv=none; b=HUipn9rN26nkEchm90t6Nju4drsH2ruBadbyf9NaeyqNtqVv7c/zS3bCKQOd9vGa/ylcEDbxUjMSdT6aAJr1p/bJUJhCE28fKAeQRFCFNkuIc9vAflFcuqjK1hR4DjRE5UOGYLcCjVl9x3Ry+e1augjU6BBYwYksWYbc7uUpunM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254724; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plm9bAFH+myboVm5eFY0L97KaH4+0PXkVZJFkiCTvassZqWll7ZRPekY2HonT1Q3jwG5EMZIf067Hzd0jlUAE4Zy6MLr7kfn9X6+OIQzK5v1tN6550WCaDWeH9adchO46GhSNriJdn0jmZZ0eULvJc8aPML4KolETFEeyFdhJRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WV41PuuF; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV41PuuF"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so4081941a91.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254722; x=1788859522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=WV41PuuFeYsyXk1b9gDkCZvvept+NPgbGfwNq7vmNY5NUfB1IN1R+tqm2tEBO5v6bf
         g7UPol76z2GU/PrHhb2AOsLlkL5REtm2SRLQ4boZPKb7m0SzKVqKXo1gZrzGEXyx5KXk
         STdsSWDoGVa8AXP2sYfJDASS1XoRRtwQ19za3eorBsEs4IfErBXr5ZI4WTmydv/3n3yb
         bq42BUIy0UDroNqvQ/lqEUXwG8kjbgYi5nn2qxzeimac3mX4mYnUYuoshyxekABJCrlq
         u6YDkmeXKJibA8Hkv9466DRTAop3FtowvDn3J4uD9sqJNQspO6y57MlbKZosVQns5yR2
         /7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254722; x=1788859522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=NNgEa3Sd9u7QuH7j6N00q9LUxhspMazGnC1cUAWtLj6rmRwbwv1b/wJADL680yP+41
         gNceMR+GukeKPqB9K7dadbbbBmP4ujEMXY6QLzQkeW2zZE2syiRM5iRPaIYdOhw4yVD6
         S2aCzdz7B2c6punI2FvZk/SfJl2vscNEaV6IgYfUgHwOy8Y9bWCYRhzM/0ggXg5Jq2En
         9tk3tKxglETFLBXDSa93qKk5HM9//j1lCoT0/lSVfzWRTIj0fZcEcTJ4TnkFpoQWuZVw
         2ucjuSlwG9Q3w8ERF54rX9hBVCT2kgFel5/d7IT1Tl6GHmI6rtcO5awnt2qTsPEzqybk
         YXcA==
X-Forwarded-Encrypted: i=1; AKwUvBwa5M4x4H14oBXNo6cMHCGUh3eEuRiYjoGzOpWHhnRuueqYrCriO3TsYbzo76Q63Ao4ohzyMzxsnD2g@vger.kernel.org
X-Gm-Message-State: AFuF++kJBRBgYtGCc1600J52a/AkI3RABTZGoDNhAvu7yg8BFiWCE9/v
	oCPF0pygsd0K+tjivGtVI97f7LLVf8ecQw7qHN9kyUJe7euVkVyj1Mqp
X-Gm-Gg: AYBFou28uC9Ghv66bOvBj00erNtU4k1y4TeAYf0IjH5JaPO0Mag9MDzCHFfOYQGia7W
	/3X7YwM+WKgeAwQ9JWkVegXusc87Xgq1siahLH37BxrnbzDjPsWSdk2o8bz11u2wfvzsx1QpSqX
	TwNEp14w46KX+ziE85QWMXg4PoKNqR09A7aBoeClRx2Qf64+9jdp7F3Ed/nBOzRFHx2FuX1aTEI
	9lAHupUUtvFaee5iG1lreImwr4Wp7Hc3uyVX81V9bwUFpFIzHDYgDrjGGKtIDQHBon50p3uw9X9
	TqwdwHBpwCOd0JDxH9Am0MomXbc5hvH1ulWNouR+m/Kb1AtBrhocMuEC1+KrlSZ8p5uOTx9rNoJ
	YU5svFUGmmUQyI9CjXqZln1F8uSpkmRxyLaYorDecr3M6PjPSGXNJ9FBymiGi/n3eWTq+Os7Xe8
	hNdNgbBCD4cjAkhTdsE7ZAHxieRWS2JCRP/cZueAOm+UklxoPhjk3LgC8d9nVaJVwUBYDRPckkm
	KnHu2st/2uMB3FWMdxvKFM=
X-Received: by 2002:a17:90b:224a:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39907e0f9c1mr9051888a91.15.1788254722293;
        Tue, 01 Sep 2026 02:25:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:25:21 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 09:24:36 +0000
Message-ID: <20260901092447.3028-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

