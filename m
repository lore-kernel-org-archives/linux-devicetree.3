Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156247;
	b=QOrq98F9E8ldyijXNzHbuuca94ekcYBA9cG1RXqBgzmi7Qk9I4bbk9Qrw0DKgCfpgEzg
	 vEyxPUHkTUKotwalCkwmoNEWjqsAdhkkY5kejOKQp5Mj3t3Ck5z6QBbdantuXfaAwMrhZ
	 1HNhgy23N/VUf3/h9ZMhkVdHza258nL2PaL1ADHcL8JtA2rm+aZ0yegsy3j8sElbt1IDm
	 F/PDOeDGc6NCkbf/y+44O1nMYX5IqRC7HBibLih11n2T2dhiwfyyCH45YoJ9LV1Rld0CP
	 Bv8eLYiXVD0ksfCQ5QM8YhSFkuOOz2IFPy6zVLTUdc/ifioOE7Rg7H9bH0TRF4UT0xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156247;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EZjru7svN1Hc32XxTLJ30qKo2RoSZYSS+nZB3riP3sI=;
	b=Yx96hSa7vP1Uok2Zu0Ak7wYpkvMVF88ggqn8GigUoj4UDQJVrTSJmF75KxTGw3ToTeN+
	 bXJvuMoMZ8Ru9iG7Qbwgy26tkbKiGe7dc80K+yxBadgZ3KBA20GTbU+Qc1MVa32vWtpc3
	 6BVK6O2olqmHBdKBmM1udZa1keTpf3StCAMF3f4pLu/A+CmQkbJUIRpgfT3BL+kNfNvhm
	 wwlJQDhoSZTmb5zX5PoqrM/Yu/j+CqBXhyWOQBakeqHiwi+c1zSujRgZ/MSbagF8ay06M
	 lUJVed7XkO2PdtKhh3zDyzg17CrMsm7FVLkBrgH9gaM0wmquS/FsLRjCCUC3QTUqOzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaisala.com;
	spf=pass smtp.mailfrom=vaisala.com;
	dkim=pass header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=pAT2NAIP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.136
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023136.outbound.protection.outlook.com [40.107.162.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A516D606A325;
	Fri, 20 Nov 2026 06:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A516D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=pAT2NAIP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hsry+CHNNk7OIhjm48OUGryNNqhPTkBSbCjV919bdNLrniJ1JlFU92HRSt34Q3E9vfFYk/Zm6C5F7mfKRw/gJeSzX3Je2ma4SS/QEsnbVJi+odpZPmQAxKLtiUXQvs7cVuLnW1PF5CdZXVFcUCz2MmNjGAjRZV83DAihDj1WU1FuMUqEfh0P8Ln5v4bjn9/m3fOUWJtcGqieoUJ+ztn/zR5ipEaZtgZum71OQnOF6vEl3okwn3fk3vp43BWoeuaz829LLTefkuTgtGjn+1wbXS0716qowGEx6/JVOvUxiR073TPR17H5r36HO+8Dg5UkAegae7WkVH6WR7MfBQMpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZjru7svN1Hc32XxTLJ30qKo2RoSZYSS+nZB3riP3sI=;
 b=D3KdzLrZWWLcwzrsNhEuP3RH5Xx/QfVvOJ1G8v8euAZSg1ds+6viXL5GawkcNY6kE6I7xd/v2DhbsQpC9+nJt9T48Wnlr4F9UTr+ltdcXm72I4wLM5MwudS/4Y2HG91ugN3Dcy1WFbVGv3IqujI15h1KoDx154RN2e0UuzXcX33e6Pbb905+BRNtrogZjszk6ee8Br9V0VhmUZ3jDLHrmzBpWEC57IsNKgkCcUOQpNIUER2BgNzqWUHuTkMkKNEMbv3GJwmtC6Hvybjmq9PTw9ynCth8CqvQsRmmRJ4BBURuHHEmjv0zbVyJyTx5nEmS6mGA+TrPp5CMW6XiZqHyfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZjru7svN1Hc32XxTLJ30qKo2RoSZYSS+nZB3riP3sI=;
 b=pAT2NAIPlj0rYaFuHG5gQi5Lbwd0jMosQBsckw0lwTM4MuvZ4Jn0R7O+5K5+Vvxf7IFrEKF83ivX8Had9BTbJHISRocER6eX97BeLqU54tVAprrBTYNFlJ31ZLqZ6/bOgcFwzOEc9YK0OohBmd3zo4htz+/wKNMeLnfc8th+4jNeaEuJH/0JCjg3XdjUklDbEnBm9iTxSN5HQBZXNUPEjer600APL+1PWxPI0eoFsyOnaRsvPROPrsqba5SANJ7RuBnqmElPh2NMxGQ0shRnXx9/DHhRkce0rTvTl+mSnvvNe43r4eqmgDVYIFX7x/U59bzbgdX3SFDrKoaH6zjzYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com (2603:10a6:102:407::17)
 by PAXPR06MB8207.eurprd06.prod.outlook.com (2603:10a6:102:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 06:30:37 +0000
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc]) by PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 06:30:37 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: [PATCH RESEND v5 0/2] mux: gpio: Add optional enable gpio
Date: Fri, 20 Nov 2026 06:30:28 +0000
Message-Id: <20261120-add-external-mux-enable-gpio-v5-0-0b622c1a76f7@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAATp/2oC/43QPU/DMBAG4L9SecbIduxLzMRAVwYYEcPZvrSW0
 qSKixVU5b9jIvGlDGF876TnPd2VJRojJXa3u7KRckxx6EswNzvmj9gfiMdQMlNCGWGV4RgCp+l
 CY48dP71NnHp0HfHDOQ7cW4fGUQhBW1aI80htnBb+hT3tn/ePD+y1zI8xXYbxfWnNctl+FkgpN
 gqy5IKTsd4htJZ0fZ8xJuzw1g+nhc7qiwPRVHKDU4VrQagaNbYEcs1VP5wVeoOrCiddAw0BlOu
 qNad/c3aD04WrnFRYQ+2c1WvOfHP/+J0pnAVvHCjfAOFfbp7nD4qbY/UOAgAA
