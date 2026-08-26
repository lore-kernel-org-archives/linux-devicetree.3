Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11022127.outbound.protection.outlook.com [40.107.200.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5531C345CDA;
	Wed, 26 Aug 2026 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739019; cv=fail; b=m754qwEai3h0FuPwNkRNtFB03/C1qw/r1oFuOty3jePI7NzzTE0W5rSlulh+YBguyMNNjoPkuqmnTtS7OpCqHfhUU4JwAieuxR9SnFfepw8l2z4yx4s3ikYXdS9Ls4LcfeS1DmSSxMTufLlG1FHYGSRB/4MgWRB7CDKDhArJNKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739019; c=relaxed/simple;
	bh=Y38BfqXVGOPQVp+M4e1qAl8QddYuhDTEUtyapDWGLiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jmogVa4gVm0ESRCK+1uLQXVcI0sXuD52JdwfU83CtRQxZOJEoJYu2OmbQUhZoGNy/oZQWmxk/QsxtdCFwsHRGyPm5mDyu94CxTq4oJZf1tbd08yftlA/kOZC9A/A+VyhBtYOIDAbXi7YIBWDVJPyEaYxu58fCM6+nFXin+JdtWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=C0ZsXLST; arc=fail smtp.client-ip=40.107.200.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="C0ZsXLST"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3yoaEbUsB67kOfghcEdAwPRZNleaksqi9V9siLcb4TNAq3IMxNuIoW+m76NIcCz2I3RmADApZ28QRUMLEFVrSCUCdtaT8FadjJoLJp9mcOzNMPLzrbOfZ7G3R1qGQokSu4IIsQFp5aDIAp//kFURZCg0/BAAnpqnctzOOsA1cKazufHrhy629wqIASIcY6RXSCMLfSmj/qn9aotEZVEdFbY9ddX5ebODPYKHgWgfPEv5Z7AfEfeIKrf4pJVwt30nPXIh1rmZdDKISq7CVNui8yucQ0GNIr+CWv2VYq+fmJPnsoud5+COt3/W2HL5es0PGxlddZaIYU4H/ggoTmmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp2heCLe+dS+GRd4UCheB/Mr4/8BsV/B5JyYBNKYIP0=;
 b=FH0DpBoaTlG0KtKznW0kGzU8htw5k1SdB/HJSd1hOzEw2uTQISqmJH8MULucPlF4pcaWTunnJHWLItscEifcWT00BV7pRGWzPN/O8pAZvn6iUNmfdKGXXJtCeNbKnGj5xHvWCtdRLzrV7ZAlVHO5rEVI1MSsZDooDzOt44y+AzsO1CB+fxYgMrTM7YxpD1z1xDYp80V2qFWAWY0D4wgO3jDHMClajJSxj+mBPem0uyTmkHHXCTwn5yMdUlLQCxH6IEB2sUamcTrrFZZNsrEaQeyrws95JZ6JA6krR2G0esho8jZ+VlvWuMGyDbbDpTsubu7a92rKvyIMJloOT4uHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp2heCLe+dS+GRd4UCheB/Mr4/8BsV/B5JyYBNKYIP0=;
 b=C0ZsXLSTzMDPdzKdFmTjnyVbsg2RRUIWhZ+07iTAAWAXLrMDkY5BOTnRWwzmRm/HwWfMQ9VbbHZi34ftD4w0pFxKPXjLTv1FVtcaL8KqBPliSWkV8C3r9jemPaKOycVtioFtOADJf6pVCP+WzNvyqgvK7nZ5HH390lBoItEfIL+o0+l7LKAKbdYDS0zej9yqCU8quhb3ZONUza5xcA5rx+RO3jYuo0wo6Tr7oxQgcykrhD6/e8oN5DFgSrzkvM37MrQEK6W57jvkCzGjA3bNyC4KFzaRHeU/PQI4ZNhuv3jFhtiipVDLE8daLRWrLpj9TW3Axiij0usFJPqTdf1XYw==
Received: from PH8PR05CA0011.namprd05.prod.outlook.com (2603:10b6:510:2cc::28)
 by BN9PR18MB4220.namprd18.prod.outlook.com (2603:10b6:408:119::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 10:10:13 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:510:2cc:cafe::9d) by PH8PR05CA0011.outlook.office365.com
 (2603:10b6:510:2cc::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.5 via Frontend Transport; Wed, 26
 Aug 2026 10:10:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Wed, 26 Aug 2026 10:10:12 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id A871B4186B5D;
	Wed, 26 Aug 2026 03:10:11 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Wed, 26 Aug 2026 03:10:06 -0700
Subject: [PATCH v4 1/2] dt-bindings: arm: axiado: add AX3005 EVK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-ax3005-dts-v4-v4-1-a7702a3ace0e@axiado.com>
References: <20260826-ax3005-dts-v4-v4-0-a7702a3ace0e@axiado.com>
In-Reply-To: <20260826-ax3005-dts-v4-v4-0-a7702a3ace0e@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, Harshit Shah <hshah@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
 Swark Yang <syang@axiado.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=syang@axiado.com;
 h=from:subject:message-id; bh=Y38BfqXVGOPQVp+M4e1qAl8QddYuhDTEUtyapDWGLiE=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqy+3c1RB5zjM8M0at8YCOSuUX7QFnRs9uWaiKIYlj+l2
 xWncAd1lLIwiHEwyIopsnzV+ZZ/Mlf7XufelaUwc1iZQIYwcHEKwESOsDP8d/Fb/HoFk3OpyD0b
 bbuYe6y3la747pmUwHbngURtymkVZUaGW+/5VhZXm1+8yTH1jKpkj/aRjY1HVlrN+Lh/0hez06e
 WMwEA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|BN9PR18MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c877e0-b1e7-4b48-ab6f-08df035a3783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	f0CCP56LIr0sm7TG5C+pW1lt0aJKM+l/IKbKRiIXVSGgXVY0A/TNJNxxIwccwDtc9SxSIAZYVTB9WeWT5dCe4Ea1MZ9pMoUrLfiq6HT0YFQ9Xu/2hqWbzj5fhmRZgn1S68xv/2sxOtFXoR28lpqukP91QWXfN/ooxdiKYYoEAXV0SNrlIROadOmcLZtIiLeD4SiknbugpbYV4NOXkE8c9K00bYcFy4R3SwA8lclFN9S8O4RMipimPH9betf0q+EViJA0OGkTqW07pisJ4/rEAaxkSQTRMKTdP2UW7h81f9HrUAZ23Op0agstCLnr0nvkhOc3bzUnSQVp8kHK1rRX6HFBczkiDTokQiKVrs2s9n8RKz7Vv7RBnKTRtfsOLDQZ94lN82oGV0AZ5IHGi4mEaxR0EYlGXTqgm2LDtbuKBeFMIZMW88DvWNsx3y+zAQgsTXPqDWPTsSuOxeCI0fLE/U1C4rInsQquvDiTa9QTvg8XS1VO+0huNKVi8vKVpoYYk+hCV70YIpau0vEXDrXmP/8wmgDzCKPsizOaO57NSqm/8e9KDbgbDuUDB8+AAHetBmS5mUZT/5s6GP7lUtwPHsyQFe/vJMa4ooVN8GazoIhpoxO0cM06hW3/v017eOtMBBONUlHY34PHdE3IPVLLe/1iGpHl5kMfsrwZf7bq864/kNjYt5GnkF1XDQM1NiH9UNnpJ085bSlCEkT5e8jxIw==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RG0epHZv9MrEgC9CSznL9XxTN19q/9I7yuN76HZjCy25xxp3kqj4q1/3vaVrSekf5/yp543yPRlCJB5RShM0WW6xdIUsIRLQRlATE0+ofF5LZ1u/EebJAKvJu9OOAmsyMsxXXbJQJBFCwP0pefh+qmV4u7hEfNEt+AXlg0SsjvTjRxAl3jj7+gz6GMQhecw8yFr2f/fDLts5H37mm/z3gjY8X7QoyS/cVYp2CO7Jv1VONXHIvaqK7f89mIZ3dbI2qbJFgArZGcNosCkgHVOvjqrrZmgDQqtmuoReaZ8PNEwfKxlnllcNe8tS+6uz/Nz9ttQZhrMnxuHrjlnlQCgAv1UeIXs20hlNuZ+Pvq1RnxCZyKWHvjrxWmmAL5Amz+Ieqb5vfGnLM6Ybb0TMxwHzToxrgm5KLImRCvsuZ735AtuQ6pJAvrQmXoidfXftkhGz
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:10:12.1967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c877e0-b1e7-4b48-ab6f-08df035a3783
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4220

Add device tree binding schema for the Axiado AX3005 SoC and its
associated evaluation board. This binding will be used for the
board-level DTS files that support the AX3005 platforms.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Swark Yang <syang@axiado.com>
---
 Documentation/devicetree/bindings/arm/axiado.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado.yaml
index bfabe7b32e65..008d2b1d4e62 100644
--- a/Documentation/devicetree/bindings/arm/axiado.yaml
+++ b/Documentation/devicetree/bindings/arm/axiado.yaml
@@ -20,4 +20,10 @@ properties:
               - axiado,ax3000-evk       # Axiado AX3000 Evaluation Board
           - const: axiado,ax3000       # Axiado AX3000 SoC
 
+      - description: AX3005 based boards
+        items:
+          - enum:
+              - axiado,ax3005-evk       # Axiado AX3005 Evaluation Board
+          - const: axiado,ax3005       # Axiado AX3005 SoC
+
 additionalProperties: true

-- 
2.34.1

