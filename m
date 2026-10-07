Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3A392C21
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355873; cv=none; b=tN2GeXDL/mbD66i3MVnljHy1CWT5vYcNrcctsvFad8RLNNnNepRs2RidpNf6SxjvmX/W5rcMpNvvdakNGAdJq3BXBimoNwGlig3ESV2CknN8JhFGoH7ImQ1rm+xAvs81RR+9HT7NLpzVJWtnrqcTnn+tvcvfgnFrgp2nU87vTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355873; c=relaxed/simple;
	bh=Wcv4ZLmmvdfjbZvLQSsVP39AR6mMz7RNXcdhox0hcvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRUeU0jFxYUfWl2eSWZxEqivhnj2iMdyW3QxWZ9iFB9u80raOhBwiQaWruClwOZ/YpyK35MRKzHhczpzP0Ppbpx6Vt+pPCEPrg7/xMCm8TjQzklBR86ZjgPPicEwLQbUya1jeR3qp4lQwOIXnh629ac5Q23lBDvMQyosh6MnRVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHJpZj48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjjXVb23; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHJpZj48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjjXVb23"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U9Qj2295211
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 06:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=; b=HHJpZj48q/M6t8U/
	t+Pl32OOW+6+BXS9E8/2oM7X5ul4JVr44NB8pSsRP9Xwt5c5bje/I8nCviU45FeF
	5hFgZcWzh0OrGHmDtR+2x/ZMUoghvIDYAiKSrCXlley8Ct3E03DSmKpWvd2szOlW
	k2ez9vJsiGvr5/eVyjrUd38TTVuIMwbGi3kKZfUs+WKCqk+szL18WcpD+CVXLY9j
	qc5QgOcmdtB02nO9KJLAEyAeYCMbGezPJUYEZ7EjkB+RCH/6YpjtgxEUcDu81tLO
	f9ePRaszcGIwQ3M3LI/kCJ05rn4AaoPblGpO2m1oXBT3NhrB0Gj3xKfy4Nn65Bsp
	VbdUBA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s0yrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:51:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14fed306427so13365497c88.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 23:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355871; x=1791960671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=;
        b=CjjXVb23D0R2i5MdDcI9+1ipswJyjcsX+mppnlAbDuaevW9NN+EzYHTJqPXHAT1mkU
         sCC+yua6C4vUPYvgarSyDCEKRWKl+cw4Oz2gbIWS4As1K7HFXibWwV/1AWIaM1pCsTZ9
         IIra5F8LhUHU6StyPCEvh5HsLV37a8vYAWATWLJgrdkcp4/1Ruiy5zlfdGDp5w/ZkRpv
         6Ts7dJAan0NacKeKQY/aBPwpM2V8r+O3o+7LIRltb5yF5ZgBudCzk3jNnSMUNgzeIgQZ
         nNqMKrpswCXv5zqOz1nOkPrjM09gHE7zENR7mkAmUsEpTVdO87/KidFzoq82ahtOZh6E
         go5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355871; x=1791960671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=;
        b=xEiTJ4k1yXuTFmSX+BWy+UrfY8fdkjKS31PFnh0exotOYECmReybYpmM/rOkXQS3+D
         kMcqaLbigAqRS3jWPjf6l06TbFYCGknEkEIYBI2DIn4Nplmkgc4AvxH/ksCzzRJR9cal
         EB/wrevQi2/nUJoZidZDy3ENF2VaCQ6KGEWSt4kARUWWWswkPMWRS1OQI8luiSARJ1ur
         mU0UnzgsSHxNcfxCBXWMp2Y3dCpDQJa6IeqthTG3D1+WBYVjWZQoeq0I9QRwppVfSTNQ
         LxCCvafx0PTP617N8OFp6OVydHBJoeKlaNx0QSI3SRPINWmeOJgNjA5EP9ezaNMUxmOj
         fAzw==
X-Forwarded-Encrypted: i=1; AKwUvBwVbjqHeYCiA6Gm7dDZJn5pj34L/dSn256J9mPtLgCPZAdfSONRv9v3eHoDn6AoQzqSLi3BaNr5C8JP@vger.kernel.org
X-Gm-Message-State: AFuF++kyQlhXnpY+3kakuXHFKGlXK+JsafOjUn+9YCSrBBH6NTUUzML8
	EVtbDUGDf8tSvBcNtuv/vcyz3muLrtKu7f27idiQLT/Nyb3ZTl1cf5cHmOdHfKsrGGDbpnI3lKV
	8H62GKwwQgjWhqzid37BoZQGAE8V1/L3jrzm6ro4gqMB3S5U8GnK8NwyGYwT/J7i+
X-Gm-Gg: AYBFou0Xf9nVhS2AMqKSey2NSSLl09QyMIMWOSI7rLXSEUseqM81aI2nJYCMr/J51/r
	UBzSBAE1Zm152oNOHBzj39KeRpAsA4ZKbQJibv9T2OIxGxFMQb9CVWYvWC/pPnXI1HFhnfY8yp5
	RgKE0rR4uFRdq1MPGNKbdpkTvz0gIsJLdth64KKoh4vXdk6sYPomP10/st4JBJ5IEkRFJ3tJlic
	efb1qlj9HBskJRwToL/QsU0/irC+4SSercRdkUSYjuDYFEG9ooGOJ5xv3Giye5J1XSfk1sH0N+5
	/rtwKGdnVZ2Ln+rON+gfA2q2DeHSlkBg+PPuQUNosBDocu7fogKZC5mF/fya+qgrfgcPNna3RDj
	+tH5VblyxJCHK0x2eF4ga1uXgrbgd97HFC5lb1VP9k7lXPVdDvCoiWid9QPEv6bjN3rapuWVZb3
	7WVab/6hSmZJc3d7V+plIkoJ9F1BtOFddmN30=