X-Change-ID: 20250925-add-external-mux-enable-gpio-c9ba5beddd49
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795156236; l=5836;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=N3SVznnVHArKiUCPApqQzTsY5Z3RZGf2a/n/eQatKoo=;
 b=XMJrdNCaDa/jLyAR9kwcxwsaBwvkTBBet/r5GZEMTReJMXBlpYIqTRSaTjwZK7aq8/qwehbxS
 OHpIlFiLYioBbdeT8RUTuMvJ7xdrSK2kMOUNPh++HeBDpRCGV1EZgyU
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV2PEPF000480F1.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::42f) To PA2PR06MB9176.eurprd06.prod.outlook.com
 (2603:10a6:102:407::17)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA2PR06MB9176:EE_|PAXPR06MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: d8580d8d-4b80-4d6a-83fd-08df46cfc9f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|23010399003|38350700014|10067099003|11063799006|260925022911599003|260925021911599003|260925021311599003|56012099006|261021121427099003|261022105027099003|261021123027099003|261009223027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8KeEoj17cI2U3HSXovLIHqgUrRXdrabQPVwd2niHDODLbvFFoFrzbDukQWGrdcTzi+b0o0Xo5pH8PUo4h9n3YkHKAxAkWkZ6FnV6Oub6QnVfwjRiBNbRHECgiuAH/6mNFlAtBHizHWwnsFh4Ior8wBkK9X79GSaAaR1kGtxtJt2BU5TqEQzzDkkWhYhxq/tedRmpLwqm89gUgmAsiSredxx1pRrqN6zpz8RTI5zFhlcKzbmKgDRSOi5eu/BQzm7SjvkFpnnGde80oxw9Oh5QDgvLu+S2Kjg+APRQ6zIgqw1ivEc4R58TOKuAv7tywHRfuYxrRZeLOYo9feUErr1BWuU1g0egKZ1RJkHKfJUhxvUy/0a+8PNxGv4fdEolE/YI0BcnHiI2kKvBaMz7LTcqWpZXR2wLk01CphSSOgAmbucsyIAGASmti0gCJ6xgm0ga19a9lVjAtEGH4GOVde4HRP2rU0um+eDF0ZtZTG75WNVCBE1pFA2eOAHM7pNx46AXFTXbfnQGb22RBztplRK7DKWiw5280O6trEB/yAUe9q3eKE7x4RccB19SN+r0pgGvbwSvjwwq2Z6zQQ7SowQvKuk+DcX1UY6dyxgTaoot0SmCAc0B4DtXqweXAH2ROzU4/xbXunT25mmsntJEsYacVroLTuGMTKJajx7E+dqBMZ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA2PR06MB9176.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(23010399003)(38350700014)(10067099003)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkYyZ2kzN0NvZ2MwNFlmdVY3ZG1yOC9LZjVhWVVnRVZjaTloY1F3d1dGclVS?=
 =?utf-8?B?Q3pnQ2RuQ0wvWlVOSmZFUU9hSEVCdzc2NElzdjR0VkpNUnloVzEwNmZOelBk?=
 =?utf-8?B?U29HSjdad2NWRmFqeG03bDd1V0l3THd6MXBMOEd0U2Mwc3N0UzVhWTN6RTBh?=
 =?utf-8?B?TXYrSENiTHBoQjlpNUtvUmlqbnZxei9XMmdVMGQwWmE2b2ZsbE1GWksvT0g3?=
 =?utf-8?B?TGllWUd1K3BpSDN5dE9xNWt0bjZLakwzMjdzREp3ekgrM1ljdGxXZndGUnlI?=
 =?utf-8?B?bzB1MkRoeVE5ZVV3WDRva0tMLzE1T2ZwNEtOOGtFajFGSm5jbEhCT3ArRjd4?=
 =?utf-8?B?Q2JHeXN1azRsc0YvOHFZRHV2NUVxRWVHMHRWdklkU01VTGhnY0FpeEljT0VG?=
 =?utf-8?B?dlFDbmFXSU9GOXpaaGlpRWFwa1huUHFZQms3NlArVW14MWZtRTNWakp6QTAz?=
 =?utf-8?B?YXVVZyt4dGdSY2RzVFBVczJaTUNtbDA3WklVRUNBaHBMOHVsa25PdnVrd2Rl?=
 =?utf-8?B?Y0FCN1JZOWRsNGRZV1QzTFFYelNhSTF2K3YreEp4NHlvZitXenVHQXVlVkE1?=
 =?utf-8?B?WWRmamhRbmpScERIL0ZQbHBGQ3BjNGtYdXZaYlBkeTlGcmxpZlhUZHdlemU4?=
 =?utf-8?B?blp3V0s2MEMvUFVTVmM4NTZyU0lNM0pHcVQ5MmZMTFVkalUreUEvK1JHcEEy?=
 =?utf-8?B?TXBOTmNjTUc3SlV5NDJzQ0N6bWlEdkN4U0JMR3RhUmthRzRDbFhNcVpxSkVl?=
 =?utf-8?B?STJCeXlUKzRQa00yc1gyOUdHVW5xd0pIaDZQZzRwaFNDN3lzS292Q1QxdGJ5?=
 =?utf-8?B?Zi9vMUJwdTdRUEd4QVhsTE5tb1lGV1FqTG9WL3hHeVJhYTlLdm16TEdHc3Rt?=
 =?utf-8?B?ZDNRa1A3Z1ZBOHZTcDM3dkhHUkVlSTRxcUhLOGQ1L2lvZ2lIaW9VeDRXRjFQ?=
 =?utf-8?B?cXlzZmFPOTliOUhWRi95NUFRRGgwMzBDS2V1YU9VQ1FqckpBTVhOWDJqT2Nu?=
 =?utf-8?B?Ylhrb3RqRTNMZXVuallORDZOd0V4SmpHWis3ZjVJUG1XRXFsYWM5S1huOXhR?=
 =?utf-8?B?OGV4dDYzUk9zU3ZucFZTdXRwNGo4eWl1c2Rjd2VwT0tmeUhudVF4Mi9Zdnhi?=
 =?utf-8?B?SW91Tzhxang3OU9VdVR4RzYzQTYzV1ZoTlErK2pvQStlZDVzKzdXMFlMQXRV?=
 =?utf-8?B?eVNXNFM4ZW95dENCTFJUM0VhV3IvMTQ0bXl5dURGcnZMa2NIK1NkSERXQUhw?=
 =?utf-8?B?aTBBUFJWaHd0UjM1WXN1SDlSdDd3TndvUGlOWGdrSjRNemRzTWNCSmRsRjBO?=
 =?utf-8?B?a0JJKzdVMnV0ajE2NFliUWYyQjdobDdOdkcybERWMTI0RExZQnNJRjJyblNL?=
 =?utf-8?B?VGlBY2JMR1F3ZFBHQVMwQmd3dFk3UW9VYTAzSUtrRFN2bGxZd2ZadDBRZmFN?=
 =?utf-8?B?bWZMTEViWlY4RXVtMHBxU2JkdStMQnNZSHliSnp4R3VrMXNSNVZSMHhSY2Vq?=
 =?utf-8?B?RGxBTUl1cThvdmpVL1JuTGdiZ2NEcUhDTWp3VjRmL242RlZJZ2pHZkNsNHNS?=
 =?utf-8?B?WkNYR0Q2VFV1RHNWR0ZzSEFPQzBOZmNud2tPdksrbXYrcEFCL0daUTNPMmNl?=
 =?utf-8?B?a3kvM3l1NkZnTXJHelVTMmhVcFBkRC82bDFtM1dsbHNraTZFN0NrZTdsOEUx?=
 =?utf-8?B?VFh1RkMydHZHUUN1bmkxRE81aDZEK2pTUGdrWWxpd1hCclF2d0FpZ0E3SlV4?=
 =?utf-8?B?SFhkRC8wMVgydG02eENlNE9DaTRoUjBQM1ovN2pBUjR5aFd1bW5LTFVBOXBa?=
 =?utf-8?B?WGtFL1dyL0ZDcjdyZjU4c3dLYlFpbkNVc0RFTTIrdXdrYVNncGY3cTVmSS9y?=
 =?utf-8?B?OUVvdzMxdWV0THEyeHcyclNnOHZpWERhU3BqZUF6SktVSnVseDRJM3kzUkdL?=
 =?utf-8?B?SnJOWHYwUUYrRUdzSFpaam15UUZKVnZ0YllnYklSVmc5OVlSSGVvN1ZaL2s5?=
 =?utf-8?B?OEM0WGJzbi9najhBMG85MHhMYkp2clZYazlodFhmTG9sei95OUo1dFVjV1kr?=
 =?utf-8?B?REdSZlJxVFhlTzhpakZ0VHZwSGkvUWFsckFtVG9NK1E0bVlzTCt1aTFXdXl3?=
 =?utf-8?B?Q0ozU0pWVXNDUGN3K3lrTDNyYnhZN0lKSWc1T29iQVdjMUpUakFJS1BKT2ZY?=
 =?utf-8?B?dEZIQkt2OXVycm5TVERNeWZvdEluT1liY1lkN0cxcEJVbTlPcTB4U015NnBT?=
 =?utf-8?B?QlpEOEZkTGZhaVl6WmNVcXdGQyt0Q0pMTTEzWlFndkh5N1dHUExNVGNGNkxh?=
 =?utf-8?B?THRnU2paY3hoK1pPYTd3ZVd2dEszYmVpZHhIOTFnQUtERUwwWklpZXExRktV?=
 =?utf-8?Q?y/m0m2IIhskUpN4k=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8580d8d-4b80-4d6a-83fd-08df46cfc9f0
