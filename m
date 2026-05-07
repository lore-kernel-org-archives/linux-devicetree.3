Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C6B3FCB10
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163161; cv=none; b=ELeFWAyokMdb8yuE576MgGgbxmsre+FiTHfh/UqPNW+0UQws1cs43oS4ZBT5G13a8qvFoKBVZrgvKnZzBbf3ByIbsBq04FKYhQRWSIaqRdA+WfH85lZjjpC59KUT53OBBawqWjUByGuUMDNxpZ+wmDtYQh0YSL59BpoREoHV690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163161; c=relaxed/simple;
	bh=0XKtLb+KNpJzb2pfRF5CKuVsIlfPIhLw3pICGVnZtAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6GAy3Iopo0g02F3BSW+sXR26Rtge99Q+l/6uNRfJiqTn+EtxXp6+IaFjg1ZSxvTVuEbdiQW+YWHDu56xfqdzwTI3HKVWO883xzJjDSt6fbiG+i16ToSy+/DNJ30fHjMTmMe6K8hp1QOjDNKozELngGp9jdK7qNsaAyHSLiEDdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdfFPFxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCuAueRo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdfFPFxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCuAueRo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Bxa342734203
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 14:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=; b=mdfFPFxNy2sPNcjr
	j0FmFrSTwLflWsXzpHxg9Qh+5uXaCGTLpQ4MhjLyQ87pWQ7rSJ6A4b3q7Z8H9iAV
	EaIN2lNwHeJ8fQIxVHsV9SPPHcGqPklQP6l4nJPB0gETHTWd3onwwOAAJp37oc/8
	QayyM/qTfJzrzrl+pmMRbKsYgN6+crYiL6eImIXD5qUZAICULRJuFQAz8M2HQT2D
	/7czGFku1wAty209NJUGKRgy7OsxRyTRscRlEMIYTbz1rr+ip3DbUT0QVdhVKx6b
	VKhiu2bwbho0RD6w/8XVMzaqW3KJVXXCX2UWinpyA9Ud/KUTyfgp/nhUeEEbYwME
	TSFwyA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqrg45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 14:12:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8024fc7032so455461a12.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163158; x=1778767958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=;
        b=ZCuAueRokJmkq1aC37B10Hkdp4FucfDfr4otXEvUkgawOu3s6UyVm7nSRDRTDTAFeo
         NJfKW6YFgvkFeS8eW0oPbJC245VH5BJ6TWi3ZPCIWQLpDdaB0QAnzEKuM15rHFZyhlcS
         f+B4sjucYmeF8QxorImvHzdYbxWz1mS2HnZjqrjeon+2O7vMdXI+WR4/hQGY9KaAxYpl
         MLZ/IpJuoCPcSa2y0jPjjloVqu9HMcrhIIMoodpjLY7oa4wzI4HjKcJPvgbSGRgj6BsV
         B2hK/AbmmcwGfvl9HU7F4MhYnpjBA782ne7sqwvJniRd74sAzVJ+vfhghETb0NidtVJv
         vVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163158; x=1778767958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=;
        b=Hj76AOrHCIIWthvpzV0vAkvvVFiRb0jiPxQ2YZcmnHx9f6EaipcpP5C4M+j/KTC8TO
         aaKhiihoRFub5pmuBWOkK6DThRaRcK5OC7dcQ5kw8Ht0mXA/jVqP6ePpYzJGU3n1ltVB
         1TbkHmbyTfnlR587ONs1TFkAtTyBiCTfbWz5mfBH/D357dIEn76qapbyrkNrPzA0PMF1
         oPLmGqB00nydBrjjVJrYPvB/BPCNUITIreDgy7ez2NOvNtdeA7202wQQyFpoZPA5/VUe
         wl44zA7+O2V3+qnTHPFUK/SlmzxSZvKhmKwyHpwuHrQ78/TsqH3whnTshd/jS4iObcAK
         nW9w==
