Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E05395ADC
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307237; cv=none; b=JVusxYx/eeoacbMw5Lbj8UpQmpn/02P9WRQWpa/oWrpQpFM6WCvMqVBldyBA0BO/CE+wTfu0v5sGbCL/18CbYIcRwencWiamnARI9xYinwKd6u+zbAP8Gq5SMDYG3xI8Ur4s3uG3l0ueOj2YXmPk1GIxcd12BJl2apKbieLevC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307237; c=relaxed/simple;
	bh=docfPpUXnI1XHz/OPdL2Yqjd7jogAI8PSdedpaSUSzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnTVARkdLIfz2t/b0wn3wFlo6oxTqPWtGEa7CbKWNqI3BPrfnzBIPJrO7nq/vL6Fg8ds14V5VxPj0xxQaiM9fVtVdwjVFBzQmKa2GiX07/EcGrKCdE2CYtUOVkLZ14FcwTPYp3N8fE5r9/FEN0B5Bb2SEhsHF5TBIB3oN4qUj1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9ryOJh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaIFQwc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9ryOJh4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaIFQwc6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6519Y0Fv3372585
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 09:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60CRMLwoH22MNuhk43vWwIeN3bSXwFAvh1cnlrI6z9M=; b=Z9ryOJh4vNQVtmxk
	JR2e68TNAyMQEm5TZPX7E7YplmiBGGLi6PwgQ/PDDpjdSpLRZAM/VvS/KNAMwJWq
	/eis4SPu9oITqsZjztQfNgp2TaJ20ODaKiUAyy8uwbXfAbRJU5LARuQOvGkGACnk
	S0yPiK4M9rHcOTWZerssJMFEFUoCeRp+dyihmrRZ129epv7LoaA9vUs9ynnQ5Ixn
	N8K+ZkrO/xVFKiHXkVBSv9FmUTs+2PwRp98qRhfjyjRgRVtAnzEH4QKgGSorkjRS
	L0TtUqkh3X/FV4Pd2xWiWdFHghHcE/Ttpl8tAClYl49R+4jDUxz33SKNSrxLS/eT
	O1tEfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh81sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:47:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d13328dcso200665871cf.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307225; x=1780912025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60CRMLwoH22MNuhk43vWwIeN3bSXwFAvh1cnlrI6z9M=;
        b=PaIFQwc65lakYkb3a2ZeDTi5sWSIC4QQangAXzlo18b+GOtiVNaA8V90/FhaLWUJl8
         y8bkGV/kgxRJnIhZXiTHkzzPKzuVvq0wWe2VzfRlz0Fk0fUSdStpYKzWqORmN883sTQk
         0wUkTihNuQ9Rt3KiNKdMbMBf30p1AN2dfPg29v1cywVf6rT+qQFtJzsV+GR+FpXo78bQ
         hCTG/Tp/WKITW2+3FFfciRWI6C6zW3kgf86UBOu35DGWpAao82FJQnpwH+s1BcSs6hgC
         NXN2/UnZXm6pzQn9rcqHdjm3CTehs38ttBDJzaYOBhO6CUahkA38TFF1tNENPa0/XNeW
         XidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307225; x=1780912025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=60CRMLwoH22MNuhk43vWwIeN3bSXwFAvh1cnlrI6z9M=;
        b=XZXdIPxcM7bLpJroAdHi4u4TtcGgmgJLrDo/XQiJUkVSycgl4nx8yy1gsRKqvWvY7d
         QCicLMfuoT1W4jgSlNve1ttjc5jnHm17ZLRht8Pii/NeEbUeyVlY1HxCQAes/zdw+MAC
         ZaG7FyIo8GQXsdMPrdXxr5ON+aT1PHnHxjbqVCayurrUXAAMx3kkJk5qfD/qdU3qgIFl
         yjYdMr25VsJCcbkn6tvrR3JIJGpwpfBWEMWsN4AO6FvTQ0vNPNk8z1eiFXc5EkEDsTaI
         FflYDSvAfKUm8xX7L3F0iLKfRJI5js58yDuAz9Gsr6YtpHXWCuTw/YPlZfcBhCU4r8yq
         WmKw==
X-Forwarded-Encrypted: i=1; AFNElJ9rlbeZyaol5VpYyQ/Bu8QMt2/UbqBF5T/v/OxDx/XkDMIyuWhFgU4MDRh0c0OKgFTRUJVKcll03KVr@vger.kernel.org
X-Gm-Message-State: AOJu0YzqBl0iq4KJZOPftrmtYNnMg6nvaW94RPI9r2mFvLl5ZkXpptBj
	AEsUKECzvgymftnBnlgmwkIYJoM/wtQwxUZfIUfnsG8nmBE6qdad7CYwLo9yGyW3p1dVyBhaSKP
	/2lq1LhEvJDyZpz+u4k5tlGd5mHbKxtNt8uAtOObjqUHyl4SH/lcn3osV/QJZUJGY
