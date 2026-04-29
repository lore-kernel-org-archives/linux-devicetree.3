Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E994C38B7D1
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436590; cv=none; b=jZevrEceYuAdzGlA9FaXfVfPBrdQ3Kx7zzTucsGXXAp2nsN6wFcyvlQIuWVYxnDZrhpfyxpnyRAOK5VSucFpomAKaVxgJXRSPCpWxB/TxnPr3VlwnoifDkAXVXT/pOUofg4mSatHT3csp+9yhxJrfXq/LFan/8BnU8/AOZn/8tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436590; c=relaxed/simple;
	bh=ovZTqUF5/g2sWp/btJDRSg/I1HuohA0bLfF+dYDDAN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohde8wE9Uh0786e7ysXQGP/NATGd9xj4D0/v2WRhQw96dY86HffVz2yjFK3QRv42idFwrrdl9ujIqPTJpkOUT1f1a0N9wAJC7a+mdr1Sv5UklXtpadJJDJ4JrIpteQDH7WADJi53Tf6+hX5bm13JcWS/2xb7xpnBsxBmvVIBz3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYl+5Sj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXjewiaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYl+5Sj2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXjewiaI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZVDs1016142
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2Ivexwz+aHyP4Wah8ZSNwaKmGZD+PrFeXoflq99gDE=; b=kYl+5Sj2l6jkTgFg
	Lv/rW8NhxO3JSNPKW0Zx7S2MpE+qmjR+RyMryJllFTwaa/L0l/k5rJgfjLU+JG0S
	gNXP2z5is20X2RE1aRe42OdMPGJMkiEmeybanvu8tVmx1k6kwCu5wfmr3s6VhLdR
	a/dbySrqi0PhbK/MbRruZXltimuReQ9tcn/i3bDqIhuc9wEhqp7SpM+GpRUbWCE3
	8SV3KcQnmX/4AJvhST/kKsmWlPAMt8OO28Fvo7iL424UxiyR/hwJb7cUan84UOdR
	PiCYS6+QJzjoh3RXj26AOev3D9JXI4rF0hgNxRBVyQUp1f17QTFxIaYwOWqZ4FJQ
	Akxx/A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7304da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so14608666b3a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436587; x=1778041387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2Ivexwz+aHyP4Wah8ZSNwaKmGZD+PrFeXoflq99gDE=;
        b=BXjewiaI2E+5Ioha5uAMgML/55TY1eWWRl1O0wDHsTLsb+VhRVNkI++mul7bXsl1d7
         Tw3DHHxkT7Tlx1+amEnfbyEFj3u4vK107VV3XJwl+JEsTCkf1cNZfJc1rXsIW+N80F4u
         /h/FW7g7MfkuuaXYpdp9I8gdmoZkKODaceRS89ZbezrzkeA5olFOaVCnTwXURdNTHAlY
         odQt0bCiwjC+n4136U4wbgtf2N8eXbz+8cNdzbrLDb4ej5Pwj99x14ipn43kLAeLhTb5
         grw/2tr88EzNmwF0mzx0BRr+XcPtDAzMcRlGceYjuOU6HzI2/aqxCmJEsU8C59mrr8KY
         Tmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436587; x=1778041387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2Ivexwz+aHyP4Wah8ZSNwaKmGZD+PrFeXoflq99gDE=;
        b=TcsiOkd30Vq2evfgPvxsj0ZAfJ2uTgiyrXPD+p+ST0Uhy/aPQEImBPif4Xw9xLUtFT
         Q5nSp/mrgO/mskobmABujqQ2HukuP/BxHpZ+iKFodIhiM1irLGqHmgSks/+SQTR2jwdJ
         G9WXhw8iF/Cva/F2tCcRhAelKWSHt6RftkuMt0vT1psn2cjpTwidsskwd2ZAbfWswGSJ
         S5WNhPNIaDF6TOydALpQtfJ93vPuZ9xthauyuWZE9OwlwZkulOBQc/pAdQiiAivzWyLf
         g99ckSnb2oSwXXbnaWHLqBvZ7036CuxcRc907anY8pAH7M6ZrDL+a/L/FwfM/q/xlmQp
         F8pg==
