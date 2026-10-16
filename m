Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727E370ADC
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120923; cv=none; b=m6DbycvZBUmbfBM2w5kh5ew7QrJ4PtoXPH3SCDRO6B6Tcpq29syq+Q8e7BpY+HaHT/lJPm0yZRhhBC8Yi0zWGzkI3MY/taAnfr/puc3crBDA7FUZkz3U/5Hj7vooPfU89dZcQpTkmoQrDRBTKFzoDSYsmlXNviOqbPMCH8kFuq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120923; c=relaxed/simple;
	bh=75GV7SZAmCDaVIDLiZWItsAhNp31EJaXQ1WADsA5WtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFksploZu+4b2kNDMAPF0EqRLu1OqADArUVCKuyfBSlsVoNtN/yviXSu5hLdgtWu3pRGqVyTFmmCP8deotHZR4QJzc2a8jTUJxLJWmoeW3fsGl3sSFrLel4hRFECE22JaxoQnMsX0yXF5wtFGSaB0kfcuPmLRAa+klN715iHSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOdxM5+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UW1GRBbN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOdxM5+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UW1GRBbN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKL2PZ3801735
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8M+fGTfdGHLdR6MUv9yVRednpMZGif9KeyxvpOFVY0o=; b=dOdxM5+j0F0W6gL6
	ezIQktXOwMmW1a3PjSrdnkmFp+lk8/QbZocA4TATh0FRVWT/DcSZw+hgxEIblu34
	/u4DEaOISu66g2cVXhSidBAvZX9dXAGb7KG6vtLT5FYoKgU9WLgDW+TNDBwMJyxg
	MYXomcakzuHnM8qU34yhTChyTX9bmHwW6S6avnzG8kJkc8Wgz0zD0IigxhPLxTN3
	4Q1/6eCc8EJN7dXDbi3WOq6NLvZeS+Hg8nngm0hn/Nx6iRj73U3LCzLE7dR0y+mP
	Gsl+PPXbmkRdXMUucVPv/ANSm2rogvrFAv8C7PrJUsP6Zpxm8nG2Iw7qKXNSVHA3
	zcO3mQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5se99pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:01 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-155a75f91e1so612751c88.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120921; x=1792725721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8M+fGTfdGHLdR6MUv9yVRednpMZGif9KeyxvpOFVY0o=;
        b=UW1GRBbNhPF1ucsWP6ZZhZIV+HMEmkBO/fspYJGBFM9yCPuWSLZrIFOLZLo4cRlZq6
         SKaC6Tb/m9YPyDJeMAHZRdZ823ORxAmcOY8TxCn7jPgaj/Mhaz//TJJD0BIG2RbIbiiy
         7rLXu6cWkeBJYbCM67qCxibYEsBn9Y2zrX/Zye09FjCC233Mst0EGnktMBISeV4fGGEA
         hr89fPvlzFhl6ClSV/QJMS9dMAw0v4tYl13gxoV6JmO2KDO8tNSaIlmUlXegIM/JnkLR
         l8lvcNZyCZfRCgNYtlHtfmBpkSwGhj9qSIsdk+eh7HQYzyiSYB9/Nr5zJwp+sMnxWP09
         DIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120921; x=1792725721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8M+fGTfdGHLdR6MUv9yVRednpMZGif9KeyxvpOFVY0o=;
        b=XmH4EffrT4AqCskE8TDwc+XlOvekLE+vi2wQwJ9BkmwSo9+9qbqJgZC6WLmUHl5JSB
         LrqOQvzVKvdgmO82L/k2VIoxQySqd6ou4JTc3IygZwD2eRIWL+hOk8KOz1zFpLi8F1IN
         QDk7JD9e00zPTzRNsr3lfGL130GiWXkwkIBdijwOnyB8Y+RdpX0H5w+YGGlkLj+R500M
         Sd+Z2zqIE+NM7fAUPN/Dp9hhtL169mSsI5fNR0RMHybU3VBY10wFTMk/QwqmXIHAWB0e
         Z4gjUjUYTxWnurvjOnF8b3GwCMHkRrn80uowdlPA7FMpWG6AsM6g+WSHZZlnEw065tEA
         4nYg==