X-Gm-Gg: Acq92OEr5F1S1DjCK4QB/8rWU7ofnIJgXBvYO77bxjh+qrzMYdZypvr9uULEcC0yhKg
	BPNvl1HeDVICqUTzyl8vS084m1BIWxevyf70J6GKJq6pdT2f5+wotPqq+O7sc1uiQLubPMewvcQ
	lCWJWfW2SPmUI+8GrbG14d7nKqiqRS1KzfMogVL+r0AeyC35IQfAQ2Hh+m4yh9ylas3mT147LCJ
	1ys65k6a4FSgjGxMmoSe1comiX0p8eoo2q1HTvDlAeJr6irXlq+rOCCWt4S3IJgOegzzAu9oicr
	lrk2yOqxsB7VAEKq6oxIYN0OCtWM1mKYx0p3bo4psdB//CTJsAZPd6JAjrwN+tp5i4o337Nm1uV
	romjnTEm5d+/MoqJWTs+dGAW6P1EsKTyJp3u5FuZBhSN3WJlQi/S3qweHkTfYk5/HCiC5A3OJn8
	Y50Ubg+J70TwGSMK3IC7ssFmORMsG0469vCo79JCxsDS/SuA==
X-Received: by 2002:a05:622a:356:b0:509:44c3:5ffa with SMTP id d75a77b69052e-5173a99136bmr153697841cf.52.1780307225006;
        Mon, 01 Jun 2026 02:47:05 -0700 (PDT)
X-Received: by 2002:a05:622a:356:b0:509:44c3:5ffa with SMTP id d75a77b69052e-5173a99136bmr153697521cf.52.1780307224560;
        Mon, 01 Jun 2026 02:47:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:47:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:54 +0300
Subject: [PATCH 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=docfPpUXnI1XHz/OPdL2Yqjd7jogAI8PSdedpaSUSzg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVULFMkz7B2KUaWzp0dMD3c4J4pOVHVAE9ivW
 I1u0vWVJ3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCwAKCRCLPIo+Aiko
 1YjxCACZ15J4fbUYzTAR/V7VUO95cRXGAnVEZVcCy9aRNacj+oQUbM8ZeOdKuCyhJJWAlezStTf
 Z40uMUE31aH7GftcJ8ijLYgXo6cpShIy05Ukm2kP5bvkratPZlxmtFGeLP43Cly2zxsyomVS2Nt
 hsYRkrNvAPlOYmc6PBoZw+kumrbJ6D6kzmrTEkm0PtFWENsETv6++fKoWLE1bmNlrywi/VQYzX2
 OnV3ImkPvtNEo3RjpvwaKkwCWfepEYablX98ZLwpNK924P9pAs0lUbrsnnV8FmViAKO6VLIu44g
 MCP4Q8gomOSy+Bsgcu1i5McYOgaT7JFoBDMf+XZ5Zc1OI0eG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: plSNYyXW6sHEgutWEq5xnTZBNEfGnDIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX/W98BLK4GBc5
 Ubrj5I7TTT4ZV5Ax4IJF9Scf9kW2JZ6v95HNYzXZXeM97vm1eENOn9BvsyuVE2NrEvter8X4QKi
 jAR0PHa/7v+/HTIbe7djcOU4x9W6FODInXZ0wieXkBgRkwTIzpcMvIc756yx12gmNmlXN0Qa4pL
 3Pzb2ZIbPMAehOh8x1tQ5BiUsvOx560l3TzzSH8CDfSgJd6a505oU9l5GoEMPCw2OpTux7aZ44n
 onVWkFQVQO6VT5rqMJ8LORURLi9B2OSh5ShPuPZ2jOdFUqSETBL6qsjqtFw/B03PqT0ct/er0PB
 OhoS7LMOxhfRrXRG61rIqC9j+NMBhfyVvDBkLla/TmAXR+85WfgCCON6K6+n4YYysfalfHC0JGd
 PrHmf90WFGaMnHHv4KOctVqvIkQ0OuqinAay/5BoVDVRq5wS0vMay7TMb8BLxOxoiehXON042ts
 HpGuo1wDvHtaJKRqyhA==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1d5519 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=a-LFHBoeUMMLBGfzAX8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: plSNYyXW6sHEgutWEq5xnTZBNEfGnDIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010098

The recent suggestion is to have PERST# / WAKE pins and PHYs in the PCIe
port rather than RC device. The kernel recently started warning about
the older style of DT. Modernize DT for SM8350 platform by moving the
entries under the root port device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 18 +++++++++++-------
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 12 ++++--------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..4973a3eb11b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -493,12 +493,14 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
-
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5b_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -507,15 +509,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie1_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index eb2a795d8edb..136daa444865 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1596,6 +1593,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1692,12 +1690,9 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1705,6 +1700,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.47.3

