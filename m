Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF383845D4
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670035; cv=none; b=R68lTnX7NV8yAflnp6Wzs4T7HmltmoQ4X/XonL79preFbqydasiR0iQtzoFfNEGCagYGSOdhWL6DgJI3Pn7EfI/QJiFfGLSjt3nMhWrEMZ1a9tiS4Bwj4McY99cPODepAgVGxD8ASQl9hd1cy1G3vB1tmhdXYOi8IrMZPY+gPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670035; c=relaxed/simple;
	bh=pgk64wORibDBfZ/mY7vvMe9mzC1BC/i4WSpJj9nKKCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/xb6h+sVRjyJmQeD+UHR3Y8fpr53eM20VX0gyJy9wfGR2E/bPFCYkTyNwvSNkNgpDQ3Zt2f9Rub3EdJjHI/3E0uN4TIjcLQJAq9VvXLuabtPuafT7Mf7db4xa9r6VDFk8gTGLzOb/j+LJ2Mkh4E/o39M2ooXRwdkEfXZyvplBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCPloTS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YheJwUIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCPloTS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YheJwUIC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K70GAB3212117
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ucpDjk979lI
	3I1m3Lo77yDwLYJD2kvY/g7LlNYWXghk=; b=WCPloTS9klqVh/TbJ6S718zusYY
	DDsON7pYXH3PJtTYLH9WtR4I4HGPANQ0Mv62RMxx8F9Pjj9dW5c7yB2F9pZ7L0i1
	J5LD2T5ZS4EJMyw2ekKQpVDo02U/vL4KANxyQYoC8/PAA06FU3k6qZ9vt5YuYUgE
	+AeBfIiPrzMKl19YICxBS+LQ4RLcvCTWIki7iD+NZV7kxltdb2CTgw1GdCzWnOlj
	ZYCZjvjFN4gpyG53nHNHIBiWO2uMvjeWZfhD45UJGGjaPuKRK/eDUQB4C/lVtCHy
	HlhnR7D8A1ov5ShgR0UhLSeonoNxRRpXENAxh0VEWKPPV9qWFS43uHbrCqg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfg3f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c897a5924so967513c88.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670032; x=1777274832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucpDjk979lI3I1m3Lo77yDwLYJD2kvY/g7LlNYWXghk=;
        b=YheJwUIC/HObtt99GN0UCN3UBMe9jc+5n5ewsf+kBnOM3B/2AXH6bdKEHRBndJxPsJ
         Fmri16dQec6nD++/oQ4KLOxXLn9DEz12TIOxBivXZ99+LV1DMIDNsCiO/ZkpZhqwJx3X
         +Sdn1eoYajTOITjXayYw1J5ELmwPxJ/UY5yR4ZffCo6mkCuyKmI0n86MVcUgKjU7+ZtQ
         nmHYcPQGpvfP9+K4Ac2MOf8TGqP1eIR1ohjKbLUvu6XQjfkHPiiJ1Pw/0t9aUVJP5FEU
         pMnwNNkgY3AJhinlLuCsx1egU7bVkZUxXZRyYjoZwFSAPtcjqsrWUIHiz532YbbiU0Uc
         rFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670032; x=1777274832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucpDjk979lI3I1m3Lo77yDwLYJD2kvY/g7LlNYWXghk=;
        b=pT31CM09Ylvi5/qeIbFXzCgBjxW/HrIEVAu2h4pRYGLZ5tBuRYsXhrH0ignUIJd1+i
         r5z+h8HLDDPbwOGKseVSJPxEH8Dl3NqF1x1i+fVRt+9nNJZ3PAdV3oyrWtAx+iTPM8wK
         VuNjXtTGMFJP5DjhLI0ZazGfxgdVFtRSQ/CqS4/Pi+Opy9U5ZjTabj8NmXFGTZphIHWh
         jPFbPZfBdvgCdndnGuz3uGy5nbNLvnLW8kyPk8lOf0hSoEzvdA7pjqMM/Fh0UTv/l9BH
         yyGOaQSWzcl6Zt6cHpnGn/J9TTA9w0m/mTIMMBbgYj8jfJpDGad2K8spVt3GXNO7ntkW
         QNLg==
