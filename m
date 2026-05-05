Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8A270540;
	Tue,  5 May 2026 03:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952081; cv=fail; b=NqM32YcSZkv0SAj45H9DCNIdS3UGqo66HjZU0UgS6vey5zy4FaCXHM4Dv7Z2H4OaTQWPBBRHEa/8PDuoKBoV/C/8d10j93kEZ+gL8UZ8Yl+4WlKwKsP4g/UhyjQ+N8rGTt/nikv+sklO3CPHEeWic88X5C76Fs/HHkeVrXnYuMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952081; c=relaxed/simple;
	bh=3rRvYP/4qagLbdg4VcxwBzmOZqmYp1OgfVM6zoPh9CU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P2IGD65YuEj6aJe9RQJJmkQl4F2K7h3OTvJv/h2ASBhdkq+35GZzx9HuPnJGkBAyfEWTQyPtsuX8uR2yPWnuUnnsVxSn7MhS0BTENHRyn+CpxKxCUsPcIsgtQEqvzRNOx8z5wmCSucEysp+LCcXfwlnERRrhSZPvpRtpGoHWl6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DGbH9uIr; arc=fail smtp.client-ip=40.93.196.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DGbH9uIr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl6AtuwbsvIfAgL1oMz6R/NVfMNILrbpBNpuYrwUAR8OnbT5slZVOERr4VY6RVDl1k4xRujRfQqe1lQdDN+zEGnG4XukKgLd93EWVZfpxgB09ttwgEBNPTUx1CzMWkSL/TiOgbG1peyd2+CI5maM1x5kuNg7zCJKMaurAAoCh+BGNOIW9bkm7p0gAWd1w8+GAkPHuUvULv78vtYPCv+xpIbeqsd2uKXHUCT8zhZ4YqdqLhomhc5LT6QPWkNDEzAGsBQiscA8w7XnYsaNeNRgsWBD1AVa7YCSUOaEvFgfZ9WEDifzHW126KOlthOUfU7zZVFuu8BdTfP+yna6FIBPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXZ/WOx+fpZ8sthgAcjE44U21HVsEdvUquYIb+MLtb0=;
 b=IaUx26ZH6JSyQ/Gn1sZEi6tQ2RDBbqUIKaUqb7dduxtr+qZPciluF1pNRJg8E5fXMuFmui8aAMLkNrmyEfrs8/4yywT9G4OBIpWmFo2U50hqoXUKjGf5auYaTgG3epctcxQWV5P2mBwpTXMCKoOi3d8y39EtyvRXxqHMhG5bPvaZ+eZ5KVwqJR0ViV4Q07+iIFLdt8mhBYHDTs8eJRlnU2HPAFwhPtrmTPd2yDwYLKiKmTKOJFmPblteMeetYfMpBerQrsq0tzkUwIm0lJKODwd1TS7AcaWmS2QMaTSmXY/cW2tiFpms5m16ZnJDSJWIIT0HKVuY8iwMZdDruQHxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXZ/WOx+fpZ8sthgAcjE44U21HVsEdvUquYIb+MLtb0=;
 b=DGbH9uIrei5foEwrY76aqOM2FBlt1q4JUp3wZo/olYZVjKQgHPz9m+iLDFshMwocosR+XB25HfUZKH0x2uPNaTJPGvmZ3jjBXLpoIlJmFAYOPpqEST48l22NwzhvS+q8dljYVAjzHX+XRGS4AHotIAlSjoVD0BVDccEwlD1Brd2yNIQI5Zb8f/I6ns+JGwDGkD6eAeKf2Emtdy/nPmdVdd8EixDpQof+zd1UnegesrOtJHVJEcWxi9MxYfnsluOIDnPLWK1y2jLfCFGgtSLuekNzclRXD3cegLPFGvunxnR6sfAvYMEOwrn7bvcXotwVIt6Nhvpv2+aM1u8NUrjEFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA3PR03MB7254.namprd03.prod.outlook.com (2603:10b6:806:2fe::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 03:34:37 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 03:34:37 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 0/2] arm64: dts: intel: set alias for i3c controllers for agilex5 variants and derivatives
