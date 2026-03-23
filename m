Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8323B62C;
	Mon, 23 Mar 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280638; cv=fail; b=TdSNOMQXnEHEyHZveOFBnMjsoa12/EyJGlyqedCZMV/O57r9WmUNZVFCZo4FgzNrwENcZ6kGBsoCEGc2pidmkh8kHY1GeiH78sjLFltT2j21dOx3asbTZXp5JTPBdKkyRZy4+TzZpTHbgWFcer/wi+IgokvRYzxrRo6x9H3bR6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280638; c=relaxed/simple;
	bh=Bw3X+PHEnG2xlbraeH+Duf5uXXr+54ITUTBLx9z6Djk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jFXw81i5uBS7Y7v5ilJnH2OpQFON3tSdpAqxV2A6DtM65nAc+IZ7+bix76l95YdcSEQr3Q9dybwODLhS5SF5qdXqRoswuHXd/FAmlu6uB42js02/hPP+uYIVyNDirGewLfpAUC79pZdoEx6VmKXtlnchgeB+i1PLDtoSHDUg1cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F/IPxMH6; arc=fail smtp.client-ip=40.93.194.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F/IPxMH6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+2/zgpl5Skk/xr08zrk2UEy3hUgqnPy9sxrccTbs6PZjUOgOrjkOo8NGwx8p4tpLAC5LxuVuSWKq8iMuxMbAw0wioGjtn4MFy5SnNW05Oe1CTcg5o4l729dz3f1ByzdoLRSDWDk8D/6LiYhYpmF6MsAy6XmN+eBnFeb3gi3fAl18blVWCuRCJsIuCAV1uR20u4ccpC0XpT40fEdG1ex7Za6jvrKvgvbikS0cW0IuGPk6gKvSfMREJ2r8fsdtWEKnyVSng4gCXPgtDfINuay4nAo89ZnFkbNayCzi0tXYrZq1ewWvHBwri4PD3LBbeyWMikTcd/Ug0TomzGjyyYBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=857oDi1w30iRUEZNIZCDcc4NK+1YeerD+Igqd1c1Lk4=;
 b=sjfgzYruJpF8OCmjysIiidwlTHL2NySoTV1y6lA0mt3A1bi1ZfGOJZCTz6FdbQOfrJgCuP91kZumfLxXfSUxiFFSuJcyVyBt4RCc7Gx+x2XRqZDXe+N9+7migqFp4dCPMY0hPGny3YSyhhYxbfZxhJKn60FaJot0bgdnsbhhfVTlYIE4CY4H75hfsxzIQkkBeWhM0kkKJnYg5ztN6BY4bWcYZTlt7vogBNDmBPixjjOL9ADENq+dxqiOdrzjhLv2IqQdxB7utMxh5KJIq0V57jpl8i6i5LerwOIBd31JX+a6mV84biiVWeyQWQpsD601umrJlO8y7/sjiGnbZPAoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=857oDi1w30iRUEZNIZCDcc4NK+1YeerD+Igqd1c1Lk4=;
 b=F/IPxMH6zZfku4H8eNLfF1OfZ16xndipW6girdrJKz+mBbFVo7Clxi+4yk+VwpIHqpBCb/52pbOwEI+EmS493t41XFGdnvn2fc7n2qFlWJHin7UHE6iZlU8rkB6Lrmy0T0Pa5+H5JqAPCuVRJypL1Vdi1L/X+a42TkVQhFKZf5Q=
