Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB2B4EF122
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891319; cv=none; b=aoK2UcMvCiNzjvDdIvDHBkJGgwAylW9e4YutPDPnQf5C+jCooiMta2Lx3YAegeLKT3CyOLKUk7RH1NmVKm+2vim8L/ahc1yrQir5Rog66XLO9g1JW0rse+e4GTcmlHEa6nI7H8MlF3eaqFkBjQfhZZL3YKcXcACHb5BEcKyQ9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891319; c=relaxed/simple;
	bh=sbZGAEczliy9jCoLD291zfanaxsrD1smwBv/ixqF1B4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lygsYdZdhfPLdp+P4QgSaoK8qiSwmBFOUjZbBV9WQyRKGBrLPc30HB8Hu9ECfML47kx3A2pPZ64yXZVs3MfkOThZK0NHAlGVR4MBiJxoco6cwDoZezr5ibW3jbfYXZOJt4UCs5zfN+W4hnpM7ulIRzi3GkDo6u5KI2wnNrpi6AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZjzqZDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mya8XNiP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZjzqZDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mya8XNiP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvTL790829
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKsaKaq13LZRJ984gA7DXK152HEOpQjY9PXI8/F2/14=; b=ZZjzqZDEpe8eHi0r
	2X+3FZlQQtYS3X7jG5ob6Xn/SIDpigaeIx6QQKUoXScfG78NG2V/4wCwO5irlQra
	u/iB6Q88R2wagKtdQLltuMlFHHv5E1NCIM76NsQKI8SSZWtYn+S+nhVFaBGRjp/D
	6PSiCAmwoljFG1t0sIMnnMrCXavKnHBvlydhec4F/gck10eyvgp4ez6dnvvfxi5C
	P65T1U3PGn9+NDvsnkAm2XRWAY0szMr2oKUu5ZMZbwiRGkUD5lh7XWwiZISCQnpe
	IXL8N6aVR2zLjeuDiYATxz5xXj+ailNLQj1JU5INJOCgNWd3QJoCvwnV+FJ0VteA
	amnAlg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrn15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:35:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so800563585a.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791891311; x=1792496111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKsaKaq13LZRJ984gA7DXK152HEOpQjY9PXI8/F2/14=;
        b=Mya8XNiPAW8uRPjusnvNqAFTodCv3zvh1s7UsfIQ2GvQiHUVmIxIgJ78dtW9RSi9qf
         Uaj53oqsvWfkChnAxgRDWa6+kLywIjrT+XrQEBXzIf9Lg+VvzH8Z603PkxH+Gd9bMwy4
         6dlNXZxAXN9hkSDqUYG5g6gOh3rL9SSUoTry/zSoryY0PyVT1+LXTw9VgBFQECZiKe1J
         P5yTgNX+Spm8Ru+12dXydStVifyr0qvQnaXomE+bX8434iwgfVpINNt/0qtwHkL/FYIj
         ON+ZIAZJzmyCuXkFTEseBI3mrCoeBxdcd84XohHC4HUJRjkStcRqSjxTR+ABFiSlGEhk
         J0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891311; x=1792496111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKsaKaq13LZRJ984gA7DXK152HEOpQjY9PXI8/F2/14=;
        b=w/Kb66CgTQNDHd1Ic2x+GMLfDfsRgWpjyhoUzzUwsj5LT985BH2Tr2AF6VfB0YfiYi
         3eRnaNmUF0xyCBHdGOBQ1klNU9YR3k5P5b/UtaMbEQ0DKpSq5X/VHlWAKda6lvzk462z
         bfthPuJ9Ix/1AaxgkYGsSvVbCjlE4WYhA2XZhrlGWgAinRKymFYKKWeriNfVGm5XYWog
         dcwji4bI1M0fPc8Z57ngFHjPtGX1IlU4o7cbl6p3aV5prQ6hrjIuzZ2IMbe1mR9b2DWb
         VxNRIiGx6J8NCaRMladbvQXT6E1ksiWolghk+2Q3VECQ1oucYfdvME+FgNEicmEvHFTD
         vKmg==
