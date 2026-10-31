Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445745;
	b=o2EujP/+S+9p+aYOdg/MlWiCcfe0zXWYmPLGk4oTaqzc9ZWzlH0ENWZee5tTEqrXmO9Y
	 GauzEqGUoKwzq/JqUfdSI5zkyz4SAvF+DY9M7NL0GKovqb4+dlHKh1rwyYsC/3IaOBcjD
	 9neh9d8W75H8r94om6Q7r1aBfiLx5CwKw9sJgzJHMz9iiKv2yAvZy2HCHjLMdoD85qQb8
	 auri2L2yEprnP85ygt1qMoQ8uzTS9+2H3JxAbSBcWM7oniASQ+1wCeqTaXvhqFqdRcP//
	 81qUlDLiIQ2qPO6ffycK+2xD572AtCjvXscKso2VMGrm4hJjhPvI8orvgXj3PtCTXAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
	b=Cj3QsMjH+J8TXP0zZxft7BD/HCSw7GySXeRC/tGGPitdrKVRkPmxTlWnDA0cJTXYxiw5
	 nZrzsCuOpjvs+crR1lTJvgR3Gs6Ue6z/6BgVoBTs1z9NiEPhNLuvSPKbp+SimnaGSIPqF
	 De3ICGd98oLJOdDfeo7eIA5tlTDwwpxT4kCRtkWidjcKWwHaViYw6YUFWSmfHNv5xu+sp
	 O9Q7Ke63gdzvYeejwGJqZgvDtMSo57GTHq482vrs5gC0jIuvkwiEqDg1jutk18T0Kr6Bz
	 QO/qQzliJCrlscXxpBA28AHs2EDNU8d5maWh1xslJPJaYpSomublgwYdOTYzU56a6lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AqOcTPdY;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E3606A325
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93E3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AqOcTPdY
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3fc6e388so1889601fa.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445743; x=1794050543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
        b=AqOcTPdYZdma3eVNjAMT5wVBeHEVso2q9jo9OwECNfbZwWef4Faxk0Vs9eBR5D1J/z
         nLFPKfrbkgryICxai3SYb3R3tJBdFt9btFy258q3e0aw0epd9STu8m/LyT8ptdoXxiiD
         3Pa9vGqPRUCvRnjx6UCX/CkFNS9c5aZLV+Gh+LQArFv4BTclbED3Oojzvi5u1wkNzMoS
         9y3r0yBnaxHqSyGN4qL1dcP7m/sULP+ArmAIK6MJbRDwnFVgLD1Fu+LuSMKbEbYeZcJC
         jytEc+Y0cb2Ws6RentPhiZLKN50lAvtVWFEGmiqN+s1tYkshVYDoadV7mBnXKupwQ/bc
         nhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445743; x=1794050543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
        b=uCPTR3Mq7YM4ZsAcz1xDzdNHa++cHHMoMrd0EwmwwN7kiga4JI/bEizgSHL01b6d+f
         tvdajEs2lTog/HAllByrqGoJ1AHHa1/aO52napfcqXK54HLZv5EIXj3JNAANLleW77Gu
         hbQC2XqnU01uRsRuK4gr1D4cyDVMDUgXXhX7qhhlfzRnsjL2NJQOKQsErLWUqk28hWL9
         Y304yCPEUwDcwo5qvdrnf53WeK2o8VsNUGPJMYNF7spqyrEfj0aEVKP7eDES2+ju1+PS
         bfBQrQ0Kp51oK2dFAytDjlY7ShSfjbCVdqFjjoOKS6FO5CRHZTPKrvQI73SL+wLrsV3Z
         /J7g==
X-Forwarded-Encrypted: i=1; AKwUvBzHN2WVkAR1naFuCitn5lwyKApFy9pfS9scs8qylv6CMYgbTk9BF+zKMPhBdzEI4Iv5eLLq/MwA7Rr7@vger.kernel.org
X-Gm-Message-State: AFq9FYIEcY2r1tyZ06LUnZi0xC/iHNDODx4mAO0GuVMVT5Geni1T4gUd
	gVrSvWXw7ppfUUlkjbEibHOV6M2Nl6Z9YmcUbIYKmfgy63uAxx9bmUiE6k/9sekWLbE=
