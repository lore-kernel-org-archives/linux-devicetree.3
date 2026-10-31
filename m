Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445750;
	b=U7bspNgY1CtPktWJfq16FnPb2Ka72TjbweJx+n39HB/MGC1i1BJwk5FGRjpMz1KiaV1d
	 o6fqfvqLlUAfMRyRpAx271nHCJVFo1BhXzIFNe0NtmX9UM7TDfGLvRxHMXQVnjy68Xdu/
	 puw5h68LH29ZiOJ39+vy3poy7d90hzwyxQU1Jt8e27lgil/5177hKg+SPnQZSqRr8+YlM
	 stq0/qdqehDuW+Lk4Rt6IYJ6nlWiT1I6Ox3Kc6/qN/GahZetlurADuKTraZJeui8g2z6Y
	 TFMqaiaAvYG+Q6rHZa8Eb70isdgXk5noHrkEGfReO4Jk3F9ftTOOOCPUpWoDOlCEGsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
	b=B7PFDe7YjlBzHl3hX6xZdIHr1+Od/CCYFNM6BTPVD/i0kV5sMayZElxzSPkPVXVZgO8U
	 MPTjL6l7+Lv+hREGyXJCEjywrjAKRtJ+zDFYhmonoQYe0yd2HyktDHVGu8QvToHDjscRD
	 sCmhVX+K7BY+gl4MhJt4pLs9qQIlEC6Fd9hBP+EkK5wyJ2d8Ib/wQlYVV3muVMeeMhOJJ
	 rxvpw1jy0pK7oWo0ahnBQdnzG8Y5j2lWAXQPVF9JhVMOWGwAGYwNc56/JiM37fAAwGtVg
	 Q5fO+lVwMZqcC/X16RtCu5skJqQtzzjg9Nm2cib6Gm+9d+JRMzss5cu6Et5yMQn1mCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QdjuGpm3;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2531A606A330
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2531A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QdjuGpm3
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab03acca28so2583381fa.3
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445748; x=1794050548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
        b=QdjuGpm3AtA2n9CkeDY/hf9+Jwq8FSHcJT+66e3eOkqgvFOTaBpTPdjI/nkVoST2wO
         EJCtdZ0b0r2ESLmAIUPNC2BbvqrkU7gbWQ6B8gvkVZQzUpMQRaY2fK4OwOvhCG9+j/ys
         MGs1OYTlHq2P7XcUVbWPfva///1Z1MA/p6+Uy5JedhF+2uXbzNVXf8FEK2WbuwuXwBFc
         y1JnNpwFjt8ngU2rkEKTHqcmk+0X6jTdQyWUu96N0XVekjYlV9/nBN55oBKrEdD1aNw0
         eCnlH9zos6U4I3D59NDa1Q55ts/6mNBPre1Eg0UILOOojVFmSaWBUsJXq2DifWfZzPvy
         ePQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445748; x=1794050548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
        b=Jzwr8ZH6xVNJ5ZkV3qeZO2faCc1mt+0axSlalieceSHdI/vB2C+Ga3nUh18LI7i94n
         nyKrII0CVMOpyle51eNqtLhNSOUJ4ZFKg1sh9g9/s4UttIc4WTfeBDjN2t1X+dXDwHFc
         UyUHEz2nVuQmAWc0qVxgVAo7Aqllq64gFAgONxL3NkdNBu1Km66B4KY0Qelia2Zy26iz
         n/VVJKbS5uPt2COjyb7vcFgRHSotzQXgkk8frl8vMWnnz7HcSgiNsBwWaEKwIZyzw7oL
         vT5eafhLDk3/aQNx80MM8Z2vs84IH6TykvENSbBUtxNOo0c5vnxRfU/2Kz0IcW2BiG48
         9Wgg==
