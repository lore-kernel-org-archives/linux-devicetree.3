Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745933BBA0B
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 22:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439087; cv=none; b=ImqtmoEpi2PXFt2dAlND4IieS6Dcl5Izn67rjTCbLBGJaBV6J5yRUigtruVbcnlFY2dRuPc4aNc8qd941Ga0JHe65PIIjx+8SIyVsE4bEuiDlEAneGYK51BK1nM7qRg46NWhYPl6xagUSIaHMWKG9RxwXVlYsebB4rQKU2oIsVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439087; c=relaxed/simple;
	bh=3w4W63xsG2++dPCs7ogqk5Rw8JmFxMFLrWxtVoquP6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPNpQDCpN5t7QgRkH5kVRXXwYTma4YQEyXnSrFp82XVRVpkAJec9pgTHaE44KQhwkrv9y645fjTz/utirLhi9Qh/lrUOoIlF3dLWPENVVPDeDe9EnYmWrVauo4dXPoqFAJTG6kAheJuFu7TklbRCPMMX+Uly0RmLrhtowJdSQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dv05aFtM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxSgwJQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dv05aFtM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxSgwJQP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652EMEgB3302800
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 22:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/5zy6XbjJJB6n/FuzDKwDIAc3x2b9RV3asGSb1UkAE=; b=dv05aFtMr6OD4M9K
	2a6dCDS2WcA7jB0tAgLvUx+KArCmKAJYnY6SfOg3IQ/v0o+k5dAwl0dguGNc84+0
	UpOhiWMRd3T8COjXKwMIkQUl6TDPHe0PLfmdRaFFtx6cDx9XwtcAHfxdpennUOvK
	zzqOPHQgBg/SQk8HyKSNh6ddXlbREY4VgsrVlPZO9Y0LALCdEowwrv7SOyNCE1uv
	izd2xiidS0kPWS5yUp14TA/UYEa4+sffmWUDmkHXsuYGKJy+hPXYBjeLkp/76vYw
	4vKraWOO+iAxusquW+5KvVrTnQc5E9p8xBJ2bezWcGBBU2PrnVRpd3umjFVlmsl7
	cQHZig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18khqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 22:24:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c36f4b76so30576075ad.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439084; x=1781043884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/5zy6XbjJJB6n/FuzDKwDIAc3x2b9RV3asGSb1UkAE=;
        b=PxSgwJQPxvKRXinssiTjwD/FREVCw5BRpInxDu7P+bptzTdZnY8eE4Op7RUDHVM1f6
         qWYK9lrkWTfPP0IJiQ0/mtfCavbU6a47pNS8Z4GHQh7J/Q6UGjPf9Gdg3RSOJRZdfKsD
         6kr6buh3q7dlOm32sH9bkacewiUIC24wh9BeXtZwr61cWXhAkvUB9OAGnT2781xVfce9
         QISIgdtHu7Wt1ykqAN8CJ1/Ycdz+w6sM3UtBoXJyUsVL1F7zEW2kZHi5FAr5aIufbnfP
         H1xQMktU/FIA6oN//1HF0JrZPjtsjp2AWdXNIzmWEz5zg6+fHkNT6aLoL3OuW0djARfb
         hwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439084; x=1781043884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/5zy6XbjJJB6n/FuzDKwDIAc3x2b9RV3asGSb1UkAE=;
        b=bKDAkqqyOYTzsUuUcAsV7melgMOl2bg5cxSLHiHGxWQjHS+bXauHzKZZDrhfRS3QGV
         s7ozKIq2TzWE29JVYLPzk7nGPHcNasOwGmzcL44xG0hNOsEuFiqZIh47hiUGMJTCexai
         4iYnMKH01MuA0kK4gl6h7Puvuf1Bmj2T1Yf7XynUwUa3FJAfyGSVg+iE675wCgYLalAu
         9z3KppbQ3cQRCb3Vf5IF70ay4ngy/jhcRTG87HTVwGQA2V1EiGQ5BtLuybg+i5J5yGwx
         bhZPwE6gu7rSTu3ZsjgB96yPlutcTqCO9RJV/BvCEe6R3xum2MBnto8p/bl0goxaBzM1
         8ERA==
