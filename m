Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D1431A40
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172844; cv=none; b=g8Ty0iz7kuE0bW1IznVqAj/Q6CamrDaTGWM5ZcXHq0kg9IpDux4EeFxzvNsIJKOhUs5JTAWAj3idr1jEwEpepO/TAqGqtO+dYPnTTXdIBnoGdIi0AJm1pWuT6LVK0/vDVgkoUNgUWZxPLYQAID4nmVcKhVH/4svh73kZAKO3ePw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172844; c=relaxed/simple;
	bh=WkzMnEibAfRrWj1dKTc5IiD9fWUTupa7qdvCuMS1XlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSAqJ2NZcisogrKNDx6iGyN/FPMX5eOi++cvmEUUvAva4hT2Z64NjfIUtWHUQoAagyxbhU5TSahNt1U0MP84UXd+0+sm7+PN/J90awYSyiC6moCCWUcP4IZ+U0g9nNXrxJ/h1wdAvu/NE5aAU+BvFTYsqKbcmZbAn1j1DfPIvh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFGVWElx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQ9D63gL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFGVWElx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQ9D63gL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm9SD3823637
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=; b=DFGVWElx31FiGUEt
	mTQd6n7OWgA66/Zw1UhfjmMS1PpkieVrlRUxPDc1WCM73ulxHHGstl1uBsReKi38
	K1ruY/i5BpV5vCqgk/k/PXGhmoe2zYkCt5E/DjxggtMnnqf2rbcUc0vel49AyWaa
	KiZ11ceLzfbYwrSD8VqE+p3YsIuzojLBdk08i4jIUG3Ce0FzCAzQFoBK0ye2xW3K
	tTZMOijCy1aT3GrzdZ+g5LEp2ngmzrNAa8I0g/lBW09Cf9Uv0+ZlPbvdqc8TAeC/
	p7CXJuQHo6elSelU20+cH7EQNKLRzRpiOYVUpqeah/ioa9Jbf+gotFq7qvuxOsxH
	5MZiHQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbt2qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so3430399a12.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785172830; x=1785777630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=;
        b=VQ9D63gL3fV/J7x/kWEUlpTEbk2Sf954NDRhbAu6HljbV9tiZG9p6AqhvNS0oJU3fD
         k5lbPmaYA7lNIKs9XPYQ8FCg4eqN8ol0Ro65t7EoBJ6rXJ+uuOLc4zUUdXvl3dYR4vTX
         CYHKR/+io/MtJdceBIfp5zyyU+q2ZXF0Kgsc++DsgV8jG1QgnkWhpDe49TAVT2eCZflC
         wN40olyf9oQ02c3YKETDT5F84vlWu4rpVDMopoAx+4uqw98OEMbDkqJRpD5l3Xqr2cOC
         obxfTxqPN1N/oil55v15SgW89OFPXDPU3Ghcs48nsfBhNNZup+3sYYAESE86PqriBepz
         KIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172830; x=1785777630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=;
        b=SzT2LKZFJ31PI4ozap0fgwcA6S9n054LfOnZhOhGc/DcTExfNY5Y7AVGICCEJc80YB
         /jb5oBG0QxTdG5Bk70mqsPiwDLlm/uAM7WH10ddBq0S97zKSdpANg199HD1KCgRZLJLo
         v+KV7eI986J1jG7s10CMtITu0Zv8rJ31xiNxZW9RCudMQPZLUW6WzaPSkOq/o3CEEaSa
         5j0RVUsfl2xJPb+hipMqV28YJArhl4kGygPshTh0hhN4wl/yosLvC8XScKVJ35A1HBRD
         nOg+8Ng152ISlh/nivPmxDsJEdwy+ZTWZ5FWnQNLePeeyUKMRS0heZNM8UlRK18TkZIh
         iDMg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9SM8RRTaeOMMYaTiWjc+ieOjwqMW+yVQmzG7umOHc8viExVGwKB/PdvJ0qKcKcramMzMZBZHOu7df@vger.kernel.org
