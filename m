Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E73FE364
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469207; cv=none; b=Bj2o5fEi4q31b54RE1N9xlsHZhuVtMBd45QV6LiqsP8/7BPhiqpaDuh03DIUEHGiUmnlSS7/i1jYEnRe/kCfqKVtqySaYGuMfvh0Zt0z45L/0GNzCWclikPLpr6WAewuuy2R33G/dEUavk8hGlqaOjVtitubOufvQJWWuGSKS2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469207; c=relaxed/simple;
	bh=HgnxSG6CQESGRtfziVGUP2mLcl5BYUgeTsVkHqtk3kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2zRCQjOlZJbzrNSA3ocvldtM42TuZ4QgK7l4tRBy4VG7spAxsADC+IZjm95/vwkazN6BJTbmfANXZ4iNzHre+68tLTSlcr8dnnFT2VIYitvZTeYhucUixDIacLkdsC73fU0vhGzRireGSH0yF9JNb+RXwht6VAH9t9f/Fa2fPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMqhbqkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PH9GN3Sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMqhbqkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PH9GN3Sv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8prE51728581
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cisvrTH7ucP5Jy+PZpji/usAESy5UWgctRuI7bfldG8=; b=TMqhbqkjKE9DQ6qW
	zCd3VYcEnE3HuCwa8jPZfze6uBPagMm+cKXvydxRmYTSohKHjAD5mo9j4jy+1iG+
	NpD7oC05pyjN0F1Pj9XqMHAm6X5I0Z5Kq83X/SqDROA4KHJTAxcmWfdTnm/Uw70C
	1+zwQQs/KH2NPu523XR23Tm9/39q9HLS0TIk3iKqQ/vF0xOx+HjibWtWxKU0/6xW
	bdrL6atcxAssLRUqCfqCFENrIaQgXMieMdkgrmB23aux0cpd4+me0oW82rxKfMzl
	UfrHNxSBehtR1mwTypWfEoY1mGVSw2+WCEUou2UF0pcszrWHcEmQGxFg06DayCjd
	pvdSTQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5ks6dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so13180746a91.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469203; x=1778074003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cisvrTH7ucP5Jy+PZpji/usAESy5UWgctRuI7bfldG8=;
        b=PH9GN3Sv4Uegdea7dpc1tFh2Jk/N06pcvWB20WW2REMmmcL2PzIFihKmhngbm3WkVg
         zJjbRVQyN0wrYAKN+qlZgAvsyqfbCPJ6rLHPGepjXapflCKGNX63CTzC+EStt9ROmDS6
         ko/mhvPyCV2cA8XmjalMBZ+/vgsH1Rj03uoI4PzFolc1u/tXeRn++eYYB05WDyM4bnRp
         lwLSHwT/nP6qOVw+yo8Lp6v/qAzD4X/QpZD/Qk9i52dOPID8FjccxVG7LV31Bf1s+q94
         flbXijsAOliXNRWEQPf3SDkA46kn+883Uu3hJaOcHdXBiiRXvlFOfw56vwOLpIXH/1K5
         /Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469203; x=1778074003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cisvrTH7ucP5Jy+PZpji/usAESy5UWgctRuI7bfldG8=;
        b=QO/WGSMbZDdI+6kQn/NQp1VYsrjpfaNe+AMh7bAreCUzhuUfQstvlIL7Gwug2uA3Bh
         UYhIoNLrNkPcEC78ftT0jv3JpP3BiM6yCmPGyEaGesxQGuBkVSSVo3CnXTIFoINS+RaO
         /ItJaYTjlifM8KHsZXvgziRgDrm5BMHu50LtTvH9fcVLRH2E0KoSrf6pCH0KyeLVr9HH
         u58xCfh/6omI5cBBpaG9jxa6LhjlohUbFMm/PL5vXxDzoOigMv5Czi40L1gkTn6k3JwY
         gEZw4/L3GvjQ3Rv3O3DUFyS6y/0aCH7kAW9pSOx+oNV2foxUBZLVNT526T1Ugjwdc1Gl
         kxPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bzg4XDojq2dMJS1aklKvS/2t2k4Yd+5HZHt1QhGxZhEh2BvQzj6UUZKhTAnkuy5G1sVFV9p1D3wwR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp828IwOFVUfelzafZbisGwURJt9P2uSpa5YCLTj/8JIkGT7cN
	CdgE66QRfRrNmhCWcjl4/8w2pRlgHcIB6zMPMBAFfPN69O612rsCduQvkngzHOpgDCNmr4r11zt
	cC8iCfe30ZAS9Ai4VWwGbTDovSFsbTedSR2crHsCj4S8MWItPEtHK6BSUuF6gdXg=
