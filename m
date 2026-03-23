Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CED35DA48
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263630; cv=none; b=GaGJIRvZgnT6SMZpGoPkgtPXrFOjwH8zsplyWUZwTis6p6h8p4oUXBU+1cNnl6AcM5IRHPxo8ADuAMQcTz/LVzbCAhjl1OLRRh6iXaADRJI59smGBXv2d3Wlho/GXrVpGNAyjgHCDdU1y4w9qGIk5tG9+3A119ipijJ85Zp22ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263630; c=relaxed/simple;
	bh=RBivVUJD+h5CCKNlpG1JCSp6JTzbV+335BBoc8zMPwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qUWaAs4geLx6I2EIgSsECOM3SpW1CS3R/W4fB2zZRPnSYcBWZP0EWDMmCl+/QL7HCrnEp1Z6gWcs/k7Utw665SCjjCroZRN5Tohee3k3FPvD5axFj3IfIxdzg9aoPoERGPotnmD5ieHtKPXNyLXeiWDLB877bP2cL5Nwr+VExao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2EHsniN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOaJ2JS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2EHsniN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOaJ2JS0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADmZo3539785
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Nb/obKIzqn0aOR5lxwUJngaS+rDj32kWj1
	Ow8Ng0OA=; b=G2EHsniNuiTiaXMLBfHKOXTTuqIMcbC8L20y0lLMBeawi1nfrFO
	4/gFOE800VsyRZAYFwgZQqu7uLz4mKNtfUEmRI/3GBPBqgudrMx/2c+iuksNUbu+
	bBi5vAGHAWI8IaeyB+wl827eh08yuZ+UIT2AXlCL3fHbHm/qlMtLXRuFPCetIIZN
	ct2my368VBIb+ysHDOL5ji44p5dXZww+3Me6ptESppjF2Hfq0n2XoYDT7uLjvN88
	GgLZoMGLhPGk7qFyf4apW+OSFlGVjNVeFanz9u60EvLl6r9vO82DC5bl/O5uRiOH
	PiQvVXpb/w9cokvkC0UuYis18U977CyySpQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30527-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:00:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b04293b1ddso21101235ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263627; x=1774868427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Nb/obKIzqn0aOR5lxwUJngaS+rDj32kWj1Ow8Ng0OA=;
        b=EOaJ2JS0fMlV4pE72Eh4NzUjuq/F8/Dc6d6vLa0MSUShGOQZoK6XmS8m4Eu5yuNcTD
         jqtWGc8eAcQeap+Jla7ZahIbkNKs0WdEbIw4k9eh0nscG1bh20u6Oc5tz153EV0W+bfA
         GclwcVGJrPp6Nu4WW0mVt/eV7TQ+PG0QOCCNyzGRjYzZCGwu/iD43TXkn37lC+yHYEte
         52H/Qt8XUfza8cRLzryBq9dnUjUFmnnUu5v8n79kxpeGfTT0agIZcT5NirABiw0pR7eZ
         8shi3V8+JdQqCgdne7vkqUiE3G+NYkhda1TS0cwA5PiRLI/JHZixHF787wyewkPan8Tb
         eyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263627; x=1774868427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Nb/obKIzqn0aOR5lxwUJngaS+rDj32kWj1Ow8Ng0OA=;
        b=kxUi2jgMKUwykCXtKHEYghXao5n4oI0Xwl/BZ7OHMDCO6x2Th+6DcEInh21VwfbSTd
         qsSo+d1F/Lzkols+vftZfoPf4V8+5hi6LeTV4LnEnXZX9PLN6rHqjfiEwkiKRhwXC60/
         GA9ro0fSHZXgzgx8nLjWJBiWkdy3Rm3+w8xB4Hy/+SgbXEEwBEVfl+4f/y79wMAy+1Pu
         WVAlM18TwTiYrl3HBE80GOpDsXGQncsNYAkotdM9/T8mvJ84Ak2iOubpazxDcbgm87Tt
         79EVnRMFYobQS05eQWfYVhndB6cWspGj5n3usrW5DetmaRv7SReBhE/Y2O64X6rm6nuE
         6PWA==
