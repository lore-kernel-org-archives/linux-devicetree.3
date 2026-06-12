Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D73B6C16
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256382; cv=none; b=GWJGlhKsDLRrbqNw1OBbcOeIbT4u3+V+u0wt8R0hnCz5UTvGcEodUcl808ydAzbi/P1U7C1zSih5Jv9V1rg/LkmcqnuqB3/R92ufHSNK5LuaO5JmwlVNbjJdumaUWAVUd1U+2AEplv6nQ5FDv2Fa00N34qPndA2yOsTiDst0Y1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256382; c=relaxed/simple;
	bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkbCaIq/3KjXoFKsLRKW4T63A/N/oPZYyYCh2VN36qsBQHH8lQA7lYSujOnQKPMOR6oeSy0CAP9fQO0Jt8JDucmxWy0SfdZkrzmIBCQONz8WRL4w1CHUBrexqzAj4/BBFpiZexMzn5esuHsZ7pwFTuUZdERnRmmxynzRcYpDFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEoyOJDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IP+8aaos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEoyOJDH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IP+8aaos"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39LuE2475796
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=; b=jEoyOJDHN0EO8/hx
	w6E148r0dqO6Bb+rCiSxsZsaepidMz/us/AekapUeyX1i7jGbxLU0/yuheZeZxnR
	R2ALixxmBiw0mMbnf+jaDKLbsm/FI1Jti+LEKhA8TssZmVYAcsAEtCRLpGcFilxT
	Un5S3IbptSUny83tWmI9e+NHmlk67Fhw9PksB3IbBd6lOmuF5Gjq9D5UHDEyfK5A
	VgKnOd49wgLIo9cNA1LpqpP7IICVvZ+msGBOujwuTIB8ReQK3vim0yUST0c/HvPr
	JKcg5TzyyBM0K09MijSqfL23tFd7XMYjjkpjWg/68n+QgqkM4kXIQL0ttDWuA+fc
	aEYJcA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5tcjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so829898241.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256380; x=1781861180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=IP+8aaosM8B+F9+Suk4xKRNUuIMEgyMOy059CmyMota4jMVXNTmSZQq/cQXN1+WK/5
         quMtQAtAWtF0wNsu61ZDZQxpZ1X86xySlAdNR6Ta9d5wee4I2vult2oy65YSautlMqzu
         YL3FNsVnXlgKct8FOLtKNFNg2GpvvQ7ILg7QaAud4H7T+8tED5auuW59XPgTMzoGJsa/
         3fOU3PWSJ3zaCd3yb+xKQLsZKSgojbHjlWZbHGkBLDSOKSDIdoNqs0c7DbckVDw3pU3c
         l20yMd0WqlpOv+0JFrPRp00rnjeJY9dHl6fWKBz0VW9tuFMbJ5nAFoErTpcgu1Hj9VX+
         ydhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256380; x=1781861180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=YVQAyCkxhOFclx3tFUloBVYwBcBWdgH5VmzRAzsK8K6gD8HWw8yFQQjtXiQ0TU3G/5
         EAbX90YFq9fpsOV0ZareSlbqnGPDIVEK7leTxdrNZLOqDYQu019gk5T5fk3RqfJjfnlG
         6G2GPztMJX5o/W8+fha3ssF6Om3ygMTyI9c1lSugEJ8om6+EUO7HmsXQj9unLtJIfsbK
         eR/l8NPowzsnBHAFd1iUvXc/SUNyBuVqHpB6D4bEMCcsixQevTd7QPi4sfSxfmaUYIyK
         tFAT3omkljHG6ovpIpPNcIptnvLQXSVECtDZ1ke/9P4T1804g+GIK6gbB53ZwF2I0er4
         Sj/w==
X-Forwarded-Encrypted: i=1; AFNElJ/v6Rr9bN+dMsWXQrvbddZMzohmQHf6aqvy6ABuUN2sLl9zgpOqomxLBbmApNIzt73W37VWs+z6kd19@vger.kernel.org
X-Gm-Message-State: AOJu0YzhVaqrBWJCc+umtAVDQL3uY6ErUabbNNNLescrdN5osv4FBBv2
	AsXdtNZZQGu8nHMWXauQUNHCebs19/EL4IiYbH+dkACzj8pbreACIELtbr10npBX5ZXn26xPgZ1
	3r5QXMn3kD2RTSwTWZAt8oJGd95YysjI7gL04r76hy2fOnaGl0R8ABMaDOSwecp6z
