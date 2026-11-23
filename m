Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436350;
	b=lB4G1OxiXBdQZ7gYwu533XZHKmHCX1sia6amWeaPBP9THXI6yfFlnZ2Z75IB+G5qRskY
	 fw1YY4qevfqKXlekLvtRSIC9sOFUHQRXYT8QJQ7VYxUpI2TlOFseiKA/dy7l/+t+e+dv4
	 Zr2V9/m/EHkjMfASUEycgOClG4zKCmj8gKKcrPTbGgtRDcxs5o3VvhNsYcMJbza1Sk5YR
	 8+zYkiBPRPy7zy22nKbqtAf2miomSia0CBQ++6m+S6ElGNxOoZ6gTgN7L8NffhhjI+yHA
	 vRe5NPXFFQEKjOR+KZU3qPMds2B+0uIkvqP6uTRyHdADsdyDlm4bmU6gn0tmB9TRODw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436350;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Rk0UxTiv4fKraE1rm8nhq9W6eqxgmq1J4UyuoCcESTw=;
	b=b1E4ckf9mRoaYj6j8uqNPBlRZWs74ND8gdxt2TQF3y9bDQAOWyXdHUZ/V0Gin2vlUkE1
	 PqMqQbyzIPDCHSZ2h3bm8J7zlKaMUWGCqG+JE00UokzGKaMbHsMAhpqWVlLBJWedz/WLM
	 iWQzJhqXbOgD+28tAJwpuuDPGI/DD4f848kMgE3Xgd6Md17xdUvra814SJOdsyG6uRFaF
	 lS3q68V/W/wqRTnYADh3Ja5VaPbeqB0lo1taGExf0ETZkuBxmyAgSGESEyTSXhIXMzPNQ
	 rdAmZrviqBa8rwowrnwxxZPTp0v+394dNBUKDOBZMUsrkWvILA4Ji875YsjMc6MVmGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WggwI5TQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.2
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0AC606A31A;
	Mon, 23 Nov 2026 12:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A0AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WggwI5TQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2uC9gc6wkdGTGJ+JFOND8d2Np63Bh1+tq8T/OBoFMR4erLNR7ujdtG05aels7a5kCCj/tJ7RTkRpQSjySkfKbbHovFdAcKBHq2WgWrnRMQT6R6592I5ysgD1/sUjfWEdc5yEpRVvayHQ6FOVF+IbzmyzbMqObpKv330RHbVgq2rMlLuVtdVuVyhxl5M5bbUDLfzvSZscpDys8rXBWwn4k7z0ho4gsgZCpJqPGZDZ/og8ey7KXzuD9E3hOo1BlakaanrvcpbWFQsrEJcQ5/1P9GFo54STRgR+iCzlB8rOD7TDOtxXYBm4n+imQQXicsS4+VFpm8AFeu09VhS3c98Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk0UxTiv4fKraE1rm8nhq9W6eqxgmq1J4UyuoCcESTw=;
 b=Umdag4532y81tRq2vpwhr9jR8c7OxbsbacwyW/+NkLuBiE8o5dDaYO5wue8L2bLThgUrasY7E2MPcG01hINfEU9xXO6HwLlDoxJBZ0UjOBsIpA/1RQd5Z4/84OlRp7qfxOGlVim82n9osF+XyYuq1UIIaHKFlcmWz9ZlFhtf758PHugn5EJgmF4czdSeTUA582d1LMbns+lDncTUu1pr3YEMV/T2BvRYuJ5UlfWmgO6u9a/dPi7u3HT9XMiPvYJBOjLXFXieOfJWCBFNCpMuY62oygvzMInGhj5XR0N9aSrkcod6kW1+A88WEGQEihn3xSlfZcCx4zsNe/43aI0NNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk0UxTiv4fKraE1rm8nhq9W6eqxgmq1J4UyuoCcESTw=;
 b=WggwI5TQTWzgHebLpJ/A2OTblBMjcqjvDxmjmrAiTe1rRU29xMGi/1CyVNMf2PW2smCyD8HJz88j+BnfDkV+G33iNoTQyEoZJsZxGbzwNhfQAIVhKXQ/Zbs/q7MYEKTj74GZY4D5qNA/kIhbYPpa/XS3bS1bTThgo8JmXodAMuo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 12:19:01 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:19:01 +0000
