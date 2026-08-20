Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FB72E1746;
	Thu, 20 Aug 2026 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787263753; cv=fail; b=uFKhKdD88OC8tauHGKX/61JyrehUn7HojpWWxFqODvH34YGLNP1ld2b6YkZSFkleYGe41faqPgPgU0595fcDswHpfOuOVpzE2RhqnSFuQTFjtqs4FS0iH5VllEznkd7p+ZR96ToH3w0MqDnWMEuny9fCp/tYmY+V++uweZ/OUAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787263753; c=relaxed/simple;
	bh=uTNhEFsdcVomvWABev/GzPLLO/6f8VP7ynR6Vn2iJas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BOVupQeOQwGsNISvkUMIz7yvHNoPkMZrScukGodjI2/SLnm01+zMAkudOTlMGDHhkBYoODo9wLVTcctrKYZWhX1AEgJzW5kMbKwTVN9QknFzBDAMPa0+yiZiCl/6i1rqBCtwZlJtNSk136rtJL3ZdWPxChsZsNTy5kq68DMd2e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LTwR8gof; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fBXzAkYo; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LTwR8gof";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fBXzAkYo"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK6n1v1537724;
	Thu, 20 Aug 2026 17:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7U80iGMISVougWbd/NPBfp22+DBjUE/mT+u0ueWcq
	UU=; b=LTwR8gofbT5HvDj/dYokjXFpUpVmzAzJ5BFCtgya6+7mff6ZRetNJCCp6
	tJj6mEf9/cSFjgtMWnq+8AjsWECBAW4iO9IrIe56Kk0x+h2AfIaA5/hJboqcfsSn
	ew1fTO4f7nzfwofNWI9Qtg5kUGW4CNBZ+R2LtNIfLM4A1EE+WErA7DTT/MR8PMtm
	Mh3BDsdjijtILA7iNSP3jvDbpUdxSRxcj2ALGE3HoC04TLy2sIGjIcXylX7YidL+
	661KeIPMUtUXvU6wz/uiyw37WHy/GyZPVhtLHgmttQwXAhxpdgrul/uFEyHyLwie
	kZpgC4AVm3lVi26vWWkozWxv8Aknw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5qrkep3f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 17:09:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZShWji0Xsbun/+Clmh5DCCDDnwCuuTJIJ5vn7K4to5bFLbpIiEXsJrfaNvhyoVRy7+f4B1NItOzI6/6sWDOfp7qlcjQZBdtc3OkkPvRlAHkSZKa02BVLAi1DtsM6F9EE1j6Wpox9atwtn/M9xinln8HwLVLP1NxsncXv7J+O5kzXi6FburJdbYE5eT4E6wAwrYeYGpLlmW6SSL8I0bcAbtWIt6Umur2ScDn1KwPjy2xHk62HKkt29oQgCD1DFl+dIuUF9V/isJpNN0WQrMVcG47yzyxupwW8LRQ+Sc6fSJpqoEIUOwlh8varFpXu4QrOcS7T/tSv/dNzB9KZ5jadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7U80iGMISVougWbd/NPBfp22+DBjUE/mT+u0ueWcqUU=;
 b=sH6ZHBm4CI0/lDom1wA2QixCI9560F/A9SoHSnZzZxTebc5JTDC3LfY/KdxpB3gZGarLyDuqvqoWr+y3JTuZOhHLTP/16VKzf/3hHeSeuJ1WtxZTB5VeYM5Sr7FSJcGJ+h3THMcgNOBdIXc37oddAuqwgJMsZpM/MTOqgWf5cMB9GCNZ8NNPoGfyj7/fDeNb7E2B4KIyLaeStBpXjrAwy2QqlrN5n/YvHfH8nIYjUZhOtehyfKoYQovSZOwaEqkii4b9heQF8/lMcZ1+TcnYNAzwLhJmE5LhW9fikovhsUZV2qGs/wD/oyyrO4FbSWlN5iJHJ8BzbYUulWDohOtPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7U80iGMISVougWbd/NPBfp22+DBjUE/mT+u0ueWcqUU=;
 b=fBXzAkYoAQ0jJks8e4ujRBybmoYBbM2/6kJrgPO0lmFfa1f+sVYh5xlltzWx8YNpo5fsRXizLGM+LZXQ0AWWA+Fln+HSlimrzajIUQUR6hd798Uh3ruyJtcVwUU9CKOkQwXgPN8qdvlnjS9U98RjT8KK+sCQyZsYQShJmAVq87k=
