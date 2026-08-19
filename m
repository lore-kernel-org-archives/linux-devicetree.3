Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171483C3F75;
	Wed, 19 Aug 2026 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118068; cv=fail; b=VsdgCmwZublPAdRi7huUuLnJUhz4+FVTc/RbZH/qH6zqRkOB/YmkekO/XXUVrDXg8EdXa7Mw7G3x7IsIKnlUoahthAy2CqepqVsTT7FBnKg4bXvfqXsfAsASPK1EWVDcKgYMZXr/T8qb31irQfKR8FxRU8rkVcKrQPeO6rIruBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118068; c=relaxed/simple;
	bh=VYWmHTVP5PB80tRRbe9sUtt1YvXcIMkJfksBxeKMNjY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ubWMb0+Auj/+hGXfmAMyrYTKGzD+ALJVTvogKdn1bIAMzqmHiSCJY+9Ot/l+4RkJZLLDKFkN/it9mc+KxSnn+tC0yoLGOCdQzxdVvGzhPOEFB8124gGVh21CIChJglTnOqfH23ElGG58IkKtIomZnrSSlWZ8CTHonu19y1B0Bck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IuiihnEK; arc=fail smtp.client-ip=52.101.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IuiihnEK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuqwKH8GFKjqv/lI7upBG93dpVqUur+lFWQdEv9fZUUdEPcf0ZUFLawstyuOGPSEFZSly7zJ4NNDEKF/7x4bP6arXwsuZevmPsdNxokv5l1qiFnwr/HenE8dZY0u5qIIRO9gGDEA5yb72MERuytNepfir2n2tV4IexneJqbXsWDnaqFfYKOBWSiYLsG6E4O4b30JXdW1DCyFizGCPbwCJsTx/JPQn9+k/saqa2b8QSfAGoZPoyvs0q61BvOe9uLWf1NMF/5peMbgenEP3pzbDfab8nDT6Xn8W6u4J4O5zKv9Rqdm5dHzjf6w2iVX2UbwPMs4hCX3ggGfPC92CFyoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4gkmXoWG0iZcTcXHgvCKt3Za03WW1T0ihMLG5PmokA=;
 b=wby4E9pLFglzqDZbJ5ga2Mh/WqJBWx/xVRMoIKJtiRAmtUjJsp9xev/4XKjVI3dcteWgHxS9e5QxpM0KHCCNLlCOEPvL13rcAjRd0aPejl0gp76Us68kI3gn+C5pNi3YNq6Deg1waiEV8XlrFDic/BPehD7gh1QeqTlB5eteAjwiWZRzm0ac0plJF4ccvc6xwDjL1FpZBVoCnCfBS82rG1h+jHReV1nl+WbhZw+IcUugwYqRn7qpOrtSF7pG9OSvHCOXrF5bRzI6csrrthcXxXqivPyEs/K+MU4lrfk1usEg3FjvoVbOQZXhdtwWwbF1VhVNYQr6j1s6j2+++On5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4gkmXoWG0iZcTcXHgvCKt3Za03WW1T0ihMLG5PmokA=;
 b=IuiihnEKSnpskGZXi1tBCIh5M2Md9QAwtcifeX9DgEJVWE3rJc6SpcqXlGoH8GzNL0tBxr5FLwP//cO4MupAsoXJ4st3flTHYxb3D0RhV4BD+oK92Yto2Rt4F0O1jEJxkfEXO2iBf1idbKgni3Rgr26TZNEKL9Y9ZBHSqhmnAxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS0PR12MB7769.namprd12.prod.outlook.com (2603:10b6:8:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 05:41:01 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0315.016; Wed, 19 Aug 2026
 05:41:00 +0000
