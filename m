Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143922;
	b=oK7XEfCCR49nftObWY5uIQzVD+ThUULtAKkpGCwP0RTborQfGfz49KK/Bf/X1D7xWjdK
	 iJ8sqtsapzxM3qqBZkLRHH59ivK5DYyH35TvDflH14x3EnF6QukPkt1k8ltl1uIL6IWqy
	 r9j/cVlG4uZP/u2MtedX5HqAhfzO27aNO3toSlNlDhe4tX+HIMpwRWCPi5iL9R6DR1d12
	 zKJb9hThLTKmWz48dn6wLJD+YZc4y0oJPfMRtMfLuIhM7yUzaANck8Lzd4sWLr2l/zGZO
	 0TJ4kNZFvorvuJO78PjO3+88fQdaeSofODWuZQ8kwxk3DuKFvzJ0GIaaqtw/oxw3y/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3rxffHufu/Plu6e2c/GG8GZwxg3tdtgLE8Qiwcruq2o=;
	b=egvAt4MPiYcwlN5JYisgY9lbwnlJf8gwPt8tcBH13xF8wFazVlE1/M9txNs4aUp/7kTW
	 Xnwbwjd7Qg3PDRBRlTQGgoZMOJq4VtYKTBiVIv0Ly0BPdnwPIH72/kvj+Sqa7ne0qfNtH
	 u7EVHJ/aawuz/IJMcAEGwxv+M88M0ttXALhP7wHY5QjT6tlf3qfapVIZDqLj0FkrHM77V
	 y3In3zs6x+S2MTOaqLe455T41pnW3Un5bbdi2TodqM2/i+avPvGrwE8jfD/CijrUDaZHs
	 A+hf/aT3pGcMxyGBXJu7pOr/I1bQv8THWdKkh9ML4oUXCCyjdYEruVpkf6Oum3wq0ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGYyZvSl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+iYzHwk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39359606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39359606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGYyZvSl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+iYzHwk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Agncu284685
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rxffHufu/Plu6e2c/GG8GZwxg3tdtgLE8Qiwcruq2o=; b=fGYyZvSlHAgC2IZN
	5g19idYCI0N9f/rkgyjLx0cxhPGP5mHH5nBcFSg4qA4ODi1OotHlY7oHZ6pRsA/v
	LO/SkuIa+Uv5H8fYA+3rwo3VNv9N1rhLcwfCraaGpZCGdCqkOTrACAAJOdXAPMkm
	CAZUNjyI7kk0RGvN/5OKhcD3LerBSMzIriEL7kS1KYZi4FRG9EwL3vM7c1Hmj2bk
	Jt2kpp/WZiEHaq8j/5AELiRCg+5VUNb6wx4UJoyD6YDWVjTKZ5iPxV+HuaIZfBDV
	JeBpESEMTzbvRD95LO9KeSQ0b4yzowyA3Pu8437kqUrI2H+Sbzc9hGbf6uGXledQ
	CYaH/Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99jsts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:18:40 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25dc2aa8bso242434c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143920; x=1794748720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rxffHufu/Plu6e2c/GG8GZwxg3tdtgLE8Qiwcruq2o=;
        b=c+iYzHwk0S/qxWYhgtmkWzgWVN6F1B3Quxb6bDoJ53OSZKglFahEkPI3OyNXszfEU7
         ItUWlCjAIUFgmDOhfY3pi5WBNK3ZzFH03LZhvyc/4Iwq4EhF7bj/CIi+4jKjBtuhMsWc
         /6MBIZEqpExfvQ6AeMcJJa4ln0ekMNjo1WuhExjMGfjI8Diffxhxp2i4d5wAPvQetzrR
         8RPQtA1SRHzLMj43tMeItNmvgi2CHSrqiBb0bMyVhn/bvRKz0WH2LKTAA9mMpaw36e3P
         6U1uEpLa5P66MgFOLiTOUqOp59dGTVqDTzDyXrqWsfe6HDLv8bRgcpzaZ9UjbqbsccE2
         fL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143920; x=1794748720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rxffHufu/Plu6e2c/GG8GZwxg3tdtgLE8Qiwcruq2o=;
        b=zIxQhJA83iVcsr/cS048pb0s8odrqBL5zbusdNYID3jhQ4lh109WmURmd05C9H2AO6
         NrLZBiIHevy9f6pedIX+wni6ru4F+ZAs7Q1ozx4dwK50j9dpm9jDDkD6p4FixhWv67o5
         Oiv8xCZs0pCQDmakvR9i8tBKDlaoTNikUSHuNzZTUj8/5hs2BjX5RTUNR8Dilabe90Nf
         0HleoBfNikxynLFIUMatXLPylaVZsvS1hctV7v3ziaMBZKm3mxMqpeeybCQrmAmZASNH
         dq8DzWg+LGydO5zJx+xtWWRRoiDO8M1YgmmSUD96rs4TqJRlNDlesLXkjpdBhPv2Dhk1
         tR6A==
