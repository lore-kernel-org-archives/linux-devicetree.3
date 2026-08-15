Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A267841D100
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800369; cv=none; b=HNEB2mhzQVwNFrmfURTSWdEFlMq0QKOM9SBU6O4k2BeyfbiHAoCeGD4B5/eSjZExlck+aH1Ys2gNKOln8xf6H+svL26TEsjRyhHicAcuwo12MvroBNrp4F+W70gaVwtU+VcomOrkmxAOwIQfCcKoDmmZ1uiGsHzMUOZjGZlvLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800369; c=relaxed/simple;
	bh=DV/mHWWw+foBUxbKi1jvwdFG6sPFv6sDnapjwIOmJ7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izxop8ZOpKFPVcFqCLvV/XRXiVp3HyLBHC/n8BH84r7Z9CrrZ2iWeN4JfJNdXKqEax2Kr5w4fQY2Jq2BsTg5VTpQK+lk+EiPljWi9SNNEoCA3vmhcN+w/hd5LyMWJnIq9J7mof9odR/vI2ox9T8y5GBjANn/Mkdu50tUmzcFH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mqb41BEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=koBaRyS0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mqb41BEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="koBaRyS0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMNsh642637
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Khl0D+QBct+
	K3HTRyxoTR13nRgf1wY/4jb7yUDc3/Lk=; b=Mqb41BEvYuPGhrdmW7gWVdiaKlf
	/467PS9/lHkChZBP6KLm8vztDdFJJd36mOF2jCiyK0qO8B7g4jv8ej8tnQP4nMHM
	+n5ZW5gd6IBNZ5/pg+Q3yU+E1CAlEeGEqlP9NvaxKVejyIvow5JFb8K3uzlWJtU3
	sfOBCmcLNVkc66gpSfgnWg3D8mJK8psE7+VeESLlrKfgfxW5bWhXSFk3KgyWbt00
	9Alud0Ugm+r7YyaSOTWiQxm3nKe+YaCpKCjOc3hU/zZv+WAXmD2LXmKp20PONFqD
	gh1Ebt4TAtujid+6dhh8I6MSVArMVVrsd3oDxvEUCb1GRuoMLmukLHjt8Lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfryj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so2309289a91.2
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800366; x=1787405166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Khl0D+QBct+K3HTRyxoTR13nRgf1wY/4jb7yUDc3/Lk=;
        b=koBaRyS0KEM2I1A4WMJQAXbFKdzk9MJqkMXOtiv6EbQVJVOA5tEAP3xJF0GCPz2TN2
         swgUrwV0j94rNt9XDQGTbgPX4sWSVWFER5p14rcrp/rS+VLM4Ec3FrB5kmHfQeUp9qac
         i29aGHXuc3uwB1zKEBqRtTe5nU56OSCLFRP1JxVhyhD0KVdkG+TjlsDuuXX5190IeX1S
         Nfcdu5iqJGANHzqszQwBBV98gtNRnUOXiE/9T1XHtiagNxS1kc1Dr+b1Fy8jXbpvBYE3
         oz5H07KMIxY031KlqaTvSW5kTDW1rbYOmhOiIxsMtzg5UeE86yQpFJoLdOuYdWbKm4L7
         EeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800366; x=1787405166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Khl0D+QBct+K3HTRyxoTR13nRgf1wY/4jb7yUDc3/Lk=;
        b=olOzmV95++dZxNH9bIkI5ZMm/ELUQvv+oWL2fu/LhT2hqDeg5W7WJLa8nfNOGveZYY
         6Ax+Jv0al2k5RRFDT5+RDHMrgASp74YHujHSOyBBmHnaONAh3hpj1MKn1TJXYA6YdK/1
         wCyZOZxM3H755BpFAJl12zra//VKN6vnMHYQD0cuSGvURSKDgVJ1LgfSVBP9Tf54aaNc
         9DkUeGUoE5KvYvf8vYFc6+/at1NU+7hImkCNh1q2weVXg4/jha/uUJ4Oigx0GpXKqKsq
         gx1iTjjtweXqT0Y9O2ljGWeO1LatQoKDeaUsdj0urSD1JwkvLO5cC5ZcEUwFimwH+Mrw
         A4Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rp5zWonsnOdk2//fFTLbB3LGxvTJEDXevad6ZRdpRpyhj7IhOczyrZyDAyhbn/7kjkmf5C+fWngBk4r@vger.kernel.org