Message-ID: <c624a688-3fab-4c38-86e0-9f84751aa167@amd.com>
Date: Wed, 19 Aug 2026 07:40:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Patil, Shubham Sanjay" <shubpati@amd.com>,
 Shubham Patil <shubhamsanjay.patil@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
 <20260817-spry-attentive-hamster-ea3c0f@quoll>
 <372395b9-be14-40c5-984d-3d725f20cec9@amd.com>
 <003fbd61-2e3d-4a31-9b92-60dfeb3bee34@kernel.org>
 <20260819-spoken-tiring-445e92a78235@spud>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260819-spoken-tiring-445e92a78235@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS0PR12MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e90fc6-86c8-4017-38e1-08defdb4739a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|6133799003|10067099003|5023799004|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9xdoQLn3EQsFm8SMaDtU1pfO1Lf6rSpplbLWgLabw3gu0BjQkz3EM2s2nnz7nJwYvOg4duZR6bkvnwmRYoYHBSLNIIOLcUPTItWMWiHB648FZNUumFnnBqbOr0twiqGNo3zy7HbIOEqGoF4oln5UnIHJCihgPQpvmu6J8z6pB3Ta2t485EICexbY5W5//Qjl2CTjZTYkb7zcIo/7JqbP6nyVke+Ji56q15ihOidThBs+Gs98uBu5C7oYL2cWD2iYH0lSQD0SV9Mf3gKEKvl6GKp1uURfJiLqfXd6g0RblroS70OxS/ccotRWmw4tb1JDTsyYgJst3ewfyFGUTPABv434HpvcyohxGTTw8+7BknO17I2uuanoOSOiGTbeuqGpytl7Ek7rFW+AozCP2KOms23nXioA/a+M2SdFPbkwhNn9eo5zg5FL67VDlaRQzIouta66qHGAbofZsE2tP+5ZDGy8P+MUXuWQwX2Xuct6WOTIYBU/8TKSVc2I9/12qetTjjZr5v2AOUpdDlFgR3PRjtUSW6gGU3cTvFnMDCyuD1zz7cLmkTdyTrupHtC8vgv4tXHNKgh15b+j44utuOC5Lx6ZreUGen+IS0VjwnUl36TGUZnicnvIzphZUt9d475u1lhPQbz6479t8/m0P1hZDbOWDO+jJd+oQAG7gXSdzNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(10067099003)(5023799004)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGsvN0lRWVhmRllIbCs1QXZHazcyUGVEWDAwZjFZTlBrUkt0NCtGNjZmQ21C?=
 =?utf-8?B?MVRtNWRRWjBqU1FicVlDSSt6NHNvclQ0RW9hSHR6VXJmdHg3QzZIdTRUM3I3?=
 =?utf-8?B?T0pPOXJHODExdDFMVkpXeko2Q0xRakFic2dFZTFaaEh1dXBVMTBVaHFRQncz?=
 =?utf-8?B?SHZWL1d4MEQwRjJqUlJlNEpVSWZPV0lqMjRwdDRBelVDRGtaek03djFYNU9N?=
 =?utf-8?B?UU5QbXdENW94NmhGS2UxT1RBTCtBUzFKR21tYTlKaVU3WGpqTERySWcyVE5h?=
 =?utf-8?B?bHNOaER4UktKMkN0NU9WWmpsVjlHTCtGN2VZUC9TYWFMUDFHV0dTY0pod1Fj?=
 =?utf-8?B?dFEyNDVnQWFvam92N3ZUUXNUSTVwZ2dscFk1RE5LWW9tOEZlT3BmZUdERzBn?=
 =?utf-8?B?RW5JTGh3a3F4NDgzOG13anFyQzBna055K1N4NkpjNkhySTQ0VzZ2cEk2RGxn?=
 =?utf-8?B?ZEcyWkZUL28zSy9IZ2t3TUtBS3JZeGEvR3VHU2xydUl0QVE4TE9Jb3ZSRzFi?=
 =?utf-8?B?OVdaT2FGZnJsb3J5UW1XY1NXTlU4Y1F5WXB4YTd6OFZPaXhYOEtiRFo0WFNt?=
 =?utf-8?B?OXhPcnZCdWVHcG54cSs3N2tzVFA0U3RSc29BUW1MNkZ3QzJoaVc3cUM4SmpX?=
 =?utf-8?B?M0xMbEtEWDhjdm54K0FaK3JLQ2N0ZkFxbjlnMnMrUHhQQk9ZTnp2TnlnajRC?=
 =?utf-8?B?UFNZNVVvNzE3ZjA5ejFRV0FxcmUzQjA0cnRYak9pWk1SQzVlaHIwVHhWREFi?=
 =?utf-8?B?U2dmWTJ2blJJd2tncUpnNDFBbEY5SkFCMkVOQ0NwWmNBUk5zb0Vsa3krQUhz?=
 =?utf-8?B?TU5IRWtvQWtHSnE0ZnhqZDlmZTFOa3l3MjZrcFpmMnpwRHZwOFhKZUpXVzBp?=
 =?utf-8?B?SFVodEk4ZHZieCtyUWNhNGxZQjZOOERDTWgxV09SVGcxbE1hcHpzczJXWEls?=
 =?utf-8?B?ODJ0alRYZ28vcGljTXZjM3pKZGt5c2xzZmdnUEpDUDl1ckk3dDNDNUhaNDJ5?=
 =?utf-8?B?ZkRWY0dJbklObTVnZnA5aWg4bFUxWTJBbHA4NytrekhXODV3a01MdFNMTUMw?=
 =?utf-8?B?UXJiREtyRmF0Z1ZnKy9DTk5GR1lYeElnSXM5WmNCODZnQWQ0YlJMMmNCaUJr?=
 =?utf-8?B?ZktWM2QycS9VUjVNKy9HU1Jzb0Z2cldUTjd4RHpvdHorL2JXK2w5eFdxQm1s?=
 =?utf-8?B?VGxFUExCMVNvMXhIajJ0R3NZTmJQTWp1WC92R3R0VC8vTTI5dnd2YUNTbEh0?=
 =?utf-8?B?U1QwbGdhaDVvcFd5dkw1dnFpTm9uYnZsR2syS0M4UExvb2wwTXlXL1NhNHBQ?=
 =?utf-8?B?T0ZDQ0RycHhhM1hCTVdQa1VSdGJIMjVrdSs4VVMrbUpOZ3JaaS81OUljN3F3?=
 =?utf-8?B?UlBVMVdEL3J3Q25CZVM0eGU2cXZRYktlRm1tekFXVDRSRUxrR2d2c1hXTG1W?=
 =?utf-8?B?M1lqSmFFRkNPMnBuaEFWOUp6My90N29OeWhBWnQ0NWFhWHd6cGtnWWxvSktW?=
 =?utf-8?B?NUo3ZkpWbzMyS01ZUVZsVit5SlhpRURVenBDMStJaFZ1bUN0OGlSRlY1UWVh?=
 =?utf-8?B?Tzhyalp3MU1vVWx1emxmNFRMaE8wMUowNW9tMHkvcFVuTEVGanBMbUZOZkJn?=
 =?utf-8?B?cDBrR2U5RWlyN1ZTRXV4ZU1tLzJXT3drUHBtOEpOYXdDRGZ4Y0R2dXhUeGpw?=
 =?utf-8?B?RDI5eXN4YllkU05WazN3YXUxRldBVXlKN3RNaHBLbkVIT0ovWWNDTXJqeDBw?=
 =?utf-8?B?Nm5LVDNKbUVYOEl2Y1BQUHMrQk5Bbm04OUV0TlBpY0VnWmZ1WXpRTWFWSGxa?=
 =?utf-8?B?WmxNcEx4Slp5Q2hQTzdJRVMrWFJ2Z1BQKy91UjZzenNTVnErcnRrWVhzZUJX?=
 =?utf-8?B?WUhZVENKNzd4UjZ2RDJ6ZGZHYXRmV3dOaDhkZzFJaFBOd3ViTTBnUU5sdDZR?=
 =?utf-8?B?UHFvMDJXMzc1bnhwWWFuVkc5MmYwRmRTS0lxbE1jandYMmE5T0Z5SS9PWGlh?=
 =?utf-8?B?N1BzOUZnWWpCM3NsbGxKa1pwc1V4YytHLzBpVVlMVll2QWRmM2xXaHNlL0gz?=
 =?utf-8?B?VEo4T3U5UXBtaGRLQmNwY0hxckpQQ1JObFNUU21lSnNHYW1sd2hiRWMxMWZS?=
 =?utf-8?B?UVdWK0VocWNhcHFpU3JUb2VaNlVTSHNpS1J2NEIvVFhUMEhxWXNsNUwwSzdi?=
 =?utf-8?B?T1I3MU1nQm94dG9xRjZmTVI1bUFaNjhWbE1PVHVJRGZldmRPZkszZWJjTjZE?=
 =?utf-8?B?bmlYMjF2RTFQL3hwTXBkZEVMOTNDeHZ2b0s2b0ZyRWFpOEFlam42a2VYbDFB?=
 =?utf-8?B?K3M0OTkzY2M1MVFXTkQwN1FDeFdSZUdhNzMxVnhvdjBHZk1nd3RtUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e90fc6-86c8-4017-38e1-08defdb4739a
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 05:41:00.9569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YZ9FWH49xOVhTctSOrlFH4616CAyM7Cn1voh7gaTf7WLtBrJC2dGqkYvHnQYVmU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7769



