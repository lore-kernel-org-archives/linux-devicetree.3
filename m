Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38AD3FFAC0
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539554; cv=none; b=tJ7F4aMqpIHQzxbAIACLzWBocijyt8+eJu0NEBQ3R7wpqHBIq7oH0bzDSq5dWx2k22JAk6C/CtkGCAQxIgVBvSIEHEJdlMasuR7oY5EMH8gv+UougZ8LtkRCvYeJj94zIHdN8e3D1v1hOubXdzv5fAwr0QMtULVfHJAeIEn25f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539554; c=relaxed/simple;
	bh=lFu4IuT+IKrrc4jReWmTy3bMVs11TEshA6L6oqNRmmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K28DVNYBRHNyZvm431K9pudJgBBbCYs2MEteT9PP6nA9A88u1fvAw9iep1Fv/fnDVjroV3CZ89nxfr5ZInxqwDW665LHyDQoHy4nDgXX9RXWYLd3xsLiH07oFFY9w8hKkr3psYHzzOEkqcN0uqQk/uJ3xfAmFOWTGvP4UeePF/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGNGUut5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3lP/njA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGNGUut5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3lP/njA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6H5DR256087
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=; b=CGNGUut5RlwjUPsc
	7wp3V2H+PAsWSToA85OhmJuHRHiTpmwo/K2wiPKvSyaPb6owM17+xCEdrzq9gv+Y
	vo1QArfWY8JnuZRjHfrYqAL198MYGmIbNj/mC9aTK1Ir5u4sfYkrhhtKFUpDLLeG
	Il9tb3l5P1t7ABJAi7ggp7B7U6/62BYDcpMeHrt4mqk9hZG9RIeo/5W7zYo4FSc1
	YXS/cPd2unk3N0XVf89XaGUzMJRNvAGkLJu5QHR4PjqNRapDFrluhreARt4ngZ49
	19NAwjN+wUppE4Re9jzcxnd0n4GnuUPi/jsrIILXWb6f8ImnRWX7e/ZzJ7/eGtKE
	HD9mlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71k6rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35641c14663so835623a91.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777539549; x=1778144349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=;
        b=Y3lP/njARQOGDe3Hw9BrwhQrhGWT8ev8AP1ipBSE4ve9kmByYGovdIAK0B20k8kU4J
         iQBnEBTMl/a8Rb8slI8rmZpu3XKmE2ucv0wScpURoU46gtiU3Uyzp0SkkUCBnsnT60nM
         PoH/832l6uCqG1pjwUGKBK6sBatRSBWcGgo1n3jM4NmkxMDQiyj8VmX6lJ4g4m4dIN7+
         VpQk21oHCdUdvPioOfQ1cADhsiiqLcAm7xZ4v7PcRer0R6LEmeCWfShMndwjewRUJa8Y
         prPGXpjp3QjkRu5ORFk9khKq0axeTManmFdxgK96bUSxp9N789WSjIi9bPirtqnvmbAx
         QI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539549; x=1778144349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=;
        b=cEk+QxiTM/eRTu9XIRc7RcoCP5bR42Oy2GP12/LZt/huWcCZORmdqbt+65BPPxz89Y
         hk0lxgaxT6ynf8v9Wh14T9bnm9M69UG4JJInv1sXRB7BgatrudLUODzrUMNzvZB51ZDH
         jT095Il9mygZ3NqO8oy6nhHSVix4AYvYMNdbkmOhuVNSa9ucMua3ESDnLaoZmJjW6pAL
         H5PMzq82VPvVjP0Kuyx764YRRMWkAL6yUsfv2RiSw5T1WDdx+1fu1U9PfpwpzdDjmYz0
         S1KKpSDHTyfkueszRBUzWIZTjbcN1Vah8+idH2YcJa3vTVxJN4iOxbGOWn08flMCd1AC
         CVrw==
X-Forwarded-Encrypted: i=1; AFNElJ+33gbtoSMNIspWXP1o04Wh45xhhDTNOQ0gnjShfA8UN1fjh7LXpAc0XOagey8POzBkcV+QQ/88JSr3@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwzsfrrHCM4e3AXwR60FoL4nEji28jjkm1VqvliKgI9TIzyFl
	nvjMRvldHvLTtxlAov2EjJj9FjMVPDgp07pjbE2GCRq2sEHIUpw4ZIhKYY8V72899SUJA6IvSHg
	YXhz8wgwmzQAuNBn4Vxz7ldJ89LrqZR3CWC2A6d8wUe1zSgL7KGo/bHXMetfgWxBS6d8hsb2f
