Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145296;
	b=C2Zt+M1nSV2mmFqEHHk5A1LkodXlvYy2kkrqXN5Mc8rWwns0wbWcwKXm6uY9SKrpK1+3
	 syRLluP+133Pc/DczA1olWy43SRoGKs/dRoug71RAMpkjbZC5Nx5au1T+I2zVnME2k/a0
	 I6hHvFIoKxwO39b36sLH9gvAG3vWcNgQMmuEVRkFDdFbS+7HQMaS8/ukAOolinTaDLKT+
	 GskQdig3/e4i8PBfJaRtLH9yjbJMRF3hhNX2NEXMAoXT66MguET6fCEjHqq9RKVFO/R7Q
	 IMTg1zn6xO9qWdXXumJjjv3QISeWZeiCbqZDeLM0Z0UNKS728LRa3AiNgw9vj1D5QGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lDApSdN+8EuN85ag439ueqhb0yG1hIULhNUDMTTYO8Y=;
	b=efOhgvZU0TqZsoa0gPyQdtCh/dT7oe7vSnmZ4gJKKI4Sh+uLp27+7B+tbt2IHg6Tvv6E
	 jr0lMtOgHCWT/Rxk1+tGmRYrFIZoZfFOmtT7+xmYWKMs198NYCMC3Y8X5A4CAdtwQ9Sbh
	 bDw81g1HuqD2a2rMd0IN1ALlwReikUaRCwYapRklPpMmqbb0UPEJtv0xrNCDi2/Lwel8v
	 R91D2rg/Ph6Z0dAXfX8SmAE9OgfPmDhxuk5pmqPp2N1RwL+d4tIwsqv3CjScTC/Mq6Xsf
	 keUSlE5IVMouDRH5GPOCTh+tKz4MltIoZUkYBvYx6CvRau6yD/7KwYKPqRPSKF+dSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UG/3PIom";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A8O6y168;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04ED606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04ED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UG/3PIom;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A8O6y168
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0Gcfk1724795
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lDApSdN+8EuN85ag439ueqhb0yG1hIULhNUDMTTYO8Y=; b=UG/3PIomUZw1QgmQ
	2JypOl3atKYJo/HQ5/yN1Yr0Hgvlr9jfL7swNYMVoAwe1XANESLIx0Anl64Qw676
	U7E9jwiXqngu9GCuezfxVzelJvx3uMuCW8cixWk7gTOXYbCX01g0xqQhexI5vWmu
	96Y5yX363DTqhC255/aLx79cAG0UR6r6tx9pnKljyqqKPNkExhp9QsGsM/NVzAjv
	iyCiPl6/5kwmuAHZsDtHhBF3Ug2IFgE2qlByqSLmgq8t+kQAY6b1t225USZxiAZ5
	bCKKG14YYpEtQCVY4QghPdCCgA7zwVfCp0z4/gYDWni1hlKKftUCbF49inkj/WD6
	qU4cow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au1mbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso1348567a91.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145293; x=1795750093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDApSdN+8EuN85ag439ueqhb0yG1hIULhNUDMTTYO8Y=;
        b=A8O6y168RoFBsMzVeY2YfmwBJRlCiEUcpnOf9m2DU9gZTSh+3BI1zblqzVRmL4VBNv
         trBCCyooyQYVyEEpEa3vKvADJ0wkqa8ABsI6XTxGW1dkmKyJ+4VjgI5WDK5+S5JN97Ld
         FcpOV6ULoGhOKVc0g7cjFLQM/LpNfTAK1wUIGrdonyqlFleHQMaFKRgwNWiiJI9Dax4V
         YFEWi+fSkNlzrZ+8FcLBJlSl9G4TIgj8fIPgTYTV41qxzEi/8uaKDppDibZA9wyy2fmW
         rTyBbNXRfP/Pu0wUW4D8l5YgbypQ0PGeEoyLT8WvmNhi3N4r5hJCI03IrksjfBboj9az
         cPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145293; x=1795750093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lDApSdN+8EuN85ag439ueqhb0yG1hIULhNUDMTTYO8Y=;
        b=SdG1ktAXjephqGT/+x2Co/JrHnX1dnZ7udHEgY/xv/0+fU2HjjIIFWIEU89756N89l
         itL+y3cY38QMMR/qEGY0i/Yy0ULWk7753yiGpGL8RVnEmvj5F6T0CKEyhoDlBPTZ/s7L
         cFYLryjbEUfuJV/6POMxhWv+y6ZcREXGEf7bEHTVEGl3XE5HTJFJbhhDI6fPammxWm32
         DwPtBH0X5CSN2HaaZnlrKmZA2vOSv2EXzijCdb9vGO9Z1L1Um+fQo5ywM8WIpdhSRPGz
         98kx+tJFk8ANENyYQSI5ixUCSbrOr5/d//9fS5U3M8srHoCIaYtJTf5zGyuN6qqHpbbF
         I1hw==
