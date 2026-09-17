Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A94E06E3
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645315; cv=none; b=SuzdwbfFscKYy3H3ZG1OWv/39fEmuzr0vMaeHzQQFKPcGoA7ahma0Yc62dtA7jU19lXdIiQwNBCQ2L29J1r/YrsnHA3WtkdKXkZoM/NUhH9HRYuIy7RCXq82Hrsg8CVlsogsMznSZgjFxx9OV+O7nfTQFYTYRAy2TzaqIN5VZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645315; c=relaxed/simple;
	bh=TfAZkrQyH/2Nx/S5qf316QvGg3gZJpftAEMQtTUDcT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oygOobxEWSSP4h4IP9I75gDiclkdtpr4aJVb0wsCv3bbDcz2vkDviFjE9jy+k5vBEjul5OJ+WurFUyY6ctsuCAWh01xgrHUmFHmzpX7nNaaNedXnRY7k9SOTN6Vw1KxI56cNdRP3/eT19p7+KslMECx6Ph3+YqbGY2XH5T0F5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bw3LXefj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PEPchHXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bw3LXefj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PEPchHXP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZjfN1520197
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=; b=Bw3LXefjWBqcnrcC
	D1ryWwZ9+kGrz8mafCIOK+YwnK1cwyAm4rORW/j/ciFFCL6z/3PGqat/fkzJqEbF
	2pi9eKkfSbGDRNJSw+HXwkysURTY0qm5d+MIAPH8Kl64bfmyR42mYJBk1uB/J8En
	Lv5xysA7hn6OfVT6r6NuWURpvfwRb/5NsKxPWPCAyd9uta6Tm2tVTrPBBz9mdnki
	y8SrDuyD295mqGWbnsATCPiy542QhsIP1RVKONF74tFauP9WXB7cvdnS1EL98VsK
	QKRGWH2j6PKXCi7/DkKeLiaLpcwdD69yxk+AWDWurRu9yU36ctsm2dDBrh7Ft/H1
	UsvOJw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hc268-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:41:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so731518a12.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645311; x=1790250111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=;
        b=PEPchHXPrbk9JUFf69bxjft0aqNMUas9EiFWD1GkNNzPBOw7+tNT9H7U23eK4zH/DH
         2S1AdL8JHmKCYhELvInFI8IOdIwLdasg6Z5PG4W8J9NgvTcYZXAcidOWbbEGb0KdV/qr
         YAdiV40GBPXQUWFpXy5j2RL7QuZlxGq7lWUSQOdVfrHesAWFbgKtmZZk43hMEiFz6XaG
         /wpqzAT+nM4tHvSSyN1F0Acx8AQFlEpad4gmQkiBniH51cXXToN9/ynXmS2vlHi3SWU6
         9EJpGTFDbWv8OoQcAn+AFcA3coKoClHpBWnCJzUSyhC989XMeNvzHUngg2apGllksbFt
         gCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645311; x=1790250111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=;
        b=SG8vtv9zZHqzVB4IHE0jRG1i2c21bQx4LxcKCGKO5UQt6AIWppykarn3L3ITZ+AXQF
         XeXe+FBpEB1hXSusPt0wlagTaYrCv1LFvQl4PKCZ6HWEXY7i1Ld8vqbUVHtN7bAtATzK
         XsfE7tUrJvl4lqXKNYVxzrqvyRR711J/1XsVB3oErjnQeG8PIwat18dKYsNMfZD00D/z
         pgJrqWeSQdQ052VHu38I+O7mg+VsualwqcTgTxg9ycuzmsLLCgFq5119aO3JuCxDgHB/
         Tmqura/EaU4Wor1HpXxCxKC2BRqhHK5BNtrnlmTPOlW6/BOSkj4gpeD0PEfs5MJ5DJIt
         MUAA==
