Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794312614;
	b=Lk84bP6lfScfqnUDq0c923gr2By8wnrT2jzKGB3S8RWE94vT0uiez18SYoIpkeP7Hqlz
	 WWtnRMBvnJRo8SbxFm5VZDmBHgjzEfaY9quyARgw/m0QszOThq8X0Dl8q9XbZAtONW0IX
	 U+hX7AVEZ7ba3TCN+uxT+iaXU1c9oMHLuXz84tmYnp0Gz5RpskGPuqZ9uZ6N9oLapEEuK
	 McZEO9vIL43XhOQXbeDM2f/SqIzMuTQ4GH1I0hFrC/5cFQrdSHsVMHP0sba2X5hdnjPML
	 mbjqDK4s+LaHTajkQ6thy405K6H9wSnjG+naMaZ8yzIke4ypJ4g8fl2Hr2ZT8VIkPow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	b=ccZX92q7imzHy7v8rhE4FHBpdYMtlXJzb+hI9v63rt1c6nQUftmzzASO9atx+vKKEynT
	 Mqk8Denz68I07Mt53iUj384Qs9kYW6ioxosAOrCXYFLXb1IuR5qivZAvwMyR4hdqDl1gw
	 5+3K14UAB7ylC3w4yEJGQVwEti6f/MQl9N7mMUhDLz4EsYd824cj61p/H7JsR6EDTkdbK
	 +rXA1oGMWLzrpgQMMfLxFMRHWeF874Q5qjWJ74u3O+6qZGQzN4dgb4LQ4+AHI1Womqfio
	 jg5K66+DDJKy4xvq1E2sg+3Sk8nkH4MhCAgpFxyxNGQEMrdz3PV7OO/ATId6vTWOXYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=dPC6zthS;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=fKjpKN6k;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Cv9sydRh;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F0606A332
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743F0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=dPC6zthS;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=fKjpKN6k;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Cv9sydRh
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB82E82541249
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:10:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfptdkimsnps; bh=bIkL3j1SUti+mxRknWX
	sGzjEHfZ++LfAOrCAj6OvBfk=; b=dPC6zthSY+5J3fyzUFu7KOqHMwTOZKyxud+
	V+jffo5W1xBsZRYDseoJ2cJjFXLGSCxFJm0mptoFWUlFv1YtFb6jHY7OYEr2YHrQ
	OLMP2Wf5vzHlKLMs/0tYw1fuyGoRof4c5rPWR8bmKxs6kqgO3ukVrSVsy9KdiaUJ
	HEE1fwPkp305jwUY6iX7igEcgOto4rEHmqSlTTJrZNyt6e7dAfIHHgvGgRkeZBnF
	hyTrpzwFC9lAAJJ97whK20i+s6jAN/5yQ9TdH39FTKSUELPL+1WJYHlRFEulUh3r
	NgcXkpa65IPQnJX/zbISaohA6R7FzxZ+Sl7mCHamfDhD2RTIi8A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4huhs7xn1t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794312611; bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=From:To:Subject:Date:From;
	b=fKjpKN6kxzFUNRRchaSoUqllJd/JxclLD6zaWFIIAWIDPNbykTl6Sm9wB6H3ZSPqT
	 1xOBIJ4UFbujM6d5NAG3L+Y+8ssnjkDhesKgYe4EPZQ/6bIGxZz27L7XwLXbMIU86j
	 Z5WfvH2bsP+vVYZheNhkCjcIjbvZYmejuQy8ltn9YYnXU+9cyXL40ckLNH2wWszCpK
	 Oj7K8vYQPHEnV51cD9CHfkUPK49/iZw0xLOfHYY/CvdooURsWje8RZccoFrz9Urm1s
	 wOnA5qwEgaWI1UhGsHh3XaPdVvsugaXhkI2YdPfMFMhtUg59DhtrfPmgtLYzcbkGNy
	 MNpfVGveF84LQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7087C400FE
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:10:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5D680A02F8
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:10:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Cv9sydRh;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00603.outbound.protection.outlook.com [40.93.23.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1ABA0401A6
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:10:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4vvKtAkqn6/eF6JzVZNHH+BC4h/f5NLVzDOafYyRO6BYoxQe+RL5zGEr3qvptWy/3VEHUrSalJYPJvMzL8p6dO+utNeRLjJI0J9nIUAgQXMPm8zm6ObxjRolCcibrUhI860bN0f6Rbl+1tfX+Kr72xuuMt7jD71JqLMY2q2/ZNBYiyGnyIWsxpQ3z4ismvqDv4NIzBkohrtUoSzSeBoLAkfqmRbGHVBlRXzzPSBb9XnLwjnrUa3SYjKzb+kh73iT99ny68arAvEDDTYdpTnggsNKZ5cZky62niJG07uio6nWMfX/yelAgTGEpuXmqKC9WAeXUIhh3DPQTPp9jeLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
 b=RlOCS9q2a1fx8yEWOeULt56lqLcb0iHWGlhpxFH0YvwAf505JE2bMq2jAEsGiOBMOVp4QJKfv/udRSEURunvWcfZ38RCGbF8W9hBRwLOCLVc0gJMdA/K+fI9oE8Fdz6bbXLhZAmTdhbwK7qvfIEZObl9I8vLpRAbwW1mAIMLmXx3ns6BwoCTJUc7kFcFOK5KM6sGMe+IrLxyULdGqleMmS0Cnx0iEnaVeXPm94XkzK3lmgIwe37tAOU89J9xHVT4lgWq7uTNf7dYoAWFvQJAqniGtPIl4YbAOB6i1S6Mq/dg+Cle+T91ke0+GoLAI2Zka+quJa+d33FfavRB6qldFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
 b=Cv9sydRh+nrX8095y+QYezLOt+hQ6CLHGjnG4s6reo+qumBdLqQI1T6iC85tT2GVWKysNz/0XSgwIV2ycvGCkk1Xi+KCn6RXW+SkSm6UQ1Em+8oipXo17IQnggYjPpd29LVbY1a1QIh6CAenrm/fFuCa+SfnlOBUDke1/dVuu3M=
Received: from CYXPR12MB9279.namprd12.prod.outlook.com (2603:10b6:930:d5::7)
 by DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 12:10:02 +0000
Received: from CYXPR12MB9279.namprd12.prod.outlook.com
 ([fe80::c083:3694:3cd1:61bc]) by CYXPR12MB9279.namprd12.prod.outlook.com
 ([fe80::c083:3694:3cd1:61bc%7]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 12:10:01 +0000
X-SNPS-Relay: synopsys.com
From: Prakriti Sharma <Prakriti.Sharma@synopsys.com>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: subscribe
Thread-Topic: subscribe
Thread-Index: Ad1xDGCf6ZK14aUrTXOc86SZaMR2wQ==
Date: Tue, 10 Nov 2026 12:10:01 +0000
Message-ID:
 <CYXPR12MB92798754E0607F13A1319ACCB9722@CYXPR12MB9279.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYXPR12MB9279:EE_|DM4PR12MB7552:EE_
x-ms-office365-filtering-correlation-id: c72fdac1-bd60-4970-b3b5-08df3f238c01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|38070700021|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info:
 l65c0f3QVziozxgn8Fapb/27tAI58xqKJZiRycpnuw3yTTrV1FLOyMhlWRIcSMIir8G8fIiMhDT8Xqc7R0yM+72Oe3oNZaneM6qx5jcKhhpSbkHp5UO8GBstA23oHcr6lPLLPB8/EBVhLd9BLOCFxdoIj1KLld6FQeYwmNcySO6MaHpbslCuugo+Hs/wzpTqKUFdFeJ+odI4cxZ/ODHNSP7x5NPMNb1B4hM+4F1kb4r60Ms3PzO6zXyc77HBqLn9RwxYZ0/vndL8VGXwtQ6ihDZAGOLsXIOOFfjx2i8eHJdtOcG3vkpSEGlrYJrG7bXiJKnFie4uZAzw5cD2PYeoDQXSMXkudd6P7Oe0UVJTV9AdklotKZwSu0rHZkBgT3QCnXqO0TokQ0AGj+lIhQm0WDsZTMk9OP4uqOuquRJhP9zPH7Na5B96OsuoREfzgkOWi8RntQFXwlihOyi2bI7A8w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9279.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(38070700021)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bQ50CN7OY0RuBg2xb2XlDkX0wwAtkL70/KqclSkqoqN1aS85IxeDjlnV7Zlh?=
 =?us-ascii?Q?lQ+3HoB0cdcqK+H64Ms1LBVfZcUrUBuzqIHSOxTI6eeg6qmolDU3pzFuGoVo?=
 =?us-ascii?Q?+1TgdaRiNiZOwpbeuINaUA3LU6cu2X4ZIQ0BzkvD1kwiTcnyGCfaUIDCYWtv?=
 =?us-ascii?Q?rqTROQPMsqbrvaqJ+lakSallUwOPQW2SNp+/wHPu6cPwPVHEjClkwOjibl4m?=
 =?us-ascii?Q?zp22to+3wWNFaLoI1vzZUnhaFgrw1jsavvQJOUmIXFwXJpDrpsv7PQRfiJX/?=
 =?us-ascii?Q?wjERO+NnlgYyn89oZek7yCgAWCNJQK8rvx3UG8HpADPNSnrSbFiE1weq9pt+?=
 =?us-ascii?Q?Y1sMH8fASNdFGsR9qp7tkRplzLPB49R7iOHfWbaOwc0bUVzaoRkX+EFMtpdW?=
 =?us-ascii?Q?F/+nAma5B0BM3Rm60LbZI6Ar9xJg7eVGROgW1IEMlg9oDhrwDnxdYRftleQZ?=
 =?us-ascii?Q?nSnGYgF2CZvoe0OShKavqyCS9m3eus2oCw/CMIOi4t/4nPPw0c8WhVwSqMmu?=
 =?us-ascii?Q?pbTrx2vyvmYcGLqJI0Fx7QJihSyIAd6Uj8geSEIJ9JluvUG5Qguqyn1dH7/F?=
 =?us-ascii?Q?6CPL20iyzCxiG/GfPqRtEyX07J9Jx1dly4A2q9mfo4bn6TsYmUfHxDtm4khL?=
 =?us-ascii?Q?UBGh3fY/kn8JGOU/9O+de3eE3oZ4oQBYwpOXbtqtzuhH/w6uZeuP6Dym2hsh?=
 =?us-ascii?Q?jnz8eEa4EIXnIDPAX3Lzs0pEAGIuvLE3AeRjwIYLFNxHXwkt9eYMDpKcJi8C?=
 =?us-ascii?Q?zpLSqemSdkbXDH1xEmavogYfC6h1vJf5OzE5dJeA0FyWE7ZPjQKUuml76RLT?=
 =?us-ascii?Q?wDoNNfDTCP3mfqQhPCXXLOyKO+SO/ZZeuJncmOAwR5T5nYPAwkEehl9BxXez?=
 =?us-ascii?Q?ptRmJGqw2rbRyc1zk3Krk0ZGNENPghT1ZRU3L+JgeF078S3Sz46mcYrHBgy3?=
 =?us-ascii?Q?zMLttFT+/nYaZqZXb7TFrwvVvwwfAsKvWz1tF65/2lD9L9vRinHzfSo4TDzn?=
 =?us-ascii?Q?YYxyv2SB2j+RYrI4kku4cZ7Nr3yuSRRb8ER43NW8izWoY84kaN8DaJL2QbL0?=
 =?us-ascii?Q?T6rP2Yh3NXJK6Odo+4+/5cL9tJkCFwHah0KmMoZ1ES6UBgCcPngvRP+E346e?=
 =?us-ascii?Q?U04cUm2nX6kIpJAx3vzLTm5OEMEGRWoB203Epetl/bFoITqAm/YGG/vneUuH?=
 =?us-ascii?Q?vVBZJz4Jgxl9AtR1luIRF1DITyBB1D9twd7E3PZ7fSE/fFzHrn3N6QCjiPwp?=
 =?us-ascii?Q?otW73h1MlM4vNPRKqzqfDkBi3jGWXJAsJFMv97NeaaQqDspX7UejEw3IgGHK?=
 =?us-ascii?Q?DjTFYfRaFALoziHREDW7KFMZs1XaFoQyRTnU7Cbr41x0gCTta/8195n0A6k0?=
 =?us-ascii?Q?rDjBIpX6dPD2ef8euLaVe7pCWvp1iXoveDjmcG/CsvJMz93DGp+b5hjt03s6?=
 =?us-ascii?Q?dLOXZBrqWmCeEuisG0t/VPnuQejyn9CEELJj9EafGMDtrPYuUwtIStOSVOFY?=
 =?us-ascii?Q?8Bz+yJ6E2MJTQaOCuxfCW6hExgCwZuinKkuvVbnhWs2Fe1b3WwRDUSiACJL0?=
 =?us-ascii?Q?fMutxB764OT3RI5643f+/EqFk+VUXbaqF3BNjnz2a/GR7noObhM5PF6TyE9k?=
 =?us-ascii?Q?f6w5p3vwSSBRHcGNqaAP6TxEKrTinNn8/Hx6QIQtAPkkwEt2zTZWQmmUDnMp?=
 =?us-ascii?Q?qjxP31SNtymwTi1Vl8rpYuveLZ4jXELfRXy8poLdAq5QA3U7m/s6PDmj8y8f?=
 =?us-ascii?Q?sKNJuwL7pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	yZmwKyfUIC/eUi7D6Vs022mTrR0t9ufY8OqBJE9P3z0hNfoSmO4xqKWaOxF6KbzAp6ESMSYrUpzZ2go79Fd8PqqQmcrSmhRr5bj4LQLrbbTc2NJuHSAo0S28w+Ivpx+wn6Dn2qZRuRVe54sTVdk3/C2lPXoTybefHxdsSuP3FER33AWhsw4PL1XKYsD4dxcfhOsZDPu3am9iKjNtiFWwlvDduZxDW3r4CSOULZSx+6eninWJKRXk2E9rPqW/dBp7lbMry98A+1fHqe5Kh0Ym0qEBUGkSCSITPf1iKjjdqU/HZCC0ft4zSMCEa1sINkdvv8kkXj6C2tPJNJ31MlNPJg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pxy6C5po5077jfGi+aZjEAjsK2WrjixoUMUwIWOO7WXQhTyGo3RBp1IxtUo4ZlN6mj5kpwaJFkVcFF0EcPvAU6jA/M+4MeTePJsWcSpcnGG3A+xghYm5iiQzsPbs0Vni/VCjF2yg6uE99WTS16+zWTsG7Q9AsFfUAhTv1gyGlHAq13T0bVxSxDZpdjzcCj8pIwOrT8yAsPQnUDZYkgdGzaw7bYLa65I7uuanBl72UzYymPKssfxc48CKrXimZnrrTg8gLXQU3sJS+KRySg/EDVPXHOQuSmIae43AXaSePeq5az6cJsjnNv3r3HAtn3/HJnCf5988GQh/vX2TH9HDEJ27W5aeXTexSmt1DlPDNGh02d8wJadI0AuBQ1PmfKre+btG2E+qQzhlBKN0jH+wXXGfCkOXcTNsSqq1M+SIzDiUf5jSrT144Rn0f5hiGDBCffBTfIMLGrNLr3m5rjFG9YNvj8UVN9OYBrhCq1az2W8lo6JYHF0yafzYqpK+SE2xzsLGw7FZQRSX7ZiYAS46T2GND8Bjo4lBu6CKp0HBh+mF1ucwoZiTXd6SrvmASTCxr0hRsA8Nvys9qHREFM0IBBHL9SDl+Kn2z4TKMfu7phgrfotthng/qQeqyyGOoT7N47mg4R4IDFV076APLyFkyg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9279.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72fdac1-bd60-4970-b3b5-08df3f238c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 12:10:01.4808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXMg1ZR9dy3KnmNJdCVuqVioA/8JNr1Syl+UTt8piYhTQkNcSzNty9KN+JkovOliAxP80+LY9CDEx0muw3pcAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552
X-Proofpoint-ORIG-GUID: fPhWgeSuQC8O6lvvI066f97cy3yMXWFY
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6af309a4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=JV2eVSZHMSyV4Tj97bsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0OCBTYWx0ZWRfX3S5C8yvIb4oH
 iNxLm2oL7SAZttiyFHEGY9TlfvyIgmmPVstFgpsODUO+RQZnzz8pXD6k8YgOgoMEjFSSyVDzMkF
 +LlaAqX/UvhKr1SMd1pAWzz6nz+2CMhyCuDRlGdYS0V0bef3KJRDRcJwJgy+VhZPtnyoHkJ36tv
 Uk+jKhAm2ZBltJ6a97+1vuPCwj/5x2Rodlu0ely/jgYRFKS3xXUIRWPQ4R/adle5ZTP0zACrmLP
 bduVrDWxspwfFpQtV9PGNz1i6IJNtqIAeOZFoQls7AAOC0rfkcD3b02+EnS5inBEYKWImZfryt7
 IXwDl6YEZONdhtUFZ0zsB4A6mwP+SX1w4XckHKN+wQ5h+h3HLgKGcFNyhe9039y5WHYjONmALvs
 xcAOFxmnAYamGvPR64+OZf7JidOSjTrvxiqT5RblFWAhhV8tHwrtz6vE58qCbKPaDpLh+7Up4t9
 yDm1DEIQ2Zkeqv07TsQ==
X-Proofpoint-GUID: fPhWgeSuQC8O6lvvI066f97cy3yMXWFY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0OCBTYWx0ZWRfXyDu6pMqSAH2p
 QQTi6qWyQ+89Wj5EJGvRAON1KEGDDAe5W1Pt8HsdpECFav02wTBkAxds7SyDgpw364RNt0ls9rU
 Iu2K+iNln4rdHP8jG2OlC51NI7mG/ag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611100048

subscribe
