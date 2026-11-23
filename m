Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795435955;
	b=Hc+rrlpyhhHcM2RJSmojRwBdxS+FFGwEbkbLaelbEnu92eEZmcXZgCWKZXadp4+pkEzc
	 Y7S2KlSY7atkTYdWp4A0dRYzbfe3lSXMoGPVNMaS2/Bpcefa9cux7dRmLV2xydxt8fDI0
	 j6KjQAu6PGyGyS7rcNUal0iUHZSzYLnIa3sD05cxWjBqRU6KzqeJ/t/oFrqm7CxIa2LlG
	 Hzp/Djq3+tJoqZTNmdqypPYr9NNvxKmnT8Bv+mNWsoVvpc8JW7ufvVwFupdWw3uGSMW9J
	 w8FOHA4pLNSgdudP4RTXxTNYDOXXqP+8/Jguedbun2vpTIgUglWFxjYJPgM5HMBnxEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435955;
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
	bh=AOoL/v9i6cSmjjoAiHuBRVVhuOfmt03z7uyV2iQIFQE=;
	b=AWUziFw/v3tQuunSitFk6UIJ0xGl11gfpMCweSid4GSnHRvKlPj2G6bChe/F4zsE3DfB
	 0RltiUM6YybKTdkZYxKZ/TRzL9/ZD0KjODtLonF3DRM4K0JmPp73ggFj3aLYJmHrB0X0J
	 ugNclG+qGl4Wmybyyp6+vqU5Skpnxm342EbXKdyryuAAsThiYc18iaQfaA6isLdBeCYiG
	 6Ki53GdNrivwamMiUAAI9rh1pfaZUCGLVBzWJzMPWpxYkhSxgDciwR/weSXAFFurENngL
	 zy68aKPOdKlIUBVADdf7Swz9YG9R8qsftmCz8S0jioSQn3M73FQ29vhZRBVkP9SDOzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WxEW3VkN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.39
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20D4606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WxEW3VkN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru2UY0DbpU45p1wMpmAjvJ5ZsXTmTxYuOHexqRpqyB+RHvynAt7G4AgBj46ueQqwhCOoLKQPsK/t171BOZuinod4UGHvNtQxNuO9ZFfwGJ+HomtlIdN7dcBlsnwbqrMwMmCauEOOgxgvqlyQuruPq74GvAvFA7H2bxetUZSLCbo76e7845Daw1cOSQC4Ej2YNTou+U113oiJvd90ZB1TjpA3XxYS5227DgayiN10Kl3B1xHA636yj3yZZ6i+q77UOELvxcL81Bce5yW1yt4gmbGbosiD+VHrjbnivabVy5IErfWLZnLx2dShPQdVBwPfrv8mFpaKzeLDxcFnGjLLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOoL/v9i6cSmjjoAiHuBRVVhuOfmt03z7uyV2iQIFQE=;
 b=b3JI8J7atx19KZ1fnqEjRuiKduGlGqbH7eXtpA+xPwbWv0QeCYc+hiJTQWjX1eTZbmuKGpFDwyXVP59pBohQznqm0Frn79BfLpSc8z2RI5UnRqeWp+JkiSOADzdibTFwMzLS/6maIv8IEBgB6ESqhi57DXEJJeWaawDmj5xhiWt5yMUxd5HH7BztvCkPKcqH1CTj0IqGCeOOJOFWlh9NPohUOvZmQdVMyw29XctUT7FL89YhulWEfCBEG+OU6w/LkmwssAOPFrt5vi0J/wW+bIHBxR99mbxOs8Ooyd+LytnkGNprw7Pylr76J5drRYEkvxp0A4oyaTVz0SUig0sG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOoL/v9i6cSmjjoAiHuBRVVhuOfmt03z7uyV2iQIFQE=;
 b=WxEW3VkN8dIuOFxjiBfwEQY1fUiu+8b8BUaUz3BktW/4O/oCf4BHm2HOyAMsDZN1ZqvYSenUJWz+JoxNKL6Pdws1Z/ox/8sy3kgm+wga02QYbpO2DPpwuJ/hb0mQLSEKBlXgk8j1Y/k7g7/4S3eoho6dL9xeP4Xby7SHDJAGGdk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 12:11:49 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:11:48 +0000
