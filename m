Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2ED3B9DB7
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606133; cv=none; b=KW6chiFippmaH6O7kAKD83/iuCn866SNp2zQTe8EfZjvtL1n8kOW0X3fiA0kjrNTFDSx14VNaTlbw5jTbGiWvisAIJHHl9Hj3zWYWxOBUvKbgEfCZ5kiSgns9K/GMMxF2DxwQdOPPxYsHtopXSMEzRo99eyK58pYDUH4aLSOEmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606133; c=relaxed/simple;
	bh=+E4tZfMlel36uwMhdXbJ+b8CyJSQUpcuObNpX2cZjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnhTSB7yzqAkDjESv4zNRA382eIFaV89OesYbmGuque5Ay8ZcUIq7UEdTwbjVHUFTsZw81YZsm3XfmcuD4esHn56eYg+sW6qtex8CAtxkJuo3HK7MyPhvV0xVyapsalEm3vMIilumGNTc8uHF/T7E11VQ66FKffCqFyjnbhGlF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzGjBRzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAMOkV0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzGjBRzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAMOkV0g"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wGme2538644
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=; b=bzGjBRzPKq0WeUgR
	4coIioMmDv/v0MxlXMxV0cWX9PJnL3zwpvBOE8Ax7zc6qu2FyDNOFxeX2AUqjgbK
	+7+HPB1TtbBn7OpAzP7jKJyAMNTNEtGukEDpe4fb5TyAHlKXY9lweoZUDne/E3Mh
	0wX81ZZDCU9jyZ0VeQodPJL749tf+OuwMaCdRecumRoA/gvX9TkylqKcY9HEpbUl
	FMVBSse5uNRw6BtQLiRWdzwC0J9ZZGcokVgoYKcEKn0o/H92lB6Z+wlB7N8b3XY0
	pdor+ZZO4uBJX4qxHNqth8wUcN8BR4w7SfZ87CJ7Nw+Y5MDbPjaOB+dCNCXZtW7O
	2znv/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883kftx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso39027515ad.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606131; x=1775210931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=kAMOkV0gTlrmNfGnJl8u1fueNFLrxV7Znh6twiWeYMrc1bffgj7/rBAzzQr2iZ+T07
         yHXRcVNnDR4HTszjRs+SFyzKAaVFXqqqgoXGbBdjacE44A0NteGpjFQuqe5gKkeRp+nL
         zIAUyAB20CTxr1FGkNrFRnJUoU0h38MMafBkK7bupI0hJqxRxJiq1fxMGIgSm3t4Q7l3
         4bdYa9uNrFeWl9napLYM2XMVygF+6HcehHilo8Fva2kcb7A3k4A/qQ/H85Z8MDRFxqey
         DPCMIgG/lljMBcvWntq7rU48ygVFnqBhHC0OVQasXn1xNtFT1CPQiif0csJxTZuuAqLv
         UFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606131; x=1775210931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=tRWUFtFAaub7Cv/7lDwMUojuJQVkllxngPOvy6foUpkJukKDoqZOPuUlgRgdCC9ERI
         h6HhxyCRRrfk5P2BGOW/r8CHli+cQIB4aA+cvp8pOUlmD7DEa/o3/DkKbKYMrY64sSl7
         dwH3lSDY10ngJgg0VdhgYMU/JQ/1Vq2kV7TQg6FKn1k9Bwy+GPXViFhxhy+Am7CG7QYG
         SCZPF8oPq49Wgpx/2pFsNrrt6pA5BsXwNLwUA9lBfMqY2ynu5zc43wvt8S87qhYNTs7T
         pIEBtT0I50i4FCO4AnsOPlBxVQ8IQOEZ8MoWGFckenvrUmaHEKcs6BNxOqBEZjbwrwFK
         ULLA==