X-Gm-Message-State: AOJu0YymAZuSz2gJFMckW7cX1kE/zoshMg+woitNBHXPQ7E054P5ho6/
	Ej4ALFjq187izaJYnVFxwXYcIzBOavUd85L5M/ZLhOlSn6m8ere4ppv75g/+uzcKj+uWsP9RVLm
	pHF1MHZ7gnEdRQPXh2pC7A6EWoGBQk5OKKAs+bfBpxybraWbboFLRkPPvD0837204
X-Gm-Gg: AR+sD1062D+m99A+3eeWZWm3rn4ldxepmSFhWb3E4Zf5XG5Y1PtMh54Vd3nlXkLmFqP
	3sndwpGHyP5qeuChtP39m2rpGvWoFM/HYwDsNDkzvzBsg52L/eNCgZUruOJrdk1zRWGfdv6emHM
	G/OPq4cO2IUoNHD++8mX+GJ08FouF0CdQbEXE/62pNkhU/D7p6ywpJ2XfWT7WWYUDl8JFyiYvQu
	ddGmMSE+ZAVNy3w2gkkKubCBox+J297zWgYRTzQBWQvm8DOCoQyBfyCLVwj6gv6Aq5cwgInCpj8
	8eNIAgeK6tfwPAIaoZL+IuZTPawg2DQXCUSa3YnLGhviDjpp0RP21XKBb9qlc8UWDAs1LDpsSLN
	QOHXPnC84y3d00T8wa5s=
X-Received: by 2002:a05:6a20:1602:b0:3c3:a140:9380 with SMTP id adf61e73a8af0-3c67da110cbmr8216879637.16.1785172829723;
        Mon, 27 Jul 2026 10:20:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:1602:b0:3c3:a140:9380 with SMTP id adf61e73a8af0-3c67da110cbmr8216851637.16.1785172829199;
        Mon, 27 Jul 2026 10:20:29 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm55892988eec.13.2026.07.27.10.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:20:28 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:49:13 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support for
 PMM8620AU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adc5_gen3_dt-v3-3-bc00223648f3@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
In-Reply-To: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785172810; l=2532;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=M4owo64lJpZ2YhGXHBvdG/H+ClAgq9NAO1gg9YEVitw=;
 b=9ZT28aaHo0knkQNZZqjVBqY2f5JjHgHp58VhfkIjXd8z9hs3SvFJH2pCpw8Z2zz8Hub0NpGD5
 ERFcJea5LPACaGOccbOTfyCMiSeK1wnBQc52/FhdGpbG9WpkUiOBad4
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: 0UtiQb1WtjjkhA499zFQ4I24DAbm3BAA
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a67935e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QpQC-BmSr1VXi1yepFkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX6/QTCKkUTeVT
 Fd6eW9OdUGbSosB/dM15nJgwZcbbGFev0zb04enNHZoY8BzAaxg5Sws1K3hXVBWROIs7zMqg1iy
 JGfC6QZUhcHLc7z93qr37H20EwoLZoE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfXz4ATl65OW2sL
 r+mkLfunXL5NTRuCpwCpMYvJ25P+CJCHo2BAsbbj5MfKsfJov/X9Up30qYw9xpRPaTSi8QVbc+K
 OLzwiCM/XfiTkTgyLAXp6i/tipvMHwfBR/t3xGA/q9naIzWiA3+fSCr37hgNQvnsDYkJ7N0bJo6
 DzH414vuupqwzBuFzNJ0MKQUCcbQOF+ONlzXNsl2eceEEHJWah7FrGPttufcft5jF1wHBNUikSM
 dwBMnLkN2oFbmXX+pveavKvFd1lU2uSOyZkz3E3Z63/nsrq4fQzMik08ZtgZwlEVm7PCGcN/xfk
 tbnrciD600UFprKWVIp+apCAtF9ImocqLKgxcVePxzCl9JSuCCpmqjo+n4AGna4kwRGP8Ad31GA
 8K4ONo1lLGu9DSnBZ4CnQURbCpT0gE4lztny3bS3gX8a85Y8/hVDDQ+ZLsAoIcQjBJq8S4gxGlB
 UEBVBjht5uHK9E9CAcg==
X-Proofpoint-GUID: 0UtiQb1WtjjkhA499zFQ4I24DAbm3BAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270160

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

