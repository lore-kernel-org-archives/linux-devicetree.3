Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE25404BDA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090148; cv=none; b=D54W5Xik9qnkAGvraCa4pAVdyOrFqDORLib3dncsiHawRbCVtCNX+WPUI8ydZ+1IbPQkVon9m32EtkDXobJi+V0H4wJgsz6Gij1a1F7oING8Ue3iAkiJW91dPFCugRDvj5YABj2f45opRLzQ69jrKXJDgZT3p+AIdOSXiBVeml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090148; c=relaxed/simple;
	bh=6dwL1ftuAckcO+MTkZWogD22aGYMRTsgNT8APAs54s0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OVsvneXUltn7N2RSqOgRpIhTYAuTVvzLCDU5HhFJIw36A4Ln2E+iCe8hWJqDDmCYrC5bXMCVSBIstZF0hmtzJz+bTW/1Vah/UQ5lpucc9pSVZSzE3lbEmo/mUO9p3p5fSNNaONBVz9XSnwWC6wwNg8ZRKT5LGNv5mclkSDMjAM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASr16nZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUP906BW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASr16nZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUP906BW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A8wtCS735625
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PyGrPV2eIi/
	91dO4T8/qrr0Wh15rlxzflEwCOTwJI90=; b=ASr16nZq3H0MPsF344dp1mVRCxZ
	rs+/2IAu/+dlPeDk6LtwQcZPgevBZmBBm2zcFH5ubUySo4JVFUA3TIw9GcuDKrWo
	iXlJeRd+lT58MOxx7nTo2nF3yMnI/lYQ2LrGauzuicr8qpZcioIKriQKa5YCvjNA
	2aT7pp0hCrXzQHQLqBcEN08q67fhL5A46kr2tJuuEl9XJ3l/tRe98/pmrxpDMY9z
	9DwOh9NpewiWzvVUR2fYZQmiNWV4rWfxsaT/OenOBnWJIOeNmN5UgoF2tdGgNf6Y
	Jsyk2leyPkRlE63y2WHlKJr2IVC7IQXgGK5pi0h/03Yf/uQwGkBIvOx/Yrg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1rhnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32faa62so119776735ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090140; x=1781694940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyGrPV2eIi/91dO4T8/qrr0Wh15rlxzflEwCOTwJI90=;
        b=cUP906BW9aJDoUZh+75n/fitJbcuplKAFjfdL15DdLDM/gHSNnMHnIkLuXSlzuw1uH
         buO04wJvQLQUhYwmrCObg1bT6Ao3IOZEVeScKGfvykryZQQX1G9i6CGSSs6o3NrpVJuJ
         I7WhZ5xGXH11M/Ke/GT4l8BRP9Q8PiTlooKqTivr9d1AhdKZ1+NAjcOVKIRvv/Qrl3ej
         yfX2gLsFRePcWB1h1Q6tNY/Tfhc6xHSsnKLv1meQjBHE6TPPoNUnX0op7Flw4fOebMlv
         uiq/gL0qpi+VgBYqkPV/SsGlnAC1kcS3sPITVcf/uHuWyPtLLshcLmfUvtyIb3zIMdRR
         HhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090140; x=1781694940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyGrPV2eIi/91dO4T8/qrr0Wh15rlxzflEwCOTwJI90=;
        b=EjBmVdj8sLSRHQHOdM7xvI8BgPkE+rzl816YwXQZnW1sVOcgSVqxcrVDUlBMv5iaTY
         CPAVdwiWgjvSjGEJCD08W/YUJ3ATsxYG8N2NaOaN9pz76lIrLT2ORTlLTS52PqDi8cSu
         8937iITD2Zl8T36oqYOpf6zKgHLcG5csTcZ2ZH3dWY6XRbX7iWEMa4kteQaRTNFODcyY
         CNMrxnAKiOXJl5FVP2UFRQS9N8NMRKG61Bs2M+4fg99htnds21efcutMUxDW9j4ZSJ/e
         z16KE0p8aui6Ec5LK7bDwBsNeuIPJB1TMK1VaVVE3C4lGQr0VGQfyf3kuGfzL8kly+NO
         HsCw==
