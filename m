Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049C53F7E8B
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358038; cv=none; b=NMcGfWRkv4xqZl2FJxSQCv4pSrm0rzRLIdBf/CIPkciITXqJ0typTTmv5TS4Qk/03Y5QWo2UzIzW/791krkQJWMFkxuv8EfdVqiH4+e9cTkXMEY5TZKYvDyJu0pbykUqHV22yCN+dqBuNCN6vYdZEYzUo/2Zy9RI3y8CWMc0fP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358038; c=relaxed/simple;
	bh=eLk+moHGQ/KDUbGhPcR3O1NOipyZ9xBd3d/bM6COqeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6oM4dnNTp7c64MusecFwejpC9D5EZYnPsbFMcrX3gRWFA0IXptQ6zWHtpEiuYnNcplSRHiFuz6ZTdR0xUb1xFXtz5dqBymua8/u3N87bPyO1kUrhrX573s6dsIuLDe4CPonOgtsbgr4FJ4jby5f/osZZd2z2e9ouE2blBFDEXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhBuDQvC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fz1BIMUH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhBuDQvC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fz1BIMUH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OBbA2E1291809
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WF5ijdDywM27lraVCHuUZkzXeHBLB5LhHo7w/l3hGLA=; b=nhBuDQvCvYFYrERQ
	jVWX4HYQ8b9iFJeiCDxV3a9cbOgbGuIhy6vVrQp35HJ2d3jj5lcGrtICf/RiJLF2
	QNZiWJpCp3685tvYbYQpMDgIlBZQLsH0loTTK58O3gXg4DzCF8SWsM5eUDrRnXEE
	j0nRBHfvlo5T1iUwjQW93NBRJr8PQb4D0fn0SSWGZ5+lmtBB1ONJi3fT2/dNk/qS
	sEQhpqSjoAmHilf3nlnwSVBHTI5G6AS7yo0Vwkogpg8XB3h6K6POTVLQPDAfqPZ6
	/nPOUQuqXIOtoZP/EqlgRf88XXEh/NBaApKMVF3PnyfaOAdcAqbzqcm6kg0QAv4m
	fjAgqQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw40df7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:13:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7381a9a932so2527386a12.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358034; x=1774962834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WF5ijdDywM27lraVCHuUZkzXeHBLB5LhHo7w/l3hGLA=;
        b=Fz1BIMUHTnGidPg/MyTwL8kyOylOEajK2p9L4zM/GHWpRKiOw/5k/4HeP+S4rN8kBQ
         4Rmrcm3ZaFs25SrWeEyXDUm36wvrQFybyc5kvt4JpdTvSIkUfBLPp2bU3Ke9AvVQrMeb
         mJa/WDSwLhvPIOfFkgYcKJpeWzj+iUipN6ex+hp6snVK2ZKSy5IAyXPSxfDeHBR9JnFo
         NwAGxDgD18VbQLqoWJTZpzOGQsAa/dmgLJULlFyuJwNwciKOgS0edA9KLQ7Lmz+A2JQb
         v+ILj0gsSk7dq/cZGkLfVTw7wHHrtYF/SH4pik2aoINmNAAa2CryzdDqdW6ldEIdQK+o
         6wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358034; x=1774962834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WF5ijdDywM27lraVCHuUZkzXeHBLB5LhHo7w/l3hGLA=;
        b=I+wc7cmXrG/ezUJnnOOSh1xuM/gsMnpWAzjbz2KwdksmoCqIdUYR1YdPVIOzKNaKct
         Arj2a+ewwM65TDFNNneUoMpoRQjRwDl5pgNY9xCp5U6duP2WdKiJGitTxduS8MrAq4Hk
         ixoEX7EgLLAHADue570SPFrQpaVaSRGZwU/3btRqxae8RK5QHzOcgfhPMbYXscVkmVif
         LqWvd/9L0KbY+B6DKOvqR0DE0sNAK47Z24BUerc4kqr1pn/KDmTSzr2VNkMg+346B+Fp
         g2vNIEbZC6gmB7CjxQOEl+oupz9ds/oQTvb74M8+E53OnLXPH3AEW5mBq4zx0jDoYVCd
         X+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWtHbxqFMRV4Yb6n0XcG3dlv5iO25aoFRDIeqfWwmXWclAKZ9O3L8ES1cw4cz/Jr9QVemDBAs4loOzY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2a99yJELBi0LteQtkLJc3N1gD99zyFy492GyE/QyKm3xG9P6O
	Ocl+rzh6FyeXKWRfWN4DYq0rOPdnjHW2eDgYL8qOI3S70ntChnkbuPH5/bE7UKD0Xia3whMQdr0
	+aJ1ixSQLzFGiT+Yim2AS+P4QXnaMemNhnr+mDh/AFg3t+y5HA4VAVFY7vO5FkEGx
