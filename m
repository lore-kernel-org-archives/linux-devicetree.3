Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021137.outbound.protection.outlook.com [52.101.65.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965A371865;
	Fri, 20 Mar 2026 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041865; cv=fail; b=Azm82TsXTJVad+6dh5g8q2R8pNWLdCxBQqGxbaOOthWvnpvcp6ylU81rZqwNz/DZQ1cAcjj1wDYTRUweps+MgbiWrttGtSME7Tp6XQiodBZyTzA5tNWrwpM1O1+QhVIw9dAYCal194pFVmkBqYm9H7Oa1qRd+4v86zCAoMxC+gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041865; c=relaxed/simple;
	bh=GiRj5Xz6LrUgtPhiFlpIUmkwFVXSp4lJpgTWKUZ04SE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsrGnD69bJ/84pVwxxZbPm2vHDBFBhXfEj6QosIKss1G5lN3R63e1BRbAajxDIk3O3sjk5Iwd/KPfg6V7UGpXqu/scLF0ytswZXleJ0qCm1ecWMvTgD0qQfEuXzADZGxgKNTHh4wo0GjIbohNv+nSB+plSi6NFUp8oscqUGY0w0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=vieEdZyS; arc=fail smtp.client-ip=52.101.65.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="vieEdZyS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLSETjzC1getq6Sw2ciNxVsc96lLMlqFOvb6QWuJZ9lTz3vVwufvudNd+ZdS4Co6qQVPOi/qpUNBbxNaQEEHRlok6Jz5HWj6E9eF6AoGHxmPP/ncWGm2K4bX0v03MU6HeVPYgTpzXqlsxFt+5h5JMX0FgkWzvdKWisXN19h+ehE3eS6cvoEUf4ow9xDNcrxyhNWThsm9aGUhux/7a6lZkZNCVVwWetIcNDsH+LY6B9l+yUqV0I7TI++1NEweCI/gTgzsdwut5ThRQy73AaNcWnUq1FzCqF0jzfNfqJ34NkioFHtWGqcInO4fOXiazYYxxNWTJ5G1XvtDk3og4o49MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2zvCCyO1J/353W2tY931IznPohfbjIZNifLt8dkI8Q=;
 b=jAYJW8nsHwJtXsPiV5KRDGE5mhrSPW76CJkmi9p1HvFn8QX6r6BGSwFIKVRVFjLE7FOBo+2Q73Wgpoh2BW/vw6JP7KWLvC5P/3yuqveAbVWw3wlCDSw+2EqajKiqt9V1lTlfk5g4awgVdlAbhZXe9ebM/gx/ECOjXQCz3BQd0GjbsqUhTpu8l3rOjVRfnXD4W3WJhxOgu2stUGxe6AxTHTC7KKFJw72U9AQqCirsGvypjDifwjqu+4w61WFYsx/IHaQqmfxkpBWIy7FOvJ3RPS0W0pbwsoz0E2VWR9/NQys9dtoaOnXMQhQ2kTf99c5+qAN/EKowPlqXnWw+BJrgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2zvCCyO1J/353W2tY931IznPohfbjIZNifLt8dkI8Q=;
 b=vieEdZySRmlKjFr4/qZCLP/Sf8e/pzbwtVmyNFJZ1wRCwVJaIvxBIySOuT41dlaqVRvm8LUM/GysvpMIyUlppKp5v3i/z571lNWcC0f0z7gTFtnnIw+0Exshl1Qtj6wipqH5i9PRErMHkVIGEJFJYZPo0Njfn4ZWqChsRHdyqf3tOER5gUSNq6xGR6nXW56mLtq+1MiyEWVJaQRPhMi4if/FLowLXcMsrlgdkXdB07cZBhHYB/IKhPw0t80/PH1tkNMEUgMeCKgSJLWbPZI60uPjrQTdysXykJyOiDQtNkAdam5InzqAu6RbABno+HP01fphEdK3T59ieNRQeQ3cwg==
Received: from AM5PR1001CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::17)
 by GV2P195MB1891.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:7f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 21:24:15 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:206:2:cafe::e2) by AM5PR1001CA0004.outlook.office365.com
 (2603:10a6:206:2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 21:24:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 21:24:14 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 20 Mar
 2026 22:24:08 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v4 1/5] arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
