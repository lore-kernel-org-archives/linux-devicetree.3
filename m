Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0D2FF15B
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709373; cv=none; b=ggBr1R5D65iNHAnTJVn1/ppi4oBFoZpkiunrEtYTBu3eCr7Mzn2UB2AF+50+gmYkD1eAIY66pIug1VWoMHrh6vxE2vQovEvCSftS+rr+z1UqKmaejHSrFA9N8jwTDGSBA1XpMP0gDWto7eI2hTDF1n7NEl7Lx5emfCAELYmIl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709373; c=relaxed/simple;
	bh=7MlmLv3VO8vqh/hM90ukRRnh4oXqp6UM51hzXjr3aTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pDWlloa8SnBgpHrT5omTBUzyUUss56gra37LvYWRNrH6aHsRUmVGGgZbVGBdyYJ5EGBCDZqd9ToTB7cAx2PvEMu+CGSvP/bVYd9GP4+2+VYD2TkCGLYtAR8h/JwXklxcEbjVgbYpC8zvxPod32V75F/mHp21fFTmrpm8dyTQIB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AciaaipY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3szIjtp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AciaaipY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3szIjtp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEMiTr4074492
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eKoKAFsy7dxgnKK1cXgVyulJwzqXr+KCrz7
	ePatpqes=; b=AciaaipYs4qujRKmsL3jb4xgdH0SE3J/2Ha1vcEvYnw1GVvR2BW
	nnRWJU2dFUXivB7KYgqkUjrm9UGEfKU/zKVV9MldMMdQ9VNp1hlt16ug/Dm9n5Zw
	Epw7BeYipcbnDO+cO2eg6WXek85ZSv9VQs2wIbA4XUB/zSPZKVLFER1ESssGspBw
	1M0Gj0X1I8tIpOHpRGJOn2EeHNoBrCI9Tw2Xmg0nSHL89a6pfHfps0CGhsyC8Nzg
	9v9MehuWo5s/S9KzLFiXn2A+/hP4xPk9A2bmc0CHZFhyt6IfBevefWe5Peg/RIcc
	I1mMOMf4BeDAywIc0YWLfyMW3p5LUS9Ktkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vga89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:16:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c89e480easo1349253a91.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781709370; x=1782314170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKoKAFsy7dxgnKK1cXgVyulJwzqXr+KCrz7ePatpqes=;
        b=Q3szIjtpHkPTf1Do2hhhu5+vxGf30H9LsfQ11Dm+9i1PpNfJfXFDxWKxju2r4y4EDI
         7rhLJPDvkBVotARKZGEabxK0XyWFEKWUcksRPjFM9YuqX41CVXKGdA5RG+7pqTCugHdf
         UzYyc8/vRhaAZkfw+p7i5fXNa5X8oxKHcmPEv6DdOMO1Y6lghSYc9sSHxK95fzmCK72c
         u8efH78RwgqmlB+1Gu1LGx18npf26SxgTFLeUzxYuoUdbs5xB5MeYZeTvEFsRM3Jfr00
         L71iRiQDrf19oMOalO6kGTf8CEIIiSl3f+Qbn2VrqAYDbzVH98CBb+nQI8u2bO6UZvmc
         mdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709370; x=1782314170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKoKAFsy7dxgnKK1cXgVyulJwzqXr+KCrz7ePatpqes=;
        b=Kg/FUMLsD2nbjrE9EMumGAJEEOC5fGPNovmYGRLjD1dHGYzp/hrwaaTMzsU/Gze4Al
         aUjQHpyu1Y9N9wJA3+dwHRK3DMCNO+bzpqlWdavdAIMdYsvxQHxyq08QKUOziqE4W8A9
         v8m8pdK/KByCBtgIN4K+CNsDmRQmpUbPqOuk+1yzIn8ALf87JaWiF9DkJ51sDWLxs2XZ
         +NJPY/JIxWhTm72YZU9/X9PrHEV2k4eHGh18Uv5AYKVJQgzkNjO4x7xc1/P6fpRPARJl
         FQhAzvgvKTO8NJiyIQ8pVEqDmDfPKM7K3fvNHU0r5qAfuxWTSSmqv6+M2A49wTTCPHs/
         wi0A==
