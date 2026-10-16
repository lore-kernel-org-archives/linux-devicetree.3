Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C1D382383
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124867; cv=none; b=C0YPf9PiY0sO1MZLUovkn4GURxt+VjFPe2frPq6Q/XMTA4uI4vqBXsSP2klpigFMZoCMamcxJA9zexs0x0e9tHnww///RST6G1tWJXcjwLKcDRnuOgAbyyj42+bS+46TLXcp7bvsF/XJ7NLoviAM6sMPFAiYsz3e/I0iK0g9tRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124867; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rt/L3t6a/j7A+sGb6vQXQ0rmn5UsstI4CC3vQnkc1KPBjjo/RT/mLjHQsitqf2a4vEAaiBDQkdzKMk4mxlpJOF9dCLVqAA0hvzEimi6gYquO76FWoCqtGWUObTpNHW/cG1jbOzkGETcD9Dc7BxIQQruYRGIkdoLULTlmcRT78R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qE9XFzBl; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qE9XFzBl"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35ef6b49813so3359093eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124865; x=1792729665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=qE9XFzBl9jyqW0qjMgcap3bqgVdBXPoEBrfDfWilfmV5PorLJ3FWrq/VqezFhGqBPD
         QUSXPOAhyETm2SawYS+NmOpbg7H7FiEyQ2YhE4toQyxzuYLIKSxdWx9ylCvQ8bhWckOt
         RqHUbrCpcc4UKTbbJEAU+/ix3JZDcxlSzKd97QoVeFCWG7W6EHBP7C+W8t8G5dbSDWh4
         g9G9KbWaFaqQKf6CqeTrPBlI7UhqoV4ZPJtGV5TeXWDTAzLLe6QR2Ab1V4My+Zqo9vmT
         Umxn4d0sz4+ebloIx8y8XD67YjuNGL4USKsC3lamrvzwe6gpCtueeTV0TfbaVhpC5W8B
         YstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124865; x=1792729665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=h23ZdWDjBdLeYfXEnR9pHeu2HhNY0bhLVWc/97QbFPuB1TIdLY6ZkUCbxRwNZlfYsb
         2wJDEksuMZc9w6ernhz+xbo2PdfFD9V50jsYNXmSQr8EcN2St3LrBUsFk6v80CLRU0UG
         YYYGh6Zp5NkJltZC/2l7tmsaEEes9oYLItXlirOst7u0T9OYIOlgiGtSBNNVg8kKcdEB
         8ekZDH3d61RiokwhkKEoDe8SjWJd+VtzykFMiYJvxw+SicuWmMv5KaeltqpOgsuOafG5
         hxCFNZUlYa1hYDYbN0xx9hBEeZog25NnnRlIz+I3GLUevH5nKhJXcZrRRSJhvhlK676G
         jkVA==
X-Forwarded-Encrypted: i=1; AKwUvBzO2LulzYACxHFDUkSbPpNJ2PwaajIyx+uxwilWOo5jTZ2q+seLKEmB5FVZXpnGtClyP5nSmowmHvRp@vger.kernel.org
X-Gm-Message-State: AFq9FYK4KGNnjvDsrDBIp5V6nBYIdLGZ93KLY5jD9aZ/KN3TRHCXM2BG
	uME2WYimr4xtGTbaIMwlZr+9eCugNk8gvvYxrIAnrWDsQ/gB+I7FDAn0
X-Gm-Gg: AYBFou0oRm86L8s+SuIvD4/OHgkbE3HO8VPi+4g6CLDr4CMk0HMDjNJ/qwlKU9C3Ox/
	j92dn53SL/19P3MKTV7aQNVFqlcx1LWue3SJ7q0CW+K7Q4Cxg1l7UrZV7if16FVjGkccr/o5oT5
	yKaYQC/0HjZXiQPXIaTjThwNx8vwdD6xrena3JMtCQLfOgOWbXVW9yk1tvxoRSlR8cRwDlXNKKt
	CUxFWbLKxcHQN+NnrGOJ2dQBAmKxf7mgsAeIvjBlmOfM00GesTWBxqX5H4UMaUEXZC7R1Z5oT1t
	IozoLNtdoqeF0Xmih1URgOT3EH3B5wvL1Q5Ay6U4IMkjVuqmfZnkjVExn3VHtTeewCgDJyZfddN
	NfNIx2MwAK1+X/WzYew06DBrnYm5gWFNuoqiE0rYSXyu3W3zb5QxHMhTi6b0u8bDunIU9DAOO0w
	02v7wHgmmwkiZERHCO0nxD8/wdAzuT+3OzzASVjtqumhcySlvPeHhLpi+mY6VPd4kh0rlekU+ne
	rpUrTjxPAdPVl7eI2GjogjMAsPmLmBrXQehh+/4984jtsZ6rverGQ==
X-Received: by 2002:a05:7022:ea56:20b0:17f:7280:134b with SMTP id a92af1059eb24-17f72801559mr6984891c88.30.1792124864684;
        Thu, 15 Oct 2026 21:27:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm2644712c88.16.2026.10.15.21.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:27:44 -0700 (PDT)
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
	konradybcio@kernel.org
Cc: danila@mainlining.org,
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
Subject: [PATCH v11 3/5] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Fri, 16 Oct 2026 04:24:30 +0000
Message-ID: <20261016042432.824-4-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
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

