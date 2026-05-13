Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027E47F2DF
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676583; cv=none; b=T41qsizgLhagjLrfb02DAAyADlLmr1Tt3T4Lr6pcOqltFDfencTtQvYVMazDDRbZi6FUjO94U/ChCj5RDKnEaKqWKRvGo86XDTpnmaw1IMxf4CUn8kkvE1D79ffyToAPY158q1ktP3TXIHcxpYrIZlB9U87LzP3besTTR/E6z7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676583; c=relaxed/simple;
	bh=meJeOGC9Adf/PUbg6XCNyvrgECBd7eveB7tX76HF7r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lftjj6OC7I2ojcZocrug0nEULMeYSWUhf8UUDLQdbl/cx47z78jumPq+1cA7F2OzvrWTYSa1u4INm7a/IImUnQnd2TzTSngaqoiNXvReJifdYYSPCfAWAiNclS/x9cQJ/ccHMECoxFrFSgjbdmfiq/41pmAvCFwYPhV9i2XS9Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/gZlQy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpYXdq2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/gZlQy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpYXdq2Z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8x0kS4159945
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=; b=Z/gZlQy7PbIStwmq
	AjIUq/tQOUp3KBfEiMyznFR3aaiYfcnConYxAmLAAxsvt6SktT6PEzYezoTlv2ly
	pVQd2y2hpav/6QJLVDUsu0bItjIaPZKbPRNunCAmJXqi8I+qoL1NdooVF5mUF+D6
	8GxnHXNhlxhTZ0/7S/l2GQK+2+VRn5jHr9wUwC1OpAtf9SsmtDPLg8Bdbj1vi09J
	lEMfSPJVGsw3rN09lzSMT4VnWWX9IY5LSJgCFFw5c3WjamAKaZachb/apmMbyRX5
	NNSP3JmVLuZaPV/n1zK2PVu2zPmjvSGb1qPY6RcbXtK5XrNoeN+kai+xckzz4HIK
	kEQzSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rtdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b673c8f1so38677471cf.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676577; x=1779281377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=;
        b=jpYXdq2ZXRK2iMcwhz7NP73YE7Uq1WAcubVXdVr1zhstESVfk4ZGE6FxYG1970PHJp
         XRLXWKIkXPml3SeGiJxcaAJazzOPRjhCfefVS5NrBIKXxHMBzT/kjDkqm9md4wLF/7Uf
         41ZflvPWpbO6OyaYkV+2xHTBvQIQJdxUMclgSQ+DqeOfQb9HXyuOLwj9d2x0R7UeRNGX
         mVCKPQ+jh9qqG7vMIpqHaJmdxpG6WC6ub2O4WKMe08RbCSPrW52MzbeY8ZCqwqmsfRnO
         e67xOBH5hTqQ6kDzTFMhHe8322Ge5olPruPJz4rbN1FVOBdD4ECNub3S9S8juJ/ODkEG
         xZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676577; x=1779281377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=;
        b=oA53ECO+XYr327JaCjEtmp3a3/ki0y1C2vcZcl5DQkIybdIQjh2iWMjaGzCreI8tUu
         t1hKlVjHTunRTnbMdmfMD2ZrsWeT31wJUR2YMhjuB+IdNxOqgDwEYfmXu56ajXE30V/q
         HMejd+UQ5GGeGikORWIvjNLSZ1kkyQ++Ju9Diw1AvJgmQNTB3OzSF7N19fmMD3YMgnXB
         1L5HIUgOzk9Tdosvnc3YjffF4Qq1RSfzTmMdJ8Al8RIacVxPlBVlHeHb/JihVrHI4t7z
         sq08PrMPfOI57I0HiwgbPxbvpPA17wdeRtvQYlGmTnGAqOrAt79KQG1Ix0DFPdluLNXa
         TMlg==
X-Forwarded-Encrypted: i=1; AFNElJ/BWAhUD9ORaPfOKYxmUMRMJNmmN+OMDCz9i17jBER+UaqdmqhN7uenWAtcZW7RnzFXkO+YMQBwx+n6@vger.kernel.org
X-Gm-Message-State: AOJu0YzpV3l6ETOkWXJ4I0fFFaUvEKYwOnGEwunRD5EhOD0vO4L5fukR
	9lhUI7H6LMnHKRs7em3SFj8Hj7qtVFpeazayeXjfh1LmoIl/WJ0w+wUmpfqC8vbi4u4WMQ+Dokf
	8yKBGtbcOPEpsT21LTJFKoRoTk7hNytCBAOwA1tnaib97Jm/G+YrUDMg7+/cUfQWb