X-Forwarded-Encrypted: i=1; AKwUvByJj6lK4oebK3AoB0rc93a1Agwhr33GMJlDAzV3D6Xcao2lIFQDeKBVEqzwIEyX6HyvCIjBSlRRgYHT@vger.kernel.org
X-Gm-Message-State: AFq9FYK4t2gD3sGGcu5dRkMW5VtHdbNqvd5w41nZ8I/CqbpLkiFi866X
	tYne6ps3PSBSoYCF+ncIeDmtx9EeLgyshk3kXfM3T8BCJk0Ed6JPFQQHy/l8C3V4ZbNuGsODVE5
	crR1UIElD9OVAO5fuCMLTx4yQl4IJ9MVxDA97ayiVZG3mPEz8yE/T3bVvlcHWdObl
X-Gm-Gg: AYBFou1+EcnZkVRg3iNygrdDtodTAzLBbDc/hh8bWrVyB38VkraLUtHeFSlT8GsoPiy
	5AXR1+0PJZUeKcVxKCzQqypd+G+C3f+WNwt92epUD0zpGE3HpwSyEMEewvKpUUryEve5PrdsneL
	OGRbuk7mGw89o2mcZkyX9OmKTwvccOc/C0tL6cjJCRPjs0NNIxg+fLKGCL7xpAnQGxLQpInRfO6
	B5IkWr7HR9QnoL+Mj1mvU6a+3eJDsKNfHsXSIvRRog5sVYO9+k9SnWn7JWSRVint1mZvv1X3SqP
	/mCZOJUZjE+cy4kQaZndYmhbIO8my24LiPT4xA2bc54rjd16YKRX/sgYa5YzXe84WKc3R77Sfr1
	A5eFLJGbXQrUhDFR4/px2hYkHHGFSq5P/UC/2dumteul78D7NwR5mq8WO1u7Z5a9yfiiztBYUTF
	oqwOIzvFui02ggofia/U2yeg==
X-Received: by 2002:a05:7022:4086:b0:148:bce6:429b with SMTP id a92af1059eb24-182570ecb45mr2107081c88.8.1792120920432;
        Thu, 15 Oct 2026 20:22:00 -0700 (PDT)
X-Received: by 2002:a05:7022:4086:b0:148:bce6:429b with SMTP id a92af1059eb24-182570ecb45mr2106951c88.8.1792120918037;
        Thu, 15 Oct 2026 20:21:58 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:21:57 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:39 +0530
Subject: [PATCH ath-next v2 02/17] wifi: ath12k: Refactor PCI operations
 and MSI config structure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-2-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX/cKA84A2yPTs
 tbPNX5aZikJxEY4WkGwkEiMt6aFZKtwPLqcXpua1l8zQvbp7YnknVIjip9OMS+It/ArvVLSrk4J
 zfKQrJpbN3+q6OgiiH8jearHXj9/CPU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX+EHsmgmv2Swo
 6cCceHUDRUfHMQsWiVZ2vIrAYRIA8iWf+aFzlIp5s5kturtWIAgOtHcPsY4TyAmiYfIRf4cnH0X
 pj1Zm9VFs1exdwbMCJsYcao00mYBiJ/Z7mZTyBxGWauoP7ZgrOTVZzcK13f5VoVrZnhVA+Z6IZc
 FfRHPXc8GaS8L3yrKCItSBCd17P3+S6kvSw/WPTup9tomQ60fLyRn+Q+/ZS3ykxZGYe+ITbqnQG
 z8oK7WzK8IjB2H2ob7ZXKJXl/46IZRSbEMG5tsVV3tFtvG93rwff5jOTJoZ3E31G+543dkk9Rqe
 Uxiqb/sT1O6IhGBvk395YuY/6bJurYPuOL5GgmQpoUcp65Ib9tPp4bZhLCmRN8GZWT/sNOwaRMw
 3+Kfy4gQ/mhxj6Yp+q/va8SGCRrPz8GcRwzNAKG0ovUaPXoNxYQGQQzrsEmP/hQPheiNLOOGk5b
 lhKl4g2FFMmHZ9fu7pA==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad19859 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sjiMKtK8422EckOCV0QA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: dAptCd3YUxg1MYxMcUUpHSEVq-692rHC
X-Proofpoint-GUID: dAptCd3YUxg1MYxMcUUpHSEVq-692rHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor,
but it is registered as a platform (AHB) device. It uses AHB APIs
for probe and boot, while relying on PCI APIs for device setup and
register access.

To leverage the PCI API usage in QCN6432, refactor the existing PCI
operations and MSI configuration structures.

