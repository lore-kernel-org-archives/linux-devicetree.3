Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904A3F54D0
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368844; cv=none; b=DclMYuMg9k5RChNlQFRNZOGHezPNjsBNIiKytxSumykQ5bDXvHoU9hdN97FLwPIwgaL7tHzRQiiBL0YDMG1Bt9gnpQkncGFYbuU3kbluvvz1OdclW3jLdOqh7VfmTWC8AW22n5p4ICGcp4KqjLR0JaGqMkxMH7PFeQoa2PUkEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368844; c=relaxed/simple;
	bh=39Sa4FRbA1XPh56vrPZ233l8fBb+GbeXoYXxNG9G+R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekQSln2PCn2HXXswSCSZS388AxrVqFDcUJiXS4nQC/idOXQLpponHsmCr8HhPZdtmX03Z49OYXUOl1cp0ovajd7GKrJ0HoeQ9/glkC20caRnRQZ+PeKOTMgKRlvCIFpr0cut2NXlDycdSY+RuFM2R/uUZGGAfm/K7W0u+woknAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NacZ6rzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9qAES8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NacZ6rzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9qAES8h"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AM423556032
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=; b=NacZ6rzNe4O4spn5
	jqNbDI9qp+YlB0DJWOrVvpAk2elBrAESVgmUgj6ht0bDPbaDPIfcJCvG10eAYIR+
	BLigHEV6GAW5gwNzbNlYXiWW5gxu9Aqw6x9bSoytxKdqi3jC0zC4U8ckJBhIqNg+
	6eyhP1VSQaXRQyWmjKhBuy1WWkr0U2hdnt/lA0UCoXdsys3PAP6Inub7JwjpBzdE
	C9vRHn9L+i3eWmRMZghEem/joFd2KsmOME5hFETUR9XX/4YndIw0dY/xyhLI/SzE
	8KedJA/Oln2gtT0I1OLHPFqGgZTz+uMuTzCptJ8lW0m2mKNYhApmCI20uyVzI4TI
	EApbdA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6mmay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so5670339a91.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368842; x=1779973642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=;
        b=T9qAES8hQh93Aw8ilwXiojf5gcRuu0zlkSIN4QxxIwhYqqq1k61w7FnURp8MAO5Su3
         x1BW5kM6NSwJTrVur0uOJXHUgRq959j+xQA6HjFdBgEKa3THgpg5s6ckMl6HqjvbL48x
         tfcvCVuatYlcG/F093vBW3rNDBON/HykHzx9Zr6na+s5q88gWdcjxv1g1Fm5JjIcy5br
         ZSpr58SwMdavWszmBIAGnmMLyYdlMOdn9YZGc2yz1+xNPbEfy/lmN9ehzWhX2PGzUnF9
         VZXiX1LowCjzUKFsCjQCGyqYVYCXdn37nO2paLd4gfPOumJX9DB9IdP7zvwOmYHQN0RE
         Ti3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368842; x=1779973642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=;
        b=IWOPo7W6ZzmA6kXHXCYPCbDwCIVZGGpLnlKyghV8KwvIuvkRjeN4QsciG7OhHUx8qt
         G+gdizY4K35+nbsyB0MUQvwsVM0jvHyZR7pXb6MRC36sCRL9+w7ytCGTwB05IZtGzLF6
         zkJFAdFdWcMFFPm0gIrXFGuIB2elo0TU7rSRDWkK1/GK7NMoNZ6AlPNP4ZZMktUA0TvP
         ywYBnBMIa8J5SJPk5nT1pzY6OG5vMbE2rovHvrlhgQq4ZAH3wScjQuOF1Ia4NjX/r8KE
         bEzfH1zoWKR32EkGC1zXu1NjA61Q6FcY3e6LCuxRtuMQPKxC0kb/3/jHfQ/5dLUjSLwC
         lojw==
