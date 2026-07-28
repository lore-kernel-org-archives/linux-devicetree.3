Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A974645D199
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253809; cv=none; b=Xgn0RWncejw98Sia+f5EyrVXX2o91F1ldOQ/gKWyWjdkj5e6CmhEuqFjo+9fYaLRPTVLbAlb3X0RkicdJWrWfSZtcVj95tRm3IMfDv/SrOH6dNmyxmK5HyaF5DyHTr3a1fV/Oh4vdum5Am+pJdBVypBN7tLyCRBxu/KnCG1hnsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253809; c=relaxed/simple;
	bh=BL6j5H5m37TzqcudsoCQpnU2bvwoR+kGsvfjqpq6Z5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cl1h4K1uzRI6nYSU3JbRiCzEizto3BVowjfestn1BMVD3nUK9hvyP4wWjQj8YVf+ik+XHsJZovMr1Rzx2U6kI026jDi6aEpmnnMmvPrVGB7lcJUEldoDEQuB4hIpqCjlBPsTX6MOPsogcs931EUY4tVDwrUVLkwI+U1B15wsI7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRaGKd4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4MDdj4/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRaGKd4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4MDdj4/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcf1a3412774
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=; b=lRaGKd4FM3va86Ol
	QIl+/X7xng6/zdbYPVCwaGCYH1okmqS0K/F+mIgl38xtWdersivSA9gdgpHbbTIu
	AV3bfH4Df6K4DQwtGfn0TqqOXL+csoTASyCwH0QRMXMyZp6TgaQG0y4R/Y2nrPRp
	7gmPLjNnGBQhCwjkIHuQ6Koq50euPDgH1rqRR+xxlfBBvFYZoPC3BKftiEntIf80
	J4Y6ZD3+dUkUkNAnFfTO6m0pH4uVLV7JtvIdER69EP7C4To3T4sTS5LjKEHQMbkx
	R8ksxWfqzS70c7xYxDQjEuU1D1QAIbFJ80nuKElsNQB8fTQ8SciA+VCq3MQaritG
	mzmBdw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy13asw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso258005ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785253806; x=1785858606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=;
        b=D4MDdj4/AXle1T8U80lQDZUvoQztinvmvPBkv36K5mDrt75KxKezrGgadITEOBAGG5
         +gVd92eygSmL9rNFjA++shvbMWEeSXaHPs6USL/2rsBk421k6wwBeD5m7XhF7nnP9vdF
         sCnAIjvjVCbcLvgCI79JciUcONtMs+SvHay/Y80IDh1BoEtdZeY7ChTYEXXQ9g5rwmPl
         mx45MNMPt65+AYepxmdcm5SM6KN9ANuvAhGV7B3Ten0lZlJWrgQl3A2xw16jWWabACbr
         mCC+XvvQA9CyQNQokYD4JSC/RjEdEToItgI9VbH89ef9/sf6pheIRXPrr6qFSiWl2ImD
         Qzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253806; x=1785858606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=;
        b=K657Bz6NSJD7COiB7ObHjCQ71b1ZZ8/UD7e9fsI+3pTKJ1tx4ZXUEFar1PJdoq1ehi
         D4w0EbRTmDEWldaMfvMNQjzFEG5jMmMP8UHAyaC8OpdjBIzKzWIJEuOE1WbaUyMfSnDG
         TttlMHkSNXw8Ig5ZjTXlyKaiwG1LfcaSEyncTBE6Mrz4G8rIbfRB2TtNstezkgc2nlZn
         qciilDddkrOziL6iU/o7ac06qeQBiFJONytzw4ZKggx/SriHM71XI5fs8YOw21qZ3jRq
         KsKVyuv4R6vGIsQrggfniVmvXv8KeX3QLZUqkL88J/PQhu9T5VuD6c4QTUyY66pBG8M7
         5rQg==
X-Forwarded-Encrypted: i=1; AHgh+RoLFloiiNlyWcQcgQjg4tD2Rcm0nWok6bDO6em9UERgsxu7r/GYaKSear1hoAfaxoIQxNG6BR7KpTYu@vger.kernel.org
X-Gm-Message-State: AOJu0YyvetjE+wMqTzWmW0p0dJ0bg9KQeTBmkXLyDQnKk05toNl5jSP9
	TpkFfL5Z0shXbH9+1PVUXcp5V2ImcUwfmAFbmjEiVyYvBpcpbO+w6vIx0nw1AgphOkW6u7NAHU0
	ZTHPkojM9WZIYrEiS/48a94xTySSb/1jifAsOO97sXK5hjMHdON9GHnySd7p0uwDfmIJM3j3w