Received: from BN9PR03CA0950.namprd03.prod.outlook.com (2603:10b6:408:108::25)
 by MW5PR10MB5692.namprd10.prod.outlook.com (2603:10b6:303:1a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 22:08:59 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::a) by BN9PR03CA0950.outlook.office365.com
 (2603:10b6:408:108::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 22:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 22:08:58 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 17:08:52 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KM8pf4933246;
	Thu, 20 Aug 2026 17:08:52 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 20 Aug 2026 17:08:54 -0500
Subject: [PATCH 4/4] arm64: dts: ti: k3-am62d2-evm: add out-band-wakeup
 property to m_can devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-smth-v1-4-e1738a38d58e@ti.com>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
In-Reply-To: <20260820-smth-v1-0-e1738a38d58e@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787263731; l=1243;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=uTNhEFsdcVomvWABev/GzPLLO/6f8VP7ynR6Vn2iJas=;
 b=uKAdzbXEEOD3CI7vEVtyi50FEch5djEEbA2lT9SEId7EwecCEn6HlgSx0uIxHvwib/U0HPWax
 lQ9QPyLV1mqAxy+KokF8Mq43Gg1F5MTMt1LrX841PUT+y8Vw0yaKh2s
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|MW5PR10MB5692:EE_
X-MS-Office365-Filtering-Correlation-Id: 506df459-eb4f-4cb8-1044-08deff07a220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UmrkzKdZkb+X+UZr02/SIK54GB86uPyh5dmnfrpdq4b2WiW3Oezs1pMyUPEN2UuTBiz2fQtCD14VWvJVcVu1XgtAWsl1Yftf+GzHL+rmD3vO7EAJ1ibX3UolpegXXM8czXYiJ49BRpZT5XHRSYiV/He7gR9IHeREtZu+s6pLE3YDfhtNAVzzQvLAhx4av2+CeUPXgLAq2X3VVb50I0VIZKFfqBhdl8jcMjOlMUCrDd+uKp/IZ7IiwcBHFFDoXKE55gRW0Dvvjk1qIK47p+00ao7YCyVfPRCY4cFgh1TadJfJkQwYDoajCU3BSyNI+KCj3+Oh/RcDbPZK3zQ9RnLAgeQ7j9hX3CMbKfwy+LTzLHlAr/B7eOX9iNQsYKncvAzRrsliIk48r5w0pz6VawJZQZb0oPQtOGnVdtiB5MK/CBawn1frRvEg1FjjnC4jKgU5t2skFyv7NQOjLuI3eCdnz2MR2P0xT9QEcK8fHmvheUo2ZHQ1XkE7O9pSWEz4A0uHuRowvq80OddSFsuRP8XTDNcN61NaVDYRR5nAXsNT1hiv+mNb0GZoh4XiKe7QJEYWlXgKCtCr7xHNc7Re9TSrGPOUfmGzc0J0YCYyk87WD4+Z54Eqeno9aDi8Am3qCAJ5lsD5uuEwSQMSad2gxEOnaX8e99ugpaF4ARTeB5Wx+DwRa8qwYXs6N3HDgn97PvjDYoYc1NR/8pfc3cGdKKeMGA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n+0HMnBLMpew+jMO04HzJ/lP5PeyfHU+wuC1qR7bpNn4e9RrXKP17uomWIY3UX7p1H4fSARA8FD/Cv51gSSYEj0oKEueSku4OcP+7K1t9bqIePLGkDp8d3YCLyy81dsGUA9plSEraNZxCIwwrQ0ErUUjVuhhOP/kcYyUXd/5kOFJuY9WjhDYE7N7OGad9S3ldaSG3nDjVLnyPxDzZnQNst6i0d/5BcqXArKQuUTdp4UGgO1a/KT5ORNjKtWntBXOGMYr7bKuYgYG9Ed2YN9KjhcThDhCqNQpbTdgMkMCWKKx7xTbcmMXNHns3R+vHBOdN8h0Y90Wl497FdYgOTOt4X89TcFf1H9IXllzR6XsIyVuQOLs6syJEMfI6p3YcG+x50ALdCBnEJZZQxmcYbGVzSVfIYLYkU0hIHptRFPWOTwWkzI5X/li4YbVKfcidqO2
X-Exchange-RoutingPolicyChecked:
	lOBthe/mC+GUGP+BY8uNmVH6rLyXATuKWquE7yQ5sVC1CY39ZDSzsDygkPETkXItPdR/fEExPKMgl9XbK5UEKQ7XEILCQxtLTy0e/lp9uE/AsdrJllzkoiYe9n3UD+rHwenWzd90akCpM1uDqHck074MwnehD00ACNYt/xdB+oD6CfYJful8CxiFJ3mowLmuD2D14ThTKe+7skw9J8lNpY6+P9hG2v7u9o3m6d8ZPZkluUEjsG2yn3tAayECWqnBPxPsVQB6anerWB8jdm4S1noDoznwkDomzY6zUJSC/dzLE5vtdRfW97cPHUl6Z30jrEY21GfETCbBR+SZ/tB05Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:08:58.1878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 506df459-eb4f-4cb8-1044-08deff07a220
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5692
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NCBTYWx0ZWRfX74qtaMDRFcBZ
 o8I/KB07wuUstoOb/QDbfOZCgzxU4+5UY9lO7Vniwgw2kB1zpP6pAiNkSoOkKkyYRI3yeqwp1Zq
 UBl1HEJrg/rgS4KtwWiX3BP6A2nZWg1Obc2Cgrnu6vTrqtZhxw4f9ZtFL+aAYOi1tvBS64FOWhB
 tb65mPkp8WlBnFQNqD6pxQoT1GAGX/aED0H0gt9HgEueV1XeNQ5SaqnSa7D/822TlApRPvMPcVV
 faTuUAqHKi3+PzzeAAVlBfD0nbFVcClLTxfA4MRmIp9nrw/jP92aOeD14ftUblsVZOgItuqZcls
 NjROX7o0VF2246+ga3ww8z8GpLHvjanN/s92HulfxjSJxWbTs6OtU8orYebR4ln7/tpdOlK4JKU
 v5brf1vtsML1tT1ekn3ENYo+T3/fvxbq/IRNyR8e8ayWzN3EpNVrGgkiXOF3534uD8XZCmuGD+X
 9FCZlWldzw2VLdoyArg==
X-Proofpoint-GUID: vfZRwJWpeFZ31_JjDT0wCNYpGKUsfxad
X-Authority-Analysis: v=2.4 cv=JprBas4C c=1 sm=1 tr=0 ts=6a877b02 cx=c_pps
 a=Eo0YKKWWvGv/UpXdOuOi/w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=KxkNxiNLGmVxD6C9vc8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: vfZRwJWpeFZ31_JjDT0wCNYpGKUsfxad
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NCBTYWx0ZWRfX0wz7NBOXmTfR
 Db8LvnYW8b8YztSIXSJY/ljhjwZAtgTdQUh01VK7b66l6/sj500eZQg8wl1UQJUha4hM+mIOHVa
 Km+EhY0scl6yTSNz/KkWXZVVk7Qc9xU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200164

The m_can pins can be a wakeup source in the deepest low power states,
despite being in the MCU domain which is OFF during deeper low power
states. Add the out-band-wakeup property to allow the out_band_wakeup flag
to be enabled during suspend for m_can devices.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5debabf1ead67eea634b48db1540186..7f3c50a56ea87ea576e7e7a547932ede94f256ec 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -789,6 +789,7 @@ &c7x_0 {
 };
 
 &mcu_mcan0 {
+	out-band-wakeup;
 	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
 	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
@@ -800,6 +801,7 @@ &mcu_mcan0 {
 };
 
 &mcu_mcan1 {
+	out-band-wakeup;
 	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
 	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;

-- 
2.34.1

