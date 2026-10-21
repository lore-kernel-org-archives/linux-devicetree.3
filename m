Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568235;
	b=CtqeOXNDIjBrfoSwbWeKNIWWKoFCaN5h+TZQCA7j4vFpZo4ok0Mai7Fp+AauSGPOR7+r
	 NSAOiKW+cjBX34Pu6B++L9Wim16szI8xiVrVezxOHq1Splvvs1vODmNfD339Z4qHS2H/X
	 2tZ12Eqt9WZ9k0oQCy7Pk3x5TNrnBVyzjyHHYgy2SNGN7A/0WP5b1UreLzRSZQnLicp+j
	 Q7vpJK+nJL2YaPwaeBk2XC7JjqnaUArngSz5ci2OIoUuAOhg+dCTq+tFCqMd6gajJyyFC
	 JjnE6btWf6muuQzjeLVkIzbDCT/qLZ0wy+dh11eIwdQqY/mypoWVgbLGYc9E+EME9zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
	b=Ps4S1sh2kN9DVkCkzYLkjzL5UDdKEjrw8CPkn/50E5wdNSGC9qbheah5FA5/L8kXjZ4U
	 kzEahQcU8YReagjWci6i0zusaSyi2Io0cElvnBd+Yr3hksWHxk+AXJ9+DcPW8HYPNkCyT
	 qliGbAy3dQxAeOfys/y7267y1Xq/Cr3TxbMt1NV3vV04z1/vlO4wCBCfeTyv6hL9kEI2q
	 hc/w8G6jmLU+QFDaDYcjFs1VuxgXkMFQklOrTaGPVRiSZkdGQFUvlposTgnhnC1EwRMVG
	 OpbuRZ+T15rhQ8cPsAKr/PJRapn4HIitYGOWvqwEOg2zM5d9o7vEm3LxYfoWODoE3Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fm1tG/RL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+GEyxiG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162FA606A335
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 162FA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fm1tG/RL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+GEyxiG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jOsj3573321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/AAvIITa6Qa
	3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=; b=Fm1tG/RLzuNknjAnqrm5Ekto+Gc
	Ne5yZAOmjL8v40L8NXC4aHHtgsuoPyAzEMvJycUYQRwVlA+F9wjVQma4RXMneTPF
	+CbFUIgYVadWCZIdQ0OxNJoZMH/asT2qCmL76STRndoRiLST8Pf+Tg3WxFNyP8ZV
	9rRotP91iDNEV5b3s45TlLy/QKyPsQy6XUCvW/Xy3zYHBXNr7fViDFMEYFMl/fhw
	yK+EkWfqPHrQRCjgrGd7ThdXRA0ThftYyhDqIZtd7ZvZB/coCVQVjpvgpKFuPdZL
	YeoDt+6/Snm9wZSCBbeoFkpwGJZbRtIQCZAh854pcCR4I7IVcjJ0aJQ7p/g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htkp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso729532c88.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568233; x=1793173033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
        b=a+GEyxiGomce1dU93ixgduwpFQvC7DrZB4u9vlmre8szNGFX6k0qLnQhV6ClCXxMsR
         FymOp//w/d0ZuD4Es+I23K0xIMtOykNJ6f5W1w39n+OCq+VKryAl/fQRuF3sEdQk2CO4
         GOj2gXaops05j50CwdkGYKcn9H1+ezUKiXVmSCq9ANkybQlYh87Jqg1AURX/xG8R9BEB
         Ayn8pTfPbcMBTGVN1U+gNhc/ZSJG/HsiRN+RapM4kw9T6Fd6OWOuzFD29EG5cc4cEwDs
         4ViIcvmBZF7+ouJM/NPTnDKBy9MjYXrfoKTKSvT58YoZAXVUK+C3mL34TSpmGsjnT66J
         LBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568233; x=1793173033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
        b=hQ4Z3VId9p8O9ol+vZ3PC48Cv9YlK5x/IWv8HpxQPVPtHRvgY57NTJDwJpH+QN/DnI
         /enA9Z2Ym3racG6Ntcp4xoqk2LHhn/9zxGqSSlae7ofqJAQEnpCBDrzOwhEM32qN3AK0
         U1F+8Rm9RBLZAm6eYKKNxIpygQbs0CPHIyLkvSXgBqe0krDe+fUmBVeIavSJtQonKnjs
         0SAuVVbpw6HiBXMTaSvKd1UUI45/FbimhlxCXMVtu3lcIFiI1YoWAhj+h9C/W7duzw4E
         pbPT3CjX/uSTeM1EBPMHA1mRlbbaSh7B2dmXOCjtznjHGjZq7M4kUBul4uU+QNuVqDOX
         /fUA==
