Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7C93AEF2A
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962857; cv=none; b=L//SiYwoVwi7fR8NQHLdb7TKaLJq4lRNlgM9k+1H1War1PC+NhoBa/82OjwJrOwzLuy/rSsGv0wALqCrcjtpwWCnN4nAva6soVJtS64wgX1YMcJVH3dV+g4qK+Af7BjDoEWAWCzy+gE27OUE5Kzi/9CdoW4SUyXUFlXYCMoWvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962857; c=relaxed/simple;
	bh=M1Vtwv7dD6jz1weYO+KPGRu/3yG8JHsMNrT2B4YP6W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fR9tTpASNtYPeOvv2J/NejRzXyaJIlaq7aVX9h2y9aKUsG84PHFN1Royst3AeTNyvm4pKNufEC/EA6UnCCF2MZeESt21l1FFasuQO5zxm5+GIeN+i/Mt5nZ/Hn3EFbRHuQk3H3bFRq9nvEhOerTA6wzrZuCQliVa3ZsUUITZzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHdKia9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YT/7TSdj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHdKia9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YT/7TSdj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUn13203254
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=; b=KHdKia9yVO/cLQyW
	R4M7gX+Eu9iW6emgtz0AorsOhXvEphsYkQttuCqbYSCbXy+d8ozr2CNqGJn4mmP9
	DPKQrSIvd03VCViQ/yD+BU+YrsiyfJahCuSlsLGWA0GQh4U6qpJoaO/eqM5u9T7n
	1yE7Vstfw8L5FriSh/a5zlBVzH1t7huM3Xfd4EVIHoeJWjeOzX6QlfcxssZeSI8q
	AWLMbk3+xWtiv6rA/aaPUYrCc66A0QdXe3EZNT41EszsYmOKiXh33tRMmw837uDP
	ys4S1A9HuAizEuwSLx+UhpTzvSibShiEpLOkmHJrgfr6mouzi+J4W2T49NLyYTEK
	akr/iQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjb0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:07:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36603ad6709so10780774a91.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962855; x=1780567655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=;
        b=YT/7TSdjZXyebKA5sMHgFzobKjX8Ony1RzfjFp6tXWgITBOrqGsqU57nPsnMa3fe1n
         3pJEN93/PLSx0t2EY3qGR77fdeLy3g5xL4SB4nGukRLehYR00gNebh6rDOqmSSJlz4Mb
         jYFUVslZ9LnWfZ+zgsf89PQrmXQ3hQRzjK8t5CQXxFaF+mcQON2q0gkS3fMff+2zG1i+
         v3XUlp7+l/v1IOs5m5pyuwp41m3DpNtRKYbqvo5BDGLj/lDM22lpXD/QdUMHnIo+FXd7
         MwxZz7taxCVaArPDXPEuVCDsi03MlXAN+GyAS2jNF3YEp26AWZICK8PPYpJ0SWz+SW1v
         /GLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962855; x=1780567655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=;
        b=j+2HNOYew1x1smPD+31SwR3DDo6e60UJp7/PG5RIBPSurx9hAWZXvp70HX82/4BI7P
         lKVwwxZEMzlIn/iiGcou1e+AXrCwIIs+fRA4M0fmZyCpuFScSV7RhTFj3jGkMWLUf7PR
         ohoVU0ipo69spwHbRxi6WcOdbl9WSQubPqREZ22q/Uy2Nme/5KrNtkbQEtuzD6yxPQNn
         VeyDRMr29fF+ZI6EP1RJ4Oex7pH6AzrYYDUskHApXz9rdjzJRlOWbU4RCdcSvdv3PyeY
         6fMcncqtxQJsAEHAOhcKs0Tk6VzssZTwtosebTkT/vyt4bhYTsS7XODrL7KTDMfW6lPB
         TUzw==
X-Forwarded-Encrypted: i=1; AFNElJ//V//+gRG6PAZWnzkKwLi55lAGI+ZwHeYqe8hPkYO2AWqlbB4/JdNRq6NQnIG6n5XhUt5YH1XtMyyM@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBz2dUvdiVAW84jEQfVNtkpIKLeJ1RcxSEC343vEZCawLspb0
	3l0N1dc4p1NSTlm1/qHnUnJljhLUt9HiCpALHR20iw8+9TzMkoqH9Ihdbz4NhZtRzdjiuq+FEMD
	/YBwM0Qm5o+S6lsGmBEdHV8f+pazAnq+vd9OKU+7uJ3F+9fCbuT0k3fPDzX0TJR1q
