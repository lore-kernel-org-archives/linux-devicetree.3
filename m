Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264043803B
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787554; cv=none; b=ZqugS/kn7u9t1vqjNOYTK/2PM096h1G8rpB8xCytqdSSNJX705K87J+dcR6MbLK+KRxgx+SkOik6ML/xWF9iEzflE0ZGqM2RxWB7lxhcn2VTKcT/LVdPXe3OsIQ79e1yqDj+vm8EPhIGwm8Ih2QCOCexZtGplw8zs4d5C+BGDZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787554; c=relaxed/simple;
	bh=gIrNpy1BfOfBdpsEjPp2EaySKV335dpmaQgfYevJodw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovOP9gsJLkAYBFifOG0YFOoEsWs8tNbjJOyOwSPJHPK6a3BInhMtA8i98AGJTfJiMZvxtphxzLlqR2/Z4AsuT6qMVSMBtMcM73oZFMqUMqXAjsSMtBR833QwH4emGCpoHgxtVoh6nDWqoZ3OGorQYVXzxgnGNHGSaWiizA4gqMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgaJkYoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSG6XKgp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgaJkYoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSG6XKgp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5Y6Xs1216046
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Doir+caiLoYGVhQW2yiSNYU7k/m4JLDAkXb8nVsZvlY=; b=DgaJkYoLZryqTrJf
	viObZygMMVxU0C6TbKCeimBw6xFg8J3FW+z/68MsEC3z56BRwJ6fDLTkyGcZ9XBm
	FI1UQoWYlbe3EZMOlXmJyQrBCzJEoIF88RalC9pDoik1dDP6AbGNcL3gf+mVLi69
	hxH2vStUoYEEWNQJZe57ag3EXaIFn3pW3udtGRF/whuHrMFxFaJOoCyfW0y5Rw8R
	O1vMFmjxrGumINo1gDZIT1Qa92PTWY1481LHaMnXG8M6qi5C7yOny64GKDPnXgRX
	XNEqMRkuJgJec2JVTeD0FiNiPC8LvSfyuugN/h/6BSkBJjB9FdH5/tet1Fyp0lxm
	XtTBRw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu0ad5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso889376a12.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787545; x=1792392345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Doir+caiLoYGVhQW2yiSNYU7k/m4JLDAkXb8nVsZvlY=;
        b=YSG6XKgpDdhdGnbUDu72Hr9SMeZD2XcUl3mAzOInpvOmXnRcTrCk4HZpZ/6eRkftb1
         ij+AppBhA2AN3kCx2o5CgOTggtwZpCrQfUPJgLAkcBhvI+/kKiVJEjCrJhq9JQpWX5YI
         oFE5xJ47P2a95gcmXGNaWxtaNvNzfoFINjia/gstTPkPndBJxN6na+sq7EbOyi7CL2uG
         /0my6Zyc2QuD2L9EtH3FN99kimO6o7oN+vwvkHgzmhNZpzQkRW8bWGt06dJ7PZU77Syh
         8czO/GAYV3doBZj4AbrAF63cFXQXBYfgtBGQjxuWA7EfwO1J0E4VvWr9YqwWip/w5mjm
         z0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787545; x=1792392345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Doir+caiLoYGVhQW2yiSNYU7k/m4JLDAkXb8nVsZvlY=;
        b=RS1GZKNP4RUBAoPATHwKNG5ajpVrlPBizIPZ+i41lVKEfQe+ALILhBS1uZu4sH3nOX
         gUUzP3fQRF/2Ku56P89x+7pqVQQAkL+hq3ETD4+6HaY236dG8CY2AHgvqYAQakJTIsvB
         tTQh7UU05DoXucWB8YOm5yAgI9ODto6e2U0kqb5EsgEIm3ieK2XOnVf+cyNbPYaPlCxp
         mc2b8EdCaB2NFrSX1AfiyuvxZhrk4MOWFvH3PK5tn5X/AxNMevUxcBeObwJOTovyV4BF
         UzZbfdg8F/TdPRPY0NG51Qyny13Nq4XQskxHqCjSCoT9eIBb4l6vHhMKVHT5NqpS79N5
         QPug==
