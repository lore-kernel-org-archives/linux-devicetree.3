Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD48738E8C7;
	Fri, 22 May 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439116; cv=fail; b=N8QObjyvdih3fzjCRgsNhpcXcIIo87KYvZniccuNmaKYlObrMXwm7SLkh0Mpix8JEtX14fE7yumRZeomK4UVcJzNfjZLXa2chcoPDM9pnuVCAT5IatBj3JoqZGtDYCBg8mEe+LOEvTQgC62yAXfBKO8J8exHTyzQ2rkZJNSxa8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439116; c=relaxed/simple;
	bh=j9YfcKsnk+vnXBF8teOh0tF8Ifv52Coh9T5kBBWqgAE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UvNKOPZO9xSiYKJHxyuo3G1CW4s/OKzfvVSfbo+td4WYGCN091wOdeTuqJtrQGDCeUqe1biVP6I+9Zsy0sYCgeaH+PmbVdJZd+QUWwgw45K1DsibtRgnxTuee90dk1RCGoZfxazbuv+a7t7n0yMxi8B3i5S9QzFUepalGz7Ro4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=nfYBDPFl; arc=fail smtp.client-ip=40.93.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="nfYBDPFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFSg7HfwJfyHdmErdFlmJWtATd9Ctv6q0Lf0bsNR//CojlXuux3M1G97e/8jLIH6gBv7vIfVaa7Q8v/O+d8p7yEzJyvlNaHeXz6Jj+W7r8zAL6MaQb3EaCmEoEBrzvQDLRxK/0UiUPAwy4iOLzbyJbUdoyPVdr6EnlgIp+85P/M6yqxnD+uHHTknjZ4k/izo+tgRrFnwUGtVaonhxAlWv4366Ce0h06CwiYAAgyqiou5V2DxqCQIQcBor5SSOS4sm9vR5lj4eVRmjhs8TvGrscQ2SkqXwXDQ5XnnIBM7yfK58Pa7TjDsQsKs8zWpKHHEEQcoHEQoJyzpNRTwSkgM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfkznCHsaYfNJgO75H2zfmpEetyjqA8MRP2DBkGTe28=;
 b=JCv1oJsVpveiHSp5p+OZVkxQWhKDKnPQdXqo5NVuEYWx7GWD7Yp75UEhOVcrKUfY6XmBIRwmFCn7MtvfB257Gp53DN13nu5eoCjPOVVM0VfA0dOINVjXVftqOYDM0wHObAenXtkrMnERAQWdCO6WDmR0kSidX47FNcK4QV1r3gT2LG8T5I94aX6heASCvPDZboSr9xap6vmaDC+/VTt8lzWoUcYB6i1Eew417A0eaMp6e6FuYsmH6F8alfoWsupFZDy5mZhM3EZsZ/jqgUr+5l9aeLlG0dTq0fOuNjJcX8aeWgrAZ8PcR6ysZJOZ9i8ySJVwwM44EM5m/woh8HnQaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfkznCHsaYfNJgO75H2zfmpEetyjqA8MRP2DBkGTe28=;
 b=nfYBDPFlLI6wTOZSlCvGot4QbM+8UhL6mnzqiLOSalnQCa5gUxOXo/xnBtg0Kvy+vFeRuYHIC7C2jRI1CeCPHDLJqNRlPUoxW5+cIG2Zja4/lUZnK9YSsXKWsMNA1SjGtLV3tRIZNvWNp+QTeCMEhuzm7jToQN+p4Qm+7vDjIGoR0jKkQALTvEyqRy2lhvCq3yZMQkq0AoFe5wsWExlSiqYukY/hPMopPAQeUza8s6AfxWMFkCaSmpL8PByNGaHtlBkd06bI+7nuFx0FDFhOXgvHBpBbCetFsnB/BQFYk2ucONkHMKufZVMZTS8QgeChFwVy7fHM0ID+OIlyMlJfVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM6PR03MB5052.namprd03.prod.outlook.com (2603:10b6:5:1f2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 22 May 2026 08:38:32 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 08:38:31 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 0/2] arm64: dts: agilex5: add support for debug daughter card
