Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1572798F8
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399663; cv=none; b=gjVNpxT7/2/Bb05qErBaqn6zdY8uds03QH6hwMwHHNvHJv6koFByIE6wcCmz3SrW5fpeN8wwLtnU4qDpQxGwNimTLQpO0cenvUPAa46CzF3OAl1AJOwdyYbma+HVV7QncUZljWsHLczWPPhheLhM4+ZmUZykwcegIGLdfqiRDGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399663; c=relaxed/simple;
	bh=EOkEtNOT+8aXcaxks3bgxHBrXFY/OidYwxMibsB6Zws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sMhtYmJOmQwzNoquOL7RV7Gl+37KpC/1e1VOBaBye+8GXtJOdrT6Srs7haF92GgZ3rp5nZkhVxCFHYSEsQAW7YE812gIsfxHs460aPFUzm6PZq3LmDW+AnFnAP7Cq6n5wtDcPLDK0tcbmoZJzE2XMMD8eTOdleodBR0PF030TD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlIZf8Rg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8pncCaS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlIZf8Rg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8pncCaS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63570Fcv1391850
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 14:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09A3PZL5W90G3YcBWGWFC9iLo2x5tKxQK4Q/L2pjHfs=; b=BlIZf8RgfOFPdHsl
	KtSIZceFaKmMm8lD3qeOP3O+zOMBDOx/avCrtf2MYamKAUyMa9fwWc6LijNKgIrD
	iv7eHJUphPCQ8WpO0C/2OeN8l6kD4f1IuVY7/vIbY4KbXDS0hR36hqS8Mrz7CLDi
	mzootK6AqDNi6KkaWs1JEkYEb8aABHTq84IKpwypVT/bSWfnW3qAwweYJ8ApZBkR
	lbfcJmwXbPdZSq5OwiCO5W7cL+d7WzHvBiE8Vi2u+sF993aR/Hu1njO8X7KuQ/ZC
	b+dWUN5H2iQhnndJoKGElLM5hOhBS2K5/4IHPtTnAh/oTnQet+A0Ls2wvSyg7jR+
	pG1FuQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7uanyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 14:34:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e4c29caso6495561cf.0
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399660; x=1776004460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09A3PZL5W90G3YcBWGWFC9iLo2x5tKxQK4Q/L2pjHfs=;
        b=d8pncCaSNaXaiC5z/Y8B6Vrrbc8T3OClaeWIp2GQBnDg6VU4oBDSAuFCkozGFgi3/h
         tJ1FiBkqLFec0+5GKmKLKBinwjgNVbRdjObK4aY0s4Wwby/y/Ca7ZtFW69RLrgMg6fML
         tVYHYYl1GffosIcEjCWUU2D/jf6bFJMmswt/U+vSSkuELHUqrSUIWIZcDoxv6kYSKDMu
         1p7L/t5Yy4ljt8bq3dvdv5wRomtDuOzO5XUHE3unYoVXd8iUNDcloswTHvaifzaIQ1zj
         diz44VNVblD8Pa4mUoMY6J6MStF3Qb7RJYzIRogLMeYngAxWEfR9tEMQMsE+fXBrhnwM
         mWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399660; x=1776004460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=09A3PZL5W90G3YcBWGWFC9iLo2x5tKxQK4Q/L2pjHfs=;
        b=Zx1Bpr8eYSVwoFOMMJJoM6lUsB03NcYPvrJsCjtNT9TlSxO0+KCW1xJKZ2+tVynvQc
         O3MYHXB99ITCLiLj1ExwHFk9+mKzEH8z7mdAVjvYKUj4km6+Wjm6Owc6wk5N/bkWOugF
         TV6MiExpUZP99ijZjb1Q7QhmR7+gKb58PAAHl9XH2mWKvcWyNyJagPskzrmjsv2eLVHN
         FoeoyCYCR/m0440m2NTdoQTSx5N/Mmn6RynO8JFnTe1twhnZLJC0suiHNZweQt6ee1cK
         5M6/EAXfqZX2H59W8UgC/q9zNH8TCC5AdxtZ7fY2yd1Ghgf5Tm7BP0DWmjAZiOdHrllR
         tIBw==
