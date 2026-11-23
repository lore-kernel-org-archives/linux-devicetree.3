Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436211;
	b=m0MfMANgB46fue9HrTykcNXe23DVo71CRBZRWRRqzjf6/OdnG6ZQwZkMMZgpPX1SqTRS
	 0ifm8lScaQISkpGp52fz+T0bCND5PhTQWfuaLVylRLxyY0bv2DStZzKFTMSa7pfxdXH0l
	 JRk/YYEeU1tuFftK9Exr0Lk3O4m0IhSuXhmDlJukrr5ITeE8KTlcV0JSa8mt6Js0yKsix
	 3XlFj++9S8NiOfoK9+vlBFCjui4CtRfDnmGfo/eF/qnwTGUafCdlGsLHC3IZmzEW3VRNB
	 C12ts5gz/1jl5yofdk2De4lpYTpmjZiUC8XyQApe9j9W7Dh/rp2vxf5cj02RbMfMBkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436211;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=kguowlk5wAspe4EZTMrWGEV1S398so2n2fI46ly+OEg=;
	b=GfLBNeZ0W/J+vW00F0R+tFWj/wPlOzTpQ7GV8elDVsIs2AyWYIRRlpCmYx6JwW2eKLL5
	 XtjABll7+iIhHJQQkqvueUq2L+iOYODdHCbboUZIVAYdmRMbr7IhfitnFwCh6aLH6MkYU
	 1A41+jJWfNHGZHVGWDjhvmefhuwZf841mSbWfxW5v2ntg9qLy9rfr+yvEWTOkdfIo/zbq
	 48W/4e9ZonhizpvbuSOGfkLxZ8b4tl5EHiU+ELe7sq78WeE5Vkf5Ir5gOM+0bJf177apS
	 Z/tiSmukaijg+1DBEbK/SxNYjG/SdXWcDyvmZGJ4Df4NDXzt30RCGuO/cGIuwNWnNnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=K0Xj124C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.34
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A3B606A333;
	Mon, 23 Nov 2026 12:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A3B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=K0Xj124C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+aVTLH3piY6SI9pivBreZ4uNImC1WuDF0CguxblFRZq8eYNHX9VL/kCS1sAAgSDR816JPdGgLAdl30J+dC8QSrdgvqNNSmxImntzYfntL2W00FitU40WCh+XeZYScB27SRWYG1erVR1AB9k6Ug6BayeD0WKBgRUy9/upQdUmkmYcYc07daCWPoTQXbjFIF55NKSaVJ6bDvBglGJ3nqFCydsB5OT7zU00QhjjZYcTtMhtNzM9MKbjFXkw9RPUdwD+omhSS/hT5kBq0MQBJy5zrIzGtA7u1/tPC4UUKZETWzdZOw3Iur9d6Nn37YKR3/FF40CGQVLq9OFwovAeS4kHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kguowlk5wAspe4EZTMrWGEV1S398so2n2fI46ly+OEg=;
 b=tDjliG/L1nkddTxKn7MusPvr471cUGzGlEqVaCqLK7j1tRuYwtXltoO9mprevHu3keSLzW8qRAUzRMRmJWNuGeheNmIlU2Y/uNx+pZZm67w4did246K7K6wfi8+hlnMDiuMOJSgW4ec/hNSQGB9cIpQ65TOq8QxcY+pB/zGWcISdubS+2mNUdOII6fnGNH+xQkry736BfGV0HA/SVLRoyPTIB1iHiiluOn6n8OtVS6JUEV1tCFQWlzWKPDNm2l1mj1ljbDQ8CTjuVonYXyxOaDljUzwpymPuOtliFGOkcrOnT7G6VCuiyR1DvTWfySikazAGJNXajgLvDVDcs9v6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kguowlk5wAspe4EZTMrWGEV1S398so2n2fI46ly+OEg=;
 b=K0Xj124CP3L/zlyM8xVVQ/CAQ3jeJ3hba6Sp2FhPiVoyv2H/ua/OUTSLOGLWYQUY8F24IO21JD+iKAifyqARllBPy+sopswFIv2gLwpqILZEHUBD6aCOx8veWo+R9xQyxUihxUsXaGVU9FpEP7dKtBIoCTR+OGfdT2pAATmrbHg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 12:16:46 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:16:46 +0000
Message-ID: <e25b0ca6-7a35-4f20-81cc-99c225f6e401@amd.com>
Date: Mon, 23 Nov 2026 13:16:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] dt-bindings: firmware: xilinx: Add Versal Gen 2
 compatible string
