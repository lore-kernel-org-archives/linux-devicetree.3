Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.188.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795373039;
	b=RBnfS2Xo8Wyr60mjQcoTeVA/uPm2bEBeG4AxEOscCk4guFGrm6TpcYUSJN4I06u/tF+n
	 2x/jiYFJXr0ux4wIB4ifdsu+VovNVhlYj1Ms1m5Q3je+9AkvKJ7WWqeXGw9i9io4WIcD0
	 mhgXwnOcQz4pXAt/EwLNiRWlh1Tx07/bQl6WaAH9UptKk0JDCWndeXCO2uwZ40QDvR0RX
	 LCU4HjAD7HUmp0Wy3+5sUg/qDMm/alOYH3UJ7rCPrfVIJmXE12uB4dk0rb1fFk8GHuBXC
	 6X1OPbpBxTE2rdMz29lSnhykMbu4jhA41F5PvyzdgvJbG0IyfsZiEy1AyH6vbjK1iyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373039;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Authentication-Results-Original:Received:DKIM-Signature:
	 Authentication-Results-Original:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zeztaODVaZgqyRMB4E8xc6ctHg4bAx7XX2ROOJmFUxE=;
	b=0AaU/riPcgUkZBRhUh21OskWorl0cUd3sCMoAAL2lekmRsVfgw8Bb7YxSLqHeFOJdhIZ
	 QyuEwF9Sv/a1mPLI6tccvVEoUoVnh+IeC1Bb2TGnsFZ9jcC95O6RoYqAiBlbUbFgwKmbF
	 gsn56ONqyVGy+NRKgYAOzYZv6/1CrCiunxj3+Fjqd5+0idHmqJPCdwU3RZolU6RU2ythY
	 +pG7kmn4NuYWTmNNjPjCC+TMeoi1+uaHXnYjrLeIP0BDbL04hslpMj1piyTdFOKKwqEuh
	 q789ghBqOcDjyfNthhs7rfu6EqF+DzxUyspyEC595eqCMEJr/+re1OoE3NAFPx5InpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cern.ch;
	spf=pass smtp.mailfrom=cern.ch;
	dkim=pass header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=xxYxWAfs;
	dkim=pass header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=xxYxWAfs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.188.114
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020114.outbound.protection.outlook.com [52.101.188.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFCC606A335;
	Sun, 22 Nov 2026 18:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFCC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=xxYxWAfs;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=xxYxWAfs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8HxQnL0/p9JOFX7XuSy5r/KQ4+97ydUcZmV+Mj8b3b5BJTXOo9vqRVOfv7dcfgsHCsJq87HQyvGElCR9sPhs/U7E7PfW55rbe7SHqzGOZlvtSvkjJuhcrJjhB46j+iR4wgGUb+KPuEMoeQxXhUGcOMX7CEHYQSxSzZFuc/0EP49z+qgGZIb64hJNBjiZCMEZbzThBKLpGRj+K9G9tjX8Afd4+puQh7ujKRsSKJRJNPB98e7lZMsmUiJep42KVbFWw3KyYAHSDMFrpogVtZworEagaTZ1/52+rk+VY4DpyEJlWiNK9STK5eDMXccayj0TJHOW993WzOyLzH0GtESYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeztaODVaZgqyRMB4E8xc6ctHg4bAx7XX2ROOJmFUxE=;
 b=yLzXhsxESPcEwN79RxPPauRX2Nm8VuBTDDDhrCEX2rTC85xCWx+oPDaqw6ncjg8tN9Omf8fdSKHMxSUenh9rE2MhBOAimaHiEDuUzYH7BLHudDqo9HLvcoYAL9xN0ojUKXxZzcFeA0dtVLLoA2QAw/w7mrE4yC6cV7ucF0sprgUAb6f7CfgmkMVXukaOgor0OEG8guHY2stdHxGzRt1yva7QJ71YJuxFGuh9AOjIPvuNRDUmh6Z9Ti3Un9GKeDFWjBjNUYJI+p0QpBoJRNdKqzr0T7VGcIilzrWqvH1H4TTpZsircDC/ZI/0uMgpIWeUE6wXlCOD5mbwKm9j8Njvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.103.219.121) smtp.rcpttodomain=antheas.dev smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeztaODVaZgqyRMB4E8xc6ctHg4bAx7XX2ROOJmFUxE=;
 b=xxYxWAfsk3HZ8WopX8okC1zg4hjEpwMqNOmpazegZ3kVx2wdks1q4KVy/2CPxjqJdok6Dca7RVNruMIdgmBWiolJtzYVMXbLywQs/m/MYYyu03/pw6JHPCt99UTZvKKKtFgFO4W6zABgRqiEKp2Ye3IuZ+0/6/J4XQfaJ0BuaRo=
