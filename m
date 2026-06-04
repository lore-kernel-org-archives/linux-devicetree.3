Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69939A046
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560485; cv=none; b=VE9btZcaHp0bI7fl/KvgQ6Au1OdThUPoB7jVqsAV9QZ0odMmcXq105vt35yHiuMWss8jU1bQSl/rL1ySj1OZvZoS0lHxFO+aKaBDTUCbQ/9dyLu3giNZcv9j8wSw/1w/PWwhdKxo0eLDenTqqprLQaPANlPPCzY+g42FGzyz6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560485; c=relaxed/simple;
	bh=ZYq+Pc60R69TOKAA320tMHZs+shxB2cVaC/aoEkJNNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAKiqOwdhtbNX9KwdZhl6MrKdpkarcIggrzcwqcqasDQyXFpmNSfdcisb4Wtx10uxfFbfTuEJt8ZtoqJnJekDQZ1dxQbHEJqir38PLGYM7trGS46hIVvpx2z3PqDAP6N2r/UE5ddjkP6smrNQTl2QhssaoOFv5Aw6eDUtJolZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERoNTu5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVX/e9yL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERoNTu5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVX/e9yL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546ifcn3242117
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 08:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Bak3RMKRzTj9voPp4pKGVaY2AZdnbVcrr/s+bfnjyM=; b=ERoNTu5LcAXuWGaQ
	z/dBc7EUqRw7qXb93tbnoeymbVDD+njvEeb4S5IKvaQ+b+SLZ3Jnx1Vz1belDaqy
	wLQzWYGBUxs4XZbqkbHxW4cuZFDIrtFR0rYLpOvwjw9T76w1AUjFqyUoI/0ffnTz
	DybwXA5wNw7KfMoY1M80+LK5zTgeXfdOo9b3Vsuh7VJnqs6RBGH0oU/jqZ+idZR4
	04NPkQRJxKx5cCxp3KzaEmjzXl3NCyEb9pOWkPyohFmvAyBZp2Ol8aMTYRbutc8B
	gdlWQUp8+ZiH/yUTYlOJpVhomBET+MS0bS0dTA6VXHVN4w4RV4134D6Es0ngt0Ma
	yGqYqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd09v67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 08:08:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91550dd07f7so12967785a.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560483; x=1781165283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bak3RMKRzTj9voPp4pKGVaY2AZdnbVcrr/s+bfnjyM=;
        b=TVX/e9yLaLAXhsC9FbvckDH5KakBfZo74TAGcxbuyM+oAdRTviMEjy0u+wP+DG0RmT
         P2mEWIr6k2TEELkZdPVOWKXz47s+FNAtVeh0LiwxrbbFx79aAJa+meLp4Qwrkh9pe/26
         nL4rEXdENVp8Hc2uQA3ofQhhpn3lukpOSSOsp4fkp3ph4U2AtQnZP/YcLTcloT5ug+ik
         p+iEyq98kxnBiwV7hb7kCIN5MFg0wn5gY7orQnD/1yzMNTdFaMr74k14TUMyq6/xnoTy
         AUMZv2KifkmPKFFLTyRmrvpLX5FV41bfgMMNtOv51Ob/BMKMcW/mNlzPG9DaofrVFUPA
         Jeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560483; x=1781165283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Bak3RMKRzTj9voPp4pKGVaY2AZdnbVcrr/s+bfnjyM=;
        b=nZRI8g8zE8BWFMaABeQCQt3/6oZO7DJzYGcjQC+noVBQWi/g90D9+29wqQgPqnlLnA
         bO8NQmm3fJjfldUiYiIM6GpclZ3NW6qo/xGNcn/AKxVPbc/Xt4wtNRU30eOVq1BibFmi
         GFcdAX+EXF+HHGFXAXwj6M8G3NYO7HdfHm0g937kZEp8Vw9e8cJK4MsffHB16s/i0z4t
         PiQUcwJU5poUIzsrGtwP1yi5MXQSKykKRbUPTLiaJLiJU7CuT4AjdbXwcpFMPOzWee0i
         OiufyOYwBhTvx+iH4UzMr8S3wdi/RtCefh4BHWqNOuvc7/3ate5g7XK+w0bB2ronRX+M
         Bmww==
