Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977345;
	b=ikDbvD1+0veaHSjq98dWcpFXa+eoThr5UWVjeVnBO7tQjg9hbrLX2dBLj1r7Lolo+239
	 X6WNndwOind04RpG0I3RQDQD2b+9daDGxY+1bXHQOg0d/vNaojHSurkSmhaDKsrGk0rcf
	 5ZHurtHZ5C6/LaGK1kveukyTE+Nv0yKZINjOJyhMYyQATMrA4XnwqDD1U7tnjUoKdOq1Q
	 whIDD14Gyk+VN5QzLCNHHlzg5TfeKbcNY8yAXByiNG/37MYy9f1/gmgnKU1eODxMOd13+
	 LFKAwX0rWwBqkfwiCQwX2CYzVvAisxtzBGHrCfSd8yD0n08Xl0Tw/uKDpxuO/mdb/hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=99GhaTNH5mb9xE9J4JWzIgUnSd5N1QJXdiYFGKhRYFY=;
	b=RsPONExH4+rDmxM4x+ZqlWo5FEuDfaOo9u/huihjkWqmr0bhPxkvatsN9VK2jDVv1q3Z
	 NVoLb0upzEQkZwKAEehNnFaSHKO/wSrJFw0Ezc8gddCHiZyTmHQh+W4fNWumrO5fzHP4C
	 CrEweeQtb+08Q6I0gilXBk5KIHtaorquO+YzNvZ1QGA13zXyInYdGnj5ocVlSYCwgJTwE
	 mKUUqP4ap7ngyiNwsri92jONzkIoKp5rItwWnm+mb/sRRXMTdgFvfxdl9BOGIWMa/j/PT
	 tipWgIDsPWL353UpgOeeTTZd4E+s786fgzRdklF62g8EI+vv1FUC9bf4Iw1Cb499W5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpQsVZ5L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c2m/3BbZ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3B606EE95
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF3B606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpQsVZ5L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c2m/3BbZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExwiQ1121583
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 15:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99GhaTNH5mb9xE9J4JWzIgUnSd5N1QJXdiYFGKhRYFY=; b=PpQsVZ5LfHyljO2n
	B8PBSeI3SP7QWydxoXexEgZECre951XwZcx5mNOiKqOXDDcjy6XXaos+tadoWUic
	0YF/0fO1FmCEgi9BpVJ7UpiQBcEsqEvoKIv1V1Dt7+eI74uGv08w928CIwMPwisg
	QArspzJZcbJVY+QgUmsZox1RD6oxO6QZGtwHfhJytBI0rnE7JQxMWkyFNIe1Aikg
	txbStzwfaEpY+YqWJrCNIIQIn/LTeYzlws3X5zUcppT+vdck+A3Phc4A9rz3leJ3
	gjQGEAI6NamhFczGbbp4TTk0CodjeNAryoXmd0vIPXMPX2PN6XE58tGPefAtPR64
	0t6VQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u90p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 15:02:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1234858a91.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977344; x=1794582144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99GhaTNH5mb9xE9J4JWzIgUnSd5N1QJXdiYFGKhRYFY=;
        b=c2m/3BbZB6KMf6j3kJ4jJ4FDXd+F2hsCdF7lFfJZN9oXsPszJ9sLTZrc+aA2RDmbzS
         U7nVwrLBjbsgBGmKkK0TBxHxfC5sB9zIPH2mp0c1lxZnAE0OXGsCV9s/Du/Cb3O+iENN
         a6cyCuwogda5laBrW8O2hWbTYlvWgJVPujBqkKqElYvv6V3A/OwG5jIhoaOJS+dsAWME
         9mP+4Bw0aCEYeeWaRHMCSsL+6CYajqZNvrYvNDqu/DvuMWR+jCTCZGSs38E7jjzjJoKW
         xfGdK9CWl/JgCpSiuSvNtDnMjtCEF8jveaymTLG/sBO/CoOqMY7/bD1lhCdve//MTgLL
         kdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977344; x=1794582144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99GhaTNH5mb9xE9J4JWzIgUnSd5N1QJXdiYFGKhRYFY=;
        b=1tom9evlU/986MkJXUftahgQwl1QVIEHqiN8z5MPZPoE0WLoDoGHyEJ6bhKzWqxpUL
         MOuWLQjYnqxt2FbaAx08E9iJ7mTN/7HTeseWBeqR6W7pON2JdN6upmkn5tbtDV5T4zRt
         ZiT/e2rgzUmvup+EGorUgZ4aoqYmrHUpOKgNsf8xMrRTrgajxc7kZOeYmsBoqKE46jyX
         8F/n+0Z8vGO6fddJIwAjxbgwSQhnJA8X347eD1Bdwoa09/jj/bJ+5vuWw9UVxc4IdeEE
         nMsI4mk4qK1JVCiBjOKj46+YJttO8+HuSRyGgjr7fso2OniGNP3GxrDV2c/VMFoGiG9v
         qdOQ==
