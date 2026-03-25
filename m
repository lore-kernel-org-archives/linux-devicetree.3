Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022119.outbound.protection.outlook.com [40.107.75.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0879B1DEFE0;
	Wed, 25 Mar 2026 05:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417724; cv=fail; b=HQs9n3oO8NdAdKq7Ddpg/QEFUQUA7pB1eahYCJkIWU1uUvKSqAXwOe2O8mWR0v7RlpC++CNx7+NVpJFSxy++m9SuNUWVF0AkZppZSJ0d5kfbEKG7ZOcXgcGsnDY7DgN44qFEZgB0CiN6tdUn+62T+PK9mXLUOBEG4w9VnmDYG3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417724; c=relaxed/simple;
	bh=XqskPDHHwVtCM2Zx7+wtJB9FSv23n9l0TabjGnFiBJs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Wr/UwELWV+E5e8Tu2L8NetD0bc+QAi3YF0tE2d47+Emibza8ougA4o76IedmeFJd/lwwgRDOWrBq03N7v/7JWJjefAWeL5tmKTX4t/wxPb0+4GnrKMwd5g9q0weDt98OopBcZ9T6CGiuQdcCzlq+ZEcMG6IHzmHb7uevGoitbwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=40.107.75.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cK1aWpWBQHDkCM2CW0ZQvaEzc7Drh8bjgegmFqp9hBaevfo3ivQsiJve0mNM5FaM5X8ItarhAAcz9AEyRbSCnNsZwVOBoIXC4HHkFLaSKWcAIIQb/JQCQozQNYSW4dBxFzlvqxkWrYICiyUYzHhnaIK4rUMV2FbWhI8aPdSu4x5SKtrJPZmrzGgkYC2PAq3xlsk1EM95lheFt9Uv4Em0cpl2wI3MJ6pP2oNmRTrJST9VGWVbPmT52dVZRpli3YU4D40d2x5vjLwzdnYS0iMaB3BnbVuJMHluzLeYlVxJOgaF9AXOZcJe77wVldZkBqFoEdnDqXmvq78sP23ruwGokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jq0YwsRMO0EOIBI1l0upi9Q5NwtvXTCAyLlHeCm61ck=;
 b=w4tmZbxUUV+gx0tGS4ugiyu98pEmTYlSRM3rENlcDMyXLBbBcfjlPyqSuGLImgzhPKHh1kfYWAMwXuUEO3tPe+mYVoODP87cOLyw7zMJ7YWGDUXSTxgPp7ylcd22E46P3VzgbvnRX/S8XIrVjDVcLuj7smEvgAXHjwhN/G0mSh1RW0f8xmkACWucAsrWiIKD+YSgydg2d73CiF2CZ61m6716swMBDolGjXX+bSru8bGZxBV+/jIRB4j68ZuLjlz8YSwe3I8hQdXUGJ5ngX4oYcny+S1WV2907ctKWhBou9BmPEOvPFnZ/eYD+IiViXcBaOaf1zii0cZI7dVtyqfjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TY0PR03MB6678.apcprd03.prod.outlook.com (2603:1096:400:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 05:48:39 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:48:39 +0000
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
Subject: [PATCH 0/6] arm64: dts: rockchip: Add peripheral support for Khadas Edge 2L
Date: Wed, 25 Mar 2026 13:46:08 +0800
Message-Id: <20260325054614.1497147-1-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: fe46e09e-df92-4d8d-0258-08de8a322a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	7DBWcKYOY2uaHXWkAdO8yz6Za15/qLVvg/ErgmoJUEAnZqRoJDhx3J/r17k1SmOZsUj/W27Vw+0yJ1HpJBRqm/gS7rB77eIJ50EdPMpFvKu05okZYv3uIIjdR1ltaaL3yz+98tpa2SpGZMXlALtRETEt2kRJF/F5cpAUr7D88iOBUcju3EmP2dFx5DP0X6k3u+z3ykxdwnRsC8rjtWsQ89V+kHKWn5Pkl/RQ32ILXSZHhGZe5gdWkAVXYM+2wHt9/C04Jc0WVt3viGg27DEebEBwtknXXur6rSfXQPEhaqiYQLwUS08YSrs6Ix7Avb7/f2/OM9iBw0Qbdoj7CJtmY5Pog/hA6JFPB100QWXMgrSbR+iV2z6ATS8DnNviKnEB33IN99oIbtjmfzJea/JKhHsuGtHp7SHz5YY3m2/wz/xmsWYsxnh004Wm2yzN5EV67rdWeWW2WX6OD6RE4tb+BsNFQkoRI8ikghBgEptcvH1K+e8nIQbrCiQyVdh0KmPaMY5ExEd4M8F41p3oyFOEwiFoZECOmS4zuIrU5r5iWbqas9rmVhlEGpkT/HqXLT74SHhyuR+u6dTfWmxAS+GcuYE0EcWHCruyHLHnCzcsCCQCsX7t3yxs2yJxcsXYM4pPORzgEp5Dtul6YIXxWauCxkAyU7vWjmulDW1QElcSoYYKrM3LVFL6XgiK1Ir4Smdit/d5ZgREokkgnHFwGmK+bml6jE2Tf92aU473zxEfoEMN9IzRccNFwfnvZyVFVZX8H8QphZtJD1SoZNwCBXStZ6+8xb4gmOB14kqD6Jo3cF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Juzhy/X0QiCRUHVlgF7ygjIljis2hJKq1mb9Lr/k+1PyuxLKOf6m8Tpci2aW?=
 =?us-ascii?Q?ecD6BeOcnfLjntDeed42WxxlLWgwyZRNaY7Z6wHIrfhb/h+HsrK2C3TwOnMa?=
 =?us-ascii?Q?90x86+UmwSPPiZOPPuZCKCZpjSFPq8vJ8f+dXmB/TFBXZhxVNEVShySGOHYj?=
 =?us-ascii?Q?eEMQE2+bE+MSbadrMHdzwbB3lZMUetLfAthnFacz/C5O3u4s8dyoiHSvju7F?=
 =?us-ascii?Q?pguau2EbBnq0gW7PTXNpnZZdGygLPG6y09D8HaSM8aPoeU/q7+MebF2ZveMQ?=
 =?us-ascii?Q?uW9X99m4DNzM25YC27nxzry1NDielsGcxzX20Ig7TC5qIafIEHaq+hTJWvWz?=
 =?us-ascii?Q?glx+kCC9yYbIktKLGGx5H/4cuNGDueV18HD/19T5owA0X5c/SGlpunkbXWVr?=
 =?us-ascii?Q?PfEayEYX8fOu5YOvizd9m4YHFBkWX4dYMIlblGKGve0clovGZQA/E/h+B0tI?=
 =?us-ascii?Q?f2fZuGrJ8Z5V601+0lp86gTXgtcVpVhFActnztStJPwJ1l+IZt12nIri1scw?=
 =?us-ascii?Q?GiNNgTg2qMct/z+R+ks0EC8z+CA6jH7tyH8VsGdNU9dtgNH1ommlBX8gvjiD?=
 =?us-ascii?Q?+0qIJYPtqfopRhN3rVqXtBn4rmVfKm1nNukxGh0W9z04OPc9kiGyk7snlDbs?=
 =?us-ascii?Q?mkr/qUP77CESZkmdaIfekAyziV6/DEo9hlQLIquT0KJbliHomeJXd2Z4D8tG?=
 =?us-ascii?Q?AQO32e2k4kfD7m8tybZRRB1sK9lGlxqNI6tqDn4FsqcBWGu/2yP2qbd8gkhx?=
 =?us-ascii?Q?FlNjyX/n0yeotvX6kQUCveGib+KtV+6IyseqPN+HU9PLO0N+Y5B4T4zRcH8a?=
 =?us-ascii?Q?G7oe76CoWxKzk4qGzlpSZGVMVnMCnBNOK4bqM+L/JlESVi2M7yYwJqmpgI8m?=
 =?us-ascii?Q?dQjddX/oyaDt3jo7XnnqwAXtfcmC5wmmMyb3wMlqHyrvcVCwV06sFquX1eN2?=
 =?us-ascii?Q?vUgRcFiwCE/H+cgZl1jsD4Ur1V8FR/CJiyz4GxUynSMMaPNix7DitAFZEPQ/?=
 =?us-ascii?Q?V2NEo3Ph+G2d6VZZd868vLwJclfJoltI9BcgmZyyMLifUznjp14evyrI80oK?=
 =?us-ascii?Q?83voJ+wi9/KUttBjocD46Yyp/DapIm6NiRdODo3FseszwQy1q5bMJ0kV6llk?=
 =?us-ascii?Q?80F6LDgTm39mYsJ0AYOKFCAtaWOTX0iOD1DJerfruSzbf4l+XuIGvGH6CLvD?=
 =?us-ascii?Q?3UMK6/tZJQ1jdws6OGgA70u/JwDAAyY3BlQGIkmyxveHce0esGeO0Bt9MC6l?=
 =?us-ascii?Q?9UFAg0yXxpZElksQIcSUAoIAF2ovN4ZDp1CaTjx4bv50IKZeK9efrcYJIpdt?=
 =?us-ascii?Q?Z4e7MOmYw9SWkbrKRC/E6F7GpP2dP9IeFNM6Sp9ivQ/D/t/QZsWNC+2/M5bT?=
 =?us-ascii?Q?ia7A6zYAE82Jv8XJKTbLPvC3RWJoGGapdOLCcNxZpZyOwAWoH4yofYYgtULy?=
 =?us-ascii?Q?rdM3KyaFvAEmzkIqaBRIqXdtRikcwN7dF3OX9ZYFwqx7d2Gf2AVk2I0grJQ7?=
 =?us-ascii?Q?Ck86LhzoI0KdTBy55aNaC7gu6xvHtkQjDwY9/FCDtGCZu2kRiiCG0c/pCH1a?=
 =?us-ascii?Q?qF9y13Rph4esz2C7ZoSyfXV4Zd98iqpAGeH3H7hxML9fzLzOU7ktphwEQWoQ?=
 =?us-ascii?Q?urtL4IEB6fzNtAmnPC8xuq9k2mD17S2ETOkI+REK8C/Je+fFPRUPcFp4FYWZ?=
 =?us-ascii?Q?Ka5yQS1ILoAThDrKlLiAS/TZb6xvdwtj3wRPgFdEEPM44cYnls4oMDwkIdgG?=
 =?us-ascii?Q?c8i8QjSfqg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe46e09e-df92-4d8d-0258-08de8a322a1f
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 05:48:39.5533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxGjMFDox/Vqqyjch5Pcx7MCmzwienM43msEASIg3sJlPUl5Y5Kv/3yMLJITONnGaLFEV9grO7epfEwtc8uRSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6678

This patch series adds support for several key peripherals to the 
Khadas Edge 2L board, which is based on the Rockchip RK3576 SoC.

These patches build upon the basic board support that was previously
applied to the rockchip tree. This series enables essential 
functionalities including power management, wireless connectivity, 
graphics, display output, and USB support.

Summary of changes:
- Enable PMIC (RK806) and configure CPU regulators.
- Enable PCIe-based Wi-Fi (AP6275P) and the required RTC clock.
- Enable Mali GPU with proper power supply.
- Enable VOP2 and HDMI display output.
- Enable USB 3.0 Host and USB 2.0 (via internal hub).
- Enable Bluetooth (UART5) for the Ampak module.


Gray Huang (6):
  arm64: dts: rockchip: Add PMIC support for Khadas Edge 2L
  arm64: dts: rockchip: Add AP6275P wireless support for Khadas Edge 2L
  arm64: dts: rockchip: Enable GPU for Khadas Edge 2L
  arm64: dts: rockchip: Add HDMI and VOP support for Khadas Edge 2L
  arm64: dts: rockchip: Enable USB for Khadas Edge 2L
  arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L

 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 620 ++++++++++++++++++
 1 file changed, 620 insertions(+)

-- 
2.34.1

