Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3D395AFD
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496434; cv=none; b=KGFS/G4mUF4CYXgc6JiY4PEL1J1N4N9OqNda7tpD7CjOj0zB4nHu9VP13sqEI0MAEU0oWuFukGtZd8Fe2fSqSddC11fP7wMgf6aPU7com15QeASO3RNa8TywmI9TP9Fp+dGWH3rygQc8AukJWtHFkj8dfDXib5SzBcDoJwCAOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496434; c=relaxed/simple;
	bh=uXvxBqV29dnRWJEGEW3qlSEg81UU7hjiwTjaC3X/PPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tggQUaVgFhnx38riZPf0B1b4FjOpZ1omSck5CkEfA9a2tFyUCOHzKbcfAKdpwpKF1EtuDaqnSDjqlJ26dUdo1gUoXL2sM9WRQb8+4AYM0I1N7J+nkm1JOom2Xnx8SobOJT1K5HpPey6ZWoMyWDE0MLWCqTI51epXKwzNSPw2irM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3P9REkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdNpjdpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3P9REkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdNpjdpL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653DYUis1956859
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 14:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=; b=k3P9REkT5TdTSfQN
	7IrHvxQQcMaCfNnB7NUoR/bkVk1X48zsAZM0olykjHIT6CwBk4+ORQvcAxCIS0Ht
	pUTSnOgz9T0NcHot/icmMPceiDQ1UjNqPFAU7G17jERzze556d46h0giaEvvPZFe
	9z7GrQP5uE3jZfLI83Rbe6Yf8oScWxKTOQRIsmGwRvc4I6Av8BfWr4t1Kz1DZEqr
	JxRg2jWYR+N//RC3tUny3tzT1EqSORm9OQFYXZx1/EHfTFPBepyla5uBZpqVDprl
	zn1+uVgsJDMPJv5GtfEUKEAfmbayAethRw5aDBoQ1Qcqe0H8LepfgAQLZKvZ331C
	n94OVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc1nqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 14:20:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso40120195ad.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496431; x=1781101231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=UdNpjdpLjC0adPjkYVUe5vT6+tkvDAckIx6itWV26+XZYXq4zR/7bFYoeMlq5tJOar
         mYyi3RJ8C26Wy1bbIDVdhHItQZ7IgF0z3L8a0DcSMxFoMhd1clz8Q1bc3RvWSXtrEI4K
         o4NtaGIX2nutBdM+4s+DdCbyk5rsd6+9pAioM/lQGFG5oPOYsQi2g7vjHcfW+OdP+rSu
         a9oYL/1QrWG+fVPx8jFK3Tn5Z0Nf2u0fQ3Le7y7FIDO6BcmhUc8fgC9kWAstdyQzcCWR
         8Bqs8OK/RxCqZC8nevsPOxRSzyxfEfiICOzvU1mgKHE2vakNI1/IPqTPGHssyZyz7B0J
         GaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496431; x=1781101231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=jGuZEdVh77COlne/Ek8MDvwZrEvElUMTFKLmhaq1zUbSEQH++MCfiIjNeQX7/+0jLM
         OzZxV8bgUCKfVYnrYqtgFrT39bzGb31q+4vkwuGUayxJfnuKoLjGP2UjDMwvXKsAol3z
         cCVVQGqqU0wWZVEX0m7m5gFis8bNfimKGj6nKbgL3wkCkkoVUShWmwWuG0A3z99aGlEb
         gWJiajUgwfZuIYzJY7HxPoh/OmsDFW8Q1MnP8Az5s8fJQMcioXVcrm4VVhGwQ4j0mhWh
         knXynIUB+fpkCU0EnBDnDGVwm2rL75t6vInk+1GynG80Tv9rnXpKvk21a7tBryXObSA1
         ugOA==
