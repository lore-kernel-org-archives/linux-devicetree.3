Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538866;
	b=vpb6AHLuin5jy4FaeOLf1IeRgzmxpf7RCuyS0DJ4KtXZKyK4CszhT/WZBB9RdyKj+o8c
	 Rs9HsCq02fQkZS58X6LEY/cY2O7haiA6klqiyzUZcmjc2OXSZlCtXomMmsV+QJ8gv15xz
	 uXLDE8MLp2Peu8deDbh0RR3GVM6QRdYzGmkhSQnHt1cOwecDfMolrq8xaHnVQJVrNy8r9
	 3jyXsVDSpvOllkNXn2THRtEF05J0wP4V99Rc8MTtaNFlrqqKfODebVTZGrmsjpzGvNln2
	 DgeFkZbXfrqeII84hpabQwiV7YNl0JAU8nUHdpmUBSr1ZXCNYggedxDU4bxYwro+5ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538866;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=y+yn6fQIzVNwQR8JFuIlJlUSSNys1A+g4VrUArgxRlE=;
	b=1+8M7kivUdDHThWc3HZ76LprqFpCZmSEt7yU1KYswrSDQWuKGsFi/vH+8nw5i+eVBmur
	 VtK1jkU8fcBHvlTinhLCr9RlSDvD97zaXTHoRcv2xqMpT+5IQoxmh8QDHsGHm5Ffg4Fhm
	 lgdhsBKARrC/TbYdDFI6s/W7sLLMb+I90CGaMXRnF8atbAeRn0g+iAU/KqAz5/38S8LHD
	 XobEWe4mUKLjCiYB7TunQ8Z9Q0aNbE1cFYjddmkjoChhdiOL/ucvEevUutlBY9ecrSvNg
	 /10p1PxwHUfLJqcstukRs/kn5rlIdXYaeA7BGJmQqesNjVi1PwW9PKgvIWBS37xeeNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=EHwrqg+3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.23
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE893606A321;
	Tue, 24 Nov 2026 16:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE893606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=EHwrqg+3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbPpB2GV1tlSRGDoWouWTQ7HCd4TRjHkGdhXMKNntmw7E93ouzKPt6HXfMzqAWQMUr7eDZ0bh/dkow6heMsZ2VWJNRG+ki3ENBCIHCg22ErdVHZHFJpwMsig0NTiP1Kq/wRuWEpUJ96/AwbGWWYp+lLpx9Fb97PpCI9F3tTQs6MRAED/fwdm6G8m0pERHKOnLC2YpP7CNLG+nXI8luMIUl51jgataZDJJvxmvoJ/BqlnkTYyLSDSsxduz3T5xHszuVFG/zFPtfTB8ESkGFZZvreUCn43YPYvWxqx59KfxEC6sw1A3wFId+fRxIrT+ko2SKmjE24TNkzCDDxQtGKlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+yn6fQIzVNwQR8JFuIlJlUSSNys1A+g4VrUArgxRlE=;
 b=jm3dxsxcqetjADEsjtpxhrZnbJhuzlD1Hh70siVtYMxbx53N6hJtTZi6IET5RyWDnEJZXiLtSdifVx3B/t2+80/B0Ppm5/wf5mvoKYhW8IsDAdAx2m3LugEnZG6P0aZ3Gz0nqNrOMFJhUl2ZMA4bLBTM1/k90wW/iBFbBXRjocjgGEbGvZN69gnjQxfPuMZ37t4uLU5b+wUqOSDShn+Exy5C8koBx3I60YbuN+qgWai7yfwFpW2gvtEiQ65gduOmJSRVnjmdLXsuxHkIAY5dAxP2enlRqPT7Atjv/Bhg+2dB4LgK6iMR8URY7KRbgdWohavvEkgcwj6XJUMcF8s6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+yn6fQIzVNwQR8JFuIlJlUSSNys1A+g4VrUArgxRlE=;
 b=EHwrqg+3Ew5Xkxut4dIBTK6zUDoIF+ZCKsr8RSLEV86h4sXOp+wTMI5YXTD7qpRHM3v1z+PCbRIc4W9gJTnVo7kuNslFm1PzFMspjwEHN1+zXzD/rAuPvUlhxYUSm2cmvH44PHjdNyjCmWxNMmHQkdf6BOaXyZmMfDE1NzwpiQjd6f6WqpiQtO8wp6GHtYZi/yM6aHVainHQpgasu7sDZXFDUDfMsw4T+RGA9Z4+2VDFD6yAQ+EYOlEVUTJXKXP0aTR55xYSdKIHkmN121cbobnWsHyV4AizRcMUkzO330XOULzne656ufzQOCZWGqraLCKICDwqY5GI7SdwctSU7g==
