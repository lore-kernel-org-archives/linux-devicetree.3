Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66D53D9052
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368825; cv=none; b=V1Ch9J83CpZN055/xSca9RTLxx5xZNZjbtMs5veq9PxYgd2+toxxZno9VxSjhDVW2vC8J1r3wV1BTFXIF0X7AckCwAmlVkmNEUtMOiTR8CtPWPgCTebcSYH+cfeDAMteDC3abBK+q//f+tJsLjndja3JuDdbTRblOFWfjxpKH7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368825; c=relaxed/simple;
	bh=whWAp+INItUIQjuUf+3XOOZ4Nif49970RqMMkGBDhSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtcSFimnEhjwc7o8YcJXWik+wgHRgiYpr8bks835rpVmaa6+eO0wBH0yM0VolwAk+d2WAfChY3WWj25sIF0zJ6epJsLvugjlxwZQIrJuIGRQ/87aC3ZUTwiquI3WxAo/PWMOUnfmGbPW7nEU9x0S/0M18YMn6idgEBSjLn1UL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyFDOQNa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hleowvcj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyFDOQNa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hleowvcj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMVr1731228
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=; b=fyFDOQNaZuMcx7ws
	wNW4y2VvTTsaN70dxYfxZG4ZNu6lNCLEJosBF8TsmyVi+wJ/YDEWHVqx5i+tBXpl
	2UEW5ggABXsAfAEp1jXmfx5AFCVCOBn4lpk9pKvGh/9MKxqcNA0fz5PRPbTl0ase
	bkfhahC/uBwR5q4WhMd0hUQje68WzQSVC4TJTNxk+3MNleQ7NNeFu01B2tcHjsz8
	qpDTpGVOzvNFMM9AuaNq0Qdv9vAy5d5lzbSqAhYBIrvPLJHWxhePKH03LOjn+4Mx
	lXxDFI+q4whc0tx8IgOyzpQXVlfDY6BHrP+i//xg8M8tam+E0rRpY2Gr8MMUydqB
	BvgoTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5frx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8276c91addso3424184a12.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368822; x=1779973622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=;
        b=hleowvcjWmbk7TxxAjcX0cxc0xEjshP+vgC/sL5TJOhrnfZueA+hf9yzwoxhf78Sni
         bjh/tqZav3X2HK3yh+pby1JN3EcCaI87xlL12p0D7RS0yDNCsLGY9AZGEp+szSQSlyVK
         B70xMReRxIh0P7nU9YtLX/+p0ERWQq35EiFTZjTU7t9vkyDmxJ1UGWzMr0aKVbKFhhxD
         uHY2bi9gYKbcob0jDfsxxX7oz4RKbt1hwLZAce1xzLAgHEH9FCPBSx2uybYhRP54vulF
         i15Od3PknKnncNWX75HZWvUitScV28pdJJb8AqlybgRMpF9Cq3gg53f3JB0pJcTsow8z
         kN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368822; x=1779973622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=;
        b=R4eJUaxf803wlwwnHbv61MTNCz6sZ0xt8cnv2zMjLYLLUOZLgtnkMzzEN/M2ddt5WF
         p17b+S0zHZiZ3X47hm7eQaV8VKJ4VsdlzkTdnHK4s5oJVxJraU97dROTyrvHCAc3dRIr
         59KKoXH853gngCmSQuRWtV7Dy9uuzWj/XxELBePRImGTg6UWRbEVEinK6ZHg2OaRCkIN
         MyZ9kqjEvr+P/fhHTpXAZdfTPUmrmT7z6z4Z57ojthlRzmfEvkgpMJ08XEAXsMzr3V5M
         DR+rJc4pNj3FDZSagNXTXh+W9PyKN6eVWYZ4QbRe3YmhhdcSbvdzPYs5059/a0WDrble
         h3tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZsUFlS34+b4zXoPiqOx47COE15LZbGNksdkq9wrcmTLvsTrwvoPdk3qerW6OvKftOrcSbWR672O22@vger.kernel.org
