Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3A83C3421
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735102; cv=none; b=bx6PeOq0h1716LybpXcYhly2/0XIqCh3e8B4ZQpNhQMxBwKBbM74cylu8B9oAhdwVMNHTXXuXgLD/NnDQQ14artu588ekEjaq40UkVqqu6FYVKVwKnCwLLk4xrAqX+Oy6bizwNU85ki5ahWC6dsri8pJ5sSIPLfpqkH8REMXdsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735102; c=relaxed/simple;
	bh=mqwO6vhHa/WasNF61nJHaYRSrbFR2Z3ArE3JxzJ07ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwuqnKK/y2hcUILwke9A29B9lUvoDnjYLa0npQ+7nmuqewPAxYE/5GmR9AQXQi830+b+/n1ZTPStV3zIQifT0KBZON7XyaVhexxr8rwMxOufbceiD396PT2Vb8GDWvDdBMOKXcMVVJxhEAc8AotjDmIX366o9g2Mntb+u+goaKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8+jmh/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV0RI0Dd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8+jmh/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV0RI0Dd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6396v5L5674881
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 11:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZvb5TNGnSRnh7Yw6ww/CSSTnFHggTtfN6hnf4UNCVs=; b=L8+jmh/xUqy/HsMy
	Xwj1VWwP0uhmM7RTLUoV3ZMdvF7aRVlqOTG8DMt456d9/fsG/7gW9vjdT8ytwtL6
	JzcnE4ybvjixeGKH/sYzRIcK+XT8ixmgDL4xiarrwouNjcqyq9aS5eHgldKULNqU
	UyRJcGbC/c6vuZbf5tHLi18qB1xU6RkzJ+De387I5PXFxtBqF9U9GMqa1ocLl+8A
	ijcncpHo7Vnz8g5IOCdquQoaoIwdX1Crc9KonHgSjaE2QfZyc93vfu2xgoRjvFoz
	P6QND+4DW30s8y8WF1JRX6KMzi5duu+YD85SlHo84edhFLL7PfJsnHC1e2C176sz
	ZA4z6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmuuac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 11:44:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24305cb3cso8643365ad.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 04:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775735098; x=1776339898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZvb5TNGnSRnh7Yw6ww/CSSTnFHggTtfN6hnf4UNCVs=;
        b=AV0RI0DdE51ydyuHtIxVJRRZBSU2dWNxekjwRXqvJtzzTP9taJDustR9/PrVoVHlwr
         BVDX7pgz3fIL94RwclI2yWj3G+e4vHMu5axYcSWpuSwZtp368Zx7tQ9bZGCouXJe4/ye
         zbp//8zg+IZmmFw7qCNwrB1/pQSWQhpWSZqnsLVPGixjFciipu9fnrjmycuI2QKsQfgu
         aGe4OLy6MS7ALWu9bUsmkvrmTStNxGwE9IxMCuJvc6Y9PYISW4JLadJR4IUnxC+r2MiT
         5GxFYwGEe+pCXUwEVx7cT0P+lcybZair/lxdKwdMfOja2ebZ8X3QM6EP9Py5ie0rShV1
         /7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775735098; x=1776339898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZvb5TNGnSRnh7Yw6ww/CSSTnFHggTtfN6hnf4UNCVs=;
        b=suUTHerMkwFRid2e8xV1k5xcMNYEBWErvwyOuXe2HAW+4AthD0ArJv5MXFdR1fj0Sm
         zvsv0JK9LKEyIJCEqoNnlrWTwnJ0f7evw4GTxPXL/M2wj4iHwlwLzlsQv1SfDjmArLCp
         /+KHBXfXx8Znx7VISP8UFeslLnzizxRQW051Z/PLxVV3zc81wgwyC52NamzPpSt+NSvn
         7OaOTITR3Rn6iXJqJbeMYfxVES371RLrIMFSBvL6cU+Eoryvfksb6iNavMCuR6TEynjG
         Dg6aIcT80Db0teoj18b9/FSq12fZFF840A59gtFTR3RRFq89bof4EskiHmLzjysJt3Eu
         N0jw==
X-Forwarded-Encrypted: i=1; AJvYcCVdvLnBwgPqI+aVpvhKC0w06xDSF2Sf10qjJxQX1izcFIoZp01Lb5mIVMjMsiOl2Hi6SX8M4sqpJh7h@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn4h13gpVl0P1u8oV8isENN8mnklFGEmiSdxPcII7D/Yp7fvF8
	tshxC56PNdINQGNC5UVhA7P7kj6w3FMcPRxAJyeI0zognUh0SVTpf39hzsrjOvR/6G/5Z8wDVLD
	SBIsevgxNTdWyr1mG9zcIgqqDu5krs7e9ofIQ8XmXG11KgymlZ7HEHdCj2jvVPvd+2uKTblCm
