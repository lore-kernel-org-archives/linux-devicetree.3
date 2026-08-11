Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F543E073
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455435; cv=none; b=tubxNFvH2RX9mddzTjBHl51hMQoxXfj1bccBFgqANwoqkvLlslP+D5eIUasIK4zK1iG3vfdw6oAo7T030tgm/v5wRrUVIFW/j8GI6XxazhbwwL/styZHoahLkdTsmgWzCeF8MBYBTfRin5RsryXBghojcLZZqwg+ClzhfP2v5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455435; c=relaxed/simple;
	bh=OgvA45S7BomJuZ3hzF0inRu2w7pfCRKQK7IzzZZMeCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bbPCkjii6JkBl6iGqbqhURy2kIYhD8WOqqv6+Q3OFCTRZ1YI6DA/fgK82aUrcpRIgfqo3zrjo+4AJfGHSgPq+nwxVZ4WErynlROO1rV6GjlEBYePi+LX3MvIyllhA6baGt0BtPlucCuyZvelbxRI9La5bgxo+udb66GPcmkUyRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7mTrf8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ac3fwg9S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7mTrf8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac3fwg9S"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWt5Y462116
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3ya0fc/RLUMD9nC+7jravg
	uqz6qEbiCZQ/UGzGzn22A=; b=C7mTrf8awMzzX5QtCkh3NGTihoCL6rdh5CAeLM
	Ry8VG8cdetXIUiOejlc2P3UzcCJ2U+fVRTcNFKNr0bAO81xA/FsVGojim1M5G80e
	a+DTShjajeVCk6kAaggKtl+OBWPw85gdY2bRsps5OFCH0E7NNAqLnMjcH5ORzXtk
	+LObsDcIlvEpcRiEC6CKDEadjTze2bpn5e6xP4FrRfwdnRs0KLpA7PFWXOCyyyI8
	tVALFuZNUdpMBiIBdFQXLhqJu3XoCZ/jTQ9aYf9MCr8ALnglgGPqmeAg/h1WgdO4
	PNgz+oDWFRqfM9/hdWTc0Kpy1hFjWft86hHp/iYWCzu3trIA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049mg5db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:36:55 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f1da5e5b06so4587736a34.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455415; x=1787060215; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ya0fc/RLUMD9nC+7jravguqz6qEbiCZQ/UGzGzn22A=;
        b=Ac3fwg9S5WaB/8lR5wMjZztoinFXyVihPJfLNT472L9E2IUDd65d6HfxwHabrIQc6O
         ESz4zpcRptYGJvuldNguUxiGdp5iuO2AINy6W/hoyv6xLFOub+n1XD1f/3Yv+2mGwkYy
         zKOS4HWEyzYUMabuCuZtIEQPoE/8YFy2OF2QlpgfzAPKRSOihL3HgL4AivmCAdHO529y
         ozb9opEkGX6k5wL/eaFYch73ubFzgr0E6eo4s3Blmw9u7UMpKfxLY0W17Tls+HHG0cY/
         CrBjP2Nx8R4QfFLAU9lzO+iOEwUV+eHAQ2rNQYoWSgKAHWDz+kWxteo7zqH0g5mnQhnc
         8KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455415; x=1787060215;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3ya0fc/RLUMD9nC+7jravguqz6qEbiCZQ/UGzGzn22A=;
        b=becvQ3Tpvps/+GE1zeNz9g+Qbn01htT2SXrVu1ohDFUpSW5cv4WPevYEjoZFdUR4Bx
         B/xcKvRgs1HVADJW0ejLV4tbft6qhCDzbrDQS0sNKCwqzmmBiHwbp86SY4y5EVth9Ke8
         vnOCNhnf31KJCiSuzt3sdH4MUEI7CNHzjMb9kw6zi+s77XFKNawUV2Pn6FKMrn2A2BVw
         nYmss/CAJszjwpg/MHPI3ccTgflGUxu3paVTT6ERB8H2I8Ah2o8ywVuzwhPvJkRmFHye
         jvK8kdW0TBMTJg6ePR55d7DVsbjGNXTk0YqJ2ZLbSSS9BHmgFP8npAxNRvxxx+wtKprS
         4RwA==
X-Forwarded-Encrypted: i=1; AHgh+RprdeZZyS06+Dhc0OXP+YiuCNsR+ciEV1113HeMWrqbgE6ffN597ygLpLG3KEINFhDQN4VDvcfIMgDa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+Ca0YSJqx9PHt1ptIsWk41+bTw+9hxy/5QcLTNRoy46x09j8
	psSiDPzOxkSdBIT/Xvr53C3ppUNsXatFbLX0spX6q/wkyASqhHO3JczLl5K9PhBymR3TeGIDFGY
	9tW84ik+zVOia7MNLC61I1mdjf0D58fxvBqWS9JN6UMySC3R6MVGH2rGgL+acByzL
