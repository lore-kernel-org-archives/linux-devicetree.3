Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C643EFFAF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544925; cv=none; b=p24aizMTyQppiASthcS5FT8LXv+zg2FY7cMrx9uYUVsYDEXh5xrICLOZxLnlZ7KkW4P3JNSPjaIhYNafo/2s9S95QAmUlvWXxdIyAWLmezaDHp/Gc+Y9YsUSqia4z38Yzgc6mnNwTzdOfDJY0Ijo0x8Tk/CRzlsY7vZsXSjISjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544925; c=relaxed/simple;
	bh=Vrq29aRX/6IcoQWJku5ttZIZMz378bhwF8V95noopMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNL5Di+pc80kj62FOwPL3JGYp8JKjA3a9Dsbxc9q6Y8R2GFB84wF6fVqnZwwUtisNHdZoRTnwiWxBnjWLcsrAq/c+Vxxcm33vv/5AmD47MPEnUuh6mqlCq7E9q9x+MfiY7fj4l1SXYp9aAKj3NZ07/kAxdv8hQB2hFk5csgzfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X68uwwey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtpiXZk1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X68uwwey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtpiXZk1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vsSe2189039
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=; b=X68uwweyVhUoU5Tz
	HKul6dXGpC2PxnJ2Pvy8pHn3AWVn4qNX4NtSgLKmGxAVLXstZ637dO6uNSivQ1de
	zHbnfRfawxplrMkakKWcSN0kinqVkWhA8QSZgOZ9qmSZ8n1q5FFPDwuBgVH/NwXs
	upeju26QI+9sf+x0BuuCvSBNxIk/oTw9iFaL9jikuVzh0kLd5yUon6ras2r4d7QD
	+rnPXVoDA68j4qU7lMN9N5Hf6VUXJVOE25S2IZF+k7xX60acStY8aK4AFBu2/GWA
	5/z/UB+rdPM7WsVAsjDDh/rlgnRSFyIyL3JjruLTxZ6djLE9/XeyypJvRnBT3Jll
	AlchtQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04vu0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:55:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38c7e26ecabso6273276a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544921; x=1785149721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=;
        b=VtpiXZk1Ji6Igtn7vXJ8GJnIXlA7AG8g8N4z9A93ayKBKcbkp69UGLScAtR6yneVIV
         iVvjUB6L5HAaW2aWEnYHzgg/EMU87JYTImPQR3s7jQRzK54959bylxSlTCrL/0wnnVu8
         5Hj+RVEty2bQAMQaevrRw/vdxAtldBnXW6AmSCmhbyi+l53080t0VRwInB0wzNcJYzV+
         ofiElE6RLT45UWPk7p+Ea+L7FCu5Dn013GWOibl/ZU9yZlokvN1AgcQqWOLo1TC0p/2+
         tjLPjFLhDHnDFZSTqFLWQhDdJOQIKtWUD7R4RcRd66Q0GdSGFt/e5h/9VwhnU7DoN5DJ
         bzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544921; x=1785149721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=;
        b=geudu2tzFg0XaGhfsyIxLE+6YbB/6TKSlqltUj92UZBEXRTr0SDEC8Sn9mzNs+TMth
         43AV4ghxT6e1mHPbhYn45y2aXHnhprkMPeqYYG7qnNfLfivrNGb41ZDO9CXFjpq3SsDD
         2ystKlH/BjonqhmiUS1ZLZrHxEMmYfu2AJynO4GF/8UuYMc9qP4XWeR3rhNM1H715+zc
         wKDl43sKrTH2bNZ3D04MxCtkJfe25dpho0ZmvmwpE1l1N2z8jIQDN1FZJqvqv04jPYd4
         IyGlcJGpzgClvDSgvfJwnkPEc8jePrgA4tymiWUp4nLv633NPRlQhT7JMdsGOxFbaM2U
         D9AA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4roFmVxaIg0I8ym0qfxBt4tQh/MulBK7GUp4QtAUAWd+4e3eOM/dcM9EOaj5kBDF08i4y46j0yk1L@vger.kernel.org
X-Gm-Message-State: AOJu0YzjIC7elm5IqfmzZh3gULe5UQUKygkolg+iF8zcUiF54ODg+nKP
	atxY99eT+KYhAWeLFHK6bkRbNSP1Jj6iyi5lZwDIb4O8YwTPHL27cBVRSDMXErmfZKGwORVlW3z
	Vb+bDOVaPChrImtQI76JQPlFgEYqypezBvLdMG8Zs2dpV6E0e65iSd5a3Nb2S/J8=
X-Gm-Gg: AR+sD12CZnkpipa+opK421Uhw+5l+nTJ2fZKhG2C766kezqNW6/jRcQVyVDPW15+8uw
	ul3RAHrXZyoU9mcEgTxnixEjN0e6taDTud1MURF9boulJKSp6q4f07LVp/QKXqhU0YjVkIb1UKr
	mk7tBSFAdPXANwdx1qhEVFogM487gVMGNgpbSUtHE1t6tn6C4yNVPmhM5IAYqWEF6NC/72If6YF
	y1AXkEXolJdB7cPrzNE1hr30zjY0mlg/ZT0kJDuxn/GfWZjq2yElxc3PRuWO3d3m9cdbHlSqYoB
	byQnFnO6CiZSoMxYRvqZ+utC7L80Z0VnKMsbry5qRW5bySOOttOzNQrAL21ZASfqUEv1E+u+Nds
	glA0aGtLaxRS9zEpgg4Uxfuj3UDvzhw==
