Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAD3B2FF7
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530311; cv=none; b=SRypo47Y4hHqyiJm/7OfbpBqA6cprsNP0qcUtlU7aAqDzJ8vtDjrAptwgzeGokW2RMZrx35JeRkGBmc1Vy/rgBQSTjsEKLikk+gAzBH68vLpvnXp53diDgcT546/BZ34duEEHrZfvco5UXBKIAyOmLqMY0IfF5g1fow5BqeYhtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530311; c=relaxed/simple;
	bh=OTmEtMwFJ3b5csz4kyT92wySbEh/kKJ1+mfDTKVexcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/hRPLj58fWHDjP//LAl4+Y3PT8XPohLimPwgNu9v5LHunKqYOACjGEoXTQuP2Z8/kRaigABdC3vcJs5aecBWJE6xPH811fF4yFISTwtsJH8dApUcTTQRp18M5O0lEhgEQcNN72gzKnk7DAKAH3/FQ22rsfHIdz6+LTHg721QeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QogVU/zl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCjNzEIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QogVU/zl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCjNzEIj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HNjJ1089438
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 07:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5CmkvST7kH/8M/ZSQDpIQaKjiyEuI3GmuSzP1U95Lo=; b=QogVU/zlZwNSyHUI
	Es7j1gu5iuvWRe1RVPpH3XZD9nUQd4SalY8btYKGSmOxAGiG5/nw67BnEfkoE5bn
	zCM0tj8SkPE/HVeLaAFrdXxibmrKEyasGxBAEDKk7Ztrp0JBnElH6nyDpjmDLtT1
	/h72Fjlxo4RaMXG7WYyPYfHvF8zWLhSnVTb9wX1l3dSPSSFGiPMQ5QMNljSUchM5
	rzloC7TpA8FcePLh4Y90n8YJF5eZG4VvuLgEMJ8is7VP/MqF9+juI/qpf+1xBH9t
	1nbFaUDa6NTEWdpcGbxnSFnPedxroifTyIKupFgpT1iR8xn9srhQd5SkIn0oB1ek
	3O2mfQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvar6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:18:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so3963938a12.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530308; x=1792135108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5CmkvST7kH/8M/ZSQDpIQaKjiyEuI3GmuSzP1U95Lo=;
        b=RCjNzEIj4CjZFckwyxxDaANo5CRwe99Of3n4vLEUWrCIrKQe5fdmFpP/U8dgyoGEXJ
         af35+XRWP4Gn/POK7o6cFj9UNVnTwYs+SQE9b5BlJWrd0FgminqrmYrflNeQGe7hMKm7
         o5okBIEe+Sh2l9XRPOyjxFdEyinJQanj5MIetF8hsYMeSbtOrNXqams4MgEDIzO1aK0q
         RIdM4LkfDUECJIeUiAhPpyJJkJbGCMbJ9tvgzAvUaOHhDEd1AGp2qhQOlsNzAptPNf3M
         9TyeE1QqE39jNTa1hWyZxpdIV7B6ULeXCPN6k0jleZv4g0VXwT+UzX37MPaDDaavbeu+
         gbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530308; x=1792135108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5CmkvST7kH/8M/ZSQDpIQaKjiyEuI3GmuSzP1U95Lo=;
        b=Fsjl9J9BBkqRFUf5EZVakEdTmspCGAiDAFCzWOyS1s3ZNA4xhn1gDjF0HwHpBV1ZYs
         /3EWJu0a3RCLhppRf4LwrpwC6MPzBI4csa3xMiZ4wwzpfvA1qdkLtNc34BoQ7xoXuaUm
         njvpilmsktOxo5v9c5dSCUrFJm/vvcfGgsnL6eu8iDDp9HWoh1Wq3RMps4/6SfEs3QcO
         GescSeu6lm2xy8QB3whNqb3xAm/iCcfVWyX7U0i0U8l8md8RtjvlcFicHsLlM0fqRQBO
         UThECPrqh5AVGkIazSvrosXJCgucpC3uLeiijgEv+H9kt0i+HaVyxCmnuHLTpEM2Lo67
         7hTA==
