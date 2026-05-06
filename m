Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FF3DEAD5
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054199; cv=none; b=DbfnvNicnGoDGNyA8J1L4Pu/g2aP5Up/xVC5UgcLw0qK+2ns+eLKYkN49yhJYmm0r8SUvtty/M6rXP3CgOCgbZmgs9Gap7ZjEmQPAKOj+B8RUhR2A06OLwco/8cRX42OpgQZGdbaChdrdIn15ddCtRYC/1oz5ihCkR5pIW9sTOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054199; c=relaxed/simple;
	bh=pz4s/1/oJMi9iKJkDVcTfZKyKF6zjrnyeoMtyBSkst0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TRpXkCcltkQm5c+4UzjfWFFrxqwzPWrGucTIMrIXbe5Phs6nkdeJADYLosUmW/MQWA3bqYmUUwSkR1f8JoKltv+SgLoyKFg6fpUwiK46kHJo0+3ls9TyJ4DfTfzs+1X9oPj0jxUc3jJIegXkpvbYgt+AucuXnNS9a00994L356Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJzVOnlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/s536bx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJzVOnlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/s536bx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467Kq0i529862
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 07:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VNDSHHfgjfrPvXuQV8MhERJkwZXDzFJPFjc
	aPzMVfUE=; b=QJzVOnlTpiHkh/j93PlOF4LVWhmIBNTMd34GiveaXDCVyoxXn20
	/gODzRb4xFnlVeYmj0Z7Duvj5PdwN3VyEIbKB0JNVNb93bJmyDsRBbli6kMdaLol
	ZNDsxtT6FZKff2x5DhupBPzZPje8sn4+RKFFiShTSVkTsig8KINz2Jf5PTHY0gqd
	VfgqCY9cUCYoEuxunaDvRqetMYbDcQy6u7ywEx5bkqqMp2jbmMwpdVbx4my1V9xN
	NbRK9Y0BRmi35j0R7a6E24H48xKW/LFSKuXjX4P4lytv87KFxn2T8ZCKvli2UeYE
	rZMFF4+TKZGx1LTAU6soPGOPkHWOTRTArSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e015x8507-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:56:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7aba0af02so58206415ad.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778054196; x=1778658996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNDSHHfgjfrPvXuQV8MhERJkwZXDzFJPFjcaPzMVfUE=;
        b=O/s536bxla8EAULAGzxD5y2ah5bHZK4PAhcEmQRCoupnX6B8h50E+tobxiV2srVulJ
         kHTGWoRSjm5yNcx4/Vabv5KF/h4A9EyPzp6qNzm5VSmfblM0xpW1BtiF2at+D8kZyR40
         rHdylGgcrF4Ad0JVQSs5LfvfcAmttvsaDxuhAL7OTEjJMixXHJDFnZERYgD4nUDu8Tub
         32a8f7xzQJsFUXuNs3pm7AeBZxcTizvdU8wW4iaAS2It8tQGmjJ0B7usy+nDq/s7Tm5C
         UKllKZfDu0vmnVMHSfajrUvUGqc/q9DKoMn8iXvdypM9vg8l33EBZTEerjIUmIKggHE4
         go2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054196; x=1778658996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNDSHHfgjfrPvXuQV8MhERJkwZXDzFJPFjcaPzMVfUE=;
        b=raLfte/2Rc7ODD9QHpOupB0CQIwdBb7ubc/lXyhyU/3U3ZJLOMolWn8kjk80DYarsi
         EzYaWht4AefMO0Xk8pgu/3k6uL8hM0GJkhji6tSHKCjKbaKa53ndQYPaVe9E411gcE9V
         S57NstI/32xte0wtVboJI/3pJtoLwESJpES3QGMaGnkm8QjfyNZVYmbZOvozed7DyNxX
         sOsWhkDEO8PrHP3i/3G+fHJOQFBcM+Docg9T2kmfikD+rMG21ux5vyBt2ZmA14SXw3x9
         a89p5jQf87j7Fx+0GjQL4x4mWTjNWvXmI+1dzxwukNqcaGR52lo605/7X/Woflrx1k16
         seYA==
X-Gm-Message-State: AOJu0Yyk2wHTSIgNvMT2Th/FB4+tHZRaCGHt8RHt2eYMrW2HFWPsVccr
	l+ErXtO776mBWFkSsvAd28fdmUdBvFlK1/rQljQ2AkPqVTWb3fwT1Tybbsv6GW/J/KFTPPPoxDP
	GTsyELs99G/lzWXzsBbzeDm+vdhhCH5Rkg1n5iRc4Tfg/DU05jFfClvX0mxA/rdtH
X-Gm-Gg: AeBDietVS4u6kG2sqEVdXn62lKLW7X+cubIMrAFRnMn2fSgLu9WEOAv4mRDbBs23JAk
	GttxZ0eKqB8oo9gGUxIDBMDHqh1gHqFaq0xJ90K3q0cE278kKLOLwchEzbW41gf5LULsGP+Bfns
	IOHnNsGVzBg0v9hnQHcbo8J1suqIaD717OntGbjeDwf0Jl4to3zeFH7Sbsv7nhlggXRS7JYKy0X
	enepv/Xz1g0Vx9yI5xckebGAZkrmAGp1RsH8B+4rhpjhG+pp0zhtjwprSL4qG6V4c1mjBo2z+bc
	Q+SRQ8IHoRVPv2ABvuG/CbhFcYkX9qoHtSEFZRaI+dmAgobsqYUXpEYpfQwus2O9ZXq4DxefZRj
	FqSD+uLrxItGRfK2AWjQXIZRg1YEaRQYZ5HKYJoMrrLgb7NI=
