Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960243EEAE1
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875089; cv=none; b=Bxh5WNk5rACQPa+Mu/agVxwV/i5JEg5abCpcKshmI1HI942aOEBnH/uAJoL9rCXBM2M5XKDHJ3KMf1e7LBg5d55siT08aevT8bx7lJKr+enx8q1ek4Sd8n5bhUvxTGTO4/e+GjtW7jREiBCC2hjjWnxptVY/gd3vfY/xTn0rgLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875089; c=relaxed/simple;
	bh=zXklJW06SHNkmW/i30zoj5Iisfv7Ksrs9zqE7YaPR6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqbynfyPem5DJzfK1v6GSTYemnXK2lAo4J+k8qt94i29U0YcqDTjDAh7DT8u/07Dv6/0HGofJglY5E2qo4WG79LZlViTVolMoP3rsIMZ+foudrfMo9k/cWmvcs62Sar9mNgD8sfHOqJ9XiKBBLFQK2NhhGpt6+fyzGNOugsmTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gs4N81/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TS8LD6ad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gs4N81/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TS8LD6ad"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mQGC871124
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3RBp0Ds4R6F
	66SOARppSLkTR2i6eLyHuZggWsiwXZyo=; b=Gs4N81/2KMjHHZ1CDMqzxe2uqdo
	VcAea8IAF2Z1+SkANVJZ8gi3U2K6gJXCaTqyqaEakDCWPX3qR1gYqc2cw3gotNPE
	J/vxDj9kLqcrRb60k7BzLhbmoMu7/37hU+TcZJGw5lix7vtLYljisbuIoOzu30Ul
	RlZwQXgTGzF8GgVfS5u7UJUXCtaY6gdmTvX7Mx7p/MTK7SEw1uEYwciOkaEzrfx2
	6SmAPoivflOU3A5TsYa2T6oASsqzkO8TiKQKfXzOpjg4+BjPnrSIAZL97SE4RIsV
	mZfArH02wv9jVMPm7kS+UDqrKv9tlnPd5+SHude4rRtAmGIg2RCn608CcBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eduru8mur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc977e6aedso124205285ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875083; x=1780479883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RBp0Ds4R6F66SOARppSLkTR2i6eLyHuZggWsiwXZyo=;
        b=TS8LD6adKSn/DtX4asP1AMING4A+QLplB76M2gTWclh+wTKwQt9yyww+C8650MnxXr
         Xj1tyu4iY+pZxtfJXzW8DgbBgGvIBNO9lEPTuHv0sNLpHWZEVmLX6tnHmLmfqQqKICkX
         GYLfNYAAjcUdQwvbPwOImzm5rK6iJTLCRF0+r8lkCeC/46AsZ1+b5HGOiwOb7mZL0PrW
         CtjjoDswdnnW2U00c5AEcGJnyu+pINSVEdVetJ7PswNkZaYBcvQ32KHMEL5a8imH2sk1
         lTd9Th49/kkwP3d42hEN7xpfQSaq+UXhgNR2ENBN+zPmF0iD1a5mjTT3nKNpoDMRLO8/
         gv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875083; x=1780479883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RBp0Ds4R6F66SOARppSLkTR2i6eLyHuZggWsiwXZyo=;
        b=LR6KJoZIKuGtLCRdoC+jDruOJPxv/eF5h/pSsoR3dg92I6ekTVVTHYJ4IzRSM4gHBD
         Epy4Sl8LnM4exWR3CN1PlBhxd0oJdkQ+/4Sxw3kfr/hJi/bKrzhTgsnzhSivWxdYpxJm
         rIh3PY/rZtvzhUVG8G4SUdHycEGBiPAoBM7CBopq0M2cIkOoWiZAm+UvqqMld/GdZCsx
         YIPzNYdm9uE1emwqWvdrHFqM0F92tbaySKlZ/IJNtMDsak+ZH3Wir42QToJzF+g3r0qc
         lzMd6Kf5J67tXOg0KlJkMqnitSvvbfV3Mvd6dNCkI4MLtXRAL2gix9A4cEP84jdqLYLv
         Sw6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8UhdI6fOG5H2bU2OsvFRVk5TTXvi6HRRazLd6RdEC9ky8mIvOf/pi5seL9hp6wW+qHCCORmF8moMWY@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjQstuiW5SeLUl3aa6jXalzTwdJm0Pq7DI59+V+eo6TMYLcXo
	/PputbPInLprbntmCMEzvxbfX9pg3XdykAkea9MVR80SM/ne35mbyo2FNVVzXwYXhu5DcGR/T19
	Ihz92EhtUVjmp9uPfZeKVwJAyiJ7Kb4u4vQb5YQALvAKlMGYlvRrTLCg3pbg7aWrB
