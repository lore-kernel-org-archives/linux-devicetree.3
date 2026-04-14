Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B955C2EC0AE
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186540; cv=none; b=JjiUJh8TSLdOLExHlRACr84XQVUY40aD9VYwMJzRWqBOAhNrrcxmQ53w+arSDJV/++taQvXgwwPWTMZu0wQ9kol9606P0kA2f/xitjOdvPScb+8MgtIIEqzfYgtMQDmkLhQY+eoiKuzF5Vwx7kQuNl0qD1IU/q4UHhIX5W+WBlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186540; c=relaxed/simple;
	bh=IgTiK3VQikktQ3bhdHhNthcHJWHKgEMDAuE4IYnpRCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7uFs50wlJL0d0a/KAofSA+p7s+DR0SEcIi9bM239dJ8TWAY0G11XczUbGvW1tDjBPmWNkynL9R+6Phy7evAaJV+g1PyLMCSEdtBADtQh68flCSeIReJjQR7fUqYoL4MtxTml+BbCr64cdpgtWhK5JrnQLc4jEgBPR+nC60rN/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/X/wV6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoFkPwlb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/X/wV6w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoFkPwlb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBvNio281661
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNGQMl1wIgawne13RW19Nmh2+8Kel64Nl6KOL9zWOc8=; b=Q/X/wV6wzqC2pt7y
	2q9v/Gd2EUo2kKA+8K/GQ5/D5NaET+0kGVrmMwAOFjo5bUrR0AaNI8N9TYdbL0eW
	c6e8DsD9YtZDNUP8zwqvKMR7snKX5ii1tQReElIHByHyUDgLfuVn87rqHYOe37vF
	iKiBntod1+/TrQQI9Pqi4Ye1i0TyIDMA5URKTpSOwZ6DUODupoJ2SKKrsazqSQAH
	nGYPpm3IhQWD1QMnQeETXCG218l+kz4Si8UmHHlN3gWqE22xkCrjZmGlALiKstj2
	gp+SNzwxFaINSteY9jnzbbgSb3YrHzfxnvIMVEW02Q3F/1UGV02eUU0DE2w0e35N
	k0lKjQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vkrhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e6ee9444so32363335ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186534; x=1776791334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNGQMl1wIgawne13RW19Nmh2+8Kel64Nl6KOL9zWOc8=;
        b=ZoFkPwlb9NS5UwHc//UB+tpyJt2Lc2elvzDGZaV3q8Uaz1eW8Fo2KPa8nbMJr/ZPij
         dd4Ewa7wu8/nV+lUsFgzQgEVQeprO0f4KKBidIkhS2DAljSH6PSFutbFLbHIDbRrfPD3
         /UzzW8FSKSCigm2J5mFdCbM+CC/0Tyey34bMQPyadQpdrglNihbWy3mHtwMxk8vuHMay
         uVmSDbtIjmV5qc63kj3xrVT07dfzqNYCJqscHlBM47SqiETXVRYdfrenBtOVkRoM5ZOr
         2uwM1WsEkhnw5G4FQ7DJGeav3EKvmSJNygZwLSlOqocdKLehXLQBiSQMsQtzXfWhuUk9
         a5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186534; x=1776791334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNGQMl1wIgawne13RW19Nmh2+8Kel64Nl6KOL9zWOc8=;
        b=h9wOl1IUArAbh0qmxFgk4gNEtJXiFoamGZbHFyRpOWMBGbmtyN99aEcjJo5nPL8o7S
         Fa4SqkCEDzF4Oc649tz2H6eVQsNuGrVG1q/QCC5/LUzZjXjkpwQ3YfxkDZbnucylrRx+
         2ogrFegPqnQuPRNkr7g60f0ESRP0sXlGt17obOZNBheSbC1ywdgoX/stSz+0+wIt6IVM
         CSvdI/864PK5UA4Ez0HTBUQanULeY6oJ4NJQ2ueAKjShPmZHpewRrTtVWtHqM+vDPOIG
         svrrPzPSuMF+VQsbQTmcX8jRi5MNsk0hBxR3m0MPtETjc8cudTc4e62nS55I8W7gVGh6
         HNPg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZOEpvgyFnBHatVM4zwlJXI/hoNnC3GkppOKJGJuLTC3KQiyg2kuvU2UnsPVNwVQVPulpECbyhjmGE@vger.kernel.org
X-Gm-Message-State: AOJu0YyUj5jsetVNHLjBcizCxRKQVCiybzYqqCGTn4RWYL4gUMbNFNRu
	j1/pZ7dP7nWaz0hlcU3pkQ78K6v0wudodwpyJZz9vmHtqz5frL7V+l0BcF4J1U5uCFdbsWd6xbk
	LNW/K76q6RbIsDvACORgdIDfc/ErbaG4a7TMQjZm1VILQbveBa2bdfGKpPza7+IbP
