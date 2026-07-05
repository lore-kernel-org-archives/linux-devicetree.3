Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BC336C0AC
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239321; cv=none; b=AKK5O2W0l7YqsZuyPPXT3EvQOZWuqaLKs8mATi6mHQYKu6wJ+hX8g2DK96c7logYLfYc0KQRugOJMiuhosoIU4s3p9pw4FWnZWwgivZB3myXdPmHXb131juh+CAFMJnQ74D8Z2HlkYX0gDMe9soVNvKt+qJoOBjT2VL1R7KR8MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239321; c=relaxed/simple;
	bh=UMZdQAjPrlgpjP/uUPVTHH4TbLaE85kc8y/6rSTbteQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqXGyE18iIpF75HN43yvhSe4xNi+y1I04n/1RQpIRygbEK3BMyf7JNcNrRiziHabqDiCEFhNbvIhaGcMi3kfiAgS1CND/XmAxP+An83HmovPy7JhT1sVlSptRyyKkWeb2NFtUln9RDMQTXZ1WslQerSUuQurzlPtwXOXFHlDsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLqsR38d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZ+3tVCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLqsR38d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZ+3tVCS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66538eLx584178
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=; b=GLqsR38d3s0O+C3G
	ha/Vk5wbBipwboDBHv0FtJMt7TquCLSezQRxS1rHaQVrLikPi+USFxAIofO8X2Tu
	G33bNA9Fh1OPc+7BmajK7Bq5kQTOIbqwvVkPtnXUBAbj3nZdEzquYpZ15MFSuFqi
	10egRU1BM8d/r9dhlPKw0QPcOiLj98U0vd4w9IMcWg0/7YVCt/0UWC5oSHbu/H/A
	+I0atb2HmOOJQfgM89EunmAdHsdDG2qKX6wybRS63Y0oEQavoHuPJC/3Qx1duOV2
	3Tn9Itr4lXKoPb6rB5cBI81q5a7ZgxcjXcaTXQGwTuzqm33d8vcJ1dmGLYPNp/sZ
	RW3vvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4stetg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:15:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c82843005eso36357245ad.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239318; x=1783844118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=;
        b=bZ+3tVCScnHHFIIvsN34+79kiomnCSoEYHtkeiFXF99cJ/kguvVm5SunVSxPkZVcH1
         oTrEMGTuWh5odZEvgScaRBHhOYJkjNZr3724RfTHHVZHBXjQCadJutJWp52MCzOrrsg/
         0NmsDXUZnAeLt4UCCRRmgfEk40IeCNtixNsk+munbS217n7mzk0IaFbJZ5QZzTdB5+lK
         MlMfl9wUdPp7rOOGueOxm3TeOF+zTZqVCcqQG1yxgvxD/wJY7Hj4GrRFacB7Im0dDeJA
         uepQsYNqosPWSaExxNueLV5aeI/cUOmVI9Ad96RFERsp/tFp71NbOpXDvGuNSKX1n/w2
         jusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239318; x=1783844118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=;
        b=K6H1/y1/HAgD6SHxx1VcFuUPSTHe7wkGRnLwJ2gSiwYvnL7l6y2azvHDe20HiFTztk
         EmUqXlb8oOrbJeXXZn37UxNpvnaI+9LkkFCHLhhqLC+OA1haOwlj4Psph5FLtY1EMw9j
         Tbr1Ea1GsXB/+G4Q80QCqKhm+Wjgt9hlPlOEdpwy9XTeudNAcAZSIsRxAwo+5/oChh9w
         7GMSwvi5hh0iXgKbSwszxReRXKQpSobffDnwaF8tQWyBOoGowibm7wIIj86TiENHi5en
         O+Y7zF+xdpHVK2xvX2wrDJXbUePeKlw1XwTmXTMGbT9L7iQH1doV/FOw34gpaDTJWVrb
         xsGg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb6EFTtS07lHCNubQZ1pqdpL1Q1ZC/h4CodYwIAyjpYivlIu9RPRYZzPW3EIjC6EGcwHiuR4IVKKWE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56WIVMrEvefmgxSsJthswa1+wrG+lJAE5F3OtIsfzQ4NVb921
	6F1pme+IgvBjewIgdYZTjdUy0GEOoWy0syLoGjYoTGOZTTEm97N5ykZntNw6p0M5Noevw1KVvuw
	3cEC79UoDcXLO8de6+vGUN5eH3f+L/rEUz5+4gHthQrcHzIJO1mePSpT3MO4pflkI
