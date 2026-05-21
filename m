Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048033E173C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368880; cv=none; b=FzrfIXELaFx9YnmBcF1e4zBe/Jh8R3AMBv6sn2B2NWNXSmz8vySZSAo+FLzhZ/KjbJnMh4CZsmIP8sF7IQKV9ZFDRTWohhPaakdGSsRr0U6jWv2D9Y9UkAc4e7glU8LkY/5tylM46fk/d3YOfU0inmmsXMVs5vBRqSuwZxfd08U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368880; c=relaxed/simple;
	bh=yeaV9sJqN8fsZTYxfMzuF7Ab7IHMyFVmWwQiXiHWSzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKhUVSuA+QF72VnkWF23+YUXhJtykRtipsMY20CDTcrMEJJft8bSHjrHrpIYi2g2bgIWoes2c6OiVyzVoRmeA6tdkSNVOi75twhDg2qXQgmLQokhTzgYKoBHerx6rRPfAJT/7jZNiCoXgpIrxJFDit2qSnYWhpxTbEq7HQDM2vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQLFx1+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYOv2BXX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQLFx1+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYOv2BXX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99pbg3009557
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=; b=nQLFx1+Hm7HrV9wF
	lZIILec6/6jwRipQFxetXMBXQcPy+Vtpj2VUrtBcLxSBduyApSqLCvX3QsT+2x3q
	ykLIiOx3q5Yf0tDUu4VrcSDD0TUufkFVzvAVmQuhC1jlokbXS2dUr5FWQwYlxgGX
	PSMFSVH0EArSLACNRS1w3iRuK0wQqXh6tl4m3Edgb2Nd4++TEs6G46KDupPrqmQw
	V30PUhT1F5YtCKg4Yc18+D12WRxhi5UGQyTwblMt8C4dL+nUDZRJHmKDmyTaZ3GH
	stTAj5TInFlFGoH613GrupOnZTFxNCc52xsZC14l4yJAZwId6LqCUSYK4/jF3uY6
	fwB7cQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr329uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc6899bfb1so61321545ad.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368877; x=1779973677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=;
        b=PYOv2BXXHd/ioAlnyXNrJSZ9TvFJf6jPfA/pAZOWjE96mXkVYrSOzPznS3O6639cK/
         yoV8BWgpaDtrIJHq6yStWLBvg+rpjf3dw0yntYYjVOrGWZ4XMdW+k7CiCsC4HH3zhGS7
         5bt+6xyW8rr+wbkHxX0JDFUIZKEXWhvs5079Acq+iKynx2I4/edcc20esYyAIFblxiNI
         yzBVLx3/K0bCStu8DAhZNRlk/VQ/5J4ZYHjr/6DrR1JI3e/IyeIEajxodwOtS3tkEGdi
         ClZRhNlypFQS/dtNNVnvtj+1UXzParcXa9sZdVfndrj31oDlsFCewlWL3vbs1ZV+BagF
         0wKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368877; x=1779973677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=;
        b=f5eeLdLsMB2ispeQEOVozle+FieMxLWUIgVR0af83na0yHYOBYBvbpCqxqOudLsYXT
         p6ibvE89O1oMCc04CuExfUrQ+IeFW6XtqsCc+XJBB8QMij7qyeCsNgL/OzlNPHxnRCa2
         ADtyg3o+aZj76t4UjxxBOSguTF+Vsldi1hLQZdrI7mFnWNXWshxfrxfnId986VeQadPg
         CoLtqMD/0+rWNV66JW0+PSMl/E8dSRrJLIsGijqqT85IFVfTU87sqALjFq467eTsYUAe
         hnXtoDTm8cw8JPkccq1bu9oSksXVWkdR8AC6kQKPWepySfgoiOrU+hPpxg1k9qavG3Ua
         lPeA==
