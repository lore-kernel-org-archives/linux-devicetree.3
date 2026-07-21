Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D733845A7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609870; cv=none; b=S0i7YCpmU0Dhz9HyvMCCHzrVVB36TJqeUyeJL1jzGxYQdXfyaDXdnWnRTx3F3JZKha4WNMJuCXBrMqFbeu6k/ruEnksEiURPoN+eUYv1y/+IMkeexfMEkSWDdD5cskt6XGEQ4g+y+yrA/6mtwVLo/CJ4F95dqqwJEAfL75hazLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609870; c=relaxed/simple;
	bh=C3ADu0wERV4RyfKiljauI4Ygtu901IBxPi0iNXD/Hpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XorlCJ9SRy5NW8JCXtuYu4dCjzjjc6DOz33Dygv6YoJLNgs4hPlTB8Hw5KEQ3bvtmoZteJcl53ax53P7RZn9cdK1zUmhRx961kkUhr/RSkSOofVNCgEU/Vjvbx1lTA0JNRuATPFGQhBJNtuPzjJOQ03IhqgnvuA2ZoZWEGkSZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lw4+WpGn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sd2xDfkc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lw4+WpGn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sd2xDfkc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2nLjC043532
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izwOatTBTJ5+VqrNLsS/ZmxXZYE4vUIwX+47bjoUJ9Q=; b=Lw4+WpGn3ejvF8+s
	cE9zwCPoSdfYkO76gi2ZYYrFbaBV/+bb8xJkE/b3b4V+w408ftYS4TlLbuEgzXrZ
	wz8WuluyG2fCFkBahI4Jcc6ens3SNWACH4F50Jrd9fJ3NU3ElOaViMvZPq3MgVIy
	MrknEqbb+QupRJK13kZdRKBNWFhHfhj8zYdqsjVDudPgYvO922E+tqEs/DVxShkS
	XLjg7GgliiMHGuBAUEjW3LxKHeuyot8xvaQALViPSoi2YkHtvve+s4AklDBWMnwn
	xFwa/BuFmTLJ6DzgpMzVbMkssSUIIw1Uxm+BiB/zO7RYan9aFFHi0iZDKtoy05bk
	uHI5MA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as0eb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1794942a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609868; x=1785214668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izwOatTBTJ5+VqrNLsS/ZmxXZYE4vUIwX+47bjoUJ9Q=;
        b=Sd2xDfkceUM4jaqKMkHKb0s4WkU3UE6QzU/BbRJ71Q9DuXDFzlWfdlmWh4Y73LT6fB
         e3RuglVDF6dm6KM1GMUTMH64b+xoSn0i7NZMa7X4cWVfofEZH6D3ABWBaC5iZ8PCqXrH
         nm3q+jKWHqkjBkNR9e9ECKnKQyhzHcuXfC7ErIi0OscZzlMTs4gQYr+C9xDvrqK8SZ3K
         gbscvc8zpDU9ZmfMwrntcZbihoZjETOq4qVAi12CMEfUmIFka+WYO28wnkDBuesIgQER
         eCAGRA4MQikA0+G6e/sbmhKls+bJON9slvukcDhCDSDHWAEl6NaJ0u3IbEufP2QvsWbO
         AyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609868; x=1785214668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izwOatTBTJ5+VqrNLsS/ZmxXZYE4vUIwX+47bjoUJ9Q=;
        b=BB8h2aOhD1xX/rz83QIuXNbIPqLCaA8zTEQxRj4x11/MraLlYdHIyRA3nXWXxiPDA+
         Kj3FMeLeV7+WSUQZMswAKjhtTCfLncH0uCVHJJh5J+gYyOw1LrEajvOQ1eE0BNzM7Qlc
         PARLmeNeACUHHsJ/f+1tKlprU0FCz/IoYbPYUewTxU0MGFkxj8bC8zVFPHRvSVrKoJFl
         vedi+0OVBe1QYApVfyaxHKRoJSt6PPVrKCFLIcudRw1PqJLfNAUVDHM0T7AyOeLqukJ6
         KBm99EF8nlkep7iinK/U/RVam8oHuduSLBY26xpIBv/mbxfMz3yU29PfvgiHgjyTu/GY
         5cDg==
