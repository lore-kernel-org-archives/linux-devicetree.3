Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384E0369990
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583756; cv=none; b=bQV8Fc4JxCO/GXlcxzlpbD4MdN1QBxHSOukCjnytw7DJL1O+fNzj4S0+jBT1pyZxaEMqxyBcpfBCboB5Tvpdh/e7fljlPUtlaWdRZ+8w97JgC3huaXDveZoENRB7bh234Fr9nkzkiEsMHWGVYVoCq84cunT3dGLpnR0sLAHQX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583756; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgAU3/CfiQ7M6epcT5bbFLYjukhpBmygwMZX7A6R247tPE/nLuhk/wyaGcaK92cLK32Pd3sjMOPU6F5aMgeDrvRWk58In49dpvqINMTHJCIcAbxfs1fye3coZ5X7yf/29Vk6Mh35yffdySt8jzIht5ZokAumZBz2DwrWBMj2pZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGFEB0Im; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGFEB0Im"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-395ea741d07so1480945a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583752; x=1788188552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=sGFEB0ImFn6eCf4biIshmumdhAXhU8PeRpGBdOgr1yq5wOau0nfXFQQP5vJgI6qNCY
         rWHKP3At/VCAXDitIjCmQcNzAsdMhvJvqJbtVt/08p540i6sJAuePrMDJJy7EC2jOTNd
         oFXkbHtbrVAmNM80+zAiz+Qd1RHda0YPyyYnRCtUEDkQbrldFHgisjtPFknfmpQb1lwp
         px2dQ26mFWqXO22CiYISor810tyXsDUw9Ldhp1aqNUfxARVC8Dk8ASev5f5yfqeOp/9T
         irW089K0d444jtVGmodWMwSlYRiPWwD14GT9Kcs25MXEqGlQ7T6f9YqkEQKugNVVB65u
         kITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583752; x=1788188552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=gwgWI2C5csFCQA5wAf90lPvH9xBJ5Kz/QwdDFwa/bIHyz9iY+xpGLFwYEanmVZU9Dc
         9GoCYNPT7IWa6QOjFeyvG3QhYDyj0Ht0y/LLWmgFQGi9P1hci7W7bY+DsrJYi1gXnL35
         DmZOjSFkK1CaHxcRw8y0oBbjYZ45YQeKFTH1aSu9uNgT2eWD9sSUneyjSCOW88CiVuAs
         RmwR3EuMmrfgXEJbYxy3L09rcI3M+IWobAuUyurXJYTd15FDPiOdcP2TBAuvmN/twvuN
         WPSBawQMEgaXkIcLCFHsCKMBmyi8Y2zCOjClPXbFkXdZfxPykCtWN5VyPPun8p+wwZ+4
         JFgA==
X-Forwarded-Encrypted: i=1; AHgh+RreGVeWsmZ7OOq9mdRIOgQPQ6cDpxmhfrhg+DbXKx3JkgVqMsXrZAMjpjSm3vusaQuyzrhnKTqcvo/Q@vger.kernel.org
X-Gm-Message-State: AFuF++ndMuKixRTr4oj67Id0rEivKp+pUSxdkNdXLatG7Q69DLj2WnwB
	frCX0y4XONrIY+98Sy9HalPx8KSSMrC5PHgBuoMuU6axsQcry7bWQhJi
X-Gm-Gg: AR+sD11ziyXF4fTPYOgdWbqXhVKazMBXqieQYPoevfpCnMqfZ+a3nrpYu76zU8MDolu
	jIExhmmRb1teCbGFRa8YxS8Qi/KOBX/o4ArR/dDBvxpCTgoH7OnZ8gW4W3bxnBKOoOt6O9mJzMU
	7I68Aql7956Id+S+LsaVw7zxWeyNGB1/4HhOMiPxou0hOsdBMWMbKRZVkNiWR1O99iN52SbO6m+
	PSAje/3vBX52F1psxyVlAeOwDuKxvQCxxkRDKI5yAMv9c1Dcvq/L3yTnMFXD8z9BLvGtxvQmyNS
	PFWtlnMAWWGVjO67YUeenkeRL9UC1frMwvY+M26TX0TDrJHCwdYbyXOFo+6zM6PAOshrAlilN7M
	z3Rc/aUgq1e0h9ScB0qax5c45CLF3cwxe/kErEz9iDVbw8HQGLOOHimaRaLj8luD4YdB0tTV8xQ
	yW1lrnyX/XngajchUobQOu2lvrHqlmZYHUBy+Yh7N6JeMau7BpUtYmhC8Ee3lQ6sohjY9Ej+Jzx
	GxP8uZMWVyh
X-Received: by 2002:a17:90b:3945:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-395c37199b7mr51357783a91.15.1787583751929;
        Mon, 24 Aug 2026 08:02:31 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:02:30 -0700 (PDT)
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
	taniya.das@oss.qualcomm.com,
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Mon, 24 Aug 2026 15:01:44 +0000
Message-ID: <20260824150156.1310-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
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

