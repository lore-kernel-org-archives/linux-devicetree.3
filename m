Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE8230F816
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384389; cv=none; b=LGpEop/u5TXgghaWZWNaBKOz+8PQnyIU6RPyL6WwxliFxpVqxpZrME6YAj2JOK0iVRlTkYuTz7tiK1ggfvfcWB0y4h5mVgdjk7YMwPfGrUlTLPKeGj9BRv9S98Os7MD4Brntuzi2vIKKAUXCf38qWWjgIJ/FIfmfPiOlnrN7LL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384389; c=relaxed/simple;
	bh=2qv5ewq1ayMiwA7pIPcW1bE63RIRPVWk501yvyFDS5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LlHJFGqVVVysLB8c5cTZ8u6rk1CrN2015JtqlKa1NwQ4pEqfkMrFaHLP3grdmh0OfNxy8EVjBjWqkImtyLmUpek1WeHHMiPv/GCRzSjXL34ltURHoItzvvMSRmOU0UvzSsJ2smx7403zYE8Fx+ae5u5rfQtNz19c2jYqPT9BTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2vlIuEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ce5PXpFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2vlIuEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ce5PXpFn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jvMV1723469
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=; b=p2vlIuEFK//7zrsL
	WruckMQiBkDEmLxwbQzmmfXGIGL5YOMMjWUSo+i+xpaX91ShoIoUGVXvevgXGeLD
	cIXFyN66VSv22T4lID2FK94VHbBkoJhf10M9BIbcrJcqiVXS9lJxUTPzebq3BwSi
	hCqycZ7QJy/cTuk15n/eoNiBUV5l24kQf+IcD5fQ4ILiSZmvuwx8XyfbBLpMqCT1
	WXlhrLNGD6I0RF/534OGWzZ49z0KfeaA8hsNK36vvdxh3gjpRAMv+1XIIe/GCzA5
	Uvl4+4BBns9OuUe/jHGFHQg1JfC6ySV8R5GlXwnYnd/qkNSMVpPDvwhrHIGDR+3i
	nJQmjw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7duwj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6bbd0afffso31904695ad.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384386; x=1782989186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=;
        b=ce5PXpFnhxJv1iEDZNeYKvvWWCFo1QwKpoupPnK3SCPbNCZp+0vrvWJgiVk/xnQiIP
         qh23IIaSWKiuGyWA35BRQMCMy6m/tDQIbhb+ZNLloDsEkKoQcx/8ikCj4dJIdbeBGPb+
         XT+7TXo+DKaOVoQMpnUrzzTF1MQ0RXycY25f3OPsAmneKDisasE34AusSmCMQULgnDKW
         2pg35xxZJmtdPtrtorA4WP4j0N05r/wiTe1JuttAGolvIMCKBxZ5+aS4XIg4/ybfv3Pn
         sBPemVhaMS6wZscHI3OmcFlvWFNakH5W/MuoQ0lQ11KhdDAtyUN/ypBzK/wdml/6F9XE
         0fdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384386; x=1782989186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=;
        b=HhkKdZDI9/P699U3M0Vig7rjht/blq3A24STCtoLqH2ncYv0R99uH00WSS0SHwxwqG
         b0jdabmTN1cTacrbexZd1YMO76aqaoiulJgpT3leXqgM9taLr5j+3b2CWTLRLqg5uZvJ
         ipP5V5aB/dfakwm7749Po/BMuStYJ+AqRGBtgNgtGDhzcnSsaEl0RntYAsY25m/DBVrD
         EgXaEGTgYzDj3oiK06a0IB8vs9PLY/ij7tFXz7qP+MGcIEmI/ub1vFoFOZv7VruCc+kx
         DpmQTodZpDQj6ehAJHTETbhJx7+ICm9OJ8p+Hx2oZGf8r0jk8UZXuHXYLftyZwISnOL0
         OWAg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+LL+ocXk9DiTHNhhf3b/McxRUjUh25wnJjJdRSI2sLSVT515OTCdZhyDJkl/fHPxCjaVpM86t/Mbs@vger.kernel.org