X-Gm-Message-State: AOJu0YxJs5Hn496tCtl5Gib+6gN7mnusNXIzDZRm6lOwXpw7ot5FJg0U
	2c6vYY1r14+P/Hn3A6EHoiGt2niPnjS1AaCEEGaJuyTODRbvqCBRVdyuu4IdWKmWJagAqT7bQB3
	OwRfWLDF5CmAU7REGGqWHMjaMqB7SrQM4LToChl9WmYIX8ODT1U4nrQz2twVmN6U9
X-Gm-Gg: AR+sD10BTiBncqwcBbGFAf6A9sKejA7rNIa0UuUdWh9jnGLujpHxtPr9m+VAIX9MyH3
	BFaaQiY4tmYgMG9n2MhRC+/vVcDIZZzFLGGkK14FUM/IFbqCt8nfnU/GSWoLjITeDyL6wv6Xjo1
	1pSxfE/gqkUdHjkZL72LK9cQirwXavM6bKxhjsaD6kTS1CfUFpB9h70ChZf9RQTlLcWeVY3DFYS
	L5U+esKav7/N+M+X8z5gTfGxlguVZKi1KcelVXSR0oF4Biag5FbZEjykJjLzjW5V0Bmcqb1YAFN
	S+IQXZXoKXHfBPEZqWHH9dvZtSnXmYrkwvQazNSI0Cieg08g8/jX4J4Ytb+tTHzkC4abHySsI4h
	Qu2Sit/jL+RcYUrCqLLyjl0p1p/hdDzyOeMHEkeaK0PPk4/b95vEowuzf5enA
X-Received: by 2002:a17:90b:4a4b:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-3933b6ea12fmr13455218a91.1.1786800365870;
        Sat, 15 Aug 2026 06:26:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4b:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-3933b6ea12fmr13455185a91.1.1786800365329;
        Sat, 15 Aug 2026 06:26:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/8] rpmsg: qcom_glink_ssr: Suppress cleanup notify between cluster siblings
Date: Sat, 15 Aug 2026 21:25:37 +0800
Message-ID: <20260815132541.1575121-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfXzfXn1mvrsfVY
 osIIN4mtLKIP6eaQzSpQRnbc7U0uqE8O9yfFgtYsGJd+PchU7ywP+78XT8OsAUlO3ILZ58SAsW9
 ssOD1Q+iVRshKcENSrcUeREk4ulz718=
X-Proofpoint-ORIG-GUID: mRDERNyDbrSLoZXEm3STzzq_cTYlufFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX/EET2bfzwoR/
 8du7hcRQlSkyGbaaMfXl0B9Vq5Sk7GOUO/BQp3gLf4/tBb2UnafdIthKYanc6D8kkovwS1HfGGj
 8MWmesRhBaDN93G0kJTvRDkJPzRAPQgvahq1b+9WC/mo0iUZk7ccR3ibg3ziHF7Pq8qkAzHdqLy
 s/t53fzx2S6CeAfVKoRXFts0bMI2YYnwoHSBTnw/TouH4n5iWmZ60gnMReTC6EdcYwkXW9ArIEm
 RjS+mHWj5GBTd1B7EGXWxpTC9bqBbkJ3p0MFl+ob/2S67EIbLpD0UI9aUMByopl4LJICXDY5iJF
 mdFJxeZJI8j+yxuE4vP+3T46bhQKshqCqHWF67Rb1SfHZfZD8GS+GmkYgudHvJBz2X6NffXkgaw
 g2i08yqxfdZoQowgHxeCvekBB4siilU9IdwtIWkV/W9/rHT84Bd8rqzLmgVLRRKUInyDzsIdWXk
 sqabm8OEVAIgXItHhBQ==
