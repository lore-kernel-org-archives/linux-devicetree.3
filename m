Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603BF346E51;
	Fri, 29 May 2026 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024155; cv=fail; b=qcCl0VzQIsHtmuYEZmpaJAQqXJA9DULq5BVcVCT/nn9ik4yf7h3AUol6RtUOXL1QxuQ6uDEBAgKUU6YEhVfoDpnNQqZFjiUK/NvUbfkR0wxIYQeiBi3sA+W7e4SDMvZ9na6q0RHVi+ywhqINKbS317Uu8inBAsYQSCC3Aq9dKMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024155; c=relaxed/simple;
	bh=vPPMcMGUzcjw6VmCZkfhx+5X/hnVED8mpkZP3J2yFDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BjIB+ijve60VscDVj9CxFzDtBt+BeJ6UN26xIQDFvBVv1H0x7JyI+ICBraRO/6mya9jKwxj2z9jfvYLkflhHYjWtGj6MuJHnu4v0onUY5j+uceZnH7J8DZ4ZmR1U+BaBIZCAGST0E7FKz0Xr5sv2ge8SXJIavx4Ib+E1nxb7FOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Um/rn5LI; arc=fail smtp.client-ip=40.107.200.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Um/rn5LI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nogOPbcsdKfnOBEOTvFO1ohFpm/tIE7Cuu5t6wOZZ2neVdakGsX1FjbWr6bbZTci/p57YJvtVUvD3xgO7IcxHVbLqe0CBW89Bqcj+WyzWzNihQ78NBYi4XOoFEVrX4IkPFMcxJi5iIQh0HhSI+wYAv9yGOyXcb63iOS3zt6tI99N+AmBTnqKktupTF4ptAOjVf2t84NCUwgPNKYgQgBAtb044XSDVhRtLNm1a6TPJ2wiLl3cGM0dZzfESg0tuaXJYL2s1cYF/yG6Ty3K6FoNW4HV9yFl1hAoEzxGUTbPhPpKvzHpJPhmtgXn+e55UCBMGuBCK31BbsChY+uONiQVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njm9Lb6PnPkKXEPA2I6kX9wff67YWmaAIYAMRIfCmqs=;
 b=TcndqHfGeulA+6HrSNfNNRhLfzNydt5iKpKVZJ59tfz9HB30T7ZEYcuEtLcgh1H600wbO8maWNwC84SVKRq2JlmcGFxYUWdRLPEDtZIY1JttBZmS1LF1q12PwhRy2h12v8ItRIpP1muMd3NJAbIWcQeixk5pQKAF5AOK9LEF4TMF/Wihuae9HUdWcgOIE0z1VmUQSgHBnMfckMSvKDgT6+xfVsDZ1qt6c9jhI6aSFAq27Rs5C7xkqoXXW1dFLqF5MKE7RMtPfol1kTtiqovqTL5+SjRVEFfrTcrnTGcwqlsR2Nm0Az3EoVng09JLz8oeCCefJweVLNIfuPWHycRKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njm9Lb6PnPkKXEPA2I6kX9wff67YWmaAIYAMRIfCmqs=;
 b=Um/rn5LIA+Wv9gIeneEOtEGM0oPdpZEyn14VzrRd8iG0ActvWqeT+R8zg32ddFC8QwMzztcfSjmiTI507coS0A+3/K58YPZQd2Z7zwjVjlRv+OGD+nVF1V6GOF3+oeEvrxK4t0HJO/4sgP4onbTeg+Ep9Vo9LvtG/GJwx7r3i+8=