X-Gm-Gg: AeBDieteK4by2S8RDrhCcuDw6b8Z94WNTEArXrovsVidRSLmkyhKvlBYTPwvqAgk8dZ
	J70whB57wv/CB19giK7BR4cg0kKuxkK8wO6yNMMLVCrw+mEKWxllMGOjdE6RxWodX4+5IQEJ0jL
	BWG4NEuq5JdlnhHjxBacmnFzeVyoYvTLJocoxiMcqCtBu7Mvf0sLBseVrUNCzTRClkEw5mOHndO
	z9U2scujKOEF2aE8pdWT0uHIwp1+Hz3OmiXqPRN7DuQ8SINmFoTD1GutOcFY7chl/KRN4yi4CbF
	zb0siasLsHz51Z3Oe+zd0L/QoVVRX7oxWYlV4w3VLxqn5lpQJQs1iECFbaSlIS+AZtRoIqy3a2q
	FaTh+q0WZp3VPaquRjbAujgVHw2dbmbW69XxV2Wsyk71JsolUyE317HtGYv4=
X-Received: by 2002:a17:902:f70f:b0:2b0:61c2:8e7a with SMTP id d9443c01a7336-2b28178afb9mr277907775ad.25.1775735098377;
        Thu, 09 Apr 2026 04:44:58 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2b0:61c2:8e7a with SMTP id d9443c01a7336-2b28178afb9mr277907515ad.25.1775735097871;
        Thu, 09 Apr 2026 04:44:57 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd9fsm230957355ad.75.2026.04.09.04.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:44:57 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 17:14:10 +0530
Subject: [PATCH v8 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-enable-ice-clock-scaling-v8-3-ca1129798606@oss.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: HnHzi9k55JsLLws5UX7i-OJMelnS98Nl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwNSBTYWx0ZWRfXwfK3aVONIZsd
 7ArQ3I3/QM4gKB4+6Qp22t6cHWrv/LMhVYW+KMhjJhGlZVkBjN9HwM8xh2RQm6+qGpWT6my3K2W
 jvEO6bSv9L+3Hll7sRm69WZVF9h1wViYLBcIfe4tRPAAHjOVGLI+rbLuOK1R/PBAk6F/Wol8XjS
 0cpd1jnaW3ovQuKl0WVqwR34dnx6pTaoDeTIQL+PeUpAOgPGmd8I7aITzjdfSjQrDUjXaKyq0H4
 foeXvyh3A8hymGegzQMqTvopmy0S7Z/65Ei9T5VfO/FLCXCPB0BZzKis2sSaMBh1Pdb9SXaULT+
 6Y3zcy+z3jmWvK5wU5QVxds4OJl46zCRwoIUbtIl9kr9VQv887YpNehB2cJeJgch6mz4aEAfkiL
 RPS1PSc60xo+cUhWCN7EQEcdov/uhAWVB1CHwgMCNS2tpFYTpc6PR9VBSwZp78MHoXQWashRhNM
 I5XaONca21hViId+LIQ==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d7913b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PzEurhthzZq-M9kHIYIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: HnHzi9k55JsLLws5UX7i-OJMelnS98Nl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090105

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
to align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index da356627d9de6a11ed5779bf057fa8eb23c38bc0..32e3f37fe425f66c00290a373e06e8ab6257824e 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 #ifdef CONFIG_MMC_CRYPTO
 
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+				   bool round_ceil); /* forward decl */
 
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 			      struct cqhci_host *cq_host)
@@ -1964,6 +1966,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+
+	err = sdhci_msm_ice_scale_clk(msm_host, INT_MAX, false);
+	if (err && err != -EOPNOTSUPP)
+		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
+
 	return 0;
 }
 
@@ -1989,6 +1996,16 @@ static int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 	return 0;
 }
 
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
+				   unsigned long target_freq,
+				   bool round_ceil)
+{
+	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		return qcom_ice_scale_clk(msm_host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static inline struct sdhci_msm_host *
 sdhci_msm_host_from_crypto_profile(struct blk_crypto_profile *profile)
 {
@@ -2114,6 +2131,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 {
 	return 0;
 }
+
+static inline int
+sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+			bool round_ceil)
+{
+	return 0;
+}
 #endif /* !CONFIG_MMC_CRYPTO */
 
 /*****************************************************************************\

-- 
2.34.1

