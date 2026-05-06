Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F544E047;
	Wed,  6 May 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071353; cv=fail; b=M7qu36ZNWGlcdW8PU3RZYv8ZZzbC43W66DCIW30N0pjpXKuW4SmZDmCvKSHOMVsCmq7kgD1NOSo3dbqCCzyKLZ1IXOKCbXZsRNU7GtGPPUUpqLa/SqnNHcJr+gPv0/Au+fcqMGuqvliS3+0o1nAfNKdYoQ7oNPoBKLIzhu4MrTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071353; c=relaxed/simple;
	bh=pdZXPFBsRKgR+2WS7q1UPZUl4yNY/KKTt/dZuwfZYfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hk32vFvEn/v8mKKYD61qtYARczCwXEZFxThn9mAkASb2gANro7gchU9izjud+V+cNYnB36hzkjh+rjBxuvfZO7Av4LQt53pY3dOwYNW8FgVrMj0M1ZDDEDDeOnOv7xSVc00wIP/C1ATsXRu+iVOMPBCbvLMmIkhhLHQwtF723L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ntqp/9Fa; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ntqp/9Fa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahbDtMR64OJU9Nqyzh8xCFVnrRD5HCS083pt3z8EoB1kiRFNide03elOa5ENDL/SJmx0IHpoN3gY9M/o1v7JCSH/PSp7VGbDlYKkq/v1sCE8m6vQ8qAdME+tqrNjRUgbAp/QKn7G6Wxj73h0fkHCUl/TrwPqKGnfGPJssHMgSC3ZAtlfmTN6rRg84ARwfiebfzfJ05iLah8f2qYK+M2s6MCKHEjNFyADtextUzwvY93Bu9xkmsGdlFizK87LLf90H6sDkxvJK1LENNe4GGY1VObKe4MTlk4g/s/TizswWEce5HdI8LxmsF1iOXuNPOyyx/Yn3oUL894xaH3Ef+tnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CnfgELJ+PwEuWfFFOrUB/PblzGa+pjIqTQScge9eW4=;
 b=WRqzN6TRTGCvaVSwuImP+KfEIteh7+wqJSnQJ0vKuTqrwF2Iiui9U4oIGGa6OEHlVwPCsJNuFUJlCbrLewB4OzYLBY8wCDwbaF4lQt0vnKanHbRi16au9xb6peAFh4H4ng3Z42kQgSSj79/adCaz4ERlqvbtBNhVOSX9gYgQkP8wQbJw2ASdTF+N8FFPP+M8aG9gUWzuDP67vDVYet+zdzdlBst+Vo1Aqz3IqCSCNZDKBZ/PPY9XgQ/TmCS5DL3g21KhYW6MyPfMFFeaYc1tetsh3hYo2Htw1BUMJ58AoqEw+m61etP9HdIl3or03hvOVDBxJax4IMI2R3qTnpHp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CnfgELJ+PwEuWfFFOrUB/PblzGa+pjIqTQScge9eW4=;
 b=ntqp/9FaX4VISpocufjoTDN8dgx+o9PF5RX0Y6HFAsjmzgbtALLV23l0sS5Gy/pp3w/BOkPAqoZWtUhUveN5JZn3l2g9k/HFWqf33B+SeIJHu8H/FCor6LcilNt4zjwGPgQZUhoY+OpfiLUio91asdDlv9CfO4kf4vl70a8jM+Nz6LXXZOMRmOU9yFyYwG6KdWOA8YZV964Z2blxCh6PP4FBCQpX1lLNNM5xH16TxqUCub3QMQieUWTG014V+Fa0WAcDs19bntN5dGrveGOZwC2aD6PoNGhjoDkFBW/UkcF8EkqKho14x0ueheO2CMgVjbETrJfHhZkIrZUXnVmEnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by MW4PR03MB6948.namprd03.prod.outlook.com (2603:10b6:303:1bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 12:42:26 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 12:42:26 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Tze Yee Ng <tze.yee.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Subject: [PATCH 0/2] dt-bindings: arm64: dts: Intel SoCFPGA: rsu-handle on svc for U-Boot
Date: Wed,  6 May 2026 05:42:19 -0700
Message-ID: <cover.1778070377.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|MW4PR03MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa13bb0-0fcd-48d8-bc42-08deab6cec40
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pqk0bFuwDnK9mgbXfUPXfSc7po9OTowIj8eUhvSqwzID4QhG/V8GEa7HzADbe4hWPhTnky1FdOr7xLg5TMUMK18ZwymLyV/LbKUVHxr87ki6mYUddM5UD+3LPzIod3nDvI9Iaer7sd/JnMYnT1uUaNy55IM8MWSBTJNIKttHS7fa75WPqABRRImlKoCs8hRRAgFVD4uxd6rhIj8BUf/IXOselqMmDMrFII6Zomwhjvn6gqASm5fukphgLx0AIION5mXFJJR26mi1LmQYgNN0NhpXab6hwGO/RGxop/OSf3v1qXh4Jsiyh5K+BezmwuOVf/u+SbHiwT1boxUahmoBPuhLTFVwmUoHwUyInz4DBqIT3IdgpwIvvoHgfUay0lLNJ+w5yGh4M0tjzANk+KOk9BN9RtWRDznfO868DAn6+hT3G/we2XdXnT2mxiNtWeU1vpMJSjUR1b9RcsMykhDy4Rwh4+MNc/7yKiNNJ2rx+orIVeCD+xpIZc2gZ+19poRE88aPfFxXcqN16jGQAslqGyrqmhea+gDgRjil0uidRhs3p9rhxvnAXI1z1aIi995YJULoHzeRI4Cj71y0t9j/nZazYc58VuHFC4qA8J+x2+YetxW+23rXDo5pbwUd4ZNeNxHLeSXdYwt5akTvclLMirqOkl0BUSEg3Gu2fFoF9XtP3DGI1T9ED+1b3DC5NG7S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MVXHlxTANPT68RXLa/zanBEA2u1UOiZNUqeLr13dziS6knRgzgPgunwunGdY?=
 =?us-ascii?Q?2r6l53JOAa8zC9brL5Bj5uhaBAB26cOHfTpplTUqdhmoGG2zpToWe/uOYQWz?=
 =?us-ascii?Q?7M5pX4TrG41KBcFEzGiSYZf2sKAmnkYVAyooql98QZ0F+YSdIG6icQ9g2FeL?=
 =?us-ascii?Q?hQe9hsP957O/AxkW7OYeN3tOfFlsiY07T9n1gngzdemUDo19tdNqFbjUqAA9?=
 =?us-ascii?Q?8xs2T3ktjdwpNRcHbfSGhbxiCQjdo60aNpuVMcLOW6ubCY3F7QMXefbOuqPb?=
 =?us-ascii?Q?ppZrOH+9gY1dKH3hhDNKikr2iagvfYKNFql5qkPhPp/Md2dyZbeoJeBbARiw?=
 =?us-ascii?Q?vq1pqfl9MXkg/obeRQAR5VQfwm6BnfxLcyYvRxlAMO0CWel7J6tb7il3gTfz?=
 =?us-ascii?Q?/NR82l55OnljaOwJFh2JrPsly5unsmcEAguHJAn3N71bIEp6jeXL/Rafgehr?=
 =?us-ascii?Q?gHSyS4GwlTw3KN55eQuzEzbdqBXMVZGV5NCnTrwL/IAQh/P8K4ZBmrSBZuHx?=
 =?us-ascii?Q?G3ii9pPgkeMXlM2yqfnjVvX37ghG5m9wv9uqzpb595e1vCYfruFW13kuNAMa?=
 =?us-ascii?Q?/DOmi5hx5EpWfLVTxxQIVvy5UKyEFwdR7lq/LrT7datFiODp3XLMlEkCHanu?=
 =?us-ascii?Q?rdPe0QwVrPFS6JbXha79FrE9fm/1/h5616/+QOSueEEZAbqV4JcRwwCYMr6r?=
 =?us-ascii?Q?kSrHMjF1VxjTS/lGN+bCM2FVDqjXt9miB2XLkLufuXKSvsJmQ0nLyOXyh0XU?=
 =?us-ascii?Q?1hi06rNHOR6ijWS+pxevKjZ/IA76GPpklRSPjOCL0Yx8OdMVTzZMXCz4LPHm?=
 =?us-ascii?Q?c4ENyv8XXDob+s6fmh7sInEN4WKNrTMwNEdzVE+rowKg6bBGyJX4+AcZdmYZ?=
 =?us-ascii?Q?jc9ldGRxbThCU7HPHgPz3WWg5B2iO7twdpvZ67guAM75Az/53O/d6BiOVFFD?=
 =?us-ascii?Q?xK0d7IWxUNs25TWEikIjwzBU9L7lAlBFG/z7y+1uFNJnEDc7QYfCra5OMU9B?=
 =?us-ascii?Q?TAtrkwC5/5xrmV5QiczKR0xN+LO4H5YeGoakt0U8yQlfgCORuDpG+k4Y5tuU?=
 =?us-ascii?Q?BkUtH6HRCrOQPoQ9EaBAquKCsYghKHtlqtRGiLgLNo4lMSpRgVwUXNU/jZKw?=
 =?us-ascii?Q?zQq5R1zHn+iPGcfrpqB78UX5FBD8XvH/Eap7YFYOAwdxTRg4TXXmLl7cO09T?=
 =?us-ascii?Q?JiLV8DfVnuUdRMpsFlIKFT4/tjlPwCgg7lKqHDrG+jsdMW8X+RdMtgT6E01K?=
 =?us-ascii?Q?JZTp7SSnbl6EucY/DQxZfa/2AQdwi/3wMPBFanjuw+DMtFHIhCn5fJUjw4Tf?=
 =?us-ascii?Q?irY+yZ4x4w8frR4i7B6RMUt1jCkb/6jD9W+whmFkjnhALw50r7dy0psb2Owf?=
 =?us-ascii?Q?atap7L1zJTsogf1636NODDI343quC5nKoFtqKyF08VbWsdx0Rnp3qhPgsMwu?=
 =?us-ascii?Q?EVQOV3mVmcgtF3H851BpHYbA8aUCyBgQAJqXWykPiKeOlYq4DlwCR+V6eedw?=
 =?us-ascii?Q?DJzshKBGfBVWSQcE4PLrsHsuCOIFYVU4jMrIeQLscxoVZx3Tyf27NED7TN6J?=
 =?us-ascii?Q?qLMPmL83OrK6vG/IeQzeWx5eoQsBuxkomTXgD/u75qwMrlLYi4AXRgVr+lr9?=
 =?us-ascii?Q?i4HTSFH+UTkZHod6ughhbEfQizDU8asFM/SiHIL+yaMXZJh3uVIHFR54Z2Q3?=
 =?us-ascii?Q?IHMog3ufPY/19ViPKH8P40Ru9ZNCAPRPTSMAppdC3MLstuV7P7Rqgyv+pqtD?=
 =?us-ascii?Q?yjpxrLByyQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa13bb0-0fcd-48d8-bc42-08deab6cec40
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 12:42:25.6111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPNZYDlXOed0ThDUCpItIPgXch/fhmEfqPbpADdAD2/yJ0+f7kL6jj0suCLCFeFlEaZxIXA3HmHCOMR0Q+lQtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6948

From: Tze Yee Ng <tze.yee.ng@altera.com>

When Linux passes a device tree to U-Boot for remote system update (RSU),
U-Boot needs to know which QSPI partition holds the boot image. Add an
optional rsu-handle property on the Intel service-layer (svc) node: it is
a phandle to the board's QSPI boot partition (typically labeled 
qspi_boot).