X-Forwarded-Encrypted: i=1; AFNElJ8tLbu67rD1ZXw8i6yKR32eL9gg3T7Fw1cvh32otGu9aJpajs84igGnOc1coVuvOhUAZq/sww1rU22P@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlni4OqnPyPZorNzKmqRe80ZIQaW0nvLQzXahau6D/TGfIUVfu
	ci2y2pl4Hrrs99JrS9fuo/9XrWuwfkQC1kjxHufp6InK0/dDP0i42cuPZGihEcatcjqTbMWrQCS
	Hgrp4IgzO87fYGVD7RROc8orBgWGuvc8LBVWYt223p/uv/gXnIE/2Xd+JWrA+7/Or
X-Gm-Gg: AeBDieuuPya7avibcfhuGu2lj4p59/THVGf/zI84DPF3vS0dcKpS/jLIJoGTqHxFqVV
	jnlj5obA7JEui6Ztux12v0pipwxFwmoN2NIp0dn5qYGGH7cIm9Nntu5gG7yglSL95fs+U5395b0
	QIVCEala0MsbaMEV0iLYnFxDj4LtEstR8ciVqkFnUa7URZf0WZvss0ezZKyPUQL4c7bDnt+ylBd
	IAIR83qm1rOsz6OWnYyeNO3XLdHNx6GAF8gsNrh2y31zy1UNKr1lyhRfBPsXiKlKRhh5/1n+Orc
	spgu34GN/AO1dI84Mr58PN4BoGgci4cmgttPQWITvOiSwXQ6y6tx2yztZKQCuuKPMXD6Bt6Y3nM
	pLzTkffShsCxC2gQbNl9TzQ+9jdfbCZyc88ZGU4UgUMvKCoQholIkxfCxeKNbHFH5aigX
X-Received: by 2002:a05:6a00:2990:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-834ddc77179mr5516256b3a.36.1777436587493;
        Tue, 28 Apr 2026 21:23:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:2990:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-834ddc77179mr5516220b3a.36.1777436586957;
        Tue, 28 Apr 2026 21:23:06 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:23:06 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:42 +0530
Subject: [PATCH v4 3/7] spi: spi-qcom-qspi: Add interconnect support for
 memory path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-3-73fb1bab03ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=4235;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ovZTqUF5/g2sWp/btJDRSg/I1HuohA0bLfF+dYDDAN4=;
 b=grfF5PvuKlDity9pXt6Synac0dbUDv3Y8sYCqB8OIKOmE+EEXm+PCnmvkytOPwwysdYqylb0T
 n8W4ur5VuvqANNjmi4QqYbXxSx0yiZyjM5Y+/zAiT4LmcUCZpTYXWEY
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f187ac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S70kITjG2mzSNXz8RO8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfX0X2E3xqaEbR5
 zPZi30cbHqwQoI92DmMRilmmqoLRw3eegvclKsE2g2qEulCv2QeUzYxEO/C67lxv9GTbhMyGnvE
 tdu/QHonPHY3THEDxyPZDQqL6wvNG9ep/H/13zlHDj3Bpyh2AOEu0r+XEDxavpieSfPzXd9/6Ys
 cQdI/Gv39UMXiDUa5GIZbd0g4AcObbCo7HthpHIoIbUMhUChSS226D5pWVXhATEczwvy75yBf43
 bFikzWugX9pOiMZEY3c8TKpnrW7zqQwf3rZIXcssGU5QQnY9K9ingz+TNgUHZl+vcUQWgQEyN1W
 xyoa3GvILKsZ8+3/RCdKb8e6Ez0TSbixJKN2haElvSTWqSzC1HnUvgwZRO/Twc1qr8AOeU4r/DK
 2xi1h8i+8zbhXOQSWVOOP2Xo2TsywALSkU5MNc0lx+2cGX8aqSWnwHv75Mdm912quVvE2UzOEr0
 GYR7GYndaKgjtflkt+Q==
X-Proofpoint-GUID: jpAejS72EBPNXEPW4JM57Yna8Y4O5Unn
X-Proofpoint-ORIG-GUID: jpAejS72EBPNXEPW4JM57Yna8Y4O5Unn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038

The QSPI controller has two interconnect paths:
1. qspi-config: CPU to QSPI controller for register access
2. qspi-memory: QSPI controller to memory for DMA operations

