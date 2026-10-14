Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A844A8A08
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980369; cv=none; b=JEy42IjvWlK3a58eT7X/+yBjNBVo73j+OVF7JHAm7+v0/rvBPiocF5RnKXr/HuR7edoA4revQm7tw96DPSgpu1bBLcZxWKKaFuc7WPAjBbVBx0WlqbhdCTJFUqsEvuEfUzC8KoeFHttudfQqomzx2JeiNx1AY2lTbSeOK41pqV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980369; c=relaxed/simple;
	bh=vxISHWhf3lC7RqWBmyHcM7+lpZr8kxBvdS+ajIbu4cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBwiwq9wmTMhQqTm3gFfMDua2xa6XEZLtCik6l+488nFm6O4C1VTNW6HIZYvZNTZ56heZ+C1lxLJnQEMsvTZck6EH040/dEHjXMXXbEa8T+odIQ++c3rBBLNhUCqR4gE5D7HcXekjV1QgYjjaTqL2gsGU7dFNmdETOO9kD90Ezg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYbEeOMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SO20muxl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYbEeOMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SO20muxl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBXai62686071
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JtaRSJMaDhK
	wiQIShk4VNx7L8EcrBIFVbnV4hq+7dHk=; b=LYbEeOMtgf1UjWOkHk0Zk6LFqro
	crjUpPJyQzRv1ahsJALrF01MpsnXS9ABK44TX47VioovHwrkl874UopLMRLKkRa5
	l1MSjoMV9JLYG8r4cfaGDuUkWT6LpS0fPEGbOcEoLxrmPK/8WS5k/rDv4u/e5AID
	XYc0bMsp8FD1jZeyns3PtYcTGtRUmJperYileat8+Bi85XEEk+IQIKhdqScMAFPx
	+eroKmBHU5NcbrJ4l6NE5d7EgevNr8Qi3+D2U0BlbEMDZT8WlAdV1UcbZJCF4lMc
	FBAvYDjI3xR+5/UKW4uSL2Ob1G8xBh3fsHAmTTC4oYCOKJ6PaEM4yer5fog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1frt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:19:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8880b8aed53so331474b3a.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791980365; x=1792585165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtaRSJMaDhKwiQIShk4VNx7L8EcrBIFVbnV4hq+7dHk=;
        b=SO20muxlG0ed5S6634cuZGDPI1SZpcYUuDxlANOJfDHeLYHzcJYUm8amWlQztTIfUQ
         0WlTnwkiCIMXcLOY07Z9t/USJw6dKeuJXkdSrYgyNC24+e5HHnCZstOVjB29Qgkf8YWz
         SF8dtlAxVYASlwwcnBttOVc+4Gh+3W6F1tySnMIdA1xRdOPRd1Z9xllO4V+GbtzW6uoq
         mZ8sC2NAxi/dziRaUlppWsA+5zePX/+Yij908h6VaNKABA4oJmnUakb7Up9f6+X5J8Js
         PMCWNealKVKhR8g7hmbDUr5AY07t1EUllYf1CvaKJ+aYI0z/etkD5E0Y9qEqqo/HgVjz
         KUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980365; x=1792585165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JtaRSJMaDhKwiQIShk4VNx7L8EcrBIFVbnV4hq+7dHk=;
        b=ZYRuR1LPK0rd6vg1yRjSwHJfF93qNqXpKJpwoGIKDy/QjlfUoN/KcmdlcLA5KZJPfI
         5XHANxQX/jiAHlmw2pCoj6DqrHLFuQsTUHnUzW49DSK7dsIhBfEJ5lp7+pzlOdKwAllb
         eh3ra8Wb69aUaR8aLuvQ82ncUDwPLPAU7+AfrtNQQF6quTZr7BMSNXHx8LxATvlHQ3Y3
         GL/g3cXCI2vBZvb2Z1YObwKsTlefucCSauxilLMcFFFgGKohGsYLSGpEvurc9DaYBLt1
         ha6h4FmH9JFqnud7vQ7ZE43Qe09lkyqV34keMGU3SyJUI6NXmhnAqWPi40uw1P2nPkIh
         Mj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwN+oAQ9T4SHLbHIEI2pUadF/6EtRtOz6K+Z9K0QIqEG2fiUy0lFL+3WaYwhkNsGbzRWoxVKlYco+so@vger.kernel.org
X-Gm-Message-State: AFq9FYIk9nr2N9LkHuIGmA9QYjFS+Y4UmIU2jvsiwnQSKXUZOmU1x88a
	DwQf1lyZZ7DjFyaddKpbpZzvWF5sDsqbp4vpa95VNsOrPS3rY2fNyG2bWXTifO756LVLWz8o+EP
	ymKAK76i68DNf8uLFJXoBBYhkdxPBmJF1A4pdQIczGt2ynqFZp/dkzibdvB3Ndg7Y
