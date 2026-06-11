Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F61351C2D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153989; cv=none; b=kbGEbt9xm/KbSADDOGHV8O2SQKcHUYzL5Xgo25hyyU8G99smlhTstxxKjyYezCng1K5gXWMQL4Pe0XSlsoSmBdwNxcR6n++B67RdZH+QTMttBuxlWetl+fkOJ16dfPgSbWDumZt8YhH/MKAY82W4JfKNyze40gIUtZv6DaycfqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153989; c=relaxed/simple;
	bh=grym2NR/kAV0aYecoJf+FpWLScxnZ+YDsJl1+8FBBOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=io/xwZBgWmi+Ky9JuaM8jGQaUlHhRHk9ArzrmqdMzbJtdK4/gaCPg3rqsbCe5todBr9HRiOc0f413v5aB7Zy3AlUXcXVWnD/OTAO1AyBDSWD5a5MBqS3/vzOxHV/ekwRcUebso0I/CH50usZE6FlDl0FjnCJ0HpFZqpnRXiLkOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rw9KzaPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMkQjzWn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rw9KzaPU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMkQjzWn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nb1B3132319
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=; b=Rw9KzaPU6m5hix1u
	popX7Bv+DjF8OAqDs7GSG2SwcIZYGxhy7Uiyjfwj9etfqHfPlkHGRaHwOFLexgRr
	Lnb/N3rXbYi6+iWJZdPp4IliELS2p1M0vbfQcELg/vulTUI82Jb8bw2bJi9iVSTS
	S/nXYXyXE1UJbTSugYB9WUwUzU2Ytaft9g/3Q/nK5y5E0cnaT2ZR4FpWvyWd2xkv
	icwVpoNzL5BT08F4x5yyanh3I2mMpeIwH8RjAy2ZmfviS0Dc/QUeGK7SW2exp6E3
	fxLSTmSXF2ZfpjyyCwGyMO1Q8Os5mhsm4D1BxT1SgK2hVwW7Jr35dtcezF0Bgavr
	xPmKVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6shqj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so133372815ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153974; x=1781758774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=;
        b=jMkQjzWnAwMdt32DpgfcMe4iQ86TT8/6M7Jl4aSy0ZKbxbjeChPhgUAIjEvvWv7/an
         pDoAGw3wGUYXL+fRch1M4EneIU9F6ni3Tyht8TaDB38DYEkeTNrunaOsa0G/0Fci2tQa
         WdPlucQVdUMX8T89KRplwooDNjghQ5lwYbSZf72dVs2i8W5ektAaHTCbgDlp4JCafl7E
         BMcFS1BVYVObb8/gVxxctjK7CwIW4AujhjDcYPJ/4TDyjOObpcb5ybId3eIKD0lETe7x
         h8/obr+tAmSZwk+BnhPuqpuh0gXPzrPCX5uxqsC/NJqI3qXcTcHXkO6Uo5q/uWYwHzZw
         OoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153974; x=1781758774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=;
        b=HnrRkNfpthNIz1bsIxatkOeIMQi9o34Fxd5uxu9L9gE5tL2QjiAIZrUQNr1xK1OAFc
         z9cwFwRIqSugCFpQWy3i+h+rexB5BBSCQAREu751Ic4OrkEbUVipkEUhhwZYVqg2ZoP8
         XHepjAi05yU64w99UnQEh/drS+TCev9tiekvKzNl5TgWEsNOEbmGGtVJUfxesHGEPPpx
         97u7fSgyvOhtEx1+CeAjOYY2E9SDoMTtg0Rlhivg4fnvIVTlk5OKHP4CflOQK5oJVl0/
         d2217e6GXyN4SNAcUpzxdNWHBpVcVMQI8jqRdCfGqhkFPbZSC/QLP2ykBMbtC5PDj15z
         uExw==
X-Forwarded-Encrypted: i=1; AFNElJ9L+5HhkQYYuCtlARxqmElBc9SvEZ4N/wvQPMMMBeDxYAq7X5BlDFG/K8m2uw+K1EuBlQBJviW54+w1@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwGWjT6L52XelEpj0GMjqBHGlXenV5zq5v5CMuYACwyJtpkoa
	wqdzvCZTcO0YCFZb2V/vfrA/ac/qTDDTA2DZJzIRWXt4cw/hS7GJ1B2+QpJ1wJUG/oH2gTuQKZT
	cqpaOD34ueVKWBepuSyS7dVTogbH7Td/5h9kJ6alzGjp1W2/0WyYhXsJJzZh/To2Bv8fqjBiR
