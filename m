Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB0133B6F1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253813; cv=none; b=XSwLEjcESp5bC4mZE/IF6D5ry6Zhst65ecqQKJsPZxnCxjxZ1zt8p/CduL6uOuE9sCbkrXzCm60tAHWZyf5xRZ391A1u5mjYFI3KeLdPSlTdQ/KoTQS3zjdbMYYTd5QELSz4DHRN9ECybU7wM0R2wPU64jE19V563/dDgFk9BPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253813; c=relaxed/simple;
	bh=WkzMnEibAfRrWj1dKTc5IiD9fWUTupa7qdvCuMS1XlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1yoM29aElUlut9EgRTCLSB5URoPt7Pl8tCs2vh0ZSOAX2Wtd+EdIjyQKOqgAzGnUPrAqQv8+EYot7cG8MhqxvJcTd6XN86DAdcvM7alAmYzHzhzN1oJiGnWre2b28bbw3wzu2Qu0bGfpTfVM3HeNdH5RynKCwKGPCJAeeJCKow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9qghl8S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCC0aKau; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9qghl8S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCC0aKau"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEd6i52592372
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=; b=K9qghl8SpP/3XOIk
	zQ+yON8v2DvnOpPa0lZIL+LnMYCOSld8qwOj6JIWfxrlcw06lMd8u1ZDaBUPhfmx
	nDUNFibXnGWrjUZlk4a9ewCZtZ0obXyhLf6jiPB6FoCUoha1veoq8g6LWopEWfTp
	/4I8AQXV22NISrRMQM2bb0wNvjLFfKcGpS0k4qs1737nXRUw8yhYVQyjAPdyBmC0
	E2zuZvTg31OFRfS2Q1OsKQh2blKvBP6OHCgL3Ktmaaga78s6zYbuZGKsMbgAHnq1
	jTuHP2yaxChLW1aQaoDLosMMRo5kLBZGiUxThFQbrsPS/7rQhovJ1KtQJ/TeRy/J
	P66xaw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpptttswr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce870a060so355885ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785253811; x=1785858611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=;
        b=eCC0aKauYoJU6aNmuzNdKnarX5s7wR/pSnyT1P6K5CsZqpWDnSES93XC65G2RViWnh
         NS5szQeRep69oPlZnlsGx8sTIEHpHeA/SQdBqC3ivyeb9BIHoYczfhSFu0UtwxFhfpSB
         VKk7VeV+Yi9k4LQW8+8AodA8CYEprA/gRKk3LIJ71zP66gahE9pP49sblg79x4S5PLxu
         NGL260nZYl0S6WXQN398iyAqt/WfX96U/qm/VrpyjuZKK+mVfJ+TGLt2ZaAoKV8SKHbH
         X/5jZKd5mshOdivzjVqPaHVusdya5t3y2ilNWXNjJ46SP0AEcOOpYGI/v6ZF/JRSv6A/
         A45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253811; x=1785858611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=;
        b=OtxYAj4GxL3Yu3mAS5jaT3i/0qnULbiX5doQS7D059psTvjLxQR4b+GORI5SRNdmID
         PhT4veA6HkK4pZcFY0PFlso7ia025nc0ezUBcjFzWy5WxVKceJ3VRAFfxwKyWRtqtJMp
         4we7ZXb7b8nelrwZlecvNkBxgOwad/O5b2FWi2VMJJ4tww84ESMK/Lbl6oqYA0O3LRTu
         VSEd/2/xvbJbtoegpiFQeFeDC/tRnjL3MRpiMuscyT6V+U7mR2cOYGgZrlhcsQ6tyKb7
         QiMMTdwMGNRvI9ATsNSKvfUq/SuFiJ8piWgXOLjemoU3iRaowgt/TYLZ1rK+TNmFD6QY
         lJ5g==
X-Forwarded-Encrypted: i=1; AHgh+RpRKWg7lUSW4MmoVSbXr0u4ypOyaXYkvH4ZLDFns6xLqx/aWvO9W0Zal2JB2jLSp1jDRgTY2w64FSJL@vger.kernel.org
X-Gm-Message-State: AOJu0YxEsSgfysBSNg8RoLn1KYCIItdgbUFrkthCvzjmhqXM1Uygid1+
	U72Q9WURgqL66GAjDAJtaosrx4QQJ6AZYxWmfkv/SVQtDxJhbqI1iIiBxF3ogf/23Gxb9d2fZco
	X04UcDIIktiHnDPg15+6h/+kU6K4ifAXWJbqmd0uv03vJxvU3HyvJdIZs4dsC4yB0