X-Gm-Gg: AR+sD10uCeUz/vA8HkUutJnqomgK++l9Kq71R4KEZ/RECNewQDtNoUj0kdqvhRHvsPt
	mdnYkWitjyeEskX0qTkUfWgEuHMb6qwM+mNyNvA2dRYBj03PF7lKD6klJL8ECCAutI6frEGvJd0
	szj7C52afKRCeNwn2Nn/gRexP3yPHVPHl7MtuH/T59OqQZ2XLAw8Tb8RFk+aYDgbSrb3bOju+hX
	koU4KU3/XBFODzj2bVXQJrUcqRDJUNBlpxv9WG/BPnaGakULE4dIf73OzSAyVLuvPaHGSuGMg1Q
	EJtR2ceWPBoEsXiIu3VxYppScmBn4QVUjLsJcpvK51a35MklSck7zKFZ8EUkysty4rU51c9QWY9
	W0oq3JxpKOiQEkQS1tjg=
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr37225855ad.34.1785253806188;
        Tue, 28 Jul 2026 08:50:06 -0700 (PDT)
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr37225375ad.34.1785253805615;
        Tue, 28 Jul 2026 08:50:05 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7eea52sm55688695ad.61.2026.07.28.08.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:50:05 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 21:19:42 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-adc5_gen3_dt-v4-2-355f0edece77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785253792; l=4796;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=YDR7Fzf7/23vJ6lUmAOe24RMDWg4KghZNkREwSOpJBc=;
 b=HOxHE6LFoX1ERoXB8/b86wlcCQ/aLo9+P+BYjiPNTbiFj4hKkGszWcwldgB5dWLB+cRG/FQGf
 p3aRUTI1UqHC7VhBm6zUQvERhf3z3eY2Q/Se3coE3yzEaeLe+U56ENj
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: hH8JrkvjBhqDNstlTy3pIl7DfdF7OGKe
X-Proofpoint-ORIG-GUID: hH8JrkvjBhqDNstlTy3pIl7DfdF7OGKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfX+5tzZBL0TTSY
 9t76hlULSsNm0WhzrqNjLej7YDNTmu8XtM83Hzj644I4j5bXAzexBZD0W3i1nh0FCyqmzbiZa5G
 zNf+uYAE20vpvNldAVl2oIfIpQoQfKZqnSjB6vn14KCm+GU2AHLxbAP0Rq4z0jGXXS3zi11E7pR
 hvbClDU9pp2knmBTwOuTKckikUXsuhBNkmGMr0tI2PchAgezDay5qLF6YZ9P8xfQerm2kmA3PBa
 GZ5VacOn4IOUOyCRPzyXoJj/tgmjoem1ZOO2Hi1yGdAe547Pl9br0n9t4QZ7lr15prfVqVv3ZYW
 voVpA34cptjoiByblJFva5uOtXH1Uhj4YavwxBi2Lgj/8G4gaGVxIbKxcRLp6sQ7NHEoL43Atq+
 xKMEZI2DAAicmF1wMt9tofG6TK1vY+1LwQP3fVVntAosAEq41ipv0Rga0PRubs9I+fFh8bIsgrA
 ll/fPXgZLLtaMIQ3+9g==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a68cfae cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hbj8Sl73EW6utw1LywsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfX67Q8nc3KWE5m
 iZz9+ZGUWTa1mW6PeHhou4/KQZIIetuV4Ot4lJ0OGbUIO7orWHC27EocL6Jzif95ARqzR4GPapo
 gsUvPWZ241Mw5lmIbvOd6ljfOcD2PRs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280140

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 341119fc8244..500f715931aa 100644
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
+			interrupts-extended = <&spmi_bus 0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+			interrupts-extended = <&spmi_bus 0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+			interrupts-extended = <&spmi_bus 0x4 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+			interrupts-extended = <&spmi_bus 0x6 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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

