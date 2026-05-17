Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A939023B
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029794; cv=none; b=B64Pu4Tl8ClXsNXQwhIJXtWXaktUj7TMjsNJU9cB6gQF8a29iiIz5Ko33WteG5myzRyUQXZ1DlZKAE4Mk+i5sQo+0Yb0aIkS2I1XFJmMdTw+fjpuFze8reUBkchS1v5LULjrl/bUlekYjKka+LHoQT24e9NqzUQjv/oDVTk+Z44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029794; c=relaxed/simple;
	bh=PZvjo6kwb8gukBk8Qt21liCK6ZiRRKVnfKpO5rJeB5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEQEPfnyb0I75+NXwd++lSa1fgVvHhIcwMSaKlNhdHYEjYl1H1O74MbdPloxr74DUBT2UN2m5Ipk/UwyEmVqusmX/d/ZNxpky6D6huCBLdStEHYm+GRtbY6SX2KxIcn9cghBuFHCRIwjz9IGNUJLtJi3DSwVUI+IMnTD5L6PBRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S75Drj6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L55UPUv4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S75Drj6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L55UPUv4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H9R3od200840
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ocqDJuL+p2EGTcf7fuS/tX8QNWqZgAnaSZICCzZ6PM=; b=S75Drj6xexpstJmg
	Tm5bUI9BKV4Jt1598TqECzX68D+yuByVIfWYmhf4C7Ab16N1Sb4hec4/PquXSsRh
	41ZzdKK7HIHheVvvCA2Vpx2ZqmoWqyUqxZk5rwCeSo9jBx3IyYqUlqhOYCWnP8R0
	QTSKQg/Zg00811xwZ3Tu3BCBPHW7+3TbLXJuF9vqo+bRL8MoRbod1uWelwxWrrKT
	f7SQiakF7LGC7L7X9uK1hGxpJ5eNR23mcI3QSR8Z1ZQJEdK9xFkh7uLxV0XluZYh
	FzWhl+bFhasx4Rjfrb0wSUIQkLvWo1BVPT/55+vqOeixWewg8r3cHq23yaS6+67z
	hk8BPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvyu1tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5156c85538cso47773751cf.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029790; x=1779634590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ocqDJuL+p2EGTcf7fuS/tX8QNWqZgAnaSZICCzZ6PM=;
        b=L55UPUv4l2VVyk1MsbUE/DgwbFN84y6PBov5bwA9/FBNTD88dtBfGM9mLFLcVk2C5O
         nx05hUZ1Bocz2OslX/z5JuxdKsSNxuWGXybzsZB1r5uTxnvqjrYhwOvUUol1npnBV2nr
         D2eQ5qNSLyqOV3xpae1T0Z1bcWDBnMi1aqg1deGf42UFJnC/RwxSukF48CIzQtHHKQab
         SZq80Ct48hEA0HZk9A2JIOGJkmUvxAKWbNi+A1qCi5/8O3kIvY5sOFChF5XyPWuh9LnW
         DfERqIbAOUSsWLY0opFyu3rlLLf4erX8NBYNZns3iAYOUBUzkN/zekAMyq+QjIiVy/NP
         QM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029790; x=1779634590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ocqDJuL+p2EGTcf7fuS/tX8QNWqZgAnaSZICCzZ6PM=;
        b=jOYi+apXh4jYlTwnbreUsyTpMvPpzj0yYI+4k3ExQx7WLv6FKAgPkDMWwk9DiGk821
         FN8U5XexW50iNP8ZtFgEbxVvuyqO+4YsLClAs9c3b/aKmzMbzYjrmGdL2Fo1HEbcDBjD
         G8xPFFtvjz8o0GIK4YNZwwdFPOeLJEIQd9xnuR5kk1QwJ4TQpCMseAtwuBMY0kF5IBWO
         qAQdKU8B0jk+1hTtxiEJzUy2tfi1DdGHzJzJrucoaCqEOWoSvYV5wDiTz3erjuAgJH82
         4uFdPk7922RzjsiTUD5AnhxyDK/sWv0NVuLx6LFEQZY8GsGoimjD4PWiHUi1QSL/HumP
         +jXA==
X-Forwarded-Encrypted: i=1; AFNElJ/9laavQ0nP8T8/dr9dGuX8WzV1BDdnzssipr64KX7hbMKOoBihafKvHMHUcvx2qMKjWHZg6Ju++gnP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9U1TZDrFTpMi8+BUKiKC5gwnsU6HBWjekkBWA0SLevPlBwB15
	2zg1lWnQCLyHC1XzpJwyLLuFYtUGC42f0joD43JFTLTVbxQN4I4vZhDOE0p/6+KUIYqcaqIU7kd
	7zDjU5SHWe5QmMmO3BXBjvBBtpPIgBa6C0GCncnMp1g0SMAu9pZmmL2hC3mNUydQk
X-Gm-Gg: Acq92OEklgy0ysF9NjoHpyvCGFHyqhH+2s+RNuBCEgGAaH6AHezXrZo4rxKtezdgT4H
	bG19199AtiBm91o4vENLWaBEJPcFtkKF9PN4P+NavbdW3fV024w+GFBH02bTE2Hr9OTsoj7Mxca
	zh1yyrR9tlxg6Yp0qgBdWIuQ8lecTp5HYAsT2J4e0ulVNMHKygnLPPbp7SBwig1nm10koDoq8a/
	gsjP1YzaTUdCd3lYpOSJ/sGfF803S8koMpN+s8CcvAtegIWhbhSMPryImEZ1ySMNMBzMiu0F8rM
	t1h/7a/3qJd3RqrQDakkT80UK3dd1e1eZfbIhjnY4r+E2H1PSdWAXflmlWkegHx7lsMHJr0XTUr
	+kVI+yWFCiuS9WURjuI8jwjLUdQI0RUVjy41xUCZeIVzzb6WTivmtesFLaSISRN6djxXRKY+dyN
	tqVu7WmuXAiM+fuFhZOpVlyvM+wuozf+m44No=
