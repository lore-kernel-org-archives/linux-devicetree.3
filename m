Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011028.outbound.protection.outlook.com [52.103.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8946538B7A6;
	Sat, 15 Aug 2026 19:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786823107; cv=fail; b=rBHIvJp+Q0pEsbTJfIocgd+4suuuo8G6LNeXRLB/T7S3DtBhszhQWYAnlwBWD1SOnsXA0ZNpjR6OZD8fYfC42bh9wCfNIHEDWLJYZuezLPvOTwkWI+l27CS2yvpXKDRkf67OnonbjNS+7AnqMGVkUcavsH/rTdmhceeIoYB5lKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786823107; c=relaxed/simple;
	bh=a7zNf1DJ/e4ottgm+N1GC4TQfijmlGkrdL/nYIOo+7k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DB3HaOOALU8HAEXUlq40zbiz9DKS6q3JqFnCOHDdjsIbaoHBQ9NSUcsTyrOANFOJLtpR/P6kkB1KUyFI/3ZOL31JkLsvxOgZvdnuHl1f86TzFuA0Z7YOOk4sgUHBwskEKEvt1qKT2HHae9R7K7LucChZg9rxpco2WFqzfzYm4Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tqJVG18r; arc=fail smtp.client-ip=52.103.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tqJVG18r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTEpjWYi34snQJilNgw8WeIuo5VNscZU4UFiOx29js7flaqQJrGCB3IpImwJQJzxFFhkw0nePTCYCj/JWhs3YDV12EOdspxoSvt+bKJXjOlM5fmcqvgxjSM6mIeaeTi2EPd7xiD2vVTMjyd5ogemwz7LuMMX71TpdPT6H2tI3wnkiNpvtHj3kOd9On9YU+c7KN6B+8e1oo0z68/HTPW1F1349ojeznieg4CV9FhEFqWupZflxgBK1VntbIpus9jTTXyHQJ1bMlrsERxhHwdcjrnA4nTS/h0Kk03LZD3EvqHx3CVmdDRErnCr1LVAa78djmEhIXd9aqV6LLZvOBAr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilZ+evwxGGatQzvo6gDN/gHi0uCI9+Oi5SDOAYgJdXs=;
 b=wVZMfEkJudSu8U0w/RM60GNXT8l8phV4S8NIHI9NL4c28fQu2oF+4P8bi29YaUyHnK57Cn7GFM/i0DXDUptdbdVB1pUBTR7nwSejXxpGkLHIeuh45gElDCSAOWvkuW1+2L8wTgi2f3wGACTSYvuatus0vbZipovLxMqah4cj523Y1LGDxf+xEB2Qc+O7lkdBh6Sks79dmLrZ88LchGLyGBFtnbXR+wwqg5p4qlGVxBbZxK6PlonEO3aq+2Dbny/FSD/HZkS0APgzJKTZjEK44PMe7FWoww4b16MjPWONby75nHSFjrhmTto6bOiUKNZVZMlG8QCzsxoa8E2JM5S+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilZ+evwxGGatQzvo6gDN/gHi0uCI9+Oi5SDOAYgJdXs=;
 b=tqJVG18rblv4VERdOZHQFYk147jaZiigK7mmdnJ1RlRAeapslPr3854u2Ygf9sDTaI+JleZ59k4NjBY3U6Z+kUKKOvwigwEUG94TZqUI4+7fGHCnKPrHqEGLnqw86PtG/vLOR1GpC5UL7sjktAOhamIdsBKdsJPvtiyJCMDe+HUA7v8G3I4l1yj/7qu8LdbdSIPs2uXj1/YhjGcVllc+ADfw+pgwd5pp2A9ylbgNHCdXmEyVaBU10t91PjqreguMlVJDSSQiLxYNDqcM1Tvfzl/mAFZp6p8/sQd02/HQGlEdav9Mh2J9YJLB5wK8seSrEhYYOCfiMZRL91ULGdfqpQ==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TY3PR01MB11723.jpnprd01.prod.outlook.com
 (2603:1096:400:3dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sat, 15 Aug
 2026 19:45:02 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2%6]) with mapi id 15.21.0315.016; Sat, 15 Aug 2026
 19:45:02 +0000
