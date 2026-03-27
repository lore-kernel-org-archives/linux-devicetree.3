Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51943D668C;
	Fri, 27 Mar 2026 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603836; cv=fail; b=NCeEYbFiXmY8BkA/hkvmEKsombfyvcXcA2PB7MbUr5CCzRQmObOorCM71rhvNeveB6p1jC1S9xTxdmOskbvFKXJmrdI7g3MVp7Vx7R7uzeeRU7xgI660YnvhUSVeNRJtt6hfRi789S2Vud/3gDu1QM+xOI65mcLnJwvs2UPJ1ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603836; c=relaxed/simple;
	bh=vl0UHD7O++jEGsAQOzCxn9xjXEIV/VSIl5r1NHKmiB8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bLHYrXKZe2FMJKrqF8cRmVcyRS3pUE3Hkf76TexW1Dx8Bah1CnE3pv46tzNCAk6TfpRd5BMHw9b3o187dxtYNIybM3YEdDXNxuRiUzFsIM8Of771Fli86lMM8s5k7r9bY/0lgAA1pPWgp5yAFLhR19SPPWlIJ/qLY5VUKUh7L+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com; spf=pass smtp.mailfrom=khadas.com; arc=fail smtp.client-ip=40.107.75.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khadas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cp2hdO0jAJPInXZ8lj3d3IcCiYpuQchqVlMVyZ1buPoyZb4Tv/LQyS/UZlQ3vHWvnOdtbGhwE4+HYZ99lYe4aubRm7tOVlYC0iJpN57CA2d0Vp5a4XMhoZKSo5VZ9aTbpnbchm9cFXizWmBuHZHUoM5TW/JhdaMySIYW8+sRx3N4SY6CsEGDcVCEIC6LfDBpYOPuA4FlLOFJ0a7Of4sIWAuRDSxS04HWTIpU0omXUMDu8bhq0dBNAmaJcAdxZ3cNBfkM/xoe8YhqeZmU29JdDXwB5r+ZogG13J8IeXW4VXTBbnscNct/Xvil74tWF5WdMfTTwOtXgS6dy/2B55zU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXAJz6x4v0pl9Vx450K4Zhu/fqg/v5zMnSbCl0/vTIY=;
 b=xTZU+yPuPEL/6CwTLcoi+XnFRiaziW2Enh/KFrvSWlfpd2PtKS2Ixrw+eGYKS8dYIR00cmGWxWBgB2EkvLxYP42kYFeZXjMbwMQ95lUwlTvguaRoS07tJ9NRDkdFMwfZ6O9DBa+MCnc289rhhbLNll7z42MIFKp0xxw94u9jnbSLqCI2k9OkAE1dLeZs1JLNW3Fjyo/ylMhxlqCkWML47yPzbJWA4/nqzGCVX84h6Hr7z5OYkUEe6ROclaq6kkQjF0AYr+vfjaW6M00Bc2LPccOvcrHHGccZJyW1ks+3PKH38R6lEHDCG6Fn19b2Kb7oFk/a3zv9rO5E6ehWkvdWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SE1PPFE32D229A3.apcprd03.prod.outlook.com (2603:1096:108:1::86d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 09:30:29 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 09:30:29 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v1 0/3] arm64: dts: amlogic: meson-s4: enable RTC and IR for Khadas VIM1S
