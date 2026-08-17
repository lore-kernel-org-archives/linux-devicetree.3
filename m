Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F142EEDD
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979360; cv=none; b=AmKfu3FWfenS1P73N05KqqdD9TMoWmC/nCDw5OC0mh8aeJpVEHMer+7N5m7OhlEg1w+fBs03YCMmGg+Q/UOOr++dKvISaIml8iAcjnzGS0CvBnr6Tdl2UrLK3djjK96m7rMI//lF7YIiw+ppmJrtvSmwJdHydCMoWP50Ul4yjZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979360; c=relaxed/simple;
	bh=W2p1gqkX4AQ8Th8f33I8eROJT74xXZVBij/fNQ25/NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRk0eymYjmAi3N/ikqSYVvgHxYeVERGXnK/l3a0LuYHeebsmNhrHNPXk0YY8IEv9LD7kr0cHZqlJycUgm3M+NNIum7AHWneL2Gq1yw8Bgp6TQKn7ZB4UEuOOUfh4bHmtRSRjmaAwt/CosTXxOVm4kJfG1zkyqCoaHmTc8PJKhg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KP/dYHWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vg933Yyb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KP/dYHWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vg933Yyb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6Dbb1193726
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=; b=KP/dYHWUjbxiPlM4
	CUmlGsaMssJKPghsvUj53+0yMcLKUP2beZV1stc09LTxMBkOXcT4fVqoPaVTmy6/
	Y9NQekE2aWv11tkWFa7pVBtBmzm1+j3iKqoMLLVIjCxQGAoujsa1kFTp2K2+Dk98
	Neucu5ybxJbNBJk3Xq84PB/oto6Ch5c7gkiV0s/PwgVfE7AHenu+iS93uhQywSS5
	Ml9XtSn2zLaREe5SKMiRQQSn3ZE/euZr8I37JFHCGDionQqLDXm+Mr5vwUm5m9JP
	tD0ZCBpFGcyG7T/Bmqr+ZIUKvsAfjtJBAHXHaMdWzWCz9spOx5Bpo4WnrZsR8J1V
	admU9w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1wfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:16 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66c70cfe719so5417864d50.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786979356; x=1787584156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=Vg933YybH5vgb+ISGKDYn7RtwvI52U1MVn2vgQRkcyBuG55yyyWzaNvKRySVuBpe9F
         WRiBeqIFiUourhjyP8FFu84pZZMpFLEYdBFp3bJrYgudcsRlfTGdk3y6/aoCB5MTxvII
         xJEVOhjWo8mjo8EwUN+RS+zFHZf6mdj79xC69IrW8zXRFqIKOjYqd1Tp6g4iY0kwgd3c
         Ok7iDtmBSL1mu6ISG4kC3gmWyExahJwtwXzf4BySvhlX04Ac+eJT7dt6/durFXn6tdFi
         6xsRr0ANgNBbYoiuYC3MChX1m2PWF0qoh58OgcSvugSgFsw6TtN/eAtuhbuNt2AWjdM7
         +vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979356; x=1787584156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=AkTgX5NNsurEqJed/e5+tZGxp/13p7ZqAJtGUYCm3/RzIxDBNTCvV6+LTgGmvA9vvh
         yGlC6MglGGeW+EKDcGAwt+S9Z3ZjVb6my/bKzP6AJpWNbzH0tHtGfbZh3o/cETZRIO57
         hNxDTPXtTPodTWMGet7SB90oOxxMLH9goR+bKDw97KDMWR+PFGfUEngJFX8D3Ns8JaU4
         yqle5UvOORc3F/6gF5eaUIkBn8gKuR0F6hfEBmxiHQW4jkw1Om/ldtSW1O7WLAFGkX+Q
         736IjdU0/5fMG1JAKoOt9Bd9+lpJFI4JEYqS33Mjr6wbq+yXQ4g2dqCZmFId1uyx9X12
         TAYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpejOx0a7S6vzqh9lEJu2nB0FQ1qz0vpjViNbwv7idShhrEZ2iDinKKJPtP2y7Sbz4prOk7gAgPABsY@vger.kernel.org
