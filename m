Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E93DA7CE
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419187; cv=none; b=HvkcpWM+FRpOMV41+TM3PUg+zEs0GlkWmfNLaMjDZb1jMVcbs/8Y4v18Ce0pyGXfyU/nCFIyzh4UvdYKMMe2VaOaPnVxQHgEPCsGW6XOqCrrud01izqsEAfEP2++pne0hKnnULFZEkIVmJAIZYLGcAoKzsEHBVvIVMwb+FO8TjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419187; c=relaxed/simple;
	bh=XAaZjca2fmlAx5K51J4QGeh1A6Gyi9hGgsyhtd4bEHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2qKTAfMswbuixpiFs0jp2L4a1FCplUOjVbRj/rN9rXGvDY/SiS5KqesytYX/sb2Zz5EDFsOEbJSX+bHjGLiGjjgroGp6jHF8N2rY870vbx0a6F9W+Uxo0mgWFR+XWhvFk1Q6AzRFWFeBheoQITJf4umLFaCPFxYgvFxCXI2atU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqBJYI1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhZJuvFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqBJYI1/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhZJuvFV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EEjt3203454
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLODp9Ss27lWrpiuizONL+dwsUM+NkFWEaoxkD/1XA0=; b=eqBJYI1/+GAG0VJp
	QIF0gsUKs2iZBIvG9/RNzrqHxQTdQh+M+z0gGzIKAyoBcc9MJfniYCzK2UwpL4rC
	Cg20HLQI2ziw4xdKQOfJud1zdBxAfSZ1ZNEfhJN2TN6Fp1RsF+1Vz+EZ6yGc+fuS
	DFxw11aOOmjufUnCvzb8ZFyGBm8SenwK32Qg2nh+YuhFXF8FUOIdmqB3jO6+2azQ
	hVtNU+NHC9DKq6v4fAmKal8YfZ19hUQ2ZYBuNAfUFSt43GtWnc+ourK7O8fU1d8Z
	Z1w0HzJDLAdzuYEOCP8WlZtecqFTjndhZFvbCHQ07JeXjE+mLO4ICMUJ3L23t4OG
	upjGAA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8wt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:13:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso3019390a12.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419184; x=1784023984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLODp9Ss27lWrpiuizONL+dwsUM+NkFWEaoxkD/1XA0=;
        b=dhZJuvFVjf2ekXRsG0C95pCDZiU4BPaFCh6qQvfDvqLBBWuEnx/KMRXX88NIdlZGOb
         aHBhxSVtUFQCO4i+0jbZhFA1+IsSlGpUPWW7l8YO7SsXpS6c2PC+znv9oVD4kmMlDuUU
         MdZkRa09K7eggzRFqBavw6iahHdzq9LbOpN+px1Ivp3qW+rhhU8Vr0WGVdahlh3qjzlk
         o26hQRVJdGsrhZSdxfqB3h6I5MT7mh6F45D8UiKROcGPxQdT3+njdKAeqXOy7Vsh7V0A
         WvlDEjJH/LyJ/hU0MzA/t3SUriXg/rEqRx+HEDEkScnjPDu5QTOOkdzY5skAc7ET/HPi
         y5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419184; x=1784023984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLODp9Ss27lWrpiuizONL+dwsUM+NkFWEaoxkD/1XA0=;
        b=TCVZ+D4OHPo7F3hW/VllAdB2FqIYggjIDnv2eIQE0dCzbytmMQT39l8jACUZdqFDBe
         Mzc5nvXp2AFI0P9Pt9XZuf6DDp7DPxodZ4u3YRKikfIy2COxp8wZKQVcD/LmHaDdn314
         olof4xkrmpkyE8nu3aTohct+QM1iXaYJNEFKCb04x3EkG1jZW8PIT/D0NsATqICQWEQk
         tuqZIe6izQyUfP60kSUrXpdOMCdj8F8n3glkJq/6VUF1OuGW5iumNBFCT0ztb5XxjSsG
         rJyt75IRJMj0QIFRhtJFbyKCSI1K9QVnseTcukCtbPy/WMqFdMDdjoLq+YQzxWntDJyR
         sVxw==
X-Forwarded-Encrypted: i=1; AHgh+RoVNr6ygI+Aco0EyEhxWtRKCNln3MAPJqJG+yWIMeydB2KpHVxke1LC8ZKW/VO0kOX/8oOQ/Rqa9AEt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51Wu2dtwV0oATXxL1B8dr+pVFmZKw2N0MuNgH53NhKIaIQWPK
	XdBV7ZJ3uTbJsXBAO15Ur28Bgp8f2Th9QU0+tEm5lni8icbySt/K6j39S1zbOL37oKnOgVXlGGv
	agaECJIbO+otqSpyfeZkdI7Vmov7QelWUZU5wXmjUiW/ckphBPO3ZegTQoOD2wPfM
X-Gm-Gg: AfdE7cnew3+H9mwC3n0Yqzue+XRW+mqouz4O/QiQUhJyO42Fy5C2Qm/VxOy5Xd1+G4a
	EagmTe58pZqAdn5c73RnFqPQg5sb6xOVNvWjvODyrjWgivQc3hefUoJiALZMzrhLiOfL9Sww8x7
	VmbfsERTqEoZwiJflsk8JiOJHR066jfpBx3hF6epTaXSxN3YyPJL9mZp3JfPeIafFOwiBCLoOFa
	yEfcWWeIA+NOpNIcvM36UWWkW+nYzfzLhG+AslVM9DhUbAvMYMd0SdkFJv5XE6FISfYG5zdIMqf
	cVGh7lU1MzGVQKDFSWjEREMGWpixU+xdvL1GRvXwoFuvLpMuJIszZ/VgyLGHnQFP3S8wu4ff5qX
	J2LnPCO8WXVp9MA+i3Gf0yTddbL4skaF3iT2F2hXqukfkDFinfBiWEh0WSMk6
X-Received: by 2002:a05:6a20:c783:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c08eef114emr5294445637.48.1783419183668;
        Tue, 07 Jul 2026 03:13:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:c783:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c08eef114emr5294404637.48.1783419183112;
        Tue, 07 Jul 2026 03:13:03 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7098929c88.10.2026.07.07.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:13:02 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:12:44 -0700
Subject: [PATCH v5 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 trigger shmbridge creation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-glymur-soccp-v5-1-053993f0c6fe@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783419181; l=3019;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=XAaZjca2fmlAx5K51J4QGeh1A6Gyi9hGgsyhtd4bEHo=;
 b=McTIKKEfa7Ct2DLCMx2QpAg9jJP8bF0xs3Ed/NHHhsNQ91szfAvj0Y028BQspzvb6zI9cRueI
 1Z0zcD6vUaxDvR2VsMu8bYvhP4Z+iiIyOXWi62+kbZ65NsZh5z2Gniy
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: ilzJW1oeU8nfpYPpY7V3ajUmqOmrID57
X-Proofpoint-ORIG-GUID: ilzJW1oeU8nfpYPpY7V3ajUmqOmrID57
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX7cgYyQ5ELA6j
 BM9QMQ8f0VH06GmVa46s+sr3AGhyUy3YhnDcRPV0osuZ0V2QuizP1tbbcPSD+jMcZt+MIn9NurK
 6IKEgJRbXIeDZQ6rBnmL64YRb9+UwJg=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cd130 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7RXNGxq-AdoGDOOEiD4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXzhfMPU4ZI/dS
 5Iys3RST3taiUKLIJoUT5+mzx5TkkyD9t9qJDB0kwlNEZ/rTrez/rTi0tX+wTFkOHve+dhr5IZ9
 CAxx1o+9aeOc7VFxCMjjtDl0ePZy7QEQqCY7JtqdcZml7DjrJCrqE8Lt9nHOQKxxTINjBW7sjJS
 Om6ZF3VPOeWy/yozwJ/LFdT736KiQYkvY5Tu63MjdvNcEvsHchtYj/MRRVncBgDDTDD58/MIBVL
 o6jek7yfVU30U+MNOBAuUOWpn6rdhb9QFu+yD4aQlQquzKFYakL1y754+PahyK4NtLIJ75on9j/
 1zdflQlhs9qsl0m6lhEuSvMhm+IALUFpY8vVsNLnFfopNdA/a72Q7jOmkv89PeVoQgpdGv6IP3t
 z+cS/NFluyXR5I3r/iRdjlZC4ZumwNuVGCAqIhhFvkrutODmRc8+lUrhsfIqcpFsGytFILDU711
 fS409dRxO5NdVngZWbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

SHM bridge creation is required to enable memory protection for both
remoteproc metadata and its memory region on Qualcomm SoCs running
non-Gunyah based Hypervisors. We currently rely on the iommu property
being present in the remoteproc nodes to detect this.

However, this doesn't cover for cases where the remoteproc does a late
attach, like SoCCP, and for remoteprocs like OOBM SS (Out of Band
Management Sub-system) that doesn't have an iommu in front of it. In the
former case, any attempt to create new mappings would fail with EEXIST
as they are already setup by the bootloader when the SoCCP is brought
out of reset, and unmapping them to create fresh mappings leads to faults
since SoCCP could have active transactions on the bus. In the latter case,
absence of iommu will be caught by the has_iommu flag, and SHM bridge
creation will be skipped.

Fix this by introducing a needs_tzmem flag which would cover for the
above edge cases by serving as an alternate trigger to the PAS helpers
to ensure that SHM bridge is established.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 60a4337d9e51..cd7273fbcf98 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -61,6 +61,7 @@ struct qcom_pas_data {
 	bool region_assign_shared;
 	int region_assign_vmid;
 	bool early_boot;
+	bool needs_tzmem;
 };
 
 struct qcom_pas {
@@ -914,8 +915,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto remove_ssr_sysmon;
 	}
 
-	pas->pas_ctx->use_tzmem = rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
@@ -1657,8 +1658,27 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },

-- 
2.43.0

