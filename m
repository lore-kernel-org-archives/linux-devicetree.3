Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022103.outbound.protection.outlook.com [40.107.75.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BC42E4257;
	Mon, 13 Apr 2026 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068523; cv=fail; b=N3AFAKKq6inl0Ep96IKmt1slO4tjDREpYuqKDP33wL2yMhd8Fna+jBJW7ysgTYJ2c4HVY4eTdjLULuJVVFkGMDsa98MWAgX643ypRpH99uWxei+cg4qF8cs10fhlax5pJGxsM1TNcFvM8ZW0ZIeV1Mv2nIKYa3y/23hWo/Q70Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068523; c=relaxed/simple;
	bh=Mwz5XQQF12XU0E81UHIDZ2SjtQ5TJMznGI50SvtJAvM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XF4L3TJ9Oohfeh7zjVK0BpTV8+0VIWcg2YD1GmJROttzlchUWDn5mrb8+CbALprzlTV5sKZz5B4jaIjIzdKaE2q+vU4f4gLaGovOr8bJEYCQksqlj5h8KG0x9aVpUxMHTzzqqaFCIGmbahq7JB4A3I0+HjK7pqTPyMwjc0Nj0wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=LqzDhGB9; arc=fail smtp.client-ip=40.107.75.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="LqzDhGB9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vmr7ZtrmcwAeDSrIrIs6BHf27j2S/+RG2iZLghAsiuKuwYoUWXXYV52BEwjhBjl4uDiILTwciGOdoDQBDowIJ/Nlsf7avwCAKA6A/9XvBIcKGK6vYOyMh3GMmgyM7lvQX435U6gFmHtjjd2Ljt7VT+i5u8krg5+2j61wzlyBp8y6hKyLcxSGjvX10sOl3/dJzobf0Xwn68QQBWYd67ZpvDtiCV/nHocop1q6R7SueZ8CZuuznrCs4Qjucpm4+JwxylWgufmK0ScQZHI9G5QN7JMfKeMiYloavNxysTKL1CWDVPZKwDcis0Fam3QAqg99lSQdlEhyhkUMcrvalmbF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPSKK65EgPR4ue03a29l8i4azjlHc7Tl0VaisQsiQ2c=;
 b=kVhEJMhuT05ItHla9FVln7A8P3IiSHt0XiMlrU4XIcLTxE+FJzwMVgDwUVRlI4sgNJgaUVEzxbX2fyxLtVmQHNQh6jvkqa70CrZG9MKX7AXc/lLZ7jJLVRw7Cudu53CkBZZS7ZteieJLTbRQ+kS8On6o4QacDqj6G8GoYd8s3mV5f604WIoY+IBAITNKZz9PPLGAGdx2vEpLXInggDd5urIjnnCGitkWZPkmolSZF/zUHAo3W0SVUf0X8hGq1AfBZ2zg90TaCXDrkiENIU3tL+KKOMXgyytxoM7XJcsaBPuDPYgHc5ni4wUWg3tMZaOeXWRfG8KJonDSi3SqYEaFEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPSKK65EgPR4ue03a29l8i4azjlHc7Tl0VaisQsiQ2c=;
 b=LqzDhGB9BjQjunrNvj2dSJvdZjzMygeTPe8gbnZWLaXo9QkeVemyC+kSFVyJMGTdK5oWtNv6h/jYLNndDF6bKLGSuVASYUXizSFalSzAgVLWBB6/1tVlhuGd16MsAqgcJOTXU7mJ9CWafHRx2/5jB4V6IwfEECR0ibSLr10Cl93dR6misyVIn5vLLzKeZyDm8IKzHVXHzyAa1kRshQshgYLhXRoo9apEGxEWvtSeJV426/PAt2NQM8/Mon8mdglvLuTGMI/iSQjXltE1iP8izbOiQu/yet1IIXh3WQzlgsoGk7EezSZVnTIv6gSUpJgzkwxrgUu3ODpvC4rpymXaxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7073.apcprd03.prod.outlook.com (2603:1096:101:ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:21:57 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 08:21:57 +0000
Message-ID: <274d2abd-05b9-4dbd-b962-ff70044b8d07@amlogic.com>
Date: Mon, 13 Apr 2026 16:21:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: amlogic: clk-measure: Add A1 and T7 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260410100329.3167482-1-jian.hu@amlogic.com>
 <20260410100329.3167482-3-jian.hu@amlogic.com>
 <9a4f69e7-838a-4992-af1d-46324e14eb48@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <9a4f69e7-838a-4992-af1d-46324e14eb48@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0173.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::9) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b211da9-dfd7-4148-fa0a-08de9935ba55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h8iBua1Q6QeU9DWSaQZAq3JkXzEuJvpqctiqZoq4km7RXe1LomlPIH5Az451UGqY7nK+i9zcUVedtoOGsq3sZEO+f3FQGu/OL7elBDLY1yRUgJELBoUN77uFGGqrnSFrbB9uNwj0ueXE3OrSta6Z/0Hp/Mq+aBuNQQc0EYfzCKNJWIOE1LA/a6vWO76aCO0T7jJYvyUKFKHLGepuwkMQIdCAzRIZLfdARVXU9EsXVz8U3oZ93IPlnZ1Y3hkFdMXGxEs9BWLHlGnZSHwTVdhCF8MvLw++ogCTs/KEAAfqxmYkIdKIARhjCfMbtOdAo4/hgRJosg9kG8wWwhpjcqMe7cBHy+GINZI4a3CaoE13H5hR3ZvRdFYOI1fx/IR0jGEPguY5sUX91ZKSVSY45O3DRF44MsC03Cus8PzG4gWeHC+aeixFid88LUKbAIf5WVWGMp1zIxPLLg9jPuvHUhi0UKtRGpsPfnlOBvwESERh7g1ZxIa0huPKV4mW6nCWx3xAvO8DbyShd+Lu82dwYXTQV//vSTcE7eJUVzuzEqeVy8yFWPQAiPMs2Qg/g+0So6anWHU+d3WdHVc0xVIvfSm2jOvUaxbIvhEeW+7yckkcMoPb/Yt06Y7YMRyqT8RCFZuhAHDS9kDCt5+iiffcZYMOwV2tSaRNegBdxz47Hb5p0Bq8FBohAYx0FfXF16zBBoK+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWhSRmFzZjBHam9kY0Q0VU95anQ5TXVjTkFrNC9PMEM5b0NheG5aaTNSYTRu?=
 =?utf-8?B?Nk1HRDBMVVZRaVhDVFlBQkUxeDVyVXgvK2hMOWljbEtyd1pJN3hrQjZjZktx?=
 =?utf-8?B?QnkrM01uQjRnNktIZ2loem9XRFd4d0VYczVOa0toNWRLWGJoRWFhZDVDMVU5?=
 =?utf-8?B?NkhUNmZoallRaUk5NUZORUFmdDd2d3ljYzVpc2JtVnhTS0sydXR2K1lCdnU4?=
 =?utf-8?B?cVF1MVAxeHE0ZmJBQThBWVZ3ckhmWFMvckovRndpUzNZd2I3TE5sL3EwcFEv?=
 =?utf-8?B?SFFQSGRTRzBNVGJqVzN3dWJVNmFURUxHQkZxL2dnU2VVdkd0bVgwaHJPWlZv?=
 =?utf-8?B?OGxiRXFZMkN6ZDZCckZoQURPZ2ZWWmZzV3hUeTZEai9ydy85UDhhdHk5TWNB?=
 =?utf-8?B?NW9ZUFJ4dEhVbGo1QXo0OS8vQkc2Z1l2MnVWTXB3eGoyTFRqWFM1VTRISHF1?=
 =?utf-8?B?QzBua3BxZGxTTkcyNWxZejB5RGwvZkJpMUNXbDlWMlhPUm9TSzlVaFJPWVRu?=
 =?utf-8?B?TkhucjRoYURUVnFLMmZQa2pZRFpvMG5KczVKdlRmYVNFVnN3VDRmT29oRGFX?=
 =?utf-8?B?VXJJdmNEbjlsbDdPUDhTT1kzZGEwNnFYcnVjNGw3TXRtWU1yWHF6Sm1ZamJF?=
 =?utf-8?B?V2pIUzdZYlJJc29FcWFQeElGVzc3YXJTT0xGRGNQZVJ5VWVDQURGUWk2QmZG?=
 =?utf-8?B?K20wM3hyYm45Y3BOV1UyaTgxS1BaYkVrTnc5eVJXVG85TWRhZGlVR1NoVzIr?=
 =?utf-8?B?NTF4dysvQ0R5N3MrSzNibU5DVFhUdGoyT0xVdEFkUTdTRlZBaGx3QzZ3QUc2?=
 =?utf-8?B?RElJS2ZIU0RVc2cwdDVxT25CRkJhN1J4OGZ6Q1hBdUNCaGZ3ZXJHUnRRdXVZ?=
 =?utf-8?B?NU1mak9PaWRjdktHTkpFWWFCK3JxdTV5TkNVN0piVC9BYTRMWHlSellFMjNS?=
 =?utf-8?B?NWg4STgvbHp6eVFkVjhmemhJaTQxSjNzYSsxUnZ0bHVwVkUxbGhKSFpEZG5O?=
 =?utf-8?B?eGhxWGNVTXF3Q1RFUThpVFhyUDdCb2thdUY1cFdLcDhNeGtWME85YmtLc29J?=
 =?utf-8?B?STFEVW5sRWpTUnM4R0hJYzc3UjY3UHZCWXZ0M1hmbnplYjhjZUdESWVMeDRS?=
 =?utf-8?B?SXBDT3ZaQkNMWEJ0alBlWTExTkZNclJ0Z0lZVDdURWhrTHpzdXdZbklHSWlG?=
 =?utf-8?B?ZTRiY25DVHRpVkhTZ2RTS1F1ZlBFQTRhR1pUQllQcXpDc3l1ejlIZC9PYngy?=
 =?utf-8?B?MHRpQkdVOGx4bFBFUStkVmJZQWRXbnhPRUZDdW1MYXJ1VmhsQUV1SlJQdEV0?=
 =?utf-8?B?R1FKMUIvdmQ5Mm1VcElkWVhTOGlLN1lMWXhralYwV0JyV016amJaZXVwVmZp?=
 =?utf-8?B?aTI1dm12T2Q0OHpVQ0tvenZOVHFEb01MTFpFdHpyR0JHaFJIc0JGWVpmN1pB?=
 =?utf-8?B?VjJYeDlha2lCRXlkdlBhMnpwS0JrMDFDckNXbzdyUEhsZWppRldXWGUwMXlI?=
 =?utf-8?B?dEdRVVJtUFN6N2RLTDZpWTJvTGZBTGRSaThZUmJBMVBZSEVCNGl1dGdpTWxX?=
 =?utf-8?B?SkVWVzZKeGZDZnlhU0w1THhuNmRCTHE3M0Y5Ri9ZQTAwUWFFMkVhWkhvd1JW?=
 =?utf-8?B?aXBQcnFTMlVEWGVlSjQyRDhVYm5FS1ZTbTV4OXhmVDZkaU1qRUkyeEliV3VC?=
 =?utf-8?B?UUJtOGhIWUFqbllTMFBVYUg5NVlFZ1RlSk0zNGlENmV6Uk01WE9yb2VaQk5u?=
 =?utf-8?B?U1pNTG5yTXZLREtMSmVRdTJZVG9aMGxaRjJ5TE9DMjZ0SU0wRVNza255Y1Jy?=
 =?utf-8?B?Z1FJTGJ2NktibTIvSmtmaSsxOXBsTUFQem0rYkw4Wlo5dHV5NFNXZytjRDdk?=
 =?utf-8?B?ZlZna3ZTd0tENUdSSWRYVjdkNkdZZDNvVHliZGVlRG5NUU1HaWEvOFF0cHhW?=
 =?utf-8?B?VVRCVHNDSVJ5bFNNMHNZcnFZeUJJU2QweUlvZ1d6ZktIWTgvb2VjMjVqSDFJ?=
 =?utf-8?B?QUkwTytzZk1hMkxvR0xheXdxRXdDR0IvUXZOQWhpVmVacWkyaVN0Q3BwZlZz?=
 =?utf-8?B?OCtRTytjK0NWVmVqeEc2NkNRTWpvSjhKTjByYlJzdHNBMU1YdHNWbTN0eWR3?=
 =?utf-8?B?OTVRbytBNmxZMEF3eWlqLzRNTzlCS0xMZkNJcVd0VnV5WkVTZ3NiSWs4VFhE?=
 =?utf-8?B?VFp0M2Ftb1dwQldHZTIrV1ZaTFRnSFgwM2JUUEVqYXZ5a3ZCOHBRV3ZVVXpX?=
 =?utf-8?B?a0ZDMXpMczl6cUdrZXVZWnFGUFRNd3Q3ckZRUlpXYmFteGVpM1crTGZuZ0Yv?=
 =?utf-8?B?dnd6bGpTNGp6S2tXdnNvaVhJcFBJV2hJQm1HK1VSZWNyTUpOL3hLQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b211da9-dfd7-4148-fa0a-08de9935ba55
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:21:57.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AdE6UANBZc+Jg3FgOKPU/zkAqGRwH02qaeBAbCQ+nCJNVgPRGHsguCn9Mbp2dgD9ub4oLfoZ/yRHVhuvRZxOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7073


On 4/12/2026 5:55 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 10/04/2026 12:03, Jian Hu wrote:
>> Add support for the A1 and T7 SoC family in amlogic clk measure.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/soc/amlogic/meson-clk-measure.c | 272 ++++++++++++++++++++++++
>>   1 file changed, 272 insertions(+)
>>
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
>> index d862e30a244e..083524671b76 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>> @@ -787,6 +787,258 @@ static const struct meson_msr_id clk_msr_s4[] = {
>>
>>   };
>>
>> +static struct meson_msr_id clk_msr_a1[] = {
> And existing code uses what sort of array? Seems you send us obsolete or
> downstream code.


Thanks for your review.


I have checked the previous Amlogic SoC's commits. Such as Amlogic AXG, 
G12A, C3, S4.

The clk_msr_xx entry is added after last SoC's array, sorted by 
submissin date rather than alphabetical order.

So I place A1 and T7 after S4 accordingly.


The A1 clock controller driver was already supported in 
https://lore.kernel.org/all/20230523135351.19133-7-ddrokosov@sberdevices.ru/

It is also present in the mainline kernel: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/Kconfig#n113


This clock measure IP is used to measure the internal clock paths 
frequencies,  and A1 clock controller driver was supported.

Since the corresponding clock measure driver does not support A1 yet, So 
add A1 clk msr here.


>
> Best regards,
> Krzysztof
