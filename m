Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97A3E51CD
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846636; cv=none; b=ujENj5eK/zUVedQ5aAtpmiA2uU9QEs9CdjrwfdQqYVctDR3ZOA+XuR3OSHx4PZMDCxhk+5US/SeFf81an/zLTooozePdD/+MikHsFlGYGr07Sc7dMCITTGsWnLnsapRG5/nAURVBi+ltZrUtM6KPRpdakZ/XVkbq/OO4gcE9VLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846636; c=relaxed/simple;
	bh=81GHWbdftJQSVjIRnWTdMUQnEPyJI753MY760MuIf/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVXPt6DoXGsiT25zkn/EF0gKz1FvLOh2wxmxQThHj22yigqxIk/ICedYCFqhj6eA93v0hMY15Shq50ychV0DPxIudBX0UGI++HKJS9gifR5xSKOWRmbBEQhCjv6kF79N7gWq6zNAmJyHqnx9sYCGqZW08IaYPQ9LOriOYpr4UPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyGfNMNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBRj96It; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyGfNMNq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBRj96It"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAp5qN3742884
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P8RBLx+7Ek2
	IiNV3wrOtzMqa61+LguohES6DrcbHrYQ=; b=hyGfNMNqaLAE/A6WDjra/APbnRY
	QbjvU4A0m7MKcoJ+53BetfjG0/ckb6ujEluVYVj6vK5wOADlpxpzWCoLXFiE0ADp
	GwieS7p8KfVS/B7+yfq6Eq/X5y6aQ7FYeelxqJbAlCc+ATmMcX4Pv4caTWqPOtBQ
	V8VPrUwaKRwfT3a75Y+xkAld3eUsO7u2YPVbf7XoSaWhSd90MQIkotRKWlrV4NbV
	IfdKH44EDdJ3FvO6itEDri9cBYFuG1eL23Lkfr+1YjpBvHKpcCHZpo79K5Rtwr8T
	khAi1lm9Col1rJpu2aAjf+KLMXYCR1Sy9fctj3JsBPz0WLjRtnbC0YDPlCg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f07078eaaso1132058b3a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846634; x=1776451434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8RBLx+7Ek2IiNV3wrOtzMqa61+LguohES6DrcbHrYQ=;
        b=TBRj96Itd1HM5DTrr1QbQi1Id+Km8Kus+F8Kn8D6sQI3OKzFumKXLwWP50HeBhxFQT
         Ndxdtn5XJdxlavVlbUjrS70PixA8nJlV8MGQs/GfRqX5tOw/zLN9YEqDrMf50T60qugP
         KrmfaQSOpOKDLFjXvOVqYqm8hMSAdfz5tE/LPl1k83nCM0kIfboR0wup8Q6GoIcBtQQJ
         GzTDrHynnY6G+DMqbCV7mFMOmRlbvkHGtzm8jh1z3TdTgyFZKo1jkcuaKqdEEVFnzOO4
         SEw1AJmK3oUJPrQdZrygSdNKK9FxC7KFDq7GLWPMAwwlnBUXH5/sB4gjKUNnRCqEYaIR
         OObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846634; x=1776451434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P8RBLx+7Ek2IiNV3wrOtzMqa61+LguohES6DrcbHrYQ=;
        b=A81qQzN1mrVO5Eu1Vp2+OyyhfJCsWvd/MjUtyc7AwAI1Kn281WyzvmozRG+2XX6sqI
         VtcNP0NAyKEiNW/iG+neD98jTbhgYU4cjN5pIE2Ew/tqfpedQ4SF5gRUQoM0z4EgQ538
         NGICbQuHPTmGtFV6hOI3ijr/ZHhRIqqx94qcLkA/EMoZmnJ5Pa6vZmsxRWE5A16L2HQ7
         OXed41Nm6vKgy6cBhh1mwsp1T+C+pk7gCBE0dQ/dDafma9LQeA3i+RECGpYHY20Upc4t
         u0nT9ZVW+tljf0CUe5PEyrJQWmezo+ADNJuDkbFvEEm6gBCg1h/qtHa0aby1ecNl6i4t
         KatA==