X-Forwarded-Encrypted: i=1; AKwUvBwovwRI2HSCQTpm0FDwFplIzx2B6IjiXNKHvVQjL9C+AhFBkNaBavEBUGBaTJTIT4RPBDcu18Yq3wCr@vger.kernel.org
X-Gm-Message-State: AFq9FYJXfwQ1LBqReRWubibgyPI5kBeAoMs/N8qwJSkxzyLbH/nphspc
	DTumEIzyyBoroVvMv12W4pdjbY2iDSC+6EzpWWPw3JrATS8QdxjeSvtUq+dYEBi8547uYPZByW7
	XTsM5/9bk6jtU4NNLUlij4LV+ZBcj17wEjdVjShesoPjvEsf+RGUhyHSea8mcW4TH
X-Gm-Gg: AYBFou1pEWCCgV1gyZrq1hde2xKptvtVVE/cMOqmqMx1s+v/PfRQS0FgPytZKy5RdLl
	kop2qps7UdkSZZIBjZYUr2du/x4+Dcqv4KgjWGPrAVPnc4VWrJvl2MLlAtupf3HpSoLTGVvBAwX
	OfssHOoCWCwWhGqMNcnf4CkZGvz2rs2HmP7ULfdMxOiU95HiWsvusPqYrU1LwNolgDOR4FajP8V
	SncC+mpzPdPkF3xuNm4BOqKHfkNA2Da2PlCQ2pPaDSYCVG2Vgdda49gW4y1bjcEKzJT+6vvm7rv
	KZ9CgnGPM/JC4cNAqpJY9IG2O871t3AL3jySSW3IHhH8oVxAK8qHuXWUEwQ8vDCUFVY6U5NZrJs
	zTuIIQjwbriuo4817v35inVrSYFnnpWXkwyUBCO5Sh2mXrpxYhAZnKd3Td0AL2wLWk9A+P/ukSl
	JUYNgU8uL2mQ==
X-Received: by 2002:a05:6a20:2587:b0:3e1:1b11:15c5 with SMTP id adf61e73a8af0-3e16bfce3dfmr6825854637.34.1791787544835;
        Sun, 11 Oct 2026 23:45:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:2587:b0:3e1:1b11:15c5 with SMTP id adf61e73a8af0-3e16bfce3dfmr6825824637.34.1791787544330;
        Sun, 11 Oct 2026 23:45:44 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:43 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:16 -0700
Subject: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc821a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX0JSZLvSNZktu
 9QnyzbhEnaG3QAzwAEBUn/HJfEtm8+1H0zFcuO+YCw5a7PRJmK0MC4rPrh8SyfNFAE4whpUp0Zy
 LokIUf1YdONF3zbmvHhKaFbcWTGmQIyw8Lo9CSCcvJARAg7LTEVRrsq7aO5IqYI2cV5p1LzLCoh
 MbzwCm0oPHICCbOGWXFYxVXu20fNsoVbbXFB6L68wf/z1+h44i68kxjkUZkR/SN5m9AKHKnJQsh
 Q28xsuyBJoF7mqLjVX/wl1N3Lzm6+5JLp4d9UQlE+YNM9UBGCPOJOXzY01yOyY7yXkhtgk0WtPc
 aAKVEF0omv0eDk4aA53sAwGH/+GQ8JxbknM5iJlFcGOdToDrw4w/YwCk/550YqW3aNDJPTzXTmZ
 YeEnwAdbm400BBFqpFv5+GWz2PMpt3UYVUYNuK0dmgBx/28RT8Hri1nhTXT5Uha2GjBEYPksabv
 d8pqST8q0wZziQIB0KA==
X-Proofpoint-ORIG-GUID: xI5pktyTCcj2DHX0BeebEMAep9KXblA_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXzYbkzYjHzoSL
 28hXTLgP2sVTLAhnTgmYwwazYLJHqE6Qg1cEmRGH+xWDK0ySN22i1YKt6EGL4mzRY8dHnVXgOCQ
 l05OA6D+R8IzUD+z0iF96Hn4UgnCk9M=
X-Proofpoint-GUID: xI5pktyTCcj2DHX0BeebEMAep9KXblA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..84b244d43e9e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

