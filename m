Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613790;
	b=txOxcP7kEB6mb5hzk2/XGetDjXeel0E2pf4cW/iIg7vzCk9TjCWxIDX1/S1CTlRsgTw+
	 fD8FMBNB2l0OFHbVxy6b/OQNVSerdW45ajfyDhNZChTzviOuk5NjgccR7RV+V68dG5Z8D
	 KVdl5xlQRf34vtFB6qXKhfgYjkU3XL57Clsu1YC7t09d8lFXGhSlgkvksGi+s9Y4d0L+S
	 rGdYXcCAHAj5caoOWCMAcy9jJAvwXpP6JwBhkedIsgTHfIr0yFoZloz9ngnIo4AVCj1en
	 x2XCiR/aMQLbYqoREvIpQu71S41/MA+HnInQKmFKfARM1Y6JjqRVWpV+aFKHneZ71pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613790;
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
	bh=IcGXDAgaJGyJj1AlkeSrS1Qj/NYAxGKpNRPpBA7Q2ss=;
	b=fB4AA82AZaMbd6Kr8rPFBLvnG3oZ5EhrRCjcG3YKvXwOo02szKBE6XhMLfOZaoTDakfW
	 3bEbcOmx3eWGCfsrunuScNvTRRnfCyVOIAN8rDQaMdmHirV1KbW0k0L7U41pKxVpBqbQl
	 F3UbNNf4T261Rh0wu40gwBCm9AyyFbyFGMec9E8yFtR0oi9Z1ObS3QYZGW7eI+wkVajst
	 pxRY8whMAt2XWlDyrTIqXgrdU6bP6/83Vb4//z/ynMwLHf+6ZL75Urh3/OI1DD500QInO
	 pvAz8s3HeTgvs0X7iPKxJBzswhGh//cSEvYrFW7PYXAywvRB05L5TSzB1kWlvbm5CxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ryElPHKw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.44
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B87606A326;
	Wed, 25 Nov 2026 13:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B87606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ryElPHKw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cub38eg+UXMyCAenDWbq1XlgTELGTgfpo+gakNY/xaO82Jmt1sPvOiMvb08Qt8uqiVaTcwnf/NF3izkQN6O50KJRny5ss8a67xy15TLgbdMv0RWP3kskJP089PCzaB1g7wyVNRScRWH/GCgQUDsXW6oe5HOKgr0SnJQzZ0gpGT0fBRZjMr05v5QfXWzya2+2rLXmBy/XcJiYflbsn7nw9dlWIcNgKqbcZB0rGordpHgfJnYIP8ek9Y4HO8Ys+703jyzN8IIqEP9aFUqjSxz7uTKdpkNAyp8fMxx3bS6EkgCiebUggbis7ABhelrocW+rC7Ydus43kRFXBgbZmyashA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcGXDAgaJGyJj1AlkeSrS1Qj/NYAxGKpNRPpBA7Q2ss=;
 b=fWwj6KHKnHNMGAtu1V3MTaMEHTjKv0EUxC4TJusvu9TDzJqR2QC7PHmBSwvC3LasSbu1EOsWOoPtRl6nTRRbr0ocPLqiz9HCx13tt/k25XO98fVPTli6S+MTV0yVcekKScflNNTIxrO/fLJOPY+pBFsmjvZ4d8MzdfoDIAnIMhJ4koTWB6ncrnkCFJj1JOrHgwyq7Jy/s493IVkNazzx9LdEIk3tGZvwkgZY7aZzdSuHGAo3F0Z3GeGO2hwXkQ03wgmFGM89idyN/RbbjrQNkl4izAXYJqdU0uGsRi9H+OhDCgdtts8276YvaxBpRKWPKgRpY0fTORtiPr4qCrCgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcGXDAgaJGyJj1AlkeSrS1Qj/NYAxGKpNRPpBA7Q2ss=;
 b=ryElPHKwc9uYNp9ajZqFXT4DdVzOodib/LId6SeoOUR6r0NIDWudarOXT4eIsxhcuDE3PgvyiVdHzbaIb4NXD8vqeMS8cdGvn7lqFXog9lcZf5KQRJTlFtquXkrSP1DmG8lp5XxbsuBu/EdB++TaFJzUZ6Le1RFIxt+dZAEXI2g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PR12MB052986.namprd12.prod.outlook.com (2603:10b6:8:47e::11)
 by CY3PR12MB9553.namprd12.prod.outlook.com (2603:10b6:930:109::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 13:36:19 +0000
Received: from DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48]) by DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48%3]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 13:36:19 +0000
Message-ID: <2887f65f-8fc3-4157-8598-b5cbe3cebda8@amd.com>
Date: Wed, 25 Nov 2026 14:36:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: zynqmp: dts: Drop incorrect #phy-cells from eth
 phy on KD240-revA
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <c3cca9923c2cb23ed17970f7ca12d597a7027142.1795097431.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <c3cca9923c2cb23ed17970f7ca12d597a7027142.1795097431.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To DS5PR12MB052986.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS5PR12MB052986:EE_|CY3PR12MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f38a05-e1df-49e2-5bf6-08df4af916a8
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006|261009223027099003|261021123027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IKIWmPBHCS+AUIGE39iPujdy+eRvTlDgbUZ46QoUaPbMWm5yz5uvXG8XFGgXHy77/Awl1CpQI3buf5yLp2H/gbVfsy0R9AHnW6mTW6gVy/c/SnHVLPUQfcmTZJcCZPHErkGUc0+8p6C9fcj6cZ8Ripjv/KfBm3I67hraPFT0hmWfZ8kDMSwnfopfZXc/34AYAGRRUrAWfmnK2pFTtnGaW5+nkTrc479F//FRj4nnFFe6TI2Sjk26mdeAOj4/tAa87pw8L+yX5riiyWzDY0u/8nDB8WjLu/s/f6VMUTldLKAFvXFATnNZZQ/WR/cOXKvkzQ9tdhzEL4MSDCBe6p28+S27xSlJOFIfDUyzBxiFiJEkKcAPYwr2bJTPHiqnzVPxu6mnKNZcZ6QfRUdJ1p1hAek8DDvuhmme50RruF7HrXLu377crrskGuDOrM6Nuk8Et/bWDqtt4M69yi8bFTkkQ9IhNPThw3cVLpo2+KzpAHcUNuscCfM6Svvs7pNZQLQzW5XbUx8MwnD5RcFQT02RgYY9H5mI6vTsC7Xob58Uz8qSbTArL2ZUJGOiuni5LLlmijZFbhdRuBqZpQfYaHdU3frzFINQ+CjoT2xnbctd1/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR12MB052986.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261021123027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFJtN1loTkRmTHZXY0t0cEpmdFBySjZJS25LelhscjUydVRZTU45eVNaa2t6?=
 =?utf-8?B?Z2FSSWhmaStSZVUxa1NuZEJNWkg1am9EVlZLVjVIZXk5QnRSZDRCTStBa2FI?=
 =?utf-8?B?U1Q0c2hNYm0rWE1pcklIdzNEUzZxazl2eisxdnNrUHdLeHJYcmltNHE4TlpF?=
 =?utf-8?B?MUhXMkRBV1ArcXlWNjZLa0FNaGFtUzBoc25rNTk3VEZ3bllYVzhwa3p5SDlC?=
 =?utf-8?B?QTJNUXcyWkxQeW96MVZOellKRmFvcjlzRmFZQlpNb2hTdVNTRDlNaHVadXdF?=
 =?utf-8?B?bFlWQnBQcmI5Nmh4YUJubmk5R3VCWkVBZXZWNS9PcS9YeHBzQWt6TmgyN0Nl?=
 =?utf-8?B?WTRpaW5QYTR6dE92UjlJZUtCbXpZUDNLRWxqYkthV01wR1ZlOEZYdkpTbU5w?=
 =?utf-8?B?VEp5NDBVTXVlOXVEQ2xzRjBYdm8yaWZqK2RzU3BISFVPbUxoSlFlSGJRZ0NW?=
 =?utf-8?B?WlZvOThKRVZrQnVRVHZ0SHArZmtVQjE2NEwzZE5mQUFlWUU2eGJ1eGhZVnhN?=
 =?utf-8?B?akZlZUw1cStoZmpPYkdjN21SZUtNakZTM1BCUjgwb1p3cSs0OXFvOG4xckRx?=
 =?utf-8?B?Q0krK1hwUUZkSFI3dE5DMm80OG5oNFJYM1JlRjF2SEtEUEhBOHBzR3VsSFVo?=
 =?utf-8?B?bUliMmNyNjNaVXVidlBsK2tXZTFUTUQzVTV4ZzZIVmxjVFlYajc5MVJDWXMz?=
 =?utf-8?B?ZUxTYkh0d1RlSmY4ejNmSWRCdVRqOWIrV1g5N1E2YVNjWmgvMHNxY01XRUFu?=
 =?utf-8?B?MVdDRTRla3djeTVEdERlN3NCZEhLVkk2WWltSlhNeUY0Q083SlBpVUZzazVD?=
 =?utf-8?B?TlBRMEUvbmU0ekpRZTgrRVhzUW9yamtmM3FaY1ZXNnNreC9zUHZvNFQ4b3d4?=
 =?utf-8?B?NFNFVHhsaVM1eHhpRUYzend6aDAzSSs2NXoxMklKWThDN0RJUFprTG5kaWcw?=
 =?utf-8?B?bFZ0ejR4d3dpSXAwakhORE9MV0J4SFZqTk5FVDM3WVFmTVE4b2QxSFRsajVi?=
 =?utf-8?B?dS9CWC92ajFrMlcwRlZlb1djU1ZXT1pnN0ZoMnUrNklPY3lnRGtjemFVd0lW?=
 =?utf-8?B?RklaaDduSXpmNTlVWEFzelV0bWlJdVVJSEdYV0ZyY0lOUTJqVTUzQ09kR05N?=
 =?utf-8?B?anJFc1FicjQzektPWU41eUd0VUhFSFNLVGxweHFobkR0aWNlcU9iSHBybGJp?=
 =?utf-8?B?L2t4c3UwanQ3TzlEL1ZKZkRlMEpHeFFvWmpxVjBFNCtkL000NXUybGI3S004?=
 =?utf-8?B?WlkxV0JsclJQTTJHbitOck8wT3F0TmRlUWtHZUJnS0hiUlNkNWNhMXpnNUp4?=
 =?utf-8?B?eFJGM2hCeVdpcVdJdlVFWlFNYWlmSDRQMGZiTnBoWE52WEJYdGdBK1R0NUxZ?=
 =?utf-8?B?UVBINDhoZmdXdjZxMTlsOThFS1FLMkl1TzFQbUg1ZHZyVklIMjRyN1BOeUJr?=
 =?utf-8?B?SWoramo4VHRFMUp0cTJzVUlRZVA3M2Y4ZzJYd3RWVTFaN0NnVXcrbDV6dExB?=
 =?utf-8?B?bGpYcE5lMWhKdXY3NkhnTGQ5WmRsNGxydWozb1g1bXd4M0FEWDZSVEZ1U0ZK?=
 =?utf-8?B?UDZHamxGK0swbEhETHkvblNFbHdsWDVlUzFoaVExbzF1OTRuemNBOEZhL3Zt?=
 =?utf-8?B?YS80QytVL252M2xPT2tPL1lTcXoxdGV0RWVIalprL0s2WWdkQkViV3U2UlM5?=
 =?utf-8?B?UmhnZWp4aGFsaE5IeC8vcEEvY3ZqaUhXeWpEdTdWRG5MYnl1QU9uaFpneDd4?=
 =?utf-8?B?ZmZ5NUtYRGlqY1VyTHN6R2NkQnZkc05NLytyYkxhTEUrd05CMVExbmJVVUNo?=
 =?utf-8?B?TWRJWmQ2THNxUVNXZXFmTzZCTVFMd1RVT3FjWU9OcGx5dEUyQi9lc0h1ckxT?=
 =?utf-8?B?QTlCZ3VSSVhTZk5LVU1vUERCZ2Jmc3phRm02SVhIbFZJaytZWU8vRnJjZjM0?=
 =?utf-8?B?bGxyS3JWV1R5bjBBaUxNV0p5M01zV1k0ZERUZTcrcUhKbGpIRTMwOEcrYUdt?=
 =?utf-8?B?ajI1MXZsKzB2TDNNaWtZeS9CblI1cEJ5K2lqcXhMU0RmSitycWFMUFI3UUs5?=
 =?utf-8?B?aDVRWUtJQUtURlVhZmZDL1NmbVVDWjRtNHZZdHc2bW1Ua3luL1BMaHlTd3Zo?=
 =?utf-8?B?eDdYWHVMUzg5NWxFcTlobUQrYWsxOG1ubzJPYmRza2lWR0lGdlBhbkxoZGtv?=
 =?utf-8?B?emlKOFFCNmg3Zi9Ock9WMVE4SnZ1NTdtNVBRWTJ0RGFNUlZ5VEoyUUYzOVdU?=
 =?utf-8?B?eW5NUmZPL2twYnNLalhQNk52RGpiTW9qK2t5MDl0OThNRExUczdqZnZ1WXJO?=
 =?utf-8?B?YTJ2R0xmSFJXbk03THZ6dzEyajhPWlY4UmRMSVlDL1NnRm9LUVpzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f38a05-e1df-49e2-5bf6-08df4af916a8
X-MS-Exchange-CrossTenant-AuthSource: DS5PR12MB052986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:36:19.8611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzUC89eZWZGyYwlLAiQnAzAwLr4sbn2CAqTV5NUh0pEaEgwRB9t6qlcVZByZ3ENT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553



On 11/19/26 15:10, Michal Simek wrote:
> The #phy-cells property is meant for generic PHY providers
> (Documentation/devicetree/bindings/phy/phy-bindings.txt) and is not a
> valid property for ethernet-phy nodes.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
> The same change was done here but KD240 was missing there.
> https://patch.msgid.link/20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de
> ---
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> index 23f6695d86b4..ffc14b1f871f 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> @@ -140,7 +140,6 @@ mdio: mdio {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		phy0: ethernet-phy@8 { /* Adin u31 */
> -			#phy-cells = <1>;
>   			compatible = "ethernet-phy-id0283.bc30";
>   			reg = <8>;
>   			adi,rx-internal-delay-ps = <2000>;
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> 

Applied.
M