X-Forwarded-Encrypted: i=1; AJvYcCV6CmU9hjp0AVa+qs08Mp7Hi8HHonRraUlT2Km2Ww8Of7ZrNVkZ6gGLtNl1/0GL6BAjiaikRL5c1LZs@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7Eq5yLFR1/Rzf/hbUn4ol0CoWcXTqUKJa5DyqattsGmmjxK7
	LiUzplyAPuBZWO4VSOKUZh7tNQTVAHFDrH1hH1SmQ94UB9br/ckPV9XjCXhLIzt9YDCVmds/Z5l
	T3toZURgoopbKFITCQHMqASooc+CxJyZTN+nIA7FVcL3cukdiuTyOXl7M2E4Jdxca
X-Gm-Gg: AeBDietYbQAHOlw7xWhRm9C+XFjK/I3ym6rKwunbrKwnHu/wo5/MEhsPGo/WStdytdT
	9TTXFlrqWKpA3XpeDZsA3Fe3yqU6THFgFm2zx8lhzUoyLUAXucinE2na3G0uDOo7qeE/YLAR3KW
	AnIuF5XkHm4HcQXo+B4SgpzrNyJ4edGOjJeAuk6u39ou09iEUA4fhURlRu467yjJ68b7GUhY1Kp
	CotPHZa2tYV6u2Zc65LL8yR4cyQAcvav6tjpEXKwEWVZumfthHT3osDMrXgkGOpRyDSeXcUz5K3
	Bo8HTw6prVaTvAsDBP2jAkL/pwKYM3UiTGQluc3Ven1+MKXnMXANwtOG/WzF0+zU3Ze9Bb6vrAB
	S7jArM/wKAvrqSITerrzPr1PM9EecW6OOuQSjnIy0p6QN
X-Received: by 2002:ac8:578c:0:b0:50d:6ab3:1acb with SMTP id d75a77b69052e-50d6ab31ba5mr124019461cf.41.1775399660398;
        Sun, 05 Apr 2026 07:34:20 -0700 (PDT)
X-Received: by 2002:ac8:578c:0:b0:50d:6ab3:1acb with SMTP id d75a77b69052e-50d6ab31ba5mr124019031cf.41.1775399659990;
        Sun, 05 Apr 2026 07:34:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:01 +0200
Subject: [PATCH v2 5/8] dt-bindings: display/msm: qcom,eliza-mdss: Correct
 DPU and DP ranges in example
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-5-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EOkEtNOT+8aXcaxks3bgxHBrXFY/OidYwxMibsB6Zws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLbM2AewbgW90eMtXRPYcZk00euiw0da6sNM
 mVWufQLjLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy2wAKCRDBN2bmhouD
 1+CgD/4pzOmY205An+ABBRTwsCBfJKqPrdxefVHALEWnCfKmZkhKJcThpQ6jSXzXTg7dh9f5xnD
 Ta4jGfx8N55HbLg6mBMMGC59noBcvqHi3cf+Cq4Z3+evIHfyUkGVw/JnuXCM1DUwpaoFr73Yv4C
 eROoW+pgjNC6jkGqSSzziamysKbT+z4RZcoXLc64tP8F/kGx6W1IV4eVC/DJ9DuMrD+++eCes5r
 m40ecwVTJRKIWYrns0TM08fsjKxZvej99CQWCT4Bqb3owNekF7ZSpqsFtg4fh9OZZGCurXqo874
 a97kDj6gcSkLfm6B7HdwWYol2Od31jdS2oMWt+HKSwbJl/KhXoUAoSOnDQOqHkB7M1q9aF3rdne
 66GqGR8FNbhCvanucssLTXSHM7Sqi8nPpnUy2PmG/8zj8M3kuHGbOqGl9h+Y7SHrnw0nHdGlc8s
 dQEKaZfh7p5FRo2faXNzVetot4cfgNarv3+1agGqnvGwOl+N2VFD4Qq6VPUZxKQQMrAgVtLKAWK
 HsoiV3JooAd9NGFA6hS85k9eA+p7GlmRmA23HmEevj6b2KDKotlOMx9ds0Tt0DkJDzuK+NYeX7W
 mySY98pU5SWL7JZMdGciP/x9CwJj9S0s8wRUom2WWrjny6RFjPNNgcjV8E77qt7ucBXY4Frvgs5
 ax0Jeh+JWKZp2hA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX5WoOAYgU7CIj
 rIlS+rJFeBiOCYT5cLWgcR4mjZPQrxyD8k8qFLKpQvkkOcKKJ618p2RRggJrOi8AuDh2AIkcHNr
 eF01cmb0uqxkhJu7KG7qc6SDtwYf22/9yjLJ86HAIZdsEJbnSvDBiQgwra8E6XA0QALa0xCV1w/
 57F+PhEtFy2u9ehEnjOxIFd+pMjMBOYK3MgZUem0Pru5mIb2iziIBdI4DOOg0jy/Z8i2fdn3EYJ
 7ZETCFgI7mmY4q8ldOPX8qzD7tds7wiEIVGuu5B0tn0jkuNPaEJu5aMEfZp0M10lkje5ZDOLEEl
 +u9d60SJlAbsov9Fq2b9Y73o1Tpq4i6ZE2RyVo7B/hdzuCQYo7FkGAD+p1iNOaXY5sv1fRc8tBU
 QSPrawYQJSYun/yPjwW3zbAOH0bYjZGaQIEIMDZkEgLEhI0fr7aXAO+SW/Lu43XV5fyiB+eYlry
 FJEQfLg4pqzkk6i+vlQ==