Patch 1 documents rsu-handle in the intel,stratix10-svc binding (shared by
Stratix 10, Agilex, and Agilex5 svc compatibles) and extends the example 
so the qspi_boot label and reg cells are valid for dt_binding_check.

Patch 2 labels the firmware svc node as "svc" in the Stratix 10, Agilex,
and Agilex5 SoC .dtsi files, and sets rsu-handle = <&qspi_boot> via &svc 
only on board .dts files that already define qspi_boot. Boards without 
that partition are unchanged and avoid an unresolved phandle.

Tze Yee Ng (2):
  dt-bindings: firmware: document rsu-handle for intel stratix10-svc
  arm64: dts: socfpga: add rsu-handle to svc on QSPI SoCDK boards

 .../firmware/intel,stratix10-svc.yaml         | 25 +++++++++++++++++++
 .../boot/dts/altera/socfpga_stratix10.dtsi    |  2 +-
 .../dts/altera/socfpga_stratix10_socdk.dts    |  4 +++
 .../altera/socfpga_stratix10_socdk_nand.dts   |  4 +++
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |  2 +-
 .../boot/dts/intel/socfpga_agilex3_socdk.dts  |  4 +++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  2 +-
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  4 +++
 .../dts/intel/socfpga_agilex5_socdk_013b.dts  |  4 +++
 .../intel/socfpga_agilex5_socdk_modular.dts   |  4 +++
 .../boot/dts/intel/socfpga_agilex_socdk.dts   |  4 +++
 .../boot/dts/intel/socfpga_n5x_socdk.dts      |  4 +++
 12 files changed, 60 insertions(+), 3 deletions(-)

-- 
2.43.7

