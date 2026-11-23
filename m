Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435169;
	b=bSAppmpKLp1fn6URYdKhsTNr74Q4WdV5R3b4QsZn/yvm9ddBgjSx1piaxqirGGOIYoq+
	 IuvLV9CnNaZPd2mmMS1P1VZ9KynaCxsL2pMbVmobiMVQZNncT7cWxYYTvzth4+vzyeLCs
	 zvHVc2SqszbY/VVr7PibHHgpVahsIhGx3jCH6wZ6RTPAsH1FFoYWJfJ5uKpqOj2TvHLxL
	 KWnNhbauxMzb6bbqlm4cu1q2P4sbMMKE+45bIj11dFpHKqo/iANklMCJaTXvkkIGHsGyU
	 XVHl/sHQ8JRZEEn7BqcsAkRRsIiGWXakTiVL1FYzanUsK1Jwgo5/a4jokzpgZywzaoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435169;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=escHOelNXfvnoKlJXHoXhj/kvNjlO6/rrb7M7K3lxW8=;
	b=CAFFmQv7jMhUjeXZp2CkNggLqSSjpJLVW1ktZ7OOg7cn9t4+myA1mTTR3uTueyUSlbrW
	 TuEyT8i4WaKNBdugWGe7JL7pDvnAnM6mPAVUVyt1OZHTkJ4GbPVcQvBmsCn6kTtt4OhiB
	 6ioXknb1pS/PnSLX6B3UYQtb7lSMmgeKIHYsDgR0WBd7XdOqZXm0oOio4NP44x85E1bdT
	 XbgnLJvHgPawzcNkKOGG3iL33euN52Cx5c+d90LmJIjvbOoie/WBgC2kUgcx+eqbbtuC3
	 BkBH4usrcNCeCQe7MLQtxGNrLk2wovmbugNzwSKJ7gjXiBMXN+FoDmTzDGm/IC2gPzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=d53aP2dH;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=DBEZUjm6;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226AA606A32C;
	Mon, 23 Nov 2026 11:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=d53aP2dH;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=DBEZUjm6
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GG9O037623;
	Mon, 23 Nov 2026 06:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=escHOelNXfvnoKlJXHoXhj/kvNjlO6/rrb7M7K3lxW8=; b=d53aP2d
	HzFuwphDiyu3rLYjWgfA+aAvqOzYFwwB1nVrRaLTSsedMuPwKab6zBu5i6J43deI
	UOH4kHg8/kszmUAmuB4Dp2O9EshTpCirqANKtgWfv7Jgu7129OAg2yR4Jj42iVD0
	WTwv4iuDJ1zi/xffxy6NxAzCsAu1iW9nhPtznxs22Sqopfbp7ztXGT0eINqYPkKC
	f8SIaeMN6Os6NptC69Lt2Ol8RjrFm4jVo2A9GjGONZU6SSpvh2+Ys+0O9hM7U25p
	sDUmU6eKl3ilgOxIblFKP95rEBebJ0m9OIkB584FPL78oeDmXgQO/9arAD919zS1
	vmZUcuPWMaeNHtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=escHO
	elNXfvnoKlJXHoXhj/kvNjlO6/rrb7M7K3lxW8=; b=DBEZUjm6AH0MqH2TY//lS
	Bd7Bvm7zOm81LfzlM57OYrGGl8Oq1Hvh6xens+bbB478XDtdh01uJoH4BxUs9mBu
	m5kzlhvfez5rjEJnz9KXvyzICtUmtLqiudXYSQXFuwHJyU6DDH1I/emJKQBlafn5
	rsnrUl5TLWdrtqAeK3PvTONTWpQNcAHGJ2QzS48a6hPE99bA7O43NvQxvqT+Alzs
	EnzDKru8qk2H8uV3+e2yUvxlF0XGZgEWaAumLgjpYo5ClCLFoPsq/3ivalFqG8Gn
	cE97c5rigVFJS+BgdH6dC8gFFv+1EhHlGLzrF/MJ2+hnKvdOWyZue/FmhpXoS5YF
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j4bfa2t8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:59:04 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6ANBx2Z1040204
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 06:59:03 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:59:02 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:59:02 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 06:59:02 -0500
Received: from HYB-6AVb5If9qTU.ad.analog.com (HYB-6AVb5If9qTU.ad.analog.com [10.135.4.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6ANBviVW015057;
	Mon, 23 Nov 2026 06:58:55 -0500
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
Subject: [PATCH net-next v3 3/7] net: ethernet: oa_tc6: Add support for MDIO indirect access
Date: Mon, 23 Nov 2026 13:57:39 +0200
Message-ID: <20261123115743.29523-4-iustin.stolniceanu@analog.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX5KmRYS28KQaS
 sEaCTeDPpKcJWE4U1ugiC2qfZMcKwLdVHHsjNqoDEHxhz0mELJygykEEHcAENWzlzeE9/mfvswZ
 mMFGP6yM/0qVNW/VGxBYKqConS+8z+jlbkc1OrHKWlzjhEFBxfV139fuv2uG1qRi/lurePjTuUf
 Z5SVOCRTePBTmZ08355zBKHiY3IFXF1dZ6U80Lzjv+74KAreykQjGIYBSJZaSbDHvtLM0TJsp9n
 wYDRX8IGbGF7I/QXyZAXn1wa2MwKaTrDl6khA44+2WlraN3a0TPtJC6ijGAY7oLj1oX2S7kF7YX
 DKT1Oqy9JjJSnI8mVwmZ6K9jf9rGmZjnsMI36d4EHF6WkP1OOeGSbeqUTXOKopryw0McQgcT8NK
 sisCkLV2zpoUlPCQxFG6Aeb9HhNB2clyPCQlR0BYhV3v4irlBERfU1HAvKk/lQ59NSve4fisRdi
 p0AIAKrokUUb4OUdNDg==
X-Authority-Analysis: v=2.4 cv=OK+yTiaB c=1 sm=1 tr=0 ts=6b042a88 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=9UH48PSwySGxxZJ2Z1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: XCcsKlVJIMaj0SLYaPVOk_RnePhxdnYD
X-Proofpoint-GUID: XCcsKlVJIMaj0SLYaPVOk_RnePhxdnYD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX0/wUVICPosw0
 Sl+yYnIORf0oGCqhFknG5bIhfMPS/uQk36z7cE7qOfCpVFGkQGmYiuXmnwjyNKjSe+LWUHCaMPO
 o66OwDz0COL8fUjANiEkSir+ZnoJ8Ft0f5kR4cSM1SmpyT66En1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

From: Ciprian Regus <ciprian.regus@analog.com>

The OPEN Alliance TC6 specification defines two ways for the SPI host
to access the registers of the PHY integrated in a MAC-PHY: direct
access, where the PHY registers are mapped into the MAC-PHY register
space, and indirect access, through the MDIOACC registers. A MAC-PHY
reports support for direct access through the DPRAC bit in the STDCAP
register.

The framework currently supports only direct access and fails to
register the MDIO bus when DPRAC is not set.

Read STDCAP when registering the MDIO bus. If direct access is not
supported but indirect access is, reported by the IPRAC bit, implement
the Clause 22 and Clause 45 MDIO operations as indirect transactions
through MDIOACC. If neither is supported, keep failing with -ENODEV.
For Clause 45, write the address command to MDIOACC0 and the read or
write command to MDIOACC1; for Clause 22, write the command to
MDIOACC1. Then poll for TRDONE.

If TAERR (turnaround error) is set, no PHY answered at that address
and the DATA field must be ignored. Return 0xffff in that case, as
for an empty address on an MDIO bus, so that the PHY bus scan skips
the address instead of failing. Return -EIO for a write.

Signed-off-by: Ciprian Regus <ciprian.regus@analog.com>
Signed-off-by: Iustin Stolniceanu <iustin.stolniceanu@analog.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 drivers/net/ethernet/oa_tc6.c | 176 +++++++++++++++++++++++++++++++---
 include/linux/oa_tc6.h        |  16 ++++
 2 files changed, 177 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index c05480b7920e..ca33df9f045e 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -89,6 +89,7 @@ struct oa_tc6 {
 	bool int_flag;
 	bool disable_traffic;
 	bool prot_ctrl;
+	bool mdio_indirect_mode;
 	struct oa_tc6_quirks quirks;
 	struct gpio_desc *reset_gpio;
 };
@@ -434,24 +435,149 @@ int oa_tc6_write_register_mms(struct oa_tc6 *tc6, u8 mms, u16 address,
 }
 EXPORT_SYMBOL_GPL(oa_tc6_write_register_mms);
 
-static int oa_tc6_check_phy_reg_direct_access_capability(struct oa_tc6 *tc6)
+static void oa_tc6_handle_link_change(struct net_device *netdev)
 {
-	u32 regval;
+	phy_print_status(netdev->phydev);
+}
+
+static int oa_tc6_mdioacc_wait_done(struct oa_tc6 *tc6, u32 *regval)
+{
+	int ret, err;
+
+	ret = read_poll_timeout(oa_tc6_read_register, err,
+				err || (*regval & OA_TC6_MDIOACC_TRDONE),
+				100, 30000, false, tc6, OA_TC6_REG_MDIOACC(1),
+				regval);
+	if (ret)
+		return ret;
+
+	return err;
+}
+
+/* On a turnaround error no PHY answered and the DATA field must be ignored.
+ * Return all ones, like an MDIO bus with no PHY at that address, so that
+ * bus scanning skips the address instead of failing.
+ */
+static int oa_tc6_mdioacc_read_data(u32 reg_val)
+{
+	if (reg_val & OA_TC6_MDIOACC_TAERR)
+		return 0xffff;
+
+	return FIELD_GET(OA_TC6_MDIOACC_DATA, reg_val);
+}
+
+static int oa_tc6_mdioacc_write_done(struct oa_tc6 *tc6)
+{
+	u32 reg_val;
 	int ret;
 
-	ret = oa_tc6_read_register(tc6, OA_TC6_REG_STDCAP, &regval);
+	ret = oa_tc6_mdioacc_wait_done(tc6, &reg_val);
 	if (ret)
 		return ret;
 
-	if (!(regval & OA_TC6_STDCAP_DIRECT_PHY_REG_ACCESS))
-		return -ENODEV;
+	return reg_val & OA_TC6_MDIOACC_TAERR ? -EIO : 0;
+}
 
-	return 0;
+static int oa_tc6_indirect_mdiobus_read_c45(struct oa_tc6 *tc6, int addr,
+					    int devnum, int regnum)
+{
+	u32 reg_val;
+	int ret;
+
+	reg_val = FIELD_PREP(OA_TC6_MDIOACC_OP, OA_TC6_MDIOACC_OP_ADDR);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_ST, OA_TC6_MDIOACC_ST_C45);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_PRTAD, addr);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DEVAD, devnum);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DATA, regnum);
+
+	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(0), reg_val);
+	if (ret)
+		return ret;
+
+	reg_val = FIELD_PREP(OA_TC6_MDIOACC_OP, OA_TC6_MDIOACC_OP_RD);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_ST, OA_TC6_MDIOACC_ST_C45);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_PRTAD, addr);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DEVAD, devnum);
+
+	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(1), reg_val);
+	if (ret)
+		return ret;
+
+	ret = oa_tc6_mdioacc_wait_done(tc6, &reg_val);
+	if (ret)
+		return ret;
+
+	return oa_tc6_mdioacc_read_data(reg_val);
 }
 
