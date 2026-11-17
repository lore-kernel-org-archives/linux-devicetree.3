Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922736;
	b=z4fn1l8ASrHLMOBjBwwO46/9zN97YAaNJu1oclC4Uq616mW3dztCD6/UL/7sGrsKUgcD
	 HOjTo8J3pGOYjFGAb6NPobdswO7ffTTBADbyXKmRC6EHNr5naqwGXJqIT3L1cRNGsOd1h
	 2Q492tDiCj+oyg1nJx+qcndtZu1tr+M7gdlHnHmL9beeOFy47nUQllZyT5g0KA6hIXX1m
	 smdDHBX0bglchOzPkitvAAMDqEvO4J+fp41CwUDBPKDbgK3poKlACSeqhfsS+YsVZtP3D
	 2eHVohTVGW/jBh7bTJrKv3CKOuvLxgUv1mu04sKJv0Bi78MDI9oMVEyv8o5PLR19rqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=;
	b=d6g6W5n78x78g9vTBCTzFyDnFzk3yaQ7Lc5HOGJud0T6JrCCyGLbDlgXSUw+fI3OpT5C
	 1lkDhB58SZZD5Mu1tIxcXRPQijW9lmFG77bJrWyFksunyYnvaaUrDjvpK3PwC6SDrQpXp
	 5t24h1GdUUfguQoOcIWGR0IKGb8XOivkpTCMOZULqHwj3HynJHtd29rhyHZgXYW4TUy9k
	 pGWP7thc9moY6MEkJAfg37tbygIB12L5PXjqXzAuxFbwk0/pVIAyVs9sJmf5OF13m+uzC
	 XSArtyCHP5mW5rbAhJzY/IGTuCifrrlDmm3uRsEZcNNXlpxWyI0AI/cbSKTMNIlGKmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORyrDY50;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RucMOsiW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB226606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB226606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORyrDY50;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RucMOsiW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3tuP2096369
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrW
	NmU2ZASE=; b=ORyrDY50SWYvgMTZehL76oVezNq9eyfaXW928tJardHIF3FHmwP
	4iEJO5B0YNE5/ksTfUru6hZIL4k7OAkzABNPVnhN9SRnjh8b2LN5FNketEXSgvoi
	MrzV0zn5q+Rd2z19YVFCKJwe2Mm3fL/WC3MJ28VyHH7jc3ToyF9QUsvyiZwiG5ss
	nLAY/IdRYrN4QJbB4EzZJkKF7nfPixjtjt4L9PvSIXwDtWmb/Ij2xkZLQlKYDJ57
	LEsqimllkVdQWFOHBWw1eVuedevRBxR8CsXXJf2Cp1fIPXrOjWQT1v3Y2qAw9eck
	qr9xIF447HeWb/8u6SSwOXyUHknzDf+BxcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2smj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:38:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so452371785a.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922734; x=1795527534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=;
        b=RucMOsiW8Fwvngjt3Va7W9mWswKzWv2dZG2H/S27+PqXUsWfLJ0eae3cdcE7wcvPWf
         XmrGIvfY2LZcDV2ZiseP/kltSJopmfufR9yb4FraEBwz2mnJ0nALXKtpbyvtUNFI0JZn
         iBJqxlNRtuCj9gtQIlxYHX5pmeK5TyTlgv823lj0a4dPRzY/j8mgy9n1lSrMId+QUQzX
         Et8gI2DuFn5cBXHqxWY7MuqqFmwLeoZrsXMPCXoSXOAlrkHmm5wTeG8POSIVbwsZLi43
         uZ/nF9ielGLZ8X2LtuzK/R0MWOmyk1WOnG7yGeCFQfuebRzfr7qUC4w6a/m9ErB5woz6
         Gn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922734; x=1795527534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=;
        b=xM5kRaC9rz3sRTr0p4bDE7yp+uk6fvwxPAKmW1X1Ok8p4nqkIG6U0+WKtyysUHcmi1
         iLwBGAam6yWv5t3g0BKN4k7OfvPlTCkX/+kvTPg6ICQ+9EblZa4T3QEpYqV82urJrN2Z
         rus8YoquZIvun9lYOpqht1X/3Vbi3qBtyvt9MIiOfPvaFciAsFqOx75bD+32iRKyZroo
         chqNv/WLN1NKxJs+neiol3TtZ1EKV8gHewLV0wO8w50gf/v0A7b96nHQqAVZo0b9qiHN
         3aosgKtgJjwcVnnzls85q9Jdw4ZDN2Vvdj+GdoPJiihmiNkg9Ny1Gq1T12PyIk4NOCRc
         086Q==