X-Forwarded-Encrypted: i=1; AKwUvBzzBjJp4L/5cTG9iVZwPoEo97a3XZ+WpDR93hBXt9+9fXoOA1FTlXwX3e5SL1JJUjkJU6sk6ipXoOyV@vger.kernel.org
X-Gm-Message-State: AFq9FYLYyX/zKvQBUkhS9pCf3CwMK6oLLJZbKyoNOIvE2PBUBi0e5uLB
	2HzHnF1+KREUHSOP5MYZ2ipl3BW0FZYKcJMuRrCVSUkqAM/+GOovKIn/tjzMJMqAjp20fpqFVxy
	vWyTBMuM7ia+ZC0Zjvb+2YurwYQrvUj/QnOgIKHMqookuRiblw26txJPMSeYVdQ3/
X-Gm-Gg: AYBFou3s1JX3ocXBfH6tqYvmnwweg7QcRY3Cjfo7vxNxpaAvLU16pf/N/ggEzvkICcu
	6mEG5XWvlbKpeDEeAl30R4VxGdz1y8JfDymXUFc/boalnghXjty0kQkv431hrrC4m3K8J0/orgY
	9uEpeKp7f+pRn7TtQr4YBhab1rT9DVNpBjhLDKRZm6F2QOmAkyocdls3pZEY1U7M30ps9JRIwnh
	IHWNBo3Z4UPWc0CvEUKNsd8IGG2lPxdHTKxiDn/wzLW3gIuirtmZ9v3srSzwd+ZQ0ZfX0nybShx
	81Xr4ZELnhXoEXD0HzjwTyWT+YpAIyBOoMNO5QgizByr5ykImoSFcVcX49iIyYSZJa8HBr6CNVF
	hPNUpUUJ2O8p8ILIEtEwMaA+ZEEAg
X-Received: by 2002:a05:620a:4552:b0:93e:5821:2c57 with SMTP id af79cd13be357-93ebd2244d7mr2194034585a.22.1791891310748;
        Tue, 13 Oct 2026 04:35:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4552:b0:93e:5821:2c57 with SMTP id af79cd13be357-93ebd2244d7mr2194020485a.22.1791891309371;
        Tue, 13 Oct 2026 04:35:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm654407215e9.9.2026.10.13.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:35:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:34:48 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: nord-rrd: Enable USB ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-nord-usb-dwc-dts-v3-3-bcaaf3faae24@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5513;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d3rLzMRX6NIANH4PDJoCNo/U/rcomaNjMqqIKMyr4so=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzhdgvF/9/COqE6UqE7ZvWmcrhtGk9J/YeyoQW
 03gVhkpBNGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4XYAAKCRAFnS7L/zaE
 w2gYD/9TnVCwmV3hHahFW0k+W2umJLyA02RdTMLucrbyKQWhmyO/l8ftmfRvySxDp2o9cfePgOo
 SAqQgOyWNfrrgtWL64DGateATGg47NQhiOwQUZzIeEY+SCaOd1FFeOfx3PwiyZzw7V0Fl8yLBUk
 CmcVa6xwHRNjvcS9vvaInUbT19hfby9n6SX5SJRYW6YY1DLWRzPb4fjoKMw2TibZ48npRxapJ9q
 RTDQ8N+tWcvTaWeiu5tURVHQTTbqYJ4QwCfmTkqnlVNpwOD8TCmD20Pb5BB6agIAaID19mxYcbF
 JvyyLjc6CWO4m4b44p2U5Vr4oSIswh9y77wOzPS1YVXkJPNpiSyy3VLbmrNlVj9Of5GIIjp4DEl
 4hqGbLMT4s98SX6+LHM0R4lRAhtVz8C2LrcnzqDQQpK/wAfglfEGVOnvarE4/30bvun8Zccju4i
 nYm4Kgsa0rcfH6jjXBaeDWegxpKozf9AVspjJ1xuEWzFsPoWTzRtU5FmxLfRxLKaIxMM5nbtbI8
 mxGJvTMKy/41fDgVufzB9MaZmIUT0V1bKmYRG+4uoKspYowHUT0ZcyLW5GEOHWwYm3dOErp1lHI
 fEWbzMaZ5wVlDAK444jc0mCtF+JjcTva9d17bSCGDnzWwHkXl9D4izrluDKGWd050sBbsj0UTPq
 p4ATILSjVt9MFpA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX1WrnjAvVbQQJ
 fSgdulcbxXvpPPHkTAAY/lYN0FOPlL0wMtydKy5TWxSap6BqMdmOIFOSPD5Wr1MuBrI61ufrzvS
 P/IQBgX3DSGY8sCFvm1VpnyrVeEUkrU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX2IYxgAt+ykIv
 7RPqX7bVX/QkzVj/SHbckvbjlkI6x2PMZxtORTwWw1nZi3U4RLgfYRTNYTwA4JqQmDlIwsRL+pd
 K0kJESKQELLHSk7n/C1Ubvc3/+ucG73xUzDDSer7f1tNsIui3Angx/Q5zzcPN7ULNB52vWUwK8m
 zCUMmBYy2cRvcYuwuZCwZKOOnXLbAGmcdpbc5p4rF44hTwAEPfbD/IETfclgZeJ4TjNX8ELLaRH
 aofFOHVHiUJLfuMjemDgZiOLrCw60kpa99YcFozaXSmhBYv9BiTSdrrs9ixfjFimCyMQO17VNzK
 XRWtX19lZqfCqoNqJ8vAyfYovJ8oyYKHf5J1Ojms2yxPPxMJI1SBqE10/jiykm00eJYMBuDh1he
 zRTFQZSV3YOR9D+rCTe5DzVk7+es3r735zSGcnLqA764Ib4BvHLRcXy/HFtHAv5sETkFw56RXG7
 j4ZYEOHiL+o/tqC67xA==