X-Gm-Gg: Acq92OGb+lB7Vn+V3fz10W5e+mPTwyYhozaqLNj1YmL4GlYrR9Ra/P4I+MmLklsTuUy
	Qlg6i6eXy8x/+xmbAOgeCBLXlYIb4l+PSuGNtjZZBTjw+tkIidQB1jbtx9+SUNCKNaGeIl0Yot4
	GDDJuxdJ7tGsP/MfJUTlEmPMYjeUryIWXFVEenYIqkkPv4sJHBZUyPQgoyfblti//ejE/C8r93E
	a5FXJH6jVDZ5WrfXXyfbBokFfJXBq3eUbztUi6T79BZKjjkNKpYnVmLhXL/YTgzBKKc96nGbf64
	+G2JnUNImgVeYnuuVokZY7LxPraLobzGULQCTTPtT/slv+sG+zlpxVbl+2NTL8LHEIfoHM4qXo+
	BQKAWDiYNcuIqQF/peahapHQ76f21fc2Bp57IHSEU+DDn6+q/SGR1jkCHGO2a6itHsVPivuDZGe
	w/ZHxL7SNRx5RU4r7r8bUp800lFLP56ZpSxSI=
X-Received: by 2002:ac8:5cd3:0:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5162f4f3e7cmr40521851cf.26.1778676577429;
        Wed, 13 May 2026 05:49:37 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5162f4f3e7cmr40521371cf.26.1778676577015;
        Wed, 13 May 2026 05:49:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:49 +0300
Subject: [PATCH v2 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-15-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=meJeOGC9Adf/PUbg6XCNyvrgECBd7eveB7tX76HF7r4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNCqDkd+/my+4Zch5WrbQGUhtinV7vQ2iMJK
 aI9jiLyywmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQgAKCRCLPIo+Aiko
 1XA8B/0aFQviITS2/29twOQtDjV5eET5d/nFw8fkKm/wkjrCB7yhkkDeZY5KZuzKcg4jsg+V6O5
 QUqasSCemq8H6HSaF3x3Y/MxlkGlIijcxWzSPHyRyO7qmdIOSkzAoNV32UTj7KQU9RjWp2h/QuN
 +iY+viGXFR7vGTK3Z0AuM2DTeyG/ryvEDbU1cvhJKEfdLFfwXCA605iqR3ehhcJR0TtFS5Uz2VU
 qMvdB9jBrFSuoACAc4vNWoN0e6Yic2FQS8v6tmmbM37s7Qk89tsD93VI8HZWz+OQ3eaFfauQ7og
 Nz3bKCkpqxSkpQG1tMyF4l4iVGxNgqlbG+1qaAclLxBhiKx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7To0TtnqoDnhus67AdGi_s5FrWgeBC9i
X-Proofpoint-GUID: 7To0TtnqoDnhus67AdGi_s5FrWgeBC9i
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a047362 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfXzMjMkQeMN2mf
 LF6NjoxENOgCIG/tV/cF8j24KN4M5Vz9nTwBoMrDnOAyoG8TEBQ9ZS5EUpJE7IeqINfR+pp0TNA
 Q6A8GryAsay4q5CYsJxio1YOo0UvxCdjvs0O19ytaaRQqfq5YzP8rRiNf/Aq8tTXqDE/0+tmhkh
 Dp1gG+PckJEEDjcnJYPhudQ7CF7nHthWBY5AU6U9KgkzAilSkPn8/vUaBS7daLD0o1pKbiTjb02
 dn9VILsOEgJDAWM28rMQbn4EIrrXn3XWm3rAzjexXlaUjzHhoKNBCkA9c6tjvWez2ntSEQrjY1y
 mnq/5sMoGlcwGsebYITKzLMpRbYry160kPrJ9+saBPgfn5l2YbB3I9x2ARuDpdnYzwS7MYsvchX
 zlEuNA/lF8l8fX9u2IHffz+sO18bXPtHX66kQkWr6DTFEAJyRwvY8akLkMyxWnNRlzEBhA0wB3a
 mzTqla4endPoja2lsUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132

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
index a87e8afb23df..8838fa958571 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,7 +1074,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,12 +1124,15 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
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

