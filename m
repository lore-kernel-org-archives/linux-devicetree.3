Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6DD426EC4
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983940; cv=none; b=Sps8DdhElS7gXLyxke5xNNlUxidzh6ugnC2r4Cm4V7vITQbRi0mL6FhPUd8d2v8NY7lMq9gEw6stLBybu3G3ceVWEqX0ILq+NYR6AHPTfz06QO+QGch4YhrfoH3UYgt1M7X/ORzlgHklCj4lUls+Fr2Dd66oSXNjbn/h5D1ooTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983940; c=relaxed/simple;
	bh=NLhQZWVqdvbCGj18sMVaKtq4ki84eZ97ltTwhZ8fSS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYXTRaXhKaA+S/DQTPayKa+riMV8sKauQUbDuJfzUYTbyb6G1+4ywAQmQ0SdSnALvOU5NwNJ+sIoDOMtLfBYK9iKlrwLoHxOPYuA2axMlsqzpMnD4I8HUY0PE9hwqvOpqlRRD79ZtiCu31iL4c//NHhmeLPl2FB7Sj7+YpNuINw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=allamCO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ac6iDUM5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="allamCO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ac6iDUM5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595bfB4028256
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 12:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=; b=allamCO0vI7TADws
	VkmsVg/dDPUk5xTLfNNwGzjUMCPs99tz4e3s53RYkw7dTDwYAMhyNUD7wtfbrLkO
	+iyUD8p5NH9a6mLXqj8ibDCujaUSEvlLeX9CR5E+mfMLAXeCHSiL0WlA4hdCZhpW
	UkuJyayOxkbCeIZYNlpQKqkPA3WLBrJMNrjndH30ISHwuaTY8gmpT3GJF7225Zsr
	GyoCeZUTW5fLDtXNB9t3yk3P3aGYoqoxD//HckYLNbGzhwpje4SE7n8I7Tr+Iu99
	8YbvSCt2oIEXPgPMhYzhwMzM5gdkICUGILNHEMf2Dbkngce4wLrRBiv5tNyooZko
	M3a+LQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6rrew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 12:25:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3651cebf489so849792a91.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983938; x=1778588738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=;
        b=ac6iDUM5YGRyTDUf3D9xrybPUHDLpva9Y3L3VMspTgWFbs7NMtP3dUMX5nlMnyuyyn
         XJGg3MAPOa8KDFO9WFyO/yRBkQbePX/SiCWrbZZTWl8djSuLEM2GtAzhs/e14zAvRA+G
         V1G5BKJDTRoQdV++oDdlh1T/mH8LhjGy35cOT+c5KzGhGhD4zWMFxryUA/1C14+laBk2
         bnhNv0H7+tSaIt88toTzQtNHmL7zjZX2VmleQ3pjpKX7Zermue4f21Qzwv5EQJIzfN8q
         5jgVviiJD7d4jVc6InwBO7iZ+H9P8YBkuBhzSaWipoZi+7EPHDmycRF6fcfvkeY5EUib
         xDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983938; x=1778588738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=;
        b=MHeFKGkQzBqzG3axohWI9AyI7VzAFNXEFi9Nk6vs921T4NI0cG7PE5ben6mzZZDZc6
         HTxBqGIfZ+jHMo3ZMKmPWYSpKBAl5Np1EfYBLd7S+7b33e8D6fpvWrSFSCh3JWbWZa0C
         TTLDY4jr67Kz4LpJHiIbXPQdWb9lRGm1ZEMycVVOAkKVYsN0W3w3f0aoAZOfhGe6w4yf
         IWdGNICtTpcyrHKtl5aq8z2ldUJO8OOd5zgGyG3tYltntD3KsWtd5SuD4S35KLpdBflZ
         H0VsSGfNzVFb2JWA1MZYkt5B06CS7cp+/VMUYmmEwsikjUeoOgcuEpgtuK8OkEYxJzru
         2snw==
X-Forwarded-Encrypted: i=1; AFNElJ816LupM3gG14xjg6rmFqjzzurLvHdFVcK6zMSj685ux2G5sDWb1PDdAWtITfyhAyAOMtjX2fxqTp70@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BH8YEtf6T7CeEiVv3kYOpKZgQsdwPzcy6DD73a86chGJ9OEw
	hQdbdcQI10UwRjXmWWnzIRbZgiG4y2ACol+CsvMkGNbhjtCRK+7RdkMx47rDDZZ+ztitS6+FH7Q
	JpsuuxVrbMB+9ClHIPqaXQ1cIwUZcMlBl2P5FCZvaLAIr3xn8rMsyv7YmtH+/n17h
