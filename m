Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29339E6FD
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350185; cv=none; b=m71Wr5Tp4yKcIDt+KjMhM9RrXSZfidk03FklqOFhWAQHCi8pLmpg+/czrhftglM+gVwEjQbR/PUnZqgXepGTGClJdpwjbSE6T2KEZkEVLNdw4zdu5ogv4Ic2ctILeomR8qssD20lD0TvU9N4BvZ3aDwsGFyyCWP5S4bwBXXmlMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350185; c=relaxed/simple;
	bh=frWnPQsAsHwq1WTd/9q6n1j47PwQpCWFOmdGfvwQGoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSrwJerCJ53ExEV7l2veoviTcX9e4jKa/KS+0F1gZbLiBVLIHKE4qW7kVL5zDWX6AAhpYmvRDuw07WMINHUCfJjOE4rf4q1THmOoe/WywHgLky/BpUA3v+jAmNVWZWDruazS+VqT3Nd68hCULA7FdptEbD/lL1Xqx7mtp6bgAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nvg67DBg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nvg67DBg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b7612475so29448125e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350182; x=1783954982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoayvTOy8B3Va9ZlXEOzucZkBIfqtEfrLl72tyzTD0I=;
        b=Nvg67DBg0VBXDZdVtcyWMSgMLnu2kznbdi4AQHqIr3ZXes/Vbg4JWWgS9RKjR5fhuB
         L18M1dr8hbNH4FGCnIOJktYmgv7fn+nEjWWSUnkgD8k87OjlnSeLOEnIyFMXkQEWp5wK
         /pCcfn6MTVzsGel5hhgcEouQQUgdxDQpwbqAYp4rnBZny5Z77mydJ6Gl6PN9AGaFWKkB
         +hhxhbi1OG9ZzVDoP6oYbBVqYDeuo4jcWqoKS85u3rl0QvKau30ERcskx1JkV60xEPZV
         v1JSTvP5cBYeCmhUbAnNd2HZJlPY9NufyiS5pxE5zJN97r5GZUlRU7k94fsEJA2pUmCI
         rnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350182; x=1783954982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LoayvTOy8B3Va9ZlXEOzucZkBIfqtEfrLl72tyzTD0I=;
        b=U55xEbsfFDCRXLJSbxz1Mk6XfYJTQsIKs1KNGzn3T3YvV0znf3rJ8JD/3zc8LAAjgU
         RHROlz2OyblEsWqc0JHz1lCABbUL7OUXk2+DxuDRuvoWv2zid5EW3ywy5kbvfUzrnBWm
         /vyjCe+2lldcidHoVpmUiaMgcdtQTHCIW5OhBG0ZYuwH4bRhrLQEJC/FaXYmJo8YAjE2
         mngu+2EkEcQTP/N5qpXQ9tQ9x3+SJWVGrXNSGG9VH9NYqXc7w2Z1mmL5Smmf6xJUT+nN
         dS3uoNhgQKvz0KHF8fzIq54fr3/u4icK7SMUdzXKGxyW8xz1aYn0quJ37IAPK2y//QDn
         xQbg==
X-Forwarded-Encrypted: i=1; AHgh+RoZBKTyYsB/565Nu2ZErA8dWnmu8nW+zDODqW870hVS6rvUno38CG+41CUrwpzIN6w7yKwLsgLKEalk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7d9MWKSBut4WdEeXXi9mI1TBYPs+eZO8hyPbvfr4wl8JdMAeg
	7jLWcHu9pcr+hlttlrtxgzzord8mn+HU5xmGYnXy5ly4HzR/dRLYuXqXi/UtVzCvQEg=
X-Gm-Gg: AfdE7ckibkMjhr6fijlTaP5w/DelMg/Wd9UacusyXEoT00Od4IdzuM+rIhNDuaR0K9y
	YB59716Du/1Tej3yNW8Lcxm/E+jVJ6kvgrsoNUpL8jZtZWM55SD8sMMtQ9OBFvIc2FaZ/RHffPj
	/pLof8enImHpqBbARvXs5RtH0Cbz4Qu8bFEjaqyE6xzNAaYQlJNrpCkc/iyG3jB29jlkODfHixd
	SmciSViNk3SlgBjleNmeu7uUiZZG3lTzE7Y2mXKrVCro+HcsgSNtlO8NS0BJyBR6BWUV2f4WWiR
	CxxNPEikYv8inbHVUg8IB64Z7YsIVJZjuuYLTwK1lZ/uEl3keDLLKXeEgVVSEgbQGaVKcjEhmQB
	u0Q755GdIiuG4QaxMsK5CQcUCP4SJpNABDjZOyZSkleWSy0/W+hX0Mz1cokRQIXAHswUDw8eOWi
	1U06gsJkWsMW1PJSEdUchtoMB7sFWteoM1a/6c
X-Received: by 2002:a05:600c:4a21:b0:492:63c3:8eeb with SMTP id 5b1f17b1804b1-493df09b53amr7429595e9.35.1783350181202;
        Mon, 06 Jul 2026 08:03:01 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:00 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:16 +0200
Subject: [PATCH v2 09/12] dt-bindings: clock: qcom: gcc-mdm9607: Drop
 SYSTEM_NOC_BFDCD_CLK_SRC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-9-745565101869@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not exist in the hardware, it has no consumers and
reading/writing to the registers fails. Drop it from the bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 include/dt-bindings/clock/qcom,gcc-mdm9607.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9607.h b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
index 357a680a40da..246bce28137e 100644
--- a/include/dt-bindings/clock/qcom,gcc-mdm9607.h
+++ b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -13,7 +13,6 @@
 #define GPLL2							4
 #define GPLL2_EARLY						5
 #define PCNOC_BFDCD_CLK_SRC				6
-#define SYSTEM_NOC_BFDCD_CLK_SRC		7
 #define GCC_SMMU_CFG_CLK				8
 #define APSS_AHB_CLK_SRC				9
 #define GCC_QDSS_DAP_CLK				10

-- 
2.54.0

