Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458104E36C6
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672155; cv=none; b=unqGUGhGbj+co1Y0d8qe7q0blLgNRao3Cg3P85r2Vfmfb2FOZMnWb6T+rCAEgiXCubvUuhh5r5bnz5McgbLZ3GfDSUHURnG5FsQklhyUCvGcRcEBrvLRaqoU55kZh5D3PwnaVAuViU5CsdYupzvDY6rL0XpWLXrXvmNJL5yyg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672155; c=relaxed/simple;
	bh=bHaDSjXWbZXbjzHnaeozTdWBw06rVQL/VsTGMb6wq6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyNrlcO8sW8WUwNSz5Zr/fK+PjHFQ12tilKHSErVwKC6kwYy/1UU/Sl1l0TUvHqAiAkkaippjDGvoc5NHumidfVbfF+7oLO4sR6pXZ00yhfM3I0GINYwDVVe6/c7ZSDP/pJrY4pTXM1++Huo3ZwrNbUZ+nIi/HgqXDa5t/8x7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtR15o0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9B4murA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtR15o0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9B4murA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TfYh300657
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=DfhU
	act2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=; b=gtR15o0IoQGTPDu7h1oa
	BoPjYLSNSSwsYEhyQ4dgHc/VfdUs+sM3Vxj6G0IXarazd/gF6EUdzKVBPDIW2bRM
	loNH4T+oFj28MGIWw56OWNrwi8N18m2HN4UzT3pSL5+BnCrxzq+0/snO0Vy1eJHB
	Zg07Pc/H/6u0LkuWxR6nv7pHFjpZ9oo+Z69yK4tyFVoXait0maoyA/nz8htmom6c
	j1inTrXOJLM959zUcYjnYJM1LL9s+0Ekcwuk1YC6GBO3aWWApkmR/Wa/Ie9vKwiP
	6S5JFpqQpIzEdSAaL3dcZEHD2pc2fQzCLRMjNwlaYeoPromHUMmMDn+iRNytUoSC
	xA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxh358-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34afa104860so932816eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672151; x=1791276951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfhUact2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=;
        b=K9B4murARAZNnuHaafXwn38smCbUeSx8FvOOrQ0ey8l0eV/Q6cMD//lBKdzkXUmeAj
         PpihdMDQh07/5khQdje6r9NMGauhfSO+Cc2fCUfQG/ibHu9/pEQ3O+cgDv8KxFlUWLND
         PsPa2PkPAF1bSfdM0lgeKY7AAzLr2xi8Mh3KrKCnprdpmnYlHbuwi4WNd2rXrwsdnQDP
         DEG+DNA+dtYs1kdzC2xxe37xTFzebaai5Qq2Z9L17gWbQS0u5xXQsavJfWSGK3BXYlgP
         D8xZzo+kHEm0wBUBmxkFjnUQEXRoAM3grhpCLdAqjz1AFYuIieMDGoHm+D3h1PQTJXXd
         SkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672151; x=1791276951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfhUact2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=;
        b=q7BZrBF/PKhvyXbJ1Dm1Ok2l1Mdd3SL9T9AIGijoVylbSZYeohLyd3Sd/DgpRxv9Rt
         c9VGgXc3t7N/EL32X5u+wStpe+tEv/2xmbNR7NQggHyIkHTSYjrxTavHnUH07UiQwwE7
         P7mTNvFn95V83Rvh7KjKI5fZ9eBdn6+/SzBG9Ctlgk6tavCWCMHOfn5iEr6rfqISK4Yx
         AztTsYmJAV21M7FpiYPCFgyZqwHmQq5YcX/opPOYM2giyjasTrkc7Aio8KBgxjpZzndl
         RwsXPkX2Fg3oj1A3w6gj+AeplLS6QH8rhLD6D4GVB9CsTJlDgosChfrcrFMI1qwYeUvN
         E+JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVf7CSgHv5l/rM+gUwyxDxX9E+ZgT5Kc337M9VFHuHRQ4uI93D7XDVSQdOnTTw33fU0f7XZRTeuMXg@vger.kernel.org
