Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3CF376BE4
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073032; cv=none; b=gg9frrMAIPSj+G6taOW4a485ESuEXGXl4dlGtxITDQq40Zp2/CcQRtvYMmTzaiiTaupOnR2RTy+oRBiFdK7N5n2uJqQyXwSMLqVsQwrYO3rLNMuAJuRfkUjPjP8Qhotfp0QlRkyaLW4jdWtvlmfADczbKqJE25XdH+1+1CKBUHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073032; c=relaxed/simple;
	bh=uXvxBqV29dnRWJEGEW3qlSEg81UU7hjiwTjaC3X/PPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBOJnuIdjEyFuO+W7bKsKS4FNTJ9+O6Xv6X1AVYnkQPMzZlpj/R7q+D4dRtU78ks1Mi8uopeNTUDh/Us4tweFSIvSfmZgVUYbTtZMzoy88OAd4yjYPUdbNBjNXsquOMMQpYVfMXB8OItFSE8PKHiHRtO0EAQzHDTfQS8o9BrIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn2ozLG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSnIZmCr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn2ozLG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSnIZmCr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5SXk4688691
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=; b=bn2ozLG2Q0OZwFOS
	44BQQmAZoR/awXUtfuJvAFjE3ueINXC5wTUaWgQ7zsLhnBjVetZp1cjXe0PnGmmj
	BZnfGerdibrPKRfUvKrlzfGsqZhB9368UEIT7dOqDsbv2JW0GRYua9nu2iJEUB2K
	6wBZQkGgSnGaZjvVlHEUpRkugWmuOIwPrUNhMX1B5O+cD73b9BAbNpbi98CyrVRm
	Jbq2uWXyB9Da26vtDWV2PvyM6y5cItXVpu8Yv5qQuZjr2rjNYHZ3mcIuA5eP2P8a
	7QK0LO6neJHPghiSaoE6//VjUS5FqCJalWNEcmHrJX3LJ5VrT5DL2n+YgPnLEHZQ
	RNIPlg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg070s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:30:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b7c55406bso4581273a91.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 23:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073026; x=1781677826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=aSnIZmCrjN7GKGdWoNAAzgKR5niMasngYy3BeE2543H71fcUCUE29ZOdzntVBaFYm0
         8vW7HsVuHcbANjGCJIh27gOxcsrQsAtYP0z1of6kvc9B/LjUDrQSrbazwCIkYILopbZ8
         WaYxkDSg4y9mzKXZvb/wvZVtEp7VdpiCflBp1c4bh1PZCgveHFqvimAjhPmhwqcjZX2e
         ULxk3PZviX/vl6bbvedKsyL6e8XKKW1HmNEbbleOzjoMLXav7Qmj7zUfEWNbU9wBSaRM
         9z0jZUjgyXN/6EgV21oULBpSDtRUghxFWugfvX1k1FfsV3GcU9Eu805XeWpHm77dBbrD
         2GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073026; x=1781677826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=mMCYP43RaQl8s8XS2XIViTppKfTYq5PLqkHQljZN/vAbpbDmXhRBtzuFaP0tdqlt+G
         LZheW6hP0/xf8GxMQry1chAB90rjElTXcGAXa2tMsKbqIl7bFETkLO3CxFTYlPH0q4Wz
         CchwwaVEXUD8cKPtAHzGF+SCtQ+yiq67m2UQdbTH+ZQjW6dw+s2cMoJ3SOn1RdDwj8iF
         EzkbMNjyVcBIx3IBTd2lYv6Bv+ZRP/KaM8GDVh7lB6xm8vkD8MRTTLjciZ1LoW7eJ2fP
         7S/O5piheBWIjNUl6HbUvUwtw27X1e6k0qtkqCyhVgr/gjgAyXT88Tq8JxmxOZV8bXjH
         HDrA==