X-Gm-Gg: AeBDietaTjKEZ25w1CRuNusesYLcOrvUix9UZwL91ODMucCsmshGJPg3I2IMVY2nTco
	tEl/CYAEsMijowZPuvr2RhwwUSyMS9UhWsoTWub1bBQ3xpujcqjpXotp0lcFwjFS+vKCYVBHts+
	aC4bTCrRUtCXBOXt7ojYQL6GAjzaMDWuFEFhcWs0U1ZtqaxQ0fm0Cw6CypXd73iJGyHgmG+v9MP
	LQjN1bG1lT+qXU6JTJb0B1Wi6Ig8nTFZZTb6vJ4hcSSCZf6/glheMMXx9nncRTzbfnSRO1nyvVQ
	y8wRaDMfzlZ2tdq6T7lA2sURU7q4ERt4rqlSl/FQRNGpLple1crtNIBjqJVa8Coguv2B+QfLb6L
	O22VtsabusI1LYGdRwuChIJzvNOBWv4E5fmoBMQX4mqpC1XtF9qIkrw8mnOwP+w==
X-Received: by 2002:a17:90b:35c4:b0:361:423d:2026 with SMTP id 98e67ed59e1d1-36491fce3b5mr9442462a91.12.1777469203236;
        Wed, 29 Apr 2026 06:26:43 -0700 (PDT)
X-Received: by 2002:a17:90b:35c4:b0:361:423d:2026 with SMTP id 98e67ed59e1d1-36491fce3b5mr9442408a91.12.1777469202774;
        Wed, 29 Apr 2026 06:26:42 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a02c5347sm3066513a91.9.2026.04.29.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:26:42 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:56:19 +0530
Subject: [PATCH 2/2] regulator: qcom_smd: Add PM8150 regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add_pm8150_regulators-v1-2-9879c0967cf0@oss.qualcomm.com>
References: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
In-Reply-To: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777469189; l=3511;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=HgnxSG6CQESGRtfziVGUP2mLcl5BYUgeTsVkHqtk3kw=;
 b=WaEaerb6eU4hwB+3YZ3qWHolFNL+6Yh3eA2gTP6MZHRvCIwNrpawht2nnrTegO0iwvqXXTm2Y
 NrFmh/7YulIBAVhiLsY0l5VBurNzm25Qp+x/ih6tNIXZTD9Oy6W66Xc
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNiBTYWx0ZWRfX1jmq+7s64amU
 c65XMNzil8FeehBofotyPVVPt7uQLOGsAssdPlaosjetDyWYse8o8DMs86nAF+RR82exH2f+hnN
 jfYxZSR43NpAkT+EGPnIGXYFl5VvSSvm5ufg1a+IbQt6pu+CUrQLx5gCC/E24RalIwfYN+CYAS5
 teN8HJyxDgGs05ZRFLP8BLASxEQY2uR92JOcbtNVRHoS0LhY+aIIE62aDHMRqW5+hUD8QA6tpr2
 ZoFuLiMLNvgoxFgxRu4ldZ3aBIrzJr7z+AdnPFbufgdI7+LINSu/icGHndHmWzlSThaUV4ETLI+
 bdxK29xqQFMwVJuwFEWobHT5kWLsoSVOt1oYIRcRIxZalMZ8yjwPUcH/0S35BsN19lP1TxkgU0x
 /xevL1Hyzsivw8iuPcNBwKbMYseyE0Zr6YPIUDZfQsfrpkqdwEoM6Ca4Uf59ocVVDNU5g91J9bh
 4q0F5r/l7B1CpZS4ung==
