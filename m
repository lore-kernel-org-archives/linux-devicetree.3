Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315487;
	b=TfV3C44vMS38wtDhJftj+2lzYdh/gnguII5/h7IOnUbmx7DV6bG1KlpF3E1hs0PoY6aT
	 pzh/Bg3qycbFrtU0xE1FXywJWEQc8p5dGoaLZej+mCdBo0VrAqT6OkvvO2Xuh5rO8QgS/
	 zBSR7QrfN0rHMFAYoldqHsUf0PFT42GC41vE1EVeMSi4bCX9a9Dte1Kqj80OMw9CYjT2g
	 tvFmp5OjzEvensOrvmbDmlnSkUbwdLDGxDfCsgKed03vqp87IYrkis9aGzz6aRFOIQ2+5
	 w+A7mJGZD+Z9G2LP4O6RjKbPdFbZGz83Qnm06gQE2IxhznczBAFvBuFL7To8n79P/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AzcliHKDzNbrtR2+aqjMuMfRJkAoAlftzpPdnW0OI7c=;
	b=UKaTDBm2bAM9Uxl11uKb89B8CK9sLgQaNoEXP36upQkWf0RmybEcrA0uYsFG2qlEfHyF
	 j2jtYWtcsWWd705NTozsARnZDHyjpctjPkXLGB6moATeomk/VV5lRZMrEbU/ET7Y/OcQv
	 ou9hCDqqrX46T1wQZ5SmxPNZah1N4EtywUNm5HdtYrIEZYBtboxqnLSAqjlc4ic/TYlUs
	 yLqrzwQ/lNObI0q1IogsQKQU5g1ubGq1rg4S+wy4gTd0sK7tVA558gnVwunb1cldEoohf
	 EbnDuAuP+DIpJHYNGPPCLg8SosxXYHPqQ/ttaaf4z+Ia1q2iFftUCEtROlr9wriseWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CcB1LBv5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fqdaV+WP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4236C606FE21
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4236C606FE21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CcB1LBv5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fqdaV+WP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAOKr1599667
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AzcliHKDzNbrtR2+aqjMuMfRJkAoAlftzpPdnW0OI7c=; b=CcB1LBv5G+l5MAfw
	q+TpecImJGu5GNasjDxdz+XIDZav+B86I2g6vRX3wRRh3qk75s93OuLrm5LD1wHp
	PAn3f/qwEyfuUG5pOxJ2KQoE834L8MlmNEJSCFGA69/ugPgRPsd+d2IEZBBo+uM9
	kv0a7TLH8i0CJh/eiaGaZ4CpzFVaOAgACnYlJRLQzxBWZ2XkaEMd0BII7g1EuGYr
	6O44E/MdiKdMqkWHf8G+kXNjuZ23cBhxCnFYBkQneQxIKILY8G1vJpW3eo2yYo99
	irWWdrmrVGzZCjB6iehyzzToyZE6PzDuLB4LFaJYI/KHft8xK/HylXvYVJx7HWKJ
	DaY68A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4a50e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:58:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2ecff433dso1320204137.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315485; x=1794920285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzcliHKDzNbrtR2+aqjMuMfRJkAoAlftzpPdnW0OI7c=;
        b=fqdaV+WPeQswjdJTYTBmsqsKfkXZdY0x49WUucQ/xaZnKFEielDEVkVtlhbcCirJE8
         gqbdaGCQ7csacxNGUVJD/B10WeprAqmUEasxJN8sU/gi+TaI1dl3ANBfizI50/YRW5D+
         +rawMeZIRGu2J4CImkMqKIQjhimKxSuGeVcFIdlO1yMk6IRrmemGp+1fETKgVcnqA/FG
         38n4nzq6o3bKmQ/nXGlSZmre78s25izJilg0HQGldUG21A6N8YhkIOH59sTZ8QmFxj4C
         YMJLqv9zTPXtha1RGeGrBarYj0O33IDX26K6nkhfkSlaoA4XNjmxMgoXM7jkBHgK1ReV
         twug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315485; x=1794920285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzcliHKDzNbrtR2+aqjMuMfRJkAoAlftzpPdnW0OI7c=;
        b=TZkXIxh/aJPNey60yyRdm8I8MSB24iTMtn3EP38akHqIHuur4He16tXw4ezExZj5wR
         tw7PONP8xqlVcsL70FMjmntM7iIYTzvYJuZtYjyuWl3RRLe25dJe2YtIdu6sFU8ogIHK
         R6X7E391Hem3MdvmczeinUWdE9h5vzqyX7jvyL3Yga6ebh1eUek2U1hgfkIuBna5ca/Q
         tL/l30gXwz8vwQoH1xcgns9MWFDz/Ai+twdPLkge6PDuvRcdK0nZPNvaM9ZGmp5oYREC
         gN22+E/tD+7+1skzUA6rpLqt3K2AzUEM7I18XTerfAJ+icUk4g+xMKrGlTjeaDaN3UTH
         B3dA==
X-Forwarded-Encrypted: i=1; AL+hErFykfFsujXjjwEGeIF1jLmQoN+YsysmTRdUIELH95we1NpG2mQ5PdO9zA3rXHx1qswvR42vfC8zX0MF@vger.kernel.org
X-Gm-Message-State: APuU4Z+ks3V01YrusIwZGhL6RyEUkIyioE8sXEH+gUDevKffQi/9RQln
	zr/pXwQNjpKCDPRqdZ8J3GTJlzn0i6UFI6Lhk7RgbUqo7nex8vBPH92gscxoiuPjeMzd5W2VpNa
	GlFXV7CJPyePlsCotAznQd+FeeIYypu71MZrqQtdMtJ98m2YLxsXsI1B9tTSgsbLx