X-Gm-Gg: AR+sD12vqBL3EQWzVp/uqLROBr6RA6sRrhYBR5vTkGIob7gdjsM/wP6n9EzSkJhNE23
	ODDoLSAv+vLo3J6yl1F/OzHsuxSAV6fn7PTmAW6Gs7T+FV0C7XMDOp36WkyRdwr1p872HMhGP4W
	Y/0sFVjj6mw5tNYS5UeWAgnD0byiQUWJNjspk1oLTWbyqLjGxQml3q1R4XOz+Ggtbt357MePRqK
	fdzOACU034ofqbRYquMAgbEah9EOWfrpkObyhFjNdiXjvZKh23e39wXV0x1PALcg26MY9D4vCia
	LY5/I5Ps9FXisCf0AMPwb+yNwZEOvGxughcNRAe6PZfOboijmZj9QMeYkbEWf1CKUd+RZWd2dT1
	Iybcdp3oI3yfa1RSOH/o=
X-Received: by 2002:a17:902:cec4:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d015a3158fmr36828315ad.3.1785253810596;
        Tue, 28 Jul 2026 08:50:10 -0700 (PDT)
X-Received: by 2002:a17:902:cec4:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d015a3158fmr36827935ad.3.1785253810124;
        Tue, 28 Jul 2026 08:50:10 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7eea52sm55688695ad.61.2026.07.28.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:50:09 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 21:19:43 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support for
 PMM8620AU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-adc5_gen3_dt-v4-3-355f0edece77@oss.qualcomm.com>
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
In-Reply-To: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785253792; l=2532;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=M4owo64lJpZ2YhGXHBvdG/H+ClAgq9NAO1gg9YEVitw=;
 b=mLSaG3MGBUDC3fUCst+NGLyjDZUTLNhEsTcLsbaVfEs2iNs8utV6NieG74by0ESdRBVj1JbXa
 c1IwZpFsS1rDiYrj50uq6X/vO56yW15qhiWCTaUYmtL8ocBsZQB5ERF
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfX+bHP4ZXnoMjZ
 wyBf9tqsvxT/RFujDhjiN+V64HfwbqWijuOZhd5nJUpv1pNsPzY2qEoPxp3UbRCO9+DywLnXiUl
 wjjf/rHAPQsaS5rUR/fkOjeCJEiR0oE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfXwSoDjxkReWFo
 2xT7JK8qMBA3N8z959gH6mxJgQNruMaz6Ub4leyR2EsXVRwSad/PW8gw+WatwClqvJsFU8U4Rbm
 GKl5L71hOIAIhJB1CLeJ35F7OjNbMdG2MPtm5EOSY+GHbQZxK3i8f7GqYF28eP3YAliYhf2nrri
 X508o9UPYZgSIWDnAZs9UOParUl5dE1Kwv+4LnXUOV+8Apd1MEBcwNUa4nqSg8pwrydaiTkFj70
 idvRUfX6sTruhhy+F96MClB75U4K0UXUl8dJv6vTR1fw/oRsLWkvihJR4L4s48otI/TwEeZXr3Z
 iq2cBpa52H5a78DERjDIJo8qcJIMiw7RwfL1Sq+JLrjBseK03oftZ2B7LsSKKOVd7exKQsLi7cF
 8R/EStNzdZV8MO/ixnLTXF9/De2YnWviMQ6H97GxJ5NV4AngI6fao5UndpiMC2EtRAeaK8cuG8A
 Z9XvuaOuvyUGDnK3gUg==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a68cfb3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QpQC-BmSr1VXi1yepFkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: S6miFMFc2mbVF66asBvhP1Zrioka618V
X-Proofpoint-ORIG-GUID: S6miFMFc2mbVF66asBvhP1Zrioka618V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280140

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
present on the Monaco platform.

Each ADC node exposes the following ADC channels:
 - DIE_TEMP: PMIC die temperature channel
 - VPH_PWR: Battery/supply voltage channel

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719..6e096b9b7546 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 &spmi_bus {
 	pmm8620au_0: pmic@0 {
@@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8620au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			interrupts-extended = <&spmi_bus 0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8620au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8620au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8620au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -37,6 +59,27 @@ pmm8650au_1: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8650au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			interrupts-extended = <&spmi_bus 0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8650au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8650au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8650au_1_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

