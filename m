Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841B3BBFD5
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622225; cv=none; b=qVKhJIFyiKZJxqCDZmkm4Zr1KhkB8CjidnPbz9OxZ1VhfPGtZeB7+YYzMDwrJC6oyYdf8J5PgEXMAZ2gfNjHFWTYR0wuEBWYNdgS2aj0uyNvsMFZ8pNVfaUsy5e2GxA4KcMKYHFW7W/ATEPDijvdXSiI6MSeYDp4gHFC93i8ZMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622225; c=relaxed/simple;
	bh=OFYdaxvsoe27wfCG/5h9SJv2ntLwSYzjwxXQ93Y9juc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQkNz9kkm6WSpGRDK0ZjE/de1EFIje+etKxq5EXwNcBo14NXdo1SxIforfkiVbu1pUrNAdO7mgQwUjDzoJjOYvLrxl5G3SnFkC34+D/az64K7VK0M9/3GshamFIDKumQ839DxrYA9tS2OOnIu3y0cnIMGMYu8jTIdmXvpfEwVBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfOkxPW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SA5cFi1p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfOkxPW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SA5cFi1p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6QRab3884234
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7N2qhWJEwPvjKYD7NMLYNhybtP/9h93btwullN5HdU=; b=WfOkxPW4XMELi+z4
	pd9LzxAWtwl4RlVJVgBBZfVNj5pkW/qy2tArHQVo+o9UBpXa650Vwtr9+8VXtmdD
	K/7FBBPTov3TJ80f9944KgJ8GfPYzI2MUssNeBJ/7f1WqQK869yD/gUzvEqHPRhD
	j3qPkGkArtxFKR185kQHbco68j0IEtIJ3F02na3ScofqPmtwfTf9wFolhEomPgJF
	q48ISWQSL968+/M6HZse/FmlP7X9I6jBss3iU0JZQ2bL8Qv1Vaa/2O5iracL1bzi
	1q4aXbZXe8TDjFjHuyPqv15lQpowb3Wd/How9tu4HAmv6S+n7IiU2fMKk1Ln/I4f
	lp4tBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcb805-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c19493ac2so3198001cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622222; x=1785227022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7N2qhWJEwPvjKYD7NMLYNhybtP/9h93btwullN5HdU=;
        b=SA5cFi1pmPnWjOBolxSwyS/wx3fzODUbsR11NXifTmltpBU9Xq7QK0v3PaGSM2SP/x
         koMSNKMxGO1t1YZBydhWMaih27O9uilEUj/Pw95dEfqklH0YIwAOtvHvAAnQP1wB1sNo
         FZI3eN9N69tOBqCqI+eaMQu0h+m4aSS0JesXRrkqrfTKWct+LCfIG4BXXy6ByL0UPd+2
         L3Vr1sUhLheUWUeMvmmH5T/sohBbhPHgpW8qG/KAseWn5IVuX2t9B5Y9j/3DJ7kKvdqo
         HBmRkqEOZKCUaoBMl93zH11p0BH53IPeBErxum7o8JvGigAfeUnSapWs1RQFZIwlpFBk
         1cTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622222; x=1785227022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7N2qhWJEwPvjKYD7NMLYNhybtP/9h93btwullN5HdU=;
        b=LXOca1vlNVkt04aIXYSVtmRU3p6HkkcQTUot+4oznFdEM5HZNFraXUn/ZYdgrSl3a0
         dOAJR14Ikkvz6WpzWoy3T3X/WA2PCE/mKl+WZKdKvfNTP6bx2V3ipSj9SCgHAD4ttzyj
         OjTMqMycAUXgOSygsmuvpQFQayQkd82YeYfwxHkr1VJS4vqY9rkcexnp2Aa8kDGsYNWI
         gSeqO+C+r/tHPfeNoYjWxG9jGGxJvudwNsuycts+OVvcuUajZJPY5f6qCVabpSr34fSI
         5/xSuL3y+0D4VfiRhwZaTyc6ZieY5CGLW8oaCq5YW6GaOQTo4ln0kuTHiEIrlvDfsaUu
         utGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqG+xRKzZQJMNh4asCgzSyJc8ldJcucFv+FAT6rnnkSaVkrQ5/4+HVZ101lKsdA+mri6gd/DhOZXEm/@vger.kernel.org
X-Gm-Message-State: AOJu0YxBt48GfdZl+2GKNq6DQsz7ibp1vy4yPEq3rcxOn5McCFWGMz+B
	5rgm+9l1Q4HKcHeGtUk8iFy2S7HFrMf7a9O8F1RkcBDco/RJ6b6kiMLqH9ZhhOS6VHNyneLPtQN
	CIYbghlLcLhVl/ZxPQQqVgqoamcUSNzxFzklaOTj7O7bvG1gSLTv+63Adydwo66wR
X-Gm-Gg: AfdE7clKkYQV8fSUWIe68UZ3vPQDLFzdgiGZaiSZgq9KK6a8fwH9z+SymRS9hleP441
	DFzfqhU4JIJ6WlzjF7gRjthd8obMhxE016KWSj7xMLs7H9xUjF3/grk7yEkTE8MZ6YmyOWVrH0c
	RC5eMifK8YdQzhEuWg79vVnnCgT2RIYLmAMB3I48TghkEFxstBnZfg47xFe24ROD8RSCOGIAjwA
	E7JyWmOLWwv/9Mwt5th5gc/EtynlKRpVmEKv8FfXd9NVufTKzGaaNalx7ohIsavso5444a97WoZ
	eebD/F2FULN/Ob3rLre310ZQl2+EUfuDCtkN6Es3mtzMTDkXWtgzTXQuQ8uMU69EzDWcP1H/RAB
	t7B0209/K
