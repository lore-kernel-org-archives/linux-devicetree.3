Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D23D7A18
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246468; cv=none; b=owiMRF/+FtT2m7MRfRZJjJwdMo0h++cYnLxp5gL2DbfCL2TiRyO8sVmXf9aA8/JYMLHopduJ3XaiCQa39UltVSKhGYbRAc2sipQYkPDBat9+4MyggmDO0VB6F62Y5OQoNvHctEEsZbBxP63V0iTBmBPOKG5OiXijU70vqy9pugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246468; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaEVOZ3zPGzR4JPE1s0OGH5o94Lo8+TTc8c+gmuIxfhqvrkCuNOIIIWYdqqumFFijtXBJFkS78ipuHRuYi9gAOLKfbu3qHU2OU8uhOBFIeI+B4d8ZOy/IaFESjVxYuvfMJTWigfzkn97fIqufhiudH42xlbeSxxkTHrSu1x9b/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb00GfeS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb00GfeS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so627837a91.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246463; x=1788851263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=gb00GfeSlSTVxcbk7DATppkpH7mC230XrpG+2I5v1dSPdan/uOCo66qE1+d/ASGHei
         dfr/yBlAZ/Jb4CMNZUhlg9BdfAxHQyOpBv33fR6oLnf9BizdrZJeRRC4L39uQDRqKdnp
         eriRRaSxJHRGPNH7SSvHjVVyuUzTqEXFLBuJu2nVZC95LjqAwXhwE6uajI9Yd7svt8dB
         qPOZub54W/v2VxyoyS1SecH3dnsel9QS6jtvh4Sc0cAwBWR+8xwwrlcpJb65aZBV7LTS
         UWvSmOyAC/3kLuaMgQJubCQgGn+7lpjc6jVNLB84nmaNCryRpr8MD+eK9K+lFbFomLvK
         XeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246463; x=1788851263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=hM6sZfmRwWoUSB5RiqA2teOeTjwoJzx/W0Wh0/2Kcc4nvGozEU+/jm3oJYFsP0qzay
         nsPZqQkWgMTGFIu7iFoqpR+MsQkc1FULeNGxIFNFHy7nm0A1b4WR3puRmPIH4q+BFqjF
         SMYN0GL+HlIa2BZmgxt7kO8ylHIxSLwWexn2QblwvqLVdnYGZQ/1BYHRoyt/LwjIbqTL
         CgKlPYWogM6LU/UJ/Tut1cKOYXh0nwLQsuWlQ7QZVk5s5atEnAldasFpDbyEH2Ggo3ip
         oIhdp5+mPHuKQvpBRpYl1+WaCuAYYDwMO6xGBr8qcroUfjJo28PKLwbMIUORtBv6O23f
         4M3w==
X-Forwarded-Encrypted: i=1; AKwUvBzDvS0wdK5fbavIRzqWzAEHAWmpqhaRDU+9LRwo/k0AD7/Kd0pWz0IU+NVERJsbNR7LxG+CrlRmfjLv@vger.kernel.org
X-Gm-Message-State: AFuF++mRjWBjavo93jzUXxHy+GSxTkrlshKN/BvMUfY630LMBG/KiXiN
	hp9S5mn2pOmQx+1ijqlMV2Zt8N4kV5ghtiYnan0ymA9XweOUa3IHr/SQ
X-Gm-Gg: AYBFou3fP1vUxFlZ82D1Al/YH+MENjsSIcnkEsv5oE8Ff0uxMBVe7a+hU/0GbYHh5NM
	quwRwJAr+2aeCbbpgkONWEEvnnrfGhnYBYZGFKWGprkK+NkqDuZREm1gSLpW/PwCSHOWqhXXg5Z
	ohgTBCqFHeJkaKLMsmWTppjBV5tcszIM2Srf/TO9SPiFZw08Sif5NY/Pk1ObcOeugk/BP/Z3BWr
	82j0XEpTOvnWU9yExe5lcGEStyX6O14xWDjrmWQ54RLSSyfZJqBSndiaku89wKy+KNH32UDzCob
	wJGs8yCGB0E4O8LXiQRXzSh95fzD3PU9ePomi3aXMrCzuC8dLhrABwoMaQimjughESbRZ/cIGkA
	fiyeirp+w4lxX4vivXO0iO9+F/+/8l9ApBm8+Gbfr7chFsVE8M9qRugnvFFrZB4koNrN6EloGow
	e0PdmvXgdyAB5ier56cKT8AY1iu+Nf1BXW3zyWEWPwFq7GmzFdpIEkpUfSdeHWC3HFYCNtevIae
	4knEAGoXZ1i
X-Received: by 2002:a17:90b:582e:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-3989be9acb8mr32700156a91.19.1788246463258;
        Tue, 01 Sep 2026 00:07:43 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:42 -0700 (PDT)
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
Subject: [PATCH v8 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 07:07:06 +0000
Message-ID: <20260901070717.20513-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
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

