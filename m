Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21083403E7
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671867; cv=none; b=UsslDCYglq695szQaTtWf2zQ8ppq+9gS0ZZF0aue5zhj0PAPkst9TRUIM1HD7rvMq4c7VkV9x3HYyqA8xC6agSY1YZykkDio9Mghx/pydHdzcoA+oM4vnIO6Fe1CkGPzgrbVUhH0v1XxvEyEUZhSSxEtCvQmo+zWnEl/15E+02k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671867; c=relaxed/simple;
	bh=Ip5DPWIadhU87IAZF/NVvn9ENoIlNryscISD9i7YDLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsW5DF/DWus4D2xxOOd2yZLwO+F6dAb7mg523UC+MUcLjaMKbrSPI6jjh5aug/EVJrIjF+0JaK3NP60hXph3H2j3iW7k4pI8KDn0DQSlnxtsgclUjsomuoVkTYG3JKmefL31E8ySuXtHgINJv26Vmk4fqA//rs9adZbezcA48jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAHDBC4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmA+nW1O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAHDBC4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmA+nW1O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTf7n833879
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ck4bkKMC1U3B4z8svFXa4djpj5CpyZ083Y1U4WFotHc=; b=TAHDBC4ekoxbnpvW
	oH4U2XfEWXCpm/TwwGZSvUp+Vbye6sRMuiXrhDAtCC8EVihVMyQCn/Tb0HzJNk+0
	5W/WN7oVKysK7n+lBpMQk0FMHeA3Kz7l2GQYe2gvP4bxXybQwjepSbdr1QP3ISIp
	78ccpSsZWqhmwTL/83/rhauK6zQlkTfMJCWVs43M2KNP6if4qPpxDJ8HWIgP3boL
	THCgNps9d6TWEgBQAasC6dSD4OLKnLaDVxtMVn5bBz8f4DrnhcKBtOvFIDdvnoOt
	AUNtqKN3sGz/EPlQ7NSAujmQw8tMaFOsquRJ429Nf9suAiaKRNMToim3MQzshLRS
	X0tUxw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevhea9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:50:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso3450443b3a.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671858; x=1782276658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ck4bkKMC1U3B4z8svFXa4djpj5CpyZ083Y1U4WFotHc=;
        b=QmA+nW1O36UzQuexKMEhPn5fj2gc0QbQtZ3zoZsm+2WRAz8ZLhZTOa4az+e46QBXJb
         SP9+ivXcS4BrJzm0BgAPa2ocGeIbrB+4m7LYKBhwX8iEm7raO4Z8RmIL+Fr2hGH51J2I
         HISMlGWQiYciDEKs/ZggAwWLuoALEV2x8J8hf+wOqS5hftIm77x62OjucVqvAnyMajI9
         8ViL8a/E+ffV0XGh+sL2SFlLAQhU9gkndNYr9aroKgz5hsmJHYZ7P9TQq9H0O5eryNKy
         kcNWkBj83Uvwm7nySP6h3loxkopI0XOSM2MQz9DuLFywjENYtUUqLBMXArgvqbBWy0++
         RHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671858; x=1782276658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ck4bkKMC1U3B4z8svFXa4djpj5CpyZ083Y1U4WFotHc=;
        b=CKH5gF76Zo5OysG8cQ7E/kwvBy3RrLqMHXgYocvVRpAWCloYhUc4CYxR0luF4Pnq5O
         S/EKA8ZULWD/J0MBr237MbwBV9fxLXqWs681IBtubYJrBvsm7p+yLaRdIb8Qir5AroP0
         Y5Dj3LHjExnP9M17SX3E99uKR1YAdEAXgvRRK6L/NCXN/f4roaGef7iutidfafAM08JU
         uAz+PhU1Z30/QoOU22jTCx/WlJoe5uQuscxd/jUdxlkxXRcH+5iwf/IgS5plXFLYE73h
         ZoDAZfiRaGKhCWx4Cvw7vjhRHOyZs84Uj916LD1bfKfgMpz2DZojBkl/bJypGdzppKNH
         HTVg==
X-Forwarded-Encrypted: i=1; AFNElJ9JDTmp24s9ZjIvq61sgZD3l2fP6sKcSTljG54K9SAvBpt1v/tyQGERcT0zqeTVQbhRjMA9Z8Mrp1xg@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEyZ752XPjSz667UYiJIcIYv7yCFVWwK/MJAh3a+LaNcy1zGW
	fwm9HWSUfRi6wqniUgjWV/NofJUkuTZ2NvaTugrG0XAGH0v6iD3nxfUVgD7vpKitP8In8+MPcPE
	fLN3YtO8Fwh2/aBlkxLbTsnQjpbvdMlIUeCjNQF2L1cPnwmkHY81iUMFX0v+RWovB
