Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8634439354
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525788; cv=none; b=NwLeqiEN7PseFUsfQoZdd0Tl4PAjTax5cSPAMwdGqBPFelyMwVTO5l571+zNdKDnjud3oIsm2z4j+RQh+fI9uFVlATdN8hpDC6Jtco62uSV/vrJVug+UhenOX8A1rn7G6abd3LIfHXe/bRMWv0oB2+HBmm70OHQdfAebyiNksHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525788; c=relaxed/simple;
	bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGFRa00x4I9R/laN4pDkzm4L6aPB2StgW9AacE0nuZ8lLOT2UJFyvI46qDn/ZefOV7Judb3K8SWfR+OlCiipEVUbdQXWFvYo+J4VXC36xMt2SfKW8aeD3y3ATBbn4BryBW+xY5AUFLoXhBU88oXTXlqE/uBNJ3IbBPzqnqh5ZNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lo+ntH4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QK321R6S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lo+ntH4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QK321R6S"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3s1v2751527
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=; b=lo+ntH4OxtmJKG2e
	4pgczLd1RT9mWAow9l+JW7Zb64iyLdZea6vTBVjxRvbM+IBsBOL5BOG/Gc/xp6Mv
	SVDlpv/VUPdtyirvKj6RG5AZrQlADsX79+9F/QkAqC2/CErwMe1kjt8CQ2u/aQfc
	ybDC8c6LDVtXhKX+H/dr3/AbTIAXq/QTznLCF1m0lNPlDINqa2O86ATOm9Dq6TXA
	MJBv+lTcOjwp49oiBukclBDXAv3bPQpn6MVPzBTHaY05fOixOV31pXLPyg53dJ+l
	FNyoHo/Myu2OMQATLP3fqUJAffuCZHSdo4g34fySsw4UIL3ES+O6rM4Wkb9fNSkU
	Et6iLA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu93y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:49:45 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44d2204d393so906956fac.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525785; x=1784130585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=QK321R6SfuOvcwbAutdXO82TyyTIizUV7dl/33Qiqqqe1yfO0XBnQR7KYab7FOkSLe
         SRsptGcp4sxchu9n+Ugik4t6DyjN8CM7V/Mj/oB8ne1jHZA3JhXplYX1NcGIG77VpMXz
         K2TxP5PW8FG7hu7F9jcDClycsNU+5Uwrnz5JK9NjwljzSJz4jQhFfa+YmRhsZQ+5Cgy3
         dCOepqIeqdTTtysXHVaPc7kV4Jw9egXhp+7FhKZOprQka1A9dYdifFRnF6KNaFzMT1WY
         +5HH/5GHL7Zgs/dWhC6R3yu4A1J46w99LZT58WQOi00W6/HuT2zvutfp/pDyDkQ79I30
         r1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525785; x=1784130585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=Q195/u1oOMOoW7YpMhaR8zhhXQoFwNouagonIm+xYeO1+9ntPuemX5pP5HZ8CD/Nyw
         YcTRZR233fo7PbjrMR0PQ9PXgueclnYK1UOgo3HM4dbNiiZe4XgKM2GjpGdZ4Gk70SgJ
         Hmn1/pFqTMUOTHucKuO9W6ZhB5yKZGQ2tPDVg4+GJkJjNtqkOocLvoX8RGH1c/K+covZ
         nPxo4yzxup4jABCgNglD9QAuHWrANB2dKS6lPYa/RCvRsewuao4vIqx+Ngh6b1aDaok0
         Ctr2GsxQDzrgf0IJ93qD4o0kRFl0nomw3IeA3+TvJ4UKKgJxafRYGiqd8D4EzkSPyP+D
         yOhA==
X-Forwarded-Encrypted: i=1; AHgh+RoW5UBc16mP9KjHn6dq4iCYNgQRSGg8yNAdQjJrmmuWxRGmcJu2Atlf9dOe1u+u0HlcHAeyZDLRtIgn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy29Iypna1u6DO9G6qqDDnF//GsDUAR4r2SLfxQTZ29h9tCVWc4
	7XYLcNcgRCVzxiwmT2iR2FrasapGBOswqOBvM2C6KrO9ZvA8sMTu3uC2yt5kAwrEPk7UIoGpVGH
	xuTRnC9HTN9os9h/GW+qXK9XI7umT86m767SHDkMitpRGy89UNBI+nL/iI/Z+kh6+