X-MS-Exchange-CrossTenant-AuthSource: PA2PR06MB9176.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:30:37.1184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68Y/7E3XaQhW9uBbIqw+gkdKLzw5NG0juCD1RBN77QNbwLOAwkK3tBzjJ1DpirnJqYQl275Tc017yqsA7RvPThur4VD9ZbG/RwgWHo2W6Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8207

Analog multiplexers have an enable input that puts all channels in the
high-impedance off state independent of the address inputs - the E input
of a 74HC4051, for example. gpio-mux has no way to describe it, so it can
neither reach the idle state of disconnect that the mux-controller
binding defines, nor keep the mux disabled while the address gpios are
updated one gpio controller at a time.

Add enable-gpios for that input, and use it in the driver.

Without it the driver rejects MUX_IDLE_DISCONNECT outright.
mux-controller.yaml allows it - idle-state is an int32 with a minimum of
-2 - but mux_gpio_probe() treats every negative value other than
MUX_IDLE_AS_IS as invalid, so a device tree asking for the disconnect
idle state does not probe at all. On the board below that takes out the
i2c-mux behind the mux controller, both SFP i2c buses and both sfp
devices with it:

  gpio-mux muxes:mux-controller-slot@0: invalid idle-state 4294967294
  gpio-mux muxes:mux-controller-slot@0: probe with driver gpio-mux failed with error -22

