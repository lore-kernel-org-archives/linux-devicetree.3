Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012022.outbound.protection.outlook.com [52.101.53.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508B727FB1C
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037504; cv=fail; b=d+RxugZOzcJIq7EINaNOVP6ojk9kcgl6j+RehuaZ1iaQNYNpYnvwxwq6RiC/lFI1nyJ4eDlawbmYID/VsHFfyG6m/BkKIvVJBQth2A1CQY0C6O3nSdBWk4LIL8eBP48trkRz3vl9ONzkbSz98DjIgbx8DUfr9dSLQ0siaMjwBUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037504; c=relaxed/simple;
	bh=FfLrq+RniFltSNBCzRoEEiSnHgpoonfgtDLVDRUJRdI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GzvcGECdJUaPzbX2W8siSz4ygGCUWf2kM9NnSJqPikjilH4w3wO+9G06puK6X5yV6rFKhPn40Ozix39FPjogCK8kYX0V8xdiiqhvndrXO87oPojIqM7u1HSlpj5O+L8rL7TzQ6+5sPl1EPFCJX6UmBjyvBM7GAQ8Gx6WIDRL9uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MtdV+Znu; arc=fail smtp.client-ip=52.101.53.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MtdV+Znu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk2RKDrbAbWjF/d8r+oCpEWcnddUZZqWshU0lIJEe1T08vaiaqGz5jSCf2kPee06OM536+FoCeSWjKCkBPDvvEByy5YndeNiT6Eb9KvBt3BBIb6SxV5T1nj1wNam7mUqpsFmyw0EhZckWIUavZ6x7+pzBH5m1OcLa1VevgaAh202RK4SO3/9Nx5iAEt6rw1niv2b+jXVuDkEtidgiUh4OEeabIx5TqANb4PTTC6FRh+OTb6OsysBy6uLPNRb2rMkypc7gPuejPpQWDmAS9NTN8sHGaYEpmkUzB5UsfSQXozJ7y1ogo0AXt7Fo9NkrlOW5LSSM7Oo3pRdhML6wyuEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d593oWWS+CMACxFxGdIpVRN/f6YiVPluAu9qs29Zio=;
 b=l9VMWly2ACvR9sK+wKlcEro2z0uLwahecZungLbU921GutMFbk8VTRhS2IK1mjWkH8Tbk8IPWL3Ks69lrEGu3ea5idZkH0thFpGJJynqK9YQbE3GkfqLHZINfdtagbtF4y8/X7DjgC5PY6wPGCmyTm0NjL+wUBTDzvoEXOPZXvI5VydpKufbHGhnV0+t5qaQItHHg5mI7aZrIdrJSsXhgYxEYmscAwTxTE/LcrURdW5FL233hcmKQ5B4dYwyzVZB7wowkCRAhgfN4zDjGsrDcN1Scf3aItaYc/at1KpxrchrBMDfqxpvyNr8yFpZfUGPTpHEsu1COlWORDBDLEI7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d593oWWS+CMACxFxGdIpVRN/f6YiVPluAu9qs29Zio=;
 b=MtdV+Znu/bP/Un4WjOw2s1kUznPX3EX4xBCxWCDfDEn4f5I+tr17zvUJhFq42RdYmQbw14negL6rBsEqxo9zGc4s8gm+Us7k+r6qn+HlrEtPF0OGBhNHCvDkaoFNAkAdYyxXV6INeQsDtRIxF2C68KH+NdUS26AAPLBPmQxbGtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 07:18:13 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 07:18:13 +0000
Message-ID: <28a0da02-dcb5-4796-b0e2-20e88f2ef99b@amd.com>
Date: Tue, 18 Aug 2026 09:18:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: Add Xilinx Versal
 NET SMMU CSR binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Tushar Nimkar <tushar.nimkar@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Anirudha Sarangi <anirudha.sarangi@amd.com>, git-dev@amd.com
References: <20260817105233.1557748-1-tushar.nimkar@amd.com>
 <20260818-smoky-jackalope-of-piety-7e4b21@quoll>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260818-smoky-jackalope-of-piety-7e4b21@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 4986fd4f-d64e-460a-9d8a-08defcf8dd92
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fPDbnUJVH6vmGweE0QpbXt4NIGjHjrx6TWu5VwPH2xNzye/20WyzrKp5PB5XVAEz5q/bC+dKbwEYRpzw5LVuY0it6HUXf/TTVt7u79jEQ5Fzwn8qTGrBq09dRXpnslN3etxmwwbpXvWeyNO0wngGeUbHnr67iEhsV6z0Rp1CRg+RC7iWqhz/4a/Eenfk13SN899dQmDZ7gu8+BOx7Wd0DWuKr8idkhD1IyM+/OvSRSZmrDRSXqTv0ACoWZP9cJsGfPN4tMR+AmcE9v3AJuzQX+g27Fso3ZPslC5Pm32dkE//z2bde50IQxK8LRxWaila34LVDLGY4dH7xO2DWcmmAk2tUoo3wYrZ1HeYAg5fIX4D8COIHOLw88YKVPGZJ22XOpRfB8NirwsMHPkvoevX6MO39bDnwwxR9lgGMDGS+o9a9gUSQEaLKo09+wYCW0ctzQKUUNdt7Dd5DnS21NWLglQRfnF5naRu5C5Jqra+zfC0LOwEcILdrAvUoHHZ0N3CzK3GG6QRGnh6JLMCghswP0j5YwLcIVZKKWIuiI1tlCNIIsXFbhowuzdDObZx12u75FrbwDaNevDZ5/zBTXlLaiO3CGXLSNFdviYyTnJqbiWPmc8vB+lsGSNq/eNr1xahug8jZIvZetdZm7WIMWieKEtCDPsfY0w7ZxGMBLTBSq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk9xSUZOSVNPbkxWOElqMUdNMENTZ0dZYmJnSGRpamMzMy9ITm81VWNPTkxu?=
 =?utf-8?B?RUR0Ym9RMGYvZ3haN28xQU10eEJudGJaRVdtRDl2R1Z4VFZaaGNRbmE1dmN3?=
 =?utf-8?B?NFA2d0QyODhsNGVnVE9oQzZ3TTlFcUxIMkU4S3NMeGlwNVc3KzZJeWRhTFo5?=
 =?utf-8?B?b1hpUVF2Q0pLUGJSTGtYb0VETzgyTjRxeE45eldRS21wYzBxZC95bTNHRkY1?=
 =?utf-8?B?aGw4WHZXa2xURHloczE3cnVWSHNCWDl0c1k5c0VzVVlmVUF0MW1ITnI5Ykhh?=
 =?utf-8?B?ZTNLZnQxUXRESFBqRDhaL1dUMnl5MzBpQXFEWTZPQ3RXTEplS09PM29xZ2VV?=
 =?utf-8?B?c2o1eFp5TUo2bFFEZ2RQWnhMRW0vdkFndGhQT3RGQ21FRDd6ZHRkWTM5bmlj?=
 =?utf-8?B?Q2R5RjdaWDM5a1B6cGtCMWJTdTNZMkZsMUtIQkhDMlBQZGxHbmQxSHRmMzda?=
 =?utf-8?B?K29rc1FoK1J0aEdiQjNqV1ZJS2dvdXJOOXMvb1pOaXhiU3hVQlkzYi83ZTZI?=
 =?utf-8?B?ajQ2Tk9aRHBPU1JBMytIcmlHdVAvSWlUZmZFL0F5a2lHSGhiWU04RjdlRG5t?=
 =?utf-8?B?Zy94Tk1tOG9jT2JZcHZNdmgxekNjL3RhMElLcVVMQmMvM2wwZjRrS0JmSlVt?=
 =?utf-8?B?Q0tUUzdPM21ueExrM1ZPRjFYaTBQemcvRGZjdUJoUmkzMERFR1UxT2NSVXRM?=
 =?utf-8?B?TEZGS1hwTloxLzRFS1JBVzU0NCtpbWhLZ00xZXVjL1JoRUllMkNkYmJYVFNn?=
 =?utf-8?B?WUVucWJsblJYL1BZVnRrNkxQQmhxdnZ0V2xraXhPQXRVRG1QZ2o4Q2tnek5m?=
 =?utf-8?B?Q3FBbHA1by9iRmRFVXFBVzNxYTUvOE5HbmkwNmdXQnlUYzJiV2NuejBxVEtN?=
 =?utf-8?B?WFV2SXU3bTZGcmNpSmVuQmd1NTBDQ3JWVWljVjluVmp3ZjNMM3BtQkNBOUVm?=
 =?utf-8?B?a0k3eUhHVGMyMlZ6U1F4Z0E3YkhRZHNwNWhrblgzdnF2MVdPdU9qOHNpUEM2?=
 =?utf-8?B?eHZJY1ptMVFiQy9pTENxUk4yUHo0VGhJVkNrbDVzVUNiWkhKT0xaZmZGUTVz?=
 =?utf-8?B?d0JpRVBlcHgyaWVTV1NjZnBZc2laZXJrNVYzQUJZTXRsd2RIaEVMd09zUWxx?=
 =?utf-8?B?OFpnbkV0UUtMRFpiTXlscXNLUTdpVmwxUXYydTd3ZTFjS1VWYXArbUNVTnds?=
 =?utf-8?B?U0ovdXRoZS9QbVk2TWNvWkpQaDRZa01odk9sT3NHY0w4R1E2ZjdYM3VEK09Y?=
 =?utf-8?B?eldBWkQwSUJCdW42L0FTU3FRNE9HY2cyTzlrMzgvQUgrNmJBNk85cmM4ZFdV?=
 =?utf-8?B?cXErZWh3U2Y2cjBBanR1NS94bFFOVE5pMHpVQ0hjQ3BEajJHYnBrS1hQNng0?=
 =?utf-8?B?QjZQS3ljOTZwbXh3a1dyU1k1cmtUUjBCODJiUDJrbVJrMXdxZnhpUDVLcHUw?=
 =?utf-8?B?NVowNDFwMFU0K1JrT0NkV1Q4OVEzQmRoWFpVUGRRbTBsODlKZW1jOXRkUEJz?=
 =?utf-8?B?U1lXNzR5Z2JPWFFDbFhTV2FHN0FTSWRrZlRPSDdSa2JIcmFZL3g4R2FSNU9o?=
 =?utf-8?B?czlMT2J1TVRDWTF6WFhkUHUwM3F4OGNEY2NOZkJWOFR0cDZvaUhRSFI2d044?=
 =?utf-8?B?cS9NVFZZMnA1VkYrbHlRVU93MlNNSGNWSG0rVDVlTEhLWFJKSUNJOW9SWWJS?=
 =?utf-8?B?UHQ5OTNZbjc1enJWTklZOFdsdGhqaXFic0dhV1QvTFNNdHBJUEhadmFHWVJS?=
 =?utf-8?B?RkwxTWZBeFpBOXNWSk9hRHRZQTdUb0dUeUFuV2ZLS0MxYkdNbjArWXBPZGRP?=
 =?utf-8?B?cURPOStvTEZHZlIwK1pXb21qWXk5UGtydXM1WFJTcFJWWFluanRCZWw5UU5Q?=
 =?utf-8?B?QkQ5ZEt1NGJEekc0cUc1ejI3aS8zajcwclFuUWJoc2VYZ3BBSXFqRG9mZnZm?=
 =?utf-8?B?bkJKL1F1blhtRFJtVGpHdWlsMGhlRGxDUGZVTjZmUitweHFNVU1VL3BmSmJ2?=
 =?utf-8?B?aGh1Mkd6ZlROTFNwN2dObitpMDZsdnIyS1N1VTVlWGxUUnRiYXI2c24wV2lq?=
 =?utf-8?B?UlVPcXhIbXZLNC9CcjhoY1Rva3BONGZva09PVk1lNXZUYjF0MTl2T2p3cGZI?=
 =?utf-8?B?ekFCN2VGL3VTd1FwYmpyMTJhSDBldGdCbWsvdkJOd3RLVDlQZWlmMmduVkdu?=
 =?utf-8?B?amtrd2ZaNHMxZ1NldXBidUwxa0dOVVdQRlQvdVFwMWlXMXl4cVdzbGVKaGtl?=
 =?utf-8?B?OG9VTnliZm5RVnltend2akVDazVBQ1VFdEdITEtMM0dBbFd4bzBTbmtRVlNw?=
 =?utf-8?B?S3I4SFJZSXVpRHVYd0laV1FQNWl2L2FnaGNCSjRHMTBaTytTelVhZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4986fd4f-d64e-460a-9d8a-08defcf8dd92
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 07:18:13.3829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbEC77+pjHcyOwusfkGj+MsIG9vGOkVyZS5KII6jVaRpM8Y0Ts0Y0gKm1hhxR44u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884



On 8/18/26 09:03, Krzysztof Kozlowski wrote:
> On Mon, Aug 17, 2026 at 04:22:33PM +0530, Tushar Nimkar wrote:
>> From: Anirudha Sarangi <anirudha.sarangi@amd.com>
>>
>> Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
>> (Control and Status Register) interrupt controller.
>>
>> The SMMU CSR block acts as a vendor-specific interrupt controller
>> in front of the ARM SMMUv3, providing registers to enable and clear
>> standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
>> Interrupts must be acknowledged in this block before being forwarded
>> to the parent interrupt controller (e.g. GIC).
>>
>> Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
>> Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
>> Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
>> ---
> 
> b4 got only this one patch, where is the rest?
> 
> Can finally people in AMD start using b4 to send patches? How many times
> I need to ask for that?

Not sure what you want me to say about it. I don't think that this is related to 
AMD but only individual developers.

There are also other tools for doing it not just b4. Everybody got these 
instructions but it is up to everybody to follow them. When something is sent 
out I can't do anything with it. (And internally this was sent as threaded 
multiple times).

Thanks,
Michal

