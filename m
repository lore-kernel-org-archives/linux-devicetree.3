Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12733387341
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037998; cv=fail; b=TZY28pEBm+g4QpYTp5yZBuzW274+YR5D6Q5vEJYHSwUzCBAThFbhkhbzLpkQIKtYq9H/qHT6NluiYx6vGy5iJcLKm6c5Exki6TP5bHpVjQYaURgm2q5805dsmbDQzcEZBts6ZaRMykGM2Ddh+TFqPRb8MLNpgrck+dChnLKJuzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037998; c=relaxed/simple;
	bh=LXJwR09ZhLuqvHgoO4odI00RtjVd8gIupyjk11DvA04=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PYDKUUJxQP/adq1CnA1lxFW2VJpz4T7HqiB7R/CeEZ7g+cYPyR5jBrLzWqhtaQUJctJFu8ZfKy88PxTxB1tTDWJSweV1x2eYkL/PUJtSsB7i4y/kOQhPE+EEYZWIG68j0uNep5MbPPnBwmhNyz6gyhNMX0RF5zEiw7Q/RsIliSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SFBJQOGe; arc=fail smtp.client-ip=52.101.62.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SFBJQOGe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gob8GGSCYh1zvDtX+M0B8XAxfjm1VDUxp5OUwTATnfYKZIzGleGIi0P/0J9GCr0JB9f4Szm2UkQebwWxvdLcYmHSEDY8hlwOvS7R/euJuRJuNdn2vG4i8d7cpF0eJYnH5al4OC/EH+HkE5dtAZlUicOoX33da62+/y5RQhDbFkOb8SuxYX/SW7jtLu+JxmC0Vbu0tb+EC6Zpyz9e6rpRKKYQ7fNDZSDvBckPUKwLs0M0YZFnD1bA08nI2lO4G+xV5XQFzezrpNoxSWdmnBIoEzBtM3YPmH1QOVeZzFbsdN2TEcKDXqQtzp1a9Gd5rftD6Vx9QnHQyaR7llveLhh4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfSoQr5S7rjNGk7/Tvt3UKUoBzccsbauqMRf6tpq0Tw=;
 b=PQyRR/lgDYsocSDcsTsqdhbbvMYwfcwGt7vnoEAzarEhY0nKFWpdBShOmSkUxFFLxv2ndwjHMhReON59zaIfL2au7FqlA6EHhoeJCQ0qKE7wuy9AgBkuiIzBqjEsU5kWnFf6r0JkIpnGjoDJFw845b0Mf5rPO5SQjUZkMmAUkFowXDGFTnf23xyEm6sULl4Csoyoi5hjBeN4dzzHXxWkjFPfk7R0yvseln2ksSUE3+OAFpKCeSxEBIYRYR87xdjUMI+a2io6ovur1nJEojvp0garbG/oMmqYd4m9Bo4doc+Zy6sVXChSwsMN7HbGo4ebVvxuVQxUyPytm7atBfJkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfSoQr5S7rjNGk7/Tvt3UKUoBzccsbauqMRf6tpq0Tw=;
 b=SFBJQOGe/BdJvFuPEBVebiZrfVXeolAe5D6UBPLUzEcAD9Rgkz1HvZ01FeG/pzNQ6MCucmhSoZfVvE9ETw1XwW72fri/IkH7o1mOh+AIj7CyTXlt3gAsFZd3f/GST5fZlxbgZg0GJJArjRaZ9vK4YFXK3mwQxLjHE8+NVORAu1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) by
 DS0PR12MB999289.namprd12.prod.outlook.com (2603:10b6:8:424::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 07:26:26 +0000
Received: from DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587]) by DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 07:26:26 +0000
Message-ID: <b097cb8f-fe18-42e7-9c89-fd86678914dd@amd.com>
Date: Tue, 18 Aug 2026 12:56:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: Add Xilinx Versal
 NET SMMU CSR binding
To: Michal Simek <michal.simek@amd.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Tushar Nimkar <tushar.nimkar@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Anirudha Sarangi <anirudha.sarangi@amd.com>, git-dev@amd.com
References: <20260817105233.1557748-1-tushar.nimkar@amd.com>
 <20260818-smoky-jackalope-of-piety-7e4b21@quoll>
 <28a0da02-dcb5-4796-b0e2-20e88f2ef99b@amd.com>
