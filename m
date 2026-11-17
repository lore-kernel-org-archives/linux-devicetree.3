Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905202;
	b=pICgYnHWAPnQLqCA/STeviVsb0KFnjkIJw9uCZvBgVAFEGCdKuJea42JrRJO8D9pmIhy
	 AOj9qob6L+d8XiLkqBHiTh7irRzojg+Gz83F7YV8wizlPpNIGhDyZHD4hO3VzkJdzPEaV
	 VYWDUmYEkWGP35SD5JMv5gWBLaNdtDKiiDbKciL9e4OxHDoFT+UykyZlIFW1XK0leUodX
	 P+Wr1FH8nkj9+3QOBjO/3xnMvamhNouW7hyQJukvwz6UgJngWZD41zO1peMjM4txULxbw
	 ue7s7tv4DEQU8hVhqYHXog8To6NbUJ7/ty2Xq+G+EEGYN7wYiUOf2W7Th9A9MRLebqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=;
	b=J4unoycPsTzZlF8pBlZOjkW6HBUcqXkqCCVrkhBkA9G1Yw9ykzt9QAJnV6KxQYzXGIAc
	 dVGuJZp51I6gbbzpgvcHOISPQJmTcGOjCPMw3DxtFeOilBdQwcZc49qz+R75VZTv1NeWv
	 QJhZgdt63vdgNitodaRaabcsPABL3SimyH85KUiYNLjprbz5x5KWsxby+C7PxteDu12u2
	 WD9c+Qei4Qqhm0iHhKumxqRNSDEa55GhtCYpBoIUSAGCg+IGhYp8piiG+gAhEsgbb+Vjh
	 3dxkdj7m4Pv4cv3iilmlwxf7ExEeZ8FWwZMmdXLmgUWRuTVbxtsH4/XWLsbyGXCbcZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MoqWAn3Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2HBW0Be;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7A606A882
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D7A606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MoqWAn3Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2HBW0Be
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55fnh3350053
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=; b=MoqWAn3QvKWC9nmT
	drdvHl0VZOZmUhXL1/U/pZeT7cpOSAMjzgMb32oZ27H1ofLYt4KKkK27zA8RzrgT
	pvZFRoXbjIiRjhmd7zGvMQxzlDdefNKt8iqOOdbrPzl6Q9ypixpyTH8DsTt9jfnD
	wvF794AmFllujsfiEgrm28fzl0K40iPRXPpmaPpdsX6BNax+LGxAdJWSW086GAjP
	XfTp2pSFtM9CZ4p0LwzJs1sglXMnDZoR0nugsASYz3uVH8cgNZHqgzEW0gjrSXnj
	otHXv108+AyrvlwE3dip2urA+7KRmZ2zrUHVxKBiK4luTF9xsafokUErUpmKcjWl
	cYiBxA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr0sg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so2961924a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905197; x=1795509997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=;
        b=J2HBW0BeMarLHQ1KkncouyyRi+0DWQVSvZQFH4YZAfDm9/CUdTwaFu9iX3vzSZ0Ogl
         SqjONRwB4ooafZPUBCPU2R2i3V5/ti3wRhJ3ik+UNTzzkBl6AwgaRqM6AUBMUXg7TOcl
         FNVc2huPUHQ/NJQ4fiXMFHkzQSLYPypZuJ9Gmo5UWljwRMQPrGjsTDaPqWoGBOwFjtMv
         DvJkcoQJPR65vhCkEdvTyQq3rKBmjKLtBRSIg0w0qc5BzS/7eXCfFWBeDz6yvSu9uKf4
         yFE0UOPO/ECA7HQNmjmRImQX2Qi1VdVOu/+AY0cMHEZLDIY3PYgzRPWjvs3ZWVfHUkJ1
         d9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905197; x=1795509997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=;
        b=CtvbJVC6d6AdZF2lrZulgveGxziqJy7HF43fgeEweoP+fiDGSPNqZ7b9BpPyyEtY0D
         o8v0RgI32iTTFwyTdWIAKksc7/oGaFZEBB7WJhm3Wr7NGRS6C5fnXKUnfjmuzbd7K5Sv
         Z0/Nf7L1GDyGmq7NVdJpcrh7m4g+5cFj2HOEnnP+IkxxltC5hEXbbnAS3yex2ZUreJFW
         IMRB+KZVBqYNlp3g8wGVyP277bfqlIp5X2KgUWQwKrWR0VMK1PIu7Km8EpWWWfubGkEb
         NbGBfpqFcttJGzfDtKDH+WL4GuK1crh8eQ1cbKNQEuT1e+jaLqAeCj65SVYqjBlDyCWY
         QHag==
X-Forwarded-Encrypted: i=1; AL+hErHZ2HNLcFG5ldvap6TFayOHk3KqUi+YwpSwr5XectVi8kZp6EqXR/JPGwWS74zq4h+JSekw4qlr0KFL@vger.kernel.org
X-Gm-Message-State: APuU4Z86qJTT0fvnWHtscpoirsGlMOp+GkVOdwB6YmsA1e5m2ub9uT/o
	9TvW0qwn5GPYcJtVVcZ2evS3FJc5d32WqzAveUM9QRPe8Tus3IC9vhZNJVYCJyCjtQAFKzrRxP/
	S7GDU4/17IB9fxlXCHTPu6RKeCgEboMl/viVbKhPsWrreHP4sBAXK8FHJHci3jg5J
