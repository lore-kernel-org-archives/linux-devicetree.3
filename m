Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B1340D56A;
	Fri, 12 Jun 2026 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268979; cv=fail; b=j0BdUOibGfxFMXTvZFrSgeTFGrEI3DNYQ4YXyIHlA6w3dlzNlpZpnBJtUIGH0KGCkOy2JIDXfUvVIhUNLNoUfMpRoTopHbtVWFfU7DAmHf+XoknDXRAFe/Qq3GU2MwncWwQiuVtDpxg0a3zjkPCynTBrrbSaja45/16ruuakdoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268979; c=relaxed/simple;
	bh=0QW757vzRH4Vym1nI1BXWsTKOnryfBUFMd+ojGmrXYI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=cV+l+VUDnNg5al/2S5BzUEKRFJARTKpMCpdizfmouXIq0r/mHuSokg0zBttchxcpFSjcoyGkz8SvAjnZKFQ3JL62utIJozbEnYrv4JpsUjPMfxYjAo72WwOnus/5IYrHG5N2n/o0wyp5H2mRKXECBWcQawD9NNO7ZTtJlePN0yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Y+Krjupz; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Y+Krjupz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJARFJHiGIIiUjIl3UyLhiho7IIS8iPehP2WQtbq+21mkc4y0SlQsMwjO+7BGEoNyKCS4f3N30MERTobj3pvjwJlmD5iuZ9dn13sFoMvlVqaAdWne+oNXaXWWxO1TJj9hQjmV7ZqLLEL6Zbld4EXvUs+EUyPE/bgwr5xxXMkqEsCXLMis9FHA7XR8K1v7RaC0nsnv0MiPLmzO2l0sF/laJGkGZnPEg94qYssCMZkWfJq7Y78dCGrJzjqH5l6gGBFUJkrGjo3XrWiIQczwmJ/OZbmq8x7clMKvUXL91DlDThxxmy71H3zun/xncyYxX8tpOpOuMDEOYqGjo+o4WfPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDi1MyxrSLUx6GyqPfPavwF3oH1yQiqEJj/415VwtX8=;
 b=V5xPkCEGoN8iSBxWR05yVFXNy3q1C0icLBbUbITc1AzB4h1YjdcSlgqQCRGR3UgnJYKCVBZzcgF9moafeK5Js3xyrWZFf37UndqWVfOnbDWvZxhkjStDEn+wvEbT05FctXVnBqd0swLgGhPyxPgI3LN7dUIvqlusKZjouaRMp6u7F/icWAPrazvneDgzkYetsN53ld+wTNhTnMxbk1NWiVofIjXGqLb4QA8i2sPtjSofXs7Yx+4+ZTLe+bdM2ZzaGnIS7fNkMtYsvezXalnhrISyAYuUyfpc/mqzv3KryxHXboykSi/+tWWSMAhngnBhpzqbHReHxnBFvIpeP+rqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDi1MyxrSLUx6GyqPfPavwF3oH1yQiqEJj/415VwtX8=;
 b=Y+KrjupzucNY42rBgLiTFMrd+hoQAv3IFHwArsYoMv28l0kjJjhQszMHkFNRe6vXsw2fl17K3FSeKPbGXLWWK8D/j98iaFKeTVjb91sR1E+3akmX9hRemghyIptOkrkw6T9oIGNmm2Yui1DCE0Zntq+FqbdugrvdMKcGSokpZ/M3nLo+DiPaEADE5nnEBDirZN/mSjtVHvm1mcCg/P5q+6kmW0639+MXSNtEA6FvFyJdR8UjGQElgGYu/OKl3MsKt0xShoc4Cepo+aqXj8TVAdV4LX0LuQFtO/jjd4fPm1OCGUVLvxXZjYepiDs2W+0SRgWaKjPAise8JBckW8ZJnA==
Received: from DUZPR01CA0206.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::21) by VI1PR10MB3341.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:13b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Fri, 12 Jun
 2026 12:56:13 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::9b) by DUZPR01CA0206.outlook.office365.com
 (2603:10a6:10:4b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 12:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:27 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:12 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH v2 0/5] ARM/arm64: dts: st: fix node ordering in ST board
 device trees