X-Gm-Gg: AYBFou0uLFsP4LffwA1PMtUonFiZDyo8NsGbk6kQBaWwAQG679sSyYoyyHLusETemRc
	etNfNYMfwLbRPKtmQgUBh6puZyYRPorBOcg7iQ1Ry7SpoFQqEr57vqYhpdDzcB6up5WOrjBacNQ
	cR+4kO3RrUWoNUFaFGIgaGB/2TT1IFSkTORebF12p+9oOY+9rZqFRKcK4AA3GGQZH/lHefzZiyo
	2vwkaL2vM5Y2TEY9rFqrWr3Q0hXDiD1ELg+NtOJs8OItSGTwhUra4nwkgN9xCeiYYCWPHQA3SYP
	zaGJ5iyoNPqE2OVTSdADnv4zQA/iGxqjEvKQt8oO75sMSv5hFA0wgPfq7/TPquBk8c1CisSn8zR
	+xZu226Ep1KJ+VOB0ONiv9zDiRTROzWCgqQiRAgu6g/CSgwudGuJo3zP4zmzICqtwRtx55q+R/H
	2w7ahWbxVQ+tM+qgkYe8uCxgerjMnXIzu+BnFAmHrKAhVr8zwme1Ys34I+jssjtzhDiWnDr/SF7
	3mwRIDknXiWUI0R8w6zNOGWishR2igaP3vygaLmuH0MqbO9aVtZ2DBshu+mc7SGdXul3cA01sFl
	IJaQD3cR8ixrG4NL+cqNZ8cf1Ox6oIGSr8lpmXi8Ue7rUjhyP+Um35fHAmuZ0/ZR37a46Q==
X-Received: by 2002:ac2:4bd5:0:b0:5bf:e4e3:3df9 with SMTP id 2adb3069b0e04-5bfe4e342admr90635e87.2.1793445743107;
        Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:22 -0700 (PDT)
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
Subject: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test pattern generators
Date: Sat, 31 Oct 2026 13:21:58 +0200
Message-ID: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
Describe their register spaces and the non-real time CAMNOC AXI clock,
which is required to get TPG output frames passed to VFE.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
index 9c8de722601e..50ae30cdcb82 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
@@ -17,7 +17,7 @@ properties:
     const: qcom,sm8650-camss
 
   reg:
-    maxItems: 17
+    maxItems: 20
 
   reg-names:
     items:
@@ -38,9 +38,12 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
 
   clocks:
-    maxItems: 33
+    maxItems: 34
 
   clock-names:
     items:
@@ -77,6 +80,7 @@ properties:
       - const: vfe_lite_ahb
       - const: vfe_lite_cphy_rx
       - const: vfe_lite_csid
+      - const: camnoc_nrt_axi
 
   interrupts:
     maxItems: 16
@@ -226,7 +230,10 @@ examples:
                   <0 0x0ac71000 0 0xf000>,
                   <0 0x0ac80000 0 0xf000>,
                   <0 0x0accc000 0 0x2000>,
-                  <0 0x0acd1000 0 0x2000>;
+                  <0 0x0acd1000 0 0x2000>,
+                  <0 0x0acf6000 0 0x400>,
+                  <0 0x0acf7000 0 0x400>,
+                  <0 0x0acf8000 0 0x400>;
             reg-names = "csid_wrapper",
                         "csid0",
                         "csid1",
@@ -243,7 +250,10 @@ examples:
                         "vfe1",
                         "vfe2",
                         "vfe_lite0",
-                        "vfe_lite1";
+                        "vfe_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2";
             clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
                      <&camcc CAM_CC_CPAS_AHB_CLK>,
                      <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
@@ -276,7 +286,8 @@ examples:
                      <&camcc CAM_CC_IFE_LITE_CLK>,
                      <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
                      <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
-                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
             clock-names = "camnoc_axi",
                           "cpas_ahb",
                           "cpas_fast_ahb",
@@ -309,7 +320,8 @@ examples:
                           "vfe_lite",
                           "vfe_lite_ahb",
                           "vfe_lite_cphy_rx",
-                          "vfe_lite_csid";
+                          "vfe_lite_csid",
+                          "camnoc_nrt_axi";
             interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
                          <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
                          <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
-- 
2.53.0

