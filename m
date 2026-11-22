Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.85
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795318812;
	b=fpREayY885kOydjYxSdFa0vhLrVzbjtpyfNs4GcALy0cXBMUcVLmF2f79vF2oi0nbx7N
	 u7zRZLA75f9jxhPEgltJuMADaUzMjcR4Dj+BYtN+lTg9htXVuSJPL51HrQxwN6u1ZCsEx
	 qCOh07X78i61g3aKkL5q8cAg+qE6cDXnO9G6tH1cUi1b598yo6PXW4iPfMomf5YrUSiXv
	 19Pgd3uJzaBLFl/gS7FX/0EBbiALYHCFUoSGBHIdOy4cLEv4pRynCFL6aZG1x1b7sFZCZ
	 t44ho1kRbf7yDjxkdlrr3dFw20oGBIMSKas2ufmGvVJ0iNtjcjJQQi8WF0e4rqREI1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318812;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xDy83OiE+T1PIZxoFjmdl6kDbnjjIYoLWb+VsTW6qzk=;
	b=G7EiIK2tTOuwe65u+BR7JW9OSIk98I0GSrbD0IlGv4cXpQ2mMIAN4D0WvDIhyMZnbJ23
	 Vt70mqLaitXlLWHxnPwlqImpc/pcYZHjILYMQLlccYGWJAtr6KwMZqKPXO2uB6vzFIG8A
	 fNmj+UQRVpzikaibP5xSALLTNgPCN63ydvKj2nYX8XsVivJGrPx+Usq5KvbbxSZuXWTSR
	 TX/OSvVJ5CuxOqrBT1rW6lXms6old9FETVleiILFVSq9vcvsEzREClmvpBjhvKcBXjlGf
	 6fLlcldaEiGtXHeYA09s0sU+EnYTUZMqesgJo3KDRV28KaSpiUZG+f1o51DZKn9hxtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.85
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023085.outbound.protection.outlook.com [52.101.127.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3816606A320;
	Sun, 22 Nov 2026 03:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3816606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qq4KSF0ngZki4I8//gGkOT62j8T99cRensDoUOaG19bkf6rgOVl7pp4VEnGgvveWIYAKR8PO//Rt48PwMjQL/FYknigmtBmILyVmWXMkJjU93lVVDjhYrPHlyqgCAg2+X8CMD/8EuJ43y4BJ2IxMyfejYE4Vn6ZFsLS4CRRgliGaYrpMZZovboFfhP6LgIXHf+Vxy93HXliKyri8v4syyov74RAmuTi14BweHpIX+QlP4MrzrY53Y/l2/aQf2j5VjZ7SvMrcCIZtvmEosHWd/pCOcyZG1Z8dmPE7s+slVrfXVJqey9OgJADK619A4ZtuabCB0z1aPc+Gjm/+PseIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDy83OiE+T1PIZxoFjmdl6kDbnjjIYoLWb+VsTW6qzk=;
 b=dyPqwUA2N0xUROfOO86R45LV0zghtS4fLXvypvTg8ANxsdx7ZrKExTComXMngCdoD6E56FlWq+gmswPSzdUCPXNxD9oX0XFR7JdfzjkjtA9WU5Mpd0xv0E6m6j6PnpSN9DdveOj8ImbcIs0kaqg0M+UC7gNORXERgEhbw6sICOp6gp/XVTGy30tHb6FqPhAY9pI0J852TQSmEguPCz357ifS6yza/oYE4wTotwN4zilLrzw+g/6MuYNDS/+0I3Pyy60qBwn7AfgQL+f+2loldo5PBonVHVgpxbsrqS2VM+C6C8IhJAmuB5SLpgM+d57a+niZ2qYzRvy732pPAG8KHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR03CA0011.apcprd03.prod.outlook.com (2603:1096:4:297::6) by
 KUZPR06MB8291.apcprd06.prod.outlook.com (2603:1096:d10:63::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3; Sun, 22 Nov 2026 03:40:07 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:297:cafe::a0) by SI3PR03CA0011.outlook.office365.com
 (2603:1096:4:297::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3 via Frontend Transport; Sun, 22
 Nov 2026 03:40:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 03:40:06 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3E9D240920E1;
	Sun, 22 Nov 2026 11:40:05 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	Gary.Yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Sun, 22 Nov 2026 11:40:04 +0800
Message-ID: <20261122034004.27137-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261122033600.25806-1-hongliang.yang@cixtech.com>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com> <20261117022858.2210212-2-hongliang.yang@cixtech.com> <20261121-friendly-slim-jackal-fecccb@quoll> <20261122033600.25806-1-hongliang.yang@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|KUZPR06MB8291:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0daace5-4de8-4425-3c19-08df484a4d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261026121527099003|261026140227099003|261022105027099003|261028144727099003|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6/pmBHTWiwqSPjHjdf9eFx1HAM8rSpqbOYUsH+snWOBM35wF6jTojC7Rty2idkQTIvsWXVZyZr8QFjexraAQNBgMB/c9033ZnbJQZsQXxYJl1LRn7EUezx5ZPnc8WtyuYOtJ21t4zIvktgWFcDbRjzEku8vrN1iqQZo6PcvcAVaJM9HujRb6ZrKYxeOS+622Ci2rKY6ArOLYC46w/sO8OLj2vhiu6XEdRLILgk3mVEY7+snG5N9vqKxsNJ60+gIAMQtY2WL/tcMdWJCFluIXZgjai1isj+rFXoRtZInGer9u8b9gq4aOd9+wWTmUmh58w1go+2OaEz/3KGX47DVpiQSim+dwxXPr3/5paw0OKgy9dExHG9y+nJgQFcDJryjq7J+gt2yvNu7f2qjk+xOn0uM1ekCJKiFtbLKoc25q3RdqMsQ43InQrZVFRwtPXiFAiNIQUOkCyRoYIHUjf9l+2R5txhm+Ellzc0AK8ztlnNPznWpXeNOx+aV4Nw+2P0tXUwPqXDqYt1m/CqJBR6IjeMLsMicAvQLZtY1TG1Z7GpnLokW5ElsNabwGHb+G955kgwZyIg2Ynph8ZpfEzodPRf88YHj3WJOO0RfvJOEtWsSID/IZnHtTWwK2FuA4tdMTQuYa4MN+zh7espd94vtxTYxD2ZTmAj+VIspeguomTYpIYXJdvVmngeYQKoW5MjQQ8RV7uS/NftMBY1MNBkX1aw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5o2x1QS/S4x3kA9tp4O4OLG8ak8ZevasGPAFHQhjC+DBNRmeuasYnGhndjoYGF/sCF2mw6R/FCGv8fRil6RdSOPW23pbjas18KeB3T/SZ1FWWJNllJPhPTdwRFbQFZubzVawfEskTCX4MB94PdUF7g37O1m9qjkelHleL1Eqa0TBGueDASA2FY1uFR//qq5U4BBb2UHopbTZtxq/k/45e1i8F4oXVcNNWgtEJ1iUq568auryyeue2Huc0X8+7ILyZ6Yz+e/7tLBlK2eDhw/9l4x2awpzHZ12EsIUoYYbc9q2DX8Y+dwD/zb4e23qautT/aHLqUI5GcRRbfrHUu8z14DRouAh9juWpTiPWTKO2un1tZOlaurMAD7MTzQwVPCLYpJcE4xD3mjr0tE3mRvVv8BojIERCyIuqS0Ll9Yvyb3smoEX2X8wCejhDcoq9L7X
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 03:40:06.5747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0daace5-4de8-4425-3c19-08df484a4d10
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8291

To make the last point explicit: there is one instance of the PHY IP. The
two lanes share the same APB clock, the same reference clock and the same
reset pair; they have no separate clock or reset control of their own, so
they cannot be enabled, reset or powered independently. The per-lane
register windows only describe the two PMAs inside that instance.
