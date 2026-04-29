Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10342413229
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482121; cv=none; b=VMwHYoRR6hIRAnySkTiabrLxE3tyo37U+akuQmW/UFC7M8rPbZAtgZtuRoM3Y9iyAw+rd6MT/WEBXy6R+NJW50ZxBZtEcRv/TyNZSnVErw4LjkGDs/HGx0aKpISEShcP7NskYojb3dIn7FMALDQFXN4SDz3qWV74vafw105Qc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482121; c=relaxed/simple;
	bh=jFRNIsAAfyAug5VRjXEXqFLZUcaJoNigQqeYCKQMUe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLcG7cixQd3O9m/oGoS+m/GLygpdKgxgS9A4vkENO8H/YkSd3WlqQmL2ZCreEjiqvEBjDI7WrEfhSWt/GYqTBHLVn8hdeedGF7faGrBVGqEPMe4vl7nQUVq2tpuPagzLmNaMEagLdUK9r6QUxciS41FVnUNYCiE8PFBF81VaKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QL3WfiV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxbCveNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QL3WfiV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxbCveNP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFSqHl1641536
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=; b=QL3WfiV4EO4cJUd5
	WIH01uUT7U1QAeTTCjDhjhGFEGFl0By930BnDXOj5TwDSwFQS5FTFchtmlaYpFSt
	sHDSCY5Ad4gtn/C/15TXs4W/VS+/sH3VQqzUDkdiJLRYVgCaDmlcYvXkkLGboy6y
	LoDd1DD2Q/4gxmkT+/GXJftzctI71drI/xvNJqw8v8QywvEWSn7sUNmDejWASzWd
	Na2Ay+Timt6dLxhicdCRCODYUCy3+FYkPyrenCGT1UK4F6V9lVmdsHQYPXnujGoG
	GK9bFrQ9SvnlP08VQEJW5iy8doNeTsl5p4HbhfWL4kt4tMcOumeQp073LXMWviJY
	d08yWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj82mhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so150395ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482115; x=1778086915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=;
        b=DxbCveNPWRhFWYMVFEHT0vEAB3Gq1VxioPKJgZpmxC9jP3mlfPpCdHTDfL4V9veMkz
         FGROVGab+FeitlkVufbeR9NeCT28jZfBbGI1jMEgyXo6yLrEce/VFQiWC+r1yP63Z7ct
         /EmMCJbiqUt8IwftzpALwwxZE93H+nZYU93WGs9nLcJj6wzhc9D+UtEm2apbpPQktSJ2
         bWnf0b+LnacxVVpzpk+JIhnL4+x9OFGCEhsa57jmNV+qoQq45hSL+gJI36ZOsoXQuoVd
         njRmqtDWKwI5zpfF/pJjNNo3xI+aSC9j9QQ7REqHf7u37ZM24swaUXPCG4XX/9oX0WIC
         uNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482115; x=1778086915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=;
        b=q2R35Cz9vTfljA6YBzrfpgNk5ZBiHIEu/2RUz8OS+K10YecXy2S/i4pil/dSw/JTDc
         bIPi7t5coFhW5OwPhYNwlDr3e6hPY350eRuOITutut9qsd8P3IQLRbev/FUA7uLhbFFF
         HNdQdo8R9659+tHJNWn1viRcaM7ZDbHwM3F+3F/jNpb9qR2vSqLJeCRHOq6GxUGqMEqJ
         kYmwRxcaardreoDAgPzOCjgANeB2ZMpiOXOuXDl4MButkdRIa4d1Xxelx6Dyxo/NHUAC
         JRqgrS+85i10ISvV7+fjjVuk0/BRwh33j+Q+IVFM1NLDvMdb1r/ggWS96aI/mPv/0zds
         eA/A==
X-Forwarded-Encrypted: i=1; AFNElJ+XKIYUk8Zyu0khy8xXdoGGAUOidrv13XLK90Qz9SSu8YWfRmYaBpqnNRSUG6C5HJ3XU+pj9yj8sAK4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9iB5aIcqxl0LpE6yZNHwIN4wo3usxgsYPhpQxZ+7m16jQWZB0
	YMDoAc3iqkUln/96EeMIv4izEdiXoR/izvUUlHWW2ra/+QbyAh659luJ9DZR1y+lpvgw+4pHpRo
	dsQ38M7kN5FRj7MGLnf4M55YkSobFElGazv9tEFJ7rmB7GTrS+xOYmoho9QhTVCQD
X-Gm-Gg: AeBDievfi8ywKKpZzRG/wAPf84yqeGRqzwk2zfpI80CRH89e3iJgCCyKIL7OJCbGncm
	glke4taX8niExRa5JaP74Y4tM1SQlqSC6sRioAPqJvRx6lAA6YgWw6LbU7vopOvBKoFVrDON9pu
	Vu1ShPSnNi/IIxYPqVXjkGnWeN5I5S6hggj3sx0Waht67h+iLZsBQJiKRMRgyY+2FcEuSUyYPXJ
	uphV4qT4ikkxxVT3XtVLI8YmNiMa1Dg3SSPGNOhDkvNJCzNW7ilC9qqwb7VALHtpkNfgzq/ejj3
	FsSryxhkSMdgEUhRpxzIH59aYO9H/9qL/elxIJ3HfWG55JjF0rvMm2N7dfJvYhmXU2JDNEJsVXQ
	d7Xf29sxBcYJTF/Xf7P401COK6uMrrecIDKI9E9Dlnt8YaG7qINQ3Iw5h81KeThahKFNH