X-Forwarded-Encrypted: i=1; AFNElJ9O5RuezOfm0wAUeMnREvT3F8Hf+uakqcutsHNtYSiMpbbBGbozXAEqAoCrwqVPtbtM4W0GE4heH11p@vger.kernel.org
X-Gm-Message-State: AOJu0YwEfyIGhWkVybQjRIOahbzkSWImpT2vm8kt4jUu+kKI83whr2Jj
	wAAi/SY/AxB1LzjvMEPh3sHiWV6wEVvFnIAbbOsEAyUrMiwinxOmajJi2sxBY25eUtVTz6hEC89
	W4an3QlFaZuEdPjG0YAdxoUtIh/A1+TAj9Zsini7aRDfcuz6bDdAz1N7qthHKDz9/
X-Gm-Gg: Acq92OE2k7eIhI5OEG+CpJs0KaH6UASVJaDsAFljaKCi+nybeW+SJubYRJI2CGqeWmn
	Dr9qgOtcuMGGwE6ABhiMSRyQcdDJJgej8mauMW3AxoWbSc75bhaHY2sf2tweZX89v6PdQD0RU+7
	mSWyUjYFUbQAaqI7cNkuYz2Y5a1ZRvGLhSh3azL5jIeRhnqy6A3KjNYFY7vpMaKyZeAvDN/gXXD
	N3E0ZH91+xRKGUELWqVYVpQy5+O/P5jKGQ95jxxYRGvLVFsedRxrKinboTRJ8wjJkjqSrzil67+
	FwXYymml6vWJNqQ9qd4TgVlWFADCSmL4f+Z6+r4VDNSg+njHHsLJTuY4fQgJLEjNyF49agIyjsx
	sW/lqnnJXiiWe1LcpyLuumVIcRie+ZymlrG3WIZBsuihkZDEwvC9lQovv
X-Received: by 2002:a05:6a20:4327:b0:3af:cff3:b347 with SMTP id adf61e73a8af0-3b3087a5f1emr3405786637.36.1779368841585;
        Thu, 21 May 2026 06:07:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3af:cff3:b347 with SMTP id adf61e73a8af0-3b3087a5f1emr3405733637.36.1779368841071;
        Thu, 21 May 2026 06:07:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:39 +0530
Subject: [PATCH 06/18] arm64: dts: qcom: sm8250: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-6-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=39Sa4FRbA1XPh56vrPZ233l8fBb+GbeXoYXxNG9G+R8=;
 b=V2PKgU3o/Lx/KKcf8HhaHoGw+SWL5/Xh00CCq7EtLb41g0aW6SMDWo3NoPwaXeIHZzqdJ4AwZ
 QkoBhkho58KB+0xXoKeLG/++BSlJKmOskm02EC1tsCFz0Pr71L3ThF4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0f038a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: QvJcvHQRWJH2-drYJjiThqubN6UJBzvW
X-Proofpoint-GUID: QvJcvHQRWJH2-drYJjiThqubN6UJBzvW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX5gUVokKnhVNx
 9r+A03xN9BvYxHvLO2AQgxdy9UaoFJEAzUUFvQrV1FkohuWnlucZ2Exuo0coeJe2UZuzNxl1VnT
 NVoDcEJNCWjK+ti7IO5deCTkOJYqilE7F91teso64DYKG/0VDm+pISZ6ObN5LHH/9mI8lfi8UCB
 AxafloxmylC4KewZdjE9NmREgDjFa8lOLpEOhkOS/4cIZw35uCAAtnNQx09r0KyO4V/ZlIKZdUT
 WPC+bYCy0M/3iYVQPM9TnRKjwsPC8LZ5sDCQ6+Ic07MbsYViVJ3gz1y/LLNEK2FgoDzloyR2A8g
 SS+e4mJtrdn7xtFFlXtX5CGuyR/3VMIbn02ePsk2iWlnP8UX6xXMWq20rCYUlRJYPyAGJxZsGJS
 hToFOnW/IlDCgC7WYXDb1xg7g3hK5mBRmX+HIyw7BhGNivgS38JcirNIRQGQaRQkI52riN3Bwwf
 4P5JnWVFLU3tUVrUNaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..eca66d1c1c5b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2202,7 +2202,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2329,7 +2329,7 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -2456,7 +2456,7 @@ pcie2: pcie@1c10000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;

-- 
2.34.1

