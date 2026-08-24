Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazon11020118.outbound.protection.outlook.com [52.101.150.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6A3624DE;
	Mon, 24 Aug 2026 02:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.150.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538476; cv=fail; b=FHak6hvgSOlsMng6VMpKi6+ZZdPAFVxwZcLvRBi8vVqNRVxQaBPV7aJXa+auhYRK6rurHblR5IfjneVLPCVx6CvZ4Rjp6ek8Iha3zF6RYqVywS8lbrWBuEg2mP+dKaD6si+sZOrHw0i7IZd9ar+Qn9UTQQrdM3h7yvuFqPdRfnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538476; c=relaxed/simple;
	bh=9PXf7+51P18Tae5O38DAIuABFKbN0xbaUrTQQnIC7J8=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NnG0xw0oUW9lSwk3IHRMMZ3nXLMVKCIbpy31FE+Ag+lgPI73WX53hO5Z0mXyPqCj4+jVh7z2WzlhU+zKngsWx/xmhvorIVgi1DYJtgNKS8bLZPmD+Ie4a1oU7/Pm26T01s45DnxxEq70h7jmuHQZgEUICf1595gh1WXO9uGi9Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=kfqUQzUv; arc=fail smtp.client-ip=52.101.150.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="kfqUQzUv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnIpmHJonPW7FFXSAOS7j7DQP/dkotWnf6BIL3dV5AKNgxkK/WbwnFt2usAHlVS/pA1iMlOBrgt2y+wa1t89mycyCjR5BXGw7qsjCNn2omt7pVQdviL6jSAHk/NhYw28EvzZNH0JgDGeFahuEicKgiyJ1knffq+l48Aa9idAEiMiFpqveHAzCJPPY4/CL3PTibE8T38N2VOinGs5Tsfm4ZRXB6GlZW+dtf1kaSEkUTnyNMAu1SXDYWZiZx2FyXVB/cgmT9QiR/wNiaJyWwyc3uu/JPTWu5elG11jZSdp9I+mBAut7y3sV0rBxIrubfRILZElt11dckkHpXHBZtCCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr2finr8zjmso43hOC9MDCkPxfDb9L5Jlej8Fof58Ms=;
 b=fDlVb2135bO9PLn/pfk+Lxo4pe9T1FrZ2oJtylIkQ1tS5UVBSrorJ07KVUqMxTnK1o7EsvoCe3M3bdAtTBb7SkL9TsEuNG8QhPIBehfDXJRH2Zw8W4gWurAeBy7AZtdoi6fhN1SXlwR/Q4iaRreCI2hkVAemamTQ0fE9M3YIylggadDTtu9Y+utm1TcXfwki2NBYmoC4I7anaGPwiU0T4s2fnG5gGQ2BizXAfzUg2kkoFqhmOozhdbcfMO4dPEv/NxBseYzRp1gswL3BsDJKH89bzy4SdUGeFpG+SjGHAQzEdTwAcyYO2MwgizXrfu3JUwEGrLtrP37iTZ7Rxid5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr2finr8zjmso43hOC9MDCkPxfDb9L5Jlej8Fof58Ms=;
 b=kfqUQzUvsH+GAEsjSOTkXbodOdUwyFBZdwu9KPixRna4S8VI1YtunH2Eg/jGflPPnOzSbjAYGkA+lQO7bvbOSv2rR7P8BG2HSve131Qe3t8Z4ixrc1t/VOw/4DK1lV4Jtc6NcMEzFvveXiQZ5ob9udPdOzc5Nqn8BZwNbw4NpdI8m8vr/e7aOxQOTNGXy7AbkmHqU3CiI8E4ngOBcyEmf5LwV9xom9gDQcx3jBSmTj6SvMIF4p/HVrJueTDA1DT9u/91L486GAD3Du61NfF4g++SShd9pTeHuy1NZ4qo5+jITd/mPCiL2UQKSyYrijwnPl554lh8/WQzod1V69hWyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by ME4P282MB0744.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.12; Mon, 24 Aug 2026 02:27:47 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:27:46 +0000
Date: Mon, 24 Aug 2026 02:27:29 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rudi@heitbaum.com
Subject: [PATCH] dt-bindings: regulator: fan53555: add tcs,tcs4526
Message-ID: <aousEdwMni9ScZBn@0d3a7a881997>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MEWPR01CA0193.ausprd01.prod.outlook.com
 (2603:10c6:220:1e9::16) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|ME4P282MB0744:EE_
X-MS-Office365-Filtering-Correlation-Id: ab28f4d7-2189-4053-a82b-08df01874907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|10067099003|56012099006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	9NLg/qwRUvZrh8vBLlLWp3n8qgYZpCyerCEgUE12REXI9iSBO29rpzzAl9+HraZqTdYILaC0FabtoIZ6+I3CmALhOP3qPht8Irld2JB5DfLplYIFLWyve7pV2Flkkku72LpP152kqEJqG62MQpXSS7AZJxbXNgYI/LNjN0cKx7lYjZjDBddwf8pYJFIly3xDs9gUC7cHINayZrdeAoA28BtCXtvKiqKeKWAxDwYE++Ic9VtlKaLjndlY8Nw/PYomzXUGE8I9BkBX9LE9CUtd5B+6GysMmx6k80+CgEald5w28GnUEx81zKKCcH6M2r6FPhtlEGbwPi1J1vP+znBTPt0FG3eUdzNmC6MN1xx3HzGOPXROB7y61ogwox6ABOhHmm6QuKiVIKyH4+zhuINayhFZkNwO3c6n/N4kJojw4hDX30J62RjeVB5tt7/k6kP+vhwnWrwzpqfMUJYWc4tTwofbwArw0cF0v4E90Q1Wb07SCAgWHdDe7KxjplrT03G29enAyfFZevphWIhA7O4fMDSju3AveuS/2CivJs8CHEjwjIJP4aYOTqiNyy4L9rvo12diOqc00xORj+c7hnH6g/CcZvsZqntkCko1iNFpodfc/wEDPUXWM7wzuvGdo5FHpa5fVLAV/tSe+j/WybDwaQHqvUorOfoktTRfQSI7A6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(10067099003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jq9QeB3t8WoQE5baj951cadGgbLWxYJH3ZiBQJt6Al8H+Zhcb+B3KC0I2SPj?=
 =?us-ascii?Q?Kapr1znf7uniTdgGdblRK2soxVq2J5ttBSecreHbFqr/H+e10UpxEFWO9z7g?=
 =?us-ascii?Q?Rj6rP1Z6qYL5Zj/cgqwh0S2Yd9EvM8OCPTHXRanxG+hkyjTAHlRX0AatTFrA?=
 =?us-ascii?Q?vPxvXVQJoExfU/dBbUqtuOwLhj+h+sazzbvVcUfePTTUJIGC1CeY8gRtLKDE?=
 =?us-ascii?Q?T3H9PYeP3Hbcl0FQ1H6PrnROlmNDGkGMcS2yFSymZzluyRPwCg8Ua8OB3BAI?=
 =?us-ascii?Q?+rN1AOQWcaNs10Zj/0pdBPy5QHhxU1mERqhShoBEbgZ1s6mxdWHjhTqAecm9?=
 =?us-ascii?Q?VCn6EDOYfqAxn4unNxFNrZUlA5rDu5P7dWQ99Nh6wFbbYB2B2MnAKWZxFKv1?=
 =?us-ascii?Q?xl+GTZOBpMDkwVY8YWweIz6UT/Ac1YFGG/W1/kVwr++SQ6uWChfDzngPPeMr?=
 =?us-ascii?Q?LJ7jAgO/9xJWBepeXc0NH9L8RqEezP5lbUviOKSROCWzsAFoY5dx50e9hF73?=
 =?us-ascii?Q?WoygCXJrVtutxjrElgog0Btmb93/6dmY6mDCPLDsyRWoQiPx4qOg/WEiIEip?=
 =?us-ascii?Q?WYnMHHBXM6vqWXWgJD/i2SNCoKMcyhGRZSlpfpuKUHjsAePmkjyi7Q8Wo4eP?=
 =?us-ascii?Q?3/I+EG+a4e2GVxbodSRn2mHGrdD1NqWj17gT5VmLccanLO+X2xmrOb9jUkA9?=
 =?us-ascii?Q?cubRrcq4X9b+JczgwHID1EmVDF1YfLRJSPY7WGL9vfjXfoKiIM2EVTIkG+kQ?=
 =?us-ascii?Q?w9ZLWJyLzaTy3YfKTQ65tou0fKXyRsuRJ1q2JweFq63h89m/74tbxNi1oHE7?=
 =?us-ascii?Q?lq2AooW0NZv0/MhjqBQP+J6jXrwuj0MDKezLUuJt9GAXbwFv7Ilk2C81SZD8?=
 =?us-ascii?Q?1iWFfjZUQQDMkZSzUq0kZHLOx/BKSNCIdsW0P6q0elsfTxdv4pT6CVsuetpd?=
 =?us-ascii?Q?DXspRl2UdEMh49v2vpp7t7NZNCE1Q6npU4qh3hsSrvi8AEiUOlsKUBYBjDMc?=
 =?us-ascii?Q?rWkM5+swWHuyqsXJCZ/ED9owIaF0tCpYovUuvWmHCMs0C/CCRGqWlu/Beakh?=
 =?us-ascii?Q?B2qmsYOJhOKMONmn/VonHsRsRfzCqwcNWvv/9o3dyzOtIdmfh/FZFul3YrGU?=
 =?us-ascii?Q?Ou6OY25/xndwrad4oWcfJdIJMSqxor7DEPeIRcfUr3SGpocvUle5sRfcSoMQ?=
 =?us-ascii?Q?I2f0mEf2fCjFCEixi7GjG+0C0Yr/8OH6SIDpuD34kthm+L+N2I6cARgMO5xk?=
 =?us-ascii?Q?7DOU2KmHJk7UnePmVp4lQhiGRJmirNNTVdPtAAG1k4gTlAnvC0QqHCWSLLh+?=
 =?us-ascii?Q?8wk3+aJL5oB7AFz2DsTtoCLT6WcHxbB6fDrlUao7S0PYTCoNIInt2cHhjjT3?=
 =?us-ascii?Q?+Q7Hzjaq/5B72FdUPhocnYyct92c/d76841vnsQk3u6b2thBnIIwnbKDcssl?=
 =?us-ascii?Q?7BEqztUgUHeoTBSo8Qz1tT4j+XNVW32wBqgzo4fb1P351bmlQ0/7sSGMEPyd?=
 =?us-ascii?Q?3iViuPXcTCYuuixLFAtDzf8QzV6r9MHxLb649ppec3q/AqhS0qeiHo3hCoYL?=
 =?us-ascii?Q?WQynMl6/k74AHMdFb/lb89XLZax9VFo5y5lRM8Hmowh4MnGctQVj4iRkMsxn?=
 =?us-ascii?Q?koZ6mxH2ZnpePlUXA0QAJigVKnajPCqRYhkJt7wsopIgkj/vkLQdYmiQTwOs?=
 =?us-ascii?Q?4s7kQaBNRedVT2vt+MrfogZli5VMTWMlIj78+Q6/EFVFME5zUTydZSmmvnqh?=
 =?us-ascii?Q?EfxUTbM6gw=3D=3D?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab28f4d7-2189-4053-a82b-08df01874907
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:27:46.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tD6VI1NcB/ECqf7vyl/qtOyBmCHR41yG8GUS8F8B8e3/Tum6R2GyC1YM0pzphLA62Df5wMY0iSHCjT1bawBQJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0744

The driver has accepted tcs,tcs4526 since commit 5eee5eced95f
("regulator: fan53555: add tcs4526"), which added the compatible to both
the of_device_id and i2c_device_id tables for the TCS4526, a chip that
reports id 0 rather than the TCS4525's id 12.

The binding was converted to DT schema afterwards, in commit 6cea468b680e
("regulator: dt-bindings: Convert Fairchild FAN53555 to DT schema"), and
only picked up tcs,tcs4525. No in-tree DTS used the 4526 string at the
time, so nothing flagged the omission.

RK3399Pro boards use the TCS4526 for vdd_gpu and vdd_cpu_b, so a DTS
describing them fails dtbs_check today even though the driver binds
correctly.

Add the missing compatible.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
index 69bae90fc4b2..1c54803d16eb 100644
--- a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
+++ b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
@@ -23,6 +23,7 @@ properties:
           - silergy,syr827
           - silergy,syr828
           - tcs,tcs4525
+          - tcs,tcs4526
       - items:
           - const: rockchip,rk8601
           - const: rockchip,rk8600
-- 
2.53.0