X-Gm-Gg: AYBFou27Sd2GBxa7jwPyUY1Nd9GeB5L2Jd9/He7wUmShTzbzFI8l5JK+BG+ERGPMaQZ
	RF6DG0Db/zL+YUIQ6LiUZG0OsZxAoislMZYuaX0kM5nVu5bfHF8bhLmbYphuvEiDeltqDId4Bqk
	VtKbjWNRPkZbwLNIidgQRvUWr25mk5OgL5CV4BSGYirQFHmxeCVaDHd8yesHn96dAZULAWsjL2w
	H1VL/dFLOHiCTL5l5cktF7J85st3VjapuvRwQqq2eS3dUCwvZ5bkys4+f3oR19+bDKVNwH6BCrQ
	dE78GZNGooOKSZfP8YpJR5NqIlg5iHXWVI8rIJsz6erkUw1xsn8cAkfFfbYjTuuHskTl6U/DPgL
	jVCfyc/awjI/RvD7eaHb+EXF/JF+jYPXy1RPqoI4kfiIPfAoNEcs5IRxqWPja9YtmR5H/nVuSTy
	UREQ==
X-Received: by 2002:a05:6a21:3d86:b0:3ee:acc6:1c2c with SMTP id adf61e73a8af0-3f7a8fe248fmr9584029637.74.1794905196676;
        Tue, 17 Nov 2026 00:46:36 -0800 (PST)
X-Received: by 2002:a05:6a21:3d86:b0:3ee:acc6:1c2c with SMTP id adf61e73a8af0-3f7a8fe248fmr9584001637.74.1794905196124;
        Tue, 17 Nov 2026 00:46:36 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:35 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:25 +0530
Subject: [PATCH net-next v4 05/10] net: stmmac: qcom-ethqos: add DLL-bypass
 for PHY-managed RGMII delays
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
Message-Id: <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4950;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=AX8IqlmtWAq6HQ6/PrPn+c05+xpAnEZUkXQ4nF3LiBM=;
 b=AJhNItooMl9eFcgP3TOPclVIuGNnQWG9k99zuECq6pbAQBDkgBbYaNiWH7AjWZxUbFpRFCcjR
 tTtLBl/Fue5CfSXNNvRX+1WWUwBq7wfQ1dNRGEvcPnAOkWvv+cm/pX8
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc146d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: wVYDBDVOPZWqity57-jDEb5eGhvSKzMx
X-Proofpoint-ORIG-GUID: wVYDBDVOPZWqity57-jDEb5eGhvSKzMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX37sIGwjRP4Jm
 dyQcZ+G70HWetN/08mIhsCBGUM+123GwpAVYgl90JZZgpZqaNCg8HXWz+3H3v8v5NP82XiEMN+G
 S/ZcWX2RpGf3vXH2l/JeqFpc1bqLhPxC5uZ1TSre1fNDTsFKecUjTWBNFMGr2D+/0aEeRH7W8tt
 FHjDT9rc3gmQQ40fLdB801I+kCNZo1mD+6zGsl0bBQ3ooBjFLRPB9lcvHoHX8CCwvOCHL4Mu2zi
 B7J6HfVCd+sRmI8QoSvhD1ti1/nTljjw0fiBmppODAJfejbuWIc2dtx8L+TQ53Z5DfpUL0nJFqn
 jbShjEsZ4TIlELB+EcmqmlFiPyXLcnH5ddosOmYKLjiq49NRC6elR5LIWknzVUiy1UnhfbOTuHX
 g3beQtwXQI4IlJXA0bKhLra81dwStLxqY28BokMl+cuzL071nKbkSD4qY0w5WQZHRhitZRjoNJ2
 AERAZZgCHZTLyPVH0lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXyvXurEfTTnvq
 5hptWpQnZ3cjW12g8yRayTPw10TvPuFo5qhsRo9cVFo2SOfdTihINN3n1CRlGNLTkvD4IuOXULI
 28XYunfRufxRrdYutr+FslQco+fRfwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own. The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M.

This new programming is guarded by a boolean set by the platform
descriptors. No change intended on existing platforms.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: protect this programming sequence by a boolean flag and reword the
commit message.
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 72 +++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f2428f0467bb..99ea7e0cfb00 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -68,6 +68,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -93,6 +96,7 @@ struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *rgmii_por;
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
+	bool phy_managed_delays;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
@@ -189,7 +193,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 MHz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 MHz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -515,6 +527,58 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->data->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (ethqos->data->rgmii_config_loopback_en)
+		rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
+static void ethqos_configure_rgmii_id(struct qcom_ethqos *ethqos, int speed)
+{
+	ethqos_set_func_clk_en(ethqos);
+
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+	ethqos_rgmii_id_macro_init(ethqos, speed);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -524,6 +588,12 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	unsigned int i;
 	u32 val;
 
+	if (ethqos->data->phy_managed_delays &&
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		ethqos_configure_rgmii_id(ethqos, speed);
+		return;
+	}
+
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */

-- 
2.34.1

