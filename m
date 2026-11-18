Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016262;
	b=Tx1KIkSUQ2Yal24vg+xS9+ogzZqb+5HbLM9fGuT8aRyo+WtGuo9G9zEFwn3FhZJFRnFV
	 oEHibymgpd8s5R7sbODpirGuIQyVqfUQuiLuA3T2i076UHprhivteLL6lUIb1AlkztPJ2
	 oUuw1ZWE+9V0Xar2ttjM3d3PNALHqlMkaUHm50w81Okecxv6JkwF2HqIItVLTZ+dQzlbR
	 1WLlVTW6ho2rWgcBPxn3yrgVlo+eLMlVyk6PbWIA1S9kEkS7LRInk8qLq5CIv264AVyeM
	 MvrHYOvyQtmREHhXnrXYASIyhCCdBRbJrmJCa/4Rxe2xRr/ZLDr2LSOhdDEo8b8ZFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
	b=FcaYsf6hOAkF4c7zSWdO1GKwJqqCiLmNiFVqSYSWURivvuZPn83Ldel/7wkL2PwL9UgX
	 oOrEbBDwn0kJgR+Q7LLHuNISRzHyY9WrO9+ewP3hLLUE0xmzIqe31dGP/CAO/ogSlzSB6
	 NjAsh3m0RFCCyrO+c/X2keUzInZS4VfJgbBa+ZxAAf+h2b3cXDLctx2/JDXIe7heK9vIh
	 rVI0iE5FXcE7+VAHxkkEHBAN7pKfQLEeZ/qhGZsItmOOnMPQkPIkWGz2JmITob/XQkEOu
	 kq2HYoFegg8VQ+5GsYgp7OOogv/VFN/qPJDImzEqsTedNrpewCFvRcKWveRN39+V97A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfRL8sS5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZlTd3q4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8678E606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8678E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfRL8sS5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZlTd3q4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQJ31633479
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=; b=KfRL8sS5IZ+OjOs4
	TZHe0MV8TxPr68/KxQ9Fx8zNCRxxKK8GKf2DgLnpNWOK52KAYJAU6acCkOzxtA9E
	BrsKDIECMvChbaV4hAc8QTeqwrtOKIJMqEqLYoLfCOOfOTqe6uBQgTIkO8FjjPTC
	+/aheGUe5sOwpkdpCb4fgjI6yDQyeTwHhKSW4Z2g3iLTg1jH9pGjEQZJDYtEhxvc
	Tl4kKusuMc5hFOfn4g4M9Vcr/nNYBmsrIB6RHqDRKwri9HEK40cL8Evz6ihDhmpQ
	niFGfVIQsckzEjpUpgfIJwY3aQ5Nl1bxvLS+JmRLjxWw+VNdtnAcxkBpRwGTmOOA
	SrQ1vQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8upy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92114c39cadso21113966d6.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016261; x=1795621061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=aZlTd3q4poE2nf8TykIMnneScvQI9RRgwB1UUbg0IfHSEkAYwkfJFUQ63M2hzyuivm
         YkGwrpcevRF2vwJOuss74OVjtdhIrficlFGuYJ0r6mP9DM3WQO8SpiLbZTFR3+vJUtQv
         JJX2quXQIc2eCZjyHA9lkkE+WrnN9OG1AR1k0/XhKZj++/Kn2kcj5yB4lyb5+pWDOPnx
         rlZXx+TXVuYD/c+fJ2neSOCWGGxEpNo/ugsQPWgi2JnNuUfmNCOx4KRD3wJQBjShMy84
         gXBKJ6ITMAw0ahb3mOZ8ynwJMR7B8EGXW9YMDnsoX45lOoepS7EZVewKFjcFNybLtIFp
         WUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016261; x=1795621061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=ytA4AVzHSYfsGhKaMoK58VixqqkVPzxgHg3V47wkg5/JHew3nX2bCpLTv1fzrYS1uG
         /8Q0+OqeLoy13SiBXOCpMtKVU7BZz/YUrQY4nNMObazZpy/LUdQaOYc+fG5TvcxthWNy
         Z3rGa2p4VDE8knjLtPxxKdqC2zqfE9zxjnhcHCcqZJ2zdTBxH84oIoAnU6VoTivH1QbK
         DsA0Q1BSEi59ky9yI10mvQkoMn/BM0lxypCSakib7T0wxshdg1MAnGEd8DzNMKC3DUgM
         Ar1TgFB1p8BEF5zFr7AHwYODp/rpr+5+N9WZD9SnJgaz4n5k0POW2uXMk71LYZRrliI1
         GL7A==
