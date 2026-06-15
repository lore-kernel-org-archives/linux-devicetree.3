Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64B140FDB9
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542145; cv=none; b=LPm0WBHuWhsYDm16d5KdBp5PjC86AwvoEs6K6D7kFUNRoIRllHSbkE+IQqnuNXjg/n0dQ2u4Iqp/tFgZMLovP5SkJI/GUjSkv+8e8P+SprLSWRdwTcUZJaZWWnw6+dN8m/2DfIPruW/EpLm/So/BY6ITPkoMlH3p93SIwOX74YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542145; c=relaxed/simple;
	bh=BlJOCMxVLaAOmzm9jG6rG810V5HTRlTC4PbDQe+T4+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvU9AZgH7Sm28MUKdpOv+Y2mESCHAWMGXlJcfPatEmY5CV6YWz1iSAXooj0li8wORAHfprkJS9+o+sBzq05MmLT12qRRlVfW5Pvkn+q1a+BuQ2VvnN7JCW/WGTR09FhP6V0cpPRXcb+ez+JNb9B8OeMXzrfiQac3YQ3FNeZMmzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zWDXwbHF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWDXwbHF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so28288255e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542142; x=1782146942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njyoUc9o+UR/jRlgGA5KJrg3KkVr3WPKZv815VQwNJk=;
        b=zWDXwbHFS+ODO37Qv1+8B1MOlshqHW8nvJo5L6nRw8wDoZ0jwYlf6GYpE6MAaAZnqY
         YOnVDIwA+p05Vi/OXXMSi2vaMIemBwdb1z0ivEXcPL2NjBZtZ+z9WX33hc5MTMRDIpDI
         ewdyVFvCOlzoOImVNoN+Qgw0IWHmhx8TIY3+1zXi3jSfgaA2HZScmVqlih061e3JWe3U
         Qd0USgQxz47rG9EH75bAhQFpRrRRvj3BEGNIezrRCWG4jWxAIQ8q0s0uY3IJdSD1H492
         XOaKFcaC1v+yH6gOwWzIQQIibVdjzZ5tW0jz3QIOENpP9a6XBMiza0YNHj29J9v/EBZq
         YwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542142; x=1782146942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njyoUc9o+UR/jRlgGA5KJrg3KkVr3WPKZv815VQwNJk=;
        b=DT7QAjzXRiJTg8X3QLXN0x6g1oZmtyaVJlc/GMMe9HcLqkU3lifPlFTQVkIOiYbhuJ
         rPDz+3hGAun/kLEaRMrjtRE8d7pBUNnZxMd0a7aR8kmROqHBUN96JRiwAuOyQhCouGrB
         PiDAoxvMJ3bC84Sh2UHTwyqphsOV3EVTW/i//Zbbh7b1W7XNnpfsTi8qLLNhSlAjAxvX
         TDUaMGdXwUCNrih4Kwt+UNDoQcaHjgjdWogfaScfi4AjzwvZgWrmOYqs0BSyWYmbctSn
         xugQPqG7EeOHJ9FIp/XZYUXKsebP3jPZkil2BOQgxZKh/mA6LzHJtJcs13cRyva/xgL5
         3Spg==
X-Forwarded-Encrypted: i=1; AFNElJ9wDT9YjE3jgQus1s61jj9fuGQrl89BdG7GHTAEoE5IloNkod5nlRIwUQbcGoeCnCCC3kqZudZST0X5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5U9HHpyqJPcB8On+kG8leirM02tj0iWXS/p0VRjGxL0WG4Jp
	Njx5zFfnmyM9rx6HVLdaMUvP2PvgvSmZeNbz19qX2KOfqK8xYzOY8zUOHQREK+SAqLA=
X-Gm-Gg: Acq92OFJIdXSI9KiRY1o/CKKQ9lZaezCrQgFV+vfq3F9+VDFz+jSfMN30Y6Fnc8f9SF
	fsawWfcxfZKEcBUorryDbl86TabHguwVE8M7BxEDThjyiafQMJ2BJM5IRGt8Aw6NbTfs69BUpGs
	bSf7cdn11fPKqC0A14/Ikt7JM9c7ACf+qikMxYZYmgryYPabdzal+lvBTI85pZD8Z0Chmiqhzx+
	rob+1W9m1dhFuGK/WCdAD2nezurerdDaDuPo/gmN9cN/5cHY0HD+RidW1lP4hX66tY/1W+KBqau
	eVeOh/dY2HgecwoiJJLEtdHWMSR+61/DkJKY4pqSL+YVgnVUCrb5/JBwvWwXMh9XPvuWmtssCmf
	6oNhI4WzOWZ+1DFHTr4f+TQcCd32gBjWK4s3XUpjvX7W+zEdZ7tQRlyJ1kITD32mQOCsKz4lgAO
	84votAHmLH/hwgf2w4oU1kxEId80or9O7lhh6339e3VZOj
