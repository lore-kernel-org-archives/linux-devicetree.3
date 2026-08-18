Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94845198A;
	Tue, 18 Aug 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049541; cv=fail; b=X0UU0849lspzDPe6CEtXE5ncZA/RPG6lgk00I640fE6Xq550lDOM8ze+w2Ewwgd8rC4fXU84xUvV++eIzuSNLhxktea2slkXGF64/5OlNqbvy8+GGc1pmZSZdtEudVwkYqX0csWIZR5QZ2ThHnEmqKAhHFwGKdbvpNx7d2ECS8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049541; c=relaxed/simple;
	bh=UUsb6kRRrWNt7FfdGlvRhBr3aXvA+8k5BuG/lFIQiqA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RoSn5PEawGpj4i5jqEbKwMnre4evx1r3IZFz6ykbZLTgrg/TZT41zMkza5/sGzj9RPJoq9i3MBHh0pErpf94kHQEIM5G7GUWpH/ZlXjXII1U7O+Rgy/bgj+xdWUHSnuNAqCWqc6iN7BdBEXoeLMLFlPBcbE9gmR43sogcGEHJ4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FSj51g/A; arc=fail smtp.client-ip=52.101.62.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FSj51g/A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4/EonZ8biEGJIYfFjwVXKni0ajNarvFM+FlTdH6P7+UCfd4IPfSFig24jc5r3u4z3Gxs5FTfoCM1NcckQzSTwvdVBS830aGQy6zK6YABvEyJHKJ32v8PCLtV4/8UsqwLSKV7JYSloWf+cUJT5/pnJZu/UDauMNMJurrcqEWi/beP+PA6HEyCzZrl1uFzb9GyMdDNYj7dPJBqzPAkWRIcTIkvDkzvwX2g9aOwfT71AWEMEC5rY8NX1JdigEeGQkFb4/Ot5s3j6hB5m19NXDU+sI/qYKgFGx8MDHD+jaQsInN2qsJG8vSroL5Z754FF6WgEejlnmjRrJySYzlTh4Fnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svTnHESUHiZ7novvD+TGtcXBBqeQjKu8sQP5qzFjiHA=;
 b=HFDrvt1fEbZVVuopWZvI1BxMUs+5DKBSXlkNmxGhMucednEW9DYtDCZwgicD+fEqSSJDs3VpcURpR7El0ob0d/vkz54q1AIW2nnspgSLFuR1JlS0dRwpSNFN/hGTO7RiCUBYEZp4OwOfgawhJK+MtDTafPDkPdlIb+u23by2NR8GQeOgvvYYY5oTNm14lI0AMMJS2MGLW4r93PUK+U2/rm8Y8vC4iBaLSmtOWePUL6F/Zym45+EhA+rkXppvZfwH8+yGg3e5wIV/lrTubyZS/c3zRI/IlCqINsmBG3cCg+JNL9G7LGnog5wbt7HSLS8OaX8KCisY96jS1zD9knRs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svTnHESUHiZ7novvD+TGtcXBBqeQjKu8sQP5qzFjiHA=;
 b=FSj51g/AV7L1QC4R/iVXPEtasmL+OjNPZX/I6ItnyFxS/PcTJqjP0SgXEwfNtQww3xdtRiWUQo0O1F/EDPD/UoEIwebDdMstnpSmzB9M5rynDRka+H/zQlY1OI9htQB29Qczw2erTKtXvYb3YIFbfb7rRcLLKbHtYsIFVH6kBTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 10:38:52 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 10:38:52 +0000
