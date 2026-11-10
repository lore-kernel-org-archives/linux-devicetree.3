Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280962;
	b=WawQuxI+eRAwdQGVjdRrU/0bOmbucSMATGfTPBDtRMyrFgnR7X7FVNgcM2+EVDz+NYsG
	 bCeZ4U9i75clBp8Qot6bKMbqhniKXss0LcAndNsVwtmUr7rPvwZYe04O/aIjIGV9xuECA
	 kZaZ+4rqyNcC9VTgsQEAifBHyHNsTdleBdYgPg29i/kILLyD3LROA2dvu24XL2qUYeSUK
	 dQt6DK3KdbcuQxiC0Nvm/8GFerWdudDoe2MlcPtssxjuLxGlyrwMyPxx/1KV2bE6jZe1b
	 2nW59QmM7/hptYf3+jNfedyzdbui35o1D+pvRLoKoK5NjKHUIFjuLPlrEh6nmQ0ecCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
	b=TDjDGf1tqt400t6TxS32n0068Ux2wkc1rnUn1lQ6IJ/hDQrfb1GmPMXZ0AqcPwInnuU/
	 JOpbRkGeAAndmzqS1hJ6Y7+MmENGRdx8c4LPme8aOQx93W06SmoaVALh3H2cgTgTO7QlU
	 2HWyqnDhwISQYPWQg7a8XAF0IrhlW1lw8WOIevf5q+ixVStphCOGLBZLtILUHHQT2jYi/
	 3h2oh3jetO3vqkxW+hdWKnh1z1qTk0sQ5wvy5OGCs3o8YE+dj3114wmPwUmC1AAtBAxxc
	 P48DVNoxxUSRJ081GSrli30f+rraHDux1L6OknlJDatCkT5xhA7i0q1c+cdA0eoBFxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po4jOEZc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QndX910H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990760A2617
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6990760A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po4jOEZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QndX910H
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jPsC2482416
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=Po4jOEZcBUQbQeze
	GcJKCdD8Vk2MttFayOzP/2XrF34DaUEekOMLcs376n97OS2CLeT+X7yJE5YO3uxs
	Et+Pnmd9rqms35GCdxAS2OGpVdTAXNvXeVfcx3zBAX20I9vVQYBePeqLSw8sTnwV
	G+kN3lIFclZyEmcNgLgIE334Tup6oMIdlIiXOselYyo4uz2xTpTutE62q3ujXtVD
	9MqscxJBerS3erquUxCWkjqgFGgWmp/u3HIdUi52L0rmIEAkPsOfz059TVGnGolG
	MGxXEVlZsbVK3wwkPSnQGayB9POB9L0JurjHBqEpxKhjA2A7ssGEMXbzRd8VqCmQ
	07/0AA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx82nxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so937395a12.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280960; x=1794885760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=QndX910Hrkv47KV8ZVLkaYJd1ZYfCgfJH4GeHTNdOii5yXgleazqAtdevkO4y03313
         fxacqv9n1hw7VI/mEkcdSqypUBAjLF3VfhHkyqV3beY32haXpMiRX1SNbAgPum3zgCgK
         aOvHYbymSudykCybxKAnGLsz13nM7kLiTd3J4LmXLgNADZa8b1bWS45PElm9uf3G0A8j
         nSL+u2Sz3c1am/EIBoFBBaBFiGJyvnhftxZUcEsjdJmccN7LYHIi7ulHLRiLGVPspgop
         xY3gvk2xeBzrNWzPlpj8ggXJ2tKTkpPHxcyuZlpVwOsjDMO8ju0E6dFHOudvw+PCfdTB
         KrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280960; x=1794885760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=BvvwVVSYNrq98mFitf0sEUgVQvs9MrnWTAVsF0V+Hsogl6/fbyqrcOCuFD6CMgAsJB
         IQSUTk+BYKAmB+WUwGwu4uH3SRMQc8n6/3+i+nhQuaScdc77RxG5UEnDTA72BsnjNlWb
         1YmAyXIbl8UscMAH5lMXsgOHUTch354JA2jf2pXcXY9J9Pn3/oFLiSzD0ONbOj9sLQgN
         Uh/TnANn2ttm8x7sSOPyNbuK6U5dJKlMCSnsLqxYovWp6qAYZCVWfP6MX2tHgMSacz6R
         8UaeJ4GRn5/LWYLBFbNqYPVEGGLdx6sYhDqREd90mAj/U3+nWuXn7gfZL+QoXwACuE5c
         TJfA==
