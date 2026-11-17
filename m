Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905217;
	b=zlyt2vPeeROvcpJDHg3mFEgRP7gd5I1b3CxDvgrPUghyb/p3Sl0wQ2zcvqahXFswZbtx
	 raQOKEFCdpu1Bm0prJWOcFOYHVGZwrOGvLrKtO7BrGDPd2JS/KbMsA/J0AXC7YVZIcN11
	 h5q2MM5yav+mleJVezaa090YHoceHOfHpxR8lbInC9k/HSDqQn0HbWrMfIjyRqKbGkCGA
	 JrrUr/2h9em/xRmkshlc0rSRleiNWKd/GfoItYLdM/nGu3UebeiK5yaTH9GVP7UEDJca5
	 d5az7iAbAME844FUeRQvSjk1w577+AXB7ufvVnxt2Q2C0Y8nfhwl9SLRha3a5u36mFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
	b=Tskbrhu2/Rc10u8lomtUZZMcaqH8Qe4qV+ZkVekpKn0nQoY5XeFtEpssXkrmvLTN4Uyz
	 XaynQzHQTCxpPuKxei+DA3ZUE3f/FH+4/Oz6oSbswn/gW1dTsTU/mZi5apEj63EEk3p39
	 1dFYWduZEE3d0WKGHe1ga9uTAgwQ2npJZpUDVA6uiZDaBS+lMMgL6l4lXgoAqCfdE0CN1
	 OG7V3La7chf0pHDAA12Cq/4mPy6GIwAL40kEk3boZFHYiO2yAhgNMlyByq6odon0DGTey
	 NaZgtZH12OUxh1xxhURwL0KLDhnpKznn4ErHDeIHzOyZP9m7vyoo150vTthlAdK9zkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgRakVzp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626CB606A8A7
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626CB606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgRakVzp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH43xK11699103
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=; b=NrY26mzQEiC4p5OS
	QrlLTzR7eu+G0a6BDStDdlA6yyJWltOfruzJ5X9OsWQi/RdQaUxQ3GSY93axuTN9
	xOHelC4J0oZ5xhUiool4Uude2cu6gT0HWJ9um6drPk0y+4gHAHKyBl92cXAsr6sO
	gaHSnuvgB0ha8P9MyjqsuCX/zCJPmbDVIRnvkvqbhmH4SIiW16ASEcXlWq+u28+A
	9ojJOzNMro5o3ojWSuUhM/z37achDooJVyJ6N8tYBjf6r2ajKg0MgsEvusWwXbth
	SdMyEAJ274Ix5Uwzt3oxBjg2nt6+JF/TkYeVkF5756I6dzi5Sx1mpkHD+m+l6i1Z
	s2w25g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugys8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso4221236a12.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905214; x=1795510014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=KgRakVzpMfwbA8NSA2GXLqOZAAA0Pi3a3e2prrO6SFcrLj2vxT7fS+gNq1jm5Mb9pS
         nr7+x9jikZ1hAdNsa8zKemRbt0/gqOv3cYSOJHu8x2c8k8zUIqyR/nk/5ZHFIqCPvwqo
         tijL1bNcc4tEzTdKFi+XWJF6MQOnuEZJ275yIA15WD12vVhw8O13dqzLdEwpEHNbJhpX
         cYq0aKGWGxIwMumXHf07dZzwAlX3gAjf5dIHquvy48LhJFmCRpRpboP4erua2uGJM7lO
         T2COuGiBT3JyVF5MrvEqBsU+ooXWhfKJ7fiBBwNa5pL3PEUJDCaREXgtTLfQCk763JNa
         2PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905214; x=1795510014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=YXB/6EYSEiw2ygV4i/fS0sRzCG9iOcq/6CYzJudAsP2tW5i493Go/yFIVxMv9f8cJc
         V4Zog1dMRUveUcWUwZ9A6aVHnCi0N5Syqn/7Y+3H4SF/W3qF3zJBbhnLZyIvxDE/ny6u
         pVzR9kmtY8A2YAKeCLWoJxoeJmpeBglF3uKtH/aDOJULUKWW0xpz7M/ZbNlOpCEVC6sV
         845Rvc2roi3O6qE4vgSqFQE+hJJKFR8Ulx0vdcvsrFd0bkQCJ9+6pobpJSPXjul8C6LE
         Vjf8687bA/HDHKd4OHaRl3dWJQuBiZAg2TEe/lw15rvwANoUjnxxO/I9xkO7Z8qGRy/9
         aZyQ==
X-Forwarded-Encrypted: i=1; AL+hErEJLB35vA8SijpBZHVstwE12/RCXEMoR1wWnaIrWIdDzFxjhBe74v8eyMdfEO+Fdrp/LeeWAManohhS@vger.kernel.org
X-Gm-Message-State: APuU4Z+F2WuEruSHTKCnBQCkYyT7YLmE0CsC24oukDfaKdfYN36lq8J+
	frks+bUgfcB6q0SWd5iQg7hOvY++aaemOACUvlJ3E7fXeQeCTJbq74IzBWz0dAUgAma+Qvji1zL
	z7NNTWp1DXQR1C+dDf5GGBWT2Hr9dqZwPSMkl621SgvKAxR4z+1F6RpkrxZ3nsIL4
