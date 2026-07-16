Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B7E42BE98
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211938; cv=none; b=ciU6qJ0uFP1tQuEQ5tST15NdBAcYvdXQ/F2Eth+463Jv8m6Kz9J6zxJTb82P6FzH+ErMlZJsXMo3I/y9ViVa5krjrd0jwYM4VO+nQJ4Gd1/cF3GAzjXH2szwvoRku31KnPeXyfR/PH7R4NSSV4Z0lCDZRwkk5s7yoAG/TJaSUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211938; c=relaxed/simple;
	bh=dqCuGdsyw8g4jpt1artn37Y6DLupqcaVz/lxcnZIprc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKdK7vqgUicfS9WDSlo34v+6Til0cx3XIqB6H9OdCiO8KbwRuveIIQqx0b96CX0xR5by6YoxtSpKw03yCWULAgLN7t/BkfmnCX/NcwPKd9F7uslHALbS2RgWAV5oduru50EcW8nNZgF11i7f6ZnaFEqy0YMNT4BI3w61PCBV65s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmEPOmqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjWvQnbE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmEPOmqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjWvQnbE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJrrd2691984
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Scx3avMH2Cs
	RoUcay9QQhUSVJ3CS/swBNzKFnFgQ864=; b=fmEPOmqC3hAX/h7nu0akDuWari9
	9TmtfbOyLpmQfK9dANzfMFrObn+KS3CFngyFZqb/LYUYnYoee6AkPTdGXiNt8Nwd
	KtAYBmmNXB3ba4ww+KJUmn9EP6+xXpuYEe6zugIvwwEjjIS7bkuIkH+tiBOi1qGM
	ybglIAqPT3pWYzFYS78Z/1tlha61yWW6zeUHlDEIadg5B/gti3vZxXEKlvyEXcnp
	2T7ceUnLIp7yDePISQRh6j6fqy0J16k6AfGn5Vl0pxONfipKfLfIclPXOQPOOIKl
	ucnf0hM1IcFLc4fUa0cob+PE+J5k5jSIWJPH5Lu3bc3fPTPzAfs1ro0+DYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7sw7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso62952451cf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211935; x=1784816735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Scx3avMH2CsRoUcay9QQhUSVJ3CS/swBNzKFnFgQ864=;
        b=BjWvQnbEjWynAkoDsK+HRBEFztaBaaIQt3s/YYEepNg/WlNNRAZE4qpmbI8KR9UTQu
         GdPThX3hAq4M7Alm4w57qnQU9IFV0SNAlq/0IhfsyPg+ZWu5/QV4Y7ErD2ZXeTztvdAe
         HWxF36nlySgqW+PVRQjmQQDsk9KZKYkOVDeXXxGtRpSV1l/4XeymGQ+Y9C0wgg6drEUp
         v1DXmbTxchy3Kp5c+eoSqnpmPuKpJF+GkqruT5cTe5sW64haTQ57N2Q9kzMeqfK8mChy
         9xSjLWlSxQihlS7W6Fz+vkjX+jLp6ZQmMTWWki6jZI/1GQPLXoTQZ/Bi/Gqq+ZPoQ6kw
         BLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211935; x=1784816735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Scx3avMH2CsRoUcay9QQhUSVJ3CS/swBNzKFnFgQ864=;
        b=ouuysHL1nIE74hi9l03esyZ0Ex8c6JDqC7AuSEzsvZ3eyvc4OI2afCMOtiVgTtwFnI
         RWqfFP54jhI75PSdCXV3lF/Y8Ml4ZBjGqOzVGFUymHpfozpceFl2y1RG3/xb8u5D28Pv
         clxlwNYK1CbPswie9nWrc3GA5awKiAj2mrK2ejmve1+IFAcU/EOKVxrkbf1O8kHl9YaX
         Z0nqRP9GHfZzqTgcyaQR/TMbfUbw6wXSdxXEiiZqzLSZkEo1IbbwLQHllmGX4Yr/gNwC
         HjEiLM+w4rED3BjZx2x8XBkuDoNdslasfVt2lJaaL5KK7lVHqZw6ZhNb11Z8w7FTIddD
         fs2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp2aZYsa4dXsFvLubGNIY5p5JWDJMr+V3L5Iw2NvgH45uILRncFdvKbFCvw41K8fvY24Ef4R9yE/yg3@vger.kernel.org
