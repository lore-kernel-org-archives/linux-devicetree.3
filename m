Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435172;
	b=ac5Hq7fis06UYyPGNOaTfw29fjJm2IeBPoMBxBw2V47rR/DvdWbRT9C7Haad+i0EPKdR
	 ZGHsC+hN5QK2gzMfoPZg5ccfpDfWHgndh+UlSUainUIqVZhZlpSqO4iOpTlxNmCzx73tk
	 dplOZ/nrtv2KkjwlrSYcs60GQVZBLZ2+XrKRU7t3EPSymopiBVjcy2PMDVIuxBUL5GMqA
	 LyWoYePdFp5BwCbk62/frzmWKEGM6up2RzDBTmVDuX/Tp3Sw04/gdIkArJh6aD5LShusy
	 YdkTu89eObMVsi5JJPaLdHI4mVik+nJ8g9bHFGxzzDXkxDXImgbYZ7GWgDh9j31/aYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435172;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=umPVAgJ1pU7OwP1JdM1iuqBRw8NXxk/kJAs7CjNn+34=;
	b=soQ5Yu/0OkawIIjo6QQpTI/MthcnvuKbfnuMuAHU5cvF6Qy/rj18QYHX5w6rQtIp5/El
	 /6Sv+ryaAIW00KHwMmXP0etZJlHhmqy2uLrGrtflLPzmDcD9z0YguLrh/4L3saqMyADNb
	 NqaNTXXthxZbn+0mdcZaJn191rwqCeQc29bl//iBGKMaDJJ80Kd5YYi70/DhcA80rdW9T
	 mKjj1HWUhp9fQRiOoXOo4AZ33lwTUF1qGPA3JuqBjqNcREKPyCf+3jnUFdLgBCXlr5nRb
	 1OR5jLNNYxqzv80kHZ/Oosq+/gb/iRMlaRxgKamWVyP6DKweHsVWpDRR3PUSqk3tSIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=XDUbSCuT;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=sOPADejO;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A7606A337;
	Mon, 23 Nov 2026 11:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC4A7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=XDUbSCuT;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=sOPADejO
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9HbvT260903;
	Mon, 23 Nov 2026 06:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=umPVAgJ1pU7OwP1JdM1iuqBRw8NXxk/kJAs7CjNn+34=; b=XDUbSCu
	T5BlI2oQG88cSMAY5o8r0JhofTuW/dznnwq5XGFvULA/u9Gb6YdB1f63C/FFaY9k
	/QsFWOP6SE09e7czNOGVohYFLnURYiZ6+a8g9PqxgUt9hFsgKTTphT9Kp1uhqja6
	ZPVPD+zejE+/MlB3JYX5XnvUPIivGEDwvN75S3fCXZHJ1TGZ7qQ1MGb+h9f1OsJC
	DCNUs5y3fH4y1ogQnuV1dBYOmfuQTO9L+9rEGMSNOoi+AbobIm5v6m5G97OIolDG
	ujSJX/jb3HuRzDIlgoiVlRj3nP5hm/oG0CIqtQBszcLA1tC8LZLG2Mb+/TNMx/ki
	gadju397yE2SWkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=umPVA
	gJ1pU7OwP1JdM1iuqBRw8NXxk/kJAs7CjNn+34=; b=sOPADejOuYD9ar5VUAID6
	LgEXh63SABc3b5NKnbkPMCAhI866bEoCsMjnTXGJahwHYmUygLRztpgUY7W1qm+F
	86Zg1TbHzy0ynWJ9Zxk2ZQCbyvHSbOQzk+idN/TWgW8bWBhmBgcIIh7zu/5fWG5N
	B1S1vs/k+vquSqL2DkPOeSFqn5NLmFv0mhsrTSY/8fY5yPWCH6POKejwNBFnQHJU
	1FK+QXJ1if7bVjHv9R0dyV27Sv0Y56sl2vLORFpNnQ93gLhhZ+TaP5Up7haI+Vfl
	+d7UZiYSUBRFCytkuCxwOnrZdvD2HxM8QwrGmO5Qross17mZu20/rEO2dKAXqY/N
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j3wgm5wp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:59:10 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6ANBx97J040207
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 06:59:09 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 06:59:08 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 06:59:08 -0500
Received: from HYB-6AVb5If9qTU.ad.analog.com (HYB-6AVb5If9qTU.ad.analog.com [10.135.4.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6ANBviVX015057;
	Mon, 23 Nov 2026 06:59:01 -0500
From: Iustin Stolniceanu <iustin.stolniceanu@analog.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Marcelo Schmitt
	<marcelo.schmitt@analog.com>
CC: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
        Ciprian Regus
	<ciprian.regus@analog.com>,
        Selvamani Rajagopal
	<Selvamani.Rajagopal@onsemi.com>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Iustin
 Stolniceanu <iustin.stolniceanu@analog.com>
Subject: [PATCH net-next v3 4/7] net: phy: adin1100: Add separate driver entries for ADIN1110/ADIN2111
Date: Mon, 23 Nov 2026 13:57:40 +0200
Message-ID: <20261123115743.29523-5-iustin.stolniceanu@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123115743.29523-1-iustin.stolniceanu@analog.com>
References: <20261123115743.29523-1-iustin.stolniceanu@analog.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX3To8/4v/TTix
 /GFT2dvZ2KHuETQ4DvI4sUUUENa/m+dcJxTwpwu5S95nFJsU6nPSZKmVcDhF3+30wWnb+IR+VtU
 ftFQ6Hw19yNfwnFz+JPB0HGJuFnIbC995KNJIqyPdfYdbNOpTYFTVoMwtSYirWNhRyed31T8Wks
 xITDvcO2KlLS+vv+xlJGtdway9Y1D9WsxqE8j+yO8UWyXugDhC5oHgauW/IdpPfzQsbOTee+TiT
 DW9TvYTFfpM37f7GKOJHVJYg+LS/PkW58KhFp4h+olXCj5cE2fZL4vSQb3yNaJa55muoJNu5AvW
 Shf4TbgEhsFe84C2W/4n+AEn196BtJeToc+bZt3B+9yWrONV7NtviW1qhzE+GSROQFqiv00+uZR
 YdpbpcnGsEXphQWjQGSZGHtTjf/og3lSHz8ONHzSm7m8AYCNDTv73EvkfMRZbIKacLzW0a0AS2o
 JzRbhs5kCbUqkMhQ7IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX4NBrCh87GOU1
 F4pq0ACTvCYoKaHgPXJbnhZUOJyIeMM7+cSm3/iRhy8fjpXtwGGEhX8TbZD4fxsjaSlVfQ972Op
 2vGEm3r/SHZoA17abKGBRiE8++oipZNYB2O0lqgDZl7zoAT0iGEX
X-Authority-Analysis: v=2.4 cv=FeGiV5+6 c=1 sm=1 tr=0 ts=6b042a8e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=0NDrZgIfIxmKIwutybgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QpZ8xQ-lds6pijxdyLvTubhgBwMCB0lD
X-Proofpoint-GUID: QpZ8xQ-lds6pijxdyLvTubhgBwMCB0lD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

The ADIN1100, ADIN1110 and ADIN2111 report different model numbers in
bits [9:4] of PHY_ID2 (0x8, 0x9 and 0xa), with the silicon revision in
bits [3:0]. A single phy_driver entry with the 0xffffffcf mask currently
binds all three by ignoring bits [5:4] of the model number.

Use one phy_driver entry per device, matched with PHY_ID_MATCH_EXACT(),
so that, as before, only revision 1 of each device binds to this
driver. The old mask also matched model 0xb, which no datasheet lists,
so no known device is affected. This allows device specific callbacks
to be set in a following patch. The callbacks are unchanged, so this is
not a functional change apart from the reported driver name.

Signed-off-by: Iustin Stolniceanu <iustin.stolniceanu@analog.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 drivers/net/phy/adin1100.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/adin1100.c b/drivers/net/phy/adin1100.c
index f845b440aaef..a69c3228961e 100644
--- a/drivers/net/phy/adin1100.c
+++ b/drivers/net/phy/adin1100.c
@@ -322,8 +322,7 @@ static int adin_probe(struct phy_device *phydev)
 
 static struct phy_driver adin_driver[] = {
 	{
-		.phy_id			= PHY_ID_ADIN1100,
-		.phy_id_mask		= 0xffffffcf,
+		PHY_ID_MATCH_EXACT(PHY_ID_ADIN1100),
 		.name			= "ADIN1100",
 		.get_features		= adin_get_features,
 		.soft_reset		= adin_soft_reset,
@@ -338,6 +337,38 @@ static struct phy_driver adin_driver[] = {
 		.get_sqi		= adin_get_sqi,
 		.get_sqi_max		= adin_get_sqi_max,
 	},
+	{
+		PHY_ID_MATCH_EXACT(PHY_ID_ADIN1110),
+		.name			= "ADIN1110",
+		.get_features		= adin_get_features,
+		.soft_reset		= adin_soft_reset,
+		.probe			= adin_probe,
+		.config_aneg		= adin_config_aneg,
+		.read_status		= adin_read_status,
+		.config_intr		= adin_config_intr,
+		.handle_interrupt	= adin_phy_handle_interrupt,
+		.set_loopback		= adin_set_loopback,
+		.suspend		= adin_suspend,
+		.resume			= adin_resume,
+		.get_sqi		= adin_get_sqi,
+		.get_sqi_max		= adin_get_sqi_max,
+	},
+	{
+		PHY_ID_MATCH_EXACT(PHY_ID_ADIN2111),
+		.name			= "ADIN2111",
+		.get_features		= adin_get_features,
+		.soft_reset		= adin_soft_reset,
+		.probe			= adin_probe,
+		.config_aneg		= adin_config_aneg,
+		.read_status		= adin_read_status,
+		.config_intr		= adin_config_intr,
+		.handle_interrupt	= adin_phy_handle_interrupt,
+		.set_loopback		= adin_set_loopback,
+		.suspend		= adin_suspend,
+		.resume			= adin_resume,
+		.get_sqi		= adin_get_sqi,
+		.get_sqi_max		= adin_get_sqi_max,
+	},
 };
 
 module_phy_driver(adin_driver);
-- 
2.43.0

