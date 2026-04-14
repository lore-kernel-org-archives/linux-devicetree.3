Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08295225A38
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142856; cv=none; b=WtYg9Kh9CARk/Wd1D4Rz7iq0XttNJmhdhdxL9xW5iF8UrO4+iigGTIvtBOBK9fqFUimijzsrQy1/hlpZt5orsJFTr0yHLo0+Rm99FgK+HNsKLSwqGAqnbtlYIp4reA5vvPOtaF36AwGGGd1e3RmtHy+bZy2bRcUD0CR3L3CpKR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142856; c=relaxed/simple;
	bh=19ZbFSBCrYzOoPAiGy4JxnUJmqAXRaE9OkXrzqWaqeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4oomgCWhTSW4RQIg5yjLtghKqsZkbpa6tcAMqqcy6tHzmeIfruc8Z9xYolwQMEuc1TMvm+Tv/iDZupxJFGM9JSjBc57UuD6bhPOI7BKt+sNhzjzYQuNQQxIOFAY7WZnni+XoqGV9+nC/SwpXD0bAykxiIZJtdrz7HEahugA0aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLO97UAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jac/E4FW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLO97UAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jac/E4FW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLDldq3425638
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B83PPF7wFaLIu6P8FD8mebyOE2HBnaPVssabvl+NtcA=; b=jLO97UANvHvevt0V
	z9rEYqhZdFfOp8FDxjChbgfbWKgwqjyWRp2Dr2jSPUMAwTF2oThTTd24/De0r5Zj
	/4AYbHDFqeY7pvqp87iVvYk+lFqAqkISsgfH8b7l7IqSN1VuP807MwF8BxxlC1DY
	a6rQz0NYo5ciuPMKV1V1DSscETlPXRKYd9GcFkEyPMwguVTxLqJjhPhr7MJFbSFs
	VYnt6abzazI4ronkovnH9GcbYK1AUg9kCPJi6XDNU45xhlXt+ONbz46FLXeHHRe0
	XTTq/vL60McNdidRohoMwXZXSrcovLJZmjmW2cYmJvK5zXfqtMupMnAYdSF6b1qS
	jZmumA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f92ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:00:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso47031825ad.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142854; x=1776747654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B83PPF7wFaLIu6P8FD8mebyOE2HBnaPVssabvl+NtcA=;
        b=Jac/E4FWYN8Vu9NZ6CIRPjYhIz3u5r3BuPPCy+9smMzdQEqL7tKY13lqHe6x6N3RgA
         uBsB4GSYJl7Nya1dYYXA9XPFh1fvqL2HoluGzlq4al3bf28MjjvQizh8umYqa48HV2nz
         oo2QHQx23EPxggtgReRhm+MekO817zweGvaAt5RimGZjPF0pad3XzjdResKOD6/Pu58H
         sY49UIxAgcr0nHNj2D/HfQmH5xWpe6XCgHlGrVeRkL95eYlczauiIJE64Q6Hyj/zgZEW
         ULwSCDkMJO0h3H/8w352f+QvjrqWOqqELiZ3kpm69WL3gDcJGT673bYMkDiL/KWqW4OR
         Y/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142854; x=1776747654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B83PPF7wFaLIu6P8FD8mebyOE2HBnaPVssabvl+NtcA=;
        b=r7Bl6CGp82oCIqyiJ6PjVr0iQT8M9F8stad3KpDuvVMin1ADoYPleJvO9EYA+ZNT2k
         iHTpFzEainwPiVWnCF+rCMN6puKAr919Ka8d0hjBbFbMCkN9gkwwDL5Myd/0hNCkatJo
         s42OmcyYP+uVQ47yC3x9onBpmdjZPS+YqOu+0k9DjqOfu6xECkH86mKCZUFmEUrtL2b5
         l3/HMkMbZtD2/iUYLvb41eT9md7xFWEIVfKS+DMs03P1R9ft50jBhKLSy0fqZrC+hY5d
         vMDOH+onOe612J4G6EBCWr8ZWLo6Pks24R0WzEocJnyApeEjbjl2Iz+bb4do1l7gXc1s
         yxCA==
