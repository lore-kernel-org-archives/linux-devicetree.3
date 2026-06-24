Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C2A305677;
	Wed, 24 Jun 2026 06:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282128; cv=fail; b=SLhcRWf7etXu7qK3frRfA+WLGGCdVPM49E2/HBw12E5+5QVkYwsFcuvu53MnR3vGdJdw8TVpXy4HzGP7MDXmYYrcoFR/VXBv3dJM7DV0tNRSktYdLtE49nKdVqrYHQgkeR0q8eqVJ+tfFv80CaCXxF9bRvscp5Hh7QXGTlybfb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282128; c=relaxed/simple;
	bh=37UIHw8fBM9bjnefmJ27qnFn47ajA6fqlcpa1hwNd+I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jxkFTK65XfZ6U3SVZuM2sEJhKD8eNo7T5eY6r57uTYT0wUh9udPqL5kWzRrR2QXIJ4CtKyq88KYF/UYvT+2+StLT9vyKfNOZM3ht2ra9f/nSx8ucb3m3cm7eRBphlf3gb1ta9YBWuyAccKH+4iRCuUti5W9QlhVZ1taYrQJim0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=TZy5myCm; arc=fail smtp.client-ip=52.101.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="TZy5myCm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ak1/5VU7fHdRl/F794+GvxF97uR2ZTR+e+Q2eGsPiv9QHLRyH9hAhBfCnhkRxZHGXGy3JF31fs2ieE9BX/uZBFwBvqIyJpGMUkOjq6bfQS5J5jQcJO/Gbnc5vN42MQFTQCjochPMaZNmexUMdVZYfJGI4KxN8QyPbbh7Lv3YApLCrKGAb6kCpbDlBwXyP5Ee/igAoT9alPKAy5fEwkxyPKUthebRh6ND69is3o/n2qMA150xMoR8OY9XeixHTtDHVWddtiV9nwHTONyqozGyeKbKwxZO2TqGe+HJckQiq13y4nTveLjNM07zImf8lhjLUUv8w5Hbu6IO2d0YPkyjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+HSkGCzjQd5XCfnao9800hzO0Cnt3JAEK22ELGn8xA=;
 b=cVhodL8XQwbKOLCv88r6fsnFHD8nXrRDKiWRSiOVO/M97KaVC38fRMbJs1TwE313BqtFNXp8jxCvrysNqn5twDDI9rixXxjJHRb9D+rYrIJxkrAtH1gXSIfmEvGJ5w2sC0X1bNS3f+Y8KUY7UTvNQBYm61G6bNA8HY+bne7OprzY8WPCc073GIvhe7xRcQB5oxw0Abz3yk6B0HbV7gWqkFR3qcM7GepuQKZY58w33pYSKU87oF2wspqmGg7LhnqCSVcUXzTtV9oxLm7av6+qIHY2LXy5/bbjcnQTLdf2bJ/BV2gEzJuThrYqdWsZfS9URpPII6zdbYyrU3zhsO6Bzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+HSkGCzjQd5XCfnao9800hzO0Cnt3JAEK22ELGn8xA=;
 b=TZy5myCmhLEzfhk2wEogNJpyZcw491JmT4jsXcICg/75egQ66DtnpthCdnWkgiBpg5CNj8/smC26Yb5ZUUXS8yTZY7oW6NY5ruL+EkkFBGVIqNZ3QXvEjGzLA/6H8RwYBmcYrN/wlvyj4gjS5lHn45AQrnoXpJGzYLafdlsklwsEScb0r/MIGqqbe+BoSI2fUAeI8NN8AENXi3pshte5S7B528F5fYE3Pg6MgsoVw2cWq4Zan3YDWalC5Op7Jd6C8WP+b8jAXeCdjkTCCkSsZy3EdR4li02r0yAuWDhBhVNaY30vE1ljjIHZUyHaqvyPQTOnJ4U2FaDVYg38J7I3tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA1PR03MB6593.namprd03.prod.outlook.com (2603:10b6:806:1c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 06:22:04 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 06:22:04 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: dts: socfpga: Enable SMMU and add DMA coherency for XGMAC
Date: Tue, 23 Jun 2026 23:22:01 -0700
Message-ID: <20260624062203.12221-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA1PR03MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: 2445646a-8ab2-4072-bdfa-08ded1b8e8f4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|55112099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	GTmTBUMliA6GqOIDinOcUyaotTmneFoDOZ/Y3DBzF6Z7rOixmV9kh04WXxbvASBUYUUfuetkAx1uCwoh5PA2zljN37ToT49SBv9M5Gvs9tCgFA6mF1Iz+GW6Fgrq+RM9EhkNACeqJLZHcbqVreSO1+eio3uNEpmXktseB+fMKbX7L6txacErQ+xawCl/HnUD9xZJUbxcIanH8/x8NRhLQEzUI1Jx4Y9/v/UnDznAuDGNk3kWsWhjHL4Wm1A6XdEz+O47ny6Zq6tm4TBHqXRo0HMKWr0USWGa9U+ACqeYZ5HT/VkoAWaxE55nWMku8gJrHu0U9jLEQ6vxg+i9+XE3JSwT9uNzuXqFZ49I5Tw8r4163eSgLLN8a2EIc6axc+YdZkqe4s2efagzI6t05AjCrRFIRCkyeELQjVwaGg1d0xPyYWMi+5MmFMrVlU24nJWVNI4HB5VrVk6bAor3hGejBpQw39RGlvMSwSwEUg3P6XQ3w0vAestjdy5ZTzEhMoLi3tzeEb8TGkiZtd31XZR4MhB4tlOqBwrD/W942n9tyJcfyoICcyDnbJBMoK9f1wVcAzQHEpuOie+8eCIE2rdBOd5dQJrQ1Io4nKa8FNZFVgJ0OvCgSJ5CZtGdPrfVhlzEAz7HFZTPwkaNYYT0kTFF9cSRCwOw+37Pa1lVwGvLftg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(55112099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dQB33tNTDsHaQE6iT9NshYygSLXwSUnN4IhExyM2Guu5Ku9x2BwCIZ6IXhp2?=
 =?us-ascii?Q?4mFa+9QtecvzQQvzy+ZxC/VQR3GXyWZ4qzKX/pgVKGKWg3z8GhNrjJIG78mj?=
 =?us-ascii?Q?ufdd7ZDitnKVyP0zmIXXODK2fSlMRrxX0vlOYA9s3Ctn1HRV4XNovO7UyoXt?=
 =?us-ascii?Q?1AeyDo9tVllNOrIjIYmPstUSZMtdFkq11I940HmKrp6fR1Y9A4c3zUjSXoWT?=
 =?us-ascii?Q?wVXimvBxCUDYjHPKitVdHmui8DpYYPEOBCH7rgNA1C3PXpkVi8DdUuIapjvK?=
 =?us-ascii?Q?BLWRYwoQ0kzk4urXeLsibGFaK6SRShVHgq4hoHqQECBOuayAxg1ULCSeNmJp?=
 =?us-ascii?Q?amjRYKWQmPSAAcf7rZv4UFyeFvLB/aLFEhoRZpuaqgqu1wei5SxkpnTiV/ow?=
 =?us-ascii?Q?Tv8ETb7BGzB04ECABsJQSpjwd2mDrh5CH1hJHm16W5Bk+KRjB5CBwGwaeHvm?=
 =?us-ascii?Q?L6iG0zwI3JbJgUCx+sQuqar/e6Y7/L6Hy39LqRT+nDtKssK5wkT0bpBpU8Ty?=
 =?us-ascii?Q?8WuFzbyJkujkplEf0Cj1uNPyNPYYBbOlHwXAlsCcHZS/vsTgeKjIwLmZT0BC?=
 =?us-ascii?Q?0IOcsNPkb/ihr2GEQ4FvNefKlKUjnl/XrMg85aiJxG2UsNPr0FTQh0bRSgag?=
 =?us-ascii?Q?kIfTTzhZLNrOGYlFgo0VmDR8j5H19buCntOmaFeT8kp9vh5Ieizmkfk4ey0h?=
 =?us-ascii?Q?Z8pAuFIh5gOxdp2LCY1y8xj58zP3qo47vniH9fNbB9bVcs+PlFfJUmC3VdZn?=
 =?us-ascii?Q?7eK9GUz5l+kK7KbByPZ6ftLBSRn4pc/DhEzDd+FIgFFaYuv+KsteIlYVWOMN?=
 =?us-ascii?Q?HtPRqAf8+CgpyXmrRI/nD3G6cdr6tuDwj013RHfDB+M/q/EXemBk6CPqESmN?=
 =?us-ascii?Q?XPbLWRr4IC2q5buqMm51MlldbpmSyzENmjlj4eI5Gl5iY4atqLY1C6ozad7C?=
 =?us-ascii?Q?mLFXOcVrFsp+Dlf1pseeNomjlpW6GkvIGSkA7ZlrzuSZSKpeKCbuDdW9KUyd?=
 =?us-ascii?Q?TX9CBXC4zidJ7HB0KzyuzjlkgZMdVaEcpeVrQ67NLUcJYUXBNfvkMkpEs43Y?=
 =?us-ascii?Q?FzNsUMiwjxtOlL823sO+0meUJMHJle7pkLvMwWGaCwqSjhvoFtt+R7nVTE1v?=
 =?us-ascii?Q?juC8YScr4qOxYqEh8E9Y451S3fOQwzOyd7kS1TTq5nt+Tl0kev5oiQ4htyBf?=
 =?us-ascii?Q?Z1SYHXWO1oXwWMelyFZwOhFIV6FZzVj1a5przlaMlIrkak0zyS9mU9bAF0U1?=
 =?us-ascii?Q?ZAe1FmHUbE9a4o4S6PQR+yyPQNetvnkUAeAdfx4sZvo/T8FQJ6iDnI8iZ4+l?=
 =?us-ascii?Q?AcW/HQo0svMtAR/05UQP1kSfg3vQHI7X6BfWWvfxFZRKyJ92od6ED6hhdJoV?=
 =?us-ascii?Q?tUlLu+6HleTn33PuVIOADnZUwj7j8354yGf2tJ4bTi9+IL+3oVrTQyDeC+As?=
 =?us-ascii?Q?JS4x0sInVwpjLN5S7CgYqh2YVGX/CjU9GZIRvm9dOpDktVaxUXLv8hxgoAPe?=
 =?us-ascii?Q?QXZZLgoDiW9Z9a6fXhNVylMD5XcMYH2lvFIuHgpimllnZCEBf0TLpCFjq6ao?=
 =?us-ascii?Q?TbXD4C9qwf9Ko5VO2QNkJ2WTMedLcpc3whJ2sKTW/hYup3QYZ63QJbNB1+k0?=
 =?us-ascii?Q?Yywd4YbP47PqVvUBDo4pls5vx1aXhBS3KeQ3yE3sUUs5ljfzLr9/RtAbglW1?=
 =?us-ascii?Q?h5HmoZqMxtNb9q8gll+hHtBUMUkgG331fXA0xpUQDKTWQ++LFfCHfbYZPv6j?=
 =?us-ascii?Q?pAikru9cvDyIi+dALbowWxM9HRQ5huxol0fQXVKsA2LeIYmHlS3bmvF6lY7z?=
X-MS-Exchange-AntiSpam-MessageData-1: g9Yzxbj3i3k0+g==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2445646a-8ab2-4072-bdfa-08ded1b8e8f4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 06:22:04.7160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAMjPbX4CQO32+zRNYk6Dtc+jS/q/grJHJe6ws87HyZde9oYkMawal0K00s+Fq3NwVwumVq8F5krs+ZfQeJjHGWwASYfaRqY4crj9wIj1T9iqSOmT2sw6xa0Pt035xdmna+ZS/AF8f9w6AVnH0rZrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6593

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

This series enables the SMMU and adds DMA coherency support for the
XGMAC nodes across the affected board device trees.

Patch 1 enables the SMMU for the SoCFPGA board device trees where it
was missing. The SoC uses a different memory-mapped base address for
its peripherals, which requires the SMMU to be active so that the
Secure Device Manager (SDM) can correctly access those regions through
address translation.

Patch 2 adds the dma-coherent property to the XGMAC nodes. The SMMU
is enabled and transactions going through it are cache coherent.
Adding dma-coherent prevents redundant cache flush/invalidate
operations and potential stale data issues.

Changes in v4:
- Remove status = "disabled" instead of setting status = "okay", as nodes
  without a status property are enabled by default

Changes in v3:
- Fix commit header to follow subsystem naming convention (patches 1 and 2)
- Remove commit body line that restated the subject
- Clarify which file had the SMMU disabled

Changes in v2:
- Move SMMU enable into the base DTSI file instead of individual DTS files
- Move dma-coherent property into the base DTSI file instead of individual DTS files
- Improve commit messages and cover letter descriptions with more context on why the changes are needed

Nazim Amirul (2):
  arm64: dts: socfpga: agilex5: Enable the SMMU
  arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes

 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.7

