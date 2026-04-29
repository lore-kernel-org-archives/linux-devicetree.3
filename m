Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022102.outbound.protection.outlook.com [52.101.126.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C156439BFE7;
	Wed, 29 Apr 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445514; cv=fail; b=funEePPG0Ftx1zi5i6oAUk54HkzUTCoVDj7C6Vez6IL+duBEKEKiB/MOrfm5Ihz49s1EmWPmh5+lvkU1XFTMqcF231bRcpl8Eu7i1nhfpObOAjiUcv0D+eRMZCsE8jXrN1xHB6q+TOWa+hhCjRwLUpwo3XZWiuD9VTMh0WIdNAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445514; c=relaxed/simple;
	bh=AJ0CaMw8eGZ4sgoLcZ93COYPV5Zxlb81z5wOu7puAw8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tihNG1tc4x9gbM+gf4tBX8ASMKiEmtPPTq1mHZurt/4H/LQXnbXMauw7mEyE4+w4plxd7h1bfexX41TOxSJO5/YnqTbMOG94XDl2AW909M+O1Xqg+IqJURw+RNR70gNvAoNoXenElBx588YUgdHA+0+cGCJ87MbFCzxaF6sHShI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=52.101.126.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTxlGbtso8XmQoeXWyOO2SS20jexy+3C5yUX3C8hxSuSD+sWAIJ/Gfo+qvDMgwyoN9ukx4vmyKN4O071fAsMIxjmIvK8fF1zZ8mUtjBxe/I3u6YJZu9qjv3neljkF6bdlsCuIP23eAzy0JJ2B4nCXvd8N+maqIuJeM/NCfiJJ5gsVZk/uS4YVsN/XvgOm0q/aMKnfqjWJDO783ZWnYRhf9iN82vwCJDuvrJO+LRSmVXiejD/TOVEozieZjiLziCKgrBfLdi5vTpBypM/FeuH6m3VAuqeCWAWHR+C/j7HaFKMmxr7ntJdnnsOiIzmxRt3JedkvcjeCAEZBLjH6Y0RHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnG+Su4mi36z7ZqeYuBQwWIhH7+h/OyCVoa0eWg4gmk=;
 b=mKxDaG0iGalsMPZM/vbRVY1XfnqfaasAfAUW7gfkwKH4wsK7QXcps4yfj1ZSdWIH1c9voiPqml7dDVOXAHzE6f9yEGbMTSBfzGcntO86IdXRf++Bzrp5kzTvXjaZ5VrwyH2QdA8LW/uTLSahLTIK5G7qjBf2zHDeSYP0qL4GlB+V4U3pwnwkJHzJ2pW1J8w3tLLUP9bSKx00eNaAMYzi7EmpUqqgJtPf7tV3b4g0faOt2u4tMsZx3CRLUn9/T0yILAt5fL+DzN6vFmB32INixjwzCwuYzFFSH4AZotNG8g40Ktm5bPSKvvBzIaGDIhHRXFZ9f3XrQGv2ycxpREs8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB8488.apcprd03.prod.outlook.com (2603:1096:101:21c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Wed, 29 Apr
 2026 06:51:47 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:51:46 +0000
Message-ID: <50276dda-0610-4146-9224-e49f869685ac@wesion.com>
Date: Wed, 29 Apr 2026 14:51:42 +0800
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/6] arm64: dts: rockchip: Add Bluetooth support for Khadas
 Edge 2L
To: Heiko Stuebner <heiko@sntech.de>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com
References: <20260325054614.1497147-1-gray.huang@wesion.com>
 <20260325054614.1497147-7-gray.huang@wesion.com> <3716011.atdPhlSkOF@phil>
Content-Language: en-US
From: Gray Huang <gray.huang@wesion.com>
In-Reply-To: <3716011.atdPhlSkOF@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::14) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEZPR03MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8d8a5a-7940-47a0-0b85-08dea5bbc809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eqWUVthEFeR7Bm8gZwxEd/Jtn9YbZ702SWtBPp3LhFm9aNkvxGRT+tgX/m6EAw5gTs8Z3WQxtxTUfP+non0/XZ8RH5/O0VK+k3ixhukq0fo4m6wB+qGnQRrgzIbJdjxvTGLiF1wujGvTaKkvjoLiQ6vE4guOr5qUl/F64a5ZBAH2s83qyGu/HEiOQLAwGmdn517G1AAK258jFv1lGhNxZrr5F007KpHDnsi0UAhWXM39KDTn3UzP81VciMB+YPdcbZaYDVqep0AS3ME3YR2pmb5A/ij4hgvN2o0v+tCKT0DZm7g62jI+wCQuADBOJAfS6y/nk/FHFIiHga5v1jSi9phwhz2UnJjvPGNe+WXFyKOJ02kf+dt/xzsRewtSprvxkt+Q+wS135ATL59kugn+At22bDDWkkLrQi1r3Ijm7VJXPcfOs7ZZT0UxE8MIPmjbYDsS5FCblLpEDMREeozmyvwA/DpGuOmojSZYPe9uCEPFZZR/auS48upfahye/yimZp4azKX+z67gX/wS0szBNgardo4pH36uWcaJUU9YHhdHRjHxHy/lA47GG0L/Fbvzsk8E88jYG94afkgs7D20BVLhr8cmJnlUylQTiizb02qvW3IntSvuO64DNwmLewJrErEMwGztjVhLCp/9bY9hJ5DjrxJstLlPJPhwI2IQXU06O+U0rKNnfQU+zWGWdCKQJ6nhBl7hI3bQ9QE3Om5S20i4ICm4Fbp+igeZjQUIYs4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWtMbmtZNHJkUW1MSUZVMHhqSmdWV2dUTGV6SmlwVFN5Y1lkaXdEL0Y1R1JR?=
 =?utf-8?B?bXdJUU53Z1lwdytJc2R4SWRHWFVKbG5lYWt4YzhlQzJHTEhiZVZYWWR6ejkz?=
 =?utf-8?B?cjlQa0FzTGw3cW5nTUlJZHdmb0FmVC9hcG02MkJ4Nzl6RmFUTk9Nby96V2dB?=
 =?utf-8?B?V0s0cEFtbjFhb1JXRUpRRVRNK2hVUG9RSndKMTJ3UksvTVNseWxaWVhWRjhZ?=
 =?utf-8?B?RlpGZ1k1Q2lhVUdRbUdRbFJKalJNWmZ6OVNlUlZSalYzQmV0TEROZXorVllD?=
 =?utf-8?B?YmZmeHl0cG03WXBtbkozbW1nemFqOXk3YklaaEJpcVpZYTArQjBJbG15WmpH?=
 =?utf-8?B?NEkyc2FyVzNqN1lnSDl5dk9DMWRpUDUxb3BZMkRRR1ZnUGRucUNiSTY3VUdq?=
 =?utf-8?B?L1VhOExpL25seWVja0FBcU9obTluZHFyLzR4VnRHZ21HamEzeFlBOURBWk50?=
 =?utf-8?B?OTNibVgzOU5BZWFkcFdod00wcVRPWEgyN0lCcGV5SmJLTjVCajRUcmRZQm4w?=
 =?utf-8?B?N21ydmV5MDMrRzF3NWZvcWN6dzcxc015RGpiSHlxR3A5SjloZDVnZHJTQktL?=
 =?utf-8?B?d05lMjgvRHBNMktmbUdqc0VaRFhibzg0SFpCMGIraWM1K09sZ2ljYnJnSlBh?=
 =?utf-8?B?bllxM3JiR2VoQVdIa2dqWEJuZGhLNWUzWFJWejJWVVk0Rkd2b0JMMmpDWUZw?=
 =?utf-8?B?emJ0eEpYNDRIb1doa2NnQnFiRHNCT3pBYmVJWGdOTTZRSzhBWjJnY3FNckxa?=
 =?utf-8?B?RGg2UVM5UWtzUVFNNGJIM0swTlFPSnR5VldOSWsrbi9FdTdqM0doYjNuekZX?=
 =?utf-8?B?T0Q1TUpwUktMOUN5cEVRU25mNjlVSEFvZ2IzS2VFaW03OWtIcGQ5NjZCRkRv?=
 =?utf-8?B?Mml2T3FYaElCRlFOcGNTNVNzdDdpOWFGa0ZLTHdBMk5KNzhtdTN3TXBHbndN?=
 =?utf-8?B?T2I5ejB6T051NStmWVVCUnFaQVZsTmw0Rk54RzlKVjdzWkR5YXJHa093ME9R?=
 =?utf-8?B?RFBSL0E4V0ZzL3NtQWRTTElTSElLMHp4MThkbTNCY3dxNWR5VHpCakloemYw?=
 =?utf-8?B?Rk9JRkhuNyt0UGg1NlZ2SEJkRlRWWmxyNEpKaWNxZy9XUDFDOVBzdDdvWld3?=
 =?utf-8?B?a3BqdGxpSkpSeFdMSTQ1aDNQNzdETlF2UVFtdG5meXVPT1pKVmw4c0toVlhV?=
 =?utf-8?B?NitIOS9Kcm5jVWdhTWhQS1JpWSthSXNJKzFYVXYydXArZUwvVmszeFdkTkl0?=
 =?utf-8?B?TDM3R1QzbGRYcWttdVd6c21DajRqRmNpemJsdDFxV3FTcTR2alIwTXd6TURZ?=
 =?utf-8?B?M3ZIbVJhUzNOeW9xVFlnTkd3UWhWZGhsSGl0eG5sZGtoNXpKeTJ6NndkVkpJ?=
 =?utf-8?B?UTVEOWFpcDZ5ekZQd01KcTMxbmd0V3h5M256Ylp5dDNOZWh0NUp0RXpsVjk3?=
 =?utf-8?B?QWZDNE8vY0JoeEFacGIzZ1N4NHVmV1A4T2xBZGdZdmIwd1RZOFFzVWhkYjY2?=
 =?utf-8?B?VjF4czdad0JDMnNmQmJpR05zSCtjWDRrbnRmY3M4dURYZmxTOVBrNkhHa0NJ?=
 =?utf-8?B?ZUQyRVFIajA0RGNzV3FUa0Q5VGtIdnZCTHZwVnJibXk1WGRiUWYxQUpFdDFJ?=
 =?utf-8?B?cmRkVlhuWHgzYWN5NVhOZ1dHQ29nMkMvaUtVUFEwemI1bmdnYWJxVjduczNw?=
 =?utf-8?B?QlFrRklURkJlR2VpWFhrMGNTUnVFbEk5SWtyOWMzTit3SmRHMTVGYVg2SUMx?=
 =?utf-8?B?RWNZWjA2TW1KcjRDTHQzdk9zWkRMU21rUW1tTW9iZXBPVkFoVnJJdG4zd0VW?=
 =?utf-8?B?R1dwUmpIRHhjWE5wOW9zU0xVK2xLVWJ0TGozT21TQjUwMlhZeXFDTFMyWndM?=
 =?utf-8?B?cFh1Ym9pRWJJdVN4eHlHSEVjTk41YnB0UVhPYmM4R2FqMEtVRzhPVlpEL0xl?=
 =?utf-8?B?NmZYTy9vak9JdEZNakUxemsraVhOLzZ2SGFCNDlPTGRtblc3MUg4c0JyN1Qv?=
 =?utf-8?B?b3dVNi92b3lLTitRMWp6OXlydjZUWDV1ajd5am5uMkNZSDZmdTFiYzB1bUFs?=
 =?utf-8?B?WmtpYlJLcmxyNE51cGN3dGdPVjFjTThMSTYra2RhSHV5T2IwaEZYWDQwNDZ6?=
 =?utf-8?B?UE1NVnZpN3ZSdUZMeDlpQjRieVdlRUJzZUNiV0VxbmJndXBwQUR0V052emVN?=
 =?utf-8?B?TEVRV2NBTzhnMWpFU1RPZWtoeHY3dHAybk9GbGpuTWR1RGs5Uk85V0UrNGVw?=
 =?utf-8?B?OVN2Zk1RZzFGYzRBZWQrZDNJNkRydlN6MG01bDVhbnFQTGtTdW9RanpXek5k?=
 =?utf-8?B?Q0I4SUYvMytUeTAxeE5yTFBwT1dPdXRnNm1SNWZXNXVQVklxejFQQT09?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8d8a5a-7940-47a0-0b85-08dea5bbc809
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:51:46.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+rMQdrXD6K4yIbLRF1iIR4NaGwHG31ieeaPXQUYhPurZz9KH/y4OUyY0CyeLAqhCj/xBYJTqqPEysxJspY3QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8488


On 4/27/26 20:27, Heiko Stuebner wrote:
> Am Mittwoch, 25. März 2026, 06:46:14 Mitteleuropäische Sommerzeit schrieb Gray Huang:
>> Enable Bluetooth support for the Ampak AP6275P module on the
>> Khadas Edge 2L. This involves enabling the UART5 interface for
>> HCI communication and defining the required regulators and
>> power-sequence pins.
>>
>> Signed-off-by: Gray Huang <gray.huang@wesion.com>
>> ---
>>   .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 35 +++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
>> index 8ecd00f6645d..345dc4c981c1 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
>> @@ -560,6 +560,20 @@ usb_host_pwren: usb-host-pwren {
>>   		};
>>   	};
>>   
>> +	bluetooth {
>> +		bt_reg_on: bt-reg-on {
>> +			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +
>> +		bt_wake_host: bt-wake-host {
>> +			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
>> +		};
>> +
>> +		host_wake_bt: host-wake-bt {
>> +			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
> same sorting problem with bluetooth between usb-foo and wifi-foo.
>
>> +
>>   	wifi {
>>   		wifi_reg_on: wifi-reg-on {
>>   			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
> Heiko

Has been sorted alphabetically in patch of v2.

Gray

