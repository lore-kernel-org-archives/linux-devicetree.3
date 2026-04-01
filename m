Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406A2AEE1
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047693; cv=none; b=Tzv5gX+otjxftQ50dJ24rsnFQUchMV2MkVLtBBRGGXppwOTZX+WRQdVU9Eqc1Hu3fRggFpquPX/ZTuNYRa+dEfBkwuMKs89elLpACm0PIhA/4vuOx5x5HzMaL3vXAzTQju4o2+i3XY9eda/wdEhv4RwFkVEpyu1JzSyJm275les=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047693; c=relaxed/simple;
	bh=CuN7Ga2m8h48uUCYQYe5d+xCakFQ6D+qlF45gutWNU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZAnejhGfW1Kothsq3z+yr8XTuf7+fib7MZmkYuAPUyz1vXEfBCaB/5pNzNleP6x+36ifBNq0nw+UWOi/FOt8sMcWDgIMZ/xX+60jKZ5FktZyPTx0yYF5dan4Sw0bDIhSHYZjocVoCfGFEe0HqLlmJM8NuvQZjhGb+YoIBKCIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpYMs11l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpXVUP1D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpYMs11l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpXVUP1D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319ABpI3174257
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=37d4Ftbfq3heDIcxaZtHZqx7NKWVEylKGmD
	eo+icNTY=; b=QpYMs11laMI31RYpLv2jpCaZVGt/bSV/CtoLtJngR8pAvpJjmsi
	rfEXyYFHlvg+9SlSfKSqSIrmMz7S+cwkSSd6tVpTCs/+l9v2ryKBDxYxEtYdgGiS
	U9eEJcEofgXt1MlVEP1mgc717xnZlJRHitepPXr6ktXVMrKPHUFbZ9SGvW0khAAq
	5zuUKRhaIazL3vqmBdbt1plm7orRbQ6ZfUj30ctLno8he/eHYD/4wWHHaPrAPKst
	8VVDchZuNpTx25f/Yap1gr7JoXzVF/ZG13rftDWjaC874ev/aHKF8BCggziJDuR+
	E9W+FcxSKRoimkCgnqgg5PmbijsYRw6imaA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbgww1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:48:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b6d4337bso1021166a12.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047691; x=1775652491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37d4Ftbfq3heDIcxaZtHZqx7NKWVEylKGmDeo+icNTY=;
        b=TpXVUP1D4csz5TyOEGbV//nWgpGEqczzHxPOsA5E7EqIFaGj16bhALqh56iRYKba2/
         HnrfsOPDYEo3d8nw9nM/6G5iVb1wldHYAjWl3AaygKvtY4YUbrlRmUgT2pgPATTTqH9Y
         Hdx5r+Z/79JB6U6ptW6HwiNmBWb7DZp5oB+MjP7UR5BY7DretSV+u5bH7Gnlfj6B8ORm
         f09azw2ww0aCdG/gvbZ5jZ+osBQ+IeDEz5Hi7GGQ+MKK9d4viTO7NAnuBGsjkOsgmCND
         n4P7i9JFHm395n3ZfiLJd0bSBJS69FvOL9hDcRVXNcu2YmED9zn/qKbzPNmmquB8zei5
         BH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047691; x=1775652491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37d4Ftbfq3heDIcxaZtHZqx7NKWVEylKGmDeo+icNTY=;
        b=MkVykM17Q2o1b4Q6MnoijtVFuj0lFKumwY8N9N98TYzeq7FW6klpQfyf5pii6bofUZ
         6o8++jz3r6I6Z5LyZXQFYH+S6pPrMM7fwUvs5+P0L8PvNJfdWayCBgg2AZllXIUtCvGs
         JVOU5Hres6bx+Tf892fIisuet9uw+vxUpbB03z5iTwXaVPeO1L4Sa0xML7fUvlOMNVxg
         7DapO/q0tvtSbyuhXr+tACYGtoau3+LNpOKU5REa1L7KIuZl7qIzLdGOLgyB+GwG4AfN
         Wsny5zi/oGe/uN6MrMBlPayYKpNE7LQ2c+C2VM+/2dYSizL0y8uBd4YYyRYVbWyI2FeD
         64pA==
