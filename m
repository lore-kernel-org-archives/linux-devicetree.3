Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FDE2D7DC6
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424342; cv=none; b=l1fYjT8QdgF4GBeXn3+alnvKfLE0SFj8diAors+EsEuBGEmYfPAJXirUwFs9dS9nKtnb6ANReIGIl5qGcoMAdNh0dp8gLvkmD+s2WDSSuM0VN9Z8zgON6Hv1Fb8Qcf9czc/qM771HoiF+4Ls3f6TfXiiwbBHP8ld1W034Kzx9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424342; c=relaxed/simple;
	bh=bjspg4RGlRRJ+lWkvFxPGZiaw9MGEJLfXMpLoztY8ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLH7VmgzcHXCcVgS5Cd1c95Cnllnaja5X+EjwabnMVA9rY+JaDxKgGnwTKlx6R3coL8PVdOy+kdryOKfRuTCLrGVj9dy8HtH0URg7lGuvypSEhTm5EhzgYGuwVjMtBBningbrPmLEJ2KlHxKhas4zksVVUGY7AfASWKxOaObx2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAr8pcMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDC1LqtA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAr8pcMi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDC1LqtA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E49TuM137635
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=; b=GAr8pcMiT7ZgK4ZD
	yhHYQIlVTgtP1Rls2ymm+0aVnleHeU0Q7BVr0tdlEvx0q3f0rUEtwvyR5/5syysM
	cYsgB9zKwcN0ZM8s1OkOoPIrufus6tJhIByHLsPO5u9f1xbzBsKMlfifeKjomaf3
	RsqZLO4BsoWobGPCZXMuwQLgRWvzSm8krIgLEI0ogMjN9VMuuNXUjzhevusCXmdu
	QHTGKfD411Myo+W4K9dYdhrW+GvwPywedgT7LW+9/NUT+MabWBIYDSBrbAOh8h2i
	9RO8TjHfTh6x8k7KCRQKiMEZz4+Z4T95xiRvfGNBYXUFD2dWj+qmrYwJbb3o2esv
	GWp9Bw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgjw26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf160f7191so14891845ad.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424340; x=1782029140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=;
        b=JDC1LqtANaYejishbPTnllGXTbkUsE8u7v/X/QDlaAXnsxRdmjbiJwXO6pzQ+Yr6JP
         1CIz1CFGcRvmePQvM08wq2TKArAnt5mq+oJBdgelwNYdrnCjkOu5nsUIQEQcNrUcKw4C
         APlZI9Xlo7XS90cUXcq7EIc9UGcHO6uVBvAarfzXL7DGifHyB/G3YqXyZOyi7ERAmSZI
         x6Q1GyGPBVZwBvEW2cWpBKx7YqFCjduGTn+mqsDi8o37MMlgCee7Tp+PySGCIIXgqNTO
         g3oWd4RtbWb32kFlcuDcu9FLuz8IV/9Ww5D63uZnpGwhuHhtOr2rcZfSCqpN7n1qLi4K
         nF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424340; x=1782029140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=;
        b=KqYaWWzOWeqNrOB9hD+gmOTe37uNsxeEmDdkjUn4vv8SXSFu+8BXXl6pzIruTrqMpP
         nNN6lTuXT8VArRupVZSoCYy03fbB2cwg1D5/bQDZlWkJNoKjnbRUjISFWjEygdxghzFF
         Nb+/f2Hjn/qxkQPEfLeK+wDCIOT0ypbo+bGr2vTKx8Ky6a9733qjpERMYQTwJMiNX7I8
         Ij1ImyZVFvWng9jvFpA5Fbe+XiD4GkQ8NLLeZDUu8rZfZ1vwyPTmUjJ5GB7DinE7aCYm
         SPd+IZkzf5Z9ySsDGx0ygBQeRFo/xcxNo2WsUfLT+juBi+ZaWNMEgLoIyJSS2dD+oShb
         0edQ==
