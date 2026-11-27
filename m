Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777589;
	b=qqTyzw6ZUs2M5pUm+a0iVH/gAeHAj5t8ruXNAtV6iQJ5nLykSKMhp7QX4h5pC+C0kZeF
	 yPwHSdKFKhs7FYEx2oQRheQiyiXhcxETRLYyI4T2HQhhaEwcbgvDELDeLCpAQzruY9PC+
	 QTWkwcionk3sezBKzKVR348+54gkewkPFjq+XHslZwvP0IRSp6A5ERkrZQfsKxrYBGUmX
	 SnyC7iJLuvFoKFmjPIOJdUVWsWhy31ElN3C8nVmbGMZzYnEyU+Bnac9OrQdLpv1jkZmWq
	 emunMelGyfNoITwmtm9eSvSJiDIHieMaowBdP384TJSr0zLKMPjhjNr7zA+UrQEtIdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777589;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=eXxs9F16RtEuu0k6jHE3yLvGrvYM8FFLkPv2vMXkRAw=;
	b=YiSJ0LZKUSyQYgqJkn/oDwMCKZQuPHw9fq3tOx+5r72RANanAbN1JzPbvIXedJV7sbRz
	 fgP7RDXDi1w25uaGiXW7MolvaTWY/6y7o126UFxPsYVi/QMzsTmld7jbGBGrmV8CPayRT
	 8P7uyrKVb4AGIzouB62DidSRFQ6Xe14e2GukhOC4R1+VVFazeE7iV/snksYaY4yRl0+iv
	 z2oLAmXbG/hbMuBuXX8xHSviCtP9YamcJ0kjr4tNzKZ5E5foznX8c/xDTq9yBXPGU1bBU
	 jk8QtyYmVq4oGb/O4mx5bhWsV4sGU1KA9EMzsnRKcIz6okI1L0ZYsKpQOOH5EZIMYCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.119
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023119.outbound.protection.outlook.com [52.101.127.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA50606A31C;
	Fri, 27 Nov 2026 11:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lU24OW37P8oigIqEU6IQank9dJ34Y+QLys6FoI+rv2slC5IXBlP3xxVb5z/fRdGERBp8bWEk+Kz54WZti2RR/iGDUFcXhnfFk9YrYPitkt89+BWCrquUp1rqMN3fu5hhyC+LyFNfd2P+ATZJKsgCQqQpXJ2TrPw2n8IetqjCQh5rN0437zsn4qJrdnfN3nIHw+zIA8mi3X3YrwvbasNrkpQOubGH88pETN8YpdrTu+d1cpjDYmLcANlSdDLuQqbV/zptJlU/fAKp+dRX0kw20q3WSSLRnaHBp7Gr2M8NIYgMqyGXSucwSAUZM73ciDnHodg1TxYc8IPtDIxT3miIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXxs9F16RtEuu0k6jHE3yLvGrvYM8FFLkPv2vMXkRAw=;
 b=T/r5q1CyEDB26CIBjlLXvalQjVVgBjTKjrMgfzYOITkYf4bln5E3WQA5vJQYI9o7tUlVefIXoVcjt/wHbqsTnjRUN+NV/ckByRcbdy38CiieQ0FSQFPqO6rNCA5EGZ/D1OBXe20r2jiX5cFTpfloO2Sy2tWWlT6X5Eo58hMY3mA9b7kdn5cdV68u5fMJnCFmpkbi4lAQy1xCTisy2Z9i7o0tfYdcTny1e5PpszVEhYOtG/rOuMp+lPaPw9hfd/3nRHyUoSnVmc7iwuXXdOTAbMyEpxv7iiFm8y5TAKhUmy2ClmWUNUFbZrU1piT9Y4zPGRvny+qO+Cozjppv6XNB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) by SEZPR06MB5716.apcprd06.prod.outlook.com
 (2603:1096:101:ae::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Fri, 27 Nov
 2026 11:06:23 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::2c) by SI2PR01CA0037.outlook.office365.com
 (2603:1096:4:193::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 11:06:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 11:06:22 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 006D2427EFCE;
	Fri, 27 Nov 2026 19:06:21 +0800 (CST)
Date: Fri, 27 Nov 2026 19:06:20 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Luo Liu <Luo.Liu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] phy: cix: add Sky1 USB/DP combo PHY support
Message-ID: <awlkLCRQaKtD_pIV@gary-System-Product-Name>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261117083434.3414417-1-gary.yang@cixtech.com>
 <179577695532.3421.8058975724074009117.b4-reply@b4>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179577695532.3421.8058975724074009117.b4-reply@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SEZPR06MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ce93b2-72d3-4bf8-e50f-08df4c7678db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|22082099003|18002099003|56012099006|4143699003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	GuOuqcA/rKPkZ3VoLcd1RqxHg0s7qI9MQEO+phZIKo4qXMtjjatom7hmSEHxH9aqSt7srjZFZXMNHqbvWeKVHo8gLpBw0p4kCEMUNX8kx/dYKXuF7oJPaaSghzWyCiPCXMbCk7/rc5Bad2jcxnhlg/tG5V52s+/6yE/K8k0r8HeVQUfQaZvyxTAAYjLCcQlQd8kSJSjY9Rml5F99b1RR3jlDIvZU6dls7OgwE69RKvVrPGA+/mjb+aIcw3xSIOjEff89seFilkARHgw37memuerVFG7ex1GNrceoBRQQ9TVr6qaJg2XD1ejTojK/MROpQoNZx8eCfzb+0GgilwIiYN50QLTwpV9YRhdWNohp95jQVg6I5O5+GI9AgYWSG/KPJw0Nhv0VEaWlJufxe1gIaS06H4BF+Gt6REqhOaddJDZe7XQnNUCz1I6sfdQxRCNGlBw1EvEVbpY3UK3WcmTpaLEosRtQQMSyPPfvqp3KMZGU29oX9QceToZhZri7HRcgpz8qwZh5BUfP5DAzVksFJSNQomzqSlP/EQynGnVY+kqLEYU/nvinU0/HDEEIlY4QDIIJo2IM5JxmQb00UpXvPVmMQ1xbmA38QSOqWn0lAldIYEijfhVuM08Yx9EnfsX0O9cZWjzKYhxSkuO4Etfxqv0rXuQVY5aOQcfc75MQpz4=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eAJYl6OQUTuhTsrtRuEYH3QeR/gx3LqIxCx8qgIWnffLks8AmW+fiUI2d/YqlYmT8Leqg+FwYcxGMyKDrtMtUsMZXgOJ+NW9/DwhbAOz1fxxItbQkTbDclxHOKtzhrjzpG5G7eWtGKDNTDzWPssY64KrO4fR92CWeLb27jLn6B1A0op2xmRl+ZCUEz1CS/JRf/FeF/uORbojDYU42+Pb+QKI+5xLd9K8QVbw54/+mZkoRhsPjlkeEbjqempzKVExRpWqHpSjFqf0cwQdDU6mNhAoJd+rSKM6y7I6MSZgQp4goICm52HsDjr4HtT0826Fv7fLYBXkcMf6BawLS4msZ0HFr1qBd2zzutmK+uLgnWqH0mYSHUi87JQ2GO4AjEFYWFD0I0uKs4E/h7YQRRoU7TKM+Vzn/AMXYHaMPoLN12YsiEriSVyyC+FiW8zRstn0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:06:22.5732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ce93b2-72d3-4bf8-e50f-08df4c7678db
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5716

