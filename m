Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A42F43E074
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455476; cv=none; b=LzAx7poSPD0WPEOcF//9LZhjIbfVNDKukU+olw2J16ikI90MiGqLgnWU+SP+W9r7k+ypp17+ESt9crhDnslx2hE6sfZrM6dT7t2G8uRBz3tr7CMG+m/quPyDY0di5H6Z9f1VAgIcIqpXcYPkn0kz753YwiUQrgjR/fSyRpDtEbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455476; c=relaxed/simple;
	bh=Q2g8rNQTl5/Mdbyd7uWKNI40mnuBoQ0th/Z4yqlIjso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/emswU+TSMc7D1wKFdtlZ2sdUV6euAp2il9ojKnLuhiGP7JNXStlhEI9FOfPIe6+yNe2ai+F89VM29z5Isu2Mp+RST5HpmZX8qOm+xoPPSHkMEfwYULKBo2mFm7CF7YzD0eKc5piBULSUTKjR7EfjYrm3nrOvvTiLqiwd52woA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA1SxQL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnVB8PbZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA1SxQL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnVB8PbZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWvec766913
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=; b=VA1SxQL1VJOPQG1n
	+1pjJUPFvJwWAPLUYS2z9S3oZdJLw/GuXjlF9NQKBVqVPns6gPc0l9QadbH0xhv4
	0AdUEEVSNCm+Q2uJRPdl8RW6YX+zC71BER4VQHJoqMlESPjVBUKcdocfb2xXa/Nb
	VcA/ocmYVMVLs2fiv2mBh7kDpuzzMXnvcKS9+DcjqRKKo/jb8agS0d1JH6sw1c7J
	lpPST/RQTNp5qvTTFYQTWWfv3CLb/7Xwd5F2N5/XzdNKj0pIc4RVgXgmAEmIvPu8
	1h8JYDjUw4rmxxcdUpI8ftH3MYJZ8iQAIZm/hz5iNSg8+oid0m75YmkuC9BV6aoR
	SjGLAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q10q9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso43908785ad.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455445; x=1787060245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=;
        b=BnVB8PbZTAWxcXC/3mzVPq3vQ2I0I392JUrAZxOGgqmgRv1/u0MbnSRNvFhUQ0ERl9
         DQ9hvn2jvgdKfu9d1E2cutEJuGfd5MIcadrZM5rub7Y0KV+UDyWn+txXLb6+p86VhRhT
         fsTz0Phs2sK0kgZ9gJ0Irqc/YCbJ+5HZHl9NV0leR5lC3RUH6jnSuRxoUUvRDjD0aB1F
         wSXXlFynJiZvi4vfaXKY0/v0/0JkbDHac/BOzg/TnYszDnOxbxdkAAngVE/Unh0yXZk8
         ChuB+23UFH0wsTdtzxB80dhjgW8Ks0vxYs+absnL9yItGqYIETrdBnFyiW9FHHnj42nV
         lD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455445; x=1787060245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=;
        b=g5/F7a2L6Dh897/HXzFMETiKmGNJhT0sPyOHztG96LvxQMFNB0nXmVngygJ4KGtPHa
         iS8D4PXyVslOhFrdzIqsVHJjw4JwG3gmuz4rT/ahyMlzdtLeAVmcEY5U+trtUOhcUFPU
         dShe9xTMv2ktdlAAzuPPhVbzXQ8mMeC40M+umBfb0HvnHkNmWKkp/rd0uZSYa91L49Up
         1RVlxeqlcPTxpduQkESOrQERMZ8oeAzW05S1IRKNHBwQn0K8lOOcpAbyYNl1zFrPu9fY
         zizLNnwKFLWyBeyPmw8pNPYRSktUgIpJksh8PU/KUHP70FQHcoirCFVQT/3tfEsMzikD
         OXBg==
X-Forwarded-Encrypted: i=1; AHgh+RqzDUfGhZNYkw0B0X44cgoSDPDJ+tiFvP6+tbMUXqTfoKqvnxWexu7mowCSEfXMEBDW4APtWk5VRa54@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqgsc6WaY/d9tLZlvKmhyo2ClhPKr7aoBLEllWAfPCoqQWEQOk
	pwT2psE30Tl4tz0QimeBV2pE085BE3OnDIuEHvvQUcU+hMAWMUjX/UYDsJKt07vKtbvrUxxM22u
	s+FL9/kBG6Ep3csiMrGXli9EZXTkXwHtIJ2QRoSdf9PPgeK2LcZjp4l10WzyKiKVC
