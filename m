Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.167.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795373033;
	b=jJww3iK/SnKEmbV31OXWgCmMUdr5cUo52khalUptclM/bYseVhd+P6RwCDRXCCHuhhu6
	 7xcb2PnGMMmh6Ima79Adx6SLTbT1So9Jr/NcDsLKTWYeae5YMEDxUi5KAAuypKnAizyES
	 Kb7Ny/hcdVTzLdrb5egq9z46sjdxQ+U8ahjcG+5kIoeyBAjFR2tsXG0dD8VsiH+ASsRkd
	 e3l/+gCtNCFY5Q46TLcPXHhwr1i2yOMhl7snOLN4Yrl53FeFeJWh4wOanfOILA+0rqn9L
	 mwRWtjb9t5KQIiFQ+BfLItjgVkpWaX5+qd0ZXPSrkWb+xy6GCyMFRmIpo0BGlhTWOXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373033;
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
	bh=hyYx6K9VFX0ULcaj6jInSgavSYk7f/R1Qex8ek7uJgk=;
	b=IPwhJ1KdCB1+H56jyXD4KibiSIRMsiKaU0zD2rzV7i5e4WBg3nfpFSq2GFkm7vnUn2UY
	 VjLk7dfGFie25hwoeScPwUFzkhGwfmDL9/PHrtgg4tEd34x6F4/qniVE4AU1md16XdlP9
	 A+KUNeEXawT0Y1sV6KhyqcMS/Imkq4yl/f03CAk33DECHK8p90Agfqjxu2F2V4HKbbeB4
	 z/B5WLwPaJLSQXOlauDm9rt4CR87xHcWfzIm9Jcuf3bBbyif7MMsTEVYkAJqV4trZ1Mho
	 n8YzQoek0Uy9nOAYgkCmDOCDfpGandw0apjltVsNmj+xvOaKuJpj/Em2Ol9NTcI/9hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cern.ch;
	spf=pass smtp.mailfrom=cern.ch;
	dkim=pass header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=FmIuhIXN;
	dkim=pass header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=FmIuhIXN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.167.75
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021075.outbound.protection.outlook.com [40.107.167.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE18606A330;
	Sun, 22 Nov 2026 18:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE18606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=FmIuhIXN;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=FmIuhIXN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsKP77o67+WWB8KTQkhQbg9NPNRLCEP9+ktmt7TnT4AjpiYU1gxp1SKjvVte2vZtGd4DpKp6Pvhm5aWD47kSj/3Ql29EVAlzoWgrPwShiw3oF5/mpiFrHC2ezVhY1nfo4xNsYj5WzqrNFtISBVeHviLeDJIGWV95dILnas64x8UPVVqGsJpAjnOdTVcAuzPYFj4lN1tIpqFIFEpwsDvwcSpzwHbEvNea4pDG7Zy9Gqe5ctaYotYgaERNWlYvpdE0WTdi6SM2n9Wo+GJqQxoJmrgiJ25LxKoGnlmDUYjRFvcK6Ltx5UtIHku24yLQ4TJx9HxOgDd7kYWIOUbD7pK2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyYx6K9VFX0ULcaj6jInSgavSYk7f/R1Qex8ek7uJgk=;
 b=XdpjQgjMV1wSv+P0jhV8GUFxnI/xRsh7rTbM20bADTTX3MXx0Zur3kYLARPPxgFmUyvZjb0+lgEcbB1m5/CkOZplajmSDn/IkGZ/loBMMCash8eF316rqFHogC5yssVsux/CWKwXPnAUk5x/qIL4c5w94iiorK7iLFzGD7KPBkwyW2hsLiBgH/DLhZXwSsVUFnHGYg2wRD+oz03g+7kc934Z0H85eOv6ZhqnBnCgy970v/bNOwoEN/qcQJmC2aOHCmPFMQaOcBOn+btQaJAT2QnD5dKKzDInJF+lNB3ZnbYo8TeQdbtbzHmQPzCftxIJG7pu67Ug6swabMIVmJPmbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=antheas.dev smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyYx6K9VFX0ULcaj6jInSgavSYk7f/R1Qex8ek7uJgk=;
 b=FmIuhIXNOq1TKMbmbGcqTZONz96nolARY10AbryxTvFj9T+5G6W8OCIZ92Y6979bUqGPzKsqDiTYBRH4LuRIEQyBflLKIwCdl79erOz7fZv63xJbfR6w1AKA25b05zJUMBdMRqwkp5Y8zaVwkh7+Vu/hay8LFX6vcGN5Zbf8aQQ=
Received: from AM0PR02CA0157.eurprd02.prod.outlook.com (2603:10a6:20b:28d::24)
 by GV0P278MB1365.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:5c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 18:43:48 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d:cafe::51) by AM0PR02CA0157.outlook.office365.com
 (2603:10a6:20b:28d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 18:43:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.208.138.155) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Sun, 22 Nov 2026 18:43:47 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=FmIuhIXN
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010004.outbound.protection.outlook.com [40.93.86.4])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id AE82180181;
	Sun, 22 Nov 2026 19:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyYx6K9VFX0ULcaj6jInSgavSYk7f/R1Qex8ek7uJgk=;
 b=FmIuhIXNOq1TKMbmbGcqTZONz96nolARY10AbryxTvFj9T+5G6W8OCIZ92Y6979bUqGPzKsqDiTYBRH4LuRIEQyBflLKIwCdl79erOz7fZv63xJbfR6w1AKA25b05zJUMBdMRqwkp5Y8zaVwkh7+Vu/hay8LFX6vcGN5Zbf8aQQ=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:22::8) by
 ZR3P278MB1324.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:74::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Sun, 22 Nov 2026 18:43:45 +0000
