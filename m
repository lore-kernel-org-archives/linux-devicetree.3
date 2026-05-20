Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9817037AA8B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262503; cv=none; b=Kuk274USOO8fTPYkDCyU+2i9YQhRh4PmAFsFCa/tQ4yzsOMFYCfpm7T+uW1v3j/W4+cHBfO8u4ALM8as008ppViKl0TP6oeFW/zBgY9AMj/sOvSlHpQXfV+eHjNtGExukqbL1NNbmM9hUfqJOLixutpn8vnHNnmGM/2Eu9z6eQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262503; c=relaxed/simple;
	bh=AEfgsGvi9yL+G2ODkhDfRy3sTJPqdtst+OKv5XnT3BM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hhim5UrYpC2RLgEdX8XtWur81bypLKtcrceM1PuO9GCas6Nr4yV7+E8dt0QPprj7otZDKoSPaN0GyU4BC8ssL5y1LjWPEjM7tvcYRZJmOhQy69gRkhkdwU/pm9TNLRzEogQf6KHEXg+kfA7oRkCtYm7xpUcwTNsvvOHae0rVpRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EM1GfqNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+QczVU9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EM1GfqNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+QczVU9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6Sxw42984422
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AvYd5tbvhBUHZMwEcf9N1zyeQ7mj2VpD36m
	kIvdywsA=; b=EM1GfqNloprxHWcEUMGvA3c/hj29XVH+CA1K5gPn+AxZGUJe8Nf
	8vltS7Jl0wTQkIdMzbZO1vC6s4TlYoFOZ31ksCgGvyPA1TF9zMtKTgSvryjdCSbh
	UXcapC8jeYwlo4YAcCJnVZUgF57XGij+oZ253fM9ilHPROt2mLO0g/bkbaDZOV+s
	gSEPOSOao94eE12k5i1rEbxpcmcL7EUCooMxs4Na1JlDR9Jl6Y69Hj2qDR9SoO4J
	+4zxciTfnAaL15ZyCYdMyKicXauXaEJx+6frHvHY1v4QifYIzDsL3FEoDAd+gN8r
	kz9HZpA9FS7zNECuDvPuhrybNLU27ylZmBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3ndt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:34:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba838d3fa4so44060385ad.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779262495; x=1779867295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AvYd5tbvhBUHZMwEcf9N1zyeQ7mj2VpD36mkIvdywsA=;
        b=D+QczVU9RSKDbSKmRpDxXfW3Om+ZGB0OqMJX/YV04plMpa0rb4eHgCrU/ZbgDiMD7U
         TZB9TQbEx8V2Mz+hMF0DyZJ+ex7IXd2i7O6aIOpbzziKn6rs3IKQQHk8E6nrviGl2j55
         eO8qyuAe95TVrtIwQ2A+wEEf7gZLCqu1GqMSLxOSyEaSaJwZjR+cZ3+AOcmXU0joe9IW
         EBKPo0RAZp4mv+5Cu6a8x6smSK4pv8Iql1PBBBD7C8AciDtEeFZDue3NK3ZFVLtjgozq
         4DltHd7Xk5dlgFpM602TV4z+Lvl/rYcnn4D7u1o1UfqBDWzpC3ofwOU+ruLynLY0xUjI
         F0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262495; x=1779867295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvYd5tbvhBUHZMwEcf9N1zyeQ7mj2VpD36mkIvdywsA=;
        b=gkAOOkJ5YWZ4Z9wb/j9rt8fVldaVUhxcAQ9p/xL/6fikYt7xjAmGBihambfGMqO0SA
         fWU4RfXITDOKhfR13SO0X3vMpp5REeVnON1SLXo7YjczLCjPP4/bVA+K53dvIByhpLUR
         CnspITBZL/S6bh8HsmVKyjFKQVWhu7tXogSYXWTR5iyHds4ZuVUh5eV9v0pxIflmO+/1
         Lket8y96us4Q0oxqEq6vKhfkY9zv8kpG/LmQYE9AWIUv7SZ7UNvJAJOIX4WCR+l/SIPL
         N4u451RzSluNQ0x3TXcG+jJHBM+E/U7BNrAUVIR0bS3xpfXn3FiWoIF6D+A6qF4QJJQV
         s8Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+/gXhOZhrlsDW8amaSGyRb+vzo75vocu7KUGLHoSRqmrdQRJOZHBjMVU/dvndqGhYdoGjDONaTuRG+@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWzlMufnDZhs7TjKDmJvxs5+NMbTOUxjTQ/S+GsibhA098ThD
	gXP7mZTVrTExCsg60I3rIYFwXZAs8T8e7QSMQz7Y1IjbcMfiZBdla8EW4kjQCXSjFDd5RqWMN+V
	HwUIlfCOY8rhMG/kExjZGLnHvQtUYY64JXjrJnImhiVArpqM4XVmmYpc0VhOjE0pK
