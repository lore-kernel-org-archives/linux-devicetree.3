Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538015;
	b=N4faLmG4Tso9s5RpdQlbtIakxG18o88oWFvNfiGvQhdVbcnBOoET+M8oquSi4G6dF5dm
	 rlXrzbP4qJHfATuz2XbuqV5nynGd3XygnOXVRrBYeLdX8Q5jOuSzjXOt1Y1fHlxwzc/2t
	 jZyAax0KX7zdjPF+gfBudeWofUs2kpI3+zSgoH4xdEkttdfda1s8io/sBMgqO8RRH500z
	 B7NOUA+9wOqFGR/sVuOAyN+rH4QVbMX0SVVSFjKSmMhtcu2CN7iFMrolMm8Ijcadrcd/V
	 O6QEuckdGTAooOpX6Fus9QGulxo4d4PjDhOhDBKl8nwlsbJogYC4Mxn5vkQtrw5m53g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538015;
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
	bh=Tj8moKFFD2hrdeliYnviN11TyNiCYHRIIsNsTPwMhGo=;
	b=QDPDrZ+i3KbVmXQdXL7uMT37VQSM0td4auBDYQoUDnimx1lp4kmTioKdWNIN/co8wWvK
	 F4HKlU6SzSJhgHesXXkxoDXmKf9ggtNyjDgEQiIIpowzMhOxP55K2aHiSaPxpPpfDQt6M
	 z5XtTTiSHHWUzh9mXVcxOnFagRU3HpCppCc1OueMlKJ/7Nm6rF4E4+XflgBJEwk/qEln4
	 pYX4oTyM5+e/sML+S4xKsGEpERYs1Tt22QxenxvCXYSrZ3hdoNUNkMw6mHj1tn6Vlg73Y
	 9rayqpg/fK7zd/EjP+VwNfKAWNzQEQaQIzQrtCdZEg3WtUNThMU/JKYEKyDGbqFhW9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="krHXn/oo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.58
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E970C606A31E;
	Tue, 24 Nov 2026 16:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E970C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=krHXn/oo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/0bC0qCjMTUYdzt7gW7JefDBQqThJdyJfoawYjntZ4oORqqdWzSlkz7oCitmbqvzqIeckHtD/R2efLDWVxFTwiriJ2DGSyFtmZxScplwJ2p8K6ekq7iXdA8vcNy2seUcypawi//oQ/TFz/zzTaR85L7VIIPgTEpOeucDFJWRx62jEKOzAx4bsfBXxxxNLQMEwSo3OZajgzWJ4wCsv2Lqjz9VzuEBcZ5NK2qdgoHClB56cI9aXDjVlTkFYLYPuq1HE4xlVfWLuPHXUJm5Y6TPkLRmBj65ovIG3uA5A0I3gIWzxcbmEXDXSpYXipnR0wGduPYgOqZmhcNssxsNJJ13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tj8moKFFD2hrdeliYnviN11TyNiCYHRIIsNsTPwMhGo=;
 b=JSE39yx+0L68JN3//XPdPXy3Y3gRonWP5ncp5kZoZWuqJkOLH/iq9e2cWOyahuses3QMvTphIyFgHohMjXBl6CN6cyfsjTPeC+OCrbLX/C+HWFSIMna7/i3+YOCfCsvFPSnK4VPK//2tSSJ5g5Bt9lL3uv2+T5sRYaMjnBeT1NG8AiaigtXLGeapZTxXBm5/V9byTEnMscAESYCoYoz4ktkxBfn+C4fVC4ZN2Dx1PaR5shI00IH7cE9D+X8VcXPkbokh6KfI+FKrkpcnAcJl4fDqAZ7W5u0zR8pPEs0x9BELzakAJ19MU3cEsy2VAbk6SNZj8I4MJFEISlgXeQ/Fgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj8moKFFD2hrdeliYnviN11TyNiCYHRIIsNsTPwMhGo=;
 b=krHXn/ooqvbIy5f2lxMW/AGqWulh9oucqD+LWlMVWZOFupu4l89BQbR4I5PpNktsaXA97S8Mt5px3cgaq7PmARBqiDkWeFJwR6D9J4kIjiEzLPYgOafZQoVDv8XhTSvDFqh+c2FeqJHx/EnrSz72HFIJO0nALm7yuWTH2/VBP87f8iMndAlqKVv2Ykx3owfXFccS6mZvVbfTGAdHwn96oYEUqjrdVpTz/jZU8XkQoWppexjGRd1Y49Jv6UcbfhT+XqQnddMv+GKIKRp8Z+lC53SuKKYVw4/jgBUmoYqEo8b9srmWqFjMDYdEYXMVrUbHJKVI1lZp/WFK4kOCluSTiQ==
