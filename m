Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA884779B9
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153278; cv=none; b=LRoVAhzdIMwavRbuIoAmQRQAe+lqZ/iUsEVrfJCt3i5cicnaMqGdq5BC1IdiJfmpMzplThJ1dkm4cSk1wiQdVacc+hrZaUYGaqoQWlx0+cUo4f1LgKf4Go8tsfEu+1i2p99PuAobCI8M+97NJohKOsnd5Z9uHvnntABS2EbVd2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153278; c=relaxed/simple;
	bh=gGRs8PNvl8Xi/tUIg8+pD+wbWYIKM4YMN8DIqhxVxmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Res5Bg/OuIX6o0rn6u7KAs2fF4qDWP+6Rj3057k8J/IBTAWyGacjQ75DqBTbOS0JhUCb+UvpUrgRluOzEqfvXqvTFNArVSFp0OGw2LVH1rPvhyU0hYiHjhBMqNqMgwwx2P+1H7/29ihUxrryoNLoY3CQD+WqOL5THE0npSEzRrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0sUoFR6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0sUoFR6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d53197d8b5so11246025ad.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153275; x=1787758075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4p0M/MEu5nAOoTIIepmDuyjSd5dmIXE6lm7R/SDctT4=;
        b=N0sUoFR66sGylAFgSLXVGwyEJ0UH83NTRMp46/tToh+DFe9hRIxE/12XgHDm6COQJO
         5uRBtQdYiw7xNSWTDjHOC/3Ak1jfJGR7yRIGsMQjIW/TpC95I4L/xWqwEWKnX+q0aA72
         LrkMuqQY+MDfp8Zq7Eeda+btl3dPvtS2VviI8bjlguPrCW6M6TunrVn29giuIfhv8mUH
         QIdclDHjhXuZswK2YI5nG7Ks637B3CvNrNCPrNVqBbArsOCIA/nlrWXZ3nZVQzohY4L1
         Ba3O64Bm/g/gAxU2Tx8sIZKodD8x/6sl0cok42tb3d/9MCBXZpJuvSrxCYYPrxddDI2p
         R0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153275; x=1787758075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4p0M/MEu5nAOoTIIepmDuyjSd5dmIXE6lm7R/SDctT4=;
        b=JUYkb5Xv9hn+na4U3hJJCxidOwWk5nHoUkdVPceOaHN82uOBPn72nwDTz0yv/nEH6k
         OM31Fe3RyJhpaEmguS1Ls1f9OmBRHKKL+hB2unWsKdkwBWohoAVnKGDufUvhdcaObUgS
         Kp34HF86urs0X9c5ga64iA/FmLIEV5CX3BWldlkU1vRJeLSADpr++UL2KfJzMPIKYOIN
         JXakKvAWile0ecR+GZs/GVQRC/N4ABnRtndkKB4RH8mzvbnHyZgKrVP/i2mulMc4Q6JA
         8KQKSFnQkYya3aRWghAjMOTdB+EZaIgHxfv+7B2uR2OfrGSUZJaDEKjwZVF7VVK2ktz6
         DbMw==
X-Forwarded-Encrypted: i=1; AHgh+Rpd4dQBHfTfbnQaflHnKyJrM9GBs30C7YBRemEvO/FkfzxXkgqE6VADDgWD4td+3PrS3RgwnSj2+TuI@vger.kernel.org
X-Gm-Message-State: AFuF++nalT3bojhCtjOazb89POrY8wgwUytoaKFaV6xWnxgfBx0WM1M+
	u6Qu9yPMmyWmKdmASyLmGW+YOgOsTa3pV/jgyuI9IAv4exx54QMZUN95
X-Gm-Gg: AR+sD13x7mcTP3J25iLDsbCRW5/xDj0Q3Qlwu+CySqhrBtc5HeWv2YqTjwpqKUIo+qr
	f75XC4L2r0i/QVmjGKa7k8BuXdvFH8u2uJ4LvcbNNtoqgsH5Aaikf1Ee+UMJP6grMf+NJKm8iNp
	Dws0VJ4+vtl2/o2TqhTsGq+ffq+B1TtN/N2SA4nwLNpQHJEbYX6ET6mR68oysAq8j2CJogfDEBN
	8Yh7JsbLKT/PHzSpCwNecIWdFCXRZuAXp9jJzG5KdHVt3b8SWOWvKDLy4a4sjDNqU0ktJfBrSr1
	8Rr/vjNm2LFDMFrVwDjUEJPFqi0eiEslkykDZfogFlNs56l6wcJ3Gp7RMJ+0yz8bAcar3HUMLbn
	UssKE5LqYOfn5JV8IXl+2yt3I150z4F2gFFVZhuhBsJjDx3d9IjDXU26DRMZxHWjvNYdBNCtFux
	PujPvrRMCwPGh+lTNpVGPx0N2YToBDUNZUuZymEoVzAL0SQYA3tmPkYHagl1HEnvsrw11E/mijC
	TZuxlTlcBo=
X-Received: by 2002:a17:903:40c9:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d60197c4c5mr109473845ad.12.1787153274724;
        Wed, 19 Aug 2026 08:27:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:54 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Wed, 19 Aug 2026 15:25:39 +0000
Message-ID: <20260819152545.3934-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 24a49613c..c8f92de19 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -73,6 +73,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