X-Gm-Message-State: AOJu0YxwqOXr3svLxP4Zb6N7p0VvUcS8+PxGZMPcRgz0nrRwITJVxZ5J
	lZQ4JLFympWVg6O8Ixj7MLSrCNh8fryCu+mCYQAvBi/2leypYWGqBIF2D1gc4OWehjMammrKUPZ
	tLMIUrjHXIKnNot+lEYJbkjPYgfixA+MFpBJK5qEm7o9HotuKJTcmK+EX4hrPUg9H
X-Gm-Gg: AR+sD1042Z4dXy1ONLaABEqAdySWCmyKD/zdGgmyud2KpheCfdFjY/SDNXaid6KZlE4
	gVALHDKJtUR5VwPe1qJN35sbG+3jvQ2GBf289/GUBv6I9IjhXGDedAfcQJRkkSXpowHrkciIItB
	l6tnWzCiFL6talmD4kdCV43RxsvPg1PCWo0fJFmn27YVEX2oDxxs9EvOJ8SYIxQputoJeJppNrn
	MSPqRV9JZjLot6We/GhS3LrqRcW2iEYF+avmBWP1MFnoNpgNuDNcG2BKh+tI5RdkZJu0CYjULg0
	XKGfG+sX7jiu634WT+F3FhLoiC9CYgTL4Xl/xuSt2yh1gOhhue4Wy+Yg94yS1MYKcUljNev+gzO
	ptYHOJmLQV+oI1ud7ou9ZLrddiBOv4EKSLQt19swoquUlRXhq+w==
X-Received: by 2002:a05:690e:1244:b0:66c:4b0c:3cad with SMTP id 956f58d0204a3-66c72e9edd0mr8210315d50.53.1786979355935;
        Mon, 17 Aug 2026 08:09:15 -0700 (PDT)
X-Received: by 2002:a05:690e:1244:b0:66c:4b0c:3cad with SMTP id 956f58d0204a3-66c72e9edd0mr8210296d50.53.1786979355549;
        Mon, 17 Aug 2026 08:09:15 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:2c9c:bdd5:b705:b119])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cb3d377bbsm938108d50.0.2026.08.17.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:09:14 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 08:09:09 -0700
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-glymur-send-v4-1-3fb89cec703e@oss.qualcomm.com>
References: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
In-Reply-To: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfX6EIuhjdR1Zpw
 mLXdNMk+N51ZkJ4ick4FxthwVeRRZGhp/SgIrEVq/ZXxEDUsGv4PDrE3TxRW0VcL1i/IM6OcNNY
 KusAfUu3xOgnDNd5rQcGs5cqzwgxcIT2q8hX9InHHHHGKZQ4m5H3qvLRN9ejgzw9i+30/IYpsMe
 RWJHMETBBBbqaQiHTBo7yK2K3wOy+BB9j8I8uOSlnwrZ9lPVQHIJuNrXSNwOYcIbvUvMs0JJpUc
 G4lv58WrxK6k5pmR1TXxPfXMjZ2mk2Mv87uOwQ0nFylX3q82R70o74VxylGA7txD6h7HXGoHH/O
 F3XlM914cfa/0qOWy6oawraksLdBUyE4OA04sucpL+43UOMQtR4fWfqYABdwdepPRLKUay09XZA
 L1orj5B4vpuk0nDAdj8mpwmav3QIfK/btFZfJkgvXhEfC4VQE7aq6bRpSkwyLEerkxOzlRVYuFQ
 w4TbqRsUS9ywaYDhLHA==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a83241c cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: p1XDbzAM_H0LBWfhYe1rBpfCcym2_pmT
X-Proofpoint-GUID: p1XDbzAM_H0LBWfhYe1rBpfCcym2_pmT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfXzQINYzF92SOq
 fo2T+aKXOOU7YIY/+vkR3G7ingMeiWb1NNkcGY846n4Kq8xQUxqHZmA+xVtm9tSjuo+SGKuil4t
 R03b1IKh4jOoA07OMu/E5sULGOao4uE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170116

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d141872c2b28 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1

