Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9FB51AED4
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749820; cv=none; b=ZJeLDKKv+DkK8evy/T7IV/cIvYRyawNy8PrXjlFUrA/H+n5ufcY3VTKEOIsrgIdP5YMVaAAxZRw38ngLE1agb4/HzOE9/f8NjitTl0W9KJv5XxU1PePW1Otg7hZKwrxgGGWrgAMS9X4S/6hCsAN3CrEWjX6Rx3V6sTgque+yqGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749820; c=relaxed/simple;
	bh=r6nh29wAJjYRiIKQlxHgzstJ3bAGP6KKtdHK4vRjd9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWbrY8KjIfkwMCx5XxXW0LUHLQe1HhvH3ZiWVDmoe0gVG88DuARPDvtipLrbZ9cZu3TR9xgJTCsMeg3K3fjtaIkQuuM9mIAJcdBFBTac3X1aY8vHQsXUndA0hSvOyHQ4KnCHxUwIOX2hK8Byqy78ImFnbDyJGUg8EGOMQ3YVrUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0uu2389; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1FHrHwv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0uu2389";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1FHrHwv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEQt7m1019884
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RQ79TN/uH+2fVWlY3xaojEDQlE7cV4PHqrghx52HYqE=; b=D0uu2389zLS8kNDC
	5jswC41EwO7vCB5LzzTXF3jkPJe3aALVAUtJ50MH16/3YtVtrray5n3J74JfZv0t
	nAFn+IeVad/V50iIijU2bH2gLGXC8LcvaHI3sDXHeaDJmPmO94WGkXvjRzEfYxVw
	7RIENvGrLvZlxX5wBocPbNTgt53pjvbpIe1yCi5L0E0TN3/7FLJkkvnaUGdWhiXl
	qYmwiuiPSPdZn6q4LBpY6+AgBqhnLTDuYA+Sgf/vPP/7qud2l5RZ/kA+7DF2PjLo
	RSe60Y6g5TS68QhaeMSGHf0MOZKRBY6VGF5VjjAr5tWumse0Ks/Gs42rkJ/9/THZ
	B4qOBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs72u0kpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3734d06dso16582675ad.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749817; x=1790354617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ79TN/uH+2fVWlY3xaojEDQlE7cV4PHqrghx52HYqE=;
        b=E1FHrHwvZmA7/71MsSwYpB9eW5I4nIkpLcePZVmC0iuNYRcKUz1sWgmaKqQ+RsdyqN
         u9stG5ON0lMasBXUMSGkr5RJZDTpapmPHRuPM912eCPrJI++boawNEzxYuYG7/+Q5dPc
         bw90dHbYGtqFIsBUq3Y8H9530lHiECx8je3W38RNFZrPMjnK0qwE2BNwoHj8UGfj+Ny8
         7hZlK8l+3GJuxAsMKS1abciTtjnUOlNUKRJ78SUCvrTxNmv9VfoPuXKsXiOCH7XiGwQU
         vy7zWfs42C4BpnFvoiAbG3Fv3D/f6Ct1v5rHY7WiI/FLMwyFqAn2mLMsIFZNaOR4FWIp
         gfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749817; x=1790354617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQ79TN/uH+2fVWlY3xaojEDQlE7cV4PHqrghx52HYqE=;
        b=pxRxz078j2wjxxLma3EEWwhB3xBO/pbZ4smuT+QBMqcB0X0gd4oVhWD6nR+Wwxfczg
         DZ46cPIi8KwM7ZPEJTWN1Pk3egV4oGQ6pu33gIvEu9kxgfTccD4YdfsWv6IdLcbPB+M2
         Hm/eunI/I5Hb4+ymwPXuJg7btIZJtWUNZsIhUWr3bGi+vtcJUbQeYRjx4jf0ABUd7zkZ
         6QfIrvSsI85F+HmlJOUKHtddrmJbciJyYYgzIbCpK5SpbyFyiMT2VU3qQsxw0v9XOCbU
         m9d3dUEKPG9r3NyO1NINgGr+eNYJxR0uh2Y6BeXcTsrCO6PtwM74gC5TOxxXxydcnsIf
         9FnQ==
X-Forwarded-Encrypted: i=1; AKwUvByN807FXJ4kaqvKb5Zequy0IW9zKvNuD1nmKq1QNhOZf9h+1y8uKhDtZzvS0a9BBlNWKkk2zuKw3DH5@vger.kernel.org
X-Gm-Message-State: AFuF++keF2k3k4K9NrtaJX1VOxWA7SoNII1rMU8P/JnIWFddHnLtUjNE
	YkWcCh94Bkk5C2CXeVjHJOCy7moraWou4IDfYVtuTidxFfzg3+y8wHNsVJZvhhSq+cXjKMay8De
	3Jx2fvHMI9oaAsADyzLZdwhY9PWjdB4DLvO0AQt+nhFDRKGkGCyHWl9WGFBWHtBBX