Currently, the driver only manages the qspi-config path. Add support for
the qspi-memory path to ensure proper bandwidth allocation for QSPI data
transfers to/from memory. Enable and disable both paths during runtime PM
transitions.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-qcom-qspi.c | 44 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index edfbf0b5d1fa..caf55a6f70b3 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -174,6 +174,7 @@ struct qcom_qspi {
 	void *virt_cmd_desc[QSPI_MAX_SG];
 	unsigned int n_cmd_desc;
 	struct icc_path *icc_path_cpu_to_qspi;
+	struct icc_path *icc_path_mem;
 	unsigned long last_speed;
 	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
@@ -272,7 +273,7 @@ static void qcom_qspi_handle_err(struct spi_controller *host,
 static int qcom_qspi_set_speed(struct qcom_qspi *ctrl, unsigned long speed_hz)
 {
 	int ret;
-	unsigned int avg_bw_cpu;
+	unsigned int avg_bw_cpu, avg_bw_mem;
 
 	if (speed_hz == ctrl->last_speed)
 		return 0;
@@ -285,7 +286,7 @@ static int qcom_qspi_set_speed(struct qcom_qspi *ctrl, unsigned long speed_hz)
 	}
 
 	/*
-	 * Set BW quota for CPU.
+	 * Set BW quota for CPU and memory paths.
 	 * We don't have explicit peak requirement so keep it equal to avg_bw.
 	 */
 	avg_bw_cpu = Bps_to_icc(speed_hz);
@@ -296,6 +297,13 @@ static int qcom_qspi_set_speed(struct qcom_qspi *ctrl, unsigned long speed_hz)
 		return ret;
 	}
 
+	avg_bw_mem = Bps_to_icc(speed_hz);
+	ret = icc_set_bw(ctrl->icc_path_mem, avg_bw_mem, avg_bw_mem);
+	if (ret) {
+		dev_err(ctrl->dev, "ICC BW voting failed for memory: %d\n", ret);
+		return ret;
+	}
+
 	ctrl->last_speed = speed_hz;
 
 	return 0;
@@ -729,6 +737,14 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
 				     "Failed to get cpu path\n");
 
+	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
+	if (IS_ERR(ctrl->icc_path_mem)) {
+		if (PTR_ERR(ctrl->icc_path_mem) != -ENODATA)
+			return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
+					     "Failed to get memory path\n");
+		ctrl->icc_path_mem = NULL;
+	}
+
 	/* Set BW vote for register access */
 	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, Bps_to_icc(1000),
 				Bps_to_icc(1000));
@@ -827,9 +843,15 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 		goto err_enable_clk;
 	}
 
+	ret = icc_disable(ctrl->icc_path_mem);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "ICC disable failed for memory: %d\n", ret);
+		goto err_enable_icc_cpu;
+	}
+
 	ret = pinctrl_pm_select_sleep_state(dev);
 	if (ret)
-		goto err_enable_icc;
+		goto err_enable_icc_mem;
 
 	/* Drop the performance state vote */
 	ret = dev_pm_opp_set_rate(dev, 0);
@@ -840,7 +862,9 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 
 err_select_default_state:
 	pinctrl_pm_select_default_state(dev);
-err_enable_icc:
+err_enable_icc_mem:
+	icc_enable(ctrl->icc_path_mem);
+err_enable_icc_cpu:
 	icc_enable(ctrl->icc_path_cpu_to_qspi);
 err_enable_clk:
 	if (clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks))
@@ -869,13 +893,21 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 		goto err_select_sleep_state;
 	}
 
+	ret = icc_enable(ctrl->icc_path_mem);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "ICC enable failed for memory: %d\n", ret);
+		goto err_disable_icc_cpu;
+	}
+
 	ret = clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 	if (ret)
-		goto err_disable_icc;
+		goto err_disable_icc_mem;
 
 	return 0;
 
-err_disable_icc:
+err_disable_icc_mem:
+	icc_disable(ctrl->icc_path_mem);
+err_disable_icc_cpu:
 	icc_disable(ctrl->icc_path_cpu_to_qspi);
 err_select_sleep_state:
 	pinctrl_pm_select_sleep_state(dev);

-- 
2.34.1