X-Forwarded-Encrypted: i=1; AL+hErFnYPotkvsZcj/PXLu2YXNKG2hLMbyfq93upfML1kk0/BMpwk52P2wmJCAYaO/bazl3fQLidRhcHjXL@vger.kernel.org
X-Gm-Message-State: APuU4Z+mu6sPn1h0aHXNDNTloPwnUoz426cSs/IswOl88vtqv6+WnB6k
	zyvQzy8+TwnhNYuzV2hJ1NHgZODHdWVQwMQcykFpxpDOdwwiHZGgX92DwTxz63gIlGeLCXI8ZXM
	61Kp2eZkSFpjT5y97LDhIvuMEmEJncUBiuH9bdS92sJZYnnwUrRu8ArfG+P/UjovxOgc4XMHY
X-Gm-Gg: AZFdTZecrvRLnQSsqoS3D+YTc3rxz5TdbYgHaKU5DIKvGyYS4Gtfdx4rP2EaoLptXFF
	XcSoOypqYvlJxlkg2G38ccPvO/Dg5gTx3EUfS63YoRNJaSJAQen7sllEJTQ52H2uq/oL/mb0ZxA
	hvIMlKkaeWOpb48w0lVdDyOQB+2kO2M+2yOPm+4Gtt9phVlToDX4KwVVg8fCyC3lo+3FrNI3few
	uMPM2zrMbKa1qMxYlabasIOJ9hUQoYjjNVpcBbudxDnKk6tIr6IM8dCfzvCbOkye9jclTsToFbJ
	niBEcg+tbAGp6WiqAyVXdAgZUneGibxQV1HmTAZlN9PZRiyNMYvFFf5DAye0AaBnYAl2X6rf01K
	r+tc+HrHmqRC8Sr6s+OZNv0eHn74G7iBabXN7r+w0/cLgdWyKO81jH4LbtIxshL+N1aapoHqg6k
	Mu4TzofEMg3tc8EjoDIwQNdeJrGf88pFuLY0WA83Oax6r7kCHJxpMFprpwz9Df
X-Received: by 2002:a05:6214:29cb:b0:91e:cb6c:a50f with SMTP id 6a1803df08f44-92114f234cemr46836226d6.33.1795016260486;
        Wed, 18 Nov 2026 07:37:40 -0800 (PST)
