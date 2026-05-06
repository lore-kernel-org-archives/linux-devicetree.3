Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2099.outbound.protection.partner.outlook.cn [139.219.146.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C8E3E8C47;
	Wed,  6 May 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059934; cv=fail; b=LYFo/zhSJ0V4mDjjyQtLIkPP/ycQLw3TXuYdISIvF4pZhUcxUMfkOAZhFn4bXatAem19HXZKGVxIPTPvYVQSTf3kE0O24XHxz0kR/57BtgsM43cETOuJJIOtXcNXKgzMtk/mC7QlXLRjSjtg0iOm1XdocLvrzQAzFDEeVR+uS4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059934; c=relaxed/simple;
	bh=ILezuxIIiTvvbCsiQnXDkhsMW9+XprWckTPvjATUa/M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gym05EgyruWbLyZqD5wA9nCLCOh0J5iSzeoCAUvcp5lJdcSUc1geJF7z64Pz5bxJRjvhIvx5goAGo9w3lV3hZoe5UXVQtLqlMa1rC+3GaZeVO5fQw+G5+EeVB7n2o7I7zQECUD2JcVjWo6qaFNeCRIM+ni+iToMrCG1TvwPFVpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRNxPNv9knFdcWbV9R0zKc9WcR2cXyEnQY5UweK93OIdaaTyAtCqJpaaVQGIzYAC0kL35psyL3ng+rWplAcUQrnWlFX8K6aU8AijFBvX5xOAqvztUfUqJGnT8BR0N4ssoeDlOg7k4CdNqt7s2U+Nj6oUifON62by4MoMSVGR8uH4QOgrr7ovPwE6jpcAgZ/655X9uV+0RRLj98N6n1kspEvq3YA2uUhsYa7QANftfbtXFShJClI79ekN2xbAtnSH2D6gy9z5eJrJOz6O1PJimMNaLriqGpNw5e7kqtXz9NipWuOFCtf+c+qW8hJ9HT1KIsEHKIvMg/Tl0B/6wXlnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLQq6q/dh/9R67KRPfTLdUmmW5mAHxXIVan0Z8eO5rs=;
 b=VpTKoLdiTyzJ+lfHrOHzRmSifOKSxop4RDUKLtg7gGhVEPAI0BngXh1eJ6C4i3HOnpFibLZvtq/GURmyPbCVnzjsxubOShaUpKtoyRjtZhALaHNqOSjQ5yvSG/RUVZfzjoKraPejq5gsktuuXrUJB7C/oVPcjBnaxyn/zYnuvQJ182CzGGBYuSuN93W4C222+3Xw4DJalnc6Px5Z3TFpHWzXQEplGLe/VSO+Y18tqpBACZHWwKCnJoQVZe09oGkRz+aglxnPAOQmK8/sdaRdFHDquCPRMGGMan/nsYWRQhZLf3titKUoBPDIPXlSGoQb+L95hP7mPLdR857fDzC5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1155.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:59:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 08:59:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Yixun Lan <dlan@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>,
	Michal Simek <michal.simek@amd.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>,
	Icenowy Zheng <uwu@icenowy.me>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Zhu <michael.zhu@starfivetech.com>
Subject: [PATCH v2 0/4] Initial device tree support for StarFive JHB100 SoC
Date: Wed,  6 May 2026 01:59:33 -0700
Message-Id: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1155:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc80b23-a292-4f22-5fe9-08deab4dd230
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3k9ZXyO/xHWUs9UEGtwA04MgG83qNcepDO+FIQ/m+lkAdPXKp9aH1tDPLGh3+5CTTaeW/TuZL0nlNYl79rytsoVcYdgR8C9ZxaEsfcLWWJl7NGPZQGXFGYZo9bJ+F+bSg7KpUH0uj4516oPyejPV9QNq8KtI6lB6iEL3Rvd6TLUhiZ6yJltuHnNBc/6IADZGbyQsQK2vhIq6QRwfmEFfaAJmo60Nt3v7TNHDr93F/rgVAlNfybsS9arrWCoATDJa6NlKxXzauK4HrYXNEgeMngLITNv/LaZ3Xf3cFvPVewcdMLOslzIfDN8HX03dwSxAQfgNOgRUFZGE0tMNcRSQZBm4nYs75t0dO/6v8K4R7FaTbwHkUPcXB+B3kgxMpiyhgj6n3bBiTJOLEPO65INb6zAWKrZoMigujzACXbhy9f0FnL5HT0syPJ6pXUxFcAJWyt5sIAX97kq91/4aCQ1lST0dsX39f7R0/54BEc/zpS3PhtuHtI/XRMXVuQpDND9qhcWMg3bN5NkOcyz5nBe+/XYuUlnkXZxiHaLFgYjjH6wOFh0LtSPJJwS2vhzJUsKUwl7RPTNylOSwc5u3hXAivA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a1owcfeE5A+qBxYeiH9xbllHlyZ1M2r888aMtcEG5k02ubrsaTmJMvpvEN4v?=
 =?us-ascii?Q?ugLyxtqeJZagcm+4c940BpBSYB1HWP8R1mZ3anmAb0ju9tXI4fBNC8QdZwB5?=
 =?us-ascii?Q?mJKnKTG3XS70FQSxgb3XBK6Px9+3UbWMMnA2VPNESwLCbXRmoNMY6EPLF1YX?=
 =?us-ascii?Q?aZ/0YEOrVCZv3uZeg1nec15/OwqKjceWE4jJGzxsDlkVfCVPLfpTG+2Dk/+h?=
 =?us-ascii?Q?kHSOP0uwkvGlFMvFFzp9n3tKJ9KiVnjGnPXx+KGhahqEXNLrVvZgaNcU27B4?=
 =?us-ascii?Q?v/r9jBiH6hBuXdhCQ9jk8zdp6MaqxUHXqIFS+L6gg9kZcVhE9ggq8e7OGA6r?=
 =?us-ascii?Q?DApU6Tp34O7AntkuI+6e22mdmczNmQDVjRfnMnlY8N981TIqCLp4Rn5tXLWg?=
 =?us-ascii?Q?v/8BEYuROnmlL887yXffTdsSQ7wdOwGdgeU9rYTm/bFhn5oXh13jYsKA5xxm?=
 =?us-ascii?Q?q4G/vDE1Iz//sAstc9f5eifJgn2E8Hskf5OuzYKV0iNaNQv/2xTQYk02bRUK?=
 =?us-ascii?Q?7uuCCLFp0f0Crp6xeMV68IK7MELqJ/DAUmObDXfwzjslJauUvWmJe7r9O5+a?=
 =?us-ascii?Q?XpqUTAEKrTpiUbkQTaEnlUCmB6TriefJa/2Q//IgeNs0ktrD2vsTezENI5tO?=
 =?us-ascii?Q?Je49PnNd5MP8mEerGttdPw6vtNxzrPMztOD3AoRdcFVeahZGYFRqP6/L9hFR?=
 =?us-ascii?Q?6teec9P+KrfJzaw69g8DrmZr+ySkB/VYSLVwbEvBjE3PKhAWkCmABIEXUTGD?=
 =?us-ascii?Q?dR4qBt3gKb8o79wCF3+vE2tq0+KMN6jNzZQNaZSlcVQuQOXXFEMhRQpDBPnL?=
 =?us-ascii?Q?JDm93CxQuOYiJXVZcaYiYfSxpXxWlpaZOXpFZ3gAKeb9ESC03iLKZgXy5mfJ?=
 =?us-ascii?Q?v2snHeyxCuLgYcfKqNmAJSbd27lJov+sb3bGeWk0rhzF9YpSFuENFo7AXB+3?=
 =?us-ascii?Q?G+hIuhbogW784ZDwuZLHWMm270QmOXkmqVT5d4B6eYjg484esLK2P0HkVQ6N?=
 =?us-ascii?Q?3aKXii2i8NijsbHiKEiOHAnxRJHvU1FFlOcelKwvKzohT+qYlHoj8Czd0B9R?=
 =?us-ascii?Q?EgnEkOo7ndE217H4HHsT2Cv6vr39HlQGahzZePsCKIVYKaOP43IMDMw6VJdB?=
 =?us-ascii?Q?3kcCHQZffuaBkgKxDdv88VS6flX6CWxoC4rClRQGn4JGQuCs78j41HqjqIRp?=
 =?us-ascii?Q?p42XoeBJJkMABnaaRi7k8weAX+5SmBN1oX8HiHtrwnxZY8Z51RVwOFl4P1jK?=
 =?us-ascii?Q?TzYjLzigxR9stnt56XqtDNHR4gsIL64kmVgiE8oU6pBJfs9o/pJvFv9SYDft?=
 =?us-ascii?Q?BW9Zb2JGJVIpWdeW25x8LzGrIRkTD7HLnJRws63JBaY3j4552XjLJHtLcJkN?=
 =?us-ascii?Q?yJkRFfR3GU7jvRG0OX71CTJs9zv+u6e9MpLKTdJ/PRysbbmnFXYyuwua8dvr?=
 =?us-ascii?Q?t8MyZ3TOviKSpHgrXtiuBX/F3FvMNAY/kSVFw7BxgZZ9g/vBqskVOWFExFba?=
 =?us-ascii?Q?iijspFH/PAcqbRdvHXRIMcAfZGiIliKr7VPIIXDwfNLwGu18kEKVHl8amvEu?=
 =?us-ascii?Q?MmUj7RApzvP8OVv8FYudb6JlvnolK1adz6KiPmAgEqgvR4lkm9xUPdeD+ZQr?=
 =?us-ascii?Q?qJvtlCQgrsg1Whra/oRzFd5hHwIXLEqXo9EokTkiRZuOOkbRmByZbMNIF/f4?=
 =?us-ascii?Q?frknT/QOCo/UpnKX0Rl9gEqq9vItRIgnSCuaBzZpZY5L5lwwmtOheD0z8lAp?=
 =?us-ascii?Q?YObEY4e4GqiZ22Ojh4WXdhMudoYawjqJr2vD0SCnamTcCiNfzlGn?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc80b23-a292-4f22-5fe9-08deab4dd230
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:59:46.2324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g89pfn4Mk7QEZHnoV3hYrWwBoLNDndgVQQF/2r1i2FLj177H4Y/q2PYPY9UN0JJA+C3bdISG+7ySOTI+EZrNXuzumMEzLVIVwKenktJKVjK6RHHF5kRDqyvU5GmIDYXj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1155

StarFive JHB100 SoC consists of 4 RISC-V low power Cores (Dubhe-70). It
also features various interfaces such as I2C, SPI, CAN, USB, MMC, Uart,
etc.

This patch series introduces initial SoC DTSI support for the StarFive
JHB100 SoC. The relevant dt-binding documentation has been updated
accordingly. Below is the list of IP blocks added in the initial SoC DTSI.

- StarFive Dubhe-70 CPU
- PMU
- PLIC
- CLINT
- UART
- INTC

changes since v1:
patch 2
- Remove from the current series, as it has already been applied.

patch 3:
- Add Conor's Acked-by tag.

patch 5:
- Change jhb100-evb1.dtsi to jhb100-evb1.dts.
- Change "Maintained" to "Supported".
- Add intc node to handle the interrupt of UART.
- Update fixed-clock node name.
- Move reg after compatible.

v1: https://lore.kernel.org/all/20260402084019.440708-1-changhuang.liang@starfivetech.com/

Ji Sheng Teoh (1):
  dt-bindings: riscv: Add StarFive Dubhe-70 compatibles

Ley Foon Tan (3):
  dt-bindings: interrupt-controller: Add StarFive JHB100 plic
  dt-bindings: riscv: Add StarFive JHB100 SoC
  riscv: dts: starfive: jhb100: Add JHB100 base DT

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/starfive.yaml   |   5 +
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |  32 ++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 337 ++++++++++++++++++
 7 files changed, 384 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi


base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
--
2.25.1