X-Gm-Gg: AeBDiesv2aKDu3n5PAA/kalrbQVEodizCX4ZuCH9Nz3rgf4b4m/cHurPdvmbzUlTOQY
	uhJNm3Mi3DzfC8Npdjm7XiHusgbI5tbw1Oc74g/udmE4pVfGzV6OizTEOgJNaWl5AZm7BjX1ZGM
	YuQ50hv/JA9FSswq216dgyWWIbHBPmpdlBJ6NbZoOTsL4Aa+2+ueNcoJxIDpD681sONfZ/+xVi3
	GXgVshjfmULuDEdtVCzGrunJJpBjjOQ+vMW2yffLSEgz4KmlOzvgDi7A88dbWJYxsdwZdZnQR6l
	9KH5ZXic6tCXi34db+lVz9XFxSXToCt7dB5Juher78zV7bLeyY5tk6gDLFSuY5bONIfjFux88w6
	31Q48f6EWXj5UaVeqv8YVG2iXjgxE2KwbXQraeg5piOUVUwPMnEDbhM41R8NKEnk0BGcG
X-Received: by 2002:a17:903:1d2:b0:2b4:5e85:efc with SMTP id d9443c01a7336-2b45e851a64mr83014405ad.18.1776186534075;
        Tue, 14 Apr 2026 10:08:54 -0700 (PDT)
X-Received: by 2002:a17:903:1d2:b0:2b4:5e85:efc with SMTP id d9443c01a7336-2b45e851a64mr83014055ad.18.1776186533512;
        Tue, 14 Apr 2026 10:08:53 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:08:53 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:22 +0530
Subject: [PATCH v2 4/7] arm64: dts: qcom: talos: Add QSPI support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-4-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=3130;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=IgTiK3VQikktQ3bhdHhNthcHJWHKgEMDAuE4IYnpRCg=;
 b=Hn3jBnJEy35TwQL8GD4jT82pIKQljdG4waTae8kMtW6LSnqDWiFJGPYp2dGHEFR5z4Y2RTi9B
 XkHSGhd3U6fD/pBWDgB2xaHWxKjA8IE1L/Jr23jfj3l1DmQ5ei7AXlq
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: P-pWaxHrGpvJl-rwx2jA7ePhO7OEc1Sg
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de74a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NWNfpJqe0LLSB_FnjTEA:9 a=pZLAQvCjzIbhQfNp:21
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: P-pWaxHrGpvJl-rwx2jA7ePhO7OEc1Sg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfXzaZQ7oz2Um6b
 hQKw0pikKGkcK0HxjP67lyePTwBZCfg5Vv+NRXlZLkKKFLOiADcD+p4PjfoFSMoknYp/JgJ3do4
 r5Q6hEsklfCEabF2IOwuyiCZn4E76aoToWiNFT6UBGzdq9lGAeThezs7u64Fb3STOSJ6oDaxfOE
 Kx2Gxx/GheFUfMEF22D6ZLx/jvnrP7UGxifq90T0yjb04gjZwnMQbYfZtxPvNlH+3ZXZfwDF5U4
 iYNeO9hs1AaVnDg0vVQ4hV8F9RVz7sbQjckB+5NmSXQKJYSrECRSJfw1jUX1FZ0v01eNMYSkPgH
 U9NVSBv6rMay/D2z562cpKI1KXDM4QFbB72xBVXFr6IqSZml8D+qM9ZiL/GPK69gVTWLh66OAyV
 a8uRVwP0iXxZ1zotQ2Nm9i6qvKliZ1u9FCIQBTaRfrY33M4ttdzC8xLe6Oqw//AmH3hwp3P6jw9
 ec3wgeqQNrjdcfYm8AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160

The Talos (QCS615) platform includes a QSPI controller used for accessing
external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
the QSPI controller node to enable support for this hardware.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..9aaf69ba333e 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
 
 	};
 
+	qspi_opp_table: opp-table-qspi {
+		compatible = "operating-points-v2";
+
+		opp-60000000 {
+			opp-hz = /bits/ 64 <60000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-133250000 {
+			opp-hz = /bits/ 64 <133250000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
 
@@ -1553,6 +1572,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			qspi_cs0: qspi-cs0-state {
+				pins = "gpio44";
+				function = "qspi";
+				bias-disable;
+				drive-strength = <6>;
+			};
+
+			qspi_data0123: qspi-data0123-state {
+				pins = "gpio45", "gpio46", "gpio47", "gpio49";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_clk: qspi-clk-state {
+				pins = "gpio48";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_cs1: qspi-cs1-state {
+				pins = "gpio50";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3682,6 +3729,39 @@ opp-202000000 {
 			};
 		};
 
+		qspi: spi@88df000 {
+			compatible = "qcom,qcs615-qspi",
+				     "qcom,qspi-v1";
+			reg = <0x0 0x088df000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface",
+				      "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
+
+			iommus = <&apps_smmu 0x160 0x0>;
+
+			pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0123>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x09160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";

-- 
2.34.1

