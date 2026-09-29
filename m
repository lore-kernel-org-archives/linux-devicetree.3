Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9F4E3EEF
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672158; cv=none; b=fuTFijCfgooShtpe1zywPf0olXycZGz6ZD7StPlZCQIEvkvCPhA4CoXm0pnZpme9Tr3OTNVm7fu7Ry14WC4aQ0RM850OSxke4/ipDPH1s7/lQvFWkyY0IGV088j/5sBK4kpBvWi9D+SaDPwtWfsRa83kFKkjjFYHvzaLhtnhbCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672158; c=relaxed/simple;
	bh=dEVdLDnbotYXBDXTQgCpJaXendQL9UIrbDdXDx0UiqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpMS/DpRvZQn3z3xrL6fGvIR5KwVFMGZJcXUgfiLFs84RxpCO0JNtxEnyOv8W6a08GgboIG8iYZLoK4Uh+o55W3rTuvBxLxhwCarPdBJxwrdC4aS07BCzEmtl5rICipuiAgRoZokrs5/3efznSJeEsCohXrQEpdLp1HUbM4y9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUfuzJt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGtqqc4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUfuzJt3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGtqqc4L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U1Cj2571403
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=s4Dp
	Gg6gYN6rQ7jIzV1CefESyYzOIZ1FZ6SSXdL3274=; b=SUfuzJt3BkSW4cVoHqFD
	v/hmWy27vgsfcHBMZCQfBpBlIXpbLQKpGy1J1ZzvbWYg4IzH3dLt6xOB3l7AZcKA
	nRMpj/AOjhJecERm1vtFDtr7sACZyc84MY2qCU0ei/la8jOpshZb/Ba5QBu9BAyS
	vULx5ly+CCS+UVhsAgHyPo6ZUuFXKXHbmdwku1ZEjScgahLNnZFM24U4m2FNXS9l
	sfSyU54IlDT7vWLWOfxVWBc+yzpWfk5sXCFKkp6y5Jvnrg6iZiRviZhJBHObkMSC
	n+BEZ9P5/3sRsw/VqDILPhWfyK99CR3dorF5Ztgik2BEfZzknVfo+VA613REfqFS
	aw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn9svh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso591894eec.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672155; x=1791276955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4DpGg6gYN6rQ7jIzV1CefESyYzOIZ1FZ6SSXdL3274=;
        b=NGtqqc4LgsyYx67gJucKYLl8nJHo45G05yEeiTetcQj10RHzX11kW/UyYeQlLdggJ3
         M6AAOKvjFnBW/zD7LATEYiqA7Xdc6mUjANw3TVlUA1i4j0p0nFvqezwBuxE1m+a+DTiy
         f6sG5P9ppXj2e8f9fzJMeCIoW1RMNiz21HMVwzY91ogyZcUl9cJi2UM81QGLQx9wOlu9
         5GH2xgdiU2rbUQz5B8X2+0aUKjmJETS41k8lKa1KMasPk9g0kwkcxIpH3GftA6gYulo/
         G4MDYi5LR5RIPfgD8yWpJku4MZWy7mj8FF4WGdpf/tcCwXZPX/QwuKN/e2hI9kOptYS6
         /xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672155; x=1791276955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4DpGg6gYN6rQ7jIzV1CefESyYzOIZ1FZ6SSXdL3274=;
        b=o6ndOu/C1fUS0ltOtG53Fqv+BRBF+DuFEsfm0ULvqiDCzDq401EPmnEp14DAUSPB21
         Y7Xn+1/Ff07aWhNAoJx4OQqbCDBtRM/nIu6m3xCMF/MZfhc1xIJ3uOpd2i2mj2jf0QM0
         y044OU6xUw6uhwJ8s8xppes15qnsFCRLpYGWq1MhWQvtIlwuGKyku+7lPR95etHQu74K
         3XtmmOlJrAGR9xQ7BbFznsaxdJ7FCN7su9hWQZq26Oxxou4YWGoY/xVd5gIoJAJP1Fbl
         j9HBBn6eH0pmg5OSfDh6XAheGxbVcrQtDgwX8u85QkvQn/ybs/2JI4916tgIYicikGtF
         1XBg==
X-Forwarded-Encrypted: i=1; AKwUvBzd60ugOeL6f156FyUE9XBbMEhqD8z7tbv9a4TOb5NbtCTpGiQrRpDlGcUUMc9zB3i9wJZQOhQMXmtT@vger.kernel.org
X-Gm-Message-State: AFuF++nHCFn4NMHykd3nIXZMvMov/GIoPVwLRstaSzDTA4l8lwq/1au8
	//sP4EGiRRKGNxr7C8CQo4L9X6Xm6jPrV5cajx8XLDsicgUBDP01Bmjl8p+XXNB5RD8Euipuufo
	jZiiBX6SS+zmo0t2K4IJNUSxrKYJNlEst2klsJ4sJHEWA6QF93YVK0TJFpLR1GtHfV4qIE0D8
X-Gm-Gg: AYBFou0cQiM+ThvGAzgnifr81gXnfDG+ZRc2vxOmfoVARsyo+3ZApi8HEHky6HdJxo5
	iMSUsQ2EaRgP99vZBhWGe5g4dxZW7o6yvegzo9y4ltnxHKl0uuxrzKs81Jk3VvntL69UlViQjfx
	u8CDUGjr+fhb8oIAJXRhuPm/4rrEciFPIuuxc/6Z1S/zaMmJJXQMOThYMrbr+K+d72nmmEi4Rc/
	qx/25iYs0b83VTlI/r2XO1FKWQy94YneerWVi/kN5ULCLuGzs2jcNAOvURPgmQ+hycP3H0AXLTl
	3D8+Iqef3mv79bTdcftHzg+boV3MlclyM2jonyHjoY4RtcvP/ytZ/nTP0ZleoQWjfmlS5r73vVB
	47PaAsqEdgs7P1oYBxopMP0S7878ZH+DAb93ruVZiTdOG9WOPZYk504/y