X-Forwarded-Encrypted: i=1; AFNElJ/Qevk7hQEQ8jJ+odCUfUAXsLrTWH5BesrPgaypIXu/ADUH3qVY7oEulLGKADYRs1yNj3sNWiOYGRR2@vger.kernel.org
X-Gm-Message-State: AOJu0YynvS8kSzvyikJJDCI/MHvc15U0b2Wgf9Ul+OeplfJQrFNw40Uo
	cAo+5k0HUsG9h6ShZDH6JYk/7VMknSR70ByDGP1cmjNzOLGOmYoR7qQ181zKVdN2y44d+quHpvQ
	7shIE3zNckAcpYAVJTXNbuMMtRf/n1RSZjIj8WfjnI9AyarJLQKKTOrwICCOWzQ0U
X-Gm-Gg: Acq92OGclvIX+BhJBBJkAL1a2gFEXg9sKl2PkY99s5Qgbt0eTKStlOiBhxyv1vY/niH
	UjEYmgDztHZgqpwnm9E7fu1PBva89bwWm1C4Iw4zOXpwEZExB5HVq3FsUJoC75ADObJ4jIfMhiB
	XRN5BauNiCNljMNpE4H7KAsi34qBFUHkx0u/TZGR/NpjzzCDv7CoSPb091yL6AGGww0tKlc/2ko
	Tzwpr6tb5dqeiWXdwxaxJNnOmHK7RZZl6+ovht0hP3yd4WNgqGqHxvkpnaUvTXlnA+AWE4rP31B
	gv1E9c1m2WEuOFH9f59afWGTmR8BTF1juKeuRrw0GgmFxdhHoycPhMDRdLRWLLAIXsL9kuiXXD9
	BmpN8HNSJqtuT2IOUrSSCtEqe1EkCstKuxs/ZjwNYd0fCxw/aHy9pf0mxI3E=
X-Received: by 2002:a17:902:f711:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c1e85ad8d7mr291813475ad.33.1781090140403;
        Wed, 10 Jun 2026 04:15:40 -0700 (PDT)
X-Received: by 2002:a17:902:f711:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c1e85ad8d7mr291812495ad.33.1781090139428;
        Wed, 10 Jun 2026 04:15:39 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:39 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Date: Wed, 10 Jun 2026 16:45:08 +0530
Message-Id: <20260610111508.3941207-5-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FgbpwNw97SpqlMuVH9JK-VdcHDfOLIvg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX3EdIEzWcOjKY
 TgVxpJTVsXzygSuBnxsv8ZRCXJQ5lwwpoX2eeXDPujPtYvdTJkOil8zlQyVTsyMaJqAalMDaSzs
 I85SlO744Wor8fsj73DMeK7fMXwWTSs3Mc09Bp17SukBYIzqQZkL2xx+r6EK7WJ+2CuAo9dw9bY
 oTQ+VOKLS9vEcaLHQhWBO37ZJ4kI6PhgaIWMw3+58AQ6apQh3UOwuJso+2quLYCAYsWy1E7Xcp/
 yWGf8XEMbAKwdnyeT1N56JCNfF5XCkzA66iXeLJ5IN/r4yjb1qWFIvr8KLdjpxTM871CnvCyIgq
 Aqf8xMj/GODlwbrKf89L7qjiMEDQbMT++1quzWjUIPe99di03hlW7n2HuRGPW8V8pNPMC3e7EFV
 mrcvEqDW6tPXD9CNkjjkh8whqX7CAXwRxMh19YkrJyK0A3OPJ+sNYVCIuIiYczyxrNDDDtyJ3OU
 IyLKdE8Du50CBvLFqjw==
X-Proofpoint-GUID: FgbpwNw97SpqlMuVH9JK-VdcHDfOLIvg
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a29475d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cZ9xF4wsGAkAwo1J854A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100107

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
regulators and gpio-based card detection for the platform.

Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..f68d27429440 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -427,3 +427,28 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9b_e0_2p9>;
+	vqmmc-supply = <&vreg_l2b_e0_2p9>;
+
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 221 GPIO_ACTIVE_LOW>;
+
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&tlmm {
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio221";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
-- 
2.34.1

