Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7836A36C
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239313; cv=none; b=armeDgpvKOGp/BiiUkhxDf+zVpC/oh+2hCsa/lsD9HT7v4FxZ0zUs8Ob12CehrF0xwN8DwS6PF2l5ktzvHZ80aNi+xDrOhyMgcXsplrOluXSi+MUBv4Xlu4dD8GIxqAzsOGwFhKGUd4EJwwFlcfYS9VF5fFw8yCQQd6a/esDIiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239313; c=relaxed/simple;
	bh=LaExk5CcIsnQobdkf+tB0TGQXJcIbfm+LHR//18ybOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPnnTIb3TaYcyQO3PDh9bN9G1nXsUWBtL7VjMFvSChg+0euA7sBAFrJySFDjZyziSSMS1tioMyMsrBRs6xsjNNvy3egZlOlxLfxkC4Hq7Tb7YCM001uZJRW8w7S/OJPTAyTIkPK5XnIrmW34sI4BNTcKGX0Fz6VY4659lDlpyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvAciPTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpBarQ31; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvAciPTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpBarQ31"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655ebKD889390
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=; b=KvAciPTo2opHuKFN
	hIdWUJNugTqAmpZnAo3usxfYZVs/0s23fjArjmpVvW9KWQAS+qXw6UxcUIinpVVL
	du5M7pS9upROlpHBDsp6SOwIRLMw525dbjpGq76d9GLofEEAT1a5IPL1r0I+duQV
	Qxq+jSCOg3Z2SPd+poj7m2ZD4Sbhcd8OlKWfXpU6p5nkcsHgrOk3S1QQSrUk84LB
	qmfTZJHNBaZlxPCa0y0WkBFW5RrTJTpfc1gMjSyZEscAsF9PwfeEK2I5I6t8rU1A
	ckuuruQOHoKwR1uiuiEnp0dX8rReYP1ctx0kxpm8CS2newYWi2m1RMGpQYgJvRTe
	XOisJg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4stet2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:15:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca5d2474c7so46342255ad.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239310; x=1783844110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=;
        b=MpBarQ31nY345uAOcm81RYU7PB+Evielq10gDOhbALp853Zhrd2Qd+2XbkY2nf7oiq
         Dqlo/8WtxM4crmkFZKmBcTHjfTTkYxZZRJAHXbeh2ICb6HR9hiNEh/PQqc6vQOLvhzXp
         HLPKDrrjMmp3kQrJFfiP9OlTUPYj7uRrqKL6TfGZ4EVXKoOvyU/GyFESBNtmk+5qUFQZ
         LikhFo1BS4cetDjrcM02bEIBpD6IFUsHwGjKVtRwxiE2pIJwArFGQx64/od8XVD4dVXl
         9CXHNYn4QehufWRSOun82ffU443KuqWsREoHa+foPIMbRHCYEeELXUVBULo/aY4whyp3
         TKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239310; x=1783844110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=;
        b=luQE4cVluUzAFY22kItjCAAWcNkceaedl1mIOZGBppugIo6QP5u1yesRbpdalGhKb3
         LdCDbGmweW1qLLnJJdDJ3POzviKVpgz34JkykH9D5Bdf3JOsA4djJRcyR7oTSIZly+ce
         esA3GY23stb3jmoB3kYaLNwSDJpsJt0+sWKyXTzGmGjZc9IVkujyDEEYWRR9nANS/6/b
         80hMBdeEFMzldb43NK7xR9GvJjUM2a6pqcxCy6Ti4kMkuVZ6Tqu+xyXe38qVY4O4Be4F
         EJDdsALLRLgEvU5xeKn7Bb5IvMN4Q6BmIHUdPrShr+W9UwIHHOOErleIJTBt/feSNzLB
         Wd3g==
X-Forwarded-Encrypted: i=1; AHgh+RrxE7vzJgiqF1nvFUkrllPOMe8LR9LeiGSrLgsxujnEmZeJFVukVdEjnqge1xud8ctOS3uXvdW1a2Wt@vger.kernel.org
X-Gm-Message-State: AOJu0Yznlaprtl6Zsy19luwI6d9zsDOTEK9P0RFGWvoonj0sq4JDgge7
	ZhKdN+lINWt4oxHy2kGwTszT+8LzBMo8t3Bm1g83/HoOd6faFZ/WEnoakGpW+5ISb3DpTuKTeoM
	Zex48Cvvgi6HlvL1YtO5cPpcUvcldUO40DEkPMEyQJPvTlSCQCH5qnWis+DOrhHCQ
