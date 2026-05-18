Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8340B6E7;
	Mon, 18 May 2026 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108579; cv=fail; b=hkSZhzCIRUc2P/peuHUHJUpuXFktmoxLJtsSQSw74IUHf12LNArxKBtLNc811NuYK6rnO3N3kyk1GCES6YARqb7RGuZyw61HVkCk/da4+dhtb7z0yq/fCs2fo7X6u7CsepvVMfjixyj/7rcIvOwcqMCqgBZZZZbWQFf0JP9bk8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108579; c=relaxed/simple;
	bh=jt3xmrV4CSzWAtg/AWMjaPxI5BOfJI0VrB8xD8SDcuE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHoiFENqEspNb1YV/etxS/0VZEPjqSNEnisqQgNRyGKlww3nlMJoXUBYUKrNHk0WFAzpZEEEF4D08HqoUwueyEehHf7uIXKHv7++98uaclMEztXGQl8DG7oLJ9CYo3xarVnyx49OiGMeKdoyq8te/PMN0oT1n/5PhYtF/C96cBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=flupL4Iy; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="flupL4Iy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6+4XVfC7c1FFmLtwxon2jCnZUpf2MoKr1Hn/fCrCgYawNjspLGBgx2oM0QNe/37DHfXTwHXRtLeMqXAac0wV+KkUf5gMfLTK70UlA5blpmbU+9cs9Mm8CmE8G43l+tZqP3HaACe1k1bME0hFV8XxKhff4gZ+8kF8WsEYyLF0TB4kFy7PK+2oAna7HfmNTXGNsMGUZid9+JJuhEAMtd8y0gcwifibtA/j1TBUmNXUOKVhkbdHFORCErcrIYUHQw74X0dDuAZE7cKSpSSCR5wqyVJuGQTMkraiwtiuYNVD8IJIHk/iWtGvhVPhbAaznxmFUflvpFr6j6v7lFeZbQZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQ6litcyp9nK6gHpTdb5/zG72wiIBLeExJbl++lkYQw=;
 b=hf9I59abHCQXdC+Yv3mgiY7BnCyeCWm4sbSBJDqI6Ib/YX0Qrah2QuxQWtR67gmvUyDy9VLufbV0y1UjsZ6dhuDx5hMZE91dadvQA9hzOD+d+TVmlKsKq/GmfFKxJtr4181rU5//ZqTnaWq0ejL/HzxWYmwn6OtCm1ygcGMnKINkmFFPteMjtj6onqvGNgFScN8Qc8hAxpy2VWqXBZsib3HJdyoqhW1mCbUWMIpM9vD/30b4FkqOBXoqktI5aj4RNhVS9hVE+8DSbdQcStiacvs+RbzWNfeADd6Nala+NB7e/FXD4DhSj2DIz8/l2/hby4SLc31fg7XFIFdgahYhLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQ6litcyp9nK6gHpTdb5/zG72wiIBLeExJbl++lkYQw=;
 b=flupL4IyslT7hzH5aazbPHispRSD48o4KR5iQwPY3bc5VrcL6nG9TLcqKar1ZXVYxlzDxdFQydSTWfC968mskSxrPBf75xUPR2x8PBzk9UX4Ey23f4UApqqxtFGGmOVPB7h6eeyCWrBS5jc+KDhuXUp2zFcUxboGYYWghkdsRms=
Received: from BN9PR03CA0627.namprd03.prod.outlook.com (2603:10b6:408:106::32)
 by IA0PR10MB7303.namprd10.prod.outlook.com (2603:10b6:208:40d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 12:49:34 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::72) by BN9PR03CA0627.outlook.office365.com
 (2603:10b6:408:106::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 12:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 12:49:34 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 07:49:33 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 07:49:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 07:49:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64ICnWZa1897297;
	Mon, 18 May 2026 07:49:32 -0500
Date: Mon, 18 May 2026 07:49:32 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>, Bryan Brattlof <bb@ti.com>, Jason Kridner <jkridner@gmail.com>,
	Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 0/3] arm64: dts/bindings: Add support for BeagleBadge
