Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023111.outbound.protection.outlook.com [40.107.159.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790813749F5;
	Thu, 25 Jun 2026 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384410; cv=fail; b=aAsIqRITuJ1vU60Pz13FD6026Ig8MylKjlXuERmYEdUR//cbQX+rGeACkJkCCZSBL4mh1b+/jZ8Y8kYlYcQRHcyZrjeQTOOteJOIOfR+N0P3pWYfN+7C3vvq1MfMSpIfWZ5mPIlwLsDijSeYb5GtPOvZmyDwWhAAuLVJjWDI8NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384410; c=relaxed/simple;
	bh=db+D7My/taq9etzv9pEHTh6jkyKRghjX7qwvdMZUXJA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XiPFcZORCyE6igUuegJW9TSL3HbutwjSH8Hkzo0Se6iM287Ex8YesGn7yn+FM43xVHZxW6I+GDQxVw5ytFC7IPBJh2iWETJNnFwEpbUgxHmEXwzEgudc7QS7zwhjv/nGgbtIO42vlJjBxy8N73YGUKzFOZ+d2qLWAbASH9mCobg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=MpirtZSC; arc=fail smtp.client-ip=40.107.159.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="MpirtZSC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RawkEmXEruqF7g/zpMV+UbqFOGcgIJsx6ivHfWcbq0pz5uaJBCRT0kFX3edTFe4ur6rWj9TO2IT2WvCu8Tu6shMXwuJxTkeg2PElMQ7EDaMFlT5DFvu7YD+gtweqXZHzWXZSJkAinUh4oUbxA8D/UCdj/OOa0TBtp+lnKMvBFnpzLkgLLVIPv6ESa/8Ik1t2Lccy8jXOUIVKl3Iyi5vgisNw8qC1pVh9OypcBCa+1zc8Va9ypIYi6xQJ8VYH3PATmrd7O3pRe45mW7q3lJKddwAkajgvgln9mINbM8BC7/jPmeoCsCR9EOGi6qrs30XoiVvu6Z66NOjwM5DZlyv7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIP+LXCqkuX3cLEvP1BMMfZL0JRxtFZ4Wzw1OH7p9GY=;
 b=inLv9lnkNqhervYo1vAVlqKj5WIYrnbtkRQIfQuq2hq2DKCjf3+GXwcM5S6klMWYvO8yLP31tzepAspLT/Io6OI2JVSCGHZf7vyNox32s08hbCFr1edVNLC03Bdp30nSUVQCvgQ2dWksqCHWfTSrF9xMHzGrM4EWraH0Z8d39FPHHM29DGxLIsyX352ukxeppDEhao4bTwAOXMUj0SRbl9xvHfRBhNWOfSANNQovDmXzWKIMR81EOsSGQz5iMQJoxfCQBWWOmi6temL7xA9DnbYAcEtjjEVrOMLC2osP+YcLO2XjWJWPkGprkx3fRIrjXxX2nyfOR9j2iQXcHTAKtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIP+LXCqkuX3cLEvP1BMMfZL0JRxtFZ4Wzw1OH7p9GY=;
 b=MpirtZSCpIymaWI1ESPf7BfRWzatNCXOi5O/nbyyVuwhlDIBa4Fc0+wuzTbQMp6SpXk2/Bnk8c0E6sG//rkc6VOx2y0sG2Sa/zfNJf/WgYDUlSIW1uUiwaXQWrRUuTu66Y9Zzb4iPaBnq90RHer4jMdbRqIiCDdaFrDqU0/d6lc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV2PR08MB8677.eurprd08.prod.outlook.com
 (2603:10a6:150:b9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 10:46:42 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 10:46:39 +0000
Message-ID: <0e9f03b0-9096-4101-951c-48aaa706868b@wolfvision.net>
Date: Thu, 25 Jun 2026 12:46:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
 <20260619-feature-mipi-csi-dphy-4k60-v2-2-323356c2cc2e@wolfvision.net>
 <20260625-lean-debonair-anteater-c22f83@quoll>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20260625-lean-debonair-anteater-c22f83@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0158.eurprd07.prod.outlook.com
 (2603:10a6:802:16::45) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|GV2PR08MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4b9ca1-a21f-4807-9bad-08ded2a70952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|7416014|4143699003|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GAGlcVGDZnYsHMD22wN/M3L/jgVg5ovAmJ/gILTkLT+elkUrzXbHj3W2Z7a5tfbOKUMZpq18W1gTt+M6gLCx4AvaPLUquQ0YNpNf7PYD/LRvs7SwkjXWAbAnkU+z4CPLL1X+IrTf9i9G/fe1x8p+73vziG7fbdE89aiGMlwgYcrrA7TQa9O3hxYh1crbROZnG8E9a5E29V128r8a4/9aDj+K8ztM/P0bcYDuZekzCSgauJfqFcNOjE+NA0e52IXyvzXJvwElVpbHRWqkp4qdDVdLz0awZQKOSPM7gWhvblKFRB8goZ+VkaCSTA+8bdoZJ2Umv6VzpxxrkQ41M9OZeqfYs8ftoQ4YuTpMyhVJt3YfDKUyx3B940PaOGeMDyNEjmVYmzeAmzVuUA2BlJzuvs2LBa8p9bD9SYTQVhIzf2d23p/sswdKhB5wVFFI5Rl2oULi/x5uL3pripTRrrt8Kxp8oKEpK0cwoHbhsOxQHWvGSAAgPXWsE1PMLUJYCFLSq5IRa/2P+r0tFqMvx4PxyS2sK8Cu9no7tLjLXTcoVtFU3cvFEiIPL4XibAvncUxGShjh3uv50l2kPuo5yoc/3/RtV9UceOF/0yl6eDCqx7IC25gO0C2ii+QI/L4pnePfmXzFM9TqQQ3dna7sfgZdwMAEbTwomGoINNYW9KG/Q6M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(7416014)(4143699003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJvZG14ODF6dkhLTHZBVEVVNVNvMHFZMk1Ed3VhcWEvUE9aWHdxMmdDbENk?=
 =?utf-8?B?akhXZkU2cG8vOXpWSEV2SW1pUlMwbjh3c1pwMFU1dTZpa1g5S013L2toVENR?=
 =?utf-8?B?QnVVNzE3dmJ6S0Iyc1ZtWFo2eEdralFYL3kwZzRmczE1MmlxWWpDdFQ3MjN3?=
 =?utf-8?B?dUNFWTdwbiszMWpBY0orS0VmcUUxaGY2ci82K1JKclZwUVZrWkFnN0k2dUFm?=
 =?utf-8?B?b0M5RHRBR1BNNG81bTR2Q0RyMDlZVGFnZ0p0VXFoeTZQaEFsL05HTG85REdI?=
 =?utf-8?B?VFR0UUVhWmlXbGQvMEUzMjRtZ0twdjZqbU9LRTlYVnZkUzlBcE9tNnVVMzQ2?=
 =?utf-8?B?VnJIV1pmN1VZb3pyL1VINzI3MnBYUFp0TVNPVS8zRzl5QkpDdWtPaWNYaDBu?=
 =?utf-8?B?eDBKQ1F6S1JTMGhOL05EUlNXcVhOenh3Z0J3VlVaMXhCcU5qa3JBWFFCQWxx?=
 =?utf-8?B?cUIzR2lxL2hnWmxiRGdOMTVWZ3JVeUdCS2sxaHRVS2sxUDVVRTB5VHRVUmJ2?=
 =?utf-8?B?WEVsaGROZmU1Wi9nQm0vbVFpeXRhRHcvWm1UNUZWdFhaUm9Yb283WmwrY0wy?=
 =?utf-8?B?Wm8zNWJtMUhnNlVTTlkxYUEyMVg2L0xvR1pKVFRZb2s5T29sMnlKVVIxS2VK?=
 =?utf-8?B?bktYamkwS2JxZ3pURGVFOW10d0FHUkFKL1Y5NG9YT2lxOHRyU09TQTVSQnda?=
 =?utf-8?B?YUZReDdaSDg4S0piejA0aEUrdzBDRjBLcjY2MjR5eFhxSnZ0WksxVXl5eEcw?=
 =?utf-8?B?NmpxbUZnQU1jSi81Wnh4QzUxdFFJTWQrNW5Yd25WN0hobnpXMzNkRkFrSVRl?=
 =?utf-8?B?NzArZDhZSTF1cllQUHdsaTNLM00vbFFKNnpyV2o4cDlSNXRaUnBySkkzWUpG?=
 =?utf-8?B?MS9EK1hxSHhmNVQyWEJ0L1kybjZYVTk0S3A0SUxHaUZlUFFNVnk3SXJUWEFa?=
 =?utf-8?B?WVlkT0tYY1NIZzhQdnJmYXlIZTI2NVNKNCtaZWppby82RUFISVVpTTYvK2R5?=
 =?utf-8?B?RGdOSHVvL05iZ2w5am1OUGxjQ2RmMEpRVHFMUDZmODRXUWtobzRaTXlhaDJZ?=
 =?utf-8?B?Z0FuMG5GdTEzWnhrUll1dmxDWjQ4Q0hiMVRlTVhpS2F0cTV1WGRma0JlbHVu?=
 =?utf-8?B?K0RIT2ZjelJsTjhGQUF1WkprY2JyS1p1K2dJYmdxcnk5Y3pBbXJnZnpmeG5T?=
 =?utf-8?B?dFk5UDFjWnZEaHdRR3ZiS1N3VGxkMjAwaVhSYStFWlBnclFadzZiN3ZCa01s?=
 =?utf-8?B?RFVzaXhPOHlZa3FqYXpTcExTQnRpMWFPQ3Z1dDV4amx6ZnRId3pCMVFZUlZX?=
 =?utf-8?B?UWwvclVhdTc5cFRWUktzbGFkVXppZEpZOEV6VHpjVlZBRE0xckRDWkNJdEFX?=
 =?utf-8?B?Wi90UW90VEZzbFltM1c1Wi84ME5PRkFJZ2R0bW1jZHVqaCswOG5GOFEyQVQ5?=
 =?utf-8?B?YTkxbjd2NXJGQkxpWUw0Tkp6RXpYYkc1Qlh1cmkvY21kMW5OK2VUSTQ1NU5Y?=
 =?utf-8?B?K3FJVXFmWERYUzNuRkdONlF4QndrV1MvWmVnOTFRbUpLTFZpenRKekZ2UDFh?=
 =?utf-8?B?eVFTRjF0ZFdrWm44WXVjU1VIS2VlTkZwTS9UOTcxOU5ya3VpaHMrWk0zLytR?=
 =?utf-8?B?VE9LYitIaTBmVHlEclMySVdWbGhVWlBZQXdHTHZDWENEZEQ1cGFheFVwcnlX?=
 =?utf-8?B?UWZHbGRUQ3Q1dkt1TFM2MTU2bDQvUVRnNlVzcm45MXNSVklyeWQ0R1ZxSURi?=
 =?utf-8?B?di9uRzVQd3R3dEg1Q0dqY0Q0UU5JOVVYTnBYbEVxZVR6YU1EeldmZGswQTBP?=
 =?utf-8?B?MWxzclVsVXk1QlRhS25sUE1xUzN3NmMyUFJJRFU4OCtoV0poc094cVVBYVlx?=
 =?utf-8?B?VmxoTGN6c05RS25mbGJsMWsweHY2eGRVL0lXL1ZsU1JVMUNCTDQxQ3lESzFp?=
 =?utf-8?B?bDJIdmhCREh6bzBESGszNkZMREJ1S2RxUGhJVGdLREFCQW91TGd6cW1EQjhU?=
 =?utf-8?B?SDVDTmFLM29DRE12WitZaGpQWXJxR0h5Q25YY3E2T0dPcjlBWmpMdzFJQjZl?=
 =?utf-8?B?cDFqazJrdUJpbVNJMi9RcUNValp0Sk5tbEsvY1R1VnFRZmlXMVhUdTZCTWZS?=
 =?utf-8?B?RHZpUTQvL1psUi9TcEZTUmd0dFJWL3psZnEvZDlVVGR1ZGduVlord3k1Y1RJ?=
 =?utf-8?B?VGFxZTMwaG5qU09oQXAyR1VxUFE2cmYwU001Nk5LMjVXWjc5eEd3SkRJb0dE?=
 =?utf-8?B?cTlWbGVMeE9xLzJaWHN2dGxSZE81byt2S0didERkQzdiWG9qQW5sMXJxblE5?=
 =?utf-8?B?cGtHS3JubGZwelFaR2h6L3pmdWQzN0pRby81NDlwYUtEekNXTGUzSmJiR2hT?=
 =?utf-8?Q?zxmkIgaSbN4iJWhI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4b9ca1-a21f-4807-9bad-08ded2a70952
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 10:46:39.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBHMtjOvXfdcY+ul/4zcsPkSAKWuzceAVxxqNZysvBgCYMM+IO+rz0oAF2bleqgE7Iw7yBYyyZUXY1XD6nmr0sPzRNfNTddsb2mLNCZ0miQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8677



Am 25.06.2026 um 08:43 schrieb Krzysztof Kozlowski:
> On Fri, Jun 19, 2026 at 11:13:40AM +0200, Gerald Loacker wrote:
>> Add support for the optional rockchip,clk-lane-phase device tree property
>> to allow board-specific tuning of the clock lane sampling phase for
>> improved signal integrity across supported data rates.
>>
>> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
>> ---
>>  .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml          | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> index 03950b3cad08c..010950a8a8856 100644
>> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> @@ -56,6 +56,15 @@ properties:
>>      description:
>>        Some additional phy settings are access through GRF regs.
>>  
>> +  rockchip,clk-lane-phase:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 7
> 
> Missing default here. If default is unknown, explain that in commit msg.
> 

You're right, I missed the default.

I'll add it in the next revision.

Gerald

> Best regards,
> Krzysztof
> 