X-Gm-Gg: AYBFou2u8n1f7GWgy9z5cw7N8FMlkcpELRplwGfiXgFC4DjFlohaE7esUawTAs1U+gz
	qb26F0PirQr+SNa7R5ElL8lJZoADCVm+CWS26dR59NMLdm+KBJZFjhWltn5+b/1ya0QoxKjKut6
	bpXhSOBaNB00OpGVVsjmt6StiB0Da69qHDXgpAAIB1nsW9xzpsWR/2MSb4YAGg5qg3Dnh/h1+fQ
	kVBEgBASn06CMaaRynU8IMiPb6McQxlqh6eZQLE/6M3FpzSZqZj2Zo9bJc1/BmpQNQA9S9UR8Bz
	kWlZrDpztVTUkcyeZAGxqMGZyNcFrSe6jnYk2t5CLZzJ18x8JQrHZQ5UuaqJAgwMqwgD+Oa0bVv
	lmVDRDmvBhhijpFNCAA==
X-Received: by 2002:a17:902:7296:b0:2dd:c100:b2c5 with SMTP id d9443c01a7336-2ddc100b325mr1991735ad.48.1789749817320;
        Fri, 18 Sep 2026 09:43:37 -0700 (PDT)
X-Received: by 2002:a17:902:7296:b0:2dd:c100:b2c5 with SMTP id d9443c01a7336-2ddc100b325mr1991285ad.48.1789749816706;
        Fri, 18 Sep 2026 09:43:36 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:46 +0530
Subject: [PATCH 2/6] regulator: pm8008: Add PM8010 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-2-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=7817;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=9RwsW1Pk6eeMfH8zWmwNuWxanj2MRgu2Kiq84v5Od2U=;
 b=xnvb9bwS2ml7URYhsuLgjyAQ4Gfy6td9BGoXKoTBpgfWTWsxsa4kT1iPyZCm9lv/Z1vtz3dfr
 dhs2wOmK61aBI3Q2P5VybgCS4fz/1tSpNbsrpV8SxnPJfAL4FMUpoF7
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: N8HoJXJ3mzRqvoTSDh6fRtrDcPm5iwUD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX5Zw6IJOVHS+z
 K4vU5k4FEgiul+00hz/0Q88apPX1DPeT0ANplMRd1XEtBw1H4ztLfkU25Sum3Su7T66gOF+d4Vj
 mg/Qa9pDONfLCeJlph7p3X9SY/dVGKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX9nvK1y9L463j
 HPg+lW6PY2rU8SkQr6o1CvyN4h/t6khlT0mtrjI6w1nl7elteoAy+s+aya+sRh/3M4f4jUIKrf+
 q8yl9OCNj4KA1k//Ix1/MoNCliiWzuqolWgmXCV0Uue6W9NnJn7NOaTrUxWQIwMvYn9HvlvIbYW
 7kDr6hNugkgb5/djaGp9o9zVumCa409KIhdz7ZzH25T72l8tCrxTBsT4iRhd88MSFn+dv/Utcni
 D7oK+WWt2COZ9dvnzAXiyFWnf0/DvJS9t59c0r4rRinXGxID/cD/20uDXqkCREJXC3ye+75b2gh
 8czsmwwCcMAnD09K6BNdr5oSqXpeP5Dggvy+wEh+twiycgC+ihQV8bfo80lXaCD9rfbtK6DVcy4
 FVkv6FREANIV/kVCekfZRFJZBBuxh/efzipS3UPI5JhKZqYwDapRxDyP1cu0TMxnIpO2sg2Jstb
 VZZG0nnXwIJ+hDDf7zg==
X-Proofpoint-GUID: N8HoJXJ3mzRqvoTSDh6fRtrDcPm5iwUD
X-Authority-Analysis: v=2.4 cv=DO8acCNb c=1 sm=1 tr=0 ts=6aad6a3a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CF1g25cjMhU89PGl3DsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008.

Like PM8008, PM8010 also has 7 LDOs under it which are used to power
camera sensors. The PM8010 LDO are of different types from the PM8008
ones and have different voltage dropout values. PM8010 LDOs do not have
a voltage step rate configuration register.

Add the necessary changes to support PM8010 LDOs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 109 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 9c9b8be2e15a..b484c0f73eea 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -39,24 +39,59 @@ struct pm8008_regulator_data {
 	unsigned int			base;
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
+	int				n_linear_ranges;
 };
 
-static const struct linear_range nldo_ranges[] = {
+struct pm8008_match_data {
+	const bool has_stepper_ctl_reg;
+	const struct pm8008_regulator_data *regulator_data;
+	const int num_regulators;
+};
+
+static const struct linear_range pm8008_nldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
 };
 
-static const struct linear_range pldo_ranges[] = {
+static const struct linear_range pm8008_pldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
 };
 
+static const struct linear_range pm8010_nldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(528000, 0, 127, 8000),
+};
+
+static const struct linear_range pm8010_pldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+};
+
+static const struct linear_range pm8010_pldo_lv_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+	REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
+	REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
+	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
+};
+
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
-	{ "ldo1", "vdd-l1-l2", 0x4000, 225000, nldo_ranges, },
-	{ "ldo2", "vdd-l1-l2", 0x4100, 225000, nldo_ranges, },
-	{ "ldo3", "vdd-l3-l4", 0x4200, 300000, pldo_ranges, },
-	{ "ldo4", "vdd-l3-l4", 0x4300, 300000, pldo_ranges, },
-	{ "ldo5", "vdd-l5",    0x4400, 200000, pldo_ranges, },
-	{ "ldo6", "vdd-l6",    0x4500, 200000, pldo_ranges, },
-	{ "ldo7", "vdd-l7",    0x4600, 200000, pldo_ranges, },
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
+};
+
+static const struct pm8008_regulator_data pm8010_reg_data[] = {
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 296000, pm8010_pldo_ranges),
 };
 
 static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
@@ -100,7 +135,7 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 }
 
 static const struct regulator_ops pm8008_regulator_ops = {
-	.list_voltage		= regulator_list_voltage_linear,
+	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
 	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
 	.enable			= regulator_enable_regmap,
@@ -110,8 +145,10 @@ static const struct regulator_ops pm8008_regulator_ops = {
 
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
+	const struct pm8008_match_data *match_data;
 	const struct pm8008_regulator_data *data;
 	struct regulator_config config = {};
+	const struct platform_device_id *id;
 	struct device *dev = &pdev->dev;
 	struct pm8008_regulator *preg;
 	struct regulator_desc *desc;
@@ -120,12 +157,20 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	unsigned int val;
 	int ret, i;
 
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(dev, -ENODEV, "Missing platform device id\n");
+
+	match_data = (const struct pm8008_match_data *)id->driver_data;
+	if (!match_data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	regmap = dev_get_regmap(dev->parent, "secondary");
 	if (!regmap)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(pm8008_reg_data); i++) {
-		data = &pm8008_reg_data[i];
+	for (i = 0; i < match_data->num_regulators; i++) {
+		data = &match_data->regulator_data[i];
 
 		preg = devm_kzalloc(dev, sizeof(*preg), GFP_KERNEL);
 		if (!preg)
@@ -145,18 +190,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->owner = THIS_MODULE;
 
 		desc->linear_ranges = data->voltage_range;
-		desc->n_linear_ranges = 1;
-		desc->uV_step = desc->linear_ranges[0].step;
-		desc->min_uV = desc->linear_ranges[0].min;
-		desc->n_voltages = linear_range_values_in_range(&desc->linear_ranges[0]);
-
-		ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
-		if (ret < 0) {
-			dev_err(dev, "failed to read step rate: %d\n", ret);
-			return ret;
+		desc->n_linear_ranges = data->n_linear_ranges;
+		desc->n_voltages = linear_range_values_in_range_array(desc->linear_ranges,
+								      desc->n_linear_ranges);
+
+		if (match_data->has_stepper_ctl_reg) {
+			ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
+			if (ret < 0) {
+				dev_err(dev, "failed to read step rate: %d\n", ret);
+				return ret;
+			}
+			val &= STEP_RATE_MASK;
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+		} else {
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE;
 		}
-		val &= STEP_RATE_MASK;
-		desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
 
 		desc->min_dropout_uV = data->min_dropout_uV;
 
@@ -179,8 +227,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.has_stepper_ctl_reg = true,
+	.regulator_data = pm8008_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8008_reg_data),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.has_stepper_ctl_reg = false,
+	.regulator_data = pm8010_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8010_reg_data),
+};
+
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ .name = "pm8008-regulator" },
+	{ .name = "pm8008-regulator", .driver_data = (kernel_ulong_t)&pm8008_data },
+	{ .name = "pm8010-regulator", .driver_data = (kernel_ulong_t)&pm8010_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);

-- 
2.43.0

