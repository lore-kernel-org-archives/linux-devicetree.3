Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240203B8111
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701127; cv=none; b=LjC4l4sdlQeBPfDqEzZb9m969BEo0BqAjLbOl3o+dVnj5a7WiHCGQnQQseaFQZLw6Ky1glzpHscqMH6PogElxFcTqrFm4v1hGIHhJT+u4Ou5tO3IQbXoxuVGVsJ5rDQi4D9yDGF+O6OKobxyHkVhxCtW0Xo5qGB0gFSlo1B+lIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701127; c=relaxed/simple;
	bh=/B2YYQuefrnTgw0/uDtoG2BxFeVrQrRwYWlI7RGt+lY=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=Lu85S0u5A572qQuxikxxfwEZIpCie7CTlz1aVvwX/9orU23uQbsjjcs/FRva/IIAZc68M/qIygsIoYPw+yj2xufeINuhAYr7bn8+UjTskWBLLoTxLCCAHaCUSDXCNCOvrWxnCeZO/upn6A3VFHpWV4QzHbqLJMapePZyfzkF9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDtJKweF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1RaIQiu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDtJKweF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1RaIQiu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7ghhE1412102
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0lI/8500tqPbnOPsVS8DIg
	C8w71welYBBdCtfUH/UmU=; b=WDtJKweFq5dWvF9oRsFuUzuQG0TG+EBqSRVQAl
	ULlnRlW0pJUBf7IEerEyTTdcGJvTItiln4R54EvfuVoYymCi+YdLQGK/FOXVVkhP
	o2/5YSC7wmlOQKPdEUatqqIOap+xAj7imiEUz3cnK17d8kWCehOIxCqNdNfWpdNL
	A5Pamg+VK3hb2KmRmkDH7CLkrR3Jaw933tkMuZfB2LknIWhP4W3ynPN6a725sHMd
	Ww2feLWo/IWbWgpwNepJQrtBXc+9ep1x59k5DABxx439ZGmsD3wPaC6W6CCa5Fou
	IuLidwfeqRKkmCvH52gUpPBQVljL8+hj/eEG0OFny67PmhAg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea2ab1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:52:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1381045a91.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786701119; x=1787305919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version:subject
         :date:from:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lI/8500tqPbnOPsVS8DIgC8w71welYBBdCtfUH/UmU=;
        b=a1RaIQiuThpJ97rKScFvY7rlP6okfLem5R7TXgCJW1pwX5FVSMonfrrL89OvENPjGK
         YrnpGC80vsrU6ARU86HGB12UOr3LTKmR871UG69uJmPC2cOM5W05mz3yl5UDPrEnRUmY
         arGUbkTezd8QWBWa/ZxyAbm87sRpr0CCFGPm6Igpy7184CcFh6+VMRID+j7fKVkQVYP5
         LaNgzeslBnGaDDgB08yjKA5/izzUFnZ9ENAcu9KKR8UMuExR6ULPxL/FJNYqXOJ+FOCV
         1Nl//gezLZmQSKH+D6lbwgWflOJEkZu3i+4CULc4sJVYqtnk0+H/Lp/CcQXQf9wzHuWF
         XB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701119; x=1787305919;
        h=cc:to:content-transfer-encoding:content-type:mime-version:subject
         :date:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lI/8500tqPbnOPsVS8DIgC8w71welYBBdCtfUH/UmU=;
        b=Cljx5tv8LWKZJAfLIN+JzL+p8gIoC6Nh/ks7e/8fK1wG0wkqzhpu0H9tt4rxPutscd
         ErpBSIC68MSpPqPOfC0wLHTOzcJuDR8twzhPgGqjTpHTG7pvQPjEv+WCc/U2a2NHFMGI
         2nwjuL+9ePDLsRnEZZwFuJLpzvSijbGNA7NuRO019quGp0UJLeEILAHqVe1OytGs8t3U
         jhQWHPA4fJzUoHh+RROASzPkEGLWhmMJNCpMUSckFek2TpeKAl2NafBPFGvlZKB0nPfZ
         IstCo+cXIzTuEULRHPcRUFtjdsr6U2ODCH74OLD7mJFwOBQU/nFAuj9z3eLUdWrbf+kP
         /wng==
X-Forwarded-Encrypted: i=1; AHgh+RqM/vWZ6WjQNauR34Lv+TRcycPLSLsp6U1XlJ3zP7TbQP3zrdIFIRSThMSioKtLWe68LM7PDlz1mDaN@vger.kernel.org
X-Gm-Message-State: AOJu0YybUVzWfOdSlraIdxX6rdlXBEAgRwB/uG1AWdu8Uiw+++tIE9U6
	VcpwC1ttw4jp485mX9oTNAC0i2uhIX+tz28vvnWUBZO6lvoGTC3qsgcTGQtR28Lsgq5nNiHo0g/
	6Ts/nJYEab9K9N8/nnVtp/D0B0G+3ekBKxFWeS4r7EAik01gvk15ND2ey1iMzt42x
