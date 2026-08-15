Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C241D100
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800372; cv=none; b=ZmN4ps1Dv+R91myJsSGb9kONzV/+gvITNs4wzIwJ8hRHWytdl+c5bfBsXkU6kuOlES0UxnwKq7uUEniEaPFmpMxG4FD0LoeeC7H8aSJo8mN5ja/nchmSu075zv7fc2cHGm5GnUvkReVibDRtdS0b8E1vwqyGjwAvq4cyJ0XBWRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800372; c=relaxed/simple;
	bh=y7ar12FG8BENdZ3ityGYZ36lZ87KzzyCCpI/by79cdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnnODtNqPt3vFK8cuu5UnKM8rB2CLgsLbqdMGX6oqBs0fIXz+/IjptQZLB7J0//VhVhn2BtZWG8jtVWe2/Szrp0LAlFAYJneTcTjicVUl99m2khkFO04YNig+IoX6dkbYOwfQYcO3bM9W9oKYiu9D7K/yaj58J2qfQOPyLnb89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkteGfss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8Sh98gr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkteGfss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8Sh98gr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMb1Z219430
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zOFtAZ+E2b5
	BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=; b=MkteGfssnE62uvp8ajwUd7R2Una
	Bm3gGBTlVPrQYjGaKyMgrapFRb02w8mNtSSM3oHrCh1ChhbPtXSXbiWZdcZ3WPrj
	uF+cDDqOGGFNDj5exIZVcSMEvYPdRihk2gK66+3IvvP/JqHBWwqslj9uVOrTGhdR
	A7tBSQB1h/kammS/if/330DL5ZWbdWpkqUdwt4nudHTKg31G82lor7NgMKZBWZC7
	T85/9oumqaL1XASNl9J9CNI04LEkzNn+bOshrbqWY5zx2b8wDxHuKJMcx0KjnuuP
	WoeOSUQM8Mc3C6BKunRtAOhESeyWUaFveiFi55N1RvOAJV5ehVHafgBSzrw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7rvrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1381063a12.3
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800370; x=1787405170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOFtAZ+E2b5BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=;
        b=Y8Sh98gr6GpnPw6OhwyY89CgIgs9X9/S0utDaeoRBDQjr4DV44zoXmlJ22ZASyTg0y
         uClt3c3srJn7llFlYmPnyWu4LUCEwC9Bncks2FIX/2X4KVjuE3j2RY6zQcuyLq9+AM2N
         jbcQcD+0pfLTDZB0ewLoadfss4v836aT1K91cdlSdnzRvpcepAQq4xlHrPqRI8TA1/Ed
         gotzV/fHh1oO78K4GW9FltlJRQOuizlwkPIJ5wQ55sRV1qf1AErHOmBn0hCK//3TnYLr
         5gSAhI70osx7NZ+q31y/IPnkOsviIlwFD6Ciii+bvdiRByXTRSWSmUT4TggyOgqQzg1H
         gwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800370; x=1787405170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zOFtAZ+E2b5BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=;
        b=cfz+aD/LR9L39ktMZ6z3Z0fgxFeaaffcVwmIxLDHb3zmLVRsRmgMQ4N8R+8yuoWZl5
         VD/jaGo1XMIPO9UIq7dTyaFUEy0GierfwkkoAlTbBh9j+zioEQMCmwC2j2JS9QOYxy1d
         HDx0HIIjrhNxl7TADCe1Fu6U9bTbwrk1DiNvToTZ64dqdZScnGX0SRFVtuXvsqzpqbcw
         EbWB64CNVEWc4aWoB4ytX6S4eUxCr5SrbwE5biQvGFS214jhtiNre50b7twgplqCX2ij
         de+Z/WJWl8eTenZUHjgQQ355WLRvEkRcZHpErW+OuImvRUKprQ2pcyBREyHLoBImo80L
         c0nw==
X-Forwarded-Encrypted: i=1; AHgh+RoxZpX+ChsEYWftOGJP2ZCaIRufuJqcwPE92w9uMKxEpPun9fGaGgV+onVKgXvJb0FkOKboc8Ve9Kug@vger.kernel.org
X-Gm-Message-State: AOJu0YxktZRIcDSaMURjMHzM3FF5RkLfPOqaIMnz8NlVaJoBnzT7pXob
	JNI/Vf2XlHR1wjU8+39XbDsJFCQkPWGjFYfNNLAHwJTWmR4WXvKxeaSiXat8pCFJQxWakaPkw0J
	aOwlPOGnEoBWr9Kz6xbXoSsbOEE4BxYZmkmcNzYRtPDgRmJbBU1Wve21adOkKpG4H
