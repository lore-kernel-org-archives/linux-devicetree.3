Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5DA1E47CC
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789533196; cv=none; b=OOgCpmFoakO9pdzEaMMcmPyJPs+TqqQbMayLw44So5PhXCQiqUI1wblrQ6+SHU9poPI3bRaPb1HDpEJELPAlY4FlhS3bfT2HR6x4qbwTqN+aWuD+Gb4m9vLJERSBO08V9827ceHoAvuDl5twpQHDTi1mKt2cAXyIyiZ04GioqG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789533196; c=relaxed/simple;
	bh=BBExn2VtQFK/zCAqIRlKSN5m1YGyKdZqwUZY34MnYm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cbi/fbKm0ynlCRc4Z92uu+7X0DkIrIEcQALxzG9FTBh7pU6N1fIg8AKhhikTzZAvh/SvIm6cJLVj2IvwZETh8gcYsxSpM69x+YcuYeSSLdUVwcI04ydG2u9t0wDBgRQz02ed3h67gfdHQ6cGjU8HIk4BSongmkinlDD+plTPfug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Gy4iFueh; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Gy4iFueh"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLVm1W791604;
	Wed, 16 Sep 2026 04:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YZquQWjZGeAbplbdG5X5m8RzhCZUR63iLT9FGoWQX
	x0=; b=Gy4iFuehglnuAgFzh5q8rCCAM84evxmIR/Cmfad4/u3oDL866KkRUZqvO
	waPBWCYefs+OR0FNBdwKoiXB8vIb6oNm/TWog3bZqXVOD7xQwQShEWzdDGAXTyJP
	OoSx5xZAk2N/eQ4y92MKpYUGnJev91mK3ZmnoSSpRZgkeyuGvm5NgQLe2NvVqciH
	Y8bSzYQ8RJRDMaGVtDnkyRLrhHlZ/mZpwOR0nQggLmkIZHlJazSSvgk5gkm7BHQ3
	nARGFXqhnpDDSUHWY2mH9X8uC2BUyBDo9HuIrjz/V9Usvek53JRenN6kURaJ1nT2
	o3W43gRvEqqjNhTfDiZDAV1Lm5GJQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmw5e2g80-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 04:32:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68G2lEA6389300;
	Wed, 16 Sep 2026 04:32:55 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gpyxscq0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 04:32:55 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68G4WrbB4915870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2026 04:32:53 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5D9D58056;
	Wed, 16 Sep 2026 04:32:53 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 140B858052;
	Wed, 16 Sep 2026 04:32:53 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.186.148])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Sep 2026 04:32:52 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, maddy@linux.ibm.com, robh@kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, saravanak@kernel.org,
        ritesh.list@gmail.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH 1/2] drivers/of: Add of_detach_node_no_notify()
Date: Tue, 15 Sep 2026 21:32:48 -0700
Message-ID: <20260916043249.2062676-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1NiBTYWx0ZWRfX/oAdallJEOvG
 eC5gioHvNqrNjTdDqEKFPO2zNqYA4YFJuPDXKSojPU65wwAd4gX+qVZBzZGBWcH3Sbu2kYckQcZ
 2BDYTCmOFrnquTB5t+Yo7Kk0JqpVOL+/tivOYQmzcGtwjaPV7use2+8cSfWbeN6jtQuaeBtx7Ct
 cdeTDDbaUEOJy5EgKJBdHYQugvptUA/hYW2Gl3vcPkWDkp3TQ7PDsorcWPV78EwOhXSoZ7bD3JT
 qXxpN38P2ldwLZtinmIswjFXArPBffvzF+9tt06kXqK+lEkVMtzx3kMRKKIfHj5H9MVCsWGr6ff
 ufObaIZzcoGRfKVm/KuH8MCwM/C9ER0hIqVdL9QF8+xxX81iS3ph1pdnL4D+UzjoQOH/Erq/JA4
 5YaVM5DxA4kKOnkPdYToxU9dspS8oRLeMyehivbakVueUrLjf6c1UXFujELac7JQsqs8Xznm5+1
 Vp61DoIgc4l6EYHCC9w==
X-Authority-Analysis: v=2.4 cv=E/NYNqdl c=1 sm=1 tr=0 ts=6aaa1bf7 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=Yfu1lNDa6tetUWVIbbMA:9
X-Proofpoint-ORIG-GUID: rj1XRPVUBbwXwu6JOrXi3ST6_Y8L9xbT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1NiBTYWx0ZWRfX8wPJnjasPgn5
 Hcn0XS9aNFZp/mKAn46RTt9UwzJtGXDkyA14yBY3RTdK98rw387ollyqQQzH7+zFvJTbVgGXB5G
 SMt6xMz9K6VwGVJDv/1SiSnJN4XyvlY=
X-Proofpoint-GUID: zvCHHqpieD01PgDXEMHUwMQXxNQiS548
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160056

of_changeset_apply() interface adds nodes for action
OF_RECONFIG_ATTACH_NODE and calls notifiers for each attached node.
Then the caller uses of_detach_node() to release each node and
also calls the corresponding notifier function. In the case of
failure from the add notifier for any node, of_changeset_apply()
returns failure after adding nodes. The current implementation
does not the provide any interface to the caller to remove nodes
from the DT without calling notifiers. It may end up having nodes
in DT even though ADD is not successful.

This patch introduces of_detach_node_no_notify() interface for the
caller to only remove node if it is not attached.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 drivers/of/dynamic.c | 16 ++++++++++++++++
 include/linux/of.h   |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 744ce0e1eb24..fc6f22371a97 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -318,6 +318,22 @@ int of_detach_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_detach_node);
 
+/**
+ * of_detach_node_no_notify() - "Unplug" a node from the device
+ * and return without running notifiers.
+ * @np:	Pointer to the caller's Device Node
+ */
+int of_detach_node_no_notify(struct device_node *np)
+{
+	mutex_lock(&of_mutex);
+	if (!of_node_check_flag(np, OF_DETACHED))
+		__of_detach_node(np);
+	mutex_unlock(&of_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_detach_node_no_notify);
+
 void __of_prop_free(struct property *prop)
 {
 	kfree(prop->name);
diff --git a/include/linux/of.h b/include/linux/of.h
index b920aac6b975..7a509341e998 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -442,6 +442,7 @@ extern int of_update_property(struct device_node *np, struct property *newprop);
 
 extern int of_attach_node(struct device_node *);
 extern int of_detach_node(struct device_node *);
+extern int of_detach_node_no_notify(struct device_node *);
 
 #define of_match_ptr(_ptr)	(_ptr)
 
-- 
2.55.0

