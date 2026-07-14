Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3D446841
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031874; cv=none; b=JxIuD/myd1MZoQW575KKF8LQitKLnu6mZ4GwFKPk/goyaFt/C13t5ikoXahPwMQYlBW0BIKUCkbQTvCtV6x+moTtueBnSqPyWpjk9diPQ3XWScPHaEFJCGy0voffaCYhiND7Km3v+UaqXtn2yTtvcG5BwdUUKYcuAzUTqI2l2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031874; c=relaxed/simple;
	bh=ZbiVgqOd+DXPuFr0s+95PYrcUflUxC8oG5+m+0ZXq+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mzCDEpm3jqrZ2jm/8+JizLV86wvTOMacTYPOn8LG+/CqJv5yZRclWYYVlixt/LgP7Lb9uTiYYXmCSCu+uYkk2mUZKaBkDG2oV7ONuOt4PpqAikaMYgK8fhe+j7K9hG3fYLOAHbcB1CkYAgbiZH92CAx3j2OOe747KbRvvu1EY7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh7VEcEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3JzpZQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zh7VEcEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3JzpZQO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO76p356056
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=; b=Zh7VEcEB9kSelHN/
	KO1y1Mxe2GP+Bt5p/our5HjiHVGccZaOqNc/jEXY3sxZE8cPFeY1hJY1pEX6xT1P
	ZfGW85g7wyjSp03lqG4zaypX751QiWaLsk8ACp/QcZSLvjrjK1lWrQexng+5WM8S
	gloJQ9qxo3nz9kAGKFgBj7ktW/PU4G6cSh6ovUwuwdqVc1FXc+3SbNjwMwtqNDdk
	UCFe6hN3JvqmeMIC5sGfzcpEf4Ha34CvJLrmpSemRKJhhEAIlN2yqB5ybVQOOVrV
	Lb/Gq75z6H+C4pGXaH2y/Jr2n4VlsjtQNner41Z35I7jN+dEIGwIq5WiEU4IwPyE
	nMlnfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j3pg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso10613231cf.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031855; x=1784636655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=;
        b=G3JzpZQOFf9annwldWxOkrR/WMYKes94fjBa4+hElQAkFi9pKK4DIE5jGBnKqCzQOG
         bM/wPNhq5J7/yjmsUmSBZSoZWpQM3GeWgwpHod1dS0ec7VZn8vCEHBtTyBZz2tphIoRU
         Jb7YFZPMYgpWPEgFo4sWZH3U0U47AZE/I7Jm/xKeBWoQWFTxRVqEKmD7qBYxeZQOLBJW
         FEska732qYcCufC/d9kUQ+Hg12teD4/XgZVZ/JE894RkowHKFOIfOhwlwhR57KmFwDnK
         uXhXtpsXhK47+vzBnv4V1sCgeETmDAA/oELnn9HdaNG7IlPyLhaMQzPnijfQcSdyb7ek
         m/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031855; x=1784636655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=;
        b=KsriRw2Bi9OjoxJcloOBlx/oC8bv7PmopxU9gUU71IU5yeAWY3eXSneQrA3/mL2OGq
         94GhpEx5w9idT2w+nNHGhs5r5CUw1eP3ZIlf3bU6LZPC4XFh6m3UCE9UKYPNPYF7mwCw
         47mILULRlQj3AzMJf9PT8D2BJ57tpeUnnIGFfGUNqcDWvOH2MyJO4tYD3wxlGEldzHCo
         8Tha6L2ZWcTXJ66DghgGUSXTjj5YxKYDl+sNzjt7GUagVpoUq8SBirH5OT0NEnAZYqQL
         +HhgvLUtmtPyv6d3ChDPcrnm6sSvgbFotyHcUiFm5bq2TS5gJ+TujpNBIn4fpkwcH26i
         mnrA==
X-Forwarded-Encrypted: i=1; AHgh+RpLvHKpNaD1MrTdh08R1jC82Cb1VnolkWoPKyopKWDNC/Gp2j5EexsJ4Sdop0owZEHUdsD7SOR114K5@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6n/nOlIypgrj/SyTZKyw52xsrE3oqL9ZkqwyjEoBVAYKlt3d
	Jgqep4oSRVImYAgiavPmnzxTcZHw4dzjzMprL9oBH0XrKuxv0Nf0i9LbeblZccl+HkKje0WzrZi
	fBlL0ufYFv7/ETcZBlJaNw5EBa5ZvTUg1x0YWVh8ZK34LN7VkrHVroJiJ6UBCKp7g
X-Gm-Gg: AfdE7clOi9V1SexgQYpZ4qdQUaP3ccxz1X9KZ7TJZui4XCBLUT0ubfrqSp0IsIbV34/
	US+g0iYFRteIJxV4U+iQK8+sZP9vaiaEEaNAVvvw+S9tiujlHiv2FUCyPyxqk9xBnetU1ru3I40
	m0aKeY/wU4WVubvgpwN7trBarB8stOJ6gP3P5lKBy+8OP60g3odjBJ7U/DEpNnmBCZCGeV4gHi5
	uu+QBG5iJjJA89Ucb497wKUhtkM6QZjbb/b2q+EkJyB6D4u/OTBGU3OxY6e5G4+JxTeBhZVSD1H
	ZUVsMOtXz43GIZdwZZqzk3TTOzDlg5sleuW8lsJveFnpbG01FNKujYUqt+OSasnUoffuuLHIqDq
	WgOSacaiw7QNL4xg=
