Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109B46EF77
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925945; cv=none; b=Xz8pgF3sUF0fUdv26bUB6cFkmuCfsNH8eNZEiqhThBm144lwkRQlWeI+Dd9j0tPNeM3hxH0W5L4jt0ruFGgmaAmNpBWi7/82VcUCP/LjkQSGeOx6Q5Aqt5tDcr5LQqn0FEbdOgf3qhi7JqjtNN2LnwfeHnTMFP60qD5wDv10Nz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925945; c=relaxed/simple;
	bh=caxf4nP0LYhd5tTHzg34r3IHakvLdeyikIWGEpS/fMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ot0Gw98XrYLRZx0ov02QSWKizlsOUbMZcdrmTJ2mZC6/C1SJWHMhezYlaW5Igx7qi4veRhg/ouqSEYXzgimUDlsSwaXR7Ko6Ap0R4dbYQo22RYrQ6jXrtPCjnz9AotM8bKmvj04aRggcEgy0lL9th3unZgLwwSyPOD6PoyqMycM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJJm6zRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdJu5HEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJJm6zRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdJu5HEo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDlXuB3281851
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5nvjyWQigaJq/X70FSOqlsHb5yUcVYouF+wJkhwBr8=; b=IJJm6zRlwgC3LIRR
	Qsl+RRGaixMMNMB8vt37n/3o15KRcAgacEop/PAOXaDLSHDWAq4zWiXA6rOHoU1/
	wRY8jyL6tjQ7aUhNwr1u3Z1LD4RehDK4BM7xhyj/8Ux12o2ZJwUyZx6d12qERO4b
	+wXJABugKmTdcE1tTJR9vCETOIFK6B010OhDeFfX0nEDyq9qS4y7/UZoI6RPFHSc
	rhhiwWW2zALuM6gdSG0usU+GOt3KzemyFNigbTM/JIWl+Whakt9AgaYOZjRQXrcu
	8gTxDmHCSLXfwPuTnzClNvxc8P76aHs0qixAr3eSvL8yx47wbeuO/Ii6OmVyZkeZ
	wxBx1w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h1gkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e80385dbso230502137.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925941; x=1788530741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5nvjyWQigaJq/X70FSOqlsHb5yUcVYouF+wJkhwBr8=;
        b=cdJu5HEoehWoSJDfYNnP4nHFrpm6bTpkM4oUeNkhxcR0q4I5T7SpmQWAhHnQd1FDE5
         NKKDeOvyfOg2azZ5HLt3kUJyzJEyvazo6lCoLl288gc9V/oRBbVHftHPnv/a+GWruobV
         i9eVXHBjfJMy9FVmudkNdVSmdQONnK8M+73Q+NvyEXMhpngacGkpdBIEMznRgBAvN48Z
         cnw3v4G3m2bA9Z7s94H6OahgoOW77hnRBgaB7OB7HBEV0CGokDyhKa5tdRMhOZkM606h
         wpr9Q2XqOM0aFbe/6OhVOgwXErjetzNTPWgLBN0JbFODcyR7E0uMynSTv7ko0dKebQLr
         rbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925941; x=1788530741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5nvjyWQigaJq/X70FSOqlsHb5yUcVYouF+wJkhwBr8=;
        b=DfH7DCZjcjSAvvSnaBaVikMGFpjwvVphf4cXzhS5VwXpljNPtWRQHjLBWTkdSCZqCE
         vjtmXMveZI5FqetBSTWnj05KyQxVrwymvkQn316RrmBKXanCbqa4UR/tKs73b2I1CsQj
         YyoT3Lvv8TM/SUvta5x8wxwujgeP4ewCN5aNKxY99sFLqob1ucB87ILloUUtGEws15bc
         Cp5qWszCwrI1TbIWHmwqmyoVSqYQZ6XG/HFsaAWN0QY05DJxE8qLjp8z2QBfSQ8X0uvp
         FfQJppjgqWEWB4h/8i/rgGJ7HYsCJ1I3967BpzwbJmy9a9ufolvd9xMIeUqRPBKLkLS7
         hsVg==
