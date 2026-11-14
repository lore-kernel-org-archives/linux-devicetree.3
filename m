Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625769;
	b=lVwWjFstfSgm1oJLoi5aK0/36JP+ZzhRSI/PGNIBDL60aeVLGp92EEHt/6ogbO0TjkGH
	 iRgKvZbv/pghgodqTLsiEDQCeBVltKPpxGSX+TI512tPSXT+y72DMBCZWQfxASqUFIVsb
	 /oQsBQf1HtpgQok/Efq5q/JRbYiRmcxvxZLNbcwpfuatc5SuFTK1UGJxBCiXoxBPB2+qG
	 2uN5+oJgsk3VEh89B9hL7D6cOaYmnq8f7qVkKfWQ5xHqFimZ2mv/Sy9YV+HvcopMhLd9J
	 11tI0srVDdkm0xbpWjJYhiFEZzEvMQKUOSD5+0o3fMfgsVkXg8aIek2ngX96g9eIvzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ovOu2UP++2nSHdhlpPmqnhrYxMyicygp65UamHq1Lco=;
	b=UOwuQKJFxzi/A855s+oAlsJi2eg17bzM0G3wQ1zOG0xKRZabGDtCJApwlhIWkP+aRJyO
	 xqij4IX8JQ2QcYjpHTN3Z7Y+2GqKE3ZNyQ4wWrf1FNg9FFhVwHJ4bv96ENzZ3kFbbTEgv
	 5eTLMeNU/QyUhbmzDQxDP5/bR77hVyGuTC3jK3SjH3e69VlYOvq/1yBHoCy4hwFUTsn2V
	 zC/+PJBvdpgBBedmQPIM+gpukZy24XDgcDN5VXtIWEMQ+QCfz2kR8LYAVRP5Scd09gJXH
	 BTXxOzSzL7hag5FlI4TOzRFqx9BWxTxSSf+HRPN3KzAV2oUVP6PZk/1ExTCFG7kkSSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Gpgx/5de";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsP0Bvga;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585FD606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 585FD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gpgx/5de;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsP0Bvga
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE20An6728990
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovOu2UP++2nSHdhlpPmqnhrYxMyicygp65UamHq1Lco=; b=Gpgx/5deT6sc66H2
	g5aVCbVEaLOcFWgFsHQP6RBShReg4tDo+pUI+au8P8p/9imWP8WufBCOitCEUKZZ
	tpu1FkGLCPzX0UCIckCRBZLIUXWGD90M3e4BEeC8UbA9RyRgL0ZKm7uqf2YCYjS1
	c4Bw9w66VDUXNUV5ft75GYrXSCilS0aAzdIvH8hX2feBmtOiAP6qU6CkT5UQ3Unr
	oiFMt82fX/4jhFTjoqviOLLOvFHoi9gr80ZjCRzDLQjo05TT6LnPUk4qoEpIG24K
	YZSIPZtumqZ9277CAX7eAWRFpGOpLrFgJlvjgEgXAFeCnsSolhwNlSdv8gK1uUys
	iDBk9g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nrcbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c58d35c0aso266631eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794625766; x=1795230566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovOu2UP++2nSHdhlpPmqnhrYxMyicygp65UamHq1Lco=;
        b=CsP0BvgayrarpvEUZ5wUeO4F5hq+YlSDQZKCEAqCwCrAhcXRLkHfzUxzCRc+o3HB8R
         M531rbtK7wnuENryh5aTapEnFKhGGVkC1bkTT43XGUB7kTE3vCSjw/KODOF65dmN773Q
         T8WQgDBrj7518CotiORFAixsY9yMpEZ0NHqEp1xZj5xcGA1oovrrFY7T7d/PkMXJ5+3X
         j0ySZOyKZQbzmzdJrmaKbGYVhhUValdPezv4VjoZnVrdHN8zIZl+epPSgzlctozdFiT4
         5st3yzeomYmuV7mZhFGyIjY6qtI9YZuspnCmczK8gT8zOmiz1Qf+PjTKSLQ1cgcemxEM
         5/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625766; x=1795230566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovOu2UP++2nSHdhlpPmqnhrYxMyicygp65UamHq1Lco=;
        b=wyg3UfljGhyhRuuxpcxd1FGImqPS6RbLr8/u4T1v9H2agxIf81CPVded208Ld+VV+s
         dxAWSBfKwbKqwFEogJNQ7A4A3sdZ2M+gz3W4pT1J1sVTCDDU7HoBdJj7HckXh2Pl/4yX
         eTdGisBk7s1H7RqK4gxx3RpvWp5pMCMIQua4pS38UV7bbILaWzZOrxBxpCAcEW/7B13h
         G6l9iE41kY2FD0ZOODOlvmtxbs7R2y75IoyyYq0byxvGUCBl8a26YuWOIdd5bP5B4kmu
         CTSjTbaP0FsMQ5QoHF/V8FdFWYofxX4bIAnKKXIiFd4MSas6yvsTri5zVE01PXQobI+1
         dWzQ==
