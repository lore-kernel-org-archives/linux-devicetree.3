Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E2F4746AA
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717830; cv=none; b=sit699v7eJcKnKX9+3pgGARTk26UH9XBjgu5kDJnf238qskPVpehODAL6WSumzE9Hl2xNG/KV3IAxhSZi4w926d6wmvph8K3JGIlS04i5WAorADGDcB+i1zfa1QC5/GSJchOxvhUCeBaaa32P9KLBKV8Ho2mwlmLEDNKRP3MJY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717830; c=relaxed/simple;
	bh=but93B7xouskU8C50ugTesHsDQU3KVXDFk0Mlsz/NGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DzhT/r+aPH9WncR6miEgjKRHOuWZX/10lov6PgTdIBaRyLJ1ViiEriBKLIJHiUIfhhPN+7LEfOUiq168ucOR66nTX+KdfpaUGM1XTp/wAAS7k99qspUlkzTqXiqQFO5O4HsdRiy2JPyKX6kOOYu3x+9Qjdv2nnDgYRcEEPxNXcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZ/hqPjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CruZkBvh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZ/hqPjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CruZkBvh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x72Z140611
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTMS9ODaC6i9uJtlXcvaGz31zsAjra8IAkD0CzfDcCM=; b=dZ/hqPjpRtUQ4lGj
	hp8k0inAhLB7/bp4ovXTA0H6agqDtucLozw7RvPQYst3EPB9qDIUwFZ0rUmXloBu
	G7glKAR5Ttrmsu7S68SAd3Z7fgUlocMtj+rXsnX6Uzf2awOnDrIosMNxyiF5Qu/H
	kW47hmlxjwTVaTSXSFifEMiXypHVz1gduCeFuET0W1559+PjptsuiVp0/4rFfAtN
	4w8fw8kmwfjQIqbhIsfxdUzbZOSEoC7D2NlAAKvD6/n0hOJ52GUsan4TtUOwXALx
	79/PI0kV6FMWoBnnKAVhNAeYlsKM8l2t529BHwTHRH2DtrRXtZXR4Aaw6OU66whm
	kTz2Yw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2rh5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso142602451cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717825; x=1785322625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTMS9ODaC6i9uJtlXcvaGz31zsAjra8IAkD0CzfDcCM=;
        b=CruZkBvhp372XojmTcXg2+AUM909/AwsJHPjo1CJ4OqL1vMF3sqOdJUHDyv+fH2o9b
         4q+dgMVDlmAW5/CDWtZSTDnQB4X5fGa7vxQIMTJqHdxVWcfMDSWoOcJMsxHcNYMcM0DD
         3HSxECqm/TTksiOQ+fEiVW5d33tdSjVVgaMptafNk7kMxSFNDhL1tYb5TZF4s+3LTihb
         eilWwSzjNk+7mnlktIW4hGrFH9+W0caREDWGBSxgSgP92JA8W+gZncAOdf8D5+jpw3X9
         1ZuNO+u3R6TS65tdvZoiyjOcF90k3o4FRfKqzMK52G/VYaXj8IRxEK+3POy1uM18AQYH
         YFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717825; x=1785322625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTMS9ODaC6i9uJtlXcvaGz31zsAjra8IAkD0CzfDcCM=;
        b=NKP4t1P+zRgI7wpXFBq/CeVTp7TgqfpGiVxTsKsipz23F/Q4JaO2yLf5gdlW/t2ZxA
         OQL4Od9DpA+/xbrtIm25k4mRvvmoUItQpNJv7Vfy9Fup0aO/8VQ+bt2gZiRkTPETqnDT
         fg2wxZchNt4noYiX8zJcp3vKXlx92jtwpg82z5Z/A+y2KcicQeUXdYmzlaZVmnScyEmb
         cQDprR1c4zIYfMJtzxJNBMhs294ERdwUojWPKiKYZVYOuQ/5TaMVIDFazvRM+6Bf+wuW
         +zSv8wlN/+IDXbxWwuydxJtFw4ujVNRmy+ZsIrwaDqI5ZEPETzscFx0y8mNFUar+9keL
         7jyA==
X-Forwarded-Encrypted: i=1; AHgh+RqHVwkEzKW6XcPYWDgZOvdYEXhq6hBvLHo8464Ji9Zj4LxJJVmDmpNNj4KtcIc5aQ+qaJ8b27PoPQ/E@vger.kernel.org
X-Gm-Message-State: AOJu0YwM6R/Vpc9g6ke1BYAQhM8cgklVL1+/F0IGAcmcjHYbblgJh5cQ
	7SEvyhaPoDbgzm088IqijbpVyi8bc6HwN8Q+S69/uRXXUe3eabHx/uFicLSsIdT4JTzF39nBL0T
	rSbY1X/0RGxVz13XxNZNjoFr2IfNK71YYEUWuJn+rckF7Qak0nmmNqKuYuxvmHrqZ
