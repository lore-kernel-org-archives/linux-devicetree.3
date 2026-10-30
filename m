Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340099;
	b=CgOaE207g5Mf9O/uk3XZht2f3EU4vVMsw330TJqj7jTI7TvpuzPXBlbAL36xYnKxyEb7
	 Xuh5GhNRZ3U4ZTZuZZdXUNlEBumnx6AEOyM6qblbvgzVZ3iC4N50v4w0hgQuJtD3QLQoL
	 QvQvX99LYCI/z6OEOoQ4+aNngsLgjMy+aLokb9C4Ka1Z29yqHChL5L39x4QtjAO6wRFzh
	 f6uEyseHWIy6QT/J6d3DM45i8suCh7lptOprXq6eh1Etbd7XsbtqdRbtl2qNNoEHP8U9H
	 x46ewk1HIY+rmWBFNKKOAtp+PC+DP9oOYHYV6LM/lzscr5e5B5p3ArkZVT9bp7+xvMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340099;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1A+vL6C3YF2lMP/zNIjvU6aBCr3zyYJrz8URlPUHZ5w=;
	b=NccVGU/uZn2XNRnZ65bm7NZ9HY7PUhIXHQd6iyHXJyfwVc32wGhEiB0q0B/fc+nfOQU5
	 P/5HkwD+selvMqpC/1my1DHWSxoVx/zzyvUFBEcJBASfnwICiVXMdVwN+G7rJ/LFVHQLj
	 YkRa/lewkbk9rPgR2r9crnnZafYiQHS1Oghbh1ELW7gG14Owz44ViCD0v1t236b62AVwd
	 lvAxy9whG/x0Wi8gypo+S+UnIItNMNFIIqBVrdEoNFEDN+OefZbYrr4nw9Mx51O/Pl3os
	 G0BO2O25UCIVSRBF65Kh+voJBjeKocOZy/h9MGFpxwQTJvi9UMuOyJqIhmUf0yS/ADQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OBh/lFQY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KD65jtwU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F5606A335
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85F5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OBh/lFQY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KD65jtwU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F88v2913244
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1A+vL6C3YF2lMP/zNIjvU6aBCr3zyYJrz8URlPUHZ5w=; b=OBh/lFQYa5x2OpmJ
	/Y6VxXEauH65HgaRR7T5Iiw8hTMWU9fqPcqmzUw1KDPQpV7OyAIKBhFZghynxh1A
	jgXPJpCZYU3g/RkmLVhgUgvLwjo7PyIlHOd13yWYuS1mxYmnOr43aupCQmZlOCrE
	pajftQf9vO7b0k3WZLnXSSKUbca69GYsP4udCTIb6psANbGa1vmPlafHBsl6eh5h
	IakWVSIhNuCdjhcacTzgrNSsF1c/rNScOY4kKbYjvWYXyqMJY6XAh1k1I9jjb2jA
	mGJmR5cO0toxLkESxFN8iDvVHhBOreyv/h36xFGk8DAG4AGpykcl2lUj7pWKZ/kS
	6X4ihg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qsenm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd67e98f68fso428438a12.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340097; x=1793944897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1A+vL6C3YF2lMP/zNIjvU6aBCr3zyYJrz8URlPUHZ5w=;
        b=KD65jtwU7xaNtOYTwtvSFmSPzv+firXmt8xmjqJ4/sm8A23PCiHgvTZqLdmir6W1eg
         MQqEYsDAgFzmP9CfFghC98MDHuigkgHPscbmAvPPeqNtP1BbC9G7fPQhzJyQwQwqUjU+
         thwy14VDfrQSkako/nhS/pNug7edfWcBtjxLX3arNi3EV4MlsSpy+OVpCLuaV6a7k46e
         /ns5oDAd2OrTF8nhL+mAL5wTVSr5Sd1bPO05rYUtUAun9dz95EbGFfbPsuEOw019m0LA
         1YOrd0hN9qrXzEFwtYWZKkeb+KffTTSs6tHCudBabMP6549GNWphUh5c9tHv1ht6wqVL
         oX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340097; x=1793944897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1A+vL6C3YF2lMP/zNIjvU6aBCr3zyYJrz8URlPUHZ5w=;
        b=eBUukTNU9TYW7JgJu0I63GvsZvURDGsLrF15GwOETxYGnl0e4UImPR3U/kJJHH6/D7
         X2v/GZzeVPCCBpUSCSeXeEouV4b2mN/JWOauKgZzhwxNXd6X8tMKBliecz7a91aM3mai
         Mbg2AxLL/5WsYtTGj1CA530UMgHtfAYDJPEw8Z/AITRst/Jni0XV6pX3QRE/ElnL2LQF
         YfIx/xAu/ozzVtuEYodcnRsc+G1fDPEBOzPrH345UtH6cxgB588cp8RAMrgCDAG0i4fR
         QGZjAlUyupHwE0F6Xa+IaWktceqObWBo48gLJI/bZNNtDzKPBz/oqDsyeBzZdSbnm73v
         Xonw==