-static void oa_tc6_handle_link_change(struct net_device *netdev)
+static int oa_tc6_indirect_mdiobus_write_c45(struct oa_tc6 *tc6, int addr,
+					     int devnum, int regnum, u16 val)
 {
-	phy_print_status(netdev->phydev);
+	u32 reg_val;
+	int ret;
+
+	reg_val = FIELD_PREP(OA_TC6_MDIOACC_OP, OA_TC6_MDIOACC_OP_ADDR);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_ST, OA_TC6_MDIOACC_ST_C45);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_PRTAD, addr);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DEVAD, devnum);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DATA, regnum);
+
+	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(0), reg_val);
+	if (ret)
+		return ret;
+
+	reg_val = FIELD_PREP(OA_TC6_MDIOACC_OP, OA_TC6_MDIOACC_OP_WR);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_ST, OA_TC6_MDIOACC_ST_C45);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_PRTAD, addr);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DEVAD, devnum);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DATA, val);
+
+	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(1), reg_val);
+	if (ret)
+		return ret;
+
+	return oa_tc6_mdioacc_write_done(tc6);
+}
+
+static int oa_tc6_indirect_mdiobus_read(struct oa_tc6 *tc6, int addr,
+					int regnum)
+{
+	u32 reg_val;
+	int ret;
+
+	reg_val = FIELD_PREP(OA_TC6_MDIOACC_OP, OA_TC6_MDIOACC_OP_RD);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_ST, OA_TC6_MDIOACC_ST_C22);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_PRTAD, addr);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DEVAD, regnum);
+
+	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(1), reg_val);
+	if (ret)
+		return ret;
+
+	ret = oa_tc6_mdioacc_wait_done(tc6, &reg_val);
+	if (ret)
+		return ret;
+
+	return oa_tc6_mdioacc_read_data(reg_val);
+}
+
+static int oa_tc6_indirect_mdiobus_write(struct oa_tc6 *tc6, int addr,
+					 int regnum, u16 val)
+{
+	u32 reg_val;
+	int ret;
+
+	reg_val = FIELD_PREP(OA_TC6_MDIOACC_OP, OA_TC6_MDIOACC_OP_WR);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_ST, OA_TC6_MDIOACC_ST_C22);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_PRTAD, addr);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DEVAD, regnum);
+	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DATA, val);
+
+	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(1), reg_val);
+	if (ret)
+		return ret;
+
+	return oa_tc6_mdioacc_write_done(tc6);
 }
 
 static int oa_tc6_mdiobus_read(struct mii_bus *bus, int addr, int regnum)