Date: Fri, 27 Mar 2026 17:30:13 +0800
Message-Id: <20260327093016.722095-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SE1PPFE32D229A3:EE_
X-MS-Office365-Filtering-Correlation-Id: 714a9104-960d-451b-1723-08de8be37c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	xmddjv4qEpdGZdYSTGYx4SHjF4NeNKtZk086f4phRKGnK6Odq56V6Vq07jPSIbVuZwNkpUQHvuCIkpotHbfgBL5iNcmHuG9m3ePvbQ8SG8Bl2641DrlURfmJGrmffn4+k0CX2bsAE6sMS3ESASeEOnfGOyB0qC6mx4YU62wc+mfzCxnxYwuJtaby4RpK4MCMgpM/VZNG7+ux9yC8AlZxrz3CWFGbMJUud9F3/puYTorftJWtReiwbudfrkrgvpwCw4jNjMEfI16yWET6hZwxUt+ZBgXz9HJNcxva4rOjbROos4aOypkX0IAEct9AX0N8Hbv0RpYfASl9R37WJuv0DYXGMwo+447B3lCCkDYukzl5zxtPN2SrHIw2e2N8RS7KY8ug6NtvHt5wWxC934abGcsxO/Y2uc6J1TTuJCsuwcsx9SJh5aQobIeHgRaibImr7Go7v3/34B2fuPiCCedd0VzYAW26Bs2pKBkUC9YdHncqI/TZNSnHtDFoMllkal5+PG36u93Mu4LPG2jkTzjlFYgmJPVqGYClAMzhD8zmJHAfZpFHYHwX9pmQvcKRMuPN2nXc2zQ1N+Se4C/5XkmawYSHTJKWyaddj4KB47ux/FUQa5v3gkRAg2EkJf06O0T0+3t6crAEWJpQwsiCxLJmPHZ0yNhf98szlSH/oAkKyypRP3LhKJv9CKP9sMaF8v1UlVnID3SELZqnfC7S7+l2sVLUcbq9ok0JnXn85xsXG5ybAeEnSDGVRKmyhtJBzB1wKTn70vrWAiPfmbRzePG4+jwEi5rUcmR8/ppr7lJba7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yqKyHqBFNDGOFnWjokYCwLo2ZvGbWi8Wr2syFFU5OgnOmmE2LMwsAuT0L+Y8?=
 =?us-ascii?Q?8s+HsZR/muzI2ISIqUpagHgH0LUkvKJaXwUbsrUi5vfGpWd24COPEymfFPja?=
 =?us-ascii?Q?3N+hKAhw75vNYY6Ot9OnCiVSLCmfIoz8HYN4p7etnbTEwqWGINK30zGYvgUC?=
 =?us-ascii?Q?tJP3pK2gAB9Z5D2Idw5KerQCcJ8AYvdH8qF2CWIUcwO1NfYjCPmx+3r6O4ou?=
 =?us-ascii?Q?B0NBRQU5aYYW3yVmXvfrkIebFRYjsEgpdlmV9hCOPuhU5esTkeEMKfxiwVpW?=
 =?us-ascii?Q?kL3gPOrnu9FxUVFPFKJIxYucTaZmEDrE5FSSY4lXSZsZAeyugliSZhHkcDR8?=
 =?us-ascii?Q?6uxIvwXTnTBefv6E/W103Dznln3TvJCjylNo5NxnkN+zbqvZQzG6grdfsMMl?=
 =?us-ascii?Q?/Q5PkqYlICFv88cEZ2VKwTVsL4Z+XZl2jWfe8CFRiJ9PdQPn1IhD0shPJf/k?=
 =?us-ascii?Q?ZGL5IgoGdUMIIMoj2U+DKQFaKf/VgSIs06EZcxZinmw2ezh/hZZ+prLz+mu5?=
 =?us-ascii?Q?v3M2TknIhSFZEN8ZlUYIXFupeVe0qAjVGnKOfOgnzjyRlEMLAeU74eQvKBxK?=
 =?us-ascii?Q?40jJHEQhInO15fJie6YPlQgUJrdb/IOpznrx7HRhSR17koumQia1HvHnfy2f?=
 =?us-ascii?Q?AolXJyURUPpSstisPdKbyaAmaA457hs8vGEyappgOaewbbnbKeiIVrJhoxoK?=
 =?us-ascii?Q?PMyFFpSMPq5ZMKFVhDZZ+8oEQ1zbzJekQA+IbReEvPYePbR8A1lTNRSaa1i5?=
 =?us-ascii?Q?PaPIp0VFek6+mYk5C0s+pzhdjxYRq3Dq2lGBuXMp7uW8v2Hdj8x7hpj2Cyvo?=
 =?us-ascii?Q?TVsCJVbQFWvSrQIaJLF5CLER+85ja5DD66CWYQfKx7zkDGttm2cXfandRxMc?=
 =?us-ascii?Q?7u10A2bbCEspWScmUtP9PkuadoljAdD8LglsQmwLr6qBIvJK+Ka5SmgsTyyb?=
 =?us-ascii?Q?TYBBTmpVRmGzxDW/FQM80B8s8rHtYzuBaEzS7De5xZfdccerVEfClhOiTxkg?=
 =?us-ascii?Q?j3xxl6/xguu7nNngEkl+BpB3xpdEktMoGwaHqvxtfZp24ZA+kfVb336skcsr?=
 =?us-ascii?Q?MQct8LaFQuEWQFrez8yomYhQzos73p5VvbqdHJXRfTy8Ai/UBusCDS4xbx+q?=
 =?us-ascii?Q?Rj7eFteQQ1ETw8daTqerOZkMjzL9nwsyicnBlbtkzcfG4CGlVB4zJTFPNl0b?=
 =?us-ascii?Q?ubw6LFEgDu7v9ox4YxvfdErgpGIl0uh2hZG1i/v1OmF0Wk9n7lNLnyOgFsW6?=
 =?us-ascii?Q?sec0Uk3l9a9IQO3hbnZYnAqL4gG8BneKnkUOeoagfIj2q03UaoNnogWe9CeV?=
 =?us-ascii?Q?QaqmKts8bGpWFFbBXpOUMQW6sv4qTMEdUTu6Qv28nMJuD2foOAsCO5G/GyPo?=
 =?us-ascii?Q?OYi4hhiuxzj/y7bL7OF7mczYvlqf8ifbl2PLQxUTT3ogdpRZ58QuPNAyeTWO?=
 =?us-ascii?Q?nHomBtTIdiN72NnzJdNR90ci2MlIC0kj35AfWhgU0HNMQIC+/nIBDT/RX5cy?=
 =?us-ascii?Q?puuXXotDnrclO8zfxFDtF0R0rC8REJ7EicJLgWvAbMAq2f9Vls7RFmIy4CxF?=
 =?us-ascii?Q?VnYks4a0u150pUbHzZoOvjZ4gukETVRrpSY6fzi4YC44u0noW5AXsBOfC46+?=
 =?us-ascii?Q?HcbHRW8KadK22ZVD/eJqmeZnrYGPHsA79yLKmQv3iYYcHXGHi+sUzjoqBCod?=
 =?us-ascii?Q?sM0BRLYd7fbzmYbBNdHq7tq3ENKyS+dKWusP7tRsOZNN7KZk?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714a9104-960d-451b-1723-08de8be37c1b
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:30:29.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRbHLrzW53No3HB2FS/vesd+hEiFMbQYUG1kg1jhKXE97Gru1x7zgSwMZpu94f5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFE32D229A3

This series adds support for the Real Time Clock (RTC) on the Amlogic 
Meson S4 (S905Y4) SoC and enables the hardware RTC and IR receiver on 
the Khadas VIM1S board.

- Patch 1 adds the internal Virtual RTC (VRTC) controller node to the 
  Meson S4 SoC dtsi.
- Patch 2 enables the I2C-attached Haoyu Micro HYM8563 RTC on the 
  Khadas VIM1S board. It also sets up aliases to ensure the hardware 
  RTC is prioritized as rtc0 over the VRTC.
- Patch 3 configures the default keymap to "rc-khadas" to support the 
  official Khadas IR remote control.

Nick Xie (3):
  arm64: dts: amlogic: meson-s4: add VRTC node
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas
    keymap

 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi        |  5 +++++
 2 files changed, 21 insertions(+)

-- 
2.34.1