Date: Fri, 12 Jun 2026 14:56:01 +0200
Message-ID: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEBLGoC/3WNQQ7CIBBFr9LMWhrAlqauvIdpjJShZSGYmYZoG
 u4udu/y/eS9vwMjBWS4NDsQ5sAhxQr61MC8PuKCIrjKoKU20iglYnJ4J0zkqhgX0dnRqrO2Ug4
 eqvUi9OF9FG9T5TXwluhzHGT1W/+3shJSDNir0evZdr25+sTc8tbO6QlTKeULA4Jqo7AAAAA=
X-Change-ID: 20260611-node_reordering-4b9b132b007f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|VI1PR10MB3341:EE_
X-MS-Office365-Filtering-Correlation-Id: 82752a1b-a070-445f-36f3-08dec881fbb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	TUj594l8vFYfvkEQ6/oLVKlZ2sHb1OJ8gJZBsaWl0fNeuFkUwTwN5uaJQ/0f0sA6v0rjMksEOhlxTFs8ecBk8g3Kzbt6k4/v47YPYDnDk1oUm430m+563Q+EpEE/AEtUMCYjBcQ7badO6LpDmwcYkfwQtewxKLtRH4dNx0l/UeD27dhPyGbuBFnbDKUNrKwd46xQb0AgMUXPcSU0N/wz/8PVoMZS/dBBvMF9gbLkLt7izFiYNXCky1KqFV2RPwGCPanjzuVuzF8J70DqtRU3eXcYo67f6puhpYRdy99Q3RnhIt7ISOMtUUUstXZvs1dL4LgIXR2ybaRv00KOpyJniCm+IM+tUBAJGrYBL1p51XwlJ39bmUC+Xkm+qMMqUxwFLM+W6w/0FEhnkFZsbh5P3nsEi6sKHZfzqIckWAjPz+JixEzHiWs9gkLLXIqGyQNmy64Y/m42EHimaXIJFZF7lSA+FKO9SQTsdX9oJTpRqELepysW/NR5z6zy6WHCtUJBqtuViKRw94l28in4Tg9tSVz71Ftez0F1+Cdrk7MMjCgWoTxFEo1ZJRNYShkkKtqTmfuz/wCIg0ZobWSYipIq10egUjA8fno7xmFzhB8KkcsjUNBdc4WL1YruwIs63XFEbXa+Hv7PycWmMqOFwC84v0bWb2M6bAgLCYVq2tQvUX2MVggPIAUHdCJdwuH3wXdXuvHtl11w3apTQaBhzoIEiVd76DH72CLJZKXvuwQSsqA=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TfC8qMInxvbYQD/iwuAoUuo4uoxQjpO4OqBbQwCHY271ymHK4NkdCpUiPSxbcyK4upKXruosrIpuYEKFUXHFx7v0Y7T7T8tzMR2E1Mhs4f00tIG8RIAFXWVYsl1T+PItfabEoLwAxzTz7/gempu/NqNxs67rD0b5uep2ZO2Esl3lEOs2+et9YqDhGihJ1HorxiMOnbCvQtfPLPV06Vhfbb/5VrMhmQwJDw4jS9R7yKUqIYZFyEQDaE/98eMr5rQtVJUqko5nc8d6lGLbTiLGlvJ7q/Ki2jVr12AJlj4z/ZZYu7hGpDFs7LlR58pHX5lE/h0dC2PfGXY8yP3FaFOdlt2yUQn0sdKqgtpQP+ONs9EHV3fFPQt8E2dz1rFT5DG1bgy8Pby0yzjQmu7JWjn/iCxfFKDogbtVltC/SkBrSEExZHqzgbc3SlpQzPdkMbJl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:13.1363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82752a1b-a070-445f-36f3-08dec881fbb6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3341

In the ST board DTS files, &label entries must be ordered
alphanumerically.
Over time, several nodes ended up out of order as a side effect of
adding new features or refactoring existing ones.
This series restores the correct alphanumeric ordering across
all ST board DTS files, with no functional change.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Changes in v2:
- Fix typo in commit message of patch 1.
- Link to v1: https://lore.kernel.org/r/20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com

---
Amelie Delaunay (5):
      arm64: dts: st: reorder ommanager node in stm32mp257f-ev1.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp135f-dk.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp15xx-dkx.dtsi
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp157c-ev1.dts
      ARM: dts: stm32: reorder mdma1 node in stm32mp15*-scmi.dts

 arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  4 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      |  6 +--
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  6 +--
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 56 +++++++++++++--------------
 8 files changed, 52 insertions(+), 52 deletions(-)
---
base-commit: fba4a31a7f3b6b29b01c83180f83e7ed4c398738
change-id: 20260611-node_reordering-4b9b132b007f

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

