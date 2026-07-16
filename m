Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40DC37E5F8
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219377; cv=none; b=N0qe3JWHjY9KRcLr8oDWKbBwHa7ZNGfJjYdlOzMIwm0WzvSs6E9LXMcMP1RMbsfAN6tCfKHjfrPwcPMGtyqi5BwyWvQcCv9Ze4sWhJJyAOEkG7FbVA6Dre4KlLr/lON669UKZgChjHsTZu4NgthbZK8Yy7zbaEKfp9haXjCvp5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219377; c=relaxed/simple;
	bh=v1hHFU9deXzUxaKHNDsda30JBQDNROQAE+8D9yGTboQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HyrBI/PoZa9/a+TyL4eOdFHFwEVeKJhQcbkOQEGf3TpXLmIHwnaVGerDV4H6U+vg0fiROSzp7Gqc9kWndcKgg9NlB7cQfUn9+2zFcz5JqEcwIWITXY25p3BxKf3FWUlio/KZersBMNojaW1Gj/j/1x1MhOh8/9khJAPAQHotgfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpXI9ldY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g32LRO8A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpXI9ldY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g32LRO8A"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSfFU3127443
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KLuVogy/rwqMJUkyzlQNASRE5shACItPIpk07cHb4Q=; b=ZpXI9ldYFnKuIOvS
	ERGsuYW8jTkSZepUhC8XdvqY8lEWCNj52uYvZlC4ShbWhzAQYKIdoNLiHbEjemAv
	JmzkVsrurfM/pFMRPA3fR7iL0vRRQd2DvGpzC0KTOK8zr/0nBftccwIbGW4bbwno
	3rF63b9RH9WOMoLEnksxxbrXKDzzh0R3S4cuPtmdnzMi5uEvCmwd/jW8rxfcCB+C
	tygXqh0jlWPWK7SPPuykcQDcN1KBRMw8MlvnYU8IHDsUPfONYjXN4a108WFeC2vC
	3YamCZfhWvFrfHjzHDXdNCdtozzOrZwZquvkk/X9dt2PKlVAVGza5z5ddNeoMlod
	i2ENtg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7tggh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so8173564a12.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219373; x=1784824173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KLuVogy/rwqMJUkyzlQNASRE5shACItPIpk07cHb4Q=;
        b=g32LRO8AKBpN8QzfR3DbtzRNI0Bs6IR+//K/KD8zZ1BPcR3OqW2ImCPbCLRKr7cnz5
         DrgDdIRzELlpPyHa19n+i/n+wfRBsBL3OVARPb6eWZ/cTliusPIfA9WkR8O87FnIc3Rq
         EXEj1U1XSxf8BjrDc1+YModqeSjxit46kmDKH0VfIkyqWx3VRcyfATndbTHHbCfSEHXZ
         QX2G/PjmmYWP46CIm0yyscVFiQu60epBm3p65IycQGqdkWfVrnaOBPyh4MICkP8BMgt6
         vRpK0qieNEmykUe80MpRBHaZw8LoRpczWSvC4vtJxmyTDGGfXD1mGxNglnlr3wJI7Xer
         SZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219373; x=1784824173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KLuVogy/rwqMJUkyzlQNASRE5shACItPIpk07cHb4Q=;
        b=fI05gy4BhllRM6Q1l6Qd7ANH65kaFwaeOkN3mLoXeIkujqW5NJMPDtIhMXNWdDC6i8
         /U9R2Lz8DBgadzA26tCCh6lDoE6hCr2vY0AmH4SNUWUUCYG/9sYaA0xhzdZfTvZdid0Z
         eL8feGcoaHThWbeEQzVjn18dhDNyNg/zYpav5IVrkpxeSJ8/8LhaKS2z3IzqgmKd/+mH
         8S7Rlxky8N7HiOwaNcSGxP9NzfplGCPxwAfG2coh/Bi3e6hJXFWO6qLbxvc6V7uxXt7W
         GwKjwZ8Oo0BHsGph/M0WOBwiKInV4Tcvo0hcumsxzRgJodMhqFyHN2NyBpLAAio9ZxLB
         lPqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSFEpfsUOfXQ/HLs3B5h6P/QsGDcvUV1L38rGXv1BU6nHVYcJqN5AfHh/vmAXA7HVS5jVLwynhLmKI@vger.kernel.org
