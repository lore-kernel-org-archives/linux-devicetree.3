Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879F26A1CF;
	Fri, 12 Jun 2026 13:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269523; cv=fail; b=fQCAtqCY6INzej64+/k71okWmk8+YuFe6MvPjAWAv/FOGH4ZfXg6afH/quEf1JwFXsoQt/7Tk5i9Bke3Yqzms/tJzcL6at/7fB7baT9z0tT0T1QdCVXmY8O6h0crwttJ+b+pGFS5GqE+I/jGh05wHGmaF5a0YmfHC40Cf1mU/Vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269523; c=relaxed/simple;
	bh=7jtzQWWBWUIpHErBa8yIBxWHJOJkEipiW1xvD//BD8U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QUPLYHuhGdYjn5NP4ASAWCI5iQQvlxYUbsPsethLhoysQ2Wrc8Z8JsfLvSj6NiY0mRKW0jLnteKwQTaI2AdM6lHbGqGMcMJufQ2oemkh3L9OGspbFcLO0VgGEm5MvptIZ0EA+E5GeHXhFATJ+1cNJK4ITBqPX/j/t5oFG9rcC64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=u2jQszlm; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="u2jQszlm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGx85l5Q8r6kuYs3MVTvxbPay7N9ql7uS65UTBio1K/xt+F9/R5rGrRyGlKVbhiOxfWQhd6HRfOdCK+nrcFx2KklsPDO+VzafgXNWYC8TreI183+KyCbGiJxx/qOlzuEdf80zHY6dVv+NLCowmowmaaMCglBsicHSrSMkFx/B6YZEvbeMd+yZBYVT0tVqiZe9oxgztt7gpjosRGmINgPYFrGeCCE6VUZ6Ouz+CcNPtWKg8OdMW1EaHhz7VZ3hdFdPGeJPf+tqeZoHpyFAS9RuAqwPH+2siOtU3i5vkj2Bv//LikPxxVnE6d2XOyk3gIlbK95KgWhLxgD7va/VOEppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8yfaxeRePyb2LqBNIg2kckoHLgm1068Ri9M/3iGSP0=;
 b=cjxd0MdFHGYQbydkC8MvNoALm8h7UTVzq4YYy12b6KiE/CLg0sNzQLBFYbZkq/ClG2E81tJ5TZ4k2ClopXIAeFc5ZlIy/WRrwZku3i9Hzio/dzErF3+E+k2FHc2GO/jxJkxPF48fTkQl2GivmFxbBLeP9CgyhOhaMLms0MdsJqSU9C8jUNLV0hxAh4gIDHDuNWz7W1XOFJTwnbKYfQcwgxRtWRDJPfojAiztW8KJ4wbwP6nEao53+twqVnVBdHCLnlkWranU2GHocRng4DhBQ5wIAZPkZA0rqDiC/DabBDw3kXenxvwyzKZmyBhSS3aCYyNWnmQP7XMssJF+CETCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8yfaxeRePyb2LqBNIg2kckoHLgm1068Ri9M/3iGSP0=;
 b=u2jQszlmdXXUeJP2w6Dz5IpJQ7enxciEa+nJocjQ1F1U2t3d/CVLsoN24k7nHTT4f6CP7HAllgDTJT+LYu3mOjZwmGlVdVqb3DT4FHu+FCAY/uBFbzoMpHt/Sp00kkQhIbRv/BFPE896gd855iNzNomk/njzaykX3CrMTg3EuKr4MY1XU48/61J2zLJ9jdIDiq7xoS7KqkxIIR/CnMRZX57pfvITZ6SdcqMhK1w/aTwUGswzNpednt311zPeGgRvpcL1g5ZqCLykc262TLQlAAWrZPnZ93wlUP9938NUTGmRTfu3LQCvAzz4N/l/BjWst3xlD9rwnbQBorRSBANDQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DBBP189MB1243.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:05:16 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:05:16 +0000
