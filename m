Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE4333A9FF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461689; cv=none; b=l5GWnQn7BvbRwaK3L6x3WGKoCXFkJV+C5cW6kxYSpG1ULuFzhHS9R7v/zxGtTacezpQgGNuayR/aU2xZhhGO/jzMDACSu6xb/r1LlcU91dFdHwHDgbKIINUUsxxB808Qjt8m90Blptf5absnc7UE1bkmkjsTIw1aCZU9HkCDlx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461689; c=relaxed/simple;
	bh=oPIOV+gVLaskH06k2h0yfpHO+z9xupXJmiUCrslRjTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpbKsgH+7f0ksbQa1guxj09OQ1IYLTtT7V+c3gUgRkE9+PQK2XU4zDv4DfiWyB2wrpwO4+tmh0pCE00LdGFMiKGMcjrmg4o83cWL8ecGNUUvDkom4fC9LUO2S1xDjeSYzFM7bbpWzuLJ+ZILPpM7GcaSnZ3OU0y8tmqkJyQlXog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOVT39CT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAQ8X3Aw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOVT39CT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAQ8X3Aw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3Fsx417507
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 18:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=; b=SOVT39CTaHfspJNN
	T0Xwf9QKRY7cTVbR/hYBMXr0mA37ZqoNFCi2Yx2roa+ltesTIreKH5oequXd87e/
	8H+0NjFxNRpUqaYAU7WAXe/77IUrWPH6Zqo8xhZVXHgdTpIUa97Zh9QOxVKNeyrL
	5zSp7WvHzt72FKP1ut8nQ+Se3KWQ6oynA7vudhhz3h1E20Ngo2fbcZG0z72DDUKe
	0/zahxl8j7PCxomsLjrthRPXTqsaJf/RG/HyrxEJQBJ01RhOyIixY2bczMMgM2PU
	72rvn3Wyr9QnxJC+xGkh2Fy0xM4/4U67AnZJ+s/lnE/6UMj3+O2ZmWVhndCuHV5j
	di7uag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m2wm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 18:54:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d292eac1so242209a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461676; x=1789066476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=;
        b=VAQ8X3AwhA63OB0YF5KLx+mcgaxmqBxejuWC0v8HmiBcmlFzgSle2Rr2YPd3gVCxF/
         I6EuHTFJJt0O07BjAUURfmrNcg1yOoF8Yyi/5YZEqf+ZnCj1D4K4oqhuK6Pe+/HLIMBV
         m6zdOi5TfCodtI15oi5Yn4igwn5noB8D3muR591jhdGo8JgzLYe03Vsh5FH3s4CirNse
         YaVQrJwWFWK+KDTUogNO7CPaOF7SqdZip26XrYsGUB4w9FpKWaCOap3bkCieJO6nuUoW
         6wHzQFvEPxafRvTioy4ofJrO27cKqWeYQyQszMWIICxAZ0J2Kf14oIZCwLn7hR+1fxOG
         5izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461676; x=1789066476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=;
        b=hCgFQxykWwtEn0voBlsab2qs8nY8Po1hJhgWoOoJ5gx3hmzsbIK4pSV2tWNGfqlZt1
         jdlbbqnqduzhq6kuw17tsLkGKKVbrNDAPD8deaL0xAqNG8VuiYHXp/hX7rTTeRWac3IG
         ZcT52JxwGHEYULM9LPlUVpJTgPhJ+4NSFDM9V/vFaMbiyredgM3sOLXSyjEIhua8mDgJ
         R5CT6KfLPw33mXirkj7QA5mr0KaRNK5rOom/Df5y/3fORZT8DuN3plkySuAshCx7oyZv
         U5YJqA7520QVvkb7+i5+SvpzweP/LuhW3x2f1TW9x2iEaXO7UhTW3jYewCfAUWfgcJ98
         5iwA==
X-Forwarded-Encrypted: i=1; AKwUvByr6FwPwloGJvcIpvHgO4XBL88B0M0ZEjebwKDtK5HQWtwGb3LNlu/hXTSd7KXegtXotWvGIVBkVZKz@vger.kernel.org
X-Gm-Message-State: AFuF++kLtw14fUdoXdNKkPGrKWOGpihiRj2KffkCpuR3LFbrIIUn/IaG
	vI/SaJ8Xv+PD18Th/PjXU7kzdMefswuIdNn40qO0AJuhAfGBAi6Z2ToEC2NDSXxEe6POwz4ONGx
	TpJp63puke0V8pR43khil4BBB1257dc6sg/Kk9Z/il7eGEpy93OY7YKk+5txEmns1
