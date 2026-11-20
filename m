Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145277;
	b=nwTKH21uNXK7VQFu8xUq2K/O7Lx9EYPCVZEMrdP8QDC2LQJnDqzvgYpHHprARhmNE77T
	 mNpELPYsUcWMZNJSk6lP4GcIRx3Oh8WSotEpBucA3jL57plY340n3hSMVPGdBdEt/089s
	 MCosWbC2tUKknGkq8GS8Rq7R4XongxMvkEE0G6n4KXzSX6XJvOaR7vnKvCO9kYTudUy4r
	 hEZBeGvmw65wsxaxnGbd6PBoVrdXu44pEO7sYJbcFqzMFf3EJNi76IuSPu07zB5rZvh01
	 HbI91pG3VusNkGdKNJ//CbWt0x/Bi3CB04MG7O2dz7dhfVHct2ANt523gFfp1G9xJdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=J85+JeslZTLwKlIf5pZX54PC4qcVodft6O0o+hPt6MZTI9NWAOP7hCr33MF9Z5l2Y2Gm
	 lzWpg06/DVYiiGBGNDFNxFdxukF6Fxowo/EEudd+yXkBXZiJcHTRBGzAmmHJH1e2iv5cH
	 pv/8TisRh0kbsiagT8sHCZTbm1gk/DrYEmaU6va53JmVtRikrUB/6cBednIWb/DnlctLb
	 UodY5iwFT7uCneaJrU+9vRf3tMaBsFP3exInF6py0ho1FAX3t+1qjkohmVQOv+03ZCY1Y
	 /6V4bEUx1+FDzhoy55ckV2PmARUd49OBMFixeGIScrLUS9gadi3hewD2BHeMLFz+CEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPNUGlA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JEbrbJrF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003060A2608
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6003060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPNUGlA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JEbrbJrF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GL5p080755
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=FZPNUGlA4M3xtVsu
	6U5V2pQpduxzWBcmrd/SF/dFjPPAh+Q7dg5p651ZF/D5VxsC2SL2P8m9O9UiFOR7
	FjfOsSX4hYSOTUe7U39W3+UL2uvaIIW7ea+gNxSsN6Zn+uud+45vnr7ovskRXu9C
	30efWNdcdbEUZgKSVe52cWEH1fmEOalT1+bKGeBeGP7InY8jLObagfcIHx37v/vx
	qC8bHa9U9DWXZu7GDPMdiG4ca0htAntjULKznDjGGrYXnid5bp3bGUbIxtmbD2pH
	JjAaGABR7fcpXpvZ2BABA+q4cuAgtBy6cb9WqMamQOW8UTEuN71nDM/kznh3TJ2C
	S8pndg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j255wjgkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:27:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08be1c84so6689135ad.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145276; x=1795750076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=JEbrbJrFE18l2qhkYdb2b7deqXEgQTRyS4NWyyjhzXhXY5EKO1Hr+F9pUreFunLw7u
         RSKDtZMELNXM4QMRPAblfEha+dLT5Dpp5cyCtU/wCv7ACzAVjyrWTWaJjrLEOIfzOdPA
         OXgpoMtaG3HBEoTEujSC9hs13wJsaWTfIbVhpEAIgMIjLjjBs9dzKrZBKqYYZsqWzAMz
         mH/38iRWBhBt8gIYmc9dZc6rFhFbOEmd0pNDl5iOPT7XiKCylyJ50CzlquSuEeFj/JO0
         9WPn6BqzxBAXrcZyibN7/K5Du1iaEydti/vXTJ3U3Iw8GkH6bcyWoGpOnYn0yqhs+tN9
         7fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145276; x=1795750076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=LWzaR8wCjAz3oojMa+P9BK6pM4dN4J8VuYUI69O1FVpsjEnfOUgDJXr7gsdfLvoKzk
         V2wwHj1szuuwJGX3J64oOt7i5vXpYHbqZfXjC8AE/+h7ZSiONhrCnuHksV5atvas3/B5
         LNBfOISCBHUoX6vWE7Te6PWMmpW9/bExqDla2fJUR2JmLFWDMugSJARoqhAtE60mOP/u
         ovpVcfqVIB5OXeigY/IdEuwfdItU8//Gi4s9O46hPxVarKbOHIMF5Wmi3Kixfzg6qcXj
         eslC8gzbQREGMBTg1QICMTNn56nYU1JuZ5GvXgUNJhduAGNa3CLKXLmMIuLpVoFjJ7Wr
         sOpw==
