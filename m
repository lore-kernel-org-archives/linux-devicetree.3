Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B720329E47
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348588; cv=none; b=jb3nxYfxYKopy0UYqR8QxoMo/bFfFazOQxrQygk0frz7a7zzhLeUnlsg2qqhQLxznahBEQLtaSzbP3fjsbKiUm/TSqs+grWtxat1L7Pd7eoPywERcsuuz57wXrJAFZ6SzjvWGc4Z0GDKZTWAaLNaenHYo2P6bLqy9ZW6DG71PVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348588; c=relaxed/simple;
	bh=B3HL64Au0aEXfS2Kn2bLGfzZAIxzxv1nhUwhmU2OkmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGIxLZlATbu7n1HGVlDezfWoqkInhvaIxVbfLifNx2tOXLoqTPUKKhe+H/TVkqq2e4utUgPF9xkrcKzBgtLYIws0NTrZiJMKl3Qq++ac4T89NhX3H4IwXWoUUKenfI7yT3PUvdW4IGquJwAPK/iUQIUvxVk+AJ6BMRJI35zF99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfBqo+VN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8bmy1kd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfBqo+VN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8bmy1kd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ3UZa2112521
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=; b=bfBqo+VN3FtzyMS8
	CbXsV1xSN8HzlZLfin41kpB8HSiV6JXvskknW6u6+LOO0C8hqseecqQ7tFeVAp+K
	JL+K1rLKVVn13NfqAG9wc/wWb0HtL6kzxfIQX7+7g3fv3f3J/r7HAAGJoO9dZ3bH
	k1x23WyXop7exHkTgz6BNfe2Jz520uDvlS/Oeg5kxt7ImyzYbKs/zqXAM8gPgip8
	G9AZ7tdGQMSloh2HJobcq5BLMZ1RiDeQawAdyY8fAu+9c35Y/1aRn1WGmjS61MBu
	dejT0rZtKDG/h+QfRsLe0KYip8EYn2KrO4CP3I1O+PYjhsA7sB5pg63NCoECM3x7
	BGFmvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbhneh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so12863724a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348586; x=1777953386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=;
        b=X8bmy1kdDrj6Oi9wBjudkjV2Osc/Qvegkdd3K0dnjmncweAMOiitPiKLVC1d7sU05C
         7WtMEZ8U572/Ce0rbLPZsRrpaS06ZY6NDT6OUDPjhtmS1heSQ1dFP/FYRW5fslr3u1gn
         o++2FrVoirwlZHaV63c4di41szjw3/JccT0jECo4GB7ddrClxe6GcnwDI9KuapSpqiEk
         xzqvxmaqVuDTn72GtDaEbTxEHV+uAwBcvIeidagnAN672Fy24V82ZVqA4dbYwenGu+oK
         FPWlV5Ey1+jm2ov7/9lxhkZjVU2dayQ1cJL2R3P/s8JZD01g5xE8mpABo2gfBWynXM5z
         4Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348586; x=1777953386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=;
        b=mCNmKUmmqVwU6lKmGGOs5aNZK/ZIgQCgiIfaRu15b83xupgniJ35yoEqOD7R6EbqNG
         Ek1WjbIIcZ3AjjsQvUnKahOde5+8U5LUXsoENd89h2q5ZuWJno+LMoLlVWKNeiiW5ar6
         gqgDR0jo6gHiLHPVFIu7Ty1Jm03S6PK1Gn0QFB2zU8RBBJ6nLfBiCkJITpWqjU5wxUyw
         89Q+To9eV8xmHd7MYwSNLQaBJJ1VuGRWPw+zt9SIuW+VzTxKDz07qpQfN3kqtwX/qMuU
         6S34m2hFt95eKb//l+qkoWYRya5Y6UJGRWlkL+OQf4fRC2xFpPtoL8j/oRKfwL58XVxT
         ossg==