X-Gm-Message-State: AOJu0YyFg7KQGuYiU+/HqaOsz1FVaOLtJ55j8MIjQttlUXVRh5hSa+ml
	1mYh6F+GHrxXawrmzh5V00UGx7QBz7oVvJr8bEHG2e4+FyXm59V1E1M3G1Lg2p72peUCa/2P8V/
	U3akci3br6+DDm0LjobQ6oOiCY1CYxmQguNpmyChxqM/qszoU10PxrLs8NXrlwiOe
X-Gm-Gg: Acq92OHrRId6leoooMotse3IFJvs96IlYcVEsjkdiyd+G2ZKPWu5CIeFRO6wiwbPa2m
	/AijoPrC1WsMCshapJrusyEbskhH/CVysXOdUbUP9UNhzNtPhzZhWpOMnDb0g+05VyiE9Ztn32u
	KWl4Dkp3jiZaZowGnMuom1cjclF0rGapLX5WmzCrWDB+TRJhT4zw5ixclhKpOIylclougo4WNSl
	yEdiZJaXaoCbfGj1MvHRoKUIgvP0QIr+g1Rg+qsUA1xyZ0q/0yuGCZkVs9wP0KN8mJbuIbCviIm
	9lvHkkRbpLNkP9rDPbn9XZracK+kqGDqmr1dlTo5wQC1zPQl8Ggz7tRQ3EpxDUuQBdzeQovcLY7
	HDU2ygKNPgOjr5ixiKVeqtG2TXuFGG4hpVcpTzCbJDEdPWcr49URrluve++Pdy47R+qI=
X-Received: by 2002:a05:6300:2189:b0:398:b433:87ed with SMTP id adf61e73a8af0-3b308b3cbb7mr3651998637.44.1779368821673;
        Thu, 21 May 2026 06:07:01 -0700 (PDT)
X-Received: by 2002:a05:6300:2189:b0:398:b433:87ed with SMTP id adf61e73a8af0-3b308b3cbb7mr3651947637.44.1779368821176;
        Thu, 21 May 2026 06:07:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:34 +0530
Subject: [PATCH 01/18] ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-1-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=whWAp+INItUIQjuUf+3XOOZ4Nif49970RqMMkGBDhSQ=;
 b=bxUKQXfLdQYKJq6ikqV5bVd/yC3vExDy5QoA12C6rjc5hSEmQmPZppukoy9BkQzSlElCxJk+A
 Q/LUeR1FPV7AvWUEkEpNW+f8+nuFGshYbmeFKbRZ3zyxTjCKicfA0T3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f0376 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: WVKTs4WinrnHrB5nja7FFxHTkstRF4ga
X-Proofpoint-ORIG-GUID: WVKTs4WinrnHrB5nja7FFxHTkstRF4ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX4lCQTBSZD0Q+
 O8IshU4prJwACtnPJi9y3d6JS0dGXykTSqv6odSiD05inEz0W8vdU5iQRJi5+b/QtOiOrGkDPAy
 NxFyChUE7UjnoonElU1ckZTQTeQ3sq1S4eRYYAmRiLYxcLh1/H7XVmLnRSCZ/zzFRuuvj92BJe8
 XaSqESx8/ULrIk9QBXLDJ9yc5JYk5XgPPOtCfeEUCZV98ZRzKgyYT3SNSKL4gKByiht5WvywvTG
 pf8US4+yTWJfuWaSlSSzD+EvAfFsHNowG6Q27qhuaBjvWgHMYS1houkrI5kLLiDqVEK+nyTWf8L
 aKnnAhLwQIFG6tDKPOtaiHwuaW6B8c6WRjcSAl5AuxuFhbC8+yGL85qPpwzORMsSzlKVBSB9WWG
 R9OhFRMui6g6fai8+MKtGOyYbo9EOxBYThHbFgYH/Ii6uYkTA9RR8vZwjYajHqPYuZu+lkokYsh
 gCqAmAG7sc5D6adxlpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index 082f7ed1a01f..302c88c47960 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -251,7 +251,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1

