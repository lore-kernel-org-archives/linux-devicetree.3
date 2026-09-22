Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9129F556BA6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089294; cv=none; b=Ux/CqcfvjqLkHBmpZgSztxETiWlkZpLkJjy/hiMrbFdlHkF3hDzb8KjhEVzCr2Le25ml/LfMXuQWn1iM417/LQgdmwct4y6FeTVJPFnyMtB7h4rn0lPIvMFcTAMyOQSz9XfZWYVdNLrXy8D1/EJkPjt7c2ekFLFsvy3XmxaEufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089294; c=relaxed/simple;
	bh=ryg85ObrTJOAyfSo30gmnDwUUGRxahMFV5OJfmrABuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aF7DVgi+F7kG6t22/IQDk6KzEVwTqar4qOFZ9LYNKeMIpXJIEIKs1olmxfvHRzXLLOvmAomllLSaYqbu7h79w9Dz881bhBEIbGx/TG7HlcvfQTObpfyWW0xCKBwJdtavVPt1+PvhrhkVwCrGJ43Vd2qWMxsY9IaS2PDZHzCGZ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqNKNffW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYjqFbMa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqNKNffW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYjqFbMa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjdA9898329
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=; b=CqNKNffWaYZg9pbC
	zQLyDDVaQYnjT4Gfmb+uSiYIeg9nQq2upgbf1GuXRTCyHoUA3kYWZixsuJyZ83KV
	xF4Ftc1dSRLHzHMfOG9ZGwEAJGJERdL/ptS+eRPOzmVN5sejl/+EqsA6LxU7qPbE
	EsMFf/dydUs7wH++vKJ3NjMd/qnAsV66JvQKP0snB0LZ1fclkIyTIZ+nRQrxEjsR
	22vykOec+zBU7bpXnDnNYVMKYJIGh+KiI5SJFvyPLGn+MUmiP/FVQ0e2H5v/uw5V
	4kUhCoveq/AUWfOMVsgkzYvoypg62efLbItICiqWVGf32bvKCQHUUvSn4hzKZNS5
	SzV4Zg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkbtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so3121393241.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089290; x=1790694090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=;
        b=SYjqFbMavl2BOiqpqNCD74RDHIpEsyZDZ32Zod4kLQJFWjfu7jImjKM8Doj+m3H2Hw
         7boj2yR7y455MzwmpdZUKQg4mtJtYbngE8cc7lvyOjMLY2i5+7L3hJ6GBdkRhrazM7Wp
         f98ersrH1xnSaoOZEDBBa9aefWkBbCrre97/OedJa0lHex1fvGEntmY/S6gJH2iZl1ua
         RSl6PZuGslSHiXMhTn5KjTUs7NmSyYiRqOnbXvpw8u4cOnseWcW/p0dKQ5U8lxSj0aBe
         mFLJ/IbuBfdqZMRjMgXLD7A7Fa77oAuJFedVs+1JFinTBo1ZyzkgX6NVc1/nRZqWQ/zF
         2rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089290; x=1790694090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=;
        b=vY5727fP0t0n0kgPYbHKee1t7ZIpiCM7rl7UqvzXB0EO2ZRCz8cIaxGLkz5E/UuIFp
         DBraC4pkXhQeUryBNczdHzX3A0PIhWZvEMXg9OYK/DUKcF7I2VGbHzn8XhQxsKK5R2oE
         /EJTJT0vYTIbdG1x48j2JpL7numvJxwIxBLxCLtLKA1QUq7GdNwC9QpNrR9iPTnnMLNp
         atTBSeLBpGRBpvPrT8aUgl0xUH30CkicbepmxxsHEULrxISGfOWVPgMAoZ44Fjep0mg7
         00Yk32qC34HQYBL6foC9Tkb1JvLshhRL7yf5NuSzJ18JBEsZJNy2gPFGQFXv/xi6ELTu
         UVmg==