X-Forwarded-Encrypted: i=1; AFNElJ9nL8B2GpH1jqywnoTpAECuBkC/y4m4/XfovFPI5iVn2gTWc7TCJsDVrxbN8pOdBxhgstKrcKxluz4j@vger.kernel.org
X-Gm-Message-State: AOJu0YzQKvBpFTwyhIZ6VAhy8hdkTQpbkMkWL97tVCBYhbCV20HM6/5l
	JkOVjKY48paMt7wyrVKEQ8fUZ0HhzZB1J0DPxkHyUk7uOecTEvK2gNgf6Qa6PJ3FT/ONa0/y+hE
	u4iwe9bWwfp+RqLyLVFqQTZ5rleaFs7cXzfNEZaREiTHh3x+d4ua3Z+1T3h8odsjc
X-Gm-Gg: Acq92OGhxPk2urccgzDvWeqxMqGyhWgZFHTlq/HSH7yNU67D+35oztEV4V2hgFlX7iY
	raKFLyB4CLgIYcpLSio/fTnlGsrEC2BYZN9+Dw+MmkY7xaRnrxwzVCWj7aQMDiZBr74HG0+R8W/
	LGByueUMjsBwMc+A4XqwfKVuapOkGhg2NVSazemUobH/jsVvzlcVJltQmgwFf1Ys2BJro4+5Z0z
	YpZK7RbPpazgti/pECjtxT7HS7v0MmW5JXxhFyCLZEQ/OXpJ4hHguWmXY0Ou6ZJ8P8afJADo3hB
	2iDOulzPfV54TMnv2ZSkAP+rqVhFXqaXAagikklKddOxZwUwwNKUER77lU5VsoDYI+Xklmavp/X
	NaxA18qhfJ2hm0XG4PUczuwkt0fE2JonBxYSyZ9mlSpUPNqdLPqkb+XPm04XiJ4IzUTitCnwLbI
	XSVBoWxCu5
X-Received: by 2002:a05:620a:4729:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9159e1a7f22mr134386585a.3.1780560482833;
        Thu, 04 Jun 2026 01:08:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4729:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9159e1a7f22mr134384285a.3.1780560482408;
        Thu, 04 Jun 2026 01:08:02 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm272304366b.26.2026.06.04.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:08:01 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:06:55 +0200
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560429; l=1067;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=ZYq+Pc60R69TOKAA320tMHZs+shxB2cVaC/aoEkJNNk=;
 b=VPdHvg+wneaknitT1z5agc9YR2rykzv00/GbM6pzictaN2OjNy/bpSBXAekG5Km8/6Jqvp2HT
 bOpP6WayS0CD4vU39jUVjJmBd0KgZhH876krR1HMRCfa1A99ENtRT0V
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: kYfcTL9rO6IMHEt_jFgG9c7Q8__02fpW
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a213263 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8k6WQxmsAAAA:8 a=EUspDBNiAAAA:8 a=4FSBBunRfCg7zhCRoTwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kYfcTL9rO6IMHEt_jFgG9c7Q8__02fpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3OCBTYWx0ZWRfX3zfmzCaf9tX5
 OjHgBCWszD1OkFecBox1G65IG+RYvpYNinh4f07y+CXrxSM6bamCT1XWVXaWzBO8BM0Fi3zLS/H
 LbyAIRj/yHc12fo56SIsk4/7LvDQPu4vnRLKsrh3oz1PzNq5FBXasXZhNufarzVwBaahnsfU5u6
 9FJYIeWcYNSthMtPGzjQ8ynSTfW1p4PF1sjcAQiLUgF0NsCsQkRAE+8z54r+A26MkjD/v39Afeb
 IA9zLEPJCXcuSm6a1rvqgSP6kYUUyYNSoBlc4GU0qiUGT/+ZP+2CsaYFQEMHUTRDP4ph6Bp8AmY
 KAElRTXSnEXtuiInpLKPopplbIypacOGK9C2CwAn4lROt1kyUzgUJLT0AkPOXaKbzCLuW8mX50k
 /TF1jFGeEmAGhs2qVFWZ3oDBcXntyLwlxCt+QKYcI4PLa47nBhwqChkDrvL1BEvM4Xlk4XGEmba
 I7U7bPDbvv6tMvqrNww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040078

The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
Lenovo, featuring an OLED touch panel. Add a compatible for it.

According to the spec page [1], there  also exist other variations
(based on the Mahua SoC and/or with a different type of display panel),
but those are to be described separately

[1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=spec
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5eddaf48542b85387c2d430cd4721a..fca3d180489d4cd3eb2726a722f15febe44f03ad 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.54.0