X-Forwarded-Encrypted: i=1; AHgh+RryjlU5LnwLOwKefvebQDjmbe6ScXT4NkJ5OVGA29uvMI6Tt8OGtQ7eOV1VsFLU0iKTA3AI+nSstswE@vger.kernel.org
X-Gm-Message-State: AFuF++kU+LpEKlFIufp6cbDoLtwWiDhkE6DjX4UuFLHxqyZa/cbivA0V
	sL8gOosTviASjWx9oPXE7Co0feQyHQcl0vme3sax8rbXxFUPcVngXF2pLAOsOZJP3p4uT5XgojT
	QgpccNs2XC11aChR+TdMXeX8HCmwYCKi2zljowGy4YcZjq6k7QqmCcR/IHgZsVJs7
X-Gm-Gg: AR+sD10sFtS1ivwdI5Of4zB3UD2rhixdwXJ/2eJ/G68D0OOllI/KIcqvpbAmiV7YQIl
	9qb4mZd4FFaxTRb8BvVC597brTuGJ6wDgz9MZcV4LjCHY0AXvYZvthOESQWToMAa8ApmB+vuuE1
	hXybTuo6grcRe1dGv2xmI1vR5V7UPFzr8JOvEYC7sq/5hK+Lal0oqje3eUzPlIClhTcvJ9BLkcp
	glwAjCcAOhjArlnY8+Adxrp0LGnYLp6oVhkKx/lwiuR3uI5XjWCwWyjdtaaNHGGiu/NqjqeA/hs
	amWz2Ldd/EJKFO/Owt7FC1zbkdgnFme21Fw1MuB1boFrTNJwRjVagmBPiTRtqPCqun7Zv8vAD8V
	jyjKm/O4iykSSy+JYZT3YpoI=
X-Received: by 2002:a05:6102:f9b:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-7859946b444mr2147826137.11.1787925940865;
        Fri, 28 Aug 2026 07:05:40 -0700 (PDT)
X-Received: by 2002:a05:6102:f9b:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-7859946b444mr2147768137.11.1787925940211;
        Fri, 28 Aug 2026 07:05:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:03 +0200
Subject: [PATCH RFC/DO NOT MERGE 05/12] dt-bindings: display/msm: hdmi: Add
 Eliza HDMI TX
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-5-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7950;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=caxf4nP0LYhd5tTHzg34r3IHakvLdeyikIWGEpS/fMo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWcR5kCraTeaFlb37qcnOqd4rhI8I3jzoXSI
 zJeI7SgTV6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVnAAKCRDBN2bmhouD
 193pD/9Pw8KOp7bE0U7nphpfhHH+pJ5kmrc9xszbAWpknu41CZuqBNzvnIVmI/87O3l04yu+XM/
 nIZXHGSfzXXT3/VCAi/PMq707DZjAL/y39fRt2+ctP614cFbko3erU81p7ojZkGqEcZY6eH8puL
 yIwxHDEmOcdiJR103GYYowj+hBdedNMvx196rHVh9QJ1AMwIOk8llTZVKg4L0VFnBqDUJnutK9S
 Xgy0PldBUDOFC5SdLr6jv5R2vh8zYVbdL+VTvTGcKSKVetvgkW/K0Y25ThXx70xBMpik+W9Udsv
 EubDNTKHwL2qFLFo+Q6L2BwQskm089cA7Q0zTMdJDbZWsa2Yu1LJsbgEPAiOb+f3CMrkiljvidx
 JHfqVQtcfw9wSnxz7v/y5v/l0f67OIvX5a69xWT2Yjafyvjlf4f6FSgfuSxdqEuPmtyMWv9JKC1
 Zu/DbOZAA5Hcecqitowd1arraQY9pdxP0JY95lc9/05K9sqKXvII2XL06xIZ2dJYR3lGAsOltXt
 fDWwLDAgzHskVUCiU4G6IxqCmLSP4qSsg/dgfeOtvBBmR+k7WbFj2+iOoosSwNm9xJEb/u7H+w9
 liGE2Wfk14hL1+/7opR6DhrAsyFy6xiPYGoRh+aEKoFkcTiw7uTLasmvPbgHgjJv6JsXITndgjd
 8AB8HTHR70KHKaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX+4y+ZgZwRlYf
 sWVNG+hCE+bppJa2NwHGev8z2tWymwbi01fhI1DK3m0jEJS4by6W2T8wDQBcUlMZX2oGCGfparH
 cOXqAlj/zWcDexr7k6ZJf9uloRUBmn8=
