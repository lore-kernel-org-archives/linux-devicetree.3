Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435172;
	b=jicyE1NIAt1EYNpz1UhS67bFeFmyd2MZS+bJkdpxgWba5hxoEAM6yfrroKlhaZk2PMB4
	 df/2BlO2y49GmB7kdAfggFBO5C0O7813kWikmRbShoUZqpQCBk5VMPMz887ByHD6WD2xg
	 95Oj+1gM79CMEufY4V/t0QBDMlCjNFti1HRK+JAxAsLHEqqHJy2PBlruLq3X9b0Bz4Asi
	 tXmQ6w0e99CWlXB5LjZhvQiSVnwFeDhLeIoHFRJPW8XPLlayv63l3PThYZvpKsDwxSoT6
	 TcVhDzWpE9j/MLdBFlp9C+xiLp+T1E98vXqKiCgtZZ099kJikt5B5QlDRu+DT6Z3e5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435172;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SP7G6gWX39C4LyeHIucTmV8dmH6ZsRXc1KB1yNp1xWc=;
	b=npIwPPrur3E65QBYG4PtlYSrWAn7TkVrFszNNFG/3RSQozhS9nMA3bvaD62/xS1oa5OA
	 J/0W8sQM/PXTL5LG56hME2Xk/9zhuC8WBgbzZkEdCFjOSFMucXJoAwkQaLbdCGd7yoxml
	 2rSA5hjYW/UcOIQb8OjBBx7OyvyupiOFaqYoK8K+bQaaiH3F2ee+F5GfDr9fg0+s0oWot
	 oyZFS392Di39G2u/4RYLF1nmWUgcAF+xDBJAuOJepdbP8vReBlgYuWSgb/BQh/7kCiWD9
	 yoDGwCODW04NNw6FVtNQlSCOj9p/5Lk+2v22nylT2OozKy6jWINdiGMweXw4YijeUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=obvEeFk3;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=yqWDAe4k;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E26606A33E;
	Mon, 23 Nov 2026 11:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E26606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=obvEeFk3;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=yqWDAe4k
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GSFt1729182;
	Mon, 23 Nov 2026 06:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=SP7G6gWX39C4LyeHIucTmV8dmH6ZsRXc1KB1yNp1xWc=; b=obvEeFk
	3cmo+lGPzrd1sTLyv3dpGmbIFwxzlPTBuJjb4RCVSSTnu+KoSArgGATqJZEvawP3
	lMQtHFd7+2x/vF+oBxnfO0WAIAoN4UNGAFaeK1oudd9r8vh40bK5IG0HgYSPK7eM
	XCoL1LPj9K/HgdzSY5FLSZCJLKxwyieFhvgbrrXjOsn0+y0Nf0o6ttqIdFB5zDtX
	W+R1HBI+4Yf0zGgC5l2UKnT9p71rYRRIuSq5vt/aKbK4OWR+irSbRsPbWPzErpdo
	19XdPXlrxG86A7OE1q378RDogZQzTYyCFRXAiIrhJxMIm4gWoaZfekygBzBRV1rt
	lkOCyXhqn9Cbopg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SP7G6
	gWX39C4LyeHIucTmV8dmH6ZsRXc1KB1yNp1xWc=; b=yqWDAe4kedxv8/veCiM78
	TQpYPMn/cYspqtbkP7S2PjNdChIrFntk+v8poepbgs26mAKPRC6kNCZrskD267Kx
	rmQsj6IO/OKDK5Zf6vgEi3hzuvNzWqeGuZpQ4I/m41OJB5+6b0VYeaeD+7nuf0pL
	xtVQ6NjzgM7KYCBcuM1XVtcDqWj4wT7aK83hC6fZsIV4Gqvo97DrM0OwoUlhSgNf
	agOYl99wmcRhqzHdTbJCNkF3GJFqJNwiN5tgi3mwy0bAhJbM8NQ3qdPfwpNVIk2v
	Q2xC2BqTQTthhKoWIcptkAbps+SC5/v3fRlSekB9jcDUyri0pssE1a+ympLn65PT
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4j3tgj6g35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:59:14 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6ANBxDMb026390
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 06:59:13 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 06:59:12 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 06:59:12 -0500
Received: from HYB-6AVb5If9qTU.ad.analog.com (HYB-6AVb5If9qTU.ad.analog.com [10.135.4.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6ANBviVY015057;
	Mon, 23 Nov 2026 06:59:05 -0500
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
Subject: [PATCH net-next v3 5/7] net: phy: adin1100: Skip the soft reset on ADIN1110/ADIN2111
Date: Mon, 23 Nov 2026 13:57:41 +0200
Message-ID: <20261123115743.29523-6-iustin.stolniceanu@analog.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX3mOoGeaasVG+
 whN9juqI+mTTr50wKRWkIttVtZccuy6UdWIyMl9Q2WaKpHieJeE/cOgh+X5L83PZP7Sa3eczrG3
 LmJNSEM1rU5NVadWpFNMFFtrBAjxG8mgwzs6g51nfqVqcCTHxSlCqG0HPYqxizR7TVysros9+Gm
 3F3C6YUTXrsXsLSt2vc8UzzUjtTW9Xc3y736DR/Z8nxmXirql4W4vSjPhWEiUO3Mb5/5jM3bqFC
 26jZW3hbhiJnaeC0K/rAoig2WG67awaXzjmOWnDNcz9bbXCzFc/rhvZQy0UE0inbq1Ssd1fPxI8
 ivUf88xtFKUs66SwJjCAeu+oBzi+5qeyq59O5Xl6aL/EO/12zLEpunBawz6zr73tgevqeNaoK5l
 NQuQJfCjDMyKKFwXmPH278BN3QGJxAzAD2wH6blHm0RZlZ22lvFCQcxy+ofIIil/vywksq/NKIP
 DJYKrphdlASz4qRxnkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX24SwGVPsfPqP
 992kzOEL1SMYZI84hfHeCz/EqgKeJ7Y51V7tF89eYCGtBunhpgxD/iBgv+v9nZQiruekDsbgcZ8
 s7My3OMkBmGRkgthI8/LPL05ROniUWHJ5025Nd2UCO2p/S+bsbWi
X-Authority-Analysis: v=2.4 cv=Yp6a1IYX c=1 sm=1 tr=0 ts=6b042a92 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=XQJP7wW7p6eG8R4eeJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pHEKM_nBVzkAJqcrXxoHIh_9lOadlzxw
X-Proofpoint-ORIG-GUID: pHEKM_nBVzkAJqcrXxoHIh_9lOadlzxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230047

The ADIN1110 and ADIN2111 MAC-PHYs integrate the ADIN1100 PHY and use
this driver. On these devices, CRSM_SFT_RST resets the whole chip, not
only the PHY, undoing the configuration done by the MAC driver before
the PHY is attached. MDIO reads also return stale data until the reset
completes.

This is not an issue with the generic SPI protocol, where the adin1110
driver configures the MAC in ndo_open, after phy_connect(). The OPEN
Alliance TC6 protocol support, added in a following patch, configures
the device in oa_tc6_init() before the PHY is attached, and the
configuration would be lost.

The MAC driver already resets the chip before attaching the PHY, so
don't set .soft_reset for these devices.

Signed-off-by: Iustin Stolniceanu <iustin.stolniceanu@analog.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 drivers/net/phy/adin1100.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/adin1100.c b/drivers/net/phy/adin1100.c
index a69c3228961e..bc7214b73505 100644
--- a/drivers/net/phy/adin1100.c
+++ b/drivers/net/phy/adin1100.c
@@ -341,7 +341,6 @@ static struct phy_driver adin_driver[] = {
 		PHY_ID_MATCH_EXACT(PHY_ID_ADIN1110),
 		.name			= "ADIN1110",
 		.get_features		= adin_get_features,
-		.soft_reset		= adin_soft_reset,
 		.probe			= adin_probe,
 		.config_aneg		= adin_config_aneg,
 		.read_status		= adin_read_status,
@@ -357,7 +356,6 @@ static struct phy_driver adin_driver[] = {
 		PHY_ID_MATCH_EXACT(PHY_ID_ADIN2111),
 		.name			= "ADIN2111",
 		.get_features		= adin_get_features,
-		.soft_reset		= adin_soft_reset,
 		.probe			= adin_probe,
 		.config_aneg		= adin_config_aneg,
 		.read_status		= adin_read_status,
-- 
2.43.0

