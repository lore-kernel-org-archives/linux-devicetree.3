Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371513EB815
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004225; cv=none; b=fSpYWDA51kadKr2KgUnnh8wo0SqZLvdBgq5ZHGeHwjh5tx9NW6whxkgaRuJoYEAUvGRzyYPsg3J8C8X3qW61uKIvGgv5hI8Siy1UP1+Q+JQsv5cLqRxFAdX7uqYS/MefGTQ2wqdevO480VoyRN0NVYuUFQdPtVc5sBAhteq7/AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004225; c=relaxed/simple;
	bh=iWXTPmtMqIOF0mmP+aCIYUTs0ejaYfyGp4HDuA1kqUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYhZbvF25IvWObvrl/rl09BgmnkUuffcIXGvWg1y/cGdIXPly2OeOK6Q+5n4UhnLe/axkZhr/wbfhkv0jyBuXEDs4ugaeGOlPrk8rxUegrQuGOX5mccKvC0ALxHIOiRv4swpMhRNK2CvMxSNExJapyyAcGlQUJQwMCcxXigKdQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaVWuzRS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDJZTp1I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaVWuzRS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDJZTp1I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767mbZa1024885
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CQG8hzsUvsJ
	yfuajFcuAKU9rDPRvEiEWDJS8VbBt4qI=; b=kaVWuzRSGRyrapRcTYv1fS7XIuS
	rKyHraUga14rwfE93r2IAmXlPNv3C2/mgOc9slaNWy6qoCdbM9mRrZKhKWGmU2A6
	FvIJmV5mX4VafoQ9c9DpvfE1RQ5Gumba8MS+Ca04Tr4fBiahoICrMRsG89zIbJVr
	eYSGulu1fBlrJm0FrYNi5vQ/lJnQB7UC7IXucxiFD2sagxt6S8+UtE6KGYxgkRe6
	wE6mmQtb5jqm6B+bpcFlZp47HvXhsmZG84Z8pBg4Bk1ycI9pti0Kj0zac7J9eGP8
	te91SVJUeu3HVdCstTDud1htsX7Df+IW5DVVrq9MctR7zwyyeKn7wyxX7lg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp7283gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:16:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484ba00601so2498130b3a.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786004219; x=1786609019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQG8hzsUvsJyfuajFcuAKU9rDPRvEiEWDJS8VbBt4qI=;
        b=CDJZTp1IKrF5ZS/1B77GYtPfj+JXUmigiMUXDZo3o1KnGEPFocU0d1RK+uvNrSngVP
         YzqWzkBScGRG2df4wrltdGcoyE8AcpxeFFiXNeMQzSF4CIxwDKQS00mrjmRvJDOfyLn9
         peS0sDulQGf9CImHFrdJos867TOItcVCwq8yqQi9xsLW1/othSrgsY2xDVXM6KftKVIS
         AkWTlpvHxP3PsjWwLbRcUqaZgD0ebJGcs/BjGBuwF5H796TLMMNEAZM4NLfobsPhnsMv
         rKEsOo47y1dmKskORnWt8itd62TNPuZ4wanXXy/GsEDzzfdg9rE4W/4nhNTB82px2Cnq
         qL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004219; x=1786609019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQG8hzsUvsJyfuajFcuAKU9rDPRvEiEWDJS8VbBt4qI=;
        b=r8OXJMucgUjVAGInYCFahUXyE+1PIOmNmzgJDgdNGwvkQZwpp9R860K21XanIysEwb
         2KyCt6fO+DyG2AvMDKTqeXjholkMOLKE20zwkKR0buxUOI9PB1C+qzZRmdUVjAwcrZrI
         9I+ap7x3d41e96o36OTV1ZaXuqxadWzh28pj7b2g0W05dM6O1YjAiGPM6EV9dG53uiim
         vp2gUctCETdyFKyQoYyjyJLh3MGF+e03DEl3Qz7z9l3sjjF7XRJsn57IQu/cYRAQe5gC
         EY09X4bxvSGsAh1oAg+DYObfiBzeXSaVP3pgc0XY/PthYw8W89WnIpezUETfPChrDBb/
         wLog==
