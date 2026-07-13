Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB83B19B0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930642; cv=none; b=pd8/jrswVQd32siOtkUC1XuUu9p9orSarHOAGUKuYy/t5snQsTOqvAAyppBG+4g07PR4eEgCL0g0FzPrEqSq6nzwV/sKHqa3xn4isybUfyHv/VMAU7qkZQczAR+azvtxwztvV4AU2otQjzKOgGYxqKj2pcIJce3lLXYRgbVdvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930642; c=relaxed/simple;
	bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eakRRlWv3DpWtlLRYxvXzMJ5A3goV9akgr/a8qDZ7X5iD9m//EDMiHZFwDQg4W+zDIf28LNTJsuWIrEL23cF58TOGUZxvAoCPbLmCGabyLI+llwaW5tPPLu5V/JjX0DgFzTfahTZAt6uLZD22o4oGaD9zxNU5Gy2GFpT7H2enxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSDYkjx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnPjWaw8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSDYkjx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YnPjWaw8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77VwY810641
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=; b=KSDYkjx6Xcz/qG61
	5bFqDEhdGYZGW/RvdfgAZCg2gNBdhHZrsO7fdLx96JID45szJQhvIDl20FwbIMek
	8qoCy+v8X5HierWvLQO/1Z1PqDpgbX23RpyipwDPzwwICUss8LmJr6ioQyVFGWw0
	VE2mTAAZuyaYXQo3PPo6uMcDBMhXPNdj1JzT4JJ2Csl2y5CbzzHid1hxfYrSsU5C
	GmHBmwLJCvb7vALy7o9e8r5k30ldBcXxPOM4C5AibBUJPkWkPcOJ2nlRtFgOb6eC
	DtIKMps0AuwKwLD4nEHr1k9Wddc/ODAhqDoDZfUIw/lf1XxzO1LlaRRSpEBEoBU/
	0IIrIQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsr7wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so4160061a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930639; x=1784535439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=YnPjWaw8gRJsr54X2+CAt3pgx4M+HDLRNkQ458Yhpd8wpV5m0RU05HJhKUONhgPvNS
         wTUmBEFZpwcmxs0CppnRypP5K8NCheHKHacmzNQrJnzqiLGS295LdN+6UCq6sod+U/Tl
         rZkV40e0oS5gLIyLnb8bwD+oH5jePj7pr7S2hdoHzuzFN+e9z8YJPrw2Dr3ILSFcLjOZ
         2q3RsAQhEFho74M8BWYGNVz5qEZdrRn8u6Ni0Ye+JUwS3zcutCvb0U9mDOnxyVu0+A+5
         uUHVlGHBurGj2smQCJBXUhJuDgkt684NQPzD+6dNL7q/CVeXkE5ZB56uIWoczF41RsVO
         0h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930639; x=1784535439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=Jb0MMa4YVC3x8SHBLv4J82ZO3/Cmit919Fc44TDo4OllMM1QOfODYJTco7mhJ4RyGv
         jZ4XctXU1wBJetxd+ilOGI5mr76zob9AoW4uItsdONz0nvJIlcoDlLsqzw8tLv8LFFSg
         6fbcgyQN9/jiubgnxypXTUwP1mrC3Es518kFeLgSpeCfdylidnCgnOsUyCIXe+Z9w6A+
         MVS3C+V9NMmnQ1kEfmoxN7LaNbx4qA+lmsR+QVsgb4PS0oVcn7F0OC6wKmw2f6q7NPB+
         8RIPu5pBsFW0G4KrMq0fhflZFdokm4YWo9c9G4ZLF9894K1oDeBqANUiDGQeS6UZFsU1
         XOxg==
X-Forwarded-Encrypted: i=1; AHgh+Rpo1uIZDBxciJGLyuZn6SI6VqvV5ek7ULW9t1LQ/0NNs2zdyop7e6ZhegkIfCQ7mB8xJZhVM7rN+H3Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MMwKK32mLlqRgiCZNkbpGW9lgQ+dBj25dHvdvADHJBF2ht3E
	xNikxjBeVtRv5Fl5EGZGW6NfHx6VQkiUw4f4E38NDtTTmy0IOJd8kUSoPPFaXPxTe556xNrpF7N
	2D1O74SxjMj0VIwJ7a5eG1dkmE+/7fmwcm53+8kPLsKP6thYxU+upKEUl3wYX6vvD
