Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795503389;
	b=RL4RMxMxRetA3Urs6sXZPf5LrzLiqkBn2oKRD44BvLxX6D0z4kOFal2Fh5YfAkpIXotT
	 JWDOVFhHahX4kQy0Lo5wnuzJMw34GLS8plAMSHmLd0YkpxLB9B0jkZfhKxpev5y4AOhlm
	 AuS/zXY9F0OMip/zBs4nfMmdJi1mkoHdNHg3XJqOgIAzqgQHSKB4rFpv53Vkh/17b+wQF
	 eqzltInmrgUrKqzZOGzoe6sarsN3vpc1vVmh/x1HIB4eLfEENAfg6Y82IL5boHFctV5yK
	 OYCFv5vcaFwbzx+jL/T4t7WdX79wNiiKA6ynZ/5YvDPLFPc4JWuZ5Hk/KsoJyDIN57A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503389;
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
	bh=DDRQ6Ns5hfGL2pwIYoXCA0wi0ZoM0hLh/DPtkPT4GFU=;
	b=Fchevgi2vBYtlef3szFN33r8RIRqS4kjvPvGZMeMkdCeLoCjcsBcO+pHZJkt3W8tJZLp
	 dGhxQL8OyORRiAtsuWnlI7GavaF+057p3kQWY7L3hhqx+H2hCa/pGtOU08M1S8Sa64Y8O
	 CQ2+ReYrqr2OATL9CMNeazczah8u7b9DRkbNVrB7jHI3Ll7Yj2GJey9Sdin1uSNrcmdpr
	 LyOaLH36HmNymDb3zMS6NJTwc1Z9A3lVmqA8ZuzpLZ7kAXk3q7POCf2XcWdL0GgWQNRxx
	 Cn1QBfBAB7xhOBFyeeiBWz3vSJVXxtDmjIVHNndvUeZiQ2RorR8DF0KH3sfwIv+x2dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hvR6clk1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.1
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011001.outbound.protection.outlook.com [40.107.208.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5743C606A31E;
	Tue, 24 Nov 2026 06:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5743C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hvR6clk1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaiicU05DlLTkdRf0HBWjK0H/7orM9XUrmb3kgPy75n0+SDHei2HG6e0dq9ekfuW/FkFZGPZcxBpwgSILCqjiJelo2kZwBQ7d4bDXWn/kS+3ShxMVhSqsi+SXXu3qY2ctdP+6ID9PD9fCrGvUmLNmoP8wPgSLwxGAxsRSQpi8xxpqY/S0NWofga0RhJQdwebiMM4umZZ4tzNKVTChcV9MdbwKzHWEMoxxxyAcx/8PwlX6yiR8ZP93xEgTzIEbNKzMOB69zMpUXsAcQkVRQtlm5lliDyxV3VY5XODYnJVCw1kiYBfWnf/ELDVo44gbT/wyvaF0eNkN2oxeD53XwFctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDRQ6Ns5hfGL2pwIYoXCA0wi0ZoM0hLh/DPtkPT4GFU=;
 b=X7vUekD4hXUL1sXVkapiOqUmGwl3DhGtWhUYWh9IUsbBjPcc/S8bn9hJbEL+tO5GJ3eOfx/Aof9OXaKN6sc0ly/+SmHn38j2VpjvoA2Le/irW8TJLq4e0EXkNjHWDNUAnw0RBe0oiXev4yw/xueR17ul/yA8KD/kgRXoiKMMJ9zs3CL+uE2zwGTdOXshNe6ZT4TzQB1Vwef59/u/58p1BjaIOpYRcOswpksWO8aA9lxHfGZYQ3inUSIzp/LuQXwqSFrD4vgBjYMGH/FwUpTWPGbvRtHWSzsjGozuAlz8mvjPGff/BkUQ8geh+H2+/F/LSxWiZSkNPUTBN9NeqRkYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDRQ6Ns5hfGL2pwIYoXCA0wi0ZoM0hLh/DPtkPT4GFU=;
 b=hvR6clk1KHIs6fLtHTlz0Cg+XdYjeHwHWkGjfFGmKhcXuLhhtNEm5iBrjBofAyqGY50N/Gpk1cTyBKHHYT0ltQdhIRJYWM6/xdAuE2CE8etH96ix3uEQydUrfIRgxKv0rny3Zw5e2PWotn4B5Tm53htHmeEHx83M1p1POT4dqCE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PR12MB052986.namprd12.prod.outlook.com (2603:10b6:8:47e::11)
 by DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:56:24 +0000
Received: from DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48]) by DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:56:24 +0000
Message-ID: <bb0f0661-1c75-4b8b-9320-56ede0f31689@amd.com>
Date: Tue, 24 Nov 2026 07:56:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: zynqmp: Disable DP for Kria SOM
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <ef31d389e963485d19ea5837d442ab0b1ac39b6a.1794574131.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <ef31d389e963485d19ea5837d442ab0b1ac39b6a.1794574131.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To DS5PR12MB052986.namprd12.prod.outlook.com
 (2603:10b6:8:47e::11)
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
X-MS-TrafficTypeDiagnostic: DS5PR12MB052986:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: fde65cc0-1cde-45e8-d00d-08df49f80ddf
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|261009223027099003|3023799007|261021123027099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	rvAbxIqyfgd/MGpc38UbZ3qljkkOtFe6+S31s0dp47kMeZc5r1oGgh787FUYuXXTcf+Zzny1ReS7ACi2OPm3mJAd3bc9VCl4gBFNVdpw8U84bqmk4eHCNUazOIWk4rYw77gW/pz3jcgfQ/PWJaodAe+sUppaN7YSehUSj534siPg8tWgtyONkVg2ROz1JOl4pwN2zBiKWemgp691OcJCqvNQYRA6h2MzrvpfmZS2NORVoxlczJaJfWDyqt/Z4ahPkBoxLRnfW0WIkSb/gI4oCrSk4cP0qNmbholLaxJgdvyRA1P/6f3k+3TZVasXTmt6Ed2MrEI2BYjF6yEpBnYba1zlrcl7q8n3e3dUFdH1v5+3S6Ffo01Uci70QwX7qR41h5sgcPAYyujm1FmT/AuUZvS2gPpkMNk4W0tn03cAjt1nWxs5+N6aCRAIuZ36IIhVry5fsOqrua4Lc/E17S5JukfYMegLr8kb7nl9k3TgddwNyUs/OoGZM6xRf0b/lkRuvxJJewHdxRdWiM1s377ltPCacNY3yn0zViVmrUcBiq1yvBfmqz9gNl2MrfCqtAyJPFj+3TPG3VG4Y6CCC+ceyml09KrSgySv0Wm7hyWzjQVYXtuz3d3mqdDzGy6ELk+vFKfwlXu9COc+jrr/8BuNf+hS/ZvNO6eVsjFhAQY+I2U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR12MB052986.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(3023799007)(261021123027099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkYydnF4SnRWdVF1NmxqWVJGdkQxZjBIRnVSSENIcEw0SlBoalBmM3dva1ZO?=
 =?utf-8?B?NDcxc3dyVlJ4TjFDbFo5S1dQOHhyZHNsV0lSOFJpZHU3SkoyeVFSeE5oQnNv?=
 =?utf-8?B?MG8xeTd1ak05NU93dy9TYkRERU1tVFpEeGdPamgreit3VHhXNHZOYWxTNGVI?=
 =?utf-8?B?UFh5SHl3ZElLOGUwWmI2M0E5c0NSYktRdTJ1MjNnY3VmaWRMTkhDOHJ2UFNX?=
 =?utf-8?B?YTVYRFZMTlBQVU5KVTB0SHIrMEZIR01zck8vYmJ3cE80Y1VkNUhaMERtazhI?=
 =?utf-8?B?M2NkNW5HVWlHcUcrWEc0T091SVVzeEFsREVuOGM1WGQ5MWJpZ2ExaXdLeVpV?=
 =?utf-8?B?bmMxcGVrM0M4UjhJcXFITCtTVHNuYjF5azZCMUtIWGhvNEFGVDFMZVNUOEcx?=
 =?utf-8?B?LzdTY0dBTTI2d2M1U0I2cXJSaEs3bCtEd2l3Zlk5ZitVaG0xb1dqYVhadTRN?=
 =?utf-8?B?bmtGcU5td3pYUlZsbmxuWnozelg1UDlja3ZUOGFuUkJCaFhrWGxhUHdWMU8w?=
 =?utf-8?B?RjQrZlRTSmdVVlUydHZWLzh2V0liakYwOFZiMEdBeC8xdFhkZHVQZmxlMzJ5?=
 =?utf-8?B?WTBEcStaQmphd1RPaUZDaStnbzdmMzBPUzVicUtyU1BMSVk4VGQvbVZFWjR3?=
 =?utf-8?B?WTBHRC9sOVVmOFNxZFNaLzJyYUt3bDVUM0hQYVg0aHd3WWxqRGxXSW5xYnR4?=
 =?utf-8?B?bFF3cjd2SVgyM3NrdDg0RHNyUnFLdGNGZ1ZxN0oza2o2eUhtMUovZkJ6VnUr?=
 =?utf-8?B?K0lxNHZhK1UvQithV3U4TzZERGVWR0tTU3BxS3lYREVTVFY1bEZ0Q0ZDWTRs?=
 =?utf-8?B?eW1manVZZVY4TlN4eDhXTlZwRGFVYjBDSGttMVRwQ2RoYmxsWGgyUHozMXBB?=
 =?utf-8?B?K3EyZkNBNHNHOFd5YUVBd1FwY1VZOHdLL1cxZDJMeGNsc1NxK3hjLzNRZXVa?=
 =?utf-8?B?Y2tLYk5zOGcxOFlQMEttVFpxMUVyMGl4VjdVeGxHNk14VFVnOURWbkhjczRK?=
 =?utf-8?B?S3B1NFFhWnFWR00yQ2REa05mQTY4ZzF5NjREUjdwNnNmcGZiWkJLT3VXL2hi?=
 =?utf-8?B?L3J6b1phZXg5WTZ6RmVpMW9oZkl3MUw0ZGtFWTM4R3JvNW9PZXhMLzZpREpT?=
 =?utf-8?B?SUFZRzM2NzZNQUgzZy9wVUZ0ZmF2cjEyYW1WVzFCSE00SS9NOUdpUVg4ZnMv?=
 =?utf-8?B?c1pNOGdZQ0xGN3p0VjFzWVo3bGV4cWxjazRjTDNLeCtOaHE2UkZ6SXhSaENt?=
 =?utf-8?B?Qk9NSkNZYThTc2V1em5SWi9xUGhBbXphb0xHSERIbVdlaWRndURPSG1DV2dY?=
 =?utf-8?B?Yjl6UEQrL1orQ3d4T3hGNXZQMVlMWUMyT3pKVElIN1lkUXMrZGtKcjc2K0xG?=
 =?utf-8?B?ZmdkUkhRbDJGL2lsUXc0VVJnOG84SnFwL1FSNFR4WE0wMVp4TmI1cmJHSXlk?=
 =?utf-8?B?eDVmM3NucEt1UE90aUphTlhadUs5S3N5YkpuTGYraU5QOFZWN1FjSTk5VjhS?=
 =?utf-8?B?RVR5YzVzMTc5NWFKNjcrTnR5eG1uTVZ6K1hyN1hza25kVTV5NDIzQ1VZZ1hw?=
 =?utf-8?B?ZWxPZDRmTEJ5cUNPcStOb1QrbWRVWHVQYkFQbHJza1pjbFpjSTVWdEo4OVBL?=
 =?utf-8?B?YlhTOFAxQ0poblloRjIxWTU2bTk1eTJUYi9QOGF6YUl6Y3NZejlrUkhHMDA0?=
 =?utf-8?B?d1BOWUw1eGJYaWhFZ3hQc21zUm9HVUR1SFFJamF3bS9Zck90bzVlNXk5ZHow?=
 =?utf-8?B?d08va1g4R3IvYTJ3MS9NR29YdVVBQ1czWlJmRHk5TEFSVVZZdk80akwxRnox?=
 =?utf-8?B?U2g3K2V4d05DM1ovZG9jWjUvWkxlWmNGcTlYYzdDZ09DblRGRzU4OWc0ZWY1?=
 =?utf-8?B?ZW81b0xFdVllNzZuT1FVMEgzN0hrT2dSSS82UG5mL1dXcS9FRWEzWmlmNUVt?=
 =?utf-8?B?ZkFyVWJsZ3FGUVVwbnljcEM5TDBZb1Faa2xFSTZwTjVTM0UrWmtDb1p1d2Qw?=
 =?utf-8?B?QVlXZWhzQ1I4Y1VzYURPL2xzZUlzQVlDelBIUklBOHgyajM4NXdwSjFrSW9P?=
 =?utf-8?B?NEpsbklPVmJxamtBMjlGR25kdDh6Q3daeFRoOG9nc01kQXFHbzhJNk1Ed2hn?=
 =?utf-8?B?SFFlTldDTGlkdFhrUFZSY1VsWVZvdHBmczlJOFJJMVgrRC9WMGxrUjlVU2k4?=
 =?utf-8?B?ditwblJBYThZdFJ1b2Y1UWM3cy94RWt2cGlpanB6VmJSdEZEOFpLbXNZMmE3?=
 =?utf-8?B?VXVRdVA0bGFZVlkwb1N1MTVmYUxENkpDRDl1MkUraExOWEpwTXpZbmtWZjJG?=
 =?utf-8?B?bk00YjVOdXlUcjJDMUxtS2p3YmZmaVNZMis4TmNBY2dkamhRS3ZFUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde65cc0-1cde-45e8-d00d-08df49f80ddf
X-MS-Exchange-CrossTenant-AuthSource: DS5PR12MB052986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:56:24.4542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/WPVa68Xw1HHey07yjc7VkCXliJHLRkKfvvT5uf71ON65cilR8xTCN+s1TvaJIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900



On 11/13/26 13:48, Michal Simek wrote:
> DP is enabled via DT overlays and there is no need to have it enabled for
> SOM only. Schema validation also reports that phys/phy-names are required
> property which is not valid for SOM only DTs.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
> index 500af1d2232f..a81e61a4f4d4 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
> @@ -363,10 +363,6 @@ &ams_pl {
>   	status = "okay";
>   };
>   
> -&zynqmp_dpsub {
> -	status = "okay";
> -};
> -
>   &rtc {
>   	status = "okay";
>   };
> ---
> 

Applied.
M