X-Received: by 2002:a05:600c:3548:b0:490:ea8a:32d0 with SMTP id 5b1f17b1804b1-490ec501917mr213872805e9.20.1781542142073;
        Mon, 15 Jun 2026 09:49:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa58f80sm5670735e9.11.2026.06.15.09.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:49:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:48:57 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8650: add CPU cache size
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8650-upstream-cpu-props-v3-2-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4741;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BlJOCMxVLaAOmzm9jG6rG810V5HTRlTC4PbDQe+T4+8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMCz6oqhIKAWaF/8RHFtcSNiEw8uqXjg3dOrU5MBZ
 K6JHNxWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAs+gAKCRB33NvayMhJ0R9iD/
 9c5kHyT6/OUxZZ6KvUXfw2PZjJJV4HxqI9BKgf7fzQbu74wXNYRGJff6M0JTiETWCrpnxbqLPBjexd
 6pzdHgdN2nY3Jz48EgFijnFh+30FFR2ux7jZVbD5E6nGil+a2nXkK8xk8/8LSgdOI3a0Z/aGxnynhj
 XBU4wszeUZ5hk2IRDHd09Y8xBX3ONHJvhqs6oNM1atuKAnnXKWp1FwQZdSouj/w81m4KwTZCDbT1sq
 iEQWZeNXzcfW72BfI9rIU2ZE3Mv2PhLQmtcg70XlQOEGgZ0OE5ZzxatAZoO3knVRiDIZg0rJ24KMya
 HIDVsswb7+e94xTFqUV+RMoC2ro4mv9u6OjHycXdm11Gu7/9rKvkFD+htUFuKRIgbYCuzeWWaFDQLS
 2/idmz4Sw/2N4fZZfiiTDHkeuNyDCqi1K1iKEcqWs/kiAWoDj0cZlOHpLVFH7qcmx2Ld+lAEmfq3bf
 l7uOt2MwiqW5lCwh+04JsEEvBxx7YnM52yGwkJqjOTsuXPGRl8PjAY7C9JOO7cbWu8x4eeEx9mmmn3
 SOcXkGsBNUqD4N+e3L/YIgm2rGg+G7q/S+Hk60r2ugJXxGxYMCplZBMDMNdeABTFy8GIO78OXRKQz6
 UkB67dZkONJLniWAeUlFMxaAO0thBezWMv9KhYsOEKIrdT+9Yoe81eP4ubcQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the L1 cache size and its line size (cache-size and
cache-line-size) with the corresponding L1-I cache and L1-D cache.

L1 cache is unified, but clidr_el1 register (get_cache_type) tells that
L1 cache is separated (CACHE_TYPE_SEPARATE), add i-cache-line-size and
d-cache-line-size and cache-line-size of L3 cache is specified.

All cache line sizes were confirmed by checking ccsidr_el1.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e8e43ddc3032..090a4739ebc1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -75,6 +75,11 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a520";
 			reg = <0 0>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 0>;
 
 			power-domains = <&cpu_pd0>;
@@ -103,11 +108,15 @@ l2_0: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 
 				l3_0: l3-cache {
 					compatible = "cache";
 					cache-level = <3>;
 					cache-unified;
+					cache-size = <12582912>;
+					cache-line-size = <64>;
 				};
 			};
 		};
@@ -117,6 +126,11 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a520";
 			reg = <0 0x100>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 0>;
 
 			power-domains = <&cpu_pd1>;
@@ -146,6 +160,11 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x200>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 3>;
 
 			power-domains = <&cpu_pd2>;
@@ -174,6 +193,8 @@ l2_200: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -182,6 +203,11 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x300>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 3>;
 
 			power-domains = <&cpu_pd3>;
@@ -210,6 +236,8 @@ l2_300: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -218,6 +246,11 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x400>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 3>;
 
 			power-domains = <&cpu_pd4>;
@@ -246,6 +279,8 @@ l2_400: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -254,6 +289,11 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x500>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 1>;
 
 			power-domains = <&cpu_pd5>;
@@ -282,6 +322,8 @@ l2_500: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -290,6 +332,11 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x600>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 1>;
 
 			power-domains = <&cpu_pd6>;
@@ -318,6 +365,8 @@ l2_600: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -326,6 +375,11 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x4";
 			reg = <0 0x700>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 2>;
 
 			power-domains = <&cpu_pd7>;
@@ -354,6 +408,8 @@ l2_700: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <2097152>;
+				cache-line-size = <64>;
 			};
 		};
 

-- 
2.34.1