X-Forwarded-Encrypted: i=1; AL+hErFEe8NBKhZNfxXnjbXRpPlQZgySvyF6ll+3YSHLDygJ9UvH0H/8ZfDsPOIz8HV8fsK07w2OT3MtpX64@vger.kernel.org
X-Gm-Message-State: APuU4Z/kz0vGmJkXWde4geXDDVKBo3/IujVc0pZI8MJnfc12e41qEDO7
	Tc+EGPQEXwzS3B5HyoGT3Nl9+vfql385vNrptqacAywnqyWs90JS5LpFtMKUu6ueuAcqBil6d1z
	/zGIUcKXpQ7vKvEHVHjLYdiD7cKCCAZf5orf11K5u+kD0OK0lnHmQWFKybww9rKvY
X-Gm-Gg: AYBFou3RbZXNxTF1j1fyU/Ez5VcJedeEDp/MQmumwTkIgmVO7jVUyeRFghUuzhbmScG
	7FsRcGAYLEDTwlMByiEzusFn5PVWwivuL9pA7GzRCt1+MCnixf8mtg2XT/B09VffbGQUObMKDgZ
	2FH+AGApirsI4umi5yebDWQwd4WFSMTpWSzwU4eXWacl+4OJcxDmhwIAzrD7QZyACOzbT0p6EmN
	+md9oKfv8XpHEb4QTf3civh09cNwb7ApNqTvIFH2tDbqcM247HtiiejtLmaBhugtfvmTtTy8xsh
	m/CBwAxkvCmmW7LrIRw5O4hhoELIVnUR63fSSQH6m3sFUwsvYC9QxJlpFVQwjDFGQXtiXVrDTBU
	jNLw6j+XAbTzNbYRfOG1uR1b0gpwSsCXyG3M8heGROP9U36C0GVQJ1V6uhsycLZt1Gu5mXTHqF2
	DnSag=
X-Received: by 2002:a05:701b:271a:b0:1b2:6cba:7f88 with SMTP id a92af1059eb24-1b39fedc610mr2073567c88.44.1794143919690;
        Sun, 08 Nov 2026 05:18:39 -0800 (PST)
X-Received: by 2002:a05:701b:271a:b0:1b2:6cba:7f88 with SMTP id a92af1059eb24-1b39fedc610mr2073512c88.44.1794143918877;
        Sun, 08 Nov 2026 05:18:38 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:38 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:22 +0530
