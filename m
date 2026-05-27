Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1153EDAB0
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875050; cv=none; b=tHwgKpkK9FoM64RZO88ZHeEqct9diqv0RqMjYs1KxAkAj0AbT3uLXXnrWG1J/fk364GeW85bMcXbVBM6Mqdn23+JOUEdD2aj/3F8C9pPeLzB4GfDWsSaAXGYfgkCjU2De6VwRB2eEujV1EYsX8B3fOZndUo13xuRAjqdF1bLF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875050; c=relaxed/simple;
	bh=0lbfIQ/sS1IJDIflAjCOMa0KrIJ68KeE2zOHCWMFvKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2ZlLM0IDFn/3mrfhzOrTO6SCYVWcy6G8wlCHAb2feFG5dupf9cYeOXm+b5WB7wPvumdX3TAkLAYPKk+WSSe/r2QX86QWo7eRd6JJ5u59o+tIYbwXZQw2LV3JwCXbnhbSb6VRVH5G5OtSNRnOuDHpdRnhg0yY+MY7DWdwX+8cuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ou2Pbz4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PW2iFLC4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ou2Pbz4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PW2iFLC4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mTKe879313
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DY2swZ2DLQT
	EZ3j6+uSUdon+gDZZc3kODgPMaY4jOxM=; b=ou2Pbz4PJO+29XfbCTv7Tk6yF6G
	nP0YVSdOYSAwzK2jbnKPeMLV4ZpQNKgeCpDkj2muPAdLvNR3qDQMVTK/98mPR82w
	7/8QjltwxTynUVurFY8XJDHO2IIpWE2SWhHKJJMNfCu4Jhz3uZOGJr/Wj6j1N3Ui
	IfsNkNQPEmki2yOkO08g40JZjU/v458WKDVKmj44kqql26AZfQNMoCc/v4nyUcIB
	HP+ei3p6Q//oTLVe1zfG8QhsWrDXiBWlOYVGRKB0jCfMX/7SD+E1fqCHjwenMeUz
	T1rumizPnrevYMz01B5veoj7QDoJgWzen5kKBD+CGSWZGVInFjFRYTfCxHg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqrcqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2be9e0905a9so81588115ad.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875047; x=1780479847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY2swZ2DLQTEZ3j6+uSUdon+gDZZc3kODgPMaY4jOxM=;
        b=PW2iFLC4lPemeiPvpInsl85EmpfClNpeMYvaYHzxg6NfNxMoYcVKM5IHLlEtYoMN7A
         60iwTyNMWF47GyBdx7DLgJ2TG2RR6wnEliJlxAXIYD7h/a4azhH8Nw3dLNHHgIODmK7b
         l1lq//Fl/RnLylzFoM4s0lNCwqO489MeEgCc1kFVoPk1mZ+hnem4meVuZmRqnk98cqa/
         WkzuFAcioqVnyOLMPXkAbqUPdxV3uA+90wM3eT6YCr2tDBvQHuy5cAMfveSts0noweGr
         GDhmkvW4sb6316LknbTNIJiF4bcVtk9ZTviEbrVlmdviUNHWZvKQm7toC69MfUREwsMN
         8I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875047; x=1780479847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DY2swZ2DLQTEZ3j6+uSUdon+gDZZc3kODgPMaY4jOxM=;
        b=KGjrrkd7SDheghghs7pfICCpO3ecYH+YqXSFNEutHkj+yEg+KclexlD6Pb1qWbkqiy
         YZNcCpO6ku5DT9l+jwFLhfh7xwL3bOKWgwFW/2n7Q9Z1ADFAzwYV2fUD7tHFHEJ4SD2V
         Kx2EQWIvPlzA+KafwMqtoE6vPdtIQM1fKD8b/K3N5x9UsFDq28u068yAy78AOqGlPlTS
         mA2LKFidFhtbMH1AUApvQwCcGomhzLRz+ciOQEdP1ArNFi1aGcw4e7mAmvtkQDKaZmAL
         Qy6MShdupLd6yNqN+aMGhE7in7Um+CQkGPkRiXy/xLn1x0p3nQMzrkKmquuCSduaTFUf
         xfRg==