Received: from VI6PEPF00000215.AUTP296.PROD.OUTLOOK.COM (2603:10a6:808:1::8cd)
 by CPHPR10MB759348.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:380:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:47:40 +0000
Received: from ZR1PEPF0000E6BA.eurprd07.prod.outlook.com (2603:10a6:918::149)
 by VI6PEPF00000215.outlook.office365.com (2603:10a6:808:1::8cd) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.662.6 via Frontend Transport; Tue, 24 Nov 2026 16:47:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6BA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:47:39 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:38 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v6 00/10] Add STM32 TAMP nvram driver support
Date: Tue, 24 Nov 2026 17:47:33 +0100
Message-ID: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKa/BWsC/33NQU7DMBAF0KtUXpNqxhnbMSvugRBK7DE1qEllp
 wFU5e44BUFRCZuRvvTn/ZPInCJncbs5icRTzHHoS9A3G+F2bf/EVfQlCwlSgwVbHQ95TNzuH/s
 plZv4dUgv7KvQUEtdbRo0TpTvQ+IQ387y/cNnzsfumd24cEtjF/M4pPfz9IRL72sFYXVlwgoqJ
 dGhRqMch7sw5LzN49YNe7HsTPJCqv+RZJFc8K0hywyduZbqbwkB9bpUFyloZaEhCy78IdGPhED
 rEhUJiUASWd0SXUvqUlLrkiqS98H4LmAnbfNbmuf5A1uWyVr6AQAA
X-Change-ID: 20260909-upstream_nvram_reworked-f84a4b37817c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6BA:EE_|CPHPR10MB759348:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a87442-e3ca-433a-54b6-08df4a4aa6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|11063799006|261021123027099003|261026121527099003|261022115727099003|261021130227099003|261021135927099003|261102123227099003|261028144727099003|261022113327099003|261021121427099003|261026135527099003|261026130827099003|261022105027099003|261026140227099003|261021133027099003|261022075727099003|56012099006|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kewX0+rvURzJGe7mkGawCzuEC+UX7ogJgbojbrzUxPzWvMcpPJKrmyV/7fDj3jea06Y9NVvbyO6Tzm9jdomAtJonpfiZfvPNlEuxjDwdeZ3Q8lVhxU64YbQGB/vDAtD634zFay9QdDd516LFL5bBgwd5LBHKYrY1VZOzWUNHfS0bDF1Nmtzd8MWk0nfcx1I4jHt+gYcByT9GkVyBZrm089ZCniVmnpeAoLgiPrUJ+8FYcGu0yh0azbEDadeZf1R+VDDUEGUYbOrE79nu9FBT32Qr5VjH6hSRufQqHX5QgzUlSZKnq6t5oIOmTKKRpPuSJXQmfG2oUW/hMpljk1awak9CT9G1HS4N1qY11LJBziOkC+mx5OiK0Fe27eyPeFWbWO4aLUPW98o0zu+Swn8cQA5iSqtMrea2ERIJHamgMCfy/xGQSd6fNTRvrR9NZ/JHY4EkTv69N5OcXZ4GahW7xjLbb7YxECA1bFW/0BUkilKrACcKNFrX0aEhaN8LszO3Lt+5VRyP4ojLBAMjMKXPEI/1YaR768vNGzIbRwnzydGTJ6rBZXUDVGGWH/BAou/Bid/KxJLqpfI+IVFH4Yl4Z4XKxw7+eU5kWC4saDzvp5aTcf/IG01d+8X2cfbC/lsjvv0Q09v9uq8X5ykzIQpZrw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(261021123027099003)(261026121527099003)(261022115727099003)(261021130227099003)(261021135927099003)(261102123227099003)(261028144727099003)(261022113327099003)(261021121427099003)(261026135527099003)(261026130827099003)(261022105027099003)(261026140227099003)(261021133027099003)(261022075727099003)(56012099006)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	msjRir2/LnPeIZ8YNkepPrxZy20Obp5yaqhsfWnf8VHKtav05GvR2UqbRL8LIX6RdLMMOdL2TdOqVxj7U4AcZEmfwyZu3NdSbffpAft3amzEkGNgfFtBha8vTjiEl7XEJ6qixgkATvS0yq4AG9A7DS2bdsTjXCMpLkiOSN1gSkmgIfxZWoHT/T1VLNxQxcUjs6MI/jQuMCc9mXCew1cWMCbxXsE9PMYZWA9KdrCgw+2zptCJeJmrHaAo3AeuDzq4IUs2EF5rhWbZ1lUCvjCq0LL58F7I00hBuhYT3NYtZOcJHtl5IxL7EUuryDYe5DlzoUl6ZUkc8vm+3ROoYSjcpQ7PHUTEAKEJY4E2TMUoEQwQydSw6+83x5J0g98xwj5Z6809rqa75BXAHOZViguFeSAEtJaJAl8nRLMJkUBPJHZryfszz74ojZF37ZixSIR6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:47:39.5436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a87442-e3ca-433a-54b6-08df4a4aa6c7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6BA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR10MB759348

