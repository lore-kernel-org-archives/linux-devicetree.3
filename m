Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435160;
	b=v1PJkNFodFdKpov56hkploCzxkZUqBTLF7uw3vY//+6iZHqJXA3ItxTVYKxgGQxo5Jhu
	 byHa/FAoqRzhYOvnI3TEpIQFFwkisHzi+/acKKSBrTXGOzw//Yyua6kh6zTyNP22T0ZAP
	 zMyu5wcusWQ+94suVagw5hR7AiOrEE/sqUZAUbrzwPY3LhZ/OuMblAhmMGL4LMCgCrhi1
	 UsqSjdvRAWGPwLxzqiwR5jXHbjr8loDOxmoQLU6US2jE5V6bfAPejlyZzIuAlKyF2VVmO
	 Q9pmbOj+c1CpHeJ2q80sC2LHCFYlix03TFByLrzALu0UFfe3NMTW6ydfq7ar4RjpY2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435160;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nUX1QLm/Tx4+2qafs2KCLWkjZV58tuypOVrn5FQVUFE=;
	b=FmpBOa3ixaZK4Mf4je8ihK6vcfNRuqpCpZF6SBMB139AwpJ5ml2k3PQ+jmmCnzMMUiiJ
	 bSEgOEZHlUmHu3c1zFVkchpgcMZeegDr6TyNHnzzvCLLNO4mCgO9jTy2Kvzi4GeOqLFFw
	 5LjIJEOtF1AunJJ8wPlUEiAZLiC4nUys+ogu9TKZ7RTJHZbUjzouv9DbjaM6yO5S36c/2
	 InFzYQjFShgOM5MlxNxEEC1v1Dyw+iDH7Jw9kgTwFZSL/+P8MYnjdoIvB+nobRASgr+uv
	 B5TMwQKeftI4JzuqsHSBrVOfNzin08hnF6J0b0F+E4G4wu5XFWVQ8tqS3P6tcCnPzxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=t3Ixy9E4;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=DfvcVDv9;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C9606A339;
	Mon, 23 Nov 2026 11:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9C9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=t3Ixy9E4;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=DfvcVDv9
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GPMX1729171;
	Mon, 23 Nov 2026 06:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=nUX1QLm/Tx4+2qafs2KCLWkjZV58tuypOVrn5FQVUFE=; b=t3Ixy9E
	4SDPb74++poKvGINQPLcoeLCYU9DuuQI2wGiempvpPzUElBNEKeHmzZMxdos+OaU
	tOAkjPdTtr9bNaVRCRWkmPzC5/+n8V7NXYcM5EdmOBdWVdmlFwl+WL7uRBtCYN1s
	8NR6quc9eBV5Ob07loOrjk4GnKsinjysJ1LgUhBIVSECLxLHUCeGoQ3aD3R3gZ/Z
	MaJ66ls0tCZsItwC7A+QoU/+aNwIF+4X8oLb3peejmUlOahFg7V8lxwA5HhL8bSF
	kjoXebpfAsrwCs1SGgAUHZCVbnq7TP9wMrR/pCyuAVaXr09IttxyokdLe8P6OyZ2
	VHKUd+x/XhZyxPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=nUX1Q
	Lm/Tx4+2qafs2KCLWkjZV58tuypOVrn5FQVUFE=; b=DfvcVDv9O1YRZd3WNtMak
	iSPaptAJ9C1Oa7m+BIxO3KpooEtjoIF+zBAN4dcpoWrW8j/5chSsNjfJ63ZzCjSr
	h4UpvyIB/AJ6N4ys/Tha2KXo2pzkwQxmmGGrjnH4jhoZJGj+/Ty3mH5XyfVQdGrw
	Sfm7RCX9R0Dqs8pv/17R7ZL7bospUyap5Dt+JRsc97gxZDMGaeGCJFLO5o3+LAOx
	DzJNuP0BKlihBfkoz07ong4LXXGJC++IA8pd6ohmLc8ActHeQii7PNk+vD5Rx0uc
	retAjWEvPIbITUkiFSb9iJna+JT2mPTYOYfByvqUAMzf5CJcds+lyFflNxzEjLjj
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4j3tgj6g2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:58:59 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6ANBwwfo026378
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 06:58:58 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 06:58:58 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 06:58:58 -0500
Received: from HYB-6AVb5If9qTU.ad.analog.com (HYB-6AVb5If9qTU.ad.analog.com [10.135.4.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6ANBviVV015057;
	Mon, 23 Nov 2026 06:58:50 -0500
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
Subject: [PATCH net-next v3 2/7] net: ethernet: oa_tc6: Allow custom reset settle time values
Date: Mon, 23 Nov 2026 13:57:38 +0200
Message-ID: <20261123115743.29523-3-iustin.stolniceanu@analog.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfXyKtWhO/oBE81
 64LMpMshrcc4S67Rq/pSc79jGLX8UtUkdEebJohVmyj3BxL937q+cgtFlJtAm7WybvlvH7R6KvB
 QztOLcykk1zx2lwbv39rOQxC4eb23N4sF01YQR0UFKdHUGSG0Jgj4lmNk1aSqL96zBXijCT2aTA
 kZdBUZQ3GSEC9QQAv39MHJ3HRRZ4lvdgp6fKfcnImwlGGCl6p4koGjLpvVec2zR9QHt2+tze74J
 UbSzM27+IGP2xJInBNKPSL8xDKJd+re8MD9jjj2upC9R76YwOUuI76nl4tMGvBbRnFc7Dg20f39
 v2b+5cgSVT7Kof9GRkvwus43ld02wE0BognwNZiEK2/Y9WrEQebcEZyNheix50z4No0MR+OH34m
 F4eI1/2zpDMkGANFx6Z8g+A3ge2TE4bvFGma8UbMzEmUQ5J7exkPtF5TDwQu4tcDAkp8z9W7p1W
 6J34Lq2bcnzg9R5A1zQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfXwlhKBUbUJaUW
 P/EtvVqaIbFbtFjFq0j2xeAu0lmz5j/ev4SFTPwu/fSGGVD9WN4H9tJrx36jjrKNNfOqVB3+BXO
 rIqezJc2juFEFlq4xRXNngy1TFEG+zmUoJLPDzojSCzvoQ+gNUJM
X-Authority-Analysis: v=2.4 cv=Yp6a1IYX c=1 sm=1 tr=0 ts=6b042a83 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8 a=jwvB6ghkBqQFQwKxTisA:9
X-Proofpoint-GUID: dcC15ifmyjp1_w3G6X61ZpWdai-EXg3f
X-Proofpoint-ORIG-GUID: dcC15ifmyjp1_w3G6X61ZpWdai-EXg3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230047

From: Ciprian Regus <ciprian.regus@analog.com>

oa_tc6_init() waits a fixed 1 ms after deasserting the reset GPIO
before accessing the MAC-PHY, and polls STATUS0 for RESETC right after
the software reset. The reset timing parameters of a MAC-PHY device are
outside of the OA TC6 scope. For example, the ADIN1110 needs up to 50 ms
after RESET is deasserted and up to 10 ms after a software reset before
its registers can be accessed, and it tristates its SDO pin during the
reset.

Add hwreset_settle_us and softreset_settle_us fields to struct
oa_tc6_quirks so drivers can set these times. If hwreset_settle_us is
not set, the GPIO reset keeps the existing 1 ms wait. If
softreset_settle_us is not set, there is no wait after the software
reset, as before.

Signed-off-by: Ciprian Regus <ciprian.regus@analog.com>
Co-developed-by: Iustin Stolniceanu <iustin.stolniceanu@analog.com>
Signed-off-by: Iustin Stolniceanu <iustin.stolniceanu@analog.com>
---
 drivers/net/ethernet/oa_tc6.c | 18 +++++++++++-------
 include/linux/oa_tc6.h        |  4 ++++
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index 8e86cfde6d1c..c05480b7920e 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -89,7 +89,7 @@ struct oa_tc6 {
 	bool int_flag;
 	bool disable_traffic;
 	bool prot_ctrl;
-	enum oa_tc6_quirk_flag quirk_flags;
+	struct oa_tc6_quirks quirks;
 	struct gpio_desc *reset_gpio;
 };
 
@@ -582,7 +582,7 @@ static int oa_tc6_phy_init(struct oa_tc6 *tc6)
 {
 	int ret;
 
-	if (tc6->quirk_flags & OA_TC6_BROKEN_PHY)
+	if (tc6->quirks.quirk_flags & OA_TC6_BROKEN_PHY)
 		return 0;
 
 	ret = oa_tc6_check_phy_reg_direct_access_capability(tc6);
@@ -621,7 +621,7 @@ static int oa_tc6_phy_init(struct oa_tc6 *tc6)
 
 static void oa_tc6_phy_exit(struct oa_tc6 *tc6)
 {
-	if (tc6->quirk_flags & OA_TC6_BROKEN_PHY)
+	if (tc6->quirks.quirk_flags & OA_TC6_BROKEN_PHY)
 		return;
 
 	phy_disconnect(tc6->phydev);
@@ -652,6 +652,8 @@ static int oa_tc6_sw_reset_macphy(struct oa_tc6 *tc6)
 	if (ret)
 		return ret;
 
+	fsleep(tc6->quirks.softreset_settle_us);
+
 	/* Poll for soft reset complete for every 1ms until 1s timeout */
 	ret = readx_poll_timeout(oa_tc6_read_status0, tc6, regval,
 				 regval & OA_TC6_STATUS0_RESETC,
@@ -1475,7 +1477,9 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *netdev,
 	spin_lock_init(&tc6->tx_skb_lock);
 
 	if (quirks)
-		tc6->quirk_flags = quirks->quirk_flags;
+		tc6->quirks = *quirks;
+	if (!tc6->quirks.hwreset_settle_us)
+		tc6->quirks.hwreset_settle_us = 1000;
 
 	/* Set the SPI controller to pump at realtime priority */
 	tc6->spi->rt = true;
@@ -1515,12 +1519,12 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *netdev,
 					     "failed to get reset gpio\n"));
 
 	if (tc6->reset_gpio) {
-		/* Keep the reset asserted for 10 us and then allow 1 ms of
-		 * settle time for the crystal oscillator startup.
+		/* Keep the reset asserted for 10 us and then allow the reset
+		 * settle time (1 ms by default).
 		 */
 		fsleep(10);
 		gpiod_set_value_cansleep(tc6->reset_gpio, 0);
-		fsleep(1000);
+		fsleep(tc6->quirks.hwreset_settle_us);
 	}
 
 	/* Check the PROTE bit status so that we can reset the device */
diff --git a/include/linux/oa_tc6.h b/include/linux/oa_tc6.h
index 6eac6b842156..f676e712e75d 100644
--- a/include/linux/oa_tc6.h
+++ b/include/linux/oa_tc6.h
@@ -73,6 +73,10 @@ enum oa_tc6_quirk_flag {
 
 struct oa_tc6_quirks {
 	enum oa_tc6_quirk_flag quirk_flags;
+	/* Wait after deasserting the reset GPIO, 1 ms if not set */
+	u32 hwreset_settle_us;
+	/* Wait after the software reset, before polling for RESETC */
+	u32 softreset_settle_us;
 };
 
 struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *netdev,
-- 
2.43.0

