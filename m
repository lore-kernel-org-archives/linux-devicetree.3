Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E81358391;
	Tue, 28 Apr 2026 15:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388991; cv=fail; b=kxotfWRLuzFcQYloeWTN1Vo+YvsxlS+k+rXyWLIeqsoCrCfylctuPKSQGo40R/Q2+u1/4c1DWCtpdNiAuh3r09EstsHAWAPbYQWkkuXb94qA5trNuFJg8Gz9KNSC6YChuG74iO45LLuYdCs0iyKuyV68P6MV6/lwFykflw4iBfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388991; c=relaxed/simple;
	bh=5cQuDjhy5xiixscJexDslqJHsC5/6YwWGqBYFjqp/n0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hn2R1KdYkRIYCM36PXyoQbNDF+vR8u3vncUFi4xH7N2Z+n8NlNCT/JCF7J31sGXE4X4BFEV910rMUxpM2686vbvzGWmGRJgOUFgMsGqwJXnwhvZ9nNiSQgdIT8bDZkuzERxrk363CrLwVxzPa0E+F4X3j2WFI3dSnwnbJVpSB8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VRrMPWgl; arc=fail smtp.client-ip=52.101.193.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VRrMPWgl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3prjf2hHwYFA6o6lj+qGXLxVZOF9sDxp7Qysj+4ywpXM9bk8oYZ3o3dYSRYE8AOq9oDxadZB9nabz3NDXzP3anTMXlTmIRa8TVUuW7SAJwh85UcXOssYNR3CzJemKcaadT25t67GR/SgWUerYW0PXZi1bj2NS0xhF0fD6ucK9tlFywi8e4CtfeHUGc2cvj0bkrX/4AYVCnnbbrYEA9FmwHC2AiZ4tvShQAkq7ZmXYWra9JYtkScEVlyLGOcQdwsDldXVz4696RDAgiNB7aKxmkbpfP4xaO5vGtXYbhhY7mMuvL65mybqh1Lck5jANSX0+p71RwvaJFbMdLtfMWUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCumSf6nuPQFSfWA3Bz9OKHTGeqoeCqn3v0+mjJ5XrE=;
 b=ZCcOtp0B9nb44a4zfgjYc7Gczd5xRszrPwAkILzGNvQZ1s74bdkJHDN7z2LPDoOsw+WJx3W0V9YBdL5Efs9x0piEu85VpoPrPXd4Tr4rd70mG9TCbM1NT6tn9aaJSovaIu8YNiyxcbaKsyUcQikxELza2dM2YgoN3+Gusz2+RT/7wZU5XqQk2iLiOtDPIMGjr7rzorJWQjNMQWT3ubYOSQlHmgwEFJxwwg9K0CSXeXRlK5X6HucahxGPPga9iUq+3f4V6TG0dUfz/T6e9YaafoteY6gIvnAOUmdhoWJE3nI19GRQSFDFxam2ntvB6C7s6iSrSg57aAa5Qrixn0goMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCumSf6nuPQFSfWA3Bz9OKHTGeqoeCqn3v0+mjJ5XrE=;
 b=VRrMPWglM8LPVbaUeLpjFXR0lA8Yf2NkgyZSnI6j14HqiJS5i9rN2WlGOZw7Wq8hW/vngBiJZt6HBMty/W0ZL7ldpvwoVdoyD4K4GAldl6j80Qc1Zheu0YDWPHE4wSDad2hFnqnkvm6Y9XteVv+GBoLn0Cg+L54ApGgVa/zoPWfzM1EZSwdjDIg/KyKkNXTiTQi6cc0YEkk5EqLx9mTz3G3D9HlyTilL/fuuR04mGQupaOiZB0ch8KWQx242131GbiqW5mvtvGyE13GEpBY8s/yKSWZ0D9SGSO3WBZ+mn46WsudruLgiaBSlxtowhj4H/9oqEs+OuliUf/iski5lZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6208.namprd03.prod.outlook.com (2603:10b6:5:39c::19)
 by SJ0PR03MB5725.namprd03.prod.outlook.com (2603:10b6:a03:2ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Tue, 28 Apr
 2026 15:09:43 +0000
Received: from DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04]) by DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 15:09:42 +0000
Message-ID: <ddc1d4a3-0287-4a57-b3dd-8a9260da05f3@altera.com>
Date: Tue, 28 Apr 2026 20:39:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: reset: altr: add COMBOPHY_RESET for Agilex5
To: Dinh Nguyen <dinguyen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260428092615.29681-1-tanmay.kathpalia@altera.com>
 <96705fc3-332e-4bd1-acb9-7494ca83e070@kernel.org>
