Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19645DF68
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697226; cv=none; b=I4lRejgiT5ax1WlpX45v5Hc8SMshmCWAG8rxC+2WRaAHwSlkOxz4BDk9rYMQZcfZs9/nM7lLK/mt8a1YvUdMtjoCqkt8dexa4/dgvrImo7aMdnixT3W09AEiO2hMqmlaBVppQXDY61noPxG/JhSNXCAsa5hhwSQOW3AQC4esOQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697226; c=relaxed/simple;
	bh=aCGu4rJVd2imi2iJu4bW4ciGlLqiifTFBTblwp/3xf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzqrOPs42VJ9A9WEAt7aTKegwPzqK7d2kEJmsOAaaKnrLKm3zrecwE9gajDu+eHTk9J67dGZA8Uh9xknbliC9i+WveBlJqsdHVN7pwUNu/G/kvDnghKdUapqaT3JyHPEgwnR37RjbauCQxMIW/efF6OgFvGQquMqm6ZU+BnX06o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVFgEsyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AneswNDg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVFgEsyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AneswNDg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFUT5J708272
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pPap05k5rCa
	kTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=; b=hVFgEsyMXxHhpc2716CBHaFWYZx
	1QSm20i3h0+wrARETA9qImRe37/V0KjS1I/AC+7MkTD2xHMVtbVt/BxWrxCAx/9A
	jfebCOd/kfTWjhlE59suVWFJdFbIPHUBLS5tVqiamW862r80+4Cn/HLDBg5xbR0E
	QQyk+/O/ZH1tI3N+mWVNzOC+OlKUgoP9Bz96MafJ3QSDfeZGK9nvzMsJVldWVMTX
	niCr9bBvnd1yUJK3DLqC9+H2RO2p10c6Gp8DWG+n1EQq7tk1O/W4QuEMOnWjVKJD
	mavl6pwjPCLBPHMKo9TMD9BUE4r7LSBHb/mtCyhLpeOp3V+d7ATsR46orAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0g1kr3gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3441e2b3fc3so3410538eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697223; x=1791302023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPap05k5rCakTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=;
        b=AneswNDgy5oJi/aAy65ZJs7GfJcOYR2YETgw8k3nrpXJKu5BqpCD7bItaZU56onkvg
         WqWNWQFCO5pVY6/ygN1McSB7cqXbwJ4sITt1Mp5c2OLhmFHiGG9b+lm7AHIxeWtqrCbH
         wyhxzGW8ktwn1anSUAUSTAqUiBtBuLWAnsNMbeaZnKUHf8BGAggRw6GM4pVGCPQ0bzos
         w25kfa6PcC8UiQNhFG7kglJfLp+Wt5k+7l52Hs6xDxa3GLLfn6Zonc7gJdnD2Ye6D9EP
         LB9Orfq7jpVTbl6s2Ytizltcb+omtq71DjDVIMjnIhHW9T11iZfXWicldpGYt9a7sON7
         FwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697223; x=1791302023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPap05k5rCakTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=;
        b=hUm75XuNGpQlVvxJLsuW4BZCW4n7kEBbiifh2p6IoWXT/FXDuoXASPzBSjS2HqW1T1
         4eGjWwjEQQlLcxbNWzSbwgz+PmIwM8g1opHRx6JWUy3QVxIMsI2+/HchSUeXYXMHLWtm
         j0bRCCDcfHX7NZ11KqwGt8oGBOaGDacwGo9WoyJ+U0zT7GWRR8L6ycF78LvHgf5Mt6dA
         bWSpeay93MidhUNuvByGMVxQZkEpo1VEF9eesJbvsBLil9XNe2HHHkXndclrCXXWBM4T
         TGVUQlm51Hj2Ho1Xj2CEjJo+VpOVq/tOWEknxVwpRZREeh9unZT8tfyQY14WaUHpIxxD
         NM+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzF8lXB9d4jNWrJ8JJueLRyJGj0mgYg0Sx/jWHGhVks05AGOQLLQq/n5fxecNIxlQed5VoiRj661wYP@vger.kernel.org
