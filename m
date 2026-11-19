Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795081957;
	b=qqte1Xr0VCmHIMU68CN9tDb9rAi5qYZd/FYnKRi86aIH7ghQQJ9+In/0fKhOHq89/Ddq
	 UGsATaDKtdcw74FHEaXQXmWZTMJULWTBrIaxhpE/h4LgY4SE9PY88zTxs7uaURhBgNFDP
	 G23OaKw31MLORdjNrEi7YeLR1pjvcXTZBLdBMzSeilpFx+6Nx3sjAuT3PR+fe1CzgeQL9
	 m7n6oU4JmreDy+slzQT04lnz2Bz0Ut3+G5PPU74oN2dH4URYHjIapnkKPXd7XEtSufK8f
	 doEX49cVBsaUz5QY0vncDqjqk6StSEk1WHGzGJjw/a0DMortuvNjHHLZI+iT1j+ZEDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081957;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=ArEyaqIv7KnV6fEPDVmQ96OJMVlwGJ4MYjU0NepYoVQ=;
	b=MylkrsS9hsG/n7uPb0AUvNL9FTng93BxNMKCVZVEXwxTE7f6gSYH75++XT4tllhQ1oHY
	 DObAhGJ+Ez2GXiyWnI6w55OdqzwWJnCbabD88pAVPE+ZYdwwBQti+55mDklyPfmYQfJwh
	 L8Fv/XH1YdZXcZKKDtdsxnbz5gANkgseXgF/dw9rVVt3GzW+I5PVpRD5WUr/PzCSLgC19
	 4xrun0Rs87aDER7q2s85ZsJlYZERV3AMfPBTq9d9gdbLIsrVL4O6KZzLG7y2asHbuZBv9
	 gwxkQ9ZVb9wz+bcLmntw8Kas7a9jKpBL3KY6yYTWmExNclL5UcvMSdb0sOpxpr18xBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VISeIn9d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.50
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012050.outbound.protection.outlook.com [52.101.48.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35220606A324;
	Thu, 19 Nov 2026 09:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35220606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VISeIn9d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjXH6gd32YOvxEG23fOznyA7wmCHOL2JRhdhniSjF0AfEqg5Nfw2Cz+F7V6lvqEsRoCW1sZU1aS0Q/XPpELrjB6DQlf5EUOjeIt1GjqdRYvDi1zVpWuLY9+daaMgJ4hP2R0YThbophMcvPR263spdMN0+z8aEVKorcXnCJlMiGTHcN7qS/6AuM7x57nz3sjBYkGcsNupCQ8uius6orBaCZT1TTh7+wI2F6YHB/tRLX7KrMhxdQSYcXrG3BUgvFFpOXf6jc+sj80+C6+vnWWMo6QRNOrVgkg3of7l8p3f4tkiy+PrYhEVMC6lday94jVt66Muo8duANpMLtZSegrX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArEyaqIv7KnV6fEPDVmQ96OJMVlwGJ4MYjU0NepYoVQ=;
 b=uqjOmI7M70G5creaRtANE7ezsHAwSSvPfIr1C4KBIQk4hKDvvBnjeJT73McCDa2IYFVQYny7WrqLoNx6k1ozW9A47I4jL4G43In4PgcOkE3ivSECgfo+f0VH1CxiQDO9hNt5cy80AAIKk+QyAZY/ndQSCLhNycd18aGQozlJxT1E2XvXDQUOONJj2O48/t1yrfY0LUrCMRvyZqpHNqGEmNPumpiW6Z7UUyZ2kChlOXSNAIm2IrJlElR4pLRROlmzsqWgUWfhFUr1SbGNoJ8n3OkHo+jDLmMo0CzzJPiczxQ/CAfrWV9kZTtQ6DcsKOO3iWI57Dbfz9wzGEb4r5+9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArEyaqIv7KnV6fEPDVmQ96OJMVlwGJ4MYjU0NepYoVQ=;
 b=VISeIn9dqQ8pYox++SknECbxJS2lK89li4j6lwrmMHXhSN1423q4hajRbiHdo0i8gp0AJ+Q/dPqTX8+p/ebUoYxG0Fcy8z1ff3Sco5uRpZEvczu8UA80v6kX5PbqCsnH38ur0EmkWDGDcYTmNwqdi+lKP9CWz6ta1BJ/oioz4vA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:52:32 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 09:52:32 +0000
Message-ID: <2768d57d-9012-4f97-a89f-9562c8fc3939@amd.com>
Date: Thu, 19 Nov 2026 15:22:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 2/6] dt-bindings: net: xlnx,xxv-ethernet: Add
 Xilinx XXV 10G/25G Ethernet
