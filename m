Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013043.outbound.protection.outlook.com [40.107.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E237C91A;
	Tue, 26 May 2026 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779390; cv=fail; b=Lkf6OM40n68lcc0DkZO/w6i/dtp9irYTbin4S9e5SD7X7qRYkBGXxJTYKsEdQs+wCQIuAfPLciWBcr+X82s0Wckh0j3evNntoeloD9c5OAEWgCYpVDzA4On9mIpJwCFO51eRctkTMrhqCWS2YpSaDbyeh+EUBfSMuXRi1Nv/Si4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779390; c=relaxed/simple;
	bh=Y18xCfJxoMEfzu0Xx4S0Um+HLHfOBTwDvLGQqKdwxX4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OM9yyi/0DrhMe90I6gVg+iVY/mV2YhvfyWtJwhvCmBPK91v4GvuUPsXVdlH4B+7jHcOiUulVo+XahuoJ/7ZyQYCHxT16LqO3SkalAp/W9VO0z2V9aAvR/UMTbiTMlHIR7FlupGJ8whRgE/3MmMws9mtCqz+3L67QQRYA2xesNmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=dbu8HF4O; arc=fail smtp.client-ip=40.107.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="dbu8HF4O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xp/G+JJH+1Yy7fdhV0yDzLjrC+QMFRcpwzhZFok+VuMhDe+LEHo6ubygsO/qfSg6gQeMoEeBMpG5BtfBpBGS8px4LqXZ3KZ1YhWMA7JvAXi07ETQ+WZTxNt/m7IX0Zhty+bgTijNL7/eWBMcgJ2n/0hTRMFxTWelazTPnkysQEV/AMarf1Q6gI9W7dFu0GSCIwZGgles2cr6uTqCdknwRWPsz53p2jkTLBUMQkocGE0SjNXooLCsczUo9EwzJ8XEDSwAzhW4uR71kuzcuC4x1dDOAa5BvMdFI81lGY1KPCw26UbFxpoSu4+eS8MF9zpHATbbSjCcB85XeWERz7Clpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzWC0iR+rkpmatkr/dC6J72YC6+rFqzfBoQonMfmveI=;
 b=Gy6Q5apZcppy2CV+uq5N+JmNzBX2YRlS6wya/BAHQ1kiQAqATMLjWmJYWh8y8q5cDrVQkK87ZvIqtVswKjm0Gs0L3YiBoCvihlM7Rw9vWTWeHDNgxYZsLsGZ4thNyCpikkZzpVMwU5Hc1iBDvvvkEv/jAhZAp23n4qxiMz1Sr4DgAVoTJbAy1M8O54ZzNmUv7aUWHvmr5A+N1fSggyihLzi1hawsN18a5SceHZiKyFiCu+/RSyqE6/uAPVMff0zXvwlOjbA9twZznh7pGyOjQJf92dyTZIacFswk/pA++8rqDHfDPosxBYx6uuS/2BIxKAylUd+lHYURMYS87n1ceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzWC0iR+rkpmatkr/dC6J72YC6+rFqzfBoQonMfmveI=;
 b=dbu8HF4OyfIgTBsddqSs1aHd0PcZhQ59cd5nONJlIpjamG/BVMpbruuG8WeEOPVrnfUzMGPr2WJ4gpiZ2MKljhrZekA2OcbKDdoXxIppPQfEoR6Z1BK0qV7r9gkRADCwS8ZYM8xxk0s8O0VHozWqwQave/zDj9NYdAAbRPfnSAoHQnifNEIkVKI2Ze45EYZjlx45bg9SSBkwvyxW/5Vl/D6K2uhNFyrwTNjuCUmImsjb2SQJKQ//tEncjkEs6aJWo1P4TYgjaXnfkGxXqySsH3znahwmF21O37O6ngF5HcqM1NL3Frx2Sw936Qe6R2R/sokc6D681U26O5vy6xT09g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.16; Tue, 26 May 2026 07:09:44 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 07:09:44 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH] arm64: dts: socfpga: agilex5: enable i3c0 and i3c1
Date: Tue, 26 May 2026 15:03:50 +0800
Message-ID: <219d67474c90843f4768cba2598e79cfafcc1ac2.1779778817.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA0PR03MB5530:EE_
X-MS-Office365-Filtering-Correlation-Id: ce268676-2d7d-4a03-2d80-08debaf5c1f4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	N8WD/Iew6Sqc0qMAXAP6gAd7GC4VIwBmumprRxw+KNS4bimPl3BpTspw6vG5zHZbJjqt+SaxD2pcbNZsU/fT3m04E6+w7Ge4sXkX5iJrdhigly5FJ0r9+hPvBgqdCLrN1YAvIShjtXw47IbcoTPnGzl9ckRRxgjV/GQHtBbQaPM9RMM1Zl02R58+tpZhlxhCYHw5dm1eKPAIYAe8xaYylIbkR1NaGmJc6SoGqR4Hv/+tlrziHZ271a6+wYB42HFWlA3IzShKa+X2osshjgOWGos+3E6bsWE6kYnGsQbGBmvuBTBq5B1qMgzmgTjIvjMmbSgd35uTvkz+0Oo69ZVwcsSsp7MlivrhxtQ1eBbPUDqfXhDJWVSDpEuFZKbrLO9PKNnC5Fg8QXGaLMSgoAx+8NuXkuujDYjqu+slVxYyAiO2HvooVTu7q2JJapHlXjIsGqxZKy7XPG8B+TgrkP1B5/3oi6k2M5b9Y/OLeSUkjWMwTv9XNfbDEU2WDTDVarndudGOj1sVuY5xqmXuCkkvopNNWdV9PhwZygWKglFAgkzEUeSNUM0C8+7DFyB0srEKz9sBBN3zynIWRNaT67TfCEHclokiTW6VdPcbJMjLpTo6iwZCqYhPm7UTzyWjncEpI9YGlI7HCtS4E7tqKnx/lHHwAeyyOljLHCATy02QTF4bNOx+ri9/vM3Dl4XNdh6d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E1hczZEigCs94VGhUFup2az0kYhQ7vvgvD2f2SrsLW5E0K7x34cDFg9MVHwP?=
 =?us-ascii?Q?TFS4EdoNDko2Dh9YGYCxN97nDzSsmALplQYrPAIZbCm2x9ATPvoWFkIvfGID?=
 =?us-ascii?Q?PJTdcOgHe6Q7fBMF3JNNq5c5IJWeXLcBX98U7VxMeaQpfXSKTyFl672Pr3lm?=
 =?us-ascii?Q?pXZH+PQG6CgxhRChflqtiWDnz8Vg0mYOuTDmqwySzBxSnJcc6dVLAf6xm7f5?=
 =?us-ascii?Q?05kxeDQOP5m2gasqpTjk/UwF1Ia340UaKy2hU1XrXGzPZnpBX8KxU8Sk1m+x?=
 =?us-ascii?Q?CToeCkTtMjKGjgelyx+tAPkEQb6OP1UE9PilH5KnFGcjCKzOqACqtkD2rnsX?=
 =?us-ascii?Q?SyreJYqRQbohJW8OlmFJ/m2whCQhJjsStiWmitoFmyUeHMhfTRt9emus0QZO?=
 =?us-ascii?Q?8g8tL+Ah8n5622UWLD80l92k9LSYH0UibdDcS2eim7qlJyPpOav3O8wFZfji?=
 =?us-ascii?Q?kP1m125//ohjVynRsY9O+b/ehlHWDgR+sC4EbxLmYswtTkoN997EPXFdNwzS?=
 =?us-ascii?Q?gHLoS19hksv1ehEt1esb7iBod5zpTb76+rdCmzFGFdsO6uT2/6CgPfINc2I3?=
 =?us-ascii?Q?5QNutymxRghzXdwFCvL7Ic11NLpv4b4WLTnCvvkHOyuMro9ItkRljhhbl0Mt?=
 =?us-ascii?Q?q+EQTue3BHy6gc0vdgBY6oqKwUtlQ1XnyHH6ELw4c9nme6hm/8O6OhsyoHjl?=
 =?us-ascii?Q?++f/SyW9lAUrdxHzg5Cqay6zQfN2QaxCFA7Qx2ZjhsWzULOutyuujMMw60U1?=
 =?us-ascii?Q?ovSlRYmUUwR1edtJlPn0D9jihjXcKibMckZBldjeuNmaQadFjnDur5PlTPGa?=
 =?us-ascii?Q?x5uxZ+4sHyocGH3e4F7HlDRUcSuJOtUgtqmLjPWDeALP8WT85FoGZ/TZ3GyZ?=
 =?us-ascii?Q?MbOuB/apv3aNjnewNDEvZBu6Ytmcl/PiXZo/iGCGei/HqlMlFaSGlBHISI0o?=
 =?us-ascii?Q?u1bnZcdoVlnn0NsypVvUfN/Su4Vwp8/ybS8xFjYEAvpz01twAdMq+q092cHJ?=
 =?us-ascii?Q?IJVBTtiVDo0RGfoBGw2CFDHMukaOLPHJT0A46xSb503jTsIFg72UzdFRH/Io?=
 =?us-ascii?Q?Slj5wbFBxqICTFXurRtHc84PKU10uo3Iqdn1hef7LMM9hn3YHXzZPGOr3qMb?=
 =?us-ascii?Q?z3kEXIbxQRfkbeegfSn7IwSZ6Z8/44nwCJpbgYauVdo8omy6eTCiQEltr6mu?=
 =?us-ascii?Q?kvnvKuJyuCJKnkVn4FbYScfx3AaLP8PW2qQ3EJToJaH8C/O524B4EGZi8onh?=
 =?us-ascii?Q?RD3w0p1NueW4s8HTrBFfnHJxnfahFl1kgCIdlpa4fo3NQbydu2DK7X+bwKTy?=
 =?us-ascii?Q?MVplvUD3Jz2ahwDHvo28NEJpZFJDFiBOg+b8XYo9F8gfw3odUAWpDyB9jm63?=
 =?us-ascii?Q?rM6atOeshWphByVTqxIQuh+TpAKLyZL2TuHer6hF8/AjTY54++aIJcFvNbu3?=
 =?us-ascii?Q?fKuWOz+cyIODKJHzuC6kfloX1ljStejgoUB86XONfG+lDn9gNfLYyR6rvjew?=
 =?us-ascii?Q?d/UlGWPka9Vam1tradfzcuW4NF/rGNRc7xF8V8wUpicMP9E7ctJDDqB67R55?=
 =?us-ascii?Q?6WsPoUYXZpKIDxA5hpPReB94rVEYO7UORv+ypcjWbPHDbHw0PdnK48MD8GWH?=
 =?us-ascii?Q?ng5lin++Rlx+6n6yVgWq8wJrc9b11RgkN3q4/gCs6tLdZq11qBsboqe21goc?=
 =?us-ascii?Q?ipA0uHgyIwStC8GbcBRXsPy3Y/OYnW2FJBS4NC2aBPQW9HOjtc7QwBlsXJPc?=
 =?us-ascii?Q?Bj9bj1DUcDnklXUW3FBdi21/EcBaVVI=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce268676-2d7d-4a03-2d80-08debaf5c1f4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 07:09:44.0462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ao58rLIlHucUVTJWDrIZuUP7imK93phmrRo9bybn6WJMGpk4GSSl3gfmYJm1UaeSEZcGOSXcbwbl7jrBeI/50lVonVvuJq/6L0EtJBCqQrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530

Enable i3c0 and i3c1 for Agilex5 devkit.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 262bb3e8e5c7..7f6fab506867 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -61,6 +61,14 @@ &gpio1 {
 	status = "okay";
 };
 
+&i3c0 {
+	status = "okay";
+};
+
+&i3c1 {
+	status = "okay";
+};
+
 &osc1 {
 	clock-frequency = <25000000>;
 };
-- 
2.49.GIT