X-Forwarded-Encrypted: i=1; AJvYcCUsDSkjxZNHh7Essn3bzbp+K7VCq75I3KTxWwcJxg3p/27yHE8H+nViSTZ2eKx62b+ITKmlNSUb4DKD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzn5U9nUzrc+HoVpRWB7P662iWftqqphchYj44nJSjpPMBW0VZ
	p976mYHWCsZwNvty2FNbsq/Z4X4rCEM3Kv7CUKvM9Tjx64kpAjB2EmmbwvDfh3G5ywfXc63MLbR
	g6DTWvDB5kC5b1arpNMWWERfu899Ofued7aCAPNLQ3noV5DZs0FhLETwGbcJJBxKL
X-Gm-Gg: AeBDieu6YuoOGQx1QG1YddAm0g/Lk9s3Pz4IMJlbWVL8B1E4kRgbj8yw8YemrnMN/3M
	pAMw3tAln27Di+5we11Hw406uNbJH1o+hT6N3Gi+hz+oj7Bzc4RaZc3a0Nf5t99znVI0a9L+2vp
	AA4nowqRqbQuj/nJ1cDQ9rAjH8yCJs/N6q4WIQGICsyYWo/BUgByqLFkGWpZkxYYzMRV1eaAdCf
	o/V60HBGUiqxlyGLVNj1cnIFQiZLmmVBCQvJoSVPtg3wll84moIemiDk62a7yJGKJv3eFzdY+wC
	EcENB/lwKqe/qCXpXxCtWZ6aTj404ZZnW1y7esdC9Ttlz1fPyI+xwPkT4UHKHD2W2TEAdTfDDSR
	27hE7ZYvdSuU1GrASVvyWhBXD/VMln10yw9oZGVsoQxSm/Nh1
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr4747090b3a.39.1775846633917;
        Fri, 10 Apr 2026 11:43:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr4747062b3a.39.1775846633381;
        Fri, 10 Apr 2026 11:43:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 28/35] arm64: dts: qcom: qdu1000: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:05 +0530
Message-ID: <20260410184124.1068210-29-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1GqfAhJlBN-5p4Dt6brRs8k_CkgHtlvr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX1W4268CtJVVe
 UD1veT8ASmX2kjppWgCxYGQUZIhnUY9EXYXqOijJPEuXKf9y2+2zSh5w5lIWTVg+7r7FjlCVksB
 ItFMdVu3d6jfBrVKs6w6Ap6l4uTkfnTFQv8Ak0wa1TasrlqWmP3rO0zWMjxqc4L4Wi3luBbJlW2
 KPO8K89V072uBMe0BdhStUJBqqmujG0Ut5njsKVBKhB8u+0uEvJp01jOCA91rDMC1v356jZ+x/L
 9XN+1Z1rMzc11ShnH/CgdvsNhTFFabhbFu/wCVpKiLyEsfBbZg448UrpxEaxi7BFTJj9NiTToxv
 aZVugzEi0RGOkD+M9TBVvlKvn4BtcZ2XzKXzeDOmGIKCBSdew/GvZhosLVzLv4TS7Ie4sL/RSPC
 O1avLNoDxk1mNvkpHWxkZWo2NoXr4RH880xSeRaL8gEfdLIJYz1iTW5SMYPK2n6nKF+zQu/Lj23
 sm2ubkisVG1FUDO1OcQ==
X-Proofpoint-GUID: 1GqfAhJlBN-5p4Dt6brRs8k_CkgHtlvr
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d944ea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index cdfe40da5d33..4962c27d5d46 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1054,7 +1054,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qdu1000-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0xb220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
 					  <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0