X-Forwarded-Encrypted: i=1; AL+hErFI8gGQeqy5dJ55OOm7LR2IZyi6i9JUjX8jSPBJhUZo+TPA2DhGXO77++Ddsf4JShYXveEr23n/43NZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/CtNwqS/iNrOghxA50a30G8qv2C9fMqdxadpue7a1VGIXYsEce
	I0WaYr0hIyKOEsFpatHdUrI7/K8vLWm8xV/OfIqMtgPZCk68Nyq3J3MLHLqgSlwdlCFbhHNWLsF
	CF3YSdbZ7EYK2+I76Mkzf0pqK88EXvh6V5fiIHOkpfKwmUygAzazC/KZlwTLheIbL
X-Gm-Gg: AZFdTZcfO+XDaL7jVn4qzR3GeFwq/h/r6/rC2DcTMIf1JtJ8xbQFOF1+6+O34dUkZ6d
	ai5pstQnrL4KJyQVE8SdvLHTL8g+LutqWtBiYnr2SyIVYDChJMOtubVghqH8KizKcwB/1ry4CI0
	6tppPg1bDiuURpq7Hpe9ndTh9QYNgUzaHUJACFgs++3PIexgJAk6LhbemJR01VM4wOLp43K2ZUx
	hp+5i7rttqKVY2yoSAcCALTtZdzbtmXjhZa5gcKNCKLIu1AdPxeTc+Zhkd6t9dazV9zFmBMkOHd
	gmCDJ1wVVbTRf8mbwWLwechKo7RQa3wXFWf9ayidxpeu4ok/kEU7SW+L2y6daxEQ8VocIHms+F0
	xXc6TI6GTZ2K31/a1D7ZIaPCfnaX518U204HzN6hUc2GFUTYU/Hw7AaBa3VYY2kdAvIo3+yR8lP
	N3NRNACqYgZl32RYHRsolnIRq0HevNyNnP35o=
X-Received: by 2002:a17:90b:39a7:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b41c8e0cf0mr948654a91.12.1795145293263;
        Thu, 19 Nov 2026 19:28:13 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b41c8e0cf0mr948630a91.12.1795145292735;
        Thu, 19 Nov 2026 19:28:12 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:12 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:23 +0800
Subject: [PATCH v24 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-4-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=5211;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OTMRf1Pn9VMGIYfnW832odQvxF2czWGgfodoonCNvOA=;
 b=2Re5y/pCaap/4td2K8GIq6+cuCrhkc1nJLmJJxE90D7M/vcaA44yt9NQRzmUK3eTjH6OF2IDe
 /5nkD1Z1OHJCtNUNNAjJzdpFVsjB3Wy5acvcebYjBPEftuvUWWHfba5
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX4Z+CLS7QQVFi
 j9X6HnX07Dsy0kfqCrEyWtAGDaT3ddqaEuWteIZWplwOWCkET2Qf1lw4woQChFE5pzR4MAxvRx0
 NYcK6KoGDYkmnDCEOEzJkIe3MuWqrWP/xxaajVWQpvEd0b6SoAczXBKSV1bYNsQrauj70nWTlHf
 mFSZIUXeAEjYrnpXYBXXbphBfktO13PB9Xl2hvgMAuB+aFQd9ASD+ERrkfuCsIgsrNjcQ4OYYYf
 3+UCNjenPgBNwAMSEG7zGciAZIw159zkSuSd1vlfz4MQpe0nMKNXH+TGpFEI6tDgdwHjl10KUTu
 3UeLI+YKXEzKfCKJZOZGwtYZMw76yrXMhjxh5A5SIkgFIzeoerJ4d3CRmyoGv+KdhC0PN4GhO6h
 it75LVW8a0oGf/EsPJrm7MOGtWlZ7umcdXAQ7BxJ0v5pX0EJaeVNbY1JTRYcsIW40GCtv/x5+VB
 9wBOuHEtVfjnP7WodwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX3j2ffEj81nK6
 khfsTIzN6etEcr/t2M40jYTZ2rBozPx9PoI3ZUvdouLmTgzYQhORbj+Y6iHXxxOKlyUCiYpXYV8
 D+BLxG+UEZxgYlLwkdn4G60QmYy/sh8=
X-Proofpoint-ORIG-GUID: TU04O-U2hrggF5fjut5wmaE2qoJZmG7s
X-Proofpoint-GUID: TU04O-U2hrggF5fjut5wmaE2qoJZmG7s
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6affbe4e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013

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
index 917f88ccc00c..e94bd74e7c08 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -264,6 +264,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @etr_buf_nodes: Array of the nodes of @etr_buf_list, allocated at once.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -296,6 +297,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node	*etr_buf_nodes;
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