Message-ID: <2d322076-fb77-45f2-ace4-3754b8ac9c6c@est.tech>
Date: Fri, 12 Jun 2026 15:05:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Enabling CoreSight TRBE in firmware on CIX Orion O6
To: Leo Yan <leo.yan@arm.com>, Gary Yang <gary.yang@cixtech.com>
Cc: Peter Chen <peter.chen@cixtech.com>, Fugang Duan
 <fugang.duan@cixtech.com>, Guomin Chen <Guomin.Chen@cixtech.com>,
 Hans Zhang <hans.zhang@cixtech.com>, Joakim Zhang
 <joakim.zhang@cixtech.com>, Jerry Zhu <jerry.zhu@cixtech.com>,
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yunseong Kim <ysk@kzalloc.com>, Yunseong Kim <yunseong.kim@ericsson.com>
References: <5d1bdf6d-ed77-4de9-b788-cf04a98d054d@est.tech>
 <aikVYZDMYuPscIKR@gary-System-Product-Name>
 <20260610113435.GV101133@e132581.arm.com>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <20260610113435.GV101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0249.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::14) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DBBP189MB1243:EE_
X-MS-Office365-Filtering-Correlation-Id: 33fa4075-ff58-450d-818e-08dec8833f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|4143699003|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rIe0oRU/6oxhZKBBA5TyNEBEOzSsnHhUPWq3ilz1zzeHcL5jQBQStVG6HURk2LIJM6HZSDmxPYXAh9lyfF6y+JuW7YeVCXw/VHGP1WjhrHhTsIMunw9q3rZ21ZN84gOy5Uz4twY0AgRVySix3kyQY0J88fE6eMjE28SEuW+2U8Xg3mwrWknydkDRvIzjlUO8FeThsLZQWOg6eJh/eQvDPLlyQINRBAacfCJ+xjQiL2B3x5XofpX4In04Mg8RjlCFFCeuqyQqiYaqvscqQsOMutPxMPOPL0XXgvLm6Hs5hedxNhn2+YJcFOgDZ2taM4jGkTO+orydIrjZF9Od8X60TzEz+nZLhCJYrnxLpJU7fbN7c9ju7JTE66D5uxwuwv9AKCv2zT9jPONiGSKSLx9iIK11uTevScHtFPwTRz8jKOxGi7z3+xI1UH4MoM8Alh37w8U8+009tVyfwfM0ZaXaXNCxf/35Y3T70H3BpRXX8eNkl9O4mTTA46Tyt4tqbv4Md2SyjfTdIHzOc8CBJeoYSco2GddGRaYIAZzC6PUmuQYLwNNgs5Hub2faFwYez3HNatYjEkcXdmVecYnT/G9gFzZXiEGohfyADGSCjI703P+yqpA972eykgcr1MQs4VPSqijblHx3uPl0Vz+VIx7H0+vX0/mBUDqxBvlrMBKLGxpwzmbAXWPSVIVT956mlnMal3ZFpJjByDIq2BVutjWA0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtrR0UzUndsbTVsUlY0MnBsb3dxUmFDVXZmOXE4V3Rvd29zMUlQSkVNaDQ1?=
 =?utf-8?B?QWRlZGxNQkx0UHhtV01SKzhaOUUwQW1VL1U3bjJTRW5JZlZVUWJ2ZTMwKzhj?=
 =?utf-8?B?aHlzTXVJajl0TFBPSC9KRGtYRUkxTzRjc3Uva2o2eEZSYXUrUFRBdDJZQmdT?=
 =?utf-8?B?eFVRQncwSjFudEptZklXcmpqZHJqNkdVYlE2UUFQZnk2K1UvLzJqdjU4YlVH?=
 =?utf-8?B?RGxjK0RKU3NMS3FBZ05zQk5BekVsWm5KbWdrRTN2TjV1MzNxT2t6SnptRW9x?=
 =?utf-8?B?VlFrMnBJWmF0VEdTOUU4UHZ5S2ttaWN2UnBRd01ZakZRaXJyeXJSbGRFTlhn?=
 =?utf-8?B?ekx2cUZzTnNnZnd5VXgxOFRTT1FORzFFQWhPQm9qZjBMUmtSTFlaY0FIMVpr?=
 =?utf-8?B?dzRpVVhoellUMGhjTElXSkxVTW40aHlvc2F0ZHNVekRUU3E3QVlHT0x4aHJC?=
 =?utf-8?B?Skxpb3FFV29oSE1BaHRVK2Q5VDg2K3FncytMbkVZcFh3M1M4enN0V2NVYThq?=
 =?utf-8?B?RmR2SmJSU0VMbmZ2TWM5TlN1NC9FYVZkNDBwUW5hd2NEZHVJR21NUzZPRkI0?=
 =?utf-8?B?TzZqRWNERjVwakdDemZxYnBFRkZTOWNiaGh6NzNjMmhUM2NiVHZNZm93akRj?=
 =?utf-8?B?bzB3SmtGQnU4c0oraW1udzBsN1ArbVpzNkxiUTZTaDhPWHRoWXB4MHlTdGhp?=
 =?utf-8?B?WmVlaWRVNExJSTNIVjY4dWVoelBWcm1raEVtTExpZjhmdmZzdGFtRlp1bVIv?=
 =?utf-8?B?WTdHaHlNRkVJbHQ3VWk0M2U4cWQycTdEVzNmTE5sNnRMMVMwS21JaWNQS3BF?=
 =?utf-8?B?SkpKUXkzakQxNEdtVGZLNGhvRElCOG5yU1Y2VXRwMjlvZGFrcFZiaXpCdDN4?=
 =?utf-8?B?Um83WFVXNzBHSlZSKy8yb0U5amNXTnBOSXdKSGVZMFNRY0RtVGhEOU0vMmdu?=
 =?utf-8?B?N1Y5eS9zbjRiZXBhUmczYXB5SXNoV2g3eVpiRlZ2MVdPTlYxVitTRlQ0UThP?=
 =?utf-8?B?emlBbUgzR25oWkk2SUFFdjNtUkRhYklmT1FDRVdSdkt3WTZDNkRJampKcTlG?=
 =?utf-8?B?aUFlWVhxRGVpb3gzczRLcG5Sa21nUnNBdHZmMzU5RWNydlhnRFJlazVkMGtt?=
 =?utf-8?B?OXVyQ0ZpR0FlZDN3QWRwTzRjV0RzcU5KQnpwQjBRZkZlZUdTbDhlbkVKZTZC?=
 =?utf-8?B?bTZmcVZ3N2dTMndCUU1tS1I2dGwxNHBwNStwSjhuUE8zOTVKQ25UZENsUW5k?=
 =?utf-8?B?V0xEaWZHS01ZL1FkaXRpdlVucyt2cndCVEFCL2I3bzJFYndCV05mZHVpRmpL?=
 =?utf-8?B?MTNyUWNhQyt6M0t6Qlk0L0hFUmNMRWhUZmR3ZE14dytvWUFIRFVwMTFVZFhG?=
 =?utf-8?B?b1lBeDQwdW5GYVZGa1FaNTQ5TEFDaXVJNWM4QVRlVmVzdXFldWZ2Q21yYTVH?=
 =?utf-8?B?VmtPcEs5djI1cVZjZEZKTXhxbTVsVDZtaTdQcEZOMnNrY09pQmIwUk9mdTB1?=
 =?utf-8?B?c1lQSTFoS3hxTUNaNGZFQnhCcnhXS0JtU0JRcjRrckxGMWZWS0tobVlPYmZX?=
 =?utf-8?B?ejFCSi9qU1pZRGg0Z2MybUhmK0ovcGNJYjNuQXBDSVdtd3lzb2lSY3puKzgv?=
 =?utf-8?B?eThiQm5uUXRDc2JRZ2FEU0RFTUpEc2NrTUFYZ3dtWDkzOHhUZ002YnlCajJj?=
 =?utf-8?B?bVBDM1Z5YXp5bFFHNXJ0Q0cvVDJrVU15alBDUlNZNkNYaTE2citXSGZUV2x2?=
 =?utf-8?B?bjhxdE9hcWxzSnE4emY1WW1VeDFuVkNQMFUxUC85N0RZa2ZNV3VaVXdwQURs?=
 =?utf-8?B?RVNxSW4vYlorYjJyakJZdkRmSDJXQ1pNSGYwY1RiQlVEOUl6cEpENGdWd0li?=
 =?utf-8?B?ZnYvc0MvbVZBeEp6N2F4WVBwa3R2cHc0VFNKazBIeTV2OU1Obit6MXduSUtT?=
 =?utf-8?B?bnZmdHhCWEx3dE8vdjhRaTlkb2xlZUtnbmo4ajQrZVh5L29US1VjNXQxTkFV?=
 =?utf-8?B?KzRBbzdSZmNEaXBubUUxdmpaY05NbnNQakZYaGJNN3ZUODMvSGpsc0xENnF2?=
 =?utf-8?B?THRDWG90Rm5HaDcyUWJBWUN0UEFJckZJWXBPR2s3NzFyUnFYS0lPM0lYWlpm?=
 =?utf-8?B?cjZaUDBaeXQwQ25oMFRXWkp3bUVOdEVsZG1QTDBxSE9zcnpRM29sU2lxSWx4?=
 =?utf-8?B?NWt1RXZOZ0pTbHd5TEo2cEN5SE1qdmZ6VW1pYnNuc0paQmJGN1kxK01wNS81?=
 =?utf-8?B?bks4R29taVFOQVBFQm53c0RXcUhYUENJMHpZY3J5VWdlV1JWbmlQYmdlUUwx?=
 =?utf-8?B?U1Q2Tk42Tyt0S25kdGpxKzczMkpzSGZBd2h4dkhCTkx0L05USmw4dz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fa4075-ff58-450d-818e-08dec8833f3e
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:05:16.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7yjkdkS56WgDyvX2mUncc0posZX8+idGDFbyh0WjUJ7sINR1n3RA3p+IeJ9Kuqh8XTmX3y5eof3ktQ3x5Z2KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1243

