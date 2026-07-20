Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3A3EA969
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544920; cv=none; b=S9a8Jnu7/2BdU0uIaVCaqtzeOCs8ysClbA0mVRcUCcqb4Hs+SPtpAlDtxiS66FjXtqfna2dytZMTFBNpA5zhoLC+Xc+GA0V0GGqaryG1YCois54A3ttaQMnpHKIRPTCnYu/sqPuhGBkxnItqd9T2ymo02k82qv+xA0cwAbLnvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544920; c=relaxed/simple;
	bh=VLVtBrficZ53U+t7h3TLEukTjKWLwiagVpjB+rG9eno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lawVLaE2xSDvApEamhtEP2YtLPJgyesyCMZ6WJNvb/QYrWbEEFmDlFfLFkTuI0t8kvk7tzI8AJ1WJfbuzl/CafPh24dmHrBeRa1iwgjrvkqVgbGUqDfN1Hxu6ec9rPDxRsjtl3TTb7M0Q2u1/rEEIY3vIki20B0+lyYcR+qon+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cedHPh+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDiXCRrw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cedHPh+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDiXCRrw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9w8r72046793
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=; b=cedHPh+yngEzVAaT
	hVyNzIB/8JR3Lxz1r8ROr2I7XNNLKD3n/lE6ClUkWmnulyvsA4p8NTsceICCltLP
	WLXM4g3PTVn+AUsJ6FtzrEUB+fPPKGvYZDm5OnRK9oLhP8Gaautqf1qKlOXlra9p
	7PnMlBWSOijzxGhbOMJVG+FP/Jd5xTbrb6DTE7yEKJfyZ8V4wm/YGEVwiF4Wz8eA
	Wy2MeyLg8xu//+0cTUZLHqWfjFDCYTgnSzMqWS0GiTLtdX1DMXdhqwyyDIc+U/Q2
	dlazH0WQcDo/oJz4ZYNetjgVO6rA3Xsha1QWzxAglpifqibt9uuQ3pPYWZFkficA
	E8ewWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg8m47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:55:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so15128119a91.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544917; x=1785149717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=;
        b=BDiXCRrw8pVuDou0uQxly7dTUBktDSjYIRmYZlVFG9xOIihqb24IT6oh3m9sBJ56gt
         PTd543RW5j/NOykdzHt6glNihkQwU7qQZejE7TC9BcuOV+8kUGFKlJAyeGMrZqHh7kE7
         Kf2iPDyMfHQMa5Lme0s+AfwNjxcVuCYqjgcNm9NeeOoVB9+4bQ0o/a8wfQHGmo3Jmo7Q
         LiJJD9qWI5Z27kqLtpmzdQYh+OskX1om1cVt5MFROm8ApKyrpKYYyp7npCEk6NqKZXm1
         HXUPghN79jRPPdWtj8EYAf8+zfT0edGjcVVIaCGIgCIqvXNHeViJudTxcewIzr/nz+Tn
         eJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544917; x=1785149717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=;
        b=hcitU4KZuPgeXmJxcUthQQakxkl9yxop4TiFAbo9R/+ApUUOSs5zdbFdwmuqaVtCYL
         97YA6nP5duSXA61ddivrDJal/omgzLIxRGwQ6lpODQSXhxSNgSS+l1r2AedwRb9GdFya
         e2J99Ejow2zb3iuvR3mmthkDbjSXPJmRcJRVkQYaJCj2oMHLt1dMANEGtR6JXp4Jl+Q6
         vGTb4W/3lk9iPEuICJ65PGl1Ru02aqAyG3NYoLtTX10nb47HU3HEHLlHfZSv/EX+pnTg
         cYIBKR336Sq1lGwCqpsb39oOhb/QstKDmtfBMz60yOtgbjskHM1vhTA0tt0Z4GaVZuui
         eu9w==
X-Forwarded-Encrypted: i=1; AHgh+Rq181VIGY3EBpY+nj6GPOnX8OopctupCrWFr5sHVeKXRYLf49gkZATp2DcALIAmOZlj7yHmj1ptwXZc@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNwgK7ueQhaFcKWaDN4wHfxVPWpeu5xRDxCHWSGny0X9DbC06
	au6tj74UGOd8qmuLPETAy+ShHOcGyc2ow0EJo3b7vFzehwjw0wf8Sj3x92jsme/KGRtXqkLWc46
	vFtOeMF4E2al5pmcHRyPG7J5Y9Tno1MlrHPR/Q640h7WKxIPGySqIa16H+toRXGs=
X-Gm-Gg: AR+sD12wurIehnHGgpIlufcQZseA2pk31Hn0kVPxwhu00z7Gbwk9PM+qLmScaIStoER
	d4NcqvTRIKhE1ASKsARYYxYuLvuSHU5ob28M7HIQHu47MeicnNu5h3r1k5P794lcnL0hEHvQ7C6
	KGodXE9dxw6/70eGylh/+O1vA0I/ja6TAQ1qaDklb1nR+hIZ4e7WCWyBUQ7mufmC7Xyulxd/QBJ
	1r25q4nuKtsRaik2JchCSD51S7TFZ6RHz1SNUykeRVGJjInO/xz7eQMmtNddGH8jXLZgZDZBhVF
	DNp1zLiWZEROsWd8d9TgSd87bkXRvwXSfN0fYj+rD+MobeftPTITlnbdi+TdbCGKIH4xtvl36Pm
	C4iazPcJ83xmrdvuTaqDbYVvNV/n56g==