X-Forwarded-Encrypted: i=1; AL+hErHoCuQjhG7R8iZR7F6C0O+PqfdXir2vlItiM1mjYW3IM9aK8ZG7+7NFITHNr0XvPCnaLKScqN0AR8zF@vger.kernel.org
X-Gm-Message-State: APuU4Z8ACSpXF0L5Gobe+6P36jsyFiCRIUEZleKnGqKqKQ5brBLhYGEa
	0kf01C/K8Wy/kZa46TabzqRIGHJo4lxKtTIzUxay4KtUoP9+mC/S9xyv1cziyxiE//1Q0VEI6Of
	ohy0dtaclVmwdRcbQrOfAVQi8xHP0PbA6c1ahfVgf2m/sFc53sgJKdHcUjnvUIE2G
X-Gm-Gg: AYBFou0HztgxuRW8MfmfePfJZN/Fa5aty5ozrrmEdmV7PkLpzq6dJiEcgCUNW/06xZS
	Z834oVusOKJrXIzs+sTPmiWX+dm+kxxjGN+sL45t5Dba5D9n4VLv0TAPJI5B2FWLhH+hiiQ8uar
	QF3nwfRQ7XCO/5d12Lm9+QCfVmEMylpkAr1EZKvy4tPdlhUKWYuI10CZ4VOG+zPbSB2p0lYGkC0
	7v0V+40//Ve+Q0YKdivNaV6azqi9+srbSjKb/OeH26f6dlHne6Df1JssRd/BrwLEbk/v3PXo3PR
	ca7ep7POny+my9T0UCA7O7MNhGH0gpto2n9sxoF7zK49MYlBXT6NsDtSyz1uQ4Wb7VYIQO4++9G
	+/utykWvzsXNFzTVpj6aSRKHDUheLQeO/iYwLJrfzF4va9xjbjTXGVc1Ja6mQRA==
X-Received: by 2002:a05:620a:2b9a:b0:949:7c43:d54b with SMTP id af79cd13be357-9497c43db44mr984485185a.30.1794922733767;
        Tue, 17 Nov 2026 05:38:53 -0800 (PST)
X-Received: by 2002:a05:620a:2b9a:b0:949:7c43:d54b with SMTP id af79cd13be357-9497c43db44mr984480785a.30.1794922733259;
        Tue, 17 Nov 2026 05:38:53 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3ad4ecb62sm4066504f8f.57.2026.11.17.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: freescale: fsl: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:38:43 +0100
Message-ID: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5379; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Jtq/IDlygP/FprCTQ5i3pNz0nbgIOtQrQssp7bLL7N4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/Fji22HTKu+W5BUFpD5KKd4WB6zt4bXBDx/Fi
 SunzOCnT6GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY4gAKCRDBN2bmhouD
 10yqD/9Sb7oad8D2swCZnW5cV1c8dL9ndvdVHdESXvlykpZUYTP1KeLcdz0avWe148cpbIfJLnx
 USjlpQXwlMUJd8RH9qqhr4pLYP9Uenpm4WZ2OOJgNPiz8t6Oi8B3Z/mKC03iIcng/gTFrWdExKE
 YD6k1xM9XrYhaZ6mD03T3OF14Kg28DoSqOgLdfVz7Brs5DpVFu4+I1jB7lkSIqUOQMyRSqKfVgp
 HQNb9+mM+b5OtefbF8mQNEmQMZtMsc+9Mu79HjNR4TmILrB51Qlr2ELyS6LFOf4UPWkzWwpJLgO
 LrHj94Gw5DU5GLgEhCQcdJqe8VlcFJ1IjtampKtn5u1xzbMggIeESHm0XnK3Nu4C7KB2UbVqfDv
 +MbP21NxWuifS/WElkye2yV2uKWesTkxVAb7a3mTekCPrGQ7h2GfozwQrPZLAqc+aVB+tge+lSK
 PIp3gNQTX9g9Z4W0s1gb2+Vb/xJg6mBJx4e/JKnC/RXla1yP/w0yF614A5z3Izink2gB7JRKEbg
 U+eWImoLq4Jv4itWhEGS32bKXscvyocIRqHky3rsT0ZR1f6l+astu1XqdT+L/wNXBWoQTTgsuin
 HHny+Z2BR75wWNorXQjmtz/6C2t6cSz3er88WM0XBruSklLYBU5//6tKrFy0O7wfoOtXskikFNn 5qYBbMzesNkYcdg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KIWvWJKDswYtG9Fbr2WFd0VHgDlj74Jf