X-Gm-Message-State: AFuF++klPl1hTRe+EVnnP5jNjSMnUepefD2uB+7W+2ypxuN2cj9i1VZ/
	Ivyv2Ulyx7XthM1rlhbqfqbedlwb+FahLR5I7Ur4jFBR6DcjkYtHI7gY1OSJJkP0PyKdj3Qhk/h
	nCoyAZ306qaiR7OnsN5MnDGrW7k7isnWAlEKTC4K7F/S5Z/d08AUyZbcgge+1FuYv
X-Gm-Gg: AYBFou2FKjgmeNBoeD4T4KFLPVcDq2RuVv9ToGMghNYxu+rH6bmKrVpTrMX2bmf9usP
	DNgEuDrniQR1jg9pENXerGnoV3mL41jP/PFnv/HyMiRLoaxVJE8C/en+dfht470kA6tFw1/Rzi1
	ZgLBjYG42YuaKMWt7d2boIwrwZCgPKpla56d9VO/WbWXPquHjXBFXR2Qo3caWsRu2kHMEe7+pQ7
	02anCwfllghhF34nci4BiJWBhhTuE3LzusdC34XQXskQBmjTeC03aY0Q2JNFDWpEF6EDiW6d1Yh
	55xtDpUZHZq7J91uA/CenHhbugkc0kELehNjGhUL6eGZnI92NA+HeF/7gqDvNZ68I0FakRLgzTv
	vAlctpChHzFDn6RssivokJ8whHiffnZshN6P9YcVCY4r5e0UDkvUAAqU5fLA=
X-Received: by 2002:a05:7301:da86:b0:34b:d8dc:430b with SMTP id 5a478bee46e88-34bd8dc5f3dmr1272451eec.24.1790697223336;
        Tue, 29 Sep 2026 08:53:43 -0700 (PDT)
X-Received: by 2002:a05:7301:da86:b0:34b:d8dc:430b with SMTP id 5a478bee46e88-34bd8dc5f3dmr1272397eec.24.1790697222513;
        Tue, 29 Sep 2026 08:53:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/7] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
Date: Tue, 29 Sep 2026 23:51:46 +0800
Message-ID: <20260929155152.1898666-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GxejpTyW3exFNL7PUnw-6yzFKow6XXyY
X-Proofpoint-ORIG-GUID: GxejpTyW3exFNL7PUnw-6yzFKow6XXyY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX2V7GBt0DVkAQ
 SbK0CFIvA2YucmS0UtZLerO37P8Xf5kp5s+u1XbsK4OCjiU9TY/xo+rN3I/3GTBBmoiIRaNpFwv
 liedNjBUJu0wC9jCn/6tk2L+bIrqox4=
X-Authority-Analysis: v=2.4 cv=Ysia1IYX c=1 sm=1 tr=0 ts=6abbdf08 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YO0Qr2Knm37rpyWBINsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX1KnYTwoFrm5v
 FWVoQg5APeh9E1k042HKxpjo0hYud0o6t8NdLKRI086qiChDKpxRiCHUdh9FlJmCPLWkKvIsFfG
 wWhKcSWwkaifqsDwB5lfewUq7j5MFPyMnH5n4ehyv4MtETFom8ocjeWlmVOceoxRsVh8pbrDOLi
 XNRIdXrR2ATScn/f0ct0iVNv6CxL38IHMB4KZkayzuKiokpZ84aOHNtqp+Bu9NuBjy+T4itt6WL
 3IWAyEyhjmGxqmy8jurxIu73EIB0g4EMRmDuP7Izdh0R7HA69CSKOHkV4ltL71GpikEUDEHhocO
 JqzzXKA3RIIzlnEhnveDX1WvP+xyMC2Flppx7cwm0AnPoQp6Me3mgKP7A5lNrIEAiHm0ujO1FKt
 NTtkP0ti56LiHsjASeLCXRI2R5bzKbLlvfUGkOkmbnsNy0RVZknCMLN/5JSAgc2YOV9SoN7K2uM
 ud6mFtL7t/1+di9+9fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290063

Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
RTC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 7497dc3ac5b2..78fa1d5ed028 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -17,6 +17,9 @@ properties:
           - qcom,pm8921-rtc
           - qcom,pm8941-rtc
           - qcom,pmk8350-rtc
+      - items:
+          - const: qcom,pmm8654au-rtc
+          - const: qcom,pmk8350-rtc
       - items:
           - enum:
               - qcom,pm8018-rtc
-- 
2.43.0

