Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959A418A51;
	Tue, 28 Jul 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229054; cv=fail; b=Bt5bJUTi1ReuB/7RaT9Njb0Cnj6srWH2li1Vm6CAS5mtjA1nxIFQTRNi4cTKAM+XHzxF8j1H6ea+CQjmgiXIV2KulkUJV/pyZvGrfmwVps+/2LbrWVX4sYVAV5wL13ethIpWJlqgGJnfWnIlzhF0D3ZHAoUersUves77joOLXKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229054; c=relaxed/simple;
	bh=0Fr79b+ZqFy5rMDFeaXprTpClJ8gWFBk1xA7UZrjiwo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLYgR9vQkvtuoOLTuLSJUQDegFqEOjmAlQimi9NJT4Ghu7yuVXXjdmBMFc5MAnWs409OVRr1I/BbRc1gsyFVcHhMRX4YyXPztkyWUlWB1b6RyusQDcSP0RiSCRtWX9Nks46hBWQjwglSALC9H5uDx/IkIDsHcgImmFtff6yyFqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TTVdeiO3; arc=fail smtp.client-ip=52.101.57.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TTVdeiO3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnJePEESzaDmRBt6mSF0N5aVK3N7iPY2LBcUEqYVwz3MLYJPCXw/tqXk89/l5yEUf5rEBXzLv6nIaXvTF2MgGAg1prpZyOwUjLLQrFFC0qCwqQOm7au7NNgidZn0vTJNAn5i4UbD1ekp9WxKs7Hfim0cToaajuMySmCXUPdcWjbiiA6iR+VGxT7e7hqi5Yg4pd+qS4DKJpRuvP1bzcgENuWEfeVbpL9FyjtyZv45ooptAQC0OvHkl3qfcr1tvOaIKStYERGs9pPBcUWBhfY3s56X4bSFi/8JqpCaT2/DlBxuaCFSihXqNcdmy/2DByqP5mDTpU7zsLAbifdZu5yUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDmGPjrXGkz+KZjv2SJWhtAlymfWVB4F9hxa1pGKoiA=;
 b=wzsis+S61cL+K8Amy0PAPT75TkeeHZYvTEuq7pmFdUecjV538lfBxUMyQqB671jA4yQNDjoGibW6gqnYRscWEw4AEecNc63VnNhUlWhOFOcYTcIY/Bcq4sdZlo7eEzVjju2pnluQQHvxJlfQmg1FXyIW0NJxTQDOcl5VwVT2udPOCPbm22qT14bsUgjrrIDQxwoWXLKSSulfIxoj+VnwGIj6iBJogaAwEkkn+rV81FKJsAvQXb5TEsVWPTE2FobJfEI/abDqiHE5dcTQKNCMSPawOyDCNE24ok7EU5/EuPn6/0WyiFun0G6gt8JgBVpSPqHm0qZREoGaL8AvB7Eyog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDmGPjrXGkz+KZjv2SJWhtAlymfWVB4F9hxa1pGKoiA=;
 b=TTVdeiO3eW1ukMvhAZQqd/IGulzhwrwkbhc5K2+kdtHnOHDkTgWrZGvEbBghaRwY3WOdiLFVyxWC4GcqyCR081F2qb/x+o5kCj4uW/STIA6J8P2z1uXtWVpkWy6zuVPafFAt5+q5eIhEb4kXDMZ4vudjysnr4V4ELkcLTZ2deYh5n1Pl5K+Maon0+CeL6Bp2ECom7m70R3D48V8KYkL+IKSEE7Nffc4upOsqfh+m7kM054maDW8Z8r5dQKFu/JbIF/Rre4B2EZdjzRuo1ZJNYEmXt8l/tUHdZsPHOY3p0ZUwWJ/ktXpCT7g/HxNqej1CManUXrh8UOFcSPKdGKXhzA==
Received: from MN0P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::6)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 28 Jul
 2026 08:57:29 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::18) by MN0P221CA0003.outlook.office365.com
 (2603:10b6:208:52a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 08:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 08:57:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 01:57:14 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 01:57:12 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@codeconstruct.com.au>, <joel@jms.id.au>, <robh@kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<andrew@lunn.ch>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
Date: Tue, 28 Jul 2026 17:55:09 +0900
Message-ID: <20260728085640.1001890-2-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728085640.1001890-1-jackyhuang@nvidia.com>
References: <20260728085640.1001890-1-jackyhuang@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffc8d9c-262b-47b8-dc65-08deec864085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|23010399003|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rU0Vg9qa+C2iCOLu6/VU5FpvALLAdWoezqblXA/TSFr/SnRQHJ10QWFlrT87FzHrb6M09rr9eW3LwS1IwivvIeTeea1D6u3XfI7uxbG2auQ4EeifUM6j++6YMkTzZVv8+36bPkVCO9VJCubsHwWfo/E5z2Tc9uD8So8Y4gQOgHP7eT8WBx4ApueSXSZ7pY/TaV33tXCxJWN6wmHiYep0yV319DLJb714ioqQYzyol3T+jTV13lrW7t+crEpAM70O56ypQewyDDdqQRZkr5L/kmyxuWViLBvZ2+yzzBVf7lrFuUTd1BPAJ9ZqM+LHAe751T8eLBLoolgCH7L1UzCDPVPf/HfARj/nXH7CeUEoUfGNCRfebaCbWYJKAnET87HzuqN4Tn+coPfTKgVg/TPHjiBAvqG0HjncNfkerFj3CiAxwNBBgOmq6xll8pSVf9WAHtq01GQod7J2l5i/A4lunH/e7MEnN6Ga9LgYU4olijyxuHiH6ntrsyVG5OEJkpUmxw0RJn5R6ZyeeTS8Uhg8UeBGljGWybfxNLyNG9l/H5KisYjSMkRKxOXO2YvokWvVn7L3uBNND3XI1PKAuPgNUI/sLN5VaNO0GWFJDFSpBOsvc7y88HT2A7tiymIb2BGw+IvHELevtk+dYkyW3v/50v6u8fxfOfbSnwz5VNSQqV1Idzwy3YlIVQZJxQPnlLKmSBpW78+bG7dkyrO3BJfb3g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	63Bk9UtAXb40fGzKIWIDmBFQrRM+w/ustJ1yf3IMxc/ycX2m7AsK7jhf4ooTzMdOzhJPo5sdjqH1W4jUzOciFPTowjekgbHBUVOkgNy+pnO7oj55t+zUpsS0ZvVDavx+xnp79sqHIwSvepLVI78K60Vl8u+/0CVpvoneLxI8xLBEVFX/ERKIWOCp3Yg6FxdVjbXDazg2GwKeX1tRxchzSTGvvlTt2sdGoQOMBguFxH98hfLXYZamS8AQjm/8SqTrEQ+NyMm9751pzG6imPIUQn3OETm+50F4HvdlQjTHDjDjyBZuetjxemkzw8l5dPvZM1Kt8/jV4AfC0BKE776HjoGmmuHYYWnAUEXA45p3dSkMsK1B0O2Pl29P6HmSP/pMpeqPlkS6w+2xfHYu90IhZRv8aTlDOI1QgSiB+dyU33GoBmznrc86CJdAGWkFlrcT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:57:28.3594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffc8d9c-262b-47b8-dc65-08deec864085
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542

Add NVIDIA's VR-NVL BMC board compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..ce893553cfc3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -114,6 +114,7 @@ properties:
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
               - nvidia,msx4-bmc
+              - nvidia,vr-nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0