X-Proofpoint-ORIG-GUID: KIWvWJKDswYtG9Fbr2WFd0VHgDlj74Jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX/+wHTyjWmfvP
 V3+EQUF7/zkU5vCYsRhCJ/prneRRCagVQWZnkLmLRAZMi/hQbOPlaEfHcGjphJucFISHF66jSPg
 hSnZqooTnqoVg7KaV4gHCh4J0qYS7gKUHtKCMLz71IJjqNwW6zHTkzzwRNkEeEbCVRmVM3fqMa/
 iC1s3hV8vmUHeztc6aWC4OpZ4G2YyyWJ5nr/wpJ/XQHtSDXyW/UApM1BAjg8vXz3biDLnM2fsO7
 TSbAEAlePoerxQxMGBWMyTwV269GgH484i3OiBWiy1Znm3GtFjhUkCD40LKNn7FKzUuj3/1ciH7
 nySCsPmxIABhOtTe9QByrONGUD6q+xrzqycwHmcucdwGSRV6K+ccvMKE+TQgzNDBWd677XL+5R4
 GaUcNrvEXbtBq7gMiGrZE0PtDUw768/qWR6KsGQ/94Z/3a5n/69RMrpfk70drxJDWj1sZnVunoU
 EdTXjA531cyKBiM9tAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXyZ6PBfkHGOnd
 wtgKKyZcqv1tqMmyt0Hjkv0+U9hjYb+Hc9r7DjdnVzQKu4Aj9uazl96xGDOe0icBYKz8wpKjvj5
 z3e0ndd6oKTeMHk94hIisrUPXGFnJoQ=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc58ee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MF8-bgRzfeo1eCVTD2gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The dpmac, rtic-, qsgmii-, rgmii-s and other aliases were never approved
by Devicetree maintainers, because they were never documented as actual
ABI.  There is no in-kernel user of these, although there might be
U-Boot.  External DTS users cannot rely on undocumented ABI, thus these
are pretty safe to drop.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |  4 ----
 .../boot/dts/freescale/fsl-ls1043a-qds.dts    | 16 ---------------
 .../fsl-ls1043a-tqmls1043a-mbls10xxa.dts      |  8 --------
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  4 ----
 .../fsl-ls1046a-tqmls1046a-mbls10xxa.dts      |  8 --------
 .../fsl-ls1088a-tqmls1088a-mbls10xxa.dts      | 20 -------------------
 6 files changed, 60 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index b07022e3b6d5..7e455600f8d5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -20,10 +20,6 @@ / {
 	aliases {
 		crypto = &crypto;
 		rtc1 = &ftm_alarm0;
-		rtic-a = &rtic_a;
-		rtic-b = &rtic_b;
-		rtic-c = &rtic_c;
-		rtic-d = &rtic_d;
 		sec-mon = &sec_mon;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index e850551b16ac..ea4863c9686c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -24,22 +24,6 @@ aliases {
 		serial1 = &duart1;
 		serial2 = &duart2;
 		serial3 = &duart3;
-		sgmii-riser-s1-p1 = &sgmii_phy_s1_p1;
-		sgmii-riser-s2-p1 = &sgmii_phy_s2_p1;
-		sgmii-riser-s3-p1 = &sgmii_phy_s3_p1;
-		sgmii-riser-s4-p1 = &sgmii_phy_s4_p1;
-		qsgmii-s1-p1 = &qsgmii_phy_s1_p1;
-		qsgmii-s1-p2 = &qsgmii_phy_s1_p2;
-		qsgmii-s1-p3 = &qsgmii_phy_s1_p3;
-		qsgmii-s1-p4 = &qsgmii_phy_s1_p4;
-		qsgmii-s2-p1 = &qsgmii_phy_s2_p1;
-		qsgmii-s2-p2 = &qsgmii_phy_s2_p2;
-		qsgmii-s2-p3 = &qsgmii_phy_s2_p3;
-		qsgmii-s2-p4 = &qsgmii_phy_s2_p4;
-		emi1-slot1 = &ls1043mdio_s1;
-		emi1-slot2 = &ls1043mdio_s2;
-		emi1-slot3 = &ls1043mdio_s3;
-		emi1-slot4 = &ls1043mdio_s4;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
index e04483fdb908..76a07a0030ae 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
@@ -19,14 +19,6 @@ / {
 		     "fsl,ls1043a";
 
 	aliases {
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 48a6c08fcea8..8c095aafd596 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -24,10 +24,6 @@ aliases {
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
-		qsgmii-s2-p1 = &qsgmii_phy_s2_p1;
-		qsgmii-s2-p2 = &qsgmii_phy_s2_p2;
-		qsgmii-s2-p3 = &qsgmii_phy_s2_p3;
-		qsgmii-s2-p4 = &qsgmii_phy_s2_p4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 		serial2 = &duart2;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
index 43261cda3fcf..e50469c61482 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
@@ -18,14 +18,6 @@ / {
 		     "fsl,ls1046a";
 
 	aliases {
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
index 181eeab55aa0..d704aac8d9b9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
@@ -19,26 +19,6 @@ / {
 		     "fsl,ls1088a";
 
 	aliases {
-		dpmac1 = &dpmac1;
-		dpmac2 = &dpmac2;
-		dpmac3 = &dpmac3;
-		dpmac4 = &dpmac4;
-		dpmac5 = &dpmac5;
-		dpmac6 = &dpmac6;
-		dpmac7 = &dpmac7;
-		dpmac8 = &dpmac8;
-		dpmac9 = &dpmac9;
-		dpmac10 = &dpmac10;
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
-		rgmii-s1 = &rgmii_phy1;
-		rgmii-s2 = &rgmii_phy2;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
-- 
2.53.0

