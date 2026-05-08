Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EBE26E165;
	Fri,  8 May 2026 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238122; cv=fail; b=hKegYMWKe4hGhZhlSfbn11uV1EdeTjKxDqAR2ntqNUy+gnM0mSwoaRJy4VnMrr2CUhdOXmWS35NC2hqFDz1aZReI8ok5+mGafGaWXAdshtq0oKRDiGTmunn1w4wEI1Mf9eV3yRu17SLDFF1YWIY9+/Lfi6HLir7K+9fvYJZ1X7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238122; c=relaxed/simple;
	bh=bEABEdZO1M9YSXeNfFnYloMVPH7Pn9A73bkYGPtqb9s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CauzXOIgBrFzLU/Qs/FWfDD/HqraCE4b9QxvQ0HRPtaiSIZA79fCh3RHrLIw0t6QaTyIEYfSAV8kD7tSM9G7VINoeSqBNmo2ih3KTh36uZk0z7/Lpgipi/3ohDNMUYFWK9GxJiXYh+p1MQsu12kanXXO9lhZeBwcRPwMR92efLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=QuzGT0uv; arc=fail smtp.client-ip=52.101.62.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="QuzGT0uv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7xpxlv20mOSZhKkbwd8EnDDlUjnhuk0dUga/5cDfU89uaF04OT8V2EJFgFbceutteq3ukC5CC1TYUGT87iiVJ+BPaouglnhfyUGv0VrkBwjyb6NNav+pPrIreRCrK68rILYx5yGQs1wAaE8bK3Bw770V5UXJvzMyuSKS3cavlF4YtNl6lXmZyIqHyqw2WUUo2/WbdXeYarMhvUp+qASRmyTIgzqbBSbXcQv9FqmzJ6ZRiJIGRqVvXslgzTeefS/kdXKDDTl+oGNAoGzEpB+JNblD8vAwa4jjupEz0AzmCpdqgd8qHJ7bcdEr03SU7cFfQnzRylts2EHrPQdDqY+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIoquUaXs3+bJJLfX81Oz9Y2ytr9ZXdoui/nanvkNk8=;
 b=YRbcX3rs6tQdkmb3VAiVMaDsxMCoWmngRxiYLlU2ha2z+dHz+Kj02Bv4df8hMx+bcrTMQjmnHQnhCLL0ygoGbtRr9Uyr4BVHNsuKddrl+WQ+Jg0UWuytZNyQwTLLWwKlgr6UQNbtklTi3BxMJJudeXthPn5xyvd6HlVQQtFrWFnsSJVw+LW6cwN8lxSXda+W76IloY755oWqY7tO/g9+7QFMiwxIY0BuWJf9ha5t8oMGGpBEOeo2U0LSh0wRnkii0sXh/eITR2JCxF3VUrX9p+pj5qk0+2wq8XxihdaTglW9t108uO3ms7a8yRVruCzGi2Pa0VUUiPz7jCaQDHftDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIoquUaXs3+bJJLfX81Oz9Y2ytr9ZXdoui/nanvkNk8=;
 b=QuzGT0uvZVrikHWM+rvSXBbBPeAkEFZ4CDX4qQ5aE1r+oJ5ybobecctDzk1Pq5Oxz4tmPJYQdn2CtAP/fO9/IIZvSS0gEZaAiRrEnv7cx77F9fGzQUoMyRogZNUyJ5MPgznvX4a7JnJD9GZwiaATL1KuNYpH97jFMPvw+aqxfXrv77aIAveHeENESxS/i/ST1DaNuGpegQWb+BlNrR1qi14I/xxVuOfhVLAr+i9Vv+RLEYuT6YJFdIEc+/ZYdkxra+kF+wHmidiCCSeiUGrdyDzqjwlSzDh/HJ5q/kF+TBClpxrvRICMwRo0Ybz2n68nJJ3SJGpJ9Z+8VgTo6rjtqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5713.namprd03.prod.outlook.com (2603:10b6:303:6f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.20; Fri, 8 May 2026 11:01:58 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Fri, 8 May 2026
 11:01:57 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 0/2] arm64: dts: agilex5: add support for debug daughter card
