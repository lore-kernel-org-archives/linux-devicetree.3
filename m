Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA0A2F7EF3
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250685; cv=none; b=iHMUyKMq6W7AOXm2AG2uR+a+2UGLhCzComk/ciTLXsMWOrzY5KBAqzYrW/oQwmIGycnpy3NMjKOIqgMQbA1zTCWuJuP0LPYjafpiROxHTRVU0dXI78j6Nrvj0adQMey+ZiMeSW4pyjLW1hFYexTeen1BWk5iK9QVb0+Z6HT+S6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250685; c=relaxed/simple;
	bh=xV3meZxfmg+SmNEyZyakPIM37rJHy3FTDDwjD44e54U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnTHmBNIdas0cc8xH8nRdUQXuMPthFsGFAd7CFkN3X9NuG05FGyCUb8l2+b51LXbjZEs2MCG+vOjZrJ1bB+Scw+gUxYZMLbKhRutEMdiX9izY4xsp9kZDoTqkSUXr161wD6RoTsLhDvRE8GpEe3CZsahqCP/hMYMNgqTXRYfAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REVkMqaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZaSCYBg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REVkMqaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZaSCYBg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C3pR2452063
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnj83nPUbR07NzFuXsiThyrp+KHvAMSxaw41t7iA8jI=; b=REVkMqaQ10yK2k8B
	PJ8XrvcdDzzqrYJmWstTQ4rRZ4AXrbD+lv4CIkQgBLoWu7wMqult7ZL6GTKUIp4N
	ueTfDQ4DEoDIfe9mxfPgqiYHjm6woI3pVkVux2qLUb0EdCQ0f5doIdIIDBH15E2K
	B2Xg3UUyzxYvQe/mCMJugJUVbM2udGW+r9mfysl7IEQEBOV8ToTRbK2dEFiKJ9aB
	YwlLhbrize4CGens8eKc8Y70op5GHyOyEoAd1yl7DTFQHtl5MJvXQ2ova/nsoQxC
	pCyyArPL8foqM+dgKXGpBecCyCo+RYU7RzNgGfcnx4fqubI5qQEkUT4B3jKPb0YC
	v90beg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcjd6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85807671b1so363139a12.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250678; x=1781855478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnj83nPUbR07NzFuXsiThyrp+KHvAMSxaw41t7iA8jI=;
        b=RZaSCYBgmigMVolSxsuFX43G5Cwx0fu3dTSR/909ghlkryTb+RU/05SYJcI2C75k1m
         XBdLd5EAtHHgJvYEjz+JQ8prL8MW+3r34be9y5IpnnVqFqraI2s0Ye/zYRAaAhPm5f7x
         jQ0vRdGftxZVGKgXQ1Bb7KmCJGeRWyGpTMrh8IkhNgqdpe9vXu/Ow8qHYKboXPoqn1cx
         n3hEhzPNNe1AFe9LQpkHE85GFEKnEXjJdNKp+6WyykQmqyH9j3CDpJIuk7NrD/uzh1JU
         R2qkTiKUtpn8f0fiSGLdDuSnz31S3ZiQtoCgpZywZX+9CDIJvnyw8Bn3GzYz3w5i3jFH
         QBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250678; x=1781855478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rnj83nPUbR07NzFuXsiThyrp+KHvAMSxaw41t7iA8jI=;
        b=GGNPF5OYZStmnh+LC0djZiQtqQZzsBl/IlZN6lvusGhgJPyfGQOA9m5yM05kU4ofwA
         mMY0JB/Y+dTfFaskSFFmY8WIF6/rHW2SThREfskasDEyyO1rudVmtpqfc79xKK9ikbbg
         N6e7ig7xhWXLEDn5h/hu5yFlC02CTReJ11WvglVaoFVsoACc6Nlf8Y+D7+2hu89ixc9y
         5i0nVo9o1gM6iABkYut3FNvYXDdnDC29WYzi40FrqBE5m4JRB0sdaD/RwKVic1U8WB/T
         Idk/vBvr4RaC93KsU6/4I6Iyn/bW/KfkAZdqgw1hC5sEX2+hJcpoH4tzn3sW2f+CJ4gQ
         TXjg==
X-Forwarded-Encrypted: i=1; AFNElJ/OsF63GaRpBe2dWhzjD1CtS4k6LRoXU+fkmADtguneF9HYOxdYN+xjk9WOBbhEx4spVVFNvBmlHY+a@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9jAfPM9JAPCUghKuuZsKLluCIdb93hzsTlcalkdVC0FG/NVY
	94g4MLZgBNye5mQwdLW+Sl+6NSbO5uIBXT0AW3hbcZLaQCRAVnBgyVV068gmocYMgjvlSAilLIi
	HDCtSJ2wWuXJmFHtL+KSOzQrzJ0xHLCGh6LK71M+wHNI/dIM2dW5FmOAO5EEb18xF