X-Forwarded-Encrypted: i=1; AFNElJ9nZ48o1BGn8EaeC9TWvFEMURQW0OohbsPd7iX7i+AosUT1yxxy8qYHs/WAAYwTq6AI+oTsrMu+g4A2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4cfKD6SHLYZZF1j3DEspmiGyTlaVH1ytaCXFgGyYRLD5hRVTv
	TjS1bJwHRsFlTdymbn+z9btue0DgsykSgbSYOOKl9oTq41PwDDTYhA6PBy2VyEWYORThOOv9D/H
	DqKJss2QXmuSAV4mvowiSZmOFrXo2QDwPUu51u4PydUbbh/iYtgdaWDwmSGsO/qAl
X-Gm-Gg: AeBDieu/2Tu2CpJ/EGXH8RjYTimKJLK/NuI9P5Pc6Q1yALCS+0SwsZGvaEMRacXl50C
	0uIx6ntpf38vri+TifmWdS8oftzbl7zsO+tWq6jrl1gc7IjfpJ2NiL0MYwxqDyyUE/bKqd8Eg0T
	gkf2GXdhnoKipk75ozbSCssBnOQo4h2obiR8u0yanLwHKu5LxNkePutDwPZx6qf936v5RkgVGQf
	Nl75V+qcDt7lv8UtdCqNnMiRp++0On61wZt9zFXehI4b0kIeEYc7nRk2UIPcTb6pmub63IDGRVd
	WcOUykba/T8YjzOFg5P/JH5Lzm+fZwXJYeZPTkg3NgFWhBhisu1TcOgoF7ffj8FGZn+q50yFYbo
	bWj7qToa/fzfAk+hyMUc1qWHdViTOsRO9rkJ8jRDgyZn5X8FQlf5Hav0=
X-Received: by 2002:a17:903:3848:b0:2b4:678c:5f1f with SMTP id d9443c01a7336-2b4678c60a9mr31930235ad.0.1776142853563;
        Mon, 13 Apr 2026 22:00:53 -0700 (PDT)
X-Received: by 2002:a17:903:3848:b0:2b4:678c:5f1f with SMTP id d9443c01a7336-2b4678c60a9mr31929815ad.0.1776142853078;
        Mon, 13 Apr 2026 22:00:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:00 +0530
Subject: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=2621;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=RTVvha8tR9bEWZ4zePSXsWhj5E2tt6V6KZzPhLuEtVE=;
 b=c+4W8E2T0rh0OB4HD2rAue10deepw7qHz+ZmyEpRFa2vnY/uZwGRfZieuCnpxWgESFhgVPjtn
 TQrqVO/eWF0D3kJzgO28CucNG+6nQbjbURMD9+4OE/ZsGfH5WP9nwx7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX17kEDBZBkAT/
 sH8BAmyHQZVlQf/fnNYtaO4yP1e0ljgbTCeBAJqy2+JtXX0NCS5XHa8tcKxU/ISdwawoPSUlJnS
 ZQReyl21CmX78V6lLlrM1u/d8yvvoRW5OsAcHvmUPzdxkxVt9/CbF7SupqKOnBH+QQC5VNGbbUX
 T5Cv65KUFOie4B4b6sK9Hl+7zdH5lElkblUCpfBgVRYxSqkdBpGWK1JQpaiO53EFQAtUklz6ofx
 wkleX7FVXjMpWMRUHE1h4Ru0baG+e1wKiDxoPS6dEB6Et7RY40zbJEFVb0uC6XC18yK5lg+z8bC
 bhaxc0anxh2TcOnb4SvBFCXwV3dPAYmPWCZDMg5PvFN1KNV3X/zIT1L3mt91wWbjU0rNUVvGh/e
 5T6eXVVF3MKZWAAA798qp+y9dJ3UZLDyeuaY2F6dNI016K2jVcYC4Vf+zn0roXyQOcnsOHiCLw5
 IsI7xx5zUgFBU8/di6g==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddca06 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yC2GhcDpJLL-D5KBa1QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5AFfdR3eeeVVCMbzy0L6KKpjMooOSgZ1
X-Proofpoint-ORIG-GUID: 5AFfdR3eeeVVCMbzy0L6KKpjMooOSgZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add a helper function to allocate and register context bank (CB) device
on the iris vpu bus. The function ID associated with the CB is specified
from the platform data, allowing the bus dma_configure callback to apply
correct stream ID mapping when device is registered.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..a25e0f2e9d26 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/interconnect.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+static void iris_release_cb_dev(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = iris_release_cb_dev;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = core->dev;
+	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	dev_set_name(dev, "%s", name);
+	dev_set_drvdata(dev, (void *)f_id);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db0..4a494627ff23 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
 
 #endif

-- 
2.34.1

