Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C33E00B3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797758; cv=none; b=ndXowykgVkMVHrtuvZVeMuItHRGV8Br1CzQ5kJGyoEosQrKZ2vmMOkUtkrFslijbzpzJvmUkBMnEyR53zfWlsuyxqvuuRT94m2JQ4gYjRO5rtW5W19DvThanOToA3In4Yk7lUY475EgXNcWBgRd1J78EmVqslUNMSJbzUKg9A+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797758; c=relaxed/simple;
	bh=nk4O2A9HsFYEKENAL+lO73VjDDWrKSCuDuCwrrq63aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9mqdo3l9WO+I8V086I3YofFREDcl8i6LH6BGeAHWaksD1jZ8QCkORxc3oa13ioxhwdHv1d3YJcKECIAz3rx0xlQEW8Ptnlw+kuK+K2Q3gGb6392ipmcLDUR0QaQ1EhumSWE9PHiE1SnVvccyaG8xTgzfriXadNVV+I8NRazAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBXrdQ99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiM8+1sJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBXrdQ99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiM8+1sJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qaVZ3517127
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EiTyNMqfM6ilFnk0P6b3RIj9XemC2TC1YTP2Eeap36c=; b=gBXrdQ99g1ae5uwc
	+ZtviJ0vSS5JzO/KLSeFbgehc4QwqeaToaA9/4Y56mTah7LCSsdKgi48Q8BEgWT3
	fuCoQYRLhKxvb2QiISe2MxJImbo9NrB2B2wETg0ot2PfLNLDbB1mVrJnODALCu4a
	AyPoLfLnLe8r/n22Lv0sHOwCoBiauwpG6SKYOoNqb7MFUAY0eYpbaqecN/J3Ri8e
	uI7raNf10DDYZUdC8qGmqgEOFyuAB6nhYC6YBfzqZJFmIe8Wjecm3IoxYL8n5KR6
	wsDnEZt2Z6EZdk4hMpu2crtLHvQoo6xqNt+8neUWJCWzxp10MP7VY/O+VaOiI+WW
	DEWqlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm14c24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so1062488a91.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784797755; x=1785402555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiTyNMqfM6ilFnk0P6b3RIj9XemC2TC1YTP2Eeap36c=;
        b=CiM8+1sJ6bx6FNHw9ll9ZWZ7vmIHdcITB3Y8zfLDY+KSxIBTiVQRcArIsdMGjvXxPS
         VU8H1GhJaIPpuQd7BuY+wXWBHHy4SQO/KpXdod3QrvNTNJMmVmhEwmilbSUYY+YogHSs
         4vIl4iJIOkU/pDekWStcDaRxuBj9MPXLKLxZW1J43nsFL2IVsNYfJE2ESxbf/QIMDhb4
         734zCvgno4l+Ly+gmSEuuPmITO2wPrNvfQOc2DGa7IHbFLSb0ayF/bfiz6jBWSJFEcua
         WMkCPHZyv6xngaLkCRXTFglcOL13u35HwMjjogDBVwitbdnj5PLUvvfUOwSzt3Px8Qpp
         RJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797755; x=1785402555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiTyNMqfM6ilFnk0P6b3RIj9XemC2TC1YTP2Eeap36c=;
        b=qm2Ob0eHiycx+0En6f88RKaaKqE5pdUadXuxPFl/Yzb4WqIDx56NdLQZpSb6ObsivF
         DHWyCYrmzDfBEjWoyrmVONB2NUu1yaqKNbO1qWuZ6qymI3zkwXxzNJAeMR2b6NpD68Fw
         FuMnuswMSg9kKdNn7jUg4/7DYUFFzVpcbCdBdacwq1YeZivHqgxsC0zbGJXTwxz132oj
         +PHdo78xHM+D6TWxJIoo6+d5h6YjWz+4dCGXIoVB9laZiopD28iSweP6+stSedEsuO7X
         6XWlpirZdSWziVAuoEFbnpEkO0WgCFVW+J31Q/7wKrxOBzQarSc99mORpUEuU1G+hwm1
         fYBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEO+Bm15p0LmRg9IVvWGXradIkuK/0MzWjMp28prx48KpAPe+ESvYyTu1BuF94DMdJpiKt8C/QVJBt@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvEdZa33+sBck07MbMRmu5C2GEWySyoP9h1cUSg8Ricf9Qgjf
	m9b9KK20OdXsuv0XlON4Kr7AaOeNAboMoullkvBvOXzmy47UcJdibeVoknTX6yKmv2JgYD2Mttr
	GwCKp63dnSeC1B4ZOouhCSXEzmN+wtzVfiWnPIY5jpwB3ZyXE7KZx0tgC3hCj0hlJ