X-Gm-Gg: AeBDiev0810YdOidDY3jN8DQdy/96DIlxDJyPkTOptlFoCSq3zetbE/P6Kac3UH3W8C
	MmB9LmAOVR1hpPg3Czth7OxPSZGRc916qW8COsrtmacKeyaQrWHcWgwbXGzmTkfukGW0e3vF5Ya
	KnRFKfltm8iBx/2A7SiCpBCslfcghhtcyueAa/d39Ox/grdhqyG7YOhPcgM2QKeAo7VsvfgDBRu
	qbmRQu8a4d8PKsRL7dwDDY30Pa3IybgLNnRBfjc4WrC1cDm2lPjiRSva8S8ZVflaS+m5zxoHdFx
	JM+hmBlFNvrecWa1c5A6pp2Koya6L1zqWECdHfaFrJIRqquK8zMqeNhasTeZqDhDkQIEbRVMsPH
	DY0PmJCEJ70d556kpKVwW1xpn+sYftog5Fc4uXUO4helPHKzMbmU=
X-Received: by 2002:a17:90b:4b8f:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-364c32cdbcdmr2077671a91.27.1777539549371;
        Thu, 30 Apr 2026 01:59:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-364c32cdbcdmr2077636a91.27.1777539548898;
        Thu, 30 Apr 2026 01:59:08 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd5249c9sm1267312a91.1.2026.04.30.01.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:59:08 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:28:57 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539537; l=4659;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=UveLLaFbt4LGcQy2FaHPB6oYAGE6xjTtc+YtJb8zYHk=;
 b=GC0blywW9vzsZ/L//8nIw08utZuUMmb4neZ+Q+UUj8bEp3Dr5xSxrKnbOmn/57QmEpkfdMrjz
 pMXZKUMxBj7AQilu5ZvCW09vcUq/jK8dsTzFgqf83fQqIQjvzkBpudf
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: AuImbTlQfjbUEVVZKPyweQcmHK5MZRv6
X-Proofpoint-ORIG-GUID: AuImbTlQfjbUEVVZKPyweQcmHK5MZRv6
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f319de cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hbj8Sl73EW6utw1LywsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4OCBTYWx0ZWRfX8S1nM65dEdqK
 ibkM5QXE5xjyBiRYJB+CfDLzGoVh3DOX98UGZzh32icqrxU6XnDi3DpoXPY61L4sa2DNHLfL/6G
 r6y1qiP472m97hVwkS5QmvBomaljZa8ZuKyk7M34wySJaC2W1HOpeppOcFuie/KN+6HoBxw1bEU
 ojajo1oET/HAnNNbnuCZqW3DoD/UhTO3kqNTUZuEXaLooSc8g0ToRVE5ST5Q6bNXYocmhDOgOxO
 A1Eb1tFCe0mHUjHuiP6CBe+EbQRPPDkO/WCvz2BJw3ij40OLtiMycljYZ9o6C90cXmETtIoDAqX
 lpp60RDFtCzxF7qzY2Mv8MFcAqXC7wSilg9nBWgX8AR8vNZQhsHKzFPPOYOSl0HNHkMK0d+f+An
 OsSd8O5uvnW6w1hK4a2fXVtDVdR97bmhHj0f9IGvpDZIgBo5xg+xk0jbzcFLU5YMeH1JNZJ5TNY
 x9HGcZq+Gm/KJGypIbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300088

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
pmm8654au_3) on the Lemans platform.

Each ADC node exposes the following ADC channels:
- DIE_TEMP: PMIC die temperature channel
- VPH_PWR: Battery/supply voltage channel

Also add the io-channels and io-channel-names properties under
the temp-alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 341119fc8244..6caec3e4df4b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
+			io-channel-names = "thermal";
 		};
 
 		pmm8654au_0_pon: pon@1200 {
@@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8654au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8654au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8654au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -176,6 +200,29 @@ pmm8654au_1_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_1_adc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8654au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8654au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_1_gpios: gpio@8800 {
@@ -200,6 +247,29 @@ pmm8654au_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_2_adc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_2_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x4 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmm8654au_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@48e {
+				reg = <ADC5_GEN3_VPH_PWR(4)>;
+				label = "pmm8654au_2_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_2_gpios: gpio@8800 {
@@ -224,6 +294,29 @@ pmm8654au_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_3_adc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_3_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x6 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmm8654au_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@68e {
+				reg = <ADC5_GEN3_VPH_PWR(6)>;
+				label = "pmm8654au_3_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_3_gpios: gpio@8800 {

-- 
2.43.0