X-Received: by 2002:a17:90b:590f:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38e4b5442c9mr14336804a91.34.1784544921142;
        Mon, 20 Jul 2026 03:55:21 -0700 (PDT)
X-Received: by 2002:a17:90b:590f:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38e4b5442c9mr14336766a91.34.1784544920677;
        Mon, 20 Jul 2026 03:55:20 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5661431a91.13.2026.07.20.03.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:55:20 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:25:05 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: qrb2210: fix PM4125 regulator
 supply parent mappings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544905; l=2902;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Vrq29aRX/6IcoQWJku5ttZIZMz378bhwF8V95noopMU=;
 b=7Zo+04ainSdgP3R5hcZDwh9FnyY9UHDzg9/gxAV1dhssnwAFYFpl3h97C1UejBVOogrF5HiKX
 3GIqX+yOzfVCbQHn+NJ8K4AZEwjLKH+pxApUxc4pSArSELMZucrr1pC
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5dfe9a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=srU4aMJgQ0IWwv6as9EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX3XDYJzpbmPHd
 CiAdI43GFNvtR4TmGTBzOaPWyx4wq+omqYCdvtc4w3ytDj6glbTqJ6PzBWwv9px/GedWky3DIEc
 YdCduhRi1ivHLRUbTIFUZXBAy3q5o15w7jRssBlP34HzbGFlgK9+v8+ZfO52JVO+z9pKZOvaKsI
 4GwMu8+7NREccJPPXoyaVwsl1FODbtZfVNoKKuvecmZ1+s6T/qWDIAVzfMkrIIlc8j6tQF0XeUU
 HHsmVGJFcGT/+XfQqvPZ+1jeJXFvpCoxaUlooMPm46ynXHeJqmvHe9knv69sOID4OhpBvLUJhFD
 5/O+AUor2wxlbua2oN0DYZwNJbibeQ3T06FkPGsgFy1JpXB6AWPloMxRxa5wqGTk6bGaOJWBu+d
 bxTz/KUp8AbhHvcXNInIYmQbu9I8zLvGmyPbNiRbAk4g8zrpJOGRc68L/wo869h+ozCqk4fYS3v
 7yjVKN7GIz7nJaZfJ6A==
X-Proofpoint-ORIG-GUID: C8M7i-MiEf97YVjWFNOhJMtroCsLFsDn
X-Proofpoint-GUID: C8M7i-MiEf97YVjWFNOhJMtroCsLFsDn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX6jUJ89vaaBbY
 wSJNTGPxrGylgb8NEO7zPJtsLOiMcdMP1OMKf+15fwUqf0xsCKRiYYsYF3wo11jcjqWhRr4ckLP
 zdO/swYeOlkJuTryAhO0DPhQ3deRBOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200121

The qrb2210-arduino-imola and qrb2210-rb1 DTS files used coarsely
grouped supply parent names that do not reflect the actual physical
pin connections on the PM4125 PMIC. Since supply rail connections
to PMIC pins are fixed in hardware, these grouped names were
inaccurate descriptions of the hardware topology.

Replace them with the correct per-group supply properties matching
the actual PM4125 pin connections, and align with the companion
driver change that sets supply names to NULL in the qcom_smd-regulator
descriptor so that the correct supply topology is captured in DT.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++++++++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca..90e6eb284a66 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -262,9 +262,16 @@ regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 		vdd_s3-supply = <&vph_pwr>;
 		vdd_s4-supply = <&vph_pwr>;
-		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
-		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
-		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
+		vdd_l1-supply =  <&pm4125_s3>;
+		vdd_l2_l3-supply =  <&pm4125_s3>;
+		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
+		vdd_l8_l9-supply =  <&pm4125_s3>;
+		vdd_l10-supply =  <&pm4125_s3>;
+		vdd_l13_l14-supply =  <&pm4125_s4>;
+		vdd_l15_l16-supply =  <&pm4125_s4>;
+		vdd_l17_l22-supply = <&vph_pwr>;
+		vdd_l18_l19-supply = <&vph_pwr>;
+		vdd_l4_l20_l21-supply = <&vph_pwr>;
 
 		pm4125_s3: s3 {
 			/* 0.4V-1.6625V -> 1.3V (Power tree requirements) */
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bf6fb12ad990..3432022274d8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -465,9 +465,16 @@ regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 		vdd_s3-supply = <&vph_pwr>;
 		vdd_s4-supply = <&vph_pwr>;
-		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
-		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
-		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
+		vdd_l1-supply =  <&pm4125_s3>;
+		vdd_l2_l3-supply =  <&pm4125_s3>;
+		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
+		vdd_l8_l9-supply =  <&pm4125_s3>;
+		vdd_l10-supply =  <&pm4125_s3>;
+		vdd_l13_l14-supply =  <&pm4125_s4>;
+		vdd_l15_l16-supply =  <&pm4125_s4>;
+		vdd_l17_l22-supply = <&vph_pwr>;
+		vdd_l18_l19-supply = <&vph_pwr>;
+		vdd_l4_l20_l21-supply = <&vph_pwr>;
 
 		/*
 		 * S1 - VDD_APC

-- 
2.34.1