4294967294 is MUX_IDLE_DISCONNECT, -2, printed through %u.

Tested on an i.MX6SX board where two SFP cages share one SMBus behind
DG9411 analog switches: the address input selects the cage and the
enable input gates the bus, both driven by a PCA9501 I2C gpio expander.
With enable-gpios and an idle state of disconnect, the parent bus scans
empty between transfers while each cage stays reachable through its own
child bus. A logic analyser on the enable, address and bus lines over a
full boot shows 97 enable windows and 82 address changes, with no bus
activity outside a window and no address change inside one. Dropping
enable-gpios while keeping the disconnect idle state makes the driver
refuse to probe, as intended.

Greg, there has been no reply from the mux maintainer since the v2
review in September, and v4 and its resend went unanswered. The binding
carries Conor's Acked-by and both patches carry Alvin's Reviewed-by.
Could you take this through char-misc?

Tool use: Claude Code (Anthropic) helped draft the patches and messages
and reviewed the series; I made the design decisions, reviewed every
change and ran the hardware tests.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Resend of v5. The patches are unchanged:
- Add Alvin Šipraga's Reviewed-by to both patches, given on the v5
  thread.
- Link to v5: https://lore.kernel.org/r/20261105-add-external-mux-enable-gpio-v5-0-96c5b62c86ea@vaisala.com

