Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE8EEBB;
	Fri, 27 Mar 2026 04:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774586498; cv=fail; b=dQg9xa0svzD+sGuRtDcPLcpxV7+eF1ote5Sm7EooJvdncU9B23wiP+yYy+VmmmJMrHtD1hDdjB87NIc9rNfpGy4FYPljbn/JxsPoJGeZNu1nPIUzjCh6bKNB7xSSlCJT+k0/xTYqbQ6d8jN/duuQsfa9OA06xVgodVFnAjYIsQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774586498; c=relaxed/simple;
	bh=kA/ml3InisdHhsbIAzs3mw/w41vjQ0Ne7WsR9SlhblE=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=TSe5emINy4X5YVOEJRYQnRpb5K5Z+e59RtOQwIQwP0GIDdD61tW/38H/cPbk5SMl3FRkNvz4gNKk3UkhUTIzpdy0cW145Lak6+AbBlVpPIGvA13kwsGggiZNhFaq6JxEdHuVxEW5M5P968VmEeSKBoeGzlcSf63NjNoVKd1e40U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xE4Q53//; arc=fail smtp.client-ip=52.101.52.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xE4Q53//"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFZyTVtU9yw9Zycs1hBuv8mF3jIKiuFkRChwyyIrimL7Z49Y0CC2RM7+crYrUp11o8c1AZBS72AFFBgUe55YpRZYyYt6ALLjLvagIg1uH3Z0ZpXqwasv4soo/xspDwjG3MFN7WWOywCSlwTWKSnPtAY9w7y8XmZx9ewRF7EJn84hLJ8FPuScrYqMV240Rymm+nBcHpFeKAV92ZsairuWEKWhQ7qbCY3UDmSvY7SeZEBsLaUwBHlreZChfyrQmhwRajRMCt5QsnS483sylseTHEAcVWyNyGR8RlpGe7GlqSM8nXcnQnLx8ZWWg7itWLbVbQgtTwXAw+XiRP/PPefWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1jGZditnARQ58t5V3szCJyzEbRxtMstnTcuTSs/Jyk=;
 b=L3X5ssfrxoSdHy3B4/VrK7W2HET9W105Z0a/mhSneV64oEPClP2NH8J3RvchcExDPydPPq1MMuHuKF752KJWJKx+E7H+y9YxqKMfVv+j/BG5XHKB0YKJzYf0T2PGV4/PBvMXgr9AOk7BmCHu+QqeN2d7d9cO8vv8kefmIwtg02A6i1ApIL3Kj+QOyy3uHZFfuvLvaP2/iUvcmWZTpil0IjdYQVVaDILKaCdsj1HzRlUHJGTJwDmzmBylWfzO+vMkH32RGAqhPB4HWNVvdaCp9T0qlMlEFJS9jax6yt718898SfeSfaZwOEJx/PYy3IHsVlgEuhWwQ9jRNfTSZO0trQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1jGZditnARQ58t5V3szCJyzEbRxtMstnTcuTSs/Jyk=;
 b=xE4Q53//DmLvPuhfxqGMNK0HfNuTUFNLHvsItTtOLJVhC+5wCU0hJRGS/StzQ8HEgmbVkYY79nQR8xwgWafR0Yk6RbCNp/IVf3zgJ+iN9ksgoNjVwK9BQQjWqSIcIBSQIUfOMPdK/rOFqsVe6DLfC2OgtKSHryNCQmdk8CHzFXw=