X-Gm-Gg: AR+sD13H++gHIz7FVyuUDSCtN5coeyu2BDwAczZyw87Hhjg4Xp8KlDHXHv+ZVT7JO6l
	8/0arJVyvm9lwtZQO1nipDPXsIeRGG77kaIxiLPsbJNjRkBEIswr9O8vHwjgXKuruSdaXAmoZOe
	eQN5uPnXdFIuQzuacQpoQOBIdodC7tQPDRzQ0uRJTfTOLBQZX07KGrTYnTgLW9j8YmQWnO3xbhD
	YOgKIXwuSfZelHPNfyDNgRyxmznKF+pb16N1cg5Fih/zAoOCY6wjAQ7uXxWC7Ot2HkYcQawGIeN
	uV4V4KoftU828hg+CCxMo/+7pWytOFARyA5cTDVYgU4A8U29UP0qTB4yjiJ/Hk5HZSdUIJdmCG5
	jdIqqrkXQGocPO208bFywyTI3zY7tIFK3jnrM35gmskfP3lpxIhQvyooqlr1J
X-Received: by 2002:a17:90b:1806:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3933bd0f310mr14071505a91.3.1786800369595;
        Sat, 15 Aug 2026 06:26:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3933bd0f310mr14071440a91.3.1786800369057;
        Sat, 15 Aug 2026 06:26:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:08 -0700 (PDT)
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
Subject: [PATCH 5/8] remoteproc: qcom: pas: Track HPASS ADSP cluster membership
Date: Sat, 15 Aug 2026 21:25:38 +0800
Message-ID: <20260815132541.1575121-6-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX9Mn38mK4v1K0
 4vR2mpDXjDMsdWoJyJ+JI7no2aCFBzGga4UCfGxga4fjJW5wDSa52+AXbhaTSNtDepxJz5EFodz
 rPG85fD2lz5PcPk6xj400+suxS083TLf/1nUe7GGsZJ4+RkdlV6G1W16C2A1S+kPCIpDASvSY21
 CQqklw+SbOzI1PxySSjXVwfgX/muttXLGrlDWSpdcuD4MWV2Odinh8/BRaI3gC6Kmy5cZ2/ycW9
 6zOvtOFSp1NbqFCvzFLh1IH97ZmeUJb9eFl9dfMy00FdBoGsyeTGQkD5+KY0shWJr925aYMh4m/
 PE7gMIcE27KReHUnBvdPUTkr+CMXLvOjrRImhGWlupBb1TnAOQWfj/GPGqnewAPMma7g6SBNwK3
 IufT3sv3GC1nCtOUa512MMafMnHp1caC22LpBXWKGDXacRYoeStmh7wMCPfxWtaALOiqaj3Ct2J
 YdUlVlimgNZcZ8HlSmA==
X-Proofpoint-GUID: -iiFFEvYaVhvgzyjRIGr6CrYa8o1d2tp
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a8068f2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tpIsOtObft-OYHULcT0A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: -iiFFEvYaVhvgzyjRIGr6CrYa8o1d2tp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX2xGHFXxgIbrr
 5is6RarCb5kV4R1aaJPGRp3NdKLSqp9n9ZlUwzhSNmZn7ITTFKIGLmAABZGds7qHSi2eM/tEtk7
 XhIraCBU5+gS6ww6zKY0wnbuEmvcllg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

On Nord, ADSP0/1/2 share HPASS-domain resources (PLLs, AG_NOC, RSCp,
CESTA, THROTTLE, QTMR) owned by ADSP0, and their firmware cannot
tolerate one member being started or stopped independently of the
others. Modeling that requires each PAS instance to know which other
instances it is grouped with.

Add a small registry of clusters, keyed by the device_node every member's
"qcom,cluster-root" phandle points at, and join it at probe. Membership
is answerable from the node being probed alone: every member carries the
property, and the one referencing itself is the root, so there is no need
to search the device tree for nodes referencing a given instance.

A dependent member is rejected at probe if its root is disabled in DT,
since its boot could never be sequenced after a root that will not bind.

Publish the cluster in rproc->cluster, which is all sysmon and
glink_ssr need to stop notifying siblings of each other's SSR events.
The cluster is left only after rproc_del() has stopped this member, so
that the suppression is still in effect for that stop, and is unwound on
every probe error path, since a member freed while still linked into the
cluster would be walked by its siblings.

Instances without "qcom,cluster-root" are completely unaffected:
qcom_pas.cluster stays NULL for them.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 152 +++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8cff0684fe2f..c8e4230bcf2c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -66,6 +66,8 @@ struct qcom_pas_data {
 	bool needs_tzmem;
 };
 
+struct qcom_pas_cluster;
+
 struct qcom_pas {
 	struct device *dev;
 	struct rproc *rproc;
@@ -123,8 +125,148 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+
+	struct qcom_pas_cluster *cluster;
+	struct list_head cluster_node;
+	bool is_cluster_root;
+};
+
+/**
+ * struct qcom_pas_cluster - state shared by clustered PAS instances
+ * @node:	device_node of the cluster root, the key into the global list
+ * @list:	linkage in qcom_pas_cluster_list
+ * @lock:	protects @members and @root
+ * @members:	list of struct qcom_pas, linked via cluster_node
+ * @root:	the member whose "qcom,cluster-root" points at itself
+ * @refcount:	number of members currently attached to this cluster
+ *
+ * PAS instances whose "qcom,cluster-root" phandle points at the same node
+ * share one of these.
+ */
+struct qcom_pas_cluster {
+	struct device_node *node;
+	struct list_head list;
+
+	struct mutex lock;
+	struct list_head members;
+	struct qcom_pas *root;
+
+	int refcount;
 };
 