X-Authority-Analysis: v=2.4 cv=TMJ1jVla c=1 sm=1 tr=0 ts=6a8068ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fZP0s7_--jJOlgppkoIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: mRDERNyDbrSLoZXEm3STzzq_cTYlufFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150096

Like qcom_sysmon's SSCTL notify, clustered remote processors (e.g.
Nord's HPASS ADSP0/1/2) cannot handle the glink_ssr DO_CLEANUP
broadcast sent to siblings whenever one of them starts or stops,
leaving qcom_glink_ssr_notifier_call() to time out waiting for
CLEANUP_DONE.

Pass the stopping remoteproc's cluster identifier through
qcom_glink_ssr_notify(), and plumb each edge's own cluster identifier
down from the remoteproc that registers it, so that
qcom_glink_ssr_notifier_call() can skip the DO_CLEANUP send when the
sender and the receiving edge share a cluster. As in qcom_sysmon, the
suppression is done on the receiving side, so that a cluster member
keeps sending DO_CLEANUP to, and receiving it from, remote processors
outside its cluster. Edges with no cluster set are unaffected.

The receiving edge's identifier is carried in struct qcom_glink rather
than looked up from the rproc that owns it, so that glink_ssr does not
have to reach into struct remoteproc: RPMSG_QCOM_GLINK does not depend
on REMOTEPROC, and the identifier is deliberately opaque to keep the
two subsystems independent of each other.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c  |  7 +++---
 drivers/remoteproc/qcom_common.h  |  2 +-
 drivers/rpmsg/qcom_glink_native.c | 20 ++++++++++++++++-
 drivers/rpmsg/qcom_glink_native.h |  5 ++++-
 drivers/rpmsg/qcom_glink_rpm.c    |  2 +-
 drivers/rpmsg/qcom_glink_smem.c   |  5 +++--
 drivers/rpmsg/qcom_glink_ssr.c    | 36 ++++++++++++++++++++++++++-----
 include/linux/rpmsg/qcom_glink.h  | 10 +++++----
 8 files changed, 69 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 5294e327f158..13458bda6b24 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -217,7 +217,8 @@ static int glink_subdev_start(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
-	glink->edge = qcom_glink_smem_register(glink->dev, glink->node);
+	glink->edge = qcom_glink_smem_register(&glink->rproc->dev, glink->node,
+					       glink->rproc->cluster);
 
 	return PTR_ERR_OR_ZERO(glink->edge);
 }
@@ -234,7 +235,7 @@ static void glink_subdev_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
-	qcom_glink_ssr_notify(glink->ssr_name);
+	qcom_glink_ssr_notify(glink->ssr_name, glink->rproc->cluster);
 }
 
 /**
@@ -258,7 +259,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
 		return;
 	}
 
-	glink->dev = dev;
+	glink->rproc = rproc;
 	glink->subdev.start = glink_subdev_start;
 	glink->subdev.stop = glink_subdev_stop;
 	glink->subdev.unprepare = glink_subdev_unprepare;
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index b0e7e336d363..7136494cbfba 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -14,7 +14,7 @@ struct qcom_rproc_glink {
 
 	const char *ssr_name;
 
-	struct device *dev;
+	struct rproc *rproc;
 	struct device_node *node;
 	struct qcom_glink_smem *edge;
 };
diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 55793fc18293..06494f4d3a4f 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -122,6 +122,8 @@ struct qcom_glink {
 	unsigned long features;
 
 	bool intentless;
+	/* Cluster identifier of the remote processor behind this edge, or NULL */
+	void *cluster;
 	wait_queue_head_t tx_avail_notify;
 	bool sent_read_notify;
 