Move ATH12K_PCI_IRQ_CE0_OFFSET to ce.h from pci.c and ahb.h and rename
it to ATH12K_MSI_IRQ_CE0_OFFSET.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.h       |  1 -
 drivers/net/wireless/ath/ath12k/ce.h        |  2 +
 drivers/net/wireless/ath/ath12k/core.h      |  9 +++++
 drivers/net/wireless/ath/ath12k/pci.c       | 60 +++++++++++++----------------
 drivers/net/wireless/ath/ath12k/pci.h       | 18 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/pci.c |  9 ++---
 6 files changed, 56 insertions(+), 43 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index 46a4420d41bd..ecc4054f8742 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -17,7 +17,6 @@
 #define ATH12K_AHB_SMP2P_SMEM_SEQ_NO		GENMASK(31, 16)
 #define ATH12K_AHB_SMP2P_SMEM_VALUE_MASK	0xFFFFFFFF
 #define ATH12K_PCI_CE_WAKE_IRQ			2
-#define ATH12K_PCI_IRQ_CE0_OFFSET		3
 #define ATH12K_ROOTPD_READY_TIMEOUT		(5 * HZ)
 #define ATH12K_RPROC_AFTER_POWERUP		QCOM_SSR_AFTER_POWERUP
 #define ATH12K_AHB_FW_PREFIX			"q6_fw"
diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index 009cddf2d68d..cd913a885470 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -9,6 +9,8 @@
 
 #define CE_COUNT_MAX 16
 
+#define ATH12K_MSI_IRQ_CE0_OFFSET	3
+
 /* Byte swap data words */
 #define CE_ATTR_BYTE_SWAP_DATA 2
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 99d71dab7c04..993aa3f350aa 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -186,6 +186,10 @@ enum ath12k_smbios_cc_type {
 	ATH12K_SMBIOS_CC_WW = 2,
 };
 
