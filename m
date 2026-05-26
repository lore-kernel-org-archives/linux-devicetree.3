Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012058.outbound.protection.outlook.com [40.107.200.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68323D25BB;
	Tue, 26 May 2026 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786361; cv=fail; b=fclTkd6DOobD0VQbuvgHHbz7vxXrTKktc6X9Aah7IiKHGzQOuvi7h8AwFnaiS2HLUomVWGUvVeOPhBxx4y2WQHMZqprfIXcwWnabgyOU2uAUa0Tlwn8xcjaJGczUYamO8BBVuIE9uoAuh7uhN5USZ4k5NrxlCA/c7tLqO/gUEbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786361; c=relaxed/simple;
	bh=wo2vrJf21fqvvAanCgfDJ4LP6jM95eLWzxobNi0VfUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FugwynKJ4oiSSez+XS+NIU1tkmDp7ZWiBplAsu3pejamcgJyCybVxNYYLSm39KmQakKJFtNF7wOdrYio3yWf+6RkwZ7ETWNSUdn64+7ZBe53EcZdd1Oz0we0nIqv221Kw2auI/mnr7n2L2mlRSCv3bHF/nYr7rIIWMoc2vsAEYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=D32CQZdw; arc=fail smtp.client-ip=40.107.200.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="D32CQZdw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9lu+ykJk/iI/KFul1Yz3ckRfGkCZvtcFGtIhJByVcOypXUFFBXPtz/b/OxEUITUYr7j2JhGCFLKdWtJHPwF6LeShITDIWNp/+D7RI9cwWU6GMt4EkK2M1SSMfClYMcYjXU1SqePcr57KI4OHOOqV3CckscLjvPf3FgK7GwUcMByPnuPoquGX+B+8mGISOHV3ELk6sJ80wH1722hyBcECgQ8aJpHuF3mbRMGdBI0ZPvFOXBX7gJhljAic/+px6/0ITKZL6fVQ5cRmTcxQMBwChJcvfORtCTDUT7W/0S6vvb/RtQBhfcINxrDBkiqcCm+9S3inJgG2zfUPkTGuN2r+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4N+lws9PfHDxcOYB9XcIFSUc/X5Kf/gtQL0G5HzaCg=;
 b=MIz694YraS/1GDZRiyJfIRaDmKCWopntkaYr8eS9/mBToRIB42BNEGQaG/sA+Sgap4z/RpG6L05p+QNB9cta94jErdvJ1iZqNSwLddn1wrlivldmxPzpQzpCwsyuomVoUtCH0zdbK9cu3SYcZ3z5+4giWKxnmdRFNCaLPlzF75gToPcoTOpCxzWQqLvNCEh5J6JmM45MHx8hEP4L5Qn40uzVVqthoLAUYm1nt+pekhfqgHxL6PKROm0fEVO2Fk52RjHd6zL+crDIPgXMtvpntJVYKSWQy9g3UqGEhv0ZB7H77lDADe1XOKAMwiBPv/scu9+KEU3ljf78MhSkZBt+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4N+lws9PfHDxcOYB9XcIFSUc/X5Kf/gtQL0G5HzaCg=;
 b=D32CQZdwFDp4BP1/am+l2g8B3lwSx4RLT8znB064aZX8xvwQGWAOviUVCJspGajZyInqgHhp8phDHHC3xxZUmK+qSwQ3x81EeH9w+efNurxPIgYitl4cqKc73kUp/Z1hhLGwszqcr6x8hed5cqhrQvUI8rix2LjrwIzuHXPCYqEDpwkxVHQpBKJHi06qM56PVF9l6b3LvR4ObyZgSv5wv4oaHNxOj8aF+OYiTNuXNtWyUFcrNNZtNTzuUQKQiJDjVMF6WAFrm5wZs0aVOs5Gs+A/J8yEeB5SesEEAUTS9LMA0i+qo4abTdDZ3av/RXTJLSRVo5IE/ULi1wzRr5vSzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH4PR03MB7602.namprd03.prod.outlook.com (2603:10b6:610:236::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Tue, 26 May 2026 09:05:58 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 09:05:58 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 1/2] arm64: dts: socfpga: agilex5: replace clocks reference with clock-frequency for dw-apb-timer
Date: Tue, 26 May 2026 17:00:51 +0800
Message-ID: <43d6d68a74340a5b513972e8b25c1369b31b130a.1779785788.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1779785788.git.adrian.ho.yin.ng@altera.com>
References: <cover.1779785788.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH4PR03MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 9702628e-149e-49ba-2080-08debb05ff27
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	vvjKKExCmssqdPn9c4bIfmLcjQ0t8hJeQPS+MJ1TD4KSQo5ZkWqMr6PVJ8FAM3us0p2PbI7QLVUVsfh/CU1Sv6rqGXhuCsdmS0T8OqpjfTWdIy9YPZG45ntFqqsK1HRkjJoIdAWWqPMkeBPyBz4eKMkobcKrBcms1U5H0ujJHrbspIfb5Lb8PD7faMQLamA8/+KEcRDamSxta+uudLZ9c/RceG9mp4rcsaTNT70KPKIv3MUvxxsGGkcVlTarJpkziRmGUNtC+hqmqDtft3SbfU2B7ZqnKp4SSTJvUqiCq6LCzvM0QsAwLEr8w6078aI1GpwaYomGjsgbNU9peHOqkEJzVZowmRrCvKXWE2CLpNwcKy+a37N71nNjJwNu4BjaUqkAjxmLvq88dH+E0v6IdEWch6ahY8qGsXGnox3KetHXkKektRD3sAc/c9wYSg2chLSubikm+RCU+nj3omRIVdPvo4uWeoLgaNXHK+HKwM6eCIf7MRjIn5lvo2e2EnhA7pLrntZCy9r3EHNrTwjNca2T37MJvhfiGJZMeqcavjwSqrTfbYYzAbYfBbDggx5gilKwX4PGN9zuJZMthv6wpdJDEUFOngH93Mvuk98quoOGGOH//D6A3sSOjFzgawRcbnTIsc9fhQiSeC7ogQX4ZPcmFl6j+hMgtAtJBSZPO/F7U0bcDkj+CN6l5NcWXtsN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NxMN5cLX/oBIKEFCV2SfxBCfTLtOglMvcsaSRyJtN7z6oEfksXCAHF0iKsZu?=
 =?us-ascii?Q?36yVKm1ueZyEy4iU6WyyDPDVYPUwWRReVUOP5D5iMlYeQ7rEN19fCb2drZxd?=
 =?us-ascii?Q?TjpEkghlto47jgqEeN6ev5G1uNQpbmoEiSQ2nx70iID0rRtsP5dRAMkNrYmU?=
 =?us-ascii?Q?X5LaqPE2CAr4wsvi3IIxmr/cEn2auo6o8fT5UIeVD+4AiTAY/d3V9Tqlb65d?=
 =?us-ascii?Q?ZzjYXr9yRakL+ha7Ll8vWqF1EEdL1Qhz12x9DwMHQrkxBEJxz9BSPqDMh0kx?=
 =?us-ascii?Q?n9aZ6NuPfM/Bqf/XFzbhbuz38uaqf/VOJ+yNCmBbUYfpWve78F+QgRlcGG/j?=
 =?us-ascii?Q?9xgS7EfmKihYgRUxryTjXPYQ4il7m9n255LQOoRCWRbCtwpvYvUM89MP2qlE?=
 =?us-ascii?Q?oIfQUdDRhPb1f2qkQVJvFIrWRX1sKLM+/+UoSr+sppz8reZH6ymEons39A8S?=
 =?us-ascii?Q?/F5eqvKUfZV+caye7nfxT8M7Fk7ViNv9g3sWNBpERR5rP2twjcmg7fmqg/VP?=
 =?us-ascii?Q?ue6kV721tPfdhncz9LrPwBhETLmxKoPKPAbiADVfYp20EZisYlofPNVjlq0f?=
 =?us-ascii?Q?vXanwfe9Ta4H9D/o60PiBgkHXO0pMQ8SrDfPW/rk53wXp0mOmMFenmA7wTpG?=
 =?us-ascii?Q?biV3/1C71BG24clVSBDZOeboxgudz0cGoc54uz4VTF6WZ4jGzmywvW0S1aAz?=
 =?us-ascii?Q?zY0FKonYPzIRuW2DsYMva49Rk/VK9AgTr0AoilijSfMXHb+1pgd0rr+qpMz/?=
 =?us-ascii?Q?/At1rqV195rjIF0qKI6XTFEj0eA3IKe9IcX0nPK3laaZ/v1WW+LFC81Sy3R4?=
 =?us-ascii?Q?mMzECxxFwxinV4A/8k6pDnyZQ5erfaw1b18Tp1r+ymdm756cUzYsQe7OnNDq?=
 =?us-ascii?Q?RNJ0LixoAZ9Uo7eVAWfW1rQXAM4XBZsGLcAhzrhkZBg4vI+nqhHxZFUdvIPY?=
 =?us-ascii?Q?2HWEC72YxaN35QPlW5rbM8HAoEMfzow2FuxUwhDdjUUMsmdfYmukcxksqnT3?=
 =?us-ascii?Q?mF8jgzypxf9Yr8W1Bv68b6hKsqDu+rUtX4icdHNmUr8Lm7lEe/VUURvEUVNK?=
 =?us-ascii?Q?ZSPrAsKKJMYkMhTU1p9AeCqjrfxIaOck+MO62x9eK7NdF6GpKaLJiRa1kdlX?=
 =?us-ascii?Q?HFCfAv8AmMIEAicq+wBgf6NRine6ARkLYHS8GOOKXdG8Bh0nvQNtD2IlGke9?=
 =?us-ascii?Q?4AMTpppSKwUwvuj2GCHdGQMDbHBkvmdRoJI48bBerLtnNvp3idNSsPRBih8p?=
 =?us-ascii?Q?vO5+sjwAauTaByQfpatBTf4IKHEKv1zIBe07GjdgSG0oPp7RUdTuwjxVPT6N?=
 =?us-ascii?Q?sJ6UaGV54GviYsw5xuDgYiO+yyeebBjU4Njevu9FTYNnLYhea9cgyFpx/HaW?=
 =?us-ascii?Q?QT1Ujv0rWxc+0dNYPcEsTY/St3Fs97KH/4a2ryG8AAwtPF7K2EfGltGHGSZN?=
 =?us-ascii?Q?IbswFYpaOiJQVzKVafOrAsFQt2WSGjpxYg7eZW7RN+dh4eyFc/p/Xr6JxL6f?=
 =?us-ascii?Q?AD1G1nc5X7X067Tgf4YHDKbV5Cx4U29NR3weDpIsouI/VGPPlNFuunkZVh73?=
 =?us-ascii?Q?v5FXQQrVeCD3fG7rEZHsjMORtEAsYhq5fdotk24uYBeHSWZqpYC1NB+puAWQ?=
 =?us-ascii?Q?MMq09z9W3rJb5mBuskiRjrCNkIzx/fMVJvAwUwAlC45C0PwDkUhYeSmUDShd?=
 =?us-ascii?Q?PPDRi6sa1Sb3NZTbFVgmsTWoTMUc8s0oSXlO3VODSq8vmMV0qdNBMbYkAmT+?=
 =?us-ascii?Q?eRIcix4lxNHNesE3t/5DUwnWtbdZSEk=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9702628e-149e-49ba-2080-08debb05ff27
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:05:57.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSYPP9unfynXrwO6C/wP0ZUYliVzA/zA9nVRrtbgDbXGdqyrL9bP+CUKPfIvginzowF9mJXSMoFKLVBs8qNQdKJC3qcFBs6+NGzK+ivMjKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7602

The Agilex5 clock manager is a platform driver initialised at
core_initcall, after time_init() where TIMER_OF_DECLARE callbacks run.
The timer cannot defer its probe, so clk_get() fails and the timer is
never brought up.

With clock-frequency, the tick rate is read directly from the DT node
without involving the clock framework, allowing the timer to initialise
regardless of when the clock manager is ready.

Replace clocks/clock-names with a static clock-frequency of 100 MHz,
which is the L4_SP clock rate configured by the bootloader.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60ee..24b4d129b1d5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -430,32 +430,28 @@ timer0: timer0@10c03000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0x10c03000 0x100>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
-			clock-names = "timer";
+			clock-frequency = <100000000>;
 		};
 
 		timer1: timer1@10c03100 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0x10c03100 0x100>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
-			clock-names = "timer";
+			clock-frequency = <100000000>;
 		};
 
 		timer2: timer2@10d00000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0x10d00000 0x100>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
-			clock-names = "timer";
+			clock-frequency = <100000000>;
 		};
 
 		timer3: timer3@10d00100 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0x10d00100 0x100>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
-			clock-names = "timer";
+			clock-frequency = <100000000>;
 		};
 
 		uart0: serial@10c02000 {
-- 
2.49.GIT

