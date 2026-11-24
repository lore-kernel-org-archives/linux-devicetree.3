Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795503336;
	b=Unv531GpYKkLWtp+RvBXF27fdJXEsuxIMpmnqNMKJdJZP7cw8YH3blGHg2wgco8ZeQYV
	 PMW5p3apt3GWlcBp5pvyAayQ3SAEHCsBUcGdSk6WttMvaJd+Tv06gpL120qRgtoIyc/VQ
	 9R9RhEizZRCeCONlJ7BpvWp7MxlB2BtccBwv4d/sBGy62DvkMO/8jU/aQzVS71uU/TC7h
	 5+zqqX8XhalppaAyJe4gujnwzeRMaJvEHlu1leB1+kJLxbV7+/qS6Y5Oxp7ZgyOX6ZoZs
	 QdVHOpF1BxiBismlA0PkluMBqyn1XYNoKY/MxOkOz9p+KgwiAlTuflPCGJcaKMzYVug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503336;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wtogtMLrTnJilkLfHA9Pvw9PGA1fwdfA9L4l0A3Erus=;
	b=Qp0AUFg15My9MT5x23MWzyUCfYX1Tbm2+/FcGV63f84aCIStictp+VjFcBY4WyuRxMyc
	 gAuvvcDp4imcfKdBeP2761RaAmzf9IVEUidGkMfFFyM/mH7Dmbm7jGCEuC5G0LnGkzNPV
	 JjtUyE+28vGfqQWoCGtAensVNmPzxO/Z1D6UzI94ksdOAyyU9XLYKE28gRzxIwE2wiWOj
	 OPa459UaVv5lnainKK+1Dgvsqjjqlge8SKebnA3WQTFJUOJNtYWowdY5zwhy3aJ0qkhRK
	 slU5QOJtzrXcIZ5y6YMfZGG1RmX/wL+ZFN+3+FVE0va4Z/DROka6b1Y1nTPdh7yFUog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="l/oBHOVr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.45
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012045.outbound.protection.outlook.com [40.93.195.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8F4606A321;
	Tue, 24 Nov 2026 06:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=l/oBHOVr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJheUQCss4o3JkhC8D+g4klTBSRik4XjVvw8sWZjW4/O26UxqZLRQpggTSf1fuX31L/m1z2qP5ORg/bDLyIhnHBbNFvoVWGNjyAelZ6HgkrcnWg3PqtnXWhJJasD0w2QOlh02x003iSqYxcD9SOnXzD0jxupdRaBIZsoiZXMaZGDyWTG61KRf7H2rvL5QnA7KNeEeFhJSFsBYuQRKc0QIN3VHp80mEnAYIqzYfRuseMmXaEmOWEJApUGVMEVoF0cemu6+xQFm9pSAeApc3mgYjRMvd5TQrx9wFLRMB/R8AQKSzGi0n3LtxkVZQZRcDXLhVCglLcsO+Fm7VI9KrYjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtogtMLrTnJilkLfHA9Pvw9PGA1fwdfA9L4l0A3Erus=;
 b=jRqnfcLUInuNi4Kh+QcREKSryMAlPCuAUC9q2Fz5NwF2fMHsJYND+k6bQ0gH3zMlHfq16VG+bSa0lEcecWeB5t4Uxq9axeppeY0dJKciIpFoL3GxHb8jHDWZ1gDIpsXrZ1W5yGej/+0P714JPWOYLjl6skXfx3fxowlUrrgbwTY0G39mHV2D7ltftQV02siZuLE47R2BEO2B8zyCFzMWukl6V1fnZTO09HbTnoaajR9oYtihKWhhd5jqF6g9XtwDV0tlkbcDmeCvMibuk8OSChGKWMtXYlYdyPqWBhD+tQMet60+Rjo/0qOPX7nGrgKjo7VXob2GKay6rJ0kXGacUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtogtMLrTnJilkLfHA9Pvw9PGA1fwdfA9L4l0A3Erus=;
 b=l/oBHOVrhowD6QHNabjmXjV4iI6/XN176/oe0e2NsyDf4BElfMxpqWcJOJe2OM25vZvkN2JXsLtd6aOStmll9HbIOFW1oBbRdaSDQiNfAtbzXEwlRBltu1sVkI54YYsJweNLvU9cf688emPKnkwgJimXJN87hdlZGFTYF4cIAc8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PR12MB052986.namprd12.prod.outlook.com (2603:10b6:8:47e::11)
 by DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:55:30 +0000
Received: from DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48]) by DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:55:30 +0000
Message-ID: <aaedf504-dc31-4ef3-9ba1-b0076f5875f0@amd.com>
Date: Tue, 24 Nov 2026 07:55:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: versal: dts: Add PCIe reset IDs
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Sandeep Reddy Ghanapuram <sandeep.reddy-ghanapuram@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <b06d55abdb0671d9dc987057f44c989317e19680.1794473022.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <b06d55abdb0671d9dc987057f44c989317e19680.1794473022.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To DS5PR12MB052986.namprd12.prod.outlook.com
 (2603:10b6:8:47e::11)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS5PR12MB052986:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bd9649-25ac-4272-bcac-08df49f7eda3
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|261009223027099003|261021121427099003|261026140227099003|261022105027099003|261102123227099003|261022075727099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	qTeMwCSvQrx2cU52F9TzEMwsWRjGKcIfK/8LppKp/M/tPGUQi3spODreqwASa1ONFELky1pOirs9h3PNAAg7lnf4ta9jVhY0VDIhH1o7ThH4iFJx9cvJPrhgMRkQMSgax1Wyj/KgvTABj5hGXsbRo8h0gKGgmQwuFB93B/T6DOAN0eCdoYxO6i+lmIZ8srs4iORzzsxGqrNtjFJHPCxgFFALJTQNp9SK1DzN+eI+O5wDhYF8rRvAnvKcuV1lg2pKcyM3WIGh298MZz8hN7SVtbZsxqEfzB3yfpgGdWIeP+CTvDq+daX6HIsVH+TKDFjwOgkuTOrAVvezaYjMmGRrwtbLUtqkPaGZMNWJj05pnCY1xn0BvT9nj4oNtM2T5qnY3xcF5ZRsC/omtKlU6UAyNQum8BCcinrgpTS/KpYz78EC0JmXwEC2uwc9EPqgaztDyTRvG6GpHvOpzJI4XCcRUE6xWwmTjyU2PT/91lezE3sGH11/pnDm7eMo8N8jtLnsxrJRIwMva/JqjVJBY8ow8eembu1gow9KUYIfHRPE1P7jTx5oOsCsyi6QG0EvkBa16wiOuQSfS6q70KUSdcXb5rgOQfIciZtrMIk048upTpMVwU4dDoGAYXPruBNSvZoulobV6P+7sSzzH8f910cQXuXwDsdAQQ/wXFf0786SQYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR12MB052986.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261102123227099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1E4UmJyUTMvRFJxM2JFU21LYlpRZ1B1UkRIa0xUejAyQTVicnkwWng2eVQx?=
 =?utf-8?B?ak10N3BZOTBodFBCWm1DV2FMNmdQZmVLdkVBdGVuelVxelZKbW1DKy90ejlC?=
 =?utf-8?B?S3VjSjJUQTFsb1dJUU9IQW13cFNpUkRZdDc1S21Xamw4eDNac1Y5RG5UeVpX?=
 =?utf-8?B?UU5LM2tYSmVmV3h5dWt2TEY2Q0JtU05rREFZcHk0SEpWN1UrUzEza0UrWXUv?=
 =?utf-8?B?QW0yMHhtbkNUR2hQUU1MQUdReE83T3RSTG1iMURXcHJFWWtoUFcxUElzUEVX?=
 =?utf-8?B?M0xUa3dScTZ6OHpWQjFSQ013a1Y3dmNLbW1wdEZkWkY2eHRaTGNiZUlKNWtL?=
 =?utf-8?B?ZGxoY3VhbVNPSTFhWE1FWXRkK1h0TDRnYTgzRDVZOC9ZWnhDK0hzSmR0KzFv?=
 =?utf-8?B?UUEvNUx2b1BvYUVxanRPOUNSL1pxOGYrVU1HQUh1Mk14WU42RUU2Nzk1bGtu?=
 =?utf-8?B?UXhVT1lLVTZsK0VUb0p1RVIrdzJidlgwM0pTbnZUR0g0akF2bWUwWG5NL0Fq?=
 =?utf-8?B?YTF0VzY2VEE0SWxIUk8xTHhaeHBTSkZYWjUrcFdYaUtMa2MvdURES2VWdjll?=
 =?utf-8?B?QXNMUlBSZlVmREpLZlVpcCtZRUtpeVR5SjdhYmFQT0tPZk94UjJXMHRsM1lE?=
 =?utf-8?B?QXRHRFYxMEk4M0J5akVBWmZJbENEK09WUkx5SitPcjRIczlPUTRnNzU4amJP?=
 =?utf-8?B?bGZBL0FjbXlYQlBXblUvTFJnbU02SkZhYW4rM0laN3UzWW5iSnlQZjdCMm1D?=
 =?utf-8?B?a05EeUdLRzRmZWt6UzZ2S0NSYVlWSEgvWWNramVCdG1US0FwMXpWWFVXazll?=
 =?utf-8?B?SjNWaUljM2RFZEFaY0hFRWpITlduM1h1eDcvQit5NkovN1FueFIvKzFmK0NM?=
 =?utf-8?B?dll4K2llekFRZ0Z6SE1tMGwvK2Q5ZU02eWR5VVBZanphWEJjQVdiK2h0RCty?=
 =?utf-8?B?bkEvN1htVWVnU2xFNFRTbmFCbGtkODUvS285OVEvcERhK05veTRwZUtVT0o5?=
 =?utf-8?B?bnJ3QnNCRjFEaDZJSEF2eEdhSFNUWS9YNXZlQ3FVeUVGY3RwZW1VWGJGQUJu?=
 =?utf-8?B?cTh2ZWtJNCtndFAwR2lYY3RibVRJNFRUQkJMMzVoVE1WSVNIcFJZTzNyRGpO?=
 =?utf-8?B?OEcremZXR2IvR2gybFVBR0w3UUpZWnI4TzFLc3JWU1NiejV4TmhVeWlsT3hO?=
 =?utf-8?B?QnZvNHZHUzhuS0dHcG5vNWtzNm1ONjR3SlhUdnUycHRFRzJjU1Q0MzhCWFV0?=
 =?utf-8?B?eExjdlVyMHkzMk1UVkN5QytBNjltZHg1SC94RzJSaEJ6N0NwaUt5emlMN1dw?=
 =?utf-8?B?anFkWDBKeWVXaDd6ZEk1blFtU0FlRDVJMU5VWlpIbFQvOEsvREZYNHRUQmZC?=
 =?utf-8?B?eEhnN3FQdUl5VU9GWmRKTVlkU2RYdk0wek93TVpab3R3elBZaXF3dHk3cDd0?=
 =?utf-8?B?U3lJRzNxWE9jaUJQTi90V3RmSFRhNWxQSEtxNzNtRUtZdFp5QVhTSlhxM1pu?=
 =?utf-8?B?NlhwYnVXa1dJRHU2Vmlmb3Y1ODBDbGJ3WGNDYUNDN0M1dnBnVmxWVlYrbmhQ?=
 =?utf-8?B?dVRhNmlYbVllYWlQcGxzZThWNmNRTjVRNGJjdWlWUHpWV3ZuQ0lGUjNrUEQ3?=
 =?utf-8?B?eFFKbHlFZlU3YTFYa2I4NjJCNGFBNk9BSDNJbzRVOFdOcy9qd29OWTUvSERY?=
 =?utf-8?B?Wmc0TFZxRUUzSnBkNEg3dnMrVDdSc3d1dGJuMTVlMkhpbVQxbUlKODVwRlY1?=
 =?utf-8?B?S1ZBdlFJNGVZZDBxbldsNXhOaVVRdGl0L0FuYUUzMzJlbU9lK2dRTWYrM3FM?=
 =?utf-8?B?bnU3SnRqM1pEVjgvK2Z5Zm1SZTFBenovYXRtWDVxUlBnMkpaeTk3S2pLT3hu?=
 =?utf-8?B?N1pFQng4Umg4SkQxT2RLMHZ2MDh4ZG1Uc29SMHNGemxVeTdhTDlkWEVKVEd2?=
 =?utf-8?B?a0VhNW1qS3VVaXVHY3F5UFRNclUwbHFvOENTcFFvTXRuY0FlamNJczkrMjhS?=
 =?utf-8?B?ajR2ek1QT1lxbjNjQnY2d2JIbGhLcmo5ZEczb1RyWHBlaVQ1V3JmQXlGUUdx?=
 =?utf-8?B?QlNhVUg4WUNNWjRnYzMxUm5UOFN3NGhtekZJZVBrOVNFODh1RytmbHlxWkd5?=
 =?utf-8?B?U3MzMktkN0VJcEpkY3c0U3FGeVRDZFZzSkdpN25CZCtCVFVubDByMFZlVnlS?=
 =?utf-8?B?QnEvU0JoYzVIUC9OaThibHVJTEI5OXV6ekdGV2xxMytySGpVbEZ1UjdkY1dv?=
 =?utf-8?B?SlVPS1dVTUl3c0Y1bUtOeVpjTGUwZVZSU2owK3JHN0k1UlFWRi9XeHNmV0F1?=
 =?utf-8?B?d3hQd0MvOFBTTUhXNW52VlFzd2dmWVlZbkFwU3AxRCtOZTdYL1Frdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bd9649-25ac-4272-bcac-08df49f7eda3