To: Gregory Williams <gregory.williams@amd.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 kishore Manne <nava.kishore.manne@amd.com>
Cc: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261118233211.4121361-1-gregory.williams@amd.com>
 <20261118233211.4121361-7-gregory.williams@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261118233211.4121361-7-gregory.williams@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0213.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::34) To LV5PR12MB9779.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: f807ab46-d95f-4d95-51af-08df495ba470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|261102123227099003|10067099003|56012099006|11063799006|4143699003|261026121527099003|261022105027099003|261026140227099003|261021121427099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Dj/oMvO60o10+LrhI+VhJ2T5tjNtwc3FsPhPCLiTIzR7oTlcY9gTxRmxfAw8yCAVpYuqfdUzlNTrEO5Zq/MevVk+RY5dgVrmz66Q8GQGPlMAiXzAUZTRs1xL6Y895qe/XEt/ytAzB+REBCsiEgZV+GzyhKxM5qM4RD/0amIM8vhxAMHilsejU0GQO6jwkcMeYsskdiYB2sRuBb5EJofnjoYXzCwjwIYg6q05QoSSWTgglVCpE2o7aQ0PDxTfhJIDr5g+qY848yXhjb0QB6kwdzoQTJMMhrk6O2wRQsglN4AhtJhEcCf8kiFtE+asyOQCN6Osd0wM38WqjaPv4CKvl9uawQZCh8UZbaKSvah094Q/Le2s6NmCZ79uK1uPJSm6XQWurf0JMGxWOda6ODKSGco36atT2DgRsoK0eexC5lxoE7Bu2nOhwEZ/ELf5LQTXtASx/kLDXy6nLVfKUN5+/xUdt2Dn5O/d/DmwQ+dxyiCZTju/EBPYTtzlmZCR+8WGwetBu4MqCIGeCp9agv6OXjEGe7zXVVx0dFncxLvo5V9r+g3DAXz+6JNrWy/wxQ8pE7/vIaOtF3XuvCpbSWxp2k7lmrfZS2CulpDThziFOzE5ayydzCKLx5ZitvnxI0SZfbrwXj9VA0uhdzQQViqqDcENF5PjlxLgy6YIP+xhKXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261102123227099003)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261022105027099003)(261026140227099003)(261021121427099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWwyU2JVNFRkODlPWDJOZmpYbnZKNlh4ck9RUWIzN2Q5a0VOTVZtalRsRU82?=
 =?utf-8?B?cHZZdzlUUnV5K282YmNEdWNkR0hCMVNUVVVxeFk3TFkzUE9sUFJnSzhjMXln?=
 =?utf-8?B?NG5UQlZHVjBPQnA4S3diZjRnSHNNMHZ1aFkyVmhHdDh6d3dzeTdvV1N6dXgv?=
 =?utf-8?B?TjA2ajRYSGFNMDgyWWxLRWluWlg2ZmpTcmNWV0hINmM2N0ZXK3pKOGNMWUhP?=
 =?utf-8?B?VWVDc0RpU01VTjVJYzdkTlZMY3ByZGI5d2VUdmFKazZibk4xdDBQYy9MME5a?=
 =?utf-8?B?UlFiTDFZVlBlOFlub284cURzeVRMYVJ2a1RUZDEvMTBoTnVpeEh0MFVEQVNK?=
 =?utf-8?B?bElQdVdPY3JyckU0VHZhOW82aTc0c3RoTHdRV09LSFQwc2F6b3FvRHpydmYy?=
 =?utf-8?B?eW9KQ2t5cjVuanA3R3o3b3VEVHkxbWI4eEYvQzdRcVhVZ2pIRnRjRDhBVDFS?=
 =?utf-8?B?TkdQZHo2SUhnTjNCSm5zeXg4aTRzSVo3STBXcjZNZHB4OEZVdlRLUWVIMXFi?=
 =?utf-8?B?NmlNdml3d2l0WldLSmpwZnR3MXZiZEpLSXVDMk1CTzlJaTl6SERreUdHSnZu?=
 =?utf-8?B?UW1qZlhmVGFPUU9TZ3Z3dDdUZktIaEllam1wMmZxRFhHcS91NmJpSmIyTkhs?=
 =?utf-8?B?OFJZT0JoNHk3NGc5VkkxYmY1aXB3MTRHd3JiMTZLKzFrQUJ2a1dkMm1iNjR0?=
 =?utf-8?B?Y015QnJaSVRzNzFWN2psaTNvbXRKZDNrMk9oU25QSFZaaVgyalFZRTN3bG12?=
 =?utf-8?B?dit2WVR2T1VqTDZpMkpZdGUyUmhteU1rWXVvZnQ3MUpIWG9hemFaK1NkNXFE?=
 =?utf-8?B?ZEduQUFVTjFITm5FTWRrYmgyWXBBbTRwNURpbjdIdTljUnQrQVJuMjdrZU15?=
 =?utf-8?B?cFBYalQ3VmZrK1hVbzNha2R3c3dkSjIwY1dkRjQ4SEtpMW05SlBhUXdOd0Uz?=
 =?utf-8?B?UHF4ekZ4TkJFUVFpSmgwL0ZYTWc3WCs2d3MzSVpVU3U5NU5aT08xNVRwZVNi?=
 =?utf-8?B?RDV6UDFyd3ZuRmxGTWZTYzdhRmdlNWV4bWw4T25kUnVEdXFRRGN3UU5ZajZv?=
 =?utf-8?B?OTRoR25nY21MRjNUQUdtUC91TEp0MlZrS3NuYjk5c2x0NkRhS0hsWi9PUGNR?=
 =?utf-8?B?OFlVT21mUm9XamE5NXdsZWNpTjhrUkYweTk0aytXSDEvTVV0NUpqZ05qQlBN?=
 =?utf-8?B?L3laSkxJVE9vZ0tYM2tEaUgvdVg1ZWJWbnZZSGVobFJEVGI2U3ZhSkdpa2Fh?=
 =?utf-8?B?S2EyOGxERi9BM0lxR0xpUVMxUXlsVUVvYm8wK3lEb2NNMlRrUERCS0tBN21z?=
 =?utf-8?B?MUJTMkhucWFlZDJBdlRMM1JGWEtzMGRTenJvTThuMGNyNUlhQkFpdFdFNHdI?=
 =?utf-8?B?cy9KQkxGVGNET3ppbGw0b0I0NUwvRjR1QzFnRzQwVlVBblhRUGVPVDlZTnB5?=
 =?utf-8?B?ZjRwTGtQRFlNbExadVRMZlI5VDdqUm5VMzdlais2UEVqQUdnSW5reXFPYnhx?=
 =?utf-8?B?czlUSG1JUjAxd0toR0VnZmo1UjJOZXRxbjB5bTVuMUVvcEIycktIOWhnK0hU?=
 =?utf-8?B?bDBwa09JQU12ZHI2cU9Jbmh2a0tGcTN6RFNnMGZSTElKUGhBa29HQ3pHUXZ1?=
 =?utf-8?B?RlZaNTdveVpESVdsa3NnQ0dHNmxtMHNQbzU0ZnJXZHo4UEFZazVlbEwvSk1Q?=
 =?utf-8?B?VS9tb2xMSEJoMVBZY0tlYnRkb0RmQmdUdDlYQXpxVTU4ODE5Z3g4bHpmOXdL?=
 =?utf-8?B?UE44alBjUGo3ZC9nZGxaSHJiT295OWF1a2o4RDZBbEFFemFhZzVTSWJ1bzBV?=
 =?utf-8?B?M0pjS2xzb3JRR3NoL1ZWN0JvRUdWVGFRdmJIaWR4SWc4bFhjSHk5eXVOOUdt?=
 =?utf-8?B?NDM0K3JCRWRMS1BnejQzWTJkQlEzS0dzS29TRDZmWTRFeGpESno5RlIxL1hT?=
 =?utf-8?B?MTVaMmN5MWduajdEUkk3bHpXWVhKNngyS0kyd3FWWjFTbmVDbVNlcXM0a2N0?=
 =?utf-8?B?QVd0Z09mVkRxcjZSUkgvcFo5NjZOV0xXNmdDSUdUdFVPU0tUeG10OUNNNC9a?=
 =?utf-8?B?WFFYYUlMVFQ2V0ZDSGZWZ0tLWlh2dFQ1NzFzdEVLdldWU2c3c2Y0NnZ1c05u?=
 =?utf-8?B?WkVDb01iSHVWNm1qQ0hqL3BMeEtwZHpMQmsyUFd4alFtR1Q5T2t6Nk5FT0tp?=
 =?utf-8?B?YUF4Z2R4cEpCei9WRWREeUQvN3RGUmtsSFJrbW8xb2pFUnVVRmVIZVRneVFP?=
 =?utf-8?B?VHd2Q1ZJWmtlVUtBVFVHNXpHQnpDQjFlSWM3clgzK3IreWlJQWNNS24wbGha?=
 =?utf-8?B?SmFkUDcwMW1aallTbThMekpnclFLVWgyMG1scldUWXZsZDdiQStHZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f807ab46-d95f-4d95-51af-08df495ba470
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:16:46.1357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muBrKcnO0dl5JYBbGs2G0aDj12dR/mOltpK8TBtVXPlHYMedyAvNF4zPwyGm62g3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86



On 11/19/26 00:32, Gregory Williams wrote:
> From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
> 
> Add compatible string for Versal Gen 2 firmware driver.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
> ---
>   .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml         | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> index 72af37cdb103..60d1bd329d0e 100644
> --- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> @@ -32,6 +32,9 @@ properties:
>                 - xlnx,versal-net-firmware
>             - const: xlnx,versal-firmware
>   
> +      - description: For implementations complying for Versal Gen 2.
> +        const: xlnx,versal2-firmware
> +
>     method:
>       description: |
>                    The method of calling the PM-API firmware layer.

Versal Gen 2 is going to use SCMI instead of Xilinx firmware interface that's 
why this change is not needed. It is just about that current accel driver is 
using it but it should never reach upstream.

Patches 1-5 should be sent separately and IIRC Jay has any series about it.

Thanks,
Michal
