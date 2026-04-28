Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011060.outbound.protection.outlook.com [40.93.194.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E13E7151;
	Tue, 28 Apr 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371357; cv=fail; b=OFAih+NuqarGCQOzNY/BhMYAXJvcgRQcxB+UY2UGSiM6CWQ9U0U1akNmfkCG6BnSt70u03+VnNMc2y7X1bb/tJXt64atSAluYVeo6d5Ou/yweZtXqqPdmxsw1cG66fw0zQ5eCKF3JUbRebSEt28lKgiTKTL5KKz2a1BWucd8g+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371357; c=relaxed/simple;
	bh=5Ius6TL57ulYEZUF6iCB614imWVUpJRbB68R6enn59k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sHJwiYPlPu0J80mseFDTONGfSSWsUDixOLqj9zCpEQz2J1dvFhj4QU4OkBHnRGTkBTWT+Mw0ilfN+HVbs0TjkqtX/LUj77FbcYvEr9KPBJOvM0jM7bC4UnSxS/4PrJeEuD+ca1TojLQpkkPUiyrSoZGAyCX+WLitxlrvw9MClW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y2FUbHp/; arc=fail smtp.client-ip=40.93.194.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y2FUbHp/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+hWZxE2gmptn6mAboBBYMNopYecnlPsrMi7xqIQ3BZfPK96ak8AivaY+FaGRMrL8rcxSl6xEmHcpQ3K4ReVoPJkUqltH9K871iasBVaLcJJkDdoNFQ54d3NYp7mIIhiNjewoOIg+NfFryIgMqv9rRBROrpaC+NzX6OPKp3U7rsWxHDOhVR76KoYmnnGLEszBQ8x6dIr3L5A6gdjBy9iGcSBin8ci9Cq3rrHVnK95mpZYj0aFzqP0wiiFWbL+0sN0cWCHTdEm+AAcizhO/Ea+c2kwcjSNobD/e9iF2X/rp9iyXu0W3+9KL33SQFJZNtphRgPwLaIZgp/dluDvvKiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InetGST7l+/ODcoF8+EPoQeQG89iAw5nllVsRXqM71g=;
 b=OljGGlOOt1Ew9lTImKP1v5AOUxCNcbFKbTjpia8Su4N38s2Wnzren5UUge0mFdR5HdsdVJHRb4VgLjionkmQGXAtICK6Y4ccjFedDuliYn8nldIX62+/wgNwGv70HdxsKQhVLKwvvYDhM1AodqbmZuJWAODd+QUJV/4BoQGjU0gfbA49ZMz+D6V6+fh9ojWKMBQ+bXfk+f3GdaZKl+OYVC2X6xcjxy427QHimErIRXwdwo+PRgrl8ET0BKeF3WIeFvindRizsPoX68fRUMuLNihRgtAu6bctG/E+BGCcYxtAChalKeFB5+Jo1JGkCQCS5P5Mdo0fWiCe5Hy68xuogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InetGST7l+/ODcoF8+EPoQeQG89iAw5nllVsRXqM71g=;
 b=Y2FUbHp/3yK+vSdNETdvYbvCxn/qiTy+1XqKkRlVLJP1EJay/F6qZQzCBBUMAP6xfaHUjIO3Fm7eYXdBhVQyUh4rOg/ki5ykwuf6WUrtO2kJPawa4Xy+t6pQx4GXpmO0ErtpGeDoGwHVak3HOHqLjAYDjTUkfFowtmFL1pfeayE=
Received: from SA0PR12CA0009.namprd12.prod.outlook.com (2603:10b6:806:6f::14)
 by MW5PR10MB5737.namprd10.prod.outlook.com (2603:10b6:303:190::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 10:15:52 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::38) by SA0PR12CA0009.outlook.office365.com
 (2603:10b6:806:6f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 10:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 10:15:51 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 05:15:50 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 05:15:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 05:15:49 -0500
Received: from [10.249.134.231] ([10.249.134.231])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SAFibP982649;
	Tue, 28 Apr 2026 05:15:45 -0500
Message-ID: <6aa8fd45-ec3d-4bd7-9b13-6c00e4fd4efc@ti.com>
Date: Tue, 28 Apr 2026 15:45:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to pmic@4c
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, <a-kumar2@ti.com>, <u-kumar1@ti.com>
References: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|MW5PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: ae707c20-c3c7-4194-8f27-08dea50f1fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8RGGqa6z8d4l2cIiapNhQbny6U5H82Kk9IlaiorHOVtNuU6TjOQlzxMelKAGz6mqCkdq0HImqU9oVlDpG5jUQYoCRA+S/CGiOdPNVN0MHBk/fFLC0Cw8Z3rQTVXuZmxrjaRJGns+yD5qhLex7ylpIIRJ9oHI1y4tf5C4bUgYftu+EqbCtrrVHYGA49KT5WMqov+sZW/oANTYh2G6vRMv2Ch2N+q4JBixesnPpBuhO/bNZvz1l3+u7y1AaUS0woGGatXpYdYgkzd7NB8AYwjyFuJBW8LNh+W7txBKQNejWUjzQ2AJQE95KviHIJw/eBlxcsJYdFM9XNui5JqIXBsQtmrzxzjoH2KMwP1RmBWwcDit0uWxTWpmZ7y5SeOXatuKdHyr5D7CngPbYOimwa21Ls4cZ4dITn7NUcw1F/5cJj8irJlHu0VinRinLf4vlSshj9QPPmZmuhsMzoDkSJk4E8kwk39HBqpAZRo7NaRFS7vjuEm2rb/ogzl/oM+AQRk/gExbjW9AYA6cp2315Oj5MwYql0bNn8aCD+ltfiJQqIOilr67Uzf9cLcvQdhVYn9wd+nCmAKLF7og/9RyTL00BvxvCzZDvVzANxMXUnEjszaEfAF48SWt83YgYS17EzWulu8We0aiduIhjchAXxLRkxWKF/D0fUhFy/1LectmPpPLYIwI/pr69KtDKAMUk6L4W3tnwNPdxBYJjG3xUcqz7FS6c2xUy/f/qOB0DwBR+5faV396mltaqa+8cceXQRtVJKczygpSni09s1tVev4ofQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MnqscwMjyusMewP0XRc0XZnhVrm+oc5pxsAJ9KpIvoSRzfuKSFsAL287y2VZLOXQZVlzrgYg1/vJuw3nnWM+PQ9LllJCqpYmVgCcLDLuzuwtIV8a0p1I/ffqAB2+0nKu5WD6hMRzKR12/deBcQ5pcXxa3fILGV0St5w0IVyE5lBu0VQGM/T9dz5OVERV2jvyeBAHtPDO+c/MfbQto0bClTSe1JS11nCgA3BIDzij+k+lbpdWa/5OZYBGDvI9lebq4fowOb5yyjYtsXpxorviDadXotme5QhrWQZTQEXApVwS4KAgUgdsMgX/5hXQgMcSCQ+pnHUfvgLbJGW6PLojiwAglnjbFuh78nMfnCWx5o631v/mrgsRIM1QAFgufFWxKj6bBokG1DAxhro3Oj2eJKVmiFn3i5A4IRxseFuAFw1I3TsmnLqqXpG23OeWVMvD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:15:51.1221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae707c20-c3c7-4194-8f27-08dea50f1fed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5737



On 4/28/2026 2:23 PM, Thomas Richard (TI) wrote:
> On j721s2, pmic@4c is needed to exit the DDR from retention after

pmic@4c to PMIC-A to align with schematic, please

> suspend-to-ram. Add bootph-pre-ram property to make pmic@4c available to
> the bootloader in the phase that sets up the DDR.
> 
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> index 12a38dd1514b..a19e535f4946 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> @@ -250,6 +250,7 @@ buckb1: buck1 {
>  				regulator-max-microvolt = <1800000>;
>  				regulator-always-on;
>  				regulator-boot-on;
> +				bootph-pre-ram;
>  			};
>  
>  			buckb2: buck2 {
> 
> ---
> base-commit: 59b04cb2325c07ddc1cc7d984bd8c8f89f161746
> change-id: 20260427-k3-j721s2-som-bootph-pre-ram-pmic-4c-744fb90b05a3
> 
> Best regards,