X-Gm-Gg: AR+sD11mHxdabRbkWPyaGQBNl+RO+XWFd1OODREFM+Cxh7RJEj/6nshrdsGWBhDass8
	aRODCYuKSm8gyJOhAzB/oUKGvmnA+w6zAI9+PsI3xVAm81mK1SAtLD5jw1OMjmoyNod1fT4iGkY
	9l7zYb3uG0nxrXcdhTld3B0kZRbzShcI957Nl3B4P9vnxnOFVl8jMpTfzsT+blP9C0C6dIvE8Ho
	NzQBp39hOw3LrhpMPKH+5Jf51Mcu3q9rGW+WYFbfS4FfeBIL4Kb6pJALbQuK/lxX2Ed+jLEhNbp
	kTPrFeCfnqeQwO4eVTW9N9hccrvK1FJhRbocfPonQEcYW7z8rj12HrtgFPGr2YjFsiR+ECj8LHb
	i5jy8EXaGw+GVz9MHAGJV3olTy0aVMHSh6kz8HEvMxS8=
X-Received: by 2002:a4a:ee04:0:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b0a333cbf5mr1975452eaf.33.1786455414995;
        Tue, 11 Aug 2026 06:36:54 -0700 (PDT)
X-Received: by 2002:a4a:ee04:0:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b0a333cbf5mr1975413eaf.33.1786455414558;
        Tue, 11 Aug 2026 06:36:54 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e1d99a553sm1187601fac.15.2026.08.11.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:54 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 06:36:52 -0700
Subject: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHMle2oC/yXMTQ6CMBBA4auQWdukxfBTr2JMI9MBx0hbWjQmh
 LtTYPkt3lsgUWRKcCsWiPTjxN5lqEsB+Hq6gQTbbChlWctWKTGhHw2HqZKqNaNlbwI7nONH9Jp
 qqUk3eLWQ+xCp5//xvj9Op2/3Jpz3IazrBsp8hN99AAAA
X-Change-ID: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455413; l=1647;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=OgvA45S7BomJuZ3hzF0inRu2w7pfCRKQK7IzzZZMeCQ=;
 b=M2oEyqofV/Q+2PtVCFNN39XClIR82DB7MDyI5taRsNfJyUv8tpHqviswr484w8OY0cXiu1xHM
 o4k2ZXdFzKlADv+lXScNOPtKPbNSlAgjHlssF+Dri2v+s3S5Zrq1YXM
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: uqlVCm6IAX_c5NolYCU9rSbA_m8v6Cpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXwDBv83mkarca
 6xpZYtM9mv65OVglLoQS4pRDaq4FlqUijvAF4C2etsu62dhgVrCCPjlGK24OURNRoQsgYi/NkZp
 OAKfYl4ZeWK6VNCoXMm0PdTfVjBVtv3+IOFf5ph0uSum8YbrEAc8TgymMhy0vtNGQiJl5AcIpRq
 EeyYIZqpnAOi6LbOc2m/Y7StFFRPXNDY61nzMTnnin2V2t2iJ9f6p2xdHxU5Grfsnu6KnaawmyF
 /JtETAiITO0kd6rFS2/hkpKZAxhMRWFRemKjwd9w/tFbYhQLp4wN2mWBv4en+iiwnOwqL3/tq7q
 GulBwk8lPyEQDUAffM1qjlBzixn52mZ/NR70wOjh3d66/fvZeslCJV7sVTV5NkXJ0kTFhLdoT/7
 Ma8I7MyeQasaB1i8hKhkv/rW5fpcJz8HftRFyPGX4P+dEiHN8tk7NZELuPA/Aftwhf+Pbwp9sRd
 YzBnkzE7rkwA3ylMoTw==
X-Proofpoint-ORIG-GUID: uqlVCm6IAX_c5NolYCU9rSbA_m8v6Cpf
X-Authority-Analysis: v=2.4 cv=FbkHAp+6 c=1 sm=1 tr=0 ts=6a7b2577 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=etYmfIWrwypQtZQWCWAA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX8UTaSN9lUCJY
 g3dmgckaXxFiMKiUJmVe8b6MNFVyfdu1mIVxnNJsHY/7R8mM/+cxKhBR/YsbdyQ8J6MmGHPj+rq
 YykGei9qLJls+kWKci5ugsJZ+ABS0L8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
TLMM pinctrl; without this the pins are left in their default state and
the bus does not function on boards that enable it.

Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
8mA drive strength and pull-up, and reference it from the mdio1 node
via pinctrl-0/pinctrl-names.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..a8a89a9c8160 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -241,6 +241,8 @@ mdio1: mdio@90000 {
 			reg = <0x00090000 0x64>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			pinctrl-0 = <&mdio_pins>;
+			pinctrl-names = "default";
 
 			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
 			clock-names = "gcc_mdio_ahb_clk";
@@ -427,6 +429,22 @@ uart1_pins: uart1-state {
 				drive-strength = <8>;
 				bias-pull-down;
 			};
+
+			mdio_pins: mdio-state {
+				mdc-pins {
+					pins = "gpio36";
+					function = "mdc";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+
+				mdio-pins {
+					pins = "gpio37";
+					function = "mdio";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		gcc: clock-controller@1800000 {

---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

