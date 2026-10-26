Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007694;
	b=eQ5x7GGOruUSwbUu/CW2I3l3PSAv/NBfQ5YWk1J+MefiRKTBP4xEpcoOUj6bXFLMzrA9
	 xA5rEHBYlAvdBx0OxzivHw7fpsNlJ7e/xId3c1R5MX5ONv5uQWnPWTr2ID2dMBt4dvzTS
	 fANOXpBZeqaK2Kqw9fwQMZZjIElelAX5HmhXoRqi3uqcNBMrpoFVLPOIG3wEgHDirVdWh
	 dqVKDp1zPV5J2NUrAe/eZsA9wZLVMlROIgX0wPWsU/ZjFf1BRK9ROSDxr0AB2rbIEJwGw
	 MN1CdaOIwVyBQX1/5cA+umE+GWV3fQP44TghINdpJ5UYGJg+UUY1sUmPK3+AVTUTaCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=niHnPNS4j7b8me3YUuaMCbVbzdtn5rF7l+LNOV51YUI=;
	b=v+fEoaoYG7jBa06zC0kOsDa04yBrkY9cS/6vMIR4Bd4BtQI/uFL+3k3wSddv4Rvz0snu
	 tTKpoqu+SBzEEp+bG1cuFxpTnVr4dqn+JX5CaVqujuUPK3HWn5WmEJnzuWYJc3wC4W+6K
	 rRRS8iPg9bD/JMp9+degezVkg67qefzvqUTzJ3a6ggafUkDIota+xu6rF4M8QerVcvs4i
	 wZHbUx/d2u+6leZc9X6xzs4+A2DVJ9MXJZDDIFsbnJ/lvm3CNkhM6vulTRgeyQXoZG7Ih
	 kVn7dU9epnwD1Aq8yxRB2UFNsrduC8VZiYs7SipXjx8lRVLSpbHyR6/39pP/WdAsb1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfuFMLg3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3Covwxg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527FF606A320
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfuFMLg3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3Covwxg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bbs6718659
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=niHnPNS4j7b
	8me3YUuaMCbVbzdtn5rF7l+LNOV51YUI=; b=kfuFMLg3s1QzdI7oJ66bRfABjSX
	yzkTsgVEfiYxHkN/lOXXX/B0mWeqvMrJ0+6g5sMVgZGv8SEBDFhxAzldvyhskXJh
	BvLhm1DDQQ5uZkKrYZMvVaxy3JkwxePsCo1r61QD7BpC6dd4HIDKbk+LoKCZLRO7
	/hUTD+/iMbOVNXYDzh+HspjIBvUBoKP/Rsj+1q6BM7Dz/WQ3+E2nvQpVg2qPte1t
	n3awQOMWZ8fqxxrjZI0mGuVxD0jZGZ2QuunCOPBlNEW7lUFECQjjl10ZqMhIIi6c
	yiNdEe0eJ27tQHdqLVMEQbXtsbdykIJKdnNZgo3K3y74js0KbJJIXx1dfcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgsstut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so2601162a91.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007693; x=1793612493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niHnPNS4j7b8me3YUuaMCbVbzdtn5rF7l+LNOV51YUI=;
        b=B3CovwxggUnLAz0Mo9ac++LP57g+JIBIbUXr1CW28kev+jlMVwJTPPMSNcemcTyDY4
         zMzpw+CbqmYH7+uR1VydF14RRn54Bd3K83fDj0CLT5t1co7I9egtONztVWGme0dq3BTp
         LQo2eZlE9PVgOe2hCrks7xwMYma4mIPoXBA1O4ROj/zIwDNnSh45T476WLKPMqNz5RFb
         pCNMRBgyX7o2WgA93L3mPhN5ChsbeanKhIyKd0qbUVsJ5dlaoN4LzVpyyEhYr1tursg8
         AJS0Xwy2bmuyGjLu3DhDGWSXNbiI4Iyc66ViR8qTy3SeE6LKc8g9fJyqma8aS0avzplp
         dJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007693; x=1793612493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niHnPNS4j7b8me3YUuaMCbVbzdtn5rF7l+LNOV51YUI=;
        b=OOKPcHH5Eqtl2Aw2Q6jN259B/gcZOhDVpoMQ30A0ll/H0Kq9lhaAZvsKA8k8G9wae5
         CyTBxKY1E9lMq/3CPq9jBJ5k/oljHabvPjK8eS0nv70DXcUddAQLncS2+GCuWCiP0rVq
         qmUrR1uxsWhH0XyOffii1pCq1cw3BtWatOzJJKDV/balBSWkwdp/KouIyx9ZQ+BbKEwx
         9NFpC6mVzXmcFxHtmnK0ds6eifCWABwFNYg5nhwJJzjfds7umXMnyKstGMq1eKLWkhRm
         4JCWZU2hvkkP7ROu8CaXRKcjZuEA1XTFk1EhKOzdq3q6aeZxYykyg73/BYqoWbZq0WWn
         cDRA==
X-Forwarded-Encrypted: i=1; AKwUvBwIe3CaU8wdlR4uGgbffJF3GjXOvzuuVPMmjDOlc8Ev4NqffXFIr+b6lJXW8fOqwpfHo4q1RDR8c3yB@vger.kernel.org
X-Gm-Message-State: AFq9FYL05RuB4b3g24tXL7JlhB18C2jwwjPrTzHun8+3oFSQSK9/VYPI
	09qi2wJsKb4L2YNujmqfW8HVASl9+SajSb8kILm8QqWytVqV0WcNJwWtgL31H1wZeXnV90doHU6
	zI//+WIS6Q9bE98XNYs8/uUZLbUkwTWQ1aSu0mYXX5r1FDqWjs9bR5kUtuldeP8Z5
