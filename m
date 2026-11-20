Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795179480;
	b=wgDc73AZcTaFGndiaStQh+9zn4kK9SZiiV+5+qb51fLQuyXTCRJZXRAH3hdC+bSX+KxR
	 HV/52aAg4xK/7WVIt0LQ75yQ1WoHYmHXm6Ov+1+APnk0X4AMaI/SAh9K7bAmJCfwM9g2J
	 cEYJDtWClyNcNq7thXBzftxYqkVNJT5SoVWmjBX9q2lH1+jWom2KGlxEF6t7t+RrOivYa
	 b5CvhWVTatocSJlGD98Cx2t63+Jm9NlL3aAGjRxEDQvHiRFGixIcSK99ldbs2pU+7RZSH
	 +ixda2EnzuTYYhkxW0AUeSNYmo0MKzzuV9gwSnXYf7upJSk2Cbfwldd/0HvqYLf54iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179480;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=kAjfZmpoMLius2h0qf7UyM5X6PZN8hIm4whLsR5o7qk=;
	b=N69hOKX5FSeOpEUy5BOpH/dBteREcTnT+8KNxr1JLpbMMJiorM6knJBvty3xiELAe975
	 8JQGa0/afDEnrSAgCl/3Il7YbrF8hBkVhvazACcwCrRSZ/51wbtTmX6+596zry78y0XXa
	 UpggdBnKJMZEl4lpy6mj6RHvd4cECz1k26fTESpnI1ogVpBqKJZWzM2iAdQuXRVdC7Nuq
	 jUQZz+CEIgzJCMppkZI+KLmpyD4P0+l4I5jdMduh7Sc2QH3UrTt09IH0VKqbcWGNUVOml
	 fvot0WmjVsaHAeiUsH1BQ5wqKy9EbXGZTqhDmS30ynkrsYBAgXdMTAinP7shsBD0Jsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=J4zidpMg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.41
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0771D606A334;
	Fri, 20 Nov 2026 12:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0771D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=J4zidpMg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXTnM9PlmRqt6Dog00SVKQH+Kx+dQG5pt/u/m80tYPT+9OgJoSWW2jvo7SQhcV+E8PUMp+ZyHPwCyv91dQb8ON3Ceid1FhSFbTD960lSQCYTYYxF5WD5OFmiPoMQD2Xh1qLcsO6ovg8+DSzEzcCVjnQCx76jotytz09eGH+seRqxekpy6/U7kOTfjN9Y8L86ANwC2y0UpvF+UhxQGUOVNivAbRpNNoKZ9xzNRjIK5EXO0C/6Xf2lXRmjc7mMyjLTHZusVkbM77Ynf/Sx3ugjWeb1jtb7AkUYIP9Xlv5XrdX5NnzJgMJBtoOrijXQKZ9e/4Hpm+rbUGrMUaY/7WEqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAjfZmpoMLius2h0qf7UyM5X6PZN8hIm4whLsR5o7qk=;
 b=uOhw2nb1TO3+f1R1Rz/JNag6cWzaYpho+nZQOJyx8s6VEjod5ltIJCVE3LJDW8SjKr+ajQS+xddbU2KXPk6m47AIx8HfuuzSGhhbgTI5xkKNyyQAP7lnNM+wgtVJZ8+j27b10OUtBw6WExz4f89EjTzFAUleMYRpgW/77MfE8bhB6DkXr9v2pb0KKF1ZY/9AfYOw7fMTLogqtDEDRZCqfBQcOX0u2HsGaVRlAYed3ZzHGmJx0wtFeQ2W4JiNCmIP+afMg7b2aMa6alGkRIP5XyO9P/sVoVVw7QbJWf2JS4eP5nJXW16k+OR7A168vRJ9YTk7usDUiUJT/BD0FlkNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAjfZmpoMLius2h0qf7UyM5X6PZN8hIm4whLsR5o7qk=;
 b=J4zidpMgX99PaAzjsjUG0AQap/FjBlC1PrdkOMTFNMcirrbaoxQkyYquqLnTGL+c7jyJx1BP3MiE9TZrjtHfiIpS9BkYbE39a7nfG0pcyJZa5QtOpo8SpOsi61Gr1a0krM6BQLhit0ndFwM/HW1ZOt1pMbUvL+LAzsfQiUpbcmEvwvdoEggMcov9cK+HKZZprdDEnpfHwxq4Wyop4GXOa83ya2JhENiUUfYzh30iMJux4nZkjTbnmlVXu1A/9BtuEXV7yQTztt+mw8g7nK9gFCLLq9jx0w/KfDbjcR/+dYzNeTrKj7OUKvi5yqI7AjVQaXxAiEGBTxYxOu3mGNYLKA==
