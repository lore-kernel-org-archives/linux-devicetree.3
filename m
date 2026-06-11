Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022099.outbound.protection.outlook.com [52.101.43.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE1367287;
	Thu, 11 Jun 2026 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209170; cv=fail; b=I3qR1QVtBVlXxLJVaCtDKMvOZrrWiPPpCPg+jZBYnJLMyo66rwoip/kWXV2IqMkt9aVCzQJSaZ/rWPWtjf7iG+I7pWN3iBf8tYDCMGQs7uep4m6a7TdorU3ticNlgmTqH3C7qBUmDWhpOfD2qs7wozISG62sVjuhoDRyBo5sxlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209170; c=relaxed/simple;
	bh=CQOXp2+L8aY62Yh/+xoyoMo8PWREEIc3QzD9iqMBY/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LxNIQllb7XXzHKvwt7lNtuHyqrr12gsCXhDAklJkT7hICNEv0pgWbKBCeOdPEUlBqSUuHHEfj0xe6M/kG6QhwrdsDBKE8RaXXQo9QFsFHIXhM9sBznsGXxKXQEy38A7lNdl98V+FqCLKIlS27dGYOVNo4WLXAyesAKOr+FDQi2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=DpXgQBbx; arc=fail smtp.client-ip=52.101.43.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="DpXgQBbx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zzl1Du/UuTn5uFs7bdldWhmdrMVe222XUAJy7kQLpgEsx0jBBF0o+T3iPDcycnHwdQwUhwYa4tWoE7e2WgM4Z9RuVYIuIoVg6K4w1mwhq/GesQYzkNmgjdYF2clAvfvHCAcDxchtiLqzbxY5MNLAdgdE+afozwvmx4Vh6HAxmsBQiqfl5tRkQZQq8YOL5Ob10im2BRQRG5Ocb+7oEotAZVRP2h55nqO5eKYb4/vRcGhfdbrjvdfevBe7fGwpRZS7nqikChgtxirwbnP/tMpORBhiLzzoO7tYeet5cms8Ap1f6WzwYLXID2mr2lUkcw8WjZ9AB0HMSJIyJT2yfICH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+dYadGWFOqd7KcSHu8BnbgElb2TEi7r9IQjzygBJ3c=;
 b=h5gt6+fIxCujh+qRZH04Bd4W5xcTxbFSnWTxndM7gse4EBLU1QVJvZXeLcRK3QIYlH/R8TMAXycWjT90U8TRYdEQ33NoYMRHTT760dRcQSaGQdZBgbCnmdxEA8DcNNG96Ag/ralv/kNaFvi3GgyNixSYASCkoZIyMlVNRMOFfKttwELWeILkM605/exeOmCaJLgfAp0u2s46qI1YJKe0jy0g0TR1cMAIbmiqVK9BUHMgo7LxUS8/7rzyJuL59n/AifHr1AXZxWBeF3hDXFnW5oaimoL0vTzi0lHuuNmFUVN/GM91WdaUQPBVk45+wSK62QE+QGMewP52h8w6ektXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+dYadGWFOqd7KcSHu8BnbgElb2TEi7r9IQjzygBJ3c=;
 b=DpXgQBbxhQfM/L0QLNFNRZp7X955c6DTn45G6CspeaezzKvJ0qpnb8wW9ty9TJZzF3rLzMnaGOYuMvEWEBh5xSBzOgpGYvJiRrhzpUW4y6tb1m5uxMLq76SDy2qWO0jSS18GPMwi10J3dYClkSKdHtl0zzOz5FgnJqeTUnWeE2ezrCosUrPAea+6lkb/zuTVZdVtyfSpF0Wxdw5926mHq/oMqu4PLXOOcS4TYBiPMzxTcVQDzRle4aS4ea6CDD3yDUwzuz1DIsWDr1jHN0+SFTPgNXe/Ap8ctBKRaq95ctgbUPMB2sLVkTz3bO1Rszos2w5W60QlMxgFR77BbDrllA==
Received: from SN7PR04CA0219.namprd04.prod.outlook.com (2603:10b6:806:127::14)
 by PH8PR18MB5333.namprd18.prod.outlook.com (2603:10b6:510:239::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 11 Jun
 2026 20:19:22 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::9b) by SN7PR04CA0219.outlook.office365.com
 (2603:10b6:806:127::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 20:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 20:19:22 +0000
Received: from sw-build-jenkins04.axiadord (unknown [10.4.1.35])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 6FC234186B51;
	Thu, 11 Jun 2026 13:16:48 -0700 (PDT)
From: Karthikeyan Mitran <kmitran@axiado.com>
Date: Thu, 11 Jun 2026 13:19:14 -0700
Subject: [PATCH RESEND v6] MAINTAINERS: Add Axiado reviewer and Maintainers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-00bdcddc0c29@axiado.com>
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Tzu-Hao Wei <twei@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Harshit Shah <hshah@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=kmitran@axiado.com;
 h=from:subject:message-id; bh=fdns1mTxFg3dZbGt8+Km5Ro989C6XVxx5Foxq9uBn0U=;
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBqKxhJEmj99aKo+jOFGs3ITInsmV5hYbY3Gsw7B
 KP7n9nL64+JAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCaisYSQAKCRD8pK92wMW6
 z+vvD/9kNiMnYpBwWxdtv5cKOzAtl0Smdb+5c4bNeosm2n1EUYWzNfDpZpX0MYDa4u7vodlcThP
 SO0o1WRMiyCfG8IB+XOUvLXauMdeVmhPOoj+BPegfN8yENTMsq7Gc9LbmKSBMPLA0id/BZ47YVL
 /LcFXnReytlIjMmHqHV9s1vF1azLd7hfp86aLsuclCgBbvwcPl08l/HjVqP9Xpo8qg3Og8T2Shq
 qul+KD3gv6YBBSYRJAWHKbhjveSP+zlVeb1E2+4NVQinT4w9m8cBQPJ9EBAi5GSB/Or/Ko4uoe0
 EcLp85auzl2pLaGoh2BVxr4OOJux+EMKzfga7CjdnDR7pRrvhNvkoznlHMSOPqBuz1gGqYNNZna
 /XsNKA7HtM38Cjbp2O5sw+/MFaa62o7D5qPnxgU14sZQue2aSuYEZ+gd8DxOdY9Z8vyOlsfyw5X
 dsjQM0r+2qkFLS/wXAOTScgppur6IhyzJvXXl33JG692Iu8bJ6PfJP/u1oUrNiLhtcUEoE4NwTA
 zGPcOxJmSmYGmYl3oGWBziVVzfNL0DEJk/YrrayyOuVhDWMWF3JGGO4t4P8KVZRqN5OlNVHoNR1
 y5T2mpW6YxPvMiAwn9mjhi9sp4OrfYpsCKIXyAx/nZ5YGgDt9iDpKHWJWL+gTz8VPaNgnl3mHX3
 mG3K6UZe0g5BCoA==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|PH8PR18MB5333:EE_
X-MS-Office365-Filtering-Correlation-Id: cf14e84f-1ea7-427e-6fcf-08dec7f6b9d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|56012099006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	VRc/KoqcopDE74pMp+0gNnDIrKTDO++wt28OYTVCSXe6jTHxlZ8tMxY1yTLFzStWidVzWgXeF7pqZBj9K8V8tx2DA4OTBl78ht+1WASsqbyZPXcek3qeL+p0B1GaCocwgDvDr7KjPJqV9wA1sP510IH3hRoBAYuk8iodStFmio5a1SPeWeE6mDCGROS4HXCx0dQT3Ivkkn79FXNOYxYqIx/UE+cbST2/nejv6o040pSJKG1AMSRIJDr69/vlze/uVSbdqvs833kM80moKHurB2HMVATcGdHuLO2GUsDZYEWxo8fQ0+87HBi6c3OIOrX51NosIdoVnBs3w8HYbwaBVz2bh6kbUJeR2j0QvEjFukLD56q/ny+ivnpjFhh9/22eKNhqzr0hwaYae7lzObhcIlXtYVN2vcxXKBXdoV14LM1aNse3AfD0KeqXMI1kWJJ0zxs7zctjLRdItIcn3VHUD2NaJuPYpDmnb+7To+nlkZx6bszlBszUNxbp0z+BXCZYwe5v6POaRj5UfFYhPNtN2YqtFJtSf61id64ukUZZUhMz5wiNjy1D3LWPGJgpfaxVx3TX7cB5NsX0QdpnvZ4TSZw+mOqE2wY3Vz55H1X6Cce3xPCAgiZIa/iRQl5hnpdSVDqK15zZorzvzWnh/NdNZ7ASuSbRmWY/j5JZDGeeJ7kTApZxowNZ7wKxlmc4W9e98PPJfzy9l4+C0PwfexIKf/yh4e4r2Qid067ju8+kkoc=
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099006)(13003099007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y22zHhANwJ4aSblmJ38Q1akBH3uP81TPjg0In2xzc7ZC/cyrLJI/J8bnBf3zrFbU3dhNpc48yU9WPRzKd/u38caTLYgNowmSePnTOKKpL5ge0OC28oxQ/ny+pOmaa4lZIiDIbEhFw0sp/dL2K15PbwtzFk6KNklE3kezkIooiD/t+7D5PlwRLr6WHPVbA+5jvmbfX+ufcp+k4MimOSWXN0VvbIMQB1alXvWy9sKqaWbrISlZh4PgWRw8Z+bwbBcyCugoFXyACPTHpcvNio23tMPxADDBreQDhzwfDhcxel5SicH64nm8M17Irl2oBsCApLS0GeY0qGK4PbNhn/7peGzDeoHqaz6GymIFVgBSAI7uqkAaC5oUYc6S4t2aWNws4lq51uRFplastY8jBe6JuTqkrsS0i2PjKUQn116UVYamcTfzJ8ZAH0nI7lXAa8er
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 20:19:22.5429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf14e84f-1ea7-427e-6fcf-08dec7f6b9d3
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB5333

From: Prasad Bolisetty <pbolisetty@axiado.com>

Adding 3 new maintainers Prasad,Tzu-Hao, and Karthikeyan
Removed previous maintainer as the previous maintainer moved from project

Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Acked-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
----
This patch removes a Axiado SoC maintainer and adds 3 more.

A maintainer has moved on from the project, so we are adding three new maintainers (Prasad, Tzu-Hao, and Karthikeyan). also commit message amended to have the same.

Patch 1: Removed one and added 3 new maintainers

Changes since v5:
- Removed review mail-list R:Axiado Reviewers <linux-maintainer@axiado.com>
- Link to v5: https://lore.kernel.org/r/20260326-maintainers-addition-and-axiado-ax3000_dtsi-update-v5-1-648dfe9bff29@axiado.com

Changes in v4:
- Updated commit message to clarify maintainer removal and additions
- v4: https://lore.kernel.org/linux-devicetree/20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-0-84a5c9df6689@axiado.com/

Changes in v3:
- Updated commit message
- v3: https://lore.kernel.org/linux-devicetree/20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com/
---

---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..b1349bd178cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2605,7 +2605,9 @@ F:	arch/arm/mach-aspeed/
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
-M:	Harshit Shah <hshah@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Karthikeyan Mitran <kmitran@axiado.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/axiado.yaml

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053

Best regards,
-- 
Karthikeyan Mitran <kmitran@axiado.com>

