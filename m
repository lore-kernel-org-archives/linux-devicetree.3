Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019595;
	b=09WQQ6CQ423oqM4BL0IWDQmfRG0qFgDqCGlxwaC4rO3rsvQfHcc7fQJLUrzfnWcF2YWH
	 LVF5nWlJIEqRlBnmTc1dgnmNUxWscd2efw1fH+rrWK7zE5nvBjIy91HY73ipKQ8/orNJv
	 DPOYZbHUZ4kxnVgS7ksVHPt8Ci23/v3aTHVZOmkIcOmEPC/OwccStJDNllphRIWOzuKtT
	 lMZ9SDn2DR5p4IJpTLTUJC3NmtQ01Te6hqjth9fXuG24moyRLVlOpzkj3zG1rzXT9FrTU
	 aNMth0COfwfEnsf5LzCPKMQ9c2J303+6AfMKhyDY3O+pAJ4WVDgqVzRtx67x37zsXgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019595;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=e083wJLL9/C0SKvH9Wbj+iVEKusU44832JaNnH2hhfc=;
	b=02Htnj8F0w3j64ib5OASsOT53S4j5BIewkbcNu4FSeXEvAa5/S9ZxO/viUixdafPCgAL
	 mPFWDwXZj67a8xPt7VaBIdKFuqNVwTHP2yJVttx7rh5N3+DMr4XpjUAY/8MjzrHqyjkmX
	 N3Rsacz/1n6r4+cmhqfr0s8+8r2jXhuS9mdY4+LlAmu4+wbAT4rdOu5DtpWOiX2ZhN/36
	 T3YwXeclpkBTx21GZ6BKLSJnCJOlZfo4GrNJSWBcbDAdu7wn5Q+1oP4lo9aESFEQfPvrp
	 XPZ2R0LdksZmMOJhcFWKaF78iVEo2QKpQqBqAC9fSETjo09PEyf4ejmKNGmq2oHpv1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DpjMKrAc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.28
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E50E606A7DF;
	Wed, 18 Nov 2026 16:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E50E606A7DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DpjMKrAc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFBlIAZ6i1o4Cq1IUxquOr8tjeJNKJEYeNZNb+2DZarmxOYDnMINbTP6Wd/BQnlnXkakyERHq+nuNr/ZTPX9yJutay98KM0a8ALIbsfGL1rT7TLuyt3imuawH9ATwx95L81C6MtgAM+ZHCkTx9asles7o3cGNjohlrkF6Y6GiAlCmHwr6SS5Ae0DFT7vnT211KNBKUqR/tg98FgMbXO0/tO7/uSf505SzCrO2hu+At8HEiH/XBnmpKU5AaTg0Uf2RSQCyothZnzzbQYbatI/6mvg1UfPEhNXvsZnfVCjt0hvhzTUX90gO6H1u87Xp9WE8kUVUodl4yOzi2bVYmXwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e083wJLL9/C0SKvH9Wbj+iVEKusU44832JaNnH2hhfc=;
 b=gt2Muhv7FLUtrKut8Nt+wE91WnQr14YZ0yiyjbiSsS3ZgRxQZUDuO/yKPkuW4K31v39cIwti23OdEmbclTUZJD2cU7536KUHQ9ZCRc+wZ6CNLGuPjPVxQBISbuE4fSa4uJXJQyFyT8FLt5ozZtQXECjNvaaxVNpw5DEykits3qSuICm8IfgtIlyywEyT4fNcvP+WwbL0oBGgQasoRGao5+gkz+chA/DfLRp74dtCsWVUBe1DB9CUPTYlpdcHlgvOB1MPYXxqyszuG+BWShRoYOHIIkg2F5nKAKu8yfhEKVPsdmHD5H3z2e62t07etXmHWZ1XpA556aHUvpv23cWL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e083wJLL9/C0SKvH9Wbj+iVEKusU44832JaNnH2hhfc=;
 b=DpjMKrAcvMDyFclG9aZUK+xtgna4LNG9FQyJNvSvAyHUE5QXqBNv9g5lUOYc0uyYNQDn6CpBzcatd6ipRJw2G9UuggEkrBz7kGVMB9LGbgriss49uJMivtKMSnbIapLhLGn1UjYbDQ1u99CKNey99gDJFa8O+DPfARTMSm0EQm2yc+5l6jwhIoezHQsNs4B/JuQi30smp4Gnfl6PtkUYmpEQ88jqqygmygR9blu+8UKoUDG9PK8JD9CN6Y1oA9mureeGr3diokA4yvsWO/j1UIgMk+V3DAsG6RMFQrDicIALxWG20ABdMAyPmPvOxQPLVowQ+eYEo8muXSFShxmI2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by MA9PR04MB766428.eurprd04.prod.outlook.com
 (2603:10a6:250:10c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:33:05 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:33:05 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 3/3] phy: lynx: forward the phy_ops to the downstream PHYs of a lane