X-Gm-Gg: ATEYQzwhyKSf5zPUwAOoH0UtiGpi2H4nnVDKh8IczcTuODdItCJcehmsjOXc/mVbG6T
	Ug+gXVCG2LKJnrDTeuVriUDK3zQwCgVcR9Ch2JvbaOa+rFeebsNL/sjyqJOzFhApCUyeh7NswFv
	KFDr/LQMubyL8rgebSb0dixXP0gSmYNSLEdff3cNxcveWT2/QKtkrgzVUt3g7l4Ld2CkjPURDZu
	6MQToBxaMj4wnDbtCHI/EsUqRfKebs1Hfgb79mJ/82bentENRAM27Oi1WXnTtR+i9era0miVZ/6
	lIPzzylU6tjOU07PzqlpJFDYWt79FYg6RN/dUvJMUwQSYNERE8KGRi9iDWTc9pF+aYCSCDXjs5d
	QqRozwwEHvyzjlSKpOv7Wqet5F0BGivwgVZnCJZX6u6mbbYIFTYzNhcTiFg==
X-Received: by 2002:a05:6a20:729e:b0:39c:1871:7c6e with SMTP id adf61e73a8af0-39c18717e0cmr6769766637.16.1774358034009;
        Tue, 24 Mar 2026 06:13:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:729e:b0:39c:1871:7c6e with SMTP id adf61e73a8af0-39c18717e0cmr6769725637.16.1774358033410;
        Tue, 24 Mar 2026 06:13:53 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:13:52 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:43:19 +0530
Subject: [PATCH v1 2/6] spi: spi-qcom-qspi: Add interconnect support for
 memory path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-spi-nor-v1-2-3efe59c1c119@oss.qualcomm.com>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
In-Reply-To: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358020; l=3550;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=eLk+moHGQ/KDUbGhPcR3O1NOipyZ9xBd3d/bM6COqeQ=;
 b=M8/COYw+KT3lylYETQfA5lK9LxQl7ncDB9ZNzWdprWFWdBQUeowaLlt5F2EKKdEB2s0R18f2s
 YyQcGGswb2cCFokh21vRDns4ZV000MLxNQuTAdQpw+vZurcjoC5RKoS
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX6d/LotIrGGe7
 RHDidbP+GzPStrl6XJIxFoODWkUftocedKpJ+KV0sLCtCB3lQnCwK6ckD9tPpnhi7e1JVMCbiKf
 shZzNSRJ4MAKmouAX3oP8xH61pkkhFSDibVHWZTDtlhItSA1SH8z5aXivVFlz0NxqbkZ3QZ7OPh
 3d4Ohu6pUrz+X9y6lD34xVhsTHK3mh2S7eR6sb4jOhfHrwNrUKb8QpeEdFF88T43iL7swmOARWN
 vRO4UOTzrra3dK36iqCMG+XMyMlktKm7zxv/zAd3Ny671GVqATxLapKicUBPS8cpHozPXz0skaX
 IdCTkOoqJZikS3OdV9G2qykHFZuehXqH9dqwgPSjV1lenVKJrLh4UDWefRTNgIp3TYcgPoV1UgZ
 9muqmIa8rj618XTY6LrafrDsWzFnSSoZ2SdKRal9K82GweO7x6F9LfDK2nhKDasKgtT8uL4exdI
 /FaO+V2tmlP6DzNU2QQ==
X-Proofpoint-GUID: kKTMhz4jLvPEtBBh-pluuLa464Y3L2U-
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c28e13 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UubsFNhUUF1sPbzy-JQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: kKTMhz4jLvPEtBBh-pluuLa464Y3L2U-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104

The QSPI controller has two interconnect paths:
1. qspi-config: CPU to QSPI controller for register access
2. qspi-memory: QSPI controller to memory for DMA operations

Currently, the driver only manages the qspi-config path. Add support for
the qspi-memory path to ensure proper bandwidth allocation for QSPI data
transfers to/from memory. Enable and disable both paths during runtime PM
transitions.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-qcom-qspi.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 7e39038160e0..624b3a7b6291 100644
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
@@ -729,6 +737,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
 				     "Failed to get cpu path\n");
 
+	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
+	if (IS_ERR(ctrl->icc_path_mem))
+		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
+				     "Failed to get memory path\n");
+
 	/* Set BW vote for register access */
 	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, Bps_to_icc(1000),
 				Bps_to_icc(1000));
@@ -829,6 +842,13 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 		return ret;
 	}
 
+	ret = icc_disable(ctrl->icc_path_mem);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "ICC disable failed for memory: %d\n", ret);
+		icc_enable(ctrl->icc_path_cpu_to_qspi);
+		return ret;
+	}
+
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -849,9 +869,19 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	ret = icc_enable(ctrl->icc_path_mem);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "ICC enable failed for memory: %d\n", ret);
+		icc_disable(ctrl->icc_path_cpu_to_qspi);
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
-	if (ret)
+	if (ret) {
+		icc_disable(ctrl->icc_path_cpu_to_qspi);
+		icc_disable(ctrl->icc_path_mem);
 		return ret;
+	}
 
 	return dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
 }

-- 
2.34.1

