Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988999;
	b=gGTz5nwKl43FP8FB5N2qc9r8wsAueX1BSYC4sAH2IqaJoDe16XuuRJwszePkR4IPh9i8
	 YUYGzDuEglTWxXugxLhX66q9zlWJk0vWwislCGF+c/Y7aNuwqyM25pu5KOy3HYvk8U6t+
	 MVPnNy8+s0wcYqLs5/mZjF05VwE437jLjqPEawcj+DW48HRCAsPMNPwegAGaDVVwWaQ2f
	 xAqHmKWy9Vj6rBjzlkgnFmsWRrjZaK56cscep6oT6o90OCsvRNBpiVTskio6jfFutP39W
	 jn++YvVJg/dVa3EZSN2FxJy5vOOLUiAz1Bv6WVHbrF4RvhvumwJtr3quEiuJqkdSJuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
	b=uuGJPV7z0BSA9jTbw/uL48kRJ0Tb5qbxK5J65k8a3Z/Vy3SiWIsovgovI+80tENXCnak
	 rKtiG2HFznxC/YwsW8RYb83qyjg9lJ90h465IM+poPRyNBY4Ivj1dVsWClHqqfTfpw6L8
	 3hon0UJXSloRn4TIUhFST0CJuzmeWR7vNYSvBZcgpisF30LQBylMQGENc8kowFF3PJrOV
	 42Y7lVLOqut9+4FdWLrzqE5D9CWEVdBhDUWkHDHzonGO68H91hSaJn03+8twGzhMZVK9R
	 XoJegAu5aqS7FzQQBG4NDts34xVsyFQaXRDoWMuUGHRSBmTO3sU7eEsvlXUdPuo3qvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ7LyWkF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIeXtnCO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C308606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C308606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ7LyWkF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIeXtnCO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1VF2106293
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=VZ7LyWkFNR/adFAu
	rvraIXRtjke8TzSjKPCW6Mm9i+kqL4gkm3hTDZRuTOi/9KHmL2E5b96bseF3sumr
	QeY4im95/oe7RsHw/vLecTJMC0WbztHhxSc2Fjg8+699sUak3tmoP0cjgkPXcnYF
	R1f2+QWFe5rNDITKCPPVGROa2+keExyRO46hL9I6eSQi+nF6zxRxgcDwma0OFRAP
	pW30sLVvFavP/QOXKjcaEkCJLdVOya7bCct3YXVDQNhloQ/t7aQGg8rWaCwrlV1Z
	zMnZV8UeXGvhQuP0ae+MiCxWO7C3tq3KbMxdHYz0NvkvwEgu2+jqlb0aYzq6tg21
	d9NQRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8svr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efe2a88b7cso4015665ad.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988996; x=1795593796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=AIeXtnCOcYkAGq/OnFcbSgo91N0GjreNNmMNxuRpB2kshhJGEBdY/hqcLTuIFU8kUi
         c9ZgY5FU7woMfF34vZkKUs4gCtIyvIPrM0+f+DNwGLdT6KtIUFH0F0cR3HtWVlnVuVOP
         zTXfkeJqjmlmnsEyZTXmGcIDRTwyo/R+buJ5ctaKl/MmMCI3+YF3j/PfCbd9doFmDvg4
         cZqF9V0v9LxrbqyWtc3GzmZb6KHSW4Da03WeulqZBFc54NDhwq7YoG6R4BG0cY1FMbAY
         Xl7nIZPwYDiFNoz2LAJhCbpdVZppE2ZzjhbiH2uvl2W6hceOD8ZFiOg3fqTJYUy2QwZD
         HFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988996; x=1795593796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=XIIVZ0B/xBDDCZEdlI7HRI2MBpM4MZ3ic5Ln6+TJOYhyDSg1VHdQ8i0phKOSWP+K8o
         6CeAnbtfbwXbbhMlSn4iMU5D+UA9URk2yrW0wLu+T/+jEgIF0EyLfEAjGQbLxgFtGyxr
         YxOlibFqSS/uoDnQ6vpS671mVcA7AMGg8EdtDmEk9A8snCyXqpvDQa7b2eGiD1kaq820
         WpAKL1C4X69NabEvRIYdu1Eh0tKBFgO5dI+dE3UsRPqHAMzXvgravPm7PwcHHzhlKM9h
         KwHZR3n0aDzeNrNYvHCiqhUnf66kpqFvs2LAmfJCyKLUv02NM+FmmA/3oNqoI3kJFc0K
         Tm7g==