X-Received: by 2002:a17:902:ebc9:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2ba7928e644mr23775585ad.15.1778054196354;
        Wed, 06 May 2026 00:56:36 -0700 (PDT)
X-Received: by 2002:a17:902:ebc9:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2ba7928e644mr23775225ad.15.1778054195788;
        Wed, 06 May 2026 00:56:35 -0700 (PDT)
Received: from work ([120.60.67.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca216a9sm15914205ad.70.2026.05.06.00.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:56:34 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH v2] of: property: Create devlink between PCI Host bridge and Root Port supplies
Date: Wed,  6 May 2026 13:26:25 +0530
Message-ID: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Os1/DS/t c=1 sm=1 tr=0 ts=69faf435 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=SQtj7D3ryojUavkWoQJ0Rg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=n9glyVbX8GFbeWSgBHEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vj_sAGU4FID-U_MGQd6vr7o-vvslUDX9
X-Proofpoint-ORIG-GUID: vj_sAGU4FID-U_MGQd6vr7o-vvslUDX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA3MiBTYWx0ZWRfX1Glo7t2iTMlk
 ZS9cgn2TKqStd7u+axinq6VC1jNqhuZls9dbR8GYnql6Eta25Xc0CeMs59Baq0oP4IxDHFLPNfA
 7pJwKV94LePbDMvrrlSTWGCth+ZSdg3eTN/DWu/NyaXOsBLEqzV8CLDnuTYua78gh8ETVOdtPwK
 W9f25s05rXrfHdgjhZere3JXQhordPAvBNBrLChPKYawiqRg2w3xxeqFJa56sf4uXKUnAnEA6AH
 zZgD2BfJvQrDvIr0Lrs/pVGUrhMgYKIUIL4DDN5VhRlQIsa01XSNeGpMy0NchYDKaqTsAfwA5Un
 nNAVLrxiLMcg9Q5wdja+ldrSDir/Qy6a7f5+6uhjLsgH8DBCqWQKmL3yhIx8d6VqkT/9ixaF7QA
 tihldVKGAomiYaPsokLSoFtb/FCwsnog1wecKi8GSFqnjmCQFGnknRXRrIYLlzi2CEYAvpAUGII
 xT4+vPvc68yce1yU+Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060072

Recently, devicetree started to represent the PCI Host bridge supplies like
PHY in the Root Port nodes as seen in commit 38fcbfbd4207
("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
the Host bridge drivers still control the Root Port supplies as a part of
their controller initialization/deinitialization sequence.

So the Host bridge drivers end up parsing the Root Port supplies in their
probe() and control them. A downside to this approach is that the devlink
dependency between the suppliers and Host bridge is completely broken. Due
to this, the driver core probes the Host bridge drivers even if the
supplies are not ready, causing probe deferrals and setup teardowns in
Host bridge probe().

These probe deferrals sometime happen over 1000 times (as reported in Qcom
Glymur platform) leading to a waste of CPU resources and increase in boot
time. So to fix these unnecessary deferrals, create devlink between the
Host bridge and Root Port supplies in of_fwnode_add_links(). This will
allow the driver core to probe the Host bridge drivers only when all Root
Port supplies are available.

Reported-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Changes in v2:

* Reworded the commit message slightly
* Dropped the "linux,pci-domain" property and used PCI node parent check to
  identify the Host bridge node as suggested by Rob.

 drivers/of/property.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746..6aa1d3fc2165 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1561,6 +1561,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 /**
  * of_link_property - Create device links to suppliers listed in a property
  * @con_np: The consumer device tree node which contains the property
+ * @parent_np: Optional parent device tree node requiring child's supplies
  * @prop_name: Name of property to be parsed
  *
  * This function checks if the property @prop_name that is present in the
@@ -1577,7 +1578,8 @@ static const struct supplier_bindings of_supplier_bindings[] = {
  * device tree nodes even when attempts to create a link to one or more
  * suppliers fail.
  */
-static int of_link_property(struct device_node *con_np, const char *prop_name)
+static int of_link_property(struct device_node *con_np, struct device_node *parent_np,
+			    const char *prop_name)
 {
 	struct device_node *phandle;
 	const struct supplier_bindings *s = of_supplier_bindings;
@@ -1598,6 +1600,10 @@ static int of_link_property(struct device_node *con_np, const char *prop_name)
 			matched = true;
 			i++;
 			of_link_to_phandle(con_dev_np, phandle, s->fwlink_flags);
+
+			/* Link the child's supplies to parent if needed */
+			if (parent_np)
+				of_link_to_phandle(parent_np, phandle, s->fwlink_flags);
 			of_node_put(phandle);
 		}
 		s++;
@@ -1656,7 +1662,26 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 		return -EINVAL;
 
 	for_each_property_of_node(con_np, p)
-		of_link_property(con_np, p->name);
+		of_link_property(con_np, NULL, p->name);
+
+	/*
+	 * Since the host bridge drivers parse and control the Root Port
+	 * supplies, create a devlink between host bridge and Root Port
+	 * supplies. This will prevent the host bridge drivers from being
+	 * probed before the supplies become available.
+	 *
+	 * For checking the host bridge node, first ensure that it is a PCI node
+	 * and its parent is not a PCI node. Only host bridge nodes will have
+	 * this structure.
+	 */
+	if (of_node_is_type(con_np, "pci") && !of_node_is_type(con_np->parent, "pci")) {
+		for_each_available_child_of_node_scoped(con_np, child) {
+			if (of_node_is_type(child, "pci")) {
+				for_each_property_of_node(child, p)
+					of_link_property(child, con_np, p->name);
+			}
+		}
+	}
 
 	return 0;
 }
-- 
2.51.0

