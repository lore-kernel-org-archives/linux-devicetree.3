Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5252C21F1;
	Mon,  4 May 2026 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878691; cv=fail; b=QYgi2aCq4QlBnMmqk5uv0ipeiGEiYXWF938Nq2TfABVYjc9slq32lLNBEcbE1W4x+KCOMhxClFLWI8eOpib4w6jVifxmnaOXa/bR8pOhrpN136IdRp8kQ4CB950zNrpNDkF5B8lUpXEioOENg3o1qVMesxVMyLIdaBauAwqHL5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878691; c=relaxed/simple;
	bh=Z9mIbzC3PrvdKZfUsuU1STfvdcmRNORpCWqR3OxggMs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gfdk6hz55IeUDY1t5DYLIY/obY6RZfuIjAmyLM3VKQ0Fv5790O/Cj1cWz/t0V9etqUyILSIsu82tlKRwI/YHURaiD9Ema3C+4JNx/7lvnPEJD6XRw/JOTcGuzZHDmRtF4F7rAOEmBklSlQSLAm//3uw302/lGw6wjd1YsLP7sVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=EzEUO6aP; arc=fail smtp.client-ip=40.107.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="EzEUO6aP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7eQ8CWqTli7Mu+5fvao6O+fe5lEoXn0F3cRDyp7sKaAs+KAx9/l9uKBw45c603H38Kf/aZaGZVGHd2FB89oA0TOiDV+oyOsAEJWmdbZLNp7WXwc+kz3C+owvoYXJ5SS05Lt2VEVRzDDmn9NJ5aTYniU+s1nOUt83RdqpJ07LJ6cbtZxrcNXPf4f0c1RROYbZ2N/na5O33crBT72cER+CCNFWhAwrqOpiOeGk+QKt+kopf6d9ykTn+XDaEmsUm7FEzC8dIXfJCKn/OgLaZ5sww5A2InKX712L/GiaThESr4Gfhznr6W8K627svGUwtf0iXICpDHYD1gv6xEZ9sYBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqXC1ywNkkHeaQbOpbTdQ/VXL0esjiMcI6yWEjPOD/c=;
 b=fKQfxpI4vJDxjCxIVn+MlwZovgs1cOv/Rb67AO/IyYwr7rjgkiwNn+AfLO5IQkJdWoVU1lMNVehtLZSYm6qH++iYGk+2flC0AHUadhSCYIW1ZE0J5Hj2kX+iIJ7SMQt3yIkK9uhILdFnGodEBASEnp0flOvK39mfns16gflvuYtX9+nhpSz2D6JkL0O4Hs0utJ24IX6so8Pr8fGRIJotC1MEBlr9oFDRAAWVjnn7J4yWZ/8msw5iodWuhdyTaSVnYIE9XM6p58pkmE6+IKgEHQiUxX9Rzf2L9yCKXG4VfFnlzVGG9mYwT3SHGKByD7p3xipim+PLblWP0a6NIQKFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqXC1ywNkkHeaQbOpbTdQ/VXL0esjiMcI6yWEjPOD/c=;
 b=EzEUO6aPyHFveaYXh4VhzogZ+s5muZW0TITP1rP0VYOyR2HlvcKebrGj92SMnLSxNlekMjwvXOunObaNktSaNOWP9gDM9mr8XzEshhyFV30txRVeETW0kOi3P61dD753NJI+ybX9uupxxh7jn+2wLKqLSLvQP/6WPcj+8ikuugJ4qUdnzLfoy4Ys5bb8tKPMGW5oH+Rvg/lur+7VV0HM83tyO7vSm/GKm0E9cWXzaWNaTGsGsU3F4PtVL//Z3uqvVjMtjyvg4f1Q1PX4168w5WMwepc8ZnIomTV7VUyUKFe9ACiUcCNnGmbwNYYwVbB8P6HWz5HjaPwPmVKDHjcAgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SN7PR03MB7181.namprd03.prod.outlook.com (2603:10b6:806:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 07:11:27 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 07:11:27 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 0/2] arm64: dts: intel: set alias for i3c controllers for agilex5 variants and derivatives
