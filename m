Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316248;
	b=DLq38jniyrCNdoVRLqTPR6SMoEgAkq39f8Oqjj2Do751m6MCdIoqeBLdncck/z2vl9FR
	 PrvduPD/hwm8z9ADfEKiMFOaqgqSZgmoz96BkN4izNWsERjA1IoEqiRf8RwBr1bwYHtp+
	 EkG4oRjLuz/hL9TJlepEttyGCCM05/7BX8iY3nNf/I9JEYt00GF0UryYuuDwMPqr8B1Ys
	 tQPAGnKjojWhGCfnINT+tFcAKmQ94EOtLc7LlQxWnvBCdI8dtUmMxC3konBrDZpKrKpWJ
	 bL2KxfCHeNoGto6FKhO7YSJ8OKg3TUf4YVZ/CWq0HB0a3DCronXPR8HRJJcL6mJy1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
	b=WowMd6pAtnttFPzg4Htope3WqTrC/7JWcYpzCnww35bUAz2nfGTPvDBUXYObofVJpm7j
	 Ul32OB4+aNftZWdA13xZUhPQHwRfFgUbflbPv8mPDatuMf7osWqSYEQsYb8ZPMUsX8WeT
	 jUMC7knNlW4YY07kKmRWeNca3f996r7vyr1zuga4vTlgcsWPhITSFAVK9zakOSxtOJ9F9
	 +SB/U2C1Zx+jvVEaPA4Oh4f1xzwej96NWxlmoLGr+ofJzCSa5A9zaFUro6g4slKT8GihC
	 K87wN+/r5P3eS4Oio63VLT/Anc41kZnHWmMh2Eud0vWXpG3TCy/YSKsstRoRAftZWHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6b0b8HD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YuSSEaGc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32AA606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32AA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6b0b8HD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YuSSEaGc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM09KH51036075
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=; b=M6b0b8HD2sPhLeBY
	jXuvp/a/qLxkQ7r5of+7u2ADjaAfbj2b4xwIWqrZ3WpqxtYRwIqQpZuEgBKfcTqf
	uSm5ixUGONwINRwBWAlMJXiXN2BYbwnXLu8+ULDJiejyBkmT8Op2IS7IjD6wBL6/
	oosyd57rRVkf9FUpZSWsfP87yoMQRd8/lPA8hTQau5RLob7TvJ3wjb0ATmrES4gO
	x5eUYBeVST8xAphouK3defcfQts34woq5TEuws+WIC7ri7+fisjY0cUcPGEG2BcJ
	ePpQW9siruXVVnkOW3a4a/21haYCET1Q9SlrsoF/LDvddxOf8ImD7TaEw+NNRiYc
	0Zeblw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka2cvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3056810eec.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316247; x=1795921047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
        b=YuSSEaGcZjzCG/lVsqMxGIZ2b6l1iga5FOR1KB5kAycWuP6aPt/niKPz2akfiDeU8K
         XJIM/4WI9xyCZm155s6iZe/XhAFcmMIVgaXrjH1sZDaC7RHu13guAf1de+E2u4sD1E7p
         kkHgVKCmXAn2z+foBcEXv9aCLOH8NhBJFcIwo/FDy7Ww35AO+wtHj4S7I1vb/bEVnb0k
         mnZHMVsbKOHMP1NUew03IaAMRZ05/1kYh1V6KavoxnFX/sd6NEbeZF+hslNCGeXgO4jg
         +0eRsp1C6b0BdhoiKJmH3FieGLs1EDMdk/fFP3BVmLUNDyhESzUSY30HE1jmVQZ9kgst
         N/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316247; x=1795921047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
        b=xaQfBaxbBYsPpH8jMtrgv91jBCnDdJIohl1gt41e4SDbStz1L7jsifk+dyn2WigOw6
         P4UjNhb4aLly5n0u2cfsEDH/VIHDy2V/eBLHJoBWTddx0S26UwCgNKNNdZqxsTE1Yp/9
         c7WfkAW3abBmB0GxeNmw2eXFvDGsaS4Hl7iXANsYRvIWKZU/H89ozVNfrq4OxI6738Hd
         c9V0BcpGihZ9Y9rL7VVPPbzLyo6fKvAUElQ+jW4KHstSCr4BTHo9IalXZI+h/Pbh7VpT
         iJPOrNqUvvSRhthPMnlyI+I6zJoudFJOWH+Wy1K7Bs9B87ITS+BXbXEVz6lWFHqaQztu
         uKfA==
X-Forwarded-Encrypted: i=1; AL+hErGNp35COecyGeMqSdjZtpR9VezP4emCtiDvtgoqaKYtNOlwMD76UZWx1ze12JPpV8wHMFM2UVWxf5c/@vger.kernel.org
X-Gm-Message-State: APuU4Z/+xgfTdye8lexn40rd9rHPyanpj7WKUHXadTl94RQx5J4d9Jo6
	K5fX4Hs7n0tHyNW2PL4kMJqt/FWIXcJ1/vjANNyJGz9pbeN5VwltHjBLAojgPZSVLglF9lD1RaQ
	X4jcxNPFrTEwZY5k6yU/BSJw6WrKuKk/Se03SdNvEELuZrllEVd5IIyE7jsxqgDae
