Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435149;
	b=lnhlZxRVJqU4nelWiDrJo8dsNdhctbG1Z0yvBggmDmPzNthOKSJIKOd2eLj1gIxbaEVX
	 mN9cq1o9Y1eXsrWetGO33wPTkqvibtLFvPbn06ZeT6uaZb4dgKubcI39EJKMw1s6DFRwK
	 6TiMgNfzkhU6OVxzxqiqkTmW3JndMC4d7GGvEAJVENcNjCQut9yPypCdSp2yTmQ/pPsRL
	 XRoQ9feG+Emx9tfz98imlm7bNcOgwWMjUL1StfNBlqJq2BVehfMEgFAqAgOtqp6OfLINu
	 h2YL204ybR9zr3qU8mu2shmt9osguoEIZdtLqIENusgK5YjO34NtoukosF3+AvgKITg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435149;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ADIRuleOP-NewSCL:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j8Ocqsew3LJLs03VzYc/+R3Ds++ZKzhowKP5Ae2QpZE=;
	b=uUksvYb2AZbhzCeY4OVOaS2YRBpYb3bEnsxisqhQgLp3uxAcFUWkwAix+pUwgiKyYIqn
	 7XdnFof89BxglJVtw7d0mxU9/QHxuDmOWA/m5CwjOxfzA68zUnkEFI35/s3ugvrxvfqyP
	 cHO3b6WKCJTPMHx2F5Ei5bkYenqiqrqRdP81pUN6atXAJgozfNIWjxRwg3rL33NKt/wxr
	 SGgPd1XqTbU+zWN0YOpwFcMiqCY69YtElUNJtt0tBLjf/dGHMaqifTjTv6d2Fr2K1+sWs
	 OIZJqqdt4SKtD70HE2SAVei3Ee+UCb1eFjYbDPEqbwmQ/7as4Y6GTPznKkfM3oB72dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cj7DjJ44;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=MNlCFOoB;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630C2606A31E;
	Mon, 23 Nov 2026 11:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 630C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cj7DjJ44;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=MNlCFOoB
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9I3Ib2458483;
	Mon, 23 Nov 2026 06:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=j8Ocqsew3LJLs03VzYc/+R3Ds++ZKzhowKP5Ae2QpZE=; b=cj7DjJ4
	4PyjMBIGdv+yWejnn1lOSnI/z7VOVqSWVwOtPQoF6vPM4j0xv55fqTsu8KP0Kzur
	oStGqoLvJEdw212aXo7z/L9wt/Nur4BnQNT4mH+HW4lMbii0Vl4RbjVSYUFYuyeu
	HRNIi+U8BQEEJR9bxKnvyOzLmpRFvi5W96p4r7MOdo8vWX8k2Q0YcQKSHkOnai41
	/rXXTouWdlwzP/+7MMJRev7fGbdECJWEx0Ry0VmGjPBVPnbYyDJwM/FqyFgQ1aCA
	PwSCwnd3yo81dFl2GBCDcNdrq81ZEfsSS+g78dvJTkVu3cyZMbtimVFQQuELsK5Q
	4c8vesVnuHUrlpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=j8Ocq
	sew3LJLs03VzYc/+R3Ds++ZKzhowKP5Ae2QpZE=; b=MNlCFOoB2e0U4so/cQzts
	/jjcpYJW9q8zer8GVcR5DxAvA1jgZvw0EAIASxGVKRcpjovFV2TB+x5dQlNtozIh
	ogXi6lOCWJQAc+U3nUlxsZns+NFo/cUNmt0BUO7ur2ivAMSGoIZtFcVHfMkQvM9A
	hn852Mw/CwpldzL4trDObgkUTe+5azYkinZf22Zb6OfcCxgiwwZhdOvHssbZiBn3
	k8xnykAtVCGKPE9x4ILL4XVgsIQxSgVy1pRrG8yv3VIwGGaBJumtPsVh1Y4/njbe
	yJ9ULB6zsYA53lsx+f/K0HsG5SYgx4N1GUVdfiqGSLZP77J4uFVOresnhmoaPwk8
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j4hfh8vug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:58:54 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6ANBwrU4040201
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 06:58:53 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 06:58:53 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 06:58:53 -0500
Received: from HYB-6AVb5If9qTU.ad.analog.com (HYB-6AVb5If9qTU.ad.analog.com [10.135.4.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6ANBviVU015057;
	Mon, 23 Nov 2026 06:58:41 -0500
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
Subject: [PATCH net-next v3 1/7] net: ethernet: oa_tc6: Forward declare struct mii_bus
Date: Mon, 23 Nov 2026 13:57:37 +0200
Message-ID: <20261123115743.29523-2-iustin.stolniceanu@analog.com>
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
X-Proofpoint-GUID: R9SOHJGfVAlEWlyCFDOmeyNUptYEGduu
X-Authority-Analysis: v=2.4 cv=W6StxhWk c=1 sm=1 tr=0 ts=6b042a7e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=rm3cWVSmaQPXSYzvH3IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: R9SOHJGfVAlEWlyCFDOmeyNUptYEGduu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX2xJP8sERJqzG
 uydygVA7xlyKOBN36mEqxGYZHM0SNcqKIuXsuBCcGc+jthltWxEF8jS7JG1k8wz2ZZb37L+L2pj
 mEJNxgrSVnhBE4V9nB6O5/ripySbA+f5f4Gt1ie0wpZqKSwSNhHACeyYnIImDzdOLO/2hNczfxA
 4zmEo4Y1QQGy2EJOeirKySWuTo3TaihtFHTZxrokldku5WfLSX/DHmpPaEf5QFzTvNeBsUkFvZn
 MwlekBdsdLZpaf9enMAcxIo6ePBi3wdR0BKyAvP6R7JyvuuqmIiZPlBDF/aRQtHnOLFoF7RYxab
 bghxWtRw1WVRKE1u+kTJY6bkO0xaJ4dEQm4odqDvtdZLVP1S21SpwEZkYyyvRNg4UL+02iOaE7b
 F9TYfLVh4eicr3M84VfQIRUXrgTgBH6y6mxCjfyu4UCHIaYvcyyzIQaSHcrHMqaJcyinIbxL+Co
 fo+ZLKcpGqeex+KTE1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX/AR0OLrlc56I
 LUlA8eShhuTjzrScVwZHbQMtdWx0gXqESx4SH0Hyf8gt841ggSEvPm5+JlJmadIe4hViZGMhc+F
 T99c9obSTbtFYvbx+X04qd/glAi59gdsKfb9uN05xPkhcKNVf+yj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

The Clause 45 MDIO accessors in oa_tc6.h take a struct mii_bus pointer,
but the header does not declare the type. A file that includes oa_tc6.h
before linux/phy.h or linux/mdio.h gets a "'struct mii_bus' declared
inside parameter list" warning, which is an error with CONFIG_WERROR.

lan865x and adin1140 are not affected, as they include one of those
first. The adin1110 driver, which gets OA TC6 support later in this
series, does not, and hits the warning.

Signed-off-by: Iustin Stolniceanu <iustin.stolniceanu@analog.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 include/linux/oa_tc6.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/oa_tc6.h b/include/linux/oa_tc6.h
index 27f652d4920b..6eac6b842156 100644
--- a/include/linux/oa_tc6.h
+++ b/include/linux/oa_tc6.h
@@ -64,6 +64,7 @@
 #define OA_TC6_PHY_C45_AUTO_NEG_MMS5		5	/* MMD 7 */
 #define OA_TC6_PHY_C45_POWER_UNIT_MMS6		6	/* MMD 13 */
 
+struct mii_bus;
 struct oa_tc6;
 
 enum oa_tc6_quirk_flag {
-- 
2.43.0