X-Gm-Gg: Acq92OEYHuCQ5yVOW36jMVM6IfRpdR3lL4igRvOw/RXwuawjgT/3imTFZDoF4RTkUzb
	ZOi/RSbZaP314uqzyR93XqR3kiU7UsTpcWaFUXaL8OVJxaekpRjPSoVJfsyaI4E2BFe7nkh6QZD
	0AwY6HYDiiNmUcxcShVaOfmBTrhcvFNJGdzVMFre4mwppvNCBcilryjSs0diXBtguqeTMPXgCTl
	mc18lcwiu3BfnyCy0hgCuMIxL1IK85PEW7Tejwvo/xLcXL/Inb4Z0XkfTYziOcH6aYYUEtK4Elk
	WJz078SUYwD8LMJ4xmNAUSxQNj5IrkLoNp7xLrI+kK7Ad4AMg1USHOrxVaf3+phD4xEWQQU90To
	Sd4u3b+xO3jpBTUv+5b3Bn2ejAgO5gwWxmEdFwoyuT9du8+XZY7MzzMVNxrUGtQNNTsA=
X-Received: by 2002:a17:902:ecc6:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c2f0638230mr14301575ad.9.1781153974324;
        Wed, 10 Jun 2026 21:59:34 -0700 (PDT)
X-Received: by 2002:a17:902:ecc6:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c2f0638230mr14301195ad.9.1781153973836;
        Wed, 10 Jun 2026 21:59:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:46 +0530
Subject: [PATCH v2 10/37] arm64: dts: qcom: sm8650: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-10-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=3273;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=grym2NR/kAV0aYecoJf+FpWLScxnZ+YDsJl1+8FBBOI=;
 b=MByTtOInsB4cIjgXiY1hgmbrDZXYrOMfh0417xXrAcL2Ygvo8LX8epTuarVbJB4u/QRvuzPGb
 G6M08ldUBzFBx9VxLjuHfa1e74U678Zt29ZpWhhKIhIdKFA/nqZzs5n
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a40b7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vzsU3dzRAwCoIzd_qrsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: vS613LPJsmNgFTSw88fk4YHTiE8v0fbg
X-Proofpoint-GUID: vS613LPJsmNgFTSw88fk4YHTiE8v0fbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX83lvfWOEKTzZ
 5ITOtLN3H+iaPMYvB1fENPOJfkGB2FUp5p1EehgsgmK19bA/8Jzk1rL2FMFUgF/yg+DDPjRf7BV
 f1+bYBUAsPV3kKod0Vnv/+HI/+aILX8JNvJ2pC9lNoYgICEwxB7bCi1EQhbtk2E3vBg5S+S6ywX
 pWILevNa65KD0XU/snpORnvAeLvm+/18qczp/isdn9YRZPklE2OfmmlSdxJALpIRZ9b//krJHwN
 4DvLLSraLBRFcBw1A2aNrod29qikr9qSLPZdwWwDOU+f102lnlKO8kSxSB58jjfEJdze/zoWbIS
 jL9Bp7cE4e2Zhp/MyY4xFmNkD8593nTcYgAXEjiJhcTnAuksgA/MXFCXF4FABtb7ZVKQqMZ6Axf
 PzBwqnoBAsz7qCvTu9XACXOPViJ/Eq8/2UuaWr9Ggi1f0OzF9w4GDC6sW2e0T4Nzf0PJq6Ijkf8
 ob6O2rxzs591BWhHR+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXw552ysXaDhtU
 w0FrDZIsmv9KmlSLvXuW4BFpWez8Z0hVlCIvWEq4KS3vFeBl/bn+jl0cxlgWpnqWx6p7j4xWgsU
 mA+iXDNurGYrB5DKdV7kP4Apg2CLuKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..2123312d88f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,7 +1074,7 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1108,7 +1108,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..775ce9f2dba0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -942,7 +942,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index dd6e33d2dc5d..8cc0d2cb3515 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,7 +642,7 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -659,7 +659,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..c302996a7857 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -936,7 +936,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

