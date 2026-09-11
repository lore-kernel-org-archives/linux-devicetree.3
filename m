Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D44756D9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130185; cv=none; b=DacJPUilqHUHOqMJhOpKMkNKskWIb9hSCXmUwyEYPAIWhFY2qUSTEMbWyq6X9RABBHCPWh5jpttVHJ+r40Ki2O50zsjugdKtMXzLsCR264DChyTFJvWJvaHVaJ+zwzymuNxGLJRiBVJWAVumUwr1V4tQKwWEJtZzgh4INIX1L3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130185; c=relaxed/simple;
	bh=v3H5ZkNHV36erG0MxtCb6pxoYV7neyJzdd3gUEk9Vxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=riXayll41LwWjcE5XKyM1Xb+SaATJGvLdYZIxCILp0WCdFsEgVJwgo6PPTD/TsH9SFUm1H83yCR2tmk/dK92HujW4OJSdwxtMysumHp0Nc9dZ+veppK5U7w5qCQ9yDv0QQJ+1dV+oUszvf5k/Gs+1qmWLRytfreDa4OrjktRYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oerqMIrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bk7VMPqu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oerqMIrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bk7VMPqu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqCgj3885667
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uHHyhqlf41DimyNYjZw66Q
	yVIWBkLDkAbwH46LsGtBw=; b=oerqMIrHCRV5/gF/+05XuPyFDRcQEu14T51Sk+
	qt0d8/N9tOBEzMNkFyrPxwLRRTQmF2yeLmeh31NMPG7IjUuOP3kusQIVCybjj2pw
	46YYnveyEnn27ITlIg8RLTsmF1Mn3GtZWfcRvYCwk/xBV8aYwjqY0tRthGXFuGv3
	VZujD6peBu8itg0wU+NEMeTpQ4ylsOPXracQi2+Hdox6p3AE2k4vbbuBFoKjVOUQ
	Kxt1QXIKMYJly5m7y4N42wIVVUwoEnHnCP5Lwj+7QjL9sb3c0w2wfQGvWiieeE6Y
	yfMV9iFT05E4xPLjGTBFo1twOg6USWRSuAcCLnSuj+XcS68A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr9pt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:36:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fb956002so10799945ad.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789130182; x=1789734982; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uHHyhqlf41DimyNYjZw66QyVIWBkLDkAbwH46LsGtBw=;
        b=bk7VMPquaYzsKC9xg7WkT3iZ3x+GEeG5xHC7BHqv7ExGN1lTdME07Wi+vMZXR4ndFb
         KPOVIG8POEZHBPpftvghAn5o1P5OMA647q8bmgAJasc757BeFBdcFCpA6ye+QfvWmEy/
         HjTdVMRrcv/bd1Pn/tZMQT3IaZ5H7zMpE11w6K5o7wYH7Tf/97W0SwRFjbFMphyZz/ds
         y94mtPNV03hGVuXeCUH9nfQvScsQh+Mir7ePKtNMdwGF5zlBlCmGKA44LmF1fkFzhgWO
         ogCS0cwgg+L8mFwk0uisLikbKf3ZHfJmRch6KS1/joHVDw/EPx2hyVcSoPeZiLX08Hdp
         W4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130182; x=1789734982;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uHHyhqlf41DimyNYjZw66QyVIWBkLDkAbwH46LsGtBw=;
        b=mgDdbqLCFi47A0wWCYDY531XzHllgZo1+Iuqi3mk06X5sLqiXHSe9eOr4npLf0kK/r
         xZ6XZC3KC46dQH/2W2xGExmVNXRIuVpvGrGvXU44KfsLq84uRZ49QijAwWgurZtQBQE5
         0jG2DXif4p9edgiW1vbAQHSpFCaPWVybEfHYkPZheNS/6XmaoPXKmcKdvNN6hRfxUE/X
         znUEIIDXniBaBLxoVh0JRBycqscv2GH0BxmBdLnvyfBg5SD5oiMjnqtsDqOi1qClaHjJ
         IxCABPrrmoy7+tI+vJyxoRVkI0FrOvRJFLDcW/PZyHWI1eAHVIgGSNSOutE0Pmp71zJh
         ZAMw==
X-Forwarded-Encrypted: i=1; AKwUvByl+JnO7Q+kBu+MuH4WQudU3BssSmvoIlhQrqoZhPeFQyGwzh6+fggmDoMSa5CuqlwsD42nYq8fSUqa@vger.kernel.org
X-Gm-Message-State: AFuF++nOcwNkB/YdKtl71cG0bb2Rbw2C2PiDTywmJ5XVvO2bW4CgDnA4
	fx1o698OH9skm7lfP9BrJ/rwXRmElMbL5r5RwhybQpOlInweZ13a9javSStBr0DX+whQL5OHL2i
	na3plmCLYcLHQi2FSGzBfVL2b4LsVP+thm+BdJUIMfz+ahN8Y2no4yMlDX+n3II59
