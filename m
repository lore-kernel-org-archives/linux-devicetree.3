Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF43D5258
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089138; cv=none; b=s/5jLteeZcgph7ZADxbTeI7xAj7cJWydr6+HCJ3siu04nFE1cxjCUuFABAlajZ21vSfywGplnP66wD3RmS38KLHnxqFrL53xA5gNY+uzEmj5vJkAabUY4GHnItbqJI45oL+pU8uESwdbITYUltt6rKR4C0frdH+QIq0qLx4Z3QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089138; c=relaxed/simple;
	bh=USkwXBfci9sIWJW06UXbOmxrqKMlrITA2EN65WJiKAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRc0zYicaCsH9Wv91aWT/IIpjZZW3fPO1GOxLkK52IwbeMNcHm92kcBMU7N3hjyrPJvbIgSsmM31cgjGxmk0XBK+yasBnGESobYc9yTqR1/RC9cWrDyM2OlU4XZnGIVCk5oDUbuMpKCcHXjQ1PLJlE2FhjVLX7rgv9HavK7VjvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pbax5HqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IC+HTp6J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pbax5HqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IC+HTp6J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC800U2187568
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=; b=Pbax5HqTfBq1+LlO
	1BWoF/86j20IrHCfAzT9p2qahh2qmCBs90qBzVOV8zqvFdV+mMRZyTwdy8dsJbAt
	xXQMDOsQSKZrtcd1IemvCWJGA7sbZqC4kIe7ZcXynR2ShxEYon83ykAQdRXubmHG
	c2ENnYz63Fk9Cd2acd+9V/lyg65plIbJINdnBbPHLbdayn2ddaAR9GjpJy+vzMCv
	6cxjI3pJpmnIwI7QNfv+M6nEHIvsKKUSAM9yFBDIWdwEM7a5pDo+G+EbfKLO9TE1
	s1Tbn2PFz0uaM22ekn5bv8J7OqEtKz6iKEFanOALDWZJrVzQpiPkQvcY9MRmWX7D
	WnK91Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hgd6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:35 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-471618e2082so2858946b6e.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089134; x=1776693934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=;
        b=IC+HTp6Jg7RCCD8FaQdDEWT65DnUGbSyhdMahv/F7QTZ0BLoCykbW+ycZj9v6bo+Et
         m5vsaZaJS1oxRkrQlIz4FXE+MCy/a1Qookwca+K67xe/1NKtXgpuDMsQFgGTRP10v5cR
         X3Zy1l4WNpNz4nreC+PS/oI4dMp6S948/qGY6evQ+82KXqe4TBfzP/wBzLDakMQ7YODA
         FTp7dDOZj0m4ACnANYbNrzct4MvIck2rePqmTZ6f/tYyTuV0STWYLfQXJhzW7E8wAzne
         1z8fZGdwb43Ye1kOJbwK1IW4ARGJmDuiOp9+2T8ArICG/RcuI/5XtQqQUkqCrnUk3zbu
         6fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089134; x=1776693934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=;
        b=pfluBRJBnGqlnI+BJLHM4Sz+FlmZoD9ndrlcMRogRA+7eEsm+M+cTuRZGBQh20rYJX
         y72kO0lujx6VKCsF71qJfR1WxVonoCV6KrgJvzL9eaZzbcYYEda2lbkImUiqonNsGiZl
         blIzXBff57kt3n/raW/a3f2m30yyFxF2mfND4s/lth2F1nXYDxREyq1OhDijjzlH6YaE
         a/fE+jcp/snPj/8d+NHpRSiXL1fwgk6IinljeOzQAUqKzMnzCX5eMnFscn37kq4LDZZD
         /LIPm4drs/q1OntiAj6Bjz/o1whWFSoWX5Hk9/GPi5uDZnlCZhPDtEHw+mTuozQrih5A
         ZLJg==
X-Forwarded-Encrypted: i=1; AFNElJ90045OEZPflj7TxMbw6g4J6/ldtf+3j5X0XrYFfaJYE0/PLK6wUsC2DTyZC8DwTbOFbaKprLHAZ1BY@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLxjMHxxWaIrEEywsLro7jFuzFwLnokTXI1BTqarUCYm/dgEe
	uwBx3qCplUFaKTdmOd7ZZefh56EHcVEqrzdST+ff39ZsrL3ulBbsIsMlTIBlF1MJ/GoO8yW57XG
	AlyQorhj/YEP1iI4x6wRkG1B8Mk8zOxDPwCLX50rumjJUNSzpMrtMcFwr5jSzJb1A