X-Forwarded-Encrypted: i=1; AHgh+Rr8eRGuAcqs8bUIvGno4oNSAgXEBdKGvKbREPBjfrqnEQ/pATwcaKaZicZBs6y3xizy5MMQI5ubn3vp@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNhA/xenrBFUf4Yixe1siMLYb7YnCLfaUoFAItdiKxPmeqRG7
	WH5k1KMUP62KK5QGVryLNOjQQoi7q9pErhX1uaT7CyOJS0I8FiqOlm7+aku7J85uSGvmwwNIFmJ
	g+AjJC0j0Lidm1t+TtoQGdkmxYHRaILceWG0r3Rd53qJSk3atWpm01mrkvrZGISIi
X-Gm-Gg: AR+sD11hedNl60DYlzVQNldO0SBu4MsajzI7INHU1U6Q7bW6kUMxKNhG7TSR+Ecw0u5
	b7iX6MEnJ6dsCYy0a98KhorEyvm9GKGPizaVnLgoIcl83gJRLiZEYOk6bLySMDRF5KwScSJT4z5
	N71HqbjcgIr8Z3j9Ideu0lbuviWlvBM/CdCeNbyLVvy2AvZULM2FuIUNdI0h/pHBF+X8KLdPKtM
	+SMdaMwMmzBvzGy9+ycW4UQLkCphh92WnpcujME7m9KrYouHob9t1vqWbTn0IndvuBABovwvRyS
	GuhYTwg7IIjgvLCH5AkLoVeCgQQ1SW33OWWgd1UaFf85dgr10iNPsUufvEoBmsXpEaHAw3Gg6d/
	NsWfzj11MKSXEXRXhaq3koFF9ByYvQdfRAXBfqVKY0sYGF3xFO7cL+5wmMkJN
X-Received: by 2002:a05:6a00:2406:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84f2e094eacmr13804713b3a.31.1786004217874;
        Thu, 06 Aug 2026 01:16:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2406:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84f2e094eacmr13804633b3a.31.1786004217031;
        Thu, 06 Aug 2026 01:16:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538bc9bsm921225b3a.11.2026.08.06.01.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:16:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v9 2/6] arm64: dts: qcom: Add device tree for Nord GearVM variant
Date: Thu,  6 Aug 2026 16:15:50 +0800
Message-ID: <20260806081554.448531-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
References: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: r1ZqQkS2mEFt9KF5_N-6AwlnzzWY6ATI
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a7442fb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=C7SS7-jxath9lZw70LYA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX66J1EQX8fxmh
 ACZVUTmPghMVuEzeunewkes3EZPcwV2ayKhFMj+pjV6MldRLPhx/C8NiXi6JbC4/ffS42wTbSPe
 cCGtrusJ8e0KOm7h39kX+LSeEpCB8eCKtHWwxr37fFd+3Z1oTf4RLVz3NcYad3G/Z8a/nO7sr4T
 d25WiDTGkG8ycG5uLm4mRktGT70TTxzBsQ3gJKC1yyMKU5ePExTpBICPx3k4joyCUbUg5mLf1i6
 SV3zMKl17McYYtY9KzIVQ0ocetrinLthQQOb3pmi2HZUTC76tLpIa5ouVXBZunoZi6pmwoN3Ou7
 mrt25gm9G5wVVVcHGnfEIhS9Z18cf09hDNki0MCzP/xXL8sj+rmyIr1ZR1cqEUiWKDl1ngHy/vD
 HfcCqY9MOX19UQefXtS/ISuyZa0LgGJkZl0CbZ1YcYtJ74+FCNFVcCn5rss7ptdQ/UDEdS9UDD3
 hUwaYBawPpkR88EkLqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX8cvl7pMIsIM6
 hJdcniU4xZNNWeR9UOolJOrqr/uIJDK95aZwjCrHjFOZt7/RgfVQoTlVGw+fnuSZd44Stk5LZzM
 56ovl2E5XSDqSIwQkyv3EvqclufmkZE=
X-Proofpoint-GUID: r1ZqQkS2mEFt9KF5_N-6AwlnzzWY6ATI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060063

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add SoC-level device tree include for Nord GearVM variant, where a VM
controls platform resources (clocks, regulators, powerdomains, etc.)
as SCMI server. It currently covers:

 - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
   for SMC-based firmware communication channels
 - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
   controllers using SCMI power and performance domains via scmi11
 - UFS host controller with SCMI power domain via scmi3

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi | 2848 +++++++++++++++++++++
 1 file changed, 2848 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