Changes in v5:
- Request the enable gpio before the mux gpios, so that probe does not
  pass through intermediate addresses while the mux is enabled.
- Rebased onto v7.4-rc1.
- RESEND of v4: https://lore.kernel.org/r/20261004-add-external-mux-enable-gpio-v4-0-e9393660feed@vaisala.com
- Link to v4: https://lore.kernel.org/r/20260909-add-external-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com

Changes in v4:
- Pick up Conor Dooley's Acked-by on 1/2. It arrived on the v2 thread
  after v3 had been sent, as Rob Herring noted.
- No other changes.
- Link to v3: https://lore.kernel.org/r/20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com

Changes in v3:
- Address Peter Rosin's review of 2/2. Cosmetic, except for the last
  item below.
- Say "Some analog multiplexers", not all of them, and note that the mux
  gpios are not guaranteed to be updated atomically and that only
  controllers implementing set_multiple() can possibly update theirs in
  a single write.
- Drop the _gpio suffix from the struct member: enable_gpio -> enable.
- Reflow the comment in mux_gpio_set() and soften it to "might not be
  updated atomically".
- Flatten the idle-state handling in probe, read the property into the
  existing default when it is absent, and assign mux->idle_state once at
  the end. Use dev_err() and return -EINVAL rather than dev_err_probe(),
  as suggested. Written without the empty if branches of the suggested
  snippet, but with the same behaviour.
- Beyond the review: return the status of the gpio writes from
  mux_gpio_set() instead of zero. The other mux drivers pass the write
  status back, and mux_control_set() only invalidates the cached state
  when set() reports an error, so a failed write reported as success is
  not retried. Happy to drop this hunk if it should be a separate patch.
- Link to v2: https://lore.kernel.org/r/20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com

Changes in v2:
- Describe the enable input in terms of real multiplexers (the E input of
  a 74HC4051) instead of repeating the binding text, and say what needs
  it, as requested by Krzysztof.
- Add the missing gpio-mux: prefix to the binding patch subject.
- Limit enable-gpios to one entry, and require it for an idle state of
  disconnect in both the schema and the driver: without an enable gpio
  mux_gpio_set() drove the address gpios to the bit pattern of
  MUX_IDLE_DISCONNECT instead of disconnecting.
- Deassert the enable gpio while the mux gpios are updated, not only for
  the disconnect idle state, since they are not updated atomically.
- Show enable-gpios in the binding example.
- Link to v1: https://lore.kernel.org/r/20251105-add-external-mux-enable-gpio-v1-0-e59cba6f9e47@vaisala.com

---
Tapio Reijonen (2):
      dt-bindings: mux: gpio-mux: Add enable-gpios
      mux: gpio: Add optional enable gpio

 .../devicetree/bindings/mux/gpio-mux.yaml          | 22 +++++++++++
 drivers/mux/gpio.c                                 | 43 ++++++++++++++++++----
 2 files changed, 57 insertions(+), 8 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20250925-add-external-mux-enable-gpio-c9ba5beddd49

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

