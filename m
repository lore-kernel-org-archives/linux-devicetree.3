Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F96136A027
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136166; cv=none; b=piGXU7ZRncfl9vMA8wFM4U9/GnkhBDY4lKgTnzKlEWYv5cnuSFX6RNQjeJZEW3z9rJgeUqYw36edEH21ZrGmPsxmKbufzRvpUHSWv//kbovCTGRFZIE9TR+UX6qjF8WGtjlfdtpprxFIhlf+noxx1DD/K55IrU3EHKUeoYu3zpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136166; c=relaxed/simple;
	bh=UiyU2L5PBRVSZqnioCJ8UBKUuINJuvq+zilFpwfxTpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NebMTSWWv/3+o6rNGhz+YzFnMnEFu1YsQMl0XvhoxdrfaiCkI9pOHTiZI0fo79rlGv14aLN8Zyyrw9Otrq2VjjJ+cVPRUr4sHgHhtHHKMzMiQUL23tTBHhZ+Lka9tg6ZcaUytbpNl6GLq8joBhP1XcOvA3NoSyxk4ZxWUdFtugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/ckaxo4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJEo9JQX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/ckaxo4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJEo9JQX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647440WP150875
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=; b=i/ckaxo435Lj1oP0
	fDNU/DOx4i5czp5xdt13JD/s/uJC+kyt5L0MWKucgvTAnPFLaJPK8vGKXhKST5J5
	+W9P64RHEcyxCvVkgsWIxAVsddsvjQ0vHCaO76XDjvGM+x+BqwF6aEt1oQbFOF9o
	3GSopI5+nnGWWH7RC/A3uca1iVaSHndmf5iKyJggb7m2qUdbd4X3+mDuCItixCsc
	81isHHQ3pAzqorS+X+KPnMPGgW3JR+IQh35p2pROSEzyeimpF2XloukcWGBp1gEF
	7TCbHzO52navw3mYw1PFkfA59pZt36/vOWSexPAoNB7C4S4FyD4i8xy8/bu9iTVk
	dYEG6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrgfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb21daf7ddso112164085a.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136163; x=1778740963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=;
        b=MJEo9JQX0m602umPJR3pqx/WFDfXIDo+4h21hRNi1IUBxkaATFqeh8WWnn7t5gnm4H
         fIlncurcPfmZ3ZhwrQcGrfHTVLxWXJX2a1l7hBkiegvBiyB77+k0jjp/WrCiT0kanPpQ
         Z6Et7R+2XNccuiKXlE8i9syTNmdzGu3xtgMe4tJrYjo/g7rd27k6vfRbBYdYbXq+wodP
         9W8ZWzn196OlL5PR/1gpr+ohe2yq54rwbR536RGxrEmMk/rLGkNgcm6nVrOhHtUWfTLA
         zs02BTEVT7Xf4yKjvZRzZO7yfEqe3JRocZ9cz88vETLZ1DegtjijSiVhYY8+RDu8zvpe
         OYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136163; x=1778740963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=;
        b=sMWqT13E1CRFFmIVLYzx+vfm5JgC6qHd/aDOleXe/niMT5nH+pt8sR7/O18UEdo35E
         +mp1t22+lQ2IId5HJ1OD3f20n5wgQxEMoRJgA0Uj/03P3izX8f/tP7SrqDQZ92W3fZIZ
         DvZ0iW6Ubh3ymt8SBUCaBypf+b6lgj9A5OSST4qje/d9yR9ci68KnoG0+KCELljarJAt
         4aC2p+jZcj60utzDOMiJL9iKWw5eOmwLMaB+3CXHyYQ3b6SAdhfcvRViRsXlba9Rmr0Y
         /f4I5p+trORbG4naKG22knH8WxkD6hvjUmCaMBYKn3HWxdPyPdWH+SbXWaJtIh6/je2J
         qmVA==
X-Forwarded-Encrypted: i=1; AFNElJ8Xe0MiC0S9/trA4J9nwHPOloIRwbOI63mBS4fS4/BAUfsCw2EWY7RuDuXS7R7Yw/ZZkAzWnuXrsroO@vger.kernel.org
X-Gm-Message-State: AOJu0YwrKIZJij69IXfN4+916fxAXT1lKVzshtNpIN0WBDwcXp9PKBTc
	Axf0xq6/eYqV6aQnLIYC+G0LYh3hicS0ic53vWn/UmFsoCOh5VdKCO6/X6yNMIUSN8uXjc0/DPw
	yW26rnQ8tj343+QOEoBWSOXFgSUP8Rp4ZdQJFkkpT4faW7MhfHI4zWr2O3b6P/KRM
