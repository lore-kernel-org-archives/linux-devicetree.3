Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA6126C03;
	Mon, 22 Jun 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136213; cv=fail; b=HWocAWgyoPJFFNH2TyOnWDeEWP+IcUqUANnsnWapgI97Mkb3b8CgeSQash+TPJXqITs8UdyYKpfUYrAAE9p/I+JnejfBbeQtqjrUlRBIscb3L2i7xFUQoVcDgAeSirI/WElgIJUomYPfqmy6jNDJ5HrZ5nCaZjvVLb0WVn5GVCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136213; c=relaxed/simple;
	bh=PJyEociuhHbkN0gcptjWB7VJM7DWOqlLdxGO15hfgtI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OnOiNGVqyPbGdqXOE3z+kchpoeuirm7QMMQQS2hTZUe8pBvZ5MDIk7mAPFKHyKnUaAyStAvDRz15oArlugggoz8BNW/IyMxJziAD9UtwkrcRsyXqEx4qamxf1MhG6Wct639EpBaUkr9rQXMy32hA6BOBJtqCogeymttwasPcVlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ODbPshhd; arc=fail smtp.client-ip=52.101.61.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ODbPshhd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0QkkpIgC/SUF2UkQ0/Al9bkvuOvVlqfm9EdveRSHOJe6TBXAx5SIGFbF/Yp+b+Q6LYhwktDw3CnYRPW/PqWLyuhIJwEv9lMhnNa2D5JQOKwmSPaM6K4AHFcDKjlUyJUBNLMSXLi7iOzxjCQYO/jitELOYYlv/mzh6oM+jRApZR96+wwiCviFrEZHASh8NzFek7jI9cW5DaUpC9gRCEfwrmdOKD2dSjNCZmSGmE/V15v3VrxTHLh0lq79wsEZYd14iI4bDQdVbYbNttjblYfgmh+f0F5ijKykqsdNDU6RFm3BdLIIbGh/2gHCQPrfV+z66aXa39HSl1l7f4lml7gRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdxkcAyZpucqny036kSHAsGpx9mfmkl55aUN8aflP1s=;
 b=BteztV4LAU3tC9NKbYuiCGyYjhYrrX3T5pa/s/Xt1LD6Anja4eR8hi9vNcRXwFLJUexVOzOtKx47q9NHGf/DMpKitC2qRl8a+6o7capt/RzGWpjboCks1awY6l+VdW5yNJxhDld1anXirG42VIzn1VBWjGNUeLrfz4BGj3M5HNaCcF+QzWHR7hQrc5FD6N5/wQmEU5bsM05AE5Ttb7hfx7uv0TaJ6PXMBqFeCkEj/SpmwpoLeSehpwN+mY7/B7QfDGndYSc8GEoPBDythMAcgICuG6hZENGldS7LxsFDbSn4d1spqRQ0Uvytd6FrQw7udGWG1iHgrmXToyT6THTkAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdxkcAyZpucqny036kSHAsGpx9mfmkl55aUN8aflP1s=;
 b=ODbPshhdM/TbOVRkMCpyV0XtTcBovqkIEEUv1SmMlaawFNquwdDRi5RcKcJqLkut4t20Z/7wreOaeQR7qjEfDz1Y+xgAqm/n3IJU6gCRVRR3C7uDadlcyok1cTBbVlRARTWnKL9L4XeNN5f/3Rr/CycjcRoIXchGOanKkxEuEqxP1JiFmkves/lhlQlTpPCdfQE8qZ7OmUPa8VukW3bM++s5ITATlXiyagihWoxk6bGLRA1Sj4nOGrhPxTSVJ1rhhFa08vzlD2prsZ9OB5+fJ8ArDZMCBr6IGuizUZCOxQu1sANXqQ+b0UW16td1Bsybx1Ym3FpFU7/xN6r0gzXrvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV1PR03MB989611.namprd03.prod.outlook.com (2603:10b6:408:2cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 13:50:09 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:50:09 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 0/2] Add FPGA configuration and partial reconfiguration support for Agilex5