X-Forwarded-Encrypted: i=1; AJvYcCXebqNDy5YXtBhcIB6w2FnTIPKbqEG/TJddfcGx+eGDUe/g3PjDbSjtemoqfeJd/VD+hxwyjgSKxsp7@vger.kernel.org
X-Gm-Message-State: AOJu0YyBC1Sfe/YSB+Jy5ApL4A5jgwAADjbRBdycRLA3Q7YnAx63lA8c
	XcKG9nbM5eY0MBlGYTSW5ewUfSUn1HVNPJDD5vwp0T3n6S9M+LBPp55fS6nFKe70WOtT1DkDrN0
	mJ/4r0cwaZDuFCOPPQ/8b2zVLjjOO7S6vja9VbvqJXZeUmf/JC0p+j9tF0QDtGqCn
X-Gm-Gg: ATEYQzykoJ1g2QWOGkjfPy4rwAWoDLoGvajWtbH1pdJiOe/JR4ER6djxPJciGIYZc7t
	q0f8219eSW11w+gei8Rmx86QyfSLQQ5sMlrxnO1DrVwVeGWkwKwimeRuTLZ9/5o5mx2V9kOHNp5
	vD7iigkPTiOW0EcX2k9kzPTit+EinDig5Ef6MyTCi4TBNI9+ussieVCnGn4k/jOJGtqWHNmka13
	SYESzGSoo1SjQ03xrIAWTy5yo0NCU/RBayPyyGTBzC3LkgO2nM5F0BmiesyMXyXuXM3OgORmIvg
	GUmjRL9iqRXJhpBrjhfx9q1WpxskwtR/5ScQqGRguYXkfOWiZF41yGX6ZMERdaswZGzxvxoHct5
	adFF6n12e+nWvxNg+81AezhxoH3tM4Od9ciVGYQovRozKl1dkhzGIFVQvn8enP2g4HWYB/SYeEd
	Nwd+qS8vKgdtLKKm4bEjC9nRwTmzgV/V60ew==
X-Received: by 2002:a17:903:1450:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0cdcb7d29mr22984335ad.26.1774606130776;
        Fri, 27 Mar 2026 03:08:50 -0700 (PDT)
X-Received: by 2002:a17:903:1450:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0cdcb7d29mr22983985ad.26.1774606130299;
        Fri, 27 Mar 2026 03:08:50 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:49 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:18 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-5-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=1627;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v3xhy4TAVQzMuukJtx0ZPXFz4/C8vTU0vk3Dukc5Tss=;
 b=Avf6Q2NxGSEHZm3OYNgznndDtNW26jckaDRb8PQjiSW0DrZKPl8yWhVikJmF+aj2DdUGI0r5f
 HNq/X0qPYKkBW9ZdVsEit65pTkYPotbzgRlRbXqqjTIz2YiXrAVwNsi
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: a94yjjC_WkCo8ZcvmDoez0-VRuXJ6f8q
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c65733 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: a94yjjC_WkCo8ZcvmDoez0-VRuXJ6f8q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX97CTY4mA236R
 pPJnBnr6tnrbPLpxpp7J1iHR27+JxgpxkP6HwZfcmOep3EejWARiBf5lAIXaZ6O6S5zK0fFwzEe
 4qxYW8+Z4qz2pG+QL9NdFSt2EbPoqhSVn1YUw1gJD3DeSdvlozb7YeR04kUKDglvne+w1k7hzcf
 Z+oyQIbH9TLlEGqGGRI+ykn8d3NvHL6ZAeJU1+sD9TrEUcTPthR4Om7LgbrWPyxOZgHlHPC69ms
 LYAATemFXjnwPOImKzuiF6mw2W5x4jM47xdD4d8Z1srrEdBQ0/WFp0rTY2qSYPOkpt/kSLnerR6
 D0qEyP2TM73OzSolN0D467bBge7725BzwwKPdw88KDtgCmVAFffjQ/g59vrc4Arg94g5dBomXI9
 7COSuxFVH0s9bh/pc1r+7h3hbk9Q4L1njOMNIcQ5boVkGN6zparVHxFsOMknOQVy7o/RA5xXFN0
 9yHoXtjfO3xjY/FbEMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

