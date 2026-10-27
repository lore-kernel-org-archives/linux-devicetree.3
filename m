Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124542;
	b=vgPxUtE0K4Sd7O1kbTF+GTGDzBKPqChaLnoMwJzIXDzjmh2cEds27Irf/49FpuyQFFLy
	 FFuYAa2oHX8Fh+QbLYkZYY1OCSxlxUKa9/N0o2g9ZQAhYWTXwV9jrbZpmw0p4IYmPtQdz
	 ni7VMI1oWeUBiXaDIXLhiQ9QiBGcj0ZX5e3KDPWgXWVXW8dsvwzuDm4ZtMfQT9xuICwAW
	 MAXzBpcb/DCpRa9k539g4ipGHlgfD6ePwGaO3fKsGLEIyh5VjR2WlFh21AnQtUud+a0TN
	 lzaAIN4tU9l/YJMwCHVPiinfDOxrNZXKhdwPGnWeHDOSWk1wFZui0hBtVix+xyFHQNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zKKnREp1B9Ltp29iYCP9fQq2OLhuHAXXKGBPxfPR51I=;
	b=LRsJJ/Zv6SSoVebCEoAbmk+Ttrw7QejAHXRpGnBo5W8J67ms4NO3rYcCxOwCt3NVR7ka
	 RsVjbIlzNC9tBsTcc0glWuD7wyBOcJ4bbhO5wyqBurWU12OhySl6sAFXkFaclAYctgYJ+
	 1c9HR7GYCNZ4Z57C9VSo7RvXwQVZTG/8mGm+K95n5fp2uZ2hP+IOfIWWvMT0Cw5hjvOHb
	 p+CBqfAHgHX+Cc688VRN+7yTJZ57+p+b96SvPj4ameGCtVmNA62ai/G78M1RBHOzH1kVn
	 U/+9ryO551+SKb2B4MNQpxvvt4/v/HZ48o3UVjwIs38HTujYApasy/U9OVR6nWZaseQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ThOQX+/f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsirAZWz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B20606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B20606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ThOQX+/f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsirAZWz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH02gp2463910
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zKKnREp1B9Ltp29iYCP9fQq2OLhuHAXXKGBPxfPR51I=; b=ThOQX+/fkEuIWhF4
	LtbmpKh58Osed5RwSblFCvduE8EengVagHpK9YRCSXWfeRub77BCdmOmFq67iegT
	ZSh0u3NK+xDbK1ir9LeU1ZJtXc5hooMLEV/6ZXy1bfXLrZrWvoJHmmAwCDcpIR9H
	cajCJSjbNWMMwcU1MsE43FolZIZCL0iGS1oQlvwFLRtCFsCb3V5Qn5gBiAZ87S1C
	B7BNiMnwIDZ/xJ9npLD/9SDY+rIp1yiyaaPJJs417NRyVx1krLRlhV1yaNeykLuu
	Sp3vndVKp3DjhOolgFNqPZ9yK70JISrpwqgqjQTdoF+J0HzAH+h/6CvJP49vRFrT
	ofHKjA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5tqpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:59 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso156189c88.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124539; x=1793729339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKKnREp1B9Ltp29iYCP9fQq2OLhuHAXXKGBPxfPR51I=;
        b=RsirAZWzsX1AniVJQcvl2832VNo0U5WjMMXC0zJ88ix2vTNigsb2x8flHykQ06Aw23
         ytq91Mi8N9WyTdNIZkD465dE+eERta2yxaqzq+UzJm8XlEdpYfqqTw3fUEFBOBPalQ+V
         AjaB97EN85fdqw0Y8GXFVqncgBPeytmCKqHpEembDMN8XbRExIty1YY+WOY16a/LiujG
         tWGfinOgcZI+61tnGEeaefVq1CbEXkWZNPwQCYqvtq9UoK5s5RVnYFlVCWeLLtN+d7Vd
         l8/o9oCmEnSmOQg0Z0AmGgb2LhO4Wm0S64qpzCasbvaDbPo2TmZd086RXv0SkwS1fOQF
         8P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124539; x=1793729339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKKnREp1B9Ltp29iYCP9fQq2OLhuHAXXKGBPxfPR51I=;
        b=WlSWhVoJwn7QhCvjs/HXGwaSoc5R02XTaTY948a8Izs63VtNchk7DW+dsJuMQIBAn+
         g4hHxECMR84NgMN3VrSHhyFeurFpHaTkovzs5IblzM+l93+kF5dZCTwt4a3gLQb568Pq
         ZZoNJVRX8B87cqwPBx0iVxrEteEXyFdpdbHMx67aobRhRbRbE42E5gK4jBdZ/uV5Ctke
         iq2Gtbq75hL9h6Np40QBVTwPqsf912grTCZaJimxa5ArpAbg+rlEV6ByYmZ4GEmqFZ0/
         wY55sYGyyXbAR5DucNCb3ndMRbUPx5LEbkNTXf6skIXdWZd78O0xeo9W4cC2W2P/gnT8
         NN+w==
X-Forwarded-Encrypted: i=1; AKwUvBzH/x/J9aHOunzmaRRFv4YZhH6yA76Q7cpy5g0nb3sp14jT263gxBKOvbuefMfhm0yOOrlQlu7y6+s6@vger.kernel.org
X-Gm-Message-State: AFq9FYKxbCYpGgoPeQeNGXQH6S6SCsxhemg1FWFn4GTwM7RMrNkR0qIU
	gQJHgRMXQS2Ex4tKXUHcvot1BkZ1ncp2j9MdjHgJp8zxxql55d9/coJmJfHtnn5MZgLr5O4OZnT
	K7oFH6hewJTQMEYqBYg8EtcppTinelOXnHC0VtoKpMxj3VQI2aPZTjHhPg3W/Di3i