To: Rob Herring <robh@kernel.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
 <20261114182947.2908628-3-suraj.gupta2@amd.com>
 <20261118162847.GA2433918-robh@kernel.org>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20261118162847.GA2433918-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::8) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 34144d24-8563-4d47-db26-08df4622d4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|22082099003|18002099003|6133799003|3023799007|11063799006|4143699003|56012099006|10067099003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261022075727099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	oy110Z5c72A+avcKlZDro0NjPc0pTJW0y4Kx9/U7TisvYt+9KxLkxpBWqF3m8tKuYvsXG675tkFTQhjRk5mcU2zoRtdxJm9eTBocD/UzzKNZk4JbMnxW9FYsmdA4uuua++a4H0S6zpDoJDBAeFzP3t6LkH5kFcYOclZz9BD7FtqzSmcECc7MyXq4APuS5gr28Eas5Y8V2rgefehQkAl52LPzFzLIWdizpdJMPOWq7CSLPPj/2f/PEM/Wcd3SaQXBlJLT8HsJosZtWtmIoLAU0Je4Z3Zup2jQ0knDrNXuC1znnx5ZbN2AHwIZfruQpg6ORCw614xqNkpvcflj3rsz7BmGrkd11pUpfJOuYpX4FgRXMNDqO1Tux9dCSXLVP+prxS+BI4+bCD/kaZyQ2e/msrL17Sts329nKk4pHUhxej8/kK6SpcKOM3va15x/cVp8YrBBcNfqeBRgc4lL0FtD3h0n9i4Sq98dET6O+jQ21tpaAyq6zNQ9FMelLOxaQIZCp+Gu6DKLEnXftRENJPd544i4FxlA2nUUIoemSoC87EJLhT15e+9KpTQ5COOAHKY450X5PvQuK3llpCqeKQVPlogSsWd0sPoWbsOPEmKrmfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(11063799006)(4143699003)(56012099006)(10067099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djdXZ3V5RS9nOXlCZmJ0Uitxc0loNDdvbWhrS2c5NHVhaHdRQlZOb2FQMFNN?=
 =?utf-8?B?NXQyQng5bDRYTkUyOVVIay9TbU9kUVlqdEYwY1RWQ1MrL0pEMHBDQmJ1eTdi?=
 =?utf-8?B?YVl2Q3RRTE80TGFOSVRHbU9YQkIyc2tQd3M5cFNhM1FBSXVScHVmZG5hYWtI?=
 =?utf-8?B?ZFBSY2RKSDhEaVMvODNuNjBtVnUxbUdtWVJadEMxbEFYZzA5N2VNbkNHaHR4?=
 =?utf-8?B?d21rQnFEQnVmOTBiZTIrb0pRRHNGeEJncnk4MDhnVC9UT0xMZ3VpWEM5dnpy?=
 =?utf-8?B?T1E0VEEzakJkRHExRHcxSmx5VDVScW9KZ0xHWk5qdWNITkpmekJ5MllmUFcv?=
 =?utf-8?B?SnNIMjQyUzVWWlhkdVZwZkF1UWZYWVI2R2JNbU1pa1VzY1hJZ2xpL0d1bEo1?=
 =?utf-8?B?TG5yaTlZOEtQVkQzNkVuUnBRa1pYT3MxWmF5cGNlM3lmakdhQkswNkNjdEpW?=
 =?utf-8?B?cmJQRUg3RnVSd1oxdUhnL2lONTZWOS9SaGRLaHdhd2VMbzVIR3BLSlJHeXY5?=
 =?utf-8?B?Z3hmOURndHYyZ0JDcVYyQzROdkZRUVFiK3RmMEFPTm1kU2swNUJjWktsd2x6?=
 =?utf-8?B?Z0ZoWHBJSEVRWjc4SWo5M29HL2xZVEZIYmo2b3Q1SWw0YUlPMFNrWWhlUFZ6?=
 =?utf-8?B?aHhyVDRENkpnSWFBVjRCRlpVQndYWE54SERIcldyZ2IzVFk4aFZVVVF2MEE1?=
 =?utf-8?B?elE5dFh3Yjl5QnZDUU12U3pIb2ZXakpPYThYNlBST20rQjhtZ0huU1E1OTVB?=
 =?utf-8?B?SFp3cFFyd0JMRXdFenNmVTY0TnJMUG1tL2pDSXpiUmFNaVRQdUZDdFhENHN4?=
 =?utf-8?B?eGZlZWFqb3IvczdZZVhoUzg0RWhUcDBLMUt1aHRkek42eXdlYUU5SGZwNXN4?=
 =?utf-8?B?OXVTNkV6VDhrVmZXOUJIVDQvOUVWbll5RTRFMHRqMWZTTk5sS1IrYW9FMjlq?=
 =?utf-8?B?NEE1RVRjVzlhQlkwWVM4R1RQb2FiS1ZjaDFiZ1k1VWRIMUFiOGkvZWxRTTFO?=
 =?utf-8?B?RHBRak1jeUU0MjlQSjBkM2lRek1BWGRtZkJKbUl4a1JBam5HWGFGVTV5MzRS?=
 =?utf-8?B?VVlXd2FsRElvQUhIdE9rT3lVRUM0TTYxRHJReW5tVzFDcnlSaVlHS2YzamNa?=
 =?utf-8?B?ZmtzYmFJa2E4VWxBN3BJR1M3SUhvRk42NTNSM0t6TEZ4UERNdEJZR1RlaEhT?=
 =?utf-8?B?b1Q5cHRrdC9jZjBLTEtEa1pRUkdRb1JaY1hZNTRmbjB3VzhnS3o0QmVjZlBk?=
 =?utf-8?B?M0tLaU0ybkpRRW9wZGE4cWgydCtnekEyeSsvbVErUTlYMVJQb0tKT1lBdDdq?=
 =?utf-8?B?aDlHK1VEWXRlSUY2dC8vN05jTElvdnRqb3M2RkswWkxhbklFZHRGNkF1d2g5?=
 =?utf-8?B?Z0RGdms3VUpTS0dLMXBKK0dPVFZxR0pCMXltQVltT1dkcWI4a3RQeGtVWEJv?=
 =?utf-8?B?eGtSWGd2SFc3Y0JMK0JIQUhjMXZRUVdJM2ZvT2I0QTNNU09pSDU3QWxORVVY?=
 =?utf-8?B?VWE5aUdWNmtuQnhLeFVVVm9jSTFyTk5oRHcwQWhwWWl5N0ZjNnNTWGlqNUp3?=
 =?utf-8?B?YlI2L0xvajNFdlBvakZjN2QrUVQwT2lnSDNOR3FiVysrcVFzK0tUMUU5dlBG?=
 =?utf-8?B?QWhrZ01maWJaWUdNZkw3U3dPaVFPdStraGNQeHlETnlFbTVWdm9YaTFxQWg2?=
 =?utf-8?B?Qm9IOU5acEExM3BMQitLaEp4bDVQN2grYVN6S2R5cmZHMTBYSlVoRjhqc21P?=
 =?utf-8?B?MVcvbEt2VjVOWC9FdkU4VytUSnlPM0R3c01jV0s0K2gxaXMzZkdlY1Z5WGNG?=
 =?utf-8?B?SFJSK0Ywc1hNUkxtcnJaL3NTUVY3YzYvNW03QUpZSkJ1SENPT0FQUmcvbyti?=
 =?utf-8?B?MEZFZUh5Y1daOHhDcHg0RlB3MDk5YTNzUC9JNUp3dXU2NGg3VU9ES3BmT3Ji?=
 =?utf-8?B?SjZSQ2dLWDVOUVVyeEtGYjRsTTIvRy8yY3laVTFRclFlODFWN1p6MnFUOXpj?=
 =?utf-8?B?NHB0M2l4eHNXQkF4cEJCb2tCVkVYMEhzOUY5d091T1BRVlNpdDY2K1hnbXJu?=
 =?utf-8?B?emF4c2d4SjBMek1zZmNYWis0YjU2aFVwYlIxSndhTlNmcUJEY2plNWxQRkd6?=
 =?utf-8?B?MDlTYzYyVElXVzVaRGVQZTU1S1RsRjRNQlFGNlZDcks2TUR2TnpreXkvZFpG?=
 =?utf-8?B?ZkMxMU9GL2VRem50UHh1b2xUbTQwcnNwUnVuL1hsdlpyeUs4SllZMkYrN24v?=
 =?utf-8?B?Mm11L0FkSHJ6R0I5clJSVDlFTlBvQU80eWN4aVQweEtMYU5PaGRzR0NQWVhO?=
 =?utf-8?B?NVg2U0YrK3NnSmlZS3dyMnBUUnZXQkxSNnlIdWp6N2NFTkVZTjlRUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34144d24-8563-4d47-db26-08df4622d4dc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:52:32.6797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ76N6fqbRfQo0njZENXR3Ju3KJFtR+axLlMEUNa7fie49voNal4ffKreYOdaiXmwsVxO/WOdVBzeC7pBODuuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536


Hi Rob,
On 11/18/2026 9:58 PM, Rob Herring wrote:
> On Sat, Nov 14, 2026 at 11:59:43PM +0530, Suraj Gupta wrote:
>> The XXV Ethernet IP integrates a 10G/25G Ethernet MAC with an in-core
>> PCS/PMA driving a high-speed serial transceiver. Its payload is moved by
>> an external AXI DMA (or multichannel DMA) controller referenced through
>> the dmas/dma-names properties. Document the IP in a dedicated schema
>> file.
>>
>> Add the "xlnx,xxv-ethernet-1.0" compatible with the 10gbase-r and
>> 25gbase-r phy-modes, the rx_core/drp/s_axi clocks and the AXI DMA
>> channel properties. The GT transceiver reference clock is described as
>> an optional fourth "ref" clock, for boards where it is supplied by a
>> Linux-managed clock provider rather than a fixed oscillator.
>>
>> Add "xlnx,has-statistics-counters" as well. The statistics counters are
>> an optional part of the IP, selected by the "Include Statistics Counters"
>> build option (PG210), and unlike the 1G MAC the subsystem has no ability
>> register that reports whether they were included, so the devicetree has
>> to describe it.
>>
>> Require "xlnx,rxmem". The driver reads it unconditionally at probe time
>> and fails if it is absent, and the value is what bounds the largest frame
>> the device accepts, both when validating a new MTU and when deciding
>> whether jumbo frames can be enabled.
>>
>> Disallow phy-handle, its deprecated phy and phy-device spellings, and
>> pcs-handle. All are inherited from ethernet-controller.yaml, so
>> unevaluatedProperties does not reject them, but the subsystem has no MDIO
>> bus master and its PCS is in-core, so neither an external PHY nor an
>> external PCS can be attached. Constrain managed to in-band-status for the
>> same reason; it stays optional, as the link is always managed in-band.
>>
>> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
>> ---
>>   .../bindings/net/xlnx,xxv-ethernet.yaml       | 146 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 147 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
>> new file mode 100644
>> index 000000000000..caf582c72a8d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
>> @@ -0,0 +1,146 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/xlnx,xxv-ethernet.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Xilinx XXV 10G/25G Ethernet Subsystem
>> +
>> +maintainers:
>> +  - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> +  - Suraj Gupta <suraj.gupta2@amd.com>
>> +
>> +description:
>> +  The Xilinx XXV Ethernet Subsystem implements a 10G/25G Ethernet MAC with an
>> +  in-core PCS/PMA driving a high-speed serial transceiver. It supports the
>> +  10GBASE-R and 25GBASE-R line rates, with 25G operation following the 25G
>> +  Ethernet Consortium specification. Because the PCS/PMA is integrated into
>> +  the IP, the subsystem has no MDIO bus master and is not managed through an
>> +  external MDIO PHY; link state is read from the MAC's own status registers.
>> +  As there is no PHY to manage, the link is always managed in-band.
>> +  Any SFP module management (e.g. I2C) is handled by separate IP outside this
>> +  binding. Its payload is moved by an external AXI DMA (or multichannel DMA)
>> +  controller referenced through the "dmas" property.
>> +
>> +properties:
>> +  compatible:
>> +    const: xlnx,xxv-ethernet-1.0
> 
> I hope you based 1.0 on something? Looks made up to me.
> 
>  From here[1], looks like you are missing some versions:
> 
> The offset of user configuration registers in the IP was updated (and
> removed in case of USER_REG_1) which breaks backward compatibility of
> any custom user config application code with newer versions of the IP.
> Please make sure to use the correct offset as per the IP version as
> specific below and ignore "XXE_USR0_OFFSET". Please note that this has
> NO impact on the example as this definition is not used.
> 
>      Upto IP Version 2.2 https://docs.xilinx.com/v/u/2.2-English/pg210-25g-ethernet, USER_REG_0 is at offset 0x184 and USER_REG_1 is at offset 0x188
> 
>      IP Version 2.3 and above https://docs.xilinx.com/v/u/2.3-English/pg210-25g-ethernet, USER_REG_0 is at offset 0x134 and USER_REG_1 is removed
> 
> Rob
> 
> [1] https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842542/Baremetal+XXV+Ethernet+driver

1.0 is the initial release of this IP: PG210 v1.0, 2015-09-30, "Initial 
release" [1]. The compatible names that version. Newer cores are handled 
from the revision register (CONFIGURATION_REVISION_REG, 0x24), read into 
lp->xxv_ip_version. Today that gates only the GT status registers, which 
PG210 adds in v3.2.
The same v3.2 changelog adds bit 0 of STAT_RX_STATUS_REG1 (0x404). v5 
reads that bit unconditionally for the link state, so I will gate it on 
v3.2 and later in v6.
The driver does not use USER_REG_0, so the v2.3 move (0x184 to 0x134) 
and the removal of USER_REG_1 do not affect it. The wiki pointed above 
describes the baremetal XXV driver.

[1] https://docs.amd.com/r/en-US/pg210-25g-ethernet/Revision-History


Regards,
Suraj