X-Received: by 2002:a05:622a:2309:b0:517:580c:bcd3 with SMTP id d75a77b69052e-5213c5f3e3cmr155578721cf.19.1784622222274;
        Tue, 21 Jul 2026 01:23:42 -0700 (PDT)
X-Received: by 2002:a05:622a:2309:b0:517:580c:bcd3 with SMTP id d75a77b69052e-5213c5f3e3cmr155578501cf.19.1784622221704;
        Tue, 21 Jul 2026 01:23:41 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm38202194f8f.24.2026.07.21.01.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:23:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:23:29 +0300
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-remoteproc-eliza-cdsp-v2-1-f3345405e4da@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OFYdaxvsoe27wfCG/5h9SJv2ntLwSYzjwxXQ93Y9juc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXyyHzm/zfWkzPa0JLDVDUOjkRVNaCNwIs0AMe
 T731h3quUmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8shwAKCRAbX0TJAJUV
 Vkt3EACShriWTmJXPXB7rDQWt9vo0OrXi9rjxtziBc3ycBrlhdc56x6TSvNAmUQPcUNbnrht3cN
 XokfmOgKkO/ILjjKJ+CCwdPsIatx/r7tzkUMex8yfI033mUfoAXHZ1XVRMwQ/sTYts36RLF0DPv
 6T1pZL8ExoSI7NA4Vm0OKUf7AZXWbggcTQwpzmGb1ygb0U0Jd8ugQAHNY1re4FVO/yO6hPNGvio
 9jp9fckUMD9Dd3vhcw2n55EagGttJoiUqKGfYYvpm7kyVPmhhznMHZe6TfJe6+QaHtzU+ynP+GQ
 q4lgEJ9Lbw+2LwK/9uvWZC6iWLhDGAfAf2JR1eWcTUu6gWeummQWCqO2DfGsx5JKaYO0zVYs+eI
 s9RdAzG7iz5IDTZ+6xaG3C4j27seeI0G1Xd8kgUnoGwKemvzdr0vzOAUL7YrlKFAKlCc/XwGpVS
 WaGxo5KhAQNNxE4OO21Z4iKyfw1EMPIYjoOuJT41OUJ+DIc/qqWQeZgCr48+UpWLeRorge7dQpz
 0TX1EEITqvK6i/cTLXJwlEQkNdt/2s/yTp06C2z9CMuuoP6A+/ho3HwPjOSAXIgQlQ7ErbGa0yC
 lo1YHY+aWsK6Q0HBF+g4a/OcEq0kwClFE93ITQI2rSvNHr2ltVG92DjZ5B+aXTaFFASTNMRutE9
 YZgb0AqvMk0WZfg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX5Y+++CdEa8w5
 zn6Y+S4F6lHR6NLBFePKHor+msQ12RU02lQaOW/lFoxfapxQTKyLSxSqF/dbLjNFUlMlEIbP3CF
 ddLnaoERp4xZgX4kYejxj7iN08U1pw8=
X-Proofpoint-GUID: BmD658canhNy4HzYGAjkr8VfHXieiygh
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f2c8e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rtpznyeJ5wwxryUDUUoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: BmD658canhNy4HzYGAjkr8VfHXieiygh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX9Zi6UvufnhHY
 o1YgOnbqXe92fejiNL54xV9gQdQvwIvkdTSrIqxUtlOlTbH+SsKiO073GgMMsawKysFIXpUykjx
 G839r97APP7cy8jlooj110IhoLz0OnQ4FhEbzGXXSpa0RFpLthTi93doINEsDGt2qblKOpE1XLc
 LaFJQct1iidyeWOjlbhz+YOXAXUTEoNxF3vNvJKlpbAF3/6oh0n4b0dDoYdU+64ztqHATtPAZG+
 OBAQs80PRGzQw3gD9s9vNINFZa+sHfYAE9vfv6YWFXDMZfaRRJR6a+TdZR2Lb2c2nx2v+LRgknD
 tLqoxc3UcHOIb6+uvSg/3w5LNGrsV5R8yo5thMRlyxqQHwfNVoc+ea7ik93S6xUYsYU1EgY4UqT
 pz/RVyu1Xr/5YwyaFm/vwNTq35HiKtt36NLL+16w7NEx0hx2yxCRq7S1n9LnKDxR4CB2nyjZd/a
 cz5nhTMYkMoG9hnuMrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210087

Document compatible string for the CDSP Peripheral Authentication
Service on the Eliza SoC. It needs a third memory region (DSM) and
the NSP power domain. Rework the schema to accommodate these.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,milos-pas.yaml        | 42 +++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index 99d7337e58ec..97bcfb3bdf11 100644
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
@@ -95,9 +97,29 @@ allOf:
       properties:
         memory-region:
           minItems: 2
+          maxItems: 2
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
@@ -122,6 +144,24 @@ allOf:
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