X-Forwarded-Encrypted: i=1; AKwUvBw9xflJSja6Q5HGSDckV0e/fevYmqYbmxGlvHVmg+zxRipIxdisedEE5YzMmrrCwKWEzugI+BysL3qa@vger.kernel.org
X-Gm-Message-State: AFuF++kgAUcPfDQpr9pyBQv8yUGNNhz3k9MJJXH0xT0JBMP8qssqrM/g
	v7OlTkszvZ6JA17aDi64JhVlkSfD5s9MCkERbo5e7xvsxEgEtv12A/beDuoGaZtYbrIpgEvTUPh
	MAnSjdnADf4vLQohJ7OLSAltiw7SwOXwSmkpxTi1jCw9H5cUe3/UlTkaslKFyOTdB
X-Gm-Gg: AYBFou2snKbyUno+WyLZyt7wkrBKVntPTjB9JilXj3LAfeVs4gg+82k9Zn1ZlhMCZ8s
	z1c3ezmCe450O4iNlHnNTwsFCo4qZsDLGNJ7X4k7THgyyi+xWY8+nsmJswQU9pwk2MtzJJYUr5z
	6aGbEX4KGPJAB6n2SLvwjAeK2IWHl7OdpVVOLSqwRvSC+JJC7sJdxYPlOl/Y2a0slaYxV5JR5Xz
	51prlSevidxOzmpUZF4spyZL/kKk33CiFe1VnUl/fkmkBVsoamiZQJwRKO0r8PGVgSVgq4xsYl+
	aHxo0BpGckYN7KaF4703uHkL2/D33ZXYYD36kYRoWtENnVPiJzAUCo2+KwoaHcfNIdEisckmIpj
	JTHB8bshuTbLt9Cv9yGwRqoI/ZHQ=
X-Received: by 2002:a05:6122:3116:b0:5c9:a60b:e5b1 with SMTP id 71dfb90a1353d-5c9b5934364mr9606690e0c.10.1790089290254;
        Tue, 22 Sep 2026 08:01:30 -0700 (PDT)
X-Received: by 2002:a05:6122:3116:b0:5c9:a60b:e5b1 with SMTP id 71dfb90a1353d-5c9b5934364mr9606580e0c.10.1790089289382;
        Tue, 22 Sep 2026 08:01:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:01:08 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-nord-usb-dwc-dts-v2-2-ba2b39f1a843@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9585;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ryg85ObrTJOAyfSo30gmnDwUUGRxahMFV5OJfmrABuQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqspg+fs/gF5EOYe4dwJcAdW1I/2F97liSt0tER
 mAZxaucwzaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYPgAKCRAFnS7L/zaE
 w5fnD/9pgTFRhWTjf+UID3uHsIMWT8+LxZY4vmKXqJzaZBOvRyqDNf7gGGTAFdWamSbHwxUsmaG
 MixINeAtmlUJnx/k453cc7nPUVJe0AYSbteAltpaYgR8DrS88MTme5l0NqODS9NGZ6a8hyoZ/xP
 Fowoewh3PghQDeSHlRNjSX1XQV+QZR9MPy9Hk3zQ+VZuZVXZEmI7kQmH5t4kJFK2FBg+bl2y75j
 1JnYng0hptniqZQ6GahktdazHLFjXwmDRynuMXg5gddsHYM35cIkTVQSsCgeaST9ayQEBuBj8Rr
 AIPtjsQ3PQXBGe76Br09nkgZenfj5KXmAKOm8mrrMwL/MJC3bv05z8fcM9LSh0a/2h5F9/MYfNq
 wt3ENnrtyMWwYWbxfaNllpE3UR1AGm5/I5ihXN6Uu03K+sdsQyNoN6HvsiOlMQQq9EdO7UKZ93E
 8vac5LulJ2I3msL7xbPYFCvEqbgLrZWMqi4yqVq9rauF8N08e3AtuojT6Uvj7CsPGb6Dgw97xOt
 CCQB10oBAMG0tBp33ssQCkJqE7llV6x/O7kPrREzFMCbHEISO0QRFWJ8nwiU/52Jd/Hwi0B18ue
 rkZNVz3THFI33pSb9S1nUX5Q4BNAmj78uRl0SHjBj3OC5eqnOKne6ZAlEr4mrKOlqViV5JIFylF
 ZMK/5fco4W0z7kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2984b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NOSK86ayaCRT3GQFxdkA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: IxwF32iwZXkVdsJUMAcqsAaqZqpjC2uq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfXwqA07JoaJyFB
 yqcbYjat536N2jOel0H6/XwSjF87+Hj0a8+ZwTDYJoXPeSKvmu0naKKdXouymNfXBqSX0bU7ubD
 QaYNNGme5NhnQQiRXtcYjl3/1SO2lVQRj2F4ji+l+5l/1uvg5RtQecUzoBgK5mYyb/D1M8NNqbo
 ygqkvbNVOcSAHIt29uYo6H2JLvgzx7pT7QhpIMVJ5GBdRYPPlJZtsNYeW0t0IqUJAiIG1WwnYa+
 oID9fj6SbC8dgNLV4Ns2hFY88+BDEgD1Fq3U/Q8L2MDupN5rmsMLGUU+5NUF9S2H8KnmZW+cH+I
 zjRRngj4S39Witi6dBnie+4STaJX9gycAqZICMhZZVyGjClvrg+fEofEo8/oYBqcfA2hKebNGnO
 oQ99EeLfbjqSSz5hbX4SQ4Su3NzQeAvVTPo/ZIB81olhBzMWxaSezi3g4dfX9t1No6tHf5x9GdM
 K4i/SvCQqdYiPhLs7oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX7LlKoj4MFu6r
 7OhJWpKyvAUSfXe6w1ZWLFbAWRYZFA9vr3K7qw/GMD8c148eJ7/IJDlRECSwrK1cQV96NH1sFpU
 TDU7Rw/9OsZAiqKoAtGG7rt8umwgTrQ=