X-Forwarded-Encrypted: i=1; AL+hErFdHnmmn6ViLMOhwccAsuvoOY2YiAS13tY74Js3hVOg3vC+L0n0Zd1kfb9/Jc5Ub7dpOnl036Xzw+RU@vger.kernel.org
X-Gm-Message-State: APuU4Z90OyTM/2MxmSmn+31wyPll/BkXy6HOdgk26uVb6akDCCjf8xXM
	YOOU5+6Akj0Y/ufDiNqFSPeJCWBqH2K+cWEm4sInoA9UhwbXF/uenqsE01NxuzrxHJKXfhmiEWN
	dWtdSoEB9AJtlNJdjYiwJy5rKbI6gTTn/ZIKwZs006DlUOTpidIzarbrOcin4p6gX
X-Gm-Gg: AYBFou0hHDHZ51RHUKyxNN44B0m3LKsTFiG2zRvV3+rNvRkudc638UJo1zj6ellzMqJ
	cHC8X/ym6j5z2uaY9+zLQeJfFoz7oobSLDQgyCPhGhi73YQT2z6tKpHz0BQDJFgDykD58BVReOv
	zKZYCLctfkkFdeAQdydI8yWxr4+yCnmRAA3e+N7nSr01JDzGpiPnJm5Xqo7zjRZnvzdrF7YYMcf
	7BiUiSVrMRrTdvAS296JpgflEezqw6gDVsPUWJLM8Z9/UXC51OmxaH551m9wVLPFJh4H1eoTTpT
	lt6fR++NFr2QlniVpOePimpK5Xiczg1uUz4TyZZOFA8fzWqMm3vMGVJfIMEH0noEIiHEQKUnBBg
	DeSkAx/UBIga3DvFkUx0GQX93ZgsNnvRuh5Cv3I2ZWwnywNqyg3N8haIadajT5ezye6p90LICpO
	3W03HYZqMR
X-Received: by 2002:a17:90b:1642:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b0db6d6e03mr2861067a91.30.1793977343810;
        Fri, 06 Nov 2026 07:02:23 -0800 (PST)
X-Received: by 2002:a17:90b:1642:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b0db6d6e03mr2861014a91.30.1793977343194;
        Fri, 06 Nov 2026 07:02:23 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:22 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:23 +0530
