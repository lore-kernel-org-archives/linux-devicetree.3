Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674260;
	b=NUPzoxq/lSsNFL7SQHbr2V8E+hzY3ax7drRy/ZdWseUlxLUaEeX2/dvNuYBtvMOcybxU
	 9HynK1CzD5sdpSslco23tTLUSDzpCnNSSM2Y7X2c9WOuLAY0L8bPXUfbojSVuDfp5wENb
	 7NfoqW0WF0BY//fNdhYyUvyFdYgRvgzi8FOxKaOdUg+OhFLKL9LBLvnd920lvpUsoEgu/
	 f2NUBy9lqvkyVNdwQlI0K1nzOUIFKQ+smOtWkMhknkiA5yBADU4qgv8O62sNBWAI/Ywnv
	 XlNTufmUuMUoGsXHClbSSWTh1WMMglTlUL90hOF8uJnZ0Iy6JuoNAzQfRZQAPsEsL4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u/xWhErjST9JRJm1KdXs/0MD8YoYtL1XVol2CzgfeIs=;
	b=czhWbTJsRxwkDfaEpZS99yIi/XuX6M7938opaNUeoX/NN0PMQujXPQD7rC4uo4E1J6XS
	 g+QeHZtNffhCW1+mtSJcvTl/99LlHJkKULQsu7ROuQYDKeOFLjeBM+jN/MGAmrFGIYSPP
	 iFi0wr0Fyw1j3W6KRNpH/cPG8qcJqmzuiGgqxp50ikvszAOQX5X1lXW6yXIjl8SgB7n8j
	 ePGZ6dIHjjhscEMGnmR3xGeKE1/1FHArDzHiQcvZ7Jasl3jUFv/xkD78gx4hq7Xxb3XIP
	 vOFl0cVEBgTZxGYEsglghjCmMoutBzqGo+WGAJ1diKekujbjYB1GfB5ZBah5OS3vt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HdF+zjcg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+hfr1ag;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02B606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC02B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HdF+zjcg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+hfr1ag
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36I4I1157417
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/xWhErjST9JRJm1KdXs/0MD8YoYtL1XVol2CzgfeIs=; b=HdF+zjcgV7T2KWPe
	5PMV7LMlwOmccFIYr2g9xHpndcmSbGX5FEBPBdBnOKO67I++b/ILK+kvYGF2NTLe
	9NDnRYHKqbllpNKaqKOabn9vuFLfBNR9TjkicV5/WF731rFez1Cd3+Dx8xt837Q8
	EwekU7MqIpixJ/6zyP6CHIj2C/heEwDuO3ASc1a+KVXni2JsmOeM0d66tJ1/jqDq
	n7vF+i8+X0SMef1J62f3BaoE0rqb/NhmKva11OKQupxK2jwe0MiexFgseZc6j3Sv
	qqGmgDrZOpIErYS7b9qiJcGx/3iPQeOPuC6t6+LMqYAFLCNNEV2V6byOzN46Pxvn
	sBeXLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aejqux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:24:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so5727205a91.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674258; x=1796279058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/xWhErjST9JRJm1KdXs/0MD8YoYtL1XVol2CzgfeIs=;
        b=d+hfr1ag9xjm+Zs1FceXhNHMUVr6bWXWAvnT8ibsjeYZRO4IzHk6MFnbwCXLQftvFt
         8omr2jD6mcEu4XMVX0Xhyry9G6bMvhjzt+eWRmgZG4fqo1KchoVd3NDYNH0TO2iaE9Y0
         UQvuOSFc+V+UpUoQD/X4gkb45EBmDMCR/7RnMmTCAe18FJvOFiETQC0qL1EUo7JwgRmg
         XzY0t/y3IC5v5UnuC8jctsWdE1RrY6dfPupdaoSMb9k9wVpicFSZ9fHUh0rzNP83RMYA
         u14imkZargsv/1B8Ql+QbvCERgVCF6uhpg2VrxaW24R6oaDwBsZrDvL07jbYqoMitbgJ
         DWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674258; x=1796279058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/xWhErjST9JRJm1KdXs/0MD8YoYtL1XVol2CzgfeIs=;
        b=QSLrxcN8NqiJLm7vgEH0mYDU+RzGhjz4dKJDaRAuCc6JkIv3Y/wPGU5FJsz2UR8OQ5
         GVMtbUgc7Rf22HMjVAPdK1l6Hhha2XvROnH9giZsVnMJwLvVMY7CY2xyURCd2sPOt91y
         uMaR3GMyP2b7YxVCe1Y/hha3s/rHXiyM3ZbkhIPW6E80sI29jM0OYieHp7X8Q5lYkt//
         0Jj3SRW6HW/OQ1r88Zb8HM2mvJnpWarmoNGzFzEXXLL9HP3Wasf3GQhaBLg79s7450jw
         3KbhwdPBeoj/pIaRv/Tjl1y9WmTBu/9BIohqFcYumZyTLkzU2Y3AlnthatX3PM8oLV04
         uxbw==