X-Gm-Gg: AYBFou2V8b+oQmKvizyzFfeqCodaX4zVl6uvYmiPEfjOarI7erug5mZ7kOn/nmdoBji
	8tkQW+SycUUUZCAyx63Q+us07d8rOxY/MUZg9kL/yXetezCbBUmqPPiuZVogrOIx989WBwUkq3J
	gziBSG7GWmN4kwCXrPOGTy39yK9cJDu5YPorhkbwBruJ7fmcEe+dTXRYYaKOWzDdmKK6sKpYiB1
	pQFMbNByjCGgaUU+/TBYVEbcVxySnY/9yWDw5jhvKXgdo6Vs636AL52X45CTcjloxuFJu379929
	9hJMKoT/XZe1+qVQy2RsA8pPDSJPz8l/fuK36t3b+OgBETlC1MccT4l3ouM2A0a/xGvXrue2ED7
	xS4uDykOlN52QLugNSwkmf59ZVz/SJw==
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr937546a91.1.1788461675697;
        Thu, 03 Sep 2026 11:54:35 -0700 (PDT)
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr937450a91.1.1788461675090;
        Thu, 03 Sep 2026 11:54:35 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:34 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:47 +0530
Subject: [PATCH net-next 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode
 to use DLL bypass
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-5-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=4880;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=oPIOV+gVLaskH06k2h0yfpHO+z9xupXJmiUCrslRjTc=;
 b=sRHi8BoPgbISk0KgC4JVIGsrHJ+lg5f/DF9tLeSaANkxWpr2474ufayQ5HWVVmUWbphyvASaL
 lMGakYLTTy4BLwe+7HrABFpLsuTJ22zRFKGrMtVA2WdExt1i5a56LXF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: oGgV_EECBBlTEHUKySvA8JO-liOQ4Ekz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX2JxC5y0mOUpa
 U0XpPpuWm6JTddtaIvOCUMS96pi/rQ9TDvYKqAd+tX/qAdL66JYV8FrFY3hSHiw1zaRpBf7Rz4d
 9Jea4SqrBYrqTCvl+8N+co11A4o3BnAkCgNR2XSA0u0kEhOEL0KTYm8OrbTspCgiGwNP6ZOswOK
 gPJVW+/zOwIDKIFy1jTMhUpDMCk2PhMtJmZv7QgDL1cO40HT11h0XKmyzmy708WNW2phSOgSR9f
 g2Fepjqd3fsn2uXEhuEwxYwHTaVc/gNJWl/je4Kr7nu7eVNx3NCGbZ/S71RAWmsSeFsFkmVKlFj
 Do1dj3SytOvDKamLPH+P8vMZ4+P8y3NCfBaBY3KAs8RW7OoFqeXV9WyT4Lqz8lsTD3+jFIY8rXm
 GTJ/q/hK/0LfpJRHT1YHNBywXZH9bWtzO9q7R11BwovuXiVE1EBvR0aTZH5nqJRZoyysRSGLuUk
 a3zc8M0+HytKHSMiHgw==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99c26c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX/6hQikxiV9gv
 rHaxUzJIagjeVisYN/gTx1N6cvl5z0CAxcaLC0CZ1f0Bf/ysnvkTGEdKHzkvsqjnNhbwnfrtvOz
 tpkiW2dUqHIv6CSad/BfhPJQBcfubJA=
X-Proofpoint-ORIG-GUID: oGgV_EECBBlTEHUKySvA8JO-liOQ4Ekz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own. The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M, and remove RGMII_ID from the phase-shift suppression in
ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 67 +++++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44270c25d874f72e7f971757fec659d36468c315..67738c1598c50ade22f2d548a6d66911c348af51 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -67,6 +67,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -475,6 +485,42 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
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
+	if (ethqos->has_emac_ge_3)
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
+	if (ethqos->rgmii_config_loopback_en)
+		rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -493,6 +539,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 
 	ethqos_set_func_clk_en(ethqos);
 
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+		ethqos_rgmii_id_macro_init(ethqos, speed);
+
+		return;
+	}
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1

