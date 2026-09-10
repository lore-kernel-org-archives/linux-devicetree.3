Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E00493D4F
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046978; cv=none; b=AKZBrubjYpGJRKVUxXwNR6Kfo5r0xusoWAI/izcIO868FynOzWDH/g47AOeyX2EGcmR/YNwjNe3lbwDgVzeeLvaym6e5pbASCAV1d4fzDBTsHnAN+um6XyKb5mdN4jr15AF8Yq7x+l3a9eXw8SXUOSh3DxJMQMegJQPV008O9eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046978; c=relaxed/simple;
	bh=GcNG7DWryYR7zq+rPZ4MedCY8PT8P2uvYLsRVBOtgpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeRX9bz7O/gRrrnbwtisYZ5kT0FQWTKtawfyhFjThHip9/taYFzIaP0aqo0OdbN8fiyKIgFztMu7jQm54Dh0vn5BejqLRhhVviXm8fN6vRLZ3Q1Ty9vMdaYTCQC1TN82lhEUuYCnLQfFK+gzs4viEegrvvLLEGLIrf3Tjz1j30U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CniCpISV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bl9SpWgK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CniCpISV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bl9SpWgK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7emo1440462
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=; b=CniCpISVMbKe/33m
	mqxab6YE4iTwResZJOneXqqhgfarTgtgF4tGVqKKTji1/9uPegHAT9Y4mcVyBlzU
	EUh4CmJlzWB8T/z3XHQDzhIaI4rnzZbP+RdbUOdApRyxDp0mkwUPuUypW/BgdD4U
	XPaTeNCmOafdxxmzT51VwueBbz5p1OHPEDIjF83Jss0XrF5gKGtFekmK++lYCmQO
	x7EX5h7RoDYzzeGoxfBGbTebUeoxM4XSTPD4UxWmRYrrjoZP1t8F5+B10CYAJ54X
	eGxMYq4GtOCM67y9SyAksGCLCEKiMMqehVyrze0uNQcHgZykMVbiuMeyygKw6rGK
	Z22MSw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsf0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:35 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c037476275so172436eaf.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046975; x=1789651775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=;
        b=Bl9SpWgKjyTrLtNxh12D8sfNCY4V5E2X2nfUMRwH16Xby1YqzMiLkIYRYpLBpG9i1p
         JlxPJBmHQHIS2zt48lsRvYgMlrNe9uMxPludk04Rxg9KWfMhWtLmb7uPc4GKTLRAs/ta
         yfHDBs6gNmHIZsZ4soyfw+JG9ynSKAue+YgfDVabu121Gknil7WalmoYFCYNBDlDx3kb
         keWSR1xd1wTXWZ7bT+CIYo+iFAJUABmUhrMm6aZfESEoH1YLOw2MpsVW/bsCr+WVy+pA
         2EgURX0Nvto2Z7T3Fk924SjmhtxwWZ/XAwgkElUZLBPFq9A5wG0LSiWx4Ng/h33zhRlG
         Fc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046975; x=1789651775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=;
        b=E+2GjPIfzvB1vpSeyKgHt5fv/kuqseTGNzCWjIoQoNcqTCSHbsmMpkq7pLE3kcKdji
         ilxDJpoH1mwq9Aff8SkfGDGh+oDJW6HzLzFgH3vkMU6aXXyNhAGwRYZgnyfDG120BvhV
         n38ErCDN1DZ+g15P6HK86yafPvQlXqXzNcNyi+TrqBsm/mZn2AQRvel6Vv7qsQDtiZKK
         nU8d9OZDAi+fi47vo3OI8iBje864p6yWa5XG8xcJZ/7yjYGTG6jXR0UftFwVGiqOzcKN
         Z3RNfPcI7Ppo64vZqkxSyQbIOOcE6ThJ9ImK+Cw0rdPgeD+iRa63QxsBSwYmF8qBfFAI
         Jwbg==