On 2026-11-27 16:25, Manivannan Sadhasivam wrote:

> [Some people who received this message don't often get email from mani@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> On 2026-11-17 16:34 +0800, Gary Yang wrote:
> > This series adds support for the USB/DP combo PHY of the CIX Sky1 SoC.
> > Each PHY instance drives one SuperSpeedPlus USB lane and up to four
> > DisplayPort lanes of a USB Type-C port. The USB and the DP controller get
> > their own PHY through the PHY_TYPE_USB3 and PHY_TYPE_DP cells. Plug
> > orientation and the USB/DP mode decision are taken by the Type-C connector
> > driver; the PHY consumes them through the Type-C switch and mux API.
> >
> > The USB and the DisplayPort controllers and the Type-C connector are not
> > yet described in the CIX device trees. The graph links and the consumers
> > will be added together with them.
> >
> > Patch 1 adds the binding and patch 2 the driver. The SoC and board nodes
> > are sent separately as a follow-up, since they go through the SoC tree.
> >
> > Patch 2 builds on Luo Liu's "Add Sky1 DisplayPort PHY support" series:
> >
> > https://lore.kernel.org/linux-phy/20261102030425.1957585-1-Luo.Liu@cixtech.com
> >
> > That series creates drivers/phy/cix/ together with the PHY_CIX_DP Kconfig
> > symbol and the CIX SKY1 DISPLAYPORT PHY DRIVER MAINTAINERS entry. This
> > series adds the PHY_CIX_USBDP symbol and the new binding, and renames the
> > entry to CIX SKY1 PHY DRIVERS. It should be applied on top of Luo's series
> > to avoid conflicts in drivers/phy/cix/{Kconfig,Makefile} and MAINTAINERS.
> >
> 
> Please do not send new versions as a reply to the previous version. It makes it
> harder to spot new revisions.
> 

Sorry, I made a stupid  mistake. As soon as I realized it, 
I sent out a RESEND patchset immediately — would you mind reviewing it?
https://lore.kernel.org/all/20261118015140.3559331-1-gary.yang@cixtech.com/

Best Regards
Gary

> - Mani
> 
> 
