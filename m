Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693070;
	b=UE+XbKt3/jnHob29IHzN4TwtDfrf1DGTVijIGMw/qKteBbK8KMxFMBbSNj2AMNLMjdfa
	 /DwCaR8beB0E+lUMW8Zxv/9d+ePMlQpc8tJ/PeqFUmE/JAG4sx68AR8ZFsZo0NDXsc9Xp
	 QJImFXGj+6GBhOUCzZ0Y9vddWAg6kzUrd5E98M61KjSXSwgis+hlhETogEPv2lq5WHsRU
	 EU6Snf6TKOVQnTKvlvUC88Ky9sxWJwwwH9Cpv9yMP+6CT+finXTyFX+zufRW4Y/r7V9fp
	 puhgq+RpXNGg9FoeEZvoims9jwQdYrZkt/NjwasTIfFBLk55O15yt5DhVwGy3XgjFwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
	b=g6KAZ/FQxmp0AOZcTsuWgmqdxq/0Pc3rxIW51g2SsOa2XXc2Ve5vym0hsZdj6ISliN6A
	 UpQ0o9wN5XQqUv/BNfa5a0+Nd80rRu6Z5fWaQ4ecLn03C2pRUiGBlsXK8Km3/6m/aqZRV
	 8m5UkB2nLme5QBChdDgDZ7RIe9V7/b7Zf9pPKOx0tz/ixU2b7J30yL1mHiXSxh8er9GL9
	 q4Smqkb6y+q14KkgymFymbuHfftA4ufZN9sG3tQ0DuuxocJeQGtQYYXRS9ndp0gdJIZQm
	 XY/IYnwE6YF89ne9vQ3e3ayv+Uly8HZSm5OhRpXUgX/tOy4SsnFpL+CPdT0I4YXZwEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFyF1npW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjpkUkGe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C14606A691
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C14606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFyF1npW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjpkUkGe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVIoZ3476075
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=; b=YFyF1npWBUPrpKGx
	03Idc/jl503Mh8IvsP5cFqI2ifkAzCGwGoT7W70dhyEwmZ6uCXi7aUUrsT+shyal
	M3E6Au5NGAqIzxvl5ZfaoUIONeJPIuyFFOZgTJ/sq0RWsmM1gd1Z3mlBowQGapet
	9LU13hvFbZne0zqgkPTN/8bbxOrnyE+PB/MtN884hr6SUyCT/N2AYAI+CmO6JJme
	p8nbl/7jqC3+le7yAfqkCDYNxd5CvZt6juOtwqAUIbJSxkoH0O30NLvGOSKsH2lQ
	vYe+pAk4Vcml/cv2nLJI1dgxBRtWafkOPuyIqODzaCznISGUI9fxBrBD8p+JTRsH
	AiADFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rh7su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso1266236285a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693069; x=1796297869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
        b=OjpkUkGeF9F07UW+bXXzjvi9u6hM0DwRuYozxiUBsltmm7HiiBCuIHvmUmlTveQWkX
         koWfvHY5v6MuzwPCb/rzZXo82NrPwQHj0FZ6+kuS+BqBjxDmU4APxp1rBfvnhULuOkVW
         YJDFq4Mr+euX4O60VZmRZkrQxJRy+I0eNmC6/J4Xs4s3wxHBYUZPFgjdOYASFqEt4TfI
         tw6Gn6+HjssBMW8VyufojXOk1SZ0HeqHuhEbk9kGN2m4BKHa0tbh6KsJ0vSqoMqcjpM7
         gQEsuTNSNF/hKlpgxcbsb5YsD4x6QbrpGN3lMmNcnvc/kx61KZbVwnieEnlKyx0aLrRB
         Smwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693069; x=1796297869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
        b=DhLcxh1kYJ8ZKBOlAyHLDHOvGcAwqReF+7oynqz0SXjzv3KGW3WWf7lE6FMoKpzVmM
         dJnb2heeR5JnhTWKevqWx4X9iMfWkoFGQTbxNNCX2sUnkB0ImDFy6oUObR+haAhggqaF
         CWm1ydnUovpw3VGq+fh8crThHewelrO+NyCvFcWY/NqrMVRL0Db0zrVlJqxfweH9Uxk1
         04ZtSxvfRD3cCWWSTzIkFz0OF2Sw8+QAwzlDAOpcJIt+FmXP/O7k60iO4xhfliqh48K+
         JFQumVXPjqI+8RCJup8PYkQ3V3vePmSauRBN0DGMBIMKJbvnhwQa5qV8cxEGzVu+9ngu
         zt1Q==