Date: Wed, 18 Nov 2026 18:31:34 +0200
Message-Id: <20261118163134.2149894-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
References: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::6) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|MA9PR04MB766428:EE_
X-MS-Office365-Filtering-Correlation-Id: b748c2bc-6cfc-4c9f-d403-08df45919f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|261021123027099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	tb9bA6zDddS7oerJVUCsx5C3PNTKEr30b8HW75PeK8Keh454wtSjrn0g01MfG46Fszl4WurgbeZqFw/UIg01MZ4ZSlroAGtk7oq5A5npEzRnhmz0c5V8k+IgXs1BGGqh1HPXU+cyRr+RQLFWccZBuC/rmcJPBGjh0QFXi1Ea8jhG/1G+D00ygQEd9t4sr8VpFDaJQwGhVkm9LEeXCl+XLZ5zWdlvtQV5zqKl5YDjRJKVCaSg/J27AOZ27b+MvKdXPNvSiMycMqComHH5Jz1xpqRZdcES9vBMkNNBGK3XtNxHzBttCldu6mXxWoPj7o1zoGoUu8H3X2AHrz7taEy3bAe6I3Vdt4zisd7Zw0yxx2I2QrSuNXgcaK0trNlagls46uMno8emlucbkhLqAzPugKt91F90ZvKUE1P05TJM51T4E9XYZ7E8dDH5TYbVIX0mRm0yMSxS0PGCTC2KZJQMzbAAbAtOYlmLBQN5VZtFi01rfxTl42/ZPY6biTihPliwMNA6N2V+nqn6brXWo1FiIdQU9srFuX2DtlSo8Hoc4IVj9QwZnna794fPypU/K7LRfE+vrjji9VECB6MXS+1cMU5oVJxT0Ecmz6220b85tYBOhJzBEg8B7ei+ada4PDuU6SY6Dk8noix/lXG86wv/tHDy4tb9H7owXdn4++Rgm6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(261021123027099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DNQGMlXoNOEX4ywyGxLQdn85tf9IlIwR6zjmONj/dyyjGB5YaMDLA+zAuZfd?=
 =?us-ascii?Q?S2k9+EFYSanItO1hIfVMgvk1/R3hrevY1l/8APsdQPM9C/3BZ8RncTwC1/TQ?=
 =?us-ascii?Q?MrVD0NtfyZAZn7g3uGvaf1tmlVd8HyvQ6KqEYBxYT9QQ/vxa1FeXSSf9Qsn0?=
 =?us-ascii?Q?u5+RJqAnWoRbuowey6VC4Eop31Y38ySV/kcHLi2QQ0mIfyibFXh0fMhocdu+?=
 =?us-ascii?Q?Y/cPkqbBbzQD60GNLVmjCbLiDw6bbDe9lAvZmCgAjL0XT9VarM40a3BCEolF?=
 =?us-ascii?Q?DJmZiBBtw1jVzoA5vgHq/s+1sZx8W9soF5L2nzgJQHCcZW6Yt33QC+K0gyum?=
 =?us-ascii?Q?raMUeQX/bfMow9HL8TytaSX4Z7AwTQpmb+yw0Iaf9uyvU8pzuSwvlVXDVhFi?=
 =?us-ascii?Q?YrTv/H3QwhpAHpjSdjvVvFzlsIQpH1yXF84UmrYN1qUC+RsqdCh+dKbd3dEX?=
 =?us-ascii?Q?2HryRZY+E+yMZyKw8V6/WZBhjCu8voS1CSlcuLluME1+grWCktqPxxBTa7x+?=
 =?us-ascii?Q?3n3lNuM/ttNH8W8BbdUF9dlwHYYLmpDT16ULiU+cYgcE+88CBpVgXqyeQkt2?=
 =?us-ascii?Q?a7C+UKyXN3NrwH1i6ax5NfRvFDrs42eo80GYTqy93J0GALdFoL+udZZYN3rL?=
 =?us-ascii?Q?iUtWNv9d/CX2mVcIOQcCd451587M4LN9Sh5BeB5N64K8w/g3IRsuI8PpNE5m?=
 =?us-ascii?Q?x98Xlm8eeNQjYaI9Mw90z6fSV/zsxwsOY/0EQFc6+6+LQGmZMJ6smxP7hBX+?=
 =?us-ascii?Q?c5v2nJD6AtO1W5sgAw1blqv0x3M1NwAs+p6DAN2Rku39AzIfPw6KomTmBpvZ?=
 =?us-ascii?Q?yye3qSolgHZWmQ8pzEFF6ME+biob+0CMhvUOKgsdvh5UWt1E15ykqcYpDlJW?=
 =?us-ascii?Q?EREUreDxXzY6ZfoodqKlUbYqFKVcEaq0UwGKuBRFf3OsvMWzdjWMzshm6lxc?=
 =?us-ascii?Q?DoITDdJtAPRKl0jQbtmRcSJkKFPweuoFjDmWReWvbypzHEWSrG0mHNzdzlRB?=
 =?us-ascii?Q?PKy4tZ5DpLkj22nHjjKnBMuQRaKpKOoJ5wvPQtdQWKUPnhwI4auHe9nDqf9K?=
 =?us-ascii?Q?AaTzIjW9rpuyz5RZ4VEX96lGMl85hVluTNkkg75lk8sHsg/FbfAM+ToafuFE?=
 =?us-ascii?Q?nneDquY4qn0nuhdWYqi1MTbntLH/AvHSCYHHuZu9EhA2tlhe6JzNsyS4c1pw?=
 =?us-ascii?Q?w1/Cccrj1OTObwp37XbhA3fnSOML4GnMmxYGDlxFA6OrZYRgDMsS4SYflKzI?=
 =?us-ascii?Q?vpl767gxaM5qOvk/OklrXCByf75dfURq2XIjD5rs3VbBe4Ghjkxx+9nsemC5?=
 =?us-ascii?Q?xsxrR0jcs9IO46KJJREHc3qft0mI5d6EgSfzOWfrMDfaGbGiJLoCd95X9kHh?=
 =?us-ascii?Q?vEIqGq6GlnzdUti9K2lQQ75Nd4yZHv/Xm4XffRbQXOx8oUcdfNu+fto2d5Ny?=
 =?us-ascii?Q?h2djfxUf4oDGk1orUSIEVSO526Anulaf3rGLu3nlLJV6vtt3DxMMmjTIrhtS?=
 =?us-ascii?Q?LOi4fwdZpA7bjzQpa1HEsQxd6F+alS55iLfYVESuad42HYGWyUD/2JfLUfhK?=
 =?us-ascii?Q?7hXIsO+yGlB8RmDFd7RvT5ZToeClWolM5CRfXNAOKqrSHWtpbmMzjTssYiOl?=
 =?us-ascii?Q?3qZ3EQi5YEPrGpO3jrNb+eBjagyMqcHQVXl4gqCcNY8TiWYvvcghXPKrKiTy?=
 =?us-ascii?Q?CuA717fEVQTsaY19AabRIvLT28ehPE5tgcvO7DVhtb+Ur97S17E5FNCj450+?=
 =?us-ascii?Q?CSdIRG7NdA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b748c2bc-6cfc-4c9f-d403-08df45919f4b
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:33:05.5986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgWAoXz/cDE2UTGxn9gqUTmI6tgmG9GvsoBpgGffOkgXeprlgHR8SxdgH6KB2AuVFpnk5hkYlQelc1Pzts/vjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB766428

Now that the lane has the PHYs listed in its "phys" property, make them
follow the lane. A consumer, such as dpaa2-mac, only sees the lane PHY,
so it is the lane that has to bring up and program the retimer for the
protocol that the consumer asks for, and report as supported only the
interfaces that the retimer accepts as well.

Forward init, exit, power_on, power_off, set_mode and validate. The PHYs
of the lane are called through the phy_*() API, so that they keep their
own locking and counters.

Errors are handled as follows:
- init and power_on: if one of the PHYs fails, the ones already brought
  up are undone, in reverse order, and the error is returned. If the lane
  itself fails, all of them are undone.
- exit and power_off: if the lane fails, its PHYs are left as they are,
  because the PHY core keeps the lane counted as up and the consumer may
  retry; taking them down now would do it twice. Otherwise, a failure of
  one of the downstream PHYs is logged and the others are still taken down.
- set_mode and validate: the first error is returned. A PHY that does not
  implement validate fails the validation of the lane too, since the lane
  cannot tell that the PHY accepts the mode.

There is no rollback if set_mode fails on one of the PHYs, because there
is no previous mode to go back to: neither the PHY core nor the retimer
drivers record the submode. The next phy_set_mode_ext(), which dpaa2-mac
makes from every mac_config(), reconfigures the whole signal path.

The forwarding is done once in the core, for both the 10G and the 28G
driver. The core ops are installed on all the lane PHYs, whether or not
they have downstream PHYs, and call the ops of the driver. They are
copied at probe time to take the .owner of the driver.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/phy/freescale/phy-fsl-lynx-core.c | 206 +++++++++++++++++++++-
 drivers/phy/freescale/phy-fsl-lynx-core.h |  10 +-
 2 files changed, 209 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-lynx-core.c b/drivers/phy/freescale/phy-fsl-lynx-core.c
index 307427b73d40..8a2e9ab8aebb 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-core.c
+++ b/drivers/phy/freescale/phy-fsl-lynx-core.c
@@ -374,9 +374,200 @@ static int lynx_lane_get_retimers(struct lynx_priv *priv,
 	return 0;
 }
 
+/* The PHYs of the lane are brought up before the lane, in the order of
+ * "phys", and taken down after it, also in the order of "phys". If one of them
+ * fails to come up, the ones already brought up are undone and the error is
+ * returned. If one of them fails to go down, the error is only logged, so that
+ * all of them get a chance to go down.
+ */
+static int lynx_init(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+	struct phy *retimer;
+	int i, err, ret;
+
+	for (i = 0; i < lane->num_retimers; i++) {
+		retimer = lane->retimer[i];
+		err = phy_init(retimer);
+		if (err) {
+			dev_err(&phy->dev, "phy_init failed on %s: %pe\n",
+				dev_name(&retimer->dev), ERR_PTR(err));
+			goto err_exit_retimers;
+		}
+	}
+
+	err = lane->priv->drv_ops->init(phy);
+	if (err)
+		goto err_exit_retimers;
+
+	return 0;
+
+err_exit_retimers:
+	while (i--) {
+		retimer = lane->retimer[i];
+		ret = phy_exit(retimer);
+		if (ret)
+			dev_err(&phy->dev, "phy_exit failed on %s: %pe\n",
+				dev_name(&retimer->dev), ERR_PTR(ret));
+	}
+
+	return err;
+}
+
+static int lynx_exit(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+	struct phy *retimer;
+	int i, err;
+
+	/* If the lane fails its .exit() callback, the PHY core does not
+	 * decrement its init_count, and the consumer may retry. In that case,
+	 * return directly without calling phy_exit() on the downstream retimer
+	 * PHYs so that we avoid an unbalance of their init_count field.
+	 */
+	err = lane->priv->drv_ops->exit(phy);
+	if (err)
+		return err;
+
+	/* A failure of a downstream PHY is only logged. There is no point
+	 * stopping and returning an error.
+	 */
+	for (i = 0; i < lane->num_retimers; i++) {
+		retimer = lane->retimer[i];
+		err = phy_exit(retimer);
+		if (err)
+			dev_err(&phy->dev, "phy_exit failed on %s: %pe\n",
+				dev_name(&retimer->dev), ERR_PTR(err));
+	}
+
+	return 0;
+}
+
+static int lynx_power_on(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+	struct phy *retimer;
+	int i, err, ret;
+
+	for (i = 0; i < lane->num_retimers; i++) {
+		retimer = lane->retimer[i];
+		err = phy_power_on(retimer);
+		if (err) {
+			dev_err(&phy->dev, "phy_power_on failed on %s: %pe\n",
+				dev_name(&retimer->dev), ERR_PTR(err));
+			goto err_power_off_retimers;
+		}
+	}
+
+	err = lane->priv->drv_ops->power_on(phy);
+	if (err)
+		goto err_power_off_retimers;
+
+	return 0;
+
+err_power_off_retimers:
+	while (i--) {
+		retimer = lane->retimer[i];
+		ret = phy_power_off(retimer);
+		if (ret)
+			dev_err(&phy->dev, "phy_power_off failed on %s: %pe\n",
+				dev_name(&retimer->dev), ERR_PTR(ret));
+	}
+
+	return err;
+}
+
+static int lynx_power_off(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+	struct phy *retimer;
+	int i, err;
+
+	/* If the lane fails to power_off, the PHY core keeps it counted as up,
+	 * and the consumer may retry. Leave the downstream retimer PHYs of the
+	 * lane up too, so that the retry does not take them down twice and
+	 * unbalance their counters.
+	 */
+	err = lane->priv->drv_ops->power_off(phy);
+	if (err)
+		return err;
+
+	/* A failure of a downstream PHY is only logged. Returning it would
+	 * make the PHY core keep the lane counted as on, although its own op
+	 * already turned it off, and a later phy_power_on() would then not
+	 * turn it back on.
+	 */
+	for (i = 0; i < lane->num_retimers; i++) {
+		retimer = lane->retimer[i];
+		err = phy_power_off(retimer);
+		if (err)
+			dev_err(&phy->dev, "phy_power_off failed on %s: %pe\n",
+				dev_name(&retimer->dev), ERR_PTR(err));
+	}
+
+	return 0;
+}
+
+/* There is no rollback if one of the PHYs fails, because there is no previous
+ * mode to go back to: the submode is not recorded by the PHY core or by the
+ * retimer drivers. The next phy_set_mode_ext() from the consumer reconfigures
+ * the whole signal path.
+ */
+static int lynx_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+	struct phy *retimer;
+	int i, err;
+
+	for (i = 0; i < lane->num_retimers; i++) {
+		retimer = lane->retimer[i];
+		err = phy_set_mode_ext(retimer, mode, submode);
+		if (err)
+			return err;
+	}
+
+	return lane->priv->drv_ops->set_mode(phy, mode, submode);
+}
+
+static int lynx_validate(struct phy *phy, enum phy_mode mode, int submode,
+			 union phy_configure_opts *opts)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+	struct phy *retimer;
+	int i, err;
+
+	for (i = 0; i < lane->num_retimers; i++) {
+		retimer = lane->retimer[i];
+		/* A retimer PHY that cannot validate the mode, including one
+		 * without .validate (-EOPNOTSUPP), makes the lane fail as
+		 * well.
+		 */
+		err = phy_validate(retimer, mode, submode, opts);
+		if (err)
+			return err;
+	}
+
+	return lane->priv->drv_ops->validate(phy, mode, submode, opts);
+}
+
+/* The ops installed on the lane PHYs, for every lane. They call the ops of the
+ * driver, after the ones of the PHYs of the lane. .owner is not set here, see
+ * lynx_probe().
+ *
+ * The ops of the driver are called without checking for NULL: the Lynx 10G and
+ * 28G drivers, the only users of this core, implement all of them.
+ */
+static const struct phy_ops lynx_ops = {
+	.init		= lynx_init,
+	.exit		= lynx_exit,
+	.power_on	= lynx_power_on,
+	.power_off	= lynx_power_off,
+	.set_mode	= lynx_set_mode,
+	.validate	= lynx_validate,
+};
+
 static int lynx_probe_lane(struct lynx_priv *priv, int id,
-			   struct device_node *dn,
-			   const struct phy_ops *phy_ops)
+			   struct device_node *dn)
 {
 	struct lynx_lane *lane = &priv->lane[id];
 	struct phy *phy;
@@ -386,7 +577,7 @@ static int lynx_probe_lane(struct lynx_priv *priv, int id,
 	if (err)
 		return err;
 
-	phy = devm_phy_create(priv->dev, dn, phy_ops);
+	phy = devm_phy_create(priv->dev, dn, &priv->phy_ops);
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
@@ -400,7 +591,7 @@ static int lynx_probe_lane(struct lynx_priv *priv, int id,
 }
 
 int lynx_probe(struct platform_device *pdev, const struct lynx_info *info,
-	       const struct phy_ops *phy_ops)
+	       const struct phy_ops *drv_ops)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *provider;
@@ -423,6 +614,9 @@ int lynx_probe(struct platform_device *pdev, const struct lynx_info *info,
 
 	priv->dev = dev;
 	priv->info = info;
+	priv->drv_ops = drv_ops;
+	priv->phy_ops = lynx_ops;
+	priv->phy_ops.owner = drv_ops->owner;
 	priv->big_endian = device_property_read_bool(dev, "big-endian");
 	dev_set_drvdata(dev, priv);
 	spin_lock_init(&priv->pcc_lock);
@@ -467,7 +661,7 @@ int lynx_probe(struct platform_device *pdev, const struct lynx_info *info,
 				return -EINVAL;
 			}
 
-			err = lynx_probe_lane(priv, reg, child, phy_ops);
+			err = lynx_probe_lane(priv, reg, child);
 			if (err) {
 				of_node_put(child);
 				return err;
@@ -475,7 +669,7 @@ int lynx_probe(struct platform_device *pdev, const struct lynx_info *info,
 		}
 	} else {
 		for (int i = priv->info->first_lane; i < priv->info->num_lanes; i++) {
-			err = lynx_probe_lane(priv, i, NULL, phy_ops);
+			err = lynx_probe_lane(priv, i, NULL);
 			if (err)
 				return err;
 		}
diff --git a/drivers/phy/freescale/phy-fsl-lynx-core.h b/drivers/phy/freescale/phy-fsl-lynx-core.h
index c2ad81a9144b..88a9de75a134 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-core.h
+++ b/drivers/phy/freescale/phy-fsl-lynx-core.h
@@ -70,6 +70,14 @@ struct lynx_priv {
 	struct lynx_pll pll[LYNX_NUM_PLL];
 	struct lynx_lane *lane;
 
+	/* PHY ops defined by the driver - either Lynx10G or Lynx28G */
+	const struct phy_ops *drv_ops;
+	/* Lynx core ops which take care of any possible downstream retimer
+	 * PHYs as well as calling the driver callbacks. Cannot be const
+	 * because the .owner field needs to be copied from the drv_ops.
+	 */
+	struct phy_ops phy_ops;
+
 	struct delayed_work cdr_check;
 };
 
@@ -115,7 +123,7 @@ static inline void lynx_rmw(struct lynx_priv *priv, unsigned long off, u32 val,
 	lynx_read((pll)->priv, reg((pll)->id))
 
 int lynx_probe(struct platform_device *pdev, const struct lynx_info *info,
-	       const struct phy_ops *phy_ops);
+	       const struct phy_ops *drv_ops);
 void lynx_remove(struct platform_device *pdev);
 
 const char *lynx_lane_mode_str(enum lynx_lane_mode lane_mode);
-- 
2.25.1

