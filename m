Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36F3E44E6
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544695; cv=none; b=g1a5Hrurp2T+pIbuH5+tmA52/7U4MI2LYGkDtn38BgPCDeChvTbWeXwuVze4smkuUj8L/BXuOiBQD/F4dcretrNxrPwPO2xnwPqyEcif65Vlg4PH40UmWXZnPQpnWx8FvyCWeAMdUCBrT+ZQrF1wDD30Hs3WaUS7FFvf8WL6gAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544695; c=relaxed/simple;
	bh=T4K516ZU2BbXYLkaeNtDalyURbfi0jD5ZPRSpldiMYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ps1oas5Y/NT9SF6BO/ietBXWNA/h1o1q3bCGSTe6olKS3tdY9E12WeHwv9U9UC5MKd67hxVcPw7mo8HQCX5apuh1SWm03LT9ppVRa0APpHWjAOxw7r45S11epcKVe7wDwsKwAnTHysQaho2VBX51vJ9xGcUl3VIr+LXEidaui3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvR617UC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AutF8uUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvR617UC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AutF8uUZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vbEB2238493
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	umdfl87xzpwmY/Tf6wpDlpAb1X9+CARwlvGQHoZRHqY=; b=MvR617UCdnxcFWDf
	Cj40LmPrutPtkj1WoCXd8d7eLj+Kx8otuaigPPCCAhaod2NbZxe8mHq2P0xsmlPg
	pQJNkpMDmgt18TGnfnnaljB80soQx6mZXOcskze7zC3or686nZLV/5zqcTwD8gXU
	5FxXMpCUiwSJ15wVP1twDhFe2MQX8z4bqeOj9tYxljYB8jO8GGN2VY+C0FijpFaA
	yt2/mHf/opx6CQPyv4Q32luL9x79Rm/lelv2XbuN/RGU9JXrcnVuENAUwOWNxvuZ
	pQh4QvcnWV9cgrJhBpr1pSQAMQqo0OeHmGr2iMQKp/Bw7CHMlDJBfvNnGyooc7vW
	rekW/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre8dgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848d21bbb55so5409421b3a.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544676; x=1785149476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umdfl87xzpwmY/Tf6wpDlpAb1X9+CARwlvGQHoZRHqY=;
        b=AutF8uUZGiKjnMimwRWRRxG0h1+ZtnlZ3k3NkbgblD9W5xLbd9FMjuimqsBd7qO0yy
         gZGOr8IeOoSWTBA6gTRCgJObifHWgwX/60KkbiTMRHxpXwAENndfczNbhNc7X2GPtsEs
         SvEt/RkcKhXtitqUdJ9VVKrYAN2t8IawyFtCR3Kbwti2G3aRdT8PGAWrZdGzVDrtjZxz
         ZHWoveftMAiPPUHC9FMOMRjnRsKvfjbfbTEKbZAeWzH0VdCYZm6TQRCGYQ2LpEiGY1yn
         OXxo7fdP4BVxm5tm5+7KDCK/qyVe13bAcSyGsCUtFUhNRSZhe5H1/0Au0qsqWek5I10l
         hfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544676; x=1785149476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umdfl87xzpwmY/Tf6wpDlpAb1X9+CARwlvGQHoZRHqY=;
        b=EaM5m4liFLgMtmm3zTyxUToOXBg1ZF5w9l2yM3jWZnUNrCqUC4oKWLNgZVx8OXw/tR
         CjeycOJYarl6Klp0ut2TooIG8KfBg0mGlAOQesTuTjL0zYSMSGIs4AKnnB4lj5A53euS
         PLDT8ODtLUMlvwnB/jBCC4yBCPtSfQheofJQPwjvo3kI4qzVnCyNLgGcdrD0df/y9U6X
         gD9d6YlmBlnq3auXqO64H0ugkI21TMMeqo6AQOvvhFlpPdFxnBPC+rl4vAeH4lbNSWvt
         tWhY55H7/eoT6LIj1WmULUUcY0/Zh/9ByhCN8Xjv67wKfawJCddTaoZ2CZ4wD03Cak0J
         AKVA==
X-Forwarded-Encrypted: i=1; AHgh+RqD7YLz4x0e2TE8N/hwpzl+MSM8lWUXODIFuHMEJhj0CzNqs60nETSbjdib9fby3t/l/pxUajGrndoG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ZKVi2pw54/aDZDn3nQR8HJPy96OxZIgxmv4QCWYaA92s6WxQ
	d5oH6J+u08qfXXBwZ4O4cZDaI1Adsb7xssy5ip6twBKt0sa2D/KFYFQrmVoUAIU9JEA4m6EN4uB
	HEx6b785EzlcCPiL6fN0taHASdUnpOeqf5E+aTo1qwrLoL7XEY+kpFWf5oA87Xzj5