X-Received: by 2002:a05:622a:590c:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-5165a0a179emr159536311cf.34.1779029789903;
        Sun, 17 May 2026 07:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:590c:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-5165a0a179emr159536011cf.34.1779029789499;
        Sun, 17 May 2026 07:56:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:12 +0300
Subject: [PATCH 6/7] arm64: dts: qcom: kodiak: consolidate IPA properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stanislav Zaikin <zstaseg@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZvjo6kwb8gukBk8Qt21liCK6ZiRRKVnfKpO5rJeB5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcNv0T9O+xRyoLUOsK7njhtDIDpXsz1i0soG
 a7A3aF5SgCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1UbcB/9NuxRti02NbAp7yN5y1+Gya+DxpKEDW9I5GT/IGzuRrx210uW/3H+9jyCnJFTbCfQVQbe
 hwe1G9Fq3idAetBx81wolplcr8baJDs3+vLa2yGBgXTVGQcyxVWujxoq3ub5c+ueskgF23vOjbJ
 VRLbn2QF15ae947wvhvbSvnkneDISHphn/vamiTVvWv5BaLd1vr0BgrVlzLDdrYZD86Q7T2J0Ng
 3gKPT372cr1eO5MYcv7d+/5e+e1ZpHKx4IwuLOIhzXsNs3ZybW+xEcfwf9HgPjb+ZdyaV/2/fqC
 217o7B9iANsDhFP/8P8iaH5d8qtu/3NKDH9DlCphmCHhw+Ah
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MSBTYWx0ZWRfXzvtrDAO8ySAd
 MzLMti7MRK82yYh0BP+5pwiYAsF76ru/T0dac7j/7rn1pUhTyqa/IJ2uNnrrcduOBlH3JDbM/XA
 PZhd8YT1WTCb/nP/gToX9wg+Zmb72DhQOYzTciJ7R/mwFtSy9MfeJk58L7/2iQxCDRfHohDxqiR
 SNjPgH4itCfnd0B+8Nq5bwNSDsUayoesEPE85OQJHitF+ya0qjFIGF0RhK5PP9Q0LDsD2Zryzpt
 7OBSOPzH3yVo9OSjFkG2z5BmdbR67j3dOh6bm0K7JNMgfFbYFgD+KCBRyO5GWH4mW6lB+QKWvSO
 BSRPqHZRdYtG/q4ZL9qmqK+zlu8u+Crw2DOF+lAsX+Bp7GRRWlRha0pvYa8j73Jd0ZXSXFPvpMV
 uyOUo5gK9MfyKJLPbv3j6rz2+atOpUVssSEuS52KSnk92prEWSlMIfKYVuhNd72dLwR2xHKf6vd
 a/WmRdxzEvKa1Hdzcsg==
X-Proofpoint-ORIG-GUID: Q8y1arWeVJGp8bnm-AXceLi6SL6XtZBG
X-Proofpoint-GUID: Q8y1arWeVJGp8bnm-AXceLi6SL6XtZBG
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a09d71e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Af2afE4DUFKw3H6MaKMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170161

Move generic IPA-related properties to the base DTSI file. The herobrine
has special software configuration, so delete the memory-region property
which wasn't set for it beforehand. Also delete the property for several
IoT devices, which don't enable IPA memory at this point (and don't
seem to have IPA supported by the modem firmware).

Co-developed-by: Stanislav Zaikin <zstaseg@gmail.com>
Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 3 +--
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 --
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 3 +--
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi        | 2 ++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 3 ---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 2 --
 10 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c51beada8c7d..51a0ca3bbe6b 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2642,6 +2642,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..aa7c525237b9 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -913,9 +913,8 @@ &i2c9 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/qcm6490/fairphone5/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..fef9fb51642d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -501,8 +501,6 @@ &i2c1 {
 
 &ipa {
 	firmware-name = "qcom/qcm6490/particle/tachyon/ipa_fws.mbn";
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 797f37596bf1..1398a4dfb037 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -553,9 +553,8 @@ &i2c13 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/qcm6490/SHIFT/otter/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..6c1a73f18ec1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -504,6 +504,10 @@ &i2c13 {
 	status = "okay";
 };
 
+&ipa {
+	/delete-property/ memory-region;
+};
+
 &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..7de63ee37a84 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -653,6 +653,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&ipa {
+	/delete-property/ memory-region;
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..e701cc39210f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -774,6 +774,10 @@ lt9611_out: endpoint {
 	};
 };
 
+&ipa {
+	/delete-property/ memory-region;
+};
+
 &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index b721a8546800..ac89724ee099 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -22,7 +22,9 @@ mdata_mem: mpss-metadata {
 };
 
 &ipa {
+	/delete-property/ memory-region;
 	qcom,gsi-loader = "modem";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index 3c836e196b19..d94571c05a59 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -727,9 +727,6 @@ fsa4480_sbu_mux: endpoint {
 
 &ipa {
 	firmware-name = "qcom/sm7325/motorola/dubai/yupik_ipa_fws.mbn";
-	memory-region = <&ipa_fw_mem>;
-
-	qcom,gsi-loader = "self";
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index cb59c122f6f6..7db9ae1c3cef 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -971,8 +971,6 @@ nfc@28 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm7325/nothing/spacewar/ipa_fws.mbn";
 
 	status = "okay";

-- 
2.47.3