Date: Mon, 22 Jun 2026 21:44:44 +0800
Message-ID: <cover.1782135785.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV1PR03MB989611:EE_
X-MS-Office365-Filtering-Correlation-Id: ca76901b-d59c-4479-2dae-08ded0652c89
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|55112099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Bqrubz6reKMyIJ6R8Phn9NHF6lL62CxtpsDkdRvFEemq73OhHqJwEW3rIGme/m6TiFFrY1OYtz53F86B+Ljzm/Pm/VMRjiIUEXofPC9pkbffmfY1Y3thmYDEo5abqK/r3jTw//8qUl8Cup9P0IrdP8U0jfeGLtdyLzyDDvGyxAUOpqbcmGDCFNPi2E7dOpLej6aSOJ6GMHZlQUJRjGO0VCO/x9lJQ8Tuqx0Bqz78IScEapCd6KgVc18K6iuzvTKCqBSeumjsKsNvdmxZUwr6rX61sPjMkaCFOU4/biKgqWTKaY52jRwBjmUVDTtKE55v2Gw8Am0Mso+O2mZPBTCD8Rc7IS4tVsqPSMY5EhDRQOFvPBrI0An6VN+eyvPW+Kw3cZfSUNbfBfaXGfYrHgryPSiGl15TjEtyAGCiWwI2qms2BEBfJkywN44nZVW+ONkM2br1DpeOG2NCDbPyplDQWfQNwQsf3Y5Y9JClPzet1ig5iTgshIvrslde3Uhi59BHna+ZfZ9SdQkSilj5C7F2znzYOo686p3Csm50FUYIc63VZxt1WbLR0LHfUcIT6EkDk/TOxFo5pPneXFA9NcsJwMW4vXmUgNAEaEy4oxtA318TocyNXyjg2y8EiyDbaOYyQGOtbXfF+qZBbBx/pudeBcYjTFnoc2osmvMn63DJNb4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(55112099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UjfjazgUvar3tjPZQ+E4aiog917Q8FD5gTn/sf9bjtUe9U8UIyBRLM4jmPTX?=
 =?us-ascii?Q?CrLyC+OZbei6RDH3ZHAhLeaTRnSTp4AI0R39vWdq7w/r6CHFC84AbrhclseG?=
 =?us-ascii?Q?Shd62S9SXufX3IcHWZR1vPAFvuPIvp/4Chfa6dshdLDYptmCYLxpYj0gtTMY?=
 =?us-ascii?Q?ek37/xNE1rQfvZlBBJtjQRX65NvpDbpEXeaxVlk8gBn/xauE3/DV/joLG9fG?=
 =?us-ascii?Q?fRzIuJOyUmO25nRRKULOkYfC5bR6vsf2YoXHu5ccFeyXadBGLaSn+eX95Xrr?=
 =?us-ascii?Q?Iku2X95uhrbtn426Q4frp13JNoSP/tYwtxNACJcECZKvzrGxGxoeli/2VoV8?=
 =?us-ascii?Q?TonoD5MwMy8aEJ5QBpJyHtRpxIFwEybQu/n/vlS5+vzK5PwBa4PSgU1oKrk2?=
 =?us-ascii?Q?W+HWOjWCsmwn2iciZjb7CGa8l7lSZaNM6T6hg9QjZ45Ky3QmKSm9En+EV6DG?=
 =?us-ascii?Q?Zj6TBTR3M0LRmLTB4qo9P88tMwYOhazFoEDC0vPNgCGlSjgLzWSZihh7Xc6E?=
 =?us-ascii?Q?7C87xfF2j3LZxFvBRKP29YHWGUHFVtYdLMQtUEe+ftkbMY8IR5rTuKZaUOtB?=
 =?us-ascii?Q?wWYxRY+JtkTwuSc4lsZ6YaoYhccd9M22DOLviCfSdOV5ZGNV5Iv0ZAHqbzEl?=
 =?us-ascii?Q?mpAMMtlB5pdZCAhxJYJ7E2RqJ+R69vcK1FR0YECcqAyVuWO59CXj3csyeZKo?=
 =?us-ascii?Q?/nHWNPNHXpzs8qwf5NMh4ysGT5GLmymE3RYEF0mDcqeHkLYnBQXSj3x5BaJq?=
 =?us-ascii?Q?7Hny8VH9Fd9M9u5is+Gxy1DjzmpZsbfEejHe4I3YJruCYQT+JJQUbiPsBeiV?=
 =?us-ascii?Q?OCimgj7uQYKS5qDhZ1ZYkScyzEYGYN0t61KR4dAMs6GaxuK6JNTLUJtQfiR5?=
 =?us-ascii?Q?A61cmr7BZmGci9+Lw8xABZA0l65fE8e43ymi7h/MHU9e8TGxc3Kr55/F8u3O?=
 =?us-ascii?Q?E+s1ZuiZERi+t2KDSKOLiv9OSgff7LJyqCbrJa9PMmhngGOw+gVewoteKWYD?=
 =?us-ascii?Q?wf8KwgF/6VeR84NpNLI5SrILN0vQycIZj4t6zLPqbdZ9mhhd96XGNq+Emw96?=
 =?us-ascii?Q?dgwswo2c8cLuAXMi8Ir33zMug8YxEBD2ZUN4e/roXGN3WcM6Zrw4jO2bWUob?=
 =?us-ascii?Q?I+jioKtrW1Q+kyz/PdQviNrAJZDQrGCzGwMLKIsqjYpaQvOT4p1ja3fFav2U?=
 =?us-ascii?Q?QEZrg3sqY62wpvfIif3ORkCcfTKN6NkQiiJlbxr+YCIHtBw3eqN4qKKsu/Nx?=
 =?us-ascii?Q?cFE2nMGdQnqyPt/yIn/4PWJlIe1FGG5sOKNx4RyBzt5TrLCgRof0TVvrGMk1?=
 =?us-ascii?Q?BUX8DeCweEwNfBqz75UsQZqWf6q5Mbo3w1fP1Vb4vrtCjWQnrnzJwhY3+Smq?=
 =?us-ascii?Q?gGSbPOl9ZYEjN9n1RnjYuow1pYJJ7pxu2j6HSzpYX3NyBhFwHvAtBF4ug342?=
 =?us-ascii?Q?31D/8cFbquc5U4mFY6lg3GY8Pv4HkvnT8YPcDTnAWX9CSc3+wPkLqIH9zGJO?=
 =?us-ascii?Q?GnEpgKyziKm0DA5mrapgz0oCsEeIOFgVRhlc8LNLISGbeoZqkCA+Uw3FgfcN?=
 =?us-ascii?Q?ReKBahu51ewMXoVKgK69W+xHJgHL+RGkcFAgloDB7Bx9Gp+l8c7YxqYu4TT7?=
 =?us-ascii?Q?JwuHXO9her1rhspwyqiRi7lkgcHYem6OF9r5rjCQfMmtn4cTKLDFJDiHLxKy?=
 =?us-ascii?Q?ij6HVaj9jZNYBgSgRd1STP/8vWF64MJlvra5Zn7S2R9Fn0aW+qcr417Q6SFO?=
 =?us-ascii?Q?Je4V+h472Qx64hkzq1aYRwT4h50IuNY=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca76901b-d59c-4479-2dae-08ded0652c89
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:50:09.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QBK+AVvzVull+YU+j3tXHIUWiNWLL8Y9LF49Sp+kCBAMbO5wGHZGmUKCiDwHY4lh8ag02qTG8lEgIP1gIw2pURDPuJsCyGyxxIQXHwOppw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989611

