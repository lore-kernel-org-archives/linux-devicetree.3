Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751683BFAF0;
	Mon, 20 Jul 2026 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533311; cv=fail; b=oOIWVmJfv7R7bywYsFiEtGvrWZ+N/5A289mz4noWvWYARJlmUOCTYZ31AdfLHm9MFhwme+40o6P3yFHigX3F004FT01owKeBCJanMxMM34mpXPbjUMqXy1XKnhq8DeCXWIh1WAcYAkT1PFZaZsTc1NtfdW8rWk8WfTwJzSs+Fpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533311; c=relaxed/simple;
	bh=/fw+ChvdI6AZDIK3s/b7stTW7TSIGbzYISYWFqSkfHY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oPBop3zuCtpC9h82Moai5arpKG4Kb8dcjAsfMBPzNNnSMKFr9lxmDZsCuJH1Yrx0g2AfMj4DEFxSQocz1mT6huwgKYBVN+yX9sPitorRV9TPUKv8wYKTO6Us1zWDa5C7ZsG/N6gp3CutZG8byLwuffgjY62AmQRNw2EYvfOOi6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UnOo4elm; arc=fail smtp.client-ip=40.93.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UnOo4elm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMI/94ql0wI5ziW7oyfzI4WClKhUvNllblEHUj+FxvAD9ER0M0r+g3nEXGcBVDJJZN3jChqn6G5qcFZQ61Q8oM2/YFqC2YkWdV42KjkJYJUM+nwBJYWWmDTe6qs6C9Tm7ZFYKTt7N8CO+/mOk90L90L2OVUWekOPkb3tM73aPmj335s/rmRbS+FYPxH0LGqkbORSgDsfYp0XenktUpbdVZZxHAmLHEIxvAMuDzYwakyuEeP6BDsrbkED9ZW6ilkVz+D7LVEtsMhVDSvRRksuVf9bby9QIJdogR4QOnrKSHAbwsg3NhL5qwBPRPDv4PMyZTCzSTZG2rpAuMBeex4R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4IyTuQ6utoZnHFaRXcWgTdGqaNWZ5Rh7yIldRw/XW8=;
 b=MHXA5DQOp0+NFL/m3mnnan+/HEE0BXO1MKKw7xzKEFhaZJg9VETAtY9jxM4KKQSE3squZ7IGct/qtraCzX8/e3jAbKBYXNdmnU2R6mFa7TFb+kLV+vuOpRfY3nA99QzsZwaZuBfKduS6fYN+V4gVIk/fvR5e3+7fYmuOx7LvSxEGvJlMsqVeObd27Unaxy9l5+e0d7bXImS+fGU9qQ5bExOWGBX60NihAqwLrWPFWBLN/4qc8ZM77A0ZHPgwaBi8qqPPfYwmCIzY0ZrnXoB0v2bE3OUvIsxGKXkqWae1b9VVqTq+j2ThWjjdO+S9H4AZMkP4TyvbnsM1tzM0559Q/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4IyTuQ6utoZnHFaRXcWgTdGqaNWZ5Rh7yIldRw/XW8=;
 b=UnOo4elmRcfWdXgnWNJmksWKvndGO8DXJ5/BDzBA8XcEW8zEhZikO4GAWxKCv0yrGTuEz0MOVFnQvw66K2aN+zqHrIic9Ujrbx0ceNPLYMnsUpCkmBcUwb8JOMpZJ5O1CLtpWqBNzLD4/Iuzog1PuNe+igSDg0e4xZxxrZRQO30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM4PR12MB7574.namprd12.prod.outlook.com (2603:10b6:8:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 07:41:43 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0223.011; Mon, 20 Jul 2026
 07:41:43 +0000
Message-ID: <76e27688-1a3d-4cd8-b3b7-58c47f92b8a1@amd.com>
Date: Mon, 20 Jul 2026 13:11:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i3c: master: dw: Drop redundant core reset name
To: Shubham Patil <shubhamsanjay.patil@amd.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, michal.simek@amd.com,
 radhey.shyam.pandey@amd.com
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ba::8) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a76105e-951d-4f15-3cc0-08dee63257ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ddrTID4jQqvczf3+POmllrUcsxTkZdOSZtOMfuGowYD1j8WodtZD/YYXGCfQXZy+KJQ6AVLAdGJSFYYI2U0VH/E8GewjApBtUjtOMP8ynVpE/fpTX47T4HIw7FRb+fez2iKCyL3PIG+lMPww9cys6xX5p28MKcjmQ7kOTOt0EvXyftY34gAO3I3o2qExPJNh5E0NjnFZ/k5LFEzMPVRS2Pn8q0kgCCkq/UEEhd5Eln0PDvoTfq+Cy449Yb9SNmIO8Hj+nxk0pebjn7FSMMCrA7FxTNpz6sy5APwTv7Gl9iYPmCVN1Xr5g43NE9OF7GON9utGx2v1SyEUbJIq3BwaewSrEbBi+BJxFRk6/EwA6zwQUMZuAlepuWZzJpkDC23QsAhLS81fmCnMcVxt95zSaUu6gjTtSqC+dh2hnPonnkPxRVPJSrfmcgI0dbTdOEjWskL5kbEIMaHn8N7PuEYTWFgyf5NKOok7mKQsl6WJ7nGtNdqWIJQ7nZcsjgr2jyx6Hv2RWeXYycbT2PB5nRONFioKxEJACQM+a/dVPG5mCXsYFryJRBXCVrUZ19Kir98yaCmNUrh0eRqTpALRlmhfpju6hdkP1SamhRP6/z69NzVPHvLvYVMxTLqT1/cMtbkpDCUwMbYsRdZgtO+H+4lz87wdTNuYg6Lqz1KcpcgWXRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEgrNjJHL2I3akN1VUhwZzBraE9CbHdkNlFvdjAydmRiV0ZjOTc2K005YUpR?=
 =?utf-8?B?bnRpWUR1OU10T1p1bVZGV2FCMitzRXNKK29lYzNXajJTdEN4NEQ4SWhTU0Zm?=
 =?utf-8?B?ckVFaGgxWmMyOTY3TnpEQjM5RXVnZUVvS3FtOXlSOXI4Y3FnOGVaYXJHWVRY?=
 =?utf-8?B?ODBCdnZqTFJtSXpYYjFhemlYZDdBUW1WanRNSFJyczRTUXJuVHk4U3lvUHc0?=
 =?utf-8?B?cmY2U28yTVZITENvV1FIaW5mdXA4QUlHYUlyWndmTUxKbDlWMVVHWUxNV2Jt?=
 =?utf-8?B?VnlkeWh0Y2ZObkFSVDllbEtOVWVYWGRxSzh3R0tUR21mTUdUdXNHQ3o3VTFq?=
 =?utf-8?B?bUVYWXpWZEdCT2cveTNYK1REYXVOU1VqUEdPRHFjUVhXTFJvb21vNGF1RXFG?=
 =?utf-8?B?ai9sK0JXajlUVWZlM0dQc3JUc3V2d2VtQmNNN3ErODRyRk5jQTZidkljajZp?=
 =?utf-8?B?dU9iV2RXUEI5aVlCZ01qVGNhM21kK2ZOQVlIWW0xaEcvb3NKRjV1eHVUUWJm?=
 =?utf-8?B?T21LMkxidmhuUDF3bjdFOFIvdWpWM1N5eHJid1hFanQvY3hTTkc0cUtlQzZT?=
 =?utf-8?B?SlRlWUNFOVlBZ2dGbEM1Q1p5UWRlUHAzeFBsQUJ4N3pRbCtydVBRTDZteU04?=
 =?utf-8?B?TmMzQ0x5YUtzeVFDcE1UVFYrV2NKNkd4RU00V3dJRVFoUUFxYVJHQTdTb2h3?=
 =?utf-8?B?a3NMRjIwVndvUzBZVG9Bei8vRmhNQW9RT3JRMGwyeHdkWTNXVEtMSm0zNDU3?=
 =?utf-8?B?NVlOS0YwakNVTDh6WWlnZGduY1BxWmZ6ajlISFhxUUQ3dnFHcm9jNE9kWGs5?=
 =?utf-8?B?SFpjeVdRQlNOMVNiYmYvc2VnWGxXMzBlV0h1bDI5LzVhQkN5RHp3T0pKUDB0?=
 =?utf-8?B?b0YxQzhMRXkraWVmSFRsZFBldGk4YnJ2Y1BsSDR6L1dja2IwVlM3QW5kUU9s?=
 =?utf-8?B?dGxES3VqUUlJR1M3VTNJUWhTNVluY1hDRkh1SHdpN012VTE1MWI0ay95eEhx?=
 =?utf-8?B?UWJmcjhvcTlTeXlMNzNnT050TVBDMmYrcmtsOWNCUlNWc0JhUXAwNHdxL05G?=
 =?utf-8?B?MVNzWFFhWmJWSis4WWdnRkVxdFlBcVhVb0ErRzAvMFNlRmNxMlMwQzBUdUNG?=
 =?utf-8?B?bG1HN3dtOUZqN2w0UUpOZ0lPeHdnM3hmOE1DR1JKTldPN3FHVStXdkkwbGt1?=
 =?utf-8?B?TkV0Yk5VenhoNTJmWnAyMGRnNjBCbmplbjY5Z2F6akUvS2pjTmxLSjBWaFpr?=
 =?utf-8?B?ZW9YVEsxcXVQZDQvaWpUcVV4K2xKWGxqMmlPZjlPa2pJWTFqaG1HcVNUK2RQ?=
 =?utf-8?B?Q1hQWGN4d3VWRzlWRUpBdUg0VTg4K2pUWXBCY0xLd0VEbWlUV3N2VjlybmJw?=
 =?utf-8?B?bmRlaWxaSGVVTkZscXcvRHlObW5rTkhzTXVkS0JhaURhbWxQcmw0anQ5VU1S?=
 =?utf-8?B?YzRjQjJqNUxjOVRJZzBYVXkzSGMxeVJHcHVkdUR3WUtSV1pURUZxbyt3RC9X?=
 =?utf-8?B?elNiTUdUWkYxYkZLTVo2U0xoOWh5MXZlbUtPVStaN0p0Y2RXSlZ6Z0ROZjlT?=
 =?utf-8?B?dzJ3MXF1S2lWN1c1YnpxWTB2UDBXYm5aMnRZYTRqNkMvSVVoS0JnRHhPUU9o?=
 =?utf-8?B?ZDczK2dhKzlDb3J1ek5RdTJqM2lSL3FGZTJvd3V3ZWZFbWRocnFmcGJEYVNQ?=
 =?utf-8?B?NHltMzcrbjRGcFNMYUQwSDVvUnBKYy9tdVBUTkJmYnU2RXNMaG1LTTI2emRD?=
 =?utf-8?B?T2xtRVZzMUloZjBuTUQzdk1lMlQxeTFBTFFoS0N3alpmZlhZRTJWc0YyUUF4?=
 =?utf-8?B?dWpiUkNlMzhxZjE0YnpHb2Z0MzBOZThBcVltRGtuZngvVzNvMHJGVW9wdVA2?=
 =?utf-8?B?MTBpSWRRQW9nSUdTek9ESUVUb1dmbXhseUw1YnZXV0ZzUmU3aUJBbVZIb3RH?=
 =?utf-8?B?TlFnWC8vWDRicWphMmxoQnM4NTdkdXZXa0RubitVc0lmcEU5N2hBODNybkcz?=
 =?utf-8?B?R2g1dDF6eTNnODVnbGZpS3g4MktmOGFpZjdYZWNncFR6U0FUL2t1LzV0MU9L?=
 =?utf-8?B?SzFCSi9wZEF4Y29Jd0N4TkRRNzJoVW44MC9senVIUDFtcnRyaG93NXZHdC8z?=
 =?utf-8?B?WUIzbldESnJxVHFiWFpnWERsOGs0a1RncXpEbmNuUXhNU0dSTnFyeGJ0Vmdo?=
 =?utf-8?B?bUZuTFo0MG84OUdnWTZUd3JSK2Jleks5cTJ0eDJxQWtXNjNXQUtRU0FncHF6?=
 =?utf-8?B?SGIxZkdBNFU5b3lWcG1yVndWUnp3UXQ3Mk1MYWRQdEtaeWF2N01lMVdVcndY?=
 =?utf-8?B?RXBVN1QrTHNEaCtHRG1PRHA3TUpuWkt5dUxhRFR4WGVpNyttazF1UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a76105e-951d-4f15-3cc0-08dee63257ce
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:41:43.2493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMHrzCbossQByGmBOiNUJkgD2066zDlRI4l0UfnEVH65iTUnPY2xPL7+M7b0mISf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574

On 7/20/2026 1:05 PM, Shubham Patil wrote:
> The DesignWare I3C master has a single reset line, so a dedicated
> reset name is redundant. Look up the reset by index by passing NULL
> instead of the "core_rst" name.
> 
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/i3c/master/dw-i3c-master.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 2f8c0c4683e0..488fb455d3cc 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1584,7 +1584,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>   		return PTR_ERR(master->pclk);
>   
>   	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> -										"core_rst");
> +										NULL);
>   	if (IS_ERR(master->core_rst))
>   		return PTR_ERR(master->core_rst);
>   