X-Proofpoint-ORIG-GUID: GS41536aauYny4-tZW5BEd470Xy0zug8
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace176f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DIsXSFffBO_R8zc2K-IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GS41536aauYny4-tZW5BEd470Xy0zug8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130046

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.

Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
the controller is wired on this board, to USB_0, so a single
usb-c-connector is described and port B is left out. USB_0 is configured
for OTG with usb-role-switch and its HS and SS endpoints are linked to
the dwc3 HS endpoint and the QMP combo PHY SS output.

USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
additionally supplied by a fixed 1.2 V rail.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 166 ++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92dbba7303dd38ede201725c0347e2..3965042f4712bb4d406b53c81464100c7db86de3 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "nord-embedded.dtsi"
@@ -53,6 +54,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_hub_1p2: regulator-hub-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_hub_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -377,6 +394,86 @@ rtc@32 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	usb0_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 9 GPIO_ACTIVE_LOW>;
+	};
+
+	usb1_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 10 GPIO_ACTIVE_LOW>;
+	};
+
+	typec@50 {
+		compatible = "onnn,fusb15201";
+		reg = <0x50>;
+		interrupts-extended = <&pmau0102_i_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&usb_pd_int_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Only port A of the controller is wired up on this board, to
+		 * USB_0. Port B is left unconnected.
+		 */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C0";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_con_hs: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_con_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pmau0102_i_gpios {
+	usb_pd_int_default: usb-pd-int-state {
+		pins = "gpio8";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -459,3 +556,72 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&usb_0_con_hs>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb0_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_0_con_ss>;
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	hub_hs: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+		reset-gpios = <&tlmm 170 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vreg_per_3p3>;
+		peer-hub = <&hub_ss>;
+	};
+
+	hub_ss: hub@2 {
+		compatible = "usb5e3,625";
+		reg = <2>;
+		vdd-supply = <&vreg_per_3p3>;
+		vdd12-supply = <&vreg_hub_1p2>;
+		peer-hub = <&hub_hs>;
+	};
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb1_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};

-- 
2.47.3