X-Gm-Message-State: AOJu0YxUT2EP+i8Qa3tyBCUU/PpFcoYDbq/QR7JLQxswazrYbGuVvaNZ
	IdYO9gNa+Mxl2OJEWiZVQ+DjVrL7IzaTzU+h2wV0gh/vjNnYEnV8xu/8dAURO/PIdv9cjSoe6+0
	+pIOBiU5BCioiCVLfguAN6Qw3s3gcYnMHJEkzb5y7aB3ffIzlCQM55086B3Q8fDDl
X-Gm-Gg: AfdE7clY4LuafesM/yj3mZDaOJ2/RWFFC+7ajTwtL6V5pRoVNdZKjleY7bRfg1GUU/V
	3ttsLxfPraTkZJ8tg7DHIz0EdMXeQsEI9BIL+xQab+5UHCNPiraj8PSL14AXgUAyOwDkis0PGvg
	wkhkqNlmmvQJexUAi+y/hEMeCbnN6ReJToNUCIf6hRibVUz+DV5LRCu1C6Ve9uVUOX5AA8XNNBM
	4xdT8F77c4aCavAUZ8FE7ntoRNm3bt2ANuoK+Ibut6yN9cA0ouksdd+t1Ysq4H2hTD/3zVoAW8I
	WwL23YjKbuDtAG/D+EtoENi4eLTFf+Ydrmo5ndMX7CWCTPs6KFkRCJ5hj4pC7LylB05dIDbBILH
	IIO6vuNI1xlLu7JtGUNTSXGwLUoNOsLeMayWuIZAl1CXrR8rfEKFF1Q23xV/3E8FR96zbL3tUHA
	==
X-Received: by 2002:a17:903:2cb:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c7fc9b9eeamr21454985ad.35.1782384386265;
        Thu, 25 Jun 2026 03:46:26 -0700 (PDT)
X-Received: by 2002:a17:903:2cb:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c7fc9b9eeamr21454685ad.35.1782384385785;
        Thu, 25 Jun 2026 03:46:25 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:25 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:51 +0800
Subject: [PATCH v19 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-1-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=3815;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=2qv5ewq1ayMiwA7pIPcW1bE63RIRPVWk501yvyFDS5Y=;
 b=3vlrcWFnAHSdC4q4HVI5kWl0yLxPjWU5FuOyiBV2dpVW3NmwTup+szP/owlmFgK2Y9EGCu8LL
 0YhWZr56BubDg2VIYoeooe2EAPBVOOCGz3bihyEpTHrkLSe0+ocJyDB
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: v1E28ig5NtnIUAaPJ0GS63QfMz2YSRLk
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3d0703 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfXxvjMmt8clDZt
 6Zy9MyUjw3WnMxeh3LJDHhGgx3OfBu2ThephkdcxpoD4uJZTfTGINB0iMnPRujZ5gZ+ufX9ho+y
 VxZiZpDzZeXn+FnAkcBsvIHX0//jAOU=
X-Proofpoint-ORIG-GUID: v1E28ig5NtnIUAaPJ0GS63QfMz2YSRLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX0yorxFHMa5+V
 xRWUluUK1G2mqrZ8nx2Sdkcj2IUSbcxpOeIennPbw5hUMrSW0KZvJ32D7M41Sc4WeO2faW1Vd64
 HS04ejdADxDYHfKRpJceP71llY6HdQF2x4TtNljAEtrPY9pt+hun5Q1mcVKCt9gey+DjoTRFUQC
 rkfTsBhnUyFYfTcX5aA35qcaVi/0kajauXSVHit8n9EVaRrgYWmzyMUJUcIyXOYygjOgnMQYSkn
 Q4LxQzrsHesmWFCUPjv8J2cwFCsJ5oCR5nDXJcsuojEKnC06YjQdSUVGDPNlCxumIK/uoiybTrH
 dtb8OVBmueQ7qUbszfEfHIbnqPsbdhDBtMsPSGMn8WZlMojBG8iBc4RXYySrkJ7dN7KSNlE6N6b
 hvR4zkTpXt4QwlI/WigQiNnlJm14miCQwNJ6cXjUZn4u12qNskHg+JdTsaUsWjUOVUDGfCEiYQB
 8ta5rb+1vV8YE0bmzxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092

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
index 6d65c43d574f..7a7a85acdca0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