X-Gm-Gg: Acq92OEPlelophcJJiA3Jmj9EHZj7AuNgXEuqv3tso5giB8teb7/Nn9XAzmMo/V5I7W
	R3oXKhEzY2w0QczYqydxMN9tKWhlBp/1CgCkA93ibdEAWbRYSQWfrA1azuHi9/VznMrRKbhUMel
	5DdreYnWGq0/oCeScmWRCsLryAQWtN3mGQdphlpO04DdsL+CDwU577WMUhooR6sO0wGopcQXENf
	sGHyOZ3YqJDgP/Wvz6Ahj43pqsbmqzL+799iLDiBkl1NTsx0rvD7HAt5fl7xBGMvn31jhSIAqjA
	oUmQL3hF3/U7lPObxWhINTBwT6vNIjNyFRNBMao0zAAs0+OmTg0dJLvZTEOAxTvCEGPMHiTkihU
	AF8e4CfIjXj3FqvRsK+jEjwo6Ku08nYZR1xHn4ISL1CFdLZ2E
X-Received: by 2002:a17:903:252:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2beb058d650mr256210635ad.12.1779875082631;
        Wed, 27 May 2026 02:44:42 -0700 (PDT)
X-Received: by 2002:a17:903:252:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2beb058d650mr256210485ad.12.1779875082147;
        Wed, 27 May 2026 02:44:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 15/24] arm64: dts: qcom: x1e80100: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:20 +0530
Message-ID: <20260527094333.2311731-16-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VY3H+lp9 c=1 sm=1 tr=0 ts=6a16bd0b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2snmNNp68HHBpTMW588A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5nMcVMFn4o4C8dDnNE_nLI8nSnZeLWfz
X-Proofpoint-GUID: 5nMcVMFn4o4C8dDnNE_nLI8nSnZeLWfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX25jLcMXakcmz
 bYDcG9i2na2w+5ogGiU38wcbfGbWC78pdp5MmMB7dquFBMWwIYEqpRaDLp5gMh0imax4Hcf1Cfy
 YzLvLCT5N8q06Cx2NZCBQr5Q1IzaPwPK5Jo8m/cav8jBJvafpHHyCSI0KaLsI6jsNm2u2NK2BGz
 codHBoe3u6xmRE+5MbpxdYclrzyGL13ozhk//WD3gN6K036RhldZBIx3lTq+5Ed+mbzdC954at/
 vJMGWrEp60Q/Tvl7lgZ0IQ31miXdp5LikG3aII4EqeIv0YvUIAOXks/9Zjd5qzb8oHE7xcJ6+ra
 q/XfxLxXJOweEuFtVVAYgEHauCW3QKIsP46J7K+ebNbLmesbGITGD0YC2YjrJ/jbhL6CJnyydWB
 wzAPtxRglW8nmVXYHHdms2kstY/MsnIKaJuRcsweo64lrEnpAZeU7yZvjwQIEVO2thLvSMm6xS3
 mq8X0xy69j2C7RwAq8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on x1e80100 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..b5516655db8c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6047,7 +6047,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 
 			qcom,pdc-ranges = <0 480 42>, <42 251 5>,
 					  <47 522 52>, <99 609 32>,
-- 
2.53.0

