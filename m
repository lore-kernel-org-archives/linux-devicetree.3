Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615A2E2DDD
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779154803; cv=none; b=pPw1ZYlec0dlZT+NVcSOQTmrZiOi6TokxyRuVxACCf4NOai0Es8vDxDTcDlwrUOvfgPN4X43fFIVJ3UrrEgoo1YG1imEOSSqZFTbsVEIbnQoNZLzJ/6z9liJquzhAumeXUpGVVZe44koQ0Xc6HEyrP2z4W2ayJpg5CH6b6HXc4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779154803; c=relaxed/simple;
	bh=rdqFFX8N+4qr/XgMumEnNZhfJ/InPl8ppDP+C1Ieuvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u8mAGkmfpfWnRRPUiR5gakxu44qySRVucjKbO9Pl1/IPiGsJZWIjKndt/AdXuNIS51y7RqzB2LgbE0MNQWGQvNl5lDgpMGe6bU+GFtPRSlWOOtcCBDiYsl6hL1QPbsbwJvte2V9DNLL6tmA37cv0PXcbDue4mJRlBjCrd/48ZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVx2smja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ve36Kf8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVx2smja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ve36Kf8w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IKHeuR2437955
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wgPypg1Qf/Pou8SVUQCZbAHgIOaAO16+RxG
	yCR2OXIA=; b=OVx2smjaYnOQgXZDJVqY3gog5aN4oKOT/P3NZ4i5kmG+yrSEIKw
	C1UGikQzvCl5CeAUqwkz1IaC0owy0vD83o0wHXDMEYQm+sgBdBFvxqBmtMJl9mlT
	VvIEf0dF262ht3pMy67d3J1Yyjuy0Tjh5BRHiRRBdDG46er01ObB42y7pbQDan+h
	P0+RY7+hVWRWTq38UuKAKgh7iNF4/OlB/+UzK+zp8BuPoZPnL2uqjZ4fFrfcY35L
	0KYHCc/Bm7qKSo8gtX5aCdWt3HgH7VbcGCAJRpm8fHBOhWsp492eB+M0e93MvX/h
	fSGBMLk9owMiHt+VIgDwqYOtI2RtjHIU07A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v2h5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:39:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so4147486eec.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 18:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779154799; x=1779759599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wgPypg1Qf/Pou8SVUQCZbAHgIOaAO16+RxGyCR2OXIA=;
        b=Ve36Kf8wNAZJkem839uBe2n9VGunnMp5nM4laAp/3EE7Ts7qqmnnGvAPZ3dpqrXA/I
         YNFAPVEBUIoDHg8Ju1Law0mDEHy+ZCCD0pUjMtVQxpArDW4wGb/RUblpFuH2q8qMC2wt
         DoSbLm2T/SdAqxD/7r1ahFps6I7prhVXp3q6NwaCBHd+4BMfRfhNk5uAeKEXmXT5zG9g
         59OwHYIzQ9n8dSlQzwwIqHg624TxiHnMtrPd51guqPJCkY2ciOWsN0t/uVY9mmSjInXJ
         b5v7ekeeVp7PaYZT8+7mth4r0YVBLJ6ZZxPmRc0abPKQc9xTRFbCgKhIuyTTdGjHE0xA
         XvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779154799; x=1779759599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgPypg1Qf/Pou8SVUQCZbAHgIOaAO16+RxGyCR2OXIA=;
        b=HJ1Su6HQlmfgf72e4V/FO/P4OKqCLLXciNtZwKdU89UV4nS2aoeErDJVtRrUl3ljnY
         y8OD5j9OGH5hRJ/tP+pvIVcX5baUl8ogWtg+6jeOSweDXfIBVTMrQ3WHsx6210CbqF1M
         JLX4UQSwR+7qN2HtoVeVX+Kaczwb62KkgsCtasmNwqlTM2GO2RLwTwB6tEEJd/bgh7b3
         WHNYG9ZfnlO0mU7b3H+TGlYp9tP0rFQvpLdx787tnrT3bSR4co8ZL1B7ItHWOAHWQWai
         BTvE1jbcZhUzjJl4IOfcsoFaHzsHUWekYkh3kPo+FlG9SEb4GD8O29v9+EI2xnWCq66u
         Arug==