X-Received: by 2002:a05:701b:4550:10b0:151:8d26:a798 with SMTP id a92af1059eb24-16207e74c92mr1202464c88.26.1791355870673;
        Tue, 06 Oct 2026 23:51:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4550:10b0:151:8d26:a798 with SMTP id a92af1059eb24-16207e74c92mr1202435c88.26.1791355870033;
        Tue, 06 Oct 2026 23:51:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:51:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 12:20:46 +0530
Subject: [PATCH 3/4] dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-ipq9650_apss_clk-v1-3-fd4c2b3cbdea@oss.qualcomm.com>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 7Aj7247w_BvpihaB-GvCK_hqxWW3Qf_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX4rFCPFZ7ivTX
 MBG7Qnb+7s7SiU4mzOAuHfTim3LLJ/dqkWbYCQ3VeIJRzRRWEjsgDeodnClfs9WbIRvRWZZyVAI
 jrt8swtuoAalIl0OShCotep2lWecBx6zFeP7ACJ3PBdnFuZ3BncBivbHhqfcVTVXakz/IQLCBH6
 0mpRHKXY+FODoWE3QlJ308qYh4knlAR9GOEQFSYiMAlm0vfoMWG95IMZlK8+LLFFGOOWwY9ovmX
 YEOL1HZSmrddpLFELcIYr5mwmCEGMIAKZR6GLwa2euFO2XLFgnkwKZsCTY74yfSa38OQbtH80hi
 PIckkBbODIqnUm+2U/2ssbR6M46b2lQnSAHG23a66kzXhlk4Iq923ThAHIZMEsslISlybYuFKvg
 dYi9y+8BBfCqt6MwoRV+gLiloS6zIKmiCaXpBVo2ULVXokLY5foWkPEael68kiETcc9uUNXrWqd
 4aFhLKxBMu+sjgjaYaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX+IAOsbULrfCQ
 AryoTwCMFQhaeWQ1R3/Yys7xzgbQfDK6IIwBa4v6rh8uKhEblCqffjzzDrHut8p8InomCSIRdGy
 HfGremhm45aMw+WuZbume86k6jt8Pu8=
X-Proofpoint-GUID: 7Aj7247w_BvpihaB-GvCK_hqxWW3Qf_n
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac5ebdf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=QDl9-_pjA6WZ_EjsUeIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070027

The APSS clock controller on IPQ9650 provides the CPU and L3 clocks and
has a register space separate from the GCC. The four Cortex-A55 cores,
the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL,
selected through a glitch-free mux whose parents are XO, GPLL0 and the
corresponding PLL. The L3 needs to be scaled along with the CPUs, so the
controller is also an interconnect provider.

Add the binding, the clock indices for the Cortex-A78 (gold) cluster to
the shared APSS header, and the interconnect IDs for the CPU and L3
nodes.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9650-apss-clk.yaml      | 58 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,apss-ipq.h          |  5 ++
 include/dt-bindings/interconnect/qcom,ipq9650.h    |  4 ++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
new file mode 100644
index 000000000000..6b47183edd56
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq9650-apss-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm APSS IPQ9650 Clock Controller
+
+maintainers:
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description:
+  The APSS clock controller provides the CPU and L3 clocks on IPQ9650 and
+  has a register space separate from the GCC. The four Cortex-A55 cores,
+  the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL.
+  Each clock is selected through a glitch-free mux (GFM) whose parents are
+  XO, GPLL0 and the corresponding PLL.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq9650-apss-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Reference to the XO clock.
+      - description: Reference to the GPLL0 clock.
+
+  '#clock-cells':
+    const: 1
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+
+    apss_clk: clock-controller@fa80000 {
+      compatible = "qcom,ipq9650-apss-clk";
+      reg = <0x0fa80000 0x30000>;
+      clocks = <&xo_board>,
+               <&gcc GPLL0>;
+      #clock-cells = <1>;
+      #interconnect-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/qcom,apss-ipq.h b/include/dt-bindings/clock/qcom,apss-ipq.h
index 0bb41e5efdef..c9b04f2dbb6c 100644
--- a/include/dt-bindings/clock/qcom,apss-ipq.h
+++ b/include/dt-bindings/clock/qcom,apss-ipq.h
@@ -15,4 +15,9 @@
 #define L3_CLK_SRC				6
 #define L3_CORE_CLK				7
 
+/* IPQ9650 Gold cluster clock indices */
+#define APSS_GOLD_PLL				8
+#define APSS_GOLD_PLL_POSTDIV			9
+#define APSS_GOLD_CORE_CLK			10
+
 #endif
diff --git a/include/dt-bindings/interconnect/qcom,ipq9650.h b/include/dt-bindings/interconnect/qcom,ipq9650.h
index 023a3878cc08..1a77609de832 100644
--- a/include/dt-bindings/interconnect/qcom,ipq9650.h
+++ b/include/dt-bindings/interconnect/qcom,ipq9650.h
@@ -25,4 +25,8 @@
 #define MASTER_SNOC_USB			20
 #define SLAVE_SNOC_USB			21
 
+#define MASTER_CPU_SILVER		0
+#define SLAVE_L3			1
+#define MASTER_CPU_GOLD			2
+
 #endif /* INTERCONNECT_QCOM_IPQ9650_H */

-- 
2.34.1

