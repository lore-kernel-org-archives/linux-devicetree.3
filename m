Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774033B9920
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893979; cv=none; b=JMdLOQweLaRpnS2pc2tkamBTiSisrSMS4blakoBEyhzxqVKn5r5WKP9Av2IF3VKMmTwNlBLJ/Q9/NjgFPnpUfpMmNTlmJkmU9iX29YeT7/l1CzAjGF2MbH+JumxgdfKS47/HOIQavbyMIZkEdlRCxghX3I/uMHwyfdvqXUZ1CkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893979; c=relaxed/simple;
	bh=Qj7nElh8Dxw2oCGhto93gjgUW0SgkImRKgctY43R//U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RjsJRSGm/bOZsWvgn5KvwWIB8oZdqSy8PDebVCcHKbKWadhVnWM+rvCq0fB8kSn6OZ0kN7d2Vw5tYzRPzgFZvxxJZtvk7oC1i70GwDcXRgNpN/8ntVA3Z1m0JlW7a7yCdnEMjrm1L54sAVXpMG80Cv1nhI2b+UW7us5+sbrF46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jql9nyP1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYW54pZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jql9nyP1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYW54pZ8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GMhH488818
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ef5Ji2dDzze
	Kj36vpeP5fZdbDYLrkWxDfp9sewJA92o=; b=jql9nyP1C6o0kw3+IHv7CW6t4Ix
	Yp6/IApzWuKO5WhbPO9o2GXJ9TRmgbhTs5bmfNXbTXUUyGM3M8EIuDS/s0o790LI
	PMmvoKEno+YadAiEm0SkU5F3ugn6GeWuXBEuh3d0iQq4S0TgSm0KJ2OF+tTYwn25
	8FzLviXL6UUIwhj73Wd62FtzUKmjppVOB6e7Vga+mt0PZA9STjix19BSsL1TE/oE
	G1pyhAvU5bgkFdAsGPsviOwWmN3Nmx6fjxwE5M01upfl/c/M7by4ZgE3iQV/Z+Lm
	/H/EBCkf/9UPgHKYtz+6d8Mj/4pPBxwcNrABv3xTTd/yh7xL9S8kxjhG+ug==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy1mc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:19:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a2509456so479456b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893976; x=1783498776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef5Ji2dDzzeKj36vpeP5fZdbDYLrkWxDfp9sewJA92o=;
        b=NYW54pZ8Hqw4lOu470shL8sn56QHN9vscEEzJC6PlQouaBUPp2okkmsCqlNSn6PDUo
         cQ1utfdpO+umPbW2MFImDvaGnW3owAtq46Zl0Q6UrJnL/5DNNqg/CnMZRcRXB5yULae+
         PILbpDEcchQSX+THwJzdlDLxN9jfvqoivQZ+1fp/6AfVlWvhGyawplI5XdY7+SQLlhWb
         Y5x8czFKk3P0x3yN4lBH9WgR7aFu8zUV5T3qAtclz9p4d7AUqC/nznTBCHPxiprz4RoS
         n+D5FcMLcVFYCQ1qIPI79mk85aJ89JmkQ/JxwlfNV8H0ouIv2ou8J5n5JEu34WNRM1bL
         j94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893976; x=1783498776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ef5Ji2dDzzeKj36vpeP5fZdbDYLrkWxDfp9sewJA92o=;
        b=WK2bdWQ5tM/3/LoYqBjFmXd01hTpYhTq8DjZ+zetQRzUqWZzouVnzgfnUgAADew3CU
         Ys1lP2qYpJNOdXjKyKKwfFx2ztUTSZluEQnZUMr6e7194TF1/glsgkb1MfdzGgVwLPgh
         M7kz3QEIWfGSO2o/KyxVL5Jd7oKGV1V4XgRdm/cTdaLJRn3/hvRh9WQjj1El9ezAtV2f
         ZsIg1JkFUoCSz37ToTZMTPsh26Xi5O0pQ84vX3LtNIzD7wTl/r7SzG0+49pKlAxZWClc
         200VoRZay1+q/lwVPIOEs0dIELm92Qoh4zBkCI+qe+gUg2IIE/xZLIqNsh4CU2Ro4iug
         9fnA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx85EfyCU6D473N8OfFxucK0pQ4+dPIO4145fZmR6COQcP5eNHB0dAoMpDGxY0GNzE2M8NSuNEqi+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kh2SLuCbrgBg1e9ALrfwJbJ9M9OG8uCnj8Ymaouqh5Gz4aeo
	o+/zYU8e91i8T7SYum2e+Nkz2kYqg9ELm2jaG6FuG2LmvNJLJI637Ze5HaNYePFJ2WLPN/3vTTu
	pVMS2YNq2Nb6pYLLYNnnOU3ZFDsXFGal3deh89jYMyG0yGXvqfIaZLaR8997OIhhaRSXw293+
