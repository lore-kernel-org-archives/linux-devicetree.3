Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD1F3FA5FA
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419963; cv=none; b=oQhFviPoHvf45ZtpMWxlATiwsfofP+zmk6w+CuCgcm0m0uIECJ5Bfkd8xJysEdM9nTqKLlwcaCsDvoPvdZd/E1kFfG3xrqmGbbjkphbSwwQ7iKvveQS36RPx4ljMb8u+aQCw3xYwE/q/p983t4iFSl87x6FTNMnAHE3DfswDnkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419963; c=relaxed/simple;
	bh=uy/MlAsOdDVHNsYX2VAuailb4BNg3bdERgcHE0uw7wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eodAc7bthDG+7vi7DIW9sh0yvU2CF/q9mEo//fPPsW3Tva+lvc3dbFVUGSaaPyqR9zYfAzrL/TTaRXa82flFXSqNUs8gbq5HXpCa/9q6emttmQQwkEmy8k1kInVQoCxdVQnC99SCYIzixZHRGn/tgF6VlYfLf85Xv7V8zCvYZ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maJjRB+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghyAIT9N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maJjRB+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghyAIT9N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lkQa3642049
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=; b=maJjRB+PDnz/6jkK
	uya742wfoB3cReWtNvYbzNOilAnq5OYKJRIxw5JK4eapAsdAk6K501yy4EhYIY0A
	PJSzP5hFsiCFD5nPrAub/D3FmodmbV/5w1AMjypIxrlXJd8LBNoSj1sB+HqNiBhL
	CwGhJkLpWdRPuD0CPTKFJ7VjMkWRacl8jC8uY6mgPTbc9GJ2UYqmMZPN2mjLLyOE
	A9sMvtP+5hjTwxfWZgP4/vZ8yIs7ygvdkyEUvzUNlahC3XyK85n8mvMLtWPiHjoD
	pwiybGDrzimVvQ2Kb1d9j/4ICMxEc0CVT0lG7kCiWS72fT5T/QT8hO1XpU958zBC
	W6C5OQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdup07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:19:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c62f0d60so2755396a12.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419959; x=1789024759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=;
        b=ghyAIT9N8VBmqbwzGotQ/tiK5kk+F8fbWpW20NH16WF8pFmczNGgf1D6Q1gMDiSMM7
         1MHhvuWuMcdcch61z18L1hAavnxyAiNn2kkBw8XOds0KFfowkPgdkNMf+yghn+Muc82g
         ooErMhgCfGRd6XYjPwgpDpfpUU79qJhmOnMcOwDiDoPeQ25hCbucuSJaaREpPN9p257J
         zgz8BAi+5Gu8wCOc2biU4Gh2GEEepjiL+xtyGLjRWSeSIbRVHon7blVxfPhu0N1/ZfSL
         CIiBq6P4cgJVIwIguJbsPfUipVEZ6HOhg6787i/A0rUOFZbLfybgxQvOw+TnKyGzv+IJ
         WUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419959; x=1789024759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=;
        b=qIHttDCzIUzHSVp/J+Pmdtkq/BCuEX36zWN6cTqzpMyh3nO5TkdMc+28cdRiK71y/b
         GNQV3r2rqENn8bxHSTXwlpBmT82b1Pp7Iis12yNE56YQeblHGIQaRTCj07f5Lsni+NT4
         0jnNxJh6bfQQA3eyerOnrtxKFMOqTGn0BpUa2Rgh1V3VyLROu7j3A39/s6qkjF6YyRNY
         2cZ8IFwosge5++u6DoZAqwC1I0I/dBSZuWAszuRn6LkT9DfphSkpwRFkAFln/MaKx3wm
         scw8hvS5jvco38YkOei4f1c4R6uCJ0imlsIUsDgSbF/gZHm6BdujB0fOb+8vhOBga6lM
         1fqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/+giJhi1kHY5qqvotJiYMYAmSE5grPrhFdlB60qBp6VXOvQY3+AgfKFrJUpKfjrt1kfLfcuB4PDef@vger.kernel.org