Content-Language: en-US
From: Tushar Nimkar <tunimkar@amd.com>
In-Reply-To: <28a0da02-dcb5-4796-b0e2-20e88f2ef99b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0033.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::11) To DS7PR12MB9475.namprd12.prod.outlook.com
 (2603:10b6:8:251::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9475:EE_|DS0PR12MB999289:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f11a7a-05a4-4467-833d-08defcfa03a2
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006|4143699003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	UHbdqB3krnuzJvq07ua8ZgDWqnPP/Q5Q9aqE58c5ujjNGPgeqtPwqu4PP3xMoUOZNimT6bUA5ucm28qNOsgd6HBafDZVN5vw0yY5behuwlAxciPrhFSLuKmz7D370y5rDMJtUX2jiF3xTAuKQxwwzE00uvpKudVRI7QDXCPjPzKlX6bTnc8ls3nwHQCV3Yud/qhUzT28wMTG51BMUGrrUzBHYZ60f6cIP+Rp89hcN1rTauzxW6bLnsJZgpKslgd9fjPiM4qAN28RTR6IDYBOwdJqiT/8AGMWC6oiWznA+T0ceL+4+HhCAOREtffgPqiz69gN+8A/hnuF3FspeMBkKBg/r5p5UtXrYF8o0X+tPTTc5DhiCpQyPtxRC43aprqC4Ensk8NaMfeQ49B1+UYZFxxrtyuRV+DRN08ZrYZXxlVvb1v7nrsoWsYgp+L+u1fK9XiDjyTk+TTHyKD73BQT8TAt1KE8H9RyQfDy4XLK39V7IrG6dg+76ZO9m5DZCnEffEE7EjrEgrn0xLYLIac4m9dZGrNUILshmOjm0oxo2N0MssINwtJtf1yhC7RJYbzEZmzG69v55ibCCkRpSNmSfeuAs4sT7uvSdydVl0phEA85G9JGAPVR3cRUc+W/K+pOYQ7u5+ub8WNq5s7W/MgYLcBeE5XlFuRfAr7tnq5Jsac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9475.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(4143699003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0gvMVorbUp3ZWQ2amw0NG51ZHdBMW9NT1ZwdDZIVzk1aEJzcUhKdHZkZUNx?=
 =?utf-8?B?a21IejN3cmxnOW16TUpNdkJIWDRyNWV6OE50L3A3TVBteHlHWW1GNTNmLzdR?=
 =?utf-8?B?UlhJSWVGMUJoWUpWSU1kSlc2NmF1Nkh4SkpDenV6azFFKzNVSHF6dkxqa0N4?=
 =?utf-8?B?N2U1Z2l1U3BPblNEdWFSK2RoVm84S1ladHlhRHdKeEV0TFhyR2RidGpmZGlK?=
 =?utf-8?B?cXpXemVTNkhQMUJtTTgybXUxSDRnek8zRTMxV3hvd2M2Ty9WU3RTTXpKWS82?=
 =?utf-8?B?M25abGZYQUR2SUQ2RTJibFNVRGQxdkd6Wkd0VTJCeGVJOUFhOGR4MTk3d1lB?=
 =?utf-8?B?VEhLNlowWUZJa2RXR2NzK1Vmc2tLV0VoWnZKNS9nRmkyK2xDZ3BWa0dhbDRL?=
 =?utf-8?B?TEQ1OE9xaE1iRDQ3RE9yU2YyVG9kSkNCNTFUdVZVbWthZnpsWWc3bCtaeHdI?=
 =?utf-8?B?Z1dsN2RRSVlXRVlxTVFQMHFTSFgzbmp5K1NKei9lY3MrSmw4OGZQUXJTU3FH?=
 =?utf-8?B?NWpOZUI4cmowd01NYjJqSS9vdmZsSytrb1FGK282MUpnRXl4YUhhc3UyYW94?=
 =?utf-8?B?anhzUDA4Y0M5eVROWUUrSlkrYjFNQkVrODYrcUdmZmlvMXVSVlRhYmhiYjNB?=
 =?utf-8?B?VGNCc2xWb0pFVTc2KzFRSUJSMlczNExYKzV2a0NONm1kVHl6bGkwZXRObDZy?=
 =?utf-8?B?LytUbFhCcUoxV3QyRzZQUGp0c1o5NitKeXMwZE0yTjIxeXJlbzZqdzh1S2xS?=
 =?utf-8?B?OXVqRTRWN2dwY2YrVmtBOWxOVE9jMjExcXZ3ZmxSbGRpNERFdGJVSkt4Nm9H?=
 =?utf-8?B?WU5Qemk1TkdZZUJNRkEwRE1QeTNpbVYwMEFySUtkNldnU2IrOGppdHZjYTI2?=
 =?utf-8?B?dmgvS0UyL3pVbk5TVVNuWm02a3NlWjV2NUNUWmxpL2piYjFNdElLY04zUmly?=
 =?utf-8?B?UVhzWEErbDc3VThGNFZndTZqYmRwdUFwVXNjOCtDbklCbmN5QU1raHFBKytu?=
 =?utf-8?B?TUVXZGtNZDY5WW5WMHR4RjdZTHJTSnZOVUwvQ3E5Tmh5THJ4T2g3RDlTTWwx?=
 =?utf-8?B?SHdxa01YWXhOMFdxTG5ZRzRlZ3NQODdmTkJTSzQ1TWw0WktGRjdOYVB3Yml4?=
 =?utf-8?B?eGNRRW9vL0pLUGl1Z2ZLYzVGTHJsaDRLd1RTRUtPZGdnSnlEdkJnK2RPTkhX?=
 =?utf-8?B?aUo5U05xY0pQWjM5aW5mcXVNZ2YzeE9xSk84N3BCUk5YSWJIWjRIUlgyRUJq?=
 =?utf-8?B?di9SY0l0NUlpZjBJN0ozM2Q3bHc0NFVyMENwYUdyMm1EN0FwQUtidzRESy94?=
 =?utf-8?B?NU1CTkV2Mm40L1ZBSmZIZ3g1Z1hsdkJTRVRtUjkvcy9aczN1S3lZdFdkeUtL?=
 =?utf-8?B?azN1NEt2UEFxU0hSQWsyd0hNbi9YSnFqQzlNZG5tcWNvTzdUaEI4K01qNWV3?=
 =?utf-8?B?KzhvVm43dHM5L0lxbFFxOURIcUhNVUdBMTVIRHkvd2lER21odWRaRjMwbGpM?=
 =?utf-8?B?cSs1T1VmczBYeEJ3VjJCazIyRWNwZU51V3djRTdQVU4zbXFnUGt2bXl0OW4z?=
 =?utf-8?B?TDZoTmxjeC8rMDhJT09DNFZyYmFCbVY0ekNPMUZUZnJPMktJa3oxNFZ2RllB?=
 =?utf-8?B?ZEFxd3FFUTJyREhnWjZ2OVRRQUl1akhvclBjSC9XZWVNd0xBdjJYalVpb28r?=
 =?utf-8?B?QkhnNkx1RUFoS3FSRnBHdHB1eFd1RDZpVk1mbnZvZnluSVRVLzJaRVAwR3ox?=
 =?utf-8?B?OUl4MDlnTm1lL0ZUVGluVzdvT0RDc25aeDF4MzYrRmZwUWRGOFB0Z05Ec3pt?=
 =?utf-8?B?WlJ3R0VtUzF3YmUvR2tHNHFrR3hHckpmN3JlQW9VRjBPOCtNOGZ3K0lGcTlS?=
 =?utf-8?B?bEtYVGJENWR2azd4TTVxVmZ6eXBGWk5QQXRTdHd4dDNKVEpyWHhBSTdSa09h?=
 =?utf-8?B?NzcxRUw4UWh2RDNHckk0QXdZQVpZV29Rb3A3Zm1yeXkzUEVnbUhsb1lEa3NI?=
 =?utf-8?B?cWpQeCthQ2ZmTGU5aFlVd281WHJ6cUhuaHdIRjgyWDRvVHFRT2pJQzVkTi96?=
 =?utf-8?B?L0poZHl3c3FBNm1wUkRLMzRqbGdUK3JPZTZkMkdiNmVHaGlJTHQ2MStjZW4z?=
 =?utf-8?B?b2g0ZFEyUzByYS8zekhlTFVXNkEvNmcvT2x1Wmt6eG9va0NWNC85bGo0MklN?=
 =?utf-8?B?R2JQc3hhVlVVWE9NRzQwcDVXVm9SVU4xcUxPeGhBY2xOTk5XM04wTklIb09L?=
 =?utf-8?B?SUx5SmJMc0FTTUhiQW0rY2llekhoUmp1QXd4T2lvMDlOMDlvS3R5aHYwZ1BU?=
 =?utf-8?B?Rk51NlhYdG5CVERoMWNDTkZFTkxjWGIwVEdENGJESUpramQzYXU3UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f11a7a-05a4-4467-833d-08defcfa03a2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9475.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 07:26:26.7104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oM9CrUQVHAXrqpSwlGDLmCbqzHzaD2aq/qTVYJHdE8csKJyuVqCihaHJWrxUZ+5wpxu4BFguFYtMCRekgj0tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999289


On 8/18/2026 12:48 PM, Michal Simek wrote:
>
>
> On 8/18/26 09:03, Krzysztof Kozlowski wrote:
>> On Mon, Aug 17, 2026 at 04:22:33PM +0530, Tushar Nimkar wrote:
>>> From: Anirudha Sarangi <anirudha.sarangi@amd.com>
>>>
>>> Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
>>> (Control and Status Register) interrupt controller.
>>>
>>> The SMMU CSR block acts as a vendor-specific interrupt controller
>>> in front of the ARM SMMUv3, providing registers to enable and clear
>>> standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
>>> Interrupts must be acknowledged in this block before being forwarded
>>> to the parent interrupt controller (e.g. GIC).
>>>
>>> Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
>>> Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
>>> Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
>>> ---
>>
>> b4 got only this one patch, where is the rest?
>>
>> Can finally people in AMD start using b4 to send patches? How many times
>> I need to ask for that?
>
> Not sure what you want me to say about it. I don't think that this is 
> related to AMD but only individual developers.
>
> There are also other tools for doing it not just b4. Everybody got 
> these instructions but it is up to everybody to follow them. When 
> something is sent out I can't do anything with it. (And internally 
> this was sent as threaded multiple times).
>

My bad !!
Something went bad while sending outside.

Krzysztof,
The other patch link - 
https://lore.kernel.org/all/20260817105251.1557770-1-tushar.nimkar@amd.com/
and I will fix this.

I apologize.

> Thanks,
> Michal
>