Received: from CH0P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::22)
 by DS0PR10MB6800.namprd10.prod.outlook.com (2603:10b6:8:13b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 15:43:53 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::37) by CH0P220CA0026.outlook.office365.com
 (2603:10b6:610:ef::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 15:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 15:43:53 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 10:43:52 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 10:43:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 10:43:52 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NFhqpV1010045;
	Mon, 23 Mar 2026 10:43:52 -0500
Message-ID: <d8ddb5bd-3acc-4691-b07a-57afa702b42c@ti.com>
Date: Mon, 23 Mar 2026 10:43:52 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fix MMC pin pull configurations
To: Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>, Andrew Davis
	<afd@ti.com>
References: <20260223233731.2690472-1-jm@ti.com>
 <20260319080228.GA6079@francesco-nb>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260319080228.GA6079@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DS0PR10MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7aebcc-853d-42ce-650f-08de88f2fc74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7yVHq/XOZ0TeC6FwgY+2tWmEOdk+dTB5c5DrfQY9O8ENhyA5V2QDWkr+EDw9tRc97lJEVB4Fy2y+vJuuPEhBnKkPZep1+/08k3KZaT1Cyq+wF7eGD/HvIGtyz1sQ6kMlV6Bz0Av8JbfvYslBZ8TZx37Wr1Ii815toxBuOjNq9UIGyxpbfOLx0iR20E2lKGzbemEbV2036Ph3AD/tUrasSUyP/JUQxdWk5bJ6dPRgEPiDz+JJUtL7V3sLz2stDts5Dz0KnnxESQ/FGHatd0gi4kBwIyl/Lvc22hkk4kg+yQFvNJr5fqcJHZ28Ye6eh3Q/3Ie7QaC9hMxP4zijK4qP9iSW4pHe17tN48pjBSF543HHHFufYVGVnWg+SFZ8PSyHJGK8RJoeYSR58RYdSKCGWqFqqP7zI1jY8LfoAo1AsLXRVa8JKUl1Xmk42rmeLmlHK8GQOAbRASXXU1DAXKu4/MmPtBfTFgkL/B5sU/G6Y8C/CBi31SV8E6cO5OshmJrA7jf2zvbPqaMiTO9suYSNkGeweENnhNMCYogWceWNNuoUyiGMRBYzSGdin8KiFEiqu/xxwYSrW6D0ZzqfvzpR0k9jAV9OD6GFCc8e2AnQ/DXd602vVLtKW0PDWe84tuUQTUO0hfobcfaPm4WsNGPys7r2vGLApImkl+rG6/1bE8cYJxKQQ5G5RupZuw8anzY8UQsBiACxxC6y9GHd4gYY5mqRQoYO/S5qccROIUw7K7HKV6ABmQRI8dDClcfGAS1n9REedocehvSCsSAf1pWMrw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A9l6n9V6HNsRUAEUskHHj9p8FU6GWIIcjBUWqjM9o+EQcuaq9ugVVqoS2av9A/bYbkd+mi/0w7XAG9VXTAS6qzdH0Ngghv9P/2SVX0WiewVO7B4I//d4FhQLG4rJLIQEk13vGn2Yf8bN/o/hvJZYNr1yGW5LEo8XgOafE7CG18RjKFSPOLXAcv7uaVvWfD5L7X0YV/I0Nxf08EM70a8wibCEAqpSuJ77x3lrfNhpqMx5+zecBYa3vK1bUc5WQMBzAj+q6HcSG4ZpHWM/WGhrAlJXEZjkYPpoYvftDJnUhEXK0YqU84EZ090xjPPKQexKsnqYoGCJJQH9XhT18sAyq28WEKPwoYDX8pidN+yK2tLTKsBgTUBiVtzJxBidrfnpYY6sGMc3e999lOldPatRC2UYku14gw+v5Wb6MCQShx3Y2+tUIgUn2fPUj78bbk3f
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:43:53.1273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7aebcc-853d-42ce-650f-08de88f2fc74
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6800

Hi Francesco,

On 3/19/26 3:02 AM, Francesco Dolcini wrote:
> Hello Judith,
> 
> On Mon, Feb 23, 2026 at 05:37:28PM -0600, Judith Mendez wrote:
>> This series corrects MMC pin pull-up/pull-down configurations across
>> TI AM62L EVM, AM62P SK, & AM62 LP SK boards to properly match their
>> hardware design.
> 
> On AM62P the first mmc controller has no pinctrl, how is the situation
> on this specific interface?

For AM62P, MM0 interface is a hardphy. We do not need pinmux nodes
for hardphys since there is nothing to configure, pins have one
purpose, and it cannot be changed.

~ Judith
