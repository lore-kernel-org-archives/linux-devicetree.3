Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB63A48F1
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893971; cv=none; b=IW5XleyxKHgNNZ8rxsz6AluTX1B2FvgDyXI/CXHdCy/YlmqCJs3vtsmqyTO0qPM0TYEf45/KO9nnIVXGW4gTpbFIblfLg+bpiy/ISr7KE25g7fptmiaJAPaLsu8AOLx92hggVemhN6eOTCW79rWDPDJjYhx18PXjISvdJ4nshYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893971; c=relaxed/simple;
	bh=zOe0PoFB06W7bv+xQ3kS6/KxYjU1YURvZ/8yB9Exrfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rq29/kJIfQWzlqqpJNmoQn9WsaiEAyy/tuh6R4874ODb1uBOuu82od5e6Dwy/Yj1xg2nPFcHq2gP/qHO37kRjml8zp9roWUt1sEW/c6xtTyk4BC9yUETcou64pon4S/F+BJOlCVsWzXDDBbMui5+dMdEJAPuEf0egS/k7ZgNF7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5lNQB5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daYD7YwH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5lNQB5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daYD7YwH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G2lH456074
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YmmDw2gQT6d
	hJFOum3rKwnU0UrognhoNf14V4BrZFI0=; b=e5lNQB5Os8bT3jvGWecXQFo6roZ
	jrI1n7Ivb3UkXObypUNcUBJe5FBEzaaIL5CpdptLVCWAPc9633LSQouzI/6DwFRD
	rIUW91o3Inih45OBC9+S78i3Y01vjPK4aPFFmk32zxZT3oy64G1VwBwgICORHo5f
	XhANqkwHzmWR0sYlJjzyEeMGHWaAlRcnOuMqGoCVBNfWcSeniKyTcHXm5i14rP2K
	b/PG6yxQQ3I/0nrlrXicGArNY60mJpNKWrKHWHElEgJYG1QYSQQyG1w14NQukfkx
	CWEuLe9lg4FSbmsH1r6KyUQIlIWpO6+ywwly6kHzEBkBnbiJSY/mtUF+qjw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwayh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:19:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8479b7c3adbso457057b3a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893968; x=1783498768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmmDw2gQT6dhJFOum3rKwnU0UrognhoNf14V4BrZFI0=;
        b=daYD7YwHxcoCfzZX4joONYMQqW8ILbirs8q/zTpZ8abCuLXOU/vPI6RryqGYXU12h6
         UR3+awV+jB/VIPN+ina5XFoFkMjDXsck4V1moX/g3DkDWVKT5bqAGORXXRP0AO+mjxOZ
         xWMiLPPsfUr5Amhgt83UrWsGo9c36+tGH5IZ9JrqcZm4BqmwdA5vznRCXtr+BcNtbTod
         jGa2BMbTcXHfHdD13+FShA0Px62Hb2Bp5TUHJB1iHrWtkVCT6DitAc1z9gFn11vbfTTZ
         bMvE20a1YEcimQJEJ0KngeLuPWEdKCtGk7eD4C2qh7RsFvnRbO6iv4OhOb9PFOo8v3jS
         XJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893968; x=1783498768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YmmDw2gQT6dhJFOum3rKwnU0UrognhoNf14V4BrZFI0=;
        b=EkP6ELTE+/aW/+GMJELmb0In1AIUYv9NpsAM6q3CTQBJEoS/B/cgTgMVrB8j0NlCKF
         wNDPvvBiCNeXuJAyU4wbkfC6vZSuCgfP/nn/PvkV4sohj6AoPHZXsIXanr+1zdtSHcQG
         +4qtHsfJrhmpHxDZU9CTuoHBbxVPJJSSwx+GOeEXs7ECGFpp+j+y+YrcFgSGUMqw3OqX
         j3ysjkLr/TP3qp3Md9Srojd5zViuAehKW7ZWJuyNnZlGMlSJbFTrQhh53UQrLKkfyNZC
         OPV+lvfpn8bJHm7RpLoG9eTnnxCD0BoH4hh1WdGFqYoO5o7yv4Fu6cb0ilfsG7V8GMjP
         KXXg==
