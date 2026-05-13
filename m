Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF73D1A86;
	Wed, 13 May 2026 06:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778653185; cv=fail; b=tSUYu+22zODU6B+tL8w4gmIx6wyRjtuklS2SqnstWSRGtmgM64iP/BexwrHi2xhpym4anUHWOj9a+nFMXSOpVJnzbRoUMU98Q3h8dcci3/CYlkTsistAi4VdXkXGxA98bC0khYyKMu4m4ny+syT0tiwdyVcHUWLhOrLaHn2VEbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778653185; c=relaxed/simple;
	bh=niuYN4BpfMEAik9iTl1gll/QuV/Fe9H91ZJ8lPtAr+Q=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QsoIWTYF2SQWOr259ZdbsUWgRro7JNj2YsZOVJbImDzxoqSo356NGp5JHVpUqNEaXBuwkgHR6fmukRq9EYJY0J4XyqQYUgNOlnUzDA+6pNiqNMZ/yp2lHaajeRE79vJoXQ2MG8mjfdOSVdzxVTODF/T4K9K8JE8bxhzkdBCBS58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=aIuLJL9H; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="aIuLJL9H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS8a3rLZo534U6SX7CmuV7uUhJmciNfRo2yBpDdekRPEzMRjfXKKJuWVp26tzN9Y6INYC/w7TPO6FgRkRsSwhiOeYSBsbpjioGM0fY1ewf2l5Vmqojlyis4PrffA3nCbIrAyFte1BYQrG3aVkMVRuwc7gzAdNtJ/bQL//Gj600ZsEo/tE3rtQjUVTnazPkpqCWPjHb2XnKr8xrfBJoVOp3zEtG+ATuGG6+nV/rToHdT+cXETq8DAkde8q3YDSEATBjrlAv2gT77cuUZB3B4Un5e76w0KGmbaVbhlsXSZuF3a3tMcryIY4zJHzu7lE5TO9R57eqGSWF/miBjvz0SSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icZ1x9w0+vfKkZRoIengQ4pqahRjLtnftYwn1YejD20=;
 b=aGwlTUjx1Po/Wc9DteaiAdo3sbywTmZdKRCM/vaelu0ubkvvA+oSEza/vJW8w40ESDoEBJAOhI69hz4L142tgbl2qUSlBljHUZBJK3QtiZKydeqA+ePzd4Ftu7GdC3fDevZPJs90omcAwRqeJYQb6od1O/S/suhB75Vj00S3PlBbDA5LWK6dv3EhD73e5P7GYCeMaT9ltM5reoW+eP1++yQrXnKqvk+GOAyMUwei+vxNrWoeXwqe8Mjj617nislfSnV85XBOALpnFt3rZu8/Cnj92fFdgxvwdpd1AQx8yw8pkABn37m0mud3WTDmyS0f/JuEH/mC0HV9zW6+li9NkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icZ1x9w0+vfKkZRoIengQ4pqahRjLtnftYwn1YejD20=;
 b=aIuLJL9HWacVEKRvepiSnCOnSBgGRuTI69hyH/QDCd3aDFi38orHMERlrlA/q12CqsnicVGqnXM4hW3fPf6iYaMFra29mjVciSAe5hnJ/Om1NLdADeEydr+fi9iEb5Vi0Y/CUbuL4iCWfIUPOjPQlg5DhNXQqxp5Adn7Pyi4eB0vdWBF5R5bO34bsZHye0SWDyDcCxvWkzC9WPW4GctQeFcg4tMu4qWnF94OVJcy4nFCTDn4Tv3VKfL5adzfvMkJJUJjVnAeBncx0At5OH0leJUjWxC8Uaygf1Vyb+8XYRozyRcohaBJxnayc9kcO+pKDNk6lH6RnaKbevMPDr/SAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 by CH1PR03MB8166.namprd03.prod.outlook.com (2603:10b6:610:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 06:19:41 +0000
Received: from PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::c062:a298:c61e:5820]) by PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::c062:a298:c61e:5820%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 06:19:41 +0000
Message-ID: <86ea0d5e-2a62-41ef-93b2-17b4c8dcc4f9@altera.com>
Date: Wed, 13 May 2026 14:19:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: socfpga: agilex: remove unimplemented clock
 in smmu node
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260507061210.933512-1-adrian.ho.yin.ng@altera.com>
 <9e777728-84ee-48ac-985d-7f2fd354b5c1@kernel.org>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <9e777728-84ee-48ac-985d-7f2fd354b5c1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PH0PR03MB6235.namprd03.prod.outlook.com
 (2603:10b6:510:ed::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6235:EE_|CH1PR03MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 3315d671-d121-465a-25f4-08deb0b79ded
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|55112099003|56012099003|11063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GwbfT4Ep8S56k1irPNwTqUKKajs6S2G1cK3cvJrl7M7tsNL69D0XxubfXfUP7tHjMlHyTaWxvmuzO6hFPr0izPdvBazuNsWPdyBo43ARECWExe4nVZXkzPD931oHEQRN3E3DopsL10IctlQC3ckZVSCXCn/ZouoT4heF6PODeYaVIjqkzo9IlsSUc6MBoH4a/jZeR+TZqQCOVhkmawZ23rpZARZFaI7JPdSFAAFcwbQzAvwC3raJaSq3wW3znAj5wKTS87wlvsVn29t3c4IWbjF2I/cjC0OPAc9639PbBii5Ol8eVcx7o9UeOcmYexUsgkDtjgV7npPq/IymNA23xE22WLNGtn5PzKQd1mxJJwhUpMY+dSMecuASzeqmdKxmyytLJhfh/vSTaZdiVm/dAIW5GpsxE6wjyNe6c+HMdRBPWyLd0Y+d18CaK9nLO6Yl8EY6LTj0Uewdu5CFHqi3fks0NFFnWA+zSx3mg57h6VKBQzXBa9Hs/KPs50LPA/mlwW98A2akwKQmvqMn1rMG/Q158reiuWWiG0Vn0UReRDHDv7dJQPA8MYyV/uZKPUGTO944D128zdFPxPAQNqhcfU00ppcu78i3Y4gtQ1YKpRO8Ye2ds2+4hg/CHj+tu62FW76aB3HIsYbYXXYdLf4vJU13puvsg5G2GiEYcn9of18D1KfsXQ83lP190BT6NsRk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6235.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(55112099003)(56012099003)(11063799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck8zSEV6d0ppRGw1cHo2K09xUm90M0R6ZXRrMGFkdGFrS0xEWTY4K2xYc2d2?=
 =?utf-8?B?WWdkQkFVcGV1WHBnNDNkUVhRZmJEV3hrb3lqT3FWKzNTSkNjZ203Wm1yR2Ju?=
 =?utf-8?B?SEZDY0RRa0srRkE1dTlZWDN5ZXp3WWR5Sm5xb2FKd1JURjJNdDUwSU5HUDNB?=
 =?utf-8?B?SnRaelpMdU9YV0h4aDlSMUhYMjJKaXhvOEEvTGdrUzdQTGN4VFBCeUdycHJm?=
 =?utf-8?B?dlN3WnRqN0NlQ2E4dWU3Rk0vQ0pmTlNLNkhXbXNnSUxMK3BBR2RUcW16bWZ1?=
 =?utf-8?B?WWs2ZitWVmRTVVQ0dTdKdGNJK2Q3VG1UeUNKeUVvdkFkQ1BmRjZCVTErWHBX?=
 =?utf-8?B?dFhybmpOU0t1MlVsbEVPTGRuQjBuV0tyNGd1eUhQWnBzSlRjTjFhblNnVVkr?=
 =?utf-8?B?QisyWlFKQktwYUptZzQwQXk5VXZjbGpUeDhLOFdEdGhxUVd5S3hSZTVIQktG?=
 =?utf-8?B?QkVQNmI3d2ZvMUs4dXAwVHhXQnNhOExsTURLbFl2QWIxVGdibmVSTmZDUnAv?=
 =?utf-8?B?RFd4cE9kWjVjZ1dvSWlEWEg3REw4QWNkNEFpWGR3Y0gySWZMeGE0WmZFdFNX?=
 =?utf-8?B?cUROanRJVmxVOHpvL0t0YXJDTnZPQ0k1Um5yMEp3MFIwS0E0Mi80YWNXUk85?=
 =?utf-8?B?VmI4dW9MYlc3a2lLMDFWRjk0V3V3U1NKaXFiRnlSQ1VtUjJhYmRnYjcwQUVp?=
 =?utf-8?B?WHVxd1VnaXBhQVhWdFI4c1E2T05FMHBld0ZyZlM0MXE1OFF6Y3czZDh0VHhB?=
 =?utf-8?B?TFBncDlmTGQ2RW9Ob0Nqck1HQjdWbnBhQnRMT1d2RkVHT0hnKzczNkNJOE9S?=
 =?utf-8?B?TnFEOEsxR0p1MmlZRFBmRy9PNTlPSzhNU2RDbHdNMndhS0JmRUlGSzMrRzQ3?=
 =?utf-8?B?QnEySHNJTkp6OWxRN2FTQk96U3BZTUppT25aYmZVYUptZWJiS1N3aVBPVGhv?=
 =?utf-8?B?RWZHajRnNUE0SkVtVzQ4MmNnL1dpbHdCaFZIU0k4ZmpKTFVWdTgvcUV4YlZQ?=
 =?utf-8?B?dFVXdHlOL0NYZEVIMC9hV2x1OUt3Y2tKOEtyOFZPTFgwOWV2dEJQeEl3VUJ3?=
 =?utf-8?B?NDIvTlVkRDF1N0JxR2dkek54enp1b2JDYUt5cDlsQVJTanB3dzNoUGtPVXBI?=
 =?utf-8?B?bFB5TVVzcCtQUjA3a1A5a1FKZVkxbG9ZdWF1SDVTVkkrTEdRVmxGMUJzNnFm?=
 =?utf-8?B?dVg1NHp0SVNFQWF6MTNqZUFsSU85TzFNVUpxRTZCMysxT3JiOCs4OTVERWFz?=
 =?utf-8?B?Y0NhM05aZm5mSEdkcFpJMURVZ0ZPQmJhQkhialpEcEtTRHBBUTlkY1NKVGtG?=
 =?utf-8?B?eXZiRVloYUZLLzNBd1ZmVDZzSTlRRzc5a2w5UVRGZzJJcDU3SjdEVEdTVzl5?=
 =?utf-8?B?OUcrYSsvaHpYOUxKYmlJbGVsaEVnZjRieHlzNG9JWkFLbUhaT1lmcytrYmlF?=
 =?utf-8?B?aXNUMHFXVXdjYXN4MzkvQnlHeFBERUNZNGg0K3dhcTkyZWdIc0F2YmxnaVJx?=
 =?utf-8?B?RkdtcUVYcnBuNVdkQmM1dFlkYUptTDlnaitHZ1NhbGM4M1AzRyt0dDc0ekFQ?=
 =?utf-8?B?enJiZVZlS21XV3dDa2lTZWZXYUtiOWV4ZHByUGQ3MmhyZFdoWDNodHZEeXpi?=
 =?utf-8?B?cG9EdFNUdTBKbFRyc3d0VDlrNjU1VG9URVRzdWdXNHdGaGpXMXRPMmJ2SDEz?=
 =?utf-8?B?MkZiZHFWZjZIZkszamZFaElCQ1lXSHhqcGIwcHY2c3Q5MGw1SHNuSi9OdzJl?=
 =?utf-8?B?QlE5YXFDaGt3RUNHSkRkOVEweHpsMWhjeVdZVnFqWSt1dm01aHh3NnBBMWZG?=
 =?utf-8?B?OUxseGF6enlwMExaR25rWHNSc0l4OTE2dm04VFFqRXUvNkNxYmRSWkwrZnR0?=
 =?utf-8?B?VFkyL2VCNmltV2d5RkxzU09mM0dka1h5QnpXUnNlSnlua3FtNW1BeDdmcllv?=
 =?utf-8?B?Smh2UDNsNDl0cHp1UTBLWEdWOElhbVhudHlmUFdraWlxS0pYVnlBVU5hNGFu?=
 =?utf-8?B?WkJZTGpVRjQrSnJIcEZFSnRGSTNXamJBYnZSS2E0MDRJaHlUTEc1eE54ZkNn?=
 =?utf-8?B?L051SlR1VHZETFFMblFVSzNvU0hxVFZ1TDNLMVNYWlQvUGlkTUVXeHFoVyti?=
 =?utf-8?B?dndRcVVMRkFxY3I5N2lHNUdIV2JzNXR4OGYxNmhiQ3NjVTM0QkhlSnd2bEFY?=
 =?utf-8?B?c2k1MXp5NWpjVHFhaVlpd1Q2N1dlTmEzN3h0VU9QK2FqV0h2S1JZT0FaZVpw?=
 =?utf-8?B?MXdzMGdUeXlaWFhZTDlrZk5rZmo4WElnRVFGenFhNi8rbE5tSkM2SDZMVGxO?=
 =?utf-8?B?NngyQTRwMXNPNHBzVXN3enNZWGRtM2wxck9JSDZvYnBZL0V4dUVBVkJuSFBs?=
 =?utf-8?Q?qGEJOMnCOS9qUFhQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3315d671-d121-465a-25f4-08deb0b79ded
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6235.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:19:41.2187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ha/kYWRG6SMgEvNtfphAwyEJMabtQ/34c3SzJpVBH5G+/ZWk4h3dVxFwAmVhjoiScZMhIaF9SQrHYyqgwVWXESSVMItyei9Si9OEbPqetvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8166

On 5/8/2026 8:43 PM, Dinh Nguyen wrote:
> 
> 
> On 5/7/26 01:12, Adrian Ng Ho Yin wrote:
>> Remove unimplemented AGILEX_L3_MAIN_FREE_CLK in smmu node to prevent 
>> probe
>> failure when smmu is enabled.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> ---
>>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/ 
>> arm64/boot/dts/intel/socfpga_agilex.dtsi
>> index 0dfbafde8822..6bfee8263b3d 100644
>> --- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
>> @@ -445,7 +445,6 @@ smmu: iommu@fa000000 {
>>                   <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
>>               stream-match-mask = <0x7ff0>;
>>               clocks = <&clkmgr AGILEX_MPU_CCU_CLK>,
>> -                 <&clkmgr AGILEX_L3_MAIN_FREE_CLK>,
>>                    <&clkmgr AGILEX_L4_MAIN_CLK>;
>>               status = "disabled";
>>           };
> 
> Hmm. not sure about this. When I added this, the documenation had the 
> clock and it's defined in include/dt-bindings/clock/agilex-clock.h. But 
> you're right, it's unimplemented in the clock driver, should the fix be 
> to implement it in the clock driver?
> 
> Dinh 

Hi Dinh,

Since the clock is documented in the TRM, i'll implement the clock in 
the clock driver submit it in a separate patch. This patch will be dropped.

Thanks.
Adrian