Received: from BN9PR03CA0206.namprd03.prod.outlook.com (2603:10b6:408:f9::31)
 by DM4PR10MB7389.namprd10.prod.outlook.com (2603:10b6:8:10f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 03:09:11 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::64) by BN9PR03CA0206.outlook.office365.com
 (2603:10b6:408:f9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 03:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 03:09:11 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 22:09:10 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 22:09:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 22:09:10 -0500
Received: from [10.249.33.223] ([10.249.33.223])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64T39ARj2782222;
	Thu, 28 May 2026 22:09:10 -0500
Message-ID: <3d958ba0-30b1-461b-aea7-c0bf758a490c@ti.com>
Date: Thu, 28 May 2026 22:09:09 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: ti: Add audio overlay for
 k3-j721s2-evm
To: Moteen Shah <m-shah@ti.com>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>
References: <20260520115603.2662930-1-m-shah@ti.com>
 <20260520115603.2662930-3-m-shah@ti.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260520115603.2662930-3-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DM4PR10MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b1536e-15ec-4e8c-83dd-08debd2fa80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Wo3y2IcQoKtebXYSkeCcYCNlRbffxQAmbEVG6WM9KZVCz0M2PDZ1tmPUMlSrCOzMkR9B0jWl8cCf53F02VwTBS4pQk97/ZBi2QbOmjIrA1zUuIcNDa2GscuYa5C5pdLsrrubYUsYGFqH0D8gaCKvx2moQ0+5bOLFVGpWRej0/qWpkLSpsyO0zUUuYEkiEtJ/YnUcC4Y/X+hdTCXfaUPl+pQSWSYPA+J6XVP9RVQBjDFnFjsBf1ij2QrdrqIJSt8i5U7eAV559aLL3GCHlhNYZKHOOnkr3l2tkm63yuDM+KwCO6upMk9oaY/cgEjjdKOvN3i75BDVpJP83o8mEDi6YclZRDg5kA88Gldrtf3o8rKBLO8AUq8KRKjx5hQqLbmVewyDmu6xKJz0k8TaV9xsIWKhcQtGZGqwM5EBeDWCDlnAJ/ehHrmo973nApAbmBJHH9W2ZTaMP73wo6WHmlcKmvTVltKHSEwrxH2pWzb9W9lum4MKTc6mz4GhEDKAvbDxZosvtcOZm/4qZHoZtCWTVRwgSIxAk2OFqKr5rRadKOHRmr1GXSooV6w4qv2zcoCsk5GRM/U7Jk8RsKTWakLUI+D5Kiy/RPLdYQSBZ8ILbcfLuiQDEbo1LNeX6FQHTBZA72Xfs3+vbpya3BXti//lGl5b67NFte07g05xxWXhV7DxRbKgkfrED36nfBRnoewQmY36jujE6J4R6tv0ZGmrZiNbhpeu67UX6hPLQeZd+oM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MruZqCDfldlZ4hAF7yCUUl4u0bnhh94OrKLOkH7k4OiKfwsFc3Z61H+j2368n4u4CvTrVh7LZdgY7DK6XCXGd0ZVaNTM3YT+RQnKv2LK+A7VD7eimmfbddqJaKiPmCHzVywDt8lJZNnIh4VlUQlaKvx8ebhidyUXDyO4GY0890TFdd/VipUh3zGfKsn63DWHhC+tG4ch7VGFGGB7utE7nBdVJ8/9cDMMPjwwhffulLeCTZcAdV3n4o0CLlw4CVcAMzvOx9ueVvQ/ojcc7e8bR9eLOUrcIaMVRJPUWtw7EhzlJAubon4DTjWsP0igAbN1PsQ0oDxPXk6x915+QqlaQQxsutcnzRdeVHJpxJ94s6AAv/NdZW3RxvnNp5gNLIjQhivI9ilc1shcgV7qV/qp8jc4M0k/8USlerZcIvmUkk/+HALdmlCHiM5ZqvIOx1V6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 03:09:11.2380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b1536e-15ec-4e8c-83dd-08debd2fa80b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7389

On 5/20/2026 6:56 AM, Moteen Shah wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> Add device tree overlay to enable analog audio support on J721S2-EVM
> using PCM3168A codec connected to McASP4 serializers.
(snip)> +&scm_conf {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	audio_refclk1: clock-controller@42e4 {
> +		compatible = "ti,j721s2-audio-refclk", "ti,am62-audio-refclk";
> +		reg = <0x42e4 0x4>;
> +		clocks = <&k3_clks 157 299>;
> +		assigned-clocks = <&k3_clks 157 299>;
> +		assigned-clock-parents = <&k3_clks 157 328>;
> +		#clock-cells = <0>;
> +	};
> +};

Hi Moteen,

Should the bulk of this scm_conf block go to the SoC-dtsi instead? It 
looks like it could be a part of J721 SoC dtsi, which currently doesn't 
seem to have any audio refclks defined.

Best,
Sen Wang