X-Gm-Gg: Acq92OFQhhIjanPiQEqrJnfKhMqcrfs1rutzrE4W983UjgSKmHrIRqmlpulkFdAWt+q
	wGQ6A9M8Up9nCB9PUsbEb1xOYbFIG99pkrx7RUO3s++mjl52WHcEvwJrMyz9T3kHkWEKsza0Mdf
	lppyMfnUDZF1jL3Hi77MkrqXjxbg6pzJ4SyiRsZrkZ1FYTC2TDULq9jEOxgZhYcD/JxvBnAbC66
	CqNT68IXvpvvkStP4xjLO06vGWGPVvFoy29t1jXQwSLFg0xn+VLQ2DloE1JrU5ENGKdTkUxIO4N
	AVdp3PpNe7O/P/JomQaVsTBq5AJlaOvuGJLBCM7i5RTlkulnbDh4Sk8mwiIQQRE6JPW3YFnYZsU
	68ooFo49JZlNPQpt0Q/wfvkytrYIPmp6vVhlGxlQJxi1t6LQh
X-Received: by 2002:a17:903:1a8f:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2bd7e85fce5mr245718955ad.6.1779262495335;
        Wed, 20 May 2026 00:34:55 -0700 (PDT)
X-Received: by 2002:a17:903:1a8f:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2bd7e85fce5mr245718585ad.6.1779262494646;
        Wed, 20 May 2026 00:34:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49c9sm213562825ad.49.2026.05.20.00.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:34:54 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: arm-smmu: qcom: Constrain clocks for Hawi SoC
Date: Wed, 20 May 2026 13:04:47 +0530
Message-ID: <20260520073447.2138384-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d6420 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xU9kCb1ocPNtrCwW_qAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XRZuo6GE-OmqNmA5H940VuyyXAZFX_Mn
X-Proofpoint-GUID: XRZuo6GE-OmqNmA5H940VuyyXAZFX_Mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3MSBTYWx0ZWRfX3wMjF9+1WHu2
 tfA14CbCYbf4Kdc+NOJHgCCkWuTysH9YcioCK8Qz4NpDXqYEfNhjEy4APzavMCNFIgg9F1tTaxu
 MlY5qWNmTkxWqxyjx3OKsBYVcz7/1Ho7ki3EV/181BU16unelrGf6g9btkEk245UxS5Oz/xgoH7
 iWiB/4V9IPMlZ4ezJSYHdUtzcCW0XJXPgemKVeh4+T07EjNlnGTYn+wIXFDMskeMY/7afVIzftY
 rQRfhNKpELSC8QPl1u4g5RuqWRKDUHjq15FSDK/D6sn4zjAtwHVLhWgnhaeRKLyLOX9mnna9Uzw
 stWuXf/g0ec9Z/i8qhjiuWcRLpEg+HyI092Tw3Njt+krgWWoVcoxpJE6eh8H0YwPeCiG06yJdtc
 9XWSywaVm5fc09DGT3XiJMCcnPEI/HxUVCWWb5mUl038v7VjQ9lquM/dbS3TdREgDIlI047OC9F
 zKIbO6E2K9FZXPg8c9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200071

The Hawi SoC has two SMMU instances with different clock requirements.
The Adreno GPU SMMU uses the qcom,adreno-smmu fallback and requires a
single HLOS vote clock, matching the pattern already established for
Glymur and SM8750. The Application Processor SMMU (APSS) uses the
qcom,smmu-500 fallback and has no controllable clocks.

Add qcom,hawi-smmu-500 to the single-clock constraint block for the
Adreno GPU SMMU and to the no-clocks constraint block for the APSS SMMU,
following the pattern how it is done for other SoCs.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
This patch is on based on  arm/smmu/bindings branch here in
https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 25fd3efa2420..e413564ce55d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -570,6 +570,7 @@ allOf:
           items:
             - enum:
                 - qcom,glymur-smmu-500
+                - qcom,hawi-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
@@ -616,6 +617,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
                 - qcom,milos-smmu-500
                 - qcom,qcs615-smmu-500
-- 
2.53.0

