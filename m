Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2AF245019
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252346; cv=none; b=mr63NRegG1VvuwqbcAV6anXVs/pUON+zDDZEEVPm+lTE1OaFIwo4f3LrHoJ6GRNC7wljIyxML6cu9pLFP8o1+VwcMuyIZFQIJtXfbe4oWQLgFnRxMhgzFSX3daVMWGutIDqLBN1Pf0Qz/U9i8P2790aFkBWVTSUyS20lvrnEQYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252346; c=relaxed/simple;
	bh=iG4COkTCGYDoqlZgFFtAAmBBJQU7vlY/JvqnefudTyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tv5vUuAOKwxOx2nsP1diE8gYm8sYGNuEECycqWjvfv1ihJLr/FP3m5LyahsKNdymn/n1ZvQlYX80W+yHJKVUxUpMc2xCX0LwtRWHcsG7Ak6+eq9RZzrYkCLXx248KBR2qrXJydEJJK94amU8g/WD5FGFSQWdh2vIq+WXjMJJgp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2ifikMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZszsIRT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2ifikMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZszsIRT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNgrsv2540636
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZDcRANZglOV
	UaL5FLV39PVd3KiA0z88+1ozBCf+dwxw=; b=m2ifikMUSqpNzi8e/ahUaNvrtsv
	QSxIfN6NjXSFxjFypbUr1rc2lJ238VHztaAv4czL6SzYo65/QzJmfuKukymwloj1
	9WKsWCovwF4BvYcusk9qg4xJ3fl50RETv+vqzTIADxRxhf7xuY8PJwCuIcHYAyOt
	S+QUwbZSQROBhVC3WANN0b/I/iFE/pNLEQ8Uuf8mffVxVgDxKDIT+e5eZ01l/FxH
	hj8gICoqgpibNdj3T/+j1S+J/tgeieBnERpWBQZNm6hl6QXfMRsD2HlXQdVSsA5A
	I2m/INL1QvW4wt1vKy5laRlfFeNChkh199q3OrrBNazjAxApsa3P68Z2W/g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr3vee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d889997495so26038477eec.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252343; x=1777857143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDcRANZglOVUaL5FLV39PVd3KiA0z88+1ozBCf+dwxw=;
        b=GZszsIRTHc6Yc3fV8x/UHh3QsfM2AsEcOsLnZ26YP7SN6srZfMTsR1Cb3iDhXL2Aw1
         HQWEQOYZapDUyauyn9KusCH/18CXzj3+uakks8f8kGNyxtUk2WYT9ySbi8iMqVa7HZ/g
         YPVypbQBp6q+ujM5WRudoXsC+PMt5Bydcp/PphbaR5KjJHvmV+reNPVvzmjJvv0jR993
         C3rY3Yv8zsMYx7HPxVjT74RuA7W9rdI+SFY7wafX8FBUik6wwxXl56Q5IZY00v7qJMRX
         osDC8YqPWLEqVlN16sApRSBymxY+CN1P0TnCk0ZjNnhTvjlOrOsjLW/n17aDpgLnQMpK
         TMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252343; x=1777857143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZDcRANZglOVUaL5FLV39PVd3KiA0z88+1ozBCf+dwxw=;
        b=YVYbF6wu7vWmIbMO+Mvyk7F/x5zLD7wVpyMLm0jWPrD8uIIZOYyRPcQyTiuFO6dSgY
         hxTgdC2IGyLRcdu83MtVI8vT4lf2S9jSAnT7b+uXebM2p8724bQQ0PdTUyanWAD5YQj1
         kHKM3b/C3bqZJcRAgP4ZR81WYT8+4NuEjES4vYcnat1ZYeT/NBsgqvAGNQDy67PfUvWK
         UVK8z0Ff8i83guI+vvP5mUhieBa1ckXVI6rfJOpcMFUIghTIXUK7pa4DjIIx075F4295
         seVqdjLfTUoTODcpMRiEJJulDxK5u3bGjiEgUn0qAFoENALTAIE2o0OEe5mHkBMWNhBm
         7tYw==
X-Forwarded-Encrypted: i=1; AFNElJ9YehtsncyiaXkZ/+1bURkDpQCBFttVzh2gQ7TXYd9mssqZpy6c0okxunhHXYD3UffRtG2EPb5lZWlh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9bCV/wlIJ9Qf7TTog+sVR5tf8EdtvGBbfOpqFej1K7zY+S0rV
	m4hN8XORMbGeriF41caPQFXoG6waGrfQa6XctLekKkepLOn/2cu1WzuE6R7AhDqPbgHCYuG4q5r
	KoehmDOXgOjmaQYTKbEDCXOBt7D/rXgLNH7TYwTxlYkOhObfXYxDPQnJjpwygvf9i
X-Gm-Gg: AeBDies6rdUI8qom4ma/1DqrScj/Yg1rWHLsbUsVm0y7FclI29pahMGUGKe5amLsLY2
	41WUhz/QshiSuvsTbJ0K7haGQExJD1dqHcb4HTBhDeZsVqQPfoOgzkOKtqFJQf3CowvCY1uVkqo
	lXOJzqWq78iQCzrG0aIhBKkvgpHXgfnR7afwGtClp93HvwFWuBbSyfWwBGWJkbFm9dFm5u0MLBy
	iOLsh7tLn/07sl8oRjKG++MFvAWV3Sbybc2FuY9BepWAmp/+LpwU9+rEJv97J7vfhdH/La2ASmn
	BT5LE3LAzE6DSUpO58tbKy6J0yH53SeEP9p6q4mZ4d1xkabcgm79RVzHYNHAHniVQdtlNBxRv7h
	B31cRhdhswk1e5ax4dwNejslzPGKQfMl6jxkAN1BFyA7osgvttQEy9IGNPwqOMwpw1ZaMfZycCg
	4LScDifdo3iIr7yEw7
X-Received: by 2002:a05:7022:6b97:b0:12a:8176:f3b1 with SMTP id a92af1059eb24-12c73f66d99mr23095266c88.6.1777252343012;
        Sun, 26 Apr 2026 18:12:23 -0700 (PDT)
X-Received: by 2002:a05:7022:6b97:b0:12a:8176:f3b1 with SMTP id a92af1059eb24-12c73f66d99mr23095238c88.6.1777252342506;
        Sun, 26 Apr 2026 18:12:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm21720098c88.15.2026.04.26.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:12:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] regulator: rpmh-regulator: Add RPMH regulator support for Nord
Date: Mon, 27 Apr 2026 09:11:59 +0800
Message-ID: <20260427011159.230698-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
References: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69eeb7f7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=jsfX6IzCLFrmiuH_c3QA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: MnFd07WwzlPwRB5TwpZWskX-DjTdltNX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMCBTYWx0ZWRfX3HR/oqwnxnDB
 cGFYDb1DCqYG5Ag0Bre7PjdnpygV5ViuL4So+hVToCvfiIEqMGLvjmsRyCP5EPL1T94288VrVHe
 JYPuSwVerX7YncSvEEKIQnnKk5qx4pV6wqETqWs8qfI1y9FC54R2HiePmb4NLKJv1vwTSII2lqy
 TerX+cHQEFUUBLAWOlLZPpEx51Zir6V4mK79Inwc00W4T0fo98OtKaDOMMMvKNDljawOJ3wjZVX
 HFu4x07zEBZvBwEEHRW4LMviZw9Eh4e1cpAA6CQyoeOx+Q9f6pdpuxPSnOsmBynTIgce7g4IK/1
 1zlvqEGBTXzCGLyci0FVKRYk9V6LuOI0wMAIJWVCjc9zHPsNUrzBVH6mKUINYXX8iRhVd5W4DMV
 JeYpQqDulwtdRoSIwI6MyLJS3EaNW1QB16oJcFeEhW5atFRiwYJXpigNnfjPWyjZ/UFrEgOozUG
 18pKJyz6keF0TSZgKBw==
X-Proofpoint-ORIG-GUID: MnFd07WwzlPwRB5TwpZWskX-DjTdltNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270010

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add support for PMAU0102 PMIC voltage regulators which are present on
Nord boards.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca..87cba629860c 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1100,6 +1100,21 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pmau0102_vreg_data[] = {
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-l1"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    "vdd-l2"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, "vdd-l3"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pmg1110_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1, &pmic5_ftsmps510,  "vdd-s1"),
 	{}
@@ -1877,6 +1892,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8998-rpmh-regulators",
 		.data = pm8998_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmau0102-rpmh-regulators",
+		.data = pmau0102_vreg_data,
+	},
 	{
 		.compatible = "qcom,pmg1110-rpmh-regulators",
 		.data = pmg1110_vreg_data,
-- 
2.43.0

