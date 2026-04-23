Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E3F3537F9
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951008; cv=none; b=jngnc2tRbSXvdL3UWf3oVPvaS2uyFBzFudwY2hERbJkYd9bGy6ImL9uH3MZVAdYFlPE6/OFjYp0JfjBZS3M8IlQayxQnGVNJx/e1E3a4/LXnKu5+ByRgITjCGrxoK0gIeAsXk6u72xpkkshNiNFhMiqpcs+cJLX45mTI2E07GCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951008; c=relaxed/simple;
	bh=9ojkIAdTpgdWLJL63T3L3LzXB40PPdXzhWOQLp7Cpgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Svmngq2R1YYDWQ3VFCeKnetl6N2VEZItt+rw6tlaXSYT/Hkw7VMfx3bxfqTM+x/yJvw5LUJ2nWpPg1KfkBi23+7OLH25oua9QKhdwkmAhj2yeOpL7L74lOa31Ks/bktm8sgTs0Gkvrz89tUUCCHUtIbQSe3rhxK8rNDqOzSwfUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inrUE1eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWk+YDEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inrUE1eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWk+YDEd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tqOd028798
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=; b=inrUE1eFryx5382j
	3x7rs59o2EAw0GE7yiTLTv6vxcNjIksca0eovJL55QwMmtmF0ghirHogM4Ku6YGY
	bLCa8odqqLPmBKzzeNDMepoaZaXk8ieuZYRiBHdEWeX5q4ApQBx+p8E7i2r3zqRN
	hm6AApefZAMvcbqH0VoQ4vLcsd+n6kdWs9UhsXDfN3FwN1KxcDl0qS0O74W2XAa0
	wBVmQX1BLh196ISWpAFrH6rYA+Y8xRxVksDSOcw+XLKIAICQYDCzAYACXF5l4vzG
	aI9/WqTstkkEgqEvQVfYA1ljH9cb8f7kjOCvWb/wxda5/10m+yYcBurx4gmsRovt
	zBJ8bA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm1qpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:30:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so130903275ad.3
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951006; x=1777555806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=;
        b=aWk+YDEdRHh/OCbh3ZU3IYGpYjJ2Kz5OsLcGf+FTTsJZXSz5lxL0VhxzPo2M1zrHsy
         pSZn6q34okLTRifSrDM1Vps0pgZkOwGgmHfnNj5G4a8GNGvUEK5QdAYvc/z5frkrafbK
         Z6BeE0ODwKjcxghQlLXoUnQiwR/SI8ZKJFXOX4Vnr/bmubL/7KvC6nxEuYRu1MTSmajT
         /Y555zJA3lIzdBbxVv5Ygao+ev3pEynMtt5HMuf+sd7hRb+2Qf/HdyhtvyaHQD/mRiwV
         OT+jW7KiIa7mjkLtMWYuUyBSFRvEkD/EbxTqd6UbFpyMa8scKT39OWito/mr8/KObZXP
         zBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951006; x=1777555806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=;
        b=HZ4oFKjxXYp/dZcPnY6imyD98skTbLo4vN6S+e4tAHRZ2ty7M+vflbiuWtnH0EjqQt
         YzF83aVx6rBV2zenly4EhgcnQfZTZksb5C3k1l9GGGhUVwx54OeTfcGBffIxT7T47YHf
         2GQe1UTJQ+NEIX1uopXZr+SIF4Pb01A3jFkdeyb/TFdJbEVSKfedDJoJ/FT1jZXU0nCk
         ZSg/Po6dVmgGRpf0tzV0mQkILKUibcvs+agGtsnBar6RyLM1iGlhr/6qhV0onc7xpWlj
         9RZWHdTMRpLi8wT/h5sVkMM09U7unjlG2hlzzHMSYMJy+WBNRZOCuuC9H9ok2LJlRPPP
         AbEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WZxmBihBmOTgJiE34Rl38eUGdCyWT53W+tBpvx3YeUhcveSruHWmMjs785dHHYeQyoDuNS0YPit6E@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhh9a8cxwugihJEQ9TinJ8iEG97+n7UMRB+KTU9GfwBipeZSo
	Dwj7Z4+0CxhFUQr/86xciIM4tQfyUm77W1LLTjqxqdkO+IOyRIKOB9umGlzDyjtvcFKW5H60FSH
	35k4XZOKNMHcXJIMlItehbiTewfqXfB36ltABSf0W+4Na6TTP9qwhNjaN/9TtyaUM
