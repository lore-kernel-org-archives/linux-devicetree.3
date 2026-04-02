Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6135282F0F;
	Thu,  2 Apr 2026 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135739; cv=fail; b=gQt2lJyRQ7NZO+bwOjtOWdbGpGdjWDbnn81OYtWlvGoCfQ+XDt4XyFZLnhqfE76rZFsS86NfS6yu6fWPByEB74CvytFT6Y3MsKSbKlCcxaVCHh0foAHO0XuK06eRqolSeKbNYZTDy510l62x99HkVePScLXHWtTm2qXfsZ9ydcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135739; c=relaxed/simple;
	bh=dm6gOxYGXu0yRuCzUr3tEv/Bzi5o1vVULdFA49+Eb6g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TIbtQEWxxmX86plhi4Z7mkMbCSmy/KOc54gl/rkpRTJGStDa/x8ZRsGen2G7C2hYxI7HE5NORltiHuaXvkx1iiLgpaqUdGeogA5KiJKKPnBdLGMZvqvtxKgD3VllsB1tOcBrALDBEq2urhNArD5oT+2UDOFONkVwDDV/PIC9gwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZ7GxBnLjhmhSFWmhTtWVhggsm/LSfJvuRJrBMqsN2MIHmIZmVb30IzpDWuOTOoKbtzQNPWIX2dAI+IIkEP0PQZhAqk34kPau9ZBqqV8CHHwKb+fJpy2lepM9MfzidUJKFfZs5o9ZgQP9Xj6Zgu0aqXlHUQ7YPCRk3j28Q7J+pbAJsTfyHW6s8jGiMdC9NOoGiUB7DtxG5IoGLg0SD27Y6y9J5Xiv5TUISTiSdXyFmQif6JGG9baOU8t27yyUAhST+zw83aky8EAiv0fMUEIJbYsQf61eGRuy5GGiKhN4Z4giTnbQHppTkNXNoVlHQI07m8dj9emh95Sa6jx+AE4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wB2f+gXuMSuDeqrIDhWIoPAASyeJZUgXlPiGbHYZhNU=;
 b=WU9QhlBLtiYASV1+HVLSGEIuaU/3UZGnt9KxSoY+ZI9okkZrjxbkmjS5Ahgri2f/U89SAIh8/DUiAAUj4oRGyzqWknK5kfXLo0TML3tshdfyiZaEPQ0xHw7V+iLQWgjCZC8X1jseK6mBvtpH2oipBPf6bsq0A6/3Y2G/7+wi5LZGKIc6eYJoCs7I5TgurOl0NPy0MjBD53+3+3RWrMykuSq9X/ITysw0g1mx8LZ1wSDl4bi8g9HyvDKXul8S9Q6m/QEpJgiiNpEMSjieoNGb8y+wL8+P2LETJoiTExP5ipceXcro9vsaCesexQ8o1PuMgsZBfnJJag51eFhoOBIz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1235.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:40:28 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.018; Thu, 2 Apr 2026 08:40:28 +0000
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
Subject: [PATCH v1 0/5] Initial device tree support for StarFive JHB100 SoC
Date: Thu,  2 Apr 2026 01:40:14 -0700
Message-Id: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::32) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1235:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fab3c0b-65cb-4cdf-ae87-08de90937dc3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	pdG38pNeSQYXxk1KeBH0Ou0SG9Zg0eGXFqjk6VFagyPm+PaWOzhc+HLbR9z2GFQ+mp5Crf50R5RFxuj7oULS7dZ28sMu+lRbFYiJ2R1RKQuXyu/MFHHly6H8vb8hXYFDTGKDHHIIpd3go9wz+WfG+W3HwDvlCdvIkYuTUg8B/HHk5Pu6/lIL1M3N1Rc3eeCMOwk4kgYpFumnKhd8zklVebHiDDHjAe9Td+Zle93SjnirylFXPGGV6Ewg/1DnvS9CaIKwaG/92i1w7v7W7MP20lW4iZGm+DSxpdDDTSJO47l1Hn7hg80+n/ier7H1nPMEbu5Ea37R6M1QpI2/ymHiUIZrqmNkpUH0/Ug63RzYn8tigXRDbaHmn3ROpYMnlxdlmZLZXl02Rlqjsz6B3AWY5G4pOyDDc68MdwE79Ui1ziMHSS9huEMEhChqaithmG80er5wKCY11Qg3gP5yDPNI1lXHtm3XEWZRm8jVSHsN+NminWrPvCCA/dQZTcHdaTdWozggLFnm59c80JgeDFfzx6K7Zy+Xv9MUyBtk+c/hLTrfAjuWZMrsoBRwSH/TucISlLEEfla3OK8uxv2TbY+UsZmcO3UPML5E32N4lqoO1/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ABsMQ6vEZnEsmZmUd/qxyy2CsAxR6Knlg+E93IBgI8e2XSlc4oEUHgPYH5hy?=
 =?us-ascii?Q?Ybv4f0UVLrNOVLch5DXStNGRp/4iXNtFvyp9LWCRbCwd82MgZTI/7xaImnFs?=
 =?us-ascii?Q?g4Yt0mtEbHVppikPE0miQFaVaaPH6YrfgiMMGq/jGYNh3ls1PTGLuKZ5D3ha?=
 =?us-ascii?Q?knuerxJDtFcI0CXpyWOYMFup0c1C13epUTXZdNBok19emz0wxzz8lJwdkb1o?=
 =?us-ascii?Q?rdFlm5mZmArUSdU0D88Hgire8eYpGyT2IcMarwDPOsncWjO4Eu4Zj8vUssQV?=
 =?us-ascii?Q?XFd/zuu3BGNDM0IyNsZHPjD5dfkFEKbnh/BNohmrxWH/l/dRAjLzpFp/8fSU?=
 =?us-ascii?Q?BbvjFOFpXPAZFKBAI3Y29XMMoKIg5WPiR48R70BkdZ1FqOsffAauIdkguNOo?=
 =?us-ascii?Q?oX7gIlMDsZlhqoAA10kptujb9j8xBkI1xSSB88QD7X/xpGXeqxEcGQm96oqF?=
 =?us-ascii?Q?JgJTnUgyi/Sf/LiIX08o/lAjzmvpU9DJUY699a3zQmYLphPkfWFcABZgm8on?=
 =?us-ascii?Q?wPy+1zG3EK5sirNP1xj9s1+rlU+zmQC1JOmQwVFEH8gn7hEfC8FJ0Kxvha8k?=
 =?us-ascii?Q?s0KV88BhhS9AFBbishaZi4/MIVOyyTEBtwNlEEeOZEPTgUtPJyLgNoJ4+zWI?=
 =?us-ascii?Q?YPdtH+QTpTDZX38vefj/I5QQF43idxylRJRy5E9+HwA9P7SJiYhvzBVkzJNP?=
 =?us-ascii?Q?iSruX/69Af8bPjgtuRmk+nDLv1LfRg7qth2L9Mtp2h6bXk64Aw8YPLpueXeD?=
 =?us-ascii?Q?Z14ZhmBATH/XSupMF8vcOdh19GBxPuZGKsiGvvUjgHH0l30vthBxJeUlfK2D?=
 =?us-ascii?Q?bOxpEi0ADiSqTTVPMslIlutCdEHxawUKLAjqu/nYG+jmzb8PquCNikwftQh6?=
 =?us-ascii?Q?hF88WPw/FOh4hsSXOvWKsQEerPUEZI84c0DtDTFPeO7LhEhxc9pmAEvehXHc?=
 =?us-ascii?Q?dhRZWiuuF2TJqEaYGkkR9vZOJ2GYH6cdBOUmQM39EmnN7aj2VSDnTyUo5WFg?=
 =?us-ascii?Q?Ts7UgILEuxesg5CyAhCTRANOKp7DPedJM0UV1jodhTZBv2vnK8CpgCuqQnex?=
 =?us-ascii?Q?Ncc3Fio5bN/3WtWjFOmfOhM0MhAB+kqbHPVMsrAc3P+Q4qk6yBcQh2big2UO?=
 =?us-ascii?Q?ewHu3FnDrS0yg/VCLQm8fxAxVviIYk0CBz3Nl+VOHuSnOE3i4/XMvfUwrs6w?=
 =?us-ascii?Q?YrEy1M9DDLpMap9OcwTTwjlMeMetSnsS8Z5zKVeaCQ+EV1t3AXGz9TFEp6sd?=
 =?us-ascii?Q?ffiy8KZn6P0vkXnqjsiwZe7phg1p0Ex/sdruIKAPSSCsqpkldjF2Ur3CL+BV?=
 =?us-ascii?Q?l8NScY2GgfIz3rCWxJ6LFxOIs1HVwqhob0GePIBAL6OZvwaHmRBS80o4egQ0?=
 =?us-ascii?Q?2176UYj11OyG9plf5eui9MWE7U4hdmCu7/1q2uSkTbR3UXweh30ottqe3vP5?=
 =?us-ascii?Q?SUlltYivasNQXGForh4oOHL7oQR3ENz1k9P7VsQpDC1W4HmyKp774JqkWwNq?=
 =?us-ascii?Q?o8xbOucVTzAnorBDRdwHsxd6FQNzw9u8EThPtu40qXjEdEaXSbGWABFx1PIR?=
 =?us-ascii?Q?5lKyxdJJQRJ82fC6FvgG/wLd9TYiIoKNZqFNmTUVyIUWVE0IwVRX8kcpdMww?=
 =?us-ascii?Q?GVpaFC/1VvsY9YQZkA1mE8RD01KKKPRB2B0BwTdDb7qSGrScvrhy+j58XHeS?=
 =?us-ascii?Q?qjqUIjqA23mW1sizgyT0foEcZBrD7EiULWl6jNz5Jbj2Vg0R/8zazne2SePC?=
 =?us-ascii?Q?mig535lp7gQxQnUGxL89jNTLNumdMda3C/W11e3nLlr7AL0MzJHd?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fab3c0b-65cb-4cdf-ae87-08de90937dc3
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:40:28.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0Qvomk6FljTXkqzgG4BJBSWVGGH3H2fHnASo3ztKe4zbHt5NgbMQB7JTuQ1Uf17rA0Le7fnmnPU2kAvUJtBV33iYVjuaRll3dy6vmMPGNC36h23YQlJQUfyALTUoKtO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1235

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

This patch series is based on tag 7.0-rc5 and has been tested on the
StarFive JHB100 EVB-1.

Ji Sheng Teoh (1):
  dt-bindings: riscv: Add StarFive Dubhe-70 compatibles

Ley Foon Tan (4):
  dt-bindings: timer: Add StarFive JHB100 clint
  dt-bindings: interrupt-controller: Add StarFive JHB100 plic
  dt-bindings: riscv: Add StarFive JHB100 SoC
  riscv: dts: starfive: jhb100: Add JHB100 base DT

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/starfive.yaml   |   5 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +
 .../boot/dts/starfive/jhb100-evb1-eth.dts     |   6 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |  32 ++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 326 ++++++++++++++++++
 9 files changed, 380 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi


base-commit: c369299895a591d96745d6492d4888259b004a9e
prerequisite-patch-id: 5735e71493da6858decc510a0e75967744b66b39
--
2.25.1