X-MS-Exchange-CrossTenant-AuthSource: DS5PR12MB052986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:55:30.3304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+a4VxOhMLpo51pGQxkDV4ocROdBc7zlgpIlkldN9sh0Oeqa3HQaWQdNh/kxEQmB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900



On 11/12/26 09:43, Michal Simek wrote:
> From: Sandeep Reddy Ghanapuram <sandeep.reddy-ghanapuram@amd.com>
> 
> Add VERSAL_RST_XAPE_0 through VERSAL_RST_XAPE_1 reset binding
> definitions for CPM6 PCIe controllers. These IDs
> will be used by the PM reset controller to manage PCIe resets.
> 
> Signed-off-by: Sandeep Reddy Ghanapuram <sandeep.reddy-ghanapuram@amd.com>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>   arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
> index fe00f4a0ba65..f8189d1cbc12 100644
> --- a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
> @@ -102,5 +102,7 @@
>   #define VERSAL_RST_XRAM				(0xc30c05dU)
>   #define VERSAL_RST_AIE_ARRAY			(0xc10405eU)
>   #define VERSAL_RST_AIE_SHIM			(0xc10405fU)
> +#define VERSAL_RST_XAPE0			(0xc410115U)
> +#define VERSAL_RST_XAPE1			(0xc410116U)
>   
>   #endif
> ---

Applied.
M
