Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D919389108
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311696; cv=none; b=onpd9F4VW9Rm7+J/Cwapu7f4+17p5ezowwcfNYmkVT2pguVYSeulp/JZj3c/6PkZ9OYdeA91PKcafqXVQZOIvzPEOuM6mCKtDok+IekAgARiCc4FI8AgwFjVKkJtya05riBiPQr637BAINLboyTsMAZN4XR2lqMzIPD95IOTexE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311696; c=relaxed/simple;
	bh=E51oxoPSW5lEbFl2QwR4u2/Z0SHFv6vL4YhGehqP5Kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qA/ie/80eSx1rANlE7oKV42f3EpCORbCs7o58MHF3dnZvUXdJDeHsxPTga8vdxxwPSXuOa/OmDSTYV2bE06dDYiBmXrheEUusOUx05LvoQtLW47gPEhQDUteIk/5xj0TcfYSG24MCYoePZnrupfqaVXOnZYBtS/mG/dWyYbLon8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N42UUFiv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjZqTb4s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N42UUFiv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjZqTb4s"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eDPX1214152
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 11:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IytjrOQapu4e63hvcSkye8w4XxPBsAEbmdV8VfWTdCg=; b=N42UUFivDHOp4KKr
	LKkjWLHEnIwZpOS2wkvdPDNsaAxivkuY1b/mHr6Rw2OIufOlOT4ZouPZJo9CV8gO
	JZLcJ+JOPpALUkqcpXy5RTRaRZsjVQkfS0rh1BaETkisCHH2P4OnUqpgK6nfFIfA
	3UQB+ffeYGDSBp/M9e3Gq4riMusNrEG4ZxRwqKk23W4bI56mZhMBLlKJn1eFpmZW
	+tqMUQVK7tKOu4ACdL6x+XyCy7Gc6zRWRztcQht208c/K+xspyrMtUVJ2+lQCDdB
	cYVyQsQTCB0C5ciaSEcd1PLGnix6h47rNMwaDRCafdD2tr5IdKKxRv5UfgN8qlkL
	Vnb/uQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s98jrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:01:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32faa62so23476905ad.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780311694; x=1780916494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IytjrOQapu4e63hvcSkye8w4XxPBsAEbmdV8VfWTdCg=;
        b=PjZqTb4sNBxQiKtzdxPZqIfgBrEYc11hTSRcOX44+Rw3nA9t7v1zrnjF+OBRDZx0hB
         ElwpbC4Ov7GYk7RGz5kj2ihraJWnD50siKRLRshGnHtPu9DgoT1Z7gIyTQZnydCFPoX7
         ya4rcN+DUdvuqkp7aWup8zpRowkI1Xf0hr05ytPSyRyJCeFlZ3MsBot8Yd8J/mrIEl7d
         2iR1/hxb3NW5aj7AugBKeAzRzwm48jJQunN5ow4O6J7POMAEPj3CC86GADkgppOsOTU4
         ywYvS7NYtACrR+XumqSzMgFpP3YIFdhJy5a9bEAow+X/Ua6WFQKnavQLTfV7LYTQAq/C
         mcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780311694; x=1780916494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IytjrOQapu4e63hvcSkye8w4XxPBsAEbmdV8VfWTdCg=;
        b=AUcQx1WkZg9bxA68a77QYvkkexeEpoUjfdSOxaAA8iEbpr8g4DBOoKITGsTIABX/Dp
         HyqD2+AEYbJl41U2YDjOvqgtisSrX5Fao0abGLE+cIhs+mLeN/gonzUyZPRqp73HXsc3
         Vg9R4gQZ+BbzZaY+Fp+SrcSQud7zyEx8htHQceGyd799M3IF1H17AC0X2xWnG3bRSvWJ
         IJ3FLNKlqPoAQDU+nRaSEqsSzSjnbe6Znn2TE22TXut8E0LZa0E3fib3L8AgiYdQY8JJ
         6c5CU4I3YyuDqF/Gh5uagMnbLK+VixlQieW39cUCU3AM2OG60I3miUXAmHjZ+HjuVpoV
         gL+A==
X-Forwarded-Encrypted: i=1; AFNElJ+w5hs7V+Z9VbFRBcA+woM0w197KWzSGFOw7lM7MsghVFIrU4H9m5CYwsmln5P2GAhyi2MCFQI8/yXj@vger.kernel.org
X-Gm-Message-State: AOJu0YzpsBNw410GYVq+nrMNDAxDaxfdwPFg+B+eWdfSse0RiuIqZ2nV
	uDUXBe1QDXFM7Bpd8oCk8xs9AATEoE6BRmsI3ptWEkW8edNvipeH++Hs+vFwIwTlZfHPD2NNLD1
	6omh01UEHw4q1rbdiFFA3QeWOVKsMI4yF8hmdY2Cl9FI3Vg9wvVuXnd3x+2dlRtYs