X-Forwarded-Encrypted: i=1; AHgh+RpaM15ZWLX6JIeSBj7T9c0TdkKWS+W9WjahtfKWtYrZoqkTCLZPtaBUafqfvK3fIt3CgZT8k73/rKKG@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQFbVazAtXVerV6Ry0oP9mri54ADZMsAao8RZFO6IwpZKGWW3
	SQ7RxOpfoFeFjRCHxPec6psqLD+/70vxs9RlDmPGOP5P5Y8k0dhzK4cmX6ITIgnFq5Aue5w6jSI
	CUw0jvRsYiC50lEORVp/gq0d1ESZwcStSayCvIi4XmGumoaQG8Y56j94JWoPzwBX1
X-Gm-Gg: AfdE7cmFXNNh0yLAncrakxu6Q/f6WLCQdQeMehw4XeN0zSCWCacRyuuFvNnlDB37s3i
	ToBAOes7V9/j47vK/QGMY8VLcBoohL3U+jVA19MHaO8dWIcesXQ/x0KSodaaY/JvusEZ7nQcce4
	qQ1IIcvW3mDyZVzzvHPdfLi4vjd4FW7Z90e70uVdJQDe05mvad9B8FI9Bsik8inN1YOGbsygceB
	U59aBU3nSMsmxGn6f/s8zqhBxjei8EdqN9AWCJxPQIQdxABfC5AqajyYkra5jV13eZsZj1R4sP8
	q25hGsYHyG6AlA3hExRDV8DfFmwgDNCk80YM4TuOoo/Jx3kAqkZYUL0qUVP3nnZZX6CEsxKrQBs
	blvJYEUBgwY/pBUtl3JHzKJTPEcjIwPVfjvW+kkClEpA5+2TPjKuD1XQ=
X-Received: by 2002:a05:6a20:244c:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c3ad80d53amr17094008637.24.1784609867889;
        Mon, 20 Jul 2026 21:57:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:244c:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c3ad80d53amr17093987637.24.1784609867434;
        Mon, 20 Jul 2026 21:57:47 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm42110862eec.24.2026.07.20.21.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:57:46 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:57:36 -0700
Subject: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-knp-camera-v2-3-a21c3f0ecd55@oss.qualcomm.com>
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
In-Reply-To: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX7TVmxV4SlNLN
 W1NAO/zzdot1Ofrl2Gitl2epoNwg75poNd4+exI4l7BnmvdUx5BkPhOc2Qm5SCvSP6L+pJrg4YQ
 FXjZXkDooeiuoCKCE2xnjfKMm4v8Cx6r/09X95lfOavJuNG+Jmm9d48hQKdiLH5/vHViIqLbtiV
 iJrNCesYFHVTwDOiiERA4pfoMo2k7lklvy7m9KvsQhzMluni2xgc8gFhyL+HKiz3o72yIQs/1+8
 v/Ly/Rk1doTWHs9kth2/jR+pAt/oIU0f5+jmp14dKQb34Mt+KayOd6nEW+QWq6U1YBpjHMLDCH9
 XGJrNVXk2aNjvXaTSTzqf/KcijSskjMJraOjm/OOnAI+e8edDmry1F3QSyx2FQTYX3bNBA1UK0E
 qEA7sGlQud5jSq1FnZ8QWSPVyVL8+xYYNyPtgbC2rPCdly1t8WYU8SHPfNedzhxhLMi5pVl2tQK
 vuq1GtgnJLZX+aoH5SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX+3zsE9hMix9c
 oaZ5Q+6gI5jkiQkCxjPtIBxqLu23xYVJdOELdVzKCgvqtyG9FLFk2bPQIAmI9ek0wHve94kPPCx
 GBaPwjkdOD3GhdzlVYOE4oal829NXM4=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5efc4c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jGaRj7jOP5rQeejdA36xZPgbGhFcN1dX
X-Proofpoint-ORIG-GUID: jGaRj7jOP5rQeejdA36xZPgbGhFcN1dX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210048

Define pinctrl definitions to enable camera master clocks on Kaanapali.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 6cc7b32386c4..669a74bd9d24 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4348,6 +4348,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio109";

-- 
2.34.1