X-Forwarded-Encrypted: i=1; AL+hErGO8IysPwUiw5uN2Hs8QIdjLyZ+FcA/mlj3fe4qohvlDPDoAyfste76vajs9Vn6huyjDUO9Bvva6clg@vger.kernel.org
X-Gm-Message-State: APuU4Z/5NaTIhxI5PaiJXDD3cXQ2nNRP6kwkMW24Wfn7j9/HeDfbEKmd
	AqNRd4Eun305Cq/bQjJ0DFurJFqxZEn/HzhD9vx65tliVCaZvf4GODfz/bikUw5U32EEpVoLjeu
	ah1qLMETis3Wy6tX0vra4Q9nfOr0Xz2CYPTrPrBvFd+QYpka+kUW2onZdpTjVwFkL
X-Gm-Gg: AZFdTZfy0zBZJFwtNq4nNnWk3CKk8ZnM40XFUcJa6SRRoOfQkA8qvoVegGdgPrjgRwH
	DdKDuzQ4ab25r5zK93gEoVNNdluS0Obnl8E475/FGZEglGc9POZPwfLJred+KGhf9ctI1I0gbfW
	J98UV8lgbNOnDjCHq//sR7zZEX7wtKS6xWU8prNMWX3PCQEfSPJzxHJ8omiG68C001C+CGoX7KJ
	AfZslBn2iGlnXfHJ1Qpq7Bk/7BYHthP9zYUkDxfzynzBNVznqKPaIBd+kXPJPVYRFcws9ytgSpo
	NjfFrs2KV4yDZafopoRxvtXJ8htDr3Cc0esFplVZTN7fylqohv0NhBUT2DpBlR5+P0omnRVpYT/
	N/k/VnTL4hv24u8XXaBq4+e2/dmIuC6NQYuQnwgDV0pp+7b7c7JwiIZ0a9Ts9B5Cxd485tH/O/D
	0CZUH5Ca4B
X-Received: by 2002:a17:90b:384d:b0:3b3:be94:8dce with SMTP id 98e67ed59e1d1-3b41c9d2026mr17191878a91.31.1795674258259;
        Wed, 25 Nov 2026 22:24:18 -0800 (PST)
X-Received: by 2002:a17:90b:384d:b0:3b3:be94:8dce with SMTP id 98e67ed59e1d1-3b41c9d2026mr17191860a91.31.1795674257773;
        Wed, 25 Nov 2026 22:24:17 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm14988015a91.1.2026.11.25.22.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:53:59 +0530
Subject: [PATCH 1/3] dt-bindings: virtio: Add Qualcomm DCP transport
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
Message-Id: <20261126-jshekhar-qcom-virtio-dcp-v1-1-7b49bda74916@oss.qualcomm.com>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674248; l=5491;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=zCMy86BiblMaTBntUv/0p8a9VYlpgN/fmt2L3B4qlTo=;
 b=hhE9orONRXV/1l/KbhI97l59bUccrilv6rQt4kIGT77iWCoOC9B3G2WbTS9bMQVJmyqEJ8bMQ
 mOotnZGbPtgDcESFt9uxYCyP8BSr3nCsXTCgU1qSSbzuMCEpStkvoO9
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXy+m+tRpbdfxW
 +pKbydZdJr2n2/QNHSwHom3lp6Il4Vgnn+pMejzTIvs/g468UIlNgDw9XjzBjgNf9tQJHkx26LT
 KMvQmKnEXD1g9kAAqIlNm02eTfwOHBo71FJlMjjpvT0d24eIvbJM7TVk4GjDARzzrqmaNJBStL4
 ksaafO/4uzUL/XsxULN35/k1z3Wz6PATAQbY4bK3veveuU1Dhn8lR8xMLcZDePO+onfyaGBLGXX
 Zo37Wzu9tMtIvYe507ZGfVd3qpAvfLvsjXv736NPzC4EWyKx3h981cdJEDz8w7IXloYlBwE+5ep
 q8w0SGCnbV5hRZlInQwFp0/y6RL/m1jG4b8zhym/1I+1/v+TLhERVw3fFaD1TQz755n6IjKvYwR
 7vXnYzRgoywTJynrhNJ+KFf2YeZ7vd53BzGMTBOXH1PO0VI8qwcoACFX3PkxaxQOpj7/MAVo4dF
 7jMQFYndTZltkuUL9qg==
