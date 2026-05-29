Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5B03C5DC3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063884; cv=none; b=ieIaYahuA4nZaD9zioQ7ZmC+ybTR0gCHCBYWwh/L1LMvUEJrkfoXbxL/259lwcZkz3lH7WRHCZpodmRcO3etQFHzyN7FyRsQe2Xs9N1OgFInI24S8/8EQgINBK9VIv/S2ECuqGpWXV1IDWV0Jz3tAAYQ7kFylQgnHuEAYuwenDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063884; c=relaxed/simple;
	bh=GOKSOFwIdS35aYputVHpifn9pnftZnjBGzZCN7UANlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyJiUriQx5HD7PIw1RSo9IO0R1UCh76iKOLeD4vzo9NY+b3eIZtzLi5cIDx0CkDd4h+Kt3W67lJkFScPbzu3K1Bit8zJ5kNDUgQEAIoUC0XNHPFO2X7hOjo3xjLvpQuKjg3tdPHCojOCg9XRr1U3Fp2WpJoPRppLuOGRYJEA/Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVwcA2x/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7i73p4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVwcA2x/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7i73p4k"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLDd5154458
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=; b=gVwcA2x/MU6ZG+49
	lt7aXomIiLPZIt5Up94NuxGo/2U+Cql7PKTJKa2hAynYAc/sKtLVHO9I+jStXCI7
	Yjz9tDGF5PCZ+JK/830PkEr97X+Gwg9S2wFcfNvybkm/9PwF3k3Tmi+hJ+jfk0i0
	GHnbMFEcoR+ZOp4dZglQvFfxCFHnPA6QP2vhKgnGzjQCn9u1rRkxuYlm7w5to4df
	umFgS3siMmxxpQq30XYSRh1ZujZBd8F1IyBA+KTWVtRlrVPV2Sxf720UiOJaSLNv
	ALzfRuWblQaiN2UOAWEMsHYEOUZSZzGfKPKoSbWbU4OPToA8Co2/bqc/sH0ItmwM
	KsLZcg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5c33d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso111995935ad.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063880; x=1780668680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=;
        b=j7i73p4kwS166m3ji21apsudio8ZTF8/1pZalGo7l5KbiuYo4Bg2Or93DBBn46YDoQ
         gnW7n5+n3HxYnAkQUznleRGG16PeaEV7LEl4pqTzHztrSuT7v8JH4pIVuaQXUwpdvUby
         JHwCl+eTPGQrpdWyErpERmaHwShLnRCxVKw1kLz37x/uqN8fOPFe0HyK8+Ji6IjJwdaA
         Ax7H1F9duCFe5Mnb5JdWbEhjYeQjIHv51XtBmJBRE6j2wwCVbvn+xcb3T37uUsBNNOHE
         Huu1khABPk4N3TiISq+8zKBA7eeRuWlaEVv3Kfqnn46AF635liaxOKaS7+rBnSZIFD6L
         pBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063880; x=1780668680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=;
        b=hEw87qq64abv+wB7Q2MB2D2psN2YZv1l+zn8y5KTQeIPoTNHGaR5MxkFdp354Mj12F
         rzSZdESQfHAabZjMVP5MH8KjTYuu7OJvY+Uj9l6xeB0rYYGviRznwPGA3Vy7LuoVCvqZ
         u40jHfIVvR+Ekuy36rz5w0WG5GtAzkf6Sh76z76Kd2xp4Pz3T3DP80Sw2LXPRPQzklId
         fOhpUO/yymLM5+ydFQptOFzqxf8lXeJ+tDwXPh+vzW/vp4Z79on6cC2NmXncubYV1BkF
         sqkNrwBm7BcdYNJ13YuaPrTzw0PQxmn63IRH1oYlP6eId/SmnSVou/FrxcdQSdnlHyhB
         C7qw==