X-Forwarded-Encrypted: i=1; AKwUvBzsFTfk9ULvjMggcxsGNSxFhIh/A2LShn0eC2whWrR1vwyRTW0+wATugez60Vjgh4sA/s42ZkP0NY/u@vger.kernel.org
X-Gm-Message-State: AFuF++lOtOqwaTuafNwfB1nHg5hMV7pq7izEdebatmeD4ws7xJkvlPkx
	D+k+oJ5HwBVebDTcM7sS81BJyYVr8aSGkE+PyzJuAzcu96xwZebVSf8M0SqK++ksFcKzgDOnbLI
	pwdl1MrVvKzI7arNFXOjKZ1gKaNhhxf3HKylgsI8xj9YEcocjquzjJ24+J/L/tkvO
X-Gm-Gg: AYBFou0+n5cvjQ+fY7gpoLX25ETC9sVsP2ozX8ConTp9wM4iC+CmLmTbVKnFc9a8eBZ
	JP5AtdUfUt3a7R9gm9vqL/L+cO2uTmEiXiIwmAJi8AaufkoJEliqJsk3mJ/7Py9pe5P5y9rRnJY
	qSI5DtsCnIiyshR0VEnrGb4y6BJU/PyCaLpWYXAQgzXU3/5eQk3S4OXyuKnXihgiFaAIHQAxEbc
	l8uUhuOSX3dOaovYtJklTOoSTzg5D9ENY9ESx5O1Z2nvJrqj8pQH2SO00aAOCcHuBVdMjJR9L8M
	+Kpqy40Uc4BUsBskK9kVXKnqddihlPd2fu8JtEVAWSR3eS21mBv6EwT8gfykwFeBE1IbMT0frzj
	N2V+FPmS9CHnD0yvE7vKEkPaRIOFBAFuSBXg=
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr20415135eaf.54.1789046975238;
        Thu, 10 Sep 2026 06:29:35 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr20415104eaf.54.1789046974602;
        Thu, 10 Sep 2026 06:29:34 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:34 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:55 +0530
Subject: [PATCH 06/34] arm64: dts: qcom: sm8250: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-6-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=GcNG7DWryYR7zq+rPZ4MedCY8PT8P2uvYLsRVBOtgpM=;
 b=83x/iSlYN8EUrNy7PF4GayGOrSrjcE3ZHjgi6pQr/rsQM3maRXCuqV3WW7mAfRyqChzlTUtlR
 Hjg28MxX5L1BIM8AxEHEKI5AZU5JpIOqmnPkNPGLY6PbpZqI9ehOFKC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2b0bf cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5xjrRuNy+6x+
 zdt0yPUHewwECLKnnmQ0qhE+8lsJxEeEFPQeMVRGp6lkGJkme8BjyZDhzGB1vHqd1b+l2K1NWOr
 mN0KkVBcgmb7/UmkzyhtIOJ31zSeNp8AoUJuFEH1aCEtp5DsYo3D1DRFoSpSP3ONBrPC7q2VGdr
 wIz7xQSqyTDvO+cHvbgZjv7RxSteUEVrj7q20Lq8fHoAueb9U7URXYmLxcORqGSosRecD7alpAU
 ciTJugjKcTj+tMsvMFDUdYL5hJ/BdE98ft1oBgrXXffCxGivtrSblJgnCwdDScfjz2koCFfXrkj
 J97ZbTiv0gEfk9Uxm2/m89dgSouSvn+QrqiPq/KGe6ZyOxUt8RKZ62/WYuI6P9FO1FYYhXCQFFj
 Du0aDodjexIKg3NR+AgTc09uUsZQv+x+jiYqe35QEoNJ/gEKV7duklw50OUehQZ2P2T4u4o4m/1
 8uB2jLKBc005WgRg/RQ==
X-Proofpoint-ORIG-GUID: TWd0gaMEwbmuauLOxhyXZAvwtRcKR9TB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX77TUPJUmaUoo
 POGhdJaT/FtFM4iT0NHrNGUo350/ZVpHqh02GL9OOOFqOIPjlt/CY9zeFxZ3gPB5sDPWEU0yTmG
 FX79a6xON6yw1On1IW83hiOB9obsm58=
X-Proofpoint-GUID: TWd0gaMEwbmuauLOxhyXZAvwtRcKR9TB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..e0c357222bc7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2211,7 +2211,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2338,7 +2338,7 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -2465,7 +2465,7 @@ pcie2: pcie@1c10000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;

-- 
2.34.1

