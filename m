Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EA4381AE9
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665598; cv=none; b=q+cTssDTnvFvNlHQ2ebTHs/r/Qq4LqOe7DOWEbvy1z6t1dD91m9TP6BQIpMATqemIQLfw7nYiOAR01mmETksApOsKprx6ovOmQaQo8bh2yTdCLyt/CZDqqRiegdD8U90Y7/sEr4Tqrv11kTdZvVnre2k4xbqliSxNnQaV7DJzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665598; c=relaxed/simple;
	bh=alSx5LhHMXZVaVz4KF3miez0euhqC7ht0IrPBqldfw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpeDZz0R8ArpJkbTfgP2eq+XMH3eqQRY71/IABeGShczuK7gEil/oL1/4ICJJ2stjNmiLfngP+JqLsJd2CNAbq8p9Qmh99HWx/fcqK9HajBb5ixbp9vrC5M/wLvx9a1HtoGWV/7YaqlaDBRQWZ/J6Ai+pY9VqpLj4KXNQQtcRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLw1zCYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNqWmsre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLw1zCYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNqWmsre"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K2FLhs1934578
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbicD+JjAcPTtJD0uPtbhcOnxF6jPxSUPQ/NZZv1Q/4=; b=dLw1zCYL9JL+A5v0
	JuZ4MnPPcLT3Dv4ZYlUeWIHz2RkJFoRQYK3o8OCob8OV2IV8ms8tGIY481PEJKQ9
	moWh7YHof7pfI2pr0MapFUFCjHxaWmbp4hUNuJX7XUGb2ZEzNP75SSK4rFg50jog
	01YhH6ZsITxjxP7CX8q7RCcGPcIxPBclV7EEADgDxOiM5umhOp3BMdMVed9CxeuC
	8/PaebPJv317Ti5VJKlGmZ0y81zPveNXEernkxxTs0RqF09Vr+ACvGxm3W8MX2nO
	Zh6pPA8nKRmErvu0Y416d4LdTQcFEuwRJmCBgJjlGRaAtYfa5DVUg/o2awFKyWaT
	tYDDVw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261vavr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70dd30025fso3180743a12.2
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665596; x=1777270396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbicD+JjAcPTtJD0uPtbhcOnxF6jPxSUPQ/NZZv1Q/4=;
        b=kNqWmsrekidtv54JQXd/hyWLvING5+ivHPJ9TUPWPSa44xTVKB05Jp2apSqwbMbN4j
         HrWb6nqZpkkm9Y9u336xkVligDup/bonULB+EpZD4MFfI9IPsM+R2ghmQsYdHUWcQEDA
         mBU0TmVLwxznRrVINbic4IMAUEwvrH9JbRfI7MOXeCRlK++lbQcieGcUulnNlIRAPRy9
         JIGLWCz9qJoLoXqRFuwNeuMpKSscTC2SkMS1pg1WvdmurQ6VdoEPxGYzW/w5TeUreKtj
         /89CUe+eMYJ7kQBvUy3Q8xg8fAhdX62XHTscsLUQFE3I1X4Nf9gVv4IhGGIRANd8tEyV
         rSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665596; x=1777270396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KbicD+JjAcPTtJD0uPtbhcOnxF6jPxSUPQ/NZZv1Q/4=;
        b=Ygu+Z4gi76O2JtoKmDs0FOuAMHQ7hIow1KJuim4SlVnMy2Z2EKZ/q79KLcssmsTX4R
         LoqqU5M75OVSwqHxhLfBqJMao/1YfNDRj8FtmL2p1dSape4g1oI/r5GiRnGaP/1s5zsB
         QbqleDnYTzBDrA9W41qo1BZrFpOlxdTO2+VZ9v+f5zQqe/LbVfOCoy7l3f8VY0KWH3+U
         kfcQe6MKlW4qoJnkWTLs085zTHJ/xC4chaHin36bQIu2L8cxOeGi/X9pVGT3i2pf1MzQ
         Z+fDSItrRNfVbQirc+harwy9XU1b4cf7llFFadd193jsMLzRGGgXZ+lgv2xO9OHGW+Hz
         FNIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fExKr/SGfDfDSrsz6diZpEkoJj3ZH1hWl8wzGR3DrzOyX7aleP1uO5Hn2+k9RFxaFxfkmCthoLien@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2gggvfKS5d5dzUXtn7IMh3g34noSbzouaTxTlTUFsYZeqGkX
	EdQ39ZPoaWCdV2hpN0tKI7YB2D0xHnz/IsczkoS0ZGJtYZR2/D+u0zuAtsKGZSpxojM6B1T9P37
	xYF4QnRC5TaSj70QQ5/7x0MQs4qbkgEClYSxgJm/etm8DThxhq9OChFgWdhqaAeQI
