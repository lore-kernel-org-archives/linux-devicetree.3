Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2A8279DB6;
	Thu, 13 Aug 2026 06:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602917; cv=fail; b=Tg8Yp7q72bidc87npOdGV4O5rbdc/2ZBAmxUW3DGIUQJi6Cpxf642LXXVdUcTy5WYp8HjLi7XVLN1EdflaRenk0fBzV+xnpiYFwPu8RyMVVak1/p1bHaQZKrvWLlyVDCvp6rKffaZYKNOnp0MNqweIXRVj/AYq8JEpbByNlS/bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602917; c=relaxed/simple;
	bh=Ogj9iojuaKZZ0AP2lmIosUJ5nN2i67fUpBSb9cKtjfs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NKnzZgut0egqS006ETPicDmHPSBSzmrP48V2C/jeq5ohdhpX3omWR0Wvd0kkXGVJs+5zKASIwW4o/7tZ03krDy8/OokiRhLjVZ5nqymoCbnOkl7xbBspNn7mel0rwszkL/o1PdzCHyPEYtEoJupPAM0HTUWTjmEdhBO67GXNiL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=nnmC78x2; arc=fail smtp.client-ip=40.107.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="nnmC78x2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqGXmtQJEaLWd+NHPSL1yKUrJhAgqXNBr9tKPMhcGSEuzcOd4cjROF6P+U9/LW7yJAaift8+DCDGdn2yAci98iRP7kVvFpAUcoQNvKSNgqbnshVY6KdS7Yvxn3vqXXkyugg5rBRxEmN1eLTnGEFUI2kfrUn4JsF4aRK4xgTx6NrIhWHjtTDRbxt11lzoxY7d9vx3aokVbWE9nw0EaO8ZSYfQ9aYTYHaYAtSREi8EI3JDLv/Oy1yFmbZCmwk3HPDZlJx05L4vWTwDmgX1Ix1UPiMf3PqRLHasRKyH4hePRjl09aafPK+sdXlaaM61rUIcrwjh/thP2MeiNNEc1WAnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnJxIW7kOtxTQXxEIaZb/DUMrW3qYTwPAppuOMgadjk=;
 b=K9BIi0bXR6Co+z6x+CLjSlj+lmA9q2086JyekekZsnAuP/Jf2BDWnL0QGat4wCXRZALK1Y1sDl5KoC1rKuNwUcMWwwSrl3fMliSGTDdDvZizdm0lZ98QuNi0JlHf0olp/HNQFLJgzzDvBBUw6paInkd+Q/maXXO7AI6mK730AAsJRxEryd5x5oDDOprexMqQQ8yXJOSQymUpXBx1DdApruANkR8lNkKcoh2XX76jXfgkENLRh0vVXAeV05W5ezuogVOtmNRAkjVb9mPGJ6bLyFsPIHvS+bHOxwmiXUMlBwBDTk7nYx6x9VG+UmFSYpAroRQDTtSkytcP9KNSDImSvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnJxIW7kOtxTQXxEIaZb/DUMrW3qYTwPAppuOMgadjk=;
 b=nnmC78x2nSPhhql4wtj4eA0gA4zfvd5CcT9VXDNcnAb5pyNZCtw5K9A6z+znwZMhXpcGCXP1PXfB7L/vCd8Ii6DcS6m7rZqwSZ47LQtmPTdGUAorGo4FUXgOXoPHIJfsFTINDmZDWSAQT2qTOETNvXYGQlk+TPOWnBaIBPIXJkoVrm4q4kevmk4qbqNBJyVGTdwqk/jWIm9DzYoVHQRokRQrj/mRcYohoT50yt+QDz0iEiDjCEfng7SzfscoaaX/iak5dMKv+kAI0mYeUMdKsrS3vqauULwYzKdVs2cw1rxxDS0M4SEcA4SJnS+TfKF9+UxxT7Drb8rg9t8HDcLbkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS7PR03MB8266.namprd03.prod.outlook.com (2603:10b6:8:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 06:35:13 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 06:35:13 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] stratix10: Add Interrupt support for asynchronous communication with SDM
