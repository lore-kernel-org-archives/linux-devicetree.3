Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0039769E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350187; cv=none; b=XAk2c0NqI67S/LBskz1QtXzWrMVS7JeUI+U7pSwAuzSaAu6w6wQb6F6b+0oyfNGO70FOSo1GwaZdDFJBp/KAzO7yeLmui+c1YeO0cxRGdTZagM15gI5BfmMuSd45UKIycZcmk+MAECxpB5v5D2jCK3zlp7ufrOeGg/FZuZn9spI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350187; c=relaxed/simple;
	bh=tGUpztyp0tohTKWZjC215EyWB5KJSdZpfq0WVjwZLFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2J5U1B4UVkbS/vdc1quARSqIoEduieuMG0mA0rXlnucKNYTa1NiLXZVOmuZjdftWqn8c8mSM91wPL2sC/GVGD5q0k279ln+SVfduAb0DY0WRhI8DzFh8CbOJviRRmBDl3pdwuZOFT1mSVQpmVGnGm1i0SLlLt2gAxy6fhWiLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9+9NZIv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9+9NZIv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b779003fso15769585e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350184; x=1783954984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDGBVdju2nTTsocBvnoqIfFjlYoXwPS22bQg2+7uzyg=;
        b=q9+9NZIvawAYWbM/Kr/ZMIPWSkOldZgmBQu9AbW2wJsMsCpnmNR481L6otEkDvxMc/
         if1HVwCRWHfp9lB66n5L7W2oSgEq/+GfYENT9/+qs7ObwSJHELQdcSnQZDzsMdKKe0av
         JssmJ0xIVkQU+t14NX6iUtD3p5oZCdWKybgP52tMZZLba6E0RuSbkjAahzI7e8TEbTLl
         bhLR1F0m6sFpShpGzqI3NMrQNSwrXOU06ZGyDHRVqzJXTyylOu3CJrP3QSObmEGkwVl4
         fotPUdL7Su4nyPgavTzKu5h1E9ZP0vXoEwmI2cxvAygvhePUUESWqX+sQEQ7N4lFbpV3
         3sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350184; x=1783954984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDGBVdju2nTTsocBvnoqIfFjlYoXwPS22bQg2+7uzyg=;
        b=SGy6SH0Cu78x/xLIyiuB7mkP9OuHPnhqK8RnBEV7FZnMefxjiID/yPTsd0LzvabOsX
         kTSJoFxRy8qZNFbEZnlJG1+XV5VYmqGShn4KPXEMRRzUlZHzBHqeDwoTfTDgmoGbGShv
         O0wP43k/rvyu5wyxh/Og/AsahMYh5+N8SKLm7K6zlKLdQqEf2SLi7lyjsO+mHLgy0ru9
         6L2Tgxu+BIoT1OuJJbMr+ZFtmP/8AXbcLKo6X0gk3vviSNA3N2MtI4AmPaPqoPOv9QGW
         ZNoDSv+bJp16CCciiuOppTkoZ8bF315zOP55o7d/PQx3zPItvo4WhJ5RdNhWysM0Kei3
         DxMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyldjXbaVhSIEAcmHd13ozTokhKeB4jiwDVOaNTZzVLmXH5Mdn993xamEQasHB5O4Xnk+UIwHW0L5J@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAOXIet+2O7AMJGz+wlQg45acP5yJLofvCLyGDAFzLJOpYj1s
	2VyFWRu5NzpTDudXhWeqsipX1Xefc8BeXDVreveoHBP41NmeczXfyUJiULYvSpeuMjo=
X-Gm-Gg: AfdE7cnOiw+xxe8S7Aj6cAF4TcYo4pU9IbnrilDM5TuODbhdhoEfAp0IApfbEeYZdL4
	fomNcm4UiwE/RQqv4RfNbP1IuAp4xlaW9wBjdJDc5GwQWF9cnUx5cjjnifxbnSIpBgPGRBVOwHp
	vcDtciINekrkI1Mdac9sBEk0+sCVAqFgOA+MZBF55oSakxMv0MSYr/EMyMWWUm/rFIi3su25Unn
	b2l/vv7hYhvkbrMooaJqe7RtkXbiGzjeT9Kvv8ZKBrQ7zU5UobGPToeD75oJ+u7+ohXRewaaA7B
	Scm6WxvmK3s8UA1iQk+AKMS5ypkTEZXyqNIypogbDjFiTyG7TOvrh7scpAgHT+DSn5/Ta1TKAFs
	Lp7eax9kjJw1h+vLmZDEfDMniDW6/Mh9LBCuy+oWCITxz+I6swdlh6jm5BRo6jrhtVXiIBIwbeR
	anN9DdYxqNDbz9XoExxyYLcCjk2WO/lNBX1TZX
X-Received: by 2002:a05:600c:46c8:b0:493:c3cb:409e with SMTP id 5b1f17b1804b1-493df0405a2mr10905835e9.15.1783350183567;
        Mon, 06 Jul 2026 08:03:03 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:03 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:18 +0200
Subject: [PATCH v2 11/12] dt-bindings: clock: qcom: gcc-mdm9607: Use proper
 address in example
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-11-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
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
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
well use the correct memory addresses in the example. This does not
affect the validation itself, but will reduce confusion for readers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index ef4b274b5c09..1b0efb1526a6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -45,9 +45,9 @@ unevaluatedProperties: false
 
 examples:
   - |
-    clock-controller@900000 {
+    clock-controller@1800000 {
       compatible = "qcom,gcc-mdm9607";
-      reg = <0x900000 0x4000>;
+      reg = <0x01800000 0x80000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