X-Forwarded-Encrypted: i=1; AFNElJ+qd40X5q2bPf8DsZaP6hEP9FYYbQh+iy8hlSEpWabd34Fc1hZ0WyKw3tCMS9yNPkNA7rMIks69B0ow@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7e8s0jVe3XSoYWFKFwavrojZ2NmMX5vvic/rXLb/YBw8hrmvp
	WbxqPdiRErbe20Fu5mPaFlXwUhOnPb6RlyxKkm5eeTfKhXWbHHOYFeSPBquj78UBj0FH9r9osQj
	gEMOtIfSnQta8r7l01A45l90rgqBjwwTWTWxQHdTgvVIWvS9+XfaoqH+QonVdWILR
X-Gm-Gg: AeBDieuEU5iFc/js+7ftlnICxEduldWAX701RH63MjFrs28kZuSmI9vAqZZ4k3d4kW+
	aeNm7UDmr75ZSC2mEZMcQKNoQS8Vfz6Vq3lJ4GYGMJbCJihxArCUEr8PCbrbiCD6pKeclEEfPch
	y+ROEJwoBJxfrMZ6QKhb6qrmZI7bMRHGzAvM4d+42qfmyldoKCrUqnTUUK9mLBtIs3odtlcqoM4
	kU9PfCWp/7fvSBLVkU+uG4NWZwGX3/vmJJDLhxAlBvfgfAp5N91cAsmcmkkaAgAyZCh34qPShUj
	jmfW0ySyPvXvN1O1jfRJdwbxuQdauKfx1Bd8SEyvWWNXiw3qfu/MzFlKt+Em8/L38J5yHXuBcnC
	f5etXdAPROoce32kusRCmgvVzhoOKTwBL6MWyiMFKt7hcWvxaldpHsaoQsR/sxSDQQJtQKbDIgo
	SBCSHOT0sch2rFGscs
X-Received: by 2002:a05:7022:79e:b0:11d:fd26:234e with SMTP id a92af1059eb24-12c73f9972emr8064211c88.16.1776670032151;
        Mon, 20 Apr 2026 00:27:12 -0700 (PDT)
X-Received: by 2002:a05:7022:79e:b0:11d:fd26:234e with SMTP id a92af1059eb24-12c73f9972emr8064174c88.16.1776670031506;
        Mon, 20 Apr 2026 00:27:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm529413c88.1.2026.04.20.00.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:27:11 -0700 (PDT)
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
Subject: [PATCH 2/2] regulator: rpmh-regulator: Add RPMH regulator support for Nord
Date: Mon, 20 Apr 2026 15:26:39 +0800
Message-ID: <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfX6P6lkEU5va0Y
 q594XI9CG7oPTqW7X/993z5VsmNco91gMvpt66OrmYnSp79WDZcsIqfkpg76fP5k739u4pxBAxA
 Fc96af+15Vlt1VqeN6wgOTO5iOjPb7HYV5HW403lTByXbWrQQfpMcPcHbG729JeNfdAYGWMNTMq
 i/ZaZ0sqzV0DM8TMhZgP6BHS4V3RPWgfREJJD6nxXMSUzVHbJpzZNf4gDUzjSUBbEUFEdMfLMk/
 caWiGvlj+0iBAgZT3S46gNIPPtYrKH1w7TPhNXIN4Fr0mvuVGy8HqnQ+GmX8yn//sNAdQWgYQDV
 P2RE9YnZctK7PmUxeJvmvXNJJghj2wz6w42iMo0hCW5p+kDILiFjZRBPyhT5wGk+4vsgXve93vk
 Vc0VNkoXC9xvcgLouh8LiR/NIYsKyrwryiIPnz4nVIVJFVgQDHE5SD90encKwo0kBc7320fRKY6
 DbdtjQvvb4lKvVHVAPQ==
X-Proofpoint-ORIG-GUID: ejUpGkKHUxWWQlJUxOSYXGDmtwAMWpDc
X-Proofpoint-GUID: ejUpGkKHUxWWQlJUxOSYXGDmtwAMWpDc
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e5d551 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jsfX6IzCLFrmiuH_c3QA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200072

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add support for PMAU0102 PMIC voltage regulators which are present on
Nord boards.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca..9545300d7b03 100644
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
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    NULL),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    NULL),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, NULL),
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

