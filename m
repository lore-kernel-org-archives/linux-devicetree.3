Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011032.outbound.protection.outlook.com [52.103.67.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362D351C0D;
	Wed,  8 Apr 2026 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631859; cv=fail; b=Kmc95xTGi4BbKuhFtkOFb2O7NY4BXR7idB2WFll7s4CKZJWQjGq7QxcIIO01O4uD3gWeBkDBg0GbCjpfWM96XUE5YemWDZJV+6Oa7/Qt6oyO17QfS0HQEqvzbABH36K4MO1tTdsPWWHYQ9iYFxykFds1qa6JBdS0kHMrGc6ag3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631859; c=relaxed/simple;
	bh=4mkxCN9FRRo5KRsRwk+SRVKukHYFfDqFH2Whz7nDz4M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l7iZL/yaNEuNH7L4ZpvvSYPvY8knMGU8ii5LcKn5YSFr0yMREdDwXRYi3u87GbkRzru12MUbkaAXh4ru5uPSv4C6B5BS8StCilVr5F/cOkPLPbNLHOr6XlktNtUvlPK5rMyrWFp9sHpYf6Eu/qV/sN9+pG3ceGce4/Gi/pBrVPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Rs7SMcfZ; arc=fail smtp.client-ip=52.103.67.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Rs7SMcfZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxUTsgn2ozlwTVeSyOOw0PzwgR2JsuEzhI4C1BEE4bwBit5L6PPjln2h8xaQUD4XVHZDHjoIKpQoSDUlBxJJFmhsWuNJYULiPwwpb9d7CFc8sQDYbqTc7G6f9cuBPqA/JsS78rDk9Tso60I3c0fAgGQTC7b3S2gsVmpjTGmFFFXMO09fevTcXi3GhW48U25S4TaaFREEvgRv722Rhk+1u6lJNAcaoZmjjfue2EBCQPjXAJPYDxG/wK9GgZYSNKuzoFz/EaNDLkRRCPfb8gWz1KyJrgvo4xRAFGpfeAmwfhyD7y5/ZouFYSZIqcOs55Ti2pf6aJeTqnftI/zqJ+sFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdvDw5sQ+LG967PkCspUCzsYGmI3ol3TQFKdwXBlu6Q=;
 b=dzGtGfnzBWQQDjCNWlcMKOF33hOZYNfF6UyfF+mzZ8Q7lnJu3591smAEUnwijsGitq/ZSCorasMzaiW9RgXGbLHitxdzgfqVvVayAn2gs4ZvGjnhk9MisxD990mgjsZt09+JyQu9ppSo2hcctwtiUVGfRg7CUlwLHlGi5gzS733p0zw/0tPdb3pKUSFWJdKLlu6JYRwKsOEQYNEDs7CQ6P7w8Zqe91pPlXgTzTk2vPZ7x0Sm2JFb3rNxRm/N9kwv98R/+MLfarUsxsga0FfzZw74qegBFpzjzS3YhzGaGngcKXsc9IAC/nsAgqumczJXSebCF9bFoNqWVd5oNgiTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdvDw5sQ+LG967PkCspUCzsYGmI3ol3TQFKdwXBlu6Q=;
 b=Rs7SMcfZ/VWWguwmDx/K2TXBt5/fviXQDm/gMD2xUwDp4NlKLl3WikmSP9kW0KrhU8Xu5Qj+CGaL5gLGce4uy8IDiSmNBZXBwMdP9MNxWgHhwL2g4jm43qWNhuNabOFraKz0PhBzQQzdRQbhvuJvv/anY5yhi45Gu8n8CNHcQIUtzLpYwI9SvuHgxIdixsoi4z67EPShZghDjl6f+KhSdVsNW8oO6etF8WXinI/I6N9cQQ/BTSNwvVqjNIyXxav7kHubjTvBxWoj5S/LHkXmhWIk1dJl8IZWDN2pZnRBTVEZvsY/QPZuXcixFFPX0h5Su1hy4sNfFbrHWTQng5hntA==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MAUPR01MB13345.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:215::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 07:04:10 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 07:04:10 +0000
Message-ID:
 <MA5PR01MB1250025586EE7A236CAC536B1FE5BA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 8 Apr 2026 15:04:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: reduce SG2042 MSI count to 16
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <54f74bc5-9a4d-49c4-9d09-0d35fabae9f1@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MAUPR01MB13345:EE_
X-MS-Office365-Filtering-Correlation-Id: 040b848a-f513-4d35-717a-08de953d085e
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6d5vbofsfC/jnGJ+j4hG4ECeZq+O9gJerEbo4iNd0YSHZTikVfVm3fnA2DJg29CUNwnBYyTank1zXLkBIUnqhgiTukAB7R010qjOsYKksjp7t5r3EovDo5alnrxAzVVsZzhJesM2B389KGGHoMi313wxMhkJKgHBCDsfqFHym5uGYJ4BWxfAflAWAybrhHP7EKN+/t0aDm8hcWaIvq4NQGKZTvEGlD3tauxEHu/6mNi1slM410QH6NScftza/WpcwBb/ylyBpUnh6asr1a676JFQm6dSkJYK37S5O03UVRARdMTB149M4Nk4qGcfTekWLCGZ2VaDIiHGdivoDwxPeylnLMBGdcnLgD8BRZZAPXWOXg9/M9sJrRoDFHeNFr6KxW33XkSTG39MVurYo26jYoiXAP0bhw4piMqi0U7C2w6ew1nRwWCV2pl2U9legFc6kX1ZtAUKGT8/64dQYvbSeGpmkuMnVviXWgr/oA3JYuKpKtlufNNpMwLCmu0H+wNB/NABiZrjOQ/SUG4RDBXoAowofQM1CuviMM7TSnuCPTOCc8DtVLMTCNAHvRJ3wZCMf3R6jjiIyoHa3Pp9lz3fTdcb/tOWNXBzEWLVf2K0kBPihWEicGN1DSRPNjG8cxA4WnA96V2oTEwPmxKYTeQg+x6WiUH5VoxeuIORrmJDsORNxyZ0CeaZ8J9hYmjMMfu1jBm+pjz9pupWmtnfYD6MXChPavagBebk9EFHi1hswJbgiqb8SAXGRSv7K/0FxImjXo=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|461199028|8060799015|19110799012|15080799012|5072599009|6090799003|22091999003|24121999003|25031999004|440099028|3412199025|26121999003|40105399003|53005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajVNaTl5bnlzVWZJVXhSQTl2T0EvTW5aQTlpaWhhNWc2VmNDNjlqT2VSVGgx?=
 =?utf-8?B?MmNJV0YvUjlpY0dTZ3NjcGFpZnppVFEvZnhJNWI0RE8rUVdKeDROUzdqTFFZ?=
 =?utf-8?B?VGtaY2VjVlptYlNxT2NYVmNyNm8wc2I4TFNnUEpHM1MxR1BmUVdSN2VkWHNn?=
 =?utf-8?B?QW5KcFduU1ZISGFBVmVwb1ZqVnptV0xiM1g4bDZIVjN5RmRxS01UMkJPZGtw?=
 =?utf-8?B?eTE4QVdlM1JyK0YxeWhJN2o5T214aWJUaVMyMWNqdWhabU50UDNCWElRcExt?=
 =?utf-8?B?L3JvNjR4SFFiNUkrMGdreExlbFNKNmJXMWxRK0dxaXFDaGVnc2kvSms2Z1R2?=
 =?utf-8?B?SVVqOHFmUzY1eGNlN0RiNzJOeGgyNjRXMHNSa1Bpa2ZqRkJyQTNyVDRpNzhQ?=
 =?utf-8?B?T3A5RVNiUjVDVm4xcGIwSFFFNitzdGVQRktmK0I1OThSSzNJaEVpUXJlY1FK?=
 =?utf-8?B?MVBKOVFqRFRyRWYwVEdkWGFNdk1kbUl0S1VDa3F6UjVGQ0M1TW0yN01JQTM0?=
 =?utf-8?B?MG44cmxWWE9jbVMrTEliYkpYakZFa0Q5Q3RlT0dqaTlUYzFocUxhVDVBbFU5?=
 =?utf-8?B?b09GRnBsSG8yT3lzYmlTNUcxcmpQRVhER0syMWl3aFMzMXE2aWUwUWJmWHhP?=
 =?utf-8?B?c3RBZEZjazZna2JNaDJmOUtuZ25YcXJ1VzVrZjllZjB0Vi91VUNPTXI2WW1h?=
 =?utf-8?B?Z0VrSnkwaTM1cVhqMWFaayszdmpTd3huQXUzeC9RY0srOWZoRU5Na2FOUE5O?=
 =?utf-8?B?c016MkhmYk9ZRWJYVkhNS29heEdSY0NvdmI1cmVoTEZWamRpYTdEVFIrTkVi?=
 =?utf-8?B?RjdpVHUrbTlhN0FXWHN3RmtOOXIyQ2Y0cGcyVzllQ0JzNC9lMDFHSGF6ZmdD?=
 =?utf-8?B?emRmN09wMWQyVHpYWHlmSlBJT0M5aWY0Tm9PaGFVNWVwbWJLRC9pL2t5RlM4?=
 =?utf-8?B?bDlSclVPZjJHTEw0NE83QjhrZVdzc2pPMWQ2aXRpdm5NQnR3T3ZodWM2d0Ro?=
 =?utf-8?B?ZG40MHI0bFk1UG1nQmtzYk56anBWTG1ydUw2M1c0eUx2NSs3bjd6Sm1Xei9P?=
 =?utf-8?B?SUtXa0xHc2dDRXRwOGhzTmZlaHBzNk1CejJGbnBCU3VrZ2VVa3c5eUtmM2dB?=
 =?utf-8?B?RVVscjlmTzBONjl6NmR0Y0FRZm9Tc2VaT2dwQTFwN0k0cDhya1pNZFpnOExn?=
 =?utf-8?B?MXg4aGR5UFM5V2hCZ0ZtY1pFR3BXL05zdDg5akwxZXZhR0JrUnh1dFo1a1dn?=
 =?utf-8?B?L1luSGI4S3RVVEdHeHhuWm40TzhKa2hsWDdLMUtmd3Z4UTJvcVM1QVA5bGQr?=
 =?utf-8?B?QWtybWN6dHhPWWMzUnI2MXRsWUJvV1JZMHN4Y0t2Y1lzYVFmSmtDdWtmWHZk?=
 =?utf-8?B?dy9WYjNvUzVtZDVMSFZGMFZwVlZ2T2krL2VaOXFlWVFRdHVvekk4Q1pmb21Q?=
 =?utf-8?Q?SPAOtrv4?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFdKclI2LythYnlyN2tOMTVqcEQzbEhqN0VEUXdDWlJkK29pUVUycXljZ1Qw?=
 =?utf-8?B?Q1l5anlWZFVZYnVBbm1EbGg1YVJwZTJhTlRZVEF0UzhiVUhwR1ZJREVvbFZB?=
 =?utf-8?B?WjlqTWhhK0tmSnJvajV6T3NJY2dtSERBanozR0JnRG5wVVdzYW8vTkxPS0hT?=
 =?utf-8?B?SXJCTk5hOTVxZDdndjRmcDVvUEgwa3JRZGU2eDR3UUFmY0l0MEw3dGdKZjQ2?=
 =?utf-8?B?TDUwaE1rajFIYTR1c1VJTGNNeFZEQ0pCNFdKL0N2YlJFMG1xeG51Y2QrQVJE?=
 =?utf-8?B?YXFjV2ZIVXBSbFFoRGdhRm5hc3RZcFgyTkg1TEhBUkxUY0dhZFdCaVR4NzZK?=
 =?utf-8?B?RWwyYitKQ2NSS05hcnRaNFBNcEJ2Tmh2MEpiQUNmb0xDNTBkS2ZVVEZwZWti?=
 =?utf-8?B?Y3dMamErSmRFWEc2NWExN2VlcHptN052RUh6UkVYekprZ2I4R3dmZXd6WnpC?=
 =?utf-8?B?MUNSZzEvTlNMMkkyTUpwaTF6M2pKc21vVmtVWHhBY2E0YTZmTWhjL2RJcmJU?=
 =?utf-8?B?cnIvNy95dUE2aEZoNytVYWZuK1RkbWtuTXRlRXVKV2VYRFkvK014UnBkcTZa?=
 =?utf-8?B?QWFqbjkvemF2K2pDWXJUVzlaYzRXQVdTckZPT1drWFhhSW5jV1Y4eTcyVU5w?=
 =?utf-8?B?Y1hVeXBJa0xqbzU4MzdhOHBEcmFMdlY1bnlTTVlxQVlITU1KK0ErVy9HVFZO?=
 =?utf-8?B?R044L1ppRzVhYTcwRmNvL0xiRkk3dHVtS0k4ZUtXeGNOL0Y1UUFGTWsxL3NM?=
 =?utf-8?B?ZkdGZERBSXlHZllycllDd2JsZVFHZTBPMFZxVjZnTERwK0dxZFowQjlHSG1q?=
 =?utf-8?B?bkNOTzlvOXo5TCtWb3pacjRaQURrZ2ovbldibitZYms1aldmTGU0Ty85dXla?=
 =?utf-8?B?SnBOUTlUb1F1bzFYMVM4S25rcmJqeGw3RXR5UGxIeTZJWWhBSlRyM21pRHdy?=
 =?utf-8?B?MHFWSWVkcnlHRTlDbDI3NlZvQy9CcWk4SGhVTEowdGJKV3ZDUCtOUmdLZGJo?=
 =?utf-8?B?N0JVRGZhSjNhZVd4MzUwbU5FT1BXYW5vK3hlWDdOalRVeG9zZFQ5SWxPTzdm?=
 =?utf-8?B?TnNxdXUvTkdyQnlydUJLQTZvdE1FTDFBUnRJaWpSQWwxK2l5TWptNitmNnlx?=
 =?utf-8?B?MGVscDE4d0VJSXJWS1R3UWxzV0VqMk80eStFeTU0eWRXMzJxdDEya2UxWmx4?=
 =?utf-8?B?R2ZySE9wN3FkMUtDc0gxMnFPTmJtTGFBOER1THVtZ2hLaWZMU2ZvYmxoMFhB?=
 =?utf-8?B?b2sxV0ZzOWNKYkVnMjUzQUVHeFZIcXZydjVOT0tsTC9JVnZtQzlweVhjc1ZO?=
 =?utf-8?B?Q0M5M2NPY0VlUGdrU0dlWXJzQ21vamRORm9NVVpiS1NuNDMxeW9GYkltV3l1?=
 =?utf-8?B?aXlQMHZEMlJacWwyNUZVTzVxakltMDBiSHJ2czFzV3YzS2xRRTkzbEl0bzE0?=
 =?utf-8?B?MmptY3I1Vjl4NW83YWpVaWJYdVByTC8raUxRdks2d0xTWFhKd2E3cXpDTVVx?=
 =?utf-8?B?bXBKMXZSY3pGU0JWQndSamlpVU1UZ1NQSlR4dk1DZmFseVAxSmU5MVE4dDVF?=
 =?utf-8?B?SWdDY09sak9sUDVtNUZjUFVZaW8rdkVEanN4b1Jwby95b21wM2NlMXJUQXZN?=
 =?utf-8?B?dVQ0K2lEd2FGdEhhdXozMTR3N1c3V2VlSjNCRk51aTBEWkhnZG5RSWFTSTNH?=
 =?utf-8?B?cys4dS8wN0QydkFwR0xLV042ZHc0WHNLTEluNS90bUw5STQwRE9ZSmIwdnNU?=
 =?utf-8?B?QkN1MFVvSXV2Z1daV2U1Njl6UDFFeWdvMHNZNXhjblZzM3oyTU1oa2xsSWZV?=
 =?utf-8?B?d2pxWml4cjJsUnl6dko2TmIxK0ZZS1BPWWE4aHlZTXpoQzhhVkM4K2xVV1dH?=
 =?utf-8?B?YTUzeWx6aHExaUxYY1JMRnVJWjVxVE0zM0NtS3ZIMGE2TFNONE5nY01jbFhn?=
 =?utf-8?Q?4F2zziGXLzpGN5KZfMkc5fTD1+Ygqr4Q?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040b848a-f513-4d35-717a-08de953d085e
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 07:04:10.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUPR01MB13345


On 4/8/2026 12:01 AM, Icenowy Zheng wrote:
> The SG2042 MSI controller has one 32-bit doorbell register, and each bit
> corresponds to an interrupt. At a glance, it seems that the MSI
> controller can support 32 interrupts; however the PCI MSI capability
> only supports 16-bit messages, which makes the high 16 interrupts
> unusable in such way.
>
> Reduce the MSI count to 16 to prevent producing MSI message values that
> cannot fit 16-bit integers.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>   arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index 9fddf3f0b3b99..9f1820a7b5a9f 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -234,7 +234,7 @@ msi: msi-controller@7030010304 {
>   			reg-names = "clr", "doorbell";
>   			msi-controller;
>   			#msi-cells = <0>;
> -			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 32>;
> +			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 16>;
>   		};
>   
>   		rpgate: clock-controller@7030010368 {

LGTM.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Tested-by: Chen Wang <unicorn_wang@outlook.com> on Pioneerbox.

Thanks,

Chen


Hi, Han,

Will you please run some quick test on EVB boards, I have no such 
hardware in hand, thanks.


