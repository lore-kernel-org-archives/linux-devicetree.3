Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC5630ACFB
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860243; cv=none; b=cEvAMlNWu2Ky/P5JPdjCK6P7eqYPF4xIiY5TaApVCd++rUMDUyR+HmLg7lXAODX28CN9tvOfkSFAH65BzKSl67PuqJFJA8oUd4iApPZK2dLRHW3X5iQhxVaRPTS/8vBSzB5rtp8AX1+X7IiyVQ4ssG4MaMzuYmBZjZD6S6ucUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860243; c=relaxed/simple;
	bh=dMLwqR1crQi+4CdMwYL+C6nmcS074NTfuxIqhzbU6rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJJuxQpJSLsPSRKgM0vasrAuqyy3iWJ2pYMjr7U92DqWhCR63ZFOOuGv2Dv7F5luTTHQqld6erlp3oF6wHKUlU0Ir/wrHTKsNt1ZMeJtrJ2z/jEqJAfANY0/ua0R25kOqoh/fnHowuoQFgVujLfxVO/0tI7ooSYYMxY8grelJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pC+m3AqK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJMHSCli; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pC+m3AqK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJMHSCli"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2WhOO189771
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/BfpPPa6tLkYdFoTNDCcKAqwX8p0KQApAnuVt6hWic=; b=pC+m3AqKIPRfqehx
	dTwXuVZ17ZIvPlzJG+YmZPLdfMPLQJqZ2Ra4jjfHzZXkVA94hsqRdWc4sChiluDs
	6yvx3z06pB5YHPoAFyksHFz5Jyc64u+pmqNuhGWCOuigIUFbtUsHIGSy2JddiVqX
	XhCbbGiZn7kV4OgbWfQaKTY+UZBhdpfUsvOhCvqMhCtlGtVSCKUYppaL1TwgP9aQ
	5eBfkGg6imYrQaZcG+4EJyNsWGyKV78xN4Wk1+ZS0K19RHpCJRzyQE23BJji9hFM
	hj+jM7gIcZDHnaKqcYaJZ/QAYq7LSx+a7QzsLOg5VOSaTmXCoAzPRNX7eM8DBmfg
	deHK1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh179svp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:37:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babc42244aso17178395ad.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 22:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779860240; x=1780465040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/BfpPPa6tLkYdFoTNDCcKAqwX8p0KQApAnuVt6hWic=;
        b=AJMHSCliTb5WNHxPMlycpL2Lpf10Aok04Q2zDwrz0JhkZtkzXB32IkOZ0uPe8Di5U6
         NmdD7QNeTTQ59n2C6NUkTuFnd5YzkTEtRBdQlAtf7nAFeFStNp18rc5foL72XkYY0OKR
         eYGhmLmHtP6TdLNI5jPS+kwSn2EvlG6sHFz15tSaUUI47oIcljVG05MB1/qCvwkZ+tKw
         KyMwMxMbMIZ4izqQX1hl9ZGZaHgmMk3jQCkDilu/c3XlEvepv2D/Mk9uvAE/l/d0aa3Q
         0YF7HxcYSH4ZZUiHeT+s3Q8XAUzxuma/8iv767V6a50MjzqmrYEUj+pNgVnrsiwNgkiI
         ddHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779860240; x=1780465040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/BfpPPa6tLkYdFoTNDCcKAqwX8p0KQApAnuVt6hWic=;
        b=rH7pR6DWaTSTL3zphvg43+5fCjbNqExKsxMxyUQAAvDCgnEg85AeiulepuRQs7b4/C
         7yYmFCrT4veBCYOxYR/P3LoWF75HWCdSnoS+jtdMRAEwUnQgrQa/9oep5U0v9DMDJ2Ny
         Qy2EWM7PNcmcyQpnT/TV5hJwT0EP4g4A1tuJBaHGcHuHbc8Q7zhJnvGv9ku+NIWGKWzJ
         N8+8YmMJsvSCEElwgAPm8B+BKc5jJB+qtz3VFYrEytrQnLhaweGnr8ou/K9tzduor2FW
         npuyymswmV4sZs+IgDf6Hu/+ybM9qVz0WVqWlt5iG/qodxhMgEN0NoZvKObWRZumkPPu
         i4Ow==
X-Forwarded-Encrypted: i=1; AFNElJ/P89ymz8gh6sLGVlRUkSBZ/wdWp3qT8G2jYBsKhYkt1LqU2bXf8zyalRROYAyI591uzKhWIJ7/l5+c@vger.kernel.org
X-Gm-Message-State: AOJu0YwV4oSaOtyOh3eQr4TvFdG97pnrt7JDgtutmm+9uyCsLQE7YoSU
	PjTL/8kTx0S/0Bf4rCffhMu/OUGZYFlykUvw0uhrHpDI9Yk4zXTfeYZA33eafEQeCF6kybcCSLv
	w+Fxjfd2ukFjAZrtZgfbTpUbO2xENvbu00Q2tNpelSUC/2YxMXmUX4L43vSIcv0TA