X-Gm-Gg: AeBDieu3zV7nhVicztOm53YkBhQheQKGvkeuJHy2PpcAwOD5vXoJNifC7h25slqkXWE
	o1+VVTJUVxDl7bnD+RM5blv7QDO5NSNSziqN0C9SNxNI+AlZVvb5WLKOls++J0oqxL4G1wBG23B
	nT6Dli+onwMynDzIHL0hzK5z8NgCghlwsDrW82aAxrvJF2j1uGdn2zbwDeOFwl5bI8Nfy+3+hZl
	3W4GSsZ4/fwtqIDAMokmoDlUT7A+q5Sik71xSToJ66tR9JUyD7AgBJel3nKiBoDo8luoLAsVjPd
	Gjyk+IGWwPljGexhkl/L+2EwRbCcpKxUUGv7pvIVvcb6T4MQMTf4sP+Ddb8u1yg/iM0xskD1dMH
	kKYpZjXCD9BS2gCJ3afvlxxjDKLELlpP093dDWeSjQ8N0VcmQUmRvUdtj3V4h38WZtkytwKXN4z
	dg08Dsr9hXVZoi1hVYdDBOu1DaWavYc0+RAYymwdMjBHIKs3CaPZDQ/o2R
X-Received: by 2002:a05:622a:4a16:b0:50f:817c:5d45 with SMTP id d75a77b69052e-51461c28aefmr85725931cf.23.1778136162833;
        Wed, 06 May 2026 23:42:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4a16:b0:50f:817c:5d45 with SMTP id d75a77b69052e-51461c28aefmr85725631cf.23.1778136162356;
        Wed, 06 May 2026 23:42:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:16 +0300
Subject: [PATCH 16/16] arm64: dts: qcom: agatti: add higher OPP levels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmRxEgr+Nvi2Lw0QP3FluQa801XHFjmueooI09g2R0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ/Xu+8kSqxX1D/qHs5fEXFlfc1f/wFfPghu
 /LGQY++7WKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PwAKCRCLPIo+Aiko
 1V4XB/45ZlAHeOn97WZC3jPb2WpiP1oqa4VW0qY9GdaVUo5HSeDsPkaJfhU3+Ya0a8bTg5wcAAz
 tx6lV197e8QI/hm0HhUpv8leK4ZJfqthPjBRJ35sTRKDJlXt/SVsYX8Aak07PUynBdGDp6uQTln
 wZDrd4DtSxaZAAg8OA9zEfHNlym9gDxl9YkFCFkvwxlGsD+ME0bBoOtPwdaGhGGGCQYeuhHuFnr
 S2OxmT6g26w65KKyhFAM4CnbhH519R+qOhrRvDL5aKYrqJmL37jVYpQ7eWQAYYgROGCva1JSDOz
 4mIAv9g7X0eYe0S1rmFx+AoU4WCbOEnvD7i2P8KtswP+J7Zl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc3463 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UHPahDyPz0TdaPj93UIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6LkVLICEfQKohWkxoIsFA0cmWFxYMgjQ
X-Proofpoint-ORIG-GUID: 6LkVLICEfQKohWkxoIsFA0cmWFxYMgjQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfXwzaUXj424ZYG
 1E8Q3qKUCjH+3B5xfmbCTWKPPEO0J3nxlYaGtwIOaVMjMP9/WVkRH1lnJSwJcKlyjqM2u2iHjxn
 D0Yam9jRGV8Fob/qzlk8vRuuwuYRs5gh78z5iReI9CC0NCwUg6Vd1MypIDVzaBSOeTRH/1Rnzdq
 iWc6RvAXrDD+Ww3kDtOrZ89ICeb0ZjEx6IadmiJaKjcr00dgy1WAhSn+Mixbes++4EjRTYTTJ+R
 56uP3TerNlRGVoZz0MxgHuffTGiqoatuRLU18qUtIKBuHANRO29IAb4GDc62fOSJi0jLEiBIo5V
 GeUMcCtLTikmuZYe0LQy6kivqP8WpVXNyYMM28dVdm7+RL4UrkVrNuxUsYf4IpNZEpklDxgRPjk
 YtiN6x0XmvzVlT41OPGLc6UeHJYvu9nOMu/TOFnymE1e1+CWIHl7N2EPKlp+2a0XjSsdsj6cMZo
 o7MZ8taXNZrZRC669vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add additional OPP entries for the Agatti platform to support higher
operating frequencies as specified in the hardware documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1e..fd40aa59878a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2455,6 +2455,16 @@ opp-240000000 {
 					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmpd_opp_svs>;
 				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
 			};
 		};
 

-- 
2.47.3