X-Forwarded-Encrypted: i=1; AHgh+RrS9LzALUFKNASqNirkptfylPLt95dZMoDJI8BunTHLJRSW6ReaFTNBDejqZEkdHkwPeP/bPG2z1H0+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf5PyygD2enldbvjj6hp2saFXkpdm/sjtDQWWG6b7t3Rv+f9vd
	PEWz0i9blUmPCLV1bhcIpcSOE5ito4rv0iWHkOfZxRerjHi9QdZzunuTM96/D2SrGDbnPjgQHDC
	wjF8Bv4TqlkMH+erRtRtxyS2N9dn4k6Thi5yhzJepHr0tIVpGxAH3VOd1ooKEZb459fNPSJJH
X-Gm-Gg: AfdE7cmayfd1SDMUThBfBzxOjAyNuIjjSV9h//m2McHaaWFAYaHSHWJQ6HbkhPAhFe6
	DPIi15z8d80JwvZPePnWU3xdW0wlz0jtPS6BZDyueLrqUVJNv3VFj6VfNDWNelpvkVTHyM5MzF/
	6zBiPCXOpF0hnwXA3xAOch6/dwIosvrb6RHYNsrTgavb8o45KI0rNkxbDP+6qoalgSnlcrZ/T4j
	bWV5p4jRHPY8iVJiTWE/NMdP9gJALiGytW7EP+GRQkOskNBS0Hdz5NGanJ9fs5vTKGt28v9Qurc
	9ypJAUXGePW51OexX6BBTFQVLIXnJ4yMkFjdgxDys1MaL+tlU78a80+TaMVxBCLPcKdtIzQXHYG
	3o895VkuQN4VbrjXnP6x5GMvp+6XMvrZVGkFI5FQGreyUow==
X-Received: by 2002:a05:6a00:3685:b0:846:2f3c:3f66 with SMTP id d2e1a72fcca58-847c099c281mr521770b3a.60.1782893967569;
        Wed, 01 Jul 2026 01:19:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3685:b0:846:2f3c:3f66 with SMTP id d2e1a72fcca58-847c099c281mr521728b3a.60.1782893967018;
        Wed, 01 Jul 2026 01:19:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm3611542b3a.21.2026.07.01.01.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:19:26 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V3 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Wed,  1 Jul 2026 13:47:13 +0530
Message-Id: <20260701081715.2580329-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _YN9pzIJxkL4xzR82GCmxCZxNbHtp1eG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX1Esw3b0XsN5q
 +8PqEwAEIWxCyEQiGASzzUgjD1xhUWLskRY+OTNkCS70SVvQ0ImpV/Nae/ZJaILAsjGyib6mRWl
 9fSUigrTGRK0k96tHi4RN/DASSmcpFQ=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44cd90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: _YN9pzIJxkL4xzR82GCmxCZxNbHtp1eG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX/86FB3jRug6g
 sGmNBKdl8cTqMWSBgAhKI3t/SbUgF6smIrBJ9J6FSaLG/NE7XFmxcvqCsW76cYBMrVu2GQJEY9I
 4l4XPrGAGpxFcsMLGYliLhgTPwz+C9feM97XSFRL7X0+J3qt6mDxfItx+xzkMlssvMXrlkW1Z29
 VZdv3e9p1THt1S2Vv7ASCYptTH9kXhq5qplgo9NQbHPbsSY9MNJHg8bDoaL7DymGIZZYk5J8AbW
 eAEW1SbdxO1KvjdW08Nrg7/J2/hdNhPKviydWCaueazuKVLduC/6A6qB9AsOPWIyCcaqKjVNSlY
 Pz/claQgdWaY7S+pf6nwtS8rZ66ZhG65B/lcIwa/wsfjyYp9fEVy2scbOuwuzHV09qgTZdvg0zR
 juVsDFZEIhuvxTzf8JmWg9AroPbdgu9ze3Py+1dH9OFnwTvbtecVa+PAa4dQZoFGHVmEhWeg2vm
 UHVRm+UpLYGxTAbAcNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010083

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride and monaco-monza-som board device tree, as this board uses
the controller in eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..6b146fdd6ebc 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -275,6 +275,7 @@ &sdhc_1 {
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 
+	supports-cqe;
 	no-sd;
 	no-sdio;
 	non-removable;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..e82cba350842 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4832,7 +4832,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..3090eba0317a 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -719,6 +719,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1