X-Gm-Message-State: AOJu0YyutQueFAJzgQtsBpCklEM6OqLmt5n69Wv1iS2bjnjNLi9uzm4W
	uIcfXCwmLE71fvsG31mIZz3rK5c7k9EYUBbQWMp/0kyiApaejzy02tSqUP64S0ugkupx5VjbBIN
	u7dgjWP4wp8EoDtVUGZCQcDwBjrYGggmI6gOuGL+u3lcEUxNsUA2bUiL7VZZIGbuY
X-Gm-Gg: AfdE7cn5zFdMwu4sUvR1FYF7iEBZ65P0dr/5wNlLn0goJ7E9/NsTAWj5YvgBmRsZWnJ
	OQX0crwyv6V1zKazCjDQac6bExOgT5A1TZqiSmuhtfiz+dkIW1OXxRKVXHB/Um6OaoTxV+qIEJ0
	02V8Uah7wa+CPy75ozBpj21Qg4DBtXly0VfVqiakZACmQfn1FaIQdTzP6nynKdzLVUxd3sKK14K
	CMN6fOtRWi+z3gBBYQg3ZokDQPEWZvBjheAN1ojFQ4Q/T11H93pAmeQFN8uOrvJ05bsn9NhHVlN
	AP6bVH14RD39KpeaQwCCXtLtwqscyK/QqkADUy5HihqLn4t0qLRbp11Zq1jelZ17CzgzZ1nU/4p
	L3pFHnoIWy528dTJ3xhjHUOnIZAX2jbGDuBwTJQzcpHzwI/0xZUTjElWnbpsi0LwLfoMWgg==
X-Received: by 2002:a05:6a20:734a:b0:3bf:b9de:8570 with SMTP id adf61e73a8af0-3c110160a19mr23616828637.19.1784219373268;
        Thu, 16 Jul 2026 09:29:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:734a:b0:3bf:b9de:8570 with SMTP id adf61e73a8af0-3c110160a19mr23616799637.19.1784219372777;
        Thu, 16 Jul 2026 09:29:32 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:32 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:59:09 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: Enable Primary USB controller on
 Shikra CQM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-usb-dt-v3-v3-3-13f73a0571bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=887;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=v1hHFU9deXzUxaKHNDsda30JBQDNROQAE+8D9yGTboQ=;
 b=bMb8199eFlD4E6qw++E6wqvEcd8A9pTVPw02AvlVDZbBV9ESYyE8Jlq+FDSl6auSLEjNALN0g
 nAZc0Jy/MwcCo7qY+UYBc0iLeyUV3uMFEEFX/4gPO6LA5N0Ss6CEoPU
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX6q/3+aqjZhw8
 t8ziLnKxdBEG2NHxbmFcIPEnVpBL58UJi+Cj3YEBp5366GO5HVE0M7m9thoZ34W7a6onZ2WoWzt
 eCY+bBj7Vf4co5DwEzDSX7fxOgG1SVI=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a5906ed cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YV6aE2zFX9roIFle7WwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfXy6vd7eXr+NjH
 HHD9mlmrWSv9MNKF2umpo5q1hBabpZJy0P/v/aIHGEjY3UhoG7mnrCZtTTWIPzAKyJ0OPDLFIdj
 GxGEnuIlBjwfBYNcVHhuH8Y/y16Q1qc7vFc8i6eKC09H2pLfh09k5oyHICVHX3IdvvY1f+RKU+5
 Diz81rWGl9k5x06CryAFxBxcJKRw7e8lPoTKDcBATepVblx+1udd6G6qKLXAKFNF/u4/7+NZOLg
 khtKrJRvD9KITBVpPA6IyVDmbdQg9Zdv+f9pxm0wucpwSpfurXg2eJg5N0QpVTKUXJtga8UjFDk
 Nwddv6bKl85U5npLcVtMOWjVpi+Lsb5h516hgo+SaLdJu8oiqcMvZPkW7Homsx6suOqdYs1gtsZ
 c3xY3cER+4qqGuU2ZrK/KJz2fnhZpNDjawinpQIJRP8jljFMSeEMNlQEQ1mLutjZJ0rGhdWIxqy
 498ADsWYBrhrvby95pQ==
X-Proofpoint-ORIG-GUID: ViG-wLljjzRcscWlIXcgofJyKIPnUUfw
X-Proofpoint-GUID: ViG-wLljjzRcscWlIXcgofJyKIPnUUfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160169

Enable primary USB controller in device mode on Shikra CQM platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..9867160470a8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,22 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