X-Gm-Gg: AYBFou3psIqkZlVo28JRs4i28fONBYIS6FIpggJXlAdMBCPftQx8JVbTOPxdvU8nJSO
	Bv9WWmmTgEALqUcH9qz1fUJDcYjDSbJkzCEegtYDAgStv31/dxxuImkjkJf9VkNCr92GPWSMibf
	Lp7EuMcPqRDq2cQxyRoqottzS3MxXpBLrnWikyXCqooxwgk06MSxuSQRC9KIfTqCpBk2cLAzLJT
	reGm5RrgKzZ76VUi0233RoSHEFavU6CCdfYiy/sVNvtD4aaRDxE0Zjqwbt9NKe9Mh/3oeE9POq/
	gLDLmFkrHGldiJxnhuyVH8V4zgrFT4FGwf9b7nHcCyzfve4yOzmmCBvXKT803zzGr8bT3n3W6zC
	Ra0NC+I1shlDEZ18Y8V5Qdx5LITkhqLFWXmBzCocfMw86tk/2incvh+/gNNT4DoK1u/NOa7T0O9
	v6Uw==
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092191637.56.1794905213711;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092149637.56.1794905213189;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:52 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:27 +0530
Subject: [PATCH net-next v4 07/10] net: stmmac: qcom-ethqos: share common
 GMAC4 address table
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
Message-Id: <20261117-shikra_ethernet-v4-7-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4888;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=n+OVBcpYDnfu1RAZNpTORwUsJk5/4Iz/XkRVvIn0LX8=;
 b=U0W33hjrN/xoSEpZUs1mBMAieyrO6ADIruqEMBfhJQAtg9FHals35UP7LllUCRBIJs2QGASlA
 BADkHSDqHYcDqu/Vh0Cgae7f6aUXUnWpw6HwAu6F4RhjdjIjqI8XA8h
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX5UD1MjzXVhGY
 JIPNY0nc/0FTUqeY4k7GpsZImmHBsqZ6uiwZ6HGiRqS3lypm97sYmhWMwMlCC+PPrLghWXFeMWW
 bwy6mi5o25HgKQsAyAi9nl2BGQ3SWXrVVB9teFU8JOZB1M20iYCCLIfCXkaPaqYeKmsXJTjJZQL
 QIJ3xtOnpIVPWV1tVIz1lKD33POIbSfqHvNcy6QlHZ/A1W+9GyMeEY5nOU8DDfdh0qmxLBA6zFO
 wo+u1pfSILciaNMhNcFO/x6nre25PrJjmiqEJifZ5PKes8mr/phQYhxqR0yNxOtwwC4y2Dkhx0j
 PgBZqPLrQmfCSxDu2TBxzYS1Zq2fr2JLUovweXR7fKPi5bm5AFzBBGrHy7nJFEJVZXIxv98MlvP
 ibUz9pEyxFiX09tbDyFfqJ4IdQilLvfDf/F5KbSMqzqWEVfd8AhSdfICEx2+ud80rrzjpxlG6S0
 8lPpdRlEIaebUrLHTzQ==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc147f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=koHM5ydvv4bFC7S24qUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: bbEL9ZTNbgfQ7rTkeCNDsPEvEGCRhOGV
X-Proofpoint-GUID: bbEL9ZTNbgfQ7rTkeCNDsPEvEGCRhOGV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX8KMfK4CA2opu
 FbSdeRawE/FUK476X0eyduEdOtjGuCgIcxzXkl0Wxr6sxP1qOpS3yHYJth6X4kyWEi1e5sN92JA
 JCNnD9uKv0ZleZuqHp3LB1ATN6wcQJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Several ETHQOS versions use identical GMAC4 DMA and MTL address offsets.
Store the descriptor once and let per-compatible data reference it.

Use its presence, rather than has_emac_ge_3, when passing it to stmmac
core. This keeps address-table ownership independent of the feature
flag.

No functional change intended.

Suggested-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 74 +++++++---------------
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 192788e00dfa..bc443793539b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,7 @@ struct ethqos_emac_driver_data {
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
-	struct dwmac4_addrs dwmac4_addrs;
+	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
 	/* Fixed PTP reference clock rate, used on SCMI platforms where
 	 * firmware does not implement the clock protocol allowing linux to
@@ -262,6 +262,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct dwmac4_addrs ethqos_dwmac4_addrs = {
+	.dma_chan = 0x00008100,
+	.dma_chan_offset = 0x1000,
+	.mtl_chan = 0x00008000,
+	.mtl_chan_offset = 0x1000,
+	.mtl_ets_ctrl = 0x00008010,
+	.mtl_ets_ctrl_offset = 0x1000,
+	.mtl_txq_weight = 0x00008018,
+	.mtl_txq_weight_offset = 0x1000,
+	.mtl_send_slp_cred = 0x0000801c,
+	.mtl_send_slp_cred_offset = 0x1000,
+	.mtl_high_cred = 0x00008020,
+	.mtl_high_cred_offset = 0x1000,
+	.mtl_low_cred = 0x00008024,
+	.mtl_low_cred_offset = 0x1000,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -276,22 +293,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -312,22 +314,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -336,22 +323,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.ptp_clk_rate = 230400000,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_scmi_setup,
 };
 
@@ -999,8 +971,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (data->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (data->dwmac4_addrs)
+		plat_dat->dwmac4_addrs = data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;

-- 
2.34.1