X-Forwarded-Encrypted: i=1; AFNElJ+vVVQoURkV/tN4EjTRJXDPVoGwskLAM4Wurl7YZnMY715Sf7mEJzewkVI96Znc+ENAq80536q4OyAK@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvU/5+3PfcMcx3lDCVGEXMfLxnwn+To3rkzEwMFBUxIxgEbxM
	PdyB34NJNZ1wlD4pN01dNHVWfxwOR6VKrykZKBZ0Eo+rHy+cokIXivp1cFVaLxUYKotjvWXoaFq
	k2+nn2vbdr8tvzceJCfwNd1cjen8rjTADVe5HKHVHqeeZj8M2l/1lO3GA+bBSyy5p
X-Gm-Gg: Acq92OH1irUjaK7n+bqcrUutM7vAXrRrG19dPFg37v4yTewvzJ0renRXXWz9Im58i9u
	C+wjwiPBGdeNB7MvqUo9C+RfJQBIOAoEw0WWCC/Jyn9VZIPba5+Xxng9+ipAC8G9D/YQT2s/zfO
	wMbbRjSvbFpQYnzHGXyTUDe+GOyABcwM8/S9dYSpjPQvz3bj3poOnb0wh0czCjGCCpEnGHK6Cph
	udaXsb9NWSGgpjU0kdJFsOMn3gmFtZFe3r4mcjXGZWfRK4VfrPqe7ZpeGHhwUd0RLs/S+373LJM
	VAmb6+oL9i85DclUlYcEooZVWhZ04N6bSEb6xnTRJTtdUmbLEMwBUR/mnplWFhMBVyMRUITY1bW
	+f8ciSVIWV6platggtCjYKz660aXIv2YrPCMw4AVBBcyGPtgUVQ9DcLMjYGUVRm92DzJPKQ==
X-Received: by 2002:a17:903:3bcf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1644e4d16mr5741865ad.37.1780439084314;
        Tue, 02 Jun 2026 15:24:44 -0700 (PDT)
X-Received: by 2002:a17:903:3bcf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1644e4d16mr5741585ad.37.1780439083807;
        Tue, 02 Jun 2026 15:24:43 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:43 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 03:53:55 +0530
Subject: [PATCH v10 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-enable-ice-clock-scaling-v10-3-b0b728435356@oss.qualcomm.com>
References: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
In-Reply-To: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1f582d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=PzEurhthzZq-M9kHIYIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfX4YmzRmuGEniv
 PocMjxO4yyW2loS0NCYcgsApgwNAU98nUmEByzC0j+5SZ2KcF4JAnDg1B06y8/a1jiKk4nw4THu
 kBgqi+dUNxFAjiPug5s7LkqGPY7f/ZNoU5B/wF/ph67UdLvLU8Vv+KBXm+W2qINywvPVa0vHsPM
 axh9EDMj39hIX7rngPMoFKjx725Z+S7sWTcBVMIFaM+ARaAsMRkd0d5bpAaiHHZCQ65xijIT+sa
 /EA4coQeRJq/zvi6+RQqreCzqvBErO5/3YLtlXwPKYLVJw4GtfDUOmQA69mb2W9biC7s/v4NOw0
 TpxKREA8eq+O+88vRv+Wb34WP1fUshCCG+dxy5lT9ZRKItVNUcxO6719F+hCqqYbGZ/2EVgSqU8
 SbAmeBSpjKd1zhz14e+USt4UvceljajBwvz4z05rhiMY9N1aC6hDV/ztFl1PJI8/lxZTg3gGHOU
 jVxt9zUMSVHDYbDH7tA==
X-Proofpoint-GUID: 7O25sSouZDm9H7HkFjL5OPB_bqb67SHA
X-Proofpoint-ORIG-GUID: 7O25sSouZDm9H7HkFjL5OPB_bqb67SHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217

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
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..b655bcb5b90c0677bbe3dc6140de488038fe5ee8 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 #ifdef CONFIG_MMC_CRYPTO
 
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+				   bool round_ceil); /* forward decl */
 
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 			      struct cqhci_host *cq_host)
@@ -1959,6 +1961,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+
+	err = sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
+	if (err && err != -EOPNOTSUPP)
+		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
+
 	return 0;
 }
 
@@ -1984,6 +1991,16 @@ static int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
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
@@ -2149,6 +2166,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
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

