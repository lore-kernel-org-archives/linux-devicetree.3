Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734EF3CAA49
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685222; cv=none; b=IlBkLO4P3LpD1mFh8ExUwsrVJ+L7zB7SjNe07uVGbRYX0VfWOftCt49AzTpkrEzeiWtV9HLByL7VZnHVzFy4OHn6iXmFBmTEz8J5huzgA5Qm6Zhp7ASHhbgly0wf6mArmYI4+m7+MfBarYfGhYa6P6dx6bAm1gRhmHU9v7WEIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685222; c=relaxed/simple;
	bh=9aW/Il+F3jmFYDK7Xf+eUMzXhXUAVEvmzmS8mqMS0sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+DKtSNTogG+Udbf5LfEDWlMk9PyYeBtjkRaFq/gsivSse1lhY5JUSbmpSdFJO0F5k7HHz+E5cNGol/Y/TtRZwPzyCdk/nGaJQunzlGxOAbAoOX8nJRkVJelN6K/o8pXumSqnDLGeW4ypVj5TYX96UYkhy+LgxFx4nBMdZVv8p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyBsUtGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvCRf8GJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyBsUtGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvCRf8GJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdH0k1572805
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvx2K3BvEqIIUviRBaGf5QiNj8YmLTWogvn/E6iomOA=; b=lyBsUtGGPY+o4Y61
	vDKj+TBib25k1w3GPFp8h7+uswMOBMHHS8pXyTkONLEmHzOae75LTr8hJS4uzYcv
	RAqf6UbKOwdQGD9mbsHchF26kLEQqVi4KZkTn+V+cPT7mKSz2HLz76wMMgaxtPzD
	2zUmJYnLPaBAaDUh80XgM7amxDqIvCqG87r7NxlVgdPo/zZbFt6DrcUvTwaO2bIe
	kb84I6GBiH08uDvctqp3SnbNqy9sShcF2WZj3T5BgxWLyQUe3LijHI6UoB6d0nc3
	Vcw4uwZKlnuSLHgk0TdouSUFfLDCsynLoOjdwMhGMe4VoQLrvn93la+SC945DSt6
	A6aeiQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgr8d03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so3206305ad.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787685220; x=1788290020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvx2K3BvEqIIUviRBaGf5QiNj8YmLTWogvn/E6iomOA=;
        b=cvCRf8GJTNWlyvCGoFpgzs0nS1PbeCswOAVZnHvXFb8KmjeDIVCIqXbhk4K1n5e65H
         DlEySCTlvMhq2LcLwTMFj3vvq+5bYVRwADZGwuUkyvgECMdISFrClS9iau3oI6IsW7zV
         8XlJqoloEjcbCSvlsRkmimyCPDHFHlxMxsbA0g+t3b/M2kK1r05uToCq0iKJ2RBcHehg
         m+BVmD6US38VPwqkMUP6NzF5Im+M3fdbY+NsYBWFm82I5FkdnoqKMPSKEX/vA6Znf+LE
         ipmzyoWD75EZHj+6Zqe2BvDp7cfT3U7DlvVtja+QC5u0Gr+zMMPXwgOGlXa864fehSZT
         5OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685220; x=1788290020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvx2K3BvEqIIUviRBaGf5QiNj8YmLTWogvn/E6iomOA=;
        b=CbHGBVhioJTEn03avJZPcgyCgRgypFaMLHqdQm4ThO6p/bTWO+zaQqT5YhhQe0v6Uj
         /RykM9bKc0sOeH8MVm1mz4DcKCMAdAC0smMBs/QIJknn3oygy7NS25SJWxI58QZz0YDt
         ZWH5fhS3RmALTwrYxZhxy4YuSWzgDf5w/KzB++jCdH9zTUCTHvVqu0BRDpeQlEX892Ke
         6efpWbUsZrLgTMItBkHlTni0/PWF7ah4RBMk/IQpsCBgtp8GlJhHuUM72ul4Z16+MZUu
         +XR/XxcgPuN8Q6uEnnFBxrutzrxSNcTigxre51Xd/bMpYqThfjMckodGUM/gicq/HRru
         1Syg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4V/RHe/f3UexzKvMw23z+vaB/SRRgF26/fUPIUvUbmnQC4T2o+rs9GAuCXeCQw71UxChl7JxxfNhZ@vger.kernel.org
