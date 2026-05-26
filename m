Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175353D090A;
	Tue, 26 May 2026 09:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786358; cv=fail; b=dX6ERTnGMxrV335dBkRug1/faAHzZ6roWD9f8rQ6prMKGgEofcSiARFZ14YMAjiERO7mwreQRS2nAmnJgf1X+afwp7QhAavnEWtVu6A8jp7D4flMcNTq2K4DwqhuLdL7NQ9KHvsikalpUJcDeVWmProtvZu1aMhdVeK9WtYkGnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786358; c=relaxed/simple;
	bh=faQ+IsRUZ4PDsmeJH5bFrCXUnVIPmOgvQLT64qBu5/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=H1/zWHz+jN8wiHHFuOS6dreY4fmOlwUbxD7kGhxd2ZFsikgSGmZmlpT6CjxgC9SusmiKI1VA1VBGNUT82rScFogEcpqkgxFuXXMBjwd00RVElelaLoVGLEFNp0sccViDwHSM8NHJcm8/JNbO+gyEys6TuAf/UmC43atCDreH5bI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=XL7sz1UV; arc=fail smtp.client-ip=52.101.62.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="XL7sz1UV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnklchU15oaUfsnFJwOlcjQ4b+6ykqmL5I8jMR6kTL8tnkiTk0T+g77x2Nf2bbU+kSt8gscuLG1Qt2gm17EMjMyEjw9ItS27ecaxrSh4COTItLq6omF8JCcf3GzjulWxnXyBlQPBK+l2K212uaJ4sox6Zga0+eI5OyCGFjh5DX2oNx5JylGwFd1r6fjxCK6x+dj1TizYoudWc5Hv6rH4AC7Xh5XDxfvnNlC+mQ2jz7+rr6IwsoFN7G6sUw9FYx6SkVgw9w7JNmoZVHSmHwoDFHepd7D5O8GxpXDUoHM4JIQ85FRdjr5hsFWRNjGjpfzkx0VCt3avDITo47t7H14+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNMvD7Y1BpkP1i3lWJKmAvJj9c4hRlN0D5c713k+oeY=;
 b=Ee9A78pN0TMND6kc7zS7xPT2y84QR8GkkiIo2IQqIMBguPuejOZBwG82THely8WRsEcZL50vmKhDFAR/+RsJ3keL1gnfk5QsAhJPnFaAFMQozyhEATwiGbigazgjRodrSF652+LmCROTkfbnO3tpXcm7fR7TKlKmCGnm6/d9WqZS7XlCGHdDx4M5jihcYb8SWR6rE3Ndbl3PGlzCpQHKE2CeSihEeaTVeW+EJNvoO6awm9RkVc27JbADdB/pPtkAc6w0YYewF1AZ5/I/7WphF3R1LX0qhsRbg44Z02khIfxQakYIb1R0zNwLpiiH8Io7rCqctyZhFcQi0TGEOqkQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNMvD7Y1BpkP1i3lWJKmAvJj9c4hRlN0D5c713k+oeY=;
 b=XL7sz1UVn3SWb4WAOrlkH8zmz5ylrduBM0d/RAFLyzH5FJ/R/lFJ81ri4MeJ9wkGF0etLKWMked+v/C7G2s/NU3AJxnZvlFa+mqJzXiUIN0/eOxGYyMTXJII2e/oNFVZP6WQVxt+M53OXgKy7DtyXgsHYHzyM4sjsHA7FRqEanO/iE0SvDVmLIYr2bq24tjsi3mFfDGixXSbAU/rZwNcIIlj6/piMXMRtT4Rpe5YINeJncq4FNgzCjy/rxNjoyUgQpS0ufB2ux3Za+D7rSLuCTtZ/Fo6kxjjpKrMsY2kChTaysFeJbCdWG7rztzhlEyc2nX4/w+ppmAuQ3Wo++PPIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH4PR03MB7602.namprd03.prod.outlook.com (2603:10b6:610:236::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Tue, 26 May 2026 09:05:54 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 09:05:52 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 0/2] arm64: dts: intel: fix dw-apb-timer clock initialisation on Agilex and Agilex5