@@ -460,6 +586,9 @@ static int oa_tc6_mdiobus_read(struct mii_bus *bus, int addr, int regnum)
 	u32 regval;
 	int ret;
 
+	if (tc6->mdio_indirect_mode)
+		return oa_tc6_indirect_mdiobus_read(tc6, addr, regnum);
+
 	ret = oa_tc6_read_register(tc6, OA_TC6_PHY_STD_REG_ADDR_BASE |
 				   (regnum & OA_TC6_PHY_STD_REG_ADDR_MASK),
 				   &regval);
@@ -474,6 +603,9 @@ static int oa_tc6_mdiobus_write(struct mii_bus *bus, int addr, int regnum,
 {
 	struct oa_tc6 *tc6 = bus->priv;
 
+	if (tc6->mdio_indirect_mode)
+		return oa_tc6_indirect_mdiobus_write(tc6, addr, regnum, val);
+
 	return oa_tc6_write_register(tc6, OA_TC6_PHY_STD_REG_ADDR_BASE |
 				     (regnum & OA_TC6_PHY_STD_REG_ADDR_MASK),
 				     val);
@@ -505,6 +637,10 @@ int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, int addr, int devnum,
 	int mms;
 	int ret;
 
+	if (tc6->mdio_indirect_mode)
+		return oa_tc6_indirect_mdiobus_read_c45(tc6, addr, devnum,
+							regnum);
+
 	mms = oa_tc6_get_phy_c45_mms(devnum);
 	if (mms < 0)
 		return mms;
@@ -523,6 +659,10 @@ int oa_tc6_mdiobus_write_c45(struct mii_bus *bus, int addr, int devnum,
 	struct oa_tc6 *tc6 = bus->priv;
 	int mms;
 
+	if (tc6->mdio_indirect_mode)
+		return oa_tc6_indirect_mdiobus_write_c45(tc6, addr, devnum,
+							 regnum, val);
+
 	mms = oa_tc6_get_phy_c45_mms(devnum);
 	if (mms < 0)
 		return mms;
@@ -533,8 +673,21 @@ EXPORT_SYMBOL_GPL(oa_tc6_mdiobus_write_c45);
 
 static int oa_tc6_mdiobus_register(struct oa_tc6 *tc6)
 {
+	u32 regval;
 	int ret;
 
+	ret = oa_tc6_read_register(tc6, OA_TC6_REG_STDCAP, &regval);
+	if (ret)
+		return ret;
+
+	if (!(regval & OA_TC6_STDCAP_DIRECT_PHY_REG_ACCESS)) {
+		if (!(regval & OA_TC6_STDCAP_INDIRECT_PHY_REG_ACCESS)) {
+			netdev_err(tc6->netdev, "MDIO direct/indirect access not supported\n");
+			return -ENODEV;
+		}
+		tc6->mdio_indirect_mode = true;
+	}
+
 	tc6->mdiobus = mdiobus_alloc();
 	if (!tc6->mdiobus) {
 		netdev_err(tc6->netdev, "MDIO bus alloc failed\n");
@@ -585,13 +738,6 @@ static int oa_tc6_phy_init(struct oa_tc6 *tc6)
 	if (tc6->quirks.quirk_flags & OA_TC6_BROKEN_PHY)
 		return 0;
 
-	ret = oa_tc6_check_phy_reg_direct_access_capability(tc6);
-	if (ret) {
-		netdev_err(tc6->netdev,
-			   "Direct PHY register access is not supported by the MAC-PHY\n");
-		return ret;
-	}
-
 	ret = oa_tc6_mdiobus_register(tc6);
 	if (ret)
 		return ret;
diff --git a/include/linux/oa_tc6.h b/include/linux/oa_tc6.h
index f676e712e75d..caafc17eff59 100644
--- a/include/linux/oa_tc6.h
+++ b/include/linux/oa_tc6.h
@@ -13,6 +13,7 @@
 /* OPEN Alliance TC6 registers */
 /* Standard Capabilities Register */
 #define OA_TC6_REG_STDCAP			0x0002
+#define OA_TC6_STDCAP_INDIRECT_PHY_REG_ACCESS	BIT(9)
 #define OA_TC6_STDCAP_DIRECT_PHY_REG_ACCESS	BIT(8)
 
 /* Reset Control and Status Register */
@@ -50,6 +51,21 @@
 #define OA_TC6_INT_MASK0_ALL_INTERRUPTS                 (GENMASK(5, 0) | \
 							 GENMASK(12, 7))
 
+#define OA_TC6_REG_MDIOACC(x)	(0x20 + (x))
+#define OA_TC6_MDIOACC_TRDONE	BIT(31)
+#define OA_TC6_MDIOACC_TAERR	BIT(30)
+#define OA_TC6_MDIOACC_ST	GENMASK(29, 28)
+#define OA_TC6_MDIOACC_OP	GENMASK(27, 26)
+#define OA_TC6_MDIOACC_PRTAD	GENMASK(25, 21)
+#define OA_TC6_MDIOACC_DEVAD	GENMASK(20, 16)
+#define OA_TC6_MDIOACC_DATA	GENMASK(15, 0)
+
+#define OA_TC6_MDIOACC_ST_C45		0x0
+#define OA_TC6_MDIOACC_ST_C22		0x1
+#define OA_TC6_MDIOACC_OP_ADDR		0x0
+#define OA_TC6_MDIOACC_OP_WR		0x1
+#define OA_TC6_MDIOACC_OP_RD		0x3
+
 /* PHY Clause 22 registers base address and mask */
 #define OA_TC6_PHY_STD_REG_ADDR_BASE		0xFF00
 #define OA_TC6_PHY_STD_REG_ADDR_MASK		0x1F
-- 
2.43.0