X-Forwarded-Encrypted: i=1; AFNElJ9eKA91NNdKWlT9OiWcRJ/TIsD+GRwo+y3Fb9xTM9zpDd1ejdFdXlYPbZo1huo2aLxBfpLpmJcWuv4T@vger.kernel.org
X-Gm-Message-State: AOJu0YxrY0ZQoVdaqAVIhksLzsCcXlF6c5nBVbKtg98/9YnRRC0e1OWm
	BiqtJtPU1kSXv+5fJzdmZeUYK5/3zQ7WBrYmCYd3wbRPsjtA2CKoEPIzdAc5fO9pYslb7C+3rse
	du/GfVkkSz0JF8Y4o3w0MWv/JVlGNZWDFFimkC6Pt1Qs9HCEzJ5jo5tZD4lB+6C7z
X-Gm-Gg: Acq92OF+xr7E8QZzoNAo99lr4vPZ9aySkxIe4H0hh5ZzSmakSA2hqYelvFHLjTQ3zPP
	6WrA/NHPHWEn/CPvt4CgPhQu2pXml5WNRF+wqZjVpZYU1HTgcmhwzEFu3kqS7r6Lm5hLcX3tX5F
	xSQrsML7WQubW7+YhgCUWT6aCnWNeEiC6XhPDNQ10r+33vm3rQyGyLuYFZafFQg3umkAT2nsR2v
	vDkYHBViVWOlyDx99jd48N2XdEV5IR5mao+H4KKILLOzGpv8iRdVVfIhR0aumrZtVT/ESb8tC/2
	MKjk4gGvLIDZ5P3g3ndHlbif2MitmYXkRkToT0RJBMWNkbFtGU/YLpEzdcOrI8oK+mCq8LpQnBE
	A6c2siO0+10mujtIi2BRsyZpn39GAuZZwan/0jG+s21YzV6cuhDLr5MmQM5JCf/6PN0JR
X-Received: by 2002:a17:902:da92:b0:2bf:3302:d882 with SMTP id d9443c01a7336-2bf3302dc6amr8435685ad.30.1780063879907;
        Fri, 29 May 2026 07:11:19 -0700 (PDT)
X-Received: by 2002:a17:902:da92:b0:2bf:3302:d882 with SMTP id d9443c01a7336-2bf3302dc6amr8435055ad.30.1780063879412;
        Fri, 29 May 2026 07:11:19 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm30775215ad.27.2026.05.29.07.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:11:19 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:41:10 +0530
Subject: [PATCH 1/2] PENDING: arm64: dts: qcom: sm8750: add reboot-mode
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-1-7c32161cf50b@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a199e88 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=t9eHAnW7oJswSNK9swEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: in82TvIL8wCTVrPQPNmFWtF-ZjKMrgs5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MiBTYWx0ZWRfX2cJFQ51iFEQs
 SAgDefMavMBYnRyUgkklFxzbsVl1jV8Z/JLH0CL4CDP+fpkJkmRpeBb32a5wTwSzm5JH5wcXmKh
 1kv6LM071vOqzkYvZRcyBSjD9VwagJl+U2ORs9s3gKL1kAm3+Tz3xXs9Vayg7RdMr0JZzFu0bhV
 /9Y7nwkpjuIYK52O9wOvbeR0swuzWuqsNeTNIQDIOhXCwP4sxiaLvebAiy4JAiehvqpFhHdmKe2
 uEBzMI+HvKYoOIolY3iOpahkOby1n5Spvm0yKfvTLNC8JNVQHZWEmmT8vDr0mhjwwPTwA0UkGDe
 dETFxRmmnU7RUsKHUlxTPDWTqHGYEtzTx/qagWBcML12J1dBffMWUswvMp+9WdDxe0HCJhJk6xa
 RSWywQCpL2XX7mNHbgYNcuP1HI9d+B/p+uZaTiutOeTtW1B2qhVo/nkoyjq4tvBb7vR9zLUf+K6
 PQTLqpz7Q2i4Ame7Niw==
X-Proofpoint-ORIG-GUID: in82TvIL8wCTVrPQPNmFWtF-ZjKMrgs5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290142

Add PSCI SYSTEM_RESET2 reboot-modes for sm8750-mtp and sm8750-qrd for
use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index de19b4dc214e..e5e2efa2218c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1425,3 +1425,10 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 801c46d55602..795d0d34e47e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1154,3 +1154,10 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 5d6374a23e3e..58ff34e91893 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -261,7 +261,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.43.0