X-Forwarded-Encrypted: i=1; AKwUvByyahuwMkNudy8jysy7LtW18JG+ho/vVHhTAyO4UNvqpbMVhMXCQxeEIW2uN6yC7wfeWbh59hHDSYqP@vger.kernel.org
X-Gm-Message-State: AFuF++nq1Df8Sq7+2YTgqj+KOvhitii2lAtSGuignPBK8g9XKhRY246z
	8WqLnvRlmXcDPDZPKKjUEY3L+ULxFwB+3rjh6U5rilv4OXlduXj82rXynMMiKJEhvwzLxIrzvFT
	7CfdhDY7WoouXL+ZepQc1IXkj2XnV5JuTYcCcA8OIAFndfZKQiXygdyIPPpOx2+/3
X-Gm-Gg: AYBFou0Wt/t6l2aMygyKpR89skAIpR/8qTBBF22tSKrwnA/Csgp+GmABXbXvxp7OrDu
	H0qu+5JDEEeUscw8aCJ89SFKq6V1lbeGn0jdsucgT8LDVydZTVPx7KN8prPqjihb50wjaR56UYZ
	cmQT0p3MiA4GF3/rG/OvVmlIXXHBiLS5kcDsRzZ3r4597HBqxwrb0Ab0JjKT6giBV2vpHHi1zyE
	8mZgR2avrAchiEPZqBv6Vvs/unbgeijJ1+mPvxH3mlc5hERkG33jkJ59E/jWkGmzlHNHzYPgtja
	d+uSpa2VuzYuSObLkz3ThunedFzWRljzGfon4fhA5mElveop8vAfmzA5pLrl7jQ9Kd7VO1ctw2b
	Dddj4K27W41S/WlWzFGFVo84HTHlPAaZbSXGbtdwYgsE/sTRm3oC+r4lwFIAk6HCIxZozN6IOOS
	PUkMcpJRaag919
X-Received: by 2002:a05:6a20:bea6:b0:3dd:85aa:d269 with SMTP id adf61e73a8af0-3e16bfc5353mr874031637.33.1791530307935;
        Fri, 09 Oct 2026 00:18:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:bea6:b0:3dd:85aa:d269 with SMTP id adf61e73a8af0-3e16bfc5353mr874005637.33.1791530307450;
        Fri, 09 Oct 2026 00:18:27 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:26 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:47:41 +0530
Subject: [PATCH 3/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-oob-support-glymur-v1-3-96cc8ffcced3@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
In-Reply-To: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=2056;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=OTmEtMwFJ3b5csz4kyT92wySbEh/kKJ1+mfDTKVexcQ=;
 b=lR6Cc4zNjzy1xzSzf0hnefL3BTOyvUqlO8LKtDkEnlgBq/vu8R6TakzqPbs/FA0nqhQbRSHsS
 K4JmgZiRC20DIze0Eci3kz7TBCfDgugOUGiKVYdtQ8XOC5UeB/qzvZh
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: W6j65i0AXN0g3bF5uh5qeNTXtBxyUO__
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac89544 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfXzq1gfF4pkdnI
 qw5x+nQPihrKqYFIlUx5M0DeihJazgVt/GAaD54noVvNQBmB0To9ceXVcIUIP0/HYt3rBA7lAwD
 A3fJqBk2e8XD4IAQRR7Cq6Od2s8N+PAxJIiOuvgOrNkiu3sDS8O5mngrNlPj0jxpg/nA/zTTEbJ
 cL29puZUqnzn2R2COZgoqb7G+GLaxH+DkbA0J6rKFcM33BH3BDLCUFmtWRh8TkRZz5JvUOaWyKD
 r7xlUAEevvoYZsM+oV6cAefVl9qzwwT+RXghgnmumyNSyyfRWdTYAu0SAMbQoq8KK3GfB4T4R4D
 M9aQ+ZV+2tFoABGB2NDnZDJA+qEZSFfje/GfzoFjVhzuGaKAW381JMxyV1Utgr2KiVX0CE65C1E
 VhwVeuUtkmyIAinwG71uf44GMbOe7RcAuzo11SFEwr7Tm5BuIFvWXAOX65cONPfmriXWTuosyEA
 tj4Ntv9ILftXJ6q9Xeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX5GU+ls3gpbHT
 pAxhvEQzPadIndQc0h8QM79OAmNuq2SSzwJmFfFjv1Qr7wJU6ZqN+LmivEB3/Z9u0XucM7i7hEt
 YAUBwdQJJGELmCMY7BPc20NjNBPFZqQ=
X-Proofpoint-GUID: W6j65i0AXN0g3bF5uh5qeNTXtBxyUO__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090028

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 604dfa947340..31fdde351bed 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1997,6 +1997,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
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
 static const struct qcom_pas_data eliza_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mbn",
@@ -2025,6 +2049,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.34.1

