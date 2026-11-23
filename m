Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435116;
	b=CdqHsHIdZCDJxPBw3YwJDxTvH6P0GB4p+cbKxnFSwwPpRvqvZCj9z4mAHl4EQ6wfDa0p
	 SBJcMqNo2XSX6leyJuGifuGKi2B58Zftqm4sT+C+ZUmzslO7DDQisfZZ2sgzqO8RkECXL
	 pKEXHxpCRO5zEhzEOqOYgNxOSx3QhbvUgaTIrLLLcW4jpPQdL6gB6H3Y9pIkp/dxD3tjw
	 oEr3NwkwoLYU5HYWc7ppM6GtcNXkoS4+ReJUrH3ySS56pbivRQq5+VSx2x8ynwiYhYd4O
	 njPwREcodbguCsBqzMr7RsT/O//47z05upVENO2MaAaVNqr5WUNGh5scIbJHx44x/TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435116;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ADIRuleOP-NewSCL:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iaoQ0RU+lYU9ZC77EhvCmbwr5xdBvljdgyKRrKWddbA=;
	b=oQMEWEzEIqXxNi9SI3xMhbF6emRUjpVl+Ksc6yP4ICq1/xeMiZbbGIwlAnVpr/qbTk8c
	 yV/Nnk7L+hRMX7+SrtnM6vMRNYO8JOhbgGgwRLIiT1GJwdQwEsBLDy3Yvw2UJQ+L/CTMj
	 LxLRj2lwmDyuHDMHtu3FublFj2KZNCcZp6fEBC6a5E0J3sb2GxEGdeeLS9d7i5nGTcMPk
	 zxBm+d8Go/OSXjyc5UDNf1p5+t5F5rTPfsihHuIyfj+mT7N/G7xdTC25pnr+u58anpL3L
	 N6HuUWo2JWTaWSP0NqGswAN5tScC510iZOwFwZU3H9zO+CFnkvT4ky8ipMj4PPASKFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=U5Wq9qX2;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=EGHVdmvy;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C4606A31E;
	Mon, 23 Nov 2026 11:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=U5Wq9qX2;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=EGHVdmvy
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9I3IV2458483;
	Mon, 23 Nov 2026 06:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=iaoQ0RU+lYU9ZC77
	EhvCmbwr5xdBvljdgyKRrKWddbA=; b=U5Wq9qX2VKtGuJpiDHfDc+mA6JJ1EgNA
	wlVuGPL+2SVbSoa2RCp+HFEVCDY5LS1zrKgNlEVUX0dqUdPimvuCZXk4l/64IlmD
	wnXKRFqaNSSx2boowgplj1dJIpjLB+rnPg3ha13CiQamMVRn9D4OdOjb1DZ/8NXk
	o2x1ksAiTA/stjTczkRZO40mqL/AczviYpzvqwnACbpc74JTUrRwHt+u5fLXvI8f
	+sE5QqmutpD7RkPMnFZJG1gQkGMOuOpu0koZIL6CLCJlX1RIWX6ZwWd7mBwj0NdZ
	P0AtYLx/lelsNLDPvlhiPrqvoVqF7sVs2RIxuwx38HD3M7tIOOuzQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=iaoQ0RU+lYU9ZC77EhvCmbwr5xd
	BvljdgyKRrKWddbA=; b=EGHVdmvyP5YpCiueM62KOU07qIW7ChGOOyQt1sloIVN
	/pTbpPlYhPhvNqwvOJCcMWYXHI0ZGQl/8yMjVbGmfjU/GYC6wQWVsqnLUXs57gFM
	JJwMxU57NAgtvkDujsrure5lJV1uMHMWg7N8mdkALOcJtW/zKl7hyR0C7yem+Cmr
	hKiE0iwWOAulLRRWYYK4IX73zl30TyJR1miKoL5Kij8O+DyPhF0SeGJuY6fpQn0w
	1R3Nb0ET6SlcJk1Q0YVlErdkD2VQgcsgwYYKoizocD2tHBxsvoYnmAN+MWjD2AzO
	H6WbURKeWH/cVeTWZi0q74JgBWuBAq1o0Yn6zOO3MJQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j4hfh8vsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:58:10 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6ANBw9TF026359
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 06:58:09 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:58:09 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:58:08 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 06:58:08 -0500
Received: from HYB-6AVb5If9qTU.ad.analog.com (HYB-6AVb5If9qTU.ad.analog.com [10.135.4.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6ANBviVT015057;
	Mon, 23 Nov 2026 06:57:53 -0500
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
        "Iustin
 Stolniceanu" <iustin.stolniceanu@analog.com>
Subject: [PATCH net-next v3 0/7] net: ethernet: adi: adin1110: Add OPEN Alliance TC6 support
Date: Mon, 23 Nov 2026 13:57:36 +0200
Message-ID: <20261123115743.29523-1-iustin.stolniceanu@analog.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: UNi9dS_bBgmtET2VnkCyfdH4bH7SNOVx
X-Authority-Analysis: v=2.4 cv=W6StxhWk c=1 sm=1 tr=0 ts=6b042a52 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8
 a=UqCG9HQmAAAA:8 a=gAnH3GRIAAAA:8 a=baFmZNfTtkFDm3rDuxkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: UNi9dS_bBgmtET2VnkCyfdH4bH7SNOVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX6okbMMataMWu
 9pYGe6ell6H2+clcQ4bFW0NXXO1jaL5U8C15oozxOYuv0xIFemeoPC2nUZxMPHHfeXo0SZLw9Ff
 peKgfpNjqDuh1xZgeoIM00OEg7yDmOKyOdeGO58Jr1xlvw6eqrDUkhCxb8VzOEvkuPCmlxOToyB
 oe27HTmQ351NRZtnDYA5JKK/CD1I5XW4LNQJLOY5xlu8m2fdczhC9HKKyKgO/MIpAK4KSxRIZcz
 GzbkIKxWRAaJtpnCUiYiOpEuN3GKw7oNIrOzqmmcmFX7jQX1nRBawPs1SYoi6M/pfkWz5LyiEMD
 ccNIbuLlKvfc99+NPJmOFOoiGX8EMuyFjsvf+we9TAkm7Bx5RCnbJ3sk/FYEMpYvT60yStS2APO
 /p1YCiz8nqfdXZeTzxs/9lBfieoxBB6KM+mg9M1KcG1b8Yn5CP/pb6VY3gzeKoPsHOxfBI/Fijq
 qDa/d73Q7hl/wVUq5+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX3j5sMA0brq2S
 Mo7/d2zLZE81a3fBCXABZDnNV8/Y4lzqb5f1x/cQfPz1/bMo3nps70MI5LY43bJg2/fN3ubCKJY
 uZD6Ww1A3AW+1zHBHcSP5pmEc9afpnfgTGDw7S6CNhMoUV2eZNND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

The ADIN1110 supports two SPI host interface protocols: the generic SPI
protocol, which the adin1110 driver implements today, and the OPEN
Alliance TC6 protocol. Two pins select the mode, and the device latches
them when it comes out of reset:

 - SPI_CFG1 selects the protocol: OPEN Alliance TC6 when low (or left
   floating), generic SPI when high.
 - SPI_CFG0 enables the CRC8 of the generic SPI protocol, or the control
   data protection of the OPEN Alliance protocol: enabled when low,
   disabled when high.

SPI_CFG0 can be read back, as the PROTE bit of CONFIG0, and the generic
SPI case is already described by the adi,spi-crc property. No register
reports SPI_CFG1, so the protocol cannot be detected by reading the chip.

This series adds OPEN Alliance TC6 support for the ADIN1110 using the
oa_tc6 framework, selected by a new adi,spi-oa-tc6 DT property:

 1:   oa_tc6: forward declare struct mii_bus in oa_tc6.h
 2-3: oa_tc6: configurable reset settle times, and indirect MDIO access
      (MDIOACC) for MAC-PHYs without direct PHY register access
 4-5: adin1100: separate phy_driver entries per model, then skip the
      soft reset on ADIN1110/ADIN2111, as it resets the whole MAC-PHY
 6:   dt-bindings: add adi,spi-oa-tc6
 7:   adin1110: add the OPEN Alliance TC6 probe path

The ADIN2111 is not supported in OPEN Alliance TC6 mode yet.

If adi,spi-oa-tc6 does not match the board strapping, probe fails with
-ENODEV and a message pointing at the SPI_CFG1 strap and the property.

As promised in the v1 thread, I tried the wrong framing on an
EVAL-ADIN1110EBZ in both directions. OA TC6 access to a generic SPI
strapped chip gets no valid reply and does not set SPI_ERR. Generic
SPI access to an OA TC6 strapped chip returns garbage and sets HDRE and
LOFE in STATUS0, which are write-1-to-clear, and OA TC6 access keeps
working afterwards. So the protocols can be told apart, but I kept the
explicit property for now. If autodetection is preferred, I can do that
before the binding is merged.

Testing: Raspberry Pi 4 with an EVAL-ADIN1110EBZ, SPI at 25 MHz, against
a 10BASE-T1L link partner, on a normal and a debug kernel (KASAN,
lockdep, kmemleak). OPEN Alliance TC6 mode: probe/remove 20x, sysfs
unbind/bind 10x, link up/down under traffic, frame sizes 42-1514 bytes,
flood ping, ~9.4 Mbit/s TCP in each direction, 0% loss on 10 Mbit/s
bidirectional UDP, joined multicast group and macvlan traffic. Generic
SPI mode: same results with and without the series. Both mismatches
(adi,spi-oa-tc6 set on a generic SPI strapped board, and the reverse)
fail with -ENODEV and a clear message. OPEN Alliance TC6 was tested with
and without control protection (SPI_CFG0). v3 was retested in OPEN
Alliance TC6 mode with control protection, on the normal kernel.

Known limitations, unchanged by this series:
 - A "Config unsync" error (e.g. after a chip reset) makes oa_tc6
   disable the device until the driver is reloaded.
 - On unload, a lockdep enabled kernel prints a "suspicious RCU usage"
   warning from phy_detach_internal(), as phy_disconnect() is called
   without the RTNL held. The generic SPI path of the unpatched driver
   does the same.

Parts of the code and of the commit messages were developed with the
help of an AI assistant (Claude Opus 5.5); all changes were reviewed and
tested on hardware by the submitter. The v1 patches 1-4 were also
reviewed with Sashiko (Claude Opus 5.5) before sending, and the v2
findings of the Sashiko bot on the list were checked against the code
and the datasheet for v3.

Changes in v3:
 - 2/7: embed struct oa_tc6_quirks in struct oa_tc6 instead of copying
   its fields (Selvamani). Dropped Alvin's Reviewed-by, as the patch
   changed.
   Link: https://lore.kernel.org/r/CH0PR02MB78672CADFFBEFD294D82366883732@CH0PR02MB7867.namprd02.prod.outlook.com
 - 3/7: use indirect MDIO access only when STDCAP.IPRAC is set, and keep
   -ENODEV when neither DPRAC nor IPRAC is set (Sashiko)
   Link: https://lore.kernel.org/r/179448483966.2199510.8874035838800779806@kernel.org
 - 4/7: use PHY_ID_MATCH_EXACT() in the phy_driver entries, so that only
   revision 1 binds to the driver, as with the old 0xffffffcf mask
   (Sashiko)
   Link: https://lore.kernel.org/r/179448484117.2199510.5313880396309449143@kernel.org
 - 6/7: move allOf to the bottom and drop the '|' of the adi,spi-oa-tc6
   description (Krzysztof)
   Link: https://lore.kernel.org/r/20261110-stereotyped-tasteful-pelican-29046b@quoll
 - 7/7: set netdev_ops before oa_tc6_init(), which attaches the PHY and
   can read netdev_ops through netdev_need_ops_lock() (Sashiko); commit
   message: -EPROTO covers any OA TC6 reply error during initialization,
   not only the first transfer (Sashiko)
   Link: https://lore.kernel.org/r/sashiko-outbox-206699@kernel.org
   Link: https://lore.kernel.org/r/179448484417.2199510.5272200957302283278@kernel.org

v2: https://lore.kernel.org/r/20261109085952.105331-1-iustin.stolniceanu@analog.com

Changes in v2:
 - Reordered: the adin1100 patches now come before the adin1110 OA TC6
   patch that needs them, so the series bisects cleanly.
 - 1/7: new: split the struct mii_bus forward declaration out of the
   adin1110 patch (Alvin)
   Link: https://lore.kernel.org/r/au3C27DWOcZiMLxb@analog.com
 - 2/7: split reset_settle_us into hwreset_settle_us (default 1 ms) and
   softreset_settle_us (default 0); fsleep() unconditionally (Alvin)
   Link: https://lore.kernel.org/r/aus8XiLynJmSXaXc@analog.com
 - 3/7: use if (!DPRAC) mdio_indirect_mode = true (Alvin)
   Link: https://lore.kernel.org/r/aus8GQ-Xut5XBNwU@analog.com
 - 4/7: new: one phy_driver per model with PHY_ID_MATCH_MODEL() instead
   of a single entry with mask 0xffffffcf (Andrew, Alvin)
   Link: https://lore.kernel.org/r/309a1eb9-8255-42f0-a510-b40bf3302bbd@lunn.ch
 - 5/7: (was 5/5) omit .soft_reset on the ADIN1110/ADIN2111 entries
   instead of checking the PHY ID in the callback (Alvin)
   Link: https://lore.kernel.org/r/autAidTgykOObtzp@analog.com
 - 6/7: (was 3/5) disallow adi,spi-crc together with adi,spi-oa-tc6 (Alvin)
   Link: https://lore.kernel.org/r/aus899mJ-XZg6ZgF@analog.com
 - 7/7: (was 4/5) set 50 ms / 10 ms settle times from the datasheet;
   -ENODEV instead of -EOPNOTSUPP for ADIN2111; whitespace nits. Fail
   with -ENODEV and a clear message if adi,spi-oa-tc6 does not match the
   strapping (Andrew). Accept all multicast when the multicast list is not
   empty and don't set IFF_UNICAST_FLT, and use DEV_STATS_INC() for
   tx_dropped (Sashiko).
   Link: https://lore.kernel.org/r/aus-LdkVRPxR6lFu@analog.com
   Link: https://lore.kernel.org/r/c1747691-2c2e-4a7a-af04-92c94cb041b2@lunn.ch
   Link: https://lore.kernel.org/r/sashiko-outbox-197578@kernel.org

v1: https://lore.kernel.org/r/20261103160918.409701-1-iustin.stolniceanu@analog.com

Ciprian Regus (4):
  net: ethernet: oa_tc6: Allow custom reset settle time values
  net: ethernet: oa_tc6: Add support for MDIO indirect access
  dt-bindings: net: adi,adin1110: Add adi,spi-oa-tc6
  net: ethernet: adi: adin1110: Add OA TC6 protocol support for ADIN1110

Iustin Stolniceanu (3):
  net: ethernet: oa_tc6: Forward declare struct mii_bus
  net: phy: adin1100: Add separate driver entries for ADIN1110/ADIN2111
  net: phy: adin1100: Skip the soft reset on ADIN1110/ADIN2111

 .../devicetree/bindings/net/adi,adin1110.yaml |  20 +-
 drivers/net/ethernet/adi/Kconfig              |   1 +
 drivers/net/ethernet/adi/adin1110.c           | 208 +++++++++++++++++-
 drivers/net/ethernet/oa_tc6.c                 | 194 ++++++++++++++--
 drivers/net/phy/adin1100.c                    |  33 ++-
 include/linux/oa_tc6.h                        |  21 ++
 6 files changed, 445 insertions(+), 32 deletions(-)


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.43.0

