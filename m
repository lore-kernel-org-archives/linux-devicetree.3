Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD806378D94
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470861; cv=none; b=ZQ5F2Ke9RYZiO+Q9mWipY/pSZPxh1lfjV0I3vn/Mt9D3AjqXLw+u6GUJscu+KcD6vHs6CszU24fsXtVxhYehKk2tztFEfy5QIGQutfIJvVkM6noudIBD0xyPJxymQ5lkBRoJ0GEoKPJCaWnJkRy78s+mv5/uAC+6rQviK3Lye8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470861; c=relaxed/simple;
	bh=ZtudtnJuX8Faby0VuV52r6celt2UQfjIrIlwr3oabns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qj+4YiudAeUT9qRGgn4b7VIQ+qegQW2W8P2sLQslIqyCIOROkF99WVmpqEpMQTBd7Mu0+tKfmlXFsm+NwBIatsuu60YEkIpMQjRirxyEqmSYAfUHSnYcJ91bCF0DnlV8p36gR/9Zsy5BGGZb84U86wcX8oN6ix8P9YxFQTx7JQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQS1K/L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPV7EVSw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQS1K/L6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPV7EVSw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGFQUQ1816179
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OQen+VoAHis
	aKxiinT3/zd7m47X7BB/wcGnNSYFTrVA=; b=UQS1K/L6dH8o/QuU6jPbVbMeBj6
	UkNoCP3Zy4xXoISy40tP3L0TSMUpC6OovZNHNLOXOg1GdQVrCMvIFJuZUaxkmSV4
	quqzokSeB6ur7hwakWp3wiAhG5aTCXV8/Nwk4kbitK2AscbD4vg2SIkqaX7M+wYI
	N6T2hWtvL0beyBDfgaaLl1BJgUgtz9krUZAnhxESEYnb04GG4EVPqpEp2YrkaxBx
	LcUGTH37/HAFednOVYN1xKIQW6ec8ZAgHJ+4/Qa9WofoF5ryZpP4YGSfVCf8S/ds
	jLn5G51wdSypsW9qg9/DV29tSJxTMs781A7yO97quPwBpomXGvquSCNT49w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm34pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828acf7c1dso11359639a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470858; x=1780075658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQen+VoAHisaKxiinT3/zd7m47X7BB/wcGnNSYFTrVA=;
        b=dPV7EVSwPAjUDGd277CcKJ7opjujfTmUSH72biMak+b0hNW7utLPo+sLjNXzCwxd7h
         Og3adzaT6epNKETTtspdOZIM9H8o3LdSrULWxWspw+HzzSO4t4VaKD6qV/3snImi/LKi
         Z7ntWDqGZehld6t+fcHql4MOuJVOUqqVWTb9JNkJN4T0I7CyRE7gvnaJR6htNF1nvfOF
         sO7XE6ZjqC85kPAxnFYdCHk2if1nOightfkIGUuPF+cNAT86UieCOqFoXWaSkj7H/OuH
         Yw2ynvWjXleYygQnYuBfKB8izaEto0+ZK8qMmTIzAHGBxQRCoisH/TmCMyLinFomWmAc
         PV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470858; x=1780075658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQen+VoAHisaKxiinT3/zd7m47X7BB/wcGnNSYFTrVA=;
        b=OA78+PIEFH1qUnqXB+/JymTRVFaFUXzq39mPp8QojVmgzwEn7wLfZAxq5+n29uhKe6
         mxAr8BFNcvCVeMj5NuvwdwhvxMjArevjAAvM+alTj5JXLU8IUrtihbhCHhPd0r+346ca
         0zG/DItCqt61PVLkNs8b6R1qffi715Kw+RITBCwhxvcXRqNmRpx787uKosQ3GapCFjTb
         05HnDqFjXGpX8rW7TlkifNVx37vam3TwTbAaffBpSqvdikWR78SnYyJ8EnsrCTOQWk6C
         zhy85MIV0G4+HRoe3grJVhGkvG3h+PFLx6ObacBVbFjhwc7bfNmk5ww7zIqzf1lKADjv
         /dGw==
