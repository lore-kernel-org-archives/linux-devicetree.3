Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3425B08D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789533197; cv=none; b=rjcruwCvWU+5jn0uVIbCv83vjPL6765CCpI8kvYJRRoUPoaGVUm6tjhJVo5ubOn0b+8wtuKBr/stbVl2KvSepXeiR0P3bSFZHM/je1dtcvl6Q00dTI8QWUVDqY5PZ9wWUbSOOeQPjSf2QeNeqMMmGEDAoGbgHYhCvv5ynaR7NsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789533197; c=relaxed/simple;
	bh=EEdysx3lssNG9GvJ/mt/NlADEX5jaKRjNnkhb/7Wxms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZvLyRsHEuuEKchs78RWeWV4VlouAg0sfg9mQYtTU6ChRcyf45PoXJJiNfLkuN8NMHyPqqDwUgKblzntN4/4GQ/PeGJr/s8oiuGyB8dN5BgjONk2xrSuX7wPGhw+VG/8EdoriVGXCReUoe5erbYP1hdKrz3MZA3UADVMjlgDGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GDFVnLZY; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GDFVnLZY"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLW3kl1806347;
	Wed, 16 Sep 2026 04:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=hwz6yDsWTgFce4bay
	+J32yMuQFuQAsZQpaCv38dIDFI=; b=GDFVnLZYlXgbAFgtqF2hubYIX/PU30ATn
	K2mU+HySxeEp90woQjpczZP7vHddNH+I1QKH0Atxk0ibdhbH0VJVCD+ZmmFEjfd+
	srqU1EOMb8T45DTU1iP8l0H9HhZGb/rriorrDY4/b/GMqPrS2UMjzf15i1plUQJM
	pDyFdD6A9ZlgNoLj5YBbWdT9le3H5pS4/g5PAR6e4Gy4MlOiSfZiyaHlb1rLPSG8
	6+rIWge+aSe8AbCYZ+5pDWZ9veCydfl8KjegI8II0/Z94JeJRZgNMLJ64YcLGb1w
	R0B4DWgF+iPnskzUhKmYfHgKhi3/2lqT7RnBpK8hAyH95FQ7rK5VQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmv5htnms-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 04:32:57 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68G2mla6389172;
	Wed, 16 Sep 2026 04:32:56 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gpyxscq0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 04:32:56 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68G4Wtl366781538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2026 04:32:55 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 676BD58065;
	Wed, 16 Sep 2026 04:32:55 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A971658056;
	Wed, 16 Sep 2026 04:32:54 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.186.148])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Sep 2026 04:32:54 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, maddy@linux.ibm.com, robh@kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, saravanak@kernel.org,
        ritesh.list@gmail.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH 2/2] powerpc/pseries/dlpar: Remove DT entries if failure from CPU ADD notifier
Date: Tue, 15 Sep 2026 21:32:49 -0700
Message-ID: <20260916043249.2062676-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916043249.2062676-1-haren@linux.ibm.com>
References: <20260916043249.2062676-1-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1NiBTYWx0ZWRfX4JNaN4L9Yp/Y
 fU6PiVYAzyfHelcNHoQqW2EZcG01a53K1swt5NF2rfi+gEVS1Pl0fyK4WT0Pim8WsJRpCsyV64z
 wPEJlwfJJSkI8w1Y2Xu/bTmE7NONDVe7l1TpRiYhoaao7C4buDQe/KutVuT/tB8d3e2XvEG/tyQ
 EU44EXR6rSaIM1VR4q519O7T00weS1h7aXCqLzmjrLREpQvgykupnV3aTRlT1hVZ1Hvb14QcGDN
 MKiB6PEYsCDZ4o5lhe0i4YspIPufFqPLAwY7euwHJjo7gMn99JxZ3ZLvMroNnk5U+lKfOaj9h0q
 5K9wLdWJm9dr8hKnUqyXJvxUEnFvvRYXH2KosaXMehmbs6HQK/c/kDVsF5lTbcEeLMHEbAy1I29
 Z149ylys93cT+d636JoUJsQzdsxb68RsFL4CLwABikXjzup4UPlRVLckJeAAAvSbpmbVctLJ2wW
 4NUsr4Ec1Pfw5hhEJ8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1NiBTYWx0ZWRfX8nwWGsVZUIXd
 199BlQjMAI3A1Ue0vFvpdAa9MeoKxr29G333IXMaGbrIfgtBF7VuqvAXIhWGD5SB96iMUwuXBh7
 EyWJiQgRPiI5zQHup8/OPNeNxCAkLwA=
