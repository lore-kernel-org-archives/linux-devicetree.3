Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD6348C7B;
	Mon,  1 Jun 2026 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297900; cv=fail; b=FLXrZe6RIJrNsMnzrS7mWqEBpms1hBFNEMTDxUYDhhUSJtSUxyx8BGgxKLcR0eaLKkCLsgaxwDVS4ml2vZR8JZhOJaEcEzzJ9eU9l46xWQH5TA29yfCTEtjQjn+VFr8yGs5kM0xEOTItetywUWUv+0mhUNDg0GDiQGDwR0sCsAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297900; c=relaxed/simple;
	bh=KZPaxJs1aIKf850o01EaMtVEl7AJ89gSMa1zy3cBjag=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eSJXHmqeLqrW3kNm0BxMnbOSRL+cvDWh6TmwmneFMmWpYfoLgQw7DZXkhUGWv0PjBEs4K44vEPoyBH1gsPeWGvThHVbg1xnP9XPuNvZBK6JkKOIjk1irS5ZoacGnhGQChLbNWrAErNCno194Yet+sNykLkf7bGfM21MzMTTkQv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LhKXJ2+q; arc=fail smtp.client-ip=52.101.43.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LhKXJ2+q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeO8h9th69fXulhLXVXY8vRe9o1UuEZef7tIREG/9AR03wVh4JxWRyOTvLWFS1xEQrHlze7ObXb3oFvZZQCRplSh6fTPW9qE/xPAbcoDSjA/Hrk566r/USWNB1w2xBxq0zUoFBYZJWZ2h9Cr1MKRWuweapiiq/LMjI6awYY/A9/G5LCVacugkb8TwiQbXDF2oYabIV7+QNSmuHiF+8t3OTBvSTFmQZadqy6y7HyVnOfQOahf7kAWUmLsuaI5vKHqrH3t0cAVeHKJD7SXLgEHoxXe2PnHqJNFuP19cVp8yrEGvVP3Wsh5eD9YGAgPvnjuOLiAB+2L2CFCDpFLCF9MQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsuf7SfTZlzTx7yDqRl0yx5TEB514A0v9FrGKo7D/EU=;
 b=AVhd+JeBKzNfUpxOs8b1owdiYv2ChVhKhssa0nSisHYjtdLc7zXu6oxqJuX8bSIc1NBR9b2kqCzBfNHOND5NyT1ILNuUyiu6MRZ3Cyjfc4fLL34Uhl6g5/U29VUWJ5kj9R5t9/YVeNTHH1DhMQAELCUBogLvTdUhBetw+D02Z7mRstRd2FwJaUXPXQ9072pfvUC8zVufkiVxXUUbdluFEmQEayahJZBv/fYRe14OQq/4aLxEvFeEwq+N70m7s167Z5NlMnwTILpwfDjCPS4sBlOq2pe9Qncne0d4nZXTW1/dXRWHZf9BBjxsu6NODxye1Cbh4eflSWVLA2K7tgGFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsuf7SfTZlzTx7yDqRl0yx5TEB514A0v9FrGKo7D/EU=;
 b=LhKXJ2+qniQWA5hK22/9f1F2KvsFCr6NB3C9mt2rTsXRsQ4W6/J+Mn/zYCTauowj1mge7MKnLTPSSYJb+1WtEHoQuFlRHW8Dh73pcS91vkptnThvL7rfxPxAcsIrnFZ76EKIf789CD/+4tt4CqJz+yEoWUEreCSWcb3kGNZJTdQ=