Message-ID: <4ef12959-4094-4a48-9b00-84f7942b5e08@amd.com>
Date: Mon, 23 Nov 2026 13:18:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: zynqmp: dts: Fix file descriptions to match actual
 filename
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <c552d657b81c55f0ac2ae78b8d8abbde5deaebdb.1795095853.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <c552d657b81c55f0ac2ae78b8d8abbde5deaebdb.1795095853.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0094.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35b::9) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA0PPFF4B476A86:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3dcabb-5891-49f3-8db1-08df495bf4d2
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|261021123027099003|261102123227099003|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/mBW0moSBErGM3zNWs6NecL/d3CQ0mOACNwDCYXPrzSFcmL4Jk1oO+reddXpaAER11yh2WsbJKjZD4FFkRIyeAs/qce1UEi1bLfVhWIVwQwnInaGUBaQ+Ft2/rgzt4z7GgvIwsgHiHoHQEF+Pw4KHiO1NxEmrlaU9OIuy+5BqLXyl+1xRPn0N2tZ9+gp9kitbrsqi1QKoLi0CL9wRNqE3sS2M1yBomrAOsOnFe6HOFOokGM6MU5ru5RrY2egDZnLLWgH+/drgPZanWJ5Fs0o9qafwE8HGBb1afnqrItHt+Ajuyy74YwzhSA22nai7pxJJfW26ovqh7yyRH8VUQ+yS1JKvZUbjiQy6FKPXa1WIUFgd+V0K7HFGwlSggUntf24uHekT0Fq5IHO2Q/6h720y+SaufwxCRthVPTg8xi0MS2AMoxLmXvKl3EuX7w+FGcIPRphFiJjGh5PMbqHssn0T7CCkYqyTwnODYBVqjkp7yb6A+zr1BVDpCRXAfX49RGQMg6nnSUvD4ybhcmIvXSOJ/R51vlwYmCx4fldYpiAAkUYJyGpkAkiYqUGVWE+cUz+lZCNV0v9G9WMC9IQab2/dB3skgi8k/7Qjr6sCImewjyEirA/SF6Wev9bMNj3hf3YBlegxYPaydjzp1cyvSLW56KtvfUjOjZa5ujpFvsA5qc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261021123027099003)(261102123227099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3V6QWVCc2RRWjhjOUpkbDRtWHVOeTFESXdwWXI0SnhicnpxdjV1WUNVNTZs?=
 =?utf-8?B?UEtCaWpxMlFONUJzTnNLSWcwcUZSWmtqNEVXWnBrVmRaOUh3bDVVVWV5RHFP?=
 =?utf-8?B?a1BETUR3ZXFjaGpyeVp6Vzh4OE5ING5yVXVzbDBvZGlvM3dUZ3Vwczd0ZS92?=
 =?utf-8?B?VWxIQVgyTXM4cTBucW1hb1lodm9jWVkvNG95c29FOVBBUmdVOHlqZm1VZmlt?=
 =?utf-8?B?cUphclA5a3NJajA2YklJaFhUc0hkRjV1RFdtaEoxTnVaRDBpVVVQV3h0UTJZ?=
 =?utf-8?B?MEhsL2s3OFZaME9Wb3Y4eXAyRnJMNXBkY3dqbVNiblppZFl5NzAzM0VYOVpU?=
 =?utf-8?B?ZjY1M3VlNGg4SjR1ZFBLYlNyY0xacDYxK1NiM0xEUHRRMlRYWjd3Uy8wVjZN?=
 =?utf-8?B?R0pDVHlIQ2FPdGc3dCtONE84NmVtSkRaN2dkU21jVEoyS0dYWTJ6bHlybHFu?=
 =?utf-8?B?bnF1NEVIZzRycEhLWG1FelpkUkVhOCtwaFg3TXJ3blFJSm9jYnNMMDQxWUNX?=
 =?utf-8?B?bDZwRmh6c3lTeHA2OHVzakJLMzF5U1ZhVXViTnZRSjFwNjBkcjhMYW9zWVkx?=
 =?utf-8?B?VzhiUGlyZzlHeWRnUDMxOTUzUzdNNlQyV0lZYUhScXdOcVYyb21VYzk2dEh4?=
 =?utf-8?B?QXh4TWYrbUJKRW1vNGJVK29hVVorU0w1M0VJODBPR2JIRWhuajFTYjUyMThP?=
 =?utf-8?B?NnMveVg4ZVYrY3dwOXpSN1FZNHh6VjUvME85MldJY0tGczg1ellybDY1Mlpp?=
 =?utf-8?B?STVMV25YQjZSbzlSN3JFcGg0dnJyOTVucEdJclVCM2l5Sks3U2dnM05PYWF3?=
 =?utf-8?B?VjVPS0lEbVJoVmcyRXBHSVJkaDYrd0kxN1RXcmtIOFR4RnZBbFp4eFQ3NWVk?=
 =?utf-8?B?dVJiQkhaUXR0d1pseG5SZkNzdVFMOHAxWUNrQlFmTkp2V05sMDAzem1ERFd3?=
 =?utf-8?B?YldoQzRKczZxZ0VidldrR0s5Q2hQeDBDME1UVDI5V0czMXhQSUFodDdLM3Rk?=
 =?utf-8?B?cXNQUGVHSGdmUXBva3JQY2lsQ1FMREYrUjZVY1pSMTBVbFVLQzV4azJDRTJ2?=
 =?utf-8?B?VjhWQndXNGd6OGlUSG4rMkdERUczZVkybE83SGRhRWZodEIvQXB4cHhLYzk5?=
 =?utf-8?B?QVJIR0p4U0ZuMVptTmNzdG96V3dqK2dZTnJNUUZPYTdSY3JQcGYvTmpCbGxM?=
 =?utf-8?B?ZDI4ZGNZQTl4ZmxzeW5kU25UZUdESEt3UW82V2k0eXZUdExZc1BuMjlqditS?=
 =?utf-8?B?OEJVdUJJY1NQYWVxRmVxNVBpYzdmeTdiMHRhM2pncVQ4eTlXUEF2d0phNUc3?=
 =?utf-8?B?dmNMTFBxMzY2a0NMQTBVMG9xYmdiRm5Mcy9iSHJZL1FrU3ZCNUtteEhvcGJy?=
 =?utf-8?B?WFZIWEFoMmwrT2xlaHUySG1jREEvajhwZDc1MHJnR2lSQmlDQ0dCQm43WXdE?=
 =?utf-8?B?TGdPcWo5QmRCUHF3d1RCelZ3YlZOaUpTWG1hOFo0d0J3V2pybzU4T3g2QnAw?=
 =?utf-8?B?REg2cmZqTGZOUVRiWTFOOUU3UzBGWkdMa0pneVl2UFdaTml3Ym1RbTd3OUpr?=
 =?utf-8?B?eVc4VkRKeE5Ma2N3UE1CbE0vUlpzYWFMSGo5Q0I3TUpJS1RhMFdWWkJ1ajky?=
 =?utf-8?B?VVpwcjdSQ05Ndk5kalV1c25COC9ZTTBUUGU2VVozYWhhWDlnOXAyNU1iRDFt?=
 =?utf-8?B?NzhrNHhvRUUxWTc0dUttVG4rMG10bWtYeVMwK01sc2FUV3VVKzdjTGFKNWcy?=
 =?utf-8?B?OVFtWkpnNmYrZktJYmdMbVZrNWU0bVd1dkFMekd1WTRrNm9IVy9TbTF5cWpZ?=
 =?utf-8?B?aTgvd09sTlFpT3lvZnFDall3NXF2Nk9GNjZmRkxPNmgxLzNFemo4TU51R3Mr?=
 =?utf-8?B?QktJT1oranN5a2d1NitVRkh3NVk2b212U0F3aUdvKzBNRHFpM1dFM0dCMU1L?=
 =?utf-8?B?b3d0NDIvWXl0RDRVb1YxUWtLaU51Z2lhMHlMeTJ0dmtxVHJ2TVRUS0dEblNq?=
 =?utf-8?B?OW5FQ1ZBQWhHWlFKV0ZCOTRzQ1g0clY2S2s3WjRuVkpUa2RqK3grejVkT0Mw?=
 =?utf-8?B?bDdCcU52YkFDdnJDNzhGY3RuMnY0OFpUTXkvYmVYQm9STzVLRmR1QWFHQitE?=
 =?utf-8?B?MC9QWXk1SGdwa0FKbDhWZWFpbHRCeGUxaXpVR2VOT2tkN0hUVFJwUGRuSS9V?=
 =?utf-8?B?RGVKTGRreFF2Y2tsdjZ2YVBXOElQcEJXMzJaK0Rod0pWSElBMGxuVWYzVVpv?=
 =?utf-8?B?K3BIRE5SamYvUk1zT1p4K2Q1R3JCbDh1djBNdUlIaWFPRXdLdVlyNGNoSHVi?=
 =?utf-8?B?MDRRaDFmVHFFb3ZROVZ3ZTM2N2phaFE4eFlWM0tRYktJVFJ6VU1TZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3dcabb-5891-49f3-8db1-08df495bf4d2
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:19:00.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpdCACFt7aVZXVQHQPKA4jtGzjB6M6W1TMU3lTD0Wus1qq9iY8c0UulEruuqs8wr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86



On 11/19/26 14:44, Michal Simek wrote:
> zynqmp-sck-kv-g-revB.dtso: described as revA instead of revB.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> index 49732de5fa4b..e919155bac9d 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * dts file for KV260 revA Carrier Card
> + * dts file for KV260 revB Carrier Card
>    *
>    * (C) Copyright 2020 - 2022, Xilinx, Inc.
>    * (C) Copyright 2022 - 2023, Advanced Micro Devices, Inc.
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> branch: xnext/dt
> 

This is simple enough that I don't need to provide others more time for review.

Applied.
M