X-Proofpoint-GUID: xj2hdSTmbqYjI6INt8dhi8OXV1UjacMK
X-Proofpoint-ORIG-GUID: xj2hdSTmbqYjI6INt8dhi8OXV1UjacMK
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f20714 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8gSCahTmEWBAQWhSExUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290136

The PM8150 is found on boards with shikra SoCs and It
provides 10 SMPS and 18 LDO regulators.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_smd-regulator.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 25ed9f713974ba25058c9dbf38d36e88f70a940b..3ee7f5d0c694dba74b4e7e0e2e88db275d9ac3db 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -913,6 +913,38 @@ static const struct rpm_regulator_data rpm_pm660l_regulators[] = {
 	{ }
 };
 
+static const struct rpm_regulator_data rpm_pm8150_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pmic5_ftsmps520, "vdd-s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pmic5_ftsmps520, "vdd-s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pmic5_ftsmps520, "vdd-s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm8998_hfsmps, "vdd-s4" },
+	{ "s5", QCOM_SMD_RPM_SMPA, 5, &pm8998_hfsmps, "vdd-s5" },
+	{ "s6", QCOM_SMD_RPM_SMPA, 6, &pmic5_ftsmps520, "vdd-s6" },
+	{ "s7", QCOM_SMD_RPM_SMPA, 7, &pmic5_ftsmps520, "vdd-s7" },
+	{ "s8", QCOM_SMD_RPM_SMPA, 8, &pmic5_ftsmps520, "vdd-s8" },
+	{ "s9", QCOM_SMD_RPM_SMPA, 9, &pmic5_ftsmps520, "vdd-s9" },
+	{ "s10", QCOM_SMD_RPM_SMPA, 10, &pmic5_ftsmps520, "vdd-s10" },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, "vdd-l1-l8-l11" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_pldo660, "vdd-l2-l10" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, "vdd-l3-l4-l5-l18" },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm660_nldo660, "vdd-l3-l4-l5-l18" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_nldo660, "vdd-l3-l4-l5-l18" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_nldo660, "vdd-l6-l9" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_pldo660, "vdd-l7-l12-l14-l15" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_nldo660, "vdd-l1-l8-l11" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_nldo660, "vdd-l6-l9" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_pldo660, "vdd-l2-l10" },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_nldo660, "vdd-l1-l8-l11" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_ht_lvpldo, "vdd-l7-l12-l14-l15" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_pldo660, "vdd-l13-l16-l17" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, "vdd-l7-l12-l14-l15" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_ht_lvpldo, "vdd-l7-l12-l14-l15" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_pldo660, "vdd-l13-l16-l17" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_pldo660, "vdd-l13-l16-l17" },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_nldo660, "vdd-l3-l4-l5-l18" },
+	{ }
+};
+
 static const struct rpm_regulator_data rpm_pm8226_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8226_hfsmps, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8226_ftsmps, "vdd_s2" },
@@ -1358,6 +1390,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm6125-regulators", .data = &rpm_pm6125_regulators },
 	{ .compatible = "qcom,rpm-pm660-regulators", .data = &rpm_pm660_regulators },
 	{ .compatible = "qcom,rpm-pm660l-regulators", .data = &rpm_pm660l_regulators },
+	{ .compatible = "qcom,rpm-pm8150-regulators", .data = &rpm_pm8150_regulators },
 	{ .compatible = "qcom,rpm-pm8226-regulators", .data = &rpm_pm8226_regulators },
 	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },
 	{ .compatible = "qcom,rpm-pm8909-regulators", .data = &rpm_pm8909_regulators },

-- 
2.34.1