X-Forwarded-Encrypted: i=1; AL+hErF1W7w+dz7X1Y62cJKq2V0YPvcGq0YgXJcF8yxZIBG7PlHXNyj8qOl9+1mJ7t4dcVrsquv+WtBw7bnR@vger.kernel.org
X-Gm-Message-State: APuU4Z9klDAu0sFlC9GxNqoAmg+dpAlAaz81GLh57Gt9xo/LD9lmK3Wj
	idq1VhBcK22A41xhhpGtSEDuTK19bvX5yp04A447WbWHf5qeUBTOuFEIaJz9i/izcKFLU1siwkh
	kUWQnBlEeF1+6Hr/aWWT8yVG5rVggZtBk0AztuLmV8TJJ7rKVGoLcym5iYWN7aWm1
X-Gm-Gg: AYBFou2SyHxfuMvCdojEDXBx9bDrr4ns3/6Osj+6sG/LoGWbrR5Sw4Zb59lHz0L+xUq
	+XTLGPca3CRdPc9uw6EhVqT0UmaJ8MagSK5PHLFxgBYrx2zd6ybudHSaRFjsAbyhw8vgxeixEu7
	dGw8O7fnZwPPx1Jhc3CBoUf5hCom2ch7KcymEPjws1N6eXlUS4yS803R1IWu63BZO9mlK4uJQpg
	VXr6oZm764JQu8+l20e+Ls/ig0tBiG5kNp+e4meIjFZakPWDI5kv3cZAXLcfbhYb7XGZLGjjeG2
	F2aZYfRjm+/L4mk1AYrpMxAkkDg/2kBm9JY4UcrnCWcCeFTwNChWQENJVA13twpUiGx+R9OFKje
	VQJM0h3yvXL+IkGy33im9waUxei5Cia7q6z3p2sPkCpOLfQJ+v3hHCCp6fKmZV8HvMeclee+Fwb
	ul3tzFPtlfLCiQwifeRhx+fq2d/2bIo1h4s+sg
X-Received: by 2002:a17:90b:3804:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b166cd72a9mr1611674a91.15.1794280960413;
        Mon, 09 Nov 2026 19:22:40 -0800 (PST)
X-Received: by 2002:a17:90b:3804:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b166cd72a9mr1611630a91.15.1794280959879;
        Mon, 09 Nov 2026 19:22:39 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:26 +0800
Subject: [PATCH v22 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-4-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=kpRNVhutXQ7gohFYZQCqNm1H40Kl3zk4+d4GQd1BPz4yWZX15elY/hEqALIMQRcM7mvFBSwB5
 ua4YckmM+PHDsJBSzHNttGsPiM+rvMRt9Tnl1YxkYUJOqv93jx9Np7o
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af28e01 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: e4llENmlo4RlYLbcx1aNCFJ5id8kVvCn
X-Proofpoint-ORIG-GUID: e4llENmlo4RlYLbcx1aNCFJ5id8kVvCn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXyMopOPvJ3Y85
 pPYqQdLZSPOTU0Cy9mu1geLKqij+78bLDOwJSa4Hc/vDoWeMxlrTZWTOq4E9p9YIwq/Y6UNMdKH
 +uXj4zj3pDChjRJEegs26WU73Y4WuFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX9TeAPvFECPw2
 endGiuTgOMGNsps7cp0Ejvns85GZf5SLuk+D4Z9H3uBB8ImIZFZiwg/N7bqYPVMXV4WUNP8r0Ml
 clLFKRfEGwSyu4ZpgVKv9ofm10hK7piXXkrHBroRzNleYJbux+wYDh/ojif5kdk1HG3Z6YCfh6A
 8KbcZHcdej2HCgbwDOcZhGN9W3gpN8HZQeCGW6aWGirO+qXi4u8QpJ2d+X/zltaVkv1/Gnm6n+B
 wr7GkgU+D1dNkIMdY9xarBQfWubqMp1e0OedaLR6COHDbxOS1jnA8waaAYmyvHBB4akfz8+Gn1X
 MtSF8s4Pn77zm9mNTz+RfaF4eJZDWCtDZh2QiwUqUS04de/0PR+P1YREt3gnD/DRTuLYi+JvCKP
 Dx8hw6M61ezsdAYoNgv6Ji+VJINq44CtJIeAb+P/AOLO8rZmxAMyOlZVO+V4MRpd1/5uMLRJJa2
 ZJum5kGqO4sYcCavXTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 30b15c38b080..36c80918958f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -263,6 +263,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -294,6 +295,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1

