Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012069.outbound.protection.outlook.com [52.103.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509AB24B28
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781875458; cv=fail; b=YZUU1stn1o6DtWomZ7p68cA8vXtukTWNyfHESSF7MZDCmJhirjKbEkIyIaSlO+muH55gVVa3CFQ33JMZmSvdX+L6qQq1yt8NNCiPfzILODRroWYHBe8IK27l6FxrJ35zrOeTdioFsQ16mZqu84uZsAt3pv2PS5W7iYNKRYmmEg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781875458; c=relaxed/simple;
	bh=3QoJc7iDqknwlmhkUmxR3z8oY6w8nrSQ/du9/jWzOQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pHeF8ZqB8koZ8y/y6jQQspL4ntE3TfnKODWvz7YxNi/TEyYNHD91+qOwTjk8Igy6xQu+TRdeM3tMtgQ1HlgUzD0K0jtENADCI/pYwZxJOlWyr6cbEQK7zfy5+d/MxFli7CCbjPjGp4zlkc7ZWay/uE3ZKKCrzR+/MyI7a7tABig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=MtkVYQFd; arc=fail smtp.client-ip=52.103.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="MtkVYQFd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvRZoIjWmIcah8+v2lWWHKrRyKqNHKZWXg69GRtyU5Dyyqp6suYVuBEAsTXPrL/+Q8JmARFsf7JoXPxh5WZhqgDVn6AK4lkbNnjJMkNTp/49EK+qqYJzCt3I8vDkeeA+5Z6iWs3APdnz8pLGcKpy76RnxapAd8G9eTDT1t12JEZeNubJmRbgnXH/Kga/tqlVGVw25wziaGOhjkRyVBtSGwSSQbn6veKqWVp0KH2hyTu5x4LwESdOIqmgijrmwChd0JFelG92/AfcRQ/f6Rt648vjnahZdYkTw7hvGfyjRe2CYwe+DlMrO1coPqG9RGuPpXRCKTAu73DucER/Y+BT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrilDPEhMxGPltj8nuJnK8T6lu1ulC6Xe6RRT/JoWaU=;
 b=Jd1QIWm1w+PA5yVxGlc3aTBroktYMgVgnU/YpzS/9bgo4Ci3jciUB36nFkZMfHmtfl/qXsbchWWYw7Zcp6qu4eGmzR0i9r14j4D3O5+xgqgyU3N1yyZAy7ISh1l3NFxcKs27F13Jsh53x0VNJE5kqdIrf/VQVrehMLByVzbSNrn0OCa/c6YrphENmfXMqDqBiUk2EQ500OVt85GM8+caAmKjZ2w8EmSo5xblVmu4BULDOjTmhUO0vGDCgscLhCHNq586KTAhzW/jwQDpUZTxcqE9PQh8A/SsNPdk05uUPDpKZtztxixdT9EGukeSCyCoHvlq6l6lU2eXi8/ebD6okQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrilDPEhMxGPltj8nuJnK8T6lu1ulC6Xe6RRT/JoWaU=;
 b=MtkVYQFdVNiXzNhcjJp3UjOMncoXeVBdDNMDmsvlnY3rfHySvk+1uCgh1u8XFuIsS/XeWyeF4MhFRdKbLPEmkpa5NfQmB+puzPMUJrDrb2fpp8A2iCGZuIiJAU+I6NCbcbrxD/+M2VgMToxKmkVEFaQwoPqGWwE9H/YUeS5WGsB3Mb5ylHbYbiXAWKMozdwdgbYNXPwZu4b5TlxtZaGj/whD5BKTMofVNQD2dLUlB5YoxrQjCYs8AxZG6LdpAI9ow8KjoSuaVIWexOUDafZlCDq33Mk0sRFI4eXln/M9gLPoT9rnBzd55ygfn5MCAJTlQmDQGUwt6avBO5CdMuvYeQ==
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:18::488) by
 SY7P300MB1372.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.13; Fri, 19 Jun 2026 13:24:13 +0000
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a]) by SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a%7]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 13:24:13 +0000
From: Liu Yu <f78fk@live.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liu Yu <f78fk@live.com>
Subject: [PATCH v2 0/2] arm: dts: xilinx: Add MYIR MYS-7Z020-V2 board support
Date: Fri, 19 Jun 2026 21:23:53 +0800
Message-ID:
 <SY3PPF19552C607B378CD51B6C083116CE1C7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619102214.223121-1-f78fk@live.com>