X-Proofpoint-GUID: tIQe31sI-vZCtx_CnNPZYd86aigaegM0
X-Proofpoint-ORIG-GUID: tIQe31sI-vZCtx_CnNPZYd86aigaegM0
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9195b5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=U2XnKTW_qBCVAJQLEIUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfXw8iM8JJQEiSp
 jCsxO9mZ9lKUQPkABVAyHugPP23vRu3TqlbiDE/GRC86jfeF2gqyIF/SbcJRQ6NxNAX0oA0MDOF
 PuHPt3ALeQ3Etmqqt4xgPO64+e5XklaPkTQeAVnelMvG31dwVmw63DOYrkCgMlSqn5CSTk79m4E
 PgxMmX4j0kS66WyhUkd1re36IFoZUraOhzAwZZhMLcyM9EdmDmTFLnl7BthrR9vuGqKPWtIhQYX
 A0Psr9FRw1tPxPu8KngiPZOX2WzN/XSCsM7LTZpauAcwYrnZ4tORuRiZep/atwB6HjX8Zl6ghE+
 M9Cj5xa+E45wYUJW+kc0ehb64Hn7XXXhBbHkfojwxAGNhHKyi4Il4HoEepHbXwZQQAxY//h4pNQ
 xL1wfimxhLu293LkYykEypq5IS9Nfi/KMDb9asUFLefheYZmSOG5c/edYpjNOS7YDA1tqyDUDCV
 18fdFuVaG5iyQFMpb+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280122

Qualcomm Eliza SoC comes with HDMI IP block, built on top of one
previously present in MSM8998.  There are just a few differences in
hardware, mostly about handling clock reparenting, but more notable the
old binding looked incomplete, thus devices could not be considered
compatible.  The QFPROM MMIO space is not really part of HDMI, thus do
not include it in the new device support.

Document also VDD IO supply, which is providing power to external 5V
elements, like HPD pull ups.  This is not a suuply for internal HDMI
elements, thus it is valid for older variants as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/hdmi.yaml      | 67 ++++++++++++++-
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 96 +++++++++++++++++++++-
 2 files changed, 158 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 02d27ccad024..6adaa095b747 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,hdmi-tx-8994
       - qcom,hdmi-tx-8996
       - qcom,hdmi-tx-8998
+      - qcom,eliza-hdmi-tx
 
   clocks:
     minItems: 1
@@ -35,10 +36,7 @@ properties:
 
   reg-names:
     minItems: 1
-    items:
-      - const: core_physical
-      - const: qfprom_physical
-      - const: hdcp_physical
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -62,10 +60,21 @@ properties:
   core-vcc-supply:
     description: phandle to VCC supply regulator
 
+  vddio-supply:
+    description: IO (e.g. HPD) supply
+
   hpd-gpios:
     maxItems: 1
     description: hpd pin
 
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 1
 
@@ -113,6 +122,12 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
+        reg-names:
+          minItems: 1
+          items:
+            - const: core_physical
+            - const: qfprom_physical
+            - const: hdcp_physical
         core-vcc-supply: false
 
   - if:
