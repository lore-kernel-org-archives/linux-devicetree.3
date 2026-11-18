Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993026;
	b=mSa+B3+msKabAWasiekTxd7QIzosn4sPMal6WliV9hTXbZPzHd5hKAfP0A6IhiKF8Geb
	 l9W47Fp+O8KmEyLfjdM3Y/KwUal45134koRki60apeZQa/NPDvlMM7uemeKhs7p2VPrqw
	 MiHQaFIm823oOFDb0MVY4IYqaY/LIv2ybrgmrS2qaTobukEreZcBaofRyTXsabM+jYfa+
	 jVRRDeaHeT2REGuQN4bdfb9L/MhLd28KJU0bKRkDWW2/8455wU16cgLDT9rtFL859zZ+c
	 Y7L4Ab4jAwzV8Cu9Og0ZJbV5loKn6Pi5Utq1T+oBtTINydMr7G9mHonIsK7oLtzqwvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
	b=OC6OJjO1HFleo37aEUKe3AT+NSNhgK2lNr+tDPaPh7bN1GN5MbujU240HmdK2UMVUB7L
	 AxKBin4F8r5m1SEroPUrTUvm4jRJ5fLLA7ViuRF+CFxvFNNXt+rJr0RKB4ZhS35c8kZXY
	 Drbj1sTuplaD7b/A1DGsOX6lemh2sQ8YvxhO7oMfQ/s/xwMZ1cvbcW3Z2WGy3ZxPf7n9+
	 UWeLxPjB7FnPd5DSAaWTwtoaKxZwrv5IW3N1twvxRBjCd8PScpy4hANrewTNhBH9yodYi
	 UIkYpPZkOYU26GjPTbcKCEtD40CedZ5b/8epDCjvlB+3/l/VnHZrBXLhw/eU2x9GYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMtxz6KY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P5HqC+ou;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154F8606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 154F8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMtxz6KY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P5HqC+ou
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8gfUJ1959905
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=; b=oMtxz6KYWcja31xR
	n1D0Ify7bz6aTMRbYaWu6axyjbD49U8VQDW2KrP5Lz2J+wQXcYlYIk3xtco9gBPH
	d5dcSCS2pdBpAIbpdC1osf2XKPfyADntsSABk0ADS8eDWpuyaNcrJs/cX2rpl+Qr
	gDiGHaW9JvS2bLpml3Lt0IANBI4cGQjal57utEblcSq0OtLkseybe3uSAD3AwnMy
	m1kfsitbs+yCdMszewbqRnujw/JrpD+jVdL6Et1VB62UpCDaxmVlZ802dhEyLXSW
	grB3BxJ9FqCuL7pZnSLWpacVZUOFWLvfG5JnOl/X+J3qLhZLQS9qUcGyPysV9FLI
	LuvCzQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9j771-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efda3bfec1so4478715ad.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993024; x=1795597824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
        b=P5HqC+ouW9IZ9TZDdNmPCn2lutoHXW6vtKk1qLVC2pX/mBNDKJcj4bbUUogptBTAvP
         NWCU5QTVMxOVlhaQB+ffl0hOQESn145ye4DuRzfR9YpciDB6rg+5mtsSb87Gd5zFJBus
         a4lQs406sJiDeMsuGBVhr3IZL8ShcMOioiJ4b8awhQfhYCHZMoR68HyuzOiO4OwHYvVi
         9efPs+fhrng86hcavulKVbDrBw052kOYKu7IqibQERoAvcaj+ErJ/rEZxMbt2zELH99A
         L4Tg1Yz8TemB3HMyyUfjcFxLfMm2nIfbvhIt72urRMhEQlBuXvhGoeVT1oFIxkAWu/2P
         7Ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993024; x=1795597824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
        b=myBN3cPaeBHew2mUfBolegBDi58WjxvF2H1ORTn7lkZ+9JX3fKPfUKuG+bVtXuzVbc
         dfTyzOUf632qVbivPTGZSp7ujR39zNhdQbtAKoXMWO/m050VDc8OItp/t7JV5dAjoN9C
         LyHdLxZtLS7s95m37aqkSxGxovdMkNY5d6z0iZ1dXAfFhQJ2+q2AsyFiIu1D2W6ITrQV
         sucg6MwASN5z2nO4b4a6LZCo7WVcDkt4dy030mfLaWTdYljXoiQ5W0IZXPjRroquohiF
         FnFkD1XkicZ0sFpozqxRiUzcXmy0l9hvNMS8ztn/bIobf/0pURa2/6zFihEyouYl6u6o
         vSZg==
X-Forwarded-Encrypted: i=1; AL+hErE6u0dhV/AZngD6GTNk8UzA3xl2xLG9gx6fDdQFGxhtUYuvheYL3SxsXy8KQv9TONxz9D9SVPyNXIYB@vger.kernel.org
X-Gm-Message-State: APuU4Z/cFXk2uLyszRSyV0DMmH1rm8zNS1zO79CnWgWH8P6k8abOjhSS
	cGo3qI+rj4vq1eMdBuWvVkwtfKuHw6/Tkiax+n+G96ElIgNWM4rdv8c2R7dJx7HjJJU1yUmzfbF
	vVU99IwCr3EmRTmgleGgm/MMNnbUSax8oCNsrUIDjPgk/hRgvbX52BpwPCv7yFxCAa5qOUoMK5w
	8=