Received: from AM0PR02CA0153.eurprd02.prod.outlook.com (2603:10a6:20b:28d::20)
 by ZR3P278MB2113.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 18:43:52 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d:cafe::3f) by AM0PR02CA0153.outlook.office365.com
 (2603:10a6:20b:28d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 18:43:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 51.103.219.121) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.103.219.121 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.103.219.121; helo=mx1.crn.activeguard.cloud; pr=C
Received: from mx1.crn.activeguard.cloud (51.103.219.121) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Sun, 22 Nov 2026 18:43:52 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=xxYxWAfs
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010000.outbound.protection.outlook.com [40.93.86.0])
	by mx1.crn.activeguard.cloud (Postfix) with ESMTPS id 2E3AEFE4F5;
	Sun, 22 Nov 2026 19:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeztaODVaZgqyRMB4E8xc6ctHg4bAx7XX2ROOJmFUxE=;
 b=xxYxWAfsk3HZ8WopX8okC1zg4hjEpwMqNOmpazegZ3kVx2wdks1q4KVy/2CPxjqJdok6Dca7RVNruMIdgmBWiolJtzYVMXbLywQs/m/MYYyu03/pw6JHPCt99UTZvKKKtFgFO4W6zABgRqiEKp2Ye3IuZ+0/6/J4XQfaJ0BuaRo=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:22::8) by
 ZR3P278MB1324.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:74::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Sun, 22 Nov 2026 18:43:46 +0000
