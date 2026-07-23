Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010036.outbound.protection.outlook.com [52.101.193.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA5353A91;
	Thu, 23 Jul 2026 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774644; cv=fail; b=oVAxnTzDG97BK4tLIyKgcnDHwT2IlS0AK9CjfSJ55KBRGZ5GkJ5BBCPKxYc9hhblWmvZYXEQ5/VT38pNqgAqX0GYhIlGhz+SDCyHMkeVacmv+48q7RfaNVDSe/vRjmjPcgfkRRD8jXTbJyf7raZYyZWLVfr4+cBqrWk6iL/0OBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774644; c=relaxed/simple;
	bh=B4lObGJsUv9DwfOgqBi5w5bngAze/UjOBqFLUDzgWJ4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cgBTUYkwh3yTeZ/4AzWHnd9Nse7Se5lC4xdrT0d6yT12RLhQpObsVSjc3EiYuXU9apuaV6GEm/uGlonihFhGUh2jKrZOP2E23hD4yJE6QZpoATMu8Xjd72F0gUBgdHkEeE+F0TkUupvU1fp6RYAcSdQe4lyU+aikBhLH//MUE2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=NRKphegV; arc=fail smtp.client-ip=52.101.193.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="NRKphegV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fu82gi636qG+XFq9VNBNmfwdevVBOo5wotlnRjHdnXsNGPAkKM5uTs336vvmYV7F+/8e0EQgseAxhfzImHO2WRjcMfjv18ZWfJfsdtBodVcCsDy3EOKv3q7axpSzU87nVaS8tlPRzIw7C5+zGSTJ+SZ6iy4GGwQkF+GNRqcxYKAMy41UOaDs1kd8Ru+fCLNuu25W6Ail6+91FUWkfuEkO8oKtIPN56O3Su9VDgbqCPNajfH3LvbpC3iVtuwDY1suFGLZ83QCoFOgsyRpN23zng9oKG7lo4BJFQBt+lsUhSlT7XO5ICb+0L0ZxsM+WPpc8BKCiyqT4jso5VmMjcpgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jU0fc713orN4iI59lXIoY7m74p4Nbd1w7qy5gafDZeU=;
 b=WwVDiIa+DxYtJ3M+3+lXLJFiKFTPGe/hzLgFYn0u2LrNpd/0FCvqD9nVo70ImlqjW0zMvT0PZ9J/6Auw9FYbI5Lo6V1FAWb3HOcG+gY1kdl5kpD4ZhIAnU8+w40VKT9YVZll5hVbRZY65wn8zSBCS94CsUAj3h2cJWQPSg3qwD3Rqxf177achuqvYylTJ67xfOKanaaKtH/0ixbm24J9yD4ix6iTJ/AMDWss4pZ+vxlqpREuLoiavkA3/dkND8Ep71MgEqgJzmzeGvLTLSoILalG9K059+cjVeJHWeL1FghrLaruh9NU/qcPdWNk7BW4aupgFuRJ+9gcotZBHfD1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU0fc713orN4iI59lXIoY7m74p4Nbd1w7qy5gafDZeU=;
 b=NRKphegVJMMWJb8Tjz77eryKqyo+rm6YGj+OMfLHk3F+NTqhvv/ZB+gcSjCZ+aZoaoLYL6Pc3cwzgNtN6Vs4vClpTpp3tWWA37TS1SRWBciiMfKbI408cu4wp1DJda5Jeuw8xABASuuiQ9WKW/Vm/9h2qeCYknBSGhuD+k5IWIMbPszpTGf5b1gG0z1SVkd8IAPGhab9ZwKebSNIst0lM/GqNyOwkZegXmbNarwmHTY+0Jeb4yoj/cy7jU7Q2G2rAzX2ZRWPdFBe753jzKfbVFAXBvWVStSCzpPO/sS79SJZuvD6E1xyrNZcKJSOCUR32XuO9++fZG/T0w4gRdmOLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA6PR03MB7734.namprd03.prod.outlook.com (2603:10b6:806:43b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:43:58 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:43:58 +0000
Message-ID: <d77c0450-8d0c-4f05-9d92-5998c72821d9@altera.com>
Date: Thu, 23 Jul 2026 10:43:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: stratix10-svc: add support for agilex5
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1782135785.git.adrian.ho.yin.ng@altera.com>
 <c096c728b7becf027b6e9fcc4aa1cc5dfe3cef3a.1782135785.git.adrian.ho.yin.ng@altera.com>
 <35520e5f-eccd-4516-875f-2a042107b237@kernel.org>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <35520e5f-eccd-4516-875f-2a042107b237@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA6PR03MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d1fc2f-6f16-4dd0-c1fc-08dee8643e77
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|55112099003|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zMzeGUWAtWz2SAH0w4wfPgAQtxE6JMClGi1U9C3IaBo6vv3JgMhhZz9Ue+aP6ezW+torMoOPoi5GuYICN2Ggf1TFOpEYIANMVqXauKYR267swgaoHxI5P+zTBSR3VSo/BqSiAJ02V+86gwGAN00NDcAA4oLYfvzEMXVYHaolt/lCdjtna9MUseCzhALHRLTfetvGMJSSFJuA1WAyKkg2MXSNGn+dQzg2ZenAPTfr9jEIETb3t+Byf6HS6toTv2MSLMva5fa/DexEF0/YzDfkBEn6Dt7hsPFqH4cfrZ9Bp344zFzTegP9ttfFW3lXbVVySqTgjHdeUkc59IZXozwybX/YxQaXBxVJ8sLWxgsbT8Z7UHrLXcWjq8Ni9j7ww1MGoAHEpOYaek7qeIg7KTQ/Nz0BB2j/wVEJjfUMEcS0SqN3/IsfGxm+UPrAKjZsKZIfR0HvAAkvBWao/jABAcZ1K65G+F+IzaF6tS3/fEXQ18GXrYd6soJpC6wNvUXpv8lYWZPcB+AZQLlzjcT8/4eL0D7qJrox1vIrhz6iS1/i7iFC8Z7a56i1Q4BMlCRytxjFKlVFTSisRT5rIlMdwgF5G4ekavYQGxw5NRxCAunYll1GqhnJJK5XRtUdndY868bX/kCJ8fZOt6GND84prFlSkelIUWCro7ZcXM+K+Rv/X8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(55112099003)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmNxVG5YcFJneU9sQjZIMEVFZ3FINWFiOTJJSHVqQ3NxaFRiWW9JQXNSbHc5?=
 =?utf-8?B?MlFrRXFnNzNtcXpGRWxaWm1CTVZ2ZDZmYkpLdHFCdDZMclpCL0dOQmovVnFP?=
 =?utf-8?B?WTBSMUxoQVRDYm5lMGdKVDlwdEpGRk9XRkJydnAwTmlqNHFaQmpSNE5oKzBB?=
 =?utf-8?B?bkVCelYzeU9rckJYdnB2WGhrT3lpVi9IdWN0QUoyTXRPajJVVmc4ajlPVXNG?=
 =?utf-8?B?L3JCYkJCTmVTNFFYS0JLK1N4aEFUSkNpRlN3STVSNlUrazhvT1hJZHM3bHha?=
 =?utf-8?B?c2Zmajl0bXhZZ2tIemhRM3VmeTBJaGhmVXpDU2YxN3ZKaitVbFkvaWRmQlFV?=
 =?utf-8?B?aUxQRkh4elV5ME5NRkpTL1p5aUpXZzFNNjVUWmRoSjR4eGxuM3M1aGdWbWJQ?=
 =?utf-8?B?OU1NQVE2bnpzRmYvQzN6QkZGOUk1Q1RmYWRITVpjall4SFZVVm1Zc2tCQitx?=
 =?utf-8?B?RlJzd3VKcTB1bGptdDhKLzArR0VvMUkvSnA0dTFpVkxIOTRWYXRkeC85ck5D?=
 =?utf-8?B?am4rZ3N0d1RhNE80OFlKY1dxR3BiTEJtT2czdjRDRmsxbW81bnlEYlF2eUNO?=
 =?utf-8?B?aCs2a055Ym5XS1ZnTjFkYzZTdGM1ZlVmTEdxT1JWSUtZMC9Ba1VkbHNscFRR?=
 =?utf-8?B?bTlaSE9LeXBJUFFjTUQ2TW13NGlRSUhmQjlKK2VqY00rNW5maHEwWG8vMWFG?=
 =?utf-8?B?NHlJVHlIc1JudlJlMHMvUUNIZ1FNc3ZQZnp3NzdXcDB0UGYxa1ZrdWxNcnlH?=
 =?utf-8?B?R05kN0tsVUNjTGN4Y3YxdUs3b3ZZTWdFOVFnd3hBMGJSVGtGSVplMGZrU09t?=
 =?utf-8?B?QzUwc1c1OXNCNExaNjZWTlptQTQ1dmxvejdrbnQ0MEtOUlhxYmNLWTE4NHNP?=
 =?utf-8?B?cGZDdjZ4UjBSTzBtNmhDZXZJZGhqcTFhSmVCRC90ZE1qTFI5TUY3d2lkdGNx?=
 =?utf-8?B?Ui9JNTZQc2VOVFI5K0R3YW1xUHh3UnloL1N5eStZT3Jndmt1aGdFQmJCZ0JL?=
 =?utf-8?B?VXpXTzNybUlza3FpZTQ4VnRCWkFNYzY2TnhteG4zRWlJUUs1cEJHYm5KUGRy?=
 =?utf-8?B?Q3RHRXBWcHJkc3liSWp6L2diRW5XU2U3NUpWaDVJN2JoVUhKRDZjcXdpV3g1?=
 =?utf-8?B?dERFMVo2YVhuSlJySHA5eDNXUWpHRmkyYmNYc3AwcGxWbTF6YlJkZTlMOUhq?=
 =?utf-8?B?MHhMMlZOWk9nNUhBWnoyVG5ZK3hIMTJ4K1NSdUxuVGNuTlVPaVJiUHpPQlRt?=
 =?utf-8?B?VUhwb3N0MGEzRjF2TWZQY2FvN3pKVE8rTHVhLzhXQ092cHJrZCtUWmN6WVpG?=
 =?utf-8?B?M2h1RXh5RDh1azgyZWE0RTB2ZDFySTRYSms3VS9yYjlIN0xObEJLaUYzNWlF?=
 =?utf-8?B?Vjd1REhTNEdkRUJrLzlQdTc1dmlCQVU3dVZiUU93Z0EvdVJvdkRHcGlQc1NL?=
 =?utf-8?B?bWQxWWxIWk9zYkR4N2xxY2hyK1hKdVBkZ2VPTysxUEhjMGRhQks5dVA2ZW9Y?=
 =?utf-8?B?K3hGQm8zQzJSSmFhdStyNmsyK2s4Uk9oOUczZldLOTZ3MEJCbFJvcEdDZEtm?=
 =?utf-8?B?ZHVPajJuMVh0ZGhOR1FhL2tKVGt3K3RvZWRhVUlKTitObGlFRThIODJ5MGtC?=
 =?utf-8?B?bEMzUzV0QzhXN3Nia0hXVFZXWUttTXdGa0JOZ0UvNmhwcnlZaHUvQU85ZmZQ?=
 =?utf-8?B?MmlLb1FvUzhnNjVKUlpjeUcyZXkxOXVjdkZUaVdCTnQ5RVplL3ZOWXhLQTYr?=
 =?utf-8?B?YnVJKzluZU1sMXlmTnZQeEpFaWFYblNaak5DaElsVjhhV3d3RWpwNXZNTDNE?=
 =?utf-8?B?RXdzR09lTmFaQS9iMGRMd05ENi9XTHUwT3NpOENBNlNrb2Q4dUVib0c3Q2cv?=
 =?utf-8?B?MlVITmZhWS9PczE5QTJaS1VDUndxTkRUUU41TEUyN1lSV0J3T0h0K2pOZjdk?=
 =?utf-8?B?ZDBMREx1MmJiRkFpcGpYTVlhaDZnYmtpQWJmVVNrcmZHcVJOTndndlYvVFgw?=
 =?utf-8?B?TlBhSm5qZ0JuaE9GUVFCZjBDbVNXZU1iSVZuYXIrZkYrT1RZQ0xxVWcydU1L?=
 =?utf-8?B?UHdzamxwRDVtLzFYQ25HcXZ6aVcxRUFNVVRzbDN5NzN4K1I0NmlLUnR2anFa?=
 =?utf-8?B?Tlg1UGkyUHNOYmdXbWYwazM1SHMvSmFUeEs4UTRFb3Mxb2EvUUxJOG9ZVzlN?=
 =?utf-8?B?eHJOZDlmSmtGVStrM1NiV3piUk8vdmNhZzBkdEU5cjB6SjBtNjdBVnBzMzlI?=
 =?utf-8?B?VjkwNkpKTkNSRVpLdXMvaWwrcTJYWmczQzJkL04rdWRiWjJpQ2lBOWhLRFRP?=
 =?utf-8?B?OVZ3dVBlSlNIelhlaEVQQllaSSs2V3kxU2tacVhpalIzQzFtejNIeGtTb1JI?=
 =?utf-8?Q?wTcebUBHgo6WhnN8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d1fc2f-6f16-4dd0-c1fc-08dee8643e77
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:43:57.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkRkvCMtt7BykajbNocvjXGO2EtzUfOMJwL1P8s1uDJzto/gqHaobahkfejxF3EUIyWOQz41iRdV3b7nsi89GkzAeVtflj1OymdXHxzeMDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7734

On 7/21/2026 7:59 AM, Dinh Nguyen wrote:
> 
> 
> On 6/22/26 08:44, Adrian Ng Ho Yin wrote:
>> On Agilex5 the DDR base address starts at 0x8000_0000, which is
>> outside the addressable range of the SDM. The SMMU is used to remap
>> DDR-allocated buffers to an IOVA within the SDM-accessible 0-512MB
>> window. Return -ENODEV at probe if no IOMMU domain is found for an
>> intel,agilex5-svc device.
>>
>> Configure a 29-bit DMA mask to constrain IOVA allocations to the
>> 0-512MB range accessible to the SDM. Agilex5 REV B introduced a
>> hardware SDM address remapper; bypass it via SMC so no additional
>> offset is applied to the IOVA, keeping the implementation
>> consistent across all Agilex5 revisions.
>>
>> ATF validates FPGA_CONFIG_WRITE addresses against the DDR range
>> starting at 0x8000_0000. Since IOVAs are below 0x2000_0000, the
>> driver adds 0x8000_0000 to the IOVA before the SMC call so ATF's
>> is_address_in_ddr_range() check passes. ATF then strips the offset
>> and uses the SMMU to translate the remaining IOVA to the underlying
>> physical memory for SDM access.
>>
>> The firmware COMPLETED_WRITE response returns the raw IOVA without
>> the 0x8000_0000 offset. Compensate by storing dma_addr_offset in
>> the controller and adding it back before the svc_pa_to_va() lookup.
>> dma_addr_offset is zero on non-SMMU paths so existing platforms are
>> unaffected.
>>
>> Fix a pre-existing bug in stratix10_svc_free_memory() where an
>> unknown-address fallthrough called list_del(&svc_data_mem),
>> corrupting the list head. Replace it with dev_warn().
>>
>> Register a devm cleanup action at probe to reclaim any DMA
>> coherent buffers that service clients fail to free before driver
>> unbind, preventing memory leaks across probe/remove cycles.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> There's alot going on with this patch! Can you split it up into smaller 
> bits? And what part of this patch needed for the DTS patch?
Will split the commit into smaller commits and resend.
In the DTS patch i've removed the status="disabled" property in the smmu 
node which is required to enable SMMU on Agilex5 by default and allow 
the SVC driver to retrieve the attached IOMMU domain.

would you prefer if i send the DTS changes separately?

Thanks
Adrian>
> Dinh