X-Forwarded-Encrypted: i=1; AFNElJ9LUlz5km+3AjRV5ONxbDp6Mk7cTEewdtJueUA0snPC/20+s+8r5lTGOIcAvdi6jz0Th3Wd/OhpQvwR@vger.kernel.org
X-Gm-Message-State: AOJu0YypiGG7jkNZTl63/n99UIr3hM7M1Bu6gx6s/gRlKxjic7c3z+cS
	CVymlzgXquaThSm0CU6FopmnDRabcw+TkI8d4gW1g+f3b9dbc/mgll6Zo+PTzSGPYIG6I3ve/yL
	Y/3isPVYzRH4WGjOhY4N4i4tS2k7q9DhDH1tZhnGotih5GKwkmIVwCpXlJswMAbB+
X-Gm-Gg: Acq92OEy38lF5D8NAhWp/tnG0V4EMBRvSzWPNBb9d4WV116WpffdIUTpDRbM953LqAI
	GNCLoKzxqwNVhCPM004UsUZebCJsVCSTe45qwPkzPYQeMN1/9hEHTeVguzNSOHReG4PvqvibogH
	J2Gi8siVwcPPpwgWG0CdBLl4aHKT7kwVCPPf8fEQzWzQMkujH3JY3PJp9aahbYAE6yueb3B6Jfu
	ODSQtCs9pcQZon3hCPd/CE8g8YAgz1BZ8Mf6zL0/+Wgd/HpXlD1hJWxMy+wIYRm9osm3qRUkjMr
	kT1JRC6SDU59w8l/apGigKfw38oa0dJWQ1nqiZKZuQ0NM7hUrqIhDHbRelWNJszIjjJMDZb9ekG
	/m56Vq0BToWcoBp/+kPbBLBK4oy4WMgWnRnq5sUH97/Wy1OEpgAkvANEfXjc4Uc/TLvw=
X-Received: by 2002:a05:6a21:99a6:b0:39b:81bf:15ed with SMTP id adf61e73a8af0-3b308a6cbd0mr3562199637.52.1779368877081;
        Thu, 21 May 2026 06:07:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:99a6:b0:39b:81bf:15ed with SMTP id adf61e73a8af0-3b308a6cbd0mr3562152637.52.1779368876607;
        Thu, 21 May 2026 06:07:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:48 +0530
Subject: [PATCH 15/18] arm64: dts: qcom: lemans: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-15-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=2052;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yeaV9sJqN8fsZTYxfMzuF7Ab7IHMyFVmWwQiXiHWSzg=;
 b=knoOpCsf49kmUH3hTgxhiexRNRA71Y6sVLZcSL3HolMhV0FzXx5jKk963w1jYKZxa7i0jxNqr
 66OYugdZE+oDdGnqU3ECm/wdBc+1ly4j2JKqZ04AXXJxYmNrjW+0jMc
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: VuhMxANn96C7zaIQBlUuD8xKveEwknHE
X-Proofpoint-ORIG-GUID: VuhMxANn96C7zaIQBlUuD8xKveEwknHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX6nlUr2ZWhotv
 wgFofh5o8XoN1pNy2ANw69vFqzRIIhB/aX7zRWjAKZwPAiJUOUVCl6OjICPszn9TlucC20Z5DAN
 Qsa46NsQsrXngUn/8LDflEES2SttTtp93RoIf0sGfWl6pKIw24W+vNBjNEYaS/wKOVoY6ZB/PKn
 lKgqTszoAJbf8hyZxajcTJWvGIKIoPnOS1c/pEm/Ehu61xFe4mi00hxMA1VVb5AnWBuTlIG+JOs
 j+wuRoaxq8zjn3DL9u7HJLDPm5b5u9mhNGN2iWmZNwexgBUBJreOrWKekjAh4uetdgimNe+qIEC
 K7K80RzpW3M+k81Rku+C6ePMIgWST8eGP8r9oPtUoizzsn9IJIoQ/3zr5i4b47koxi91R2HYQOf
 Wq+bzKPOl3TXXZ0f5p5uXZBkpiP76zBb/nR/5/B1my8mVZZ7zTqQoVq1LvcSAw9VF9nczMBlTUZ
 8xw5GUj0Mnd5yK7sITg==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f03ae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..fe9a2cd325d4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -703,7 +703,7 @@ &mdss0_dp1_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -720,7 +720,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 31bd00546d55..3a6d73b485a9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -854,7 +854,7 @@ wake-pins {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
@@ -864,7 +864,7 @@ &pcie0 {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

