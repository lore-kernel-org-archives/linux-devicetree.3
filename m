Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59953CC33F
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789811; cv=none; b=ShICM7ghJq0FWwvonEoy4EO7W+8bI6iYz6HqTEqv6jShO18vIsiv6fD0j+3mxJUTGHh1/MfSbrPGs2fSeL8BCmrfskwaZ0cYyra66nWH03SKe4KPfu2IKRRNw1HXLfQ6MlOt9e8aXVNPyiidhD7ff8iKbTUKXA81KdPy35UWwDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789811; c=relaxed/simple;
	bh=8lGlCWqfdYi7aiY1rxiuhydlcqTNR1Zj5JRjcwDR5mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AI1/WPy5S4vKdWCngWCHzWmAEfprso4+llluiAFH5vmFau6L+pQ+qEAXCAHotRbCjY0DYU+MOAS2gRWS8FBM2zU5TOfVEvlN00+FO0cxwixrgGRbSZebULB7BwpFn0CwotpKxQiPmOB/2+YN5rKxSbqFFTs2JCfYZGcjDE0uuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuM8S0Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mte+4u0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuM8S0Fj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mte+4u0L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOOD94051968
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J92HCrkNQWDeiJATR+uKaGVLbk3Fakz4sww9g3DnQyY=; b=BuM8S0FjBz/er5aW
	BgGl3nzdootNhU4ESd+1yiLFfngtyblalz0HcVK7QXroZTczRKYvxZaJopZxoeNA
	8eRUSqxcZ5XBJxY6SRThjLX041492AEra+1Zaj65JfeSx1I/OIvMQaaI1ASbDQ7d
	MCdlpffAM0hIsmn7p/A7mEdAK4Fz/bbkeqXQlnNai0GL0CJuVzcQSjI+pfVMwSBk
	hQGW8bWWp6K3BJ+zRBwT6o2WE/B+fU+o76opx6Xy8gfCzHxLCLpeMXJRBZfEYaj8
	Ecy0S+okY0povkZPALnHHWG+ZSzFWnkvVYwqoIV8x7iE2lj8nn4/kData4ZCnr2A
	ROFvbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeams975-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2329159a91.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 10:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789808; x=1784394608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J92HCrkNQWDeiJATR+uKaGVLbk3Fakz4sww9g3DnQyY=;
        b=Mte+4u0Lm5YDMjYqWgE5sbKwL4QoMhZtEqiViGAtvZg/UQ5gCMpcWC9Hki2yQ4JRNA
         oAndOcLR8swDWkqA84mKTGlTSHyCyhu6h3ukNq9AiAAbI5N32VXWcs5rK8WbeuclDX5F
         l6YZe98V/3NN30D3gPW8Br7orBo1l5lZ2LvButile6aBmE3oHWqjf61lJxnFqiSDt7aT
         ARx9vMinlCA4ET5AI86gXGGIs1xvP+fQBEO26zUFtFE+KP0fIgrMNizu+dM77ztjGm09
         FD9G6jkM1vBcv66q7r8zBoE4pTGosWW4N6o4Iff7A+xxqPs24NHUH05acZMlL9tNCoqG
         7nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789808; x=1784394608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J92HCrkNQWDeiJATR+uKaGVLbk3Fakz4sww9g3DnQyY=;
        b=oaKziP2bl4JJW2yRBHaNJ2fF/TLI7YkZibRBvzMTyhVea3yhbJEPa+x12wQby5+8sJ
         ve1l+bvGiYofNc0zwNznSNfidiHmldpvgkarhOw9MORPJkN1q1GVu6wO5KZq5OmqFgSb
         BzkMrIOvmyiKqsZ4lFstrCIRLC1ofwHU3qntlUGhFvOvB9M6t43XezaCv8vg/G+zMcw5
         9yH+nraMk8bXBYIXqCbRmgHUySyLK9p4PtVfLiFNk5L25Fnh6npgHypQSoNWdQ/xPHV1
         20v5GlMM+HoN+IgiUJa8FGlfRMJtT83yoMn+CzGqgEZQ2wztAoxfFyZC0PA8/EWhP2mG
         RiKw==
X-Forwarded-Encrypted: i=1; AHgh+RrExoks5+x4TWiilvgg/WbjOH0FFkW6x1xtHu4DJ78ci73Hf7KupqiJzTiur+SZZWgSi5m9lCkQfxBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YynbN3dZcFU9+lBt+7v5BFhPODnlrMSeqdENdigaDkblhGvFafQ
	f+4bsILQjT2SRu3ie/v3znwHZGRwnJ/ErgV2BH3BFoSyUBAK/TAVx31+Nmj1qycbCaUsib5cWPC
	J9X/AHkdy14nKn3peQtDm1Pi/E/Bh0cGLOpuoRnOgQPhF0LnsVbIo3qrPI1bamFNm