Message-ID: <88fb5132-3484-45d6-a9e6-9560002de249@amd.com>
Date: Tue, 18 Aug 2026 16:08:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Conor Dooley <conor@kernel.org>,
 Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "git (AMD-Xilinx)" <git@amd.com>, "Goud, Srinivas" <srinivas.goud@amd.com>,
 "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
 Michal Simek <michal.simek@amd.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
 <20260814-cubical-transpire-413101a0c4c2@spud>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <20260814-cubical-transpire-413101a0c4c2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::17) To IA1PR12MB8408.namprd12.prod.outlook.com
 (2603:10b6:208:3db::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8408:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: df9a6611-a649-4b1d-ff8c-08defd14e564
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|22082099003|18002099003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	ImiC/ybuFl5OuDsyn6YmkWZEPTC28ZkC3kAjecoA2qRVbiJiog7xoFvI2WEpz+IQ/kPIoikOgBiVdOCRutuVOBTmQt76oEEpMwCHqfMg78YzluDtLhBD0RFvtZme3gzjzccAO7p3BjAo/2kn0uUVp8V4BQNMXowWj36tprf1Cz8yJvvZHffCGtYSQGE5MjsSuCio9auOeZpZlVP4xpFqJtsTPXDb2paBdQidaEWenVKHtQISmxHvGF7zQIQskO9lV3mahvkblZ9KARWXggkQQqS9Z9BDTsC0t2fu16Gk9WFBB5TzkUfBaNL+TlxZly5TLoC5qkrBWx4ae34RsfoK8w4DCgr10YjHlLBWR8pxN6yS7hxzYdkQkMaGi/6DxF4Gfeu+MceAfeQiopNC+mv2cEhBxUMqhMsikHEAt81LFiu3aTlJf0NBovJ/6USodaKMCRu/bf2C7lqiPev0yhg9iNLW2lnhiJYiSYnmRixSqShF91weF8iAKrbefHx1JpRaRnN4N9EfDIushkMOaEySxWebRM5gINJyzFJ7gUuCrqm+PZg5ZV0z+u5UgnSTS0G431axNfM8fleAqCUGUIWXzddYRCXDqcifOdzfyPmZBn9QlfuV9DHQ4dopGXs51DnGJypw3EzlCPHU94dhBTsSdNiLyxtrmjkmXWkqspfv6VI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anRjdFp4ZUw5RWdGSFdaUWRpUFdiaEVBRjM5WVVqOUdiVEdicGZFYXRjaWlV?=
 =?utf-8?B?UWtsOW15RWk0cm5EWFNLNU1Sb3lvQ1ZLSzN0S2lCOWQ1VzdmMG9jR2x2bzg4?=
 =?utf-8?B?VTV2eW5ObHh2R0QrNUM4SFhsUFRXbklRRC9IUVBzQzlUTmUvbnRSSnhhT1Bo?=
 =?utf-8?B?UFk2RHRXZmhBNk1xVWxORS9XYWlBa1lBS25vSC9VOWo4QVg4b3dvZUVaM3Va?=
 =?utf-8?B?Tk4vblR4dzlTSE5xa3JJaGRQdmtHY0JqQm1rQ3lCczBldDVUMjBHc3NWWTFV?=
 =?utf-8?B?dTZ3Qis4bldQbG5GOEU1VlFqZ1I3QlVPcWRpWGNjMUVUN1o0NkgxTkNzMEdS?=
 =?utf-8?B?a1hrOFlnNFpJZXlXeUJ2ZnVXQ2IzVS90TG1ZZFJlZmpVUnRBSmhiRExOVmFR?=
 =?utf-8?B?aGZ1Q1pERWx6L2NhSkZUcXJFa2U1clM1TWRxRGMrajVjRVRwQVpIZENHTk5N?=
 =?utf-8?B?aFEwU0pRZGF2UklJM0o3RW1UZElPMy9Cc0hxWDNLbGNwdDNEcGhraURXWGIv?=
 =?utf-8?B?TFRLczF3bzA3L0R4Q0Y3c0RlaGJsNXN6VGRCTytxaDc3ZGpDRURrRzV0bkFO?=
 =?utf-8?B?b3B5aHBvSWNSWEpKV0IwNExhUjdsQW9FZzkyQWxWZmlkcS9NalJrRkpneGtZ?=
 =?utf-8?B?Q0VBYlhWd2FVYTlyb1hMQVJVd0lrVzJuUC9HMWdvRHJZRWtsYzB6NzgxelRi?=
 =?utf-8?B?YVk1eTkwL3pIWFZ3d1dnTmxMamNicEk2TVEvMTBteTdMM2U1UnhHeUVKU0Z6?=
 =?utf-8?B?eVBqNHlHdkkyWDBDNGcyRjBaemZmaS9UdTVBTkpBSHkvOGI4eEU2S2h5SmFa?=
 =?utf-8?B?cEc3QnpuRDl5Y3JUQ3ZiM3Nvb2FKQmJqb3diOWtNSjB3ZGMxMzY3ei9maFZV?=
 =?utf-8?B?YzdyQmJZY3hEQzVFbTVQUlUzMi9mRmxnZ3hYVkJyd1NFVEFLWVgwNTRlRXVT?=
 =?utf-8?B?QjdSbklpT2U5YnNLZDlhUnY1OVlYcmo1akU2T1BTbkxDcDBOU1QweEo3RTE2?=
 =?utf-8?B?L3V4d1lZemRNOC9OOG1DWUgzM0NNRUVncVQ4bWNDOGFiMk1RczBKdUtqMm92?=
 =?utf-8?B?ay9JcU9QQzBVRTlJeEpJb0VBV3l3ZUZ1UG9mTDNQZitZNmRrRzRLNmw2UVJE?=
 =?utf-8?B?VnBydEFZYXB2ZzRHVWdJOFFWNW1reVZpdUlkQmx2VjFtdFBDV2kwdzYzRXRw?=
 =?utf-8?B?VG0zWWlFV2JSQVoyZjA2UmFTVFg4SW9SSGQ3Y2pabXRDUlZXdDdJQVFQbG13?=
 =?utf-8?B?b2p0N3Uzb0F5cWY5WDhXcFp4TXFUS29OU3VJeVM5TS9QQ2xMbEJFa3BBMEVD?=
 =?utf-8?B?T1E0TDRnaXNURFYwRmxFbkxWWmsvOE9Ud1ZUT3B2djR5K1lIbER2SXlKWmh0?=
 =?utf-8?B?cmNRMmVINDZJVmg4eW5GS3RXSU0xZVA0cmZIcENXUEZtbVVlTHVySjk4cVJC?=
 =?utf-8?B?dlhqRTJTNlN0Nk5GWmVDQmVpNVdibWcyOXoxOWZrbmRXWmhvT2RDL25JRURU?=
 =?utf-8?B?NFZhT3B2d0pDQVp0SnRwN2ZCQlc3V01FaDRaNkwrQ1QzMndoTTZQZVVoV3p4?=
 =?utf-8?B?eWdGNDczaEJ2NTd5dWh0TE5GMjJBaGoyZmlSYnhDRk1mYmt5bzZFMnFzSFBE?=
 =?utf-8?B?TGhzZWliWk9ZTi94OFJBalpaRmpPVVdCZWhXbHNwS3Y0MzIzanFFVm9ORk9p?=
 =?utf-8?B?TXBEVTA0SDJWY2xPbC9DSHN3TExZRldyajZCcVdKeEx1YVFCRVN6UGUzOEtD?=
 =?utf-8?B?MXorbW9kWUFHODFQOFFnbXlLenpIRTFVZGgyelNYL1gzdWJZcDFIOE92UU5K?=
 =?utf-8?B?Rk5JTEZaVzh3TGcxZVJFVXRjb2NBRE9ibk92UjJ0eGpKSGg1VXFrVW1jekNs?=
 =?utf-8?B?THhuOGpmQlIzSEFpNlFqaEd2WTE2RjlnUlNQKzVzT3ZSS0d0dm5BcWphZ0cy?=
 =?utf-8?B?K3crMTNPY3VUTjNFMFBHT2JLVi9nUW93b2M3SVVraUtsRFBybEhTV1NQeFZs?=
 =?utf-8?B?M1hHNzMvTythU1VsS0JEN2M5M3ZCQkFYUjMrbm5hWU5pNks2RG5OZ3NiczlU?=
 =?utf-8?B?QlQxdzAvbnpNZmh6cTIxanlFdjYwS052cnBROURMbllIZjFTU0RmZkxMdXNM?=
 =?utf-8?B?em5tZUdHVENuYmpRU0x1dVFIaWltRnZsTUtUb1Z0REd4RTRTYWwzT1NLQnFt?=
 =?utf-8?B?Z1BDQnB6ak9sSmNlbXEyOWt0UjZSSk44WU14UzBnZnZZa2MyWVhwVXVhbUM4?=
 =?utf-8?B?Vi9BdERBaU5manNFQUUzOXp6OWtyVEVkTEJyUTJaS3VkeUVoOTkzc0t0dUs4?=
 =?utf-8?B?eUs4ZzR3OFdWUUJGc29rMytpYWlCYlJpWXVDNlpid0JoZmRYMkRRdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9a6611-a649-4b1d-ff8c-08defd14e564
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:38:52.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4d/ZhSOhWT5riDs21mbPrfjV6OYA+MXM81iKriTWXeIfcOtsWVJkHy+dvhnR8sVFqxIdBtA7/CsYBEqybi/ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110

Hi Conor,

On 8/14/2026 9:08 PM, Conor Dooley wrote:
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
>> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> index 2caa245a8656..07e3d0b4d767 100644
>> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> @@ -32,13 +32,34 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  xlnx,ibi-capable:
>> +    type: boolean
>> +    description:
>> +      The IP is synthesized with In-Band Interrupt support. IBIs are reported
>> +      through the controller interrupt.
>> +
>> +  xlnx,hj-capable:
> 
> tbh, I'd prefer if these were spelt out a little bit more, characters
> are cheap. Not a big deal though.

Fair enough. In v2 they become xlnx,in-band-interrupt-capable and
xlnx,hot-join-capable, and I have expanded both descriptions to say what
the features actually do.

> 
>> +    type: boolean
>> +    description:
>> +      The IP is synthesized with Hot-Join support. A Hot-Join request is
>> +      acknowledged by the same machinery as an In-Band Interrupt.
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - clocks
>>   
>> +dependencies:
>> +  xlnx,hj-capable: ["xlnx,ibi-capable"]
>> +
>>   allOf:
>>     - $ref: i3c.yaml#
>> +  - if:
>> +      required:
>> +        - xlnx,ibi-capable
>> +    then:
>> +      required:
>> +        - interrupts
> 
> Why is one dependency expressed this way, and the other expressed using
> the dependencies property? Can the interrupts property be handled that
> way too?

No reason other than an oversight on my part, and yes it can. Both are
expressed with dependencies in v2.

Thanks,
Shubham

> 
> Cheers,
> Conor.
> 
>>   
>>   unevaluatedProperties: false
>>   
>> @@ -54,5 +75,7 @@ examples:
>>           interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>>           #address-cells = <3>;
>>           #size-cells = <0>;
>> +        xlnx,ibi-capable;
>> +        xlnx,hj-capable;
>>       };
>>   ...
>> -- 
>> 2.34.1
>>