X-Received: by 2002:a05:7301:b0f:b0:33b:96b8:3818 with SMTP id 5a478bee46e88-34272a44a3dmr11169850eec.32.1790672155204;
        Tue, 29 Sep 2026 01:55:55 -0700 (PDT)
X-Received: by 2002:a05:7301:b0f:b0:33b:96b8:3818 with SMTP id 5a478bee46e88-34272a44a3dmr11169824eec.32.1790672154533;
        Tue, 29 Sep 2026 01:55:54 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:54 -0700 (PDT)
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
Subject: [RFC PATCH 5/5] hwtracing: rvtrace: Add ACPI support
Date: Tue, 29 Sep 2026 14:25:24 +0530
Message-ID: <20260929085524.1554507-6-sunilvl@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb7d1b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=x5ONKeZPveTsSohF_q4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: VJi6blPlFcuLDH8exZSsadBKqXKWrqRm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX/G1YkV11Dkz+
 Z4/bz37WHJ/P37vafA7ruGlcrgaMY6OS4A/+dML1qgjffQDp4xrHH63962CjFJOl11ksWdunZQG
 tB/YlXU4V9fUZRal3ocw3HRRZAU3fEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX6iL4/ygiqq2z
 8V6mLIAGrbot+RIA8B0GDi/b8LwC8ltNBJNtY7908As4DK+9670EJYsmASBBA2dclC31VFTN4Vb
 SRjwpNwcB3WV/EfY12/BmOAKE78wEsp1dvLLZonuCIWLRWHprsMLhy2fbsMjv5QXaDuPoyyj1Pt
 Uj1MI43ssiMJF1pQ8gIunwxOG1Jw0AGNrPcG5Drfk80+9TgudWwdre3F/8s3wOhIA+VeMAStNDv
 MxaQWSDOXv8YDSrboydjwAF8gyBshAIhdhuL9zDxSfY1FsC2g3HB7J175lUweqpb4ZFxZp4cyCL
 iYARVlbikcf5r0YQL4Yyzpgui3BfkT+sYvcYK1mPbBTOge14YLcePs5lGa8X0rTM8x4AZwSs9tz
 ZZrFuRR38c1HUOyTgHoVk6gERViSKRyVlgZ8OwcEbwcalHKzYzB/cFzb/T5gKPuXtTUG5ysrHDF
 1H8o8l+raKRnVL14ZZA==
X-Proofpoint-ORIG-GUID: VJi6blPlFcuLDH8exZSsadBKqXKWrqRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035

From: Sunil V L <sunilvl@oss.qualcomm.com>

Add ACPI device IDs and ACPI-based CPU binding lookup for rvtrace
platform devices.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/rvtrace-platform.c | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index 12330d9dcddd..44422d429ccf 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2026 Qualcomm Technologies, Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/gtrace.h>
 #include <linux/io.h>
@@ -174,6 +175,62 @@ static int rvtrace_parse_inconns(struct gtrace_platform_data *pdata)
 	return ret;
 }
 
+#ifdef CONFIG_ACPI
+#include <acpi/processor.h>
+
+static const struct acpi_device_id rvtrace_platform_acpi_match[] = {
+	{ "RSCV0007", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, rvtrace_platform_acpi_match);
+
+/*
+ * acpi_handle_to_logical_cpuid - Map a given acpi_handle to the
+ * logical CPU id of the corresponding CPU device.
+ *
+ * Returns the logical CPU id when found. Otherwise returns >= nr_cpus_id.
+ */
+static int acpi_handle_to_logical_cpuid(acpi_handle handle)
+{
+	struct acpi_processor *pr;
+	int i;
+
+	for_each_possible_cpu(i) {
+		pr = per_cpu(processors, i);
+		if (pr && pr->handle == handle)
+			break;
+	}
+
+	return i;
+}
+
+static int acpi_rvtrace_get_cpu(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	acpi_handle cpu_handle;
+	acpi_status status;
+	int cpu;
+
+	if (!adev)
+		return -1;
+
+	status = acpi_get_parent(adev->handle, &cpu_handle);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	cpu = acpi_handle_to_logical_cpuid(cpu_handle);
+	if (cpu >= nr_cpu_ids)
+		return -1;
+
+	return cpu;
+}
+#else
+static int acpi_rvtrace_get_cpu(struct device *dev)
+{
+	return -1;
+}
+#endif
+
 #ifdef CONFIG_OF
 static int of_rvtrace_get_cpu(struct device *dev)
 {
@@ -209,6 +266,8 @@ static int rvtrace_get_cpu(struct device *dev)
 {
 	if (is_of_node(dev_fwnode(dev)))
 		return of_rvtrace_get_cpu(dev);
+	else if (is_acpi_device_node(dev_fwnode(dev)))
+		return acpi_rvtrace_get_cpu(dev);
 
 	return -1;
 }
@@ -308,6 +367,7 @@ static struct platform_driver rvtrace_platform_driver = {
 	.driver = {
 		.name		= "rvtrace",
 		.of_match_table	= rvtrace_platform_match,
+		.acpi_match_table = ACPI_PTR(rvtrace_platform_acpi_match),
 	},
 	.probe = rvtrace_platform_probe,
 	.remove = rvtrace_platform_remove,
-- 
2.43.0