X-Gm-Gg: AZFdTZcPagapr8lNd38XrgminSUBB0s+r6ZxOwZPNIrs9rDCXW80+UIujEO3v+3HQya
	BWJI/X4P/lX9m5B2tqy7GkOg2pnsuCOTkAhBuog6B3uO12JncXyGte3gFrLjQgPpuov1OUYUkpS
	pB1WTrwNswFIAnsCspQQog5DwkIoXETeVZPfN+5RL2kjbikdZCZtsEipXWkY92K55t0cLQ1Mnoi
	Aho2OLXNA8tO8+p7VID41ACA8JrairJ8irzsCvAQl9gCa8lIYKPv2o6CuekqPrr26Kk8RPB6hY5
	4mPmA3znWj6oBNfDtOXK/iRQHjmhd8eNEMEHSpBPQPiibl4rdM8KTu8g5Ak7Ianfp+hZOdrhNnr
	kU7t/6w05rASmU4NNcdz28BQc+hbKxN+YMqkHVW43uwvDf7T94YUgmBGinEeRUAODw+VzBH5ZVQ
	vfAg3RfB8j
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr9002381eec.33.1795316246558;
        Sat, 21 Nov 2026 18:57:26 -0800 (PST)
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr9002360eec.33.1795316246085;
        Sat, 21 Nov 2026 18:57:26 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:25 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:21 +0530
Subject: [PATCH 08/11] PCI: qcom-ep: Add Nord PCIe Endpoint controller
 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-nord_ep-v1-8-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=2371;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8c0qizR+vJDbUelP4aajkaF2bPuI5eYuJiK1wGZgORg=;
 b=eL5h/o95qzrBD5KJbEm5L9/kOS4P75awELLFLbJl7PPCl/p6djtY0NQoswJCEy282rRHN84Rr
 loGzYvTNdqeDDKu6YWBkPsCtU/wYJPe9jTxYfL8UmXHrmhT875SEVdd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX9Eoj1IqDAsrP
 kWzENfAtGZcxtJ/v+qaL5eNW/goEWIRlbN0t8ogMDso1vnnhMa1etY6Xm/IjcpuwecYUPsTej0r
 tUb39gBvgfub+g1HiVRqIv4kbAoUHDstGqnUmfr6getalYH8zaTo9SaRie5kKLiI//RhlmRqaOe
 KD/5BNMWq6In4w1AFnwpr9JHklvV1jsasLL4vW2WGyw0xuJkoP9nbFTscIQUMBDua1GESJX9gjw
 AZzAhzuvzKAqUS7h3EvCMa9fbdsH4E3gi7GwHLQpsm4qrbbdTqJ+6jcR1ftD8DVaW2UuC6npHA5
 VcRRPIue4DIA3KZPzQrE3v+CUJ3PaDn60UjN97k5F2gfWjglqVg0au28Aj+jvTd6UiWp+c2IkCJ
 ePuLZVlvPvyb0wCNM6O9gLlH2zR+/8TcntJ/X06DEzBnYkDwEccJTQscNZ59FA+R4Cvo7Li/sEe
 w4Jp4zs/9uPUSMfljkw==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b025a17 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=v3XsYOnbjY9NYLbxQCcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: HqZ7pfbauxc4P_mcBPb6oWT1MhPFcmYN
X-Proofpoint-ORIG-GUID: HqZ7pfbauxc4P_mcBPb6oWT1MhPFcmYN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX/nOosiGLVpVL
 2tIi5pO5K2s1hA06rBmxEz3dHlUtFzyi/23A7EPDTKdfaCaD+nYezd4T0FYCpc6kd6aFJmJnddA
 +ILFM2V0Z3zKM2cD6Tx4vLa8nG9c5uE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

Add support for the PCIe Endpoint controller found on the Nord platform
via the qcom,nord-pcie-ep compatible. It supports HDMA, overrides the
NO_SNOOP attribute and disables the MHI RAM parity check, and is MSI-X
capable.

The Nord HDMA block spaces its per-channel register blocks 4K apart
instead of the dw-edma 256-byte default, so program edma.ch_space_sz
from the SoC config.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index c794a2207df2..661bd8aac7cc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -171,6 +171,8 @@ enum qcom_pcie_ep_link_status {
  * @disable_mhi_ram_parity_check: Disable MHI RAM data parity error check
  * @firmware_managed: Set if the controller is firmware managed
  * @msix_capable: Set if the controller supports MSI-X
+ * @ch_space_sz: HDMA per-channel register space size in bytes. 0 selects the
+ *               dw-edma default (256).
  */
 struct qcom_pcie_ep_cfg {
 	bool hdma_support;
@@ -178,6 +180,7 @@ struct qcom_pcie_ep_cfg {
 	bool disable_mhi_ram_parity_check;
 	bool firmware_managed;
 	bool msix_capable;
+	u32 ch_space_sz;
 };
 
 /**
@@ -903,6 +906,7 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 		pcie_ep->pci.edma.ll_wr_cnt = 8;
 		pcie_ep->pci.edma.ll_rd_cnt = 8;
 		pcie_ep->pci.edma.mf = EDMA_MF_HDMA_NATIVE;
+		pcie_ep->pci.edma.ch_space_sz = pcie_ep->cfg->ch_space_sz;
 	}
 
 	platform_set_drvdata(pdev, pcie_ep);
@@ -984,7 +988,16 @@ static const struct qcom_pcie_ep_cfg cfg_1_34_0_fw_managed = {
 	.firmware_managed = true,
 };
 
+static const struct qcom_pcie_ep_cfg cfg_nord = {
+	.hdma_support = true,
+	.override_no_snoop = true,
+	.disable_mhi_ram_parity_check = true,
+	.msix_capable = true,
+	.ch_space_sz = SZ_4K,
+};
+
 static const struct of_device_id qcom_pcie_ep_match[] = {
+	{ .compatible = "qcom,nord-pcie-ep", .data = &cfg_nord},
 	{ .compatible = "qcom,sa8255p-pcie-ep", .data = &cfg_1_34_0_fw_managed},
 	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },

-- 
2.34.1