Message-ID:
 <TY4PR01MB144323654B3A6569BD23F918E98D92@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Sun, 16 Aug 2026 03:44:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: riscv: Add Xuantie C906/C908/C910/C920
 compatibles
To: Guo Ren <guoren@kernel.org>, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, robh+dt@kernel.org,
 conor.dooley@microchip.com, krzk@kernel.org
References: <20260815015722.1736831-1-guoren@kernel.org>
 <20260815015722.1736831-3-guoren@kernel.org>
Content-Language: en-US
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <20260815015722.1736831-3-guoren@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0157.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::20) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID:
 <7a7f64a0-8220-4782-ae31-278bce141928@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TY3PR01MB11723:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdd0864-ff87-40f2-d8e1-08defb05b29e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|25010399006|4140399003|6090799003|5072599009|15080799012|24021099003|16041099003|19110799012|8060799015|3412199025|440099028|26104999009|40105399003|53005399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkowV3laajIxWE5jVFRlTkMwaE5PRVZLK0VnMDdVeVJoWXZVdkcveTBrbW0v?=
 =?utf-8?B?UUhiaHVjM2xwbVBuK0xDQ3F4ZXdnZFFkVzhYTW1jSlFaWDFVaE1NM2VLTzN3?=
 =?utf-8?B?RTVCWGtDWjk0ZVFBZVl2Y1lkQ0tKeURhaXpZbmlwN2VudkVhRnVsNVR2ck5D?=
 =?utf-8?B?VmRNcVRWSklDUElBckxBeEZ3akd6a0pyNU84NWgzaTRJZGNaTWVRVjVZaEpi?=
 =?utf-8?B?UmxaMUNmeFVqYkhPYzBmNEZSR2REVkpKN2tVQU9kdGVidERETXB5L3M0R0V5?=
 =?utf-8?B?bXV1QzhVRk4ydmlaSGVPMGEyNDcrN29QUkttZEN0OHQyWEUxODQ4cTRDMkMw?=
 =?utf-8?B?QksxWGJsY2YwbWIvVm9vMW12ZytEVDNsSEFsaHdnQ3pkWlNRTFRlUkJ4dzhU?=
 =?utf-8?B?OVZNU1R0TFFTK3NSL2RQQWxrTUhSU2VpZm5iMGlZaGJVNHh3SjA5VWFBOGpV?=
 =?utf-8?B?eE9sRjQyejZVVklLOXdGQWhLY010RXlvUjVDOWZOaHB3RDczWUR2c2cxbGxS?=
 =?utf-8?B?VzRBaDlJcjJOcHhnNDNvVlVJUm1ublVlNlZZVzMyblN0TGs5K1FCTFdnVVZ4?=
 =?utf-8?B?VXdHc1VCaW40bGJyTldOVnU3UHN3Q3gzQXhwYXdwbVNNbFE0QmVhN0o5eTBa?=
 =?utf-8?B?OEk0bW15SHJubzlHR01yZVpWR2JXazQzRzEyWUJvQjNSN2xpb1RoazArL3BY?=
 =?utf-8?B?MlhyVSsrcmxrMDlZV2JxblRXbGxLTDViSUY3cnd4Zis4dVVOM01rYmVVWFFH?=
 =?utf-8?B?T2Z2OStESTNDTlZHa1pqaVoxL0NiOGxCNERHRFVWSGJEYmhtSlN5KzNqL0R5?=
 =?utf-8?B?NGRtYk5ZdXpBb0NmR1h5RDVqblFXM2FMYWpwWWl0RmtON0lCamovWDJSdVJ0?=
 =?utf-8?B?dGxIMWVpdE1FbFQxc3JqVC96Um12U0pwbVNaMk5WWUNOMHhEQ2ZQalk5bWg5?=
 =?utf-8?B?WW5EaDJEbFBkUXhWQlpRQStrbE9hcCtCdFNkN2ZubVdOUmpKRUJIRG9pUVo4?=
 =?utf-8?B?Mm81U1N5cXk5MnNXZlV2Ry9RM25udGs0UzNmOXE5OFhBY2Vna0F1M3ZqV1N1?=
 =?utf-8?B?Wmt0WTlma2d5bjBCdzlhRWdiNVNQdHNNZnp4RlEyYUtUM0pOYnlMeUwvZlM5?=
 =?utf-8?B?b3UxUTZDM2hkZy90UEpIbEcweFhKanB6N2xmb2lOcjZLdVhIQ21BQ0VaOFNJ?=
 =?utf-8?B?enpnNHNmNWN4VWIxbUEvMVYyNU9JalorTHJNOGN1bWZ4bjU0Uy9hOHgyajQv?=
 =?utf-8?B?eVhlbEUxN3QxTHpuNmcrSU05WFZCZFE0ZGJoT2NsZmNTZkFpWXkxT0k4eWNv?=
 =?utf-8?Q?qkN70vWs316NfUYCVx1ftMlxuZjZY4FfGR?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3pWQXVsQkdTWTZpRGhGNVJ6NUhEQzZOUkZGSlh4OFNleU1hVjJ3UmFTcm5t?=
 =?utf-8?B?NUVZa1dQd3FBOWNCQmx6NU1yakV3OTdmOXRETldWMEEwOFdDVjFVNTdNQjF4?=
 =?utf-8?B?RVROTDNnZkdvTFpmNXNvcHBYQjJwNDVjTFBHY2VJbEVIbW03YkNLaW5MWEV3?=
 =?utf-8?B?K280UXB1b1hPcWQrVDdGWC8zZnJkRFRlcFI3SWJvdWxjanNCcS82czg5ZVNW?=
 =?utf-8?B?c3ZqNjd2TzMvZit3LzlqeUgrWTFsWC9wcmpra2ZaV0UzV283STJtMUhueWMr?=
 =?utf-8?B?UlBJbXRwTDZ6TjhFb3BzTzFUWUZCZWJoN1lTQk5wQ09OUEkxMjFJektWMG00?=
 =?utf-8?B?M1daYitPVW1GV1V3UWNxNHc3LzhPQnkyS240TTIrTWxEUVhjeXdZVStEZm9z?=
 =?utf-8?B?Tm9FdVRlN3RlNU5xOGtOWGVEeXZhUlRSdWh6SUl5Z0JyU2pNYW1nenFzVlE5?=
 =?utf-8?B?SThINzBqbjZpS2Y4c1V3cW1jYmdPdnFCTGRzUDNRRFpFc2pZcW13VDgwRVB0?=
 =?utf-8?B?U0NadlhkcytMbmthd29yNEwzWGVWMXFMbmdsK2t4T3JqcTFUODlhZUh0Mi9Q?=
 =?utf-8?B?V25kNldLQUlya24xQTJNTkNlRXZqL3hFenlZZGtGeXhVblFHb1hQSmc5MzBE?=
 =?utf-8?B?RUJxK0dmYkR3d1NXSE82Qyt5R3NvY1dScDZWMG52ajdoOTNxdnNGQ001Q2Zw?=
 =?utf-8?B?R1JtckhSNGIvN2dhUSs5ODg3clRXNzJCY0R1bFpTOTQ0OEpjSzU3a0haR3ZB?=
 =?utf-8?B?ODNjOHpIb21POWNReFpzdzhVN3BFbHhHUUhLVHNNOVFsWldGUjJNVFJ0NzN2?=
 =?utf-8?B?NWk4OE9PYTNLNDVoeHFVV1Q3Ri9tUFhLR0FRM1VnU2llVTlHMkxBdVp3Q2JK?=
 =?utf-8?B?TkJSTGk3NmZWZzl1d0hkWjNmT2hRSWpscWpKbzlMR253NWpXVmlzKzE2ZUtm?=
 =?utf-8?B?V1B3eHUwalBFeUpBVUNZNjBJRmQ5dDZ5Tzh4eFMwU0ZOMVVlRHZMZjhUOWpq?=
 =?utf-8?B?QzA3cWdLNW1vSHJIM2Q3RHJReURFL2xsc1JzTlhLK3FkVE5ZSWZ5TUdMSXlB?=
 =?utf-8?B?RjkrV1hCK1d2NnZIMmZ2aUZDNlZicjBLTUxrcHdXdW8xTkNGUXg3bDY5VDJj?=
 =?utf-8?B?eWp3UGRENGQ5b3B6Y241NGN6Mks4d2RrdjNhMzAvc2huSGtJT2VDQkd3SWdh?=
 =?utf-8?B?eGV1MnNncm9CVmxiTVg4cUkzQ1N2VllRWldYaXNEMC82S1RHbDN4amFhcVZH?=
 =?utf-8?B?SllDRTFCMkY0ZGF3bW8xVFBXZDg4ZEFYZmtQajJYRjVWY0ZYSmJyejM5RmVQ?=
 =?utf-8?B?aENySC9saHNTUzc2dGJvdUI5M3lDSWNHazdQblpTSXNlajQzQmdyTEZUSUhD?=
 =?utf-8?B?aTBoRytIR3RlaHJZVXNUa0VMZW81UnFrRmhPSHplTWtFb2NNbEI0NFY0Q0ha?=
 =?utf-8?B?ZUk2anRhQ3MrV2pZSnFBT09yY3JxTUhJOVU3WHEvVklCWjk4clNHYnE0QnZC?=
 =?utf-8?B?Wjc4Mys2ei9sc3Y5NlZ5VFJBOUZzVG1JR3puVEFIYUdvQnM3NjdwaHVuMVgw?=
 =?utf-8?B?QkcxaW8ycEtOUkpXY2xya04vdU1FVjkySExzMDhrLzNYeVpnZUtyaGp5U3N2?=
 =?utf-8?B?UUUreVljdXNCSHJmQzIvSkVrTmpDK2toV2NkTys1L1BaWVFpQzRtWUQvaVJt?=
 =?utf-8?B?WGM3OEwwem4zWkRpQzA0cWU0MEJISmxTalhaSk5yb2loVkszZ21DbENKY2hO?=
 =?utf-8?B?eXZWcDVIZmRIQW94WHhMSW9ha0x2NnpSRkdYcWo1bGhHTmZadlBGMkNMSzJD?=
 =?utf-8?B?bjMxRHdlWk9DdU9WcXcwcG1yL2oxRjNMYWxzbHJMc2Yyb05NclVzQlNNR2Jh?=
 =?utf-8?B?SDBoU01DOXlDR2ExaFRYSlBPREFYanhiT3loK3BzNThuYTdEekN1eXVRN1pR?=
 =?utf-8?Q?MoLLA7JvQzZt8L7tbHI40/yVhCV+Dc8U?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdd0864-ff87-40f2-d8e1-08defb05b29e
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 19:45:02.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11723

Can't we just replace all existing dts' thead to xuantie? So we can 
remove thead here.

> Add equivalent compatibles using the newly defined xuantie vendor
> prefix. Keep the existing thead compatibles to preserve compatibility
> with existing device trees.
> 
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree <devicetree@vger.kernel.org>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
>   Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 5feeb2203050..5aba1e8ed195 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -67,6 +67,10 @@ properties:
>                 - thead,c908
>                 - thead,c910
>                 - thead,c920
> +              - xuantie,c906
> +              - xuantie,c908
> +              - xuantie,c910
> +              - xuantie,c920
>             - const: riscv
>         - items:
>             - enum:

