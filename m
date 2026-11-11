Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416626;
	b=O0ApY4zi7UOiZDIVkgbGRAsSQDcKeIjQVZXR/EiN0bH/ELq39uykoB2qErqe2kpU8ICR
	 +kvDnJ5e/HiWv2bj8CNBi2Li+oAbr/f5grcM+iZeW0Bk6eD88UxeDBJzNwE7K/NtKxQ3P
	 afsY6OjceFHhLs5kXCC1/Fq0IBaOpYbFM+Po5FlqJmtjdx8djyGXCxA9S3CBQowtc7pnT
	 Eq/0/eN/G488dkDDg7MakU7n15BJ9AMp+jhR+5+/gawzZZMgqrjhM2ae1bHViriqqCubq
	 tU7w404tVaJSbXj2RHrpVUY+Gjsw0oZki3OO7pM2N0QoJ6sey0/SfuOq7qTBjOgLBYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J+qZCltAcqejct8szYhfiVnTIvGI66yxeSULXoBe8sM=;
	b=GYog+ya2+Fh0uV35ycirgu1SbOroV07MM6Yc5y9yI8IXYbekokfWHW3mh8UOKoOKqkB8
	 r2SYi09vgMrM5Z78UgmHasUjHAbOCwniK6QY4gy8mrj7QcgVnfajS9adQerisQTpV2SZd
	 AJpEfnjkvGn9j0qtWdj5ZcRSSYd3oAf2ISCmMHya8vWRwAfCYItkiJvDU+mKPjFH9/w9I
	 KIqFXgjLUVBI2074dg20ul19M9+bbY5FQAKZcGC7du2FJZsFMI+UUouPoiPxH03VGjsvy
	 iTGxrAXIBY1hrjON4sXjtTI/iYbxTO5kD+lYKZhnxR6xK9muZRb4aY73zqlwDpIHekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYDEHLBd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WtpqNJ1O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF24606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF24606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYDEHLBd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WtpqNJ1O
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Jdg3289946
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+qZCltAcqejct8szYhfiVnTIvGI66yxeSULXoBe8sM=; b=GYDEHLBd8CdEZ+CS
	IBjVgy0Ncr5GFtZwtoL648eUJ35ZAxwoH41lKrj/Oztm51F7G0DdNvZv5Zcxt2C5
	Ecz2WBEJEk+RGkeF0/EhP1MxjDTpAVASft1yJnIQYaN4FWIFIry6bfW0WWpy/7UQ
	sVn691nH1qt9xza0ADM9XTCy6VRwLNfwGnXSLVqxa7iAfuAU64kBaE8Z0yLuccHT
	rR2F79QTJ6IYakemfJtaBZ0yO6m9r563dmKRIehIY+30f4X5cucCS7QrEvAM8HYV
	B9+aY5J3RImOwYiGdqDsVysY1LXVVRvmvanMKkUbdjfn5y8LqdlKSLYdL411qoXe
	zEiEDA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt150sn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so4699369a91.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416624; x=1795021424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+qZCltAcqejct8szYhfiVnTIvGI66yxeSULXoBe8sM=;
        b=WtpqNJ1Ov+OfH4kPqJq7pe2g/4Mcs2xdzYZbBHiE0yfyASoTAsgBfo0jq3UsgTL+Hg
         3bfNUYaEHVLgOUjjIjrw+OwgzHXToCLIzo7VuEOpegBnMkeu92ZVcGjd8KTBBYtcKtp8
         QaBlbbQprq2KlV3RAZ+tlbI3Uwj1ohRNAUB/9u/KPgDfrlQciiOp3n6Ex1ZKr/zyyk1N
         86FnuHw9yZr5C5sscE47JM8Vv8e3knzdCpkCTQyAhsObvqLhsgf1ncXVX9TEW/t5yywM
         SBQ5blI95omI/RBMnQy5t7V9M6q5BEQbhk1zpaJhIeB6Sn4weEyCfzV2XqPqpzPa3HGC
         d/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416624; x=1795021424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+qZCltAcqejct8szYhfiVnTIvGI66yxeSULXoBe8sM=;
        b=ptZE+UuD2/L35WldV9fE1vObrjphh6A9NyMp1qHBkdAEgCIQaZcs2xBF/idT0mm9Kz
         YL3yp6KwvV4JAkNmosJ3TouE0sLSI78FVrmRtP4Q2nfOgkj8YQvSrlwBa+wAKdjs4iOS
         p8ozvM0Mx4omn8tg4E1P8Q7auGp63VLg5/J4cfzrUHM33FsVJxdr0kmfx8c8VvW8K3sh
         EeYmUBkNo6RfbHmzL/kiYrwCjb9gNx9h2HivkIcmunhITDpFaF9hfMerapahkPC4hcDs
         6BXQariFbnKywScsO0l2yWT9yTsv9t6/bF3DIzqz/elaNb3y0uF8WroWln3Mui2XCd3+
         EU0Q==
X-Forwarded-Encrypted: i=1; AL+hErEJUCb5tkabducmC9e03pSsi0/fmBff/t72PRJK7iP2rtekl+WxRWeURtyXnlEZrQxywq023nct10qx@vger.kernel.org
X-Gm-Message-State: APuU4Z+yaSFDCk4fItjm65qYZMiH83RrBK02mJEi2kuXzN3iSV9dBb8B
	h0hBp9QiAHyDpqcwaoqfhMNJxke/rOoG6R9DOO3GzZva9RSmAmREnDY9nzDUP0SIoL9vDnRGnWa
	CfVa+LquV9gXevk9voGKkauGvsANWKcOnR8QGbAWfVYXD86kY5dyH4o94mwjXjgbe
X-Gm-Gg: AYBFou0dKP1Gy6b5a6Viy/kjsxZepWUzilDLHgTJq++Cm5OPwD9EPzqiq6/3lQ71s4Q
	DQBZg8bjg8qw/fhZwlO/CvSd3IqFwY7i15fUGTBuYohjFUkYFV0xIytfL4yh6FWy10qGkx610kb
	VrnC4pMQcvy4+5/Lje0xGXpmGDwtZTpdJ1THz//YpUsPeN+ftkjvFrIGnyvk8mSaTc3czrue2kH
	x7z9LIobwvJNXRwCcx40uhRfvgaUjSFnO6aENsZc7EX+DiYcK+7M9y/yKwfOufPhcV6m9mqP3FT
	RJ+JSHObshh5c4vXKjfppTvB5KKHsKRds09ZiXDKW++wPIv9KCmCms1gSp5SPQjcsN8JqDV0ugh
	k1MYQwiOPLXlzj5USaG5ZaJctTSPwYrx+JOGCfxrZjsg7BMc1rwXUKW2dUdrZqJQmCXo=
X-Received: by 2002:a17:90a:e385:b0:3b1:96fe:f5d2 with SMTP id 98e67ed59e1d1-3b196ff12d7mr182642a91.65.1794416623741;
        Wed, 11 Nov 2026 09:03:43 -0800 (PST)
X-Received: by 2002:a17:90a:e385:b0:3b1:96fe:f5d2 with SMTP id 98e67ed59e1d1-3b196ff12d7mr182618a91.65.1794416623191;
        Wed, 11 Nov 2026 09:03:43 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:42 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:51 +0530
Subject: [PATCH v4 2/7] regulator: pm8008: Add PM8010 support
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
Message-Id: <20261111-pm8010_i2c_support-v4-2-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=8040;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=n8bkGIBO1JRh1eN1vpkRI+zsQxSGMuSSAZwbhRTOncI=;
 b=650qT7LkeCgf7h6Hr8S7vz9TPlO8S4kV5Ra1e5WnoEvzPYQwWjSD6OLYV0H+SNaDVJpJX5vyT
 Fb1bK6PBtGrBhVcmCKp5VtaDOA7Z3W8mwE9KScemaOhE973l5luKkDs
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX88OsevzlnOfy
 Tcm81S9Mg8aI3IyOLt4oEcqx8CNWbXpE3satIuubMEw38ahU2oP994uPyRu0Lu78scIo1segHKJ
 SNByIaFndDVtomfwL8Rkj83GMbwts1g=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af49ff0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=CF1g25cjMhU89PGl3DsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: IfKc9oYqioT0SUT-LvJLGng15PhhmmS_
X-Proofpoint-ORIG-GUID: IfKc9oYqioT0SUT-LvJLGng15PhhmmS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX/B4dWtxZr7RV
 P0KrVzgEo03t5DMTxcKFMCyspCZ/D142nJw09NfDhdNMRWLI2MZf2bQ4Wqb+olUvRfXIOzdufh0
 mz8Lsij0HepF0kaxsN/HoarNDl0acTMIuIndTFXA//gVfqCo49AvwkRJ066UVf34rtjBzg7UODO
 sU9BV6v2iFB/BARIFUw+/2eQ7IAbP3Gpy+GGCUKeyEHmc20IopV1nbG/8Q/mVMUN4qjpY2cRDSJ
 T8FcHhZxdK9KwqeEVEO+YcQA75a1P3XyPpA6RQcXt2OVsJgbFICDIphyN4ZuK5OC9r8EOXTFsuS
 Z6JMrAWOAGsxBg5cJQj6iiCAK6y57gUBaEV074Wb5E3QzFJ9nPFLxHlT6a8CSLsrdesJa3JsgjH
 4hlhwCgqU3EJvxbGj9Iwdtp/JMkADG+jZ32yGNuRisk5R3lgmNBxHaOM4yUttWOSYvq26ZD2zX9
 m+wupfWeghdnFqSx2CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

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
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 109 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index c1ebe5a0b500..0ea4ac016dc2 100644
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
 
 		preg = devm_kzalloc_obj(dev, *preg);
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