Subject: [PATCH 5/6] dmaengine: qcom: gpi: Add QSPI protocol support
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
Message-Id: <20261106-qspi_upstream_series-v1-5-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=5767;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=DU/0jG2VsMzJIcwjBy6FqxX/qcBvTcCraw1OReUmll4=;
 b=rJ/9kkVw20vLRULI1yFVmo5VxruTh4sAL4u3bITIWG4T1/lZbTVomTOkN+copafILcYhGGGCn
 DQI3jNFgoTeCFHUl57qrFQG/WpRtyrkkr4Xng7kDRgfrGE1IXO5RNjb
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX0O5qZQyZxaQw
 7UMkH44e81gMjpx0nq0LkmJZqsCTGFTDRpP3gygqZNYSgRgDah28PJTLXjXGz5qUchkeV3a2uMw
 76jQW3ZoL1XguaduMoehbonQeEk+ugE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX26F30T90VDkL
 EYQ1hy0kXEaCq5itsXH8hWJa5MFwyxA+aYsKgtkAtL5Osvm0X9Pvp6IbeliWtrPGH0OuFR41iBJ
 N7dXmdnfi3b2HCKsifSsdrBMmls0a6zZpXzlwdhXacjuSbRSFwtFSPxX1nupioUuF+PUQffgYXp
 S4/0b77yUlae9POVACPnS7EOrFgZ//2uQ8mujdBRUU3YJNLlMlUIpsCi5nJRKuneEci5a6GGxSA
 bqqnWeX1SBLuYTAom+mc9gSI/4UQ3Vku+Ui1MfVPUfapwE+j5ukfNyww3jty1LTQ5WViQ95/i6b
 np6n++a/GP46UjajIrytmMenxr6QM/FGb+kegs2naQ7FVnqBAy5a/122FluoVUksDFIIbb5Hxda
 DDl5Hmr0nuW7rSKrKvPPSan58DVr6B2R9rvrjSiMUXA4neQCUiGEuvqwrZWPGhSXpQIJ4ErCfh5
 WsRG1SN186c1FIMMz5Q==
X-Proofpoint-ORIG-GUID: 6rGnwrXFSBcGoohi3CUq_EAmMmlqMR51
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedec00 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ygj2nM-Zz2zQjpz6_bQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6rGnwrXFSBcGoohi3CUq_EAmMmlqMR51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

QSPI reuses the SPI TRE format but requires protocol-specific handling
for GO TRE fragmentation, transfer mode selection and dummy cycles.

Add QCOM_GPI_QSPI support to the SPI TRE generation path and extend
gpi_spi_config with QSPI transfer mode and dummy-cycle parameters.
Encode dummy cycles in CONFIG0 and select the appropriate GO TRE
format based on the channel protocol, enabling single, dual and quad
SDR transfers while preserving the existing SPI encoding.

Also add SPI_TX_RX to the GPI DMA interface to represent sequential
TX-then-RX transactions used for QSPI read operations.

Enable RX end-of-transfer events for QSPI TX-then-RX commands so
clients can wait for both transmit and receive DMA completion.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c           | 22 ++++++++++++++++++----
 drivers/spi/spi-geni-qcom.c      |  1 -
 include/linux/dma/qcom-gpi-dma.h |  6 ++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..487e023287aa 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -36,6 +36,7 @@
 #define TRE_SPI_C0_CS		BIT(11)
 #define TRE_SPI_C0_CPHA		BIT(12)
 #define TRE_SPI_C0_CPOL		BIT(13)
+#define TRE_SPI_C0_DUMMY_CYCLES	GENMASK(21, 14)
 #define TRE_SPI_C0_TX_PACK	BIT(24)
 #define TRE_SPI_C0_RX_PACK	BIT(25)
 
@@ -48,6 +49,10 @@
 #define TRE_SPI_GO_CS		GENMASK(10, 8)
 #define TRE_SPI_GO_FRAG		BIT(26)
 
+/* QSPI GO WD0 */
+#define TRE_QSPI_GO_FRAG	BIT(22)
+#define TRE_QSPI_GO_MODE	GENMASK(31, 28)
+
 /* GO WD2 */
 #define TRE_RX_LEN		GENMASK(23, 0)
 
@@ -1719,6 +1724,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[0] |= u32_encode_bits(spi->loopback_en, TRE_SPI_C0_LOOPBACK);
 		tre->dword[0] |= u32_encode_bits(spi->clock_pol_high, TRE_SPI_C0_CPOL);
 		tre->dword[0] |= u32_encode_bits(spi->data_pol_high, TRE_SPI_C0_CPHA);
+		tre->dword[0] |= u32_encode_bits(spi->dummy_cycles, TRE_SPI_C0_DUMMY_CYCLES);
 		tre->dword[0] |= u32_encode_bits(spi->pack_en, TRE_SPI_C0_TX_PACK);
 		tre->dword[0] |= u32_encode_bits(spi->pack_en, TRE_SPI_C0_RX_PACK);
 