X-Forwarded-Encrypted: i=1; AFNElJ9llorEH0g+nt+yqAxY6MUs+IBzEo+CnXmU5Wayw/rY0ioxYOOFUlQy9S/Bpbp3rZ6UHKZ7XxCr9XTa@vger.kernel.org
X-Gm-Message-State: AOJu0YxA0+s3A7Vze/rkkFiU/ctYGUAXIAnXzE6zAB7YipUMGZ1IEICr
	4ZIaP3sclQilQlfWX1mDWj0buZNsnd21sro9UyoQo83dYmlPMrJWr6TJK/t9QUzT1F57NxYU9/V
	c46Fp7lBvmYZF+yLXt/z8mLlinbhbHvIxVhABRDL3rh6hK9RI8O5+v2Db7yDeFvWO
X-Gm-Gg: Acq92OESlzBlC7kDjXlk37M8hG8kqZQPjOTUoiLuP1R3dluC3ZRDbFxFbtC92jS9l54
	nly1GAmaIxTQghSc7Yv0VgcasfAAzUxpx4DnSP8iwtfkiWYuPjGcamQ5KKw5+MfUoUlmWccGwkk
	ircQMNaaJXzYVOJhjWrb/8tk6IzwdJgfwB9FNZU94arOo0QWl2qjYhC9ZlSynwxzKbb9+viUach
	RE3+zUqUxgbvx8VuYPjJAa55oLp+3CT9wX+dTVu71K2OOCTPx99bjjm6InkfZmtZnae21fO68l3
	bHok1Qo+WLhsVz3gJx5v4XHrI2pMXgEfk/qBJroTy4ivru0z9CfKPj2hQacYzBQQTo44IHs1NxN
	rGQa2av4iFSjsU/atIg86G12FxTwR+Mc2zyTWjU0+OUXUVXx7zCn5wDa0iFOcWLwIRQ==
X-Received: by 2002:a17:90b:390e:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-370ee33cfabmr25153521a91.6.1781073024950;
        Tue, 09 Jun 2026 23:30:24 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-370ee33cfabmr25153401a91.6.1781073022095;
        Tue, 09 Jun 2026 23:30:22 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:21 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:38 +0530
Subject: [PATCH v8 02/12] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-2-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=1090;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=dJOak676jq9xOdkTjWpAc2d8f8wOtUNP7aR0VoiKGvo=;
 b=S9EKZEnlUVudfAeNMawwOgx3xZjxEe4Uly9qIotiCiFYLgCm2Xd0BitDRJblxarJ/scgDi4/b
 kltOGKh//x7B2Wl7ZpC/saFu4AKaXr0cCGtMJwTbOZRxNu8agdyHKIG
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: _nhlhkV3AzOTZow5uriHp-QVHJrZt7P-
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a290483 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX3HnEoSXPNL9N
 kACD1463c3tfrfarrl2RDWwvZQcL0xYDmGeWmKMNfJnO/6ZZGtaFtx1OZZ2Bkgape3MRjoU9J6f
 ev4rKrnaInZVqYa0W5laghHVTK32lHOXaxvoBwXlQCCizuZALr9W3opea/gzAzaaDzA54LyNxSX
 8RpKWTSjtD/j2IP0tNpvTXsPNqHLkPC7Jx87bcm0nDp0CUxuP8x0I6bex1JjThZr35i7MgOlCwD
 wh1JCaIeUNVp3q0lzbohXkTVmcquka4coX+cNJwod9DRgiWQf9QEOMmZIw5umMTVWl5JoHRBKI7
 O6/KrOpzpEXoE/NKvrRg50iCNa6aqwFD7BLzlSTa3VZMDl+UuObcy+qDC1qn1GerFD6XYzJvP7A
 3fcMW/NMsBj4JguPRFJjiPJQk5ZdCfYHWx+wbpbeI4BcfdzBZisWDX4wnEeOvt9FS77pK4UtC1p
 7O+t7TltuREunvHWrDg==
X-Proofpoint-ORIG-GUID: _nhlhkV3AzOTZow5uriHp-QVHJrZt7P-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
subsystem so that the bus notifier callbacks are registered for
device addition and removal events.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..fe51600953ce 100644
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
@@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1

