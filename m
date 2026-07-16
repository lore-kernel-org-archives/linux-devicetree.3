Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C5B383C7D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219385; cv=none; b=tybQiokKMhDUr8EyoBqCIPW2SbtJ+Un3kIB03VaYajHDhU4Fcd9LcDHGqkkYKG30cEwbmc/To7rNE8eYJNAARHyCountl+HhyHZTdhtrWws719NKsAXuhEi8uUCO0pOl1PXwRLmQJRLvNOxaQg27NULDguYEItlpR1O0Qx6WeYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219385; c=relaxed/simple;
	bh=O4ieXzCqLQFPHuFkvy/A9oNVBZ8iHeLxT7KjJawmoMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNBUtrifSMhMz5A114c9MOessmiaDSFsE/8+aS++fAOQeZ6ZztggvR7uH3flINlTt9eyZbJEjDMACsKnOAz7D4YQmFtJUNsB5wFn3aOjorW317nHvPMPuKJsuCizWovfw6+z0Q9xYLFw2DqdgefXs0KmkschWl03y0bx5Avz0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOTCVOJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOcm4EPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOTCVOJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOcm4EPD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSlRa3395603
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=; b=gOTCVOJfp2F3kedK
	llOKKOwexbiu9d9pZWJomZx9m0r99Eu3AQUIZgyveBlEc25r708wohUBiegJWIY5
	lxHdNTiFvvzqxXVEDHbQctnzpmUgwfjtFk8X6W6v34preRGdDF7h1xl3CUwfxvFG
	V4O666E2qYsKvOHyC0oa66IphJG3q8junUqqeDcQtMPXcI33aoCMj1OmNWB0g/jN
	B9PE8QsahbqHNZCkFCaVyes7DkdIEAI9AVc9H5thkg45lQDfD0mbRgabM7PrTykv
	xg5kLCKgQNoG2uF9ZCrXloBywEWiut0y3t3fa+NedHwGmnFzWda3aAqis9qU40RU
	WE+8zw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym191nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so130553215ad.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219377; x=1784824177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=;
        b=FOcm4EPDWmpLJES8soLAivcxOMCUalrW9j1kjE4cJGQs8hxTYEPY5BJ/XptRzBfGuy
         5IhdZ/cBgjPgyKgTYUwFXlZAB/maI6m7x6q3YNUEW39dF2QQerkh7o9Yp7AnQENgrm/R
         +G1Wtn35bjBkRZ5dCGPevDiGnU1Emk6EfMWQimozZ/bUesb3OGd2LADf5R6uMXLmGz50
         r1MXKb5Ai6Q7upAe8I4N+VtTPtZaf2SL/GprlKCtyJnWNNJOPS58KZ4MDtmTFqP7jZiu
         RaLKxmGKL18KJMKi5tSViSDe7c2L5G1zvwxzx69o4ALUceOxwZ541+SLZiwFpSPI0E8D
         q/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219377; x=1784824177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=;
        b=Sr5vkhdHkIIUnEjL9uV0GytdzOgC50gzvXwrT05TiltA30uyGqmqKhCsz8+mM1P1MX
         4ggnaq0Je7ebGb53RJWUgWUeSWf8avfO4mibLlwPqBtslmyf3f0m8Zuf2ZDBuJAwQyQF
         Ajcb2XFqhnawIOhPQG/L9Z001DuhfxMh56ROkbwy8hBxVyJQIPcI9NCbOx86cD9vq/Gy
         ieVaDrXAtyHc6TgcAwY59VeGTkSoUsPPNXF4rnCNJmbyrxcVMx2x/Ljny9ULgFnNpm3q
         efEYWZnSvq+32DKKw8nyF1Fsgi/fbgq0LomB2itXc0hRuNiMvQB3zIgVOQZKfXnlOjnE
         dGNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkfAN4T4cCPJYw3l7IJfqgbo1q7s4xawc1XTMRmg5T+2WfdaWkG6OeEF0+z9H47zrr6MYUKkrD0sS8@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPyyrn6rfTd9StuRc1Vc7KPEeYtXayZpL36yOT7HrHvjdV5B+
	J6V/j0FRpzGZvElT/gMAkN+yEijS1ryfNnXAlYQpIng4puY1uHA6rPsoxmfwEG8ey/dkpxKNlNK
	yk0od8EtGvyo1l30SPsZz8gc/GPj0GJ3DIC8j/OoGIgz8+alL5u9VlgY2AenMPs3o