X-Forwarded-Encrypted: i=1; AFNElJ//Bz2Xu54ta30RFQJxjoE4vLeLkxDIa/k/7pridk1LoXPEG2kgW+y9uQVyzYYSlTzp4YvUWV6IUo+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ykj+4CiCmWNSSZ7yrPRU15gwr9zlgN/yHeEAMyPUEVwH1cR9
	DNA1iFWTeDyWe7br7T9sDKLVIkFGjrHc++N5TokPDiTshq1EcwhGjw15L0SKiRYt/+KZlz213wl
	NRjtAt5dKz2Zu+ctxGmjeONGWB8xdqX0MZ4SVGVVXch3gnQf7PGzYH7IOWgFIj1DnpSHhhsOi
X-Gm-Gg: Acq92OGHmoRtM3PWqVtfH3+xB4/smohNE9OGXF2hNgfhjDS35ekGqap9LTQex27Xb2V
	gWp7v5Vw5a0+i97qIgkqCJ/XZLxYDxpnQhSzzhHQLv9MDqWMM+guc8KDsASe6eiYgmwMqKFNisM
	ky6Sv+xi2/qXQqQC5Il2Gq0MbyaUDpeW+vEiMt5yhGl4c7t9iku8WDm8bJo6JPNYkNqO/KEljaz
	OwR9irc2/eBP0DKo9k48NgQclCG9ByJOf8ZhRRl/xysTV5xGJC9XYvDSDG8oYkMPwBDoYvOS/11
	1XtnTQFTg213NFvXA/1/f2C0STTyJYQon++mjKxJgkgY1ujM6szJleXIKq/JBCajSkXsf5bJzq2
	2jkcKXdtY8cJ0GamnyPqhjfYSpXwzr5EcEY14NnF3
X-Received: by 2002:a17:903:3bcf:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2c66421ff97mr64541325ad.34.1781424340412;
        Sun, 14 Jun 2026 01:05:40 -0700 (PDT)
X-Received: by 2002:a17:903:3bcf:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2c66421ff97mr64541215ad.34.1781424340016;
        Sun, 14 Jun 2026 01:05:40 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 13:35:10 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support for
 PMM8620AU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=2376;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=F/Dag6hAiI52pCaHDtbl8w7fY3rlU7H+PFfQz62PGaA=;
 b=WOHuach6phVTy4G8gMm5uh5c5CLcaOQzA3a/noo/rm7qiGbRgeGIY8ZNUiwlHOwiO/yHDU+Lk
 kvLGY7r5N6hAsRYirrpTjni1z/GymRMlAw9ry1vhj33RMWvKpfxKfgH
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: cHF1xp_iIJVobq_1N4771TysSCvva2qa
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2e60d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5fc2j9ygtCN5jjOEnLIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cHF1xp_iIJVobq_1N4771TysSCvva2qa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfXzgKxzzfCtUSw
 6+6vVv4ueg61JIkcrd6xi7irz7mENYM8pky+VSF1UVqcAT5xbWUmeDCxSuDVqosyv6cGGOTLqA2
 kcBcfoaVEPL0Kp1//eaHmbpqrQQumWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX/c6v+49CsQ10
 2L8ZMHQ2n9jCKQYEp7/sFDqFmCD8A2hwtJDSmBsPY1s2wOI0pqJGyaB/F9buwj6uzVZOF90kn2Z
 pUUJ2Aaq0ePpBWZMzRERyIsBJHVqGQkz6pWQyMkcw0AzxNTlTJIS0w/7PxXy2qaw0igK3IxtiSM
 CaDumYfacZtO9lt5vWdJryvOu4CGnTNsmwPTQDzKmrRsI1II6ASVc4INhzoF7ERqg00f6EvDS1F
 LQ/nSAm9O/MQQDBDa1GnpgObATSa5NV5t2GvLzrm38brU3LNwi6HWol4O6ZPA6/DsttIqoJpJaA
 goJ9xUolEitUlrd5GIXimGpkF06FXDVqRjj+Ip0qny7tqSMPSYRIXP2rDNqvDt0xPAwVR2o3iH+
 4Pfh4bNRcaSoWgqHwNj26O5t4vbOZg7DX08NCBWzTKPrr1RjxjM6aWlg71Zg8cVuwyC4pAT0YMt
 vQX1Y6hGAvRjyYCrNHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140079

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
present on the Monaco platform.

Each ADC node exposes the following ADC channels:
 - DIE_TEMP: PMIC die temperature channel
 - VPH_PWR: Battery/supply voltage channel

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719..232bcb942b54 100644
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
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