X-Gm-Message-State: AFuF++lNVXwAHemk9GyrEHS37cH6aHZJhNqgqj3kiw/VodbAtps7PUWR
	rtBUoEosYDjVYyrxviZe0PxhZW1ZlLxp4DWOE6K75qqAFmTI83IhMOJ7WKXfaztlTUW4h92E4cF
	tN03Lev+BC7x1b0YnbdTvK2+R5zm4ywruakd5eUyVC7lk1u0V4RdLf8ecDcChM9QZ
X-Gm-Gg: AYBFou2kSOJvWfhmvRi2mQY56vKeabv2ritU1EEt3tzKftrooMpxx/kqLVkSLTqAumF
	X6dK5jQfmymRhR7d0uxvVR22sRCeCk0temzTxWiFp/bwFDBrEx69/E83Pe4xefJIEKvGhsU0uE4
	2Zyu8hC8GpohLZliYF0BAD2MtGLFYX5ilpKzLPN+sXNxDBJWGe2MMCs+JP+dl+zK06f/1OPxaMn
	3S/PJcBKwGqoZXYNAruL8jDHBR+yRVTpzhHRycT67TzC2VhSvPSUxKo/qOoC54bdXG1FW08p/kX
	nkmVa1Oce2NseGUIUT3YD6HowdkaR0XuMA4N5Ri7CtG9eX5//wNM/HB7K9C6wlyVFuIiC+xd3yl
	FHIeHB9DRtDYrZXejVwMIaIsh0flsYGdA
X-Received: by 2002:a05:6a21:d89:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3d9af5f9bedmr16722316637.24.1788419958315;
        Thu, 03 Sep 2026 00:19:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:d89:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3d9af5f9bedmr16722268637.24.1788419957886;
        Thu, 03 Sep 2026 00:19:17 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:17 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:48:53 +0530
Subject: [PATCH v5 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=1538;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=uy/MlAsOdDVHNsYX2VAuailb4BNg3bdERgcHE0uw7wA=;
 b=YdSaaZP0aB2SKEG9yFJ1nkG7/Cuxtc0l6V5QUHcIogWt41GQ+EojV8U28QKDtESqt2/xYsy+1
 +CxRreAqujyD6T3XiU6h0ztdLRiNghtgwddnzVJ4SsAuO6BEIrKHklH
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a991f78 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ikZB-fCjBoBaDskMKxkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: yjHkcnWE3BhdiAXl_0lm1HZsG_HabvaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX1ka1+2dugqoD
 9H68O9sSvfviUj+s5GZ1LoSmAVd2Rt7MhBhU8Wmw2IsUoa+ZDSsAV6eeyPC83s8TWnXLCH5Pwcl
 HnrLbxhwUz6fo7iAReE0UchVku7oEyvrxuXeCvujX5v4fQMiPOUpwswPtQxuf6nDREw4n9A9tk7
 xUz24HeoFDCDZFSbeshg3YpxTc67z5yt3A/NxpOitU+Of4WGrasij9x/awTugi58+ZSatWRDnGw
 O80ITvCs7c13Z4y/JZAT+OWAFrVB1wGbPlGbWI4ChU1lASCgEmnyVyxO2Pp4Y0obTplnIveH2Eu
 GPtzG26gfCx4UqBkkpR+vtpiohBE8Lg56TKKfPgCQd+2I3Y2zU0GfXxd2NLBV7zyV3Pc1WtDBow
 4N+Mp8IRfZLa2/6JtemMl/WYKhrNENnhS/JtOz2bhBXsWgGMsng5J/q2PF7/fxU33mRYGqpbJ23
 wnJ6FgCh3FX/nTvBUVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX0D81oxMt1s2R
 +5xzec/3oDpKbSGdQLCCoZrX6vBdJJys4BtUGf+MliV9hYj6YF0/JDfrLqxrzYBYxWNnJ36MWJG
 MvoftuyeddLnv1y7dxxdC3rxKLYuVOE=
X-Proofpoint-ORIG-GUID: yjHkcnWE3BhdiAXl_0lm1HZsG_HabvaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030063

GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
preventing Linux from accessing SPI5. Removing them from the reserved
list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
for dTPM usecase.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