X-Gm-Gg: AfdE7clmgatFRU6YtJoD4Q8MAGSQHoriYn++oNG3mlZ5ZIcSoiTvopHr77aaLQ68QgV
	4bU6dSgjr9kts2/Pncgv60vhUXhCBSbv1aSLGwwoBIqOHhIP11EvOhoD2ABuunLi7OpfIoc0lAi
	SIlyE6ldFOLD4pX5LEk3/11mnvFC1Xg7VB6+oByHMuymMmvDp/LZOJ250o4maqbsXPPkpCeLZnk
	+mRyJ09xGpv/AeMLgTP7mEKl8N7VXrZrw11FchYTxs+Y0Zr5EWH9iL+Zq4Lv6YMi9lNRc56W2vY
	64NT4YNPLSxgHSFGiXwKHIFmbdtt63QjtgrW4p1WsELxudjEDMPnhMjOMYh9dhAUOfHPp9bOdsA
	x1c3CFaoqbN4J/LM=
X-Received: by 2002:a05:6a20:6a0a:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c3ad9e597fmr16343065637.66.1784544676126;
        Mon, 20 Jul 2026 03:51:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0a:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c3ad9e597fmr16343026637.66.1784544675697;
        Mon, 20 Jul 2026 03:51:15 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:51:15 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:26 +0530
Subject: [PATCH v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=1696;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=T4K516ZU2BbXYLkaeNtDalyURbfi0jD5ZPRSpldiMYc=;
 b=qsGKU+/59rSfQDVYTC8vMrA8F6oeuxnIYG1D9ZNYAQ/NnYb2z/kQwxUr45sqypbGIR/266aqX
 XdHK0xCmDfzCt2kvqfwhs/KAjyE9DJ1dLz73106ZnPq03ujp7L3yPx4
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX8UmlhH08eNq1
 Ah1qrhXonaHF3AuoXyI9OHxJWeAgPrhsFSNyPqpadgQ1Dxe/gcogfwiFRz7DruMlKbePf2sC4wB
 uvoQS2qKDAAivAojWkLTm7AGRSCMjlY=
X-Proofpoint-GUID: kJ86XkVVQDTYe9mydtnHwih_AC9orZBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX2kjdF50eIrTZ
 BQ37pDlA5ETN6eGHdo60E87de82htTusXGprH2R6MXpDCDpxc2UxXSnCiAvx6Z1bMVgFqD2gfbF
 qYmig8NuMOZh8i+cC3s+5eTu5DXs3bnw5g6YIV127jwWPKxSIJwpyR+hgKDup40IlAqAyKzC9Cn
 yDCr5sWdaRyOBO5SR75qlX+fTmVHLVeXiGc/IUbqtWE1S6TeHmhKq1zc7X9WSGcs1EKh97PCYc9
 JIhl6rmRuw8aXBY6VJc+2mAVgnC74BpL1d+kyhzcAsGn/RUieTaFUrPBzvUNuFucgrLmJ028Nxc
 TVB8+hePMNO5IWs6kEhNtRw4VwPdwzCuxBl4g/4hQtjzJIs5ldgbL0XH+J7fF4FFnv9tD0VQaKq
 Nrs6Bpwn7uIyyuzhn6zDOJSJ516oSz8lBy/PJfpc/J6fcgnIa5gyHdjLsM4GJeNzhn8/r0LP5A1
 FlAm+q03qrvKuXwg+3g==
X-Proofpoint-ORIG-GUID: kJ86XkVVQDTYe9mydtnHwih_AC9orZBd
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5dfda5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kzPlCIsnF9mgv2CmAuUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

Add gpio-reserved-ranges property to the TLMM node for both Shikra
SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
from the non-secure world and dedicated to fixed functions.

Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 2fff5fe9f6d2..8ac42ff625a0 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -196,6 +196,12 @@ pm4125_l22: l22 {
 };
 
 &tlmm {
+	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
+			       <14 4>, /* eSE SPI */
+			       <30 2>, /* NFC SPI */
+			       <138 1>, /* NFC Secure IO */
+			       <155 11>; /* eMMC Boot */
+
 	sw_ctrl_default: sw-ctrl-default-state {
 		pins = "gpio88";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 657a14ca9606..4ff97945274d 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -218,6 +218,12 @@ pm8150_l18: l18 {
 };
 
 &tlmm {
+	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
+			       <14 4>, /* eSE SPI */
+			       <30 2>, /* NFC SPI */
+			       <138 1>, /* NFC Secure IO */
+			       <155 11>; /* eMMC Boot */
+
 	sw_ctrl_default: sw-ctrl-default-state {
 		pins = "gpio88";
 		function = "gpio";

-- 
2.34.1