X-Received: by 2002:ac8:59d2:0:b0:517:146d:2db5 with SMTP id d75a77b69052e-51cbf056abcmr124478501cf.2.1784031854823;
        Tue, 14 Jul 2026 05:24:14 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:517:146d:2db5 with SMTP id d75a77b69052e-51cbf056abcmr124478181cf.2.1784031854211;
        Tue, 14 Jul 2026 05:24:14 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm77031845e9.14.2026.07.14.05.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:24:01 +0300
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZbiVgqOd+DXPuFr0s+95PYrcUflUxC8oG5+m+0ZXq+c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVipmFdYPKxz1A1D4NFolDf7IZKtdP5k2OQYEV
 Z8OsiItDeeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalYqZgAKCRAbX0TJAJUV
 Vsf+D/92ynZJnUcD+pno4i0uTqx4G7QwwUJkksE8yQwXxgTik41O+Gp0PpWJDJeWD4WrPo963N9
 HvcV3uVG99u5g5hBkM2cqDH+iBR49+C5w7J8cggwN6aJTaQIbo4j6U5Bva3qvrrW/LhPg6nfz0r
 +HZiUvK8+/HQ2dUyb+fqHwVdKHMb23rqQFhZZ91a/BlrywNsAVReaBaq8AHYxFqfsgFF+eVDsZV
 /pkCUffCiWV4nAqlilaMWN18xs+3QRWPWov4Fe4kDWytTQNLEW1X38xf7jx172Y1XK475ukqbjW
 V+ihkUN+0t/XgJv4PRhS9tuipmEZYT9GTmlAB2s9UKpLDjhkbQkMj1TakuLKVCCvIL7J+cy+Cx5
 4w54xIUbRsap5fMYCNtl7BGgmSRMzwkB6Z59EiSzaPFMR0mzX6eDf0/907py84I391on9JyWaCv
 OJCNSLjM42Fnc1j6c4VN1SUyUoZzxQS/L3runTnLZeq3X01xVmGZoIirThY/+13fzvLEKSQEUwt
 QUlC5rWxTnKt45ENUxO4Fzo/ggEETAMNRlbwySdRssfFU3Yrovc9oK4SO09d9PG8jCuRcXsxFlv
 dn27dCtrVVdhnuLyQE94jW51LlhScO6cFTb2xMZADEEtjhZwS9hEOfAGhtttQXsDmJ/Dbvg+QFx
 Rwtu64OZVJI7ZMg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfXyNOziw1TvG6z
 DjKUE8cclutYHDYvJpXz7MijoJrr8Q3YVvzFxFAPYxEHjInaZ/9UDIbUksZ8rz6D2/6u83+GLvS
 sWvOWwWdWBBosmXGXhAeywcZ6uD6WQU=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a562a6f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rtpznyeJ5wwxryUDUUoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: u9lH4HkUr5eL71U7yHotER7k-_eVGbNK
X-Proofpoint-ORIG-GUID: u9lH4HkUr5eL71U7yHotER7k-_eVGbNK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX2WfCIGLbVopp
 d8577xMZPFuuk/DiTZRSM0tyoyO5oRairsR3+hMUYrnLJTROjPCn0Iz98hcI4TcJbq0oli8OSoJ
 6JucQnzx4MIgJSb3L51+FIeCWw09D9b/NnWSalTgUbl8vn1pLtDZJXuL9cxLlY0QCl60Lq5hJG2
 tr50c3oLjFkpmKS+kogmL1ILFRl9Dg3KlOi8FwlQWaDviCfB4QHP+GlUp8I6rgPQF50yy7pCTgf
 MHEEaXoR2TtA3WuM6oxYjuM2btc0fPvxE5JfKvbOy9l3A43J+CNVlzPuHtwXCfPKv1+3OX5Rhx9
 3vTiC88dzTm+jqbYIUIAwrgV8qyBCwDSmgvHBS6afc03c0ZUtxmKiys4gTE6RDDJ9Re52Aq1rRu
 y6IPb6vsRCgUnUBmaAmh3qtlg8bOuMoqS44S195TZ0zJMZi/QYOd0av1AXd0fZdgM9gNwXch4k5
 oEsY7Fbj40zTX5cAO8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140129

Document compatible string for the CDSP Peripheral Authentication
Service on the Eliza SoC. It needs a third memory region (DSM) and
the NSP power domain. Rework the schema to accommodate these.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,milos-pas.yaml        | 41 +++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index 99d7337e58ec..3ee7be3304c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,eliza-adsp-pas
+      - qcom,eliza-cdsp-pas
       - qcom,milos-adsp-pas
       - qcom,milos-cdsp-pas
       - qcom,milos-mpss-pas
@@ -68,6 +69,7 @@ properties:
     items:
       - description: Memory region for core Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
+      - description: DSM Memory region
 
   qcom,smem-states:
     maxItems: 1
@@ -97,7 +99,26 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
-    else:
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        memory-region:
+          minItems: 3
+        firmware-name:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,milos-mpss-pas
+            - qcom,milos-wpss-pas
+    then:
       properties:
         memory-region:
           maxItems: 1
@@ -122,6 +143,24 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+            - const: nsp
+
   - if:
       properties:
         compatible:

-- 
2.54.0

