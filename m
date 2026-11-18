Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.102
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794966707;
	b=ISYiOPNFU1OQ9E3StWv13Rtrdc0Vukp2XE7DSvXjzrrUxlc6Dv4kWZw8Xa6HujV/L24W
	 Bptuoib4IFAshDAjlk3EvCn7poiIk+pIdcI25GdwNy1av6ySTZ4qJOnmldJw2UBAWYopk
	 YBZy0J7dHCz94WUsrJCb7/lcTMCHJwjda023T8RdkEBaLtWHC4ISlK0X3N7ubudPP66hS
	 VIP2FJgOm0pK1zfYdzcjREl8teZGlwFFQXO07dODHpwMipnLIzJgG1OeIiHkCsYI5OhaO
	 HD7P0MEOlQkbZjIUINbXW3kGTFjw/Rbu65nn0Mwnapo9pEC04L2Lpmb76gd1L9f2+CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966707;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
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
	bh=3YeNcNzq3smUK4beJAhFwHP/bCoxgMNr1DjUUlIWMpY=;
	b=EyRz26Rg8NpnpvQEaMOG8iCSVvQ9i7ibsxSOC5XW72ihSDtvluRfQgXZ44eF/XRzZLxg
	 FI5uuhi6LhnmXDd73fJlZtU+aUmz7zUzWEtExfAnZOcjfbDA4uyCr8Yopwli2RsPW08G+
	 2GS+MRKE8SrPrQhMZM3yxVG5rELIXqRNlxmb8LGEUIMHghy8BgfGNM+7BLx1hwLIOvBWe
	 nbcfFyJhWzK7MIRJoD2Dsqe42QB2jIguAoE/Pjc668Xel+nA4nKH11wdc8Y/G3CQiXgeE
	 +C0LXbS07gDHwFbR2QwrIETQqgAOe4+FTAGSX9CkcWHbScWm5bL3Eepq+Ym26AiPLIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.102
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023102.outbound.protection.outlook.com [40.107.44.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C29606A32F;
	Wed, 18 Nov 2026 01:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C29606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoBHQslZcdahEUU0w1zbieKk3niJAP4sjASTc53/IOtPwIYe7zrQpaq4FxD9ALe0ptOEtbEe2VZweHN4fh2XKLzqY2MBWdLWxBU2sQ2/sp/z7OV/e6pCR/pTrvNJF5y6Cuo+3hT+NjjNNI0vJOkQR6eME3I0Rl44mYuQGXVFnR0PZ1OAf/L2l87An0LHCrekIgn8IRumixpHKj+Kt3YCsxvbdCp/U93ccQ+/IuB1Bz6NxbGCEJO/ZIfHPJla/w7/kCFKDLYrUXGOYPTDQOHEVCBjeZXQFtSK0GBRBdpQXQeRrnmRt5e0zK8ERTYmouq/CWwmRRVoQ1/o26ErNiXXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YeNcNzq3smUK4beJAhFwHP/bCoxgMNr1DjUUlIWMpY=;
 b=MGbcIWGTWbGkh2jQncBfWSWswjh71FeBUH/PZkJxEAjiWpr3oqdR4t2/VFo22yABZY91vPWT8OeTVegaIT8lHFhBO5Xo7U65+8l+rVa+qPmPpEmbcHOIkBiuwANvQjzfwTVk33u0h93+wFE7YW747iz18GHMQwSWeyEZ6sqW5RI6aKce/ha551PCdry/WeUTDUqrWaBb2H7fIwezEgKt4xr6wMestXuHN9abye1yAcXDIuRaa/WKS5LmNvUfgt4AfbEOFwoZScO3mf8k0NAnI/L6tvhF0MgT0AazaVT1mnRg6HdZV8xyoY98mQW2FvXiYkLz7f9UEGft0WwiVIpLvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR04CA0023.apcprd04.prod.outlook.com (2603:1096:990:78::13)
 by TYZPR06MB5505.apcprd06.prod.outlook.com (2603:1096:400:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 01:51:43 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:990:78:cafe::17) by JH0PR04CA0023.outlook.office365.com
 (2603:1096:990:78::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 01:51:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 01:51:41 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8FEBA427EFD0;
	Wed, 18 Nov 2026 09:51:40 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: Gary Yang <gary.yang@cixtech.com>,
	Luo Liu <Luo.Liu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 0/2] phy: cix: add Sky1 USB/DP combo PHY support
Date: Wed, 18 Nov 2026 09:51:38 +0800
Message-ID: <20261118015140.3559331-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|TYZPR06MB5505:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0e69af2b-c568-4e37-d862-08df45167e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|10067099003|56012099006|261022113327099003|261021123027099003|261021121427099003|261102123227099003|261022075727099003|261009223027099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	J+mbYq4o2dwaEvlIMW2kUpUOBl2LmfyTcRBiTT6k0PHr1w4sNOpPR3c7fNuQ4piqkifGXL1t2Hw0tl2Yfc/GMPgDeaOyxg4rkAvSWsO1YHwrjSWFqUzxHZDS895GKQ7hfpxDdHvA46z86xr+n3RHGQYxLa9KXhIHfmweyOx3OlMdARPvsEK4wABlCKd8RREPvKLAxRxum/tHumJIoRA1mNZxPfA72Fu89nYc3Ut8+XhuVeVECee/qioyqoi+KazChhqLNRBTl/BxQe9NY9raaaPZNklEMHtFaLG7SAacYQ1+hzKujF4t7XzJR+yCW4KsPLXoy2jyoYAkSV+G32O5C675J0N6VN2TgRJN02Xre9sFA5m200ekDeEeWMGD2+jUpeHKmDtzm1MmETV6N5SQ6AXSGVgLtfyIQofAPaLtMWB1NBbSAcEbbqFOPdrfx6d1dM7ZtUX1JxT3avRMzF6xcvyGdFElb4IhUk8bSgisUsBOMEZASqdNF/YI81AKEJaymhrcyi4bFcjVX5RgmexxtJ8gJjzppZ1A+akWaKO0w1+9xxxXPgQ8zmkQZr7fRSMLSqt6FcwzAtv+mkCadbJLQ4AzODSF86+NC4Chwi5ZwlOR0GiVSj9lGp3nU9nFFCing9XHt69Pe74ySRvfD/7riskiM8WY3KXtvFt6kQ+Xdfo=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(10067099003)(56012099006)(261022113327099003)(261021123027099003)(261021121427099003)(261102123227099003)(261022075727099003)(261009223027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vKpEvC5RpEChpz38otLqQLklmL9kf7xbxtP+h1bAwPJjm5gmShrOMSS72hjTS57Elc9WfHqqLhP/Alg5UenqpPAOSYnvO61WIkm1ob9lJzdTQkx2LP9sCiTEa7U8oZVJaidvAfKbG2f4rNwzibaCT3/HH2OgRLcWw7o0BOkrEv4EHX5VrO8+/PSQPfkDhK3OPruyhoexZPCQQCb1yepk7OpoInfj9K/8kquRann2FSabjzUS5vK/UeqYXpDCTnBzP7HwYdtVN/L/+uQHfUjMNnhzzVoHomxT9f1OE94B7+kkdYFr3ezXWT9NSalUvo0Rnns3Jj8cFQwyZlHS/0yWAg/oxbs46Lfl5qsgMO/H2+OoHPyAl1+uwtCRA8nw3SgtxH66LH14AEeuVXTimM+jYa5mliWfwZr9L06tj2Siz11xv9Q/gB/DldPo/F8iPQKa
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 01:51:41.3663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e69af2b-c568-4e37-d862-08df45167e37
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5505

This series adds support for the USB/DP combo PHY of the CIX Sky1 SoC.
Each PHY instance drives one SuperSpeedPlus USB lane and up to four
DisplayPort lanes of a USB Type-C port. The USB and the DP controller get
their own PHY through the PHY_TYPE_USB3 and PHY_TYPE_DP cells. Plug
orientation and the USB/DP mode decision are taken by the Type-C connector
driver; the PHY consumes them through the Type-C switch and mux API.

The USB and the DisplayPort controllers and the Type-C connector are not
yet described in the CIX device trees. The graph links and the consumers
will be added together with them.

Patch 1 adds the binding and patch 2 the driver. The SoC and board nodes
are sent separately as a follow-up, since they go through the SoC tree.

Patch 2 builds on Luo Liu's "Add Sky1 DisplayPort PHY support" series:

https://lore.kernel.org/linux-phy/20261102030425.1957585-1-Luo.Liu@cixtech.com

That series creates drivers/phy/cix/ together with the PHY_CIX_DP Kconfig
symbol and the CIX SKY1 DISPLAYPORT PHY DRIVER MAINTAINERS entry. This
series adds the PHY_CIX_USBDP symbol and the new binding, and renames the
entry to CIX SKY1 PHY DRIVERS. It should be applied on top of Luo's series
to avoid conflicts in drivers/phy/cix/{Kconfig,Makefile} and MAINTAINERS.

This is a resend of the v2 series posted on 17 Nov 2026
(https://lore.kernel.org/linux-phy/20261117083434.3414417-1-gary.yang@cixtech.com).
The patches are unchanged; the series is now sent as a standalone
thread instead of as a reply to the v1 cover letter.

Changes in v2:
- Replace the hand-written regmap backend over the PHY registers with
  direct writel()/readl() access.
- Take the DP link rate in Mb/s, as defined by struct
  phy_configure_opts_dp, and select the register table from the link
  configuration entry instead of repeating it per case.
- Protect the PHY state with guard(mutex) and drop the goto-based unlock
  paths.
- Use dev_err_probe() consistently in probe().
- Fix local variable ordering in probe() and sky1_udphy_init(), and
  drop the unused register read.
- Lowercase hex constants, fix overlong lines, add the missing copyright
  header and a missing newline before return.
- Move the driver out of ARM/CIX SOC SUPPORT into the CIX SKY1 PHY DRIVERS
  entry, and drop the commit message claim about the bootloader handing
  over an initialized port.
- Validate the DP link rate before the PLL is touched, so that an
  unsupported rate no longer leaves PLL1 disabled.
- Honour set_rate, set_lanes and set_voltages independently, and keep the
  negotiated lane count in the driver, so that a caller that only updates
  the voltage swing and pre-emphasis levels, as dw-dp does, works with an
  uninitialised lanes field. Validate all of the options before any of
  them is applied.
- Program the TX voltage swing and pre-emphasis levels per lane instead
  of applying the settings of lane 0 to all lanes.
- Add .init to the USB3 PHY ops and only touch the PHY registers while
  the PHY is powered.
- Track the active and the requested mode separately and reprogram the
  PHY on the next power-on only when the alt mode or the plug orientation
  has changed, instead of enabling the APB clock a second time.
- Reset the PHY when it is reprogrammed, and only reprogram it when the
  register table actually changes, so that an active USB link is left
  alone when the mode changes between USB and USB+DisplayPort.
- Handle the deprecated DisplayPort pin assignment F as a USB+DP state,
  like the other Type-C mux drivers do.
- Report the DisplayPort lane count only after the PHY has been powered
  on.
- Ignore Type-C mux states of alt modes other than DisplayPort, which
  used to be mistaken for a DisplayPort state because the state numbers
  overlap.
- Describe the two PHYs with #phy-cells = <1> instead of child nodes,
  reference the common USB switch binding, describe the Type-C graph
  connection, and drop the cix,default-conf property.
- Keep the binding example limited to the PHY node and its graph ports,
  and drop the stubbed USB and DisplayPort consumers.

Gary Yang (2):
  dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
  phy: cix: add Sky1 USB/DP combo PHY driver

 .../bindings/phy/cix,sky1-usbdp-phy.yaml      |  150 ++
 MAINTAINERS                                   |    4 +-
 drivers/phy/cix/Kconfig                       |   16 +
 drivers/phy/cix/Makefile                      |    1 +
 drivers/phy/cix/phy-cix-usbdp.c               | 1422 +++++++++++++++++
 drivers/phy/cix/phy-cix-usbdp.h               |  257 +++
 6 files changed, 1849 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

--
2.50.1

