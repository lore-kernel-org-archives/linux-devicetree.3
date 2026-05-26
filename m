Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C6423161
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815642; cv=none; b=o+VOey4DvfosV7hwj3fvCSFs81xaFJ5W+V5KfgXgO90tKI3ijwLlAGPyCeAGxEnfmw0j9N66sF0Nrp+ubCJ5dUIgXRqNasJgOp4eq9ZACPfGgyYpuTlNYTdaOF3yM+mdr3uB34BvuHfKFxxPcBFRFVyvLf67zdrbCQVUdbScWZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815642; c=relaxed/simple;
	bh=xImboLMczBQdAyz9gWg6GBSKFU5e9Ka0KWu8CeYxrCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rlZpBGH8EyUYHtruZjZaey1q7W5ecx9sa3pDZuX10pmvwM3H65wwIfhXFHXEqxng/jeMYwmfW3EMB0ZCO6G5y5+Ztg/NJotUk/atFxKl2uAvjDkF/aaJt5JVspF2LRUUD8t5s826h6I7HLF0m8kGWlLGO3CNkt0Yhuc2udY6UFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0MDOmS0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hI0zgWXx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0MDOmS0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hI0zgWXx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1DI02995558
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=; b=b0MDOmS0Tns7Ipev
	je5IjoPK0TMAWlL3t7B/nxGR4YutfWrB9LlEW133f+2bw1YD7Ja9s8/1IkczJ2QW
	/UR2wpjOCqFqZDzS1B4HT60OysDmLVLhmQ/V0dJBASCq0Ho1uqwamTI1mArgIgbM
	0zAKf6HiG6NMeJoXLxArgLlmgsdwydanj2L00T2M3iT8JLU8Fnw/9x4I4+6Nfxmg
	DKRHEGFxdHw6hYCPNE7rt/ioeLgpkkhk2H+XBFIjhn3OYZ1tHPiEYS02CMQEFU6H
	+9IyJLnBM9d7h51gP8xvZIUUqby0JL73Sa/YiZaC0QeaQXSM2B2BgSsewCYRqmPl
	ejjDYw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnryma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83ef22f8e8bso6981883b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815637; x=1780420437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=;
        b=hI0zgWXxqv8E16m1Ui0kvfjBJS4SWbWa7tS0LbNdQsvHVUDI1nbZBcLyNozAd5cdaY
         vpZ416A0Rj7LjC4F4oVsYuO1ajJnSLtFCVIkD5cVgnz+Or49PuCbRKc7OtntcN1qMqEY
         IhZaMq4z5O36zbcLM3uhu00Y3xCprwCzzcxqAfcaYGydzbJMp7l2NC4hl3eqqk1lrhjV
         3Qcb3KxfKtP0oieQhqg6zQLbsGkJsLIq//H5jipFMtfY6XMyjOnmhgyNnKeXJgXGBa6C
         orEciHZxvK7TBz18onqiLqMEoFT/23yxLTFLr5DbJI9KuoIWk0EIcYZdftwe7vgq90ZF
         0WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815637; x=1780420437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=;
        b=bIuRr67RuTAZFJQ3gBtP+GepeC2kyDVXP4s74kHXFxjFT47SU2WD3Et6XciIHMQA7U
         2zaAVQ4RX04WLTsuqe+fBw/tCi64iD3GcFji8hqNL3SnhZFMK4MNvnm5Rf1Ua7LSKkAr
         nu14ZtF/awUefo9LfSf61HTuhndU1QXklXIzJC8ezxHHPVzlFmd81yw+8kWAcIfmXgeT
         xB5s9USRTcS4u3b7nmcek9K9Vj8YjY0haBnOMeUovOJBEpAPfaTg/LvTQeYhT9oCH+/H
         x9j8N0CE6wDBE3PQj3jD22zzw5g1BdsMHeP08BbsSz2hFm8vwChEAU4bLkjnoN5pe2HL
         g2IA==
X-Forwarded-Encrypted: i=1; AFNElJ8PqYHqisLq0R8n1RUUoS62n/zJhnveNX0dLGp0RSUBIKUUlnuIxGllMomWgVDB1ax8POW/6O7/6DH1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wpWHYntNWjc7Ktk2P9AL3LdP4Eq1hYIH2I156uA3vrdixHys
	7A5oWd/9b5E3KIZMOacVk+2uoLC/z6sQ8N6d2+wrVVxmarx96g1mge68CVLCwXathfC9Ih5d4Vi
	XIRzgs3Db50F3Xx2ZL/WZ4XnwVWDzl0DJT7yPLq5xOVEP+LppVCNy8XtQ2oDoOAcn
X-Gm-Gg: Acq92OHdF4mnxGvPOOf9xLuQjIwwy/7MYJbKMTlLOP1lwRPh0Q1wWloag3Wc4mAiTDl
	95Gfe/c86rPj/zF1kPY3IzDKEaBLh+JIjtRgpho7RAjgoPgc0xS/6Z7gMy6/cnY5HmID5LdtJ6w
	d/1syvEinLGMYSsgqJoYIl3zA6z2Mh1EMtF/D2XnQUJ8aQWwIqJXqrusCzUIxAUbWI+ctif6/Op
	XDObLI8sbcP8MRiaF/kj20FTvaE8bOW+kwqKfqnPX5GiHtgKzETxnhudLr8W7nmiX6iHJQDoEhd
	yNp2nlgVNxgFoyvdZvV+54JW8cyhbR1ICLAXYliphOJToAVMQVla4f9z4hqRsy7XFWru2L1Ex1E
	sHNs9AOGQrOQnT2ZZMclPvvyh5vxaHJOuRZyOH5qF9redWldEOni2
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id d2e1a72fcca58-8415f580e40mr17369716b3a.8.1779815636585;
        Tue, 26 May 2026 10:13:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id d2e1a72fcca58-8415f580e40mr17369687b3a.8.1779815636112;
        Tue, 26 May 2026 10:13:56 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:55 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:52 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: PB_73lMy7_lpNPoNhuAKVFDUiIU4bGs1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX/uv6ZVFKMRmg
 aOgxBJdhZ0tj26XuqyvUbk/XHXHYeF+GaMMmh3VLfW5rdPgLAaB02ZcZhgOwOmdxVZcSi3fjyhm
 kg8vPgd0HvJoVTLlIadr1UrL9KUKAQbqkQsHmhRufNHzu2gQJVVVucxRmUt3I6aVDVak9Z1m0L3
 f9tZJtsNXnSVvswIEZjiJVMvFv3EOdoOTKB+SAPh2EpBOvRN2Q8NhIXjGMfPcrsmhm4jmvv/hx+
 roRHYG6Yw1RrWhYf5xSVfp05RW6098CaTxNAGj3Rs2yGwmII7CuESQ02TqoNi80NgjHs4Zgw8Dq
 ITsMTwQ36/k8zlxHnCCMmeinMYXTYLzkL/JoTotH4OPJy9kpmUXVnqFsdNJOKDezGgVifVGIJ/O
 xB8Hj56ll65hldg3oVEJXBTO/DZ0upr4nF9GtgvRly3VbOmnZRT+/vHB23Fgou3Lz4GM+k7thts
 ZqO9V8FGHejIsOkZl5Q==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15d4d5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FHwBmxWp57AShg3XVyoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: PB_73lMy7_lpNPoNhuAKVFDUiIU4bGs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index df41830e18edff82893ca24ca84d7e03065d0ef7..2a728c975a38f700360e317307036efb0968a00f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f0423f1ab4e93abdcc7cad8977b39e31b2437e8e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,63 @@
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
+		pinctrl-0 = <&mclk1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1