This series enables FPGA configuration and partial reconfiguration on Altera Agilex5 SoC.

On Agilex5 the DDR base address starts at 0x8000_0000, which is
outside the addressable range of the SDM. The SMMU is used to remap
DDR-allocated buffers to an IOVA within the SDM-accessible 0-512MB
window. Agilex5 REV B introduced a hardware SDM address remapper,
but it must be bypassed so no additional offset is applied to the
IOVA, keeping the implementation consistent across all Agilex5
revisions.

Patch 1 adds the fpga-mgr child node and fpga-region to the Agilex5
DTSI and enables the SMMU, which is always required on Agilex5 for
the service layer to operate correctly.

Patch 2 extends the stratix10-svc driver to support the new
intel,agilex5-svc compatible. It enforces SMMU presence at probe,
configures a 29-bit DMA mask, and bypasses the SDM address remapper
via SMC. The driver adds 0x8000_0000 to each IOVA before the SMC
call so the address passes ATF's is_address_in_ddr_range() check;
the firmware COMPLETED_WRITE response returns the raw IOVA, so the
offset is added back before the svc_pa_to_va() lookup. It also
fixes a pre-existing list corruption bug in
stratix10_svc_free_memory() and adds a devm cleanup action to
reclaim leaked buffers on driver unbind.

Adrian Ng Ho Yin (2):
  arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
  firmware: stratix10-svc: add support for agilex5

 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  12 +-
 drivers/firmware/stratix10-svc.c              | 258 +++++++++++++++---
 include/linux/firmware/intel/stratix10-smc.h  |  23 ++
 3 files changed, 248 insertions(+), 45 deletions(-)

-- 
2.49.GIT