X-Forwarded-Encrypted: i=1; AJvYcCWgEWCVgODZK9Yox2Lc5o4PU9aknPIEYWglaugYVi496awYpaGc5TBLwN9G0MWx7QbI+9EOTr+SbQXd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6V4kKrkIZEIcItFoK74tEMLA6+ZzUJP1hIjbkxI4D3svG0gX
	TEZUjUQNBHPt9hl7fNwxEQHAx+k1WQUgTjnqPFEKwwuLfPgGCwYrMV9wAlMHNlxL/1++2LKs0M1
	6P8iIwlobyrOdd7NZbQeF7w/y1ahJN/1IfnGjqnXZjKn6BcGbuVzP8eLVry7atKk=
X-Gm-Gg: ATEYQzz57/bV2IRF+K0ivOya85o/KlAzAagU0K0IkDWgGqB/lRC3oJTJkfqEQxGc3m2
	ABFWXh+GuIbxlWAGvC+b6NZq0QKXQJV5TfYJbAnDTQhXkjgwMqxLKvYLBsT8LVma1iWoLoUkACh
	Y9kjitJRu8x3ViU2SKYomw6BdrFKjWy4Eh3PilFZrRi5QK5k+2KQJe1o5GDs3EP1sUbP7ebt9LM
	HgHSt4VL6zjiOtThXW8yRKzRK5i4U6H5EB+9tEOByNNYysUj46F4zZf6nOAekQi/79vreXB/BCS
	pguAoUEg1E4a1llYlo8T6HVOSYtxnlO23HXUeh+gDsfbob4aZFlCdm3u10L7+dnFUvsTqTyqHoL
	3O5KjaCw6RkCBNiWjZpr6NKFfYbMq0imOCuKfKEE2zG/jUOpXUZt8
X-Received: by 2002:a17:903:283:b0:2b0:606b:6fc5 with SMTP id d9443c01a7336-2b0827be4bfmr68664035ad.3.1774263626697;
        Mon, 23 Mar 2026 04:00:26 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2b0:606b:6fc5 with SMTP id d9443c01a7336-2b0827be4bfmr68663785ad.3.1774263626190;
        Mon, 23 Mar 2026 04:00:26 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516908sm134571075ad.1.2026.03.23.04.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 04:00:25 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa iot evk board
Date: Mon, 23 Mar 2026 16:30:17 +0530
Message-Id: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c11d4b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ZtXvRwAlPpC7nlbJvkEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NSBTYWx0ZWRfX5Mtl9zPnruk2
 G3fi/LgTz+kii35DCmceC0uVGZ+FYFNJVKfTANNKPrUfWHiI9Nfg0drSEPWrAPWvz03ArE7eAga
 T7OLMZVlS707EHPc0snBb0lwJXLEZgMs4dWpmj2sukDW7Y2pcjuV486a7dycx2wka8G6jLkggQP
 A9e3e2P1vIT3F12dN2j4J1jRgFtuDKugcZL8/mRHdUYojZ+8GaHIw1HlFUE9Zzu+0pC2jNiBKSX
 oBVy9RjSXb+QXr7qwh5VK+vgCjdAFY6WHMBtz7lKyXCm4ySSi747D6pbnce8eFzwbX5kXynQg92
 8F841Tzmh4Kw0+O5RSiJcAbIAA9cTdn5VSLTemsSs5faROVvE0BTE7xhgv2xbmqWO7cC3Ns/tWQ
 E2PVOvsnRq2lNx0UikOTpxN5O9x/yxqBllnarea+D9YXhxrLubgI+Bwax6Yx6dvWI6eL1sGgsNa
 Q9C6cGwvYxv5OsjH43Q==
X-Proofpoint-GUID: _Kb1W5l42Wt1Xf-yvSizocG9lFnqExAU
X-Proofpoint-ORIG-GUID: _Kb1W5l42Wt1Xf-yvSizocG9lFnqExAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230085

Enable SD Card host controller for purwa iot evk board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index fe539b1f4567..2c1fdded5672 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1180,6 +1180,22 @@ &pmk8550_pwm {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l6b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &smb2360_0 {
 	status = "okay";
 };
@@ -1362,6 +1378,13 @@ rtmr2_default: rtmr2-reset-n-active-state {
 		bias-disable;
 	};
 
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
 		pins = "gpio188";
 		function = "gpio";
-- 
2.34.1