X-Forwarded-Encrypted: i=1; AL+hErHexbnpk8PHiY9AwvS89Hhu/SK2X0WmlVL6rdswWy0QQVCnxFhaIpzWJ22pWurTTeYKQCZdOjj3DWIB@vger.kernel.org
X-Gm-Message-State: APuU4Z+xoHIf+FRFoGl8p4HmbLUwNnJtNeh5S9S+uf++A8bjLqkPT057
	oS922UNz8SrPJjgPFY15xuBkblnonNu1LFM/dNNRagf6YPjXd8LJdM6ZrIl4ksGWHXKhcZRk0Va
	36yMtX9Gd7L0Z6podpVUPO2jOpuN5hZKnnw9mFD+BQVVLD1QdumTWU7ooaoCXvSgW
X-Gm-Gg: AZFdTZc+rOv9x5XXZtFAP7zZtGgqaKv3XPU+7IfgpRYa/4ZfXGCi1d0fakiyOVEDz/8
	ydhZRNzY5W2Z85RL36fPGlQPuz4xWYJfm99C98aKIElJub1c31c8eLOhs/gbgnxD5roGtlBlA9g
	dEwuHmbwyo/GaIIXTZeKvkzaVQaQI8D3K+m0STwF7IZjqTxEQLnj0tXoZsV/l6UGmMGCt1dAPcU
	RJs1pJfva07GeoBbFJgsJbPodsXVzbCvs8A85BVdxt0gb+RCfw4h8MFEjpmVNzZiVQ85ZGNy9fA
	nWW0xelie9QWUYiyWm+FTeyA4TLTnaB5poZHmqcfNGQ6Ot+JZzFSu5M1x2fv4TSkRdPi4nVl1au
	/e351rHIfkbiYJOzKqI1nfP8m7a2Houzvfverilurx3jgdkmQAgVsypy16GVdg2jeb0AV5aFIiT
	AsdHm7/9Po2D4p+mvVaZQoryUCA344uolspnM=
X-Received: by 2002:a17:90a:d607:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b41c7c776bmr1618877a91.8.1795145275913;
        Thu, 19 Nov 2026 19:27:55 -0800 (PST)
X-Received: by 2002:a17:90a:d607:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b41c7c776bmr1618844a91.8.1795145275396;
        Thu, 19 Nov 2026 19:27:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:27:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:20 +0800
Subject: [PATCH v24 1/8] coresight: core: refactor ctcu_get_active_port and
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-1-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=yMoIrzWOQ50jvHYhBXJ2PfgxB+abUyuYXPJcO3UjEf0TltUydpQjypdtp1E6Rp+a5UAjxmw+3
 ZHCiX/UF8aSCBAxQWF8OWjTpAz1dllCRyrF3zMyXbon5HQ9f5R2d/je
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX9/eW+e88LHOv
 /6YbzxJ85Bqe2e46Iggbdv3co+ZUFfXTXK/m4vpBCJUX5gdvA8chdCiNMmAQJwC3I2rD5PFTOEe
 R28GJ5B3/NeWnchtUuX74X5RCtBq4uw=
X-Proofpoint-GUID: WYxOoaRBwv3FgAevWX-lV_hMQ-md53xO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX8zaNEjOlpzBn
 LBF5iJM8uuS2jAkn03/b9XLJosGdIZrc90rVWKsE69IN16TZnQC14YuJpQTfmmLhjpj6Obz0+mi
 3yRmkN2W54SR83zLpT26r4MNGnyjV+id4dltOmSF/77r6bEAPSZD6eXLy/by2legZX2uadRDXhz
 mtAW6SBh5VWunsbW2jQm7+ATp+/qAjCLdrqZ6guN2TmIbk/U8SgGWY5Bvqf7CLNbmziGl2ifHWN
 9d/iputzqzCwWrMRuEZ5NcKHKlITWSLfYmpZyEBoOUoi6CSG9/9wpoedJyhK3aMA6KXopXoWb3O
 yF+Zy48Ow45QxBplerGK8WerFZKcfWTA2qTTxC3r50Z/7Y10Z1w4buLynmO0dsP0MJ9VXHk+sa3
 ptc+1nUxvAT/o4HB1uZJKiBLXiOjmbTkjgc5eiHad6makd3uFOLvfGh/y4hLh37RLIWFJ8yuhTf
 +iRlSFSW54m/066p72A==
X-Authority-Analysis: v=2.4 cv=da0VTnXe c=1 sm=1 tr=0 ts=6affbe3c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: WYxOoaRBwv3FgAevWX-lV_hMQ-md53xO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013

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