X-Gm-Gg: AR+sD10RCXkf5a/u9qYoE18cPcnUBmkLuSMHNOsdtST13ijGRj9EV+c/zbyUkXaZ6u2
	828o6uxmkIEm+gi4dY1FAMx+y97fm9i305pBf2IveffjoclTOFMrsu8gM8OyHinn1mZZno3W6Hc
	dPTaI1qjtvj5Am6Zv6opABtRWaf1vbQtDMugbKAVJ/sgL1UluNF7WxaVHOW5IIkpGHI9AqxYM8y
	kGjMz9QVQa9Mpq+l8SK6UxyhlrDdMXdyKysHYmtVBOhb+8ly9WdNUb9dHW/euJ+uq9IGJrO0JBr
	dnTxa935QSfWJw1ItG7SbyRJF32kKg6D3qxkOFiZ72H/A6s1IFl9XxvrfHHmRa0G7stjVfd/AwY
	tWyOep/4gsznlIZXBdk6eSQqwQHB7PHI3CFkd/VMdcaSq8EwAgyzm524V
X-Received: by 2002:a17:902:d485:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d31788ea53mr37192695ad.12.1786455445022;
        Tue, 11 Aug 2026 06:37:25 -0700 (PDT)
X-Received: by 2002:a17:902:d485:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d31788ea53mr37191715ad.12.1786455444454;
        Tue, 11 Aug 2026 06:37:24 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:24 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:40 +0800
Subject: [PATCH RFC 11/15] arm_mpam: Fix mpam_dt_create_foundling_msc() to
 create MSC platform devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-11-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455327; l=1946;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Q2g8rNQTl5/Mdbyd7uWKNI40mnuBoQ0th/Z4yqlIjso=;
 b=vzTRB0AF+pFRMYnNgKH1uIlaFES33p6mQJ63KtCUkA9LHR/5oZRPDKE0Ofkrx5KGIM9a+qDlN
 SnmgFirBDTiCoGBGz1gdykNdFv19pfZ8PtUHMkd8dmJ725IbaGko1ND
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: VsA6awcL0SSyC_TluOg94qkTiXpmzkDj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXw1f4sIZsQIL5
 Zfvvy/ClBvkZIyld9qEm1GLxVyJ6Df3L0I7Rnmaf1cFBroA6Xdw4gQt/4Lo4zkQgjBYsNu2QMcb
 K5xr+rvD3CZYaIuqjP3aXIuvRYJrEm//z49AT9CwCQYLVmsn+1/66JOJc0A3tOMlxnFYh+hrqmM
 FICS8x28KzwS2TWhV8h/kxkM8hK/XAU2uPCgTady0pVIedDME0vNzXGnnjD+/UO8zQzYEz7sSbw
 fbqzhU6QFEfwRRhEsso7jeMHjkVpBS11X8g12VVxJXo8Hc7CvY3MG5Uvj9pFNurF8kenFuBvxle
 LI/rC/EPVrFe3gKcKACEXxixuGlQjJpSmmjTbHAI5XWEQaVgzv84l5LGCCHmamjrJSB3VDN4HJi
 Sot5JsTr1hkXduhJx4lgqKhFXSpKdCeqlLn3qmg4eCgMctOZQnzU7RxVtAI3qNjxKjICLgdHx13
 JaWJYU5WuYAUcSsu37Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX/09xmS4dhnd2
 dAOUabnORA78lPGkhvvQS55mUy5pbXTzKjXPl3MTIzZpI1biJT908zu0ChuVu5YQ6aGkSCJDYjc
 +nazCrGizzfAjq0gVQIJzZ6Xnfdrfds=
X-Proofpoint-ORIG-GUID: VsA6awcL0SSyC_TluOg94qkTiXpmzkDj
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b259b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ksFOqbt-pGiEIAjTAq4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The original code created a platform device for the cache node itself
rather than for the MSC, so the MSC was never created. Instead, walk
the cache's children using for_each_child_of_node_scoped() and create
the platform device for the MSC child node, skipping cache parents
that firmware has marked disabled.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b0e67c8349c7..eac3bc695fd1 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2358,23 +2358,20 @@ static struct platform_driver mpam_msc_driver = {
  */
 static void mpam_dt_create_foundling_msc(void)
 {
-	struct platform_device *pdev;
-	struct device_node *cache;
-
-	for_each_compatible_node(cache, NULL, "cache") {
-		struct device_node *cache_device;
-
-		if (of_node_check_flag(cache, OF_POPULATED))
-			continue;
-
-		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
-		if (!cache_device)
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		if (!of_device_is_available(cache))
 			continue;
-		of_node_put(cache_device);
 
-		pdev = of_platform_device_create(cache, "cache", NULL);
-		if (!pdev)
-			pr_err_once("Failed to create MSC devices under caches\n");
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
 	}
 }
 

-- 
2.34.1

