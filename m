Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A5336893
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607094; cv=none; b=W60RB9ZubX+SvKV0oPIJmP4CdP5D+Cl7RDlqzcdsxx55zc9+7I6p3+hCcFeldw6FOT3kJM46WdcrtaVFM/YpHVUMNofKzdS298UUeNnL1wcCwm8vL0CuTmdSV/a2JvqeslLU1tV/4DcUO5pNwQOB9udqQWLPote/MdR7DgfyJ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607094; c=relaxed/simple;
	bh=QptwI6z3j37hX8AHtjzXh+bGzHbUl/D8vt513nvFX1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsJtIRBkr6VS8G1N4/a2PDWcroE2hg1GqknOUh4XP9b7XYvwKZXlCTYOITZRxPGyPgQNQuirvD/yVsao34koOr9kk60Ey94G57PtCWgZtrVuB7bXVL1HL9D/xwRO86QRUwZvPZhDXcY8S0HyYbzJWHP2LczM+lA9ZFlNNbrZ2yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOVJvhLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Agb+poeT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOVJvhLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Agb+poeT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vpAE298526
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuRMSc2rWOzVRyif4RpXwrzheKcxW5gqhQieftfkZaM=; b=JOVJvhLtmpzqeEC0
	u1OSqNbClIwN0YUZ6k8he59Ye4JYjIoz+Slxv0da9QvU8B+MOJ65sBaOpqC//WXh
	+NqmrfjSEMKdAfCNUNZXjN/xoK1Za1K68l/qFJvzDsOyGMinM2rasCsYZK7Z6FJP
	8b6iGHxW7sH+xvI/YkKig10/cSKlYFIrU4xR5XbUe5aEneKU9GtZtyrW6t+r10Pf
	05LEv6zPRRdDHrFvqXJoDY6Y5WK4QhSBTcA1ISs2SggS0+j+it2fk+/0/2VaKwTI
	FJFECPYbLlyh7nNfYFr7vZuiHF3NgjrYEW64KudBrqSzuD76hm0aSBVj3soceSew
	h+zEyg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tnu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c18175fc54so76308eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607092; x=1775211892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuRMSc2rWOzVRyif4RpXwrzheKcxW5gqhQieftfkZaM=;
        b=Agb+poeTYH7Wz7GYf+j0FIRQ1FKKr4rfU/+79m0S6QEhcN+xMhAgOG/XY+Zuosvz5h
         +O8Y+1Q5KplfphKyXwlZnWJEZiibAZGacjd9iOCIbkE6VAAAlB7wea+qi20s8B7wlSQh
         0jKoFcafeGb4KGD+twTA3eZAfjXUR71cXYX4BVZm+M/meUVBu3Q0QBa8PP5pEar7w4hd
         qiA3NxW10MGgcwXVPa41m7qIz82l3sPFbfT6lcvA+55HTWnLRspjP9KGht9I3zBPhlB4
         Ul/YiMUIkwth1Mo/rUdj4bFvsfGlfPEWfpqLqDwOWrW6/TOdKokauZvzwiS5hQxbeC7x
         ilmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607092; x=1775211892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuRMSc2rWOzVRyif4RpXwrzheKcxW5gqhQieftfkZaM=;
        b=r+LQRMcctRQw+ubzTl+RsRU69i8X3N4mmxhnoqAOJ3rqAKjLdARbQMOA0h6mSjLrfV
         PpSWOHBrr37gij8kyLFr7VB1PfCRkHCz/K82GCk4cq3jjJsBmyhFZu7mQ4VhITGsv7A9
         w3lhM5K1LCy6oX4EgJ/+sl1nJFlOD9KzfFkybJ2MbiaJyX8thQeETNLURXFjSEint2KY
         IcGuM/9bEUbTKiLyojkI6M3W4eV1DKXztJA3IZYRp9SHOX7o51WaldOrrxvN2lEOmQjh
         FMELkEVQEmMGZm1omi9ITqFNF5Qylo0D9ZP+P/ru1O3HuwXV8rkZCGmjnp4U32/2fKn2
         88mA==
