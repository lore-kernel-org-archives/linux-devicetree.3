Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036B41685C;
	Tue, 18 Aug 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054531; cv=fail; b=FwDwHaw8F3p5pgT+Ba0xm6rJTh9PxDXD2Ei5vuw0ZEtKRx3s4JcRPHUhU7IB5/UeEBr/2G3m1nsm7rhWf+q39T4Vz0Y8uO5h+MYirqmq4mUZxEh5qvEeFienWp083nI8pTE6KhVGK0UUyA1ZjFkOn9PCU2zx5naEfozl3+LVUi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054531; c=relaxed/simple;
	bh=gNsbLIvgYuMTFFZcZjnSdB2IjRB22NxTcoKr5oH+kDg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fhNgxu8upOodZJQHrXRKl3JxBXaaoy4y78kgQucokSzleee0P/L4bPluT0L+NgYOWhTGpef37JaHT0prAcTABVAYD19g1DF3+/mCUthDbBzqJbr/rAY3HrkxZB3ewcpVhglsglcWaGmZxUf0z+Y/KqoJvwXKDr8Qbx++xB3Lrh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1fIfoyxc; arc=fail smtp.client-ip=40.93.198.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1fIfoyxc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFmZz/SZI//NPbd+Yn/7JrxBrVZ/nagjp+JNbbSskS854CkiKud17MJRG9eFNEFOkSLKY2hivPD7gP5Aj6B1xQanerCLBOHodRuJGxAcnfsVNtDjCmhlK++V606QhgV4l1DH4w+bT6LYGj4QWLtJRo/EkgiLwX7UI0Vw8l7Y1Km8e8w63pd1vBroPDCVUipAD07Wn7vpEsEYc9VwDVGIpxUc72J9Hed8vTRzeNhJ+n0E5du1YMyvDTSOUtVOnD4w4apLVj0+kVBB3Hh/VWIwwPBPhBgroGLDjkhKwcDcIBJ8fDU2AaGatsDINB6/MKmZR+MwuKg2PfJMN8VBJBK/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2PsPwwpLxPWUYhgnLF5NLFUtZSzIB6avB+TjahdL10=;
 b=DVgQqJGwcuyxC8fpOiRJ1VyHuDy7IOIelMavdzQTEA/2v9ZS9BgB+NeFKUEP1lpXkTIYg6CTcHGv7D/AiOZdyfJDWjVG+bXgJ8Zmrq1jQ757gAo3rVdMgzkKtjAdqBs59FoGoS/+nsfJb4V6UVM1KJUy7x3T7NeniTt0+WfLzhrFc3wwoUdyBGfq307p+/kIiFIhmHq0yQ+Clv6ZXoz7WfaBdFE4DE8VMhFFL18ppUZVhDS20YvdPGP1XQK0oMycCnA50a9ED6HbBoUkJqlGZ4kDJhy+U8CTmuHvpF9HXrCV2qLyvAZbMWEbHNbJvrT22Q5Bp+YniOp2x9vujMuYrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2PsPwwpLxPWUYhgnLF5NLFUtZSzIB6avB+TjahdL10=;
 b=1fIfoyxcGywwDlaQZX54flj2D/FNrq31/mgMYKNsopC4zmpzoXyQy8pzGHo0J/rb7HsAbBsfqKPTcjkHE6DaFTGGBkTJetjQMEB2wswYrgTkBwUiIlbzHGP7L0kXtwe+9obvU9J9TbIj8YNTNl2S8sRWFm7XGJU+QsMMUDgnTkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by DSVPR12MB999193.namprd12.prod.outlook.com (2603:10b6:8:496::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:02:07 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 12:02:06 +0000
Message-ID: <372395b9-be14-40c5-984d-3d725f20cec9@amd.com>
Date: Tue, 18 Aug 2026 17:32:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
 <20260817-spry-attentive-hamster-ea3c0f@quoll>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <20260817-spry-attentive-hamster-ea3c0f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To IA1PR12MB8408.namprd12.prod.outlook.com
 (2603:10b6:208:3db::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8408:EE_|DSVPR12MB999193:EE_
X-MS-Office365-Filtering-Correlation-Id: 68039155-0840-4e86-2aa1-08defd208650
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|18002099003|22082099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	HZVjDaJP9NC/xiCgSAFrDqLSnc71GmLwhh4AfpJ7ym8H9YJyAyxNCE5EycC/vfNxYfBaLt7mWrCKAgIlyOq9KgS7KSntmtwLAddLbmftHUjcKdrEi30DbdqLs22RW6qS9l9SJZsJplRVQXaVG1di7Ya1PyvCMQ6khJ8WIu2cA+dSa5aUE1L7qEVTqLuP/BEjF9cqpFqsdM6qDM6nA6Gs0CfpL7gghusvWIK1QfpCo1zdIODv6WAZhe/HdS5Ox4gM/2WvRz4LEuFf9h74MNwDw+jY4Hmqibx8OzmhdHAGmcJnlm+iuXhaCP6l1ee35B+C69DH17NoyVZeiax9wWwgQT6zdnz+Jnumr8vC9lZvlN4yWdyFKZyqB9ujZKy1xXoEX1TAbYnpz6yAUrJs3KN2TvtN07HfwajUzZih88Z7pfbSrof7hac9+DqbBt72HOZAsJrWcqDp5j9xQTBOB7+uZur9v9bOmcYHIPOKfNVpfcn+7ZnBjPhijC5YtSNTir8PK1C4/CkaZXoKAOU0TZ+1k6yfUZmd1D5V0uMIhcrhb9NPVvSSAdkAhOs6OUpmx+mxnWqwlIKnL9roCQ77kZ7+ifazC8MqZIjymRd89uKOUnwZ/jWe7x0HLvOhm4FTq+jRwKYUAbpdMfbcsV9um1Cnjofm9vvIUk3YJbyTDg4U9sM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUx2R2MzYWwxN29nbDBHSUcxS2FKVW9OWHRZRjZTdVZsQncxaGVSZE0zY0p3?=
 =?utf-8?B?WmdtQnNJeGtEblRXNFFiL013cjM0bHJWOGNRdXBDckhsOGVmTE9UVk92cGx0?=
 =?utf-8?B?RFVmakRXZ09PZFloYUdjTWhnckVrQTR3cUZRc3ZTWk9qS25CWllqdSs5R2Jv?=
 =?utf-8?B?YzRHd3hOZm84Z0NZRmdVTUUxVlc0L25qVW5QcWMwallKREZ1bjV1aEJJNGlv?=
 =?utf-8?B?VnMraFVEekwrcTZXK01iT3ZtdFJkVWJaUGZMb0VKdUtZdG9SNm5KM2RoaVZ5?=
 =?utf-8?B?ejgyTExrdGlPckhiUXkxbjkrVkRZcWdEV1p0b1FzQzB2eGcybEp6MmRNYzBI?=
 =?utf-8?B?V1lKV2hQYXZLenRBUWNVUnh6dzhKNG9kL2I2cU9oTVRkYitlMUJkeUtzNnFv?=
 =?utf-8?B?aUJsZjlHUjlDMUhXMTkydTZ6R1ZRQmZBTEExclZ6cHduNXQxUGlWNkhNQXRk?=
 =?utf-8?B?L01HZUJHRCt5WWFsZmR3L1JpaTk1SW51dEhkbGRxU3hlbkcrTDRaeDNJeDlO?=
 =?utf-8?B?TDl2WVhReDZsWk9yNVZicm14bngzV1hva3VqTzIwdkhrOERPYk00V1V6cEFR?=
 =?utf-8?B?dmh6UVE0OW40RjZmWEdVS1krTFlUMFk5NkxUbE53dlZ1RndkWHVkYlZwYlpQ?=
 =?utf-8?B?WWlPOG9HSmsvQWRJLzFTaXkyQ2t4dTdvZlNmUDdUNFc2NS9wTDVuS2daSzBL?=
 =?utf-8?B?RGthS2hDcEJzSldlaGJKUDVJaytuZWJOOTA5TGZodnRTMWk2R00yWGNTZkY3?=
 =?utf-8?B?L1EyOGxuRU4xVkxHMEJkWEV0a0RjU0NvSEx6UE9zZ1g3eHVMNEpyUDVNdXZu?=
 =?utf-8?B?bW0yRDZVQ2U0ZmhrdVU1dWk4djJGWE9iQ0pwWDZWcTdkdDhZaUhvTUduSmZZ?=
 =?utf-8?B?UWxFK3J3Vmd3MS9LNkFMb1BDaDMyMDc1OGc2S2VZUWordXRTbkRNUGh2OEgz?=
 =?utf-8?B?TTJRN0RYMWZiQ080bWUwZEhYQWxzeUhqS3JvVHpSMHd1eTlHNlZOcWtTUElu?=
 =?utf-8?B?NlQzOGtreVpsUWQrdlduNjRza3V5S3dpNVByKzlXYjkyNDA2c3ppZzhNeVUr?=
 =?utf-8?B?QWZIK1NLNjdpM2h1bkNOQ2FCalF6SCt5VERUVEFNbXIwRHh2MmRxdDkwTHZU?=
 =?utf-8?B?Q3M4WjhMTjl1V3N0Um8zb0J6N01kQUFFTGFnZk0wSFRYODhPejRLdVRlclc1?=
 =?utf-8?B?N1pCREdVVlFDSnMxUm9qRVNaY2RzWk00K1RtbWllUFNXZFJDTk4xL25sZVJK?=
 =?utf-8?B?T3BUTnIzN0RxdVZ6dmFpaVZVVWJHOEhhQmIrTUF4NTA0ZXN1b3lsdGtOc3Zx?=
 =?utf-8?B?U2Nob04xU2RRVXhPM2wrRDc0TncxYnRqM0cxTmR6NDMyTlVPckE2N3RtZmM0?=
 =?utf-8?B?ZStIQzlPM0tKTG1oV0liajNxcFNURXZDN1c5UmpRWG5TVnRyRVhLOUd2VlJ2?=
 =?utf-8?B?Vm4zZW1vcEV6N3RZcWlHUzR4WkpMb3dmU2JrQTJxQ2xVQXZXOXVRUmpFYk9p?=
 =?utf-8?B?ZEgvM1owa0tFeUhGT1p3T3NOdS9HMmovU01qdkI3YlpDRldRWVc4VURveTc2?=
 =?utf-8?B?bmZPWlJOSnl5MmRyNXAvRE1ZN3YxRVJPWWpMZ0dxQWFqNWZTOFFOR1l6T1hv?=
 =?utf-8?B?eVBJM3JMMFVMVjZZK3hEVmphM1dISEFoWDZEQ3ZRbFY0V2VZdmlQVW0vWHVT?=
 =?utf-8?B?anIvYWR5NEJaMFdiSGdWVFZzanNubmVML1ZLZ25tNVlrNnZYMmd6VEVYODVr?=
 =?utf-8?B?U290MkVqNkVUeGxMWFVhU3N0SGd0UnRpeVRXTSt5OFpicVRZZXltOEsxT3lJ?=
 =?utf-8?B?aW4rNEt2WXBEV2VRaHJpemNJZlpjNStpNTdlMFJCbXB3SEswWGN4V1Q4Zk1R?=
 =?utf-8?B?eG9VNWVzR01xV2RmdlNhc3Q1MnhJUUFaQUwzUTArakNVY3pITjJPbTRXS3Yy?=
 =?utf-8?B?TDdhdjVFV1h5QyszWHRKRWQ1ZjR0SjN0VUxuK0NibjZMSis0S2d1YzlEUkNL?=
 =?utf-8?B?ajVkZjdaQk1vMWovMTVRNWEzSlhEbXgvaGJsekVJaEJnVDVmYnNiR1ZBUFVi?=
 =?utf-8?B?Wnd3cDVwbk12ODNBVEFzemljUWhaSkZVTndKV0lSWkg2ZjcyQkhrWHNYMmsw?=
 =?utf-8?B?b25tU2UyUlV3WFpZZ2tLbHFUeDdMUXBMa090OVBEdGY1Q0lGdy83NmFiemZT?=
 =?utf-8?B?Q2Z1S093cWIvdWhSR3EzNjFFR3lPb0FvV1hWRmJxZ3J1em9JYkJsZnd2UzVx?=
 =?utf-8?B?Q281Smt1Wmw0ck8veW8zbEp1QStIbGVMOWlzNXdKNWp0ZlA4UlFTRnBuTHhR?=
 =?utf-8?B?d3RtcVVibVdjZWowak1kS2lEV1VJczUxZmVOM1gzcDhRTmJCRlFadz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68039155-0840-4e86-2aa1-08defd208650
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:02:06.8645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERE2sNtyu/zzENgaJmI5DpOu4ZpN8Y6s2TbY8yzOpX+m7IHi8aO4FSPCgWwWSdJYX6zNCaJKX0jMW4lZla8W3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999193

Hi Krzysztof,

On 8/17/2026 2:20 PM, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
>> IP. Describe them with two boolean properties.
>>
>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
>> capable design is always IBI capable as well. Both events are reported
>> through the controller interrupt, which is therefore required whenever
>> the capability is present.
>>
>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>> ---
>>   .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
> 
> So the same SoC using this core will have different synthesis options?
> IOW, why isn't this implied by a specific compatible?

Yes. This core is not part of the SoC's fixed hardware: it is a design
compiled into the FPGA fabric. When the core is added to a design in
Vivado, IBI and Hot-Join are options that are turned on or off, so two
builds -- or two instances in the same build -- can use the identical IP
version and still differ in which features are present.

The compatible string identifies the IP core and its version. It says 
nothing about which options were selected when
that instance was built, so it cannot imply the capability.

Thanks,
Shubham

> 
> Best regards,
> Krzysztof
> 

