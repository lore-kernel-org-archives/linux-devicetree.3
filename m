Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0C2E719C
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560474; cv=none; b=GEC3I7psb2IPXlLRoRCtobJ7p59ZW6hg/WeOPM9B+RT+Khe3rvHsKc6j1vjHSuzTl4g7UeJHgjA6OgF+3nc0z7N3GmTcbRK6Yk8XFuj6ZxMpw9KBJEfMVMvDQN71KgUTHB7A3miKYGEr5Ld4zqYXE3hFIRgLi7TDtzo+qb/IIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560474; c=relaxed/simple;
	bh=5O6Xa4y0fRL3DY8QrCMxGJm7vbQjen4MmAX43kAt6RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZNhK/mxpdUjtai+/lcLnoCCC0FxAIdiKNu1GbU9jlcq0PMlirqzZsmrr20c6OtyoInMbxWYAQoQApYsWLZ1U6WtGLH1Afi9V6M8RlqrXo7617eR3hzPrsjoe9/BjUV34z9c7g3GN60XADsWF3gBatjYgOHuzo5QlXNsXtXXywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfWgm0ru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYh11cKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfWgm0ru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYh11cKD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546fYsL3240201
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 08:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61PQyy4C6QpV3imW0J6BGaQpSZ8+cchsOaIwpKwWfAY=; b=CfWgm0ruK3Ws4/cq
	fe9Rz0fzfRAXiZG57QYctG/b0XUmBCrl60JWrwQeTUOS1sxwhaFk3S9JQzIi7iga
	TU3wIWhbkwoUxMj62mM3Dc/jEpJO9QcoJmU9X1o0QCKrSLzg6qSCQruflN62qeFz
	tic7sqwCj8+NSpSUwo77C/ZyGUp3DERxXZIrcEPXPUEhx74MTAVoY8yjTQ1nGFNZ
	IgSl8Z82QyJohCFwdPaf35bOEkvizJz/tE24hgDRf+/EltMYm+t4CaH0tm5Fj5q7
	rqUQSV5QPoTZFd9itw2YeODG9xL+TyKVA0Inr96uPQqyFvd+HbBT6UnBeI1ntscz
	+IVFWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd09v56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 08:07:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91571f0d3e3so9679485a.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560471; x=1781165271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61PQyy4C6QpV3imW0J6BGaQpSZ8+cchsOaIwpKwWfAY=;
        b=TYh11cKDheCh5fUmaZnCUfzGON4WYPiDRHhkNcY208PrUfA1naYqM+THqk3uDN/kk5
         liqJ7BShR62S6ALZh058o1Z0UmIRZBPmQOcPDVllgnSl8DWuigJZ1A0WWDri3mCgczSq
         Ow88RK+vnWfI2aXuTAzWwjxmVKKSbmvUZVed6AmGjrdSfxRkP+WMTHVvtTCk7shynPUx
         HsycZN94VbhmhPfY71ZdP9IEq+CSPpPHhzzH2YiogqHMeAFnMeMN7mzdS4trAt1+ampc
         cvAF/SdZ6jqrgNiTTC9jZLhD3dKrc7U0Y3bsLSj3wl10xfFqRfIIamyVmSskrCF7ZbJX
         zTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560471; x=1781165271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=61PQyy4C6QpV3imW0J6BGaQpSZ8+cchsOaIwpKwWfAY=;
        b=Toq8AOMU4z1pjpKA7VEA7aYIaV5vmRkdB5djiszRGaANI72xtUL6Tgv2miEoPTxuuM
         VRmXtZttS882/rS6xcM9CY3ClCC67hdh8pqgy+rDU8rbezVbU8ZdySQE6wxe6k4uAlSi
         UAY0ZR/f0D63pXZi/R9LVTSjYJM1LXKAqGH2ePMOrnEKgJO5Tzz8pm2IhzcNNXwnlnMs
         C6PyFMlG9+xwqce44exglq8mQQFeIDgU2rwbKmR9RobIdLuGWavbg1zGT+AMj2vhLqJO
         lmu82NjvPdlItKukbuMpt/O6NIU92qrltula4E/SeR6na7fsmUNLgDFoiUKl78INoay8
         IQWA==
X-Forwarded-Encrypted: i=1; AFNElJ8H2PBJvC/tdJ+Ugcs+v05GOF5uIIMUKOqVOW0vVsrKfUfahBgkQYYWnirMS6gG+NkcLBRf8KDLhgx3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5h+hIspNh1zFjKRs1Xai+vPtacSK16swGXKa9Y+RQwKqFV/HJ
	hikU06TZXFNgpo6qcyxisgqAPMLJdsMvCuQcnuW89hiYQdms2taTNJ2LVJ/qA1ZesdaWNuqHkUm
	QfbbBA0vec9Y3MNuBZbXJhyNl/NOMq1BvehWd5iJBVApacFF62bcMYdktTjX+z3WA
X-Gm-Gg: Acq92OGgrnlZ40gGXr81UHKjgo2IwF1YM9iBzvcUkPEEpUxBcgTzNgbkpjDq/mhEdUj
	t8rhMnzxpXrxuH4OpjB3S+8YE8SzVRIuyfytdemN4W0P5YjErWiGgAwK008QpHcQNjIXRSFHflr
	qr95hyLljWssplFCoPKRwlSejqPMs3xieWseuBbJ4Akqf+thjVjdhtoMIhs4CMdkvXbxOkYhhuT
	V+jxCsrFScbz8m5iQtAP5TuRg4D4vyp+IGJKC8qd9f1vXddy4jOcvkQ7UnDW6vkjiG77MJWKNBV
	dfZxauGTUVHsOP/N6ILl2LeoMF85tTkCOZueOMwKFe7BOPdkhYHAMhoigvM3EHvyQv7D7mtK2Gk
	WhJEsCFZhhDd48rN2cvHDPN9gbva0O87ZpQw2RQ/20J16vBRMwLREI29a+nHBfOzIjU5wBhc99h
	dBWEdTNyR4
