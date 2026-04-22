Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BF32E0B58
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823536; cv=none; b=PzIVP1OKqv/zUnGIqz+ZAKglEieVcpY4r2fPpVkfVh759kRJxXWQnkwE9goZI1+4nBUY0WK0UGFdG+pEfCiyo3efLxwfOSKAL7wWSodrmLMzX9ruiJpEoshuk9ruDUUbPerTTc9aK+L080barBKF1l66i3kkh5ObZOpqsDcDHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823536; c=relaxed/simple;
	bh=5C2q6Rggmfd/2JJwxgiGLwYgn7VmHYAaeGxytzjHEh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1LjCRJTX2puC2D1+2qVWjC8ERGMnSZ/xZqLW9e1Xc71+imEdfEr9npnytQzalWCijflFd9V/6W4vTQVoEk4ep/zRwabmrt0s3q5Vnj8dtwlKK5Wzh0ZhMRscspK1SFPisJ0xkr1u9GRP2+Ol8LS2+DJ3ru05gwRxnLvFNvgBeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKnsvfRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fs8HCIXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKnsvfRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fs8HCIXD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZuMi727986
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52+RqOz3orbefw3WyU1JbiSn5ln5+pi1k5H5bpefB5I=; b=UKnsvfRptJ0wRsXA
	9GT8UwFhMeZnQDyY84eEVMbM5x/a9QOqG2Ie0nq+bPjXadFokDsQ3LvbYSI1rSmq
	pp1ZyQAclm4jhD6nvzOdwcBH4uHvra+5py2dC5ikldPcU3/YDxLG0hfe9Rvm1bDp
	tQF8Um+tuxWIzrLMBnxaBIosZwT+G3iNLESWyP7qxmsaDNSsuCfwLj1AVm+iReVV
	d9kYA0AJSbMT1s+3mkd7XEnXBpIZYUrh+ercp0bLB6Dktrvi424vdzxs7ogDspM9
	lThCLzsRi6FwPcr8IK+bhT2QoZSkmcvaQNIrTn/XfG/KxJhrqiQAA5tZLWeCMv5x
	8ONLoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenh96p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:05:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f504f6b75so2758741b3a.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 19:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776823533; x=1777428333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52+RqOz3orbefw3WyU1JbiSn5ln5+pi1k5H5bpefB5I=;
        b=Fs8HCIXDJj/PHlGDKr4LUUKZp45DGalfKH5ZpXj4h8nthmykAcroBKbhLJXARedIAS
         BlxV3lmAqSGn1043EcC6fdgw9MA9+8gx9WFEZTXadDF/qpmibYPu193CRI19ZeLzsidR
         31AW85GiAVby0ZW2qGYOLFedxxL/KsYDNwwrP03+DIgvcUHyN9yn0kFh61AwVT09aMMi
         6f0ukFJCHIf5V3pOaE8ZluF0ENJ1Yl0UgbbI9xPo4BymyM5NRm7HYbAyh6YIpklolu72
         zf/SiinOlAyKqh+Bs0jy2l88eoNOQsWVdlQwXtOFtMURm45vFi+oAxzriCZ8HgQN8EMe
         iinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823533; x=1777428333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52+RqOz3orbefw3WyU1JbiSn5ln5+pi1k5H5bpefB5I=;
        b=GW6BipaQeIKHXyvDtic5KredA5qciQDD6j75JFduoZNE0cw8tTe+nE6nZW8gDVvh6x
         939/Sz1/yoF4flAA56dq6MHSe2aUCA1+O/1GcsvIJMRwOtQxS76Injg2UfslcyGsSQMR
         JAtkFBZkvwuzBq2I75+UJ00aIMwfQj4JOSbZh4tAlQ706DFMihFRQE4EQ62jxmXgm3Ms
         NyETQBFzZHgrzkc187+2/6MScz/nFkbBiUOJdyTT5it9hrudDKP755/0/p1jiife+6GJ
         uhRny5/b6Se6wtZEOiLPVl+p37jfaUVyk1BMmx5ZgQc5pSgkp0Lt0Taapfpopugbnv9Z
         xcIA==
X-Forwarded-Encrypted: i=1; AFNElJ/LzrUecwB19BRZQLfnfjGB2tHOakGX6SZ/8HES89IJ9f1fxRAtcLMcaDj/B4jl3zaaB1OTtDRcX8i+@vger.kernel.org
X-Gm-Message-State: AOJu0YxP8183K6kUgEJsEmkF6qQTEL9Dl8qiN8CxCjDpySNMtn76ufk4
	I2Uz4zpRhqWZnr2TtnvY9XWQQT1JhI7OyJ2OHVlXn2XpFgGP57PTla0GGm97zrAvvbXob+NAsdk
	7dbLfr853jL8Xw6+dcYEkvsoSXOaCz01VfEzvMwBM0+zD2LFDQOLeeXH45xxUqFDf
