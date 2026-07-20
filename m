Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011006.outbound.protection.outlook.com [40.107.208.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AD13C8C48;
	Mon, 20 Jul 2026 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533360; cv=fail; b=ipWK7gIQ7vCa7yMgML531P2B7MGE1oDW5ENcrNjLST3D3qeEIOyHedlRIql1pSETMmoP0HpsVLiXVKmHQo1nVQDrQbUJBu++BoPVDryjt1fqWOq/0UxNKtaG25D3Jk+72LZijeVeqywz+mOfRZYmZRMbc/QPzFoOk+OEUklhiVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533360; c=relaxed/simple;
	bh=dcLxRSkG0KXds/VhHljIOY31GEMrn9k6efwBdMm3RRs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TJcsbvYzFAgGHTtQSLrD+H2TptDqpmF3LkAywxwaO9XYOZZuaTNK8Ftu9p70zmvA4LOiYIhfNNUqV2jMtnBX1ffEiGMVNafxfxVQshWfGUGi83rA83v6mYT2LsGztp59spYyciRW8sGc2via7H/h7lMeNHcAJjhaYseiV+mXYoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g8owNFbS; arc=fail smtp.client-ip=40.107.208.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g8owNFbS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsV8RpHyu0PZYJ/7nWVlzhG4xjksvLpgRDYKPeB6J+3d1Wchj6GeADNNnAgGRbVcAl5fKjxiA511mCnU00+654+T+OaNvv+2RbdwQJfa7NY1DUTctlZLd0bSfyhkj4qMitblADwVmNE0f2KX9YgKSOX61fmByvMhdO0ou56OGvKH7/vpdSeqs0xf+J8pSdQUjS22kOP18CURS6JUAse//dd7xRiNwxM7+Fpv6C5Se54CMOq2gfCC5Mc90eSeO1h6k1RrvGaCoU8PuOK/2NZCpF20yYC3qnys7v3lmoH/CO51PJ2cTdLVEOjNvGfLkdPoOvElO6Ugunbb084sSQiNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rPF2bwkAvz9vDpRzTjbqmApalwJzAP5/B0PIdH5CdA=;
 b=pP3/xAlKOipQkn436J1wGcOmZoRNw0mDQdBU0UcKuLrsoExDCTn5ZGFUUXKpnoFkEeyUhQUHDX55l8rYtLy4o8VVX4nuWwN4NSmjFGO+7RBIJKok6Vnq6EaF1RsQ4dFsxTvClM6kc7tlIvo9HWh2Xx19K6SXAX+NQA6+a2vlZ/bT1AA+s6r2Pqd7Q9GaV6jKgI+PXuQF7sVm7hgTOItIVgnatiI8j+QDAOTKv6/83AlJBOl7QD8ZpHBYebHiewLT7I5WWf52jqXGArFfDfz4IfwcLj+hD0tl3N7wj562r+e3dpKN58nBpHtxkOPqtjAU5T58gsvDJTFm0UnijHEbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rPF2bwkAvz9vDpRzTjbqmApalwJzAP5/B0PIdH5CdA=;
 b=g8owNFbSqQKdRO0bD6yDzGd1/pzgn6YEX4GnuHTrvOlytCiXSCUpIIqSAaa7w9Js5pr+7+30P5p8Hs7nKFoE2s2e9ayj5rRbgaUoZkWDrOS5bpqiP7rS1J9XQ65J+5T8tpQ2MdAETyd4WW+vuvHa3BdVclnfuxnlI056ilYH3q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM4PR12MB7574.namprd12.prod.outlook.com (2603:10b6:8:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 07:42:32 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0223.011; Mon, 20 Jul 2026
 07:42:32 +0000
Message-ID: <211f283d-f5ec-4b2d-94bd-f298033bbd2f@amd.com>
Date: Mon, 20 Jul 2026 13:12:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: dw: Document missing optional
 core reset
To: Shubham Patil <shubhamsanjay.patil@amd.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, michal.simek@amd.com,
 radhey.shyam.pandey@amd.com
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ba::10) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: f415747d-6d52-45cc-95ba-08dee6327501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	oB4efCZGDv73R3ixpETKvEs/M3+um8aK4O/aW1TtzRLk5goQTNUWNcWNKra0LrFVLMvk4qB28Ouh9t6ZTkGZba3H+4SPQYSE/tohmApUpG6lNB8ByOk+ssWn6xJdsYgWhhwsfwWMOPsjQ7z2cwiKFzMaGjBf2De5bYcg7i6D3kZ28CAht3ElTRHQ19ibcOWmnqDpmqnp6a+E8HlZO2Kl3F+e5dZpY25wBE1qhxCOjC3bE/ATDDK1ge/Z/xg8CnpTaFAw50CodXmOSARMEdvu5kCDhvjdbA5SACDSK3BnYpOcKhLbTSr5WlLl8yrc8m+cVDexNrl69R/B533YXc4Ot1NyJH/ZnE31AgdoRaXPl2s6+xEUg7qkl5UMcHPY4om3r4E9g8UlLly37vcuzTOpeKGLg7ReTSURZULwmVq87OZmVTUCK1RSX2IHu2ACamM7YVtwxIrukQJrp5v62/H/c0D84F7PqDiiW0Igb4qJY5vVyYFRexrfzVjfxlScdGRq2T5z/GUJt6JHnR8LrCVITbpjRtsPytbunuF5sFVKOfPZWfmOLnnTQRg0S1ABgYr8O3XGxOt3b1Vbpwa7D5sufd5Zm22WLWELPQg8xoMrdxT1lNWI3AnBo/5APD4muU/0AP+HdMscFM2CvefYwkvRyZ9W73kDXrRgZRAmCWADt6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVNaWVpxWVpuQkVlaHlpemNQM3A3M3QxVkZRbTBQcFBiTUlCMjVsdmdRM3cw?=
 =?utf-8?B?dVhHYkZTZU04ZzNWVE9jejI3aFlTZTBqaGViME5xNGVvRi9KYlV2b3pleHJI?=
 =?utf-8?B?SVpNMUNhQUtsei9FcVQ2Z1UwMXhtTjlRN1BnQnl6NGhhOU5xWmN2MGtxYUc2?=
 =?utf-8?B?RGI1MU92UG1YbUZ2SkV4dzJOaSs4WkQzTWgxdGQzOVJTZ0lPSkhwdzVQam5P?=
 =?utf-8?B?UEtzQTdzMlA4ZWN1T3Fib0lCSWQ3NThFZmlIQ1ZLYm0rakdjbkpCdUF2WWxQ?=
 =?utf-8?B?Z0FhK2ozQjZEMlA5WGI0MXFuTXBYZWJEdHpjTFZBTjFhbVc4ZHlOdVV2RFYy?=
 =?utf-8?B?M1RMeWw2UzlDREduVG9hVEpXVkdQR3JYdFVoMG1SNkdxWkcza0djRHhaME9o?=
 =?utf-8?B?Wno1TEY0c3FyR3hVUkVVNGs1VnpyTWxJdUYrUklxdVVTT3U0dFRrL3RZWWl3?=
 =?utf-8?B?cWEvMnJPUGRMQzg3T0FzTVF2RlFwNlpyR2RxVVBNRm1yVHRzWGt2QXZtU0w0?=
 =?utf-8?B?WXg0eFU4ci8yV0lhTThaeHpBQit6V0paY3pYMmtWOGxRWXR3cjN4OUZwZnB0?=
 =?utf-8?B?aEJwbk1zaTRkam5QUzhRRE1TbjBzc3RNbzRPV0F6QTMxL1R2d2g5UFg0SkVi?=
 =?utf-8?B?QTcvUS9HR1NkdUtEeXZOSHZhVEtFVnVqVE5tS3dLK2JWKzZyRzdDa2RSUW9i?=
 =?utf-8?B?bHM0S2dyam0zbEEzZkoxVnE0Qyt6TDRMUldVcFloNWhYMUl4cUl5UE1XaTl5?=
 =?utf-8?B?TFo2ZDBOOVVnZmNRdDhHNWZsdUJtR01LMklIVnRlQ1l6K20rQkZJdkVmTUJv?=
 =?utf-8?B?eE9pNDZDclJXRFhlVnhKRE12VEtESGQ4L2FkZExabWhMVWZiSmJ0STRzbWFD?=
 =?utf-8?B?Q0F6Y3ZNTmI3TllSODl1TEE3Nzd2Kyt6MnNkcGIzbDVHNFZkZ2hzczZRRFNE?=
 =?utf-8?B?TTJSVWFJMGZvc2U1d0l1UUZwWVdxYnErQ2kwM3JjK3ltdGxpNTRYYnMxNnpS?=
 =?utf-8?B?dGdWdmFCVTN0VFlNVDJ0RjYzSlVCYXpRbW9KOGZZZGExYldDZlArZzl2d3hZ?=
 =?utf-8?B?eXlOenowcEp5Yzg0MFgzUFN3UnZLbUFmNklRb1VXUHBzSGFBMzlZNTUzUFNN?=
 =?utf-8?B?aGYwcUR4b2t1RzRhL2tLSGdoQlJtQnErdlorb0J0cXhndmljSk9BVWlKWVZx?=
 =?utf-8?B?UjRibXNpVnNlZ2M3djRyOG1FRWxKQnFpcW0wa2NzUm54Sk9zYWJUakxmVVNn?=
 =?utf-8?B?cUY2ZHR1THhSekpGTVNRRE4wd05weGEyakY1Tmp5WkpCcDl3Vnp4dTlwWnZy?=
 =?utf-8?B?WnlkdjAzZnFOUEFwemdOenlqSlhnSVdWNTJBMndER2UwT2wzdENrcXN6bDNR?=
 =?utf-8?B?MUtpTHNJYmVEejEveWhQN0NiTGcxaHNabkx3SnF3THVDemM0VlBFaGZqWDFt?=
 =?utf-8?B?QXJrZk1OS0NXMnhPZEFYQnFndlBtQ2ZJRHQyUHdtNENIOUMxUHlVQ20wZTI5?=
 =?utf-8?B?WFc3NTZzZGNlOG53aUVreUhKRncyQmZEQUwzUU0xNWdKU2pKek5YSUlPSlFa?=
 =?utf-8?B?cklWbVNTNnV1ZE81WFg3QnpmaWxBcEdWbkNQZHJjbWFNY3hpZGIvTnVaQUJC?=
 =?utf-8?B?VXhLeVNUODlaVExrZzFzVDNJcEJ4bk9iMm9EYWZkUjR1L1BCSFdsdVVSUjJ0?=
 =?utf-8?B?T3lEZFNzcGxpNmtEZGpzbW1MQTltWDRmQTVqOWdMbFJScmdXdUI0ODdPc2VC?=
 =?utf-8?B?K0RiNGV2dFd6VG9sRkt1dDFOaWwwd01GNmdmSms0OXAwMXlyTnovR0VDMmlB?=
 =?utf-8?B?a01ZMmNQSkc3b3NKZ25GUlpJWG41MzMyRVNtbGtsVHlrZm8wemtHQ3JrWE1s?=
 =?utf-8?B?WU9ySERwWXlCN1ZteWNRN3BOSlBYZno0MVk0bFdQa0N2Mk90MGRFZlJWTVNL?=
 =?utf-8?B?clhPSHFlS2hFN0VKVERaZUV6R0pDTDQrRFpqUWxxYnE1SHdBSXFrR3FWc3ov?=
 =?utf-8?B?YXFWVlEzTnFwRTdFV3FJeStJNkN0VFdaOXc5RllxNktIVjhVRUY4ajg3V25D?=
 =?utf-8?B?a0xUbmFtdmI2WjdDTnZsNEpoa2hOcHhDazFSbUlkbjhsK3VwTUthQXdJa0JO?=
 =?utf-8?B?OEpKNHNNN3RpaEthcFhsZXNPYzZzNVdTOE9Wb09iczhnQzk1azZMaXFITXFF?=
 =?utf-8?B?YWxFSXZSK21nT240RHVHaEt0bmc1cVpSOE1rMVBDYTZpOFR3Z0daSjRSUCtZ?=
 =?utf-8?B?QjVFckVSV0Y2Tm90Q3hCUE9zWTY1Nk03SVR0dWZlTVlWY2lrallhUDNwUEk1?=
 =?utf-8?B?dnRHYmlnWndhVWtQUjluaDlPMlRoVE90NmRPZTcxaG1RZGxqUHB3QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f415747d-6d52-45cc-95ba-08dee6327501
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:42:31.9981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsiJfaw+HQLICELzs3H079N8iQKOtkfwkUuKvCSR/H5uWsuwDZgcuOix27CJ0s66
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574

On 7/20/2026 1:05 PM, Shubham Patil wrote:
> The DesignWare I3C master IP supports a core reset input, but the
> binding is missing the corresponding reset description.
> 
> Document the optional reset property. Keep it optional because the
> reset line is integration-specific.
> 
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> ---
> Changes in v2:
> - Updated commit description
> - Dropped reset-name from the binding
> ---
>   Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index e803457d3f55..dc7ee38001d6 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -38,6 +38,9 @@ properties:
>     interrupts:
>       maxItems: 1
>   
> +  resets:
> +    maxItems: 1
> +
>     power-domains:
>       maxItems: 1
>   

