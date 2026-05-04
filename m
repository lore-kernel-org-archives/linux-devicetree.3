Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11021117.outbound.protection.outlook.com [52.101.52.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C71991D4;
	Mon,  4 May 2026 01:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777858733; cv=fail; b=ZTVdTGQaZB9jIoW0/USoquyJ/WsnTItiM/uyhBSt89aBbJCK/7fCph+8y1BpQdaeMqOfgTSXBAt8BeCnU7Zx3BPJwonf1kRQgWz51ei0/jlYOkLpR+eFu6OnyuYGqMlrfHy3K9SlHyejFR0iHDM1/fuVTjjOhZJqrbHxSCwd4T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777858733; c=relaxed/simple;
	bh=OqcxSOIdhk069zvjSWRuDXF1g9yF0T2LeYdlTXuw+yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6pcjCXG87647zBWAfFxA1x/FjOdODBlU1n35ZLHgGFU8wP+So0l+hk2FSFdDYqwlFJEYfjAYmz4K8R1+wUMcuKlD4fvcbEMRJx5VSNNoMzRttWoe4uAkQjtox5PTOxI4TiXNlj8rOYatUZ7UAcKAJJkfhQDrrqPFt7eWyVXWu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Fw9VJu8p; arc=fail smtp.client-ip=52.101.52.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Fw9VJu8p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haNkDsznfQKIsTImARPpHw1+uL/yeZwlVOnDV6JE5ejz7Q3kiIjSMgPW3urAb5ilYKZWkfTO70J3WM4BYNmQ9caiOuftlbGIu9ETe+VJIBPlHXH/z4oMKxpipFyKMaA2aiLCEj5B0K2dTnAk3SddLD+wYwu0HFwY5GTdJczWZmwRpolnik1ikPl4ivqJUAvz+8hFCJ8HuSfIyBgEZuQllhhfS+WlxsfSrTMF33JO2A87pjQG6AzdHwhwZOLU7iDqrIbtn38h2IcL0R+u3Hc/faIPOQRzbZqu6SlZ9vxVx6V0b9Y+TS/VE5Hj2UOzlrZQxxzZUDh5Ba3SBOPtGzA+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
 b=yRZJuCSu7ssnyOo55gdta24jWeP5nGyt6lKT9qJYgwrUZW2pDpodGssTv6sN365pdN40LkywV27ZSuknCpYWk14hku7wd1yPg5HF7RZ4ax03az4uFdyDx+f3R/8lteeT8IWRWRmAe1TfpNpS+D1i/afuOWhr96kXd0W/5ypm/huZJF2PQlNQCZdHnucQdYXTWAySq4kftXrVtIv8DDmzRgv2SM4ZsyyQfbLmVvU58wDpoUp0uj55+ByD/6+IlcOaZAXs3Xu2zkMB+sosgDs7bJCFX59RZYk4njD7BHlJzK85w/+B+cE4d32fngY2UruKWuYh9S9ZFoNKW6PICWrUgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
 b=Fw9VJu8p+rBzfXmP0HU8eMjdm9vozXM/q5tOEtEG5+ESu197T3Fc62cTbccIkzdUPZBN3Eiue5b0u9adQ3iIqyN+zATDa3pbjMrDR6fqEwNheTreHgbFYMkRId881kYSD6JRaUzMDKQCpLNexCH9UptrA3QQFotU+l4brk/NfW5kRiObVdmwfd6uPNTInmNouvur+Y+ihSVrg8L7t8AM3PZt8hSWz3j4JfWD946z3LiJUGyvW2Eg8ho6FODd5arKvY8egsexQitTbiFqCdUnxRIFLgEi80Ns7xBILpu+/d1NGe+UtaPy1ZgZmdk8Hp0SAtkGeEWd7NFUEJYZAnd28w==
Received: from MN0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:208:530::22)
 by CH3PR18MB6379.namprd18.prod.outlook.com (2603:10b6:610:205::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 01:38:47 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::65) by MN0PR02CA0028.outlook.office365.com
 (2603:10b6:208:530::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 01:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Mon, 4 May 2026 01:38:47 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id E4E0440BFE07;
	Sun,  3 May 2026 18:36:50 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Mon, 04 May 2026 09:38:35 +0800
Subject: [PATCH RESEND v3 4/4] arm64: dts: axiado: Add eMMC PHY node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-4-3ab7eb45b0c5@axiado.com>
References: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
In-Reply-To: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=twei@axiado.com;
 h=from:subject:message-id; bh=ifJe6BWD6fxFLW7464vvxiIMU26jLX4+q7GsF1xfii8=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBp9/imgUinpDJX14V1CzjxLphTjoOP2HvAR2pG1
 EAPysVL9xiJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaff4pgAKCRB4EDBdxFrx
 18ryDACuj38i6Y1mevnGXobi/pkdCVNw7qH5n7A967oMJFnZ395kBPMoYdQwzS2Qo3StcZK8eHC
 uskHvUwYUwL0+Xr07mrDQyw3fjm42lgtBvSDknWVqc4rteBOeT7GybKl4xXyXmP6ITkQqYpOf+q
 L5FUdoES7CKSJ6bw7tsdJ8YdI/XoCa2fqdulNNL5DheTRhpYV3/6+la5GIcnA/P4jvgMnrkQhHk
 6iD4dgH5S2W2ePRj01NwQ8g78Z1ZbSjr9YZrG+gc81XhU/f4u6Roo0SKm6og+1E4Q8kpR8/lsqN
 X0KpMOwmqiXvXbSEzEEMC1OE+wgU1kNIpEqVvdDhdrsaZ3VP5y8LJoisxSCAqYS5EEyaZBcqoPn
 DEMaqKPiDBEQa0ALJ5fzGrnbCiDENpGKRT6Wew1u6PR16NmbplcH0n2bUklzZD4v+AVShHXJLM+
 D/THH2l/0WdbWos2MbgTz0VBi3s/vB1zxFlxOkC6rqpUR9/kz/O5MNHf7K48ddTBiMSxw=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|CH3PR18MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ed07f4-e597-4376-4edb-08dea97de2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|42112799006|1800799024|34020700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7UfVm++7dg+p4GBP2wG66ikCosIP/qBqHKKblAKIWxGE1/0OztKU70ljx9XFBKarAQAsAbOHxLKXArzTQqBAUzt4BfwXOpFWZDjHFk/CE4r5XUM3hYmt9JBhvHyIJMkL6bezt5W4ub2+TqEpSGkXyLYwhvQxJcT5HNJu7zeuhnq+Px07qE5Efc5sSr/kpO6Ba5m6LvMag1hmnjbn4qjJiPxXYdE7ENI5JXs+e1znNtp4pN+421tGV55kbMORTs7dPIV0TzFyGjpwwXIo2rFj+2b/mqioGrwBJ7GJyTyIAgqpcclAcRnOu1Gt/3YaUU+fpKQr0p9QWcAssbQHT5cLl6QKlLsRcmA6QTttksU01gWWxW06J3Mh5S+phKmmHb0yPpl+g4vrAHadFgYBZLHBL+EASUgFlThbRLZSGSADPaWPFVhpmdX3avqUGvGy/fo43aeLcvXNCY9sAZgRGtlIoeWmy06y8JVIF0yduCWYQdNepwlt1AALmK/ueCk+aEeRCJ7DfsgAmYfFn27NNujDhDB2CHB983AFy0pyCqiAGVmM3QKEPR1hBPea/XiXpKJ2T5cNrTZq/Sjxn6xF2GFN/r12dODtojJz8luTRLsKZYaf8HZx2dYL8xXJWu6Jz6U/wObGU5RPDNzK0dSgkEVx3Ojgft9DA4VZejgA02N64ak9LJS1W2eW3nekTrhtart5h8Lg+Vr+zL4XIhIgOM8NmZ2jED31VM6NOkQlFpvPXps=
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(42112799006)(1800799024)(34020700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	agnI7VrtfjWSSkYtkaoJ1bn7/snqnJ/7lb4TyF/ti0z5vi3L9ksloHEz/awtDSAJNoR325g/PG6t7rYem3D60HVi9xROnIbrQbSyBkQvUhKw/7lcps6Evo2Jhmj4DoTz69/YX/e4KLcScxQSsJu4fGYorenwhI64BQzvIgxaNYv8N30ank544Ta13G3S6FNAHGwxpajhA9XHmv+Q9BYixjUnzWcTaqXse5I6+Jg/Xo7TR3DQ7LN7h0whNQxQdI788KFAQwNdp9c2Os3fU57HYHXhw6C3ZRLNvUN28H5jk5mzb7f5/b+mlvmGQTj+pAUb2W5Jca9Mm5hcjMlb2z/e5HZTG5ZprDY/yb1AK5bxEMU1fT44Zeve/vmWlSxfcrz2UMKipd7Rkqk0987pmPHFl0W4IIXeMVj3fZf+RNac6NWBPAMwWpfy/V08OFPSvhIB
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 01:38:47.3558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ed07f4-e597-4376-4edb-08dea97de2da
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB6379

From: SriNavmani A <srinavmani@axiado.com>

Add the eMMC PHY device tree node to the AX3000 SoC DTSI.
AX3000 has one eMMC PHY interface.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd42cbc54b0eb47e25b0fbf1a706b8..ccc8088bd8258cfb666268b14a3b0716a9ca69f4 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -507,6 +507,13 @@ uart3: serial@80520800 {
 			clocks = <&refclk &refclk>;
 			status = "disabled";
 		};
+
+		emmc_phy: phy@80801c00 {
+			compatible = "axiado,ax3000-emmc-phy";
+			reg = <0x0 0x80801c00 0x0 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.34.1