X-Proofpoint-GUID: IxwF32iwZXkVdsJUMAcqsAaqZqpjC2uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220219

Add the platform resources for the three USB controllers on the embedded
Nord variant: clocks, resets, power domains and interconnect paths.

Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
into negcc, which so far carried placeholder zeros in their place.

The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
out of reset with the rest of the USB20 tile, driven by the controller.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 311 +++++++++++++++++++++++++++-
 1 file changed, 309 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index c7ac2e66632e57852f6dd88d8070d5c28cf70d2f..e7ff8c420300f34a2ad4063ecad8a31f08b8d80b 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -842,6 +843,161 @@ hpass_ag_noc: interconnect@5fc0000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	usb_2_hsphy: phy@88e0000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088e0000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+		clock-names = "ref";
+
+		/*
+		 * The SoC has three eUSB2 PHYs but only two QUSB2PHY block
+		 * resets, which belong to instances 0 and 1 (usb_0 and usb_1).
+		 * This PHY, instance 2, has none of its own: it is taken out of
+		 * reset together with the rest of the USB20 tile by
+		 * NE_GCC_USB20_PRIM_BCR, which the controller owns and pulses
+		 * before touching any register. So no 'resets' here - both
+		 * consumers would need that single reset exclusively.
+		 */
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_0_qmpphy: phy@88e1000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e1000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_PRIM_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_0_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_PIPE_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe";
+
+		power-domains = <&negcc NE_GCC_USB3_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_PRIM_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_PRIM_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_0_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_0_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_0_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_1_qmpphy: phy@88e4000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e4000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_SEC_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_1_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_PIPE_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe";
+
+		power-domains = <&negcc NE_GCC_USB3_SEC_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_SEC_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_SEC_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_1_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_1_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_0_hsphy: phy@88ea000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088ea000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_0_CLKREF_EN>;
+		clock-names = "ref";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_PRIM_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_1_hsphy: phy@88eb000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088eb000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_1_CLKREF_EN>;
+		clock-names = "ref";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_SEC_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
 	negcc: clock-controller@8900000 {
 		compatible = "qcom,nord-negcc";
 		reg = <0x0 0x08900000 0x0 0xf4200>;
@@ -850,8 +1006,8 @@ negcc: clock-controller@8900000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>;
+			 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+			 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
@@ -1881,3 +2037,154 @@ opp-403000000 {
 		};
 	};
 };
+
+&usb_0 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_0_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_0_hsphy>,
+	       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_0_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_0_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_1 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_1_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_SEC_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_SEC_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_SEC_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_1_hsphy>,
+	       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_1_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_1_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_2 {
+	clocks = <&negcc NE_GCC_CNOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB20_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <120000000>;
+
+	power-domains = <&negcc NE_GCC_USB20_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB20_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_2_hsphy>;
+	phy-names = "usb2-phy";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+		};
+	};
+};

-- 
2.47.3