@@ -136,6 +151,12 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
+        reg-names:
+          minItems: 1
+          items:
+            - const: core_physical
+            - const: qfprom_physical
+            - const: hdcp_physical
         hdmi-mux-supply: false
 
   - if:
@@ -159,6 +180,44 @@ allOf:
             - const: bus
             - const: mnoc
             - const: iface_mmss
+        reg-names:
+          minItems: 1
+          items:
+            - const: core_physical
+            - const: qfprom_physical
+            - const: hdcp_physical
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcom,eliza-hdmi-tx
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: iface
+            - const: core
+            - const: extp
+            - const: phy_iface
+            - const: pll
+            - const: pixel_src
+        reg:
+          minItems: 2
+          maxItems: 2
+        reg-names:
+          items:
+            - const: core_physical
+            - const: hdcp_physical
+        hdmi-mux-supply: false
+
+      required:
+        - core-vcc-supply
+        - core-vdda-supply
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
index bd4ba91a171f..6f50f7106c8f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
@@ -63,13 +63,22 @@ patternProperties:
         contains:
           const: qcom,eliza-dsi-ctrl
 
+  "^hdmi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,eliza-hdmi-tx
+
   "^phy@[0-9a-f]+$":
     type: object
     additionalProperties: true
     properties:
       compatible:
         contains:
-          const: qcom,eliza-dsi-phy-4nm
+          enum:
+            - qcom,eliza-dsi-phy-4nm
+            - qcom,eliza-hdmi-phy
 
 required:
   - compatible
@@ -79,6 +88,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+    #include <dt-bindings/clock/qcom,eliza-tcsr.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -405,6 +415,90 @@ examples:
             vdds-supply = <&vreg_l2b>;
         };
 
+        hdmi@aea0000 {
+            compatible = "qcom,eliza-hdmi-tx";
+            reg = <0x0aea0000 0x1000>,
+                  <0x0aee0000 0x1000>;
+            reg-names = "core_physical",
+                        "hdcp_physical";
+
+            interrupts-extended = <&mdss 8>;
+
+            clocks = <&disp_cc_mdss_hdmi_ahbm_clk>,
+                     <&disp_cc_mdss_hdmi_app_clk>,
+                     <&disp_cc_mdss_hdmi_pclk_clk>,
+                     <&disp_cc_mdss_hdmi_intf_clk>,
+                     <&mdss_hdmi_phy>,
+                     <&disp_cc_mdss_hdmi_pclk_clk_src>;
+            clock-names = "iface",
+                          "core",
+                          "extp",
+                          "phy_iface",
+                          "pll",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_hdmi_opp_table>;
+
+            phys = <&mdss_hdmi_phy>;
+            power-domains = <&rpmhpd RPMHPD_CX>;
+            #sound-dai-cells = <1>;
+
+            core-vcc-supply = <&vreg_l2b>;
+            core-vdda-supply = <&vreg_l4b>;
+            vddio-supply = <&hdmi_5p0_reg>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_hdmi_in: endpoint {
+                        remote-endpoint = <&dpu_intf4_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_hdmi_out: endpoint {
+                        remote-endpoint = <&hdmi_0_connector_in>;
+                    };
+                };
+            };
+
+            mdss_hdmi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-150000000 {
+                    opp-hz = /bits/ 64 <150000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+            };
+        };
+
+        mdss_hdmi_phy: phy@aea1000 {
+            compatible = "qcom,eliza-hdmi-phy";
+            reg = <0x0aea1000 0x1000>;
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&tcsr TCSR_HDMI_CLKREF_EN>,
+                     <&bi_tcxo_div2>;
+            clock-names = "iface",
+                          "ref",
+                          "xo";
+
+            #clock-cells = <0>;
+            #phy-cells = <0>;
+            power-domains = <&rpmhpd RPMHPD_CX>;
+        };
+
         displayport-controller@af54000 {
             compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
             reg = <0x0af54000 0x200>,

-- 
2.53.0