X-Forwarded-Encrypted: i=1; AFNElJ/Y3+KtJpQC458m2hHZgY589DKyG4E3IMKi2cTHgr16Jh1pq60fCq2cAwkptCsVbdnAxQLfIZA3DY5a@vger.kernel.org
X-Gm-Message-State: AOJu0YzHUN134SULyTjpRnLvIyb75ESVvs0e4oYPb8GHdYrM7CqDKdQO
	PiLiWYEWc33WB7hQyLvBoly3S+FU/YaLuFhfuO0wpMk49MRl0Cdzxq44K1z2NfMXEBu52XnIwfG
	kgiYBf+xYOCa3gplAod9ih66c2FZrfOJrWM94jsKArjZUfOYfjgCZMnALQ1YMCbk0
X-Gm-Gg: Acq92OGn7MABnC/cgRcb1GxXtWP02XeLHyOvnZujBLmyF/Jir3fMdjmwiSDUxBdzhFR
	2U0YhB/oQRfasukbAEoTVCPG9RTRFJBt6mtwf1NQhP5gZZbMiDroO07tZAjYXUiWSd4sVv0fyks
	YcsWXathxDSdwBldtuYMoGIY/0Z/OaQ7owqBgfZJ97quAevQjExSSwF6FUC4h9T8zRapuGVnUXn
	LLV133IhEsoqueimC5V4Dzhr31WwOv25YBLGHxVXhMYzuphxEKAyCYL0wCGsi6pVVZjv6/GnjL8
	JpYaA99Dehvwj5juCbq1zt/FpcCPmnH6E6lG42wM4eUZmS+idrYQaypGADVxDpLptZdgEfd+1Os
	qLbjtgrSyyMt7/RMihmX5j6SKFaGiTfI8K9E6zoMrhmUuIYDMZDjP4XW/+ajJ0TB9kQ==
X-Received: by 2002:a17:903:2904:b0:2bc:db02:d1e6 with SMTP id d9443c01a7336-2c1644aae27mr26600635ad.38.1780496430446;
        Wed, 03 Jun 2026 07:20:30 -0700 (PDT)
X-Received: by 2002:a17:903:2904:b0:2bc:db02:d1e6 with SMTP id d9443c01a7336-2c1644aae27mr26600175ad.38.1780496429889;
        Wed, 03 Jun 2026 07:20:29 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:20:29 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:40 +0530
Subject: [PATCH v7 02/12] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-2-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=1090;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=dJOak676jq9xOdkTjWpAc2d8f8wOtUNP7aR0VoiKGvo=;
 b=WOak3EvlYvqbKF6T2lN6EhIkDnf/uHBTEyz38sitDdIOdCEAnsIybqDkj/uRlostDJJ78PqAj
 ADfcNs1g7JZD7SmFqCWV6+7FZcaiKw4i0T0Q8XsPrE2PHfTqssaBHjL
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 1JGge_hetr3qNrLsWe8UAGZa2-Jjr2L7
X-Proofpoint-ORIG-GUID: 1JGge_hetr3qNrLsWe8UAGZa2-Jjr2L7
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a20382f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfXyVyrbUxY0omZ
 OrPJW6cEli+t8Gk7LHCFI2dET6mPHQkTPRKBMyqS4yfUbYPjRi3JP6Y+DTM1j81e4WRY7CBWkf3
 CH2Y91dJgDbBFgRC6jWenxo1U5mbq09Grdr3Bg3rZBSh6koGS2zVI1hbLVFaCp7TcuhhWZG9rW5
 JucdtMLsUodf+HKorE7ep17CU0wDc1ja11Xp4stHe6A823gFZDJBP9draVWRf9xXWM1eWxM0TTD
 pK8fTiKnm8Ixro5rdweISuF2vq7GAdaCOv6J0au7BsPzWGD8/qcJrqiBSi68EwmhZnbIvwwT40V
 dheO93xu9QTozPzHKNTuGmY6WeecwIfiu/WowxixgtKRg8CtnjSxZ5Kk+p4B9j8kUgorGdncML3
 ROUiQSCOV0HYLXrLiR/tObQTW3G1xmuD9vLWZvbV2Xt73Hh/OMeHkdMJTSjdeSdleKifAgwCuA/
 9F4hrEDYuyPhuoEJlGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030137

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