X-Authority-Analysis: v=2.4 cv=Zsx4uN7G c=1 sm=1 tr=0 ts=6aaa1bf9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=r6zhGCe8PwBrag2BmykA:9
X-Proofpoint-ORIG-GUID: oV9GNXtIIByENbbWxW18qtlP5xFyawAF
X-Proofpoint-GUID: HSkaQri1igMEX5-CxglcngEuPGoKiC0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160056

For CPU ADD, the device tree entries are retrieved with
configure-connector RTAS call and attached to the device tree.
Then the CPU is added as part of DT node notification. If the CPU
ADD notifier returns failure, the corresponding CPU node entries
should be deleted from the device-tree. See pseries_add_processor()
for the possible failure cases.

The current code does not remove CPU node entries during CPU ADD
notifier failure and causing the following issues:
- Can not add this CPU later since already present in the
  device-tree.
- Trying to free memory allocated to CPU node without detaching
  the node and it causes freeing its sibling node (existing CPU
  nodes).

This patch fixes this issue by calling of_detach_node_no_notify()
for the failure from CPU ADD notifier which removes CPU node
entries without calling CPU REMOVE notifier.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/dlpar.c       | 9 ++++++---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 4 ++--
 arch/powerpc/platforms/pseries/mobility.c    | 2 +-
 arch/powerpc/platforms/pseries/pmem.c        | 2 +-
 arch/powerpc/platforms/pseries/pseries.h     | 2 +-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index f4d33b8dffd8..01a9849773cd 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -247,15 +247,18 @@ int dlpar_attach_node(struct device_node *dn, struct device_node *parent)
 	return 0;
 }
 
-int dlpar_detach_node(struct device_node *dn)
+int dlpar_detach_node(struct device_node *dn, bool notify)
 {
 	struct device_node *child;
 	int rc;
 
 	for_each_child_of_node(dn, child)
-		dlpar_detach_node(child);
+		dlpar_detach_node(child, notify);
 
-	rc = of_detach_node(dn);
+	if (notify)
+		rc = of_detach_node(dn);
+	else
+		rc = of_detach_node_no_notify(dn);
 	if (rc)
 		return rc;
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index bc6926dbf148..db359fa3f922 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -603,7 +603,7 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
 
 		rc = dlpar_release_drc(drc_index);
 		if (!rc)
-			dlpar_free_cc_nodes(dn);
+			dlpar_detach_node(dn, false);
 
 		return saved_rc;
 	}
@@ -616,7 +616,7 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
 		pr_warn("Failed to online cpu %pOFn, rc: %d, drc index: %x\n",
 			dn, rc, drc_index);
 
-		rc = dlpar_detach_node(dn);
+		rc = dlpar_detach_node(dn, true);
 		if (!rc)
 			dlpar_release_drc(drc_index);
 
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index b5c2abd12432..e0e4ef04c679 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -112,7 +112,7 @@ static int delete_dt_node(struct device_node *dn)
 	}
 
 	pr_debug("removing node %pOFfp\n", dn);
-	dlpar_detach_node(dn);
+	dlpar_detach_node(dn, true);
 	return 0;
 }
 
diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
index 0f1d45f32e4a..b60a01745137 100644
--- a/arch/powerpc/platforms/pseries/pmem.c
+++ b/arch/powerpc/platforms/pseries/pmem.c
@@ -85,7 +85,7 @@ static ssize_t pmem_drc_remove_node(u32 drc_index)
 	pr_debug("Attempting to remove %pOF, drc index: %x\n", dn, drc_index);
 
 	/* * NB: tears down the ibm,pmemory device as a side-effect */
-	rc = dlpar_detach_node(dn);
+	rc = dlpar_detach_node(dn, true);
 	if (rc)
 		return rc;
 
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 3968a6970fa8..6f80e58e6186 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -50,7 +50,7 @@ extern void dlpar_free_cc_property(struct property *);
 extern struct device_node *dlpar_configure_connector(__be32,
 						struct device_node *);
 extern int dlpar_attach_node(struct device_node *, struct device_node *);
-extern int dlpar_detach_node(struct device_node *);
+extern int dlpar_detach_node(struct device_node *, bool);
 extern int dlpar_acquire_drc(u32 drc_index);
 extern int dlpar_release_drc(u32 drc_index);
 extern int dlpar_unisolate_drc(u32 drc_index);
-- 
2.55.0

