Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614234;
	b=NjIzhzjTmwgj2zmkd4CehOr8BCmqVeypxxCCj+e6wcJ6pod0nsbMFjbQ3AAYM4ZSXsPU
	 h7MpiOhZ5jhXWTobICqCAGbxi6S8rccDCgIvyE00w8/pr+ePE87tQUEpmPenh6vBjEIxJ
	 SXSB/2i4vcY4iKLtaN1Fap2DuJfN3OANcvkneqIPFsG3jcdAVcEsumY+jMWn4+2j97nbl
	 56qHwjSfavKJ1cspaiJePiKLZ9u7On5QNFuZtd1yE+hNSyGpKyGY5Vrbt/s1Izndgrfpj
	 LnvKfbVjfZSuzh5Sk3fDpHLnmmpJOCOpH1wilNBj6QjP5eFiC+i2D+EXZTQdbVwBrQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614234;
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
	bh=TOU7ljZZsOgw2LdevCi9iBZ6Qr4nceVY7qwEs6tXgFo=;
	b=QTojBhKVT0W++cyyJyQmgYewdYX1orn3RA4fxvH/SapsNQF3uUITyyiKO9QoD0EugB8R
	 B6O9RKT8KBd6fPJd6dYRoBmKYoIVm+gy+HotaLlVDB1ewMLruKzdBeu2SNPzCsNN8B3Cf
	 Swom2m78xMc7y+8z1QoY/zh/KTBZwSceBjzrJbx/2VHikcvGksQBnRJChpqYPIa/rsHpm
	 haKwhQNzrtcIlLJY8YHoPanKztxQgfG5jbLfYGPFBjDYWgiMqU5kmrlvn+tlo4/EebBGu
	 otvARJNa2UzgzQZ+XYHVF8rzVjksTXWDYazldk6gNp4cXFgtxsK7r5dOXOU87SEIm2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aP8scYDA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.9
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0B2606A31E;
	Wed, 25 Nov 2026 13:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A0B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aP8scYDA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/DY5BxDsUYT/QQeBNwSgNXSaVWVpbdEkguNyi0+dFYESVEZGwPrpxLML3sacMujPIvgWcx/+KGemV0KVues32WgSGUU6Xe4Oed124MsZCakTItisAYtp3Mt/8SKDl6o41s1xoFde4Q2FPVK6nsGEiDBhyq1sHpszjXsfREIcOkGcjM1nkGuVsxW67+0mAAvlgx+bBZwpuN26e8s1GUKRUhDp5UIvJQp0OS0zRDhdxeRMQXDfhc1kt1rQ3y+PSBUwfM5nUDrwp70Rlj+q9JgSqV532hsvAy3/hSX1OmHBuZHWAEPV+EV/AYcYnTHehQMRqBVPkRnVOzkRno5K+p4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOU7ljZZsOgw2LdevCi9iBZ6Qr4nceVY7qwEs6tXgFo=;
 b=RqtQqMQZiCS3C7Q909Mh+RsNs/nKFwDo4PmlKXzdAP5FhHEzSQNBBUxCmRJP/4jtkhf54iYkmFbRxsnPDNVNEriBcippYEx4RTvlAG5ybFPJwc3j8NJ6g8H0IrkQ+poyh+dZSXNaGGg47n3hAXZF8u0ag2PZShC6Pk1EFavA7vLA3Fr0CxZL/Xjt7qvpsQGYeVA7Asd5G64VQZRwVTYhAf9CEQry5LkSiO0chFhiPMK1k9csKk9B68Z87Iuc7CppGFR/w47GFekgKoxD7NeoduaiULR+OXztq4WZPu5L1j9qk9Gi4KsWDhsmCXm1ar9BNGzAUXK3Tw3OZujr2CUBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOU7ljZZsOgw2LdevCi9iBZ6Qr4nceVY7qwEs6tXgFo=;
 b=aP8scYDARfXjGR56IKOfBiZViQm4hfxofnaYfOvVL/rgox5lobh4xxAdHadEe21dQa5bBizknb11CLRqo/mdhH8vDYUoOf5kFIRJgJAQ1/maTZDvaDdoLvHiyQj2C9XsORITziRYHCqPjqgL3fyk7Yag3w+15ZFtH4KGELB7JMo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PR12MB052986.namprd12.prod.outlook.com (2603:10b6:8:47e::11)
 by CY8PR12MB7122.namprd12.prod.outlook.com (2603:10b6:930:61::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 13:43:48 +0000
Received: from DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48]) by DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48%3]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 13:43:48 +0000
Message-ID: <b655779d-dbf0-4793-b18c-59454ee37606@amd.com>
Date: Wed, 25 Nov 2026 14:43:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: zynqmp: dts: Add RTC clock nodes for ZynqMP
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Harini T <harini.t@amd.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <e660f7ed31d0e605ede493941cb2d18ba34fd7b0.1795098007.git.michal.simek@amd.com>
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
In-Reply-To: <e660f7ed31d0e605ede493941cb2d18ba34fd7b0.1795098007.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DS5PR12MB052986.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS5PR12MB052986:EE_|CY8PR12MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c12567c-95d2-41a8-f18c-08df4afa21d4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261021121427099003|261021123027099003|56012099006|11063799006|261102123227099003|10067099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	84nqMD9+qRZpA++3aF7/IkEg77i65SMx6FEHdTNZezXFCcczb7B9jpEaPdhY4JHJwm8SJU0Imac4j7xrLVkLgTa2l/WYD8a9whEgGu01AYTXmQIPTIxw1BYGI+GBoMTscqtni9nANEcXIPiCdOjA1at13UQfuuT1ilBIYy2lG4h4g+CSzePVzzyfhJMjR/lsESdrf4bzyp5JEGT972SyKFhsWBTjMnX+Ye8bcVS7F8F8jU//NE95jkashlMz2Qr6iRpJR7yl6RM9cagCH/Ptm9UfNEtZLNzmcs5L93i4fbv7GN5DUvcOTKISbCfLASCnZ3d2/btusXrd02qR7tms4YysbjUZfPGBvz1KL7G3CbvLYQOX4UvaaRgfvCDZuvY92ImXIbBctuj0ID8NpQ/ukUBzuhSd0qTJX0WFWfw2D85QW3Zpb+a6vCnRMTOaOs/YCsXDSMYDwtSxbAMpQFT2pH0Hk+L34vVD+ubrH3K3Z8IMJ3iNqyqGQujBkGS73HGAVtL/kFgksgrc5r9DgIeOR2Yb+v9s4wvhpgnNh6eqflBHzgp0fISbLNgiwusyuBDWP3JOq8mYkOMnF73HnV5MxD5/XeGLy8nyDVFyXRCXg/kQeJvR5b0NC0MmQSNeyz+5wB1W+jClS0/v0tIVvRo8XOAjZ0ohlNz6QimU1CT/QOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR12MB052986.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021121427099003)(261021123027099003)(56012099006)(11063799006)(261102123227099003)(10067099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NndERFl0L0g2c3VmRDdqOFdmQWVFcFR1OVZlNEZNUG5KUGF6bFdqZzg4ZTFE?=
 =?utf-8?B?KzdhcE9OQjZDOTFKNS9VeUtWWFZGS1RldXJ2VitNakdKQUt0N295YmtBQURa?=
 =?utf-8?B?cHREQnhNKzJNN29TM0YzTVUyWTFXUWJvTkx3NHlCZkVFSEp6UGVHOTYxanpS?=
 =?utf-8?B?d1BrUWxrWlNQYkhiZ2liZ29Ib3JQTUR0T3hETnBhWDc3dFpyU3JRNkdZcWRm?=
 =?utf-8?B?NjIzVFZtZGhQaWNDMDFKNUQxSlNLbFBpOVkwT0l6cHNXM0ljSDl4endKWlpT?=
 =?utf-8?B?TmUzeWlFU0lYZHhuVzZIRXBkMXVhREdJRDZhYWZXT1gxZWxXTERROXY0ZkdP?=
 =?utf-8?B?NTIwcUdCUGNEZUtHNEJrRUtYTU1LSks5VU9zc1pmS2VpNXhxL29OcEJoWlZG?=
 =?utf-8?B?MzZ3MTEyVUJpTW05R29vby9LcVFFMEV5SkRsZmVSV2x0ZCtraitIaDNWUHZG?=
 =?utf-8?B?cEc5MkZZSUg1UUhTNnlVcld2RE9GbGhsRFNvdWhEYVhyUExIMDdTbWpqR2dj?=
 =?utf-8?B?TEs1OGNBK1BWUHVUZndmMWU4SHVVbE5hSVZKNWkrQ0RkRnZUTnpTOFBCQ05H?=
 =?utf-8?B?RDA0SndLcVpFMG94TzdwRUF5UmEzTnc0OFZ4Qk5pbnU1UEpsMTZsU2d4eE4r?=
 =?utf-8?B?M2FMc09idmdBQmw4QVJHL21xWUU1c0NQRTBRaXM4T0VGU1A1azVKM2lYZ2Ev?=
 =?utf-8?B?c0g2VFArQWRxNkxRRXB1S3BQWFI2YmdPMEw1YXVXdFNla0Q2aEtxeUJvTXE1?=
 =?utf-8?B?b1VScnJZbzlPNnhvUjgrU0ZQRTFPWlozQzQzamw1eVY1U2Q1OHRjKzBzV1J4?=
 =?utf-8?B?RS9TMERsL2R0TlBZRDk0azJCM08xczFEZXdLRVlhVUpEcGZUSjdGWW5NN0h4?=
 =?utf-8?B?NldjclorbkxuMWhaYWRiYXllYllxTVpUdHM5Qlg4TStCNUVsQXIvM1Uzc3F1?=
 =?utf-8?B?c0ZFYTYxdXlOcHRycDYvYzhPcTRsN0cwdDcxSzlZeUxtaExjRzBzYy9QUU8z?=
 =?utf-8?B?R2o3bm5vaGhJc25QSzhSckp2ajh4cVZjZGJGTnlHYUM4aEJTZnFlZUQ4N0Fz?=
 =?utf-8?B?NHBmWU5lc1RBTnhncHV2djlqV2NQOUtXdDNzSGhxcHdwNXk0U2RJQ1ZSU1Iv?=
 =?utf-8?B?WGNjNmpYVk4xM3h6WFEyQjYzeUpDcEhsRUM0RlkrWFNMRVVrSXhmZmtFSk1P?=
 =?utf-8?B?L2NlZzYzUVplSTR2YUNIWDUxbmdIVXB1eGhseXZyUnRmNHJsNllxODhDVXQz?=
 =?utf-8?B?L2puQmxIT1dCaWg4M3hDK0d6ejd5b3M0c2pqL2oxaXlNcFpaSXh3TC91RnA1?=
 =?utf-8?B?WlF3Ym5oVnZybXR4MGNONG1nM1ZvRGFjUHJ0dlZuQjBhUEJuVThXYUFNaEdO?=
 =?utf-8?B?VDBuSXh5S1JKbUxmd3hvd0hkYzgvWFFhVnhLdlQvVDFkTnh0RWhnbmRCNlh2?=
 =?utf-8?B?S3JHRzlBNitocWxXTXlqU0pWTzZ1L1pnL3E2S01TblVrbkZkODg3Wm9RQTdr?=
 =?utf-8?B?V25iUmc0amdPVm90cFU3NDVtOTc5eXdpSEEvRmhpYlZZcDVnc2ZJTDU3Y0x4?=
 =?utf-8?B?bCtWRjd1SkdkanJzcjJrYlBWWFNQeXk5cDkwZVcybEt1b0pEdGpWWU0yMTlD?=
 =?utf-8?B?bnlmTHh1Z2d3SGoyOVJXaVhjcFNiVDNiRWFVMW5FZ09OSldRRHNqMTZ3ZTdt?=
 =?utf-8?B?WElKd1lNVms0MTlyZFVvNHBNdlY3Q0M4NDNxRUZNOGhQeHc2UXpXN3NnQjhR?=
 =?utf-8?B?dlQyd0hnd2syUEM1M2JkM2RPaWtLeCt2NWNwZ216UlpIa3QvUkJseUo0YmJ3?=
 =?utf-8?B?bHFyTkVnc3N1dXI3UjJYbHlMaitBQzl3bFJsQm1HR0pHMzVGT2tDWDV4WlpH?=
 =?utf-8?B?TzRIRXhCem41aXM0bnk4RVJLRmhJTWgxOVlVZTgxQmhLbG1TQnY3aWs1b1NG?=
 =?utf-8?B?TldrajVJd21vQTQxMXhVWm54V0VGMlFpbitTZ3ZtaTVuRS9zeGNxN0tTQSs1?=
 =?utf-8?B?KzY0ZUtKOHQ0ek9Ta3RnMkhiSlYrbmtGVm9hNDZNaWxJVUs3cUd5NFQrWkZn?=
 =?utf-8?B?OFJVZFNpNE9qUU9JSHlLelVaZjVTWU5KZDJBb0dNRzNUa2ZjamJZbHUyZTNK?=
 =?utf-8?B?U3Bhb3l4YmhMNS9qQ3NkL1Q0VjdLd092NGdqRzZTSklLSFovL0V3M28xWWQz?=
 =?utf-8?B?dlI5QjlJck9oSGQrLzFzWU9mUzIrM2p6YjFsRHMySS8wOGgyaForU1Z5UWtp?=
 =?utf-8?B?RG1TNk1Ua2hqb2dzVXI4NW9wYSs5RXYxVkl3eW9aWWxuOWNEaTlEU1FrOEwv?=
 =?utf-8?B?WnlDZDhUSTBoNXpoQnVNM2NreURhT2tvVkVyU2ZaUFJkYjBoYVQ5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c12567c-95d2-41a8-f18c-08df4afa21d4
