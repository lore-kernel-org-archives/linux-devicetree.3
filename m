Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26946C844
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119218; cv=none; b=bbiparNsyoR0wfdd9NQqmFn78tJBJp82qoPenvEo+Bu6a5qcMxdVUTRbZlfDr93BTwRhrQQbL+CUMxTOA6zRblLM5HvxiH8QxkSB/B+rtBcUwHncQrjJC1lpqP7UlVYu/W9IMyrHcdseBfKtB6v00SbFlwtdk3TozMpMY66q7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119218; c=relaxed/simple;
	bh=bbARdkrRuUy1baGyZrTM4q3SSSMqbiE+i9qs4b/uJ6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bnks5EJzNqoi1ernlqB0+y9cye+Ge3cdhPrt/u3G9neUnV6ZcKuyYr+/5/LPhhsoXS+ZwkWnBOYbm+nlsq1lxNOiUt2Y3NvepWoffQpFYvCyJfajANw79ImPQ1/tuHafS0y+XVZZ/2RBRIzgmK1yq/kjiUtpcaloWxSLdCNwyec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BInq9wjx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eopbm0o6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BInq9wjx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eopbm0o6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI77hA1348925
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=; b=BInq9wjx91DK1QKe
	hFiSc8bMHbmFeEx2rk9iNzZHESd2O+qhXNYok1PiQAk1fva7GginGFMAWlPftEFk
	EgnVwJNVWPQttax9wksY+isRv3w76WwG10kFiK3+ttgmHDYhWgBJhkN9gfU4uoc7
	gPMIe2R06Pz+uStcFZLfUV9v+PsGDJqhXGAwc5QfLMrfHaxhIthsQkS3CO4s7nio
	4gfzzOn4NSNMKb3M5pz1BY3okApVd0xqpAmI0wAkJ6IydlknFDY4U8J/8RG4btFW
	MLU5hOyAWuijM8unEcKc1bQ7NFKYhaSEAbm6cUUznK71QUzstBRmpwagqWfkXmtp
	/eFBfw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux861gxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-331b2ec616fso1203821eec.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119212; x=1790724012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=;
        b=eopbm0o6vxM7eLD5RSZgE0crboBrN0k/b5T5+5aZQg0a3t3ytvmBGKsE+CshezSHYY
         SQ6+J+iigF6Vz4vJ69IUeunfs1Rba1/ERQvExit6hW4YAmCT9bALnuWJUrS2jIp1U1Gq
         mD6QvRMZsIyju/KaGtBnSMTyxc4PhUN4OSbA1+PkdMRrDghz9WZCvO64W+VTn3hP4HGT
         Ug/fHSP2zbzqhORpklIVAxUerQut2Xp67H+HNGHa5jezqHrygQx93kKKnOO/SXieYUcL
         NEWKvQCKxTsz5HgN0ZXFbbLFKpExblZ3ywuCKtwQmcNRNbUsc/I4CgGMXSRwDZq/B8xZ
         54LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119212; x=1790724012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=;
        b=08CIazvIFwnRpUi2bzzMVrOcVJXC8cfhM0O7THVwbjFZm9VfmUw7ZvjFzbV8sLuZpf
         reeQ57/kw+s3eG+C0OBwNhwK4yuaVFDjGpvxLMbffYZ8jR+awoS1Hsx+9LhEePi3pmYb
         t/e10x9Zu4shWG3/BZ16L2wDSl3jRMvkZq2kGJf/ITYDFX87xD9VGmlhghltZ2G/exgx
         a8tjcYIufF/yeehz44dVEcZVqL+jz78cqJJyW7EWQYVUP0EoZ09+Vuhz8njhS1bQ9NYL
         1CvZ+yyn7NFbKLwMDLFFYNqVi+S5eeCysPz8sDO/j55sWPhfJ918FdTEjAJf0ddiDT/y
         N8Zw==
X-Forwarded-Encrypted: i=1; AKwUvBz2otvNwzP7/XB9viZ2SmIF/B1oWgV5EdzwE/nuA4OmPoaXn6EC6LkW6U9FVEBioFr05NEkgSeOJESU@vger.kernel.org
X-Gm-Message-State: AFuF++n9AuCjNJUB1eLdZVvcqUT4InXDcylofMHEtJ1ULG1ST0UOjb/k
	ehyCWPbiSmXrtsP5ss5oZ40Ykliwh4pv13fY7MnZzNi6FZ8hF21AJkjLOVDp5WAFOuvc9EPqBLx
	zFUmXF9tiWDznaMb7OPzruHxMTAo02sKQdsM/mU4d4emnVl1z1sB3/23r+DRWxNWF