Date: Fri,  8 May 2026 18:57:46 +0800
Message-ID: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 3062148c-2024-4c1d-17fe-08deacf13873
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|3023799003|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	cr3MBvVmGAz4nxOJ0fUkQz8XW7Kv5iI8F7CTLztTYNqhXgwNKw0iA2xaGjAbxLY1pgqh0wG4JlAeR8a67Q6+v19zF+r7BluknBJBlhBkGnuE8/VHR+fipwMDlNLNQgQzqy//s1ShJeHzoAdjt64xuSyOr1rjbsFBclpkp8z/2B60Odb9frCBdyUWhx/CGSMZnQBwpeM316OdQDdh6Q0+0T5dIVJC4iwhjhpaJJe2sbrGK7GhVoA+eWSVpM/9kZ6YxgmE3hsASoUV0lTR2NSMUH6RH3ux1s/cdag+6mzgBUqEnqL8rooXKcxAHY4WfSzRJ++pYNylOqp62IJJd3K9fokJZOURDA+e5vsGyEUue3egDB0j1MO6rZ0s/+czNr4Ywun5+WpoDTksa9meqcmA7KeQV2WlQEfItAC6ALrSxg1JFd98TcQiG0RqX9wvNw8QeDMgtqLFGQ91AKm07DT2wovop+xIOo2vBj5Aj95Iuo1syq4iEt6phFpVCJGlxFmcyKqz26RGlSYlhf7Zw8tdkOhTBhZi9KK7mXIx4jgOgr4TyuMxdfZoOR25mlb1X40pKWuJOZJ4z6mTc/KEkVD+ovTSLv/IU+JgCOE/a46zlUU4JqarILY9NRQbiOFjS8RJwY1o23+dQxSnlvct7m3ZimylQ0HPz2Cq2x/iUsqg+y2+va/OEyklPo/4LytTPVBw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jmLqrQasUhN5VZqyIgKUFroSSb+yINiFHwHA2bV0g5eN2Y6zRe0m80y/4u2c?=
 =?us-ascii?Q?PceEB0FxQHHfaj8WVwYvFFCblMv1gaT2J8SUamzEaM9kxRQaNzYD26RdOfAx?=
 =?us-ascii?Q?WwC2Me9jxJ4mHDiqutTIJbGbUwmStmedddxjmKPRveDX+ZLbNAPQeXaOolyB?=
 =?us-ascii?Q?Nvta7tIrm3Kzo6KyL8iZ4mONifz3+NMBvYZuoTykhxI7Cf+vI/r2QB9NYOus?=
 =?us-ascii?Q?4EMmCEILkJArxi++sE6ONmxF8ZJJutwn+gxg6A6yrAABR7Pdo6Fk9XmzKC3y?=
 =?us-ascii?Q?hRwcLmGtqCmmZfSq9TMrjuuJX18u29aSesA3ZYYai1UtG+IAdU0UlWK7FQoz?=
 =?us-ascii?Q?p2qAP01/P1Z66e/SmxSPPwfzA1CtEhEn1CKwE2pgZftlTnFWnR4IThMW4qt5?=
 =?us-ascii?Q?wCz0ZDQeuSYf9AbLYRMIRZ37ioC7VaTNKignc33Z7DKh58N+OPv2Gb0AGf4J?=
 =?us-ascii?Q?zIH3ne/Bk0RMe2j/CkdkyLj3NrAqy9LFhiIitfzUelwQ5TmVt46sh9NKCqib?=
 =?us-ascii?Q?oUH4cO/83F52GeMMEPjDCy4U3fNAM954kxK8JDkBLxnCbPiGM+iNvCEr9aCf?=
 =?us-ascii?Q?KRSMdzonoCRS7tC1DxDj88ZlPWQWFuhfz4AxbNvFHQHc7XzgeGqbEir9Mwm6?=
 =?us-ascii?Q?ngr+b8Qjcq7rGcqw88iRd2XBEEyOFPKR75ACVAB2/oCgTal/C3w5qLunyt5v?=
 =?us-ascii?Q?D15BpfFfokQF2wGdzw7eAuznJs247Jq11cUdPDvIbB9jdBpv9x5xojdDBAZS?=
 =?us-ascii?Q?jH5Gvman2xESdiqb0QgOndtKezthuu/haTTeVnHkX9ZMByzdJkMSHO2Z7KoQ?=
 =?us-ascii?Q?FP/XOJugEm54I/e3O9eKOjK/OLJ0eAWAudRueqvFpf8Oo0AR5fsw5Ik8he3G?=
 =?us-ascii?Q?p6IAD7ubYYr5/t95zxEMaldw2WNfma+oNS81ziQ/8y9Z9Ab/TNqiPr+ibv8/?=
 =?us-ascii?Q?p47so67IlH6UFNX1y4QeA/kkx6StoZjOVPPMv/nZjQruoRfC2iPZGyAO5SzH?=
 =?us-ascii?Q?LBhlQfSTlHZv6k86Zi/9XtK1YCmGfmUGZYL3n/EHpmAglaCSLQRjp0fl1QcW?=
 =?us-ascii?Q?KzIC8E3/gPK/hD6N57IjSzz3Yijk1berelmqSeAmay+Ft6iGfWUzbQhWSjnm?=
 =?us-ascii?Q?Vnrxod+mWpyg1kxGRBRQWsKBGRrSFfxP/S3FeglvXdpdiUD4RX7GDicbXURw?=
 =?us-ascii?Q?jWaYogE8/a/qA7oSCo9KdZU5gj3g2vWPOgbNeUDpoBN76ZtLe4sPY/ihit18?=
 =?us-ascii?Q?5TrjA0tQlzNydKJ2TH0YYCqQBZ8vCIc5KQbfyCnB2ytOZ9LlFTMGi27f7y8n?=
 =?us-ascii?Q?NzxFNa/Qp+8sx3QGptQdl7i0vkx6E8fOV3yPl4/0rITbjjffFiRBaYYmZ4ET?=
 =?us-ascii?Q?8kUaKrpRNses04mwFZX8dCCTo7aH09fTOKG4U3V5X+TmrdJN7t/EqPP2H91S?=
 =?us-ascii?Q?Tly1IQQ1bfOZIi6S/PuNl4LPGnnVQ4qC8tUu08jQB/1WsZeTAn2bxVEFhe0D?=
 =?us-ascii?Q?TwGlbzfNEv2cfFnwLNiNU2RS0/iNF8OLy30F2a9o+25Z1jQhZFasU/oZ7vCn?=
 =?us-ascii?Q?swRkvjAYo/5UoWgTxQEQIM6YxpUgW1Mu7FLSMvFWdOv5iH0dI2HWtkOzkQpY?=
 =?us-ascii?Q?L3AHHjrCQxJP3Lo0sFOxWzllEru4gi8gMwWpXNyrp0ExwsYXPuM2ZARYSjK/?=
 =?us-ascii?Q?JxxPNk3VMLBbJ68DDyJUIFT0j/WPICct561GPzHP7iPBYSqfwaxOKpF9G4hS?=
 =?us-ascii?Q?/wwdt6UjxJnzxBMoqUG/bVmjXj+PHyQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3062148c-2024-4c1d-17fe-08deacf13873
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 11:01:57.1196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dg+dCvWQwMDqaxc3NMKpY8xG8RrRCsAjV1pFaKKh0EYOC7F+F7HGaTsO5jxRMn0YFxBEiT2x2feADKxNXa100cM1GrIE+YI36kqWIokX2zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5713

The Agilex5 SoCDK supports an optional debug daughter card that requires
a dedicated device tree variant due to differences in peripheral
connectivity compared to the standard SoCDK configuration.

When the debug daughter card is fitted:
  - gpio0 and gmac2 are disabled
  - gmac0 is enabled with RGMII PHY connectivity
  - spi0 is enabled with a <device> peripheral at chip select 0
  - The HPS LED is rewired from gpio0/porta to gpio1/portb

The new DTS inherits from socfpga_agilex5_socdk.dts and overrides only
the nodes that differ, keeping the delta minimal.

Adrian Ng Ho Yin (2):
  dt-bindings: altera: add compatible for agilex5 socdk debug daughter
    card
  arm64: dts: agilex5: add support for debug daughter card

 .../devicetree/bindings/arm/altera.yaml       |  1 +
 arch/arm64/boot/dts/intel/Makefile            |  1 +
 .../dts/intel/socfpga_agilex5_socdk_debug.dts | 50 +++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts

-- 
2.49.GIT

