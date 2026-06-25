Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6B73C1405;
	Thu, 25 Jun 2026 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370420; cv=fail; b=F0bttuKdc3VBv9ClK1lbOiRINJ7jl+TxQUXLJud6Sh/yrxWVLpgGwFk6EFzxHDz7RsE+2N8iCEnHSttMWDIfi6H1h2AEE19+Z3Ho6hKCzvvr3hmChPn513hILAPF8u4wB1FADeUvGgITE9rODuE066eMAtvK2PGsU91tVttHqhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370420; c=relaxed/simple;
	bh=wt1UGOz9ZwoV8keoVRaP+7U0Nj2Kje1StwQa6YVlib4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FyfD4yI3X573M4sdi9Tg4feColKjaCRSlaaAoI67KLXxWrzowgcy3M97DWsSJxzuAADxtFRkHSJHCYYSj+NQEJ+M2ey6QQ3mpKA6N/qikrQnP0SwMrtP3gldN1GqRddpK2Dq0ev/phY0d9cgKZarYxnO4XjQeWPGpODMw6aq/Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=EcBe+acq; arc=fail smtp.client-ip=52.101.61.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="EcBe+acq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKVXgPQu9oTmxrXDdxoLzxigp7juuI+67ucZiK9woCGyxlsmmXTBV5NozGKtXZW6Gr4WZhoYcMb4Z+XMdusIGcrp6eSp7JKCDtSR/+6jiYByw9cE1f7lnkGyGfPotfto6KIWLpUhKcC9KQ1a53GvGIt7Up/oK6HtVNDuoidE2e1aC084RVJqo+tZS4oDqo4UWcIrundbKTjyRo/+7CGkWj+1sxmJ8uHkWDo5kSWu6MIsKi3zgGtEP9oXQ2EtvVR/FdIIG3db3PJAOa2I6W6x3lp74fPM2/VLMRfF5AgaohLhLTVfZ0ZiFzrxCy5xbZnEu1KfWgOGTQqu32WDN51sGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yicWIxOPM4qZxYVEO7LhqaD6AZKXkyT45R0kkePYyBs=;
 b=E7C7+XJ/CyOHrfqxnbzFshc90l/L0HHaN2LPwxKf4Ra+YDXVvYY4BmwdWIHkCD1FHloeqMg+2/juBmR7keQ3Eb/k/2WJ0FzNnJyiBMHkkREQqgCnc4vdlCE9sS/dinKYBdHXAI0dQxIBqPLODMi0ljOIoFK35aaI/v02apuN/GPghZfaVs1tWWLNn45DX1SmHN+kQzLrG5+LIoWkmHmCQQQKpJB222/eZ/ysJC7VSilGF0QB2gt/ZB4kTuVzGGMkCqgySZmaBwXcHhqveZE78SH3EXNXmeMvWkVUnqakmvXCjpNL5F3l/ih6ZN2NnZGL8lCsYoe/MI5W4JM28+IbFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yicWIxOPM4qZxYVEO7LhqaD6AZKXkyT45R0kkePYyBs=;
 b=EcBe+acqcLMcayDWu50cpW9d6aKTMvuY1vjLntQs49N5kx7n/JZB39bBImVUYpNaF1Re92RvJDQjQNKD6WHugF1bsfbcdOCs6zVs+S/Bsg0d+ViZj/dxx59576B5VjFKCnApaGzCNj1m+pD/eeqIgsdcEstCuBqlvVDMCDQ6ApQOqjiQVK7sCYUSZL+u52CIuyCsvMT+a0sxV0rKSJH3n+aduucZfb22ZGBjtt7cojzBllEeOPvqrCbTnGGDcLU44THlEkt4Veu3R2Yt6klyzBgkaS+DcWFct2z+fnG5RlnhYNJ6/2hYMLieoT5qnZoZNl9PcgqiaHbs0O0VEfAPJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SN7PR03MB7229.namprd03.prod.outlook.com (2603:10b6:806:2e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 06:53:32 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 06:53:31 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: socfpga: agilex72: Add initial device tree
Date: Wed, 24 Jun 2026 23:53:27 -0700
Message-ID: <20260625065329.20274-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SN7PR03MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: e81d9f9c-8ea9-4fb4-9e26-08ded286780a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|55112099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZmOj/gbNs0bE+r47pi/YmWFRhsIo0pFqsOxa0b6Ig4Xu6x4PP5FahqSo63cu1TMLY66fnEfphS9MKOaBTyJzyL5CXqfpTF+y5zoLVoYmyzC5TRj1MjkWdNzPpACi+PDM3hSICTtPYn52iQSqkcikOU34f8Np2vZ5MjgTIRf8gFDPTSMe/n0nhZQhhSIR7wfM020Pdjx0peC7kMB1GEXv+Q7F78GKxd43ri2r5OEmUIiziNrqa4fD+Q1gNEowBRbYpqSvXBGGQYhEKXU6aptW8ya1I+oYmD0kt9x1HiWlQJZc3MEbQLi4n6LtEm73Z/cIbqvtoD2mNkSomFitLHXU90VhD/Jp+m+yH9cCrlGruhkwrAJwSJWfJnaCP9FeR5Dw5PDHZNOwMkSgcwWUTVGgYuBn45eRqLAqB69JEHSR1xTNiTZKN39EjG0B5GJz5wKuSwELNR8OKvWX990z5hiAxgLydicXgxdD62GEu4epkMtSQL/V0r0vaJUwhnoCsB/B13/ziXhkyId0LWM4PYpQdKIxo4WvqA97vzfyoP1i1w/ghCkqa9C3/8dndO4O1HESANEsmNjQsM6a9CVwAgJRG58qotqwra65KchTk09y2IxDw2K1MnT4X6hJgwNxucVlaNkhujmVyZG7J3btVUkFhTUYne6P3fe3Y4QxeORXD44=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(55112099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?an5CbVF8wDi+zUV0uiy1Eu+Ky62RHYjXO44RZ4BboYjD+ytqbJm7f8f3U6EI?=
 =?us-ascii?Q?XKYHFjFA009KKsBw/5hWqaHElQNRz0NRjLNzC6lzXoE+naXXh1n8QB6BRe3G?=
 =?us-ascii?Q?aR3h/ZwIyPPW9bVhYy1IjR74NIq9RZjkKcfdsbZ+CWxgwdRQ6juW4M3lwEDx?=
 =?us-ascii?Q?lZOOTmxP0VHhmuzjLk6Fd/Htk8DjSDuWQB1znBwrlwjSUAM27ZhKEe39sT9l?=
 =?us-ascii?Q?W0/K2S4Xs6F4xQwd6aBVakJ0xiSz4lJIW7m/xRalKhUW4791OM8s+Bby6LTQ?=
 =?us-ascii?Q?/vMzAzLXPdHCEHUUfKbbzaE7Yrd4eete9aOTuo6RSvNqUFPJsKi1Q4Bwz7L5?=
 =?us-ascii?Q?YMZXm0KRBDAS78DYZ4HC03S4eAPZcXBS+uMvM47INu15COOcgGtpzGKzaY4x?=
 =?us-ascii?Q?bm0xEOy8evYRGcwu8ipS4gExrJVwo5YZRWczf7uDQstEU9PefQfbSrCWD7tE?=
 =?us-ascii?Q?JWZhVzYFsh+csPeQfE/bTrgaX+cg+0HLtukR38x91dTMnTfrsE5tX/JEBrwd?=
 =?us-ascii?Q?A21sS8QDeHx8DtTGQYu097G7RnP3EzxX1zGisFo1E1bTOxcA+ITXz85Ic73H?=
 =?us-ascii?Q?SY0NGscCMFSHjks7XORXtKyViA9fQk6s6osaRxM3S8xIXKhoaUxvea0wN418?=
 =?us-ascii?Q?GGdrYFMU9ZRPsBrcjSSZuHYaLqpuxqv/d80hwlKVsjOoWb2liuZ4FEnylE1E?=
 =?us-ascii?Q?aM4RfDbxjjpN2xKUdZE57xiQ2mDejaOvnmR4iV2Woim32HEMsCoUuO5QKQSg?=
 =?us-ascii?Q?mVUpGhylmNTvUB95XmjjeXsm4ZgjsEmAgQoDbDNcltfWJ9tMNR+OrtzELwy3?=
 =?us-ascii?Q?FgntzfR2kYQ3G79/7VtBLGsgPc7R+wGY9ACVozVgnJ2rBiP6B5HY6vOBsggb?=
 =?us-ascii?Q?1F+P9Yi4DFzvButkwpOZI46FGnLD5ku2dFdr7w9DV8FEtn+tPgvU8yg639/t?=
 =?us-ascii?Q?1PwcaFZ77sidqwtOn8tUYY7gLEDJnV0KD9kJQGEo+VNTQbrYvUq9b1MZKPRV?=
 =?us-ascii?Q?AqkYOJgqCHtZacKuzOr3JswDwE70SdLxbPh3oT+00Qm1a7k0mf339qyR3p0k?=
 =?us-ascii?Q?K39U9quZBVD6BDKhAp4pnlPJTmyAqRT0gH4GISVkDbFcj9WlfFl+A2/28jz7?=
 =?us-ascii?Q?INt7fV5uzvHljzELQzBq4wNh5O8VsXBZf3ARisRDp5Daf9RWHRvX7CPFTyBg?=
 =?us-ascii?Q?YEz1CEbN6mnYFrItR+c1ippZyAqA4BqijSXb0XlwZLVUWSDzAumxkIeqRFc/?=
 =?us-ascii?Q?3pnk3sW2t0XwRnaoKXr2eujqGHAb3yH0jYc5VTVmn8e/yHXvE80tDlTV3Md/?=
 =?us-ascii?Q?LfUGsoW7+5JiILJqP58cq1KOdVMQDjDKVJdsyvLrWERTXiBdaIgHEWLSQHuT?=
 =?us-ascii?Q?T8r0Y3rM0+V5qiInjcZrmEW2J6cQbUSNAZxCAbytDW42Bn7S/wpM0PMr3Jap?=
 =?us-ascii?Q?0iUxUXWX5xT1zScQTX/GGZvYDb22ni+J5AOOE9XdmNV7d/JF2iYQulEVC15D?=
 =?us-ascii?Q?v377+8KBkJNb++fAAN7otPGVSW1gMaqCDmQn1K3msGMqeye1P/kmxv/dThpi?=
 =?us-ascii?Q?/T6nCZXYOxIwQS24CtcNtoE8g23NAiLqzfL1ZRnzWxiI3jbNY1nJg8ZKiSuz?=
 =?us-ascii?Q?qU7fUJrYsFcQ21U5/PgQ931arBZmEBq7ELMpnh9mvAh4HCpu7F0ELpMw3NZY?=
 =?us-ascii?Q?2ERjin73DGs+uJ24V8snwRfAJd/M6Vk7+qmz9a7UKjqSCRtcpq/4wCA6Mqrw?=
 =?us-ascii?Q?AVv+T7qZHXslCF4U20SxQD4p83P/ZcZj2xK7D/1i1rQipafawhVFud4Cw7/E?=
X-MS-Exchange-AntiSpam-MessageData-1: 59fNtBOFTuYC7Q==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81d9f9c-8ea9-4fb4-9e26-08ded286780a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:53:31.7150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LctV7xayIpluTFSj1me59Hxv8i1YUL0/Fv5d+cGpz5khMzSPXx93bVJRUVLeS5OqmbzdiSQBSAYaRpRfk0DZlUNAOZeLNFTTQ3NE34A/m5/SYtmwZ7GX7vRlcOWBUTFvV1RXISyZbs/D6ZKuPZgzBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7229

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

This series introduces basic device tree support for the Intel/Altera
Agilex72 SoCFPGA platform, which is a new SoC featuring a heterogeneous
CPU cluster (Cortex-A520 and Cortex-A720 cores).

Patch 1 adds the new compatible strings for Agilex72 to the arm/altera
DT bindings documentation.

Patch 2 introduces the initial DTSI and board-level DTS for the Agilex72
SoCDK. The DTSI covers the core SoC nodes: CPUs, GIC-v3 interrupt
controller with ITS, ARM architectural timer, PSCI, SMMU-v3, OCRAM, and
two UART serial controllers backed by a fixed-clock placeholder. The clock
manager driver for this platform is not yet upstream, so a fixed-clock
at 125 MHz is used as an interim solution for the UART clock, matching
the hardware-confirmed LSP_SP_CLK frequency.

Changes in v3:
- Add UART serial console (uart0, uart1) with fixed-clock placeholder at 125 MHz
- Add aliases and chosen nodes in board DTS for serial console

Changes in v2:
- Applied relevant feedback from Shahsiko's review
- Re-add arm,armv8-timer node which is mandatory for kernel boot
- Rename platform from agilex7-gen2 to agilex72

Nazim Amirul (2):
  dt-bindings: arm: altera: Add Agilex72 SoCFPGA compatible strings
  arm64: dts: socfpga: agilex72: Add initial device tree

 .../devicetree/bindings/arm/altera.yaml       |   6 +
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../boot/dts/intel/socfpga_agilex72.dtsi      | 156 ++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex72_socdk.dts |  27 +++
 4 files changed, 190 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts

-- 
2.43.7