X-Forwarded-Encrypted: i=1; AFNElJ9puXGckbauZ6WNnk89e8iKUfXNHVfWNLjbnIs63b8Ucbgv9nFRMA9p95OGlmGjUvOYC8O+b5k+Dv9e@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy+8chMfWspvM9SCecbE/wAvOPr/ISGMeMhTsMforEUUzUBN0u
	mBIQXmbxgI9WzRbg8ihM+FaIhMh7L+/GI4DgrXkJ7P4Hvt58J/6e2BFxQ2ngh5o2epNsGDYPM2E
	4dMsPd7t4WaJb92i0fgnJcgxroQ91M5oEiQ0endovQg7s8rE7e5TZX8DotN29T1se
X-Gm-Gg: Acq92OHvxtDh6QTVWV+OTTwDG1wy82tGfJH8J1hTUcifCjIiCgwwhBKUwcndDCThIYd
	h3PDGn6F2b75o2p5raPInJ7bJULdZ/izAObFhdJGHA037LQiXAPyfe87r/thoIwoRlZXbso0Gbm
	qY7l1PWGd7SfOflN8ZWHYRYaE73xqoRhaf/Jmchv1LJEUB45Gx8YD+qcoi1YVMhLjO3oG0lecxy
	fxXpqwl39qo4ZH/YTqrIIAgkSTO9SoiiueZO+TnN8RsHBCeZnQTeV2cu1fdglqXFB5fxdp49SIZ
	SlUkYrirLWvG02BLC5kNSYT7Ewpey4Kqa3ClgvScIQBjGmlXMLm6uC1z9oEv+/Bq+EKc6rs4Hdc
	lUid6E0XELBHH7KjY1+C9h+wtHyxq7rz+1OH+CZl02H23gjpZwxI1HtdfLys=
X-Received: by 2002:a17:902:fc50:b0:2bd:78d6:2a15 with SMTP id d9443c01a7336-2beb033f056mr251964315ad.7.1779875046502;
        Wed, 27 May 2026 02:44:06 -0700 (PDT)
X-Received: by 2002:a17:902:fc50:b0:2bd:78d6:2a15 with SMTP id d9443c01a7336-2beb033f056mr251964045ad.7.1779875046014;
        Wed, 27 May 2026 02:44:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 06/24] arm64: dts: qcom: sc8180x: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:11 +0530
Message-ID: <20260527094333.2311731-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX2BtyTiBRx0Zj
 K1A+vZY6lqnblbApNmXNJ0COs2r+M3h95X6zlIIqPGjQG8zdSK0bCwLzN8mWF+/IUILAd3uwQn1
 ZKhmFlJhmqkTdzui59f/xz0IW9D88GzdRzF6GOFj4mWAbxLZViEYkD2Au0xCyYoGlHHndsI5Ch+
 PxfLb5mK7+ZNb2FjhUSsOcqeCYOwdGhbkjtk/LOHJuN8WzgIkpG+nvnjFPHyrM5zlbArKKUvBuI
 VRXsfAt1scNfR+pxy3OUZWcPvMIWUGCULMsWnlAKH6ho8Da6GoA8qCAPj+LTeWn6Nlcd0rifzoD
 MsnjBg/F+TLY8ntY6Bp2iC2RY3xhwBYI1Blj86u9g7cdBcIUlOPFVHQkWZjvRTqgS8uR6leU3nA
 DJrVGxPtl81+gnPrPaXCiaV8RS4BpwYzGV1VIvWA1jtCDvIf0BORNKXKScqVjmJdwA4Wd9qb1tP
 kL640CFk2CStcIvbgnQ==
X-Proofpoint-GUID: KVtRXFuaea6rGBho2LIp9Y_D0OHor8Mi
X-Proofpoint-ORIG-GUID: KVtRXFuaea6rGBho2LIp9Y_D0OHor8Mi
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16bce7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=22gnxAikWBhxzIyZ53oA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sc8180x spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index e87e82fa73e9..a7ea47f07be2 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3554,7 +3554,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8180x-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0

