Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F1240DB2F
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756471; cv=none; b=fVFL786SRqbrYdZfTxj34/3VBeU9M8hVhFgNmCABryjFZF+3mUYV0I7mJJEaE2tNVnd0mmxX1plzENxvzmOC+OiyvNS8ULJ7fHZZpAehmIEoTgra2mWt1IxAdfFTL/fucZ715JEQITNll2jAFry98SA1qBTvRLKN+m2poMZF81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756471; c=relaxed/simple;
	bh=0dv1A7SJOo2bKiDuoNzEWcgZZ+KiBt3T3wDwWvNFD88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLqDDaqPke7MZExtFwkpuOY4mCGNui6LnpnAHiuPNftrONHSqpQ1L9Mm0E4kjSNnKX6FRKnT8hTNlmAkeg1vM/D59JX21Er+LmXuWuPHVSmqONGS8kzZaiGNwAbP/iR5FNcIC728zwDPxNFouBZYZRmBspA4QQvV8rd26e08Zz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYj+XBI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmP/LQ85; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYj+XBI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmP/LQ85"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AdCWL3882607
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 11:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3o1mXZjzla+jeybDNPZNT0ZGQaCc2d0LM1HbsUBkMQ=; b=MYj+XBI9ndvt2gJg
	Kh/De3jdsQi0yDbEtqmr3/aeyTkjJ313ktVn1KAd2A98jdiJ/EPiT1mRsm0RDY37
	p4Bmi52yI9aEOaJt1lhpMbaDWceUreieN45BGi5a+ipphSsSiryQ/hyoRqHAmaZC
	b61ccaoHyNoh7/axWu8OCQcre9i+MgCh0vxYegNE/N53ib7SaYjHq4vx/VlucE+I
	e2cxc5YXSWYknREjByunWhCzrZSM52qve6dr922z7fIPVB5x2B75KgJwol2i/vkU
	lbOFUBPVh96NHS8b2Bo8Gxm7HzfVJ0sySZeuvqnX7zftmcEY94c2mAPHJ4ci8/HF
	O4drIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkha6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:27:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so8231558a91.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756468; x=1786361268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3o1mXZjzla+jeybDNPZNT0ZGQaCc2d0LM1HbsUBkMQ=;
        b=FmP/LQ85VHSTmea1YIIiF2H9UtH1+V+b8iUDEcYGxMcrjv+YfIYmm8gTQvSEC4ezB8
         KAmJxKLa5DZVPYlcbVlUcVFJ/xQytm2akyrxbtRuHmKdmODKMY4rcAT4j5Tv/4dqT1iU
         KN6a4TzmFCrEcAcFmBTTBy51Anuz0sVbQfXsUN0pjSOwdioO1AMMJBRhenTTOLBUwbR2
         gVtxIbtoFfUD6XYtkQRc2KLeMu45uSdN3B7QII6mpUexfTi7zpt48lo9TWyPRqQ17ime
         CX4U+cXCgTt+kLKzTga6u3y8yBjBcW3aNGmu0KXqjt5tFSI//D28oEMUJL+3b1sZpnxw
         DwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756468; x=1786361268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3o1mXZjzla+jeybDNPZNT0ZGQaCc2d0LM1HbsUBkMQ=;
        b=AeJWPq/ULXEIh0c4z/0yyES1YZYeTkNOpKW78VSNwfu81/36+TjA9NxE4ROH+O77U0
         qjkU71CAwDWH/CjNwqkW45x+PHTlOLwgRabmykSGbDf+O9x6DpQF/JVok8lnxX9e8dd7
         cbVxMC6rJC/rTKvXkE6fr5vMKoi4O5M5y1xUBzNgSfq6nycyz8vsHiATzNfr926+k2IG
         sr1C7abzZLs5avPmZAtqn7BqzD1p9D0KiYmXY/3RVdKquE1p1MWAHT2UE/HXm2I5XkEG
         wgf19PVhzJj4IttSX+pSoF5IfYb5wsmHTTBE2ZqYWE3W9D3bplSwABWjEx0gX/qnLSqG
         2ZGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjO0YvU9B21UUqILLzlT9kTf1nRFjRI/RtOMtQEKND69tKfnVI77BEyLosmC2SnBiymJvObhmZfj98@vger.kernel.org
