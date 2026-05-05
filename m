Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22253BF666;
	Tue,  5 May 2026 05:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777958371; cv=fail; b=jMVfl1QqjbAFO4vqdSsYHDz1BIEF5ngGSCOt32DqY+MTed50K5ihlEAJjmXKU2wLCgAjsla1iDxtrF9pc9fgOKe0W74fCeBbamTe2P2eiUH5mnYpGH/CmuZ4WkDZJ4zFah5bkRNgoR9xtm/385qd2KthDZY8r24tbqNlXmDnreY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777958371; c=relaxed/simple;
	bh=BkI/dZFutlMI9zdctyMzicjCiU1L7E8kI6F+gCGsGIM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AFYPS08eW3/KkcJg+fJyzwXSbxZvw3UzlSN1wEdRllPF+gYE4l8/cDxAMVmr//iuxOyBHwreY/8RSNsYlHzwbGBuxyZl+hjD1+eYQdGJNpf3nME/za+dVqMo0Cn/kxAxAT0zAaAqirxVKSzOjT2AE/lBnsWciPsChk2VQ0RDdK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VtNnxsfN; arc=fail smtp.client-ip=52.101.61.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VtNnxsfN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8IOAY74qqIH3adSZb9idkATY3til6sl3mTPIBJLJdExJCHGgYGiwetfFdIxEOi89F/cxIpGq56qF7HH4AaFbSQB4C9a+x+DkrXVQj1nUZIWdqhDLSnfDGiau/lZq0TuDEcf9P+xe76EX0e0G6sxb1TSyqoAlHYUGV42mhO69xmg9sFYlUoQBf6Ig+ohDFybJni1AHVxH2Y4lTvJv5PYmXEleo6TsV4qzwnLTlie3u+T22Be359UVA2nZrFVecIFG0Ui1NCIvAybWzdJJIBpjBZPP+hCHzsPQIkQJ0Y6ImKcNZ/0ohcX41LYQtwbE5ytGHL7nCGkJZSzJlapmiwx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIkF5/9rUW8xSh89t/nvyz6nHqRrXdMTMsiLYW245yM=;
 b=qRfKJtU/esP0FTLonVsTfAUG0GkQnZdblHMjfDO7h+TrdrtPzpas9TOBLMwPD7ULIebI6+C4g5wdQdEMDlvFEJNCcFxq2yRL1Qbmi8VBJ82Z4V0kj/fwEYsv8Nvt2Y0KfE7dnauzHZRfM/hrcRZx8jxbKijO/V2AIOMcfSzpOfDbAVwG+L8TtjE6hc1anVnNFvziuyr5BJbCBHppq+xb08cJuPci1uyQYMwFs//ywXc88JVM7G4bIH9c2s3HZiE7yDATttc4Lyb9a2BkgrbCHaHlwdKqQOJOgLM37P+FKlV7n3VnZZWZXE33KqQ4DZBlc8yzNnrdE7QhbL8URq+NaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIkF5/9rUW8xSh89t/nvyz6nHqRrXdMTMsiLYW245yM=;
 b=VtNnxsfN/LflY+U/9ud/ked+LvnogQ7/fLJ51IHms9hTdzF/7YoRKivrGgrZtmAIO9dnYv+n7P3ZfUsdZp6ZGEbDrtEcqwfZlCvXLtXOFrLdFbIiHR6FRv5bTJKSPq743j+2jTqcVRDOHOfPTPaBhuH0KoJ986pFCL4ySojbEVEkLC9JrOFx2H2YEs9cuCtW5kxpzofgFXvDSAl0oipIl6+/KZMwsZek+oUD3vA84jm+rTMbL6ByUgtRMTcZDs4xKMK7rMZT4RZ0CucVWbPIAfvqBCnhNQ7h8XItRC0OGHUiiwMZacKbzwdjri4+xa9wQGeyYcQxCUC9tyMXbesI4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 IA3PR03MB7620.namprd03.prod.outlook.com (2603:10b6:208:50d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:19:27 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:19:27 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 0/2] arm64: dts: intel: set alias for i3c controllers for agilex5 variants and derivatives