X-Received: by 2002:a17:903:b47:b0:2b2:481b:de68 with SMTP id d9443c01a7336-2b98746e3c7mr42279035ad.35.1777482114906;
        Wed, 29 Apr 2026 10:01:54 -0700 (PDT)
X-Received: by 2002:a17:903:b47:b0:2b2:481b:de68 with SMTP id d9443c01a7336-2b98746e3c7mr42278615ad.35.1777482114300;
        Wed, 29 Apr 2026 10:01:54 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:01:53 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:37 +0530
Subject: [PATCH v5 2/7] spi: spi-qcom-qspi: Fix incomplete error handling
 in runtime PM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-2-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=3312;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=jFRNIsAAfyAug5VRjXEXqFLZUcaJoNigQqeYCKQMUe0=;
 b=e9pk922tgW72Aghv532bXlAF/epcSjxC2XCRXTAJ/nCdJzBC4NQ80gqS58gm53FiOPp0iar1s
 vnvki9gxMtbDhRsCId6Q8iCu7gl+nuE93r3BbjxbUxH5C6JKlU58N9j
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: -bKqSLKJq4HjGOiAYZM23A5EyL8vvxyI
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f23984 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GfYcMVghsOmS6C78lsIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: -bKqSLKJq4HjGOiAYZM23A5EyL8vvxyI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX98KpT/uw9Kzk
 GR7LTq73ZZLlulGKG7w68S3hUaxFDBpbzVwLeb9yV8hWYIQTEJ4WOdItqPUoaAugpRIVQP29i82
 WMT+WYj44HFAPJGHq4xCJA7ajvy8c4rAi60o8gV9J2syxJ8MATcx4I9mVWQ1kEgQrv3fHDKGx9B
 YDr2LN33sZMUg6TdC4LUj1+sbuT8aIvhIdY8HGGL+yiLA8TxiXEMFE4gBioqq7T3IuBEOnF/uZ8
 gbh5plrWvJ6Qg9PbnYAi6381S+kSsAoEQlhs93tBTIV4qOWopiYwwhXvCNoJreSXfiKPYPGQlHE
 9LbxED0qmi3FlGBe+E7kr2WWia1ywyycxhVSuTRKqco3TAZxSIgjbBIlJIuYUfUi37n1ccdFvaV
 CYhbpmU1i+G/pR4RbnLZQxn8hV+SEsbdyDA6MZXssSqJuiE/uB/8Sd3jR01BEJ812HXurssr+2K
 08A/FQcRVSAgfBKthBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171

The runtime PM functions had incomplete error handling that could leave the
system in an inconsistent state. If any operation failed midway through
suspend or resume, some resources would be left in the wrong state while
others were already changed, leading to potential clock/power imbalances.

Reorder the suspend/resume sequences to avoid brownout risk by ensuring the
performance state is set appropriately before clocks are enabled and clocks
are disabled before dropping the performance state.

Fix by adding proper error checking for all operations and using goto-based
cleanup to ensure all successfully acquired resources are properly released
on any error.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-qcom-qspi.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 7e39038160e0..edfbf0b5d1fa 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -818,20 +818,34 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 	struct qcom_qspi *ctrl = spi_controller_get_devdata(host);
 	int ret;
 
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
 
 	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
 	if (ret) {
 		dev_err_ratelimited(ctrl->dev, "%s: ICC disable failed for cpu: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_enable_clk;
 	}
 
-	pinctrl_pm_select_sleep_state(dev);
+	ret = pinctrl_pm_select_sleep_state(dev);
+	if (ret)
+		goto err_enable_icc;
+
+	/* Drop the performance state vote */
+	ret = dev_pm_opp_set_rate(dev, 0);
+	if (ret)
+		goto err_select_default_state;
 
 	return 0;
+
+err_select_default_state:
+	pinctrl_pm_select_default_state(dev);
+err_enable_icc:
+	icc_enable(ctrl->icc_path_cpu_to_qspi);
+err_enable_clk:
+	if (clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks))
+		dev_err_ratelimited(ctrl->dev, "Failed to re-enable clocks\n");
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
@@ -840,20 +854,34 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 	struct qcom_qspi *ctrl = spi_controller_get_devdata(host);
 	int ret;
 
-	pinctrl_pm_select_default_state(dev);
+	ret = dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		goto err_opp_set_rate_zero;
 
 	ret = icc_enable(ctrl->icc_path_cpu_to_qspi);
 	if (ret) {
 		dev_err_ratelimited(ctrl->dev, "%s: ICC enable failed for cpu: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_select_sleep_state;
 	}
 
 	ret = clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 	if (ret)
-		return ret;
+		goto err_disable_icc;
 
-	return dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+	return 0;
+
+err_disable_icc:
+	icc_disable(ctrl->icc_path_cpu_to_qspi);
+err_select_sleep_state:
+	pinctrl_pm_select_sleep_state(dev);
+err_opp_set_rate_zero:
+	dev_pm_opp_set_rate(dev, 0);
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_suspend(struct device *dev)

-- 
2.34.1