Date: Tue,  5 May 2026 11:30:28 +0800
Message-ID: <cover.1777951738.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA3PR03MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c031d8-ebbe-468d-8397-08deaa573b52
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	BtCOuatDAOHCx4omC1BqzJ39rrGirtw6cVY8bSsQJyU0Rp0Uqb4PLrFEivBxzlpHLHbdRUvvdkDSPHgC057t15rSV3zacZ4S0ScAd3j6M8MnEroDciF21wDEyoO9ogZAQKgQsaK5KSWTNTkBVTkM8BvmFizcwukDB0h6viQxT1xEt1zZbdI8Z+vaEBec4OFyesctIDZpp9fqNN/UXPQQZSggjR5SSN13mW5sUICLFEXlC9Vsaar/f6yeAVhAO1i9N1oeXvC9BIxuzeUgekq+9guedAkuftP43WdHCvS8vJcW3sL9VbzgZX39Zunjf+AskhrFfgD57bj+p9T2YfcSthtXlHKahFzzeln3voWh7Dgfm28tWb1iuTQ9kA6BDE9Wmfc+dptfle0fcsh3TG8g4ougUBBg4ccRZxW9ffv5g5d2BRb/xbGl4sOQwn3rPr8sG5rjTEaGxtvUUzRfW9g4tFbChmyWSpJxDnwX1QJBeKxtxyAOr/6eBKLU37pjzOJvaqIvZHxQK9ydibvlgWnGdGvYvRY39C5HzdVnegBPIWeJnb92m6UKCyj5gwLs6u4Db59QQkZ/a6pcH0sZchAHbXKUDXaVY8YxCPK3SlSLFKUIr1erx02O8m6NwYuJ+m9bVFvFlAymwwphETvAPmO1P7mrq8awSOx75RGtPkMM/n5Q9IX3+0wKhYIW5OhfCC2M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kOSaj0X6hcdgWQQOWjXOp9Ffc977hFmUNcUfXaHbi7RFb+36nptZvjwndi6H?=
 =?us-ascii?Q?uGTZtwRUdA3/y+G3uwkhATQfxu+bUe+3GvN5/BzPX38lncEntNmKxMQFlLyR?=
 =?us-ascii?Q?od+LfUfWz6VskVR8UeyXoi7pRa6pJYqsSq8bonz+0WXqijpp0Xm5LxYKaIG5?=
 =?us-ascii?Q?6EMajKhoPNPokCVeHoaZsI64t5cVil3PSi9LfcFjRIstJ+/sqGlIEuad9XZJ?=
 =?us-ascii?Q?0zWaviAdeEbw4cy9WliXTiknKRgmD7ZYhOMDzHn8qa/wTro987NrWTHTlveO?=
 =?us-ascii?Q?HdNvlHG6oztVDPc8Ayzu15Ltk30Z0KwLUAOGzEDIP5ZEs5oWTNf3IhoB9nny?=
 =?us-ascii?Q?t53FtXds9kr9KuHyUyvR0Mk0zXpwcB2Gw82mhKWBqttA9DztywQ/M1KI5S39?=
 =?us-ascii?Q?5jJWlj1WHfw96tpMAygktVrFkXQzm7t8UzLqsq47UssfTfZzMNpU0CNtJTpL?=
 =?us-ascii?Q?aB5moKYI1iAbPHigmQ1B0/kJNMCBoYVSLQWaOC36RDz7mBHS9YzqLGXhV2fA?=
 =?us-ascii?Q?ElxJmizuYz3dFkvl/GLGKiQvG3H+9fqnX+Guvqy6Yxkvc/0DlswKeuWPl0e3?=
 =?us-ascii?Q?R0aJr9l/u9SspZJ544BSMzOKhPvjhdH6VJv27RLXzFKx1EZE+oOy1KMRM+vk?=
 =?us-ascii?Q?okna62iiBtyBGTICuhLHYLz4Yq7AmNhg691d3OFe7zT7hCsZvgNNXS8wbCsd?=
 =?us-ascii?Q?Te2UpiWnpTPRZpqQPNmwjQed/cUOJZwZqbO+0hLMZdaxOiEPjaQnIwLEpuJr?=
 =?us-ascii?Q?nJ/GRYi7jHP3mlQqjvLE0taCIYYaJwwmbKiD9Vo6IDh4HbQybC//TWRWZrOj?=
 =?us-ascii?Q?cHDVy5xtUkx0HKu5vLiPpdrDf0dPsN28D3RSR4ekpVA0xl3Q8Jj806C1ai9E?=
 =?us-ascii?Q?62olz10nJf5MaY3YuK42CH8KZu9sdC/waBLgqbtA0T0JinPoAhr2lK3F0PMg?=
 =?us-ascii?Q?eDlY2dHL1wwI3E35vmM+QrG/6hHirBxPTNE9BlXfSZEi+FaKv50Vt+Ww5Y/S?=
 =?us-ascii?Q?6OBPqhKUu/Er4/cT/b4Sh0DEsPNG9IPkjyO3VT/z3DePZT+AfPl0v59A/qt8?=
 =?us-ascii?Q?ivisKkjkJxWBVGw3F4/qJ0U1w+cPgiqp7IOJZ/Ki9As5yWysEIa7Yv3HbWVp?=
 =?us-ascii?Q?YAK4j5LmrxLKWql070z80ORQjty7jX5dn6D3SQcrR5Ey752Zk70la/PpP9yj?=
 =?us-ascii?Q?Fh+8jSizVRGvV+SdrWlTD8LD3r3MPmYLcLwGt2AdeVIcuwGT++4GR9INuW8t?=
 =?us-ascii?Q?Rd4Cy1uMVxqxlxB/bQ9xxj48OTl9Yvpa1zML5/Z7mzMYzAQfruITM0+XpAJk?=
 =?us-ascii?Q?ghwqWd94khIrlMycybZAEBe072nKQ9aBhlZJhOFp3I/qjGtLNMtHLplOfkwR?=
 =?us-ascii?Q?yxNTs85FX1DRPVBROgbug/Mxv8XnCFC7G/EvBMNx8LZ1tAagiNCLuI8UDrYC?=
 =?us-ascii?Q?oV8MsET2lIwfola5p6u9GURl5soeN1oYYauIyZEqnC03XtHgxHA4xcgr0oSJ?=
 =?us-ascii?Q?Bc4xYq7B94O5RlJRlqSQZiPl0pRqWCMGtbdHfXnxR/1OKtCMW1wOkPOAko6R?=
 =?us-ascii?Q?ekR18ZjiTgb4d8wBF5geXh8hsNRPOVuJontDvVVuXa6ltKNfpjCXiu9AeggB?=
 =?us-ascii?Q?Xg2B4llqxdSjx1CmXMcXodEIceEYEKr0XYZmlcx3dxb4v7sfgzssvzb1DNYJ?=
 =?us-ascii?Q?8Tn8bpVxPpeZy/dZTY6KgOM2eD1HKStcqC9H4nHKPTrLqKQsFhVPl3qFs5zW?=
 =?us-ascii?Q?A/5ExsbuNWk8NFLHJLq3toTOEdtXF5g=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c031d8-ebbe-468d-8397-08deaa573b52
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 03:34:37.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OK3A/Qr1OJ+FMqiY8aiM8zZoAobgmKRujiznqQVCwMfRg4AHRokF0/3gMScF9Rnqmuq6Dq35CuC1Dl+jcWXqORqSP1tTtOlProCQwdmGSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7254

Agilex5 SoCFPGA variants and derivatives have 2 i3c controllers, a main
master and a secondary master. Setting the alias for both i3c controllers
to prevent bus id contention when both controllers are enabled which
results in driver probe failures.

---
changelog
v1->v2
* Simplify commit titles
---

Adrian Ng Ho Yin (2):
  arm64: dts: intel: set alias for i3c controllers for agilex5 variants
  arm64: dts: intel: set alias for i3c controllers for agilex3

 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts    | 2 ++
 5 files changed, 10 insertions(+)

-- 
2.49.GIT

