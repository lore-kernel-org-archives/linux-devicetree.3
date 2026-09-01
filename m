Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E798D47D478
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254807; cv=none; b=cV63eUV5G/rrVQd22iVbcW+EHIcuadvzTG5U+v+mFjfq7wgzP+pH0vg9pvllLH+fGT1DW16m3aSYD6AfJmJbtTbpqKcNzyFPM0sl06d5jFEhfYH2fUpgLP6XKkMnwU+uR+scjmo+MPiSYLvaARQlU+Xmn+PKP8GvqAOIZL/x0ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254807; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvxGdDizlqcOMIP8wAFOslXcfx0h1QVh5QYDzfHbvvj6lj5IM2CWsX2tUdpohDZk6KfjqOAdbaYBrpOqbBVKi13o0FvJrPLNVckDUOcDjEIh+6KyzHbMaG32csT7+8isYqB9vgR2gk23A+p8tEHNYx8XXaEqw+pgY22jdxY1BG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzTeYvDB; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzTeYvDB"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so601344a12.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254803; x=1788859603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=GzTeYvDBKgXDqnAI/yVJ+M3Wxav2Ar/x9LKCOas+qBwun97d7j0uMttwbnBTjcfqBU
         6r+CFazRkXovZ4xkohMOQ9bLhqLp8p6FLyXVX7ZhXDV7rPCvof/g6cTzuuzeu+mFJzxr
         ZZr5RO/qm+3GetnaQcTCcCJQ5AcgJr55rPFmBPUb7dKzcfI6KIPtmqbuIszBNV35GoTE
         RC4RcYpX0GFy3wr6tAjdZ2cuRJspNscgWvkelcN/ABlRXAS/R/AWIcYMoplcTXKNEiqL
         2uL7iSgmFshXFi4IJgyjSif0q6bRC+WLWCRLiFZdanL6vh7dj6IOUlLyUP3+Yd/02cDi
         pHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254803; x=1788859603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=nRMyhcI6tiZgEK8cAOZ/I+DXTLmr3nBWdxv6ChWWei61Q6upOb4fcl4GiZBmHdGTcE
         4Ctwd5ow0sRE+7GGCDEBIaZ2IJH7xvEkir+OEPyM9DYBV7oKeJJxX5y1jEUXCORMrX+8
         Ssj4PXTbQd3qC8HAgiuih4WTG70tfRAX/HeqHgfmgLMxlTovnX7zztPue7pAaFhjCqMx
         3sE70TAzbXZkO1AbfX+iWpqe/4d7ANjBWLheWCTlwYiWUS8wTthKvR05lJJ8Kb1k8J/l
         xPoFDt0dmJQSEuwmAV0CbFRnnJmO/Oes6pP4yk193XFZDJPK+5nM4aaAZFiqznHbd9KS
         f8Qg==
X-Forwarded-Encrypted: i=1; AKwUvBxG0Cmn/nyyycY0jP+6jCub7ja3kmML13aV1VrTk/7DqJCxVgHbBvpGhhPQiQMMjntQ0mjBLu1pQqQL@vger.kernel.org
X-Gm-Message-State: AFuF++kRe8af/k6yhoo+PKSGtst5TBlgODS+gXXe7V6EWbqnY53oYcHE
	DwtTw23tQSCYqjGL2hoB9pefLE3zdWzHDR7Ptl5AWYZbYq6IPvkNyY62
X-Gm-Gg: AYBFou2vDMHfU3Lno2rAwERhNMUV9Y594/VbS9h6Qj79XErmvkqEhjMPFVwHG9wKTiT
	vyuOSyMDO/u2ijNtW0zqfFoewGHw8/QT/fcC+FILFq5PeCahIG+5DnQK+e7mmD94NNeSlGtJIxs
	VUOAdkEMEvpDUjj5JGkxCguWYr70+1VsWQdsggXawzEuFQucCOwVfl4NypjUcJaYrGtTszKtCO8
	5KsbSzOboPuRvvdppjrVnsuroV6cP8T6hmJlnLFxL5JhbBSCh9TG1M7B3b9eoVk5YtI63Ob07NS
	qoGJX5fwR/s/O4ktFkeinmGkTEIIHjO1Ii7jG8FJ3KYrt9VmO9l56vWBtOV4yGlHAgq9rJJaffj
	jjGidKa4nT7xVIDCaGpqFL1vHfL2RCFaEnbxJ+MMCPBJGtnXxhDuk1qklxOBnWPLe9Z3QzkyDQc
	66Hn/UU9Zq4kztyhIaelQElsj5ejhQl60xUP7pGSRCIR5u6swScYfJsWFWD6CfefqexLzcniu69
	9WSxGH33tfn
X-Received: by 2002:a17:90b:380b:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-396d0f2391cmr45758593a91.7.1788254802943;
        Tue, 01 Sep 2026 02:26:42 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:42 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 09/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue,  1 Sep 2026 09:24:44 +0000
Message-ID: <20260901092447.3028-10-sreeshankar0910@gmail.com>
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

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