Received: from CH0PR08CA0015.namprd08.prod.outlook.com (2603:10b6:610:33::20)
 by LV8PR10MB7944.namprd10.prod.outlook.com (2603:10b6:408:208::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Fri, 27 Mar
 2026 04:41:34 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::1e) by CH0PR08CA0015.outlook.office365.com
 (2603:10b6:610:33::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Fri,
 27 Mar 2026 04:41:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 04:41:33 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:41:33 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:41:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:41:32 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4fSk52869376;
	Thu, 26 Mar 2026 23:41:29 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Thomas Richard (TI)" <thomas.richard@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>, Udit Kumar
	<u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, Prasanth Mantena
	<p-mantena@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260313-j721s2-s2r-pinctrl-v1-1-a6f80c641037@bootlin.com>
References: <20260313-j721s2-s2r-pinctrl-v1-1-a6f80c641037@bootlin.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf
 compatible
Message-ID: <177458648664.423823.3002227693403091634.b4-ty@b4>
Date: Fri, 27 Mar 2026 10:11:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=kA/ml3InisdHhsbIAzs3mw/w41vjQ0Ne7WsR9SlhblE=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxjXBU3p+yQenil05+5p8dk2gf3QOHwsIw5507MKxXM1
 l0aqPC1o5SFQYyDQVZMkSWAbdcsqxSLxxEViVth5rAygQxh4OIUgInkHmVk+MrXG/lyBcuEF7t/
 zXux58gqi+Zzaz4cLE8vi49W1HAy6GBkuFkTd799p/bqXPvZCpozb8kks7JeuxGw55BOwsywN5a
 qDAA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|LV8PR10MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: bba42492-62ad-4e75-08dc-08de8bbb1f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IlpjNTKhZg06B3NgXj0kOYexCltyGTfzSf7H2LfJGZtCcQlyzLELBtsqoW5uzdvgXFR0fC+GfUDkRyvbo41Z6Yb+OxFajWCuQ+IHpTEDHeOkpe7M5WQZDlQ5NG5ysO+4JEjYc2CLMmvNFhk8TD9QsVSZ33BnX2OM1tbTyYgnXWyQZbHk9hXOtnG8qy6T+YgrtjWUv50Fmy8PUmNztw8kC+b8NNt7+GIFETFQKDWa1A+gn8bfam+oOZ8mCiUfvQE1DWDCbsWjTxA2Ioh7CKIEt6KR1w58l+BSbGuHzvp46IKlmcKQJLY9phJiNRyJVCLwXBSx+xYLlnq72Nwwn6mNfOgzxv3BvKTY5nQTL7GlHGUFJcEceokgFQDki02pVvntB7020bLXzhEiEACFFkPYxb7RNBHSAEUUvzq4BlBmHRXyg1M50Cnd0ZpofwIksTZBs0DqM/h3mKxeJoeKg2ygrwlycRkTch/riZajDfNcl43474OOVDTKYwAtCmu0vNuRk0HvacTgxCZrUg3fcPOom5IjHj97FKAlT8w0Opz0iErjWDLBlZIEU8bhd8A2zmwESl3gUueVJxCEAE/YcyFgfnQPwUoZoOaCRhFQAM4vBTYE5Fl+CZUAI3yLtoRpkSadZ4pEH/FkOo68FTK3GAcqzpG5ATEEe7O1oCY5LXolohTiIKQxLjxLvExHfZWq2CwlwkDsnqDE6tBkjH0OlJjlAV3qL1aDmbLX+E/bmJSDeNLs0f1fiHziIlu+IWOUKXvX48cAOAEqfs8HUcNUh2OgCA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UwInGAeCpgjmuapCMwkWprLpj3S7l23FOLO4JXhivZrtBujg7gGaslnBmJGYQYh1sch2eSiKpd0ZdLu7nU0AUC9OUk57hIk+HekpjpC95tBNBZiZps7fE9UfyPYp2yreqyeQ+3OKFm0Udn97Qyv9ZVgQ85dWbV4lkdP3j21TueX3ojF0NsJnvmRZBsGFhRHBYFRVh224sglcOiS56Zgt0uutfsc9ZElGqmH2KbUbW08juE/bDREtwxWUK5zUeOM7syTC/xeZPJXkEG9fS+OSUmFrz7dUfNTrM+pCp9JpZsNIdNq7k4mFQ9T0avgiLrJARZd6gccN1JWNq/Q8dhRTKm0vljdMp7QEZnr13P/v77md6AFj6zb2LzbnMBnsPsGH6vLeGXIzBHJ0sKx9uHMXbyROuCc0ap898QA+EP/MqHEmOy5t4yPbg8A2cUab1e6Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:41:33.7655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bba42492-62ad-4e75-08dc-08de8bbb1f9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7944

Hi Thomas Richard (TI),

On Fri, 13 Mar 2026 19:18:54 +0100, Thomas Richard (TI) wrote:
> arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf compatible

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf compatible
      commit: 5c86ef2055900ebe5e5a195a7d67b14ff665b60e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