X-Gm-Gg: AR+sD12Mk9+CFxlSJ/lrPmJMkLtmQ2DxLCScYYp4BUrc06IqgPjiQO/yDwJh0pQjyYD
	h33JG9LKjWwGs+QRCJU6fI2l8LWme2/XJ2+Ul4J8xNf1pm9M5rLyFBW6BYs4Hkb6LKFQ7nILSp1
	7YjQn+fEUX26NQM1Ey1FTm2V9Ibu0sXAiWZgenXmLE0q++xCtKudckUHm34PekW2JqawMRA0kGf
	gw5ge2XLLPc0bwj3CtFOKjMlplZluJHII7JUd18ENGG6PAWG2bSElwrnIzSvrSpwc4epx/aeWBD
	jf+ZJWqDJzWUjE2vcwBRaoo6ZkpHe4zFFCx1Xl5ZQSHvccIsJ+AmwqFGuNpzI5Cxv2ENEKLT3RI
	C8Eno6+ikjUpoBauauUs4zITRNtqoEiCmhilMg/NONTnZwDNERi7gMsTqaAezNUFybiHjW3FHCt
	JqTfKpBSwXoaIqsTOM9dCY4+unROGbWg==
X-Received: by 2002:a17:90a:ec88:b0:387:e0cb:7f3 with SMTP id 98e67ed59e1d1-38ec6883fa2mr2187067a91.39.1784797754943;
        Thu, 23 Jul 2026 02:09:14 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:387:e0cb:7f3 with SMTP id 98e67ed59e1d1-38ec6883fa2mr2187042a91.39.1784797754468;
        Thu, 23 Jul 2026 02:09:14 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f42bbsm15191485c88.14.2026.07.23.02.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:09:14 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:38:58 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 variant
 specific DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-08-dts-v3-3-074eb131f382@oss.qualcomm.com>
References: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
In-Reply-To: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfX6UJUAxSmApba
 5L8vhpi6wLb1BbE/az/x/hqk+FJ54p8caaE0EOuagZNCSn/m1hLXBJfAdnvtk3uz84AqXa9QeX+
 sozub4bLO029QwGLASDOSuJ7Nrajoxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfXxCdXoNEvPMJC
 FfL0jnKyX4zruHS2Q9cE8MhqT6Wx9awbPpcpjDK3eQAsRaiJbLKocPRwjHW2A7gM1995xNrWzcN
 8bPIf2XFHE1f6Bvk+O+Qoe+xiY+fRDuh/fkYxGld9qk8MhLVn9KUdi+zaNEmY644lwsBTWSxEU+
 /qJbX9q9HOhpfvct1daA4KmfoY9JMySndB7ztkGtdZ6JhK/9ntUE02n+3gSDTToSkvjdUod3rZq
 K7CRbhaRv583MS9QDIBZEd0H+4O6XBeB2swpG8/0y73k6y8MZBh8TvIiIynm8DI7WmLgbY4yZDb
 Mmt5AITARmSNLRsONOXjIEOM89+oqWZqmhAMdOfgiMzXVuN/cK1BD1D31zz/GRnbMOl/x76gjqp
 T7LvX6HKEhU0eCZ+gi7jjEEMs3j8bSp9Sz6zZu5M6XxRgA8yEkwvKeKabJfCQVT2/E3xDaK5K20
 zK1VuUKXQtE4KPiIvqw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a61da3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6lN6VCmV5TNdGVKjitMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: c28djnlnP53YDK39bTzO-gnQ8sj4uVe5
X-Proofpoint-ORIG-GUID: c28djnlnP53YDK39bTzO-gnQ8sj4uVe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230090

Add two DT files, one for the default eMMC variant and one for the NAND
variant.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts      | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..0902681669b4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
new file mode 100644
index 000000000000..cd65826944e3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&sdhc {
+	status = "okay";
+};

-- 
2.34.1