X-Gm-Gg: AYBFou1JAUNA8oq9ahwRpg0/6z0pLdPqLFVvJcc2vkRF7VhysYTaxJdIZxHMb2CEi/l
	lHwSuYPvZ7dP1kYYzyuuaa3yjTAT4UjS0G/LOSMuME4LOuJenHQUHODTHNaI0tssJvGG5Xlhe7I
	et+Shm/dWwYoZhVVnJk/JbpGvTI5Wu+wA5i2c58NYTH97Oe3OgqBPb685NihNRjB3LDZvfsMq3G
	a3/HMPcvt0nd2iMw5gtZbBk6x0P4EvBw+WES9gwocMHqbxiEq2K2HJaohTg+8i6ibmIYmBeBxIN
	rnYuo7xNEVRfsBIVZ9HkA2pxFNDB7RPB1XkzZGAMuuTSFO4bLmWLIct/pMBeJjd7NqTSCPSVa7B
	Z4POA358WL4mGAracH6B7iaNzZO9A8TM=
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr6880090a91.24.1789130181821;
        Fri, 11 Sep 2026 05:36:21 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr6880009a91.24.1789130181283;
        Fri, 11 Sep 2026 05:36:21 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bb0119sm5360258a91.2.2026.09.11.05.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:36:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:06:04 +0530
Subject: [PATCH v5] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALP1o2oC/33NTW7CMBAF4Ksgr+toMnZih1XvUbHwz6SxKBhsE
 lGh3L0OXcAisBnpPWm+d2OZUqDMtpsbSzSFHOKxhOZjw9xgjt/Egy+ZIWALLTQ8D2GfDDejD9H
 FRM5x3VBPPSghlWTl8ZSoD9c7+rX7z4nOY7Evj3II+RLT7314qpf27cZUc+CKqLVNj75D/Rlzr
 s6j+XHxcKjKYYs64UNSoFclLJIVCF4jOu/hhSSeJBSrkihSB1YrbQi8pBeSfJbkqiSLBEZ31tb
 C61qtSPM8/wH5qYaWrgEAAA==
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: v3yzh0zKf4NM9F5_YRPpoiLtR2lU_zn8
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3f5c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BLctq3pD1h73di9K4sgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: v3yzh0zKf4NM9F5_YRPpoiLtR2lU_zn8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE3NiBTYWx0ZWRfX/8qfiHq8OGrA
 stWXLNGGTWYBoOXkD9szb7m8S67Xwgrdu765Vfzjl7y3KYRJU07Ul17jmT1EjIaDaQD1sEGkN62
 D/VAZ3FPGCh53hRUTwPw0AovtZ7d+6c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE3NiBTYWx0ZWRfX0ZngeaDboNN/
 QGAJ1sbYJqAfbdS8Hd1I8MzhmRofl2QtbIzUBChab4+i4R0154qTmQcr29iFHNeMIrScr3MwVE5
 2Whd7z3aCPyLSLjDWOo62TUYSZK7AEhatr6+AYjnjrVPx4O3V7q3nkAnNWp7ys9V2sVvNidsQ6p
 oP+j/oIOmW2RSYUxGh0HSVqQNhF/Ia32dXAR1hqxEveGSRRQkQH1ntLTsQ1D/RozK8c23YQKvhJ
 jeYI1a5UtllccDnhkIgF8m/1nIN2czRLRTZ8QJhpAOs8QW8ti9P8fgqqypvno+xsG58trOwRyTK
 mhrgNJIWLzAxBLuCayYPKVF4He7IkG7wt2WKY2I4ZioADBx4W1Q9piMz7E8F9U0DPh4EeaQFxNv
 qGonz/KLSsaXyYELNN5ZH5318Gia1HOMMHKEOQI6i5gYeIHDUy4W7I5TlwjhBqPnnfUnj4fQoJL
 JLCZtKcCLqSeD4vk3gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110176

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
This patch is rebased on top of Shikra USB DT series [1] to avoid merge
conflicts, and there is no functional dependency.

[1]: https://lore.kernel.org/all/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com/
---
Changes in v5:
- Dropped the bindings and driver patches that are already merged.
- Link to v4: https://lore.kernel.org/r/20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com

Changes in v4:
- Dropped "clk: qcom: common: Register reset controller only when resets are present" patch
  - Sashiko AI review pointed a valid GDSC-only corner case issue with this
    change, will address it in a separate patch.
  - This patch is not needed for this series, after splitting AudioCoreCC
    clocks and resets into different devices.
- Added NULL check for device_get_match_data() in driver [Sashiko AI review]
- Removed unnecessary <linux/mod_devicetable.h> include in driver [Uwe]
- Collected the R-By tags received on v2.
- Link to v3: https://lore.kernel.org/r/20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260722, as the dependent RPMCC/GCC and Shikra base
  DTS changes were merged. 
- Separated the audiocorecc and audiocore_csr bindings into separate schema
  docs [Rob]
- Moved the AudioCoreCSR schema to bindings/reset/, since it now only
  describes a reset controller.
- Updated audiocorecc DTS node to use status reserved [Konrad]
- Kept audiocore_csr node globally enabled by default in DTS [Konrad]
- Collected all the R-By received on v1. 
- Link to v2: https://lore.kernel.org/r/20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com

Changes in v2:
- Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
  different register spaces. [Konrad]
- Updated bindings and driver patches to handle the separate node
  compatibles.
- Updated resets in driver patch to handle HW_CTL bit.
- Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 286ea46d0c36..079a1636cb6a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1395c182a2b1..999b478e1640 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -3594,6 +3595,22 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "reserved"; /* Owned by Modem firmware */
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_cdsp: remoteproc@b300000 {
 			compatible = "qcom,shikra-cdsp-pas";
 			reg = <0x0 0x0b300000 0x0 0x100000>;

---
base-commit: ae800ad8819a6d89308031288a6ab6789eb5d2d4
change-id: 20260605-shikra-audiocorecc-85efef073474

Best regards,
--  
Imran Shaik <imran.shaik@oss.qualcomm.com>

