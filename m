Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A501640627F
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163182; cv=none; b=fZePZfFAlilDxVSKPtAAGffXhmCD+whirKBi0TQp7m96Vqoey3bcyty857b+jrgNfXpfv/mJMJWvb9vSfen169aulBKhKqx7/lLDcc6rSTvkAs7pP/zLJyiPtF+iI5lzm4r+b0/rRqkExXhhvU5oF/kJYIAArUdoE5blrz0ixgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163182; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwHYNiY+wkzpb8PC8K+QHCvQVmnKv0AxjocWvuBwP3ag4N7U55tsn/yC459NXc/qZozmIBSoy01Ud4A0LavfLJhHdG4CPDpxQQZ8ZnntAHwNqizqxQn7puhuCAnGzyaz4WisAhPhbMMsd0xipm2ClpHnSw88xNPoKuhhFOeZkxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcO7vQ5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSp2WEpX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcO7vQ5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSp2WEpX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AF3eU879602
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 14:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=mcO7vQ5zrFKDaeqt
	vZqFkK2dNRnCuiDU5Ge2UVkHSkX9MI+NnMnSehHPT4KARseHSj3d4edmystXwdZb
	m1/7h9Ba8a6kgq2oM6AxbcAJ80V2W5GhKB3Mg5JrzR9GxZoT2QU3ewxgUcwXC/wW
	+QL8HwAyZK/nfbKPJDvvNzjEqfJG85k3o+6H/TNDkY0YoW8ZDxCmXqrkK3DnTA/j
	8U4J8sLKYjDXV/x6xl4gnA0RUY0LZL0LCqbNIoqfoDz4kst0zJBLa/STugmEbbUS
	qEm+Wy3jNEd+16ApS5VNluIaeTCLVf8Y1by32t3Xz+IdM0Mk05PPn9uVswjFr83G
	BSBq5Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq25t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 14:12:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c823549b1fcso1088691a12.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163178; x=1778767978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=iSp2WEpX6QbFb8RpBCD079ioPlJlrMoQVX1x3l7OFI7ZltPkxBLQbhrkS+w2IXYFgk
         onMyD1iQIMKCnKXJ8aqovu0SuOQqsKo9JBYPWLi2JvI/BaBVyoBpZBHG4DwUUYPplY5U
         AO+cqjOYBO3gDHsJSrTWN3qC2yaYDVjNEBsOVaTblkt1KdY+X1X/QP0FwtA8YqphxnTN
         4UzztEYIPnuxRmIcP0S82dOkqphblW8wlpWTf/bObWqyvx4dh4ReYqEbYx8ECZtYhGJe
         WSdljFoh0zQSmWZck038U+KHZ/YxExwU67u6zZWxbdqZw+5n7ak88E70FreCur7C2JQI
         OHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163178; x=1778767978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=GXtvz6a+ze/Dx8r9ZUmQFRGiXWKzlUZ3awm2SOQLxlWUGJAJyrOEQsGpCSFb8c3d1P
         nL+wsdfhJJw0e/tMqaohlOPpC1lW9+GxWxEFKqE+KNMMgtK+rmhwXrBhzhnGjOXdFwcW
         KIYK0yAx+ljL1uIen5vCxfuGDF6JnXzkY3xXg4ehyzPuGw6F7GebvZbWnXFaxVF3OljZ
         tsWLe0BbfHtiKQEfrU9Qr/eLaXKiEwX/8hJ176JxxjegtkiHjEk8MUtZpuStr0gf4RbO
         leCFvFrCYixUfx54wo+2fceIb97W/inouTmzEseMjDyp/Ypws6/mMY4vBJ8eacRFjTng
         lSyg==
X-Forwarded-Encrypted: i=1; AFNElJ91bOwAzs68Dki+s6kAGiF/SRlMjLRuYnFmHBzLUODrGQ9eer20xsnWo8KHRrC1ZJmqprsJb7v7ptbV@vger.kernel.org
X-Gm-Message-State: AOJu0YwkT/kwwqJkao12bbFiyIAXHxb1CdTJ5VKVOfMKJm17xz+0EdI1
	RwKizQ0rTUDasm1y8FGmO276VNcYYQDKb3Or4JCy2U547GL/kfi7xu4GKOup/vSHQnwS6iyxvu7
	BbiU/NBwGEHtGSh1QNp6mQH+pVK68JN562+uSPNpsu8z4JVStFK6ADn6HgBDFNtls
X-Gm-Gg: AeBDies7ozg+U3W5/m7S9pyXATz7eawrqnf23lWxLK9764xjWN++FaaoYnT5fYDhXas
	MWLLWSgj6og160i2YrfkGrGqrOu0AEIPemz3wuBQljqxoodou294m9EwHX8YL7/HqDF7f01yYFy
	WKYrgvlSlJYjF/UCb1WeV6TkGnUc6NG3KtxLoiQ6PcQIhwZwkTUSLLQlk1oTyE6aDv+1/3vH0s7
	HMTP0n6y7F0R6k677K1Vt9wIsRpmHVvnzILiVpAeXybUfsQ8wmno1UWXAK0JHohWthbixjf99np
	B1qsG4h8amrSt8cW2bJtMavs8NBa+IT4iEE/BejNPC7uqTQ9BSTGMMAjohAoQ7I8gh7CEZ8lu++
	G8W/DOG+/Y4YRUd8GmuCsYozPI11hJvxEiwzfEwJBfKIDsyp/ucNaIUgDAKE8bmtv5JHtrTP9qm
	rlq/mAGBYlQm6sPtolU4D9GY53wBYWSA==
X-Received: by 2002:a05:6a20:549d:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3aa5a8fa74emr8808161637.15.1778163178476;
        Thu, 07 May 2026 07:12:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:549d:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3aa5a8fa74emr8808117637.15.1778163178010;
        Thu, 07 May 2026 07:12:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:01 +0800
Subject: [PATCH v18 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-5-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163147; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=cbhIVnG1Yhq18s+Tdqc3kFKI5ZPNKCtC78rrD5zLokchh/bY3YK03jTYA0TL39zB1MBdRbNi7
 gAn4qnXQvYWC18pDUJo71hQc0WNHjig3kyty4rXNE9xe3WE3/ahbwok
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc9deb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dv2P1NXfm6JzQCOrj9GsSxxxxLwvAsYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX6k5rn193JFqa
 F6kCDlxzlZfuIByQlX+ZWGjHMZ6OMEkTybAXHgStI4/8LNb69/utPLsSE+VHpMP8M0BwDEiNPjc
 F4z0zc+tp+VwYAeTHBNm+RPFdP0kNmiqB8zXh3s2w9dA3E9Bg2P9/NayNrQF8242HHMDJIELifS
 gYUlgjr9dztdTMwTMd0sypJSkt6R/wVt/ydL+18dCqEOZOFv6MsurZNkVN9MoGC2TV1rT1bt7II
 xUu72UzEsFfrlevJBmBRll9+60d0MNPo5b/6NZFFRp1nhFWvfVPTW0Ye96Ou68r/wHsgHlFS0P/
 hNDeMTEbHV4gsdXD5Vp94RZbXiUfpvQMFuz7ieEn4dcHr0HxtNyo7si5GsPsX669oSbMq+xwTHA
 gFkLK9jpPTs6ejboymxmXRtNod4q78wN/xxvX9rSrmbVBmAI/03nypyA+g2IW6jeYhV5Gn+lyvQ
 NSJEiueP2rHEHK57RjQ==
X-Proofpoint-GUID: dv2P1NXfm6JzQCOrj9GsSxxxxLwvAsYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070142

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