Date: Wed, 12 Aug 2026 23:35:06 -0700
Message-ID: <cover.1786600929.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS7PR03MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 426853bd-4225-4873-58d0-08def9050783
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|5023799004|11063799006|10067099003|6133799003|18002099003|55112099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	6pIy60vpAjWe0sKjKH0660Iay6gEp55I7DcpCWOlIIOWyf1oKgqBy0qEA6cfIERELIAKavbzzY3ZAPUcEFPqg7QxwPU7240X2eXmO/l1Z+VXY5bBB6UpqioS8LSEXbtaigqJFcKWSQ9Exs7Hj01SYodyvsl2gKySBuEbTVDPzZXSf3CYJSeNAfaZL4Y4gdOqu+j78oYVlhBDdIZwd7DqAC/N6MLurM/7t0kJC7KTvXHpa8m3k/WQ9BlmlBax9TEit/D/sGFcWMtSOMV+/Et+uIym0opCjuwEBTHCOtotaNeo75jC3dhX+IpuNPi9OE6eOrOb7lQIo3EdFptDEHnQ2ZEfbu41KOch9iGm3Bnt8BIW3OU0Vj7HdTV1guCiyY1BflhxTSTPXnih/QrNqZtCAyugrVUpqdO3QE+KfYejdUHHJjayuK6Armnv0fFb6OylmEvsFzAhkJR1JT5RYLkEwoLQlhH0C22uUZlnzQNEsjtjMg7srItDkg4bL5wSJ0kTvbfg04dzUFY9sC/d9LbSPazeVFYdmFxEm4Kw2Gh8EuRemVq7VqMFYjNJL1QpdC++KAxKueNrez5gZtf8pzDB9nKD5KDP/oeTUjDzZz9kniKWquUfTy20hOyFeAfugATHyoQ4YrnLOggPniJUdQIAb5Z3KfCj+VDdsvqKXXV6v+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(5023799004)(11063799006)(10067099003)(6133799003)(18002099003)(55112099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bwGiBYyNn6WIEiXSKT9AK7vrX2M/+PmtI8WpCZlorPzBP32z/0XjwkyHU519?=
 =?us-ascii?Q?H5BErUyVk2wb0X549uC/2hQiTvgRBu3BDxiTj+FZnapGNbHE18OZ0CnNekkP?=
 =?us-ascii?Q?YWrDNZ00ILntGaFSPNLNHIi7bpurxEP9HsxbajcNjnhdnSoqZGbRxcMVDZpo?=
 =?us-ascii?Q?fX5uUTpQx0Ho5cjIyziQ/L+hr40VYN74ivoTLmMhe8bocQ6X5HSLxWZ1l7+O?=
 =?us-ascii?Q?fCPDQf1LeX+xjXUurY9fq5lA8NTSG8pETq9LvWz0PpR5rlgzgXl8pxS8oj4q?=
 =?us-ascii?Q?2DBhfZyGCSPAbUVX6+pE0x9ekQ9p+60K31gHI5xUgA9f9qJgNXnhtWXHXvyj?=
 =?us-ascii?Q?0Bt1vZjUtBS/PqYB51zNDPQC+9Jki3xCG7CEkeETTZtH2o+80OwnI0YF6vBn?=
 =?us-ascii?Q?lkKq5xKP662mir1wW6OPbASXSIi4w1kuAsCzpBNrxyAFuVHGpwSf2HtzaqU3?=
 =?us-ascii?Q?mirySF4tKWhZxEFKfzT2NCGcTWuZYrvHwAP89SIkt9uYVSfYWxOzKWCpWQVe?=
 =?us-ascii?Q?S6trFN63RrI8nYIS6AfzBs63XJacWWvtVqUoKGmjwKowge8rf+AYo2t2Sw8h?=
 =?us-ascii?Q?MM3k1OYTFIW9xnqDV0oStnVE/goNsTbjQsGSl918mqUtN2Aj0M7rNoGqOAoV?=
 =?us-ascii?Q?QaR0vXHzPzBJoeIvLoaAqfAwadRag268pq4rcP6uQTPUbCo/Caf/TCIpQxJH?=
 =?us-ascii?Q?VTHLjymhaka1QzPBe/aMKobgoJnsIP0q6Z26/nfN+9uJ19UxEDu+AVYbRPeP?=
 =?us-ascii?Q?wxoRnqEU1uOhkT369G7bmSGzpO5PeAcFEjnQFJt1s69pjnKdMqHy+P5rZdIo?=
 =?us-ascii?Q?qfobaPmIeobuYfwraN0y8agOn71PLPQ/kneiafqR3gwLMhqfGBFUdJ08ozAc?=
 =?us-ascii?Q?MH59Vd6CaH0IJ9YRBlWLGFj5Nz9VH46PuQes9jMYDXTNCzMrZd7EMSAychp5?=
 =?us-ascii?Q?Xb8Q4GRrnsPzyNB+CrbsU1Djoecq52BpaQEAZllXpZaMahP/i2aM4WwNX9he?=
 =?us-ascii?Q?jLGZMRlHlLuzzrws4OR9Es2VZfn2xwoqz0jpvsXbx44ISihbayPafP9RYRYm?=
 =?us-ascii?Q?GOTBmGaiiz1rToti+ZPZ6LVhWci9eg0HKQQ4eJ7Ia4eOVcSErfCU5NFB6Mam?=
 =?us-ascii?Q?GBeUZqSnCmPlCcF76OjQZY5uxugKLnKMFVW9sOcWWwecok3NwPJmY4SustN1?=
 =?us-ascii?Q?ivXt2FgtsfNNa7fnfdUSLYgRhKqdeJyfI/u0KBdWS8RV+8jr3xgkDjtkAuF3?=
 =?us-ascii?Q?/SPq0Ju/uBWWvp9fIK/qiEa6veOpxp/LAzzJfvmXj1ZZ04osmjPD4Sop3jCK?=
 =?us-ascii?Q?ltT5iWdu/WMXAdtCsDDetCfDh3HMQnnh2FE4z5NPZFVKPRE3+818kfQuJxmY?=
 =?us-ascii?Q?a36Q8W/VKTDHlmNUhJQFArnUqOsn8BUvMuIT9PEDuZGm6+CtX/nRkpayxXzT?=
 =?us-ascii?Q?md0/U8qtASXNfZeGmcfdhbQGngfml/qeWLu7+XwZ6E3bMrkBZmEqxOOpw8nF?=
 =?us-ascii?Q?cqLxkz9WOhjVjMt+v1CmrgKQ5nmUUIWZrnHAPPtS/Zir7hnV6qpLDOsLkQa9?=
 =?us-ascii?Q?Xfb5JjwSkXrgf4QobOMEa/h1noXEX4SR5wbtgSXMaAaJgJXP2+82Z0BgXVxw?=
 =?us-ascii?Q?iFRKF3BT+H4fbejfBTEbZ9iJe2hJn2DcjRqhzanZrJi7yYzfs2RFznOVBU71?=
 =?us-ascii?Q?rCVaicrgk3rPOSoCiXq8vhuSfliRCXYNlIAlnGRMWcs4vCsg23+vkGndPsFl?=
 =?us-ascii?Q?4TVJK2IYRQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426853bd-4225-4873-58d0-08def9050783
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:35:13.1878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtS6OxNnJfI6YIxTDlRqHuZpX/ODex/2v2wdz91V2yWoNBz5ogIpQiAMWQDsem1OJgfAUhXWO43b9SEGlsJf2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8266

From: Tze Yee Ng <tze.yee.ng@altera.com>

This patch-set adds support for interrupt from Secure Device Manager (SDM)
to Stratix10 SoC for asynchronous communication.

Following things are added in this patch-set:
- Add support for interrupt from SDM to Stratix10 SoC.
- Add documentation for SDM interrupt in Stratix10 SoC.
- Enable SDM interrupt in Stratix10 SoC.
- Enable SDM interrupt in Agilex SoC.

I am taking over this series from Mahesh Rao and posting v3 on his behalf.
Reference: 
https://lore.kernel.org/r/20250812-sip_svc_irq-v2-0-53098e11705a@altera.com

Changes in v3:
- Reflow commit message body to ~75 columns (fix Dinh's comment in v2
  review)
- Add a newline before stratix10_async_workqueue_handler
  description (fix Dinh's comment in v2 review)
- Treat of_irq_get() failure as irq <= 0, since 0 is also a
  failing value (fix Dinh's comment in v2 review)
- Fix IRQ disable race: only call disable_irq_nosync() when
  queue_work() newly queues work, and disable the fired irq
  argument rather than actrl->irq
- Do not invoke client callbacks under trx_list_lock; copy
  cb/cb_arg under the lock and call the callback after unlock
- Use disable_irq() + flush_work() + devm_free_irq() on
  teardown, and treat unset IRQ as 0
- Demote successful IRQ registration log from dev_alert() to
  dev_info(), and demote async poll failure log from
  dev_err() to dev_dbg()
- Clarify INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ kdoc to match
  a1-a4 bitmap usage
- Drop Reviewed-by: Matthew Gerlach from all patches
  (no longer at Altera)
- Link to RESEND v2: 
  https://lore.kernel.org/r/20250812-sip_svc_irq-v2-0-53098e11705a@altera.com

Changes in v2:
- Separated from the larger SIP SVC upstream series into a
  dedicated interrupt-support series as requested
- Link to v1: 
  https://lore.kernel.org/r/20250722-sip_svc_irq-v1-0-c5b9e02c1ce6@altera.com

Mahesh Rao (4):
  dt-bindings: firmware: Add interrupt specification for Intel Stratix
    10 Service Layer.
  dts: stratix10: Add support for SDM mailbox interrupt for Intel
    Stratix10 SoC FPGA.
  dts: agilex: Add support for SDM mailbox interrupt for Intel Agilex
    SoC FPGA.
  firmware: stratix10-svc: Add for SDM mailbox doorbell interrupt

 .../firmware/intel,stratix10-svc.yaml         |  10 ++
 .../boot/dts/altera/socfpga_stratix10.dtsi    |   4 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |   2 +
 drivers/firmware/stratix10-svc.c              | 135 ++++++++++++++++--
 include/linux/firmware/intel/stratix10-smc.h  |  21 +++
 5 files changed, 161 insertions(+), 11 deletions(-)

-- 
2.43.7