@@ -1889,7 +1891,8 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   unsigned long features,
 					   struct qcom_glink_pipe *rx,
 					   struct qcom_glink_pipe *tx,
-					   bool intentless)
+					   bool intentless,
+					   void *cluster)
 {
 	int ret;
 	struct qcom_glink *glink;
@@ -1904,6 +1907,7 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 
 	glink->features = features;
 	glink->intentless = intentless;
+	glink->cluster = cluster;
 
 	spin_lock_init(&glink->tx_lock);
 	spin_lock_init(&glink->rx_lock);
@@ -1937,6 +1941,20 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
 
+/**
+ * qcom_glink_ept_cluster() - cluster identifier of an endpoint's edge
+ * @ept:	endpoint to query
+ *
+ * Return: the opaque cluster identifier of the remote processor @ept talks to,
+ * or NULL if it is not part of a cluster.
+ */
+void *qcom_glink_ept_cluster(struct rpmsg_endpoint *ept)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+
+	return channel->glink->cluster;
+}
+
 static int qcom_glink_remove_device(struct device *dev, void *data)
 {
 	device_unregister(dev);
diff --git a/drivers/rpmsg/qcom_glink_native.h b/drivers/rpmsg/qcom_glink_native.h
index 8dbec24de23e..8544f4f5c545 100644
--- a/drivers/rpmsg/qcom_glink_native.h
+++ b/drivers/rpmsg/qcom_glink_native.h
@@ -29,12 +29,15 @@ struct qcom_glink_pipe {
 
 struct device;
 struct qcom_glink;
+struct rpmsg_endpoint;
 
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   unsigned long features,
 					   struct qcom_glink_pipe *rx,
 					   struct qcom_glink_pipe *tx,
-					   bool intentless);
+					   bool intentless,
+					   void *cluster);
+void *qcom_glink_ept_cluster(struct rpmsg_endpoint *ept);
 void qcom_glink_native_remove(struct qcom_glink *glink);
 void qcom_glink_native_rx(struct qcom_glink *glink);
 
diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..9c1ff05d4a10 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -346,7 +346,7 @@ static int glink_rpm_probe(struct platform_device *pdev)
 					0,
 					&rpm->rx_pipe.native,
 					&rpm->tx_pipe.native,
-					true);
+					true, NULL);
 	if (IS_ERR(glink)) {
 		mbox_free_channel(rpm->mbox_chan);
 		return PTR_ERR(glink);
diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 35bb03e67ae8..938f9575784e 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -225,7 +225,8 @@ static void qcom_glink_smem_release(struct device *dev)
 }
 
 struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
