Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF15738B7C9
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436587; cv=none; b=YHQp4uH17GFdUdIHs042o74tp3Mc/gmMb4R3JiFPKdOKp0Gmm4PC0/OJV66h4V+BTvuC4yBG5qC/8GhPoIHGrsQzBWHz96Y5EVlC8e5hx2aEgKsDJssINWZpks8dTVujKJ0f5Gz0XR1WHaoOBvrhf1k6FxMs8+U/IxCG7FNJQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436587; c=relaxed/simple;
	bh=jFRNIsAAfyAug5VRjXEXqFLZUcaJoNigQqeYCKQMUe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDYUtxsh5343sm6O+fXhMG3esTIflQoO8Q2cVvYh/AbBRLjPNsNbnO8mOmOGAYNC0HsvnRZPdJkZkaBZEFe9FbUGqiaf7ZQLZfsy2qn3AWvXy1tFbjFrBJGNyJXzY+Vl/eIBqW/Gom4mvNm2NLm0mpFn8FQvthZHHU4xPjUlGrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUjbIfPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWl7E6TH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUjbIfPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWl7E6TH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3mVva017653
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=; b=WUjbIfPiTO8Zs3Ta
	XdfCjvrNeEHxDMGw+wzwPF2qqJ9S4qRVcvcvaKVpnk/RjREMiUnyxIre7LMlvas0
	AZteIiYFMgRXq/dn6zrUlroT4u+m0QYimJBm2aJhmgFReOv6tITA2+pQQFGicZXY
	aHXRjnqXvQTwPHFzxMUHo81ImEezPPCyUXpxQO8ZHHu24+YCgLzqePefH29PPBoi
	vPe4nTQpL9IiqcrLhf13ygQUmQdJpSINJZBVUnUS3WGiPqmKuTbXPJARz881/ca+
	gjmOtNlw5ukrJ3MhFVkOOemlYAUd2hdtxNn+RtAc30n4B6R0Ze2JiAmsc/28ouEl
	g5eBJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1ee9vmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f896eb6faso12558912b3a.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436583; x=1778041383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=;
        b=bWl7E6THL0rJOFj4LwA0+CB1RwWUWdD9AJKGKG7N5LQSB44MAnEYTTVA+tpHRm6MK8
         8jZfDy9m5wDT7TaRk1yBMXvGsBqI+UYE9PNY5tuBM+S6S4UEti7SyI6kLkrpo/deCVAp
         YJFSI0PTtG5Y67cny5F1ikTdxk3ygxifUBEUhB042mGjB4CYl+G6G32CYIIqgMY+OUuS
         ykCUaYVDcwyoOAyFIIFD/R8H1W5idLDKz9du1bDCks+DLDfZDmH6I0Ly8YXB4O5lBpk+
         BJHwvGiOdlAAMv/60nEGlue3rX5kRmRU4UIzAL9Er0E1SmrBIdBnF9m+/rE9GN/EzkJz
         2z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436583; x=1778041383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=;
        b=pcZB6qpeH5InFevNNWjTty0PEfceFXwLNg/NdkIcZQ65ceZBWEJ3uPcT5Ncm6195Hu
         ApxJtjIWohT2M+4r8FZGWKZKUrvan6preTrksorSY6fm6uG9r1icZgBuNNGcq7PvJj3u
         cmhycXscHuMf6Asi48dp7QLmrt0TyG4UehFB9mXxi575I+UB204Ywpa2Yl4i2yIw5NGn
         /EFuNd8HvoyvUMM6p8r4IkoPd7nhQkjq8EnwJ502XYQKH7F02OJAe17Af3vZsHKbQzu8
         PP9XXq+1ZKDd0XrqWeAF4vG8E7NrGP4Gj/ZiDeEKHgaq+0jhkKMiK40LKTCxU4CB6wfW
         e8yA==