Received: from OS6P279CA0008.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:30::9) by
 PAVPR10MB7306.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.2; Fri, 20 Nov 2026 12:57:53 +0000
Received: from CPH1EPF0000052A.eurprd05.prod.outlook.com
 (2603:10a6:e10:30:cafe::a7) by OS6P279CA0008.outlook.office365.com
 (2603:10a6:e10:30::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 12:57:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000052A.mail.protection.outlook.com (10.167.241.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 12:57:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 13:58:39 +0100
Received: from [10.48.87.222] (10.48.87.222) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 13:57:52 +0100
Message-ID: <9be9dfec-50ea-456e-8c70-61e4bd9d338b@foss.st.com>
Date: Fri, 20 Nov 2026 13:57:51 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: mark STM32MP23 timer as stopping in
 suspend
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052A:EE_|PAVPR10MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: d603dc6e-23ff-4a0b-2c53-08df4705e3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|6133799003|22082099003|261009223027099003|56012099006|11063799006|261022075727099003|261102123227099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XI5yZjqwgJOgFa/vuQf0SWej8k1XfVairC/K5RO+xIaQzh07Kev0E0PnuJZE+Ow9SbNxE+3C5DtlUh1LBUBCkk6QvlxZK0ir48eZFhpOQ+MPErM9/0NQD0+gDIOgfs8o9maZ5QbwkQuPCtyOyM2ogQl7qY546GyJPspG6a0GQatyEGL4qsGRODW4azqUeKAxrg6aVTczLExiBWO5TXW9qZccMM4EleLIDqCOYn1S7TL+h8I36S/qSvmeTQ4POBk2rInU+3coNvGmPPufUrFb8e21PzrHISoph7apMeGO7AbX0n3dWJV+OzaB56/HlqTuckOFpfYVFSRvOwmCBI71+IQwsJTNwFweTeD8KKVDLmruauiHr+/eSyNAv9XTUdiimcE/8qCMKenLJpN7Zmqgjpmc1fwATLNEf0E7kV0DKPSWjy0EAPPgCS/tkebZlY0cMx2qUj4nilG4HXD45q8cEd2FvivLiXs8R7IORt6Dv0+zPBvuGVrYBIY8m5hfzoNOwrvAcxbcx+CTVVxG46xCtdQ4xDnozHWr4Qn0UdcNPqSQdEv42PJ41HufjThm8DeAKZ1wlm7NS6WL16l+FY/VQytmTBHjTNP5USZhzfSMBj9yJeZrXARtTttiEfmghrNitvQmHeWXtA93usm6E8eZF5PPlI7/RBegbangNRiPSydhS7Xc9W/NNZyaDftjP2oEItvWxedjuB78JJc37osetA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(6133799003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261022075727099003)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p/jDrmYU+T1aKMoLPdPyNe/2lMVoqJwcHil+DNyiXbai7gG8fFj1b2XFLp4PZbX9yUsUdVCRMYPidEHQYy7B65v00+NqFfGoX4PIsWQSoScifPrPDLFQDyfIa/fIW69uetPS2idzmaJ8hFK2SpoY94AsndRuxZNhg0phS8CGQRWupwkJ1mxGux6p8yRQtEodkOWoL7P7JhjxixaBGbdm+xpprU6N8Bm8kr+xJXUnpez2l+mdSwWTGDtNz7uPHS3COhza0uiNCvXdQIxsk5gwlWw09mKqaQj95bH0ZkMyoBppqLZdjdQHmVULGgoqyIyOSgVXdkucqRLlMRTO9iRm9fPGiNno3syQBlwclHR212/gV4d51YF/TR3isGZj9gPCCAhVKO0SbQNCnVAB/+hK4c888o+CASbTJbq62Zq2uzyAYxAAj5f4vvMUmdT8TQBC
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:57:53.1927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d603dc6e-23ff-4a0b-2c53-08df4705e3d9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000052A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7306

On 10/30/26 10:29, Patrick Delaunay wrote:
> The generic ARM timer, based on STGEN, stops ticking in low-power
> states such as Stop1. Replace the always-on property with
> arm,no-tick-in-suspend in the STM32MP23 timer node, matching the
> STM32MP25 configuration.
> 
> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index fefbf6f4f153..a7970fdebec7 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -143,7 +143,7 @@ timer {
>   			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
>   			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
>   			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> -		always-on;
> +		arm,no-tick-in-suspend;
>   	};
>   
>   	soc@0 {
> ---
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> branch: sdfsdfssfdfsd
> 