X-Gm-Gg: Acq92OHC6mP/yzRJmcrPwO+gp9Lv/euQ0f9L1yHzV/Aoef4tK8dJFECSuzyu9VegQP3
	jn7HKl7or6CxfFvqpSXJ0oxI+yOQAtOLOIQ5YIJfVemKIxJOu1inQfdLk2FiT9KbyYj7N1iUyyX
	1cFV1QMYMxAfiDaTJCJpbhbsIVlyPG0ZU8GiPISCDPB9ES2geNwal9403iGUphnNjqvJpPGJJvU
	YD6+D12jU2m/mOa/lgxonbVh1vlIxTyUXUP41qsJsRag/u3wv/+k1o6SUYEL/0eU7BYRAFPiwWY
	M105ABRhLshzxNUcLmcek6Cu7x7U7SNhwpb9OPMtuaryH8bB1RWZlnGyNWHa8isidJ3hNADw7K/
	j4mCVPqgGQtOH9/cm1vmpEA59XFLTcJMBe1rq6CvZc1Mx
X-Received: by 2002:a05:6a00:21ca:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8452446e715mr2212376b3a.16.1781671858105;
        Tue, 16 Jun 2026 21:50:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:21ca:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8452446e715mr2212333b3a.16.1781671857565;
        Tue, 16 Jun 2026 21:50:57 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:50:57 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:18 +0530
Subject: [PATCH v7 4/6] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-4-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=2520;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=Ip5DPWIadhU87IAZF/NVvn9ENoIlNryscISD9i7YDLk=;
 b=rU6xiLazapp3L/wx+4cxaDFA+H5CLeERaT71KI9C9ew+AgoAI4If7xgEcKkvDbojuqtLwjCEc
 ys+8Ou2PQPqDBPV0/GhR7ET6pun1xRlW8T/uLfezLNTt+7CzKheZQYG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX0jwZ2AVcWnxd
 Gr2nOxKwQ7A8gdPM8NA8uiigzL+MT2KtlOUG1wEy0zkFM/W9vs8wwLKEOMIJZV9VdT8o0z0a5zV
 6mvJZLtCI2D8uoY3iGrXWm3OALmynOGpFwCZoEEVOLtYNwaohlcAU2CSPEVX0tNdeHA8ZaPUiz8
 xF2ihgY5JQiT5VlNyVfsNtb3BImuacWgR6bLb6Ve8OASWu1TNyt7e4TsppbZgCOpZ0R84k9J/Va
 D/QrmJhe1WkmFhjMbUNFypbOoQNPO7Z5GqdWv4Ub6vbQB2y3aHy1iOybpT74cSLgCBTmB4VzAX1
 QcafWcHGD79QqxAyQOewPMcW0+a9LvlE2ENZt1AJSyTxhygFHhIC4+PYd7TY9M4URH4Y0btX9Sd
 A5DivXELNcMnLoNs3I1SmiTs8a1gRFq+3OxjzPnp1B+jpS4rOiSMlDyQL9P7bWlYZKQ7C+uXdAX
 /qRQnTcim+zwIv+qTlQ==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a3227b3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3PeDo36KSfG0vlEF63sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: x-leuNzcQtGWec8LWTlUlN03j2L4Xu6T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX6HOep4NI1OWo
 w7J00vcpMRM7q85B68sEB8osNTN8eVhxjNIhWtiWAAgRo9XQLlMJSgCvnZGiH9aWrmucQ1YLcvu
 FUpol4Z+giRD79KYaAUWLpSS0iD1FI0=
X-Proofpoint-ORIG-GUID: x-leuNzcQtGWec8LWTlUlN03j2L4Xu6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v5->v6:
Konrad:
- Updated last return value as "0".
- Added Reviewed-by

v3->v4:
- Added Acked-by tag.

v1->v2:
Bjorn:
- Remove geni_se_resources_state() API.
- Used geni_se_resources_activate() and geni_se_resources_deactivate()
  to enable/disable resources.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a7672b6c2bc0..8f8b74c4e88a 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1172,15 +1172,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_deactivate(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
 	}
 
-	clk_disable_unprepare(gi2c->se.core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	return 0;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1188,28 +1187,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_activate(&gi2c->se);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->se.core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 
 	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->se.core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
-	return ret;
 }
 
 static int __maybe_unused geni_i2c_suspend_noirq(struct device *dev)

-- 
2.34.1

