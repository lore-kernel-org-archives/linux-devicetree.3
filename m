Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211503A63E3
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707562; cv=none; b=LyyF+S3vESmCnZ9cnTcTB/gSJGYJfIHq0pAxBjQGmJz46ssn/GRNUVWEi0cXYhbsN4Mi949tMgwW9wLR3ZctlF1TmwCETPxRsFSqx6Qz7GdOPnOzHGYj8O3euMRijsuaB98Nqx3gn3XVZ2eMNLCwkb+fYuUGm/Mxc4eboHnaDC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707562; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhk+A5H+yanyxw+MXUNrX8GqHhcBtzO29APYDUllVFKoFuaVWWHc/z7335ZNrU9WUWDO/zyoXYlsllzyKvQG1VThiIjdMfMjixIjmRROh01ofAjVFAEf475b+DFEkz+M6ooSkXdmOc4Vm2cJ4PzgX9WAI4E6K9++mvX9D/Vdn2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rofZINwH; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rofZINwH"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65dead17c24so2684328d50.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707560; x=1779312360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=rofZINwHOP1SyKFyqRy2AaTzLrC536rkS3ead59iCW0smcXuMLVAWqxQFGy/eS5yUo
         7JgF2anHQzwkRt5brkQCE0q5F5Y4l70PoEo+PwY/EMW6knof/JwXmJwEqcPPt6el0gaO
         fUh8NDA4NZn1tA8mL4TPgqacatwdmsNql/dul5gXdPXdbm9F2tIvEMsNOnSDZvNhN22W
         /cycRQe0VRn5opXSl+3DSrLMCG6pKCJenA6r6hWdo854yPPd2oSOEvoTS/WVoe3UwueA
         EoQ8F2FIgaar6WfzodN16Aev/mGlvguGrLQTzrrLHvxAHa9DzHujvv77GUXfmF5nV6QN
         lydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707560; x=1779312360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=HE457WFwYCNlcROZj590lS2Jbr5icMjGWdpZ2fP8Asu2SQ0yJ58hxqedimnBDubyy2
         nX6wEWks7Bfl6ZsIdmuaEaJtWYnuwPWZrZduKGff68nxhF9x2jzxuNQelWTSPA3Pg7Yt
         O6iDix4Wb91XTpqxt2Z17CKGIZLGpcNHRP8HuxAnPyKA5LlSFFbHGkgtoRNSjHMrJCyS
         zrKoj+JliY6f4AdYbevgg2X4g2Ybz+DQ/B3GEcQf3TquIU0+D8pqCOon12ETzDK2+58C
         9EWRuJ+p3PUr0WPJe1toIEVPf5kdcZ5z/banaxFEia53vbBoPU7GWyNGskYNvHJn4u7m
         cFvw==
X-Forwarded-Encrypted: i=1; AFNElJ8loYRMUpLOZ/UrSN/i69Zr5qxfGTQalPRMN3EUCImGES9GHhiLnGMRVuvNzuhWFoyIpKrQQCQkSb2W@vger.kernel.org
X-Gm-Message-State: AOJu0Yzga+Ix+WVtJokBEOjqMlZwlthRcR0MPcDuQCHZze1LQIggpqhr
	ZmFSz/iz7e9e032WBzDNFcuqrDR7B44WEsPvSvTyGY/UWfwklcVgwsoh
X-Gm-Gg: Acq92OGPEw2OC5cXfzGPXgNR2VTPlAWZA7q6Dx4NHTWjNTZ3IMgTPkNRqpazza2al19
	tmPEGF+ZsIAWs5cEVxmWoO+5LqtIJDqNKX1qlqKos/YgXyOwNaotqLqwJtdn/qSbnURefWDkOEz
	5WFiPoI3TRZspcS+0slnQqgWZvdaBr5cTTU/2m7rkR7u4Bg8n2zk1Zo8BIzdA2KjIGO6nn8o3ro
	rqe6ouPh3WEaE1s3tQMIFUHeHwmIkJZTTgdyb2WmUaFo8vLSuauCmHE3qiWLhUK49ailSdDOExa
	2VbT6hWiDJksfIci0eyoPCCx/mVeW5E2FuF8640Yua7fsACBex3KPR2U1kqWFIHWHnV6rMBznch
	ULS6Ccug1zMglWpFdWERjmtpJI/WuS8cjuSOVlHsdVs6qunRMMH5dbXeGsFHPhVFf1wO4phYfjh
	2hw3BljaKoEfJA/d/oOcISdd4wQg==
X-Received: by 2002:a05:690c:e295:20b0:7bd:5c7d:4b15 with SMTP id 00721157ae682-7c6ab5e9aefmr42888857b3.5.1778707555385;
        Wed, 13 May 2026 14:25:55 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:25:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:31 +0300
Subject: [PATCH v7 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-2-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

