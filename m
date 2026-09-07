Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F04534A5
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775702; cv=none; b=B6g4TbIfnY+zYOcZtoV6qPm9b6Czd7JCX/Nc/HJNMM7VUkPSKIAWe3v89bHy9H9CJKigQpLWT74DzNjdXwRWqKjc582clC+xxFHQnt41PqByofHw7pL1Tken5UUHEBQACoZ8UNRA7gEVQVUckO6NPJxbdLj1j9f6zLe0TnhTybI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775702; c=relaxed/simple;
	bh=s1k+cVzV/j5wJ5Wmv4Oqij6z6aC6GduAUS9wamxgIFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJZGE+1aEBbdHrk7sHpnjUVkMKiDZq5aM144avRj11+IJ3eu76ZoIQnSlGEd0hadYUZHfuWgTQoTGa3w/5R8MrD4Ylo05/blUItJVGMAqXd5hpnK8PvEajOlmJt0pgGiznFTHF4DziGUp05JeUkMRRZQe1UvJaJCFcBGaIQsYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxssk8rp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeIsPoEQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxssk8rp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeIsPoEQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879fvuv2502841
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=; b=mxssk8rpUCgMX0TQ
	XrwcUAwJJ+JNo1gHySj4JphyZAUO+ZjZTjyUlwpm0cg59bLCCHQs5uS1VI5RbJOR
	LUbO6zMSgSGuDp9SNUPLJtjhYom3nrrLYJh/rjgMLP9CT1nJNbZ2Hgd1My0B/5hB
	/x9FQSJMI5V9iTdjp7J51HpR7GOE4uKx0vDEwgMkjOJUulKMNHnuc14EPvdfeRP8
	VbgMuoGab5vH0lN8j6F4S8XB9bOUPxMw0D3nwGLSekhQa5p4GW/lDw9bvmD5Vayo
	yibHIz5mn3S6QJgpx+ddiYP2ZpCQVoVaqtsgNznZtI+Pf7MTl9LWM3Dyj4OyrIrM
	YRnqTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty04ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:08:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so4775481a12.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775699; x=1789380499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=;
        b=VeIsPoEQjNkHDOWb1YGLUukhQvWCb6UARpeEbNjFy+Q78NQU821uHsw2TnkqtVVtZA
         62HNLhhhGZo55ykT09NkS9ysGdJ4J2iX9XCDxcGqvO0xyP92pDMqlYppdDN6H3XWT7q/
         EC/mZTwaqHnkR/K45rHS7JO3Y2RtE/r7PwglwECI8WEWM5KbSoYTRfXVbwI4c//+zdPl
         G8NN0HcUZT+7tVYEluE0ofwI9fQxJWGlCSC93NNrOnT77RCEXcQIgn60/rPWJs6ptOIq
         VGDUx/wG+qMf+fiDxqknx5C0MCifHKJdsDSckM+GrMsGw1vsf8SKY70DcynZqfMHFSsO
         uQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775699; x=1789380499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=;
        b=at71ezKWiXDqdqKfARdZyjaRaMPQA+G1Fd/H0CQYxpJf559guADHFPoGYl5D7A+cUp
         /uoZQ7olhb6j/fc6V8rc0LN5e2ZsrHGFivfAHIp4PyX2n66s6UZoI90AFflrNpqIuXa2
         nJFAr+kY037ihekZlU8LzzHdvcZ69vztKck9rt1wLJc456+ST4Aa5755QM87afSnxo+J
         gEXvE4ZbQg8/3SrUS6IkF8boyjFgCVDp/oRxrmwora8w039YT3jPb98zpoLTQo/efmqq
         tQw3ienunwXhchflmBkiPshVnM/EOVDFdIg9lBQ1ciJRsFh0qaisk8DzSqa6DH4Qc6Z2
         O6Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwGssjv3As4/q+bty9FpFPW5reRqYl47V4Zw7WBgRex/RMLukXL9n4ZyULYUyUXRCt8E1v7HpAU2Fpq@vger.kernel.org
X-Gm-Message-State: AFuF++kAH8uhBLLdRv7JD7whtOawC2yu6tXbbDRYlwoXIriMzzNHsBD8
	LkYYT/Fddhdupl3+wht1k+hBvKke2EfT/q6tNxv9g+EK78AfWIaEYuDpYUwwndXu722D7WtEHNg
	8uaYIVezWjZOSrl3o9kVbX0zJK06EMNNILDSAPoMXm/27Sr5mBNXxWZvFqdu0tuUA
