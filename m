Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612846;
	b=sWYXICeRRTVBIVQkcH8H7hVYIexySAYzth8V6KbDUg29t4jcqUcoMRyGduR0h26AHTqs
	 IpojAn7wIrxlQmN5gMX3Z2Xfqfas5sfU7K2uAgZYrsSxv8iovJq3EZr19o4gbkDkgy4Sc
	 ZIOrJU3HPE563Hg0DoXX9HZk55DeuYIuyeYD7vvOrgxWlTfDwUgs1rymU1EbwVq489aNi
	 2miUjsyitkwJn6wYh/Ly+9J23uirEuZGF2k/0bqGMtBfwRb5Vc3WMepn0mlHGtMpqa2cI
	 QwkNtjikVyffo2Kll2KmGfzB4od9OERzjllyyFdGiWtAEL1lJh3qutSd47Qt4l7VNLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=GZ7qBTQJZN2GZ/JJ5VYUJnje/tmgdZEN4O84+vDMlV6PlboboQzChzyyDmCTG2je0q1X
	 uAaS9zYED9cc6ZmPc9lhblOQPfJYgblDTNPS5culSKkttwFzZnBXhbJl5XmH36yYLUEfR
	 3/9xMkNQhcGT9j0iV6I3UebOvyOxTQYK9XmWteQ22oadiDnme0gOcNFvFqOez6dKlvtiz
	 SeC7N/zx76zhWcqlSUeDCvZmVVEwoeksIWlOU6cX0ij83rodBpcRT+WLO41fnrq40DsCH
	 RdiQ368e7I9cOCmA7xgrTEOO0BJBk2MmHcly2rCHlGNXx4ZjgM7sFBMyeaaDJGF/I4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm3QIn4f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OW7SKwWc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1569606A334
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1569606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm3QIn4f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OW7SKwWc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1qa3430382
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=Wm3QIn4frgFE+1bs
	qRJ6VpTVrvD6xXIAbqfeIgJYWopTXPhXjjyAQi6QRVMtcZNnvyUtIqYw32N0YG4u
	Whc4M2Jv3Hl5RqaT7Suh27/0ijSoYWfXWiEqvjBGE+y26E46NS5PyG/+umL3fNzT
	LT+27sc06bzvGmPdb52W6gnaPWdU/Ii4RanNX77fqAX7WdHY1PrSzzuFmwv3t+PL
	SF76ka8kLJIFFUuJvV7/4mj32d/K80DOSAyvaNNJEoNMWUh2p9upYTNaC1L3DU2y
	089/sz8ACIQDnnGkQ1mpFTcT/zPoyTn0YJIHc5LJ3JYNCEMjPq7gdV151HnCQdVw
	Q9ty5g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmerpj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:47:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adad90c894so3094091a91.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612844; x=1794217644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=OW7SKwWc1GsjjKUtoROXvYMewXz8uUE3dhvyBCwoHqn7hdGQ0A8qSzyJWJsgJwbGTT
         y5RqGjZlvR94wstcKSVcUca9dmyfVaQFoH6DZpVAFcbuS3teVXOQJkjK/ViH0fGeWZV7
         1c+wPE51TdzhvcwjFENhENxmmL2DZ+g4xz80fDbZq56fT8gdoNh+l61lrO+oaLHf+RNi
         PzuG23OCei/9oqXyL++kLfzgxOsg5PhV6BFtl8h9o+lCTO05vtgK64VA1G6YnJ+n9Gug
         qu9CiyuoXafAHZs2e2Vnlvn07bpxR35IJ+l09ZEP3qYD2Y9Ksx/mHHBFy6B98pp9c23X
         7Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612844; x=1794217644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=Av/wNFWKfYnNWo06XcVAxHWtMd+36TtH0evR8XBAyBhE/kts+Fx0tFj6dnp7l4VbxQ
         m44/VKKftpyzxHJ1VFGHabGzY33cGqYa8xAtpPqMXBXaLhC/mVgf2Wya+GLFJjo7WP/5
         oJxwNmIx2TazI8RJaMq7JF8gfBlLK4HHEyWnBh/xoHKdUkffFETCu/2xlGbe060G0og7
         i5JYbqp4+3XvWVg1iq9iu/k4yQO3B6MH+2gDCJ8/4HZr7XC1Ml+56tsk3mdNnZiZ/LmW
         AmqJHekfcCYbTaC69DLvpyVazcMtMu7N4e2Sd5q5xjQyz1XwcZCB6IfQZp99mUQDGWi7
         heOg==
