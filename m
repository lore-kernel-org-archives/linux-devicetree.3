Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416D53B8921
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743944; cv=none; b=u9e29XsYlUCwJM9iCfc9BvRnEkX3HQbvm2LyWVMv8TXMP7HpdPDhL/TnfAmBVJ3BylsDjm5xCKcOgxJCV6F6/+Y7XiBDAt3ZSdgSTOeCts0TxBjbwmTW4wzzh4hfyWS3LJ6eSseoTT3FivjI3T8q3R9JI0oD9hY2MOqAHImA6Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743944; c=relaxed/simple;
	bh=U/UCsZnggZGB2S/+KHfvfzK/IKKaYKVWxTkTRXJflAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dZj92NdDzVlJqqjJ7oYI2MxAyQZZzRLImwn8MoANJHj8U+7tIOhbg46wmny2wKBw70AHUaiPbmdrYg9Vn3ErbQoH4l1RIAKDPRJps3r113/I1l2OwffMkgxp4MSIbLdaYLr1VMomDksK1mL5OFTKAzltuc8GZjoXQkNi4byqEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evTOxvk9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6xYRXcB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evTOxvk9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6xYRXcB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHeTf519247
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J1hggj6ggb4
	gKzMGVfamwoW145TL49clZ4izr6PFd0M=; b=evTOxvk9DNtvmnvCnUg0vBQwMnd
	IOu5IAM+/u7L4875Xij47UceBys32TeITNlWezWVUHkTYFBe8oPYlglr70dCI38P
	zatiuR1n0/ItzEshOQlyqv8v5M1paxAPSkDh3opcdzCqtscNFSBEaYzrq75oNYdc
	6erovyiE+14F3WR1Ea10EZtQH5IgRc7mbwGPuLM6TIr928S5Ff2H2STh69IfXNr5
	fok+gu3FePaiYT9CsdJM3eaLwn7W1FpdWNiLoHEd5UvT4SnNQI6gf1cJ6SymOzpp
	kyoo2+bcxdP6i7SxEjy1DzvtgAXp27h1nvTPEm/c1W1MjCVWG5L/cWCuPQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0a2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so1603872a91.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743941; x=1788348741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1hggj6ggb4gKzMGVfamwoW145TL49clZ4izr6PFd0M=;
        b=F6xYRXcBeqQiAVC8dO3Hv5s+x4zf3EevZz4EOef4m36LSy0niIzBGJFKj/3EJKJrlv
         FRnjLd5d8Qb7WW4D9BG7mV3yESMPRrnX7DaG6k0i8F+w2RON/0hBbuzGMPYUMP9aOvpj
         P/YCdUiZY/0/FhE7OQogWU1yNn2sI0ynPFLb3hh6UWaA33Ew474bDConQqvBJk6aQA6n
         zC8zr8rhNXb9crTbl7MS1KZf2j/pqBuE9QhLyiBIp7PKysyYaFK08eAiz+FzUUfTEbC+
         fHgUHqUAWn8NgylGRMbN9YBUvyg2+GHnJknhpbNHDkgqJ2YakUtj/QPeadopmLvX863D
         +kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743941; x=1788348741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1hggj6ggb4gKzMGVfamwoW145TL49clZ4izr6PFd0M=;
        b=Que4uAKe05EXX2NUd6/P5isx3j5eQkAJ0On0SvTYX4PMmZ1aYl27aHtNhAX59fu8fw
         HCKsowzBkGymKA168c026y65/axe88DvbFxjQ8zb+Y9QIazoe6bR7iruVpqI27zobw9s
         ievALpvhFe1dZOSIVUO67CpsqnLsrdCSRT+WbCgorKc1TATSzwcliHIGVG7Rmk8IJ2VC
         2rVi8zha5HTOkiLfO9meE7kIhDoPKwKWCqqpIBgnvU8x8e2RMLpGWxFDKbf/LR0oA3fw
         SFwv40hKnK0s0paHuhLS7B+Mj6xzmDzzbVsWfOiNA1hBCaxmUnErjjPdTNiLHNgZN636
         5Spw==
X-Forwarded-Encrypted: i=1; AHgh+Rqfg8Nvoj088j+nHVhUF+jDqCAFshSwgpZg/7Kq1z7EEB/R8VpbLVZjqxN+p/xWTI/yaekBUdqDq82q@vger.kernel.org
X-Gm-Message-State: AFuF++l9MOzPnN4XLFvZAzTFZq3fa7JqnzGSdOSqMc2t/PIu6zYvU50d
	WjasPW1e9HNhzC/g5o2Ycw4gBsZ8R2cn2noh8AkFGcjXK+qhxvnvGoW3z3BWvNakF+GXDpYbNoi
	zCfvNgPJNhZGnFTXCSX76KyDveWZQrvB85nQ72l8SPh/rTvwlPjuV1d9CJtZVNwtV