X-Gm-Gg: Acq92OHuz/jwxwDFuLG3cklVUQ6NXAS8GUkgHVr4xyYpWb7iZBteAnO0vN0wNbiLybM
	N24tdd5DxUt/bj4sb3+lJrdzH4KVCAFjo/LdCvPwcghybatXSsoGSi7Lr84ofyvuaJNR1J+ga0c
	IqirnP3qYVv4J4WfWZ1HhUh0nLXiwkRoq7QjRfkzpmqM/JeFKtWAjEVn0pAyMMSekmNIOIqOhqY
	VP9hL8wT9VSL79kcePJCXBZGVo4+8kNjTfNQLBq5OCriUkZH2AuKqak72X3MofEJTYpLkZvLhFc
	bZ1YFkAJXfbXrUirQiX+PTMf2rp6Z6FlIrkXUexa5a/uEGpKEKbmYMXS4qz8lfO/UHlkAJRcOPY
	FWea7INGbvDovoP45MEnhlMOUCq4TxP3hdZyKnmE/Vy4p6UYX14Ss9zj33/+SGdz9LxvhQjehmp
	mikbk7s4/KekW+zOuBilf5PZ+wYe/qzrkZuQM=
X-Received: by 2002:a05:6102:4411:b0:606:49d:1861 with SMTP id ada2fe7eead31-71e88defa04mr800924137.27.1781256379446;
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
X-Received: by 2002:a05:6102:4411:b0:606:49d:1861 with SMTP id ada2fe7eead31-71e88defa04mr800914137.27.1781256379062;
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:47 +0300
Subject: [PATCH v4 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-15-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CRp+CyWaKMZ8ieN+tWwPl8UwjQQ+oM9UB8J
 Nfn9Mlty3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkQAKCRCLPIo+Aiko
 1Zk3CACEsFPEBtMKsMHfoihEHxXN+8cDUYdN16iK/PcAiGmnYum0B3GhT3MpQDTzelkDKmRgVgZ
 bdqp4UedegHV3yyPAaq3QrrACfs4uS1rMYJjjIYhixDk4K1HkzSvew0Fl0OB4UfLhcASYuFvMVv
 yw3LXf3TOyLoraaCk6Qa3fZ/SNds7/c6AsnQevKeAD8Uo3/n0RZt+owytCMj1gZ0NDFePzYw6c/
 X22mMSebEAvnYzKfAbMK8VkpCr+MJYmU0Q/YD8dxl8/CD1ufWPNY323VzBTLpuYkBL3+V1Lkf0u
 tSOcv9uv+RmP8A6hAHSs4WP+rb61qfJq7zs+ex3MIcmBawYg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -HW_K4qugIznsoZNSBDFRbhztwNAoXwd
X-Proofpoint-GUID: -HW_K4qugIznsoZNSBDFRbhztwNAoXwd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX1exBea03YwOl
 JULYRXV8PM3wCNfDdPxKpBsWhzaDHxrRbEUHk6WWn3VurvPDakZZ49n0YBjBGNMN+Gi6/0XlYcr
 qlsGMc6P852iJuWCeeFsurzYrWteHBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXzxLfRrUcAkhX
 GWvdSvrBRtGoifMWn0r4UsX51UVekLA6fMs8wiNiUqOT4WagSfThtQ42a+YMyP5tdYs5R/RqRS6
 sryiGwewn0Le/3KwdRzOEQuG51zuUrSofLDPSRaDmNVFQSvydvYAyBxUA9rJZoMbAh33TklY1OW
 t66wUANGlNXy3DjdLRDrRRql1jhy5oOjNVEwckudR79t9nO/Kq3NOlv+3zDXJ0hVRBK97bvSOcH
 VjxPk2FNENYpvPK187O3anB+jZQ/O3lL65MiY/FHOvTaQ7Uw5Ssg7Vd2caFDoumbRdw/284hF2k
 1xPVl+twB4iRl4g2dZ4TCJmpY+4hGKlQ6MlNlRC/Im++rTXIE5xGWEcSe7HVZmbhu6YjmpDjvOg
 1p16oWdxhHbdKm9PK8J/XZQGg4d55/dD/aEtiUNZFfSDk/9aNPU4xpp1fhzRLmGr2N10Yh3IBPe
 J5gBcqXRN+F05LAqcqA==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bd0bc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3

