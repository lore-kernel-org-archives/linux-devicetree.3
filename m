Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677366;
	b=u6k93/1U8tzUsTr65hvaNlIrjUiOkT+7DdfecmEHRy/IDzE1cTMGqNZH3d+mxoaqCGtj
	 G4ftCpjHYjnfxpjZCUA87B2/FixAGvWZnPMyYbcXOXJfloXvbUmXfTDYxF32Nsb5Yhx7j
	 yA1QfHjPNnoNeA2aMBan5sgqvy6ehHm9L3dd1zLKybXN0VXnoTt7BAIF2UKU2U53FynfD
	 +OV38R05Es8rnjsd8zwbyvPn1MOYmuRcX1voMe70ymwUa/vJVGCLrfLuPU++rQ5+G8YB1
	 xJTDiokKNivAe9UpmeL59+rMAVYVFXdu79h/ATwaDAKEUCSerUU52YmN/6mzWb2rv5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
	b=DbB/VGZngy14pgc3KT2aN24SPPfxWujdgBYGFSem+3WpuqJ9Fy0ZlMabbztxQ/5ICnbG
	 KKWuO3vzZVqfI+NmLHwOmkcWkq+fbncjRSthnK4hT6e5G4MUG/O3KXgCA4/C4ol0IUY0i
	 EomKAJV1VVb7OlQgtDyN8PTaWJSWyYZhy2DKKmHdNPOVDZe57lplvbdmOOteE9EbwP4xg
	 MRPl4LLTjPvlaqIf6ros7Ign+LSQMtNDkGE8foyM4k/ffymiFXkYMQF8dPPo2oWPCKuah
	 3g9nc6WjhCycShxBd1EE/pNJdtJLHCdoiXXdVBAKZ4OsgvQ6+/35tyxFf/iiQkKhgWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0OAzXWR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgC4jWQj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C375606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C375606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0OAzXWR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgC4jWQj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3B81682474
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=; b=C0OAzXWRnDod0gow
	VRitZOiIHJU/ESyS65l1lV55fu+1B/K7v5I4d7WNEkCNf5fL42a2Zwrm2CrpiOzj
	b+9BoyFQ3JFxduUqsBNpLcxHkDSEb1p+lNM2IbGArcEi/9kSmnuKZqj6mJTuhkKB
	gEV1FNkuAc2vLNVIRBhO5gpfpFH94l0B9X8gltXyyK79pBu4jD+2PKWeoSJbq/pV
	JziPTQJR/Ww4f1KkFGNn450j7nNtlfysBuBDNoFyhW5+Vra21duIlkTE8ESAsy99
	Ss66sYm0t5A//f1SL/vatLgxpOAzY1pUoYS1FbdNbUcu+eaDVGmv2isn0VNjx0kh
	s6dDKw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aejx5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:16:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b7614e9762so4832970b3a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677365; x=1796282165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
        b=jgC4jWQji26ojfqkHiuStwL5Bk/mpYpS/MCreCXVFcQGbVCy/l4SFuqUO6qMzz97fp
         d/QOZiQmjIc1npLVCVzITYHaXT3ZgxVNGjZ6v0wQypTRJiiit+5FsG1Wxfq+tKR8aq+4
         tjh6YHI7Q252IxKbiVn8Tv+RG9eQgA8/exuf6CGQqgRzc9aH5n+F5r0GJwqc7Ptd19vN
         srAP/NBLR/oq+Taou1iuPCeXnQobA9TH2WBdxhnO6gAQiNqo6GD5E2UoCE8fKyVTEiAJ
         9UE+Q9LtgkaSDEKzXUcettNQUh39mvhN0+gKv/Aiedtawt8doGjku/sYpXvos7z1sPFt
         lUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677365; x=1796282165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
        b=vcTLfdWtPbumQyYbUEogdf7b4cBA+UfE7837ADQO2kS6cXIPiomaEeuItinFLDCyL9
         UFeBe46wNwdRLlCEy4aTxQHT7NUdUiqZ8mfBlys9CIONWhvg4p78i69bWCEUwJHnlSEf
         9Baf6VZrib479x52F9rOkpMuXcxgMAcRkcOKRMQzPCe3DB2QD1rgZWz4s3y1U6s45SLa
         PP66cnhoV4LSbG52zu2zz6YeWC+3gZiVJWITwGq0U6gkruq9OsoE2xgELA5Drb5X6Oqz
         pbXpW5ZPZ9AkkWuD1wUOBhYNcGmfmDvZFV21fcY/S1RB2qJLvrE3EQF4qbCgn4/Ord4o
         p+Ag==
X-Forwarded-Encrypted: i=1; AL+hErEpyKWsLYhImvAOz+T7p0itQY4L0JoMrN+9sy0otnudzwIFyHLhaa1p6XUtK4TRUVjdpvYhkszi6aGA@vger.kernel.org
X-Gm-Message-State: APuU4Z8usZmyp+wmSFyV5hKXH7AO2KTJNI8E9k7tKD8aYlDoz5kQe82i
	xoQT8oIzSag6MhPYmEJVNFliFnr53CdOb1Rhd2dhuQDV+hPN4HU/bNMA/HkFhEvxCsQWzcQScTV
	aqG0U6GPGB+g1bCGyvgCaQF3xPvD7O0WhEaQnAPL8ce5jWRNUT4Uo6AMtwnIhqF4H