X-Gm-Gg: AeBDies87rUpXvFBx8AyTiN0Z4ax0z5y8tzb658jmPGhL5CF0fBQGk+hp/T52Zv6Pqr
	wBgxRWicbg1In0qarpxBspspmPRBZscZG4RGaYPpcATucAYs6SE/IabB3n7sts0nJ+GYMa7c665
	x55RyUzRC+6q5umvwaZvEZV/xInYqUWGDD5boDiV+BxApmv404l0o+vtVGprRHBBVmwhm06MtUe
	a5duo2ynG/TIl6D3262+ke0keJR6nuCUbir8j2GmdhsWtkSFnjZ4eUJN4/qWvur2GN8t2n+7Zgk
	XEF6rRZD/RvYTJigQGR4RcB0Osuf8LAFkHCSK5Z1QchMhBj2H0Djxr2cNFQDVKbAD7jkZOXdMyP
	Gh9Ysceqz4vMKd2A8pCilyLpkdFDvis44ws07Tg5JbB3GXXA43GwHd60lZVo+g3o13CYkY5Jg6e
	iuJkSIhXF2Na1KCEcXTuoIyMLBO6TX0QpKSQA=
X-Received: by 2002:a05:6808:1a21:b0:450:c321:d50d with SMTP id 5614622812f47-4789f00d969mr6635806b6e.40.1776089134142;
        Mon, 13 Apr 2026 07:05:34 -0700 (PDT)
X-Received: by 2002:a05:6808:1a21:b0:450:c321:d50d with SMTP id 5614622812f47-4789f00d969mr6635751b6e.40.1776089133568;
        Mon, 13 Apr 2026 07:05:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:24 +0300
Subject: [PATCH v3 01/21] dt-bindings: display/panel: himax,hx83102:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-1-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=USkwXBfci9sIWJW06UXbOmxrqKMlrITA2EN65WJiKAk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+adH2qTEyKmMidc23X2r2bzfcMv0+Meuflv8pYOyfoS9
 Ys/f350J6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsv07B8PcF1GcW687Pjkk
 1afjxLqNSdojItIo33LrNZ6tab95d12J4mE4kGa6ttjTIq+jMEF1p0OFrFxiRZF5ksvlrDe7v3w
 Wrv3vyR1tf13v/tLqkMfl6y8UT17xWMXYP27WL497An+4Jr/oXvN3S/g9Hj+eep2QH90WIs6GKz
 38Nk+Z1vB5g1ygkHrMdFYxpbN1Bl75/70vsCmZpXm/YTc+s/Mia0+/Y4r4VdbttfPdlqq3Be6as
 /nzTJerX1td1lh/4c6TL7mdO6tdx9wqoblrjcnRaG3326eTjGzPBz3t7BKYXOckNdU/yO3ugnWL
 DdNdNS9mrRNdqn+qRvtGct5CbpkDr42jcw6pb9ZT4t4KAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1lC0T66H7ob5-gdMVc69lpkktEdgbvbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfXxbpLibMczRrV
 mRgxpi5RPQiQ0xpQ2XFakrg+5MHf6g/17Q5S2Nv6fnRDXbtfeFx2fPQKCvJo3SsPVjuN2r+/xAQ
 dAqdJXrjRT7VG8bt3WPDHno3VQAX8VqYOnPD2gCVjetr5Grs17RdsEbK0KDMK+AXpgpWve5y4LA
 GTKgZVknBhaY3ihboABcOg7hn46b0Qfnhl+nYSg4pKIg+FgsARGbR1zA22yj0X11EihhWBarmq5
 9w8VNcG5A919pUwCPML3+rH3ESvN8fhfDD24ftbCwRi06dN2X3ZNoxreBEfxBe9qGOP33eN6C0d
 XxItofYqtssPziaQHfJx0L3k+RVNuvCBRP8k7C49nsNVJMKIYs+XraZUD4rQqWWmBBJ20evjS+s
 Q0Fgv2IzOgND9/3z7o1/pjQkG5kBuImbv9fa6Ear2SzlAZNlbVvNFNhfNSFp+WAtwFyrqWlfrob
 OQZjeUgAmnwEzaRrDgQ==
X-Proofpoint-GUID: 1lC0T66H7ob5-gdMVc69lpkktEdgbvbr
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dcf82f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=dDwtKCuX-g0vR4_aJEQA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

Describe Waveshare 12.3-DSI-TOUCH-A panel which allegedly uses HX83102
as a panel controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index 66404b425af3..7667428bf9a8 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -30,6 +30,8 @@ properties:
           - starry,2082109qfh040022-50e
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
+          # Waveshare 12.3-DSI-TOUCH-A panel
+          - waveshare,12.3-dsi-touch-a
       - const: himax,hx83102
 
   reg:

-- 
2.47.3