X-Gm-Message-State: AOJu0Yw2Pwk2Mx9KZmgNrgxpCP64gbz9cL2gtFeiFyXvB0wkGljMuh0Y
	L8yRpOCb+tirUEwUaL1Y+41kH73PjuMK9aT/fygfokXa2873BNsmJXXyOjUMQAK1V06A69MzvNe
	cQsynUZCXMe8bnrYbWE6wqhUezNS2UEtkOPt1LZxyGATIZE8Do82eTNIco1R+Pxs0
X-Gm-Gg: ATEYQzw1bePyvxh3lfdp51bd+p8BVgOTrt3Y0now+LVilVU8njp+bdnoHIMrK0axU3d
	pEU0p4NiK9rNAfA1tG53PJEqBcP70SWNXMMSvl+4iRVUYk2/8YqumDqjfXWM1U/8ZYTYyUMzgoX
	04jFj9khiyLoWhUwdtb90MxuE+cgcrFDSKKODas5VfmI2/BRzLLAeRzh94xhq0MJVRFKr+wLvBV
	P8T3LlYG9ZhPhdLD0l3df5UWYEMmimjZkVZHDK62wVso6EkLyYAPTqraE0Gbr+FWA74TF5TpYQv
	T9UmiyBH/H73gZ+C5fs1/JpygACHPBqzD4ap6SGlIIPUyjX0/lpu9TgSfPHLys69mi1M6urphct
	pss9fmRq3TiMukIfliuBs4pFRnoLUso+/WB8Eubo0vO0G2MXJThLd6LXlRPK0fr8rnpRHUdE=
X-Received: by 2002:a05:7301:129b:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c185f5a3c7mr967860eec.23.1774607091687;
        Fri, 27 Mar 2026 03:24:51 -0700 (PDT)
X-Received: by 2002:a05:7301:129b:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c185f5a3c7mr967848eec.23.1774607091218;
        Fri, 27 Mar 2026 03:24:51 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec495b8sm4756173eec.10.2026.03.27.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:24:50 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 03:24:35 -0700
Subject: [PATCH v4 1/2] dt-bindings: sram: document glymur as compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-glymur-imem-v4-1-8fe0f20ad9fd@oss.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
In-Reply-To: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774607089; l=844;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=QptwI6z3j37hX8AHtjzXh+bGzHbUl/D8vt513nvFX1k=;
 b=r80m35yXtOARStk5G+2g308fz/1+AdRshEcZ/cekacGqc2AUePxK1rINXl2oiHhdrvty46J4M
 dowv+xG3kU2CC5cVEVdoM1uw6BxsieurPoyl8GBTRI5zrBajkgpWfPw
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfXzaa1XudMIvbG
 5CiAgrKgKhwCtXB7UAP9WReHC176nksabJfwA7AEIsQ9RU7SOkaLPfjePgGJbj1nUfsNfbCNtNj
 7Q33xgQynenLu1qufmaP3sd9SY+X40fUGVnM8FsIkf4xU8wNuyScazoa1gunrZpmzTWZceXouGn
 gFwe8UhWwHQHfNi++u/zFA0iJRChSRJabkChhn/xXMCulyoSEgBLRBKFsut+uhFegTqHAH1glyG
 U7DHAfwO39Z5JeuAL6r4ApLqGwCGZlbF3a5LSK2oip/PqH+Pj5+Q50Fkm4HrC3vEqAdtdkI23Y8
 8E3OJM8pK105tm64G7RYmdjccHiHUAaMgiRNg2+dn2aANFoPe7OlBr5V1TVAineg48zvOqLR+Wz
 83uvNh87/juYZdc05pHDEIw3dUz5ZrI7IUYWeMCu87zKqFOkotVmmBFnfCt+R+qBKztV1+DWQDb
 pl1rkFZDj5PRQiUg0/A==
X-Proofpoint-ORIG-GUID: MFFSW4Vr7m7FLJOtED35u12uv-HGuxgd
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c65af4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vpq1ZMNoxu35JrZUYIwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: MFFSW4Vr7m7FLJOtED35u12uv-HGuxgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075

Add compatible for Qualcomm's glymur IMEM, a block of sram which
can fall back to mmio-sram.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..bd62711dc630 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,glymur-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.43.0