X-Gm-Message-State: AFuF++kqmhAJouiMi+V64AiH94awS1fbSZ7tuMDJLC8fcUw1qa99UJq6
	trJYCKQfTASS0vnpPetvQBCVHlVNVki4C/WAok0IXJFrevbifyA2lARwiCnplysm9AoNjPdxIzL
	SWdQ+JRuRHgntAEsLyIZxls+phMqYVgxGZf9XXDUW23RCcIZQJxqwENFSQwhCzAB8
X-Gm-Gg: AR+sD13FJY+Ss5JRnTX2/4R+VRaSHakcMCIKlCjWZra5Pmten7h9TAJGHRE22AmLZ1H
	mWzGW/Hbr3U4Kr+/+h3RX1vJVTPNvcXSjOQSj37BBdCuAE9pLwjQfzPGUiwnNitn/WJfjGzDJpq
	nlzgV91kolpYni48AtUu3+BbLe856kr00Pcvo6vr+DR5jIsgj5k66FtN1TDBDDBtu3YlTPr65WN
	KMkWW+ZA+gAT/y46MYQ3/jyUo35FuQbkNTWCXMrD9DwVWb52Wy2Jydilp5Twzu9ywi4SO1Bh4BK
	frHGPotvYuioeDaQwKMBQCOZKxyrgty0l7u9NHX38MJKGbiEqI+CvEg/6pP13coFnZNBFJ0gB8X
	rBJqkzia7/FgVdyrNBzFTD4WCORucvAl2
X-Received: by 2002:a17:902:f789:b0:2d6:ede8:51c5 with SMTP id d9443c01a7336-2d707a0b16emr9425375ad.6.1787685220054;
        Tue, 25 Aug 2026 12:13:40 -0700 (PDT)
X-Received: by 2002:a17:902:f789:b0:2d6:ede8:51c5 with SMTP id d9443c01a7336-2d707a0b16emr9424495ad.6.1787685219574;
        Tue, 25 Aug 2026 12:13:39 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm930416eec.28.2026.08.25.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:13:39 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:43:21 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787685212; l=1477;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=9aW/Il+F3jmFYDK7Xf+eUMzXhXUAVEvmzmS8mqMS0sw=;
 b=pr/YHzGpp8IkwEicNT0Lcow8PkwzdI0RmahKygyBdX5yVRyuj+r6qGyDEd+3Zz1fblRQmy3fE
 cYnstZk0gIHDo2176kNIW9A8+tKB/nA8WvCGNTx7LAdBRVX7wB1Eksg
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: IbFLFEBM4aNYYfdFNbq5qgxoCMSC3811
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfXzxzhnJA+pm1t
 R0/EJXuQZ+oFSOsybJ/sKgb3ZlQdTi2l0igedYb4l9V9dqifeZsUXqsZwL4busIW7HTdzYVC3lD
 r/In/bvAWA+LNiy7w6NT1w3g4tr0Grf59wGYY0Bjo5b82DDDilus/aWlBEPKcvrfKFkkaQrBRMf
 r37SDJ3u3jvTTcs1VIdLRnlgUUtDmR+WaZXT0xd2ohcJT6fDT/QlA5PKCzniTvRrfuP7ZpsAt+Y
 mpK5Bz3cNSHbZhswyMeCU3feY1tkDqFZRqUErj5H6RFBwDXyEruoTorkuHGdByhjbPe4yHp2XSG
 r0dU9jKmbfuvbsF/VTLSwa206khu7jKrH2JROFrB4h70G++DcTguZdXpNsCMcofPypYOEXxa/Fh
 1IgHy+F6B64EgwYgg2WdIr1rQ5st3kSefR9pVLSMD0Y1gqQg4a6BUsIvyUaZd7yK4iCBmK6J/Tj
 Z42SaePbkTQ+o2lPAkg==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8de964 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ikZB-fCjBoBaDskMKxkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: IbFLFEBM4aNYYfdFNbq5qgxoCMSC3811
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfXzecp2hi3Y9ri
 w4qKSLNEV+yySkl2gKqO07pTUSprsXnbwOiFTl7CayT851hLtJSOvpNHgh+RfU0CfaLWzhf/CAn
 6i6hLsh/N1R6nDs+2/12r16FCElvwDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250163

GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
preventing Linux from accessing SPI5. Removing them from the reserved
list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
for dTPM usecase.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..fde7fc035bf5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -197,7 +197,6 @@ pm4125_l22: l22 {
 
 &tlmm {
 	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..e119ace54e58 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -219,7 +219,6 @@ pm8150_l18: l18 {
 
 &tlmm {
 	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */

-- 
2.34.1