X-Proofpoint-GUID: UAklefTWeEqhWwd8cH6-UdVQZw54scKP
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d272ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2E8fMljBJZ0eQ63lGZAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: UAklefTWeEqhWwd8cH6-UdVQZw54scKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050151

VBIF register range is 0x3000 long.  DisplayPort block has few too short
ranges and misses four more address spaces.  Similarly first part of DSI
space should be 0x300 long.

No practical impact, except when existing code is being re-used in new
contributions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,eliza-mdss.yaml        | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
index 47938d13d1ca..bd4ba91a171f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
@@ -119,7 +119,7 @@ examples:
         mdss_mdp: display-controller@ae01000 {
             compatible = "qcom,eliza-dpu";
             reg = <0x0ae01000 0x93000>,
-                  <0x0aeb0000 0x2008>;
+                  <0x0aeb0000 0x3000>;
             reg-names = "mdp",
                         "vbif";
 
@@ -304,7 +304,7 @@ examples:
         mdss_dsi0_phy: phy@ae95000 {
             compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
             reg = <0x0ae95000 0x200>,
-                  <0x0ae95200 0x280>,
+                  <0x0ae95200 0x300>,
                   <0x0ae95500 0x400>;
             reg-names = "dsi_phy",
                         "dsi_phy_lane",
@@ -388,7 +388,7 @@ examples:
         mdss_dsi1_phy: phy@ae97000 {
             compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
             reg = <0x0ae97000 0x200>,
-                  <0x0ae97200 0x280>,
+                  <0x0ae97200 0x300>,
                   <0x0ae97500 0x400>;
             reg-names = "dsi_phy",
                         "dsi_phy_lane",
@@ -407,11 +407,15 @@ examples:
 
         displayport-controller@af54000 {
             compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
-            reg = <0xaf54000 0x104>,
-                  <0xaf54200 0xc0>,
-                  <0xaf55000 0x770>,
-                  <0xaf56000 0x9c>,
-                  <0xaf57000 0x9c>;
+            reg = <0x0af54000 0x200>,
+                  <0x0af54200 0x200>,
+                  <0x0af55000 0xc00>,
+                  <0x0af56000 0x400>,
+                  <0x0af57000 0x400>,
+                  <0x0af58000 0x400>,
+                  <0x0af59000 0x400>,
+                  <0x0af5a000 0x600>,
+                  <0x0af5b000 0x600>;
 
             interrupts-extended = <&mdss 12>;
 

-- 
2.51.0