Date: Tue, 26 May 2026 17:00:50 +0800
Message-ID: <cover.1779785788.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
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
X-MS-Office365-Filtering-Correlation-Id: e9967957-9c1f-4cfa-927b-08debb05fbb0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	E7er0VekyzPrmbTQtBjnZVGs+R1XVyE6QGiOFnfqs9epqtzST41cZBtbeePllA+HM8yWQcXQuT88cEBqoiHXrsXOtbuVKIsqJHVEJ5TpyE2iyMwXi/yjzYFLsDADetqgPjjp6kdBpSvnGe9KwNMKuI5jPKVstAErtQiam70cfsh4esxYIqHCUqQzWh0C6NpeP52T8uaYU788lFzK834GhUv3ynTUx3Kkay14Ctrm8OPBjDztZH0lPcfAY0lnMZONxnPf23y63id3mZ9utD9N91cbXEVCI5SYV3aj5OG+7LzkvB9ddhSKA1llYu7h8tJ5hc43jaMuGPmQ4M1j6U0pQtwcY0v7YVpXfjSp1wLwiCkF6ZA9Fxk2WneYPmPqMhV0PMcTSriD3NIjFrEvjhqltECTxmA3Vko595PqMi3GXAyjVkP/lTOJVkWVsVM20/UsID9GeVkMkqZ324wl7n6CDv+EkzHIpxQ0oQDL8bktpMp/eSbwlWRhNkFAujv9KOyJDOqlDMnAgylIDbxDyUBszyDeQWVEwcvfQDUo4Ldol7BX5qgNkuKTNDEEJsFG5afyRjRRN0rql9lY+NcPjl2oIWVJq3QOB4yHomCpG2b1iaemsgHLMqa4+m1zWkiUhNT6xsAdjrtn0xx5rWDBqyapbrQdvaKvGjpZYe9wnUkC+7LkaHP0InNJg6ThzKA5FYqs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u8TodC4zLdyZiJabeMTCKTk+X0VJAavMiNXieXzrkB2WDRDLwo+3WOwEWb/d?=
 =?us-ascii?Q?Qz6mYT+HAmOPcqWhCUcoV9tlg6b2JEeG8k+yzpQ/dhCboVy874Q0PeLczsEp?=
 =?us-ascii?Q?yNbjCoTKMn4dhLJomhSmERdh/YkkR9jckdGSAV/muqwfBy2N9llf7HLHMWif?=
 =?us-ascii?Q?kv6v0N6iJlQtmZjX5h2F3OznxR2526C93OTPaCxhZLuEMz05L8s8/8nE+Xx+?=
 =?us-ascii?Q?6djSisvS9Wvx3laOYXKo18gfK/2LV6wpGWn7VLxJxMWxPTYiSK9g+tc/0q8O?=
 =?us-ascii?Q?kyRtbetXku50JWTlbfxn4/ZkOksHAW1Bi7C4YLGWM3KTllQzpT4GFdVYuEoF?=
 =?us-ascii?Q?bNJuAp72ormgKPYx483ggBoGQk4CuIlsGap/jon+AiQ2zsbR0bJsJxfMVCGZ?=
 =?us-ascii?Q?VZCXmsGL32SNIXJzkv4ymwe30ckZMmgd/Op61+p/Y4AqprYKEneHBF+R97le?=
 =?us-ascii?Q?DVb8kkOQVnmeDnpXr4eqEjvKF8ESDOumvTbIEaayv6hqZUKmWXz1BcXMP0H+?=
 =?us-ascii?Q?mnCA28q2O4VE0yNmgnwa9+/lbh3Yx0VDm6JNZ8tRcYkThqbC72govqRm6QDY?=
 =?us-ascii?Q?QYCuusCxiL0+Sw9p3oWxARoLYYN7pTkEwHOlzUznF7W57Ml3rvbrD0rc04VX?=
 =?us-ascii?Q?rujE8KEN6Jp4rwCy2yUH6kLWV0x4sxaxQDcvLyq1QjA7hQ0oiv1Hzo6NrCzJ?=
 =?us-ascii?Q?CVus44D7Nmht/V6yMNkjrg/1B0qLY5phDbbeRsein+gE6bJ86IsNrZ2achyc?=
 =?us-ascii?Q?ZVew3QTvzEs9eYIUje2Fm741I/6eLWM88ZIavqor/7VmDbcj8mrWNVsh0Eqz?=
 =?us-ascii?Q?oJU9giDXBVpP01NcNagTn2uBEAkXEn8ShhrMAI/60Q8unp6sSCczt6G52Qm7?=
 =?us-ascii?Q?qI4IBlEi/r1tyMP0YaU9CxgnfQZotZuXkSBekeqe8ehYYGudG1WOi8os+fRX?=
 =?us-ascii?Q?PveLUdfsk5h7wV6qdT6w2ya+HS+7GopBkEn47ns10BP+XEIkM4b034lUiMAW?=
 =?us-ascii?Q?SLK2QLZ3a/T/ZvPd3dlJAt26E3VMSHbs0nFrfYqiLD0OGwbSsX7sOb1FlhPS?=
 =?us-ascii?Q?txY+gTJuTcEAaU+k2gxKT4qvpu1ptIMlM21HLW/ojcJ3J356JKp4+3Frp0s+?=
 =?us-ascii?Q?yIy0tAq6rsDVYPtueyRYE8g7T7BepwGCE2OkhsObwXhPAKk0NtDapvVXkcFP?=
 =?us-ascii?Q?JkkMr2Sat8HIEXzsYoy+Zs2pRfBjbxj3Y+Ct/biSbn2S4Z6AyuMGxbnnGAnI?=
 =?us-ascii?Q?LkGGIPv/JDTMZXZZlxu3r0aNjvV61z1ob/lhnWL07iZzbdkuDS5KRZGz7cJt?=
 =?us-ascii?Q?zsvR9kdA849ahQi/x6MwbXh4OVUYRf6/kB/w3HwNPzQYbtImbJU3mzU7jSdo?=
 =?us-ascii?Q?DKj/eBvNU8M6PNB3Fu/ojCy7vFrNudnGS6BwsZFLWs6eI5TAI/sQ5nb7y+Ux?=
 =?us-ascii?Q?/P90O4w4nRjRdKUpfDQGRIlQCFvOsjnkqQMWLZs+9ViP93LesiM9I0Cxo7x4?=
 =?us-ascii?Q?0zSbNQZaCYFn+yEo9UvK1s7FsZqPs5sozq8mXts9FshtnxqlvD5UbPdztthr?=
 =?us-ascii?Q?XEVPqlBn0jz2Xos8QHbcCYul1YZf09f7ZZbXY0zBWBM4c6r4l/Fai6Bm97ZE?=
 =?us-ascii?Q?W1APoDWgFTXA8LkURldbFIemInt8k6jItBExc1RGTVq/XiscdfHsG6iafXmn?=
 =?us-ascii?Q?zf7VmDANcgOF462OThK8bjXiO07zSQFSnXA44Po0nEZAhEMsN72JnG3MM9qZ?=
 =?us-ascii?Q?09OyuHgacMd065AsaZ27rSUuggXOBFo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9967957-9c1f-4cfa-927b-08debb05fbb0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:05:52.3695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k58hT/XGdUP9YGPvkhooVQrVlqE/hhMW1oFhll89r3qHKqWSWxZFXvfaT5YcNRH54eLSl8lu0DvMoFet61R92icjaQqzj+p7Wek2pC4yEZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7602

The DesignWare APB timers on Intel Agilex and Agilex5 SoCs fail to
initialise because their clock managers are platform drivers registered
at core_initcall, which runs after time_init() where TIMER_OF_DECLARE
callbacks fire.  With clocks/clock-names in the DTS, the timer driver
calls clk_get() at a point when the clock provider is not yet
registered, causing the timers to never come up.

Replace the clocks/clock-names reference in both DTSIs with a static
clock-frequency of 100 MHz, which is the L4_SP clock rate configured
by the bootloader.  The dw-apb-timer binding explicitly supports this
as an alternative when the clock framework is unavailable at probe time.

Adrian Ng Ho Yin (2):
  arm64: dts: socfpga: agilex5: replace clocks reference with
    clock-frequency for dw-apb-timer
  arm64: dts: socfpga: agilex: replace clocks reference with
    clock-frequency for dw-apb-timer

 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi  | 12 ++++--------
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

-- 
2.49.GIT