Received: from BN0PR10CA0002.namprd10.prod.outlook.com (2603:10b6:408:143::16)
 by IA0PR10MB7623.namprd10.prod.outlook.com (2603:10b6:208:493::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Mon, 1 Jun 2026
 07:11:35 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::62) by BN0PR10CA0002.outlook.office365.com
 (2603:10b6:408:143::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 07:11:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 07:11:33 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 02:11:32 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 02:11:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 02:11:32 -0500
Received: from [10.249.138.193] ([10.249.138.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6517BRt41040500;
	Mon, 1 Jun 2026 02:11:28 -0500
Message-ID: <862fcc54-376d-4bd4-a0fe-d34a14783156@ti.com>
Date: Mon, 1 Jun 2026 12:41:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: omap: Convert Counter-32K to DT schema
To: Eduard Bostina <egbostina@gmail.com>, <daniel.baluta@nxp.com>,
	<simona.toaca@nxp.com>, <goledhruva@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260528165853.15510-1-egbostina@gmail.com>
Content-Language: en-US
From: "Chawdhry, Manorit" <m-chawdhry@ti.com>
In-Reply-To: <20260528165853.15510-1-egbostina@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|IA0PR10MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f92964-e6e1-470b-375f-08debfad02de
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|22082099003|18002099003|921020|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	PAwY4JiVb8PJ75aG1toYDmi76MwcOcFuunYUPyHoPouYa1joryIZFvLCCQvSC/awT3dJEY5Cum6rcSHynhvny8Ee/IpaZ3zesFbaQW+Vk0LAHjdocDQsVPbq4qRd6tQk0gPcanL0tyA6/bHInAXKe+sfZEfthD96PVp6ekc17DoJ0Hqt4nipgbg6mVLnqB0FFnz3dntmko4qsLSufGx0FthMIyDnIRwnZqBsZeztbGTUw1xczP0GNC1zXjTPQh0nnGWqDV18NJokigpXUkFCT1VL9Bkpck8eUGeCl7gV0U8C7DufS/yQgNB4mudQ28kZJmKwuG6NdvdSfCXmWGehSQ+LIHf2lcuyP5cnOw5avTAe/6HRtLXCwvS6NkoMg027HDcnGG/aSP5kA6JRhA82B4tN332Lp8CKbanTpVejczXLHE16mxUq+v19kjkJa/zGdGYz8eWs4Z0G+iDU5YvnjMGiw+lwJKHJvcmp3jDciKpv32Ahq/Q2WeHJ7g70NqmVk/b202SlbMeyL64Trp8918HHcgVHr+4sjTKykyyNXk8Ebthr26oZAb68ZgACmHvXPJbJzOmAver9iFTw6ZHIbeVuLf9wYY2dC0zuoAyu1xQwthnA7Ybuefh4zeKUNiGDnEMTewzk3zJLjKLduJjodc8DOSUAzZIkzDt8gzeu3K6vpdXC2W7dkwJiBn8urQv0fYWiw6u4v+yBSxyEyY3G/pPxxGhT/Ie1vnTobTCT9jE=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(921020)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s2mcB9PhLxgagSCeLGrIrKP3tLCknOmqfxqRj9JAmPqzPQzKuP3gs4rh66q5kP6Xh7p1b6akYboGtpaWRUMTk32Y09KJicYWjoDn5h812wr9YL6+JLzPWbg+Noyu2ZFeWhy28TW0MxbuDK06e/0LFkpEWYJtB5zDILoKpPBEHgZLEXzL9IJ+H8doiSSnJ+nvSr2yzg55ja3wZx30xSXR4/gnOE1t+TF8PiqYRNNytZUvtGFFsPGomVomfQvz945+ZrbepAEK1BlQCTu8/ttUuJO95AoNhNdRF+FcLaLkXc8AZlFKTRBixWbAji7c5gtg5eFPcN50aJ8KdCBAdg6cbmTfPJZRhkNy2aqfE8z2B/QcZRZSV2jScgSW4DljnmQv5hitqe2HYrOvCNG+8U/9L+7CLorBevXHIqi5LRXri7l1JzcJKPWQwol1ayQyE5GI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:11:33.0309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f92964-e6e1-470b-375f-08debfad02de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7623

Hi Eduard,

On 5/28/2026 10:28 PM, Eduard Bostina wrote:
> Convert the Texas Instruments OMAP Counter-32K bindings to DT schema.
>
> During the conversion, two updates were made to reflect actual hardware
> usage and resolve dtbs_check warnings:
> - 'ti,hwmods' has been made optional. While a search confirms it is no
>    longer used, it is kept to maintain backwards compatibility.
> - Added the 'ti,am4372-counter32k' compatible string, as an AM437x
>    device tree uses this instead of the generic 'ti,omap-counter32k'.

It's not instead, it's more of an alongside, the reason to keep this 
would be more of a backward
compatibility reason instead as we don't know if other software stacks 
relying on DTs are using
that compatible somehow.

Would be good to fix the commit message in v2 along with any other 
comments Krzysztof might have.

Regards,
Manorit

>
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>   .../devicetree/bindings/arm/omap/counter.txt  | 15 -------
>   .../bindings/arm/omap/ti,omap-counter32k.yaml | 41 +++++++++++++++++++
>   2 files changed, 41 insertions(+), 15 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/arm/omap/counter.txt
>   create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/omap/counter.txt b/Documentation/devicetree/bindings/arm/omap/counter.txt
> deleted file mode 100644
> index 5bd8aa091..000000000
> --- a/Documentation/devicetree/bindings/arm/omap/counter.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -OMAP Counter-32K bindings
> -
> -Required properties:
> -- compatible:	Must be "ti,omap-counter32k" for OMAP controllers
> -- reg:		Contains timer register address range (base address and length)
> -- ti,hwmods:	Name of the hwmod associated to the counter, which is typically
> -		"counter_32k"
> -
> -Example:
> -
> -counter32k: counter@4a304000 {
> -	compatible = "ti,omap-counter32k";
> -	reg = <0x4a304000 0x20>;
> -	ti,hwmods = "counter_32k";
> -};
> diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml
> new file mode 100644
> index 000000000..aadb5ea1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/omap/ti,omap-counter32k.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments OMAP Counter-32K
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,omap-counter32k
> +      - items:
> +          - const: ti,am4372-counter32k
> +          - const: ti,omap-counter32k
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,hwmods:
> +    description: Name of the hwmod associated to the counter
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    items:
> +      - const: counter_32k
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    counter32k: counter@4a304000 {
> +        compatible = "ti,omap-counter32k";
> +        reg = <0x4a304000 0x20>;
> +        ti,hwmods = "counter_32k";
> +    };