+enum ath12k_msi_supported_hw {
+	ATH12K_MSI_CONFIG_PCI,
+};
+
 struct ath12k_smbios_bdf {
 	struct dmi_header hdr;
 	u8 features_disabled;
@@ -1152,6 +1156,11 @@ struct ath12k_base {
 	struct rhashtable *rhead_sta_addr;
 	struct rhashtable_params rhash_sta_addr_param;
 
+	struct {
+		const struct ath12k_msi_config *config;
+		u32 ep_base_data;
+	} msi;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 12bbb75570f1..736e40492b41 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -22,14 +22,6 @@
 #define ATH12K_PCI_BAR_NUM		0
 #define ATH12K_PCI_DMA_MASK		36
 
-#define ATH12K_PCI_IRQ_CE0_OFFSET		3
-
-#define WINDOW_ENABLE_BIT		0x40000000
-#define WINDOW_VALUE_MASK		GENMASK(24, 19)
-#define WINDOW_START			0x80000
-#define WINDOW_RANGE_MASK		GENMASK(18, 0)
-#define WINDOW_STATIC_MASK		GENMASK(31, 6)
-
 /* BAR0 + 4k is always accessible, and no
  * need to force wakeup.
  * 4K - 32 = 0xFE0
@@ -313,7 +305,7 @@ static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
 	ath12k_mhi_set_mhictrl_reset(ab);
 }
 
-static void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
+void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
 {
 	int i, irq_idx;
 
@@ -321,12 +313,12 @@ static void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 
-		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
+		irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + i;
 		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
 	}
 }
 
-static void ath12k_pci_free_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
+void ath12k_pci_free_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
 {
 	int i, j;
 
@@ -358,7 +350,7 @@ static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
 	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
 		return;
 
-	irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + ce_id;
+	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
 	enable_irq(ab->irq_num[irq_idx]);
 }
 
@@ -373,7 +365,7 @@ static void ath12k_pci_ce_irq_disable(struct ath12k_base *ab, u16 ce_id)
 	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
 		return;
 
-	irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + ce_id;
+	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
 	disable_irq_nosync(ab->irq_num[irq_idx]);
 }
 
@@ -390,7 +382,7 @@ static void ath12k_pci_ce_irqs_disable(struct ath12k_base *ab)
 	}
 }
 
-static void ath12k_pci_sync_ce_irqs(struct ath12k_base *ab)
+void ath12k_pci_sync_ce_irqs(struct ath12k_base *ab)
 {
 	int i;
 	int irq_idx;
@@ -399,15 +391,15 @@ static void ath12k_pci_sync_ce_irqs(struct ath12k_base *ab)
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 
-		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
+		irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + i;
 		synchronize_irq(ab->irq_num[irq_idx]);
 	}
 }
 
-static void ath12k_pci_ce_workqueue(struct work_struct *work)
+void ath12k_pci_ce_workqueue(struct work_struct *work)
 {
 	struct ath12k_ce_pipe *ce_pipe = from_work(ce_pipe, work, intr_wq);
-	int irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
+	int irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
 
 	ath12k_ce_per_engine_service(ce_pipe->ab, ce_pipe->pipe_num);
 
@@ -418,7 +410,7 @@ static irqreturn_t ath12k_pci_ce_interrupt_handler(int irq, void *arg)
 {
 	struct ath12k_ce_pipe *ce_pipe = arg;
 	struct ath12k_base *ab = ce_pipe->ab;
-	int irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
+	int irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
 
 	if (!test_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
 		return IRQ_HANDLED;
@@ -520,7 +512,7 @@ static int ath12k_pci_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 	return work_done;
 }
 
-static irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg)
+irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg)
 {
 	struct ath12k_ext_irq_grp *irq_grp = arg;
 	struct ath12k_base *ab = irq_grp->ab;
@@ -551,7 +543,7 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 	bool threaded_napi = false;
 	int irq;
 
-	base_idx = ATH12K_PCI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
+	base_idx = ATH12K_MSI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
 	ret = ath12k_pci_get_user_msi_assignment(ab, "DP",
 						 &num_vectors,
 						 &user_base_data,
@@ -666,7 +658,7 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
 		irq = ath12k_pci_get_msi_irq(ab->dev, msi_data);
 		ce_pipe = &ab->ce.ce_pipe[i];
 
-		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
+		irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + i;
 
 		INIT_WORK(&ce_pipe->intr_wq, ath12k_pci_ce_workqueue);
 
@@ -718,7 +710,7 @@ static void ath12k_pci_init_qmi_ce_config(struct ath12k_base *ab)
 	}
 }
 
-static void ath12k_pci_ce_irqs_enable(struct ath12k_base *ab)
+void ath12k_pci_ce_irqs_enable(struct ath12k_base *ab)
 {
 	int i;
 
@@ -759,7 +751,7 @@ static void ath12k_pci_msi_disable(struct ath12k_pci *ab_pci)
 static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 {
 	struct ath12k_base *ab = ab_pci->ab;
-	const struct ath12k_msi_config *msi_config = ab_pci->msi_config;
+	const struct ath12k_msi_config *msi_config = ab->msi.config;
 	struct msi_desc *msi_desc;
 	int num_vectors;
 	int ret;
@@ -782,7 +774,7 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 			goto reset_msi_config;
 		}
 		clear_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
-		ab_pci->msi_config = &msi_config_one_msi;
+		ab->msi.config = &msi_config_one_msi;
 		ab_pci->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 		ath12k_dbg(ab, ATH12K_DBG_PCI, "request MSI one vector\n");
 	}
@@ -798,11 +790,11 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 		goto free_msi_vector;
 	}
 
-	ab_pci->msi_ep_base_data = msi_desc->msg.data;
+	ab->msi.ep_base_data = msi_desc->msg.data;
 	if (msi_desc->pci.msi_attrib.is_64)
 		set_bit(ATH12K_PCI_FLAG_IS_MSI_64, &ab_pci->flags);
 
-	ath12k_dbg(ab, ATH12K_DBG_PCI, "msi base data is %d\n", ab_pci->msi_ep_base_data);
+	ath12k_dbg(ab, ATH12K_DBG_PCI, "msi base data is %u\n", ab->msi.ep_base_data);
 
 	return 0;
 
@@ -820,6 +812,7 @@ static void ath12k_pci_msi_free(struct ath12k_pci *ab_pci)
 
 static int ath12k_pci_config_msi_data(struct ath12k_pci *ab_pci)
 {
+	struct ath12k_base *ab = ab_pci->ab;
 	struct msi_desc *msi_desc;
 
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
@@ -829,10 +822,10 @@ static int ath12k_pci_config_msi_data(struct ath12k_pci *ab_pci)
 		return -EINVAL;
 	}
 
-	ab_pci->msi_ep_base_data = msi_desc->msg.data;
+	ab->msi.ep_base_data = msi_desc->msg.data;
 
-	ath12k_dbg(ab_pci->ab, ATH12K_DBG_PCI, "pci after request_irq msi_ep_base_data %d\n",
-		   ab_pci->msi_ep_base_data);
+	ath12k_dbg(ab, ATH12K_DBG_PCI, "pci after request_irq msi_ep_base_data %u\n",
+		   ab->msi.ep_base_data);
 
 	return 0;
 }
@@ -955,7 +948,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 						   PCI_EXP_LNKCTL_ASPMC);
 }
 
-static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
+void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
 {
 	int i;
 
@@ -969,7 +962,7 @@ static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
 	}
 }
 
-static void ath12k_pci_ce_irq_disable_sync(struct ath12k_base *ab)
+void ath12k_pci_ce_irq_disable_sync(struct ath12k_base *ab)
 {
 	ath12k_pci_ce_irqs_disable(ab);
 	ath12k_pci_sync_ce_irqs(ab);
@@ -1030,15 +1023,14 @@ int ath12k_pci_get_user_msi_assignment(struct ath12k_base *ab, char *user_name,
 				       int *num_vectors, u32 *user_base_data,
 				       u32 *base_vector)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
-	const struct ath12k_msi_config *msi_config = ab_pci->msi_config;
+	const struct ath12k_msi_config *msi_config = ab->msi.config;
 	int idx;
 
 	for (idx = 0; idx < msi_config->total_users; idx++) {
 		if (strcmp(user_name, msi_config->users[idx].name) == 0) {
 			*num_vectors = msi_config->users[idx].num_vectors;
 			*base_vector =  msi_config->users[idx].base_vector;
-			*user_base_data = *base_vector + ab_pci->msi_ep_base_data;
+			*user_base_data = *base_vector + ab->msi.ep_base_data;
 
 			ath12k_dbg(ab, ATH12K_DBG_PCI,
 				   "Assign MSI to user: %s, num_vectors: %d, user_base_data: %u, base_vector: %u\n",
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 0e0e2020c6ae..47c8760536e4 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -76,6 +76,14 @@
 #define QRTR_PCI_DOMAIN_NR_MASK		GENMASK(7, 4)
 #define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(3, 0)
 
+#define WINDOW_ENABLE_BIT		0x40000000
+#define WINDOW_REG_ADDRESS		0x310c
+#define WINDOW_REG_ADDRESS_QCC2072	0x3278
+#define WINDOW_VALUE_MASK		GENMASK(24, 19)
+#define WINDOW_START			0x80000
+#define WINDOW_RANGE_MASK		GENMASK(18, 0)
+#define WINDOW_STATIC_MASK		GENMASK(31, 6)
+
 struct ath12k_msi_user {
 	const char *name;
 	int num_vectors;
@@ -116,9 +124,7 @@ struct ath12k_pci {
 	struct ath12k_base *ab;
 	u16 dev_id;
 	char amss_path[100];
-	u32 msi_ep_base_data;
 	struct mhi_controller *mhi_ctrl;
-	const struct ath12k_msi_config *msi_config;
 	unsigned long mhi_state;
 	enum mhi_callback mhi_pre_cb;
 	u32 register_window;
@@ -177,4 +183,12 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend);
 int ath12k_pci_register_driver(const enum ath12k_device_family device_id,
 			       struct ath12k_pci_driver *driver);
 void ath12k_pci_unregister_driver(const enum ath12k_device_family device_id);
+irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg);
+void ath12k_pci_ce_irq_disable_sync(struct ath12k_base *ab);
+void ath12k_pci_ce_irqs_enable(struct ath12k_base *ab);
+void ath12k_pci_sync_ce_irqs(struct ath12k_base *ab);
+void ath12k_pci_cancel_workqueue(struct ath12k_base *ab);
+void ath12k_pci_ce_workqueue(struct work_struct *work);
+void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce);
+void ath12k_pci_free_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp);
 #endif /* ATH12K_PCI_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index 6c96b52dec13..bb617bb6b71a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -28,9 +28,6 @@
 #define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(11, 8)
 #define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 4)
 
-#define WINDOW_REG_ADDRESS		0x310c
-#define WINDOW_REG_ADDRESS_QCC2072	0x3278
-
 static const struct pci_device_id ath12k_wifi7_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCN9274_DEVICE_ID) },
 	{ PCI_VDEVICE(QCOM, WCN7850_DEVICE_ID) },
@@ -106,7 +103,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 
 	switch (pci_dev->device) {
 	case QCN9274_DEVICE_ID:
-		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
+		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = true;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
 		/*
@@ -133,7 +130,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case WCN7850_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
+		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		/*
@@ -157,7 +154,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case QCC2072_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
+		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS_QCC2072;

-- 
2.34.1