X-Forwarded-Encrypted: i=1; AKwUvBxCZp5JjGNll24os+CJyroLI/Fzepf6xDZH81WwrUq2arFR4UViECnIaTyCpulJ6mOB7fAVPFGa66Gd@vger.kernel.org
X-Gm-Message-State: AFuF++kwnIC/LCr2+Fok6QJu9J0wCN7mF+IFUAKaa1qRVgZVDh4VIsZg
	fjsWaetHLFEMGhliVUBpE3m67mqnlcGOWlMqRb/GG7UbzYMPSXlvD53+xofY8G1vcD+YbFxsFUA
	dfANBawsyMW0/wwcbC2E4/Gwbq2HqpHOC8eNklm4ub5JxVTHX+whtSdsLpsSDe8WV
X-Gm-Gg: AYBFou0HkZsffDNLAEi9lzifbagKEpSrOCDBRyLBENTcaU1KixIr2nsENQ9vPhU6C8M
	ohKioWXhdMND1k3asPKUc7eIu+SLej9iXsF49fG90bcRfhQ9YcyZJuWLw1Qb1phZsX4ysqfIqxr
	jvmQjauVD8hLEZqbxFJtGVLZHeW0nTu+ERyqTaoWbONwgvrcXC1Pxf9yE8xwTNzA6nf/cqKmiWs
	pmGqSn2o4lk39Miirw5jcplEkKjYjCCLZLKR0cFYClsp1sXF79YgHJOwU1Cbpghe0W7gsc33XFB
	uPLfN+YehVklBVgX+i+tW/8QTxDEELeKa4xNbiMcz6bMQV1lOPklN+Yz5mTchrSI8jmYi3+mBKd
	CNAQp52xg75r4fcUMQom8toNR9YEVgw==
X-Received: by 2002:a05:6a21:9185:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3dd7256f000mr5385406637.7.1789645310644;
        Thu, 17 Sep 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:9185:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3dd7256f000mr5385340637.7.1789645310168;
        Thu, 17 Sep 2026 04:41:50 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:49 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:04 +0530
Subject: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=TfAZkrQyH/2Nx/S5qf316QvGg3gZJpftAEMQtTUDcT0=;
 b=WQuOMChYboYzEnDWR8vQ0V5Mji2g2iiMArZvPnPifQnM8Pl/TdWMIoI2xXqDjPWAWlMMlS+RH
 fJwv+ka64QVAKicEOjKcPDbcpJwRImTlYzMaz9iNMcEJWYxz5p1+tVN
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXwzKeirxVJ7cD
 EHufI6aX00samF+szDSdO7lSfnmw3ICTRS1AEOKsp7e+oZ2Ifyt3183drIRyuTXq9u4IPBhTiGI
 qCqR14PhrvIJatPPS2eYTlLVo9AT8hts4zYDr0T37BzI6NlOz3LdQt1kKiVE4wTMG0w1QWKXkCq
 PITejN1F95kXozjuyVXmdIMtGqFRxHUVf2JKapex+k1LsGyQnkVkOzuiTKDYTsZdG7BDqvIDRfZ
 WmH5XOVceGmBPWF9tje7Deb6BHJhTuXext+/TE9k6pjzokDo6wX1ePbhGm4Nof0lr5GWkcPaAE+
 T7FI4wPiJtKZ2sn/g9QFFm3GRL3W9/lUBR5Y4rA1bQPI33MRodthFvoMhaI6/lE/q/OKfKc+3lp
 T8WSJTbHZa9VFwoXGJ1R/VsdhwncLsF4yj23snVYxJm01mnFYJK2nwHghzY67quMpQMJTtfe3UW
 MyhzUnygRE3WRiIUklA==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabd1ff cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fssEF3v2InfWNg1OIJ91reIqU8H9H9e5
X-Proofpoint-ORIG-GUID: fssEF3v2InfWNg1OIJ91reIqU8H9H9e5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXxGksVXDn+XWn
 gEiRjSYAwHEXA8Cjw9AJA3zXKao2x49zGNaKfRrFI/3rvIfaHCJhJnb1kBEKKHLkBA2LkVph9sP
 AoUal2oZfZqAInFflfQkxO9VeXjpedY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 02f340aaa2ca542d0d175ff965198b29ac48772f..c59f0e2231b57b1dd1975c189820cd703d4d5d48 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -363,9 +363,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