X-Gm-Gg: AYBFou02rZ7WI9HIMFplZecGLaoIjhj+8na5nKvlTLjTnunxnnyiRWcnzVBql+TD7+5
	+qzpyN3kbNwPDYpPubtse9oM62jj1vvwBxpS93XJ4NNeKNBRUiJ/NIU0fz7e2xPa0VUnjeMDWxc
	SG2bVK0+IpV/YZ6uFJfy7W7PJ9byKB1mmx0/Dn482TxZXJgZlP84ScjDCXPuoJClNyGyfFc6wRp
	HtdOiEx2WNn918PPa6YDMlb3VWhzgAm5cH+/YDbu8d56x8ALbCMx3y/dulnTOCHY39aEHExjgwN
	GE3EVAmWwo8gXdxvUXJc0oTdjdolZSvJhPEShF37GAQl8ncEiPT64mty10cmnRyZ2PjbjEwgAK4
	gBLsu/Njs9/5c1S3wCXpj1/Dar07k/G5s15odA28UOIrz7ifiFy1j4WVob8PhMC23MxQeQg==
X-Received: by 2002:a05:6102:915:b0:7a1:f951:664f with SMTP id ada2fe7eead31-7d301bdfa5bmr834050137.22.1794315485350;
        Tue, 10 Nov 2026 04:58:05 -0800 (PST)
X-Received: by 2002:a05:6102:915:b0:7a1:f951:664f with SMTP id ada2fe7eead31-7d301bdfa5bmr834019137.22.1794315484935;
        Tue, 10 Nov 2026 04:58:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm58422365e9.1.2026.11.10.04.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:58:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:57:43 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-display-msm-of-graph-v1-2-0f3106f817b4@oss.qualcomm.com>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
In-Reply-To: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D5av+PWWr7DMo5sE203U9vXSqukOBl+F00tdjikV/h0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xTRpwMuCjyThiy1odPrxCMys0R3dS2sE/gBP
 ZFDr8w3BoiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMU0QAKCRDBN2bmhouD
 1yJNEACVtaSDPqMhEv7yentDe58yPeWz/IcrptxIAhq3laWsRyCw+ahmya62LZ1nWpWKhpRknBM
 nOivFYCL9bCHBbflYIaFwwhQHWXtKL8536UG9nKzI//DhKqnHeDJ0CwAwD60b4b+agORXyQd+9D
 Q4MizsuPdWUjGrefM0vZ17mvtZvEeGniNn3aiDl80laPvRjXxKiqIWENGZrtP5LOcQ3o3TUnazm
 M6OIaIktNqBZkS6j4ySIH9K8P3+lZeqHaFiYgaC6wd90rWCBwWvHhe2o16qua+yJ8h55yOPnAay
 xL4wm9VImMerYCGLjLi8Zw2ZrB/bRmhXLWQkpnQRaBj5pcgU7yNRz/PXtHnPtrU/1NOURmnkU1j
 tIY26ctL51qIoq6fg5rtKmXMhnvTcPNi2VbUVVjTiC/MwEfQI+A+KgwwpcM9+yRCHfW5MDCyRV8
 6ibOGVB5JNvBFYoG6xFzhEhCa6vbGY7D0DtA4hhUw7emiRzcReWNYH32jLjsSkOdoXH0tUueox9
 n5vvjpJgYhKNnMFAJDQHFO1nBRtyf/FUgKVX12hb314gTMlQzkf39zOye5w+23h4Z9JlZKga/df
 vxsuOTQYoF3F4F2EZCBHCfViblGvzZx78t/f4dGlRggZZx+1X9dSK6vqHT6KwTyksQrxvevrzeY
 nkg/HNv2RAfMKOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX4kyNMqGD5NUY
 u48VMpXwiP8mAjRRElfg9EmyyXJUgCTyVTwlevuHykaiGe11zW6YAC0hK/EGTaEHn3dwFnankz5
 ol+5ch/xoLxfYQZypFtA0o32v2UM4xA=
X-Proofpoint-ORIG-GUID: nn4JXnrOGu5zMYvjaJsHHknsXL3QzErr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX0qlJU7NspDOw
 vrWMgkPowMbqPeuerDLZ1mPa3pNpq6uxXjzyRjgNJ2R304BVe3rSmSXz8UByNrb4Vc5dMDBrnU4
 4iwoCtoGfedDPwRF5fGjgztFlfPdY8O0EJAL51jD9SPBHUH9Q/yGVoA9/pEroY5I/haan9/1jZ8
 LHTz61IARl4I8xglviS2V7fim1IjArskp92Vezp7i32Vw7cCrEY3LQC+xulGqd0PuXrgD0DBSrO
 1pQhH5N9KAqU8GPO9KUP2U5t2uXJG9JnhBZag67autn2Af/rvPhiUDcPoNg3EfSQXRJnsDtI5Bg
 tzCRSK4MaeqZjrx1nBMhmNsGrQ1Kd3zyBdbkzWp4PD2ZnQXZqLLsUAqmPFyPxQxbomKsdMyU2RP
 n7SGQzAHfGSP3eZpujA9kjg82Hult/Oa7PxV7f5+dE5cA+YYH5/sV3J9KuYB5975Rqud3OwdRld
 MYyyKbFEZzJOoliJNaQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af314de cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Jz4vbV5A2nIxJx3xYRsA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: nn4JXnrOGu5zMYvjaJsHHknsXL3QzErr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100051

MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 7a3f8afae22d..9c2cef11e7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -189,7 +189,6 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
 };
 
 &mdss_dsi0_out {
@@ -198,7 +197,6 @@ &mdss_dsi0_out {
 
 &mdss_dsi0_phy {
 	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
 };
 
 &mmcc {

-- 
2.53.0