X-Gm-Message-State: AOJu0YxhOYUGJ/zLSwYHhq3FfBvzHC300Vjs+fns2fXLBbncJmG3nJT9
	Yc+0L0ZaA2/6nYsM8y3OGnB67kPTJRnkqc0QWXvUaklCaoElEwdOFGvNA3BzzTm5xfXLPaDmymz
	LqIQKzkBhHjjvPdL/JfWxtk2zxSuKrE/vc6pHlmS2XxqLTywkhkyVueod8ZCP58L0
X-Gm-Gg: AR+sD11SSvjBr4jNvdWEuoJEpDDyKEyPp+Bx3AfkksQ4dw/nuwN2iqEHoFqNk8YnXWk
	7fTUxJuO3/CImj6zLPUPyytP+50mZi7YnQms3ay9Zp8ogB2fUg9uV6xpFELnKydWopGrMcn0+N3
	UiuxRrWNO1KLTJ31apq2Q5xNp2pi37lVZTVJ+fIBTgxhF+2/RONhWQ6QGxAN/lX7AppfTlRT1Bc
	c0uQsrgmD9ZHSQr3E3fjXM2JQhQrFm1Yr4YgdxfJEwohdLpdYHWWKz9Qk0PUvWxNVrMuGcFuyND
	P7Ej7SgSdEoFhtk9UDs7oIInzpYi2UVwNrkQGOG6e94yyEV3XR9WOaw9xKvwsAiuuKbLrw3N4J0
	SzaVjU0TXuByaFlY=
X-Received: by 2002:a17:90b:590c:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38fbc59b1aamr9104247a91.42.1785756468027;
        Mon, 03 Aug 2026 04:27:48 -0700 (PDT)
X-Received: by 2002:a17:90b:590c:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38fbc59b1aamr9104217a91.42.1785756467583;
        Mon, 03 Aug 2026 04:27:47 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:27:47 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:56:39 +0530
Subject: [PATCH RESEND v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-shikra-dt-m1-v7-10-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
In-Reply-To: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
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
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=1886;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0dv1A7SJOo2bKiDuoNzEWcgZZ+KiBt3T3wDwWvNFD88=;
 b=WpBlGJWorHogze412PHSk78w/XBSwlfOmdkhz1YWwB6FvVItJ9dYxbfWWFtj7kbZZBSfDK8Y9
 xVDqXTI/YxIDkc4DolysftMpHcs/yUuDjNQUVPQNdwbmtJ5QTqjGJml
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: YA6545ZZTAGku2unZ5UqBZYWbfMabcBZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfXzNNRGjZQRS4Q
 1SSLs82O5Wn4M2dFnm1bJX2s1NX3k56zdD2usjNlAMdRNTL2otczOA04O8110beSxPq9h08n4jZ
 FSQXG5SGXYlgwTS7wlQAnFyYFhq65UjYRY4QUQiRe5wER+AWrDSsahEZfQrxZgJCm5g72PPELyO
 zU0AKtRywB3yz5zL1UhKW8VV/eSml3XzGqvVbTcVwSUWWB6xxhXngeoDNDdrejkX9mAAEgIIDaF
 VhZM/OfCmGdbTdZUu9dKIWsaAEqUb+Mjy92aq3xMdqr+oL4m0pfl2aQ+lPsxq1k4Ze18xVH7f/O
 FSKvBlYWtME5RBg+UbqRh7QY3jmkgLiqCGDK+cI+sOEyUWbL5F9Lkh/8syBr/QDzA4t7wXFofJo
 ukX7s+8vKdAHfZOPAv6Wzk3tI8j3vSL/Y3bs4arPnMJALqJtjLf2T4LDLwTOpAkTYfbpcQezI6R
 10Gm/XD4YsHYf8BqS8w==
X-Proofpoint-ORIG-GUID: YA6545ZZTAGku2unZ5UqBZYWbfMabcBZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX9fZANIqrXtQI
 3sHDWUQmPV4yCXjKjhp85htN2GqaOg3EgWgMuJ5rEZ15PknSGDEAytKVkmUB04e1er/gQTIH9Yp
 GrW6P7OmlIgU9pqGw/U7PUQsSKghQA8=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a707b35 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kzPlCIsnF9mgv2CmAuUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030102

Add gpio-reserved-ranges property to the TLMM node for both Shikra
SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
from the non-secure world and dedicated to fixed functions.

Co-developed-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