X-Forwarded-Encrypted: i=1; AFNElJ/rR1L2eQ0L2pIaa3LMSA/Z0v82IceoycbFcrbhE3tvQqSHXcjtYagpQxUTWWSLyh4yPnzSVn/lcUAw@vger.kernel.org
X-Gm-Message-State: AOJu0YxzHP2sOHtvlK6jzXgOg7BFfTAKYrzSXEx4fAkxMgzqtdTtwsKt
	KBq2a+rqhkLTLnNZV53+7EO+bTOhATMrv/1qy2csXLjdtnAArvCD7nAg5D5R9WiOrfOdVxv7LlG
	70mT2y9nYTfUStj/XHxSbQg/8mQzr9RPSedQyGZemraSME3mPw6MK5VFm0KNE+hSa
X-Gm-Gg: AeBDietDV953fCQ54SllSYjV2ufjrUsHgkSkMAMdPyK9ouUc6QlReyAXOxfCqmiA9XB
	R8u8Sxkbbn/z9D7UwowjD7czvWE6VmjvDFak0P6V/BzcrB68AR9wVTYwwyMbBCUtlbRUK5eu4N9
	XO7hUIlaselwCBJLm/hhE7X13JHkd4IKO8U2VD9vUCpn4j9c0H9rlFHWwbDHbmgbqCj2Ety+sil
	spDJDJZdRMvUXN55OppKB39dZFfDaVcU5tRaIJfbqX2DEGdW/FFQwzv8//PYGRobQCrsShJQMN6
	l6H0M/oL/QRi3Q/tW1nTuLl1fZkY6tsmm2mtsMQYRDMxdThVq2HX46k7XApWTv8LPq59JN8N+WO
	7oiIvx64SPwUx9XvnLFJGSFSWRhiT1L5SBeDTuOkfBoMZ8wwjXY4V5aquLFiBploDrba9e7W2Zo
	tH9rzfJUzN6uAc4k7+JOs=
X-Received: by 2002:a05:6300:218a:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3aa5ac0ddf5mr10192217637.49.1778163158473;
        Thu, 07 May 2026 07:12:38 -0700 (PDT)
X-Received: by 2002:a05:6300:218a:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3aa5ac0ddf5mr10192166637.49.1778163157864;
        Thu, 07 May 2026 07:12:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:57 +0800
Subject: [PATCH v18 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-1-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=3816;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0XKtLb+KNpJzb2pfRF5CKuVsIlfPIhLw3pICGVnZtAs=;
 b=D5cf6pQGKCuusxfGdwFLVMla/i8jhs3iNib8sL+WsPnBr7WuT16FNM2Rk4aS7L5AhjxNGcrZb
 r6yv0LM/wAeAiYYRxxEr5kalsz3g+7nvRuAzWzkLh701BpKSL4wrbM6
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: taWz2Yi5lwVxyyWlEKFMkfRz_WErxojX
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fc9dd7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: taWz2Yi5lwVxyyWlEKFMkfRz_WErxojX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX+g5YDS64d+Wi
 owXsw0xJzZInSv15gi9lHbapNjsRgGGAeT9heSouQ0SbpSJL+907+qOOmJ7K+2oNrVPoDPRF4SZ
 ZAHhXIFNuf+FUyknp6z0nZA8KdCOWaOylmWSZR0TAWRv8uzlS+NH/TKlQYbKv0uDnTy0Fl1Vd99
 Xc0HpRiNGlsnatSdwVdqu7jV0aw/ohUxtzrRDsNvmz76EJhFnMuu/fHPNoGlvOyPwV10ugXPUNb
 KJ3MeU9i1oGJoisCF/lqD5EvpetHC7zygcdFu19RsT6h0jLvYn8elcCPs2PGkCPzAdeAL4Opos+
 e8/KiS+ShkWG+4DlB5CDFQAd+Hz/fRsoyTtqNmIeUrhTClw1CVQeFqDYvKM29+Hqbt30/IipIAQ
 Eq1DYTq8xR+jrm//EuHm5CmXMz3glPMz/RT790D0M5YEQpZdH1x+xZoAWDb0iyshy35kOaCzob7
 IseN24novAHGBNoTeqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070142

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +---------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..9e19d370c207 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..5532ec82e82c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

