Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E53EB811
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846660; cv=none; b=oG9faWq7o231U568sB4spSPOcw87PDJPscFsAyt/ZvEeqhyGufyCpaEb/5qu4HF5LNeVnHSS+SWRzYbz9oc+Gq3urJ8lZiV1TqwvhG4nUmYkNKSwtVx/1cLMifIuSvsu+svYzy9ypVhMKVbR6NJRq9bxWXc1hIVFHXQBRJZ7VyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846660; c=relaxed/simple;
	bh=qFbU7Ea+fTobclE7SUAMxeb5FPSO+m8vGpecbrflMi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSVceT13DjE4wt1wpAPM2oO9VnO/rOUGqEu8Z+oCPmdeT/rU38XYaAdJyUU8404JlyyHsAudhZLn4S7UaFgxxwRcEMFzbguB3oW+JvrBO4sIUyb9z+cJ6DOEWQYVvB8NkFk/BcbRnMOL9AAhG62wOfaJv1abefjHEUgzhl4vW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkCp3LzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJB7jdOi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkCp3LzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJB7jdOi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIApwX1925388
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WM7aKDnSWoS
	kecYzbNFu+bvRThloLi3Ibm1M/DGnquw=; b=SkCp3LzYH08a2QAjHF8/ExtxX+P
	+5h+OR5su98VHbYM80ISEaGjTFZx+ghkei/nxu3LPbhbuczoF69fbfni7EAnPGeb
	9IDHaSvMBlB4fBUDzZvxAO+uMVotfSFGi1D+JJXAi511grilY88efzTPTe93gHtX
	0lQOWOgMh73VUnRjlZD3aT+/KXHgicr0Gh6ATMC+U+kYN2OpzmX2mGpxSwzw84Zp
	dz0u/UsBoZaw0HxeJ+Egluqcgh3EfYPOh+YnSWWGJIsOra1bM/zp5XtMfKEiYa3l
	dDoeXI8Q6XgnlpkGPkriG9PaUzsqxb5HyOSr6uwRk5nB3F3uTZRZnqWLy+g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjthfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso1821025b3a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846658; x=1776451458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM7aKDnSWoSkecYzbNFu+bvRThloLi3Ibm1M/DGnquw=;
        b=NJB7jdOigHNYNTcxU9TIEv93GbVslwO50D2xru6eX0E9Sm716OQM1qFV89I/qumnTK
         a2npUYJ+x3Ww6pSo6W5YVETNJjXPP8tml/z1N9M1y99JtU2QwTvTNQzZVCYVE5aagwWC
         Z7HtxYn1spzNv2CSmaUEOj3PIzvOMSH9Xzbkl2LFBUemtnqtwDKoPHMLHMUho4pHr7zJ
         4fLaUVjDkRcUjOlRaQREDt5VLiiivS5yia8FmvOmzH7kdNl5cLM1DGmNso0z8vlPaas5
         MVA/ziebYlAkP9Jn+QGPQ3z0/iL6Id70GGCxxT1umclZR57PipMhWxYy0DzcjRhy33sj
         Kchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846658; x=1776451458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WM7aKDnSWoSkecYzbNFu+bvRThloLi3Ibm1M/DGnquw=;
        b=VceAEj26QNx28MDnmUKsJCl0Ck05ZUxhHYdVC/8OLSci+oFjHzFbevwcuxNVuPfBY8
         eM7EfHJ3+vcQ14NW+Y2JyNh1H1fQaH/vqqBdtsVE/WRYn2qEsrkr2d7z6URT832u6PpV
         1+wInoGbpg+V0P+3HA0pnmAla2dpqUYDrs3aPutk91d5n7lvjcfXQr+2EsOnJsvfLdl4
         kETTjpxPHc3O8PdK98L3IOYrlolC+km5vB5uZOUlYTHUs6+q9nKXTdZtvBt2Origq7fX
         XQl6EFpKgjciZ/keUKGXP/HG1Bu7gqyNeuvJqysLS/5WgArmhr+TBogFDHW1QED3ZkX2
         FB6w==