X-Received: by 2002:a17:90b:51:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-38e4b53460cmr14747226a91.24.1784544916736;
        Mon, 20 Jul 2026 03:55:16 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-38e4b53460cmr14747192a91.24.1784544916207;
        Mon, 20 Jul 2026 03:55:16 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5661431a91.13.2026.07.20.03.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:55:15 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:25:04 +0530
Subject: [PATCH v2 1/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pm2250-fix-supply-parent-v2-1-60ca47031b50@oss.qualcomm.com>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544905; l=5456;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=VLVtBrficZ53U+t7h3TLEukTjKWLwiagVpjB+rG9eno=;
 b=bZKuq1aE+//SsP/3zA7yOa45uMSh5l6+D9CAjbaIN3/vjoORjJOEsE2HtncGUfMZzdNWIDk2L
 YDx/vtw18QbBjtA1ewLBltbMO4zQTQcbNfPYj6mFvai1GzNOQlfulQs
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: L7FPovNJXo9R7y08b1GXnPcGd9g8XjmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX3Ikb3vT1aO4X
 yYiW5AjjEv3pqrknxANeGvNpdOpaNW6wX1yIkIg5cNqfb8lfSxilYi2tnsiDb527/XaUQJ3PpgS
 eOx8Ro+TWyNK3zmS71EMV5KSd4E6ORP+oPpRVJK8EKFdBesIhj0wAoLimbD4B6hFqp+5TCLfGdb
 whJBwmcksrSKORN7lZqt6OerAoNFzN1F9AS/wt680Myc9bcaME41nePsdSin1UD8xMLgvQTJUNI
 EZDTnyQucmMnU8R9APdRLymeOMlA+56XPeg6r9d0J0RKmRzLvFommHNeqN1cHXOW2FlzHRy5kJx
 B/ybDrekjeR7zKpuTVwrctq6L3JqNE7rlFH6rwSLvHvyujtw2syFGuo4bZCG2jY2YGRoYqBl231
 hIC03oGLLCw3cYYvmRLDnXr3OGfcdj/V6BaBxByiAxBz2GD8VVRIRqOh7WlbVZa1dadF6sOIaHJ
 woEzUxm6sBupMhd8zhg==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5dfe95 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2ye8FTLVYv3UXimjSTIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: L7FPovNJXo9R7y08b1GXnPcGd9g8XjmB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX33+77b9L2LOw
 gq4lYQXa3igvAVmojPij6AWX5wcOJ08tAid72VgHDfvwewFqLBk+peR8o+LO0FCIUfgIE+SHurV
 RouM4XiQZSJl3UhQlEsHe4gbJCdi02k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200121

The rpm_pm2250_regulators table hardcodes supply parent name strings
in the regulator descriptor, causing the Linux regulator framework to
look up and vote on parent supplies from APPS. This is both unnecessary
and incorrect for RPM-managed regulators.

On RPM-based platforms, the parent-child supply relationships are
managed entirely by the RPM firmware. The RPM ensures that parent
rails are maintained at the correct voltage with appropriate headroom,
based on all active child rail votes across all subsystems. No explicit
parent supply vote from APPS is required.

Furthermore, the supply rail connections to PMIC pins are fixed in
hardware. The previously hardcoded supply name strings were inaccurate
and did not reflect the actual physical pin connections on PM2250-based
platforms. The correct supply relationships are to be described in the
Device Tree, not hardcoded in the driver.

To avoid unnecessary APPS-side parent supply access while still
allowing correct hardware topology to be described in DT, set the
supply name field to NULL in the regulator descriptor.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_smd-regulator.c | 52 +++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 23ed594b574e..aed01f18af4a 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -800,32 +800,32 @@ static const struct rpm_regulator_data rpm_mp5496_regulators[] = {
 };
 
 static const struct rpm_regulator_data rpm_pm2250_regulators[] = {
-	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm2250_lvftsmps, "vdd_s1" },
-	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm2250_lvftsmps, "vdd_s2" },
-	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm2250_lvftsmps, "vdd_s3" },
-	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm2250_ftsmps, "vdd_s4" },
-	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
-	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
-	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
-	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
-	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm2250_lvftsmps, NULL },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm2250_lvftsmps, NULL },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm2250_lvftsmps, NULL },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm2250_ftsmps, NULL },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, NULL },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_nldo660, NULL },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, NULL },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm660_pldo660, NULL },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_nldo660, NULL },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_nldo660, NULL },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_nldo660, NULL },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_nldo660, NULL },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_nldo660, NULL },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_nldo660, NULL },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_nldo660, NULL },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_nldo660, NULL },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_ht_lvpldo, NULL },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, NULL },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_ht_lvpldo, NULL },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_ht_lvpldo, NULL },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_pldo660, NULL },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_pldo660, NULL },
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm660_pldo660, NULL },
+	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm660_pldo660, NULL },
+	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm660_pldo660, NULL },
+	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm660_pldo660, NULL },
 	{}
 };
 

-- 
2.34.1