Received: from GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 ([fe80::29de:97bf:5b0:49f8]) by GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 ([fe80::29de:97bf:5b0:49f8%5]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 18:43:46 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: lkml@antheas.dev,
	marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v9 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees
Date: Sun, 22 Nov 2026 19:43:20 +0100
Message-ID: <20261122184337.6551-4-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122184337.6551-1-mstoretv@cern.ch>
References: <20261122184337.6551-1-mstoretv@cern.ch>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::16) To GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:22::8)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVAP278MB0007:EE_|ZR3P278MB1324:EE_|DB3PEPF0000885D:EE_|ZR3P278MB2113:EE_
X-MS-Office365-Filtering-Correlation-Id: 57664eaf-c002-4123-6941-08df48c88e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|786006|366016|376014|7416014|261026135527099003|261026121527099003|261026140227099003|261022115727099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|260925022911599003|260925021311599003|260925021911599003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 wlwi5oPcHCGM+tyRiMBNl5ixOlMCmcnZDKCvwYeqNbyiUgWvTs001vnzaCn6AE/qxiPUEkBrsCHd5Akdx3+cMQbCzR94aeTsViiC8llWFQXgCn0FUH+IXAyqkuFbOGGK26MlP82XN9lwgc/kqUOo6qugvLff2+/V5mUJFVjlTUDsPMXbKh6W8+9sxsCAROntmLpjNjaI1Ppg0UpUTo1E/talTekX78JaSRIqgPWqunPxTVvb+4whF4X6cJ4MvJ5FSxww7yQv2YkHZw99euVxr5xAe/KolQvaVk/FXaeniGVWqS5/WIZemjUuDOM7rNqNjgS9rdJqyGzuB1EdLHUF4Y6dFHKEcs8V11S/Fe30XFiW2hbGTfoD2z3iAhvgkZ4R3Z+M2WiYKSm8KtmwRc5W0ZXdwiIPgldXb4of6fhCFUbtDVtWSuLB4VQ6w88nzTr+rSTfnNKPJ8QX3anlSlnRwB2pAuR75Q8jeeQhaHVKJ1v6xMYwvupuBKb/PRxoWKEEIQzJNfLUawqsiTlcmhk4XqYbvQ14lRAZC83Ad/Wck7d9xszEZOso1j1WjJr3aOnA7E4StQ2/Ovee6o6JVHcBNAKG50woZH72yxk/h6gTHPN1MpFDYLeO3tH1CVD1wjCS
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(786006)(366016)(376014)(7416014)(261026135527099003)(261026121527099003)(261026140227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 AfSZdfXGKE02YNwwWID8QpYZoyLzwm5iMwriv/dvwtAZInqzug0C3ZI/Sqy3mp4kkhyBiNpuGhF7cDh5YmLTV63p26eY6Dfxg5AUpMTfPDkUV+MOavcxjNkFx76XqCCGnW2DnuVRirvT65Is10E1FVzhIjKM1z3EZEtxCUlhLl2CO4WgdvoaWbenxeu8VOfQgONg4WAlQbYmIBpJlpq/abD2qRphuzaGZ7MOnc678lFiXTGQYxx4p5549vOBEWu2RxBTtq155caUGBjjvlwsfB10+NU8vf+BhL4OZcHpQl7326SBP+wld6T2I9vXh7/sLI425cVCSJhVSZupepB+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1324
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9ed69d8-84de-4671-c810-08df48c88a5b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|35042699022|36860700016|23010399003|14060799003|30052699003|1800799024|82310400026|19092799006|7416014|376014|260925022911599003|10067099003|56012099006|11063799006|260925021911599003|260925021311599003|261026135527099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022115727099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	Dv23HwghSq7EtoKljdOA65SJKRK1/hLpoRoAKpwJkBXwGD38uXGFDFO+FmwipwZUHtSyysos6FisxBCNf6/bqnLOsBruvzsM2xTdZv/WbZiVjuq9jpRPwJwue7rgDdDiAf9ZAR7E3X8w8s2WN/KUDyZ6WyxwUvFpKcPFGpfrBlo5bcE4hms07Yx18KYNWkcTawmSH+n4Y+KjFPtXOOCPSY2QwqtyuZA0w2PyMMgCATnApMgds6wSru/H8DAJTg0E1wq1gDSty4L2LXzEK3vMksHa3GplGuNTi7nwfFiU9nrf94U2imyuu07PwA11GKRUwmD6De6IGzDL+4OIByRIIXxqRsjVrWS25rWeKYfXfGkINM+3TtEGgR+ubpZ9OxsIvzux+xw2SDhY9/BxZCgrzjcGzj0OKqpuNpZY7IQpo+p/Xh3of6O/NEIFRn+an8p8oNuNtyzlTgQvsFZQqOxhwfIX0IRal76hM+qBjyipH/DHwjXS/buXixg+Rk3gfg+UCtGYhARWbCJLM+btp0neqsPwtBY9trekCUGvMZcypzsUeiViRpqTFlEwVeSCBuu7MEVY40+cRARMBiGHE7aHprvTKomAAvQ/lgaFO4qrdV8FZzRyaNXLfKhmhiN7zZVcP8ZPu9tNrQNC2gdPzDADka3Qh+xfEomKcwj6o6MMb4k=
X-Forefront-Antispam-Report:
	CIP:51.103.219.121;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx1.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(786006)(35042699022)(36860700016)(23010399003)(14060799003)(30052699003)(1800799024)(82310400026)(19092799006)(7416014)(376014)(260925022911599003)(10067099003)(56012099006)(11063799006)(260925021911599003)(260925021311599003)(261026135527099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022115727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rs1EsZj008438dc7sVYfoFkQiLizuKPeqJjDq2OR1W47X9RcNcuLTbNNbOmhKmlYnrLO5DX/QT80Yb8CMyzbiDtE8tBmgFe5j8UOgANVd4jerTzdbdaMZ7Ehs9v+SEEMG684Ac+PBONoNU3humrh/Z/m+/cKDfCKSfUB/ddyZB5/vD2Pu+MgrWlBhv9a3PJQrZ8LS2twzU3ApnB5gBeO0Y3NrhpjRUZ2/oTQQu4j5d/TazTPTV4ZjVwWxEKlwwkhHGklv/aq8rZls9qBNvC+sU6oHJPtcvcV1nNNYmMcA7Ky/xs2zIP/0RE9X6RZunH0/FhFRFrsltiRH9S1S3BqUAOy4RXZeMiuG5pncm95sDyrP6rZlvAeBCKiaABkG5fQc0GSshvgg8tq6178rxqPbQqfbvX7guf80of80loA0fFhM7VRI+SOt9JhRIBCY55U
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 18:43:52.4603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57664eaf-c002-4123-6941-08df48c88e28
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.103.219.121];Helo=[mx1.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB2113

Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the
Samsung Galaxy Book4 Edge.

These use a common dtsi derived from nodes that were able to work on
Linux from the initial Galaxy Book4 Edge DTS by Marcus [1], combined
with the patch series for the Honor Magicbook Art 14, which shares
device similarities [2], together with a few more adjustments on top
of that again to get additional features working. Special thanks to
Jesse Ahn for helping expand on what would eventually become this
dtsi.

[1] https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
[2] https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/

Co-developed-by: Marcus Glocker <marcus@nazgul.ch>
Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
Co-developed-by: Kirill A. Korinsky <kirill@korins.ky>
Signed-off-by: Kirill A. Korinsky <kirill@korins.ky>
Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
---
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../qcom/x1-samsung-galaxy-book4-edge.dtsi    | 1378 +++++++++++++++++
 .../x1e80100-samsung-galaxy-book4-edge-14.dts |   28 +
 .../x1e84100-samsung-galaxy-book4-edge-16.dts |   82 +
 4 files changed, 1492 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9553e3aae..6fabc0bce 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -557,3 +557,7 @@ x1p64100-microsoft-denali-el2-dtbs	:= x1p64100-microsoft-denali.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-microsoft-denali.dtb x1p64100-microsoft-denali-el2.dtb
 x1p42100-microsoft-sp12in-el2-dtbs	:= x1p42100-microsoft-sp12in.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-microsoft-sp12in.dtb x1p42100-microsoft-sp12in-el2.dtb
+x1e80100-samsung-galaxy-book4-edge-14-el2-dtbs	:= x1e80100-samsung-galaxy-book4-edge-14.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-samsung-galaxy-book4-edge-14.dtb x1e80100-samsung-galaxy-book4-edge-14-el2.dtb
+x1e84100-samsung-galaxy-book4-edge-16-el2-dtbs	:= x1e84100-samsung-galaxy-book4-edge-16.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e84100-samsung-galaxy-book4-edge-16.dtb x1e84100-samsung-galaxy-book4-edge-16-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi b/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
new file mode 100644
index 000000000..450b9086f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
@@ -0,0 +1,1378 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Kirill A. Korinsky <kirill@korins.ky>
+ * Copyright (c) 2025 Valentin Manea <valentin.manea@mrs.ro>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "hamoa.dtsi"
+#include "hamoa-pmics.dtsi"
+
+/ {
+	model = "Samsung Galaxy Book4 Edge";
+	compatible = "samsung,galaxy-book4-edge", "qcom,x1e80100";
+	chassis-type = "laptop";
+
+	aliases {
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9385-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	hdmi-bridge {
+		compatible = "realtek,rtd2171";
+
+		pinctrl-0 = <&hdmi_hpd_default>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_dp_in: endpoint {
+					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_tmds_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_tmds_out>;
+			};
+		};
+	};
+
+	/* Still needed until there's a proper driver for type-c controller */
+	pmic-glink {
+		compatible = "qcom,x1e80100-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
+
+		/* Left-side rear port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss0_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					};
+				};
+			};
+		};
+
+		/* Left-side front port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss1_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss1_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss1_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-GalaxyBook4Edge";
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS3",
+				"VA DMIC1", "MIC BIAS3",
+				"VA DMIC2", "MIC BIAS1",
+				"VA DMIC3", "MIC BIAS1",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			codec {
+				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vreg_octa_vdd: regulator-octa-vdd {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_OCTA_VDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 111 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&octa_vdd_en>;
+		pinctrl-names = "default";
+
+		startup-delay-us = <1000>;
+		regulator-enable-ramp-delay = <1000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_display_vdd: regulator-display-vdd {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_DISPLAY_VDD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 120 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&display_vdd_en>;
+		pinctrl-names = "default";
+
+		startup-delay-us = <400000>;
+		regulator-enable-ramp-delay = <400000>;
+
+		vin-supply = <&vreg_octa_vdd>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		startup-delay-us = <1000>;
+		regulator-enable-ramp-delay = <1000>;
+
+		vin-supply = <&vreg_display_vdd>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	usb-1-ss0-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss0_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss0_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss0_sbu>;
+			};
+		};
+	};
+
+	usb-1-ss1-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss1_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss1_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss1_sbu>;
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob2>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l12-supply = <&vreg_s5j_1p2>;
+		vdd-l15-supply = <&vreg_s4c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p0: ldo5 {
+			regulator-name = "vreg_l5b_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-always-on;
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_3p0: ldo8 {
+			regulator-name = "vreg_l8b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p2: ldo12 {
+			regulator-name = "vreg_l12b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p0: ldo14 {
+			regulator-name = "vreg_l14b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l16b_2p9: ldo16 {
+			regulator-name = "vreg_l16b_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s4c_1p8: smps4 {
+			regulator-name = "vreg_s4c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_0p8: ldo2 {
+			regulator-name = "vreg_l2c_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_0p8: ldo3 {
+			regulator-name = "vreg_l3c_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s4c_1p8>;
+		vdd-s1-supply = <&vph_pwr>;
+
+		vreg_l1d_0p8: ldo1 {
+			regulator-name = "vreg_l1d_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2d_0p9: ldo2 {
+			regulator-name = "vreg_l2d_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3d_1p8: ldo3 {
+			regulator-name = "vreg_l3d_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+
+		vreg_l2e_0p8: ldo2 {
+			regulator-name = "vreg_l2e_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+		vdd-s1-supply = <&vph_pwr>;
+
+		vreg_s1f_0p7: smps1 {
+			regulator-name = "vreg_s1f_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_1p0: ldo1 {
+			regulator-name = "vreg_l1f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_1p0: ldo2 {
+			regulator-name = "vreg_l2f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_1p0: ldo3 {
+			regulator-name = "vreg_l3f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "i";
+
+		vdd-l1-supply = <&vreg_s4c_1p8>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+
+		vreg_s1i_0p9: smps1 {
+			regulator-name = "vreg_s1i_0p9";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2i_1p0: smps2 {
+			regulator-name = "vreg_s2i_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_1p8: ldo1 {
+			regulator-name = "vreg_l1i_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "j";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s5-supply = <&vph_pwr>;
+
+		vreg_s5j_1p2: smps5 {
+			regulator-name = "vreg_s5j_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1j_0p8: ldo1 {
+			regulator-name = "vreg_l1j_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2j_1p2: ldo2 {
+			regulator-name = "vreg_l2j_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3j_0p8: ldo3 {
+			regulator-name = "vreg_l3j_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&camcc {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/qcdxkmsuc8380.mbn";
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	keyboard@5 {
+		compatible = "hid-over-i2c";
+		reg = <0x5>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	eusb5_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb5_reset_n>;
+		pinctrl-names = "default";
+	};
+};
+
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "hid-over-i2c";
+		reg = <0x5d>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c13 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel: panel {
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+			no-hpd;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss_dp3_out: endpoint {
+				data-lanes = <0 1 2 3>;
+				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+
+				remote-endpoint = <&edp_panel_in>;
+			};
+		};
+	};
+};
+
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pm8550ve_8_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		input-disable;
+		output-enable;
+	};
+};
+
+&qupv3_0 {
+	status = "okay";
+};
+
+&qupv3_1 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/qcadsp8380.mbn",
+			"qcom/x1e80100/SAMSUNG/galaxy-book4-edge/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/qccdsp8380.mbn",
+			"qcom/x1e80100/SAMSUNG/galaxy-book4-edge/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9385 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9385 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <35 1>, /* Unused */
+			       <44 4>; /* SPI (TPM) */
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+
+	octa_vdd_en: octa-vdd-en-state {
+		pins = "gpio111";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-high;
+	};
+
+	display_vdd_en: display-vdd-en-state {
+		pins = "gpio120";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-high;
+	};
+
+	edp0_hpd_default: edp0-hpd-default-state {
+		pins = "gpio119";
+		function = "edp0_hot";
+		bias-pull-down;
+		input-enable;
+		drive-strength = <2>;
+	};
+
+
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
+	eusb5_reset_n: eusb5-reset-n-state {
+		pins = "gpio7";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		pins = "gpio34";
+		function = "gpio";
+		bias-disable;
+	};
+
+	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
+		mode-pins {
+			pins = "gpio166";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio168";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio167";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+	};
+
+	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
+		mode-pins {
+			pins = "gpio177";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio179";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio178";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <600000>;
+
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <600000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	status = "okay";
+};
+
+&usb_1_ss0_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l1j_0p8>;
+
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	dr_mode = "host";
+};
+
+&usb_1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss0_hs_in>;
+};
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+};
+
+&usb_1_ss1 {
+	status = "okay";
+};
+
+&usb_1_ss1_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	status = "okay";
+};
+
+&usb_1_ss1 {
+	dr_mode = "host";
+};
+
+&usb_1_ss1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss1_hs_in>;
+};
+
+&usb_1_ss1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss1_ss_in>;
+};
+
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
new file mode 100644
index 000000000..333a69a8a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "x1-samsung-galaxy-book4-edge.dtsi"
+
+/ {
+	model = "Samsung Galaxy Book4 Edge (14 inch)";
+	compatible = "samsung,galaxy-book4-edge-14", "samsung,galaxy-book4-edge",
+		     "qcom,x1e80100";
+};
+
+&i2c13 {
+	touchpad@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		hid-descr-addr = <0xe>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&panel {
+	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts b/arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts
new file mode 100644
index 000000000..70a3b367b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "x1-samsung-galaxy-book4-edge.dtsi"
+
+/ {
+	model = "Samsung Galaxy Book4 Edge (16 inch)";
+	compatible = "samsung,galaxy-book4-edge-16", "samsung,galaxy-book4-edge",
+		     "qcom,x1e80100";
+};
+
+&i2c13 {
+	touchpad@50 {
+		compatible = "hid-over-i2c";
+		reg = <0x50>;
+
+		hid-descr-addr = <0xd1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_1p8>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c5 {
+	eusb6_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb6_reset_n>;
+		pinctrl-names = "default";
+	};
+};
+
+&panel {
+	compatible = "samsung,atna60cl07", "samsung,atna33xc20";
+};
+
+&tlmm {
+	eusb6_reset_n: eusb6-reset-n-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+};
+
+/* MP0 goes to the USB-A port(USB3) and FPC */
+&usb_mp {
+	status = "okay";
+
+	/* Limit to single port */
+	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
+	phy-names = "usb2-0", "usb3-0";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb6_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};
-- 
2.43.0