Message-ID: <20260518124932.plrgsumqgvbij65j@stash>
References: <20260515153541.294698-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260515153541.294698-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|IA0PR10MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 21dfc9d4-a55a-4b1b-e3de-08deb4dbe98e
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|13003099007|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	O/5XquDvXCpJHvw4fgaE89VdVdbmMYTcli3JVVGuOBcWELIG2DWO8akdMiDoJF4Qc2enHBCH1YPlPVgwppRpfnxxIlHl3ra4KpsFsY+lN+eKWqY0cxmmeT+Dei+hTTOTvo56KdI3iErU7jrfmE+SEcGnGuGKyfDW1T27pGX6YnDX1HazR+79iH9KKWGUur3BCq3kIxEzoN64jvcQYppIE3rtnneRaHbZVmqSbL0WpQOtGiozu4KLgnnhh2qGd5jIS6Lx2j+SbNsZcRfS5Ygsh7QjLR5EQQ5qysGaf2xJHImZzQ92pIPoqwBCVH88fkX71rK0l4S2z38Vf1i/4ovmPwE6jzH8/7KPrbQhg3nlXxE8pt0x6tQIEwyPpFd/rziHfB40qBj7btRMHJ1PDWuNgLNWEawzqAfrlPw5kge/Yc659ujBSW573eK4lhOasMhEMHY2eTeZ92M7Ks1YZh/9kFEmX+iismrr8wVxYU7IWgQIs3OiOrFf+Tm9UyoR7POOvPIrQ35087dZfoC448ml0NefvY+/rkpyC71E778t5NP+Bq0bgiPAa5CiM8plqb5OKQSHYpKcbk5FZJxMF7E+8KkRAhhfegvaAbwa2i7rHV+Ls0X4tFQBjoAva5EsuwwEYgYa+d8q1gTzwh7w8DDCUKMOegqABJUjQJ2rgsUwwTxb0rnsBBeBwSvqBWLjme7v
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(13003099007)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4rrUG43t0dbWKtnpXPPun/yj8hFqL4NgV3tAGV+1sLftv+hBvIZoVkmzd/T0ArEWD5eKOSCTH0fcs+eH1pINbDdVh44zKlnHg1i0hsTi11dlChbaUusVzLDD2aP6Nf5hKTOMRqCiaDrL759waFB0SVcTSW/3Ha4PbnKCEbGxLk+HmlCpDxryuMmyvMfnt6dlbIBDOhsqIy/ESL8nXp8KW+oeOrpUKwtIXwvlxEXUjvO0kVJeiU0f2ZC+CjCzjzLtAsUNTGY6kRashtP2+pw3+P6I84aQX04lVKcdBx7/clsAoRgBIZPIN2O+MA5FxfhXKes9r6eHQ76KFhkza4PSrNsKdJ9L/tLtmRKCQ8CBNXeaejDDXsiLDAMP+qMdFzCJXBc3gvi1oM27842BNxK/2ihsUZTAVV6CrcDca/iap2CZOSCL43Kqc4GNoFHDOyd/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:49:34.1293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21dfc9d4-a55a-4b1b-e3de-08deb4dbe98e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7303

On 10:35-20260515, Judith Mendez wrote:
> Hi,
> 
> BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
> hardware [2] single board computer based on the Texas Instruments AM62L3
> SoC designed for IoT and embedded applications. Add base support for
> the same.
> 
> SD boot:
> Link: https://gist.github.com/jmenti/8818fa277597de927dd2b42ab1d2552f

in all patches,
Is https://www.beagleboard.org/boards/beaglebadge a better canonical
link?


Robert/Jason: for some reason https://www.beagleboard.org/boards does'nt
list it. Is there a reason?
> 
> This patch series adds:
> - Device tree bindings update for am62l3-badge
> - Device tree source for BeagleBadge board
> - Defconfig: drivers for BeagleBadge
> 
> Changelog since v3:
> - Fix newline in commit messages
> - Drop vendor URLs
> DTS:
> - Add bootph flags in wakup i2c & PMIC nodes for completeness
> - Drop unneeded header files
> 
> v3
> Link: https://lore.kernel.org/all/20260513233447.2713737-1-jm@ti.com/
> V2
> Link: https://lore.kernel.org/all/20260508230341.1891450-1-jm@ti.com/
> V1
> Link: https://lore.kernel.org/all/20260501233148.4180391-1-jm@ti.com/
> 
> Patch series depends on:
> Link: https://lore.kernel.org/all/20260513231154.2703292-1-jm@ti.com/
> 
> [1] https://www.beagleboard.org/boards/beaglebadge
> [2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf
> 
> Judith Mendez (3):
>   dt-bindings: arm: ti: Add am62l3-beaglebadge
>   arm64: dts: ti: Add k3-am62l3-beaglebadge
>   arm64: defconfig: Enable drivers for BeagleBadge
> 
>  .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
>  arch/arm64/configs/defconfig                  |   5 +
>  4 files changed, 707 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> 
> -- 
> 2.54.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