X-Gm-Gg: AYBFou0dCMzS94I0KGxaCChYfJWVAMgZtCjoHDIOW48k1s1ldbjw1f06DaENEZ+Wsq+
	C402d/lXEhcyy1jf0bgaUxsEvywuC8At68jRj/1h5/Qcqxq3T1IrAPYyaqC8p9LvT3eyUviR3f6
	wZA3Xpjsm5HLQd0U0ZICeUdAP5BR+unRTqAY+jtmuCJ2mHLLDqaoROtaEt8g/J4DyLgFmG6oVr8
	ruiXZ7Lkpdhy4JdEGyUBUiLo9pWTug8mNAG78OCnrFisKl63doxt3nWQi6ZxxknkBE5+xZ5Icwq
	vXwujmdv+/IiaZzYD0oxpKov/shzmt+7ndSmM0L7pcf01jDakfSvPB7SDX36Vva/1Mt4flk5cQo
	Gr0UwWH1FgZkYBADY0A2lMiX9LnRw
X-Received: by 2002:a05:6a20:430e:b0:3de:7dd4:e32a with SMTP id adf61e73a8af0-3e16bdae01emr19744714637.2.1791980365601;
        Wed, 14 Oct 2026 05:19:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:430e:b0:3de:7dd4:e32a with SMTP id adf61e73a8af0-3e16bdae01emr19744686637.2.1791980365148;
        Wed, 14 Oct 2026 05:19:25 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm1016990b3a.43.2026.10.14.05.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:19:24 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH 1/3] dt-bindings: power: sequencing: qcom-wcn: document wakeup-source
Date: Wed, 14 Oct 2026 20:19:08 +0800
Message-ID: <20261014121910.1509541-2-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX46AVXT6EQ3UG
 qI2geztHpP6P9lCGKBq3IDyjZ56G5b/QoPdO6hidPW6giwPw8qe4DdtRsxP/Rhr1AFUudFqfg20
 QFZ5b/2RKdXKHx53HgVGu77lMW268CU=
X-Proofpoint-GUID: Npr5xmTv6I_fk4kSbspT8bqmqU7VKlG4
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf734e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QRbdyHOjkzuQUDITQNoA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX+JkUAXhTvXgj
 JXKbaqxVNyR3eEfPjzPkTKpnPqYbKlFRyAvQbwmEJ+GFG4s2Q972R1EaqWu1pzFxQ+g0iYIN65f
 2njtQve1S1MNRZYmy+1rsPaW7D29ql9V0nPXWylJiAxoosMHkxQ4lIQwm2xNyNcVxihLjAfPyIg
 w0kYpfIz4oRaq2FEJ33imIW/DBzobfYb5fPQFwLRqxf5LU867HBxFQvqxW6K0opTcrMNiSfD4jF
 pLn9ENUC48AfywswaQ8amhtHrtLnDW0ETelzspo6QqIRU4DO+WC551JEXctDVj6iLQbWGUgO+7S
 D3CvGQyfzlFsEfsv4m0guoiXfFBjqor6jLFfn1MmHiMsuDYKz9E2E3S5/5Jmw8xMsz+h4gbIoy2
 APrPpKYKdeqFuuWDBOvKJUV63w07aE8172jbVTAQfUhWLDZm2WFIgxk7FT2AuZ0O73x8Nhyn8aq
 TN35niACe1/koAlI/+A==
X-Proofpoint-ORIG-GUID: Npr5xmTv6I_fk4kSbspT8bqmqU7VKlG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140048

Some WCN3990-family designs connect SW_CTRL to an interrupt capable of
waking the application processor.

Document the dedicated "wakeup" interrupt and wakeup-source property for
the WCN PMU node.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,wcn3990-pmu.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
index 9a7abc878b8..00cd8b6c27d 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
@@ -42,6 +42,20 @@ properties:
     maxItems: 1
     description: GPIO line indicating the state of the clock supply to the BT module
 
+  interrupts:
+    maxItems: 1
+    description: SW_CTRL wake interrupt, asserted when the WCN chip is active
+
+  interrupt-names:
+    const: wakeup
+
+  wakeup-source:
+    type: boolean
+    description:
+      Mark the PMU as a wakeup source. Requires the "wakeup" interrupt to be
+      present. When set, the SW_CTRL IRQ is used to wake the application
+      processor from system suspend.
+
   clocks:
     maxItems: 1
     description: Reference clock handle
@@ -67,6 +81,14 @@ required:
   - vddrf-supply
   - vddch0-supply
 
+dependencies:
+  wakeup-source:
+    required:
+      - interrupt-names
+    anyOf:
+      - required: [interrupts]
+      - required: [interrupts-extended]
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