X-Gm-Gg: Acq92OGiX7NnB5qXeEulAPDeAIS7cWhuBOdRFNQNkwUXjL9vSCVn/fCYer/wmrzeNjH
	BCY4ndjcIb8AtL7COTsWYiu2MEpKCqN5S8u8mc/TkGZAtOC3oMnUf/b8uypo0Ilrw4WqpkKCbKC
	ltJOXyl4PyYBBw1i41rrc+EGppHU9uR4pu+OQFl2rj37Bm/OS9HCj98SmCvMAU9EQRFFh/jGZUb
	DYXjp51zLV+lXALIA96ckfa5RQD7i1EmbKbS6jNPEsLjD5lV3sr5sQneNRhOcv7hAtG71xehs02
	6gH6/zNJdDTsxwG9xCTWdEqeg9abZSTYITbxdTeNvLZHgBOmyTDaP9CBijpn6cd/qJJP8K6jxYL
	5ARztzeILdTw9Ww5YOj5Ad6bIC8E1F6Qzap1B0y6cVs/KbrhW/B5wr1A+xotHXLM=
X-Received: by 2002:a17:90b:134f:b0:366:3ac:f725 with SMTP id 98e67ed59e1d1-36a6788d912mr27070473a91.25.1779962854558;
        Thu, 28 May 2026 03:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:134f:b0:366:3ac:f725 with SMTP id 98e67ed59e1d1-36a6788d912mr27070427a91.25.1779962854005;
        Thu, 28 May 2026 03:07:34 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:33 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:03 +0530
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX6/1pI7zedtOQ
 Ex4IE2QM03PcKvmnixewIWDkmsxZp1NCzsVkVLIPvDciJ3mt0FiYUZRhlflKTkbXFWC9dpchc5K
 0ezvk6e7ybcEKR51dG5eIlfni23dMevQh+vf6CNysskqGJiGKYby51G9rhgs93PwfbyBiBxvzbJ
 wMgufPtuZmTC+4Cv8xTpBSlor5QzxgpRCoVvPLhVybwOCzesmpYkx/9eVqPtqk7vUee4jxJ9IOm
 osHZ+rEMMIvIRQYswcxS/pI2F/248vykzZ/kKvckXtb9NVc0OZZZ2aw284yRKTjIW7FZYO3q1H9
 DaPT8ZNiR36ttnBog+HjPfyHE0g3KvtbBx7mp99u9pxtR1Q+3WbjI4dr6dSXuJ2CsWZkDpwyStD
 cI0Ql9udAJqdVjQV2Viavx1ZzTfwwU6vQVCzHj29iVBOjwLdtjVmovVVvVBdrZeOV7iQHTfhGsf
 UH37aYYUUem4xRFSqaQ==
X-Proofpoint-ORIG-GUID: Qvbgu-1kKxPIDPomnbBqnxl1SBZTc2nq
X-Proofpoint-GUID: Qvbgu-1kKxPIDPomnbBqnxl1SBZTc2nq
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a1813e7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CblTgZ0dn44HXzuTGlIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102

The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
but has minor differences with the number of input clocks. Update the
existing QCM2290 DISPCC bindings using conditional schema so that the
QCM2290 requirements remain unchanged while accommodating the additional
clocks required for Shikra.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 75 +++++++++++++++++-----
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..b24095814d9e67a355321d9013e144f245077322 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,25 +17,21 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Board active-only XO source
-      - description: GPLL0 source from GCC
-      - description: GPLL0 div source from GCC
-      - description: Byte clock from DSI PHY
-      - description: Pixel clock from DSI PHY
+    minItems: 6
+    maxItems: 9
 
   clock-names:
-    items:
-      - const: bi_tcxo
-      - const: bi_tcxo_ao
-      - const: gcc_disp_gpll0_clk_src
-      - const: gcc_disp_gpll0_div_clk_src
-      - const: dsi0_phy_pll_out_byteclk
-      - const: dsi0_phy_pll_out_dsiclk
+    minItems: 6
+    maxItems: 9
 
 required:
   - compatible
@@ -45,6 +41,55 @@ required:
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-dispcc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board active-only XO source
+            - description: GPLL0 source from GCC
+            - description: GPLL0 div source from GCC
+            - description: Byte clock from DSI PHY0
+            - description: Pixel clock from DSI PHY0
+            - description: Byte clock from DSI PHY1
+            - description: Pixel clock from DSI PHY1
+            - description: Board sleep clock
+
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: bi_tcxo_ao
+            - const: gcc_disp_gpll0_clk_src
+            - const: gcc_disp_gpll0_div_clk_src
+            - const: dsi0_phy_pll_out_byteclk
+            - const: dsi0_phy_pll_out_dsiclk
+            - const: dsi1_phy_pll_out_byteclk
+            - const: dsi1_phy_pll_out_dsiclk
+            - const: sleep_clk
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board active-only XO source
+            - description: GPLL0 source from GCC
+            - description: GPLL0 div source from GCC
+            - description: Byte clock from DSI PHY
+            - description: Pixel clock from DSI PHY
+
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: bi_tcxo_ao
+            - const: gcc_disp_gpll0_clk_src
+            - const: gcc_disp_gpll0_div_clk_src
+            - const: dsi0_phy_pll_out_byteclk
+            - const: dsi0_phy_pll_out_dsiclk
 
 unevaluatedProperties: false
 

-- 
2.34.1