X-Forwarded-Encrypted: i=1; AKwUvByKBhI66hXwc1WzJg1aLDO93LXbvEABxcqmnqRzMPQDgJRQZ3gkBL7da32yMrUgrXNg2I8zCETQIMo1@vger.kernel.org
X-Gm-Message-State: APuU4Z/r+lxepei98ToLgbY+0mEdgG3o6XwdZKQXHUOqNBBHCZEzVG/+
	JWwCiFe4ozZSVUjFhEqx3PKL542EOrOKs95prPg5Fvs7PBPDFjg5TYkkmjXGgLF75PqXhMdCCgh
	TGcweGILZwOWTic1mj6pFTlHnarnISK4+CKsfn+qDExiJBJbEknI4n9euxDCMjoZH/Ke9nwsk0k
	w=
X-Gm-Gg: AYBFou1rrx1o8wgDEbNadl78Ve+XUKUDSqkLK/09qO0izO90z155h2Jj6wf8tKJG654
	A9MaVFk9ZmjtSuzOrYSWWiDvpvBhvp90XTfRWgYzeOy1ElCBBlT+5KSdfHm8O/72zTReI04j9HY
	wpGJy2wiBzGiGjKE+J40ZdIr7fqaKtoN56+AsPX1H6MnM6ipm3s9ItODhXsI96tsbvHVme2hy/m
	tbpJSHnVVLMtxO2gCAudK28PJq1oyrWj5VhQG34nIZKwRVJB7yaM5NbHkoXDoofEUx9hDChQMLk
	v3WAR4o3b7sARUlUrgRHbgwwdTRmbaXdQ9s4yX5sep/gEKP40khQTc0bXJ4re2P2bLzrObH8uxw
	FM5pyZlUI6MbzqB92ZTWN9RVFxfyzFuDU/Kk9Y454VdF2pSKo30BZe3bXsiYbgDLyYyzHyirtZZ
	HY2RMisPJjoXXbJW7XetQary2hFLsAgCUS0zM=
X-Received: by 2002:a17:90b:268d:b0:3ac:762d:79ae with SMTP id 98e67ed59e1d1-3ae895a5c65mr7491743a91.2.1793612843751;
        Mon, 02 Nov 2026 01:47:23 -0800 (PST)
X-Received: by 2002:a17:90b:268d:b0:3ac:762d:79ae with SMTP id 98e67ed59e1d1-3ae895a5c65mr7491729a91.2.1793612843324;
        Mon, 02 Nov 2026 01:47:23 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:22 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:29 +0800
Subject: [PATCH v21 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-1-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612828; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=RghL7vHLQ2LLWPeyClO5kOMvn0TiqRKkbIQ8KwYjaEdz6XIdZ5rR8t9NMisjNHMkl6xdUkz9v
 l862wx1cR2IBqXWU77fiZ9kSzs17FnpwmcgZCzxTJNYUQv3jmOCe9N7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae85c2c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX9b9F3qW8NZM1
 dImhyrj2KeTSv4S66n3DwEEV0mVIRlV56RFnq+MrUFajSbd18WXwlPknSyDQSk8gxZOJX9+8G33
 PJNXXKW5OH8VWFAQY9fRRtBVvFUMd5/Lu3Hyx48Z5Zn7uloCR869kGvZitEuJAmmNciFrnaaW/5
 9nsPuP7fM7lkKplN+enfnLXljBN6AvYJXJ+RUHi8RFpdKkVRuqPeTYvBnVRJH/TQpU1n+kX1PyG
 ejI8qGkpQ2RghYoYRZ75SaSWLnTqgUQg34H1zcdNpmJhzC/pdgutIbLczNrZQNpSm9f7lR96g5b
 ieBLO929DBCje7uZri/4YzFaotXHyywPvgllokrNFH+Mt5H8Upz19n3d1w+SbS9V8elv0GWHTMh
 k1uImOhJlnD49CHW2F60ILVmOhfxrAnOgG9yj95kyNHBRmcoZk8hAodY+88w+ylxrUdUw/OsB7Y
 Mq4kRaDvmH0KUqiMvGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX8Xeuoq1CMAxh
 QTEgB40WAEMIZ6JrHI6RpocU96NoufEefa0mzIbh2mnhsdUHdA6Wb+rCa9Ro+5ZsPj4f91KP/ku
 k685wSjyTZmexKepZmfN9Ta2la8ApVs=
X-Proofpoint-ORIG-GUID: R0bOCrLJN8c6uAYdj2rj_IeNZqRel4Tb
X-Proofpoint-GUID: R0bOCrLJN8c6uAYdj2rj_IeNZqRel4Tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
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
index 9043cad42f01..739105acb0a1 100644
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
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
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