Received: from GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 ([fe80::29de:97bf:5b0:49f8]) by GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 ([fe80::29de:97bf:5b0:49f8%5]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 18:43:45 +0000
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
Subject: [PATCH v9 2/3] firmware: qcom: scm: Allow QSEECOM on the Samsung Galaxy Book4 Edge
Date: Sun, 22 Nov 2026 19:43:19 +0100
Message-ID: <20261122184337.6551-3-mstoretv@cern.ch>
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
	GVAP278MB0007:EE_|ZR3P278MB1324:EE_|DB3PEPF0000885D:EE_|GV0P278MB1365:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c22b293-afad-4a97-d3f2-08df48c88b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|786006|366016|376014|7416014|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 /AejW2RJSZvgJDppS8RZ8pS5tmrbZwxTcztV6SlxT6slQK3gm/cm+UB1BeyvPwBycSemh1TdPSSmodRl3ICR0uIomcrrN96mzbiuWrCe7wc6G68/tzMPPJvu0uabtp/UQRLqLx8nOMm20ApV8dlK07x5wbnIlvcV8tE5RQLP2eQPaH7wMhjx5T4LCGG/wtM+xg233eK6dMo9L/AP1GTCWpwHhzw72XgoeKyZav6r66mgN0zbcS+f4YzdQ0sF76ZvEaJm+h19CEhiBsjms4BWgLRCbBLusaRluksWhUTM2tAVf+/V3xLZUzHlVgwvQWBGDSM2R1GcrcgTeUl/biRr+JX96Dn3j2mgMoA+1u/YhWR7iUN4Y6JbxHmjs9yu8ADDghB6fEFuy8nNTvbmnMk770NvTjlKgiQY9mq7lRUvIJwgx6fn6S2K1BdyiQWK3nkgo1Ht4F3/SkH38ASxg1QwYRMVOuaxXyKy1NUGXSN0MBJFvklFNSlH+zR19MpPWs5d/TI5yg2CmiZWL0sv0htlRdsol48EicQuR1i8dSmlaX6J0IVurcb8qVbBoPQ9AdnuC8w+9WbFoOQX/2s8+hlNASJ4Ch8F/UcSHtdyqXdd+C9s9yLv2kMAfsD9H9SxFlIgOGKsDlsoFzBE3Rh3xNDdRYG1Z4N06U8Jt4q2rnGcZR4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(786006)(366016)(376014)(7416014)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 ei2g6BsZhK76IeKPDm+QSLjolEoB45zChzi4IoZqJHYl66qAp0Q6wTLp+V6oPv7M8gIoF4KXkuzb3rx+wvKNNcpDpW8aTT/pXFJTDgq22P94UQURhd18q19kK5MbAzAVFt5zqftxOKRHw7u0ArJSjI3Hk5/trvXZQbFkDA0Y2ddfM7AElEfMn2kDMQIX9FSl42fUXGUeF26ISETbgGLTdIwOvi+Dw8viw7s5F1rejab027FzZj0DqbYmW3UhAckPfc5W515sl/kPodoetlmsZxeG/+SvbP2CYqN3y8MzcDDtsyikqMnZMOhVMKJ0XWf5GHq6agCPZ/spU2eq7vcOvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1324
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe2fd248-92f1-42ac-8442-08df48c889f4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|786006|1800799024|7416014|376014|35042699022|36860700016|30052699003|23010399003|19092799006|82310400026|10067099003|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cEBI4qsKNI4DywAHu5HT0FeRqBXXcZmQ41grTJem1FffQ7mvRIW6rop+DWbhRZMh4zPIhG5ALxHFzIByTjvq01ml2HbbLjAqJ7j4iBd/ZWN+poDEC/6D8No3zKHc2Dq1K3552qkw4CaQGZCnn3L56T+mTGJ9srl00Z8OzsudUuNmgL3iUqDFJ+CbjVcJTlD4s3N1TzKDKKbS9hwrXfT6On7Ci8XbQYBSIVcEkkKjLG2Mc3aPOZX2y+BtwuqkVCDmSUg4h8Yn4hkYtv296SIRAVbl6w79vVizn3onYFSKvRIvButjgaQ3X/QsbNV/Z3T909/dqnKWocMGStXwVMtqabL1xF+iafSyQBQBaBOPqM6oSCgGS2CnwL8JXn2teRPhiXwNbLKykhdAj8EGxLniKtYAHdgV439PKlr/fhCMZtQIVrUhTKd4/65o+LuQFgb49p89U5v5p/m9ceYytFZzebQAfgxtmD63aTDKcZDnnrnJ1FFdiG7bHrPOYProahZussTpFKDdn//GlVZHOB4qfo4tk+9i9XvI51HGTIu3dW+Ce2VxZPO6NL8APvydv34zGUDZNFw70hQtDeJtK/19fenrB6lp+PMjSLA1II1ci7CibXjZBydMTBgewSTEewkpqffOTOuGQ5j/aPK4VpS/J9m/4OmqS2C/MextOk3TlGl15b9F8yDHhLFPkAbjK1BXKR12aLFQSgztO6+aEXxYMw==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(786006)(1800799024)(7416014)(376014)(35042699022)(36860700016)(30052699003)(23010399003)(19092799006)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A+4zmI1YZKFGzEcwmNZRLvX5ze5MyNC/epZPjj7Z8GtYnN3qD2OyvdEUZITktBAtzfculdYSn2mW2vQ01SfqaThNxUBiIB7H4iet01ET073expuFvHzReey8MDyTlGcS4DLGdA+nHZukHyark3X4nG1jx7vd960U1unPL0tn/j4jxenaLc66RToKG1orqSeGSi+qfpy2YP8mKioeQ3kMd3YF24UjOCpHxKXkM7VX2LEZBW6FKPhNMZ0OhSJoBeTffN3cM+EwJjdL8hiO+c/d1rEHJxDm/wXW1IMbAfEM3M3e5SdgQYAuhBSZ3YcaKzjPoVEl5m1zUYaj0N9krHwhJVXhOCPJU9py3ylTxAe5BHef/6nJoFYtEVsjlrWQcZyVcYztKxn3+Rmw9yjeyW4WQK+KD4NtXIzxBgEcYrDMlCsR9LvCynPdn7a4QxKSUQFZ
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 18:43:47.6947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c22b293-afad-4a97-d3f2-08df48c88b55
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1365

Required for EFI variable access on this device

Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90..dd929fc06 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2270,6 +2270,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
 	{ .compatible = "qcom,x1p42100-crd" },
+	{ .compatible = "samsung,galaxy-book4-edge" },
 	{ }
 };
 
-- 
2.43.0