X-Forwarded-Encrypted: i=1; AKwUvBxbLpz+lamLRTj7SmaEjd+xy+dvd8PMMiBrkY0eipbwFlckkWm9AKLcpXWHile7ikpZE0mgv7sgNzMc@vger.kernel.org
X-Gm-Message-State: AFq9FYKDvJqROcfn+MTSB5O6+vCSKxs/kQCWMRcmfi1Ac5adGlro2UTN
	GdBkBhR2+c7c59H7kGq5OVCOLty0S8PlezoswCLuRBxy8SpbnLm8kJK1CVgLzRccOD3jRkYdofh
	Irg5+rJu7/9ayHTn0NVQQhCUTsRFl1s5lsbDkibCN2hhuzeneAiq/D9M0AaEMw8lw
X-Gm-Gg: AYBFou2hsNUzIx9hlbKn0vKcfRQ3BXkw/22oRMzLwHLWViMcuKpOtA3hzC81r7f9To7
	K+pV61DS7HtVFZRCsiJpZ3anHAfeF2BsQnqje9lRFB1y0KFVGUo4XfXMKOHqfSOitIJD/JPkDby
	/MpiBujhJ5xZOnnJxnmkSTTfuWvjUTLgQn1al3xVfLlRH6fczW3eHXsc2KEbVPlO2gtmcLsICbR
	8cuSm6hTZi+SVXPo0uKgia742GWo5JM3CkmORuNc629+J96yO7mvchJxtPHT5Zj3j4NtJbnNEKj
	fmzCiC4mjmAkCKmUUU8leuqfXFGUpedwlVhuePXlgb2hRQxH6M9f036c+h4MgqN6+fZDsSjLUEN
	Dq/uyV8QHgzwsvVYHYCVJn+mg8BIP242zQct6v3m9Ok19B1te5YTPL5loou39bci4Pydwp/n6x8
	H1Przk3XeroP8CslFIOTEi/0GNKIWZFDwEFtvC
X-Received: by 2002:a17:90b:1c01:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3ae8982cc67mr1101301a91.46.1793340096457;
        Thu, 29 Oct 2026 23:01:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1c01:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3ae8982cc67mr1101212a91.46.1793340095483;
        Thu, 29 Oct 2026 23:01:35 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:34 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:26 +0800
