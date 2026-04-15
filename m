Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020109.outbound.protection.outlook.com [52.101.56.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F53D28BAB9;
	Wed, 15 Apr 2026 00:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776214543; cv=fail; b=eVHzP+bsi1gRKNTOWZt5wz+ko+ujrVYnAyQtaNiCvabakbNEwE9kNu5qrHI0rbMR37Ztfsd5ExFUxNRSJjpZsdxrKaRSy+PYSukkzCXpq3ISwtuiIS5udXbrlr39SPKh4WCvkiynRn77V7DCd/8j9ejwhvpl9KPNadha6TbhYqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776214543; c=relaxed/simple;
	bh=zD2IrfEyiP/gmQGHo9/w7W9RqMlJubv8t1Yix+xSgtI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W30J1fnuZgesRC5jCL6h/Ty2qwrdYZJdA5yBmhHYxCXxq1Nvf6hPQv+7AorQl0W9rH+jIkmn2qUHpv0Wkpdg6NHQfMOr3w7L5/9P7Ruk+aaq05EhMct0g2v0sVe6daVtGeuqGORqTaaEt8UBqZx3h92Qu6qB/BfGaLeSl0BYzpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=PXg4+yhD; arc=fail smtp.client-ip=52.101.56.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="PXg4+yhD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuuRTZG3/SDELHWAT3Ax6rw7YslHqeKfPCLflqDQT2DFVF8ho242GqpoLktJ/53fH5gaafW/ZWIOUQscwjJK/Ks8K2qdoK3KLqWuNlyRAEp77jugiNZSMCgDWxRgYzUJJ9B7Xny+lOxwEzqQK8SNmLXFn/gCY3MMEhp1p9+WiIdOMg2aUBqAMLxYEXGwCp6ltU2B5choRiHQTrIf/YpUkSKeUFMLqeoF2Wpn+D8qeiNQwS3tbF+Cxwm3e4gEpmsXOZi3PD0RLdbRMt3XI/thhT8rLuH5hNkt1Ksx4abr/uFK7Rr9o2qUG72nD9D4+JXEPnozUpNEAf7l4ylwA8E33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JisZxEEa5QeT6AqcCZbYi+6l0OYCTHsi5Q2vB1toknY=;
 b=qdxeOqDNwd2vO2M83Mm8LROfKg7nnaXsEARto0Nf9KcOYwZnNjrzvjqkh3S4CeyK+mrScK7h7hqzyKW8AkpLko7/qIWyDK/eg0G5vDIWMfdhgCtV4Gu6BNO84VrbfCt4QnhKlZOO++Qvj4rPUMgoWJ9x+f6Ilx08ZeQO8oaMLS81HEAZdqExb+usOR+IiQeN7DTBBsQoOugrvSOzk3VOnOYiy9TG23FMzz9AuKou2bcp6pK7jCw1DI2OuMR7LU/Rf24n/3iKjleh5d2svvTj+YgrsHdZbeOxQXqER5HV9YAJspKzeVGS6DFy/j39quQohg9JBqY1L3Oul+Fwq9iMyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JisZxEEa5QeT6AqcCZbYi+6l0OYCTHsi5Q2vB1toknY=;
 b=PXg4+yhDjB3j00zeRjmAk3atGFLJOuSe8ZNg2XCJ1/v7nMqXMqV6kA6gdP9wxrCdUpHBqhEB0rGK2+KdBp439/m2zg3YPhnG8Lhg6sUfNHmvvkqpbdtf1AyHngwmBnk4lUXrdwvGQng/zh5A7Vnxq7urW2N0F1Dhm+rgzR4IFpU2wQ7MtKdtp3tArkMKB2IwrmyCq24n09EJmQcKrJVA4H4qvR/N4UoUClz6ysKSEdsM88qbBxZ5+xWN1wEzy9OEF2BhPa1pCcBquE9bP8moDskTv1k2+nPtcvDx0P8gyl2sQeIFpFeJOW36HBlCdUBn1aq7VRbXLWXQMrG+PhEk8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by IA1PR18MB6396.namprd18.prod.outlook.com (2603:10b6:208:598::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 00:55:38 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 00:55:38 +0000
Message-ID: <cb6365b0-11ac-4e99-9457-f7d4f7086f87@axiado.com>
Date: Wed, 15 Apr 2026 08:55:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] phy: axiado: add Axiado eMMC PHY driver
To: SriNavmani A <srinavmani@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
 <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-2-fbf790f3f711@axiado.com>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-2-fbf790f3f711@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0041.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::19) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|IA1PR18MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ac53a8-4244-47ba-ca2d-08de9a89b533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Favq6i3VSisDKGlZe/o6nctMExs0LwAPpMsJGZzDHN75f8qPq3c4aPhg3tbxXQ+cWvdD1M4iVHe57BdB0cRQL2LoUWjvV0tpkFhV+JAEHG7iNzkS8pzlJfxi5qYxfipYEuXvqi5KXkMGa+zGZuRmwbfN4YGlSTKJ/E90CwvGPU1iMVqLdT0xYdpbwdu2dTD3s/ogBOal/M3RUYTEp9sc1Ic9WjTwErQo/9++Ogvh3d4Xn6n+LyeNZrrZZeRwPZnOF6zpCJlvshODnMQM8LIGHamcgAyKU+F8XXGjxCcV7buiOu5L+45IhKCcSrv+Znbc0Jcgk5KmDqL+8msYaxG2ZrO3FXYd3VMLOr2GFQpQUJjH5DGKPgAfnV5LeIv/P74AyA8oal7B/5NR2X8D3ZRyyjc4tfwScownPOW26CDtGWKX7cO7gQSiFXVVM7KaJeLYTwQAXH3q0a7i9yKBKobN+d53ZY8KrEObPLitcoVFSQfhZq2nfoT1vQdCdI4iKG8pH3Pbh3GezsC7gLJzdMtclzZIOLHsd757C8zf3qYZqFIPVINR+mBxFBfCEIQguXb4OHEaDf1gPXxFp+aX0KyZGjVCQj4Z3A5UtEQtyX097JUwEbhmNTo5fIxajbq9fovEd3GCG22h7bZ7L8jTeApUA4ebXmBu2PqQ2WBHY3k+m8hHSiV848zg35ZDxVWsBen8+VEPzvd3MHGdKi88LJC732GzgW+D7JWTstp3vsTMuxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1pSclFQVElyRVJWeitYRExhVGNFcE0ycEhpK3YwOUNtVzk1L2RwSFlKbkR2?=
 =?utf-8?B?bHZyU0NvQ0xoMWtLZTMvUVlIS292V2FJMEpFdkVMQ29FRVExSUkvb0kxQlo0?=
 =?utf-8?B?bTBFRURrQ014YkIxbXhHeUx3QTI0UmhWN3gwcU5MRDY4SnN5c0Z3NVV6SFdD?=
 =?utf-8?B?N21YV3JJOUxmZEl5NHFpN3RsYkI3aTZxMWFXelFNRjFTSGhBbXZxUDhtY3NX?=
 =?utf-8?B?NG1pSEduZHQ1NmRVNzRPdnFiSlIzSnJuY1Awa3NPY0lUajNsbUZ1OTNScWli?=
 =?utf-8?B?Z0VRTEN6M2RFUFA4c1F0UEhKN3AraUhGUjRqaStvVUoxVDNFeGhLbjFGUUcx?=
 =?utf-8?B?cC9wSHp5QU5ZMmhGUnROUGZaOXRUZEFEWVErUVRibE9sbnRlbFBteU9yK3BZ?=
 =?utf-8?B?R2J5bmdVcXowY3ZIaXEvT0dSK2owWmFxRGt6Y2NzelUwVEZGaVVQYzhFWity?=
 =?utf-8?B?V1Jza0tpaE5kdGR5Mmh6bC8yT1hsblhDVVY0eE5QZFd0ZWcxR2RDODJJNldB?=
 =?utf-8?B?cldFdVZWdGF6bythakdGeFZ4bi9hTTVncHdJcnFvc1ZNM0JMWEx3TTJwb3JU?=
 =?utf-8?B?Rm0rMnIvdlVIQVgwdTFFOXpibWVmYndqYTdiTmVlcGxOMUMxam5CSm85bmtW?=
 =?utf-8?B?NGdzOHQvdVdDbm1OTkR5MFAvQ0lnZCtTb1pGcnBoanV1eTlwcndkR2dUT1pG?=
 =?utf-8?B?L3NSRjEvY3Q2THBYL3RJa2ZHa2EyZXlWUWZzSjY0bXNGOXBBN21rUkJlc3V2?=
 =?utf-8?B?VlFlRWc4Tmk2MHZjNHl2L016VEJGSVF2aU8zT2lDQlNONDdQb1pQbHhyYU51?=
 =?utf-8?B?cWtxUmhMVGdyWHZ6OTdISkJYNXFsVDRFTmdGd2U4Wld5QTlkbEt1TFdLZGNX?=
 =?utf-8?B?VW5Kd0xWaDh3cmdPakxoY25OUXIwSVdoV3NCNzU1cVh0RVdIR2tWQm44a3k1?=
 =?utf-8?B?eHd2aDM4SEduek5LR21PSUJTZHVoTWdnank5M2xMOUttb2UxV0VDN253cGlZ?=
 =?utf-8?B?MW9ocFBGU1UwSmo4V1dyaC9MTTNSaVlCR2dRU2NoaEEzWW9NR3RtakdFaUdp?=
 =?utf-8?B?SCtMM2FVUDNYWWl1U0RoNVpKWjFzU3FGMFd2YlBjaVhnbGZ2aE9PbXpyVzNE?=
 =?utf-8?B?S3BSOE5VOE1POUVyU05xTDUwQnZlL1AxVWNzMm1uMFRBY3N0V0I2bW9iS2x2?=
 =?utf-8?B?Vks0bEtQMVVUTy96bEFkSzd5TVlBdCtTM0J3TlhoSTByZ1ZJam1QSERreENp?=
 =?utf-8?B?Y09HWklGM21VK1l0RGwyNlFsQkt3ZTZzK1pxU3F2Ui9rQVlGWDIxTXExMktn?=
 =?utf-8?B?a244RFJIMzdBbEdTbUVLS1UvNXhlR3pFYmdEZ1N4Uk1EdkJkZzY2aDJWTTJE?=
 =?utf-8?B?VUttbTlIVzJpOE54OXk1SCt3K3lFd2cra2Q2N083a0RIb3pZYTBsMUxNVlBZ?=
 =?utf-8?B?NnJUUFVRVTlzRTF3cEdscnN5c1BGR3BsMk1EUFpNMlFQVTRsR1JweWwzNlBt?=
 =?utf-8?B?em5xd09yNTRxM0ViSkI2akhSZnl6V1ppMzdmMnBIUDd0Nnloang1RFJjMzVY?=
 =?utf-8?B?R2szdG56UHRtdVR0cXpvNVZpb2VDblNjWXd6d2thd2MrYTdnd1lWODFjMkFm?=
 =?utf-8?B?ME42MlRDRDU1VVJrN1JXRkpldVVxQ3k2ajI1S0dOUWhCaDAvUm5wb2IvUklI?=
 =?utf-8?B?YmlqRjc0cDBzbkVVV1hVS3plSkpZRGs4YVcycXBYZ0Q0T3ppSWg5Rm4vRndp?=
 =?utf-8?B?bHZFNHJ2YjdTVTJjRG85Qy85enltemZyL3RSbTdDVkYxZythSzJuS2tvNXlU?=
 =?utf-8?B?NDNWSytjZDYxbjhkUTY1Z3VHRmIvQnArZGxWdWNxM2lYdk1sY3FDZ2xqYk5v?=
 =?utf-8?B?c20wc2V1UWtrMU5uK3Z4RndxLzlhclBSWmRvT2pGbXBraENlSkZ5bVVLTmN5?=
 =?utf-8?B?RFJXUXI3WkNnZm9qamlaUmgzMTE2M2plbGJUOVB6QjZVeDByWFJYbFZEZTd1?=
 =?utf-8?B?RWtydXpiTTVzMDFobHRlUTRZR2docHFYMEx2OE9MUHZGcC8yUHRKZU0ybFkx?=
 =?utf-8?B?ZUFoSGtkTExIRlZLRVdFVnB2MGJGZmEvTldUTHp4Zkc2QlM2cVBieWh5TEZz?=
 =?utf-8?B?QVJacWU3MXpNbjRHdk5XSmwrdFQ5SFV6bVlBWTFKaW9YVXJNTVZzYzZGdlFs?=
 =?utf-8?B?TCtxek9XTGJEQnErR2t2Z1ZsUlNvclo2ZHI5WExIN2ZzQ0hOMkFYeGNKenVw?=
 =?utf-8?B?Yjc4ZmkrcExMSTd4eTBGbEhJT3JpMGw3aHEwN3R0S2NPamlodTU4aC9xMks5?=
 =?utf-8?Q?NE6nlDOfoT9FPeMwk2?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ac53a8-4244-47ba-ca2d-08de9a89b533
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 00:55:37.8641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VflTYS2M3HibRl99Tt2VK5HX/AKKIhqwwXy1MpepwAj7rUlF1ZNXz7fc/tTLa17v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR18MB6396

On 3/18/2026 3:52 AM, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> It provides the required configurations for Axiado eMMC PHY driver for
> HS200 mode.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  drivers/phy/Kconfig                  |   1 +
>  drivers/phy/Makefile                 |   1 +
>  drivers/phy/axiado/Kconfig           |  11 ++
>  drivers/phy/axiado/Makefile          |   1 +
>  drivers/phy/axiado/phy-axiado-emmc.c | 217 +++++++++++++++++++++++++++++++++++
>  5 files changed, 231 insertions(+)
> 

Hi Vinod,

Just a gentle ping on this patch series.

Since you reviewed the previous version, I wanted to check if you might have
a chance to take a look at this one when time permits.

Any feedback would be appreciated.

Best regards,
TH