X-Gm-Gg: AYBFou0xr0XZAOPREl8fsTFoRL7KsPmoBSsSqupxzrdpl2xqr+9IeSpFcBQc//UYtbU
	Aa7RhqDrQyVfoTAsKus2w+X3O8EkV9NFi6cOWOQV/CvCJ6ZFaCyl/LVd7uLWh92Fi097+ZWyp4Z
	SJh1X3FnHOfJxrrosxbqklg/bV43sVm/u+Gu5SS8XD49OHqWiY7OLPhx3Xzqz6BCT6tL8kIZ0PO
	GKUREaGZV4GzgGo6QlVoFQZu4nu8OYeR7A8rsR0/dBhEy2Je+2xTwHtt0tuuzZ4qjN2qmNx3IH3
	ikFFwNoYEIlv3O6wsWI34nb3B5biXbBZXzCaZ+up1+ZbPUjwcimqetNkLqyLbTOTsC/bhq5kQfs
	xbrZYXAk4geLVK88FnmLvV/Q3tpCKfdoueGXkfOlThMScFTGsOQ==
X-Received: by 2002:a05:7300:54d1:b0:328:2ea5:bd39 with SMTP id 5a478bee46e88-33e8be6a20emr887550eec.4.1790119212248;
        Tue, 22 Sep 2026 16:20:12 -0700 (PDT)
X-Received: by 2002:a05:7300:54d1:b0:328:2ea5:bd39 with SMTP id 5a478bee46e88-33e8be6a20emr887518eec.4.1790119211760;
        Tue, 22 Sep 2026 16:20:11 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm1412845eec.28.2026.09.22.16.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:20:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:20:01 -0700
Subject: [PATCH 4/5] arm64: dts: qcom: Add PMIC support for Maili platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-dts-v1-4-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790119205; l=3595;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SHZeKzvusHFNFuYOntdlEiI1S4ayexSEHJ2wrStFqY4=;
 b=ZtQzTsRnoQSIJatSql1R2H6IaZlyykhfig8kv6jV4L09h06ck0aN4WYbiw+xR0P6H9YqJpU8+
 9h9/W4+dKDdDUM1p8Hm0Y9ghi6P/EySUYniHhQh78TqEbPpfdzygPJD
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: Tdlt2gXCcN725LuQWnaBLTFWd3SsYkHC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX47mb0uh3cgEN
 OV1OGuD9fD2XmQEq2A4WtYeXquIGafBDPpLeThYXvhTzH3zTPWMq1dk29RARh8HIgb1UXvZGf+n
 VSBq1W/VU0Kcjs9JCRMj5onuQ2Hd7oE=
X-Proofpoint-ORIG-GUID: Tdlt2gXCcN725LuQWnaBLTFWd3SsYkHC
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab30d2d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4ECTE-F74UkuUx1KzIYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX1JFI12vcDiJ6
 cE1e3bH3k6E58COfD55aJs9Mwevz5Um5R7onrEKRd8oVASxSq2rx3qR/AyFBo5A10nJ4WTYnMKd
 lWMMrdsS9htzmcZS38zSsqHEcMGzG+uwYJyNv2k88ZKBIbIaPEJwV0dUYNLr2KIFjHbFMJp1fRG
 4NGfzcnWhFIJnPrVYoEP7tA/CHvN01gAYM3SO0kAeex4yR1MGN5dnbiskKLNRzafCvpJOJGMSpG
 DZGqNTKeM0WMuzpaGU4yE1izlydZis9pib5kWOsY2w3cjcgLx2+ni48N7Vz6LCXbeiw73zfSMY8
 gEpNMzqNN1hu95mww/nynbwZ299SF40mnS9voJxmBGU0Y4cIAR/SaEcZgg9i8WsiWbz/5rVttHz
 fowQhD7ByqnvgDxl9Fzu+WY8AqEirELTKkTMUJkhgnQNYU1Q9opb3HH6mwVhNslmCEQFFEvScdd
 7lIyrcB3IKUAH5671mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Add PMIC files for pmic-arbiter device used on Maili QRD and MTP boards.
Only one PMH0104 chip is used on SPMI bus-0 with SID 0x2 which is a new
usage, hence add a new pmh0104-maili.dtsi. Also, add a new pmg1110.dtsi
to support PMG1110 usage.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmg1110.dtsi       | 57 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi | 57 +++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmg1110.dtsi b/arch/arm64/boot/dts/qcom/pmg1110.dtsi
new file mode 100644
index 000000000000..31b05003b843
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmg1110.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmg1110-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmg1110_k_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus1 {
+	pmg1110_k_e1: pmic@9 {
+		compatible = "qcom,pmg1110", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmg1110_k_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmg1110_k_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmg1110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmg1110_k_e1_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi b/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi
new file mode 100644
index 000000000000..2f3906ccaa73
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmh0104-c-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0104_c_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pmh0104_c_e0: pmic@2 {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0104_c_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_c_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_c_e0_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

-- 
2.34.1

