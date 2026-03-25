Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023117.outbound.protection.outlook.com [40.107.44.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB4B316189;
	Wed, 25 Mar 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417749; cv=fail; b=XmR6opLgOk1AE9tQhfumGobfFqcWy9Qp514DueMgVMhNIvYn5Lc1+oWknVju2WS3H9VS+xoDvZS64lvJQuujrnJYgMUybNOid2ywLDDIwSiHrwtW201XR21wl3Mlnse6VE83zVgA9RHR9UEO7kj+zUYW6h816sSzX8HxzRIyVAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417749; c=relaxed/simple;
	bh=rfIopo30qiUdmRgKpAPSO6rtZjtMd0Zqknt8bOQJBag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=poVzLpO1A3SjyOg9ynQF0db3k/LZHb+04dzutOxaLxE0tl9IQmi09ZP9X+AoNtqk/aEHUYxCl+Smlwns1f0QKk+eQ1XSyUPeg1eg8eWKR4LGwvfYD55I2Zda8YK6bBYw7Mf4TeY5UhCJC9VzZg6nmrxpwMirUDZ10ERO6uJPvSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=40.107.44.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRuUqhlPXkWIqDKczLlDglLNHgvpCb9srI0UEfWDfdDG+WHFvHwaP/sgqEPts01f3B0tFeMuyi5aNMFIdjC1RGHbW/F1U7Vkj2uBIUF1IK2Stf5CDIt7q+ifhD5p5/OfW9p0tTGVI45m55JkOo3ikRxCn70qZRnD5/kuieKRfi6RUCZ/iS2mFJe+7Jr/uuPdBctPEJQ8W77uilvH6n+xK67M7cQL29FsgKpCPFkIl93Qw2deVxAusBh3VU5WiLR4/tKubB4Gwxj3vJF6tojR40+x9/liMymSti2x0TPea4B+nlQ4CS1bXbsB3N0JpuflArbY5Z6BZsCxyoB2ut6lCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8g9ncZfBILSVPV0OMneVtj9Kn3PECjxgV7F1AHnR3g=;
 b=ajYa/XStjT68JAMTxuosfPk7FwhETQJHMh9AMlnFHM3ZaJ+I0ILSYSw42NfbD7QBPLkaRAL7FrCqYPOk8sW1lJ0kfXV4Q7bYtfGKl3EX0lpwpusheYqH1NuQomDlN9LC/omqrfCqGz5j2sT3wKyLElurzCGDIZLS3GTShftcfwFKzZlSNzVHTQkDqewAHvIQ8pDqVFWcXhR2lvD7gst2SD/Fh+gsYAbaWBeZmY5sJvgvcmRzai2L4su+yERA0VCr28WsteNVl3VISdmgRajCMuQOZdSECE1q++FqZwtKkng4sNv79TIS1CQBMKpW9vzMbAJCmqMaEqpQileIRQu9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TY0PR03MB6678.apcprd03.prod.outlook.com (2603:1096:400:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 05:49:04 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:49:04 +0000
From: Gray Huang <gray.huang@wesion.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH 4/6] arm64: dts: rockchip: Add HDMI and VOP support for Khadas Edge 2L
Date: Wed, 25 Mar 2026 13:46:12 +0800
Message-Id: <20260325054614.1497147-5-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325054614.1497147-1-gray.huang@wesion.com>
References: <20260325054614.1497147-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|TY0PR03MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bbb868-a3f5-41fa-db62-08de8a3238f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	096NipM2COPBLDxszwOkySHXKkWN5ZL6M2whSiMQJMmKhxvrBonfzBcC7ziAnsyY/dkO7ct1HTNdGLKop0+ysGJWR5FbzbvvJEPz8KyeYncj/lsH0Ete/P0tjTnghl2B8xBuuFnSDOKQ8xCrMuLfp8HBF8p/VqPOPYtoo8x/1TBPYDUfxm6IA1nIG1QatNfeTkz1JC/Z+p7tjg/hK+y7xj45KzAkq+6wHXJUJKj0DdvWedv9o+t1U68sedR+PW6eEejKoUx9mMTRtPs3nP4ZiDMygIAEBkccV+GeS9NvxQJ/qczXqaRiVp/yzr4VEqu8uxMSBMGPnXVl8irS1y4vzS0wv+GWcJrm9ZjKnsvpm+zyzYm7D4tuGTLaD+hB01x5wndHdUh6QkuETTiN9cX8DXfqrcgL8/r2UoCm+WBhgpG64mKKa+jaeV2wOrBw7CDAquMeQ5Q97jn+Afs7HdKgAivuAB+gjH8xwEWmBBG1cEyQi5Nqp4hJDd9686EfjnhQWkwdxGstATI9IPzMcq+YLNHm6rwHNBsnA3kVe1KuoITbRn8HsYz7zlH3gNf43+Z5I9M7tR+PEu33U3Ch/t/Id5SDrmTeofPsAib8CI1d3zAKBGldKaXblru4ac0li+ElGbvlBHYYZcVYjTaf47VLnj1J1xUNTI6hoblMfTAy8ND7UTx6ofAPeBF3n61YK/xm5jJ9154siV3HkAXmV4GTY85UKnRKPtiqdT58ER64RHCKm8WkDU+9LZEr1IkfeSx1IyFvAAMJpiZGJTYs9bbuWjCsUxe/bU0OdbXbvycAds0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D6Ib/cx7UYQUuwi7EzRmJIaALBfDoog2OW/3xY3f6NYgWw20hiXD7AXSpeY7?=
 =?us-ascii?Q?RMqUTsMlq0hE6CPC6zTYYWJkLWC8V6yZxx7h6iEcVq4TcSC4GzpyKL6zPfAQ?=
 =?us-ascii?Q?erb8ETpNZBYbOyoebkjmBy2VRGiICmZ/fe66RrEUyROK9zVF39Bb9qxZJJ4v?=
 =?us-ascii?Q?ei4ijGp3T5z32Z/cXiWVe/TFWgRfFTNDzKrRSBTmqaJGB3j6DVnlyZ+NbcdW?=
 =?us-ascii?Q?kfPgd3oerizMeQNKLLLO+E+C1MbzLxVYgYcYTMnDw9k0fKKb0KAqLrv9sl3y?=
 =?us-ascii?Q?VQRbFxH3xYrIpm13zNcg+WeP6YDGPcIbpPXXaUSmxhX+IMwammrhnGsQC8aK?=
 =?us-ascii?Q?lpP1ouckCmIU+xmz2iKyHWNSv33p71ilkEYfycLfhSC+sMxtOfgp9pmLh9xL?=
 =?us-ascii?Q?dSz5SZlOkPzPjd8iFGoo4OPIP4bGfIqw/ainUUJTZjxFzPM3ldggOuQoJp4z?=
 =?us-ascii?Q?4SbMxWuic3rWwcF7R+G/et9+XfuZDZN4suLXl95uw3tzAmXa7dKR7aFLZZU0?=
 =?us-ascii?Q?IlVHHSj8aZNWV1Sl2VM5zqTVVa7rbsMlSX/u/g6sq2NvcLquEcZUIe7KjoEA?=
 =?us-ascii?Q?W2z9KDiAFb6SkHMvttngr4OJwu+fLl4Rc+icRcxjurThp0K4f2oyVUP5KRD3?=
 =?us-ascii?Q?fYTn2zIXj2QOg7+tTlExsPzx6FkY6C6ltJ8ta2PZum88kuVwMJ6LbC1tQH/G?=
 =?us-ascii?Q?aDhO+b118WTY4d0fMmp8fgPMIBRloquiv/ZiBuU65qX5KkXZwJUojjrx6gPp?=
 =?us-ascii?Q?M269V8S+ump7g05T/6I59pgyciDfpuqHHIXK/mcLA19XLv5V0XYEGdJPBNVt?=
 =?us-ascii?Q?K5aNrT/Tbzzxy397dRCsMxkCVQuDExBCl72OGI6SpZLsx2QJj2FlMaEmickS?=
 =?us-ascii?Q?MsaAM3T8/y2EcW+pwyw0kO9ebbZYWGP8f2izGXFYZ+EedwF2UgFDZlUAiw9h?=
 =?us-ascii?Q?dKA/HP59bjEpfMTKRi6aeP7t3ZZOUohHV0YGjy+w73jGP/3jrAvLq6ndrxob?=
 =?us-ascii?Q?nXiu635ioQun4zcbEfUU/YOjHbN4H4XuvGXSyjQt3PiyiwQEirijJmwusQ4z?=
 =?us-ascii?Q?1/vswV4JM7jJp8nZ1NQb2Wxz18pT/VTgjPtiOrrsqsWYcu7D7E7sP33Rdmcn?=
 =?us-ascii?Q?SIWHckyu8Yrv0xOpbzaR0atdj07X1eZ0zBZ35r58hrduH4CZ2PuRkVx6LZy5?=
 =?us-ascii?Q?VXX73SUWZzW338Zr5zBOUy0WjyMduBlc1R/77dhvJ1vOeNyykxmlA6El39Wu?=
 =?us-ascii?Q?Ho3fbasFKSI60J/UzjimQk23kVCigaEt/jmsYgDamkRLSxUFsGWnGQCX6wAp?=
 =?us-ascii?Q?JEgilsV/StVrGCtP2le1JETgWEz3lc+HtYs5sTw5oyQQ47fvyfhAg171gt7q?=
 =?us-ascii?Q?5pAbeszxDDplamXjOVizfrX7iuBn0lJJPdTQmw0g0Ujlha6CLbjmuW7ZZl7P?=
 =?us-ascii?Q?SNQS8jt3KKplPBmQ6IJ637tiCTrqDCutkEEIbdjvziB6Ohw42JJQ/hRYOnJx?=
 =?us-ascii?Q?0L5n/bIRIcMb4G6/crGB80K4XyDtRNXhMLyDGT5c1MkZgUzMbym/Kv9UDumQ?=
 =?us-ascii?Q?vth1f47GO5yG4Wtv9D4LcpR4scy+PQINLGQtQmU+nset+IhzVqXOkwQQS5b9?=
 =?us-ascii?Q?2wBECBQ3lA57RDVgis81YCmcA+1StSUPAHDvFnifaI91GtxJ+SCbi5NRv7zY?=
 =?us-ascii?Q?bkq94xJzsJa7BAgIHBQtpV+88L/C+1JDwP7XN93m4ZwjqkI1yZpzURAxeyL+?=
 =?us-ascii?Q?WNsVX/yiDg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bbb868-a3f5-41fa-db62-08de8a3238f6
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 05:49:04.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbbfiQ7oeC7iR1fSdVeeh52Smep9wxIujlIf3/J4HKU2fcA3qpY7AOWcaoEJQ7559dp94dkaeQp52TWn9On2qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6678

Enable the Video Output Processor (VOP) and the HDMI TX controller
to support HDMI display output on the Khadas Edge 2L. Also, enable
the associated HDMI PHY.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index 15676ba3b599..003342fd69a7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3576.dtsi"
 
 / {
@@ -18,6 +19,17 @@ chosen {
 		stdout-path = "serial0:1500000n8";
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	vcc_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
@@ -75,6 +87,30 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -519,3 +555,18 @@ &sdhci {
 &uart0 {
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.34.1