X-Gm-Gg: AR+sD10kWs+6h7mPMmfp0yX2gH+8JvWzltbPHz8fned2iyfjKz4+P3PA3yzFsq5KYJx
	RsailytYVPxZsEisBkae9kpWYyS3U2X/XEjMedZPdszKVuXq9S1dtAGmOWuReNqC5DjT7eakJ1J
	720zuQeZe85gmjopj44E31+p5ILa9m7OSIlHB8Mrt0nFhzy6WS72bWxM6VanqhzCi1IUmtdMZTG
	jZv3i122FhBJAWpiOZ6t6BBQmdp99G62GKb0d2f4nvZzk3c55mXdUMU28A6PxAAvPPDSnHV2Z6A
	yYGFyPY5Qijo+r/WeM+SLKpZ5p/GToL9D05L6m+NUzACWbNSIoTN6Y7rsw15LPqcPF8MIOxc5GA
	8B5yIKkwe
X-Received: by 2002:a05:622a:259a:b0:51c:7b12:5fd0 with SMTP id d75a77b69052e-5213d3ae940mr220576331cf.76.1784717824734;
        Wed, 22 Jul 2026 03:57:04 -0700 (PDT)
X-Received: by 2002:a05:622a:259a:b0:51c:7b12:5fd0 with SMTP id d75a77b69052e-5213d3ae940mr220575971cf.76.1784717823979;
        Wed, 22 Jul 2026 03:57:03 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0571f5sm36240285e9.4.2026.07.22.03.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:57:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 13:56:49 +0300
Subject: [PATCH v4 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-remoteproc-eliza-cdsp-v4-2-04c6eee70cb1@oss.qualcomm.com>
References: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
In-Reply-To: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=but93B7xouskU8C50ugTesHsDQU3KVXDFk0Mlsz/NGA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYKH2rorqGdswXoc/ne3RpEF6BarzfoWbpryGr
 J6oiTJ+9IKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCh9gAKCRAbX0TJAJUV
 VgNAD/96tdECpJ4v+gl3J2cCcRoWU+XtaGBdTplKWyFm+PMyAf2tmi3ktf+IbBPRV3Nm2rTTHTI
 /YIbcYYTj9AupxrbnaROzNIMx73qX7bhk1uwQ6dbpbqHO6mmym+TmFmQwutLfEoX7baKeJevIuy
 F9+r6QGRw3lj1tAK5M3QvMfAKSODEUgc2VrDP2ZFlI7Q5gFgzCi8bsXsHmRfk9flS5t93yOa4lO
 iCvCIO2ZlD7Yq1MFpv0e3iuRC2NNDqazhne7UNOmarC22ONDFy8EY8sb1c5Mm+OaJgoxogN29K9
 T9Cewfy6OguaFvfukvI+Zc8y7gUGg2m3d2K4v4a5bIgvCVOXNJVubwf0lr1BvIeOCPhqxj5i7bG
 afMq8aTUbbjlWwV7eYPlDKSHMbpWRoFeJPpV0E8XXblteuHXdGXG4AkLQkIMhnpuUWXgy8zKdX1
 gaZiiKlMtjpScmVGD5aH8UWeF+3iMzK9bxIe0SqudGHB1W6SgrL98FXHNIa6+A/zORCewE6US+5
 gk8WJrAs1ZTSdgV7i8VTJlrc7j6OXt21057FNDFFMG2bvlNhq9e82QhL/1bbYOH/0sY+l/+3WYW
 E6P5ZvkNyh9gPvBFVNzt9RzxHBVUoYohq+RDp7OjB5oJtaK6nVoYcEgb1wUq0dqEi2ik+o5QEsK
 MaBWeJeu3SSmKBQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX6htjKo+UvNSQ
 AgeTe0MvPCZ+6oyFWsJVSIUBhQRk8+v/ZJblvvHP5fovtnNIj+wFX2D6qNNPCHHhIQ/1+HAAMxm
 HJq18IhbSgWy7ttQJiISlG0+QTmMbQdaTRKPSlndibe2SLd8n5S375zBRfge0nOqtkWue9neLcO
 9QAuGJUPD4WNWvtak9tBSPYl9XrdlI/zW1PYe4SPmjVsbEGdTdchsAI5VpDK79uZmXn8nsXOA/N
 HuSaeORwS98qp9GkgshaGWKtStxY78awYMG6iBPrNWWC8asb0bG5ROYD3X3yZ7Ucv2G6zUJUv+P
 YP2gU5nfKzrDnwODeg5BtrsQiG5S7efBAcoixCLIRgrg9THSp4iCkPfFH69U5iDt70rtg1MqSWO
 xMCEgilYVRQSmg8SlYI0JY9CwHfItr5LqQ7Vr6GVbwQodhge6H/W4+/q+b3ZfDlc/OcDHJkpe82
 vap3xMXIcdX52xM4iOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfXx5ubqJ5eFpBj
 hK+fwA3HaVPfVCxNkeneyS/xwpI/H7sXEXuHWD1TGZU1/mljeCUVDxQGH1U9f/Cio82y/SLNpz5
 hm9xUr12rq9fPQYdLKlxiI92yZ0uxEs=
X-Proofpoint-GUID: ZKd23BgHuUiQ418su2ZW20gW75ILmpEj
X-Proofpoint-ORIG-GUID: ZKd23BgHuUiQ418su2ZW20gW75ILmpEj
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60a201 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106

Add dedicated driver data for the Eliza CDSP remote processor. It looks
almost the same as for Milos, except Eliza needs region assign.
Tie the new driver data to the Eliza specific compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..c8313c61da94 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1687,8 +1687,34 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data eliza_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.54.0