X-Forwarded-Encrypted: i=1; AFNElJ8qItNRksrlxHX6PwrQrpiASBp62eTKTTBe2+EUfZDdyzHwdkdvIx4DkK9bL5Lal5lMffVFXjeGzxze@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTKEP1abusdDj4JUhVqjHBTp1HyQfOek5gqiL2gXeWWLAi8zL
	UuKVu24dPan85JXRttiVvG7j+SVgf1qF4BarT9c6ow8tYtW46ynpJDKjaUtVmfI5K8nllm70tzr
	+k0UlYIke2GZOjDWGrBv67nPhhAy3J+zVBCzjv6AuRFhjDGHThbohH9yiUWZSZvJa
X-Gm-Gg: AeBDies2zKAnUxa1dsqEm+6e+3a8ZogTYT2Af1/HBF8Q4Ve6Y9Sx4B6R/ak4pJ5otXp
	mkRpHMpjmrPqGeZ6fitKSWQTswqBCX/3BOakpboEJDXGcO3qHuaRivT/ek8lrstPApEJu2njBZh
	XZiJbgSj6UVw3rhYCcmzqRUOUpp4xjzgiUKaYiHveSuH81V8IhF8rYbytxEa+vro3hiIeXfFNp4
	H1d+4vt4N/zk6BY8nRmjL0QURA9FJQv8V2118mhXjYKQEjOUNXyM49TbZKAHMF+GOUiUGnV5Q9b
	soCIOOIpN0QLSkEnkf3Vg2QCP4ZrLQ/dHpf5ZAgOC4ybkOkygOi3SytMbBjolsyv7MYqJksnspp
	gw+8szw9OArbTGZIapKkR/5nRgcJHIC5iI2x8lbmKkiKWpqEWQ/blKiSSFn9baV8rUQ==
X-Received: by 2002:a17:90b:380f:b0:35b:e51a:ec77 with SMTP id 98e67ed59e1d1-364920307f6mr1308434a91.16.1777348585860;
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:35b:e51a:ec77 with SMTP id 98e67ed59e1d1-364920307f6mr1308394a91.16.1777348585379;
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:10 +0530
Subject: [PATCH v3 04/12] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-4-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=1065;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DydqIdia9cmT4zC+axscUwQlMujOYL3SDRWZ2LaadIU=;
 b=uv7UAzu7sAsuZDPmxAxOCzv9xYKtBDu7s/YBLJf5okHY+Wt6mzYtJY0/tliLYjMr090ZkEP4M
 nDwoGlXzeIwDq/ZRKXbzxUNySSWceRrt6Bw8UYVepbM2jUG97uOCMTh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: ISdLq09WlLzL6h1s4X60mYe77r8a21uK
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f02fea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HQKoClRO7b2jHrqM0cUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ISdLq09WlLzL6h1s4X60mYe77r8a21uK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX5MJaGsPq2m4H
 ap3CQUAgEJs8ScHSz9ygA2siuXcsyh2Ya74ECTIKRGYbmslhIOVUNbDxd2uM3mfa/VA679x5LuQ
 EFqx9qTzOqqulU66c/b+/+7KsVFYBk7ufjUhQjG/ajFy7YtBCkELLlIRDhZc5zM49HZngIVyhvJ
 G7C2D9ZK3kxEt8+T2Faw7/gCVbn3RQW34R6NQFfYoAo2gJ5Ig+qR4xaISnOKSQx3j08/b2mAlta
 eP4BwwjoLso+OhtAGOgT/45EZP4r7U3/rjak90BtGWq7EG9noIdBV6zKo8mc/X3OWmkwWxtFyQh
 iSoaUacDfu6KLvB3B3nn8H02qUYEt+rwsbSuDQ/O633/1fIwTYbPrZjg4/7V3LWFTULiqgXnUb9
 xSGSat0pYO3ryXEZz2mmAu/QnXgR036x8O+drfYzfAxg+4sxXTfkvNV3cj+YO99wtgMDWRA7vFU
 BZ+NGNME8o+/z36pocg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
for device add and removal events. This ensures that when a device is
registered on iris-vpu-bus, the notifier triggers dma_configure(),
which sets up the IOMMU context for that device.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba78206..d8ed6ef70ecd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1