-						 struct device_node *node)
+						 struct device_node *node,
+						 void *cluster)
 {
 	struct glink_smem_pipe *rx_pipe;
 	struct glink_smem_pipe *tx_pipe;
@@ -345,7 +346,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	glink = qcom_glink_native_probe(dev,
 					GLINK_FEATURE_INTENT_REUSE,
 					&rx_pipe->native, &tx_pipe->native,
-					false);
+					false, cluster);
 	if (IS_ERR(glink)) {
 		ret = PTR_ERR(glink);
 		goto err_free_mbox;
diff --git a/drivers/rpmsg/qcom_glink_ssr.c b/drivers/rpmsg/qcom_glink_ssr.c
index e71d3716c55c..74c671a19af0 100644
--- a/drivers/rpmsg/qcom_glink_ssr.c
+++ b/drivers/rpmsg/qcom_glink_ssr.c
@@ -11,6 +11,8 @@
 #include <linux/rpmsg/qcom_glink.h>
 #include <linux/remoteproc/qcom_rproc.h>
 
+#include "qcom_glink_native.h"
+
 /**
  * struct do_cleanup_msg - The data structure for an SSR do_cleanup message
  * @version:	The G-Link SSR protocol version
@@ -55,16 +57,34 @@ struct glink_ssr {
 	struct completion completion;
 };
 
+/**
+ * struct glink_ssr_notify_data - payload of an SSR notification
+ * @ssr_name:	name of the remoteproc that has been stopped
+ * @cluster:	cluster identifier of the remoteproc that has been stopped,
+ *		or NULL if it is not part of a cluster
+ */
+struct glink_ssr_notify_data {
+	const char *ssr_name;
+	void *cluster;
+};
+
 /* Notifier list for all registered glink_ssr instances */
 static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
 
 /**
  * qcom_glink_ssr_notify() - notify GLINK SSR about stopped remoteproc
  * @ssr_name:	name of the remoteproc that has been stopped
+ * @cluster:	cluster identifier of the remoteproc that has been stopped,
+ *		or NULL if it is not part of a cluster
  */
-void qcom_glink_ssr_notify(const char *ssr_name)
+void qcom_glink_ssr_notify(const char *ssr_name, void *cluster)
 {
-	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr_name);
+	struct glink_ssr_notify_data data = {
+		.ssr_name = ssr_name,
+		.cluster = cluster,
+	};
+
+	blocking_notifier_call_chain(&ssr_notifiers, 0, &data);
 }
 EXPORT_SYMBOL_GPL(qcom_glink_ssr_notify);
 
@@ -100,18 +120,24 @@ static int qcom_glink_ssr_notifier_call(struct notifier_block *nb,
 					void *data)
 {
 	struct glink_ssr *ssr = container_of(nb, struct glink_ssr, nb);
+	struct glink_ssr_notify_data *notify_data = data;
 	struct do_cleanup_msg msg;
-	char *ssr_name = data;
+	void *cluster;
 	int ret;
 
+	/* Cluster siblings' firmware can't handle peer SSR notify; skip it */
+	cluster = qcom_glink_ept_cluster(ssr->ept);
+	if (cluster && cluster == notify_data->cluster)
+		return NOTIFY_DONE;
+
 	ssr->seq_num++;
 	reinit_completion(&ssr->completion);
 
 	memset(&msg, 0, sizeof(msg));
 	msg.command = cpu_to_le32(GLINK_SSR_DO_CLEANUP);
 	msg.seq_num = cpu_to_le32(ssr->seq_num);
-	msg.name_len = cpu_to_le32(strlen(ssr_name));
-	strscpy(msg.name, ssr_name, sizeof(msg.name));
+	msg.name_len = cpu_to_le32(strlen(notify_data->ssr_name));
+	strscpy(msg.name, notify_data->ssr_name, sizeof(msg.name));
 
 	ret = rpmsg_send(ssr->ept, &msg, sizeof(msg));
 	if (ret < 0)
diff --git a/include/linux/rpmsg/qcom_glink.h b/include/linux/rpmsg/qcom_glink.h
index bfbd48f435fa..6591d016e8cb 100644
--- a/include/linux/rpmsg/qcom_glink.h
+++ b/include/linux/rpmsg/qcom_glink.h
@@ -8,22 +8,24 @@
 struct qcom_glink_smem;
 
 #if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK)
-void qcom_glink_ssr_notify(const char *ssr_name);
+void qcom_glink_ssr_notify(const char *ssr_name, void *cluster);
 #else
-static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
+static inline void qcom_glink_ssr_notify(const char *ssr_name, void *cluster) {}
 #endif
 
 #if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK_SMEM)
 
 struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
-						 struct device_node *node);
+						 struct device_node *node,
+						 void *cluster);
 void qcom_glink_smem_unregister(struct qcom_glink_smem *glink);
 
 #else
 
 static inline struct qcom_glink_smem *
 qcom_glink_smem_register(struct device *parent,
-			 struct device_node *node)
+			 struct device_node *node,
+			 void *cluster)
 {
 	return NULL;
 }
-- 
2.43.0