X-Gm-Gg: AfdE7cm+O1Gwmb/G4h+OyE+SXFAw0OBLoaSpdg5SzZUsbjjRRLHwp9Ih/j5J4idaDtb
	ggAkETMz8j6fWvYV/SfHYiK+L5V27Pd/0DlgIDKh3uE6uKDTIWE77WNoTNaZ/1/1PMUbUTJG5XM
	YzxOFbUzA7uldh/Y0wcoZlLEiqaqmKVbKXrOPJUK0WVJ0RuUfPBK1JrQMBEGseYKbiyicjXsXbJ
	dhWyNPBKrfvM2/cZ+CCNsaucSw3VXFusAa0uNaLsICZMk8ogm5PCkpoI3ZrMVntIwe1dCzkiy6M
	84W/VTvAWT/E0LSJ1d1N7PwRUpLaPE/Ki4JQV9UNHE+L87yaEeNaQjRuIbQ+wJpowDKOEFNYJrO
	5x/vvjn7KgGVVmnfVPtXcrmuTnbTgawJcnxk=
X-Received: by 2002:a17:903:94d:b0:2ca:ca48:c380 with SMTP id d9443c01a7336-2cbb9f17242mr60484105ad.47.1783239309936;
        Sun, 05 Jul 2026 01:15:09 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2ca:ca48:c380 with SMTP id d9443c01a7336-2cbb9f17242mr60483705ad.47.1783239309320;
        Sun, 05 Jul 2026 01:15:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:19 +0530
Subject: [PATCH 4/8] dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-4-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1118;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LaExk5CcIsnQobdkf+tB0TGQXJcIbfm+LHR//18ybOQ=;
 b=VCe5OcUC+YrAxAUSyCuNQqTb0M7+on6Cxws1+B96zvqSXIOvBEXu8K5mbkAmqcoJ/obMc4EbB
 40gj+Ln37yCAo6AFTXP4OAT10Srm2ogRfoYXQqUulwYf1GqRudc9cNY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX0ExkQqq9LzTw
 l3e3jO7YnbSiL0AZ7HTGARKvY22QTrIbani2UWYa9MIo1g3+kd2GPbfNDZHKKt17hD93D6nLA0G
 pwvZeixWkDGmIT5fvNWPWCb5taTI6tY=
X-Proofpoint-ORIG-GUID: LwRPyiPUfYzwA2lZ--b1j64ZjEotV1WU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX+Q8E6FBvwBsk
 zSpZzpm1c+RnRY0uuDOdewkglAdPIquVzuVQduQgZyPeubnUOK/8kNdsFnrGLz0GK/Vfb0k/fxH
 Cho+3t1ocBoSG3xFEfp8J1T4KVV8FG+r6Gtd71WC/SDCTT6eUXyI7CTVt/hkgN70TGniG5CHvb6
 H9WN57wKxBc0LyREr5ntekXPXbTQXNugeAJLSg6vzkJWhViIik6GIcP3boujxHG0kplSrtu4syf
 LPJ9WnBLKv6hMwT8YtHGdPlzGaloxTeqcVNSnahjrN7/2yH/JRXgrYW5FwG44SkKlYiFDsabykW
 9BfhnlPayouzqC3Jzd6EQJzHd8xzJRkPtyL9wmlA0psT6y/2edDY+wqBmtIN7ZcnmaPcb4Ce2bB
 kAB9SVdecD1akhp1p/ptREj9gJo1uvUK0jrJBRkgnftqvzII3U40H9nXabcZ1lXP33x0zYLchr0
 XhTACO02CN6fcIR7GlQ==
X-Proofpoint-GUID: LwRPyiPUfYzwA2lZ--b1j64ZjEotV1WU
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4a128e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ed556683817c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -95,6 +95,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
@@ -570,6 +571,7 @@ allOf:
         compatible:
           items:
             - enum:
+                - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.54.0