X-Gm-Message-State: AFuF++kxPwfpddr8B1PjgRbPpCuit15fss6Y0R02uIoLeUsKHCZGgsvO
	hvHnrxONuwyVLWQC6sll8ZCq9xvXMnPyMPPrjs+5CzqCByo3U+Fkf9rbysI77d1wSYQzIuiUYka
	yHmW4+rD5y6CzUye4awNi1xE5y0p0dxZEWqNZZnR2a3K28tpbH0bAdfXkfBbAwJHq
X-Gm-Gg: AYBFou1XaxT2DmCrcNt4qjr76zKv5gxjZsYFR+aHvSRZXBkRvxFMssVM0iukkRG5UP+
	bEaixOCMsvLgUVTkI1gYkCcJKcnoh2VnFqqSOrQNhpI81kt7f3R2iOxom2blRmaCO9aAptajIIa
	UEl0ipKnlLWhiDl8645z29YHACoOFJLFF86O4v4xHVGZZWz7dR+8tHfUj5pVInbYHVqtXjfvJoj
	UHh3tb5oYjvbSPvGeFyILVgnyHpPQ4M2BVY6vycpExDsVeYSs5DVGeZuhfOqUXFvym3Kxipb+Vi
	rMLGsG9IlQwomFZgUybeaghKgsIlN3PlISEgdL1757gz1Kr/JpVq+UBiLj1JdyM5GIIuPFleCbi
	bMB3aPwte4D4MsZUPAX8UZRay4t38o/7ct1g73es5YXsLvvW/k+L1/axq
X-Received: by 2002:a05:693c:8802:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34a48cec2bbmr4105931eec.32.1790672150791;
        Tue, 29 Sep 2026 01:55:50 -0700 (PDT)
X-Received: by 2002:a05:693c:8802:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34a48cec2bbmr4105913eec.32.1790672150226;
        Tue, 29 Sep 2026 01:55:50 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:49 -0700 (PDT)
Sender: Sunil V L <sunil.laxminarasimha@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [RFC PATCH 4/5] hwtracing: rvtrace: Move to fwnode_* APIs
Date: Tue, 29 Sep 2026 14:25:23 +0530
Message-ID: <20260929085524.1554507-5-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
References: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX/GjG2O3psMpj
 ZYhrZvuQhQy/YVhWaf2lDEAczLaFs8I25chS6+9tlfr0x11uuKhfMcOH0KnyJaa4BsuGK9IfZXt
 SaXWhjCkcMnMlvThSGJ+mUbq85mn2b8=
X-Proofpoint-GUID: 9a2ydtHideHkIWtaizfyLtadsov-zoNM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfXzJbPNZ9i5moi
 gb8vXiIOo7c4jiGHAbkqUFNknBmiXU2scf25OfwXFJG9IlG3bAEagQKQNOOtrXUD+dYQ+nlwtlE
 p0yfv6LkdQdndw6GPWaCunBB9nw6nUNcje4kMB7oTMdrjYdj3e1ff4GcQIHcqIhaf//WUhaRkv0
 iiAUCP3h8eXalplddzP2WPSlE0supX6csxr9o0uT//KQA/VIWsbuoyr087FZzPhiQH2sJNAIouE
 Ktl3+mL6RKaVU4J5NvkoazK7STLhXVt/+ZulxJ+UZKqOTnUbXQxliV8TMAey6I2h3p18dOjpb5E
 6tUG1WIVz3/lVTtwalsEhPvsUZ8x+EVzJi1ucVBmsPCr5w/SHew8yMQGBLQfE8fGwhWwDlhEnXs
 AwxDb0L4e3uKbVOqeUUG4eepx2LwdCUSyAZQ3HxGOhR+65RlPI1OVWXKxYUlRSYs+qKWLqXN/zY
 Rtpt2lqkX6Hz0hvn5EQ==
X-Proofpoint-ORIG-GUID: 9a2ydtHideHkIWtaizfyLtadsov-zoNM
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb7d17 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=R8tqjmwxtafIxTb_AOQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035