Hi,

> On Wed, Jun 10, 2026 at 03:42:25PM +0800, Gary Yang wrote:
> 
> [...]
> 
>>>   (2) Or expose the full CoreSight topology in ACPI:
>>>      - Add ARMHC97C (TMC-ETR) device with MMIO base address
>>>      - Add ARMHC502 (funnel) devices if applicable
>>>      - Reference: ARM DEN0067 (CoreSight Architecture ACPI bindings)
> 
> The CPUs on O6 support ETE + TRBE, you don't need to use ETR or funnel
> modules.
> 
>> The firmware (TF-A) for the Radxa O6 is provided and maintained by Radxa. We 
>> will forward your request to the Radxa firmware team and ask them to evaluate 
>> enabling TRBE access from non-secure EL1/EL2 (i.e. setting MDCR_EL3.NSTBE = 1 
>> in TF-A), as you suggested.
> 
> The issue is caused by ACPI: the APIC table does not contain a TRBE
> interrupt, and the SSDT is missing ETE nodes (ETE node should be
> present for each CPU):
> 
>   Device (CPU0)
>   {
>     ...
> 
>     Device ( ETE0 ) {
>         Name (_UID, Zero)
>         Name (_HID , "ARMHC500")
>     }
>   }
> 
> Thanks,
> Leo


Thanks, Gary and Leo.                                                                           

I'm looking forward to adding arm64 CoreSight usage on CIX Orion O6 board.

If the board supports CoreSight, I'll make sure to write on the perf tools Wiki:

  https://perf.wiki.kernel.org/index.php/Main_Page

Best regards,
Yunseong