X-Gm-Gg: AR+sD10tBrndHdGkWS3bkBwEhTdaptNeRr3Wfxr++VVNgGAPM5xojD4I1Z7B+LSrPAi
	nie4pC6lRfOoqWmdVt0GFuU2Y7BUjNhik2Sa0m+HYNwxRGy9hpfG71Uawliy/Pwe9g1DTMA3k5P
	7yFcuph92Tj+kNIfRkjkSLWRyTy9QdI92mO8Uk+5SzTPG6TshLWl2yB/ZZ5U3QFxW/B1jv/vjNT
	zz7zK6zzYtMx6/QlDm7jesgyrxFDrNOdjWRsNH0gFNjq1yFp3cp/fPxd0fouQtTiECZufab9MQA
	PSMxGqUt0qgDbX6Z5rM9AFo1hmYaAewebp/seYs4lhEjcqeQZHxRP6H+nMPyJJmbbkK0bD+fBHv
	5RCnrIUxVHzwzVQ3QLXVefru3M4WXnjjC
X-Received: by 2002:a17:90b:1b47:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-3933e63167amr4547273a91.16.1786701119165;
        Fri, 14 Aug 2026 02:51:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1b47:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-3933e63167amr4547223a91.16.1786701118712;
        Fri, 14 Aug 2026 02:51:58 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea995222sm2073160a91.6.2026.08.14.02.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:51:57 -0700 (PDT)
Message-ID: <6a7ee53d.797536ea.65c65.2a09@mx.google.com>
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:21:26 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: monaco-pmics: Enable PMIC MBG
 thermal monitor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7ee540 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=w0oc3zvpXKfngUIgkp8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 8qVcpKaoIydAkIKg5oke4WjUtZMLxsSI
X-Proofpoint-ORIG-GUID: 8qVcpKaoIydAkIKg5oke4WjUtZMLxsSI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3NSBTYWx0ZWRfX6TfszBAp3SzE
 1BvF/zbSBphbzi4/U/+3J3HDAAqm8rLgQArMzE8GWYbdwh5QUwI3KH1rNHDMr5zBhDCNuMsO8XQ
 FSRw0y0J1cIczefbV6oxqcDtzeghy5oaEFJOC5HokJXtxm1twS1iFH/HpeRjjEasGp5lKVnLcdZ
 jO3g/MEpNyXb/IsmPqzejVPfTrla+CUQqH8U4YZ0FhZCjmWGKsD8kiCtJ+pWroRmtxhj/PQ7q1S
 p8UmHCZwq2dL2iQY4KmUyEDHzcCSkHTCzdiMWPA5i5248/Q52vxjvA5zzYhR6uy+q4RQvnbsnko
 JSPsOJRySNLqHnd43wpnRud5zr19JJHEP8OWBhQOdjfI/HjaJvwmm+XAKBUkwl4UEemi4GX+/eN
 FE1muDhr1Nj9hBI2ajObf5Q4oPj54odWbJ8ARLrp0g7j4DVhijXihEcKkiDdQDdjaanlsFOp8m7
 b+hL9ClN9qZ4QTQ7kmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3NSBTYWx0ZWRfX03AV4PNzqAXp
 ZnvsTxRivr9zB73GDjTfht31VflAoW1u3dCxt4+zJMImFZ+Kw0suC+cKUHPBd5WbBvlqew3H2G3
 jOo+eN6zIF/S/eXA3IQKqW49z1fL4os=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140075

Monaco boards use PM8620AU PMIC instances that expose MBG thermal monitor
blocks handled by the existing qcom-spmi-mbg-tm driver.

Add MBG temperature-sensor nodes for the PMIC instances and wire them into
dedicated thermal zones with passive trips, so PMIC die temperature
monitoring is available through the thermal framework.

Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 62 ++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index 6e096b9b7546..361f5163b6d9 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -7,6 +7,36 @@
 #include <dt-bindings/spmi/spmi.h>
 #include "qcom-adc5-gen3.h"
 
+/ {
+	thermal-zones {
+		pm8775-mbg0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmm8620au_0_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pm8775-mbg1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmm8620au_1_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmm8620au_0: pmic@0 {
 		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
@@ -53,6 +83,22 @@ pmm8620au_0_gpios: gpio@8800 {
 		};
 	};
 
+	pmm8620au_sail_0: pmic@1 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8620au_0_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			io-channels = <&pmm8620au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
+			io-channel-names = "thermal";
+			interrupts-extended = <&spmi_bus 0x1 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
 	pmm8650au_1: pmic@2 {
 		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
 		reg = <0x2 SPMI_USID>;
@@ -90,4 +136,20 @@ pmm8650au_1_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	pmm8620au_sail_1: pmic@3 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8620au_1_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			io-channels = <&pmm8650au_1_adc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
+			interrupts-extended = <&spmi_bus 0x3 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
 };

-- 
2.34.1