X-Forwarded-Encrypted: i=1; AL+hErHuOL/8BUgfKi5ZEqFxJzs1P04sor1c5+VkbunQcJvz3lVCQ58ceYQN+pWuJP5JY5swREgqgmAQQXZe@vger.kernel.org
X-Gm-Message-State: APuU4Z9t+6qcKgoTlw+pJFzJE/twq+YICaeYwJxxnO5ZfrzFwC4UdiUO
	fAWr2YI566z7y4zj3S5awNt4KU/jJNzgp2k0b3/H7sHHIao9uRRj+czBebFMhElThTwAj/FV0AQ
	BsEPe5kNX7oh+pO5++B1D8Ba0itZixEt0gJCcuX2WCfOlL1Yq2y86LknPA7DwuyIb1Hs/Cds4
X-Gm-Gg: AYBFou2j2skH6G5FCfwB86fxgwsmBwWPFQiSnUZJ/SPufemiWngpgVyMiStjPB21Jds
	CjjFgQVGgGGLQnemgFUBxqxTYog+jGjFm/gIWJShX2zjJ1Acsd9dgonKVLZNkxtCfDZaK5EySIf
	NbNwyzYRPzOISgquNHzUwbukcLOCkI4PdgF9DSZr9IxZT6NQaID4Lri/a7FsOzIJGOFgQ8hlGtn
	6Z1vzezptOVbaoSLNH8n/CXpDLOc6XviNFm863I1lCQxGMaWKZXe7pdGqL9M6qkaXedsO3jm+eo
	THnNGB9jWi4kQDzeu3g02eKAojFW25Vq9S1hhyWeB4X+Jl+/yLEZhJfRkzouQ2JDKeYBKBrG+mz
	QthBU+RmwGWc9pH0d2zFuxtiiL7wHc8A6OamrJ1eclrZ5+8KKxHDMsDaSwBnJFDLu2Mx0zQy/Wi
	iv0cDgYnQcvBI7O/bBz2v1DMMy2k1E5XzV
X-Received: by 2002:a05:693c:881a:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3796047ff23mr5891068eec.0.1794625766228;
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
X-Received: by 2002:a05:693c:881a:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3796047ff23mr5891024eec.0.1794625765633;
        Fri, 13 Nov 2026 19:09:25 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11158803eec.16.2026.11.13.19.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:09:25 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 19:09:22 -0800
Subject: [PATCH 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua video
 codec
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
Message-Id: <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625764; l=7265;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ghTHXTCvd7eOk6uSjXl1tAvTuMYTkm8SazpMstLCBLo=;
 b=57XtPUPg+8LSdf9vmav4lku38gwgL24/w45tpdryzJQPlMvVCMjnV7JGInf8+TVuk6X3Lp55j
 KSYQCDzXuV2BIbej0CTAVlwn2Ajzxyf276N81PJfoGj8f8ERfrdxzPA
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX4CA0MruH5blg
 S4wNaCbO0yAiT2S606g+pR/N/cKbsOCTY2+MjluluC00QGarADhfM13nRAUpyTAz1hqlmI7mOwO
 ADPxIIgArZdfejGKwPPZWGniKqxJVTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX5EU45pTCF4Zl
 NO0ern3MPY4fyV3Yv4cY5HenNmfB8rS+qdiNHrdsfuXYEM0omVag+LSc95T5cGZ6zZeG4tZsfI1
 KBOLzE/TpGblvbdJO9TLZMIDlY+phmsRJyGbhgSpPu4eAN6gkJh12AIZ0nYXFqyXH7CA/CrHjUB
 hiCQ5CPbWIa+5JvvLncRyqWVaxOp9z44W6LSMV7BF+7i3jWY61CfZ2k+KWrDXVzgzmCboAOORow
 oW5GaaC5U6enetwy1+1sZPaVPoyTeNUAsaUGo2HuycMUseDrbDNapaEjejQ3d+OTVD6qpb2JI0R
 Ocfv+baus5Q0/j07LmiC7T73TEYOML7FVBeW0ynYR3b83t2akBTQtGr6gDPapOFXg6YnCN57GVm
 zBBP0p09m8E0Izpu18i0YQlHsFhmnHx7AryqotKAbuD9vIIKPx26NMiGlCLlkBCQOnN/XoubS0+
 5chqR1qBTU7hEgBLqSQ==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7d0e7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=wyAc8u2O2XHP32wH8dUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: iLPSMDsWmNZ9DkAY2VsJrdUpSHGm0_cI
X-Proofpoint-GUID: iLPSMDsWmNZ9DkAY2VsJrdUpSHGm0_cI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140012

Add a devicetree binding for the Iris3.9 video encoder and decoder block
found on the Qualcomm Mahua SoC. This is a single core derivative,
leveraging most of Glymur data with the clks, resets present only
for vcodec0 core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 243 +++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cbae6bddf7fd4b67330ce47033874f3d349e5a3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
@@ -0,0 +1,243 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Mahua SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qcom,mahua-iris
+          - const: qcom,glymur-iris
+      - const: qcom,mahua-iris
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    properties:
+      iommus:
+        maxItems: 3
+      memory-region:
+        maxItems: 1
+    required:
+      - iommus
+      - memory-region
+    additionalProperties: false
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - non-pixel
+  - pixel
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,mahua-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core";
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>,
+                     <&apps_smmu 0x1944 0x0000>,
+                     <&apps_smmu 0x19e0 0x0000>;
+            memory-region = <&iris_resv>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1943 0x0000>;
+        };
+
+        firmware {
+            iommus = <&apps_smmu 0x19e2 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };

-- 
2.34.1