Date: Fri, 22 May 2026 16:33:58 +0800
Message-ID: <cover.1779438754.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM6PR03MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 237c355e-5f6c-4b0d-bfdf-08deb7dd80eb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|55112099003|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	byzd/7AZFHwTa33O33xGvdwwce00apOpenHB5HhkI0D6EdPDv4jlnj4F5X3BHShc/XD6NrU9q88iCIf4ZObeJnihXTtqnoMWqc+IF8mq+V6h8HFlGMRKZodw4paE8qCuj9Rc7REcFuw7GQVTNYPl2Sl/9p6pthYhmtwWk6nqiU4PtZ+Siog/vphPVa3U5D5dwHsZ8vlvrUCtrSd1DPb7tsW207rJobnORZKTlo5GICYxTO/5xC7uBBM6pJowZhhBtaCD+tjA0cC7AyLE4Bv13biwNOwOKMJ8TD4nBltsT5pAK8V0yO1lwSLHBwfSw7XNENejba8BzAYCExBOZgxZJpECX1O2gK86P5voCbTeiWOQWeqNUxlFsNukbNArgUbSGV/t6kf3BcnoJ8R/lUYkjQ5dETuUsM7ZDX1G2LAT41Gedx8RP7k5JqRakbGaD076Fh7VL5AfDW0h/psbvza9fPpcwmc9x3ZfOQCHl3Gx6rIASdoFhUVS19ZLBUlqFUN5rfabZJkfMMIpluF6qCssjN5SpaQhDpupbU76G5gi2v1mlEuvDdSA/nMe2St5C98LnMqJ0/h7bqdTJmglgdEb9+kVfTKnxRF2fZxKHmPJaomjLqa3ZD6MrqeQnDdLTbFsI6rFcTfpgItDwFl9xMQQcS/+9g7FvHVwFRFlQQRCOh5HGcchMnpsuDIqbDynPClh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(55112099003)(11063799006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xrKpHTJ8sPMMq1vgih71m6uYELki09P0/0seLc19sd7T43F6J4c+RNypl0QY?=
 =?us-ascii?Q?41u152rXsj6Mca95jgoomx8+UfoGrea0QsE1TBBqje8G7rlCngaErJE702+t?=
 =?us-ascii?Q?R088BoNLQWZaNKXnY4U3WQVX4nAM+8kI8DqyxHDyhPnmb96LmHTRtSqq0J0e?=
 =?us-ascii?Q?WXbQwuifoA3ebU7priJP2SCs4fKER7nPKfs/3G6aNy8LC1gc0aCfrXpqz0jp?=
 =?us-ascii?Q?tWqJGzog5m1cXMqsRFHU/6UtLPm78uHCrt8RPBKSRedyq4tn4BW+9l+eq1Br?=
 =?us-ascii?Q?0UEAmlJlwhrafnEBHQ+oYMUubiElOBzXfW28hFC8KFg34hKLtMEJI4bOn3xs?=
 =?us-ascii?Q?KkfW0/Y6f/SUyvuElRSoKfTtyXzEyW8AUpS/qM5fER6FK2DjfK/DKINlYcIR?=
 =?us-ascii?Q?ZTAOGFFtVi6yp99X6WnEbgw1LZxNFuIBAhf7+othZQIo7UJb21kfPCGg0NLV?=
 =?us-ascii?Q?AHShnxIi2Oabc7/FkGz6rrsOCmuUQEC889csw8sfnJYneYrie/fqCm4R2LjV?=
 =?us-ascii?Q?fWAOgy1jDficMwPwH8OhcngpsgZM4hBvzUvOmOyEfQKqDrmKuXZrTJLL/Okq?=
 =?us-ascii?Q?1Sc8me21xmk/NTjn03tND1sU6LSGcGk1dkLosDohCnrmRxk8JZjFXKfe+rNF?=
 =?us-ascii?Q?QgDYbr9EuAhynNg49MTChU6N32FCA4BVN3WoKY611iwyjflgGHlUmTNucHNR?=
 =?us-ascii?Q?psW1AFx/6POII6C/ETrZKv1whNwNmjxH9g3JTGTo4z0OXStHq0TkgjAU5G3l?=
 =?us-ascii?Q?nk9rLBxxLfpZleXKJZxvxyJyik/vJhe0NvW2FGja1TJtMDSsl1r7RsCBbj0b?=
 =?us-ascii?Q?BLlBY86MlxljgzjnKc0yHrWhATWeb2Z4h0NPeU04DaFjH4OsZnLhD/I7FDPY?=
 =?us-ascii?Q?ZZ0z2DleHit0Bi3GlNq/GP6ik7zItnvY/wsLYGuoNZOJIOW/Kp8wj9Vle9ni?=
 =?us-ascii?Q?cv3+dO+WVZbV/jvx5NxZJete/+GTtVo2aXTqQ1pMT7P1VHrTRxsOFya1v6IR?=
 =?us-ascii?Q?yXadqHAf6NyvEyZPXyYCB5rwxyZq86N6SIgZjQl9AL799xL5tgl/tTQmsiTq?=
 =?us-ascii?Q?IhrD+kv0Ypkaz92IEmE/AFM6lpqHI+sZOFrskKPSKIiKRV81CES9rDnpEbQT?=
 =?us-ascii?Q?XjQruAjsRVRsML0xq5oGhYY7WZ779sKcm9HBzsjTh7KAVbRlzJvv2gZ7ypPx?=
 =?us-ascii?Q?QBqik8cGwokYOgqbrvK+SpWNW4JDv1sUWchjZmFAr36Mekc3phzSUdYAT3ZY?=
 =?us-ascii?Q?Tz5w2rQarg0OLotH2VegRMFIxK9QdRQ+b/tkP+jCWg1KwPCInY/1FUFIfmOc?=
 =?us-ascii?Q?jNciDHhAAiOz7ht/SDxQhc//KsgQ4QLbJBAccw3LOrm07ILLVOkuetEX9xeJ?=
 =?us-ascii?Q?FKi1h56HqMbqXV58FqIs8f8YM5x7nUnUMEEBZFM0y9alJKmvgk/HNYvVOHe7?=
 =?us-ascii?Q?Xs316GVzduOq9Y4BXzhPU9hjblgyRwAsSP8vLscklKYXjxxzLpapJaGjPkCB?=
 =?us-ascii?Q?es+L6H6mkMGLcBKWHLyhUSRyxUJr+mw6c7jY0XT40Cp4TqxcGfADhD6/J+Zo?=
 =?us-ascii?Q?3plLstm+r4rZtTTjBELmP0EBOiOiopuwoYMzcMJ4LZEYayEVhDVJmcko3Aj5?=
 =?us-ascii?Q?yMkeFIg108Jeoll9C79bcRMjYFD1/UREW8r3ulr3dMGoACv4e7hW9H7xRaU8?=
 =?us-ascii?Q?OB+N8+LFobMrv22onAdL7M73JNORPyNt40kJ8Ax9B7z/b4PRHjdbu/HyoAmE?=
 =?us-ascii?Q?DFrmvriMBc1ZxTj1PitzrbFP7wWvEjo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237c355e-5f6c-4b0d-bfdf-08deb7dd80eb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:38:31.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTv27RpoQTXiWkU+Ivb6xouewrwUCGEndsgEJocHLL9Kk0zSsz/ifXH8AJJMRDDDCoF/ovhx/KAANmczuLj2Rr8WpuFfgIWsk/1D+pW5ero=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5052

The Agilex5 SoCDK supports an optional debug daughter card that requires
a dedicated device tree variant due to differences in peripheral
connectivity compared to the standard SoCDK configuration.

When the debug daughter card is fitted:
  - gpio0 is unrouted and remains disabled
  - gmac2 is replaced by gmac0 for Ethernet connectivity
  - spi0 is connected to a Microchip 25AA128 16 KByte SPI EEPROM

---
changelog:
v1->v2:
- Use socfpga_agilex5.dtsi as the base include instead of
  socfpga_agilex5_socdk.dts to follow the convention that .dts files
  are final compilation units and should not be included by other files
- Replace spidev node (with fake rohm,dh2228fv compatible) with a
  proper atmel,at25 EEPROM binding describing the actual hardware
- Remove dmas/dma-names from spi0: CONFIG_DW_AXI_DMAC is not enabled
  in the platform defconfig and retaining them stalls the SPI driver
  in probe deferral
- Remove incorrect HPS LED GPIO override; the LED mapping is unchanged
  from the base board
---

Adrian Ng Ho Yin (2):
  dt-bindings: altera: add compatible for agilex5 socdk debug daughter
    card
  arm64: dts: agilex5: add support for debug daughter card

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../dts/intel/socfpga_agilex5_socdk_debug.dts | 123 ++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts

-- 
2.49.GIT

