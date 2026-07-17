Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D1F3655D9
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266333; cv=none; b=ZUDimI/bO/KZOYWRgGA+uXJigkhRkX4Z6upb6HhhXdSMRlrvX9MNzKN/71MM6qMWWFbHAI+CHE6m3ZsuyEtMAQoF0P3HL9pFwPY/XSKFxefEMc1sEDaZXZ7bgWaaXSADbI1m7l8x+GAnf9A4SVOaRo1Q+GGmvkLpm/Kyshs6k4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266333; c=relaxed/simple;
	bh=VLVtBrficZ53U+t7h3TLEukTjKWLwiagVpjB+rG9eno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6T3Yo6yOuELEiWMmfXiO7OMR7dZStOW2TZb4mdAOIefGvE6HxnUOOD69vac0Q0A0tkNStsJFQmzVlMLP1zOeKgJG02uggLj6VBP3ofC7AQoMFqhssE0qw/fexnvzdJ60dOTFGHVU8TZvQoqPv7ILy2f7sIda6FBw2lnxCT41GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9qYYKUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSll/i77; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9qYYKUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSll/i77"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33cTm314084
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=; b=Z9qYYKUcEL9zoKdX
	nfhPMO6qhF4UNa5JGvPRvjPpP7ca4tVi6uVpbjs8Z/Urw30a013nSodNHzi5tIbg
	xRD0n82aem3bEGpqdOrTagh+vRNGkM8QJQZZTWOk3Q9LlDzORoC1Zs4wzUAdu4yM
	2Qbv3yQKmT2wsghZnpVBT8srtoxIVWL1jhkCDSuZmimwNsyh8qw5nMPiZ1sozO3k
	1wXe5OxqfuOWYbm7u1BgmdksDGxew77ofiG4F7V+kpJFFUNSctNmVCyk5WbyBaoH
	UKnEvUOcaoFoWB6/0tO/5O6i+17Gy966VSHEM6cnCQC6sIx7jj+mPT86Ppo5TEGU
	AaofVQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8j6vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca3673560so136516605ad.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784266330; x=1784871130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=;
        b=gSll/i77SKP+V+Jtd4LWEZV49LDMbSF/h1exBCG1X1omTRyAYyFJUce42UwNyBxRwe
         7oGiJgMiI02qlQydjJ2pofjKk3voT10GWnNOoA/lN7YLlBiZUgScexsybjFo2F2OHTEv
         Vd052XqE94I9/5bWbd4kBcSROPXcW7pOwwmJ1kLgJ1qo2Y1x0vd7QLecQZX/dpnJtJjH
         LgqGblKn3vQx636houlEKUwl8DQz5tf0HvKq3uUZJS3dodafWgTpUBQbj3BaH0cjNS2/
         KsaFviEIf79PcpibDRez12DucT6+8+heT0SSjpghBFZ167IJnoQHe0gjPfsLnKbUpM8G
         os+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784266330; x=1784871130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=;
        b=IlifPb501+DKB3CYCm5OtB+GeOOOKqjC2xq4kTe3VdxQpc7u6Ppd6tvqWnysFfO1+T
         ZXVGtiE3ZN6+9NWQr7BFZ4DlP0DMetI0VnydrHBgkgYwGOkJOTamduKqP5MzFjT09VN6
         mliDgWZxAOlnJwl8zjgMXoI6Fgk8I1dog8JBA0qjoh6+pphIkc394OJL5TKDuJ/CWLc4
         rVJImKu+TFcJF2/XokZAqD3c55OGUmBbVBLjbEAxUlbHcLR1Te17pl7FNfxedK5w+Bta
         CNtyKWYrXxHdfhZwh2IfUZ1/R7pLn8OPAW4pJSYqgkFODml434DKnIyylK76MYOnnNLA
         6dUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnXWy0HcI1mAGnGMLlATHlZWBli3M8IItFIQWMCT4VEp5igKlktdpny6xDMUfE9WD7X4K1jeJbrWqu@vger.kernel.org
