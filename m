Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838054;
	b=o4/RuengHXPkB/k2duzgeTHR78aRhLaZBURMw+8nmmbyzKDVJso7N+OfcyHFemz5xR61
	 548mjp/N1gJVLt1fE8ypMP0P+mQd9c4+W9pq5SAOTaeB05vgxPl8+WQv+3AJy4ueBVl9i
	 YTlY380Cj+wrterhMbKC8DCjIPy/NkeZ9dxaKmC6E8bzRJ/XQjS4Im4NTm96D1Za540/B
	 KtZJtgL7oexxd7HUoKVn38n9/brwRObZYMeoV6KDaKcqO1dzEylXTP3eMg7wjkMXLW2Gu
	 Py3dxaCZpcDsZqihyC0voWPkEwOmB/AQgan6oT4k66Zr3qNLZpShToMXjV0vyyoNRnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
	b=lSyY+jBAI5Bg7FSSIqjcPzsvjk1vXoJBpIar1iVHWwfeSyanZMf1af7N6EfmOMkIET8r
	 stIM6UTJ1MNZmdA7h9yOVJePe9YwpDFDpoDYvwKNgsCYbm84zQHy/Q3UMrf1xFUdR2r6W
	 WLPmSHAHcw0VLIwrAwy7graOvKaqDd4bsni5wtXXFyJHDNj0fwHmsrCkO313uAWajbQjE
	 AVcEVGR41dRq4R9QMLfpuNXS1f/x8yZHnfxHS0T940qGxENP1jvbbEcVnxARD1kqtuJs6
	 dVW6iLRwHthIHjdrnS9Yt/DSWyw1GxSRL2hCn598We+1DTt2DV8OseryfqCu56JyrPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdKX24K5;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26352606A324
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 10:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26352606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdKX24K5
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so9368195e9.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838052; x=1793442852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
        b=YdKX24K5TOlpcFJ0JFIKaPqeZd4jYWqUjIEwLJZQlXOYeeUNYiMecPrIjGLx4Z4fnx
         m7HvkLbn/xgQWV/9JK9FzWU81MbsnAt89fyh5SOPZcPW7LTgeEEex2KX6oFkYxrL87Gr
         5Fh6FS/GSOTMoj4WtGxvocaACDei6U2u6mXZaoqJ+zP9ZwJyg1YPYl2l/Xx8QAZMbIWc
         eafGUH0BG9+0f4o77CCKZS0eTQYVuIuC3270RWyV+W86puo4d2xYSl8OQe2QWUJ4ffom
         tkNmTSe6kHB09Dm23ZQmSm4Unn66KFGafc7CF93cE8MMb3By5rX8S+0REEDh0s95Uqyp
         bfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838052; x=1793442852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
        b=MT1KuJqeuRQVowXsPfjVRg9yqc1pXf9hfk4GKSgpzJqaWt2BEeYHlzOSGqkOeTx/e9
         6LTJTC4i2VqnExu6+e6H8V2uyTrQcdiD9mC7Xxeib9vB86TTzqkox8olKuTOiYOiSvf/
         hoRGvILLdAPBpzit2+cKX40dvAqQ9Xw4gzMlWmEwTPkcQjaLbh7c1ita29MRA6xv2HLV
         LtMDoWymxWu1a/QgVE17OZxVW0dDRp/jh8hi3RkH2grEtz7fodTiyra2m6XaFtEeoyvx
         ANhSbWQlU8SYfeJePfzCZ0G63zrD5iE9EgJoO99XaFoNgbZwdipXKQE0XR7YeplUGHFS
         LLSA==
X-Forwarded-Encrypted: i=1; AKwUvBywydbM+M8KB4kSDhLVDAfD9LCtH2oT43yIIAz+6JYlzpMO04sBGvzfCi7WidId4nguxrXYoVHMP4D/@vger.kernel.org
X-Gm-Message-State: AFq9FYLm++MbYTJLyCsmrp2kcsNuY6vUAlfwmswD7yWCzGXDXE56efBC
	BmTe0uLUVGGN/Ty5nc6t5Fj1qmRlcgC9NNQr8K+SA+BkTZeE3o29GyEL
X-Gm-Gg: AYBFou31QR/lAvEG+DzqmrzVo9X5yoM6ikEP4TSP1/1tWVpizAB1O0jx7q9CqHwi450
	o9UCHHHlxHqlkna7NVzctFMxA+4bXiWNsjRqwBWUCp7Gy7Lb6h0mV1hsD8ganISHMkk6+U0kFEV
	6IW2SFN2N2RnfTSo/Fv+RoeCVUQr0FgidYuIFu7FJVobLFlFPG+s0s64QDqurhr0RuYCsY+8hzb
	nxq3jCgNrrqYVhXpMPfMcOXCQiGoEzFAMqAK/fQ5fL1BCtjMd+X2YLFzItwEokd9eX6SSH3/BAe
	p/vTz3pV+vHTeczoMIXIm6deTCaVNwJABVde5Z0sdkUCrplfRQ9ZZf0gikkA8ZSRkyN7fI4ORzB
	nAArby26p7Prv7i6Y697m3TGbHhRhvPGg301pQhNqTkPjAEwXp0Msygzy6/XKyZTFBt+qlLhm/s
	4zkCKZLMUP/3hR0xhMh1w2MG7ZM9DwkJZzSfv5F1obTjfmILxFFrcIh/NrMi1opL00I6MFgLiso
	8xDtMzSy5JN8Wyc+cJ7wOmCtl+bjAnGTFl2THSz7TJfEGS3pmMimw3/ZWMDrHU2bBVeS9EiEy8h
	CLRIyT7j0mDQ6fVc6k6GOQj0bavlmXsRoteaZdPx2BCpsoccg6fvuEdlFMK8bXbpzbxMDHWKd2w
	NOp9m/Bg=
X-Received: by 2002:a05:600c:83c7:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a35ac3f293mr26033995e9.1.1792838052522;
        Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-024.globalnet.hr. [213.149.37.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm3544825f8f.39.2026.10.24.03.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Sat, 24 Oct 2026 12:33:10 +0200
Message-ID: <20261024103401.761125-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024103401.761125-1-robimarko@gmail.com>
References: <20261024103401.761125-1-robimarko@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the CMN PLL node, it will be used to feed the required fixed clocks
to networking subsystem.

CMN PLL provides bias_pll_cc_clk and bias_pll_nss_noc_clk to GCC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..8afc63a72144 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+#include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
 / {
 	#address-cells = <2>;
@@ -15,6 +16,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep_clk {
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
@@ -257,6 +264,18 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq8074-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ8074_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq8074-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x2000>;
@@ -369,11 +388,15 @@ gcc: clock-controller@1800000 {
 			clocks = <&xo>,
 				 <&sleep_clk>,
 				 <&pcie_qmp0>,
-				 <&pcie_qmp1>;
+				 <&pcie_qmp1>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_CC_CLK>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_NSS_NOC_CLK>;
 			clock-names = "xo",
 				      "sleep_clk",
 				      "pcie0_pipe",
-				      "pcie1_pipe";
+				      "pcie1_pipe",
+				      "bias_pll_cc_clk",
+				      "bias_pll_nss_noc_clk";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.56.0