X-Gm-Gg: AeBDiet9O1ll1mjU7WpYicGrNRQISXG2VF8QLHIKT3CnfDWKsfDtc/jVxFr67KhUGrQ
	0QWSqaIeNncjRQrB6+DwVhnZ2hy8Bbm3wKtR5aRflzVJSpIvzgcMfDw2V2dtE/cJ0zuB6QML2Ma
	Ov3ruATrm1fY6KNKskV5e8cEK1lcc+GisAB2XDfbSvTS/+P+FViuDBOAPrf60xTOYffVS0jTQ2C
	mKRfCxPnKxdgBIxbK5S80ZYrhVkVM7CYknTjQwvbJP8rVeKDcQPqYJQlrFmeRyecK3v85+UPBm/
	oJGS2MWsXirASb1QvFb3bQQ6gZd6os2dY7upZvenl2VKKoXaLmsARZRmL8W2pIE7yLuBh+IvGRu
	f5W8iuR1H1x6QkVIz4HZ6CfAqfwd90eI1zx1ncYMU9ZCEyGhRTYOu2go=
X-Received: by 2002:a05:6a00:b60c:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82f8c7cf160mr21181618b3a.6.1776823532718;
        Tue, 21 Apr 2026 19:05:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:b60c:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82f8c7cf160mr21181578b3a.6.1776823532207;
        Tue, 21 Apr 2026 19:05:32 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981be6sm18040368b3a.9.2026.04.21.19.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:05:31 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 02:05:11 +0000
Subject: [PATCH 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
In-Reply-To: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e82ced cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OrdcpLHLpR68xOABugYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxOSBTYWx0ZWRfX4cUOia2vmhiO
 ya6TUuzOQIju/9v/5z+1PXcagHbcBJgp5cnyh53d+uDbrvuFCGW0sSjx1p7Zho6eNWN6adgTZiM
 AvnKQxe43FLfg3elXBYmzhqfrOoo6u1Ks2ZJKYyle1nQd7UxjFn5L+sxajd4+us3gr0QhlTN2pT
 tSq6wkjqCu3zSAhKqrQxnNUm3Qw2vJ4nfJ3ZUVPBZF5frWi+0iftT//ovYIm+Qa8WgPxlSf8L8Z
 C5/r1xItBvuyFCMjdBJWH17IElgbklmsKLtw4A+gkpawu/L+bZUbZctB6frQQnJG51TyPiavdaD
 lV5ouQE71OBHcLnFRIl7KC+MARNJBoJ6eIlES/Shpv8eMuisxLsc3wcatOm5sk0e23ClzBfeG6g
 s1UqNG9BJuMGz3+4hFgyEavLvTDt68JGeuPMwp6btyE7pPTC4HO1QwaZm1MNlJOYIHFne94k50Q
 1jAcfTx90LNziuuOo2g==
X-Proofpoint-ORIG-GUID: eFLqigI1PSeMVlkYtDazzhkO2wVjQfbG
X-Proofpoint-GUID: eFLqigI1PSeMVlkYtDazzhkO2wVjQfbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220019

Some interconnect nodes on X1E80100 have QoS registers located inside
a block whose interface is clock-gated. For those nodes, driver
must enable the corresponding clock(s) before accessing the
registers. Add the 'clocks' property so the driver can obtain
and enable the required clock(s).

Only interconnects that have clock-gated QoS register interface
use this property; it is not applicable to all interconnect nodes.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
index 0840b0ec6e27..27d9234bc762 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
@@ -46,6 +46,10 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 6
+
 required:
   - compatible
 
@@ -65,6 +69,63 @@ allOf:
       required:
         - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-usb-north-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB2 PRIM AXI clock
+            - description: aggre USB3 MP AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-usb-south-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB3 PRIM AXI clock
+            - description: aggre USB3 SEC AXI clock
+            - description: aggre USB3 TERT AXI clock
+            - description: aggre USB4_0 AXI clock
+            - description: aggre USB4_1 AXI clock
+            - description: aggre USB4_2 AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-aggre1-noc
+              - qcom,x1e80100-usb-north-anoc
+              - qcom,x1e80100-usb-south-anoc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
@@ -80,4 +141,5 @@ examples:
       reg = <0x016e0000 0x14400>;
       #interconnect-cells = <2>;
       qcom,bcm-voters = <&apps_bcm_voter>;
+      clocks = <&gcc_aggre_ufs_phy_axi_clk>;
     };

-- 
2.43.0