X-Gm-Gg: AeBDieunSE9SLzGTD8lFW1SHiMfQmS1cs+AokIv4F1rkbVGpg61Z8W6PBYYcJ0/UxhC
	uioRhgyf3dJTc5q3o3kcZifbzQlrn48qPqgr6i21X27on+QPAlIrDmp7RiPWh1N2ahFxiD1o78c
	FY4ulTaDmIUPFr9+Qc1wvYyPBGklRzLKczd8iNaMPlXHBl7/gNMFHxq/apwTqM4b7GZ1vBP6RsA
	GVU3oxnuMFuVCECmvBAInVMW+Rs715uA7Z8v4/PF3paeQmjS3NjhJQGTdogRlT6LHXXfAbvSqGV
	qdS0/lXXzCe4RK7mqSAHf7i7htYKIKZmp02oHltVuSy/1HiGB5CaJxOy6Udna4ACSM+tREgXb2k
	fEsVEwfwMe5BSUyUF0C/wGrF03K0dvhcW+gLoCifJPJjOYz/BMz7IbUMcgVwU/KCoErgZ
X-Received: by 2002:a05:6a00:116:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-82f9d21d516mr6082065b3a.9.1776665595652;
        Sun, 19 Apr 2026 23:13:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:116:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-82f9d21d516mr6082033b3a.9.1776665595145;
        Sun, 19 Apr 2026 23:13:15 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:14 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:49 +0530
Subject: [PATCH v3 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665581; l=3239;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=alSx5LhHMXZVaVz4KF3miez0euhqC7ht0IrPBqldfw0=;
 b=hz1LOnX4tYZ3Dighub1FkxkQlKvXQyRbg78ENqcECd/oJM7s6BSAHwxpYesGf7tlfUonqMqbd
 wSvdHmju7eSDqW38oPz6v1shXf87TFugRgHFYVRF/Vv5hZy/StrZ40u
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfX1SB+Xj0XQqoe
 9stKrJXchoqYqobZDrinjnn6iuAT2WvWehoPI3gO0WfQI+rL1s55btF53j/VezUNbDt5xGTc7mW
 hZybF8go+RO8xxJ+/LsoAQ4R56zdeBH8xGLsEviFpIcPDt4zIy4hBYWBp/wD11zmxETMMAM4ZuT
 bpLHTvQ0OISzAxEKxJU2Bsgj5CjFlBnsW5tT06MMbdtZGV/PSO6C2HJSojWWRzbtXMLW0NEenFB
 JblHpCLeCtm3DL3C41sYRcedEIINxRvHxWpwI+YSSIotcEsrE+5dkC7Ev2kcDY17s0LwPiGL4Ak
 MFljB2jZTEo6H4jkAnq2Z/4pUcqB5bbfHKTljD80IowItHtNfUzC4CsdTvXtmkWzdwvnrnUS6Os
 gNGuEjSmToITi6f0HMGzL2RmeCn1uQe7wSisU2z85Ckfnoz0DJ+NaY9KDF2o6utXD80ge4qI+td
 aL9wamKePw5a2DssVZw==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e5c3fc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GfYcMVghsOmS6C78lsIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: fELz4YFBP3hAWfK8qO8qtKwnPOQiu5u-
X-Proofpoint-GUID: fELz4YFBP3hAWfK8qO8qtKwnPOQiu5u-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058

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
 drivers/spi/spi-qcom-qspi.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 7e39038160e0..8496c4a9f642 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -818,20 +818,33 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
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
+	clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
@@ -840,20 +853,34 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
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