X-Gm-Message-State: AOJu0YwF7fgz/seui6yRWQSEtXFl5T64xF2kyjujw5YJi39OqjJcxXjv
	St0oj321NQkuSPXK7RDBSZUeIgY2YTaAAvCcJGigOnSwOIUoEp40/vkRrlfGycmH8iTsZVT/d5b
	wh2NmYEXU4EqvMKbIu1tMy3xtwoJD6Gzew3EcwFChC4JchGvRJFSmIJk4lPuXIL3dFGfaaNY=
X-Gm-Gg: AfdE7cmM27LZ6tRoieaQ0qo+tFTQPTad+t/Ucr5Icmf8i8H11O7QyWOBt8IxfCB5Sv8
	7uM6QrtF7f7LjObQbeOOJ5BXqUinSE1yxi/nIiwTfV8dNXIER0V5vQLqwrYpSONlU3UtD7QFBSI
	2iDQqwwI5v3EC4eSOvmRJ3gQIyRdnwFUJrBTraDn79AStUgl5VXudWI5PdP4x/MXU26uqQr3xVr
	dZdMqXeLDjOP7iRtdtzIXWz2nKWOGYYtWkrRy+owbAwCA1J1QxL0VOS7fv0KgYu4JkUaIAjPTZx
	Cn6FPCI0u4m8zs7MblSB+ONh912cF7aMVOmWTAve82uzxuxw3KEA/T1R54GbREKsr/8O+m23yRA
	Ps2zbjKki1IcEXzGQLlp1YHDLXgVosw==
X-Received: by 2002:a17:903:41d0:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2cf34a4c2b5mr11630135ad.38.1784266330374;
        Thu, 16 Jul 2026 22:32:10 -0700 (PDT)
X-Received: by 2002:a17:903:41d0:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2cf34a4c2b5mr11629855ad.38.1784266329787;
        Thu, 16 Jul 2026 22:32:09 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm4189885ad.9.2026.07.16.22.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:32:09 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:01:59 +0530
Subject: [PATCH 1/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-pm2250-fix-supply-parent-v1-1-a6213a42a3b5@oss.qualcomm.com>
References: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
In-Reply-To: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266321; l=5456;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=VLVtBrficZ53U+t7h3TLEukTjKWLwiagVpjB+rG9eno=;
 b=UX7CtAwqgS0D6eX1OtFPv20MdedWiC5oS1tYUt3XLftmZhIBIwKuK7c4tzxdj3CHBh83CbzyJ
 PZlF7y/yFcUAz40U4yzO8/FfxD8YjF8Rm4e7UgsdmLa3SCgUShG3YTG
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: Wz3ULYPCaPahuU6vUKIy9QhsASiyafdO
X-Proofpoint-ORIG-GUID: Wz3ULYPCaPahuU6vUKIy9QhsASiyafdO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfXxtbWccJBapLR
 1zVhfnOxLEXOJjZzPhDizC9LGitCYNCbxhcJueHoq5AJk0vPIgza6Nxr05MfUxhBsj16hqjyz4E
 VIuYxPHkcYfR92822lvLAtpg4m+K7ko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX9baQ4ioUZHBY
 +HAr7PiU25SLwgyNKZv8Dbq5imfdOPB2KCzMV8FkFaUYNjz0QqEHxChK6ZzhS/lkAEFmzWQ5XhX
 iP8IRYLreosqyUwT7XsX1I+r/7+Dgmj783CCdULtSA1l2arAFaqexzF6EHObIxj7Bq0T+0sONPS
 K2ArRN2qqo9pj/qyJkwsHduSTpGr/ohi/kNKvsHP4oHlkNkO2uFftTmh+0zLsnOaYBA24kKp3DS
 2J7jsYFknDAiEoX+gkFm6bh29uqaZT0xtv/Fl6k8jCm/V+mXBcrpRO+kfTDCMr7Lg5YGqSMZRez
 0l1saCSVsxitOPUS+kZjwySqzQQTl2rKqx/gYBpcafLLRncFUQuW5ZFgCz/Y1irTWlcTZityTBD
 6QjeJ7Lkfit4GYaWMBFJ7eNIyUw+0X7/31Yy34oYZIwFg0EkEnmViJALjQo+CC0xtUfs3BenEAx
 LMP3iNdiHdoBO9Hrntw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59be5b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2ye8FTLVYv3UXimjSTIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170051

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