X-Gm-Gg: AfdE7cm6faMh82i+Mg3uP/xi1dOBSOcztoLqkcxNza99fd3LQU7EycaHTZDF+5mctbs
	0KxFNzK8CaSbs8fyf3cTuquZtOPJjK6xzU4kgdTH7Q4ZLHZzWkk11wYiRhsUxXV2CtBFPojd2Pv
	ahuuEW84UTJqSTQnRZbvsa9VD7uyz/uZxX68+h1ALW87q66ufIxBpBo0k1heV9MEB2O+OOt8+3A
	Efem3H0+IbJsZGBEBQlaOqAoIcXaTkqrIb5CRLxPrisrOrBJMbmif+XjAozBwbmQNNpwUqCu2UL
	Vs/LxIZXnrzH32ZIyHbBko8Ie1jMOKPZ//fqh5mazDYDevSIDRQLJORWwqMGclTqzKGdD08X2Yg
	i29bvUWmBcThebNYBY59MlB9liI16WCgGGIk=
X-Received: by 2002:a17:902:ea0c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cb97e432afmr54557675ad.3.1783239318300;
        Sun, 05 Jul 2026 01:15:18 -0700 (PDT)
X-Received: by 2002:a17:902:ea0c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cb97e432afmr54557425ad.3.1783239317878;
        Sun, 05 Jul 2026 01:15:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:20 +0530
Subject: [PATCH 5/8] dt-bindings: display/msm: Document Adreno 722 GPU and
 GMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-5-c9f1354dbd29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1907;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=SYs6J75vDEjoACg/8a3Xl+R9WIudj3QmUdBCIW4Akd4=;
 b=pgyLEEFK+ZpQAfr6m8Tw3cgMFBAIXB4mjqFjEtA7wyC8js//XGYK0pV9c7S79qGFwGMWPQOEd
 aGXOOqZhfZ2AqPhfgXlTvu/igiit7d6XcfyE5WWNIIiLyd8Zzh1MKgx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX2wy5jhOi4iLq
 3pRw0cTwHej43ysrbCrMFv30uc/vZTI8FfsKcjWgHb/iVudsOa19nCLFCIe26IrDmm1ZReU7UDm
 DXly1jAnUcyQtbQqLUYoQthLP8g3j7Y=
X-Proofpoint-ORIG-GUID: BRh76MWkRqa42gJJ9gnCzT5AWIb_7Idb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXyAQ5OD7RShfL
 wuC8cKdAnzvOXKExA93RVj3xkEa/m12T+HeCg8S/Hm/DSDLJyv3c3F7xnNcm37W6MRYv4XyBYhj
 p4HnteT+vLEBZVRQ433I2aECPMHR4Eh1irWTxa523yd5s/icJYGD4tvVmEqGURZcfXleCdovGdE
 e4KvbMr/q8fTt7jWhmPTUqLjPbPv2fQG7o96+TaGt6XsA2jiQCHkDcu5IJXYyYD80SgkvC9d9u+
 zjez8Q6cqgPGd9v6hGDPU0NFtYUjqzFtulI6MBEgQQaPEtFja8T/2RR9SV/nf5yWAbbSS+dzdxe
 WS7trtD9lyINugDY8hl2aIlJOREP/0uXCO4+I1WFKlPiy+kbplz+wXi6ZfEkOm5PmyYZeJiwtNs
 NGunRLoIlIpQuhBkqtpHW4/zl/SZMRU3xTkilK/TyHesa6K3h4tm8oVjydnDIdUYqpR/uydYznF
 kUf1CscQHpKBFBQsqdA==
X-Proofpoint-GUID: BRh76MWkRqa42gJJ9gnCzT5AWIb_7Idb
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4a1297 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=byR7QgRKzgUKQ7cIeKEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Update the dt-binding docs to document this GPU and GMU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 8578c2f8122e..9e459f12ce3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -262,6 +262,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-722.0
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
               - qcom,adreno-gmu-750.1
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d096632694c9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -443,6 +443,7 @@ allOf:
               - qcom,adreno-680.1
               - qcom,adreno-690.0
               - qcom,adreno-730.1
+              - qcom,adreno-43020100
               - qcom,adreno-43030c00
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01

-- 
2.54.0