X-Forwarded-Encrypted: i=1; AKwUvBy4bfezAk0HTbLBb6MJ0nUZQR/WOLjgfgHEOpL3drJse/6u0xX22iBpeYcxw6mPkTVHB/WnPNR7pnNN@vger.kernel.org
X-Gm-Message-State: AFq9FYLAgCbH9IYiYBZcxJIYh/1Pnp4TunEq4iN6t7crJxwSExYkGeri
	BjIoKyIdgXbHNlhcMYInZhSKx/LHs29QDYdCXSwDbBjYOgV0G2H4XJWJ/WK2ulU4dToUjJKsgfQ
	EVvx0uyo=
X-Gm-Gg: AYBFou1CG3MnjiSfHrOHQfNwLF+XSeOcAmZnU2bzWq2k959Rcb/bQBi/x8L5n+5NF4R
	wdofegMtzml4CJyT5oUWwFRGp5tLouHAEbB/sbQQJ/H8xwU/WcY+SCAwGxCEy6E4eyprRzOcAth
	9YA0yoY+HU7uRQFL65TLTS/5K14PaOhbWRvNBeQGXLgEPDAuCL+60zVnctTiDo/weZQntXHGHRH
	sBNJwMAG5jGbuKQQ4CemD/v8UwTxw4xxvM4BRIjv8GbHj/bjn6qkgpMqoCg5HjWalA8iUrSaT8L
	1McKNYKgINrUuSGBua76kaYSTR0GnDyQ/N4negQBtAU5XxbNO209+qrrDU/VvoBzMeWCOH9Vh0X
	O54KU454BnfWT85jyFL7H41J3r8E1Cnl6cF4ivzn6BzwCLIaaZjv5/TbrwFR81o/mBubGZ8hWVU
	ty2mpDRJMPqchkKkDt2+wDLc5Qnkou6vYVqkPekXQHo059Q/ximTgmIRKgF/IJ37/CkASfekXf2
	p1xSTbomuUSiPafdEEtEthmMdSrkqFYOz31eD8FgzbDb60f6q4cJiCSg9DxvlOnQ+0YadTLuY8I
	TyQkqpSHzcjzOpgEXbchL2jEVTEoM8qpTpwUkNfqsjhy3x1ZlEYUMqlEb0DFrqICW5V6oQ==
X-Received: by 2002:a05:6512:3a8d:b0:5be:4d62:4e65 with SMTP id 2adb3069b0e04-5bfd9566ff6mr1862293e87.6.1793445748364;
        Sat, 31 Oct 2026 04:22:28 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:28 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: sm8650: Add CAMSS test pattern generators
Date: Sat, 31 Oct 2026 13:22:03 +0200
Message-ID: <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Describe register spaces of three test pattern generator (TPG) blocks
found in Qualcomm SM8650 CAMSS and the non-real time CAMNOC AXI clock,
which is needed to get TPG output written to VFE.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472..f40ba0880c90 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5463,7 +5463,10 @@ camss: isp@acb6000 {
 			      <0 0x0ac71000 0 0xf000>,
 			      <0 0x0ac80000 0 0xf000>,
 			      <0 0x0accc000 0 0x2000>,
-			      <0 0x0acd1000 0 0x2000>;
+			      <0 0x0acd1000 0 0x2000>,
+			      <0 0x0acf6000 0 0x400>,
+			      <0 0x0acf7000 0 0x400>,
+			      <0 0x0acf8000 0 0x400>;
 			reg-names = "csid_wrapper",
 				    "csid0",
 				    "csid1",
@@ -5480,7 +5483,10 @@ camss: isp@acb6000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,
@@ -5514,7 +5520,8 @@ camss: isp@acb6000 {
 				 <&camcc CAM_CC_IFE_LITE_CLK>,
 				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
 				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cpas_fast_ahb",
@@ -5547,7 +5554,8 @@ camss: isp@acb6000 {
 				      "vfe_lite",
 				      "vfe_lite_ahb",
 				      "vfe_lite_cphy_rx",
-				      "vfe_lite_csid";
+				      "vfe_lite_csid",
+				      "camnoc_nrt_axi";
 
 			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING 0>,
 				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING 0>,
-- 
2.53.0