X-Gm-Gg: AeBDietl0BMarqI0oi2M1KkwKpe2GFuQgzzin+mFe4isys/jRDW/FuVr4u5grSWpNHm
	Bvv9ox20Z0Wes64l0sZf3Z4cwYzX9kZn2WAKByxb0S+68dWR2CkhJ5O7/TFBsmH8JXjH91+j+r8
	0uWo3QMnoiCeEVyHIaCqC/92bZ0qT7/TBvlC18zI9gLL5r6/eFz6AicO3fmxRebNzFHlsIhlej2
	Gh5GMu1rbvqbX5KV2t+iPntJVCXgzSQUiB/cUKLp3P/qh5gLxz2AQPVlzjOjH75R2agqfrC5O8r
	JmpMd8YuG45J5/hfBd3WKuP0FvB26bfxQUH1Pv687yRIeGdX1YA7Uhed7XKZmSwxbdKpG3jOKjw
	PFt7YWsosKZcHGAjVfooNIUoMY700rX7kJxAVc7CdUJrlRaKnVtnU3yf6ye+eYYfFFg==
X-Received: by 2002:a17:902:f551:b0:2b7:9ed0:4f92 with SMTP id d9443c01a7336-2b79ed0505amr34984435ad.32.1776951005422;
        Thu, 23 Apr 2026 06:30:05 -0700 (PDT)
X-Received: by 2002:a17:902:f551:b0:2b7:9ed0:4f92 with SMTP id d9443c01a7336-2b79ed0505amr34983465ad.32.1776951004706;
        Thu, 23 Apr 2026 06:30:04 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:30:04 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:30 +0530
Subject: [PATCH v2 01/13] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-1-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
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
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=1361;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=9ojkIAdTpgdWLJL63T3L3LzXB40PPdXzhWOQLp7Cpgc=;
 b=kLZ5VkIwiLF40laB5sma2d3q4alpT4zAEZptqRbq23De2A/jVlXuy2rCJ87n8t/knrGPt5QnQ
 BQ50ze3n+5yDir6GHjn/LjLJmJfxx/KjeK3oF0PhnKyu8vo9IOmZtqI
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69ea1ede cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vwCyaJPGlqyTcNPLGr9PrCUIlWRVXOYA
X-Proofpoint-ORIG-GUID: vwCyaJPGlqyTcNPLGr9PrCUIlWRVXOYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX3Sl2H7suDeb7
 EY8cLfib5EhqQ+6NvBLLrV8M0fcHuxM+pV66qvgB0N+ZOR6+sANxF+Ch9QVb63WSDEwjdeztStK
 gyy4oowI1DZuAjnvMF/P2ax68qVNapCq3aeVK7Etrey83x9mHeS2FMFiNFcAAuAqxWiyG0FFp1P
 54lgluK/Grnu6axxYRa2ADiWQ20e6MqyFJMB9lDp8PQwNAFIf5OBcgAIFOoZcJ3Af0KbzmN4m4x
 afO7XXLCScKWYmkDOn0MMjVkOhGY79HooPLwfN9ZX3HzPEdXS7y34QPLCMMdA331i5RRzV9Evf1
 slV+VeX5WJcG56s0YxNZHQw2HashVCa6+6aH29xx93hArRu5BgPx2E1fAO2u86BI3PxO0+d+d1F
 mJ7qwLRRTZLWu6wfRCBgyNrUgf5zZiMnA6jq33vtdiNVfQlIZZPiogqgPuaZwyHt4oZd6rrJJbY
 c36AQbiShH6UwZo6UIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..bfd1e762c38e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1