@@ -1736,7 +1742,12 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre = &desc->tre[tre_idx];
 		tre_idx++;
 
-		tre->dword[0] = u32_encode_bits(spi->fragmentation, TRE_SPI_GO_FRAG);
+		if (chan->protocol == QCOM_GPI_QSPI) {
+			tre->dword[0] = u32_encode_bits(spi->fragmentation, TRE_QSPI_GO_FRAG);
+			tre->dword[0] |= u32_encode_bits(spi->qspi_mode, TRE_QSPI_GO_MODE);
+		} else {
+			tre->dword[0] = u32_encode_bits(spi->fragmentation, TRE_SPI_GO_FRAG);
+		}
 		tre->dword[0] |= u32_encode_bits(spi->cs, TRE_SPI_GO_CS);
 		tre->dword[0] |= u32_encode_bits(spi->cmd, TRE_SPI_GO_CMD);
 
@@ -1750,7 +1761,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
 		} else if (spi->cmd == SPI_TX) {
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
-		} else { /* SPI_DUPLEX */
+		} else { /* SPI_DUPLEX or SPI_TX_RX */
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
 		}
@@ -1783,7 +1794,10 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
 	}
 
-	tre->dword[3] |= u32_encode_bits(direction == DMA_MEM_TO_DEV,
+	/* QSPI TX-then-RX commands need a separate RX completion event. */
+	tre->dword[3] |= u32_encode_bits(direction == DMA_MEM_TO_DEV ||
+					 (chan->protocol == QCOM_GPI_QSPI &&
+					  spi->cmd == SPI_TX_RX),
 					 TRE_FLAGS_IEOT);
 
 	for (i = 0; i < tre_idx; i++)
@@ -1841,7 +1855,7 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		return NULL;
 
 	/* create TREs for xfer */
-	if (gchan->protocol == QCOM_GPI_SPI) {
+	if (gchan->protocol == QCOM_GPI_SPI || gchan->protocol == QCOM_GPI_QSPI) {
 		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
 	} else if (gchan->protocol == QCOM_GPI_I2C) {
 		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 25c03096ee23..c2c3400b24c4 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -66,7 +66,6 @@
 /* M_CMD OP codes for SPI */
 #define SPI_TX_ONLY		1
 #define SPI_RX_ONLY		2
-#define SPI_TX_RX		7
 #define SPI_CS_ASSERT		8
 #define SPI_CS_DEASSERT		9
 #define SPI_SCK_ONLY		10
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 332be28427e4..d2d659a075f9 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -11,11 +11,13 @@
  * @SPI_TX: SPI peripheral TX command
  * @SPI_RX: SPI peripheral RX command
  * @SPI_DUPLEX: SPI peripheral Duplex command
+ * @SPI_TX_RX: SPI peripheral Tx-then-Rx command (QSPI read transactions)
  */
 enum spi_transfer_cmd {
 	SPI_TX = 1,
 	SPI_RX,
 	SPI_DUPLEX,
+	SPI_TX_RX = 7,
 };
 
 /**
@@ -33,6 +35,8 @@ enum spi_transfer_cmd {
  * @cs: chip select toggle
  * @set_config: set peripheral config
  * @rx_len: receive length for buffer
+ * @dummy_cycles: number of dummy clock cycles for a QSPI transfer
+ * @qspi_mode: QSPI bus-width/SDR-DDR mode for the GO TRE
  */
 struct gpi_spi_config {
 	u8 set_config;
@@ -43,10 +47,12 @@ struct gpi_spi_config {
 	u8 word_len;
 	u8 fragmentation;
 	u8 cs;
+	u8 dummy_cycles;
 	u32 clk_div;
 	u32 clk_src;
 	enum spi_transfer_cmd cmd;
 	u32 rx_len;
+	u16 qspi_mode;
 };
 
 enum i2c_op {

-- 
2.34.1