References: <20260619102214.223121-1-f78fk@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OSTPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::18) To SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:18::488)
X-Microsoft-Original-Message-ID: <20260619132355.1776-1-f78fk@live.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY3PPF19552C607:EE_|SY7P300MB1372:EE_
X-MS-Office365-Filtering-Correlation-Id: bee573f2-fe63-4c48-d8fc-08dece060d8a
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaT73AOJjOZf/1fj0DnwZwvEyAs50rm8Boci7vudXLh+L0zsnFQqABxXK1z3RV8VuAGBdYuW700O0BDDz3JfCzXvyzxQKQdP4QItWNozTGXmLHRNzM2BXDo29KlygkD8Or/ffCTBiwXo/f82nP5DlsQr1vp0MvUq8hy6iT+uXrmzEgJrvw1C9/fBbGr4hIKmsV0ZVM0KFAqxfIqyqe9o+Djchya4El06OHuDHwNsIYzj6iTmYBbJii++AEjRCNT3kvVjamIiRWEfkxh4uypw9dI2CdSxQ9sAnyOMRRayTXCpFssOt0sEKh0DLApYpqmC3tAgTNhzf/zshf51TBcw4Wmn5sT0JyCpuRcPKfgOgA68GwmzMCWhdt5Zck7Z2cqJXlfd/icqxb6ofn28TwJmfYpluAvD6+vp1iVPLA3N5LJJEP+AwLqCyDaNnwwtsFXfD8sLjXnmhtW12nnJJP4WkQt6N3JvypQinjU6jCSBAsROxXyUkImubMW+xBGer76diUHSb/iHCnLlylImVh/L1kJ04VG3+Vk+XP9PMNRQ6iqE4oPyC3MY4232RXuUMR1aYmbu2sNjh1hG6RkxUWhkYAH4W5HFEsb3zjmfThv7GVEd+ruy0R6bDwNjfMQX8+X8UFm6lTeCrQ25xcufCBkUaF49hIm5orI0tZf+ZIUcWNeKTQARL5ZS1eJf1g3Ddk4LgZyXt7Gbsr2d3+CRf0ZlnqWiXSKe1iFB7LUiA9XmQdy645rGeyBkyRopNpi7f7C4Uq
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|25010399006|23021999003|51005399006|25031999004|24021099003|19110799012|8060799015|5072599009|440099028|3412199025|40105399003|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2PUTQeU7wTiSd3i6f0USmcRCdT7Mp/0vN+dRqTJ0t3H2yvZod9ST1LvNRDJw?=
 =?us-ascii?Q?xl4zyqRwPNHry8qNDmCVH5i3Xs4x6f37u6y5ykWGWKdeeKJvkWnDORU2HAsE?=
 =?us-ascii?Q?q1iDLQGjNImTdZK0A6C/k9/F2WQtEUgFOfosqtyi0c2NcjFW0mYqHOVWXfcg?=
 =?us-ascii?Q?E/1xacCq+eNhMkVlPgO1Ywb+BwNbwNhN0uc+NYBrq7jVLubVv7dfwELLQ4tk?=
 =?us-ascii?Q?MGkv3zWaydrUahSGHsaY1LTzO8Krxjtt/tt1+67UlYHY+GEjzbgovGv/pxi4?=
 =?us-ascii?Q?AklpgCFlz1fG0EucxvS2kfsldI5X+EWsTCht/bYMigJ1v8Bu8KWypIJMa8io?=
 =?us-ascii?Q?ulbEvPD12YE5vB+6DmZgOVCJXA5DfYg+ErkEkdnxSr3kgQaYpfI01btM6RuT?=
 =?us-ascii?Q?r5LPqYYARMetZ6Y5bF9TmKv/er3Snq4pYc4wg37CuFetdJs36H6i7O8hwvQo?=
 =?us-ascii?Q?31fZ6v4C+ftC4x4RaNQmdW31dWfCKhrX+fZpyBI45EGVZ4Jp8SFAYVJWdbqs?=
 =?us-ascii?Q?aY9V9RaSN46MdNgQAUJPzHARajPxRu34mkEDtrkfVZlWMBgpcA19W8i6jZgg?=
 =?us-ascii?Q?P85xzEAmM10nZr/eXTnR+ncEV7gmm43DM/nd2oh36k0WhUIyYYNxX1OhWi81?=
 =?us-ascii?Q?uihTOfObXNyMXYSy8dXDKAMGufbxMWHVJ2votFpSBJvt/H+P1CivCs0GersN?=
 =?us-ascii?Q?c7nzfO+MQMJxXVhsNiDoW0UZ9YIRvWLyygnBfzjChiHfJwRxtJoreBbr357F?=
 =?us-ascii?Q?jXmONUlw3QOqB+ujquyavD96osm4imDhULfys50NCiGYec6mwQ2w6IVsB2Ar?=
 =?us-ascii?Q?03Qn4C+GEFNB20XiiW2/r7tVyw6S85Aqi2xuXsa77TaxLn4ZhstDRJ60blbf?=
 =?us-ascii?Q?lyK1eFaj/gmAZMUv//3cxjRwjFuMWCzVCBpP7W4FWz2bpfy9Z6rL+NX4Bqof?=
 =?us-ascii?Q?iV9g824Jp9mFi3oei1hHaHLucD1NYHzzAzBClavXCy7ZcZGy7fm0kZhNgb4w?=
 =?us-ascii?Q?dmdd?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kIXL+L4K9OAbrSWRYlYdgQla+d89eNZu54UQOE2OJ+NhX1tQWEFNO34TkE+y?=
 =?us-ascii?Q?EHR/A3qPJ+Oahv4LSdmk54DiQHQKmXzMEcN3nNZQ00kkJlYQmoUjI1KMf9Sh?=
 =?us-ascii?Q?Kv2gn888BhbU81B08hfP/t0u2lIwa0qgfnQV1XHFTk3R4M7zZDybjFtNQskP?=
 =?us-ascii?Q?gtFZl6ul+fke1JJUtq4chNnDbZ+nPqAoJXjv3RvaJt2pz4e/i0yn/fAVPMyO?=
 =?us-ascii?Q?HczSSF1DErJgG0R5RsCDZYQc6DgE9dKLBgzuzFWNlIEQwb8WwvKBVq5wEa53?=
 =?us-ascii?Q?pJN9HMymsD5F/SniLvpVCsTmHNRrL0puZcLdIud0NsuW4iQVQ0pDnyHQWpo1?=
 =?us-ascii?Q?xRb9xxgwh0IkFdDUahCb0gptygTRMDpYtodUcoeL8Zd5jxghMAjZZvHVThVv?=
 =?us-ascii?Q?duXSbNVw+OGtCN/YRx+g35iTUF6p//ksSz4V3ob1SUBInWw3K77+dk/eXh59?=
 =?us-ascii?Q?U1eBfMon2TtMpGlS0I3P7QA1HoqJiEoS+Gh8k8I0puA2XAK0sCGMjIiwf1IJ?=
 =?us-ascii?Q?GlgRZUQbJf1rpvO7Qcx+i+OCQ1+3j/tRmukx/zcqMHVJH0ZsInLmOsDLikKP?=
 =?us-ascii?Q?V2rfot2K/qwFSTS+xSaKm2Me+ySSWx3pFo94VaQDyT5pafCzuZgbfTP5Y43z?=
 =?us-ascii?Q?PUh3/YfK086Bo1CygxVuAR3bc1Q47uTLbTa7KZb4NUfXhW1QaPPRqB/MtT73?=
 =?us-ascii?Q?ceLJeJwQiesKJFju6NPbV8TsZFO80vF6XHnsulH2Q7d7t+HG1sbERR53LPwY?=
 =?us-ascii?Q?bLh12sxFw+Oa+yAUlKC4px+FYSubBrWQVk16ArqFELNjz0RfZjLiDDtqSRXe?=
 =?us-ascii?Q?cyqyVKTPABlslU3ia9nPJxec2qiaXCevcCeSOOP1jDf/pQLDqdL7M+qAeK0R?=
 =?us-ascii?Q?Sh6/rG8pm1af83rwVVdNA9S7BRQwsw0hzfPrciSZtvtYbmsz0QNwacBpiHx7?=
 =?us-ascii?Q?U8QFwBRCCwZ4QwWf3nULrWNyq/rMdknM/2m6vGWLFmTWb0zJRI7ZCi8O+ipX?=
 =?us-ascii?Q?LtnHAxlqEhHR3LM2XHi9NNvWkQhpy8vgGhlZLM8ubVuNmBr580RNoYCdDDu/?=
 =?us-ascii?Q?CLpRqS/pdNPhONN2hVWa85PG6hST1IRygcDJWRJfY6sLIk9ysWdiSbN0SrCq?=
 =?us-ascii?Q?EspEuuc5Ce0W/sVZOssNegdv/Ua9TBC+6xBpXeVNBkgZUNS/jZeCsnHIH/TA?=
 =?us-ascii?Q?2VFg/HF5gDm1jNmZHOIUhoAl1pzntR/NW5JFDjCb9BtYttpiw44xmMnx7js2?=
 =?us-ascii?Q?Rv7gpaRn9SEWpVs3p+0wXebOXvb/GeT+Qr7dI+9xe7I0J/JSTz8K/EKMzOu6?=
 =?us-ascii?Q?94MRFnD0CgupEXFHSzqtzw7j77wQs76ocLRsRbH16ZqjH+b9JC2bcyjmYv8v?=
 =?us-ascii?Q?V+M7b2A=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4606f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bee573f2-fe63-4c48-d8fc-08dece060d8a
X-MS-Exchange-CrossTenant-AuthSource: SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:24:12.9247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1372

This series adds basic device tree and binding documentation support
for the MYIR MYS-7Z020-V2 development board, which is based on the
Xilinx Zynq-7000 (XC7Z020) SoC.

The first patch introduces the device tree file enabling essential
hardware support such as the serial console, MicroSD, Gigabit Ethernet,
QSPI flash, and user LEDs/buttons. The second patch adds the corresponding
compatible string to the Xilinx SoC bindings documentation.

Changes in v2:
  - Add missing pinmux configuration (sdio0_cd) for MIO46 to correctly
    route the hardware SD card detect signal, resolving the automated
    review warning.

Liu Yu (2):
  dt-bindings: soc: xilinx: Add MYIR MYS-7Z020-V2 board
  arm: dts: xilinx: Add support for MYIR MYS-7Z020-V2 board

 .../bindings/soc/xilinx/xilinx.yaml           |   1 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts | 232 ++++++++++++++++++
 3 files changed, 234 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts

-- 
2.43.0