X-Forwarded-Encrypted: i=1; AJvYcCUs1dQD5qRgCO7ws3X5e2b13GdVwTmjHBuvzaI+BI6glgYbtW3MV3mjmadz0amp81XCzuSbh4rTzEf4@vger.kernel.org
X-Gm-Message-State: AOJu0YzAUQpPmnd2A/svUGgDdQk+7lN/QPUQEgDQly5DXuZKY+CSTQII
	4tXQx8ZFRsZgYD46i9eW93hhJ+Xgc5x/r3tplUQ0kWD9MwGkfiXb6OoeebRBN02j9iyCVqJdmuD
	s+ol/Gz2pnCSDRPYI/naMDWT1YeYE9qQQMAJiyFNMenwkDQFGr+7InixsNwYx9Goy
X-Gm-Gg: AeBDiesJEWaVFNU6rV9qhJmoN1K+qjYZQb2/YCc8vRxzR2CJhfAF5XaeI0ZSG/WoX1v
	TRSUb6AMB5MuQjpKWrCZDrfhYg9mwdiWzkO/05RQLsPEf5SE7W1AfZ8xZp8BmpvTFr0MDMACcG5
	DVH77bzz/NDv0KY5fHYaTiwFT0rLaMuwZVNHM0C/9bJvoH4yO7/0hyAsvF0QZlNj0edOpqPUHEf
	mzKy4rug60lOyd6pIEbOuWXdNs+TLG+4Mw0kOlY5CmlhCylPrud8B+hgM1nwhOlrCl5AFOF55Fi
	TxIFrTZRUoOPAfMtinSWWSY1R4rkQWsTJydR9qn17pZhQVyHd/f5geKWZh6KpPksug4uHtXLQS7
	/KirbUTrOH7xK/tXRS1Qf30iHLttSZMvPQzGTNUPrKFeKvr+C
X-Received: by 2002:a05:6a00:244d:b0:82c:dc9c:e770 with SMTP id d2e1a72fcca58-82f0c3a6878mr4502699b3a.40.1775846657695;
        Fri, 10 Apr 2026 11:44:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:244d:b0:82c:dc9c:e770 with SMTP id d2e1a72fcca58-82f0c3a6878mr4502662b3a.40.1775846657046;
        Fri, 10 Apr 2026 11:44:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 34/35] arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:11 +0530
Message-ID: <20260410184124.1068210-35-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d94502 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3DyYtJV8JKnA5jZGLM4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: sR-zXkvKP-bwZGDzuqeIR1lHaRTNNyyh
X-Proofpoint-ORIG-GUID: sR-zXkvKP-bwZGDzuqeIR1lHaRTNNyyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX4s96ZsUJk+I8
 gZmSIgHDSebvV+1l1s1kr69mlURDXfG4TMZDV7pCJMyRgBJIwnek/GvHKTqoz0PFolWYUoo+CF7
 D+x8RD9SIUBgmj5jg+jt5MvvD6Gu3MgguXz9bweDH/EU4V/MwbaNH0NfWUHObTZ8e0RqJQBqjBW
 DsqusmpVBQHKppsN8SPADRWwKRmCcua914wETCDIG4BOou4FaXZ9da0OLAnheLuEg2h/D6oDI35
 f7SgFKnyBqTxZ1mUAEYencTwpGqGGu1/r4eD43FDJHS+IGI6mpqGRwc14qFZ4kE7cPTJxxIEk3Y
 HPJLDUXsTuObPutXa3FzO563dVTo9IH9XaGImhOyBukV7tcT8zUmI5YshSnI2Hq1YETG94y8vaJ
 L/tRje/XP75T9ncNqE9oTT2bUTUW/r2MTtClWlUzyIUYffE3RSKCSzVM0K7iiQIP4LCj1Im6y3P
 e1OC0RY+piDh55+T3Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 82a8107f2f1c..e740e123c1e4 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1100,8 +1100,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdx75-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x10000>,
-			      <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0xb220000 0x0 0x10000>;
 			qcom,pdc-ranges = <0 147 52>,
 					  <52 266 32>,
 					  <84 500 59>;
-- 
2.53.0