Content-Language: en-US
From: "Kathpalia, Tanmay" <tanmay.kathpalia@altera.com>
In-Reply-To: <96705fc3-332e-4bd1-acb9-7494ca83e070@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::6) To DM4PR03MB6208.namprd03.prod.outlook.com
 (2603:10b6:5:39c::19)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6208:EE_|SJ0PR03MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d2e5f4-b742-4ba8-c89c-08dea5382c36
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	E0lulKRUyKzJgOLtBzGyJ4w8b+eGwjZGztUcdC1yuGp4OhLK/yuCEQI+WqPrxxM5hK+dfBzBpTyJRbZefr4CmT3va62moVkU7hHh2vd4eehLnntihGhFlOpKMbPbKiWy2lT0lKXH85z/y9kIqwX3Cz0BIbqUuqMKrpe0iQvxvcimmFrOaBgOuCgL+SDJ/0IN5FGSX6H22hADtPBbMOjGnjyjqMrVEebLUE1pdoz3+evPjYFgZzZrIti2oNWPmijQIXsuElkKEvmznKma1nG98LgpWxSbELn3hWawukwXuxg30nB4GpBjsJl8UxYKInhoXMpLsvbgxsp7mzUgLBgJzIZ8IxSGnde9MhJj8hhcNd85/C5TLWhkYiv1Ax0AR6zKvoorzP74zscA7GMpOEptnQDN5d2uFqrbOG++VIV3prbWkCY23PvIC7SHw4VURHDgmJdT+UjQa0d0Sj9PM1CQM7znkkgwqneb1MLeAcbDvAHIswTDf5UdYYYI0wLc6LRBgY/fDAqwstTWUSJJrvtJQktBT/wxDyvOXHP221xcMKwrTCc5feaYltGoKkbAQQMKO4jJqY7vt8sNGOdv/vpuM3Kp66D4LzexGcePg1yOYZOoldthRCu5rWypMCFDlCsu4+q+cYn3w7iKKLcW5OH1H6VKYykFAkxjPPJEpKCBm0ZsQXbU2+9r1p1HhToac5zmPln/bDOwCEDSwQlOX51p6qTG1+7du0Hg3wBygsMFF6M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6208.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRmM21iUERNdTlQL285S0sxZU1mbHZtVHF1UnlzZHRDRkNHVXR1Zjc4V2VQ?=
 =?utf-8?B?bWxhSUdXNTNkM054SVpLQ29lREM4OFNHU2dHSTE2UmpVYnRWNG9DR2ZUQXpK?=
 =?utf-8?B?MWhNRm9MNVJCQWtVV1N1VUNzVlNSSzY2WWNnRUNEa3ZZMGo4NHpCOVhQUUd2?=
 =?utf-8?B?T0RWaHh2TzFrOWd1R3lnU25BV3RuNmNFNlR5UldFY2pkSHdDWkpXL0g3Q1h5?=
 =?utf-8?B?Znhqd08xa3hjYStCQ0hkUGR5dVdvcFhja0JXbE8zdko1RnZNU2ppZC9aVHZR?=
 =?utf-8?B?UTFmeW9iUW9ValB6TE5MSVlxMnVCVVVUTFB5YXdBVlpGRmM1UStmb3FPV3VK?=
 =?utf-8?B?YnZFTFpRTHZXKzVhSjZnMXo0WTE1cTZwTy9NTDRkc0VlQjNhTGdWSnVtc0ZE?=
 =?utf-8?B?OURGdDNGQWpWQTBQNmN4ZkxzZTFBRWo4UUcvMDdESnpnWkFxTDZLUWZ2b3U4?=
 =?utf-8?B?TmtuVTVVeUpENHBmeWxqVW81Rjh0MGNDeW9DQ29ENmR3MzRpS3FSaVd2Y0JI?=
 =?utf-8?B?bzNhTHVxdTlQRU15OEttZXRuVU91T2RhNC83Y0R4Z3A1NGN6UDUyNXEwbHl6?=
 =?utf-8?B?QnBkYkxFUWMvdlhYRFdNSWlRNHlRbmlMZ0lPNUpINTlORGlXYUdwdzJ1NFVK?=
 =?utf-8?B?elZOTnNPYkx6WmFOWFRvQnhJMTRNNFlNNUYvazRaQjlPZFlIQVd3V3R4RHlv?=
 =?utf-8?B?WFJ2Rm1YdWdPUlBJTnlscHJMVXFlMDdVd2k5MSt3bituM0l2dWpwM21KaDND?=
 =?utf-8?B?bVVBYzY5TVdxVERaQnFiSVIrMkJqcE1LdUhHaTYxdjU0eEVHY3JLWVdhRmVq?=
 =?utf-8?B?UVdSSEFiUkt0bG1ZcGF5c1Z2MjNMVjZKSEFTcElNbW5xU1hLREt3T0ZwZW1l?=
 =?utf-8?B?T1Q4bUZScys0V0FoUWdJaUpJbmNKcGhwbzAyN0lLUmFLVWZ2MWh5UytsekJj?=
 =?utf-8?B?cVFlR04zUlVoSm9Sa1lWTEF2M2JLVW13MjlmMGpnU0pNSjBBVFdjeFpONjBu?=
 =?utf-8?B?VTRlV3NmOFNhRGJISXJESmg3UDlXaWFERzBqWStQSTFUZFdoRGdrZG4vaGxn?=
 =?utf-8?B?bFRpOUdqZ3M4MitQR0hWSXNNQnNxRlF0VXI0d3pFRmo4RDNlczk0Vmo1Vk1Y?=
 =?utf-8?B?U2NHYS84WnNXajFnM1IzR21haDQ5cEFtS2l5SGs3YTVsVjFYYXY4bllEa0xP?=
 =?utf-8?B?UHZaYzZ4VDFTVFhLb1FJNWJHV0o3MUNQblpKTVkrVU9wRGJobTdleXFuL3hv?=
 =?utf-8?B?MlgrNjl2T2ovR3NzUHp2Uzc1U0d3MmthYU5KN0d2eSt6U3psMDlyRGtheDdj?=
 =?utf-8?B?N3FNNWlkZXdoL0JWaXNaS243eHVKaVdqUGVpRGtPRDBCWFVmbythQkpKY24x?=
 =?utf-8?B?SmR0RUpUZVhFQXJkc3lHNkJPUGRIRFRUTXdYL2FOOFluazFKL1R3MVNjdFVN?=
 =?utf-8?B?aE5NcE4rSG9oaXNldCtCVy9CVzdZWXpZcjkwQm9hL1ZrZCtwd1VjeHJUVVZN?=
 =?utf-8?B?a1k1NUFMTmxqVU41UmRrSkZjdGs4dzRZeGRYWlNCdGY2cFBBSEVaYnVVcGxx?=
 =?utf-8?B?WktRKzhnU0V0ZGEwNnAwMDN2emJxSkgwMllHTGthKzV2d2xSWkthOXp4RWRr?=
 =?utf-8?B?TkdCTWFFT1E0NnU1aThqczJEY0ZjWDRra2pxSmdTblN1S3U3ZmMxMXJUdjVZ?=
 =?utf-8?B?ajh2RzZyaVV0MHpJOXhocFMvTW1mdUR0K1UwdUlaL0x0VDBuQzE2ZGdiaGoz?=
 =?utf-8?B?cmJJekFhUDlHM3I4VVpwU1ZtT3BRSGVyaG52U3B4enpPZEw0R1FlWFpUR3A4?=
 =?utf-8?B?YzhqZG9nOWZQZmdQNmVKbVpBeHBtUkxncXZOT28vSm1RSUVLazA0eWNiRUEx?=
 =?utf-8?B?azc4bW5lbmhNRjFwdWFtbGlrN1l6bHQ5aXNVWlNrU2gvZWNaQzZuazU1S1pE?=
 =?utf-8?B?UXgzUmFYN1ZnMU9DNzdtTVVrUDQyeUZzU2VOZVFoclRacVhEMDcxK2FZZG9U?=
 =?utf-8?B?SFZJQW5EQzRpRWVpbk5sY0FUZmdzN1FYVGVvbGZlVmdkVnEraU96VVlCNlIw?=
 =?utf-8?B?cGJOcHFoUjhta1ZvUjh2blY1ZUdxbHh0cmFxUXNYR3dEeWNOR0x6UEsxQjdX?=
 =?utf-8?B?TFdyUHBUcWVZRXhmTUpEaDFFd3g2QzBTczhYcXFETUxvVnA0ZjRFY2U0YWFa?=
 =?utf-8?B?Mk5ScDJzaWxUaVdPOXljU3Z0TkFjOVJnVWdBb2E3eFFPOVhkbUx4eHdONURz?=
 =?utf-8?B?dnNBSkFyME05ck1LbHJJcFN4ajBMaFdGSjdqK2tTOVJrMkFSYmo3OGdkMnVY?=
 =?utf-8?B?dUxNdmk0TE92OW9JQ05pZDRyMERaNS81K1BGZ3lacFdjeEZ2YmZhZUs4Wk95?=
 =?utf-8?Q?YAeCSeP75kBsUdHg=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d2e5f4-b742-4ba8-c89c-08dea5382c36
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6208.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:09:41.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbrDglawY64WFPfNxTI/5kY8cK7WdYP8H44JM0hjG5cMp2uJFehKygjwMKIN4ViwypxfPFJ5Lmi9lo/B60NaJ57CFm1JspTNVmL8A3ZYMBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5725