Date: Tue,  5 May 2026 13:15:15 +0800
Message-ID: <cover.1777957556.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|IA3PR03MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 89183ea0-dffa-43ab-f8c4-08deaa65e051
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	JbllVLbQb3oddb/UZGP28yHigqIpa9s/BE2Zu+ME/2v2udOVlbGXhK5gPtyDc8JHx2Bd2p0cT0mcLTvtybuTvXdmEwBsFw2D94n4F6ux6ItyGPSkmSe7MFI68pnKa2aH164sCAOakqC3qmSFQJScXjbZ3x6bHBGo+o+8i5x6DAz8OPaUAjIYAnIW1BLWN5eTRUcCqUctlSrsIsgM6otAuL6R1GWyDeFrn/0UPFjwFMRk/jx920LQX+/GeSrz+CaRT4QDtJdXfJWEOcSeiEU07D6sP3OrpUFt288a8Das1TRCR0CogMcDoPZ0JtvZQY/P8xIU/96tD1+kaDKjcq8UesQyaMhVB9TYMN5bFRCF2quD3CHAw4Dbm3sgUkr5yIkaPP5ikKQ6XREc3tQqfQAud8hbK/ZJLGLZaaX88URgx7Takwc0OTt0+euzTt1P4Bq+LcsWZTljgRCgGQ+Mec43jgGOlcn799aHCHwDD8q5IMbjTrTysx47tImBzSER0MdKZMuUSCwRLCF2cfNDv6j7smfS0V1fZfLF/ijsuI2j04sE3WZBgKCO7Zl5PZUDhg909hxFzO7Dgpi6Ar/UDlXAZpqlky8cz+bCEeo3gRFeudSBO3MgKKbWlCGYF91HHKBXxearEmBHwamrXA9x4XwdZ3FVZBfitsJCxs8K+64l2rkmM3LdigxCbaKnhw/uz2Lo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?emmaV0SZI+fhJGx+XABWe2fSotKopS5/d9GorF7SWDcQd9KbnHz8Rpg9T2CY?=
 =?us-ascii?Q?dEkvqDjDhUulxQYHbwXQ2/ZcDqlvLat2fWjtLt/N8WzA+ekp9M+a1SuSgtZz?=
 =?us-ascii?Q?YRVhwx/bxZgiQe5/6HNT2WupbhY28CA0SD0jfFauq/YuAFf3jAVTTTxNS/83?=
 =?us-ascii?Q?5BsX9SDRPX2gOmQHAj+NveM9rVHXSLfj8tfgsqEvFd2wym//j3oCurO5wI6K?=
 =?us-ascii?Q?R9642O7rgMxEX03dvBj8rH0OWpqgX8t6hnJIZ0zBP8WDx4v2wpYUP6zghaIG?=
 =?us-ascii?Q?lQRi3BjGg/9jbI0RmxfSJWn8z5C0cl6DXWXdwqf36RXmq2617/+P8ZpUZv2A?=
 =?us-ascii?Q?FSmkodP4zL3kzL35VUd7Ap1bgZ0Hs2NdUJ+Pyuii7zQUta9jF7jPdXa/wX+R?=
 =?us-ascii?Q?c51r4xyd8HfAjN3iPUH3glEZj9B9n0KZgcT++TEjiFyaKYDG8Sx6IuHiN3kN?=
 =?us-ascii?Q?nnLnGg6iuzFY/FRHmcTgyrjHKYq46QEWjys9lGFQexCoPKRRrM04RdvGKihL?=
 =?us-ascii?Q?BM/UU1VQ/MkIi/3dYO6eOPFHtNyPlVRVKqwG0uJUAX0mj/UmCXk9mjhanl+6?=
 =?us-ascii?Q?jkBMrfWoRR2lRdf7mTMnWBZFFFZoO5OZKIw2KJp8iy8hxWpAnMty5lvXABNq?=
 =?us-ascii?Q?DduYAXFOIg/RHp3+4K97X6lEgB2y44+GRnmyi99tY6xZtVopun06Cklbqx/u?=
 =?us-ascii?Q?ZMUN48nqrJM94KI1AdyHjGTq1dvcLgx+eLoOTGNMK7CUpZRnTxT+c3qBSsBF?=
 =?us-ascii?Q?+3P9hzpUZGEbwIaTTo8OXWEZ4N95rK9jMs/K11ge3/1yF+zCRwHI3FWZht66?=
 =?us-ascii?Q?+WdFOWSbH7gqgaUJqbveJWax88ZBdcTjwdKxksClzR5eI8A73davn3SNC0T1?=
 =?us-ascii?Q?RQsy+FriQK0754Pu80tTemgwQnwpqjUx3dMh40jg/NJE0VspwZ/C5YULKAaa?=
 =?us-ascii?Q?dhLl64gfrNHYvQMMqHlohxSLJhzhu95irzFGJgnxNVQlxQx5h9/ew8PJr+u6?=
 =?us-ascii?Q?QvQIohYhQN/7t72IpovgRGxvY7dAxneW6feb3n8JSfogd57V7C77BQyA59GC?=
 =?us-ascii?Q?KJjehY+4iT/JJNZhelgtPE6XgZgqFRcsQa07vHN1kc/xCENFu8Q3VrApS0iP?=
 =?us-ascii?Q?Dn5Jvdhv1TlujNyDfQgPv00DFe3LpSHp+vMSG2suwqmIxVUglMRltLPL/VsD?=
 =?us-ascii?Q?p1Eekvc1fhe2lDqlZCdn8cFRRwFwaQn0zyiKtVfx4H2LhARvBgXaDIiKaq0w?=
 =?us-ascii?Q?XFlSSnmSvMAwdsZo6SiJXq9BzYv+r0NU19yxrpxWL5Ahmfo2Q+gYMD8u9Wz7?=
 =?us-ascii?Q?mIvN/OkXUqIjxZp8fNOg6skml/y75XJfP0Qo6dL0TMjksf3yho0nyvcJe0zm?=
 =?us-ascii?Q?hZpeKdKX7CUm1yCmC/is7zPbLIouyxsjwq1DEvaqZcRclPYEWVoSaLmA0PoR?=
 =?us-ascii?Q?PzeoIbrl3ldjXPqS1l5zV8cGLAZKhdXNi2t2MVY1MdbtMT4sNuCA6oLEhrmY?=
 =?us-ascii?Q?JIAPU9hPrlpLKOq/gE4+VgR0ZZUNvjQqDjjcN4zI/xwRSdGGvwqxOuKpHYtU?=
 =?us-ascii?Q?zv+Kvlzz7RPkQc1IBU1msrINaYijktNbV/P9F7qaI/hzgM4y9Wbm53BT/G9w?=
 =?us-ascii?Q?KTd7pZq/lZ3YYoH9U9otDleS6KQdwVLVb4a9yaTLfDJ/IivmwwNN3rHsaYjU?=
 =?us-ascii?Q?sFXlgctiojKLnMI6whjoIFKdze0NjknI0NkbDc+SE3szFvAAr6qmsEAtp7WH?=
 =?us-ascii?Q?kFnBgfAFRgVGNQPVVxKhnm37gixnPWo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89183ea0-dffa-43ab-f8c4-08deaa65e051
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:19:26.9087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpCxDbVHr1uyrosq0iHOzsZDbCENxXz5YfwAvNPYxUSSi4i9V6DmSEgudik+qWrdYPEd2+LSRYB29sWSw+/L1pQfT9po22/CZ4Q6+mdozoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7620

Agilex5 SoCFPGA variants and derivatives have 2 i3c controllers, a main
master and a secondary master. Setting the alias for both i3c controllers
to prevent bus id contention when both controllers are enabled which
results in driver probe failures.

---
changelog
v1->v2
* Simplify commit titles

v2->v3
* Update commit titles for clarity
---

Adrian Ng Ho Yin (2):
  arm64: dts: socfpga: agilex5: set alias for i3c controllers
  arm64: dts: socfpga: agilex3: set alias for i3c controller

 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts    | 2 ++
 5 files changed, 10 insertions(+)

-- 
2.49.GIT