X-Proofpoint-GUID: zSwr6S1y8J4bUp84wd_vFC_JrDlOoscm
X-Proofpoint-ORIG-GUID: zSwr6S1y8J4bUp84wd_vFC_JrDlOoscm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXw7JR8D9WkqSn
 UNth3rQejvdx+C27j6KHUj237zNHESoSDsAZaRq2SILYT+M56PLdGl27v4P2NafQNkVr9LKLNd1
 zGncZhlpK4n3CEu+dzq6/fAfWnkv+CU=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07d092 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=mhW_SsdmBOH7Z-IcfJMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Add a binding for the Qualcomm DCP VirtIO transport wrapper.
Document the IPCC power-notify resources, transport MMIO region and
interrupts, transport IOMMU context, firmware-visible IOVA range, and
mailbox channel required before the transport accesses its registers.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 .../bindings/virtio/qcom,dcp-virtio.yaml           | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml b/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml
new file mode 100644
index 000000000000..46b0e53468be
--- /dev/null
+++ b/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/virtio/qcom,dcp-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DCP VirtIO transport
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  Qualcomm DCP VirtIO transport. The IPCC power-notify channel and
+  associated interrupts are required before the transport can access its
+  MMIO registers. This is a Qualcomm-specific transport and must not use the
+  generic virtio-mmio driver. The DCP VirtIO function is described as a child
+  node and is assigned to the registered VirtIO device by this transport.
+
+properties:
+  compatible:
+    const: qcom,dcp-virtio
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 2
+    maxItems: 2
+    description: The VirtIO-MMIO and DCP power-notify interrupts, in that order.
+
+  iommus:
+    maxItems: 1
+
+  iommu-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      The firmware-visible IOVA range, specified using the parent bus's
+      #address-cells followed by its #size-cells. The DCP transport uses two
+      cells for each, encoding a 64-bit IOVA base followed by a 64-bit range
+      size.
+    items:
+      - description: IOVA base, high cell
+        $ref: /schemas/types.yaml#/definitions/uint32
+      - description: IOVA base, low cell
+        $ref: /schemas/types.yaml#/definitions/uint32
+      - description: IOVA range size, high cell
+        $ref: /schemas/types.yaml#/definitions/uint32
+      - description: IOVA range size, low cell
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+  dma-coherent: true
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    const: dcp-power-tx
+
+  display-subsystem:
+    $ref: ../display/msm/qcom,dcp.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - iommus
+  - iommu-ranges
+  - dma-coherent
+  - mboxes
+  - mbox-names
+  - display-subsystem
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    / {
+        compatible = "qcom,hawi-mtp", "qcom,hawi";
+        model = "Qualcomm Technologies, Inc. Hawi MTP";
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        virtio@9be8000 {
+            compatible = "qcom,dcp-virtio";
+            reg = <0x0 0x09be8000 0x0 0x1000>;
+            interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+                                  <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+            iommus = <&apps_smmu 0x15a3 0x0>;
+            iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+            dma-coherent;
+            mboxes = <&ipcc 13 5>;
+            mbox-names = "dcp-power-tx";
+
+            display-subsystem {
+                compatible = "virtio,device34";
+                iommus = <&apps_smmu 0x400 0x2>;
+
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@1 {
+                        reg = <1>;
+                        dcp_intf1_out: endpoint {
+                            remote-endpoint = <&panel_dcp_in>;
+                        };
+                    };
+                };
+
+                interface@1 {
+                    reg = <1>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    dsi@0 {
+                        reg = <0>;
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        panel@0 {
+                            compatible = "novatek,nt37801";
+                            reg = <0>;
+
+                            vddio-supply = <&vreg_l12b_1p8>;
+                            vci-supply = <&vreg_l13b_3p0>;
+                            vdd-supply = <&display_panel_vdd>;
+                            reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+                            port {
+                                panel_dcp_in: endpoint {
+                                    remote-endpoint = <&dcp_intf1_out>;
+                                };
+                            };
+                        };
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