X-Gm-Message-State: AOJu0YzLm3hnZfZWnM3xm4w/9xMgYcXWGmPYZ0lI45I/KkwSV9ZSSFrx
	yqMk9asv674ssrHIR1gwjacS1c2UN4cN0fsXqf7BYvg1jIYePKKjrUyRKY3pIn4L88Iw9HKdkIN
	UWWbe3T4uRQWDXpGrtWDJvB3HmldJHznBR4nWZWn9uwSEKCR8HUNfquEz2z8ViDTV
X-Gm-Gg: AfdE7ck2LG1q1BhGp5IhYLjoevEMDvbFEn3uSF3WRVwoRbfm8Y54+F4t/6rqp4RV9ZI
	j8G4sSoevYZP3ci9PudtElQtmFbx6H0XY1pBm1HlyHCjusVnVqj3MsRzuBFPgpm9l/QWSlZrnBS
	FwXpkEmy4fjsJYt9/8iHPuloxpwcfXICL3TEUtZxSZdp0YXp0wuQVrxIoapBHTTMc/aQ7EczFyC
	EClBVtSTJ+ZFyjuMH4IqWSZuXgAIUMJOpIznwvkSiDO3e3fvJvI5MtEuoazabQJfW//kmFf6O//
	y9V6DeBSAf6vQU6MEh1an+gwuQue5l42hcQurjIe8g6BfQE4Wii+kRiCX4t6p2osnMdiV3W6SK9
	3VNVOowJ4YTQc564DslsMjdwFKWm9LnDEefw=
X-Received: by 2002:ac8:5e46:0:b0:51c:11ba:c51e with SMTP id d75a77b69052e-51cbf276df7mr225817011cf.56.1784211935383;
        Thu, 16 Jul 2026 07:25:35 -0700 (PDT)
X-Received: by 2002:ac8:5e46:0:b0:51c:11ba:c51e with SMTP id d75a77b69052e-51cbf276df7mr225816391cf.56.1784211934807;
        Thu, 16 Jul 2026 07:25:34 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb0343sm62091975e9.10.2026.07.16.07.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:25:33 -0700 (PDT)
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
Subject: [PATCH V4 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Thu, 16 Jul 2026 19:54:45 +0530
Message-Id: <20260716142445.2767955-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX3tLy4AkldcTW
 K86/aEQ2NEZcPEDpOZL/RilvCqS64wQIpcJClTJlZu2IAJuniapgtHBVdd3t7B/DxCEfUu03W9m
 50GpJrWfkTMq7iD8AezRhk04BiLk/Js=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a58e9e0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FLRs2unuW723IZJmkEMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX0Rkhp4XHDEYK
 1Wxj/cTKoxbIekb6GPPhSAjaNCix94lTvilJHitI5q0BH5fclBBs89kjSMgseOoH+CFX/Y15Nkc
 DjyDb4/8tQdj/NxCQltuetlxxRQfbY68jrVhckkgPCD1edG2rG6h3iVZ5hF0HUUX6JfUap5pNFV
 x3zVqaGAChMaa62DVZ5uJQ30MOD5qb/HCfAKDbcazogbZgPWX9EH/t/Oh9akrfYz1j2JPggjenQ
 JMhT4c3nO9TXGtc7mQ9v7TPxoKt8tZuD2dB4dgl0YFG5O6Dj5lgJShNbRrmEVJGiWsWwlDv9Rcf
 OhOEh1I/UfbRuj2kvkTROSrBwbKgLFnp+aIBFFribnKB7W8Lfsyrd1uLPeT3XFiYrWmyekHnmh4
 2EoWYzRpdXKHYr+LDiItzEqAVyKnSd5i+3JJkiKcmiSVX/0fbfrJS+xOiL5gt02srLbcYkQWqOq
 jwsWourjVE/gsyuPWiQ==
X-Proofpoint-ORIG-GUID: GsbMqs6_lpCQxWrsMh9ZEy3EX12GToQq
X-Proofpoint-GUID: GsbMqs6_lpCQxWrsMh9ZEy3EX12GToQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160148

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 20e5a0fe7dbe..f175a33bc042 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -74,6 +74,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
 
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..6454efc03ddb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1

