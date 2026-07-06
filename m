Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991D41A76E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347265; cv=none; b=h1PsC9PciTcgeWQg814aBCuUS8G1nXRZkew5ZaxZbBNDznaAttErFtlNOHROyuxkyj42Xea8QYJWJVRfdw3yWZfWhFEAAHcu904dyAj6oOLJLYmLczRZ5akOneEiQ8VWlEiL9Lbep178ZnoUnva6BVAzoS8TNJkSnEairMUjYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347265; c=relaxed/simple;
	bh=++Jn1nR487qrfJxCIQA2DErxu0O1PAxMcZqTtrZPzQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=McRsD/YIQj8Tti0ffizJgpAZVRlVVDAtIQN5x3IreKdr2R4Jt/cRRpVnlkVvCdjc4MlhxAbZRQCW8DD5BLyAD9oDWTGq90qsy0BcP83lw+3L0+hQtO2CfE+95DIq/pC7vTwBRDdluqxbyowekKvGYMbyWlAVr6uOQAc5ExO3k90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmWcRpaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp+8MLA2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmWcRpaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kp+8MLA2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE5tD680439
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4oHxsF1MHj0
	DkD5MAp7qBNYYGmAA3TUieSbrw1Lq3Ac=; b=EmWcRpaGgZQ3WVMXFIRKWc0kkae
	XPgu7KUNVbe3eNFCCYRyZnpIj7q/kYgp7JU39TDXyTtgSNVLSOj2vNzhPJinFEGB
	/RZ6gdroakXmw05FznLeIj/IqUGfRi0+kTRexH/UVLQEKB9R6tqleSF4gcTI6WeS
	0qqtYZspCKL9lWanKe4gPacEiF4rCtWzQLk5soP2W/Ugcgr9AuLIlP11cT4TVNO/
	gNxXgXZm4r/o4kKFk5WrWGQmp5DtVjHYqJ00TUmlD/+BBGIlVS4IZfc7zUW9K3Lf
	RLrt3ZSHezd3wXiIVsWmst61lo4jEu/zW6xHplcrgrjutqzO18UaGJ4TQ7A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89d6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:14:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so3084987a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347262; x=1783952062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oHxsF1MHj0DkD5MAp7qBNYYGmAA3TUieSbrw1Lq3Ac=;
        b=kp+8MLA2AOtIzZcKPDf3OjA/f0/WEUiIF/3auh9WXKiU69GoOtuyIZHyUQ8UjMTr4Y
         kwJLsOzhZxaOtB11+pqDt80KGt9F5jHrkKLV4U6FrKwoeNidGpRJSsarXAAlN58eRJsC
         DpBIZPG2uB6IV5i8Mf7TSJ0Zxf4YgBsdSDUeOGL66861lLSJ2f5a80D+0sFN8r7IasZw
         3Cipkao89EYSQjxA4yvV2OPoGPf/ylDDijW4pZ2A+wdtGxPStGo3GoWO8Atf+FpAtcBy
         bzVLu/xKV2i7BefvoQC7KkjG6a71dmeY4iTeU7wJwaKM6ZThc0VMY/3AYTXOcqw9RvNL
         MwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347262; x=1783952062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4oHxsF1MHj0DkD5MAp7qBNYYGmAA3TUieSbrw1Lq3Ac=;
        b=Gtyc/4CTYWom3qjYHrUtsqoE2j4evhRplyIzG+EnETNXRXvP9GDgcFB+dowAFhzzgl
         dYCX/SPlLG6GI4zrPBXLp0hOuw3ZsA7HuZC/oJP3hOpixzLchPUDXPpOszCfOlXqRt9F
         ufl4lYxHDNzXiL/1TMylYcZDdRGCb7WNzFOh1galB1y2xDliHzQimXFNe7xBkl0sbSUb
         vtC94jsw/DyetOi0ps/FHGmCf45KxRVI94QjzWa0aNFxGi3MbEEGEJJUqM0NWWTIrRYA
         K0ToeYA9D6yZ4vsT7MCTFFNOAPaWvmpBoxK39BP3oLuVPuv7loZ8nVOaaIrMgTLcdgcp
         yD7w==