X-Forwarded-Encrypted: i=1; AJvYcCWpct4ll2w41+cqVgiqbDxFoo07V9NhCjCiqYWutFWAXtiQGH2l7Ft7/KTvtsDK4c8FZlG33vAz2/dY@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCIEVAezbL9O39usK53plcPBBB177ZlgYtcwt+diDFcy0FGXe
	NXHPInmRbRQ0twdpl0BKTQF2NEJCNTY4LnhSkhnSMWh6SSUKwjO8hukLZxHExgREDawtZwrOPU8
	3SmZzZsIHGlSWNr+BRAigj855WbBM65unnCGvRo7NfDRfyysFfnwrmRk7EOts/KoHRet//nCQ
X-Gm-Gg: ATEYQzyGRvA4/g+q4/sepexGCxSTFUM8iLpLAE6u9zidYPDlyu7a0ITUNOQwYjX+dDJ
	7XLstF15/OPbb3Fgh3Q9zZSU23ZfS5172EF0AQxnIJ2AS8yuKkMtskWwAnyUEfOMi5Ta0SUNgL3
	/5Rl+UgFiORrWf81CJT8zrVeusKdkMHk3vE01WybpAHVN921Dut0PJyz2Izuju4MCdk6hm3ePNo
	3BeF09CT/jgfc38hiICi80AQQvzjcitMkrCwPWGVDtGN9kspO2THmUKOSCSFqMBn5XG935eCeBf
	Qik6u2UIpOGx7aX3OKy4ziPlgkq2BALmLghW9+DewAN5s9uRIV/Ixy29qAFiVLnlqJ7yZJYTlDX
	XoFscTy3cf3xcxTFjGMzZOsK9/FYchaYB30raCnvz5R9OraUC
X-Received: by 2002:a05:6a00:a1b:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-82ce893ed22mr4151776b3a.20.1775047690644;
        Wed, 01 Apr 2026 05:48:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1b:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-82ce893ed22mr4151751b3a.20.1775047690108;
        Wed, 01 Apr 2026 05:48:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc6e9sm15507903b3a.46.2026.04.01.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:48:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Add compatible for Hawi SoC
Date: Wed,  1 Apr 2026 18:17:57 +0530
Message-ID: <20260401124757.592343-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExOCBTYWx0ZWRfX+eucOQfPYiq3
 ww/AqWrAogIO9i24mZhUihaqIOsvasF6fwsCoraKp9kbz+luvpiQipypNTGGoA75gq340ZOkBln
 H/4x4x+OIHC+922sk3O/aJb0MYXJbysm5h9b+iF3fsYTRc3+3UR1aSk1XJhFTYxVyUmaMJX/z1d
 caB7H+wHUdI+9YrMvmAgqDKug+m+94Z4X16ZHfb6OIQhH5aVfLneBG1RtWYZ01JNnhbakKw/ILC
 DE49w/pHUzFaEqNipa9E4250hn5Flm1z0GO4doQZjEyTRpCydZ5Tx83IGx0LOQkxkUQNekRcivF
 5ZwByoHCxCdffmcJJ39cMOd9JNdJWaNaCn8VrQmblydkvhnZkf1zEm9fShTGCamxueU5haM8LEx
 62DeanoZ3TAki5MqsPM7eTHMwq1fLKbR1PHtEdiNnOYJ6lcjCK8rfey/MypBCsFqPcRTq6sy5y7
 jNG500YGt34aIzsfk+Q==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69cd140b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=V65sNsENKvr6zZljLJ4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: eiV5InHQoTGmasZHEOhFvt9sdhBFPlVG
X-Proofpoint-ORIG-GUID: eiV5InHQoTGmasZHEOhFvt9sdhBFPlVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010118

Qualcomm Hawi SoC include apps smmu that implements arm,mmu-500, which
is used to translate device-visible virtual addresses to physical
addresses. Add compatible for these items.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 27d25bc98cbe..06fb5c8e7547 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -93,6 +93,7 @@ properties:
         items:
           - enum:
               - qcom,glymur-smmu-500
+              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
-- 
2.53.0

