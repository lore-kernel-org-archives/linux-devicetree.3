Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435181;
	b=LssrBb9SWSRCdU/r08TE23SuJux8dgAjf9BBVIqGzv4tyuP6mlkIjv/MquYLj3GSQI+6
	 y7/qHqNeUZK92bIH7gbAdET/VSE9u0sDnJRm7X8U6lJqpBdIhV99ixmfn993nBzMGcx7/
	 fnYxDQh+h5r77FJ0o8vme5RD7yxbjKzp7APs4JYrJRT68GCpnXDcczYMaP9/++lSMRKM3
	 tFIpa2s5An8qvBUgtCzCqkVLtk5pUImlEMuCM3u2AJUb/FL10U8EFu1KMZGBrPWLVswT+
	 VGjMtmsumLytNsLzhbIsiPkOK9lsn5bJR1VgoQFDIvYbO58LgW0UCT643kLliuYC1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435181;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0Wi9/OMCwAWvC6KeqUukz/wTZ7HBm7SCkx9AIi5AFaI=;
	b=Rh4XNKwLWFMIlKnbsJq7h3KFVlonTLtGlCZaNLQ+5EOu3AKBiTdu3LzU+e+zxz/FX+Ke
	 39CFnYCH9uiMrwYY1uma7+bn4gY9r8IgXlAFVxtXC91E2QEMq6gRwObb24u2muzJbMs0+
	 KJf469rN3BWCZJbCfmCasqvsVgEltEvnvZEycCQJ6RdV3rBxkRGR2WreVIDev3AvUKea5
	 DS2K4PF0D2SV9OZJxxmrvDAk41Ebw7uuZuFxkKLpARdttIaaygJXKC84FMO6PKoNzueSx
	 HYg11ywbl9X8fBXiJc2AVKlHyJnzG1227pjO2/MiVhhMumd05aBPmr+6ga/ryV7/yQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="ExaK/N6y";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Nj59yOvr;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5887606A337;
	Mon, 23 Nov 2026 11:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5887606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=ExaK/N6y;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Nj59yOvr
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9HeTc261193;
	Mon, 23 Nov 2026 06:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=0Wi9/OMCwAWvC6KeqUukz/wTZ7HBm7SCkx9AIi5AFaI=; b=ExaK/N6
	y0CozAOgsJWOIOowbXZhdZ3u8gmmLVK5sNetWiIORk4yTwLLDqMhTc1u1LlHtaS5
	zH5m8WIFt/dPIX8HbMB2Is/nHgKDYm1U2xAnYOvuiSr4nLyMjAJfSkFLKQ0QdZ6t
	/Po5g2NJxJNuGT7HlkYmYvSGc91Ksnyr2iIwaZTt57DgRghUNyi2X67oGnnWAb32
	D9AbqUEh0wEPt7JtigQrn0+/5dohn8xpRjYGK+/iD2+69yjAJWLJDgNCYA+mxRbt
	XRCyW99v506DZH05R7IEY5MrLfEMSwePPWK+CFF1n5XlvM8qMhwcQAWdoKxXHkcP
	/f4nLwO9Pvqm2Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=0Wi9/
	OMCwAWvC6KeqUukz/wTZ7HBm7SCkx9AIi5AFaI=; b=Nj59yOvrQRiiCprzAoonU
	rZD+Q6pvF5ORXrFCGwqVyDhBGgrIvxtibEwq7V1iJpiX5St4J53A7Ru+kLo88hcO
	J1h+Sh3+O+niB9+NygRzBG66NX4SVW49rAf1ghKyuFBhsejwBEVjQa5Yfzu3413M
	pyU1hZzH0bgdGwrryT3S2ZW+bxct1dNUGkbcF2suqNXXxvcrmgBmkLZTwF0/vsE2
	DFt88dkhcFHP8zwjJB3RtYSh7iMUGCvdjh1cG1PmF4lZNv9BerbtL5obdSlWtVJZ
	XiBvm9O8USYUVyVgD9DdkXCG0yXrby5ZXnt+o71TfcyaqhZwL/MNI2MWkYjdkQjX
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j3wgm5wpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:59:18 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6ANBxH9c026393
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 06:59:17 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:59:16 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:59:16 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 06:59:16 -0500
Received: from HYB-6AVb5If9qTU.ad.analog.com (HYB-6AVb5If9qTU.ad.analog.com [10.135.4.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6ANBviVZ015057;
	Mon, 23 Nov 2026 06:59:09 -0500
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
Subject: [PATCH net-next v3 6/7] dt-bindings: net: adi,adin1110: Add adi,spi-oa-tc6
Date: Mon, 23 Nov 2026 13:57:42 +0200
Message-ID: <20261123115743.29523-7-iustin.stolniceanu@analog.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX+2U//zhfFprA
 2NDAe/4Amk/phpU9P98uI+zekeA+sPK3HfA7GRaECsEAD9AYM8xeH3WervoktsQ+tGA0Eg7zcxf
 WG3MDg1hSYjDbnbJ0bRioxdzJ0demr5M02YpMgyIbqjK9kc2AiUOA53j1T0PLj0k+Jbo+nczue8
 FeQvs6F6KfBQoDJ5Kcaj790zarWTJ//nt0MRbJorTRVxC6B7dnDnR118MU4GJMq3+tj2tvt60lM
 +z/tAiXY/nfTUTo01ah2tESwiAZJNwyVR4S3p7V6aZOpst0IDQvmdbeQJkfaEWtrYWPn7Q53ATj
 B/39G2hm3RxwTDn9Lr+wTP/337sV/XnXe/l8l3oSiHn+0U9TBImsxsk7zFBchDZXwNBGHI+sgEw
 UrjMOW0kXNOQX2pHYHd4Dc/Tifp0+fWmHgrOU0ONEZWiiGQCXJsS7nBvECWMXVM95way27uk8nh
 LZAyhFlH6HPDVp316DQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX78/oQXlSqKl4
 c5fUcq9jit9KtV971/GIWFlBO/uui1cmn/GEtiabbSYf+S8hfaAN0i92geOK5xC1RumERiMf2m3
 HS3uUJbJsnaJ9YbOHdH5TdX8wuTSqTTkJdNN4PVPafpMZu9lk6To
X-Authority-Analysis: v=2.4 cv=FeGiV5+6 c=1 sm=1 tr=0 ts=6b042a96 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8 a=8A3dPQpsB03echwE1zkA:9
X-Proofpoint-ORIG-GUID: sYUMJW0yZL4M2EDZ8h8MeMY09HgPZLaL
X-Proofpoint-GUID: sYUMJW0yZL4M2EDZ8h8MeMY09HgPZLaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

From: Ciprian Regus <ciprian.regus@analog.com>

The ADIN1110 and ADIN2111 support two SPI host interface protocols:
the generic SPI protocol and the OPEN Alliance TC6 protocol. The
protocol is selected by the state of the SPI_CFG1 pin, which the device
latches when it comes out of reset, together with SPI_CFG0, which
selects CRC (generic SPI) or protection (OPEN Alliance) mode.

The protocol is set by the board hardware, so the driver must know it
in advance. Add a boolean property to describe a device configured for
the OPEN Alliance TC6 protocol. Without it, the generic SPI protocol is
assumed, as before.

adi,spi-crc enables the CRC of the generic SPI protocol, so it is not
allowed together with adi,spi-oa-tc6. The OPEN Alliance protection mode
needs no property, as the driver reads it from the PROTE bit in CONFIG0.

Signed-off-by: Ciprian Regus <ciprian.regus@analog.com>
Signed-off-by: Iustin Stolniceanu <iustin.stolniceanu@analog.com>
---
 .../devicetree/bindings/net/adi,adin1110.yaml | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/adi,adin1110.yaml b/Documentation/devicetree/bindings/net/adi,adin1110.yaml
index 0a73e01d7f97..f9efa0e614d6 100644
--- a/Documentation/devicetree/bindings/net/adi,adin1110.yaml
+++ b/Documentation/devicetree/bindings/net/adi,adin1110.yaml
@@ -25,10 +25,6 @@ description: |
   The device has a 4-wire SPI interface for communication
   between the MAC and host processor.
 
-allOf:
-  - $ref: ethernet-controller.yaml#
-  - $ref: /schemas/spi/spi-peripheral-props.yaml#
-
 properties:
   compatible:
     enum:
@@ -43,6 +39,12 @@ properties:
       Enable CRC8 checks on SPI read/writes.
     type: boolean
 
+  adi,spi-oa-tc6:
+    description:
+      The device is configured, through the SPI_CFG1 pin, for the
+      OPEN Alliance TC6 protocol instead of the generic SPI one.
+    type: boolean
+
   interrupts:
     maxItems: 1
 
@@ -55,6 +57,16 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: ethernet-controller.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      required:
+        - adi,spi-oa-tc6
+    then:
+      properties:
+        adi,spi-crc: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0