Date: Mon,  4 May 2026 15:07:15 +0800
Message-ID: <cover.1777878392.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SN7PR03MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ad622a-11af-4100-2a77-08dea9ac5b69
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	Q2se7btaX00go+FGUg7WhRys7t6ObFZ6que/rkpINFMBElrEFsFMtUwtGh8nlZszEpR4+eXltKuZXtzJyVkm4sjw1qAumoutyjRYYknLbycKHvhTPJZknAi3e9h4OS8HcNZAbYf3RkrhGbugSW0UGi0ZIZcsr3dZuFBry9ww3defFxT9BjXd34X135MIv7pJ7oDE2qZM/LY8CbBO6smraENjVb9SEKl3xCQbjZhxPN4MyCI5hVOz04dHarMS1GiMa1cmIXoIBSVsYb4Rg+duBMUfkn+L5s3YIJiBBUwILl/NQbC0RnD4oiai1nknTJvCM+es6ulbsS5MHJ/JY/rB+fL2DNxBgroN3cY7czI3O7xXA3us/moJIK2m7zZLYY+/L3QFB/kXvjGeO/CjqeCSgahBbfWVsKLSJNgtA1cJ9ztGakK9ftP1coH1Bjtw3yVRuwd1yFidk1UHNeBmTUNtRpoairaWIulU6n5K/0U7GydzMBuSJqBWLYJHquNkrioLQkJC2i3zbwzzGUGZ+7vk/TnRfyWgFaD5XptRFkEe8YI3K8yVVvemTKIXnnz3WArRjZE7mkFcVoHtBJ1GWifSUQhozW73oZ3hkJ+icKt2VMPhp1ua0jb1VH7wTC2nE/U0xYyf7UIzrcb5seJk8YMUP61go8/SJsxy81JRH6lSdjW5BCMT6Th1KFBaKzIoE27w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mP/IqEOPXwOR1Ai3hplQPYO9RKR6LA13NqA+An54TVIFns/sqWzDhjRGjVlx?=
 =?us-ascii?Q?64TqnCTGJuA7oM0EEOJr8b2DdVNe8jDsrEM+/IaEyXhfYDj7QZJi1SkxPAUG?=
 =?us-ascii?Q?wqXodmq0wMGKql2GsKG8w0CA3/5W7olmOlIWnrVZ4iGsEUEtswUuwkRwqjcD?=
 =?us-ascii?Q?qAwu1j5y69HXVtwPJCQ5Pb9FFIsyw0TfjkoglM3YUYyYcrD1bQJ9wufBR9er?=
 =?us-ascii?Q?v2F0pQQeF18+D50wvKggBNXdT5SCY/S15SrFEN6AC9q9b/lpszn8OGT3zVuC?=
 =?us-ascii?Q?vxEAa1JNWNiH8OilagX2oS2diWWtajUBL2Mv+9awKKc/uNLQawBag4GTFmrr?=
 =?us-ascii?Q?Jh1viUePPY7OOMMttBTARhJrikTiUiapPa1Wtqak3WZVMps1F2u5OIaSftpO?=
 =?us-ascii?Q?B0CxnBl6IeD6S3v5Ir5vZFfSINlSZOTTD44y9w3gSwFnxAnTIGpa4o9dvQSP?=
 =?us-ascii?Q?WsER5Dch3+lUIhKuRBFAE93svh+2ZMh+NfKenPncqD8nDYtEJqMX8FVQ1wFA?=
 =?us-ascii?Q?juakAcDbYRHZgUENRARJG7dsUDnLkFjznlfAeBV9Foql5l5J119ijLgiUhaX?=
 =?us-ascii?Q?D6NROEKcSl21GoTyTVc7sGk7K9vFy1VxvYCQNq4yOCdEaZnomgUjOh9Ax+KW?=
 =?us-ascii?Q?yvh35Lb7biK1l9OZqJeELzP6XJKHRUZD3/83IoWhVQfR43yaQc5UxwJkZTa4?=
 =?us-ascii?Q?ANWGAgZNbPhAeBGSTzE3nOhMCUgoZ4TIkqVN9oZFQVDVN1wM5BVs/SuLkRsr?=
 =?us-ascii?Q?qlD+AL1ORlcAujKhWAlPi9YnTrxNqUvEBPmuzftm47HGCf9arOUG5yZYYrBn?=
 =?us-ascii?Q?kJQU4Fl+6h49MoK/B7hpgm7/THCXqQu5dkXmSpPFOKehJZTcwTe5hR9nX39t?=
 =?us-ascii?Q?rx3T8eCtwn/ppVAHk/7Ciz1qpvlZNNIrvPAGFj0rzl/P52tACaocSBR6fMP+?=
 =?us-ascii?Q?5NSc3HzN1AB5gZY3PikyiBfqyhZSl67vaT8oTWsHu0pWbg3w+D2Gje4OqPVV?=
 =?us-ascii?Q?6rllhm4aKEUDr07dd+EXcS2ztv7b0FtiiOzEmk/Jnegy+a0OO+JdKXOcBjBe?=
 =?us-ascii?Q?9TNXmk4PpWeFHmylTCot4zqqRvw9pPYNPPptCwQqFoUBMSiDi+OuVQ6bTWJy?=
 =?us-ascii?Q?Tc3zWmAt+nnlrMldIpa1Mayv36V4D7B8p4AImSq5t7jW7GcKOULtRRU324ht?=
 =?us-ascii?Q?83acd+T8c3QMojIU/j0ta3E+Z7AgJd1j5mk0gLuw2wdNzUkYDPLAwonznh4L?=
 =?us-ascii?Q?XuRmnnrsUBDXpeY6VLVGk2Q6NvEQ8f+wNK6n2QWzw7EvtGMkjsSzd4+Uz1c1?=
 =?us-ascii?Q?dcjZWJwp3uW8r7wjBPH2OWIgndOdMwRETx+LUD0nYTOYkap2c/Ku9KW4BQ60?=
 =?us-ascii?Q?Oo48nfPnuujgybHt+4vKVIEl1tktn3ZNivDT/4yXQ6FtPpyISH1IznhJdDA0?=
 =?us-ascii?Q?SKwUxp+rU9qfroKh0DLqt3BRhEigbT8e4Dl2LmcIxxMmnO5Thr3JWlKtJv3U?=
 =?us-ascii?Q?b6R4GAQZ6GLjt/c9sMg0h8KzcWUw916mxJdf+ZVJz27mJao7P32z5ahELpth?=
 =?us-ascii?Q?AddV7ZEThxdG/KfiqlIyw5SOePRwTEzuVKKQxbmsV3zJ3YTrMXfWlgB+G4Z6?=
 =?us-ascii?Q?FlN0Tdt9QeEZrjm1ZeFtzZ1xTmNknLRi/M726Hoy8XotSB9eye6hPtH3C0C/?=
 =?us-ascii?Q?i0IWhPPMuJQ9C4EwDead0jSusktTKQfzgPVawYrLLo1Vqp/27CWQspPYYCwj?=
 =?us-ascii?Q?uBGw+STNQqHSjvLjttk3CgGCoW46APw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ad622a-11af-4100-2a77-08dea9ac5b69
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 07:11:27.0469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ObLhlXA8HoDDAju35Mj935eJKhTgcLqyQhetoEyobWaVI1Ux+/gJNQoh8au9Q79zmGxY9J5Kq+Q5r064DQcwum98Zm5FMpDtXFTMsNNwlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7181

Agilex5 SoCFPGA variants and derivatives have 2 i3c controllers, a main
master and a secondary master. Setting the alias for both i3c controllers
to prevent bus id contention when both controllers are enabled which
results in driver probe failures.

Adrian Ng Ho Yin (2):
  arm64: dts: agilex5: set alias for i3c controllers for agilex5
    variants
  arm64: dts: agilex3: set alias for i3c controllers for agilex3

 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts    | 2 ++
 5 files changed, 10 insertions(+)

-- 
2.49.GIT