X-Gm-Gg: AfdE7ckQMsKWSIc2hlROyNXhmrV7ysm3ny8+d4/GBjHVkN+8tgNg3w1pvSh5Wr/ZvAD
	/78g4+bqpBI0FGZiTGvPMG7reQxGs8dplrwcCDEsTfKLkp/5BYsn+n1E6I31sxmRXISq5sQHtu7
	p+9/ASG7ePyi6myx/lIT6FK17SlW7QRKMgjmOvodUXg+sXjGCvvGH6fYDdnuLmj9PE6X3Y+vYKe
	TxDba55nLOoD/JOsPBUWlPXQlecSNFRZtBWld7H3NGaE6lNpawu2bBiSHA832yD56f91DrdB309
	9wiosusX0JHw9cB2CdSNwCs+wQibuAk+BbVqaJbsIqP/xCIC4yt+qq5oSUs3Wakpm7Y95SOl4D1
	lXcy6KCBROn1eEhU+p0hww7uJa5IkpH3UXPM0kaSU4JuyGohgm6DNGxzq32ygtfiofR7umw==
X-Received: by 2002:a05:6a21:4d92:b0:3c3:a1b4:144d with SMTP id adf61e73a8af0-3c3a1b416camr628362637.35.1784219376986;
        Thu, 16 Jul 2026 09:29:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d92:b0:3c3:a1b4:144d with SMTP id adf61e73a8af0-3c3a1b416camr628332637.35.1784219376584;
        Thu, 16 Jul 2026 09:29:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:59:10 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-usb-dt-v3-v3-4-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=1148;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=O4ieXzCqLQFPHuFkvy/A9oNVBZ8iHeLxT7KjJawmoMk=;
 b=RLbuJ9bOjtHnM4PxGoWI7q0CDTX0wAXKaDDuNY8TFkhLO8iQhNKBw6DJo8xsHUwV3N+pcukn6
 e6ebI9pJjZVAhSeaCMQjdNjtxn/gn2364g08byo2lfeLt2bBR/6BbKH
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a5906f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bymAw6jGh9HDV1aGW0AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX3UeHqZJoXBMK
 +OYLxo+wleXUVo4fz8Ui1MuyTLyq/mtrn0auYjWjPsX53O9bFg81PhIhoSWSFkCwNY+jNTwVoFS
 kbX+iCjM+xU53IvMoNx8sjgvVsYU3pZEaNJHZp9u47ORHVGnJXe0W+vph6EotqLT297QGgyJHGv
 BbTXtcT0hucdfEX+3hAm8Cab3Ta3rZpctaVgZhn0ZomuvWYeQKGYQ4royduFuxBgszqlyiB5Tyt
 0yjV6KAKah6vCmL++GWa8YxnyppvZcV1x3Wnd4HlSm3wLFtjos0a5szYntpJgyuV64AlF0Czs8B
 D/DRrITIKU5PJpELo9s3Zqydk/CXleTCWIvO8d/aNolgfk5l2zOueTlHDgPb93r6E5ur+RpPlOz
 LPz/bQXNASxoGgzmrGaYkVQOKpew9mT3cQioj+nFQ6BQAE2gwV8vd5noxaIpYwqpnLOnYRB3sK3
 6D3NEvPV8xgK2ICmryw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX/e9Og7R9qJeW
 aTxIj3lXHpS9Qa5sT8Rz9P2hBRQSOk1lp6bdzv/vK5nRaLPfgxq73oFN8cEfBZV2hXm9SlthD77
 Uzac8x5d7nioN73PVkZuRfzkQdTWymk=
X-Proofpoint-GUID: SECRDWNoNnL9c9KHswq5DeUudNiqHM6t
X-Proofpoint-ORIG-GUID: SECRDWNoNnL9c9KHswq5DeUudNiqHM6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160169

Enable both usb controllers in device mode on Shikra IQS platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..2d4e34ec3b82 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

