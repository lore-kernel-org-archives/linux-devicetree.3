Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5304C9568;
	Fri, 15 May 2026 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859362; cv=fail; b=IJNicbq2dUyxxB+q52Rg33SqEexNJX980tfSWXCwA6EAdiVZII3zN3Ez1533sDXZP/mCyYBQ/Fse2JU4M8WGE0Q5yvN6zSUZ3wuamR+933h/2+w3JkwRSixeA9N+NT0fQz2GEHQ+9DzpOvOuxepIR+QNfYY431B+B2vEhS6V8JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859362; c=relaxed/simple;
	bh=HnBwcvS7MfICwnLf/ArfNXZZnLxBgV0Beg2hIm1FxxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=piH4l7mXOfv9big7wGu2v+7tK5tYYyigEmLebTqPcbDQdZ4BEfHMDgVPYB5Du7kvwftDlUXzG9zco3V/A1sVmBxL9GIzOXDpYlQ4VSgbBojAv2M3t4d75N6U6cfPGSPj9TqWXaUzKk3YoxCdd4GblH6W9P1b/nIdTjjvep8hlQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LxbEYGlD; arc=fail smtp.client-ip=52.101.48.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LxbEYGlD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfL1SZ1QbQah1bpawu0xLEqaecyzVzGiTkCobdoVI579hRH8Oa2ME2DLpYoUhfYfEEoU4AiGTzQxQyysCK/6NPFgj5Ie3TGrlVbeJGMBytuMrwezSZ0eDDYXQv+iWeFHsoQos97rnCHsoEIfwpSf8pZctTg9hI+aRlbY0vg/6t22D/AB0Lq+JfHmfxGgKQYpZ8ZxwhTr7P3gh3afkob8ovOSfoqNnGeh5svX5tnlhR9LqH3WbxqlVBusHNOBrhaqaxShP/7dgrRCXS2O/fAdqHgJdUJL3cSAhOTzUSJ2Pp+wbCbT5yT1B8H5pemfb9kj/WrqnXlXhpfro1tGyYdOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+1X+ehhvjQg2Pyo1Fxqp8HBvLO0wTBGfOFuBqohRao=;
 b=P9aUN+FnkWLjrQPILwxWweR5j60eJ5rGygoProGLAfH/U6Or+ptLyOCfPZRs4D/F30CKaMbvUKeVrpSll0PS0XbRuDMamCvXxBqkNyr3W6MCtvOs1kKbgmzE2B35wzaFfUqU920Zyy9HqgezJMxkL1vQvmCl8otteAGuKYT+E6ifKritxTElrIJipQdr02HdSVG7HQMQEsx16siMMg7yk8I6zWz5CcTARmEFM3CNL+pxLSZt2OFv2qYWt99uZ8wNU1H/LnCGw8Suzs3iPqXayHAZQI7JJfEqA7IA3NrGar87g3s7WniGjVhk5pEHfWnFoAlyH9BNrUYczHsrwkrhkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+1X+ehhvjQg2Pyo1Fxqp8HBvLO0wTBGfOFuBqohRao=;
 b=LxbEYGlDogNJ+Y09s/kBns6yGoLdOL6uFoYHarZ1GcRMK0LSeDpdEA30vE5NoMpIq8ZLh0Dn7w+7mQ7Yqnw+s+eFNo1xjvcs7lO+5dwlT0ULVqbB3rYAPTDcdR/2hT+NtqkRDRpvha8B5j2mDmQMVYXusYudl+5MdQSGuPJOGbI=
Received: from BN9PR03CA0343.namprd03.prod.outlook.com (2603:10b6:408:f6::18)
 by DS0PR10MB7248.namprd10.prod.outlook.com (2603:10b6:8:fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 15:35:50 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::49) by BN9PR03CA0343.outlook.office365.com
 (2603:10b6:408:f6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.14 via Frontend Transport; Fri,
 15 May 2026 15:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Fri, 15 May 2026 15:35:47 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 10:35:41 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FFZfop4155355;
	Fri, 15 May 2026 10:35:41 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>
Subject: [PATCH v4 3/3] arm64: defconfig: Enable drivers for BeagleBadge
Date: Fri, 15 May 2026 10:35:41 -0500
Message-ID: <20260515153541.294698-4-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515153541.294698-1-jm@ti.com>
References: <20260515153541.294698-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DS0PR10MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: abd19f26-ac77-4a5e-6e60-08deb297a2d3
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	s4Lmv/RTlOEZX2P2xWUs09ooMsRVOOQdkxHjp0L756+9eT6aVmicGBwkh7+mKzsiMVPvqZiwXZyLg02Fe3Mp8dBg20ztIJYMjc+CKHK5zEWAnqjs3py421GO+to63m8AtfAUJT8PFBzdODOGPAkTYhN+2PzDjm+h1eec0eAP6yYrKTkhLWF+ZdRXpdEuMsTUrbvQiZrOfW5rhL8aTduPGmbJNs/M6hT6vOpLxnhGt5X4HfNsE/4HjigOs9FOR0l8o53UVBEcuKGPRky/rAZTaZdxERRGg6iqWg5/gJRjjaiw8G3cbPDRsgNLa9X4N/PVZZwGaWkeWuBggTMUxdiZy6a/H2aJaizEGlcSz/DRtYLdt8rZ1qafJr9HBUHS+VHXXI4heus+EpIJpiod9KY8x0AoMdRatvhK4uz2pJd3io9vHCA7ilBuXvWe6aAcG7H9DGqlNGT5dYDeOZGvUdR4Hy03axZX+JDpPde5ky2gulsEJM9GSBSYOJirZU6xYRv0yK/lYQthd8v/2bOowOyHgVorvd5lF64OUsNXd3JorBvpYYtOoD9o60vGA6vyxn40kqqPwXX0A/jNqu94LT5ZRhcZADDKjcaiAZcWgRhb9B/jYtKnbm0sj34O8PiN70XDwcfQ0poCkJl+QNn7CXcXrVoZO2Doeva6LoD5NtpU9g91iB67sPEvbSuM7ikdad4JzmkPyWjozrxlh1/DD4hH6w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X4LUXjduZdtZjkSaBhoeqUlc6C8nyAZ9gUn9rm/Qj3ViC1muRA42ehwI1XpDsF6Q89VgtOvfrwZjqj06RDEJdkSzH48L1ROpSenCC19LEVbDTzTMhxZu6+mhtuwG6rtgjtbtR3+p1D22ta3QlJGRaE4nW4CEOvrrZtl0HEyAsSCF0kAFZlxRccwtw3J9nPPmqFRExWEJd6TZO/loYJ7hoNRi+5yApOS+FzJwJCDnHRLlj0EK8lym6O9UKY3OEjiBlk94CfFkBknJT0YflgU13/9yCVKCKJFBm0HJ64wWkkEnMQOTQYtDWEaGp6AYAVBpmnj/zOb417ZARPFCI/tpuZhw50N6/iUWAm86W2ZReDktZgHZvtnLs+wVFmKXcaaGct29enJABXQNU7uxELmgImRPx7OA1TfHNaP5+xSpLbTJi9wcXXFOy5HeaB9MFWG0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:35:47.3553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd19f26-ac77-4a5e-6e60-08deb297a2d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7248

Enable drivers used on BeagleBadge[1]:
- LED PWM Multicolor driver as a module
- MCP SPI IO Expander driver as a module
- Seven Segment display GPIO driver as module
- Temperature Sensor driver as a module

[1] https://github.com/beagleboard/BeagleBadge

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog since v3:
- Add missing newline in commit message
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