X-Forwarded-Encrypted: i=1; AL+hErGcOEdrrGfN/RXxnF6DcbUNZJ7z/TH8GLoSDyrXgAAMYOKSPDWTpg4At1ZKHp+0Gbx4Tnd6V2mrtTKr@vger.kernel.org
X-Gm-Message-State: APuU4Z9YFlZcHWsHM+OfcgDNtCsZRBWsnkZMOQiGn5gInKcy7CbEXtiz
	hPZzuByZed/R08XyG+/F9sFmkl0H7RueYye4UQqpt7DNGM8rFUiMx1/DET3udrl+wQYrWjc2e6q
	UhAmSTBAToLFm1xnLcRN6+PoYnR6KUz8HmyqSXckDWJ++r9SsMHi1JqUhp5E1hAkx
X-Gm-Gg: AZFdTZclVaVxDCQvH1NzW1UDv7RSwGYZNmTcRk91BfYAA/1jjNJV4kXficIBxHN0Ds5
	Hth8AR2EkKv5/J5ZSnlnCE8O7xSu/2bVLQzm/Qc21fnZxgx1CIYTFgKDqu9xx4nOMYXWy8GhrQ7
	P4a7aOcQdcM2+xsChLekwctc1q/ma801QhUR1fLpIINGtV4n6UIb44RF4KrtslwIblUcps54LoQ
	wj4fv1Xft1VMMFF59llign8WKGD8epWBWuirOEdWeP41q8BlIxLmvzRKO4Vf1jsgy0KDhrW+vrg
	6pkIQoXejcJz1bZ5bnsZeUt0aq5OZzn4zU+Ups/4AESWvLBfP8ao/KkOzcfkVDxxKOzq5DRSr9s
	8usjoYGhj2gW6dNhYJFDVeZO+EUUbAFXqthsuto4VZWjOGuf4CUrUlFIKz6GPk79UsV/IEjWY1H
	N7j/tnomvfNesc
X-Received: by 2002:a05:620a:40d:b0:949:f8bf:b6e9 with SMTP id af79cd13be357-949f8bfb90dmr1019348185a.25.1795693068784;
        Thu, 26 Nov 2026 03:37:48 -0800 (PST)
X-Received: by 2002:a05:620a:40d:b0:949:f8bf:b6e9 with SMTP id af79cd13be357-949f8bfb90dmr1019346385a.25.1795693068364;
        Thu, 26 Nov 2026 03:37:48 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:47 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:48 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: agatti: add an EL2 overlay
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-agatti-el2-v1-2-4e25fd64f198@oss.qualcomm.com>
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX5mdR8rLjoQK2
 Cks8hq9b1T2jFebYbFeW1SC1cJ8AprTMcsYR4jn6BhU8cGsjzKoeTjtk9yPEZt/DZ6MRUbBv5zR
 clRxycZ6MtWh6tW6m3BXEwRNChEW9jw1b+smxJ3Q/vcCDLzmvvw0b2WuW74O+5PO/Cq/d+RJ/n8
 7fkkfwXWQv38Nab4O2P2uj7ukbpH+t+tp9degNrJ6SsPzZh4kipcuw+Gxl73yznMYhCjOJyuWkN
 yZQpfW7UB41cy1cqHgak6kN5e0AmnFW7spyZonh4WbDcnZy81IBmeowJU0pPJufomvOLxOwIANv
 doth+WCW/CiK/VKXfxhtrNEFZQ1gW1ExvAcV7ZRTfeqrmHB3uNOeXP37LuVgN1M5KYt5zwEE9sg
 ODPb45dJ6ExV+YxPbP0eHY+kfeuyRapfkmfNOe8P651wYJMhHFg5f+DL1wNdPLwAZtU3zm5DgOK
 6xnJVJ0chIOQMqFCrRg==
X-Proofpoint-GUID: Lx_O8HfbbwDk3IiDHPabqQsHPSsRtMo1
X-Proofpoint-ORIG-GUID: Lx_O8HfbbwDk3IiDHPabqQsHPSsRtMo1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX1NDUXnDhy8bn
 TTtEiZQcbAHzPEH3e4lNpoXAkGFKIiduRouKApdI2Epn3jKXN+DboCnSdxU0p2Flle6JSL+xvBy
 jZYyhpAX5grP0+etCOiaWPjaO0lmnuQ=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b081a0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RzYfMtsfNbY3csdru8QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

With a boot chain that has no hypervisor (TF-A and OP-TEE in place of
QTEE and Gunyah) Linux runs at EL2 and owns the APPS SMMU.

Add agatti-el2.dtso for that case, as the other SoCs have:

- disable the zap shader: at EL2 the GPU driver programs the CP secure
  registers itself;
- give the ADSP remoteproc its SMMU stream (0x1c0), so the PAS driver
  maps the firmware carveout and the resource-table windows for it.

Build it for the Arduino UNO Q as qrb2210-arduino-imola-el2.dtb.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..70e41313b4d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -278,6 +278,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
+
+qrb2210-arduino-imola-el2-dtbs	:= qrb2210-arduino-imola.dtb agatti-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 
 qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/agatti-el2.dtso b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
new file mode 100644
index 000000000000..60142be50417
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Agatti specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1c0 0x0>;
+};

-- 
2.53.0