Message-ID: <6a6fad09-ea9c-4ac0-890e-4517a4652a7f@amd.com>
Date: Mon, 23 Nov 2026 13:11:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: versal-net: disable GIC ITS by default
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 git@amd.com
References: <20261119171757.2558318-1-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20261119171757.2558318-1-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::22) To LV5PR12MB9779.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: a6bcf58d-2f37-4342-ee2f-08df495af341
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|11063799006|56012099006|10067099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	l03VweEvbTdAVBr6Z8K5a+gNpsst6BaTvy4w7qUUQ5J48LSp9Kwwo3ZP5Ode7IubT8whEapm4H7sg/AfMAUt5vcv3/QksAHym56c6ls43H50QzLSXBF/j7Ghc4h8m/hJseRV3va8oRcZD5MoROlTDMNGpPhP+jdn1dOiwWkSQsmZUQSSxMIAmTvbytuO4q5lMG13YSY0pgE8RkC2kKFEiQY+KS6ut9d1hO+T2wHvXM/J2ugfDT5wbd8Ve9+rl0KYSQbyo8epbDVPPc3W1PbC4X5jxmExdLhsqaXcjyLvtwhrOUMS78ZxoRAG91xStut1Gou8wfzK1Qzm11IBgEFZ0nA/SKZBH0zGGpT1wxrIb82cEyAGYMsGmASYL6wflG8I6EAI9m6IUEn1BEbUS6a4DSLmSsXUTj7gE1Yhdej6sYJUrWsMfiBX+d55IKXVN+9SJ7c4WONzfIBmFgy7TJxFyeziLe8ZWJhciS/warPlDLYYvmVJvD9gO3zK0jHt1HRCZjDRmR4hCGgWXde/nwrxVl72VxwU30h+SOAz37r4MqEoa8hkOfXbv4OQ65BeUXW2GP8R3SWIBhKoKcnYh/SKQKszz/eyqbGS1R9FMXXcCMBLN8LFWRaK3fNuYSJ9RIyPThMHyx/8mpR123t1uWW0BajwLbch0BDxmUvi8qeQam0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0djcXloQWtFTkczSm1VdUdlUXM4WGlpdzJXTnUyN2FiK0pxVFloR1JLRVRj?=
 =?utf-8?B?VHZOVG1LTHBxNG5Ha3I1dnBYTWJhbWhxOFQzY2dLY3B4NkxHU1VlVVZzVm9x?=
 =?utf-8?B?YjIwV24wRENzSkVsWlllY3NzZHRTS1J5U3huVXRmVjdwNCtrNVNiZ0NwRG8x?=
 =?utf-8?B?dTZEdmErZHlTejFScnhTbDFRL3A1eWx1aWp2MXlQSDFTSkVRQTZOM2lMUkM3?=
 =?utf-8?B?VHpQYStYMUs3R09BZ3lidWJieGcvSUlMdmpwUzZFZEZHRDFEZ1dwTTgxb3E2?=
 =?utf-8?B?V2kzY0k5UXRaMkVwa3pPSERReVVIMUlNU2puNFIxYWwrU3lmb1IwendpN1Rx?=
 =?utf-8?B?TktqU2tqRHcrSU1XU2VVcVRlUVlwRUlqRFVtcmkvam9rQnM5VkNMMkxOcVE3?=
 =?utf-8?B?WmVZTm1NUVRzbTJ4cnI1Yy9sckJQa3RHRlFRY2JMMHRLOE5EMURoZHZObUdH?=
 =?utf-8?B?OEZXSHVGTGJETGEzU1JyZUZRdHl4N0hETjV5dXpLMXJ5U3NiVTlqMFhjZW43?=
 =?utf-8?B?dndWRFpHKzBsaUdPc0N5dW5pdHAxcDJ5dWFua1p1alFoVU9OUDAyUTVDa0k4?=
 =?utf-8?B?MGUwR052ZFE1dVNuNDRGMHZteFFXUkRoVk1zNlh2NVhibXAzVXhaL0E3Q0g3?=
 =?utf-8?B?R0FMSTVJNE95VzlMenVnTC9HOXZZTmhad1VYTmJpNEZvbkpKUTZIeTA4dHp1?=
 =?utf-8?B?aVJaVmRJbG9RMzcrcmpNa0ZUTHBnVE1aQlBYS3AyQW1IMmZFL3hNbTRmZVpl?=
 =?utf-8?B?NU90Rk0zaHhQN3lYVk9TaE55cWtUOTFGVVltK1pNZ3BsNlV4UHM5TzhvZTdz?=
 =?utf-8?B?eEd0cS9BcUU2U2RDSmFKVWYwL0cxVFQrOTRhT2VGdm1qelBkMEYvMXUvT2c5?=
 =?utf-8?B?WWNCK3FZR2l4Qk84Q1NhclR0aXpydFpKQ2s2SXZJcFAwWHVJZUZmMXpNREV3?=
 =?utf-8?B?bWN6VmJhQXo2LzhpWUZ1OTU1dlNVdllaTGhGNHBFZUpvcXJ1NmJia2RMWVM5?=
 =?utf-8?B?TjEyMml5LzJyTnA5N2JQeW1hU2wrZFJ5eUtObUhZa3cyb1UxN2FzRHA1NklI?=
 =?utf-8?B?ZEx2UUJnZ1B4NlFOTll0RlVoRXRnZC9kUnhqa0ZYME44UkVrMWdZVjN4a3VR?=
 =?utf-8?B?cVliYVN3bThCNWsvaTJYMGZicDA1WUtCSHNGbzdNaWtLYXRIUXRtVTBCL2RD?=
 =?utf-8?B?dEJnbmdXTDdSbng1QzZ6RkIzenZQeFhpUTdmOFNpT0ppNmNuTVduejRGUmpR?=
 =?utf-8?B?YUFVMUVUTjFmbDJ4REl3SVlPNklNTk9ndldnNmpnVjZOME1hR2ZOYVRmVDVB?=
 =?utf-8?B?VzZBZ3ROeEZKMkFZY3IzVnIyandjY1Y0dTVHcmdqK2ZxdG9iZkhzT2dPTDRl?=
 =?utf-8?B?MXlVVkd5M3pwaTEvMFh4ZldFRzNwMTlud1VZTmdINloxclc5ZVlVZzArUDZD?=
 =?utf-8?B?YXA4cEpLVnhuaHIrbnhld0w5T2xHSU5YcEU2MUp3M2pkU24yVFFReWFmZ3dT?=
 =?utf-8?B?TkNLcngrMHhpb1ZuZFNHMzJpYlQ2OEhjMHhBMGNtaUo3SGY1clYzV1FpRi93?=
 =?utf-8?B?b2V5RDU4amhhcmovRm5Ec2NzMk5OejNhSmZqR3ZJTEt4dEU1UnZVQ2dPZzRJ?=
 =?utf-8?B?eUNjaGFRTktEU3Y1NGlpcXdVY1RaL3FpOVdyR2ZWaGF3dUtlbmxtRmk5a0J3?=
 =?utf-8?B?QWZiV0FaTzVOZGN2dlphVWZTTHRDMllrSXVQRjcvWTlDalIwUWZzRGNpVCsz?=
 =?utf-8?B?OWkvS1dyZVQyd1Z6M1VCc211QjIybjVNMWJHUTBCdHRROVNxdU5ObDZZaFlR?=
 =?utf-8?B?RzBJTFdydjNZeUhqZUpKUjFrdTdkeVF1MTYzb0RMaS9yb1B1VFRUWGpJRUxH?=
 =?utf-8?B?Z1o4V2JSdkhXaVRNeXMrYytLNlJMSHVEUHNkNWtVMThqdnFvMVlGZGFNSmpl?=
 =?utf-8?B?bnc4TVFoTUhkZjhMWWJNVFJmNUMraG5Yb0ZrRVdjTHJHdm5HcmZWVk9vU3Uv?=
 =?utf-8?B?TExHMFN2ODhKNXpFK2JndEpIbHpaUEsyRHppbnFYR1A1YldacUppTWFnT0ZE?=
 =?utf-8?B?MW9BeVhobk9zempGTHJKZ2x1UFo2N05IdkRvQXpFOExVWmpYdGloc09LNExJ?=
 =?utf-8?B?THFtYmpNNGxvZUtSYVJpYis4eDhTUm5qeHZoY3M0R0dBUlVwUFR0TlJDaGx3?=
 =?utf-8?B?b1FJVGFhNWlDd3BydGp4M3hiblQvNklyeWxDV25FWWdjWTQvQTNRUC9GUVdN?=
 =?utf-8?B?WUo4ZmJXVCtOWXl0ZzczdjFtN3NkZXhZdzNJd1FmbDlrNytVTS83QklneEV5?=
 =?utf-8?B?clRGdjloQlNBc3h1eTF0Nmd1VXZuVTlFc3U1VFp4NXJlODZlTW5xZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bcf58d-2f37-4342-ee2f-08df495af341
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:11:48.8859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXGUX+mhHOiZqXGM2aId34u5S7CTXBWrG9GoS4GUTd1WlkDGQTJBDghbEDhkp7TH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407



On 11/19/26 18:17, Radhey Shyam Pandey wrote:
> The GIC ITS is only useful when something in the design generates MSIs.
> On Versal NET the default configuration has no MSI producer so disable
> the node in the SoC dtsi and let boards that do have an MSI producer
> turn it back on. versal.dtsi already follows this approach.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Disable GIC ITS by default to prevent potential memory corruption during
> kexec. The second kernel can inherit stale LPI configuration pointing to
> memory owned by the first kernel, resulting in warnings and potential
> memory corruption.
> 
> Alternative solutions are to reserve memory for the GIC ITS tables using
> a DT reserved-memory node or use EFI to provide dedicated memory for the
> LPI tables.
> 
> Since there are no GIC ITS users on this platform, disable GIC ITS by
> default instead. Intentionally not added linux specific details to
> DT patch.
> ---
>   arch/arm64/boot/dts/xilinx/versal-net.dtsi | 1 +
>   1 file changed, 1 insertion(+)
Applied.
M