X-Gm-Gg: Acq92OEtzWUdNAu9tCumz2tafelgZzYQV2Czoe6z/WovUBXrZHZj+nImS9at8bF+AlM
	F7bZm2/6LisFQzWsVNH/nysKXbfMsWgfJ8stQrbLIB1z9g64ufoy7HI0WAVOwNbA+3I9Gt+CJQD
	3zD1aqBba4z+WgOE7h8Co5/sFW8Hcy44PYno8hF0E+bCz5ZM8paBY5efGdJfftUFru6NXoFSQOO
	Dvoy2pVSnZ1q1hkT63ajCmOvJ3HYf1+xIiqbUMTSS7L0JthoNMaN8mENwUSv8fd4o6AdTzwqmtj
	g/eA3kg/+OcMIuvOtrEjzO8WFx4l5E/cqQ4OPWfIuhFI5/Jx5Rbl0yA0HyRue9ZuFXXTcdfPFt9
	pDswOQSzVJmLbv9PmJds/80QTGLLPf9vCZ3UKi52wlaDx
X-Received: by 2002:a17:903:46c5:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2beb065e2bemr269819455ad.35.1779860239972;
        Tue, 26 May 2026 22:37:19 -0700 (PDT)
X-Received: by 2002:a17:903:46c5:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2beb065e2bemr269818955ad.35.1779860239326;
        Tue, 26 May 2026 22:37:19 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb569592dsm136338585ad.16.2026.05.26.22.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:37:18 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 27 May 2026 05:37:09 +0000
Subject: [PATCH v2 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-x1e80100_qos-v2-1-305c6539e6d2@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
In-Reply-To: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: OKculsxeRAYN96csLZCkgEAI6bhekWUa
X-Proofpoint-GUID: OKculsxeRAYN96csLZCkgEAI6bhekWUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1MSBTYWx0ZWRfX7rzkc61hq343
 BTnkE6eXL09LOv/cHYnMHj8uonn9oqO4xsWuD7Tx/01+k3smMHNQdJAneUa+3yuTSaCuNFabI8B
 3el/Oa0oQNwwWfMAEumH8+byGwf3q6CzQ3P+suxwZ+9Vd7EDYEHN+ekuVbTX2Q+skNmdrzdD1GO
 cw09h3aknLLwT1fBW/bUSpuRP8oLYfSIbfKwpJjDMDqrLJdHrcNDYrsuQrnbo/0Mm/i1wMLv1t5
 l9h12Lwhg5pxlhUQ8Wem56b/Xh/CVb2tI/YvJglL1pi76WngtYIcz9adZ847oyp6q4PIE9JFIQv
 neoY4qjh43tmuHRfUC0rwdP2fOu4+pikhcc7M5gNzJPZq0l/1/UoWXQ8CaBVywkpsnSd9FjGGAY
 fajiBOlHOHsJva60ey+wQ+TspuHPh0QzUWvInoJCJ1HUvB0sXMdZkqr5WJ8d5LFoJJY4oaOMeCS
 qSLviwwcxg2U8hmPbFg==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a168311 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NnUtUk1SRsyLyR8-XE8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270051

Some interconnect nodes on X1E80100 have QoS registers located inside
a block whose interface is clock-gated. For those nodes, driver
must enable the corresponding clock(s) before accessing the
registers. Add the 'clocks' property so the driver can obtain
and enable the required clock(s).

Only interconnects that have clock-gated QoS register interface
use this property; it is not applicable to all interconnect nodes.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
index 0840b0ec6e27..d863cddb21ac 100644
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
 
@@ -65,6 +69,73 @@ allOf:
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
+              - qcom,x1e80100-aggre2-noc
+              - qcom,x1e80100-clk-virt
+              - qcom,x1e80100-cnoc-cfg
+              - qcom,x1e80100-cnoc-main
+              - qcom,x1e80100-gem-noc
+              - qcom,x1e80100-lpass-ag-noc
+              - qcom,x1e80100-lpass-lpiaon-noc
+              - qcom,x1e80100-lpass-lpicx-noc
+              - qcom,x1e80100-mc-virt
+              - qcom,x1e80100-mmss-noc
+              - qcom,x1e80100-nsp-noc
+              - qcom,x1e80100-pcie-center-anoc
+              - qcom,x1e80100-pcie-north-anoc
+              - qcom,x1e80100-pcie-south-anoc
+              - qcom,x1e80100-system-noc
+              - qcom,x1e80100-usb-center-anoc
+    then:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
@@ -80,4 +151,5 @@ examples:
       reg = <0x016e0000 0x14400>;
       #interconnect-cells = <2>;
       qcom,bcm-voters = <&apps_bcm_voter>;
+      clocks = <&gcc_aggre_ufs_phy_axi_clk>;
     };

-- 
2.43.0