+static LIST_HEAD(qcom_pas_cluster_list);
+static DEFINE_MUTEX(qcom_pas_cluster_list_lock);
+
+static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
+{
+	struct qcom_pas_cluster *cluster;
+
+	mutex_lock(&qcom_pas_cluster_list_lock);
+
+	list_for_each_entry(cluster, &qcom_pas_cluster_list, list) {
+		if (cluster->node == node) {
+			cluster->refcount++;
+			goto out;
+		}
+	}
+
+	cluster = kzalloc(sizeof(*cluster), GFP_KERNEL);
+	if (!cluster)
+		goto out;
+
+	cluster->node = of_node_get(node);
+	mutex_init(&cluster->lock);
+	INIT_LIST_HEAD(&cluster->members);
+	cluster->refcount = 1;
+	list_add_tail(&cluster->list, &qcom_pas_cluster_list);
+
+out:
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+	return cluster;
+}
+
+static void qcom_pas_cluster_put(struct qcom_pas_cluster *cluster)
+{
+	mutex_lock(&qcom_pas_cluster_list_lock);
+	if (--cluster->refcount == 0) {
+		list_del(&cluster->list);
+		mutex_unlock(&qcom_pas_cluster_list_lock);
+		of_node_put(cluster->node);
+		kfree(cluster);
+		return;
+	}
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+}
+
+/**
+ * qcom_pas_cluster_init() - join the cluster referenced by @np, if any
+ * @pas:	PAS instance being probed
+ * @np:		of_node of @pas's platform device
+ *
+ * Devices without a "qcom,cluster-root" property are not part of a cluster;
+ * @pas->cluster is left NULL and this is a no-op (e.g. cdsp0-3). Cluster
+ * members all carry the property, the root included, whose phandle points
+ * back at itself.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int qcom_pas_cluster_init(struct qcom_pas *pas, struct device_node *np)
+{
+	struct device_node *root_node;
+	bool is_root;
+
+	root_node = of_parse_phandle(np, "qcom,cluster-root", 0);
+	if (!root_node)
+		return 0;
+
+	is_root = root_node == np;
+
+	/*
+	 * A non-root member is useless without its root: it can never be
+	 * booted, since its boot has to be sequenced after the root's. Reject
+	 * it here rather than at first boot, so that a DT enabling a dependent
+	 * DSP but not the one owning the shared resources fails loudly and
+	 * early.
+	 */
+	if (!is_root && !of_device_is_available(root_node)) {
+		dev_err(pas->dev, "cluster root %pOF is not enabled\n", root_node);
+		of_node_put(root_node);
+		return -ENODEV;
+	}
+
+	pas->cluster = qcom_pas_cluster_get(root_node);
+	of_node_put(root_node);
+	if (!pas->cluster)
+		return -ENOMEM;
+
+	pas->is_cluster_root = is_root;
+
+	mutex_lock(&pas->cluster->lock);
+	list_add_tail(&pas->cluster_node, &pas->cluster->members);
+	if (is_root)
+		pas->cluster->root = pas;
+	mutex_unlock(&pas->cluster->lock);
+
+	return 0;
+}
+
+static void qcom_pas_cluster_exit(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+
+	if (!cluster)
+		return;
+
+	mutex_lock(&cluster->lock);
+	list_del(&pas->cluster_node);
+	if (cluster->root == pas)
+		cluster->root = NULL;
+	mutex_unlock(&cluster->lock);
+
+	qcom_pas_cluster_put(cluster);
+	pas->cluster = NULL;
+}
+
 static void qcom_pas_segment_dump(struct rproc *rproc,
 				  struct rproc_dump_segment *segment,
 				  void *dest, size_t offset, size_t size)
@@ -862,6 +1004,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas = rproc->priv;
 	pas->dev = &pdev->dev;
 	pas->rproc = rproc;
+
+	ret = qcom_pas_cluster_init(pas, pdev->dev.of_node);
+	if (ret)
+		return ret;
+	rproc->cluster = pas->cluster;
+
 	pas->minidump_id = desc->minidump_id;
 	pas->pas_id = desc->pas_id;
 	pas->lite_pas_id = desc->lite_pas_id;
@@ -951,6 +1099,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_pas_unassign_memory_region(pas);
 free_rproc:
 	device_init_wakeup(pas->dev, false);
+	qcom_pas_cluster_exit(pas);
 
 	return ret;
 }
@@ -964,6 +1113,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 
 	rproc_del(pas->rproc);
 
+	pas->rproc->cluster = NULL;
+	qcom_pas_cluster_exit(pas);
+
 	qcom_q6v5_deinit(&pas->q6v5);
 	qcom_pas_unassign_memory_region(pas);
 	qcom_remove_glink_subdev(pas->rproc, &pas->glink_subdev);
-- 
2.43.0