X-MS-Exchange-CrossTenant-AuthSource: DS5PR12MB052986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:43:48.1250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30SITyio7kKcpZntjVR0vZyIoH1YwFaXeiukb0/poMS84oDnEKpSzt+yBaGEnxnl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7122



On 11/19/26 15:20, Michal Simek wrote:
> From: Harini T <harini.t@amd.com>
> 
> Add fixed RTC clock nodes at 32.768 kHz for ZynqMP. The RTC driver uses
> this clock to calculate the calibration value, replacing the deprecated
> calibration device tree property.
> 
> Signed-off-by: Harini T <harini.t@amd.com>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>   arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi | 13 +++++++++++++
>   arch/arm64/boot/dts/xilinx/zynqmp.dtsi         |  1 -
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
> index 482f432ba7f3..a6e67473a8d9 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
> @@ -49,6 +49,14 @@ aux_ref_clk: aux-ref-clk {
>   		clock-frequency = <27000000>;
>   		clock-output-names = "aux_ref_clk";
>   	};
> +
> +	rtc_clk: rtc-clk {
> +		bootph-all;
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "rtc_clk";
> +	};
>   };
>   
>   &zynqmp_firmware {
> @@ -302,3 +310,8 @@ &zynqmp_dpsub {
>   			  <&zynqmp_clk DP_AUDIO_REF>,
>   			  <&zynqmp_clk DP_VIDEO_REF>;  /* rpll, rpll, vpll */
>   };
> +
> +&rtc {
> +	clocks = <&rtc_clk>;
> +	clock-names = "rtc";
> +};
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 29058e633fe9..dfd824fc3e88 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -1004,7 +1004,6 @@ rtc: rtc@ffa60000 {
>   			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "alarm", "sec";
> -			calibration = <0x7FFF>;
>   		};
>   
>   		sata: ahci@fd0c0000 {
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> 

Applied.
M