Subject: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on Qualcomm
 SA8775P and QCS8300 SoCs
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
Message-Id: <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: QGmr8D_pTnmh8LRKy0P5XWeV64ZgRpUI
X-Proofpoint-GUID: QGmr8D_pTnmh8LRKy0P5XWeV64ZgRpUI
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af076b0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nKCL-24MKaImGustjYoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX2t+/U7ah6Qrk
 skShrETClcanojMATXwIiHodEebu+65CvdoEwzQ5YQUFvPcL3ZF9fe1vi6ozklLZqqyS3P2HdBJ
 VK1wKgLE55WV1/Vm4DCOW9hnjtScMElpt9BidWOFf5aFcVR2hm9FJtzyFbLpqLxxc1CZGgbym5c
 jcGsJ3UylplDsY3cHx6Rs4Iw1cw58d/clR6XCL1DPOyOEzpA/R9qCr33q9DWYf6/wfxNrKmxdj0
 E3f4xlpbUBN0kTT0oBk19R/EPTd4iQxbbjGNNbHGdiSS0SY+f8bH0ozy0jFoQ27FMc2j6izPg1U
 r0fVceiwTTEecOJJOA34b/KlJwc5FBmt3qYwt/uftARJ/jMQtq9vwdDZRlO20mIoq2TwiFqaGu1
 LGwJY/wqO4eLaOZ8mOOodor9IUqqQAxG6jzMtHCFAbBPBX4B8DzXhNgJvjfGIeETEWFm/bWkMG9
 bfKCleSFO4o1kGecP6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX4sxuNEugh33R
 2nobrDYTELukpkskDN/eRRS62OxencVPeIkXy1DwSykYSouKX41fbA69zBv8awg16eFJOWBiTt4
 vG8t23b11LwhAV7kGliBsTxP6anp3+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm SA8775P and QCS8300 SoCs.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/ptp/qcom,sa8775p-tscss.yaml           | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yaml
new file mode 100644
index 000000000000..b3e3a7cd7166
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,sa8775p-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm SA8775P and QCS8300
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TSCSS is a time synchronization subsystem composed of two main
+  blocks - the Timestamp Counter (TSC) and the Event Timestamp Unit (ETU).
+
+  The TSC block is a timestamp generator that maintains a running counter used
+  for system timekeeping, and is functional with just the AHB and counter
+  clocks.
+  The ETU block captures TSC timestamps for external hardware events. Each
+  ETU slice binds a slice number to an external event selector, and a
+  single summary interrupt is raised for any ETU slice event.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,sa8775p-tscss
+      - items:
+          - const: qcom,qcs8300-tscss
+          - const: qcom,sa8775p-tscss
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: tsc
+      - const: etu
+
+  clocks:
+    items:
+      - description: TSC AHB configuration clock.
+      - description: TSC global counter clock.
+      - description: TSC ETU clock.
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: cntr
+      - const: etu
+
+  interrupts:
+    items:
+      - description:
+          Summary interrupt raised based on an external event for any
+          of the ETU slices.
+
+  interrupt-names:
+    items:
+      - const: etu_summary
+
+  pinctrl-names:
+    minItems: 1
+    maxItems: 16
+    items:
+      pattern: "^slice[0-9]+$"
+
+  qcom,etu-slice:
+    description:
+      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
+      qcom,etu-event-sel.
+    minItems: 1
+    maxItems: 16
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  qcom,etu-event-sel:
+    description:
+      External event selection value for each ETU slice listed in
+      qcom,etu-slice.
+    minItems: 1
+    maxItems: 16
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        reg-names:
+          contains:
+            const: etu
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+      required:
+        - interrupts
+        - interrupt-names
+        - pinctrl-names
+        - qcom,etu-slice
+        - qcom,etu-event-sel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,sa8775p-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+                 <&gcc GCC_TSCSS_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+        assigned-clock-rates = <15625000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,sa8775p-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>,
+              <0x0 0x01c90000 0x0 0x10000>;
+        reg-names = "tsc", "etu";
+
+        clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+                 <&gcc GCC_TSCSS_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+        assigned-clock-rates = <15625000>;
+
+        interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "etu_summary";
+
+        pinctrl-0 = <&cci_timer0>;
+        pinctrl-1 = <&cci_timer1>;
+        pinctrl-names = "slice1", "slice2";
+
+        qcom,etu-slice = <1 2>;
+        qcom,etu-event-sel = <1 2>;
+      };
+    };
+...

-- 
2.34.1