X-Forwarded-Encrypted: i=1; AKwUvByr/P5xgx/h/AEla25SHdOynveDxH9aTbPwDZX8PkaEOk4QwGlIJ439ntGW0hEFGLX9QEImanKmiFa4@vger.kernel.org
X-Gm-Message-State: AFq9FYLRNzt9U9KXCgQvWTWGlM4a1+PPf3I+EpJxjFNzI5/VI/UFPSI8
	u4vWAHa4VpbTwlFG3mO7SDcKnr/aINYc3eFM2W+xGMJWbWP4MWkohCOKuhj+qElyRe2wE+j61Gl
	XwT1gLilNQFWLe6MNCiCEBD8TOA6DDYSAK/SEkEUoORKmB4Enq1vDxWMkYbOqRlP6
X-Gm-Gg: AYBFou2YnpLQG50NXz+V8DbSyLId/ai1gwVq6czHM8lDMcqoCC/fbROMU86Qd1AJ2AD
	5f8jCdvJG9GjV+3n3O2uT1DP6fHfCu/O0fgd1mGVF3n3aOqztTGx6Flycf/KSvbsQrAN7VGMSPH
	SpCI8gwbD/UMpjHGiPD36rifaTFGNDYJmP66yBBluW/uSMjQ7Lnq1OT2nQmEqFu/0wJMgotRVDx
	fQJPsldGrVKiF2jqbcJdQWBUxQTc5ezH9Pgb6MPyLwtfhLApiXZhKTRiqCLT22Mu2hywJFnLgNk
	oc683KmEl+DC6Rf9gLRQqQ79lICAnwszWobGpcVJ290OpAm76OZpQRaM7lIJo1IOOiWtXnkc2G7
	fs3DLOApvGFvVkdCrPsbdmJN3OD0ev/9vpOKM2QqiM28cdPUqg2QipxCnLb4=
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-190a4ffa89dmr1772882c88.19.1792568232717;
        Wed, 21 Oct 2026 00:37:12 -0700 (PDT)
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-190a4ffa89dmr1772845c88.19.1792568232081;
        Wed, 21 Oct 2026 00:37:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Date: Wed, 21 Oct 2026 15:36:29 +0800
Message-ID: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad86ba9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=cXETwVyMbT8LRi-F-08A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX0LYGO1ISmtyl
 oFIlIh+tMboa8cMjT79epFtV1u2APxPrSFHDvccg3jtHadisC7hvbyVogZyNDv0XzQ/dF2f68S5
 rzlWz4jSPwcxGjW5J+4wXMIBTWnUowA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX9RwmMNZY209V
 kJD+A8k1b9HAvS3/SrEkJyKt6H+iMrVxza5j0t+iZpqBXMzp0ZCVx3PARfLG/YRjTkCzme/+E8p
 r1SFbxSdhPvYSrhftyq2Md0TeAOyWgToDVKUtFv7HqTqT9NtvxDQJ49uB23tPk9Dn4u0ooN+WLG
 oP3f1T4D5EGNMiQDse9lQMA/70wIxozKX2Tql41O59nOvzAZR/fKNexPZHSs6kok5MjyeK2bm2H
 ZKWAdktDuCfAgUEsCGNqFgntbpS53ZZQoxkZvmMJ64I2vSNhxdF2bAc7JdFe9pNJgZc9nTeMiZ3
 HU0r7xafs9oSPlWnFI7n5RqGE1mYWJu0r+QFga7gDoJhUGqhSYpW1lzqsqqLugJCK34/UxP7oVL
 KK77mZCKEpMBF7I3TwxEjlGyIDEuVjjyKfVJeddWl2esGmi/ZDAbwRIDjs+AlK2NSv9ZW4mXhKt
 nF56aAs4DS9OgzEjJPg==
X-Proofpoint-GUID: 3ULoFv93RZX_zVX4YygccPSCVL0bmSH0
X-Proofpoint-ORIG-GUID: 3ULoFv93RZX_zVX4YygccPSCVL0bmSH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add support for the Qualcomm Nord SoC to the protection domain mapper.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 64ca99d7fad9..6dace16a3b8c 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -277,6 +277,12 @@ static const struct qcom_pdm_domain_data adsp_root_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data adsp1_root_pd = {
+	.domain = "msm/adsp1/root_pd",
+	.instance_id = 123,
+	.services = { NULL },
+};
+
 static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
 	.domain = "msm/adsp/root_pd",
 	.instance_id = 74,
@@ -414,6 +420,13 @@ static const struct qcom_pdm_domain_data *msm8998_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *nord_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp1_root_pd,
+	&cdsp_root_pd,
+};
+
 static const struct qcom_pdm_domain_data *qcm2290_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -634,6 +647,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,msm8974", .data = NULL, },
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
+	{ .compatible = "qcom,nord", .data = nord_domains, },
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
-- 
2.43.0

