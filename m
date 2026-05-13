Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6B939769A;
	Wed, 13 May 2026 23:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715293; cv=fail; b=gAuSHbCQKL2uXUJ90/Mj93q0XZqWOf2uQbyGlT6Aj1FLL7fwgbOBTdZS2u4T73YMZiRl2LsDwScUXeP546qqt9fvdcB2FzggMYpqd0DFVeoEmgRjoqNhHNrERVXyeYBJ78RMdw12ABsOUX3fBWQe+39kdPcly+ZGYqC5CpGUSxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715293; c=relaxed/simple;
	bh=64FswfvNPipZmQBpjrSbzAN0vrjTJuXp986/hB3D3R0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gXImHUCnBnEvzeUg8JD2Iopodf5BrUA97jWHMDzqk4aUAa4kMAzcvvN6vuzugvnnxTb3HKxzofO98NQvdGJphDSi8mlbTJIQTrmnyjGctteBawrjvKoF2mVfygok74d+AEqyohCjAnpU6scfaGEWqK1uTAY7dcy5k0N2lpcECYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Xv1wqgei; arc=fail smtp.client-ip=40.107.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Xv1wqgei"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkycTsZ/IZwHYOcvBvW3Ck5Pge7iboGBTuD5SiIIR6mcAeCW5TDB/YMBI5EjapQNz99Fo5ckwhJhyb440VxqQAs2sUeg2n3Oxn8Oz3ynrAGut4rT14ndanAcSufrmchywB3ZrNzQx0oUDG1kVZGmsTMvXE6f8HBB5hyx6Dl5mSDTzJKvJ5P5koQq/MLMaweSN6UbXbnT+NqFV9zZ3Xa3rW/aSlk7u4HrogJFBlpTqXz8RwtHdmeGgtprUjl/9OWfUbBx85gBT5JrqMdH9SFzjbWfDXETj4tA3JYlZ5uolnps221FQEXAEmubsafcPMA+IM725hLcc5KV8nLWErfA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0nVcb5mNsrjUDa2avO3+bfHBUhUYKRHEEMS0LVh1Fc=;
 b=hhWec/s76YOMEkQIUqnDDd/JmrlAoNaw473vc9q8Q+0n62wXCxA09OhhRfOJRNLmhmhFIRnwW4MhqczZBd8CeFO91CTjsap8VV7b4nl8Qb01EyYEHXaM18+Uj5o8fkwSp+xkYsjm+1UGlCm7WSyQrlm5/BAMSYfePArHOMdemugUY4h1JKNCaAI2s2hlwa6T3CRk8A+rvtjMxAjPG1mfCtGWyf31bfwGe+c6jHVidKC9Q245J2zffyNPkOA16sQ669kpbM6OoWpW4tyypWV7AtqqSPVoGGtKa2IXF155akMUpEUGnC0XtZFidG1Q3nOUFfqpl7XqGuP0xTzYmgyXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0nVcb5mNsrjUDa2avO3+bfHBUhUYKRHEEMS0LVh1Fc=;
 b=Xv1wqgeiWLnv5a5HcnAlqp3DrIXD95dKVsSkquAUKf4grIDE/Sy2QOBkrvIOqeiUE+HF4vBDlxU81tcXuUJ0fr81OT8v0E8uojjcKohndU6rsG3+gfTEBm4dKbxluxfN++6uLRFiT0Cj1GvHLZVUBoJDVs5Jta7cBH/C736wfPk=
Received: from BN9PR03CA0189.namprd03.prod.outlook.com (2603:10b6:408:f9::14)
 by MW6PR10MB7592.namprd10.prod.outlook.com (2603:10b6:303:242::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:34:48 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::8b) by BN9PR03CA0189.outlook.office365.com
 (2603:10b6:408:f9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Wed,
 13 May 2026 23:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:34:48 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:48 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:34:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DNYlSR499089;
	Wed, 13 May 2026 18:34:47 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH v3 3/3] arm64: defconfig: Enable drivers for BeagleBadge