new file mode 100644
index 000000000000..cd20acb89c1b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
@@ -0,0 +1,2848 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "nord.dtsi"
+
+&firmware {
+	scmi0: scmi-0 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem0>;
+		/* We expect the bootloader to update the IRQ number */
+		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi0_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi0_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi0_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi1: scmi-1 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem1>;
+		interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi1_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi1_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi1_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi2: scmi-2 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem2>;
+		interrupts = <GIC_SPI 965 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi2_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi2_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi2_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi3: scmi-3 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem3>;
+		interrupts = <GIC_SPI 966 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi3_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi3_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi3_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi4: scmi-4 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem4>;
+		interrupts = <GIC_SPI 967 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi4_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi4_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi4_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi5: scmi-5 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem5>;
+		interrupts = <GIC_SPI 968 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi5_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi5_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi5_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi6: scmi-6 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem6>;
+		interrupts = <GIC_SPI 969 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi6_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi6_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi6_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi7: scmi-7 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem7>;
+		interrupts = <GIC_SPI 970 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi7_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi7_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi7_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi8: scmi-8 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem8>;
+		interrupts = <GIC_SPI 971 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi8_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi8_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi8_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi9: scmi-9 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem9>;
+		interrupts = <GIC_SPI 972 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi9_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi10: scmi-10 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem10>;
+		interrupts = <GIC_SPI 973 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi10_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi11: scmi-11 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem11>;
+		interrupts = <GIC_SPI 974 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi11_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi12: scmi-12 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem12>;
+		interrupts = <GIC_SPI 975 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi12_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi12_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi12_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi13: scmi-13 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem13>;
+		interrupts = <GIC_SPI 976 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi13_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi13_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi13_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi14: scmi-14 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem14>;
+		interrupts = <GIC_SPI 977 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi14_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi14_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi14_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi15: scmi-15 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem15>;
+		interrupts = <GIC_SPI 978 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi15_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi15_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi15_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi16: scmi-16 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem16>;
+		interrupts = <GIC_SPI 979 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi16_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi16_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi16_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi17: scmi-17 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem17>;
+		interrupts = <GIC_SPI 980 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi17_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi17_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi17_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi18: scmi-18 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem18>;
+		interrupts = <GIC_SPI 981 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi18_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi18_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi18_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi19: scmi-19 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem19>;
+		interrupts = <GIC_SPI 982 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi19_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi19_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi19_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi20: scmi-20 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem20>;
+		interrupts = <GIC_SPI 983 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi20_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi20_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi20_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi21: scmi-21 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem21>;
+		interrupts = <GIC_SPI 984 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi21_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi21_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi21_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi22: scmi-22 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem22>;
+		interrupts = <GIC_SPI 985 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi22_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi22_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi22_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi23: scmi-23 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem23>;
+		interrupts = <GIC_SPI 986 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi23_sensor: protocol@15 {
+			reg = <0x15>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	scmi24: scmi-24 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem24>;
+		interrupts = <GIC_SPI 987 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi24_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi24_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi24_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi25: scmi-25 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem25>;
+		interrupts = <GIC_ESPI 0 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi25_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi25_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi25_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi26: scmi-26 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem26>;
+		interrupts = <GIC_ESPI 1 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi26_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi26_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi26_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi27: scmi-27 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem27>;
+		interrupts = <GIC_ESPI 2 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi27_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi27_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi27_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi28: scmi-28 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem28>;
+		interrupts = <GIC_ESPI 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi28_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi28_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi28_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi29: scmi-29 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem29>;
+		interrupts = <GIC_ESPI 4 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi29_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi29_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi29_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi30: scmi-30 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem30>;
+		interrupts = <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi30_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi30_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi30_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi31: scmi-31 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem31>;
+		interrupts = <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi31_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi31_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi31_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi32: scmi-32 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem32>;
+		interrupts = <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi32_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi32_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi32_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi33: scmi-33 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem33>;
+		interrupts = <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi33_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi33_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi33_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi34: scmi-34 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem34>;
+		interrupts = <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi34_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi34_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi34_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi35: scmi-35 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem35>;
+		interrupts = <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi35_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi35_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi35_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi36: scmi-36 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem36>;
+		interrupts = <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi36_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi36_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi36_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi37: scmi-37 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem37>;
+		interrupts = <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi37_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi37_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi37_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi38: scmi-38 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem38>;
+		interrupts = <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi38_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi38_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi38_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi39: scmi-39 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem39>;
+		interrupts = <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi39_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi39_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi39_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi40: scmi-40 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem40>;
+		interrupts = <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi40_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi40_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi40_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi41: scmi-41 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem41>;
+		interrupts = <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi41_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi41_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi41_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi42: scmi-42 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem42>;
+		interrupts = <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi42_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi42_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi42_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi43: scmi-43 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem43>;
+		interrupts = <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi43_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi43_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi43_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi44: scmi-44 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem44>;
+		interrupts = <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi44_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi44_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi44_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi45: scmi-45 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem45>;
+		interrupts = <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi45_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi45_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi45_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi46: scmi-46 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem46>;
+		interrupts = <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi46_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi46_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi46_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi47: scmi-47 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem47>;
+		interrupts = <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi47_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi47_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi47_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi48: scmi-48 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem48>;
+		interrupts = <GIC_ESPI 23 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi48_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi48_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi48_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi49: scmi-49 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem49>;
+		interrupts = <GIC_ESPI 24 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi49_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi49_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi49_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi50: scmi-50 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem50>;
+		interrupts = <GIC_ESPI 25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi50_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi50_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi50_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi51: scmi-51 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem51>;
+		interrupts = <GIC_ESPI 26 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi51_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi51_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi51_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi52: scmi-52 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem52>;
+		interrupts = <GIC_ESPI 27 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi52_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi52_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi52_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi53: scmi-53 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem53>;
+		interrupts = <GIC_ESPI 28 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi53_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi53_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi53_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi54: scmi-54 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem54>;
+		interrupts = <GIC_ESPI 29 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi54_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi54_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi54_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi55: scmi-55 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem55>;
+		interrupts = <GIC_ESPI 30 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi55_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi55_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi55_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi56: scmi-56 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem56>;
+		interrupts = <GIC_ESPI 31 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi56_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi56_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi56_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi57: scmi-57 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem57>;
+		interrupts = <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi57_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi57_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi57_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi58: scmi-58 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem58>;
+		interrupts = <GIC_ESPI 33 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi58_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi58_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi58_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi59: scmi-59 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem59>;
+		interrupts = <GIC_ESPI 34 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi59_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi59_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi59_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi60: scmi-60 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem60>;
+		interrupts = <GIC_ESPI 35 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi60_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi60_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi60_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi61: scmi-61 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem61>;
+		interrupts = <GIC_ESPI 36 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi61_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi61_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi61_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi62: scmi-62 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem62>;
+		interrupts = <GIC_ESPI 37 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi62_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi62_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi62_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi63: scmi-63 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem63>;
+		interrupts = <GIC_ESPI 38 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi63_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi63_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi63_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+};
+
+&i2c0 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 0>,
+			<&scmi11_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c1 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 1>,
+			<&scmi11_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c2 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 2>,
+			<&scmi11_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c3 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 3>,
+			<&scmi11_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c4 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 4>,
+			<&scmi11_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c5 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 5>,
+			<&scmi11_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c7 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 7>,
+			<&scmi11_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c8 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 8>,
+			<&scmi11_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c9 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 9>,
+			<&scmi11_dvfs 9>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c10 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 10>,
+			<&scmi11_dvfs 10>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c11 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 11>,
+			<&scmi11_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c12 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 12>,
+			<&scmi11_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c13 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 13>,
+			<&scmi11_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c14 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 14>,
+			<&scmi11_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c15 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 15>,
+			<&scmi11_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c16 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 16>,
+			<&scmi11_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c17 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 17>,
+			<&scmi11_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c18 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 18>,
+			<&scmi11_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c19 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 19>,
+			<&scmi11_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c20 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 20>,
+			<&scmi11_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&qupv3_0 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_1 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_2 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&reserved_memory {
+	shmem0: scmi-shmem@d7600000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7600000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem1: scmi-shmem@d7601000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7601000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem2: scmi-shmem@d7602000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7602000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem3: scmi-shmem@d7603000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7603000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem4: scmi-shmem@d7604000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7604000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem5: scmi-shmem@d7605000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7605000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem6: scmi-shmem@d7606000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7606000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem7: scmi-shmem@d7607000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7607000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem8: scmi-shmem@d7608000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7608000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem9: scmi-shmem@d7609000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7609000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem10: scmi-shmem@d760a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem11: scmi-shmem@d760b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem12: scmi-shmem@d760c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem13: scmi-shmem@d760d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem14: scmi-shmem@d760e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem15: scmi-shmem@d760f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem16: scmi-shmem@d7610000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7610000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem17: scmi-shmem@d7611000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7611000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem18: scmi-shmem@d7612000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7612000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem19: scmi-shmem@d7613000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7613000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem20: scmi-shmem@d7614000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7614000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem21: scmi-shmem@d7615000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7615000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem22: scmi-shmem@d7616000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7616000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem23: scmi-shmem@d7617000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7617000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem24: scmi-shmem@d7618000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7618000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem25: scmi-shmem@d7619000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7619000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem26: scmi-shmem@d761a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem27: scmi-shmem@d761b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem28: scmi-shmem@d761c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem29: scmi-shmem@d761d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem30: scmi-shmem@d761e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem31: scmi-shmem@d761f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem32: scmi-shmem@d7620000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7620000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem33: scmi-shmem@d7621000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7621000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem34: scmi-shmem@d7622000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7622000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem35: scmi-shmem@d7623000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7623000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem36: scmi-shmem@d7624000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7624000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem37: scmi-shmem@d7625000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7625000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem38: scmi-shmem@d7626000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7626000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem39: scmi-shmem@d7627000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7627000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem40: scmi-shmem@d7628000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7628000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem41: scmi-shmem@d7629000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7629000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem42: scmi-shmem@d762a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem43: scmi-shmem@d762b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem44: scmi-shmem@d762c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem45: scmi-shmem@d762d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem46: scmi-shmem@d762e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem47: scmi-shmem@d762f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem48: scmi-shmem@d7630000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7630000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem49: scmi-shmem@d7631000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7631000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem50: scmi-shmem@d7632000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7632000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem51: scmi-shmem@d7633000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7633000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem52: scmi-shmem@d7634000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7634000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem53: scmi-shmem@d7635000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7635000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem54: scmi-shmem@d7636000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7636000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem55: scmi-shmem@d7637000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7637000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem56: scmi-shmem@d7638000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7638000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem57: scmi-shmem@d7639000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7639000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem58: scmi-shmem@d763a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem59: scmi-shmem@d763b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem60: scmi-shmem@d763c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem61: scmi-shmem@d763d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem62: scmi-shmem@d763e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem63: scmi-shmem@d763f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763f000 0x0 0x1000>;
+		no-map;
+	};
+};
+
+&spi0 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 0>,
+			<&scmi11_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi1 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 1>,
+			<&scmi11_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi2 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 2>,
+			<&scmi11_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi3 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 3>,
+			<&scmi11_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi4 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 4>,
+			<&scmi11_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi5 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 5>,
+			<&scmi11_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi7 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 7>,
+			<&scmi11_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi8 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 8>,
+			<&scmi11_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi11 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 11>,
+			<&scmi11_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi12 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 12>,
+			<&scmi11_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi13 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 13>,
+			<&scmi11_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi14 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 14>,
+			<&scmi11_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi15 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 15>,
+			<&scmi11_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi16 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 16>,
+			<&scmi11_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi17 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 17>,
+			<&scmi11_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi18 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 18>,
+			<&scmi11_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi19 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 19>,
+			<&scmi11_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi20 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 20>,
+			<&scmi11_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart0 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 0>,
+			<&scmi11_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart1 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 1>,
+			<&scmi11_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart2 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 2>,
+			<&scmi11_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart3 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 3>,
+			<&scmi11_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart4 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 4>,
+			<&scmi11_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart5 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 5>,
+			<&scmi11_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart7 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 7>,
+			<&scmi11_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart8 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 8>,
+			<&scmi11_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart9 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 9>,
+			<&scmi11_dvfs 9>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart10 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 10>,
+			<&scmi11_dvfs 10>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart11 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 11>,
+			<&scmi11_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart12 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 12>,
+			<&scmi11_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart13 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 13>,
+			<&scmi11_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart14 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 14>,
+			<&scmi11_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart15 {
+	compatible = "qcom,sa8797p-geni-debug-uart",
+		     "qcom,sa8255p-geni-debug-uart";
+	power-domains = <&scmi11_pd 15>,
+			<&scmi11_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart16 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 16>,
+			<&scmi11_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart17 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 17>,
+			<&scmi11_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart18 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 18>,
+			<&scmi11_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart19 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 19>,
+			<&scmi11_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart20 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 20>,
+			<&scmi11_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&ufs_mem_hc {
+	compatible = "qcom,sa8797p-ufshc",
+		     "qcom,sa8255p-ufshc";
+	power-domains = <&scmi3_pd 0>;
+};
-- 
2.43.0

