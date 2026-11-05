Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874026;
	b=K96skiKKfOeQtCz+q8m53ldMmDMn2BF8tmezMSRAcQo215D+slRQDv+h8wGK0VzhTMzv
	 j1Vhe7+gwIw+860qawx5MWoMKBsTfyJK7qOd55ZhmPsr+FDmvKGeAAogwyP7Q1utISksm
	 bmXXvn4HyKuXUsY15nlMMYP3HPiS9mfqtj+IgjqqUn86ckS3eUb2vR4fVVyhoofeFfNku
	 ppRVJ2eesu88u7AI4UE55uZDL8a+FjaMj0lv3nJD/je7P2OYIarIFN1JRFd2MUTB+w0nf
	 w56R42A7kwfLsxq8+dTP+wpwRnjfAde2Z/rVjduO3FyHdLaVH/dpPVbieOhh+BT2/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GtolghIbMUkNU3kZ/Ak0HKZisx+UrI/mZBMSkPG0JYg=;
	b=Tq64eggnwjKRnoobtHfe/85FKcRMBIax0yPgRCekjubUvLLi2r5YYSXcUkYDrqleHpXo
	 JTE9IHv35cOoPmpMU8YbywJWkJr+Oma1jYm3OKoYBaN+eqJsDMDfilUaA1Bw9n+H7apX1
	 OjN1tawChGhJJXw1fN3Mc8HYIUSfRS+onM7ubYGFtiJW6k9EVN8+bh6U8OrOKEb30N4cJ
	 XBqa0L/PGnyBPQ+WFJGI99dRQiQ4qsyElnOIjPBVShFiEmCuE/16Td7HRXfP5W4ZYgZvZ
	 6OX66tieEkmURtGA1WvYpihiqiDaQrLUGK/AYh8e0r8CcyoahnQgY92OSmL0Ju9chkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L7gXxyXd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZ46S+Kf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D064606EE86
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D064606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L7gXxyXd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZ46S+Kf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tM954084489
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 10:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GtolghIbMUk
	NU3kZ/Ak0HKZisx+UrI/mZBMSkPG0JYg=; b=L7gXxyXdyWJxUXyLj7hVwZMR1zM
	AaDXd9NFFComATxyiYKfs2ftmkIn+KpW/4I7mK4ooNbSXzTUw5qgNF94M5/UCFbj
	1ud7yRxE++28peBL8PKuEibHQ++tOzH2jrJI5JrKHGAlrt0lwSNv0WKI/f7sPFQx
	oBeMkydEy8zATd+73H2x7jc7p7K6BqIEsYXek+bRR3l1OLfoB5DKiMpVfPNIKEsW
	hNaBrxbhH4FrSPxAm78sVEmJIGZLrG2KYT9fJGyDvj6IYxyK94tYQT9glxboNvht
	BCCUWo4u5Le4dFi14dxtX9uH0AcVU88H3amVxMpV+ZZwrMFjg4u64nEVlmQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr3u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:20:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso2288203eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874024; x=1794478824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtolghIbMUkNU3kZ/Ak0HKZisx+UrI/mZBMSkPG0JYg=;
        b=eZ46S+Kf0+S6Ss641xcGhQknSGkYoPxrI6G0A6+fXfYn5brDZgUEp1ARZhzCtyhb6P
         rhd5hdm8OI1OZtmarsjlciHAvR75pTjQE3ePk73ARpy5m+7Yo28hg55Aa+YBETdu8cs+
         yOoOpoGCGnWEaYl0uLy36XjqZIEeTCIcxcGpABMqR4YTzI3WuBu4FPWGsrT3A5an9tCA
         RVHNK5sWOG7kwvOb/QT9Mg0DKH96Xt7p1ahBTBeZ/ZEjgSZltM8mWaZSX7Cpzzz5Jq4q
         n9Kisoy7et0ymxUh9WUUKRjwoKTExvqgG57Ji0p94TJ9Nk9d5Lh70eePb0q+cLq2/EaW
         30XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874024; x=1794478824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GtolghIbMUkNU3kZ/Ak0HKZisx+UrI/mZBMSkPG0JYg=;
        b=H5KJUdwpO/6Ex2GLzocoEF5sUIzXZz5B43J3+3g5MYgW9hTItIi1tIBpCo3NTkBkB6
         h2xwn7m79dQZMHLj0BCYsBL5fIWX99bzNZS18wlpIjHTCYnUQJezhCpNx/9uKPgIHSlw
         f2mxnKOhDmIF6a07f7ZOPenjlw8NInjPQCLce68Mo7DpgxmyLXCzLjf3kn8n0d/j1lzp
         RQ4jjN4lsGF5kFfJ1P26EJf6jmcaNnFShGu4pGdWZKL2IxDffzxJS9z0M68E4yMfVKQx
         GCAII4cGfLGnAgmqglEFJqhI/WXITq/ZQmv1lPEAFfW300bde7DZ0iUSOZH6kGnLDx1i
         WREQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOpuWmcI2HJdcoBwVy9rwwhZeNkSiPx8h7y3HS/yrCy+TRGIl8leP6Og0e4hjGOc0x6rQePIpIS6KU@vger.kernel.org
X-Gm-Message-State: APuU4Z9FrPdK01IeMo2sSOZenrLwE747UA2uFKh5u5fPmOxBwNGaxs2p
	c4kecmiqxR3QbqF9aoYa7bFk0VUgqnh8ONJCK8xoQnEX4HU2pxvVUts6ELlCS99tdIDOpENDk03
	ZmYaCRexGrei8v0x46HE/NEGF8AJNLCZ3usxQLTP56asoNAiYSqu4yINES/Ee0XHF