Date: Wed, 13 May 2026 18:34:47 -0500
Message-ID: <20260513233447.2713737-4-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513233447.2713737-1-jm@ti.com>
References: <20260513233447.2713737-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|MW6PR10MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: ada50b30-89d6-4d81-cbe1-08deb1483910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rC2KMmXS+xEwkDfzqCx8qFXZXaNJX2REAF2bAELC9G/uPBrfF/TfZQezGsawoSWLTh8KdrJ6wUry+R0n4yNlqqdp3JJhJOqmdqASdYEag87GXjBiOlJcPZVwztrvK/UJwXUfPrnEP/SCr2KB0damxs5Dr0vH+gPCUCCrkm2hJI3IlfXfzlT/sco/wxgKxFF2+TtlCJWiYW5HHRhVNP1FCcVzL1Jl489Zx3Sac4CHFq0FsEQ/s/japmcM3/Vh3X8DR5RAlXZYX+Ug3bNWh+bxbFHUqnF4+TcM54BNr98ywK4XsIGX8tnVjkz0AC7Mc5L6CDDkp82w46AvCr2fCCymkchhdAD6GWbkW2zYiU79HC/HnIdrJN8D4eNIXTHMGNOzbIZwDveltjPRYPo6uehqan+xSdO/nqNVek+fXji1i7XV5zwnLnVcsKYPJE7jFi9Ocg6Jo9ykZRkT9loX6lLbaKg6+3o/BUIBVWO7dvkBg9UWsU24/kRYRoZq574jiACQT4595al/XnpAWzEvhfFZMwpKE6VIi0cN1AOhACqTxtp7Pbtc9SDEeZA9uk3z04jiveUNG/SWqfU424eFw8DYJJwsgl8QtslgaPB+Cx0fne9TI6dlPO+Rrkg5TH6ndLigFWRbCd/yiEnEe2FZ7tM2GoOAV38EGHNOk4ncACrs6c6wsq+AfoBmXbzvYc9kB/kedQDduR8IGAkttgxdpbztaVk8nRfioppxZOdQqT6gsQk=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D8J1U0vqKaIIha7vGECRrdaZe94aRGnVUNlKJR2+1EdBx4vJIK05Ly0eM6RmgJfFPi+se3NXM1nd/bFfESJFhEWMkbZDNLJnp9bRqeQOThsKijS11ZFjEjhZcxd7GMsSq0yJMfOiLRkp6pXBqJVRFne/tM0f1q+T0oUdZ2g8cpCzSLjGQbvbKII/zMS7VAdBEKLO+I86uTu6vdmQvPDwLc2sB+1fpvvy4ZnrNlYpPTLHUpxkHJuWJZDuXeFoPOUMwc/29RjOeadwe4d3MDaBQLDIXSfJ5Us6G1o25FzhvsEvRvbGaJt9/ZDRJ2xNXh/6pUh2YfccEol7D99uBVWDfoh9VT1GMqIi1sR1GnD/RnRUyehQr+CCIH8ZA77cuNJkeWfBDT4StUvSiLEzO2nJrI/Muaq+fbWz6kfTZgNApPP4jG6vcdfQ52aTf7iyIEOO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:34:48.5226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ada50b30-89d6-4d81-cbe1-08deb1483910
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7592

Enable drivers used on BeagleBadge[1]:
- LED PWM Multicolor driver as a module
- MCP SPI IO Expander driver as a module
- Seven Segment display GPIO driver as module
- Temperature Sensor driver as a module

[1] https://github.com/beagleboard/BeagleBadge
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog:
- Move config options as per make savedefconfig
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f939..5cfb7f6f2ae78 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -634,6 +634,7 @@ CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
+CONFIG_PINCTRL_MCP23S08=m
 CONFIG_PINCTRL_RK805=m
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_SX150X=m
@@ -766,6 +767,7 @@ CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
+CONFIG_SENSORS_SHT4x=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
@@ -955,6 +957,8 @@ CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
+CONFIG_AUXDISPLAY=y
+CONFIG_SEG_LED_GPIO=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_HDLCD=m
@@ -1332,6 +1336,7 @@ CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_QCOM_FLASH=m
+CONFIG_LEDS_PWM_MULTICOLOR=m
 CONFIG_LEDS_QCOM_LPG=m
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_DISK=y
-- 
2.54.0