X-Gm-Gg: AfdE7cl5ft2me5pxwsBsv0O1EnLB92IgjwzgkkB33+sR6CUEEWWueBnJVqTFvbdw2+C
	t8ypzZ6bLPq3As2pQNLFGlzM2Hn2bt004F3Xs8gPmnLu61mbcSowrhhre3ZFfX9zFB9Be2vB0lf
	IElZrdsIYXAJdqkYWiEZmqN2AB3egsihebFl/kDve/kZSA4kdB0+ka3Y2b1sBTcnqyK11sPHUOs
	cuBOJ7bVl9JJYD04jcsDdIhQD4YGpR6DUnF5/tiHUE0josO4rRtGHYggNiFpNxkvua+JFZAsOZ5
	UTMRCv+NsrI+9mg1RZp8K34kzKWHZq1BHuRrcyze6Gn3Dgz/7cetD9hI0bHTa9C8OzNyEKgCold
	ilcC9PXeiy/826ih9sttBlKCOk4JiAeOrN/Xm9yiZ9VfcJBvSV3tSCuzD981toX8vMJciZcvN/4
	HWsxmU
X-Received: by 2002:a17:90b:4b83:b0:387:e0db:3d8b with SMTP id 98e67ed59e1d1-38dc77c6073mr3311372a91.38.1783789807617;
        Sat, 11 Jul 2026 10:10:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:387:e0db:3d8b with SMTP id 98e67ed59e1d1-38dc77c6073mr3311342a91.38.1783789807089;
        Sat, 11 Jul 2026 10:10:07 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:10:06 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 22:39:51 +0530
Subject: [PATCH v5 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-shikra-usbphy-v5-v5-2-229ba3602737@oss.qualcomm.com>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
In-Reply-To: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=2846;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=8lGlCWqfdYi7aiY1rxiuhydlcqTNR1Zj5JRjcwDR5mg=;
 b=Fd/W894Lcl3jrwJbSLo58sU+4+bu9bQmx6S6YbXilQIaXGLD/ndZnTh/OZjzQNHb+kiEg0PaQ
 f8heR2iGcRbCcb515j2v4c7ZWJxEz8ex0o9UkOdIdZfh3Tq4cqTusnM
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfXyIc1Q96620Z4
 c+cNTmNIdkJPMC60f2QWvt593UJBSw6UUlmIoX01dTrvlOHidIAx4GgMSoYBJmBD3YctmwB2wmF
 fNZVcs8hDsNlqsGpP91dqqHsPHGUz3s=
X-Proofpoint-GUID: hQupAO-by37VkQWm0i2CnY-zo6rJi8Fw
X-Proofpoint-ORIG-GUID: hQupAO-by37VkQWm0i2CnY-zo6rJi8Fw
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a5278f0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ufZ60yBX7R2ALNXMlhoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX0gCLxcQLVCZS
 8w5E5E/nrYtEBwD4CXzZNq2ORu2UjVt+E4q3Oge6JH30iIgDx9fW28Dk6dDaU34hL/gqZ2jxrXC
 A0RRpv/xVbWciGVXyktkjGwNEIEc96gEA9hx3N5lW/OkQzGYnVl4RRPqtT/Qdjkmzcr1Lb4cRjA
 M67Vqv72FZ2pSZWmAUHsTqr5mIrPpcz5umxpnjg/cmW1KSXI+lwnIxzYHQQ8MElUc9I19pXfVcN
 UHh3sH73vmhTkVgAEBr9OhxPwzFmWq2Z4lr2FrjQ21CiVMN4i4OmXBOaZqNKSly5Hz+soz+F7/7
 MOKvHmGe61pFR7bXGmWUn3uT7lJJEg4AXsJq1hVFCMsdA6ZcWlcd+34bTyCn7WpT2YR8PdPS9dR
 c+eUReOYSZU6NX31QtMH6tiebb6j4V8sxOo5zCupS7ZTbDIYUOy8tP9AS+lKoEphJWaFiEjdYJm
 ja8+fVjWuPMxpv7evog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173

Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
3 resets to be programmed before initialising the phy. As per the hardware
documentation, the third reset is PHY_PRIM_SP0_BCR, hence naming it "phy".

Also, add remote endpoints and orientation switch support for getting
Type-C orientation information.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 54 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
index efb465c71c1b..908c0f199c01 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs615-qmp-usb3-dp-phy
+      - qcom,shikra-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -33,12 +34,15 @@ properties:
       - const: pipe
 
   resets:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reset-names:
+    minItems: 2
     items:
       - const: phy_phy
       - const: dp_phy
+      - const: phy
 
   vdda-phy-supply: true
 
@@ -63,6 +67,22 @@ properties:
           - description: offset of the PHY mode register
     description: Clamp and PHY mode register present in the TCSR
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the PHY
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
 required:
   - compatible
   - reg
@@ -78,6 +98,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: dp_phy
+            - const: phy
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: dp_phy
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,qcs615-gcc.h>

-- 
2.34.1