X-Gm-Gg: Acq92OEDkIqrBCCfqj5jSJXkD4QC8eSpG3ftpvo6kp5fUcAcCiqbxNwXdc/JWGzA8a5
	uzZvzWNnahwkXawVVUqaVOsybQwQl+JWKkScd5cHE/Ljm85tlFAkrWkktBBLI1byG2+k85WwypT
	tlS+dfPVmDC5u4j4dHiMT98kmYG8akyI3vjK/3u0jOGALywcDxuayqPYzSDsYXtQGuknJqCW9jv
	kl3YycO/ffMzOIJ9wOUPJi44NYRyAcfwIHBjXm8u+P0eWsYCTPa2E1GerxBWh++HZgrAFpbWyW8
	fMwgJMucmDqpDD6HBCyU5e+nbXqRuZsBXAEafbC1finfDndPGQdVQ6pBn87QBwnK4QhJZCd9sq/
	71xRcw3CerlRTDpRWpDVYGFAHSh8P+0AOpDwaEnu2gI4LBzuEV1wLRlEj8RsbDhKf
X-Received: by 2002:a17:902:e88c:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bf368859d8mr109932935ad.35.1780311693806;
        Mon, 01 Jun 2026 04:01:33 -0700 (PDT)
X-Received: by 2002:a17:902:e88c:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bf368859d8mr109932015ad.35.1780311693055;
        Mon, 01 Jun 2026 04:01:33 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6edsm126239185ad.18.2026.06.01.04.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:01:32 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 16:31:18 +0530
Subject: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal monitor
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
In-Reply-To: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: Qu3f8VF4rmnUaIvRf5UxZB1jCrqOHdkZ
X-Proofpoint-GUID: Qu3f8VF4rmnUaIvRf5UxZB1jCrqOHdkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExMSBTYWx0ZWRfX2GF2J/dIiqtK
 5wjliJGbJ/sxEj4aFpnOKJ9zFIUL3rz+uMU2uG+laUzJzMUioLaQkW8zfCtf2xABOzfZtnvWTIS
 9eVeyh8SDu5zNGodnKqn8vUi0qiGXGFIeXQ4I20xu8twfQ3ELYbUS8HMqUNEEW+sJ9k4IWreb0z
 vcZE/WK/eJhK4E8D/OyqaXaDq61pSgQrKjU34d54f7JVNoJqUslvJl1ZvKvBSv3RGSSjCj5ooig
 BGpUoDfwj0BZRoJLFKrDqy9ki82HBHBqNp+1HM9Dr4PyJkXGJQJ9vu6hFBm2fhQMqbrIB80R/AZ
 RSlc1/Cnha3HtVTy9H5dP1jX53TWBcXrn/X1+NSGZdT1SHLynOoM0kM9lWIXVShvTavqLrwuVD2
 1wah4Oz2CaJhJUxgbM59iQvUurc/c07LF1mCgOmdqFiDI7cqvR9TkYMC/XOJp4SDwA0lOQG2dvM
 28+OFMdGfvD4+98xm2g==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d668e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E-gG5h9l_blIFwvKag4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010111

From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Add bindings for the Qualcomm MBG (Master Bandgap) temperature alarm peripheral
found on the PM8775 PMIC. Unlike the existing SPMI temp alarm peripheral,
the MBG peripheral supports both hot and cold threshold monitoring across
two programmable levels (LVL1 and LVL2), with interrupt status reported via
a fault status register over SPMI.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 .../bindings/thermal/qcom-spmi-mbg-tm.yaml         | 72 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..5f409fe700b2 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -193,6 +193,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^temperature-sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/thermal/qcom-spmi-mbg-tm.yaml#
+
   "^typec@[0-9a-f]+$":
     type: object
     $ref: /schemas/usb/qcom,pmic-typec.yaml#
diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
new file mode 100644
index 000000000000..a0ecc9f35cf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom-spmi-mbg-tm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's SPMI PMIC MBG Thermal Monitoring
+
+maintainers:
+  - Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
+  - Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
+
+description:
+  Qualcomm's MBG(Master Bandgap) temperature alarm monitors the die
+  temperature and generates an interrupt if the PMIC die temperature is
+  over a set of programmable temperature thresholds. It allows monitoring
+  for both hot and cold, LVL1 and LVL2 thresholds, which makes it different
+  from the existing temp alarm peripheral. The interrupt comes over SPMI
+  and the MBG's fault status register gives details to understand whether
+  it is a hot/cold and LVL1/LVL2 violation.
+
+properties:
+  compatible:
+    const: qcom,pm8775-mbg-tm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    items:
+      - description: ADC channel, which reports chip die temperature.
+
+  io-channel-names:
+    items:
+      - const: thermal
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - io-channels
+  - io-channel-names
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@d700 {
+            compatible = "qcom,pm8775-mbg-tm";
+            reg = <0xd700>;
+            interrupts = <0x1 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+            io-channels = <&pm8775_adc 0x3>;
+            io-channel-names = "thermal";
+            #thermal-sensor-cells = <0>;
+        };
+    };
+...

-- 
2.34.1