X-Gm-Gg: Acq92OEV5gNUKQ6zSz3jK+Qhcx9luqBp6uI4zbefgYV7yTxmcolDmN+Cf645EwvC0eE
	VpV8XwIcq7xP9WsZ9OvszgDPi4dFpNPhJrtYX6/Pw3zgHhc22KadSECgVok/Ry0SE/cKP/CjiF5
	bV8GPDUWfEAyOxM+WaCjeaYZbCuJsAhZ695h6Wa4mp8RoCUm8PoWFEjxjPN6O/lG9v8+w1Cu+Zo
	igEOWyqdSVg1Qylra73o6d9ANtS8DM2u90YqNWFB0Md8XXtWwSpiJOHVUXDyRdkY0tV6KTZB3n+
	sBSNSU55IQVWclJHe3uGe0XGhkiF0pw13SvWt5m1C7JY2qNQL76npOJZwQk8rHL2stvqJGbmwz8
	OirGMCRAGU6z6jlA7d0ZEd31wcVWiCfw0bNvxOrP7U2YD1DyvKoZ40FQIejCy1Hyl8cpAakg4W9
	bTjiUoucDwgG8zWWdFP0it1wJCP4TlKnDi19L2
X-Received: by 2002:a05:6a21:6d93:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3b783b3e708mr2418854637.4.1781250677694;
        Fri, 12 Jun 2026 00:51:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d93:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3b783b3e708mr2418819637.4.1781250677265;
        Fri, 12 Jun 2026 00:51:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ab99sm1307544a12.6.2026.06.12.00.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:51:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Google-Original-From: Kathiravan Thirumoorthy <kathirav@qti.qualcomm.com>
Date: Fri, 12 Jun 2026 13:21:01 +0530
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: document
 IPQ9650 QMP PCIe PHYs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-ipq9650_pcie_phy-v2-1-b938cc2fc267@qti.qualcomm.com>
References: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
In-Reply-To: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX+tk9avNrKXMe
 lhjfSuwL6L0rRboObW2d+IplE52WmBfuLR3ZJKrCl2SXflN6O4hvcD1Gatux8hvFo3ZKuJsdDBr
 zUheb9VYEZ5MJht6WIzhLD8S1BUPkXntADvC9oULj7emgeFIPyJgzgTn6aRyH70pMTH1gEfXeqW
 Pikkja7ZMBOiy2o2UfdKke3FS99+KE3IJhrqF0vLpEAG2D0waYucrJErZYZkUqX1X1W5HmunaCd
 aIpUwFV5C8MfSJLddNbmYVaeYRcFLvghhYUdK4I+dTnNLYDYGuRw7tKGts0JGH14jcf2Q9972Er
 w9bahdPCaInBne5dsGU8kD9csFw+tlxEYem9J3KoUUOk0Rg6k+cZEbEV5WjVr4vg5Kp+t+PlR8i
 WL8q0xwAXJWLne1c+VALNQYPfpZwme13WtexwNa584tplyGh+uImm1JKD3nQ0MdvvWRmbxStQKi
 lOpiRL0ATslhUkE59Sw==
X-Proofpoint-GUID: foR_Nvn9s7v3hEQ_tyoELAX10AhhwVPJ
X-Proofpoint-ORIG-GUID: foR_Nvn9s7v3hEQ_tyoELAX10AhhwVPJ
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2bba76 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pO3CVo40WvI9-LPkYfMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX+v3A0c4eKKqZ
 o4GlRWRS2DI7VuJrZ/asDwjzyFm8pYxzf1S6yn+ANQIckZ785Sapvkbngjlu5GMcBdgCPDp8qDS
 4OcdEQgea8+WnlyQIeEQlMWQ+TGpNzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069

From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Document the single-lane and dual-lane QMP PCIe PHYs found on the
IPQ9650 SoC.

Unlike the PHYs in the other supported IPQ SoCs, the IPQ9650 PHYs require
the on-chip refgen supply to power up. Add the refgen-supply property
and require it only for the IPQ9650 compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..048b2e3ff0ef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -22,6 +22,8 @@ properties:
           - qcom,ipq8074-qmp-pcie-phy
           - qcom,ipq9574-qmp-gen3x1-pcie-phy
           - qcom,ipq9574-qmp-gen3x2-pcie-phy
+          - qcom,ipq9650-qmp-gen3x1-pcie-phy
+          - qcom,ipq9650-qmp-gen3x2-pcie-phy
       - items:
           - enum:
               - qcom,ipq5424-qmp-gen3x1-pcie-phy
@@ -61,6 +63,8 @@ properties:
   "#phy-cells":
     const: 0
 
+  refgen-supply: true
+
 required:
   - compatible
   - reg
@@ -72,6 +76,21 @@ required:
   - clock-output-names
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9650-qmp-gen3x1-pcie-phy
+              - qcom,ipq9650-qmp-gen3x2-pcie-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