X-Gm-Gg: AfdE7ckBXlBCaa6/7gqs7sDjwrVR7dtphXLtiToSPhvqqyFhazOaFNjFZH2JfgvjbXy
	UbSHELKObdlNj1SMYpB88dYMu4gCqbcybgoRHr9DGadXPuoNNrl9J7AlBsNgKLYnZzvHiE74tXL
	8M62xVRBkN+SKjdQQKtJFwKn5Sh4fy1nk8oDCv7QjSN0vml+eZnfnzMOXBvMolHqBAZPbIB8VOj
	bx/ADJoj53dg7A0iDIzEquvyq/v1Ski2CRr5mXa3TaZp2IDpJsPUzp9Ifxw6gegbv5jb9wlVCgQ
	FpdKn4Qu6d+i89BYoMnSnHzxVWKx94CCE0SA3s6fnXYnEjIN3Mg7Gfq+D6jI0xDDBRI7j6Kuwap
	z81AuepHtMYK5InIdaCN19rnsG2We5vYLzz/Cakcy1POQPg==
X-Received: by 2002:a05:6a00:2e99:b0:847:8b1d:22fe with SMTP id d2e1a72fcca58-847c0949065mr502269b3a.50.1782893976388;
        Wed, 01 Jul 2026 01:19:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e99:b0:847:8b1d:22fe with SMTP id d2e1a72fcca58-847c0949065mr502253b3a.50.1782893975933;
        Wed, 01 Jul 2026 01:19:35 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm3611542b3a.21.2026.07.01.01.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:19:35 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V3 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Wed,  1 Jul 2026 13:47:14 +0530
Message-Id: <20260701081715.2580329-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2caBINxCw1XZLnp9BL6aLHwZdu13Mib6
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44cd99 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MGA-IAg3UYKhKOWSYZAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX6rL2bh+IekF0
 /f/SBJkmAxjhUb+K/MtJSq9yLE9GDHDuQjqSngyJMwrxpjUJQ+j6B7tbqP2VJK17aIXnfb3NCOk
 kTZHTxpx0lAG7KIFGIaFYjqb9wgmpitOIOZnydNi7qcYQSJzToWcLCA0oOG4/O61LYyZG+uLw8k
 FN+QQ39oVaNgDn4ZbZv51s4a3OJfo92HUwJDggl95/yeV+VK5G6i9GLDZN6n9382XuO+Bn2z7w5
 CsY/I/c5DFIM1QcR6m+rBMJnw5gX4N3vEgispeWNO8uz5Ql+iC7kdDtCSo6jtWisRxNKJgoqkU6
 OV5JC+ruKVMXbjv5N25w4725vH08SwIRMDw1FQhUOzow6u2pBvy89R7zUW2UOBL6MUNzfUbQcuI
 tSfPBSogrZBXnszhL/7WSR7POvvVIn/80Bu0v93q/UMDbR56UOcg5E/XP1C7GnwLddE2NqBhtzJ
 9AIMfYh3wQ5FzjocE7Q==
X-Proofpoint-ORIG-GUID: 2caBINxCw1XZLnp9BL6aLHwZdu13Mib6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX193Wr7ZUseEf
 xr96gIkkf3fJJP9FZCa8w5OOxAfDAc2N6B5HREU+gVB1eBlSKo0lvqoUuxc4V8ALS8rd5eMcvvy
 wZzUQ5MQgvMsW9acPDStAEmwxPbc7ZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010083

The monaco EVK board supports either eMMC or SD-card, but only one
can be active at a time.

Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
to support SD Card for storage via a device tree overlay. This allows
eMMC support to be enabled through a separate overlay when required.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..3c5983bff00c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
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
-- 
2.34.1

