Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEBA346E4A;
	Tue,  5 May 2026 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989864; cv=fail; b=icbmv2wZ+8eO7x7irQ/aLRQN1Rv/tjhZed176ybdnV/NxHV7CEy2qKkcLeQUIdPTccsKlITqptDP/5z9V/Bt955SjnkLQdhC1Wy3VWoBO6R138pZCxf4Nz57fj1qxM6uJwSfdAuWgj6irFKsyTJHcuJMgpqo0vD5uSOJ8+pGJGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989864; c=relaxed/simple;
	bh=8HSUW7tYF+wmE1HXf+Hm/yfzQUHY5UA7RdfinC9BA2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ckk22P0xGWuZCQ+kb9Ea79obZhBCTPIhD+XE1Rj2mlg3s9y1P43eKwtTLlhiyqAgFyKcuds5NooU47pwotHkffNnYtVFMBKVTjEisBj0UMo5renU6rSitRe/wj3U7r9tXGgUOzQnp5ioo4ygoazQ/s0PVPA/F6BgwXQT8tT3D1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kCcj+ZWX; arc=fail smtp.client-ip=40.93.198.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kCcj+ZWX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDKoqI+8DqOhUIfXzpI/mUvkMTx2wotRUcKWHBhECHkgb4t5XnOgLmB33qnHkQ90jg09uajwyqVWX+2U0PwqA+51GL2zW8slT6bw00sOh9xqCo51ID23pfzdw/o65RLeHFmTeY1D904kyHVFpv2J/rfvWs8B0e5mWgGFsTYp6dQmP4/IaO9nkvELMJ5cAImomZaWr1mFS9nUlcM23XLHBSJxkvxeeJAzGrGhovwFiqkq2m9NgrluRt2Ql3Zza8oQINNyA3/7c0YbKHFv9u9z1bRsYu1s4eRmZ5vFIOMDCd6+ikpg7W4Vn2lskNSD7vtb/z3lGuifksj3xuACoS7DVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hhhj5oMpDd+GRyuE9zBKK0K4jVPt43LmA7ONCjdLxV8=;
 b=F/s4B/UYYNvQYNEhfa9n4qYdTrUF7jbwl0C+ttqszbiKv7ZCoL2ca7W8EM/jMtrrrPPkNL15CojW/rp3j9nh2sATMSEDKXuThUkVR8MAmDr+jjWIC94nbMh/NmvIojExSHSiOGwHRARf6bmPMW6J5k7PdbW1xYt7dHP3o3y+7asWSNQxhuTMIRp1VmAhCzl+6e/HXDDLVtLGfs3uDSfHWXzhIqaa2gV2f7e3JA7JdgA7J3RzChKRiIKkmy/39vOF+9CW98us1PXABp9WID7D6wGSoL4E5iY4AmwN6/GlsFc0wmtsz27LglIo/Fti0fQC1VXWLnwm5F9lO7sEOpxUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hhhj5oMpDd+GRyuE9zBKK0K4jVPt43LmA7ONCjdLxV8=;
 b=kCcj+ZWXVOl/1Afq7wXgTvn0JSBYnX6WSpzHg5fpkAA+HzRvAubA3EqfsN/lTcYBe2WWwuq5KgiDOtWXclWMunrZw6wA0A8pfMot5lFLl9+8wSmiwtBPeTuEKRmJu+ZCwok0pYPTXcRoDrAKQt9slB6r8FkBI62453Gt8I7WWYU=