X-Forwarded-Encrypted: i=1; AFNElJ/5F3ql289StnqxFhJ4ejpI6Flls7qkkJcT5R+34jzanaRrknGW9gd/owaCvomqetW6x+9iWiEp6sPY@vger.kernel.org
X-Gm-Message-State: AOJu0YxsM2mEkDuu8GRv+TO206fSBqqBwgvz28beZUFg/2bia8FqEswK
	FS9KYkkS+9qMlX7TRemHbc9Ngp6705RQvLLmw7UFfCcmHkwrnQ0muZvxf/CnbtIYWbdmsmvxc/7
	89569ffzq9vnFlk6thhhli7UR/BDPpmPbpxn68NW1D+dNHGSxwJgDkiJHtk2wblQtpZXOGTVl
X-Gm-Gg: AfdE7cm1V5wh9DMJnClYVeDgYDNaKLYdaScT1vPrycmNuQ1Icb7eBM2d1spCfB9tM9s
	XF5TgrhH0OsMpjdn9BWOl8VPFrCRu4lmp6lVRLfzL9OItxLJyGr4SYlLpdK+JQbELjgunO1VKC7
	YJuTbnbpIdRm4m3ADxthakFaNT8ZVntcpHyD1s754vIippaceHS/sJiXvsAA/7dct0tWvNBHAz3
	6wYWHA9tTGlwW8n39mvyOMedPpP3IFDzUdDtBW0z2xYnA+B/w/K6dp1zF6YcLDukJwlJk0WRr7x
	V0vbljh8G6F//zJ9Uv2FvZEgidwIkZOwXAPw4TXTnPLHEchLMMyajJa/LCSx3ksZFtaGE14YUQ0
	RpuLAm5CNKbUOd9cxu/EwNEbQueBEZo17OsBaeg==
X-Received: by 2002:a17:90b:3e86:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-37c936bb27cmr4522839a91.14.1781709369404;
        Wed, 17 Jun 2026 08:16:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3e86:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-37c936bb27cmr4522792a91.14.1781709368801;
        Wed, 17 Jun 2026 08:16:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521a959bsm6533307a91.2.2026.06.17.08.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:16:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm: qcom: Document Hawi SoC and its reference boards
Date: Wed, 17 Jun 2026 20:46:02 +0530
Message-ID: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WE0rnjrUhY_JCPp2d7FwCKuJaugs6J4L
X-Proofpoint-GUID: WE0rnjrUhY_JCPp2d7FwCKuJaugs6J4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE0NiBTYWx0ZWRfX8oyPjPsX1yNM
 /i8mdQBUsMgCKrgP/UO0AzBn44f+pFeakluMdXq8NZkimoE3942gTwkV5HkYqOJ0BwEuqAwnafd
 cnfNksVakvFOI+ykLXx/ML9FX+q4Wkrli+QbVLSiX0aaiSK19eBgUzSW657YacJ8fwQyltp8zSG
 kUEsAdphJnhUu6GHDt8Zazb+grfdce4oTuBEsorLtQ0ucC2hkbE7rvDDX5mlC6D3aG6+yk3pBht
 p7VxURkhu6tjtELJW6FkTRJEolV8hqYZ3hlCKVIgm8zCD001JSEZs9/b5QB6VdlAsg24/U4HmsE
 U3z7n0HjsOyAukK68b1D5hxP2dtHC22CbGnDn4LjE5PQYiQq2HJfpehc1t4ykmrIWSfcabJFohq
 jq/74O/vBDujG6zEsk4557YcSoItP6kJA3m/o8rxYm6hMpwI2fI24n6nV2vlxNGzMtE0RN3fzSm
 il5tmrvBcz+W+hViHMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE0NiBTYWx0ZWRfX0MaAU7UR2TKN
 h+ztDSo9cqzQ63qLMAdjjaJhTF63u3SHyjYACPCHIpdnvkW35N3Jb9dOLc12090VommWGymhgqS
 F+AQ3dksWjtowWGYLDeOcBZykPXjs3E=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a32ba3a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wnZTGxadBF8afskeHx0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170146

Add Hawi SoC and its reference boards to the Qualcomm binding.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com/
 -  Fixed the position of the Documentation.
 -  Corrected the commit text.

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..e229c0097e6f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -303,6 +303,11 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,hawi-mtp
+          - const: qcom,hawi
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.53.0