X-Gm-Gg: AYBFou3LZrqyRfIpPJQOhMTluZ6PZgBWu5YBb6diOqmWxsyt8Q5JIqvN2RE7EgBJ464
	5sVt+YlXKcxZO5lQWc8bXFK3LIwWw2NgtyEEOaMizG21stS7QQGzjT2FNjg6ptOatW0YZGvJbZC
	IgIsflgy5HEzgwQ2kdf9XGu5jIOgcRR8EhGBKDEqv3So88pz1QyrOu5JnUYyh1soeff8lla0qSM
	7FTruynw1inNmzsUj06qpa3eLijpVIgWWOnH22DWE5W3Cxgf4brviFIxtsUW3zsxhtOPg1FIHZi
	Ko2tA/paaWtbySZfGX1WArZ3qL8FGjxRznR8VDcTZ8Wiu9MMNsA0O5Luwn3dTCgix8Bg4pqgM0/
	IXfDbxUPXXPSYe6gCRF/UAVciPW+LR0FzNHxwK5dK1ZG118Df24OhX2LvjZ+9q2poD7GNqVwcdQ
	8NZ4uLyUKJ
X-Received: by 2002:a05:693c:20c2:10b0:36a:22c8:ac57 with SMTP id 5a478bee46e88-36a42436a2cmr29661874eec.33.1793874024054;
        Thu, 05 Nov 2026 02:20:24 -0800 (PST)
X-Received: by 2002:a05:693c:20c2:10b0:36a:22c8:ac57 with SMTP id 5a478bee46e88-36a42436a2cmr29661825eec.33.1793874023233;
        Thu, 05 Nov 2026 02:20:23 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:22 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V6 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Thu,  5 Nov 2026 15:49:54 +0530
Message-Id: <20261105101955.3732723-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX7QAdbL7LKbpk
 0Ye+qmcD8NzBwFc/WbZpQCFoQUjr7tKeUQhsyviJd4SdCZNrpVVAZ8D4vnWpDBgo9Q9JacpMwNA
 8NzmHjK+b2Zt7C6rJuD13tLO7+B2hku60amLGAXZOs0O2Mk5zbq931jdnxUOICFL/oCGcz1KZwc
 /YAGuayyUDX70EucD8ZuFHAJ08MKWIXBibqWabNArUUf44082Q2FVhaZYaIT2m+skTmlDkEot7I
 WMJn/DWdvQXxFm83asakRrYI8OEtUOY/pNpiqJkFzxz3aCT0Thv3qqkK0nc7aRZbIT7bvVVy5Ws
 kviZPoTDVWOm2NcXajkuqKBn4JSHcpZyMRgFIhPCsQKAhkb30+8pLidhqBK9Fg46fCQABjk0qju
 5RoExcOm7g3SvxfhgthouyAVubiyeuh3xu+YI6vlnRpxV7ao9GCe9Mu/S73iIBM8MpgG/qleCcW
 C7RGijIYH1oIoDZGjwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX3FBkHnaPw0V4
 gqBieWphpEZsvGIEwyYlcx4rlucQ+q/DeHNri0V/ceo7v5rjpX3hfSoNA0jJEIeksU+BwwcYWhM
 VOfTb18ZUXa68MkhF4BKgGgeRsY/0JI=
X-Proofpoint-ORIG-GUID: i5Kaiqll6ZG-zov5heUkwXx3tNAsBwLE
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec5869 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=533hFNQyOw2-QXVkCMkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: i5Kaiqll6ZG-zov5heUkwXx3tNAsBwLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

The monaco EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
configuration from it. This allows storage media selection to be handled
through device tree overlays.

Introduce an SD card overlay that enables the SD Host Controller
Interface (SDHCI) for SD-based storage on the monaco EVK board.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 3 files changed, 76 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..1c5b2e95cb9d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -82,6 +82,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
new file mode 100644
index 000000000000..bc4ea12587a2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
@@ -0,0 +1,72 @@
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
+/ {
+        vmmc_sdc: regulator-mmc-sdc {
+                compatible = "regulator-fixed";
+
+                regulator-name = "vmmc_sdc";
+                regulator-min-microvolt = <2950000>;
+                regulator-max-microvolt = <2950000>;
+        };
+
+        vreg_sdc: regulator-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
+	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cap-sd-highspeed;
+	no-1-8-v;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc1_opp_table {
+	opp-100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+	};
+
+	opp-202000000 {
+		opp-hz = /bits/ 64 <202000000>;
+		required-opps = <&rpmhpd_opp_svs_l1>;
+	};
+};
+
+&tlmm {
+        sd_cd: sd-cd-state {
+                pins = "gpio11";
+                function = "gpio";
+                bias-pull-up;
+        };
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808..4c30dd110832 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -744,17 +744,6 @@ &remoteproc_gpdsp {
 	status = "okay";
 };
 
-&sdhc_1 {
-	vmmc-supply = <&vreg_l8a>;
-	vqmmc-supply = <&vreg_s2s>;
-
-	no-sd;
-	no-sdio;
-	non-removable;
-
-	status = "okay";
-};
-
 &serdes0 {
 	vdda-0p9-supply = <&vreg_l4a>;
 	vdda-1p2-supply = <&vreg_l5a>;
-- 
2.34.1