X-Gm-Gg: AZFdTZdQ94PCpQ9o+i8LS+EaVt/BmDihPXVXChyelwAcTkjNqOW9buVRPK+49tpTofU
	dWgvobKUXH2u733V695pwegKYQWnHaQvRJbrEwolE6XTv5yqj8PXA7LTm10F/mE4LhozTqifJJH
	P4HnZ8+A2/dUB6iEpjih4QCmhD86c5ewiaiMGRw09rrrDk+4glaXZl/Bdi4pTb3668/2NxSKUbY
	bhPIFq6rRif2gpwtTGEMOxRWe8XvTo+lqUxom7ZjYVFNAs2CtTpXJQoWWuNVCGfFRIXZmdcI+PW
	w39ORepNlgRUpLO0CgmXwPzGmtmwBV2Mv0qMuVr4MRywYOXIUokfH/SrQJ27gXlTapd49X3ZRdN
	M+SsqQovXDuGVqYgJRKoTCxLgzyDeQlIMCE52DO2uDE2T1asgPOaXHWCdySX54hAEP3wcysMyJe
	sVndJ0tUz8MCrTLBDoUh2iNB8CJ+kQ5NAVcAwYxplO+IKkLP0010LH+NI36vj6
X-Received: by 2002:a05:6a00:14cc:b0:89f:9ea6:1ddb with SMTP id d2e1a72fcca58-8c87c09e5c9mr17652899b3a.23.1795677365019;
        Wed, 25 Nov 2026 23:16:05 -0800 (PST)
X-Received: by 2002:a05:6a00:14cc:b0:89f:9ea6:1ddb with SMTP id d2e1a72fcca58-8c87c09e5c9mr17652873b3a.23.1795677364557;
        Wed, 25 Nov 2026 23:16:04 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:16:04 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:57 +0530
Subject: [PATCH v4 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-oob-support-glymur-v4-4-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
In-Reply-To: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=2115;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=l2ZRGdD/hkxUWu9DS2Den2yezAc1vs2xMObet20VF6Q=;
 b=2yP8ClsGLqAuDX096d0TXlew5Ny/bhOObqHCSoBjBK3tfVMzSLR9bNgM2Fy536jirSGnlxDwL
 rE0Si5ShcSKB2DCU35xgtMJ+AHyHeIvY14NMChAoMAf6AiUV+273AvV
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX4gB/lP29rBiO
 MThU7A/e78ADB6dF+DQ/AvzjAZ5NqVXCvbOfYNDtFyBsLWDrRduK3FYLzAPUl6ohk82+v2P0HHo
 5BjRu54o9Y3/TxPRSKZ2opWaguDkDe2O6xv46yt6cVj3XlUvFKsxRoaeUYTg8PtZ0iISyojcxvM
 knr57gMAan0vSI0WW1AZSoInM5VQhl1ETxIPmdTplrwpJ947DT06Rhz0lNkM6IJ+vaTquhahfpk
 3Vj4o0U/2liXtevqKqe8G653e3V/KSAhlK4IdqNhI4jj0AncqonePoDFlwmxcwq+9HL7C75taXy
 9WrYUvcD4memWUWMfofy7PqA67mAQQr6uoyRqyMI7wcB3moU4pyOZ9lXAqJZ0m73MMHDSk5Jjg+
 L4/9mcIYLbhUnSQaJl6LkZ59woRx4MCJjpIVAMiAtkI/1gLv7dovBTlM80uPXIVYGObim1HlvMi
 StMTbK66TFHhy68aJGw==
X-Proofpoint-GUID: mLLYXYxEoLEVZSkmU2JNs4ad2CLlsY9d
X-Proofpoint-ORIG-GUID: mLLYXYxEoLEVZSkmU2JNs4ad2CLlsY9d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX+M12xpYn3cNd
 BFK6xr1N8RUZjbZdPLhiosBaRtkORXjDK/egiHio4MBKvdCEY0F8mtsRwNcfO1yBl1MCNBIbfqR
 Qdr0GCSdYLTifV3lkiHJPN9o51FdozA=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07dcb5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1e55b00357c8..a0807615b0e7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2194,6 +2194,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_oobmss_resource = {
+	.crash_reason_smem = 669,
+	.firmware_name = "oobmss_tee.mbn",
+	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
+	.secondary_firmware_name = "oobmss_ns.mbn",
+	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
+	.pas_id = 0x42,
+	.dtb_pas_id = 0x43,
+	.secondary_pas_id = 0x44,
+	.secondary_dtb_pas_id = 0x45,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "oobmss",
+	.sysmon_name = "oobmss",
+	.ssctl_id = 0x21,
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+	.decrypt_shutdown = true,
+};
+
 static const struct qcom_pas_data glymur_soccp_resource = {
 	.crash_reason_smem = 656,
 	.firmware_name = "soccp.mbn",
@@ -2267,6 +2291,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },

-- 
2.34.1