X-Gm-Gg: AeBDietHAA//YKVCkV/1ct7+D7DEUuKqZaqOYgRPTTZ5iU6LtxMXHrzTdRYqCmTtLWk
	iS9THsr8Qw2/nnPVYtxsQAgeCLDp52q8144Hjbus6fprV2idb5cdhwgCXf7Iui5D1AgC44vpO9B
	ME+mVsrG9cfPHXsTPnlwJg6Z6BJKYCIcSGyg15EEMqoIXq2lyFlJbeoqspLNLYHUcfW9ku+qWT/
	IQgVdGgz5rlCTAX1k2oy2/9x9IXYB0Bnx3csHog4YF1eD/jQ7Hqq3pNid3KiWQVJakedVlHXzPB
	5axRIlREtRT/4k3aUq/ovrH0gvhxnZLHp9YuModbpxphdPWXA6LRIqryeXcsl9O3Lqy/lZK+mR7
	9Pm2LCbdsZSPIkl7qKFiM/ZU5fkZrHj5aeuJjIu3WLHE/ZaWXBOPk5a2cTK8jSuk=
X-Received: by 2002:a17:90b:4b11:b0:364:b4e7:6705 with SMTP id 98e67ed59e1d1-3650cd4b1cbmr8148859a91.1.1777983937590;
        Tue, 05 May 2026 05:25:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4b11:b0:364:b4e7:6705 with SMTP id 98e67ed59e1d1-3650cd4b1cbmr8148832a91.1.1777983937065;
        Tue, 05 May 2026 05:25:37 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:36 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:51 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: lemans: add AEST error nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-7-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2483;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=NLhQZWVqdvbCGj18sMVaKtq4ki84eZ97ltTwhZ8fSS8=;
 b=AxeiR1PoOYSoH7YgiXOYSRmTYri6J2MZYpG/MV/d06jya9y2h7Kbv5MveGf0exaihAYq4bCo8
 76Uu1Oj72luDypcGDUDV8xei29hbuhNCmXFO8hpt2yop7HOiOOdTRqC
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExOCBTYWx0ZWRfX48V7fZfdr3U5
 FcAEY0nLJp/KDj+cdVQ8IavEvnZcGofM2e9t93K1ZO4Xyy45UMZbm2UWC3k5OXJwHg8hOap4Imn
 1kYtQxpCtX8Za4ElxtOqNXA2RPqxZSr/cTsG6AXeA4yru66gYP2AiiFf/c2h+Y7adGejvbfSTs4
 aVNcTuODUxPNQgfPFhT5F2herP1ZYDNlv2Qp9WtFFifd0mlndqyfhjzdZVBZxYJc1JlzysaMPsj
 Uv78PBccgwZRs2+wKHDEPPqzNkTaoZA3Cl/fG/0t1pm7k23J3W04SMQfTBw+qcQs99FR+YOk+e7
 XmYcRbocy8YF6YYNQBPHkStq2TxSusm0Ogdi+MKurl7TWUF6yBYSiPrNRkKjiCt/K0HZ8qU9hYX
 yx08wPaZHIoTb4HLPLKkzEem/e1qEdZJ3Je2WP+osoEdULpKOmh/SoLcvILHKzfyd1xagfRLXWd
 Q+vd4B4Ak1e8Xz9UcMg==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9e1c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FY89ualHrA3BDT43sc0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 3dl1dHEjhJKb2o3DXLoXeEPW-Dguklqo
X-Proofpoint-ORIG-GUID: 3dl1dHEjhJKb2o3DXLoXeEPW-Dguklqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050118

Add AEST RAS error source nodes for the Lemans SoC.

The DT describes a processor error source covering all CPU cores and a
shared L3 cache error source for the cluster. These nodes model the
hardware error reporting blocks and associated interrupts as required
by the Arm AEST specification.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..199ea1f9a8d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4,6 +4,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/arm/aest.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
@@ -29,6 +30,46 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aest {
+		compatible = "arm,aest";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aest-processor-0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <1>;
+			arm,record-impl = /bits/ 64 <0x0>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_GLOBAL>;
+			interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster1 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+	};
+
 	clocks {
 		xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";

-- 
2.34.1