X-Forwarded-Encrypted: i=1; AL+hErEA86eBrH2fWSKhRMtF1Rdxm5dIZ1zLl55y+Rb4lWmRstzYClxKVwB5Qwbjhy7CnQ2c1dNA8dRl5O0W@vger.kernel.org
X-Gm-Message-State: APuU4Z/8u7i3C92DDIn7nX2ONutXLecn8zzlR/UQRNBdH0XC19plz+9C
	WQxorKMgRuKA4g+lcfiYHSJ1ztLhuBeEYsw5Bk1WiBeL9ZULKay99TFaMHHE99A7XklwRCG/K58
	pDMORuxioA+MB04Qhs83NHcfdecFwJtLJNkZSag2i+no5Tp8Odj/VRAQ3/x2tmBSA
X-Gm-Gg: AZFdTZfLpia+F0LYtqNbS0zeEXDMr+VQeoVOcdaJhgzL633COO6Z3giKMwjRgKkDtL4
	RK21RQqy6g3GWx5OH+lHMV7ThpqTJHRsE+7OAw/vGIsEoFnGF5+76iO1avnZ1ZeXsJxnp9nn9/D
	BXyZPLHdwgSRoYNOyb7WADWvV57CCDeDNuKV9WukIVt4typYBp92VAFtcoY3aB0gjfSPbxijgGl
	bHLAqAwlvwmXyI5fvAGz8FcHGbkYdzuJ45eAVPLoSY96zDFFgwrMf3DFimPg2pJ4Fo2UOQnW5GU
	kwPM9tx0LbiIL3I/x7DoC8xgyCXvpyp9BMPj91eEJ4My8vyiQug0zOooRaeRMJu79kQeOzEAppV
	9//ZEAb3lIcHOBL3/1EvgTRDS9QRJkKUc+/BQdrjiHKOcvSBRzsdKNLOvv/8vTKwGCrJlmIlt84
	Dc4WpqwLtLx2lDZ+Vnyk26/IOaZX6Fq98ZV9fU
X-Received: by 2002:a17:90b:4b86:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b3d06a254dmr2025393a91.2.1794988995986;
        Wed, 18 Nov 2026 00:03:15 -0800 (PST)
X-Received: by 2002:a17:90b:4b86:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b3d06a254dmr2025342a91.2.1794988995479;
        Wed, 18 Nov 2026 00:03:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:14 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:26 +0800
Subject: [PATCH v23 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-5-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Y/FvSaBbedQq8aKjgsZpsJQaVI9vU9ZVyO2kbtYJAR8=;
 b=v/Mog1KV7xh6PV68yXz5es3jTQaT/IlBXzKBN79xPwXQMDsGepiTTjA4syW53LI1F4XU7A2FD
 rIV2BRtqNLZDKZJI76FHVufgwKArL6AhegcEcgtHm0dIas07ZAuy2Qf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: nLDFP_9N6KUQV0qkcT2upH7i4cicMcLX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX92l77XE6TEVu
 sfZlE1g5RemRnOSFo89EzsRLqpvwsOJQKSBqRRYpWM/UyIkOea3liuc/gy716g1lejRL+asHCMi
 VCHU4XGB83gd9jlSbFJ4e7RzPPPEbK0=
X-Proofpoint-GUID: nLDFP_9N6KUQV0qkcT2upH7i4cicMcLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX4snDft80kV6W
 AELHBsz5cJ5wCTgVsK1im4nY66LnE0vkj5iRBYgM5WlsK8IfQ1g1lCmSJtJ9h7T/i2+1fz8lw/3
 m9+aMBG5APbnWdjFY6OlmDidL44berpHGatUN6aYqvJGaFgUuUsjjo4y9UmOaEqBodlhokx5QMd
 nxyhWs1gH9HeT3VnzMjf14wNsIUoasB038aU7YP8zDB9LSzyL8el87iXCg84/VYhbOHVJFP3Vxh
 y8FtLn3tng7smN3jSSb/4zI7/ndnkO8zGGvh/AmxNtqCEJPGbUaePiurwDFBWPh+b1exvu5EhOP
 oYFPsp+eKUhuTTyA74c1XX+Auu3HP1hN7BmdVg8mD4M2rIDxkK7nwMl89pUrSTGp0hMFUM9B8i7
 o10Uujj8LDjowFKB+YCm7TOYVgQIxRyyhQE79Si7roq41Mh5h8vfhIh4E8yiH3sFXHtjTnmbCQE
 3d24PkK9J9CpJpRsQIQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5bc5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5032f5598e15..cc341cdf8d8e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