X-Received: by 2002:a05:6214:29cb:b0:91e:cb6c:a50f with SMTP id 6a1803df08f44-92114f234cemr46835356d6.33.1795016259652;
        Wed, 18 Nov 2026 07:37:39 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:39 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:42 +0530
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-oob-support-glymur-v3-1-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=5948;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=cZMcIPHFZ84uL85xAk/uCt5uCJGvCEH/OmSxr9GzoNU=;
 b=rpUnAsQDGdDWgUfoQhaEw7chvjRaMPTlVNVQZe/K3/j1O7XhBeN3ijwnKIwc34Vkq76uoL9uc
 ru7JEgomn4qCTX/OT8Rb8eauV4/HF/Sb2cD7KTH2P03viI1STVApc9Z
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afdc645 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PECRw3tLk34I9mwI6-AA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: phG7laO-JDEsYUVqPpOeMfcwXhmo4dZe
X-Proofpoint-ORIG-GUID: phG7laO-JDEsYUVqPpOeMfcwXhmo4dZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX1dn1YTgvCFZ0
 2m0n18tkd1i4yWPd9OKxsGFC0LTaVgzISl+cwTJexAlXewB/8gk4haU1CfJgXZN2ArnQAW5u01/
 ftrMBeT3b1dvHPyWXdAjqbtAlFg6LmjwylwIRlklXKyxqY42gI9kNaHc95RJWHN7uFyXuHuTk3M
 mL+YQ6QWJozcRptD4AEKpJpOXlJUv8IcwqJcxyIgJ7lkd5wgmlX8qm2N53lm3IkCRBm1oEvSC+9
 xQmzRx/dSeAjUyk1Vmv9KUsT6My+zRdE91Sk4ea+Bhxtg4tYpBCmHZ3rmyZzHkXl+iaorNHKJ0e
 9siOb+DsFDk5HaxRCVv/Qh9w5c/OwNp95WSDRtHy9BxItUJry5M3Oc7K1FbNqCwRSY8+lGfE0Io
 evL6goPe3Qn8jUZZXGrtoJfDpfbiE2wT3mp0iWYm5XDh0KSpoY66HZPBEZD2nFLZGlVd2SeLC4s
 I6MfjvvqQCz9So1fZPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXyt5USwpeAKHj
 aoCqbNwlCnAu8U5xTrffCXxXlV6VeF6vgOwRTAygC2qb3irfCNWV5jn6otQ2xNJJSYIgmRMT9U9
 um52I+dcZ8HJKfckox2Nr2zZwre++Ew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180062

Document the Glymur OOBMSS PAS node with its secure GLink edge,
shared-memory signaling, firmware carveouts, and power resources.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
new file mode 100644
index 000000000000..3aa96d2262f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
+
+maintainers:
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description: |
+  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
+  processors running Zephyr, managed together as one remoteproc instance.
+  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
+  processor. The OOB-Non-Secure processor is an auxiliary processor that
+  depends on the primary processor and cannot function independently.
+
+  The primary processor runs the primary image, while the auxiliary
+  processor runs the secondary image. Each processor has its own DTB.
+  The two images and their DTBs have separate PAS identifiers for
+  authentication and dedicated reserved-memory carveouts.
+
+  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
+  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
+  boot, shutdown, handover and ping/pong signaling, as well as fatal error
+  notifications. The subsystem exposes a secure GLink edge to the host,
+  with doorbell interrupts provided by the Inter-Processor Communication
+  Controller (IPCC).
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-oobmss-pas
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  memory-region:
+    items:
+      - description: Secure firmware carveout
+      - description: Secure device tree carveout
+      - description: Non-secure firmware carveout
+      - description: Non-secure device tree carveout
+
+  firmware-name:
+    items:
+      - description: Secure firmware
+      - description: Secure device tree firmware
+      - description: Non-secure firmware
+      - description: Non-secure device tree firmware
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal OOBMSS
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    remoteproc@1f000000 {
+        compatible = "qcom,glymur-oobmss-pas";
+        reg = <0x1f000000 0x30000>;
+
+        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx", "mx";
+
+        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
+                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
+        firmware-name = "qcom/glymur/oobmss_tee.mbn",
+                        "qcom/glymur/oobmss_qc_dtb.mbn",
+                        "qcom/glymur/oobmss_ns.mbn",
+                        "qcom/glymur/oobmss_oem_dtb.mbn";
+        qcom,smem-states = <&smp2p_oobmss_out 1>,
+                           <&smp2p_oobmss_out 8>;
+        qcom,smem-state-names = "stop", "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc 56
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+            label = "oobmss";
+            qcom,remote-pid = <20>;
+        };
+
+    };

-- 
2.34.1

