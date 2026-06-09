Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFAF33EAEC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014529; cv=none; b=M0FqntPrjDl5gIKrpdG+I6WOrBV9WuEEgkeUCuvcL3SlpPuk95mk9lrn3XvKVJYcdoTltk6a36TKi03M0XDEZNdFsf5LW0fxcw25VRl7fLWvq3ZyRSM5urdO1FhM+dcUOEQMFCdfCCxpyvSsKLE8edJiZu4drCxIt1GLcQfqwQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014529; c=relaxed/simple;
	bh=jGtdpE9UwjNX62OhSgQUXvi8hpltM7Py5hhv+eS3ZaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHhOqycCoclcqQA3gGENTdwK4bjLv8wi6Z3PhzF2qiN9p4F4gRtIPzaoOz899EiY2MtRa+vEp0w8WznH4hq7b4hP3GmndKAgGjoEQBLKHfcHx+IGIO999w7bxSzYmoO8WZLBUUqIAZFghv2DgPAcCcO/ZRNM/LLywIz6cSj9ME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oexFxqjs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oexFxqjs"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso63520005e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014527; x=1781619327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svkh8TTwOpP5Nz7RAVeXNEyn2CeMCjSVCIOtvFwRCYs=;
        b=oexFxqjsDP1oZULIvwZodHEJfP75K9rHjFar6ls5k4kxtdW/gIY2viNH6pjavFCefD
         JE+qaLyzfdVXePHEBOBXmAVZ4euMDwwMSvjQ4CqQNf6eD9ozvgoEC/9nccs7FGrTpLRb
         FErk8D/yCOJi0WXOYldFyoE32zNQ/SZHiiFGhuj18mUkV07dsqYpYkY/j8Do3MZcUmi3
         qNH8d10WITKPxiBD13qDZJ17lI47CFs/ZGxKFLkGD6TFpVRm+1cQUCQzxsglUaNeW+tD
         WHDxrE/0Kn01KbDoLhdJ2V4kIfVVRxyDUEufhPdFyj+AB7R6xFUn2ohaoP9vhTKpBLEz
         +nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014527; x=1781619327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Svkh8TTwOpP5Nz7RAVeXNEyn2CeMCjSVCIOtvFwRCYs=;
        b=h3r8GPreUsAq4CNnJkIiDX3WOpXYIjd3fHjSX6vVpoKO8iTP4o2Gtq9IHjxAQXh9Sl
         ReBHalZs7VBFuZgtY/DNsNLamU6T3nHKWSrf3EaJy4rq84EwuWvjPIuVjPEkDrv56yfo
         wRDHVxEhDrWomGXg7HRizOo8IDyeafPMVEynryN/y4VCA4OjRU1utl3u/UBYb+1v9iOP
         1wuXxSrpbdpvUpIUz06j748JDKFhOMESiSyQ7+1fBBEhyUy0Re5Qp3pMj8gGhKY2/eIv
         6qU6DHByM6ksPD1bZfym0OB/mr80hBUGtYkyQ8PHyu943fNuS5FWhGyB+wjrn52xVHCB
         9Gug==
X-Forwarded-Encrypted: i=1; AFNElJ+oJt2C/iI589d851DJUb+jNtjWJ6z42lOEHhDHM8kMCKf89+F8UkQ9nPx+iEIVOYUen0ng5BpT9cbf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Zc7pQaim5oKV3DifnhxGpB9Pp/OdI5x1eAYOGcWoy3KIWIn1
	EtVeoexEneD62XD8twdLYfXS3VegnwAVhpRChAKtHKGFVl1rVEmwl+Ss/gFxC4yNH/4=
X-Gm-Gg: Acq92OFti64pCiZTVRvUL+2D0RUWTX0vWV17veF7msxe+KlwuB+RA4jvl2YchQnRC0u
	EXVXEKjCHCgcfgD8NyYG2/mRoE6FR4p/6geU/FEDlo+1u/B4Z80W5oTjqrO2IAQw+ErVOTvwJGQ
	VdvvpZEzkIdg2iSj0exHry2xCjDtZ/5hdp0iIlCFaM6ZI8BBYzu1g1bwPb0hXi3kD0+tqsC/XDX
	qdDSZeI7Xk2eI/cWt7aB7ab61eMzuhV4uY4F1V+o0SfFBkkuHRuznTlboXP3WyVGWzFfEh8kNSI
	QX8Jz9A8uPrENLikOIzptra/eP97YbNMoBV1PVR6G8//vrJf7t7wzD4rtqo50t0qjeh9ogOuSck
	0ZsPY+ABRTdik8Prlu5T61zFtsoKkiVNbOUd+uU773ghWJEfywbHoQarRd9GeWoYXEMhRekM2EV
	4DFtIips/LLIx/C0RDnc7k9l3dyFDF+WUWolcCtWmzl71P60M=
X-Received: by 2002:a05:600c:1d27:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-490c25dd709mr356932685e9.21.1781014526601;
        Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:46 +0200
Subject: [PATCH 10/12] dt-bindings: clock: qcom,gcc-mdm9607: Add missing
 "clocks" property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and
"sleep_clk" clock source in the device tree. For some reason, this was
never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
dedicated schema, so we can just add it to the properties without any
additional conditionals.

Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-mdm9607.yaml        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index d7da30b0e7ee..ef4b274b5c09 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -25,8 +25,20 @@ properties:
     enum:
       - qcom,gcc-mdm9607
 
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+
 required:
   - compatible
+  - clocks
+  - clock-names
   - '#power-domain-cells'
 
 unevaluatedProperties: false
@@ -39,5 +51,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      clocks = <&xo_board>, <&sleep_clk>;
+      clock-names = "xo", "sleep_clk";
     };
 ...

-- 
2.54.0