Propose bindings and driver to enable TAMP nvram driver
support for STM32MP SoC's family.
It allows to expose TAMP backup registers as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v6:
- Enable NVMEM_STM32_TAMP in both multi_v7_defconfig and arm64 defconfig
- Remove "Co-authored-by: Copilot..." from patch 2.
- Update conditionnal block in st,stm32-syscon.yaml.
- Fix indentation in nvmem/st,stm32-tamp-nvram.yaml.
- Link to v5: https://patch.msgid.link/20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com

Changes in v5:
- include DTS patches previously submitted separately in https://patchwork.kernel.org/series/1176665/
- Link to v4: https://patch.msgid.link/20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com

Changes in v4:
- Make usage of of_device_get_match_data() wrapper.
- Rework ioremap of syscon's memory region to avoid overlapping
  between parent and child node. This allows to remove
  bkpregs_regmap_cfg declaration for both STM32MP1 and STM32MP2.
_ Add select MFD_SYSCON in Kconfig.
- Link to v3: https://patch.msgid.link/20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com

Changes in v3:
- Fix issue found by sashiko-bot:
  - rely on the already resolved priv->data->nb_zones instead of
    of_device_is_compatible() to set priv->bkpreg_access
  - Fix max_register of stm32mp1_tamp_nvram_regmap_cfg and
    stm32mp2_tamp_nvram_regmap_cfg
  - Update zones_end type to int*
  - Replace both memcpy by put_unaligned_le32 and get_unaligned_le32
  - Link to v2: https://patch.msgid.link/20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com

Changes in v2:
- Update commit title of nvmem dt-bindings's patch.
- Add required compatible for patternProperties in stm32/st,stm32-syscon.yaml.
- Fix issue found by sashiko-bot:
  - Add freeing compartment_owner.
  - Replace regmap_read/regmap_write by regmap_update_bits in stm32_tamp_nvram_write_byte().
  - Update error return in stm32_tamp_nvram_read_byte(), stm32_tamp_nvram_write_byte(),
    stm32_tamp_nvram_read() and stm32_tamp_nvram_write() to return the actual regmap_read() /
    regmap_write() error instead of -EIO.
 - Add freeing field and update error return values for stm32_tamp_nvram_get_backup_zones().
 - Update error return for stm32_tamp_nvram_probe().
- Link to v1: https://patch.msgid.link/20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com

To: Simeon Marijon <simeon.marijon@foss.st.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
To: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Patrice Chotard (5):
      dt-bindings: arm: stm32: allow TAMP nvram child node for syscon
      arm64: dts: st: add TAMP backup register in stm32mp211.dtsi
      arm64: dts: st: add TAMP backup register in stm32mp231.dtsi
      ARM: multi_v7_defconfig: Enable NVMEM_STM32_TAMP
      ARM: arm64: defconfig: Enable NVMEM_STM32_TAMP

Simeon Marijon (5):
      dt-bindings: nvmem: add STM32MPX TAMP backup registers
      nvmem: stm32: add TAMP nvmem driver
      ARM: dts: stm32: add TAMP backup register in stm32mp131.dtsi
      ARM: dts: stm32: add TAMP backup register in stm32mp151.dtsi
      arm64: dts: st: add TAMP backup register in stm32mp251.dtsi

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  43 +-
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        |  58 ++
 MAINTAINERS                                        |   8 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |  34 ++
 arch/arm/boot/dts/st/stm32mp151.dtsi               |  83 +++
 arch/arm/configs/multi_v7_defconfig                |   1 +
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |  31 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |  31 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  31 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/nvmem/Kconfig                              |  11 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/stm32-tamp-nvram.c                   | 680 +++++++++++++++++++++
 13 files changed, 1011 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-upstream_nvram_reworked-f84a4b37817c

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>

