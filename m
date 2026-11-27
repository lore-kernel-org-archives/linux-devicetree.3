Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795765609;
	b=R4Waxud2mDvtuD1AE5X8+IBTTu+NJKKrzrBtLeQdLyXw2vVrMMz27J0sSVVIELXFz1U1
	 PsTlR6owZBoxaBShhL2nAokSUqRZNT0PUu8LSPv5VYHtTgS6dappIxH208IQj9W4onhpN
	 hGvuOkvJZSB16g31TZgd0ZZJKG9XNxt9oD1yCCiWDZsQCKLgLd80i7GFza2NSLFXfDKky
	 KX//YZ82a9hiFwR7BGqPEjXiGWdViAX4Ca20O2kvmbAXbnToAh37ZhXHQoRbRqI+Wnc5y
	 iElB8p2J1KdP+in8ni0Ql4Edsrnaj/J/CW3+9Csq41gAe8Ns5mmxXlZz57c0M0BfDxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765609;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MrTG99aTbNE60EAv3usTADyteh5cQyq8txq4Bf+OP14=;
	b=ham69dDXX3+i+ebNul3Beenp2BvBbg0W+tdeLQUBbJ9NtpaUuhDVr5b0dmQoKybdhjDc
	 aGafRYuWa+9k8q6J5GmBWXShs+fYddPY9a3Ls6ahpgZa55Z9K3u6U52D0o34iUcc15vXl
	 rYTeLD7AI/06XKNcnnN3bpL1e5O680xqc4KWFuZxg8UGErqcehwO0WWugm3bRhzF4lgZ9
	 mPhKDZvXorIJ7df3GMC0UiSeQM6EFW4FYmUQmZiM2B2if4zX/yWpn7y89yHb9fA00utno
	 kQbhIkDaB97ZG6tVdgvGUYjJgQ5/ld77nHZt9/y4dZX7vPJA9AniGEkzL/atNmBs1Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.112
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023112.outbound.protection.outlook.com [52.101.127.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC7E606A32E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC7E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPSLxXBGVxYDR5rxbzq/Qyl6Vnki+k/XaLvsWu1e1tUb3pUfvwZWEBgfC1Zw+zDA2K1ssAa0PVAVVBHkZIV6w/+7Yek9ju2G+E3mz7HqY3qdz4L3j/s0Xre7ZKNHmeWb9v+a4LbZj9hWTKY47K7toZzFiK9Jt25a7GsHZ5FV7nJRTtEoVu29sP7XiGmgfQuebZGHlFJl8d0KDrac+/zlCFbar+XRIcAKv/uNqGz58T3YKMC1qvhT5gKHmbWoGob7v3qBjplNo8MlML5fldCOnPUg7X+hWdkF43ycVG2Ko/T8wu3ZTImN+MCKBHOuVavj4Ko0+PuqJr7c79kEZoRhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrTG99aTbNE60EAv3usTADyteh5cQyq8txq4Bf+OP14=;
 b=aHUFwRGM/JipEuL+H9Bjz4iGo52O+1Gt2b/OhHr0qn/k5swy6mWBFeLUDuam9ROL1WkuDcFnkVBZ6saE7s/VYDBI5eAmo0l0VEi06i9hy86ZqlyryWoEfb3zXuI3VEsVAAefJzTEHjzUbP6IjNiYcGcW6mfrtdAFZXkx+XEJyi4c155krU5JSK9goCeLh5vtPDxZHi30ttUlDWoGwHD2FlR5MxtY1XUetrVO6W7xtYV/6Ur0yMk558+5RM4uI/Ir2IuucSF24Qdj6OJ6NU+bhBsTO48fT8Ad8zcvZHjwKLb6v8L/mzHjp9TLupsZe1+SI+Mu7E9oIIdtrz7zVnvS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0046.KORP216.PROD.OUTLOOK.COM (2603:1096:301:210::12)
 by JH0PR06MB6535.apcprd06.prod.outlook.com (2603:1096:990:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Fri, 27 Nov
 2026 07:46:44 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:301:210:cafe::6) by PUVP216CA0046.outlook.office365.com
 (2603:1096:301:210::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 07:46:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 07:46:41 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0F833427EFCE;
	Fri, 27 Nov 2026 15:46:40 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	luca.ceresoli@bootlin.com,
	wuyi.shen@cixtech.com,
	cix-kernel-upstream@cixtech.com
Subject: [PATCH v7 0/5] drm/bridge: trilinear: add the Sky1 DisplayPort transmitter
Date: Fri, 27 Nov 2026 15:46:34 +0800
Message-Id: <20261127074639.277959-1-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|JH0PR06MB6535:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fdada0d6-f7d3-4ccb-48b1-08df4c5a940b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|23010399003|42112799006|10067099003|56012099006|5023799004|261022105027099003|261028144727099003|261026121527099003|261021123027099003|261026140227099003|261102123227099003|261021121427099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|261009221727099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uRZYfqbwsizrfYhSAknPZIVo1Lmj1YINBUoRzyCDPZ2XpI0jDtaMc9kh3PdgYZMg6ogNWpZXr0AM9v7kqQEKIL6Ry9whgoRouQuwwQ913gU/v0t//C79Jfhsik7nHuEIyJyFRgrt4NjBL4811vGYv05ouiSGoVYZySLq1yAFfgjLOOE9/zIkO4/jFii64YAYEIy1OPxbDWUxL8xMQv+fnJJC22P1RbSYlQTfkDYBi5NDNw7LBX/BsRJtU5FrKZAROdwsB5/lIaj6hLUW8Bs8O1uLlYdOn+0eSkKxytDii7kDYOPPhXZ4YtYjMttXxj7h1NI23SG25l80wgXUfAaBj/GSfOlhR+2L1AA+VAsCpia9/9IJPdiYfQSWwo8FIFjNzp5EK+gnaCPxIu/8ZV6AIexqfoj1sUvgGJncH86xfW2mvWo7OT3X8zFIhD4VQ9VMm3O00keUdqGwW9SqSGTLB9ACipAPUgGBjbfRKwycl4WsGtVNMSEZboYx5C6wgrZogSyJ+fV422EiPoN19Rivn9j8udfJG+n73UQkfQ1cosuUC6JgdQrTQkprAE4JmzMg4bSej1fq5n/Mif2cFZykDAcgc/dAKBB/Tkk0A57nVbZ8A9l9umcLXWSYckuN0es/iB9elG4sttTLAOQunmWbKpge0AcKvLixySmbIyaBIiqxzoFvdS4CNYLz8+pUt3T/VG1+wMlwIkEWsu+6uptLIw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(42112799006)(10067099003)(56012099006)(5023799004)(261022105027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261026140227099003)(261102123227099003)(261021121427099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221727099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3yiJxW1GyJn00UhuzPWfJ6ugE4ooI4HmBqrG4Eognre29mzxoO42Krxx9Rndvjb10dMkH+A3PhnajVYazJ6oowWwjGOAAI7EDqsYvLqPrVhhYPfsYK8RT4AkrdsvTxU0NrmIpZexmJq5JeK2ASEO1mBGy9C9ls7n3TtPE8GNEl4ysr276k2hg9BaEwfsOzxySYtL3T+cJTkr9lm+Nd0+GR/S4qMg3LOIR8dA5KtBfyCcAYomx0f8kyQF/3XTfnHSXxBuIZ48vgXbXb/fY4tgqb5TqhSdA609vuG0kGBKC5fZLgKb4nQd0aMGpiwZeI6nLRjdre4LC4jQR3TUcxrhZKKsFACFXADt22SQjrBVa5UEUK6/6d23/GFMYvTH3ssmgRGRyIZpGv24NzPXwROy+uQ5+Np4fsDQvpo/L72uHnnkT1CdavLEE4LaxoZxnOm/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 07:46:41.5993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdada0d6-f7d3-4ccb-48b1-08df4c5a940b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6535

Add the Trilinear DisplayPort transmitter as a DRM bridge, with the CIX
Sky1 platform glue behind a platform data structure.

The hardware layer, the DRM bridge and the core state machine live in
drivers/gpu/drm/bridge/trilinear/, so other SoCs using the same
transmitter can share them; the platform registers its own dptx_plat_data
through include/drm/bridge/trilinear_dp.h. The transmitter drives up to
four lanes at HBR3 and has two SST sources. MST is not implemented and
stays disabled.

The USB-C transmitters and the native DP/eDP transmitter use different
RCSU video-adapter register offsets and bit layouts, so the binding has
one compatible for each. The Sky1 devicetree nodes are not included in
this posting.

Scope: DPTX hardware, bridge and bindings only. Komeda (the Sky1 display
controller that feeds these bridges) and the board DTS are separate
series. Nothing in this posting wires a full display stack.

Tested on a Radxa Orion O6 board; the USB-C DisplayPort output works
with the connector created by drm_bridge_connector_init().

Connector handling in this driver:

  The bridge is meant to be attached with DRM_BRIDGE_ATTACH_NO_CONNECTOR
  and drm_bridge_connector_init() creates the connector from the bridge
  operations. The driver implements the bridge side only and never
  registers a connector of its own.

Changes in v7:
- The link-rate downshift thresholds are compared against the real link
  rates, so a 1.62 or 2.7 Gbps link is not raised to 5.4 Gbps when
  training fails.
- The bridge adds a device link to the controller, so the transmitter
  resumes before the controller's resume commit and suspends after its
  disable commit. An atomic enable that arrives while the transmitter is
  suspended is refused instead of re-initializing the host behind the
  system sleep callbacks.
- The device link is created only while the transmitter is alive and is
  dropped from the platform remove callback, before the device is
  deleted, since device links cannot be released after device removal.
- Every patch updates MAINTAINERS for the files it adds.

Luo Liu (5):
  dt-bindings: display: add CIX Sky1 DisplayPort transmitter
  drm/bridge: trilinear: add the DPTX hardware layer
  drm/bridge: trilinear: add the DPTX DRM bridge
  drm/bridge: trilinear: add the DPTX core and build glue
  drm/cix: add the Sky1 DisplayPort platform glue

 .../bindings/display/cix,sky1-dp.yaml         |  133 ++
 MAINTAINERS                                   |   11 +
 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/bridge/Kconfig                |    2 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/trilinear/Kconfig      |    9 +
 drivers/gpu/drm/bridge/trilinear/Makefile     |    4 +
 drivers/gpu/drm/bridge/trilinear/dptx.h       |  113 ++
 drivers/gpu/drm/bridge/trilinear/dptx_core.c  | 1061 +++++++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_drm.c   |  734 +++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_drm.h   |   17 +
 drivers/gpu/drm/bridge/trilinear/dptx_hw.c    | 1380 +++++++++++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_hw.h    |  103 ++
 drivers/gpu/drm/cix/Kconfig                   |    3 +
 drivers/gpu/drm/cix/Makefile                  |    3 +
 drivers/gpu/drm/cix/dptx/Kconfig              |   15 +
 drivers/gpu/drm/cix/dptx/Makefile             |    4 +
 drivers/gpu/drm/cix/dptx/cix_dptx.c           |  179 +++
 include/drm/bridge/trilinear_dp.h             |   84 +
 20 files changed, 3858 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
 create mode 100644 drivers/gpu/drm/bridge/trilinear/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/trilinear/Makefile
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx.h
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_core.c
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_drm.c
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_drm.h
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_hw.c
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_hw.h
 create mode 100644 drivers/gpu/drm/cix/Kconfig
 create mode 100644 drivers/gpu/drm/cix/Makefile
 create mode 100644 drivers/gpu/drm/cix/dptx/Kconfig
 create mode 100644 drivers/gpu/drm/cix/dptx/Makefile
 create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx.c
 create mode 100644 include/drm/bridge/trilinear_dp.h

-- 
2.25.1

