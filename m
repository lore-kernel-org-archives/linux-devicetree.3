Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18EC3D5648
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964467; cv=none; b=PmxW4Bffua0tnasapPsOLLGyFowqckTSsnFKjIZygPJ9+NRE8rctKCRac2/qey2KLx8TSQrZC2UOxPaJXEE2pYluGhH0uUwDtsmLhDz3fbD3p0VOvQdLLz6F7a3aXtU8VLZBIuOOVecZEHq5bbWWEC/PeAHLaHN1I2OQ93YFEY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964467; c=relaxed/simple;
	bh=lQ3z4JfxRQCYgSubX6j1hfl+h6PxkcR07VzhxVTyjGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WosoaQNzFekx3JJzjryL+4vD2vf8tDvlDma/2G/Tlf0zvXY7rKXoNaY64ZUc9Zkc/C95wHYRhJxo3XhLSdBHi59i+kCpB5VVBqc8EAXWQqy4B3i5Z6sf5Iv0rGnaYu5EO5DDlM/2q3/yS7HeCzen9Vhk0HbPDeYhgBpg79B6k4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGaMBaT2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIDFkgNE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGaMBaT2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIDFkgNE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64509YFg3409777
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=; b=UGaMBaT2lL8loyJA
	pPx+8SZOnlTskN0iINLrj23dpF4ZJqr3QmYUuKI2v5bt6zH6jCUMHD3DViYiAFID
	5SZvQAa1rzvXRksYp+Z9tS1w/fq91soWCNUVjVZrC+uVsVGWBao6oRY7YPLF/IUM
	PDaHHz7UQtawsXDq1KS1nCNEqeWMM116OObzcK7aMtf6vpXEC4qMznfFQvjthjw2
	4PlaTf95kO/sr6xBqa0tT9FeSgwaZPaYxy1eruBMgY+SsISceYNnaJ/iFxW51RsD
	cdUAKjngmbe9Njen5tXKlnsF/eLPgL8DztwbHBqeIBNgJk/1G8oWhVblPPJ1K/Xd
	eYKg0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00tsxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:01:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so11949491a91.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964464; x=1778569264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=;
        b=NIDFkgNEdAwYw14zaeN4+PYiOUrWDyhb8t58yn9WAt37A4LLxdYnaS70ememj7LVhV
         06HzI6l8eMPZC/c+Ny6Q5DDADy36+SE3p61j1daiv4I+PSFS46frIPzOq2wYZn5jvf8E
         CaVVzyk/UkwnUzUDlLESdnVqLJ8AUNGpuLpsx7QBS44FCBsfvREg4djWNm4yNBoMf1v9
         8oKY8ono/q9Bucb7h+UWZrAMEeHmjHrS8phowf4qiraAm7xcDXMg52CtJ5ci31AWLa3N
         z7OKXMFy+l27HuOm/6DV/rn3pH2p+mmPexQDzaClU7NJsMscqdu2k+6/e2SemJT1AYNg
         K67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964464; x=1778569264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=;
        b=i9zpkiSp0VeFTV/fc7BcRCwXi1Vs27hfXjSJS7BLqP8avisLTujX8xKWBsQYqD2KjF
         L0Xr5KoEb6Y+X1+xUOQFqaQo3WRPglWtu6gEZY5KrGfi+eynZPGRQEc2RgVwqIuL23jQ
         YXRFJGF+UX4gbIDMIRhuWMo+FOlIDSgTvaQff8NxIOdzu/qSG6Vu3bKpzmKoRbtiAYzJ
         uv9x+eddKB3EiEQWH/b9OnjlcsHPMv8dAX/Fvj11KI3o7NNRD4alf4ucS58tp242Pb+C
         gMBK+t0PcgqIy6hZaDvkm6K5e3xhTt4oO7JnjwI5DmmGs/b3Hx0alzUIjM6yL7Gx4nJd
         1Ojw==