X-Gm-Gg: AYBFou2qR5Tl1UeG/qJHm9Jdki9u/R3EQrTGONKVdBaTM1TEstaEdOlGsv3Y8iANMuE
	sVlHmhJn9HFVoLl/kZzPD2GCaKo/m1UfqX5CFmOy/dEGwmyT3lyJe6dwvcRMWIDIruCaeGzXWSM
	FtHBc8kbymf5grrr5gse5OasfXTvZIxyamwRV41UWA3YVEMQ7Un4CZfBoESLgWUn0jnkrPeGA5w
	8Ra0+w+XM3/Sh1BxeYmTV4jJRRGjVB65tZEhg1OKBNi9lT3Ui3noe2flM+qS4Nd+J/T+zCKObyz
	FcS/Uthyehp6XD2K9nrgl1FWTqaJ0s/EBQJQh0/vzk3AI8t8frij1LAM7gzVJjQTcwGMls7pliu
	zGoLhinMhOBm+o9khhEFY8xNiafw=
X-Received: by 2002:a17:90b:274e:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3adead57c9dmr5510122a91.13.1793007692787;
        Mon, 26 Oct 2026 02:41:32 -0700 (PDT)
X-Received: by 2002:a17:90b:274e:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3adead57c9dmr5510084a91.13.1793007692169;
        Mon, 26 Oct 2026 02:41:32 -0700 (PDT)
Received: from hu-vhiren-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7847966a91.12.2026.10.26.02.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:41:31 -0700 (PDT)
From: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hiren Gohel <hiren.gohel@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
Date: Mon, 26 Oct 2026 15:11:17 +0530
Message-Id: <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
References: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX37adYRelYMC0
 kvI+SDxVpx8NVoaO0mwJX5/3kow5iprcfGvDiantaleFtz8h98QRqg/+JRYPiFn3ompj5OtaUpo
 m0/tkjooXWtaGwerl1VGxXirfXu8p8I=
X-Proofpoint-GUID: YyrMBB18y6q6ANoIl_ypTnkxvLDMgptz
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf204d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=agO9faSf6CXyJqtrtTsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: YyrMBB18y6q6ANoIl_ypTnkxvLDMgptz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXyeg6lOXPxwJj
 UyznQakTVRGJG0p1Z7/pxyrK1+S9uCBHJIrRQn6RSnkH6A9OC6yl/cLbUxzVDuYp6dKeYm4QX1s
 y0C+1Hur4uNhCiM3F050oJlPbaCtyQjCoa9zl2tx9xw/VXoqp4D9Ir3wqpdFCNyloIPOgCV4j1/
 9g7mAP7Sc1ClyIvMID+iwntdzJvnCruBMnPUaqMVe/3yb8O1ZP+vtH9NtKdLvbjkivdOEbv6WtI
 8sS62K50cumFA0iWRfaXQYvi9TlCdBmZjmqWmfjjFq0mCb+W55J3iut7UeQlCWgDyJVvL9DueZi
 F1pfbdjlkmO+KTmddRW6WKLzUpkfEw/wazLc6lR67fcZNZNHy2JsYt9jFOkWx/x9UCn4hFEgmL2
 N7nLhdXDkxdXLclsgSixTmzY6IhpCRjbm39bKCEDWvTf/BG0yngMFobo5TF1vX3lOJPTQbXutUC
 tY1mNi54IByPKRioC6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

SA8797p platform abstracts resources such as resets, clocks and
regulators in firmware. The SCMI firmware exposes multiple protocols to
control such resources which are identified by protocol_id.

For this USB phy, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

For example, to power on/off the PHY, we should use the 'core' domain.
To disable data transfer and keeping power enabled, we should use the
'transfer' domain.

Add a new binding for the Synopsys eusb2 High-Speed USB PHY
found in SA8797P.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have ommited it from the bindings.
We can document it (and make them part of the dt ABI) once we have more
information.

Signed-off-by: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
---
 .../phy/qcom,sa8797p-snps-eusb2-phy.yaml      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml
new file mode 100644
index 000000000000..0a9f44199490
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8797p-snps-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8797P Synopsys eUSB2 PHY
+
+maintainers:
+  - Hiren Gohel <hiren.gohel@oss.qualcomm.com>
+
+description:
+  The Qualcomm SA8797P platform delegates control of the eUSB2 PHY clocks,
+  reset, and other platform resources to firmware. The SCMI power protocol
+  exposes two power domains for the PHY. The core domain controls the PHY
+  power, reset, and clocks, while the transfer domain controls the clocks used
+  for data transfer. The SCMI performance domain is not required for PHY
+  operation and its opaque performance values are not part of this binding.
+
+properties:
+  compatible:
+    const: qcom,sa8797p-snps-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    items:
+      - description: Core domain controlling PHY power, reset, and clocks
+      - description: Transfer domain controlling the data-transfer clocks
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: transfer
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to the eUSB2 to USB 2.0 repeater.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@88e3000 {
+            compatible = "qcom,sa8797p-snps-eusb2-phy";
+            reg = <0x0 0x088e3000 0x0 0x154>;
+            #phy-cells = <0>;
+
+            power-domains = <&scmi12_pd 1>, <&scmi12_pd 0>;
+            power-domain-names = "core", "transfer";
+        };
+    };
-- 
2.34.1