X-Forwarded-Encrypted: i=1; AFNElJ/BHopS0ahXVrGiYd9jNEIuhcVH1mdlizXEkDJXTZw+QbsxQ/jw1J3Unu/iFrHwHcqgqDiN9hV4eq4c@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGGufjLAurtmf11OYlc/saeOZz6IydloyHq2SwJcQbsZr5XOm
	exZEPK0vCJULkxGa9xoXlFrZ76jVH1/rJQGyiyHNu6WB3pPdtLq063vgrYK2N/zfFVfyYLnQDnj
	GpaN1aHfhMv1mpJurQr6rlix/XpkvvMRNEzvdSgPEsTJhAVaSgN+EoL/61jOj/VWs
X-Gm-Gg: Acq92OF0vXuQ6uqxdnERjQyfjFoPS/DYuCXUJsE+96dLcu0ik0qOFqTIxqTPBJWsc87
	PyYr1xOy6dEqxSxz1OBg6FDXiCvx2ahZeGgKbmWid8ree84Iofr5SDdVzckTMyE/jddDp6R4N9n
	uhVp+Vc14d8p7B1rCxEHGU1aI2B7ePdqS0wt2RWSJteC6f/CmO0WZEjzPoI6PGYzFDmV85AjgMd
	xzo4rYCbQTvNyvHJcvOrEjsvKVPYzSLRQlP4HoUXUpZj12Go0Ci5bFNV/VEeFNikfGpz0hbf8cd
	Q2Njy2f8uR0sHIUXCS3WEULfXca54jT68aGggb2lj7EIeJ+F7AHmKU9KckHz3FJNJul19PCYGvO
	X+vxD9SFOUB0d9ZeFE0ymwAPxB3WIp0lLLvr2/sfLJKP5FUR+MxvMXenPjKCI44IVDYgv5Vq0m2
	MGsLrXyQ==
X-Received: by 2002:a05:7300:7494:b0:2ed:e12:3768 with SMTP id 5a478bee46e88-303986a1287mr7399154eec.30.1779154798909;
        Mon, 18 May 2026 18:39:58 -0700 (PDT)
X-Received: by 2002:a05:7300:7494:b0:2ed:e12:3768 with SMTP id 5a478bee46e88-303986a1287mr7399132eec.30.1779154798356;
        Mon, 18 May 2026 18:39:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30297bbc9a3sm15025592eec.31.2026.05.18.18.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:39:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Tue, 19 May 2026 09:39:50 +0800
Message-ID: <20260519013950.873105-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0bbf6f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: pG6YNKOghWouccHdqfwGEsn7LuF7WQW6
X-Proofpoint-GUID: pG6YNKOghWouccHdqfwGEsn7LuF7WQW6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxMyBTYWx0ZWRfX4HNqQmmuefJg
 sCDLmRjKb38ekzAPG61WzSSfycoua98c/o+q5BSs25VeUqybPHGVdc7G2lHoz5SuG3SkWbzZAxc
 gB9gbjZogiVQTM5tYK8qYYA56nJMRB7jFuVo1YqtkTUNntoSJaW0TiTPUhn1rymAhNpneanLIFd
 PUz8frFqPxEbKpNoEqiaWbaycbWiACIWLdULOnvbjffi7JN1MPzlmtadKwd/RmsVcAISFBs8gOj
 S1QnPPds5S5XSXQqMnYtZgQFRggAltkhRkFSqHJqnCgRXc5QImCBdHrgUTP6vSyF7Ablb3Nl+tJ
 FQYw2vCvGjMr4Vds3EY13CS1RuUk7jnyhO8zrFkYFJ6on5AxE+0vOeMjYgdHjJpj9orDrMDsoxp
 nZzSEunhhvNpFVChMbTbfotszZIMZzT69pbYaFRNWWYNiyx63Zu4iq25qufFyns+xA3AhEMnOLp
 8zYbDZBJ0EAbugPNhcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190013

Document Applications Processor Subsystem (APSS) SMMU on Qualcomm
Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Hi Will,

It has a dependency on Krzysztof's clock constraint change [1].

[1] https://lore.kernel.org/all/20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com/

Changes in v4:
 - Rebase on Krzysztof's clock constraint change.
 - Link to v3: https://lore.kernel.org/all/20260504080943.825496-1-shengchao.guo@oss.qualcomm.com/

Changes in v3:
 - Improve commit log to expand APSS and drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427011728.231026-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420022452.1239665-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ed0d10157bd6..35d251259214 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
@@ -616,6 +617,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,kaanapali-smmu-500
                 - qcom,milos-smmu-500
+                - qcom,nord-smmu-500
                 - qcom,qcs615-smmu-500
                 - qcom,qcs8300-smmu-500
                 - qcom,sa8775p-smmu-500
-- 
2.43.0