X-Forwarded-Encrypted: i=1; AHgh+RrpLQYOOVD1GP7kj68ozKdlwZjO7XBNpxjy/A4eXCEmVJNvDO3VuRARi9ospn9puvW9DIxMO85lNDSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoFhst4B9ax7j/b/p0RbtxRhkDMgIKLLGep1l3ExIuh6uizcA
	7wU8BoQXlUlUsInZb2Ur62P1N6zIMAV8e5IexygjEAUPkAbd0SK+CwUz7QWFhQcCeVyqPpbYLg5
	RUaiEUAGYQ6+6EeV87yK2xJkhFkqA1jpFdIN5wUKbH/0rF1veIt31UjTxQj548sYM
X-Gm-Gg: AfdE7ckovwAIf/ol9oNf6epUC+u+WEWFsKSpVAAzV39g5REqINXiA0LrOg1cmEzs02P
	WiDUCO283vrG2eHJrGThPGacWtxHiAMKfoNn/X10DvIy2T+IOBx5uIxU8z0L/nN/J+G7Mauv8AB
	eNkSxwgHTiFYEUJKPMIE+XXrzy57vFJzTje5VNSv3poqhAmbUpijS2XNTOsbI709VtW32au92j0
	MEVD5EuyjWEikML0zPKxcuA9pvXXS/HfI2TkPrEopZiKe440pQjPiEa9pkdnVt4aQnSd1mlbwJ5
	dchh/Z4NJDeO8w9tbdUojigB2Lt7t4KsQroKTtSVZdG+o1P6eEGVMz2kE4a2O2hy+m/FerdgJt1
	5UAxOyxDDSfOvpPsvvod0f1AJslJDPYBhpZcKwQ==
X-Received: by 2002:a17:90a:d003:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-3873dc644f8mr832725a91.10.1783347262480;
        Mon, 06 Jul 2026 07:14:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-3873dc644f8mr832654a91.10.1783347261987;
        Mon, 06 Jul 2026 07:14:21 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:14:21 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V3 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Date: Mon,  6 Jul 2026 19:43:46 +0530
Message-Id: <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX9P3v9ZvWivhp
 n9+oLb2acPO6dP2ZBV7YCtjol43szzQneoSXqDWY6/tGeQE/srtN/vYEw5PGduHZmqwPfc3qQP6
 ST6kAcFT24timuOelJrUNR+8LNIQGo4=
X-Proofpoint-GUID: PkG-Dsr52l-kdj47pmPfHWRm1vQsyp0Y
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bb83f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BFOuVXoWwltGLQr-ouQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PkG-Dsr52l-kdj47pmPfHWRm1vQsyp0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX2t+SSKJEihnT
 aiVSngBsFEv6pKBZ5jExyOVS4eUrx8xvgjqqWX7hC1xx6NiTIjPQYD5jpUwSbLd/UHPLz2Ggc6O
 gfOaQHPQoskhYkjx5S145MyF+o8Nh7JcYEWenSAz+OIFe4K0BJf7tjovaXwlx4boADvMNdIa4Je
 mm1Lnr0jX3lVY06hKtfGoEq4+pklev4/tF89iYOA47GuYw07nqyqV10X7ahHmRt8FWDNHSOQeNH
 Gz3NDHiSqEzzidYf9TTA20AxQU4sHYoR3HZc3CUbAy/6c8LIGNetc8jxMHn8euZ3uyF2NMFJ8qd
 koMOkBLpQeoGWZW3AGZaUYkhb5kCAtafW5tkOjCjOQMHlrM5L6pBlXH5PE8rehgEVsYt6vAb7cV
 FDuXsDNfMSBebc8wW44FHkDUkiAD+KDsj8T8Z0QtCtUlm9sLXG7Soh3b3Yo7tsgj746/buyXsE+
 iXuj4G6lluFaNFEglUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060145

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
regulators and gpio-based card detection for the platform.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..48407e47aaca 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -268,6 +268,22 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 	};
 };
 
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
 &smb2370_j_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0_1p8>;
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
@@ -319,6 +335,13 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio221";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &usb_0 {
@@ -427,3 +450,4 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
-- 
2.34.1