X-Forwarded-Encrypted: i=1; AFNElJ/T3sDenaLl3/sfJXxpuTut2Q2FUIEMbXjNzfxQ6abdY69bzK6BGFU9DTBtGOahZy11ayjylGBV0kcS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzf0a4qUI5GIZe3Couj3UF0GKm4/rF/DJj4U+h0YlXYABNI1OS
	gzcWLYCOs/znPxpnICAsNLeJ73mAPK8hGIRPfKka5/JRw2Poc0CJjN0zJiQZ+E4AXbuqWXR27hh
	28X1YePX57OXHPqxHN21xAn6zWBMi+cLjkfAPDQPp0mAQpTXmts6RDARfQTHNF8c3
X-Gm-Gg: AeBDieuZIItRIq/Pr/cz+aUfH0QJF7//qTyLGJeO9sB9G6kaZxylfajOTcvskApJnhH
	Nw0OVdDgctzTbgChbMyMO+/JXXEurtiGY42KSj8ppsTRb11UjQ4XvX1UywyIEeh2A9HSbMsUchg
	PwBu2c5nkxRNvmnVQstxW29uMIelUg1BfWj5hn2dPozD3W7TJvuzkgmxbmdbpHd81BuQgUOXMYz
	PEZg9bREKaRwXmqMZR5/XfU8mdmM2UXlJbAiGqXVVGi+wdsedhjfCpaUdAoK6JXSNgH14MA9B1U
	o9EoT/ZO3yBpw+maHT3zGO83bCDA403TpDFWuIX9LWCqron9Lc4Kue0Ew4mevmNRNeUMaQqMrSr
	eyu2s8D2ZBMDRLjZz59bfVeEMxkrsaUBoYUF5ebBonl5FmmgMNbXnpRfce66nwx3fvKxE
X-Received: by 2002:a05:6a00:8e01:b0:82c:6d88:2a8e with SMTP id d2e1a72fcca58-834ea5e5777mr2116147b3a.20.1777436583442;
        Tue, 28 Apr 2026 21:23:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:8e01:b0:82c:6d88:2a8e with SMTP id d2e1a72fcca58-834ea5e5777mr2116109b3a.20.1777436582893;
        Tue, 28 Apr 2026 21:23:02 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:23:02 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:41 +0530
Subject: [PATCH v4 2/7] spi: spi-qcom-qspi: Fix incomplete error handling
 in runtime PM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-2-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=3312;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=jFRNIsAAfyAug5VRjXEXqFLZUcaJoNigQqeYCKQMUe0=;
 b=5jiDIJ6FuIkN2f9nBOgJWvdtBUYK20DHz5FWpeVTv7dPnAW0CbbnuCNnJVUE91h5Xrcu3B06w
 ql+TsQPmoAfCPtDcyZ0XBN8KVe+l9mEizllu68NrLZiCcTFNoV0i4ua
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f187a8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GfYcMVghsOmS6C78lsIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfXwTU3P6k+RVzR
 MDCNfAzRkd07vkFIw+8nnFPOzOeW7ZA34kmUCgoGQi0in+hCxMEY+hl2Uth6NLXHK1GoTQm45LJ
 v2GML/pc+CXSpIuQMQfR2tvMuvqvL1btKn0E/ztvkRE3RmJ9SUvngjANAmXegx4pDjdkRzDEb3x
 6q2LzCGgAiYHw1UdgxdIBpb2gaCcfcqMd/bSaVu88++wYozFHNKcUx+CHD7vqFocU3dcRaNuakn
 P4uY2gfZCM9RrMHmfni31tkt5Gu58XzGRzHftDNBbuZBEJ8i39P/idtHtak4rRoQMfUEPiEJjEm
 3NN9DHHj47RgH7MFD92l1DfUPeJ30/BAmfXPsZ4qjdHUxoRUhC5/PczkeW81hQO6n/V4OXtkUYV
 xoN/43hZsIsV6H085MdDNGC12/DfzFQD0zX9E+lGOD04O2TouG2eCGDyFaTCbXWiXelATl49Fmh
 84mp6nOWZETY8fHwP7Q==
X-Proofpoint-GUID: ok7FK6mz_C8zOooJ7Ret1cziRHvMZBLO
X-Proofpoint-ORIG-GUID: ok7FK6mz_C8zOooJ7Ret1cziRHvMZBLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038

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