Received: from CH5PR03CA0018.namprd03.prod.outlook.com (2603:10b6:610:1f1::18)
 by MN2PR10MB4224.namprd10.prod.outlook.com (2603:10b6:208:1d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 14:04:20 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:1f1:cafe::f7) by CH5PR03CA0018.outlook.office365.com
 (2603:10b6:610:1f1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 14:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Tue, 5 May 2026 14:04:19 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:04:13 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:04:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 09:04:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645E4Dfl3111242;
	Tue, 5 May 2026 09:04:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
CC: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees
 Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux@ew.tq-group.com>
Subject: Re: [PATCH v6 0/2] TQ-Systems TQMa62xx SoM and MBa62xx board
Date: Tue, 5 May 2026 09:04:12 -0500
Message-ID: <177798982187.338501.17984364296514390891.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
References: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|MN2PR10MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b223a2-1d89-496b-3e4c-08deaaaf33e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5igFGVQT8SNAVUMD8iPgIQNqRFEsdZ6ns28SooPu5h3PMzMQ8iwKVwPZxIDVjixGmgpXxw97c7zh29AuBL/rywUbX2nrLYHV00pmc8YYpRRy2t+i1uQLGIqguCaZS5NJsAOox1kzPERqc5uM90Qg+4UwposzdBWgeIaCSn7Fm44IuU+bJGfqZinF9+KzElSShIZ2qqF1yAOUPTxheSURClwHAzRZt2deNFAJGPY30NDFbqed/ooeGb2nvBatxc9nYJPraR+8BFMGEMJGx5MJeae1Ed2CLx+T+H5EAEXXWk/0SFXdWVZ++6hwF0pnFNbC5G18ZJ12M+CfkX5HHj+EzENKxE96m5v+ZDjGNliRs2O1MUAcCVmUIxSbhEkioCny+MHqWz3nrQKY4htvWGDr+CdyJ5DUaOzC0OuLr1wmip87+dGYepHgUKDWGsZ45LpgspeLETHw2l6+LjUSaAGl11HDgzeADWsrM504AMum60Gu8UGqO2oAqaRZFDpJo7f7S8iM2d3EMF8Ekhltlc7a5jH7nYSPudzru0XGnUA5MXGsEL9jdIHXZt/RIGdN7y2TxnTOKZa4woqW0aE1BRJIPomt41ityeqVFmzOJCvXbvGQ7cGEBYwlhDL4npEX/ToqEf/dBvIIRP2T4LVRAvMVnEjSMn7YSAVSBGmbTX8cdD0T5O7hwoYYfNDmew/156GsUOwUalJHnKNxtm+C5zLcRdEins9VrpTazeLB67z/1OY=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kELdhoUz/Ixf8HIl/c9j/ZUnRPEHZEKGvBmbp71cqkS+xvI86oDjLXdwwuzlfDO5ixpovXxQ708TKXD5qv6kVkgEb/LK98/N5GBrPdyJjPU+bKKHCVu+Veeyu992+HsF6FBWxChcUFAWerwTfOXRPsYiICB0Rp/RU/142qLrKADzuO1kq8eslZqyzdyT/j3KunbEtjdMa68x55JxLyvicjhJSNGuFDR4sgDGHUOWLB/8V8KgL4Q/ATdNmiDQrvbtGwlYx5AyBbp+Bzr8zj8PfGeuyQ/ikNp5GSXR2oGD5gcVQxF/HBHzTks3MnLqXOFPaKj+lJrVB7NbuWnkCXinSlWf03JEn73lXcuaten4sQ6nEZ17/dV4sjnM6kNp+Neh/Ae8xiCIuP6GKmPr1W2/uY2SxsPF7xWk6QkzskhNfpHru48pUhSxMe7+GVUEHVSg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:04:19.8839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b223a2-1d89-496b-3e4c-08deaaaf33e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4224

Hi Nora Schiffer,

On Mon, 02 Mar 2026 11:14:57 +0100, Nora Schiffer wrote:
> This adds Device Trees for our AM62x-based SoM TQMa62xx and its
> reference carrier board MBa62xx.
> 
> Not yet included are overlays to enable LVDS display output and MIPI-CSI
> camera input.
> 
> Changed in v6:
> - Update author information following name change
> - Rebase onto latest ti-k3-dts-next
> - Disable incomplete panel node
> - Add various comments to explain why nodes are disabled
> - Extend comment explaining disabled 1400MHz OPP
> - Use consistent comment style for pinmux
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1]. I did
some minor fixup for pinctrl-0 formatting, let me know if things are
NOT fine. Thank you!

[1/2] dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM family and carrier board
      commit: d8961140aecdd68a57ac1ca11327964a709d5ae5
[2/2] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board Device Trees
      commit: 5b36d8c72c91d0f213c712472caf03192e373c0a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