X-Forwarded-Encrypted: i=1; AFNElJ/xnO12/IqGA/v+FCJvY1qIasL6Lpez96lUbiYas7uKDuKV97ybd5mDssnFhSGTriDNb7hR2q8eZMTA@vger.kernel.org
X-Gm-Message-State: AOJu0YxhEmT0Bfyd+o/84cLOv1dN21o4iOPpWjUw07pe2T7jNn41mG7Z
	x+QbhaHU5lTTbZNV7gqevGQdmDX/SMXVV5Xqj02x4g4CmvMcKIBp24QebBMwJ3tcJ3Oml0QOfRy
	qY/7LJoFDpBhzcnwHHpA9B4juplTmsnnbRMhquefiHqtMwNi1z0rN67GZ0Ew49OUa
X-Gm-Gg: Acq92OFQc1n6xOJJ9AjtWMdT5zN0ePCL2KafyL9nB50Oh1Y9vdGg1rMCUogsRLoa49H
	j2JfwoYcEIdG7jg/ud7aXWNVFvSt0nAnCkWJAjjwTd4tW1wEZeWB9I0z39BM3WqbXtvoxDT2TmV
	EcVRCi0DUCdNo0bEEM1Pe9O0qXsYHgQgXy350C0gVSAqJpAJCWkNMZL0OK9fy2QS6lR5evZUaJp
	kJV+2EtKaLhKWSIIJLz43WJ4MLHNeb71yOYmUvs3P8gEqM4HqRw3AbgZILqhPFO2G/Sil6EpDIB
	j8a6pAS0Or3IpCZ1vuW2D9Bu9Uah2Y3dmhmuyfI8RpH7TU4U9axonAYhiQCvF0609F7Z2DRocDW
	uwvYwjEbGViHe7qVSVibkbkX9I4zqbsecZLDM+hKDsD4n3xwRfHdexw==
X-Received: by 2002:a05:6a00:8c04:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-8415f3af2d2mr5234133b3a.6.1779470857800;
        Fri, 22 May 2026 10:27:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c04:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-8415f3af2d2mr5234097b3a.6.1779470857341;
        Fri, 22 May 2026 10:27:37 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm3045693b3a.31.2026.05.22.10.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:27:37 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Fri, 22 May 2026 22:57:14 +0530
Message-Id: <20260522172716.820490-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JNgnZK07-Y8nda93zvu66wEtu02Ug4Gt
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10920a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MMZtLZuhhDi3SW52_uAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NCBTYWx0ZWRfX8G/OWMIKRT7M
 vTA32/bk8IiMDqLpSrs/GpuRjSz+D0kZZ+3r58qjJSh9PEhT3yvWkFAogUYK6SUmy/W3gD8sdvb
 X9rv1U6iLlaIBKmIU4NGUa372GA8NwW0Eu/oTEL+U3uhCOtR+7o7YwXvi3fgaDLMtfacawo92qX
 HUFMl8rNIRXqHuDDmS7QK+0Umzbfls2VdOpWknzhQfEFc9C16ZfB5/qjhJkVOBIXB/nnlHMeSSh
 Hm/3n0t+E0WzKjPojr4a49DgprdoW40NftqHo7EEjabAPuqvNgPrQnzrSHfACF8IeX04/c1R0SZ
 EEWMSw0hyK8Hra7WeFy1TyTsPh0Qqr4trD7vRJpoeTGS0wFkALIFmm+m2pFLeDGy7pRdqWN//nO
 Rd05qQ0wQu0A/3404JBNH23ltKlXsS1lHPQ6/alynP3cu/qgKkO+TFwZC+6f+fbYSoR4LozU/N5
 Q0Sb+EZYaHw2uQOIVwA==
X-Proofpoint-GUID: JNgnZK07-Y8nda93zvu66wEtu02Ug4Gt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220174

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..b75015f3ea70 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
-- 
2.34.1

