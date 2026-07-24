Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A9A3D953B
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887827; cv=none; b=TuCUNwWJ+JvlrNlb94g4iujN1dwxzWeIhoJuFlu2lfKA4pfakCPrsSJc1o2YLtnyZCRgOw8wF/JpMG/qqeTvV/+r5+uM5qy35AbBkftpKDSriJjPFOpnFlQb+S8DxdlsD0LpEHfV6Ltr3ixqQ3L6ZVdGdhcJpDv8RXmYsOk9HeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887827; c=relaxed/simple;
	bh=3MohiFJRk7R/WUpguwJ0RoRbuy1k8TNuGFgJUfVj4ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4Pi6HslAQFtLP0pmdtBDzo9L/PCP+2jj9+AMScUUD0sGOFz4GEhmAJ1ufFYNxfxkNxWWzdX0HdxA0FXqsoQ8tvibtRBl7nd7KJTbDEedZ9o5CzuCwtBuvMt9GPihZokRX0XkQwvVCD9pysjsks+U5N28QGN79CeJM+VCF2TLzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QR8V1CVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBSpaqqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QR8V1CVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBSpaqqm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lXT22099115
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=; b=QR8V1CVyfPCcFJ3q
	NK/egd/3MwAjBzPnIsTCy00mlPkIu8rHRvwKyxLqcJ4H9eVxBRpI6xzeg9RT6aHh
	bfby0ptjtPK6bXuqPo7kdRs0uD9CwXomaMqXQbJfjt6vszYUuSeDqppuLdxIIj50
	5fOLEUis8zaODZKMMkq0nEc1dghauNin2dn0JWxS5kpx7g0ctMUEszQfdMxzKnCg
	UUkBIUGqrjoY4Gf0FE6/JEfxtZeMb91yW/2gSJgbRGNfeb0YTO0iJPerWqMKrVvE
	sL4Bacpk7mHdKqavQYHLNH1VOtbV4y2IsarI7XCqn6vou/DDHNCIG2DBgv10Cyr7
	sZmk6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtf6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so4445195ad.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887823; x=1785492623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=cBSpaqqmKYXuK+kT/vb3uPE+E/96APXsRp5XIoSrTNNhWDkySPfVl6BsdH4uQ7THPA
         R/wEbL/ItJ5zubjh5gu6ATXNp/AKuwerfatZczHLCkO5y4N/Dw1f7smmgEffvtPFHrKC
         MruNTuAwmBjcsQdWZMOdw1jXHuQmZMVXBEimMMqqnyLJU7LyKONy8bxC0TNHqUVLt3yH
         +inhiiUoS9GCry6HGC3AwAbI5LPKDn9uTVzwvgaPLq39drQJ/RANVUNOELoRY8bYWA7S
         7QoNtOzyHPi7uNxDxw9ufucXncFoOJjOxddq5tWnm5xPvynVvQwSuGWBasUmVLpF+oZY
         yUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887823; x=1785492623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=bVnYXJUI+pvTyPoDZq04nnybAfBWGPXF+4NcD0Yy5UXTh8pSBx47AbkjruPDg6Wqci
         4vRaNXX82/eQ6HN4x8lpUTG7Zww8AEQEfoCXe5Mg9yJpJlBXAICp4j5ZHwGHj0SzeAKt
         Y5BsIL18PB5Q8z9JLIb19n7BdBAq4Kv6X2oTvZfgLsS0CLO7pT//5FieDQOLu97mA9wq
         +HZ4HLXdyYseEL7Mf56DjdiCm0vsqWIYtz3WGyzcCr95o1UqUuKjjxbTHA+Mzi2ag3rW
         nfP094JqKQhUTP5ShTNL6iWGAbxSGAhR/7FYpsMSrZbMB7t3q2Pb9zJFUjRwYBRyK2CV
         UDJw==
X-Forwarded-Encrypted: i=1; AHgh+RotsBUiOFxHzWPjhsKMLATtwQTJEMxEztbN0wGxzXZkrewLhomkNYThXQ5eJip4a/0ezf+7Gz7PlXyH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0fOHjsw8wqa9xgrSkaGIfM8Swe/rPn/90n2W4R/d7qDchCc25
	RVAL9r32Bo1C6VoGtm7ulBsw4LHUriBlNZWZJGJyS3SZ+TroIYLlxrhzVziU0ay/J9w8J5HP3xC
	8TP5Qj9CP5KMm/WWbKhr/DXWsCq6ir4wmiRPS2GCWl6Ll00gBqh75UOJw6hWwlcfT
X-Gm-Gg: AR+sD136t/HuamwZpy9VfFGfifANAzGOyuGxIXHSoo1xBH8moX0WusYXb+SywtOwwrv
	7HiXVTK4+5HWrlAnsvc7M3KY8oNsTH3vxIFqkfSGJhj0znEiLVzELXYM88fKO+de66kEB3qjewh
	hQjE0DLmGiaHqCw0U1M0ue1kHaGm0wtfkBm9hhKYvKlAhYZzGlIpHf7EaX1X6oLVzMtcy8afgYa
	9D3LsvnEEOsLhkDZT7R3sgC9s6Y+yAT9xy5y6OtXzxF+ZzvcX3ex6I+f/lAmRdQHzsKHU6/ruMV
	0WhirHbz8FJ5h+y1gNZWEJrtZdOly5NEAqaldZ/ale+Ql6Zz+p6LLg41EMUBATPGlMvw66bzwvr
	lpiEEZVfWpd5whpvULjoi8YaN
X-Received: by 2002:a17:903:8cd:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2cfa6c540d0mr77915845ad.27.1784887823207;
        Fri, 24 Jul 2026 03:10:23 -0700 (PDT)
X-Received: by 2002:a17:903:8cd:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2cfa6c540d0mr77915545ad.27.1784887822757;
        Fri, 24 Jul 2026 03:10:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:09 +0530
Subject: [PATCH v3 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-1-45b577241c91@oss.qualcomm.com>
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfXwebCxjezlQqB
 2F4IlGPT7xFUchaRoTFqy0larrWYgIQqE7qnu9BpR0uSykuusrJK8BCCPhHjP2scCt1/QxL2eTv
 gxUPJpehugAhYHXt703i/hchZlJay3o=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a633a10 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 4txsHcp55kW-zsepNKAOCR2-tEW-U50I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfXzTUtu3N0IolL
 MfxYg0jhVxNl6sHmMdqN93shy8/VHn/vYmJSc7Kqdeu1OjcG3iAV8YnoG9LXtQmD4RxtuFxRHvM
 H/UkbKjauCYr8UM1ca/wrxpdo39YxC031414L5Z5sjjzQ3ongyU2hMimq/PvSnfCZeyzv8cvfHr
 0NGI9WqMbjGwzQycQg7VgzCDjBXmAYrlKabQKvD+ho/gRXB1PO+5QEGcVbR6TzfZXZghtkdROud
 AQ0xYJ3CaC15CE7tdaC2zcFpDgzj9QE639jogggeGAVPikPzX4naEtP4c+4W+hru2koeLIqhxEr
 6p5l7ACR4FDf+1+r9xA0Ln13HPjLWJhiZxz6hTlYYRcSNdlazIIN3Bq15aadj3rGPc6J3Urs9nw
 HYznrzoAuuvyyuyWpy+d33/iiIt/Bm1USTItKo543DgEb4vYrDGWf9LWnMO6tq6ZoARc7CkVzIV
 /GIywUJQ7Cuv2263pTA==
X-Proofpoint-ORIG-GUID: 4txsHcp55kW-zsepNKAOCR2-tEW-U50I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

