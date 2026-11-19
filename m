Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795080289;
	b=0sX0+MwbLbM1mSP1ZYQl8wGHpwyh0Ib4duTkgj96R2bnitRqjZQklMai9Z06NrmEgopW
	 d7csV2FqIDrMoHFkK+xFC+PqJoEhn41i1M7w/ltWvmwWCYLQi14A0eDAGAXMr9/Bfy0LA
	 ma/2Wpf7YfNxaRZtW1Oo3zGO7tl6HywvuUQSGFe6ZCW2MYQG3wfrn1kuukbneHqBQLMGx
	 qBiOwYRYFZTlzTakMcDBG3VBNbccJKtrpYm6YldwdqwF2CiA7N2JVg8wN0/7yOLGmKg8T
	 wssPwz1veAC1RSaI5JBDMcKrG7YkljtlM3WDuBtmjqbsrPfERn+qVEIluBxpvnYvAQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080289;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=gwlfwLgpxd7TI5jhGwakNNhK5Cpx63kwwvAOGHRkYNw=;
	b=kF/t+XRMl+hBGhsp7KaBfsu2Jkx8wqOlaAlhlZjrdON5seyZxpwc7UuoZoo1MC5IqR1c
	 /Ztu6yDbgom36qsj470inRjPFGLisvbZntLWcU2QWDR9SQQsxZxMMgb5LUlpnZ06ej+f1
	 f0/Vk39f8DdEaks9S6tTK1EKTKeXLAlJy4sMu6qnO6FClgzTzYajCJyc0LTthdpPw/L8y
	 maHchFaDPpXvR4RcsizKCjuGYW/e4tWhoxLVvQFIurcWCSKOD+N8GaQ0nyDyHULNNN51g
	 DwfBipC43GN4wXCbR57wfuqTUN/8bxvQzhSJPzc0AjwgyzL9wo/TNUAvmLNLoswsl5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gPWssKQc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.12
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A53C606A320;
	Thu, 19 Nov 2026 09:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A53C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gPWssKQc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqSCanPEiu0wZxMf5QypgFlS6ELd3I5tzBhX6G8Zu6k0MdAcmYmpapUc283COnTw0vWcnp+3QdSEwKcOVZr9X22kOs3kNIWizUk4AFl+Cp1vT79OTAHcqVBSNIYif8cGYfYNXEXIFxtfw80tryoy3ofI06ZpGgUgh5Xutwo2MtTu1zfFXtaNwzHzu5/sb+5to+WdR3m3/utId/CSDZwRJHsr17V7AWc0RbnUKeasz0Kkjd4D8YRE6fsPNFb7f1qGL34GMqMD1rNtc8dfuN6UYvSDGr8LTWIlykWXUspw6eRHSSP/Yclac6Hpp/tLKqmafr4sr5xAcDxiX1OgZj/RuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwlfwLgpxd7TI5jhGwakNNhK5Cpx63kwwvAOGHRkYNw=;
 b=YRKwxh5YLFb9KG+HuIdO9aODBhTZEojlDZ+k9gPQebMCg1qmBN9u8I1JjAEdZVwznYoasVurf3lsFqoMxCxgFedXz3zUDT6ojaUuGrYy7jes4pUAjW+gOYbrumBzNi3EcAfcaCpKmT5MVmiCEAuunsxqytFsdnT0VaZcp1qEfGl6LyxksOWhnn3CwoxrKeQNd9YBn/as4A8tD74C9hpDxgdvRqw8dqG2xmZ/2U/nLIF0mNPGtPP/HsF3oPY/V6HOAsGDQ7qzNxNWjm+kYep95SH38mzB5m2delWVmUP/rJp/Hnd8pvMOli2Enc+ZbGgrDgQit/rCMBq6MfqQr5JlbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwlfwLgpxd7TI5jhGwakNNhK5Cpx63kwwvAOGHRkYNw=;
 b=gPWssKQc7n//nx9ck24jSZhiK1BiWHhzgrua5+Sf1CqhmRwFKYQjy04Aa5k3o/Ex1PlBfiJzwU7Mv3y/2w8b8Ejnz7sM3DAF1R1E8Jc0D91tRT56cY2RkupOP8hhy0X8jNUMs+U67GU+gxjUlQGgKdLII0OcCGcGS4QFws/QfYYTBKLnbaKAnxLnevdV0lzByPWRde7DpfTF7YJwqsIQrmsRC1RAMFiljrUaC6CgBhj8YAswEK20Awvxb+BerAzhlkSyDLfmDvxHktmaZGhn99+bTV9b/L6y0rJTTtrKSVgkPnDm92vtCO4f31lSmylzn/xmzL+UpAm6vZtHYIEt/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from BR0PR04MB755739.eurprd04.prod.outlook.com (2603:10a6:2c8:5c::9)
 by PAXPR04MB9024.eurprd04.prod.outlook.com (2603:10a6:102:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:24:45 +0000
Received: from BR0PR04MB755739.eurprd04.prod.outlook.com
 ([fe80::84cb:5d9b:dce:2492]) by BR0PR04MB755739.eurprd04.prod.outlook.com
 ([fe80::84cb:5d9b:dce:2492%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:24:45 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Alex Shi <alexs@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: phy: Delete old 'phy-bindings.txt' bindings file
Date: Thu, 19 Nov 2026 11:24:29 +0200
Message-Id: <20261119092429.2414671-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0017.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::27) To BR0PR04MB755739.eurprd04.prod.outlook.com
 (2603:10a6:2c8:5c::9)
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
X-MS-TrafficTypeDiagnostic: BR0PR04MB755739:EE_|PAXPR04MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a0b02c-c407-484e-1494-08df461ef2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|19092799006|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	DgtHPvzDZili7Ddy1CdE0VSqcWekQJHpfbYfPfvMgsdvawpXCcpAZRwDLd7dl8fdgGII6Xh+dxrjCc0XOYibcoWuzfc0hHcM4Fx8kqlMO3RjI2sbjXX7bPSZDn3E5Xmj44A/MVNHd9AjR9hhyC8QtTaoBtimEMgFCLS/qHRPCrErvm6Bm3elvgsV0YZuJ0vjIs9hpvvZ/nHgW2CJO2fq4gw6iiOxpOjRYot7l5C2ONnsIAIymBMEfzXTJ/iCFFhAb2J7xESsUpHNF4Dz57w0cvJEw5HWZ5dOUQh5hV7rd44hys2jmAeWpKZ+pdKODDU+nyoj7LbPp9YDl+eVVqM/Se6nTWOm7HCCVjFwwoOvJ5LsO5jPOLEWekOgWRyfbvHKtYLQwd+CmObSEOl9OabHfdwBv0CWo/JiRybhcRCUTqzUs3PmCY2/oxdHy7W0/ag1nQCmbjg9sgcCtByKEfOBlYQneFzzR8MulMdcGkBvfAWK8w69xcC58bU2Yd/1Da1H24gJD4ak9Dkl+gbdwyfLSJigFZsLt59pTwAzDCMx7FJsvXm9yFOcxKPOp7oMfsTxI1c414j6OCHElyMDuwKHnr46Im54munemRwGl6qcPYL34rc1MzebWM+WJNKzOJmb42dIF1dpYU3Uf+PZ+26EurwMNu6YHQ1OYL3HQ1ozG3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR0PR04MB755739.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUQ4VjNhd1pIYXBTU1gzQ0tVWmZiNkZKNEZ6NnNYZ3FxOHd0NFNaTjgxU2Vj?=
 =?utf-8?B?QUd3UDVnYUorMVFZc2tOLzBiZ3p3Z2ZFbVhLMVVpcURDaElQc0VzdWpYWWtX?=
 =?utf-8?B?NXRJT3p1ZzNnK25KM2xIZElnNWhYUkRzOURkZ1d1a1hZZjZCS1RNQWgxc0hK?=
 =?utf-8?B?QTVGMkVpMzdmaStZWmpiYzVRd3RZc3JxYjl1YlNwSzJaUWVudjUyRm5iZ2Np?=
 =?utf-8?B?Z3VkMzIzWUliT1NCUzV3ZnBBaU92WUFtL1BPNk9FVEFaNGNZalB6MEIxTjgw?=
 =?utf-8?B?MHE1ZXFCOGhubXZpaXMzdExuZ3hkMEtvcU9KL25SS2R1VTNIMGhPWW9YMWk2?=
 =?utf-8?B?MHdHTitsNDRCSHVZYjdlRkdpTjRqQVBzcklULzlxbDcvRUs4M21DWkY1NWts?=
 =?utf-8?B?TysxaHJ0TC9xNkNJUDFpOWtVbDRQN0xLazE0VmFIZFpvT3dwUFpZbVFHeDdu?=
 =?utf-8?B?YWx6N3NEcEgydEpGTFBobndXMDh1RFV0WkJuOTVjOW9kMnE2YnQvenRVZlRs?=
 =?utf-8?B?SENRT1pwVGE5d3JESStOWlhuMUo3QUxaQlF0a2xEa0Fmbk5TZktJTHBZdzk3?=
 =?utf-8?B?dXBiNk5lRG1PWVl2VE9EOW5JdXJETm5Ua0lrdmkvQ2NtS043UmIzeDNVYXUz?=
 =?utf-8?B?REQzcWpBZm8zMXdLZWNpQU81cjM3bjM2WGVmb1ZTZ3RyZDZ6QWdnM1R3WWlu?=
 =?utf-8?B?bWMrQ2FqcDJmdERRbVJic3hiV1FJZXNwL3JpUzEwMkZMcmNrQmFFbjUzNE0y?=
 =?utf-8?B?NzZJSjBvUzc0ZytpVnQ5MS9leUdYMlF5YTVVeW1oTWdzRDRnNVB3QnVhZDZY?=
 =?utf-8?B?MjhyYkt4NGlHaElpZkU3S0Rsb3N1ZGRqMzZsYXhSMVk5QmtiVjhsRy9xOHdS?=
 =?utf-8?B?aHU4TWdNdUMwUVpwOGltN3VQOTYwNllRV0tHSjhkMHZBRG1zb3hmZXNmbG1F?=
 =?utf-8?B?bHo3L2txZmlKQks3bkp0SWIvUXI2bHFKR1pVRjNzY0cxdCs2bGlpdzVjenBo?=
 =?utf-8?B?d0o3QnIvVGovTTlya005NTNVNEhCRmFaOUtHUHQzK1BVT0d5REhTV3dQUDBF?=
 =?utf-8?B?TE9MdENIWFQwSmpaU1JIWCs1Qitkcjg4UnE3V3IzOFNDMDBYeE9NbmYyYjV5?=
 =?utf-8?B?MXdBTFZEbWpoTXlOS2F6WnVrVUltSURvdysrYTdVbTFTVk1TSExNYWNMSE9D?=
 =?utf-8?B?UEZsYnU4bHdBQ1QxVDdqdHlTd21MNmVmN083UTh2WlVLOTBIUFhKTVBMbVNh?=
 =?utf-8?B?eDFtOG1zQ0RPUWNnZktiZldEZkNqdHVud2dVeEtxMmNuMk1VZUcwdmVwYkFt?=
 =?utf-8?B?ZXlocmV2UWREVlVrUnZ3T2trQTg1M00xd0JZS3JoTG9ra0FnS2VEY0hyUTBL?=
 =?utf-8?B?alRKNGovUlNCOGNhcDZvUjBTMWF6Y3JHWlNVeFFyK1EwR092Y3ZQaVJ2N2xK?=
 =?utf-8?B?NDZiYjRlL0pIbExUaE9uNU9ETEZYSTA2Z3VNay9SRHgvdXoyUmQvbnVJbUdW?=
 =?utf-8?B?VnYvbjJMV3BlMVBscjdFeTU0TkUyR2hKTndOUVlLeUlMRXA1MGJ3UklMWWlL?=
 =?utf-8?B?ZGhYMnNBMDVFSTZ2dmtCL0R4S0ZVR3NVZGNrWlpPQjN5WHNOakhzRnBZTWhh?=
 =?utf-8?B?UjZTYTNMQ0Z6QkdvL05KT3lqYzVyQm5oWVFiMDl6U0pvU05GUy8xbTJpYzJ0?=
 =?utf-8?B?N0tianZKMkowWDRwU2V6ZVM3aWphVHVSY3BUQkhtQlBWbTBvRW9ScE1wTXRT?=
 =?utf-8?B?WU9DZG9GZmVUNnIwaFhtcGluK0xBZmRnanh0cU52dDVtTllmQkx5UmpTdHJG?=
 =?utf-8?B?ZlJhRUFQZU9RWkZTNEtWRmNBL2FJUTJaWnovZTQwU0RDcFprWFNmN3o2bnhn?=
 =?utf-8?B?a3ZLSHN0Q3VJRmg2U2Rya1pRbWpoMXhUYTNTU1VzRkFiY1h3c0VRdVJVaXNa?=
 =?utf-8?B?MTIxcm00c1ZmaUthM1QzaktKdURScWNKdGdPZmcwbXVnSjhLUTIxU3VCNkgx?=
 =?utf-8?B?ejN0S3QvK2tUcUkwNzMwL25sZGUyZ0pHZStrenk0ak5zdGZwQ1BqYnRkajd2?=
 =?utf-8?B?MGh6cTluYUZ5MFFNVjVyRU5EcXVsc3RyQUc2QW1oS0FCUjdlVjkxTHF4ZUNz?=
 =?utf-8?B?Uk5weks5L2RYeU1GeFB0MzFDU2JacS9NM2lrd1FsTCtEczhFTytJNmlJNDl6?=
 =?utf-8?B?WjNlMXJ3UGh1ejgrcGdCQ1FkOVd0bnlkMStRWVVhdjZFNkVuWGszeXZ5NU95?=
 =?utf-8?B?VzBsSFRld2Qwb1RBZEk1ZG83bnByUXNnY0lEWGFlemRVVDk3Vnp6dTVDeitn?=
 =?utf-8?B?ZjZON3d0TFJFNUswamY0elI5cElHNnVtdjZjaXp3L09qUXB3WHdOdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a0b02c-c407-484e-1494-08df461ef2d4
X-MS-Exchange-CrossTenant-AuthSource: BR0PR04MB755739.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:24:44.7569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7Ee59k0pv3YcJv4E7oChPFArtTR0Kbeehybz0zsisdlI/G8ntxnvQpJAnrDkVKvdwZYUN2SrlV1v/M9jOs3ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9024

The generic PHY provider and consumer properties ('#phy-cells',
'phy-supply', 'phys' and 'phy-names') are already described by the
phy-provider.yaml and phy-consumer.yaml schemas in the dt-schema
repository, which are applied to all nodes. The old free-form
Documentation/devicetree/bindings/phy/phy-bindings.txt file therefore
only duplicates them.

Delete the file and remove or update the dangling references to it in
the remaining binding documents and in the PHY driver-api documentation.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../phy/nvidia,tegra124-xusb-padctl.yaml      |  2 +-
 .../phy/nvidia,tegra186-xusb-padctl.yaml      |  2 +-
 .../phy/nvidia,tegra194-xusb-padctl.yaml      |  2 +-
 .../phy/nvidia,tegra210-xusb-padctl.yaml      |  2 +-
 .../devicetree/bindings/phy/phy-bindings.txt  | 72 -------------------
 .../devicetree/bindings/phy/phy-miphy28lp.txt |  2 +-
 .../bindings/phy/renesas,usb3-phy.yaml        |  1 -
 .../bindings/phy/rockchip,inno-usb2phy.yaml   |  2 -
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt   |  3 +-
 .../bindings/usb/nvidia,tegra-xudc.yaml       |  1 -
 .../bindings/usb/ti,keystone-dwc3.yaml        |  1 -
 Documentation/driver-api/phy/phy.rst          |  4 +-
 .../translations/zh_CN/driver-api/phy/phy.rst |  4 +-
 13 files changed, 12 insertions(+), 86 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-bindings.txt

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
index 33b41b6b2fd5..aed7176d1d5d 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
@@ -30,7 +30,7 @@ description: |
   Pads will be represented as children of the top-level XUSB pad controller
   device tree node. Each lane exposed by the pad will be represented by its
   own subnode and can be referenced by users of the lane using the standard
-  PHY bindings, as described by the phy-bindings.txt file in this directory.
+  PHY bindings.
 
   The Tegra hardware documentation refers to the connection between the XUSB
   pad controller and the XUSB controller as "ports". This is confusing since
diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml
index 8b1d5a8529e3..fa9bb1232dfc 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml
@@ -30,7 +30,7 @@ description: |
   Pads will be represented as children of the top-level XUSB pad controller
   device tree node. Each lane exposed by the pad will be represented by its
   own subnode and can be referenced by users of the lane using the standard
-  PHY bindings, as described by the phy-bindings.txt file in this directory.
+  PHY bindings.
 
   The Tegra hardware documentation refers to the connection between the XUSB
   pad controller and the XUSB controller as "ports". This is confusing since
diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index fbafe8eb150b..7cdccfad3872 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -30,7 +30,7 @@ description: |
   Pads will be represented as children of the top-level XUSB pad controller
   device tree node. Each lane exposed by the pad will be represented by its
   own subnode and can be referenced by users of the lane using the standard
-  PHY bindings, as described by the phy-bindings.txt file in this directory.
+  PHY bindings.
 
   The Tegra hardware documentation refers to the connection between the XUSB
   pad controller and the XUSB controller as "ports". This is confusing since
diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml
index e9237c58ce45..6b84d3e7fc5f 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml
@@ -30,7 +30,7 @@ description: |
   Pads will be represented as children of the top-level XUSB pad controller
   device tree node. Each lane exposed by the pad will be represented by its
   own subnode and can be referenced by users of the lane using the standard
-  PHY bindings, as described by the phy-bindings.txt file in this directory.
+  PHY bindings.
 
   The Tegra hardware documentation refers to the connection between the XUSB
   pad controller and the XUSB controller as "ports". This is confusing since
diff --git a/Documentation/devicetree/bindings/phy/phy-bindings.txt b/Documentation/devicetree/bindings/phy/phy-bindings.txt
deleted file mode 100644
index c4eb38902533..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-bindings.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-This document explains only the device tree data binding. For general
-information about PHY subsystem refer to Documentation/driver-api/phy/phy.rst
-
-PHY device node
-===============
-
-Required Properties:
-#phy-cells:	Number of cells in a PHY specifier;  The meaning of all those
-		cells is defined by the binding for the phy node. The PHY
-		provider can use the values in cells to find the appropriate
-		PHY.
-
-Optional Properties:
-phy-supply:	Phandle to a regulator that provides power to the PHY. This
-		regulator will be managed during the PHY power on/off sequence.
-
-For example:
-
-phys: phy {
-    compatible = "xxx";
-    reg = <...>;
-    .
-    .
-    #phy-cells = <1>;
-    .
-    .
-};
-
-That node describes an IP block (PHY provider) that implements 2 different PHYs.
-In order to differentiate between these 2 PHYs, an additional specifier should be
-given while trying to get a reference to it.
-
-PHY user node
-=============
-
-Required Properties:
-phys : the phandle for the PHY device (used by the PHY subsystem; not to be
-       confused with the Ethernet specific 'phy' and 'phy-handle' properties,
-       see Documentation/devicetree/bindings/net/ethernet.txt for these)
-phy-names : the names of the PHY corresponding to the PHYs present in the
-	    *phys* phandle
-
-Example 1:
-usb1: usb_otg_ss@xxx {
-    compatible = "xxx";
-    reg = <xxx>;
-    .
-    .
-    phys = <&usb2_phy>, <&usb3_phy>;
-    phy-names = "usb2phy", "usb3phy";
-    .
-    .
-};
-
-This node represents a controller that uses two PHYs, one for usb2 and one for
-usb3.
-
-Example 2:
-usb2: usb_otg_ss@xxx {
-    compatible = "xxx";
-    reg = <xxx>;
-    .
-    .
-    phys = <&phys 1>;
-    phy-names = "usbphy";
-    .
-    .
-};
-
-This node represents a controller that uses one of the PHYs of the PHY provider
-device defined previously. Note that the phy handle has an additional specifier
-"1" to differentiate between the two PHYs.
diff --git a/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt b/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
index 89caa885d08c..02334039bb38 100644
--- a/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
+++ b/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
@@ -103,7 +103,7 @@ Specifying phy control of devices
 
 Device nodes should specify the configuration required in their "phys"
 property, containing a phandle to the miphy device node and an index
-specifying which configuration to use, as described in phy-bindings.txt.
+specifying which configuration to use.
 
 example:
 		sata0: sata@9b20000  {
diff --git a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
index fe57c5373d18..90cb1b2e6741 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
@@ -39,7 +39,6 @@ properties:
       - const: usb_extal # The usb2's external clock
 
   '#phy-cells':
-    # see phy-bindings.txt in the same directory
     const: 0
 
   power-domains:
diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index f50fc69fbbe4..6576e3dd0dfc 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -106,7 +106,6 @@ properties:
       phy-supply:
         description:
           Phandle to a regulator that provides power to VBUS.
-          See ./phy-bindings.txt for details.
 
     required:
       - "#phy-cells"
@@ -135,7 +134,6 @@ properties:
       phy-supply:
         description:
           Phandle to a regulator that provides power to VBUS.
-          See ./phy-bindings.txt for details.
 
     required:
       - "#phy-cells"
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
index 02e971c39d81..9722d6c968f8 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
@@ -14,8 +14,7 @@ associated PHY that must be powered up before the pad can be used.
 This document defines the device-specific binding for the XUSB pad controller.
 
 Refer to pinctrl-bindings.txt in this directory for generic information about
-pin controller device tree bindings and ../phy/phy-bindings.txt for details on
-how to describe and reference PHYs in device trees.
+pin controller device tree bindings.
 
 Required properties:
 --------------------
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index c6e661e8915c..eacf5759bd71 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -94,7 +94,6 @@ properties:
     maxItems: 2
     description:
       Must contain an entry for each entry in phy-names.
-      See ../phy/phy-bindings.txt for details.
 
   phy-names:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
index 9252d893f694..824df36cd3f8 100644
--- a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
@@ -46,7 +46,6 @@ properties:
     description:
       PHY specifier for the USB3.0 PHY. Some SoCs need the USB3.0 PHY
       to be turned on before the controller.
-      Documentation/devicetree/bindings/phy/phy-bindings.txt
 
   phy-names:
     items:
diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 0865c2e94eec..29013517f248 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -220,4 +220,6 @@ DeviceTree Binding
 ==================
 
 The documentation for PHY dt binding can be found @
-Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+- https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/phy/phy-provider.yaml
+- https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/phy/phy-consumer.yaml
diff --git a/Documentation/translations/zh_CN/driver-api/phy/phy.rst b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
index 0d7489081b90..d194b903954a 100644
--- a/Documentation/translations/zh_CN/driver-api/phy/phy.rst
+++ b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
@@ -209,4 +209,6 @@ DeviceTree绑定
 ==============
 
 PHY dt 绑定的文档可以在以下位置找到 @
-Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+- https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/phy/phy-provider.yaml
+- https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/phy/phy-consumer.yaml
-- 
2.25.1