Hi Dinh,

On 4/28/2026 6:02 PM, Dinh Nguyen wrote:
> Hi Tanmay
>
> On 4/28/26 04:26, Tanmay Kathpalia wrote:
>> Add COMBOPHY_RESET definition at index 38 for the combo PHY reset
>> control on Altera Agilex5 SoCs. This reset is used by peripherals
>> such as the SD/eMMC controller that share the combo PHY.
>>
>> Signed-off-by: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
>> ---
>>   include/dt-bindings/reset/altr,rst-mgr-s10.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/reset/altr,rst-mgr-s10.h 
>> b/include/dt-bindings/reset/altr,rst-mgr-s10.h
>> index 04c4d0c6fd34..c2505b9eb63e 100644
>> --- a/include/dt-bindings/reset/altr,rst-mgr-s10.h
>> +++ b/include/dt-bindings/reset/altr,rst-mgr-s10.h
>> @@ -22,7 +22,7 @@
>>   #define USB0_RESET        35
>>   #define USB1_RESET        36
>>   #define NAND_RESET        37
>> -/* 38 is empty */
>> +#define COMBOPHY_RESET        38
>>   #define SDMMC_RESET        39
>>   #define EMAC0_OCP_RESET        40
>>   #define EMAC1_OCP_RESET        41
>
> Please include the patch(es) that will make use of this change.
>

Thanks for the feedback, I will incorporate this patch as part of
the driver series

Regards,
Tanmay