Subject: [PATCH v20 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-2-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
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
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340075; l=8405;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=IwoCittoPc5TgMXGb4gtXiZIhBeMNue8Z2iqtGhgpKc=;
 b=NWEFuX5mUYCxT46pKf5G/uH3VH9rAO1727FK7xGeEFl17pNDiEoaNlAp0ztoGV8kfBXovzoC8
 h7t9ottsD/pB4pPBFjRvU7lp+6NFebqSNKstlqBtfXIwg4uNFWqiieV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 5FPND9TBiblsBgHw1X_beGhTlYoN1E4n
X-Proofpoint-ORIG-GUID: 5FPND9TBiblsBgHw1X_beGhTlYoN1E4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXwYKmBQAhDchI
 DTdpQh7OpwQCCLXZ3YYAc0ZXdOM+D5h14+93wRLHU0f+eXOdbSIq9FKJO/nE3GEIUM+0pWar6lO
 Sn9R3wPyrQfK7D6z40uAhpk6H2p56O/Hhkr+qzSrK7Je8MttrOsvthth7S82EDljaXtptn7+8A8
 ZZFOL2v5rQ+xphs2mJwqJxpa0rHfW68DY9STwyEmVWwpKKEnICrC25SOKtO2usaXH61BMSVdpnE
 AFPNesWVXSTzNa+3MC2/zwxazFfhrVw5nY4H9T/qfprdcXbn9MnK5+8LgPGa/SUUJoRGrqWJ/II
 xW4onifLbs75rQCs2+gHw+ysB9c0AROT2NwrSh/30v7BHhVtPT7EwFNweXv9janINCV7tTQMZc/
 GYGAutf1n7teSQTSLMfpW3XGfzt0zCuzDXLafIrLHx93yxP+7ZonkfjuHLlePck8eWR97mMqCwV
 Gdd1wxj7XVWwa+zRc2Q==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae432c1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZnNpNvfxGcc0ZFXnlqYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX0r26C5CmyJZv
 CLNKg3bPgXdfeI7uziNfbdfamIwKTis7kYcgKzuGXVrrxPDFSlWYCwOOdqXFRxTqPWpfp4jn6Br
 M0/IgO6Ub8MO7HrKGncz3f70GZ74C4g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 136 ++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  17 +++
 3 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..bc7dd676da47 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..5981deb45d28 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1268,7 +1268,9 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	/* The buffers in etr_buf_list are in use by the byte-cntr reading */
+	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF ||
+	    !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1918,6 +1920,138 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the device is active, the node is
+ * removed but the buffer is not freed; ownership stays with drvdata->sysfs_buf.
+ *
+ * Locking: callers must guarantee exclusive access to @drvdata->etr_buf_list
+ * and must not hold @drvdata->spinlock. The spinlock is taken internally only
+ * to serialise the @drvdata->sysfs_buf accesses against the ETR sink
+ * enable/disable paths. Must be called from process context: buffers are freed
+ * with the lock released.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+	unsigned long flags;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+				/*
+				 * The device is still active. Keep the live
+				 * buffer owned by drvdata->sysfs_buf and only
+				 * drop the list's reference to it.
+				 */
+				nd->sysfs_buf = NULL;
+			else
+				/* Free the buffer below through nd->sysfs_buf */
+				drvdata->sysfs_buf = NULL;
+		}
+		list_del(&nd->link);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		/* Free the buffer (NULL is ignored) and the node out of the lock */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		kfree(nd);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Locking: callers must guarantee exclusive access to @drvdata->etr_buf_list
+ * and must not hold @drvdata->spinlock. The spinlock is taken internally only
+ * to serialise the @drvdata->sysfs_buf accesses against the ETR sink
+ * enable/disable paths. Must be called from process context: buffers and nodes
+ * are allocated with the lock released.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	unsigned long flags;
+	int i = 0, ret = 0;
+
+	/* We don't need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/*
+	 * We expect that sysfs_buf in drvdata has already been allocated.
+	 * Wrap the live sysfs_buf into the first node so the captured trace
+	 * data is preserved. Take the sysfs_buf and add the node under the
+	 * lock, so that the ETR sink enable path sees a non-empty list and
+	 * doesn't replace the buffer.
+	 */
+	new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+	if (!new_node)
+		return -ENOMEM;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (drvdata->sysfs_buf) {
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		new_node = NULL;
+		i++;
+	}
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Free the node if there is no live sysfs_buf to wrap */
+	kfree(new_node);
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* Allocate the buffer with the lock released */
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		new_node->sysfs_buf = sysfs_buf;
+		/*
+		 * The drvdata->sysfs_buf write and the list update need the
+		 * spinlock, to serialise against the ETR sink enable/disable
+		 * paths.
+		 */
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		/* We don't have an available sysfs_buf in drvdata, set one up */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else {
+			new_node->is_free = true;
+		}
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..6e994678f926 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +289,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1