From: Sunil V L <sunilvl@oss.qualcomm.com>

so that it works for ACPI as well in future.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig            |   4 +-
 drivers/hwtracing/gtrace/rvtrace-platform.c | 131 +++++++++++++-------
 2 files changed, 90 insertions(+), 45 deletions(-)

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e5b62d65e2fd..86322250a6a3 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -2,7 +2,7 @@
 
 menuconfig GTRACE
 	tristate "Generic Hardware Trace Support"
-	depends on OF
+	depends on OF || ACPI
 	select PERF_EVENTS
 	help
 	  This framework provides an architecture-neutral kernel interface
@@ -18,7 +18,7 @@ menuconfig GTRACE
 config RVTRACE
 	tristate "RISC-V Trace Support"
 	depends on RISCV
-	depends on OF
+	depends on OF || ACPI
 	depends on GTRACE
 	default RISCV
 	help
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index f34de9183d9a..12330d9dcddd 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -7,7 +7,6 @@
 #include <linux/gtrace.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/types.h>
@@ -61,52 +60,61 @@ const struct gtrace_hw_ops rvtrace_hw_ops = {
 	.reset		= rvtrace_hw_reset,
 };
 
-static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
+static int rvtrace_parse_outconns(struct gtrace_platform_data *pdata)
 {
-	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
+	struct fwnode_handle *parent, *ep_node, *rep_node, *rdev_node;
+	struct fwnode_endpoint ep = { 0 };
+	struct fwnode_endpoint rep = { 0 };
 	struct gtrace_connection *conn;
-	struct of_endpoint ep, rep;
+	unsigned int nr_outconns;
 	int ret = 0, i = 0;
 
-	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
+	parent = fwnode_get_named_child_node(dev_fwnode(pdata->dev), "out-ports");
 	if (!parent)
 		return 0;
 
-	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
-	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
+	nr_outconns = fwnode_graph_get_endpoint_count(parent, 0);
+	pdata->nr_outconns = nr_outconns;
+	pdata->outconns = devm_kcalloc(pdata->dev, nr_outconns,
 				       sizeof(*pdata->outconns), GFP_KERNEL);
 	if (!pdata->outconns) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	for_each_endpoint_of_node(parent, ep_node) {
+	fwnode_graph_for_each_endpoint(parent, ep_node) {
 		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
 		if (!conn) {
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
 			ret = -ENOMEM;
 			break;
 		}
 
-		ret = of_graph_parse_endpoint(ep_node, &ep);
+		ret = fwnode_graph_parse_endpoint(ep_node, &ep);
 		if (ret) {
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
 			break;
 		}
 
-		rep_node = of_graph_get_remote_endpoint(ep_node);
+		rep_node = fwnode_graph_get_remote_endpoint(ep_node);
 		if (!rep_node) {
 			ret = -ENODEV;
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
+			break;
+		}
+		rdev_node = fwnode_graph_get_port_parent(rep_node);
+		if (!rdev_node) {
+			ret = -ENODEV;
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
 			break;
 		}
-		rdev_node = of_graph_get_port_parent(rep_node);
 
-		ret = of_graph_parse_endpoint(rep_node, &rep);
+		ret = fwnode_graph_parse_endpoint(rep_node, &rep);
 		if (ret) {
-			of_node_put(ep_node);
-			of_node_put(rep_node);
-			of_node_put(rdev_node);
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
+			fwnode_handle_put(rdev_node);
 			break;
 		}
 
@@ -115,21 +123,25 @@ static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
 		/* The 'src_comp' is set by gtrace_register_component() */
 		conn->src_comp = NULL;
 		conn->dest_port = rep.port;
-		conn->dest_fwnode = of_fwnode_handle(rdev_node);
+		conn->dest_fwnode = rdev_node;
 		fwnode_handle_get(conn->dest_fwnode);
 		conn->dest_comp = gtrace_find_by_fwnode(conn->dest_fwnode);
 		if (!conn->dest_comp) {
 			ret = -EPROBE_DEFER;
-			of_node_put(ep_node);
-			of_node_put(rep_node);
-			of_node_put(rdev_node);
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
+			fwnode_handle_put(rdev_node);
 			break;
 		}
 
-		pdata->outconns[i] = conn;
-		i++;
+		pdata->outconns[i++] = conn;
+		fwnode_handle_put(rep_node);
+		fwnode_handle_put(rdev_node);
 	}
 
+	if (!ret)
+		pdata->nr_outconns = i;
+
 done:
 	if (ret) {
 		for (i = 0; i < pdata->nr_outconns && pdata->outconns; i++) {
@@ -138,29 +150,69 @@ static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
 				fwnode_handle_put(conn->dest_fwnode);
 		}
 	}
-	of_node_put(parent);
+	fwnode_handle_put(parent);
 	return ret;
 }
 
-static int rvtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
+static int rvtrace_parse_inconns(struct gtrace_platform_data *pdata)
 {
-	struct device_node *parent;
+	struct fwnode_handle *parent;
 	int ret = 0;
 
-	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
+	parent = fwnode_get_named_child_node(dev_fwnode(pdata->dev), "in-ports");
 	if (!parent)
 		return 0;
 
-	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
+	pdata->nr_inconns = fwnode_graph_get_endpoint_count(parent,
+							    FWNODE_GRAPH_DEVICE_DISABLED);
 	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
 				      sizeof(*pdata->inconns), GFP_KERNEL);
 	if (!pdata->inconns)
 		ret = -ENOMEM;
 
-	of_node_put(parent);
+	fwnode_handle_put(parent);
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static int of_rvtrace_get_cpu(struct device *dev)
+{
+	struct device_node *dn;
+	int cpu;
+
+	if (!dev->of_node)
+		return -1;
+
+	dn = of_parse_phandle(dev->of_node, "cpus", 0);
+	if (!dn)
+		return -1;
+
+	cpu = of_cpu_node_to_id(dn);
+	of_node_put(dn);
+
+	return cpu;
+}
+#else
+static int of_rvtrace_get_cpu(struct device *dev)
+{
+	return -1;
+}
+#endif
+
+/*
+ * rvtrace_get_cpu - Find the logical CPU id of the CPU associated
+ * with this rvtrace device.
+ *
+ * Returns the logical CPU id when found.
+ */
+static int rvtrace_get_cpu(struct device *dev)
+{
+	if (is_of_node(dev_fwnode(dev)))
+		return of_rvtrace_get_cpu(dev);
+
+	return -1;
+}
+
 static int rvtrace_platform_probe(struct platform_device *pdev)
 {
 	struct gtrace_platform_data *pdata;
@@ -168,7 +220,6 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	struct gtrace_component_id id;
 	struct gtrace_component *comp;
 	u32 impl, type, major, minor;
-	struct device_node *node;
 	struct resource *res;
 	int gtype;
 	int ret;
@@ -189,24 +240,18 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (!pdata->base)
 		return dev_err_probe(dev, -ENOMEM, "failed to ioremap %pR\n", res);
 
-	pdata->bound_cpu = -1;
-	node = of_parse_phandle(dev_of_node(dev), "cpus", 0);
-	if (node) {
-		ret = of_cpu_node_to_id(node);
-		of_node_put(node);
-		if (ret < 0)
-			return dev_err_probe(dev, ret, "failed to get CPU id for %pOF\n", node);
-		pdata->bound_cpu = ret;
-	}
-
+	pdata->bound_cpu = rvtrace_get_cpu(dev);
+	if (pdata->bound_cpu < 0)
+		return dev_err_probe(dev, pdata->bound_cpu,
+				     "failed to get bound CPU\n");
 	/* Default control poll timeout */
 	pdata->control_poll_timeout_usecs = 10;
 
-	ret = rvtrace_of_parse_outconns(pdata);
+	ret = rvtrace_parse_outconns(pdata);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse output connections\n");
 
-	ret = rvtrace_of_parse_inconns(pdata);
+	ret = rvtrace_parse_inconns(pdata);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse input connections\n");
 
-- 
2.43.0