Date: Fri, 20 Mar 2026 14:23:42 -0700
Message-ID: <20260320212349.420951-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320212349.420951-1-d.haller@phytec.de>
References: <20260320212349.420951-1-d.haller@phytec.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|GV2P195MB1891:EE_
X-MS-Office365-Filtering-Correlation-Id: 0156da3c-6c6a-4c8c-1430-08de86c70909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pa6denk9DSbscRxmcHTNm3H4lS/i15rhqQs9F3hdEQAFuPe3yLhQgLmNzwRqsjwziUNQm8/uZyw2igJ5w3Vn+444TNTE18dVQxdXDXS3galBeATo9Ypr95qQU1NyffNzPwMuqKvxLgcXYRKo1xOoYLYp78N40TPZfuFvMOWlRCFy1a7lkN42qMDkSPPtxkVu0rpg6bdXlNR/acYfMViVDL4427yZjSOjfskksdnJPQFukWn5TJzN1dSj4vlSUYgnjOInaxUY5Q8G9zPARNOMraiDeKkRMR/3QRCi1R8cTN3Lw+KhaC4Kh2EEWjBkWYPJmDYcNU3ERnf4B/y+tSvalclX+7pTCwpfIikHTh+TfpjZqsnVQS24Kou5ks0B0rJUcdvh6t06so+DfBTfyYxMa9VtFfkMx1rQZCfLHunNMPbAZ+ufoPVVz6fK2X5vlliy/DesclRGMA+HZ0RfKPC0dKwI4M+vvF3lHktV4EZ2kM54XLm2YexJ111I0RH9FBYLKjumvR4edY6J5QNOu/9g2QlBcbX7Oee3yqrIPdZoC+VuuerVmAhi91rmmwq3qEGET3Llb5HgJrnV5GisTFCSCzHoJpyrBNdsGnQgDMT+KmiRaUb3LuOz1yfFipbeZo6DUPJB/wvrMtdXgYX0LzsUDI5HZk2i5hPb+DixxdMZ9/BE+xBdlkU6DThqsjY+02JarF8R3g2KX/dizht6sdOVQn5Ce9/BcgprGn8zbvVWlH9AHB2xlR13bIXzflcCmMNn/ISocOdx02zCzfpsUFi0qQ==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jAan/Bpdok5e4UdoEhkZ5fYldFSRr/+nIDMPS4I0Jh/rlB2hkJC/4dGuAg45FQX/kAYkKZkJJk3e6XZ6sCm38xi0W5H/VGcbgDnNWaahXxoWMKnfQ0HpzgUdjL5SjfwXA/fKL6bePNK5gmxzOMNpYggRpBzS5SUxowVJrXZgky9rh4H15JgI9f9hnvsabCf9ir0YPZMVXhjqDF5Wv+N4cneQ0qUkuK+BLLMm4VQM1F8Ipe+gd+ou35Uu3X2nwCQDyWmcRboeKIdgCFNF+Y2xJ+n4uXRvHcHxs4NFYtFbNU7TkaisJXxaJTgsQ/aSFkQbNNmu1cxlfd+X1+79bq8qiwbUDPAhomMUqcrVx9baya5WLtLPIOR0Sut7V16D3YVnq47tm9nWXSszP66+X7vsprGIk2WZgxzEeGvyQQyb8lBQc/STCheFXZG+vJCpea3I
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:24:14.0965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0156da3c-6c6a-4c8c-1430-08de86c70909
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB1891

Assign the dss clocks in the base dts so that display overlays can be
used in any combination.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 .../arm64/boot/dts/ti/k3-am68-phyboard-izar.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
index e221ccb30e95..225fe7a7803b 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
@@ -298,6 +298,23 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&dss {
+	/*
+	 * VP0 - Displayport
+	 * VP1 - DPI0
+	 * VP2 - DSI0
+	 * VP3 - DPI1/DSI1
+	 */
+	assigned-clocks = <&k3_clks 158 2>,
+			  <&k3_clks 158 5>,
+			  <&k3_clks 158 14>,
+			  <&k3_clks 158 18>;
+	assigned-clock-parents = <&k3_clks 158 3>,
+				 <&k3_clks 158 7>,
+				 <&k3_clks 158 16>,
+				 <&k3_clks 158 22>;
+};
+
 &i2c_som_rtc {
 	trickle-resistor-ohms = <3000>;
 };
-- 
2.43.0