Received: from AS8PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:312::27)
 by PAWSPRMB0035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:366::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 16:33:29 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:20b:312:cafe::10) by AS8PR04CA0052.outlook.office365.com
 (2603:10a6:20b:312::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:33:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:33:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:34:33 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 17:33:27 +0100
Message-ID: <760311b0-77ac-427b-a64a-a3ea3e670e0c@foss.st.com>
Date: Tue, 24 Nov 2026 17:33:27 +0100
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
Subject: Re: [PATCH 0/4] ARM: dts: stm32: adopt hex format for timers
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Christoph Niedermaier" <cniedermaier@dh-electronics.com>, Marek Vasut
	<marex@nabladev.com>, =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?=
	<goran.radni@gmail.com>, =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
	<boerge.struempfel@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>
References: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|PAWSPRMB0035:EE_
X-MS-Office365-Filtering-Correlation-Id: fdba4d55-d559-45b7-5618-08df4a48abd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|7416014|1800799024|36860700016|376014|18002099003|22082099003|3023799007|13003099007|56012099006|261102123227099003|11063799006|261021121427099003|261009223027099003|261021123027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mUTqssFsBe46e40ltmDD/es9asNh8zBVPjG56fFIwUkEy/LyEECbAAnCxRcaGqaSEjTHY391FbheoOogFc7BpxgMS2YCt4ytEqaagnWcQAkwfWDHCMYn9Z9DNQbDWLRwuY2gXn9+s/a97yce7/q1fTrlrYxJGQBOzOTAXu+ev5QnepuLuubR+a45zGefBxHnfDYzDcjzqD9hj2wIk+fIuj2p9NaNx8XxUTjukTs8H5cFjiCIzDh/YsSDpc3FjwqJP1cnoUkDmni0a621h+RFMFno/pSI+OEmDGaAFJzbmghHs1R1KfTnIl+PotQ+pId87JuXcrljSTQX5zvm6m94r96UdGXqWkwLaWzruRRPhaJWR+Q2X6tsBKJmL/odvaiFrok8te/Ylc7sN7XoBuhJ00ha5s9xyCxso6zqq+eT26QYvTK2qWggQKXstfKODH1Lf9graWofw6AvmtSbcnB846U6tdXESTJCuyPpyxQc2gzthgE0w9tP8QKFIwaPhv35djifDjUiGVe0L9h8OrfiXME+0BYzyQnHQYr40W6DNvFhcKyOkHwmvZLR2KrAzL7Hqy5dn5X+hDcgZbFQ5FrD2y/Ko6jMB5oN40UvVXxf53XbloWO3r8+bNhYJejY2DQKSh26iRxq+wBvybSi9PHs/g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(3023799007)(13003099007)(56012099006)(261102123227099003)(11063799006)(261021121427099003)(261009223027099003)(261021123027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ye5fXzrhv7dEDrKuuuWcopBuqQKhHHqjLhLhb0UuUrryyHhaLlHH+fdp48V6YYLwmPN/PFjAglzn5TEuABqKVUobBEkxsZvUio2cx07LVrx3H/7aW5BIKixU3AsYAC+fvE633SUio7qCSV76S19K4rb3ChiXJ0cKcXJMi8tP0rb8ilzbHU2oX4LNliJv/mDqWmMb9ZeYSXP7EW9LXO0rLJ/FUjb/Ppwjo8wNyIOem9Dg6MX+e7PH0fVohArOSAMHz/c9dXeJh+bVmGVmHMWYylrG2Mq4G5uPyMTdL2XgQJiRDi5fAr9YBv4QzBt8341WiG7T+f3LuSrh78wM5u4p8OfmnKteTvtLd/MZ62girI5AJRlbP6AKCsH6W5dNBeCEQqOY8dG5JMLv5NU0thxG/jI8G9pHZkPxXvGqq130MvuevIKygCh2ZLn89AGiLu3Y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:33:28.9725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdba4d55-d559-45b7-5618-08df4a48abd4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWSPRMB0035

Salut Fabrice

On 11/9/26 17:25, Fabrice Gasnier wrote:
> This series intends to comply with hexadecimal unit addresses for timer
> subnodes as described in  ("dt-bindings: Use hex unit address patterns").
> 
> Also update hexadecimal format for 'reg' property in these nodes. Take
> care to update the boards accordingly. Note there aren't in-tree overlays
> impacted.
> 
> Purpose is to avoid upcoming new dtbs_check logs like:
> make CHECK_DTBS=y st/stm32mp135f-dk.dtb
> ...
> stm32mp135f-dk.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not
> match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
> from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
> ...
> 
> Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
> ---
> Fabrice Gasnier (4):
>        ARM: dts: stm32: Use hex timer addresses on stm32mp13
>        ARM: dts: stm32: Use hex timer addresses on stm32mp15
>        ARM: dts: stm32: use hex reg for timer2 on stm32mp15xx-dhcom-overlay
>        arm64: dts: stm32: Use hex timer addresses on stm32mp251
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi               | 46 ++++++++---------
>   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   |  2 +-
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  2 +-
>   arch/arm/boot/dts/st/stm32mp151.dtsi               | 46 ++++++++---------
>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  2 +-
>   arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts |  2 +-
>   .../st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi    |  2 +-
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  2 +-
>   arch/arm64/boot/dts/st/stm32mp251.dtsi             | 60 +++++++++++-----------
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  2 +-
>   10 files changed, 83 insertions(+), 83 deletions(-)
> ---
> base-commit: f39a4c5c819bcf18c7543cccdfd2215ceb4daa53
> change-id: 20261109-timer-use-hex-unit-addr-545d9dbd3331
> 
> Best regards,
> --
> Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 

Series applied on stm32-next.

Regards
Alex