X-Gm-Gg: AYBFou19Xxu0Qm8gTVOn+7TJ/ZkZfsoCBiIbjsXaX9S4XpZzecQOdVt6Ga3KZt4GtOW
	2OVh0mHqo7jgg+OCPvvrfIZ/DGYHSk8kOvJpe6X48qkx4409qKvb3lS8j1g6IF7lq2iKnC4XF83
	9vSIbPaRt/+aV/LPi+s2S++THwdqxiSLvpcKw4HjivxL7FnB6Zn0/SxaXD2PE73UQa401t08nRQ
	dlLSXkxkyeWmn5Ei4w/whUS4yMG/4CXoRTkD7Z7L8gtrFkBLLIsUoKYG9ZwayFXTh+ocY1NpbU+
	EgOkj+N1TVBUPQxvufguC4bKsyXba8JmSgd5AlYSPuJilKHRw/IfhZc54q7mhNqIcRQPrgcyAqR
	Xpd0/n74IfRE7CboBx1DOY9YAOelRlk0=
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr32826937a91.1.1788775698785;
        Mon, 07 Sep 2026 03:08:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr32826881a91.1.1788775698277;
        Mon, 07 Sep 2026 03:08:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:17 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:48 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor
 on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-5-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=2342;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=s1k+cVzV/j5wJ5Wmv4Oqij6z6aC6GduAUS9wamxgIFc=;
 b=fLYaMBI5F8WLbKPlcwg0ELZOzXImpcc6S3hdsB4QofUNRF1ZjdlBZzFzF/Jq/WKlaSL+HBrUf
 gedWTwHWkezCHGr/VdZcbm/eyPrXjajXT4y7h8M8aN8UKQAYUEbJ0Yq
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9e8d13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2OLIcDlHICjy9cVqpt0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 40GdqG2qo17XA-GjHmRJQUzuALS2N350
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfXzTdSvgu/SvSs
 22xqf9AYJYRhFK15gwnO0LWhgJZJwVd2+LbNvSpDoppkzc7BGuNtwdsEckvE1M09z67x4Q8xMan
 teBMKmqmCvC7yTzqUk+4a2yDPgT5a1w=
X-Proofpoint-GUID: 40GdqG2qo17XA-GjHmRJQUzuALS2N350
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX9HayQGyfaeKn
 WmMuSu77CikcWo8qwBIVtrrsyhZ2tsqo9yPGpaqYyhrnv4ha9ahS6RCz/YCOBfRTlY/SP4R3Icr
 pfhl/hYIhsH+6ZkYS5ye/kn6TcrjLxh0aRqWfgfis55iBDZM8IMXT1IOkMxBk9OWi1Q2WsG7nxo
 /L7kv7pQRkuXXwcnRxSCwMQFHwevdcXHgtpYvDydDL5qO9qjSdD+90oha6Cau1mdVrapGTF+XFj
 gPiHo5PG2bXSIYLWVVxyzVRpecCT4KKq9OH6L6mthhi+YNAA+dOfXI6bOUEpvBBvXYMq73TMfQ4
 f3UiRnOzQmT3XiAJwDUIB+Bpqk3Puej8RRJWxRQwKSaGiHcXTIP7RRCCX3K/Yw5xo6DODIM6xA+
 3ZBSGlp0x2flwr2oxQ/SAaj8gafABO0oXJgSjpfagwmBdAKzTJZ/HCyr+ROg4wR2YxfnGun1gs7
 PUdjzWb2p9G7oaieNrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
CSIPHY4 in four-lane mode.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 68a191890b7d875564080d9fccf85ae9451cf0d0..af65d739676743742c36ed07fc554cf34f34a36e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -11,6 +11,7 @@
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
@@ -589,6 +590,62 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_inep {
+	data-lanes = <1 2 3 4>;
+};
+
+&cci1 {
+	pinctrl-0 = <&cci1_1_default>;
+	pinctrl-1 = <&cci1_1_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 239 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk4_default &cam_reset4_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		avdd-supply = <&vreg_l7p>;
+		dovdd-supply = <&vreg_l4p>;
+		dvdd-supply = <&vreg_l4p>;
+
+		port {
+			ov08x40_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&csiphy4_in_ep {
+	bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+	clock-lanes = <0>;
+	data-lanes = <1 2 3 4>;
+	remote-endpoint = <&ov08x40_out_ep>;
+};
+
 &i2c9 {
 	clock-frequency = <400000>;
 
@@ -1200,6 +1257,13 @@ wwan_reg_en: wwan-reg-en-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	cam_reset4_default: cam-reset4-default-state {
+		pins = "gpio239";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &uart14 {

-- 
2.34.1