X-Forwarded-Encrypted: i=1; AFNElJ88AFwmy+oUpiI8PMR24qT/WpFBWzAICCWCNuaVMjUeFkE8u/jwprKIpUEleDEM+f5n3Tw79woGfeNa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Hz8OGAUTCXA9KNlI9M4uTfieD2du4hVuzwDC3AIjnthQN/C8
	6hLLUJrSQf6ZkOp3/SSOIbV4VGdkP8WGVnJS+rTJnuA1B/Ikb+GNfMhrATpEenhTbq17MUJQPF2
	2o5cMTnU++sVpJJcbT1rDiynrIhdhLpzYlqAZ20U09DSS0YI3oNNZy1JlHSxPOeBQ
X-Gm-Gg: AeBDies7VALv5j29ENK5IZx7H11vasSPSZPmJvEwd7kLQmTHlLgHi28SBuOGGZMsDO/
	s7mFtj7IUNyUDhOih7zBli7yNSCWOGEY9B9IijXXUFOgAnizJUL8YzDxJ2jfJyNRlMsiFhNDomE
	drgU2o+8k4dBoa3JKVfwpAuaNDM83lebr36DlPa4/f4DIRbnV2VxGn2tiqvXrteELk5Qym/BgqC
	Ei3nUhlkA3QA/ZMN9yGzBwtoRVaSsTrzCDPuyWdpHJHVzVWeVw1dNF7gn3mvvRDtElv0qlUSlbq
	T65tPgp6CbgRLlcr9LLPk/Qdcu57lRgZeMEPAUlPGkTYXgczNS/F5YUY/5xxAqlpOjw66eR5okx
	uWd0PAlNdblT4P1YMWnQjBXsgY4Z5dCW4jo1UsdgWB+dm5dPE1nfPWBjVzcrW4187gQ==
X-Received: by 2002:a17:90b:35cc:b0:35f:b6d3:da7d with SMTP id 98e67ed59e1d1-36577485fabmr2034555a91.17.1777964462165;
        Tue, 05 May 2026 00:01:02 -0700 (PDT)
X-Received: by 2002:a17:90b:35cc:b0:35f:b6d3:da7d with SMTP id 98e67ed59e1d1-36577485fabmr2034510a91.17.1777964461663;
        Tue, 05 May 2026 00:01:01 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:01 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:26 +0530
Subject: [PATCH v4 05/13] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-5-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=1065;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=MN1sEQpm2XgufXMnfyVogm/WAu43GbiaX89w8VaFbuU=;
 b=yU4wGk5gMcNMl/YgYaMOseMuBSUH5Ol/F51wnfm/FMqe+aaL+AG8wYAK8NCO34c4/5rM4xA8j
 frn4+vcXcSNBHatelFfO3ExHrA/OmP6y3dlyfsQmh+rCumYZTZflQuL
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f995b0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ADq-ahcSnVbbDow3-dgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX7JyxCdS9EzYz
 zterjT4fSBTkClXgUWiCskTyzGMjBFvXVOhjCHDT7JXXnjmSA00x+dz4ZeIFEMxkfAerCJmk4uD
 oYa5/BljRidB357KkrmoN3TOQAcXnkBJwzRZBGTBhMmLe9HzkVydkzy/I2xJAZOJLgwInA9191C
 jJYHKijbNNjqQbKHSW3yzhkStF+cSMQHcpBVJ21sJXprxstzMy1wkYTpEjWZUjtZ/Uxgu3AJA9+
 zfRliXFxUuo7x5pV/T1xgbKeqnG9OFV5nowyAaDytyiwqooL5D0gTlYuB+JZ+Ie9j/bkrhMYChH
 OTIjJap9D63H6ueUI0zuAszI/9j7tDxBkW1mMmP0Rker0Gw/Bukf39/x/OSg1gleaxupcKFE863
 mZMEeiV+5OAk2pYFeQcIsfDI0et10QBKTgEAfpPwb30Wvw8JrsOG0D+u3pXEwSxgLKlrFfYq0YW
 2c5Rx9XXpn2bCUfcHiw==
X-Proofpoint-GUID: jmtCAMFi-FKrxxiT9p40T6tiLacp7Mvc
X-Proofpoint-ORIG-GUID: jmtCAMFi-FKrxxiT9p40T6tiLacp7Mvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050063

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
index fccdbaf6dbd5..3b65df247e52 100644
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