X-Gm-Gg: AZFdTZezKsHL2x/VPBS8j9GjnaMRVm4Xuioaas/+BPDDcXyX/c6CJrTkPvAiad5M+Qy
	Sm5V7KfTQyq7D2AZ4DS/7+cGwdfruBCTAanuoClrF2D7uoRr1AYEg6NcX+0s0HWcQ/3PybK/lQy
	vQibKHrHR5sXRUDgk6MGtvzmrN3TKv1ow9+hFmLGUSs0mUcPnqAX88JyugFISfX7WFioXCy2tQP
	AaT4gNsP0VwmkDGSeSg3iCrvjf2a3OYzVU3rUPnuc3+WhgEdSX/UCAfMW4q/apFaHWWfZFpgQbV
	5vsPp+TFvmj5QC7rHpAcRcqOesjaZgi7SwH/Y53iJiiYcI1kqZqvmkFWYKRlZpeSnA5WerGAWsd
	YZyS0lZs5pBlGMKr66769z8b2GbrDEo6Tpv1xIvDJj8R3+A806n/Zs+HdK3tue3f1/Hi4UjqUxl
	L1nOKlk3Yy17QtZ9E4pFvteAZweAjapvH+SY6A+CJDstwCSg==
X-Received: by 2002:a17:902:e84c:b0:2e5:4604:c375 with SMTP id d9443c01a7336-2eff75368e5mr20617845ad.48.1794993024430;
        Wed, 18 Nov 2026 01:10:24 -0800 (PST)
X-Received: by 2002:a17:902:e84c:b0:2e5:4604:c375 with SMTP id d9443c01a7336-2eff75368e5mr20617485ad.48.1794993023963;
        Wed, 18 Nov 2026 01:10:23 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm10147735ad.71.2026.11.18.01.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:10:23 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:08:53 +0800
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Glymur support
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
Message-Id: <20261118-glymur_ufs_ice-v2-1-7ef4556eea15@oss.qualcomm.com>
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794993016; l=1009;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=d1zDDePFJIPVs+rwiQvZLUWqDZvC4Pb/+gxCqJ3DmHU=;
 b=buaRCjhuEH1IwE/xt2SlTyKymGdd968htbzKbSweircy8bDUw6FMW0PrEjd0nKHgnqg7E8zv8
 pqSE9Nhyg8gAyFGeyA1By5aZ4fHHOhOIiI/ZRlhJWgq324l7pnDp5qG
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd6b81 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=B4SCuiGsYTXXqFn_0MoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kU-FoplvQi4WpqaYW3lKz9jDtEYOlOt3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfXwMUpFr+BNQ7c
 nUPGk6wCt2hd4szm8hDxZa2JJvqgsvIxTVON3bTUXrR3oDNBB6r5PEVIaIUBiDK4B4b7Je0fDma
 XbkD0VAngQwkupDEZP0TQYQS4BqEYiie4zianNkCXS+JtUFcW0Et4XVaFwtoi3c4QWqUQYCOjZI
 VvmZZu2uKLLkIkELeF/N8j9xDwPhLiKIsaqJ3kOqizqSVEtLFDL0yidurHALwUed2rMEHnPXiw5
 ysIZfc6Wb/tqd+BCtOCsGPXzSM+ScTWJvcyarMkoQ8Fkr3FDmStBMkzUsqlr8o8GSp2IXu/NYs2
 a1ojUsneSmhKNd8/5LKZETa4ug7Hy/Gw1N4b6JrIgiLM0LLVsDdgPsC4UcwJtOVp3E7VJWQ4gOe
 Vb21K9CCWdZHVQgm8rdWnQjwsFX05OlZoN+irl7nr/SoOZpXKbFWS8c3XgagcT9HPwWgVxjA7u0
 hR3Qi7zNKspv95XqtwQ==
X-Proofpoint-GUID: kU-FoplvQi4WpqaYW3lKz9jDtEYOlOt3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX0NpWXYwIlBBZ
 /VuRdY4Pt8rQHLwo+obvyjXSrqQHH5y3KoaXrDUDB9Uhjs2nbeXxlO9F9h33ucDrT1urloDsDK/
 MuWcK90u8nPucOa/lG97wfkbefA5W70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036

Document the compatible string for the Inline Crypto Engine (ICE)
found on the Qualcomm Glymur SoC.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index b98c4c6b77f05a4295b7225007187a7b05387338..01a1a36652d759610e36d5ac3ad56f4b2d45b96b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,glymur-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,ipq5210-inline-crypto-engine
           - qcom,ipq5424-inline-crypto-engine

-- 
2.43.0