X-Gm-Gg: AfdE7clKXptPLLlXDT+Hjy8Mj4A+KpSSs2vzA15P8YcrH+xSg6NPWUOouUFAsB6sFZk
	pnoGROLhLvHom30tfey908F/luP6PijwrnUrwz62oMxCo8Gdomeem/+2nPIdLRs8HZqj8ll2yhZ
	rgSL7kLYdzpqEp/+heHgqXjnZzOf67e7EymG41ueUweM9hruOrjTwqEztWeHplSRXTSkH7tbJr+
	JJWHb4CbOAjmZZb528vKn7NkJVjl/37ILZvB/8yjunToc7P/xO2tgSs0RmGIQ8Tp8zBAdUKvMhM
	UJA6sNtg+NjjeHWZtMrgGHR9YBuaBgPBCNER6HFEr+zKviXt+8HVTee+SElKT13dlH2Sr77fEld
	7cxJNyJ9MrsghN3N8AftGOQvfewtC7jJaHkWZ2efJ
X-Received: by 2002:a05:6870:164e:b0:448:5591:15de with SMTP id 586e51a60fabf-45163e38963mr1977634fac.42.1783525780705;
        Wed, 08 Jul 2026 08:49:40 -0700 (PDT)
X-Received: by 2002:a05:6870:164e:b0:448:5591:15de with SMTP id 586e51a60fabf-45163e38963mr1977599fac.42.1783525780085;
        Wed, 08 Jul 2026 08:49:40 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d1ff0sm17014022fac.7.2026.07.08.08.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:39 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 21:19:11 +0530
Subject: [PATCH v2 2/3] soc: qcom: stats: Add stats compatible and config
 for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra_stats-v2-2-beb52f24f1fd@oss.qualcomm.com>
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
In-Reply-To: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783525766; l=3195;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
 b=RvKbKqkI/esze5m5ycbA5rdxHGWHQdaAl35cKkOvShlhbIGDhl6qVLj81VPMB9+dRCk2XYMOa
 cf+u1rff3SbCvx9Lrv8sw8jnI1yrPJg2rHx4LruGrOHf5plpK//HcZa
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e7199 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t9MvkJE27OKZGVTZ6eoA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX2k9r9o7LVWFq
 tFnJ8CI1WEbSSplu86D37sbJRIKj8EslFHMxiWoaFExMVMNQzXbUivIImOd6I5jVh6Raq7m85ut
 40mJ6Umi1A1Dh20atxCRZvIPl6clSAQVK7t4IxBOvcACwzm2ZDyj4s6RRed0jdsJkgdXYFro2m7
 3JBQSXEFPyBcZblk6IBGhFZifUbmcXM6H6Qeci7wo9vX4eBWk4sQhSeZaj9yG25ZoHoGyUgz1TN
 gVr9oHKUeLmBGqcB0eky1WwhAOIpkg/RgUWn8fRrItjDSbnw5i6knBHJIQiD5m+ybLH3DD9a2q8
 VoLZshDh+V7RG/+lrRIcSbe2vJ8oUuY+Y5iAPLfcJZWUY1/IQAdoo8QvIYLEf4NoZFOQskDo3QQ
 wSlmkX7loleJv3S4iduYzFmlWw6ViZPy21WQu3BsmhH/hyk585aqIrmX80vyOSCFCVULYT+OLfu
 pcMjTpDttqY2adZiFlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfXxVZP5TkdRr30
 CXTlcTb2kvNOLi2+Z7VCfTJRfdzvsP17V1HlLsmkkgNulwfrIxMCOQh3tKatgTeXyQw04XvOmnv
 MenKpsOh4LcjCBPHRaNSJ8fiSVus3yk=
X-Proofpoint-GUID: VGFVmpWnAEo3lkw5Z5e6mm3aM5_FHWk7
X-Proofpoint-ORIG-GUID: VGFVmpWnAEo3lkw5Z5e6mm3aM5_FHWk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c was
used for subsystem LPM stats since those stats were populated in RPM
MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 2e380faf9080354fae120e74f0b9bd1f3786d3e5..2f1615e583bbc6ea596d8b73d9bb0a2a00953cfb 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -376,6 +376,14 @@ static const struct stats_config rpm_data_dba0 = {
 	.subsystem_stats_in_smem = false,
 };
 
+static const struct stats_config rpm_data_shikra = {
+	.stats_offset = 0,
+	.num_records = 2,
+	.appended_stats_avail = true,
+	.dynamic_offset = true,
+	.subsystem_stats_in_smem = true,
+};
+
 static const struct stats_config rpmh_data_sdm845 = {
 	.stats_offset = 0x48,
 	.num_records = 2,
@@ -401,6 +409,7 @@ static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ .compatible = "qcom,sdm845-rpmh-stats", .data = &rpmh_data_sdm845 },
+	{ .compatible = "qcom,shikra-rpm-stats", .data = &rpm_data_shikra },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_stats_table);

-- 
2.34.1