X-Gm-Gg: AR+sD12VHv8yXk/o5J/kLp05EPdai0Jwg3pkWYrpGMH5PkIRVTieyJN2drxvkduFUkD
	06DAz7SH9jHx884Z/tMuBJm5tPYDKnWzJkmKFHt8JagmzYBjeHbKyE9pZm3AZ1Hu/f/7b3YXUYY
	OEvU9c2K20Ddsvk2UecDa/NF230HBDiPUGEQgm97VPm7jF0UUNWzyI0CsOuFlob7AgU58gPGY0x
	DVqGE2MP8TmeVawzxT5IBFD2GBDNbDqI8xY1duwRpoANRo85aRQ7hNEHfqCkIYqgU+CMKLW3yD3
	P9kP3/NIrjkedGRrRuPaUIr9Wf4VhK+OQ/COgVv1n0eULBra+qnmqc6CgZiRS4S84cw62kquXrb
	vGSVmxyDDNihDIt2XPtLT5NYgj7N0HZLGkwY=
X-Received: by 2002:a17:90b:4a8c:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-3966d178652mr12840821a91.4.1787743941155;
        Wed, 26 Aug 2026 04:32:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8c:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-3966d178652mr12840701a91.4.1787743940708;
        Wed, 26 Aug 2026 04:32:20 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b3a49bsm7748929a91.6.2026.08.26.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:32:20 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH RESEND v1 1/2] arm64: dts: qcom: lemans-evk: Move SD card support to overlay
Date: Wed, 26 Aug 2026 17:02:05 +0530
Message-Id: <20260826113206.488991-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vUy30cPLwvKmBsETRg2LnnPo1uthxR_l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfXwM2s5PhRcWCl
 KMUo3WGoWadkwia2oKGj6Tp2qVHEdOXgWU3mLZBBDzHXrkeQiOtiL/B/bLXKLFRj/l9ImGkLPt4
 6phw9R1oqw3S35/CnWvHc5iaE6c1G7c=
X-Proofpoint-GUID: vUy30cPLwvKmBsETRg2LnnPo1uthxR_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX5//kPYbJaa1u
 GQ30qg9Lg+KWmA8stFGFSXXZcPGFZmH/Ncj7+cXhP9XTrx4zPjomw7+eD/pPSNwnn6wWOyZ+OG9
 JOzllq4X8REe/07PZEx57N9pIqPPH2suOuA8xvWdQa1rrNnZDpnQrZHOyu6jqP9t5fsbYnnRxRF
 qDqc0dY8VRicFpfHXMAlZ5AIf4ibBMaB6tv+o4fYGhyLagVLwXkXqo0P0M6lBCNtUEwyKKv6TTG
 mTgKWVGyz4b5CWV/4HOm8ZIKp0qEsCyWdgNCTXKZAo5Sc/NLA/R8eZ/I7Z+qk5I7urM4yuf4DVZ
 v6dhvCgZ9FyUr+9UQFlA87eBhS2Czq4rvXF7IfDBS4CO9mIN7D0GLi9+9TMpcvuRuhfMglDXiA7
 BwduR6RUFm0ReJx5FPsZCHACw3S+taqpc5+BZ0Y/Gtzyor41P2jCtWtt660hE+djUzo+Bql5cbD
 mIDLTX66GUx/r62cRcw==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ecec6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7ANCQbqDFV_UZS9GFOYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260096

The lemans EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Move the SDHC node for SD card into a dedicated device tree overlay.
This decoupling allows the storage medium to be selected dynamically by
applying the appropriate overlay for either SD card or eMMC support.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 ------------
 3 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..67b768fa8063 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -46,6 +46,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
+
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
new file mode 100644
index 000000000000..007ab6347349
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..579a34678949 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -961,22 +961,6 @@ &remoteproc_gpdsp1 {
 	status = "okay";
 };
 
-&sdhc {
-	vmmc-supply = <&vmmc_sdc>;
-	vqmmc-supply = <&vreg_sdc>;
-
-	pinctrl-0 = <&sdc_default>, <&sd_cd>;
-	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
-	pinctrl-names = "default", "sleep";
-
-	bus-width = <4>;
-	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
-	no-mmc;
-	no-sdio;
-
-	status = "okay";
-};
-
 &serdes0 {
 	phy-supply = <&vreg_l5a>;
 
-- 
2.34.1