X-Gm-Gg: AfdE7cnfxCjwhSHZHD7WyLHepVmmyCsMbANwHXbn1J12pdXjT19uYWBXPIN9so4QMNB
	kw4XuyqBZwafFQHOHO51CO0raBPWZ49NA+7DshbBkha+iKTXWfGTB8N6mLMlp2k1HG5G2Xmm9OA
	iKaCQioKYfUyZM08TPN0ipbVmdQiSqNijpN32cZ3omWAczuMu3UxrCYVTl/Ykult3TqPQNZFmCs
	kdg9ajLDHunr30bqsBiiRcZRX2jFe/NY5xRL5Rza1uMy18tCGkyOefn45Ghy+QxVHiLcuVpPyKA
	vOI4TwG5VbenqHLCkTEphl0hMcXfHEOTEYqtwfrQJ7tCJ/RnSC/9/kRITrNj+5cOiKnmFBeAMNQ
	jZumP4EcJwJmQ51/3N7SzZ1j7Vk2cf6lIwZoMwa7o
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:9abb:a8be with SMTP id adf61e73a8af0-3c110ad2de8mr8666790637.41.1783930638845;
        Mon, 13 Jul 2026 01:17:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:9abb:a8be with SMTP id adf61e73a8af0-3c110ad2de8mr8666740637.41.1783930638031;
        Mon, 13 Jul 2026 01:17:18 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm6283954a12.6.2026.07.13.01.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:17:17 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:46:55 +0530
Subject: [PATCH v3 2/3] soc: qcom: stats: Add stats compatible and config
 for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra_stats-v3-2-4be17121729d@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
In-Reply-To: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783930626; l=3195;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
 b=tV5O+GFUJdBIhGlxxFjJyu3R4Cv0dbIYvDksfEaiAdukKjzgnnFPObMVT+z4Cs3lxXlUq20Uc
 BMMH2qQSarcBbI3x3Vq3a1zPtg+pY7jK0FKtJP1kNfss0GOolJOUL7F
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a549f0f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9MvkJE27OKZGVTZ6eoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: btbUuOf1kiW6ktZvTHqacVAV7JrD_yT6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX1awdXoSx8skv
 0thKvdVFDQVU4KmEx4VOe6IvapR2HFqjHhR33MR4SgZAGSiCWbb99407WPiqb0I3AMH462NjHHE
 mOk1HUDLOgT39OYA94o7MPbxHu9vv7E=
X-Proofpoint-GUID: btbUuOf1kiW6ktZvTHqacVAV7JrD_yT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX7E8zLwVkTM9t
 IXQubulq6gwvfOCwfBTW3WSkJU5PO5ZQ835rOkYwp3ycQLlBojPz4NY/QR73G03BRAbqe+zcdU2
 vq3Azo4iUFvz/aIRGdlNLKPjHcy6UyDUxzeai730+Me4Tkhko57ppd7ctPh7Z2TyalPjxbtJAL1
 x5G3IVQQ7rbaVY7ozjlSzPazH/OFlCdWK/+6DYojbMYnhD/FKYPlUw0Yp0SjUZngxIjH7tGaYY9
 kpm0YWdB7eTgHpdBFbnNL60fxEE1znd8ttA0LLCOyGm4pBvnAmtXLTuHgv0mPKDmgQcI6IsK4dJ
 FM7iZVFOpvbumP2U0Y2G+sQCJ8dDp+GhXhrHfQ2MhVQHCjqbTK5FqHQXE+3cyvPszIjuXjMNrd1
 PSPaTaKQvnaYDznk50J2u6+yVJchtbCDTOYXHhuxoI36LMToh+urI/fPjnvo7u7X4ofpIYFxcCo
 3/al7Bi8OLWpzvMM7RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130085

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