X-Gm-Gg: AYBFou2qNADKBbdrIKUfIT7sNNyzgPR8o9Gv6Hcd2ysALNpoOb+quebEdaW/qEOsePW
	/HvYBL7/eP47NnFr9Qr+GSfYwUV/DUaRgil8ZDsHsRqy30bu6YL9JC2jjab5UgSvoRegnoWX5Xy
	TXLLk8/KnYl0Ge9/iO3bt4lzsf93eg1qaZmYShsfPXXXMeyB4NWrYOhpTtsCOqDwRpKtqsJyR26
	eJosigerkgF/xwU7NfUIbwCykdF1FhzXkVvoDfj/ph53W085KhBvy2e4ULkoyDyzVol52FezMQW
	EGAWoaTEwtqc7vUQGS1ayvMrwhjaSB93ITuSC2N+/YxM4xGbPShzWeKKzbju0jkxjmJvAbCOuU1
	wuZxoo6FeWEUgJkyjbH3B1EMC
X-Received: by 2002:a05:7022:c89:b0:184:329d:eced with SMTP id a92af1059eb24-1a6ce4ea23dmr13720c88.25.1793124538913;
        Tue, 27 Oct 2026 11:08:58 -0700 (PDT)
X-Received: by 2002:a05:7022:c89:b0:184:329d:eced with SMTP id a92af1059eb24-1a6ce4ea23dmr13674c88.25.1793124538162;
        Tue, 27 Oct 2026 11:08:58 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:57 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:38:28 +0530
Subject: [PATCH v3 3/4] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
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
Message-Id: <20261027-nords_dprx-v3-3-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX8I7C3eZoq0aP
 Tql7yoU4gognAc4ejidKZxtvcNXl3GeJerVOSel9QNHzOlv2dhu82QqV7FfNZROmfZuFasdOIYx
 eex289uqDVJanYKAsuevSTySLVseGvw=
X-Proofpoint-ORIG-GUID: _uE0Q39r4ftRpP_uLmTfvDhE_y_NETp9
X-Proofpoint-GUID: _uE0Q39r4ftRpP_uLmTfvDhE_y_NETp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX3jenmpA8nEtT
 1gF0p7WG8D8IGGysG2zRo+CWzC/VTkdVklQYAOM2GKsnR48CsAq1SbgExZHanCeT3FHNtrY6ZQY
 xFyIAR4E82AGNUT2/FbZSGYXJPt/qcTTduRIuwY5GZa2hgEXcl2oZLFAHGa7zI0Ymn6/jccI1DC
 1P8EMT41LY8BlS1s5z/Z9S55QNZBpzh3N89O4TS7IkP95KL/HjAt0bn9tDVPzy+DMGLDi9rMBRQ
 lTZhqe5dL+LQyBovi75uelq/0EWs7969QKK6YWid+UCyc7g4cOupdNWLITy5gCHy27+EdLGwM1O
 w8VwMTSJTiNzhp5Wmk1Nf817jRHyieFfiH/fv3yqx1+l2TvFb3DLLNBDui+f7JCovzvhB6/subn
 Jb7vQi7A8wyyBDMBjOUndmI6Wcv7r3orJfb+6AYBRSGoPv3p/9MjCQp5LeBIp6RfsfCAdKsMbC6
 yv1bkfhnjCQF0IIJqIg==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0e8bc cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=1x_EA7c-f_fbMv8ZdKgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072

Add bindings documentation for the Nord DisplayPort Receiver (DPRX)
Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,nord-dprxcc.yaml           | 67 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1d5d6f89114885aa4faab565dbb8a6dd9b3bbf1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DPRX Clock & Reset Controller on Nord
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm dprx clock control module provides the clocks, and resets
+  domains on Nord.
+
+  See also:
+    include/dt-bindings/clock/qcom,nord-dprxcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-dprxcc0
+      - qcom,nord-dprxcc1
+
+  clocks:
+    items:
+      - description: XO clock source
+      - description: DPRX CFG AHB clock from NWGCC
+      - description: Sleep clock source
+
+  power-domains:
+    items:
+      - description: MMCX power domain
+
+  required-opps:
+    description:
+      MMCX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@a940000 {
+      compatible = "qcom,nord-dprxcc0";
+      reg = <0x0a940000 0xc000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
+
+/* DPRX_CC clocks */
+#define DPRX_CC_AHB_CLK					0
+#define DPRX_CC_AUD_CLK					1
+#define DPRX_CC_AUDIO_CLK_SRC				2
+#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
+#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
+#define DPRX_CC_CORE_RCG0_CLK_SRC			5
+#define DPRX_CC_CORE_RCG2_CLK_SRC			6
+#define DPRX_CC_CORE_RCG3_CLK_SRC			7
+#define DPRX_CC_MDP_MEM_CLK				8
+#define DPRX_CC_MMCX_XO_CLK				9
+#define DPRX_CC_PLL0					10
+#define DPRX_CC_PLL1					11
+#define DPRX_CC_VID_MEM_CLK				12
+
+/* DPRX_CC resets */
+#define DPRX_CC_DPRX_BLK_BCR				0
+
+#endif

-- 
2.34.1