On 8/19/26 01:29, Conor Dooley wrote:
> On Tue, Aug 18, 2026 at 08:36:16PM +0200, Krzysztof Kozlowski wrote:
>> On 18/08/2026 14:02, Patil, Shubham Sanjay wrote:
>>> Hi Krzysztof,
>>>
>>> On 8/17/2026 2:20 PM, Krzysztof Kozlowski wrote:
>>>> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
>>>>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
>>>>> IP. Describe them with two boolean properties.
>>>>>
>>>>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
>>>>> capable design is always IBI capable as well. Both events are reported
>>>>> through the controller interrupt, which is therefore required whenever
>>>>> the capability is present.
>>>>>
>>>>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>>>>> ---
>>>>>    .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>>>>>    1 file changed, 23 insertions(+)
>>>>>
>>>>
>>>> So the same SoC using this core will have different synthesis options?
>>>> IOW, why isn't this implied by a specific compatible?
>>>
>>> Yes. This core is not part of the SoC's fixed hardware: it is a design
>>> compiled into the FPGA fabric. When the core is added to a design in
>>> Vivado, IBI and Hot-Join are options that are turned on or off, so two
>>> builds -- or two instances in the same build -- can use the identical IP
>>> version and still differ in which features are present.
>>>
>>> The compatible string identifies the IP core and its version. It says
>>
>> Well, you miss SoC compatibles so you cannot use argument of IP core.
>> Although I do accept argument of two instances in a SoC having this
>> different.
> 
> How are SoC compatibles relevant here? It's an IP for FPGA fabric, so
> even if you made some sort of zynq specific compatible (which I am not
> advocating for to be clear) the IP configuration options may vary
> between synthesis runs, so a SoC-specific compatible doesn't help.

SOC compatibility make no sense here. It is soft IP. It can be in any fpga board 
with/without hard blocks (ARM cores) in different configuration per instance.
You can have unlimited (obviously resource limited) amount of IPs in mixed 
configuration in the same device if you want/need.

Thanks,
Michal