X-Received: by 2002:a05:620a:4406:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-91589e9f107mr763050885a.0.1780560471002;
        Thu, 04 Jun 2026 01:07:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4406:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-91589e9f107mr763048985a.0.1780560470457;
        Thu, 04 Jun 2026 01:07:50 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm272304366b.26.2026.06.04.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:07:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:06:54 +0200
Subject: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add
 ATNA40HQ08-0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
In-Reply-To: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560429; l=2628;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=5O6Xa4y0fRL3DY8QrCMxGJm7vbQjen4MmAX43kAt6RM=;
 b=rLMvjG7mqjoAENyW81aGwEM+FFL2OYknMHLQLduGD2E0KnvZ4OUtUjeUdI70qzYVYz+UItdq1
 FRcQcByBwnGDy4JTbwneLSLgnPawBQoRAtekYIyAbCEIasSsghyjBaX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: sWVl-XKnWcgIaLY-ldw4RyRYiQovlczR
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a213257 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZJ8lwXEUdTpOK_Y3SCYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sWVl-XKnWcgIaLY-ldw4RyRYiQovlczR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3OCBTYWx0ZWRfX/BZoF9urn+VV
 hotF/3INn9BjJOHD4cFY8RubaBb1shPtYE3oAQ33N2KTIDeS5KJ5JcXvkbwJiyZIQRw/18TKlOG
 fDl4ssiUoHT373WpkvdK6y6KL31KtN7umBlxoAtGmB3BtGwq7WYqVcJT6Bo1abE4BON586Gcw3P
 CoA0wRIZKoUU+hSUolyr95ZowLeyxpQBMRZl39zD5kbPHekxK7VEkQBl6+nqEcYBkjQV7MbtJdw
 dQo5KH3xJcL0E4S2nB6AdyHqGLTY7G21FZBwxI6O9Y+x07kF2Yglw7qjL+/OAr3pPJUJM1Vodco
 P+11kEZbwDIR6vBn0LCYVDOqRvKMbiUf3b+/YSpBy3IbhhX161no/qi+9REYIQ/eEeQM/UlOG3A
 HUXbCAk4tMucUCaTC4+TWHdln0Hg3IsVZ3ovYGv/VnBUt4wo0TlWxkdt2YH+a408ZYFf4ENXFHA
 koxoekPugbBxr4UWdWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040078

Some variants of the Qualcomm Snapdragon X2 Elite-based Lenovo Yoga
Slim 7x Gen11 laptop ship with a Samsung ATNA40HQ08-0 2880x1800 120 Hz
OLED panel which seems to be compatible with the other ATNAxxx panels,
document it.

Note that I stripped the -0 suffix from the compatible, as it seems to
be of little importance and some sources omit it.

EDID:
0000000 ff00 ffff ffff 00ff 834c 422f 002f 0000
0000010 2300 0401 1eb5 7813 6603 ae85 3851 24b9
0000020 500a 0054 0000 0101 0101 0101 0101 0101
0000030 0101 0101 0101 0000 0000 0000 0000 0000
0000040 0000 0000 0000 0000 0000 fd00 1e00 e678
0000050 47e6 0a01 2020 2020 2020 0000 fe00 5300
0000060 4344 2020 2020 2020 2020 2020 0000 fc00
0000070 4100 4e54 3441 4830 3051 2d38 2030 c402
0000080 2070 0279 2000 1800 1200 2ffb 0042 0000
0000090 0000 0c23 5441 414e 3034 5148 3830 302d
00000a0 0021 ca1d 5e0b 4007 080b 0007 7ae5 8551
00000b0 b9a3 024a 020a 5445 5fd0 644c 4400 7823
00000c0 0026 0609 0000 0000 5000 0000 0022 0014
00000d0 0ad4 3f85 c70b 0700 1f00 0700 7707 4f00
00000e0 0f00 2e00 0600 4500 5fd0 644c 002b 270c
00000f0 1e00 0077 2700 1e00 003b 0000 0000 9085
0000100 2070 0079 2200 1400 d400 050a 0b3f 00c7
0000110 0007 001f 0707 07f7 07cf 000f 0081 731f
0000120 001a 0300 1e5b 0078 8fa0 6a02 7802 0000
0000130 0000 e38d 8005 e600 0506 8f01 016a 0000
0000140 0000 0000 0000 0000 0000 0000 0000 0000
0000150 0000 0000 0000 0000 0000 0000 0000 0000
0000160 0000 0000 0000 0000 0000 0000 0000 0000
0000170 0000 0000 0000 0000 0000 0000 0000 900f

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 1bbe0da3997c3b06eccd18fe8980b58a6c05d963..27536eeaed8594c047dd0fa1cf425912be189508 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -25,6 +25,8 @@ properties:
               - samsung,atna40ct06
               # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
               - samsung,atna40cu11
+              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+              - samsung,atna40hq08
               # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
               - samsung,atna40yk20
               # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel

-- 
2.54.0

