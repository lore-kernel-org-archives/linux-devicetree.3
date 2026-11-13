Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529947;
	b=DLdlysNOFvkfq6ydIGOByraE7yXlMIn7EZrhMo8rHsJoVKguTBbMcwDfaJSdvJCk5vbN
	 dpxI0r7UfdEZbswhUdQ5dsxgqMTFiZRpfJlgF6YRqncbYJFZvFkByB3yimfLLNCDHdSIv
	 wRryM4hXUNevWnvRe5tWcDq5I/AGG+pi+wdD9MGxZc4BIqZ9h4XBX3LWjH9GCXvkMY/y9
	 dfm5ibMEGrHXv/LXFYAshWbksfEP/uTd287MEW1vxDkP4aNC+aD4AJzmClksgQ1E6L1EZ
	 j6iMA/f85H6TMO+DdFrEKYsNoj5a6OHePWh+vFsRXsm9vRjFR+CtRJVr78iMgTfN9ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uai/5LgacOngRy+lPwjlt1ceXIEJT+x7kJMhfO8OeOo=;
	b=2O2bT9Yn4pkU3sdhilgMSaR+acT7OV1kIPp4RePKqQCg0P8X5rH84eqRQ7L1hbMKDxkB
	 q2s57VE6LPT0HDH+O8fd892/zzSl+Z1i6wolBQg5k9XsFUafoD84BBI23sUknpOIZU0UX
	 keB/mXnKxw3sZXBrhQjnsVI1CuPUkTmbD1U5nc4k+LzZ5jdBuDx0l9psR6SjUYzgcqyna
	 clxqAQSgr0urIpBJa9yhhSu6pBdwO27k76AbKQwRJZW1nalam3g3C8h673HOZShuQwntw
	 2z6Hh1los346AvLDI9v6OXoShLA8nO617NxJvpszMXx9f+EpRG7X+RFVF5QBaMI492Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ttuyt35h;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E5606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3E5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ttuyt35h
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso97547f8f.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529945; x=1795134745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uai/5LgacOngRy+lPwjlt1ceXIEJT+x7kJMhfO8OeOo=;
        b=Ttuyt35h7FwPBIOQrPICJIcow/vKerFpO209qGnYjlFw3DjhmWxfNShTISJ5560AzT
         g9/UH8Z4sb1iKGXHmK9AtyxEhOAY8YRZd6SRySC/2j8z8jVGbdnE2rV/ei3q7UOtrWTN
         ezHmGpAmwPhFMTdNBpRRvkoCC+C8K1OHdK4jV4/Veo7Oi+evtrGVtNhDj8YUG+xj69R2
         +5aScIbZatEs3Wmq0aVuE8VVCtSiCrKbaLFZacVRS2CauzzpTxF24IJJHt+4RibaAQpj
         KkPcyLlReTPOr4TVCc5QfTMkrPpvyYnwnz0Wm7CRzb1jFZGzuDZlZPYTLpPHJxpchrGY
         EgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529945; x=1795134745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uai/5LgacOngRy+lPwjlt1ceXIEJT+x7kJMhfO8OeOo=;
        b=VsoTHTh8kmFXItZy22BfYtOSs1l9ox/hRdnY0avFMy+ku5x930UYnTcghOBVxDwjne
         dsIsteADtZmIf60muyn1dfaeESAPTJtOdRw4BWcKVM2LB5DpI+VNTpp8f31/YChE3mhf
         QyR9ddGGGDzpyfxh4LWveqO8HfFmuAMWJeDx25ygH5JxizGRUg0TW2UQ9aYvGOkb6ZEU
         cYTBKIFRIPTDwbip5t/FH5x5ubJeTNn6XK3mwpCHpG+igvAnE6fP5qVcrW6lRIYm/gGf
         A7wacHr3ZbR1hDJSQjl2RTYAtuUCkXA+lomnRqWW/fuFqPUBbgc7bA5vT1cZEsvLXyS/
         o8dg==
X-Forwarded-Encrypted: i=1; AL+hErFytlCph7vWa1y5aEVHSN+QuSN38Trvo/gfl21oLle6WP3AQVbj0BRa4tj1m4RmMLyVtnEVMN702jHc@vger.kernel.org
X-Gm-Message-State: APuU4Z8rSWvmYsRC0J9yfHe4LuWhOEt4Q7Hdg66d8g6u+G1Y3Akaf3H5
	yMd7V57cC9EDgB20ZX/VQpm56RAAi+Yg5hPCGUonGZ9kT/QEVJgppT8V
X-Gm-Gg: AYBFou0mPQdCbNAuFW/i8e9LdY2rqkEk8MJrIRgv1SuLF6cadGYxoo2GT3ei+Z1jlHT
	3tdA5yEklILXVUUbZFte9HLDNhRImgklS4HFagRTBtkNyyAqNV9vDoHDMvD4XT4OJ3LZkoqpSIq
	zi224Afd1DiYHsU38h6IQbLAMsC26lrE8erZGqNHE0KfBKzK+qUwzNCUU845d2I+RzB1CJdWiK8
	QuLjg1St+A3EdSKi6DwPS6xEj0UG3F/kvYjGcyvaVLkiolleUNXtPS/0rXt1aVw/r6gTchfJFc2
	PMYm7I+eugAOvSLloDyqEy/SNghm+L3Y98nVLwp5YoPLBXvUs2Ld2CgFJx+fFvScfqSyPnqdZ2Z
	ydTRlPcUbg8nddizmjS5uN8btxTN/hIaQXe9zxlUZpUElCG3x6/ERmYtCN+Tz1xGV97WvaU/Iki
	w3LpbUG5XzyUjpF1/VnYtD28eXgHZ4vITE7HkgzhRQBTmXmZC+X8S2+zcZEwD+SdYtgrk0oolnz
	P0Bmyyii1AHviyFMIRDIBrtGovP3bcUPkYMZ4kE/YKX/mbzZUCAUFZvPUIecH0HBgM2YOMnzzYe
	lq/S1DFvt7NIQkec5WbStt7T9S38lzusD/FT8XxdAZNkGpkwJgvrcLqG9XAYu4i9hWsmR9Rvr7y
	/dgqI5ipWPeUAHTXmXNVS2MkRV/CvPYKjwz5rg0bndI2QGFtz+YQK3Q==
X-Received: by 2002:a05:6000:29c9:b0:493:1004:96f7 with SMTP id ffacd0b85a97d-49c747700f2mr1324877f8f.54.1794529945019;
        Thu, 12 Nov 2026 16:32:25 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:23 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 00/15] net: pcs: Introduce support for fwnode PCS
Date: Fri, 13 Nov 2026 01:31:50 +0100
Message-ID: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This series introduce a most awaited feature that is correctly
provide PCS with fwnode without having to use specific export symbol
and additional handling of PCS in phylink.

At times there were 2 different implementation (this and the one
from Sean) but Sean agreed that this can be picked and used in favor
of his implementation as long as his case with race condition is
correctly handled.

---
First the PCS fwnode:

The concept is to implement a producer-consumer API similar to other
subsystem like clock or PHY.

That seems to be the best solution to the problem as PCS driver needs
to be detached from phylink and implement a simple way to provide a
PCS while maintaining support for probe defer or driver removal.

To keep the implementation simple, the PCS driver devs needs some
collaboration to correctly implement this. This is O.K. as helper
to correctly implement this are provided hence it's really a matter
of following a pattern to correct follow removal of a PCS driver.

A PCS provider have to implement and call fwnode_pcs_add_provider() in
probe function and define an xlate function to define how the PCS
should be provided based on the requested interface and phandle spec
defined in fwnode (based on the #pcs-cells)

fwnode_pcs_get() is provided to provide a specific PCS declared in
fwnode at index.

A simple xlate function is provided for simple single PCS
implementation, fwnode_pcs_simple_xlate.

A PCS provider on driver removal must call fwnode_pcs_del_provider()
to delete itself as a provider.

---
Second PCS handling in phylink:

We have the PCS problem for the only reason that in initial
implementation, we permitted way too much flexibility to MAC driver
and things started to deviate. At times we couldn't think SoC
would start to put PCS outside the MAC hence it was OK to assume
they would live in the same driver. With the introduction of
10g in more consumer devices, we are observing a rapid growth
of this pattern with multiple PCS external to MAC.

To put a stop on this, the only solution is to give back to phylink
control on PCS handling and enforce more robust supported interface
definition from both MAC and PCS side.

It's suggested to read patch 0003 of this series for more info, here
a brief explaination of the idea:

This series introduce handling of PCS in phylink and try to deprecate
.mac_select_pcs.

Phylink now might contain a linked list of available PCS and
those will be used for PCS selection on phylink_major_config.

MAC driver needs to define pcs_interfaces mask in phylink_config
for every interface that needs a dedicated PCS.

These PCS needs to be provided to phylink at phylink_create time
by setting the .fill_available_pcs and .num_possible_pcs in phylink_config.
Helpers to parse PCS from fwnode are provided
fwnode_phylink_pcs_count() that will return the count of PCS entries
described in the firmware node and fwnode_phylink_pcs_parse() that will
fill a preallocated array of PCS pointer with the actual available PCS
(ignoring the one that still needs to be probed).

phylink_create() will fill the internal PCS list with the passed
array of PCS. phylink_major_config and other user of .mac_select_pcs
are adapted to make use of this new PCS list.

The supported interface value is also moved internally to phylink
struct. This is to handle late removal and addition of PCS.
(the bonus effect to this is giving phylink a clear idea of what
is actually supported by the MAC and his constraint with PCS)

The supported interface mask in phylink is done by OR the
supported_interfaces in phylink_config with every PCS in PCS list.

PCS removal is supported by forcing a mac_config, refresh the
supported interfaces and run a phy_resolve().

PCS late addition is supported by introducing a global notifier
for PCS provider. If a phylink have the pcs_interfaces mask not
zero, it's registered to this notifier.

PCS provider will emit a global PCS add event to signal any
interface that a new PCS might be available.

The function will then check if the PCS is related to the MAC
fwnode and add it accordingly.

A user for this new implementation is provided as an Airoha PCS
driver. This was also tested downstream with the IPQ95xx QCOM SoC
and with the help of Daniel also on the various Mediatek MT7988
SoC with both SFP cage implementation and DSA attached.

Lots of tests were done with driver unbind/bind and with interface
up/down also by adding print to make sure major_config_fail gets
correctly triggered and reset once the PCS comes back.

The dedicated commits have longer description on the implementation
so it's suggested to also check there for additional info.

It's worth to mention that OpenWrt is currently using this on
Mediatek SoC and QCOM ipq807x/ipq60xx/ipq50xx and Airoha are
already ported in staging tree for testing.

Also realtek is using this and proved to correctly work.

---

Changes v19:
- Rebase on top of net-next
- RCU protect phylink from pcs struct
- Fix dead-lock on phylink_validate
- Handle possible PCS provider returning NULL (protective coding)
- Improve capabilities handling refresh
Changes v18:
- Improve handling on late PCS addition
- Fix wrong comment on airoha PCS driver
- Rebase on top of net-next
Changes v17:
- Rebase on top of net-next
- Add Review tag for DT patch
- Recalculate capabilities on late removal/attach
Changes v16:
- Rebase on top of net-next
- Add Tested-by tag
- Add ACK for airoha ethernet patch + nit fix 
Changes v15:
- Rebase on top of net-next
- Fix Coccicheck  warning
Changes v14:
- Fix deadlock when fill_available_pcs fails
- Move notifier and fill down after resolve disable bit is set
- Fix kconfig description
Changes v13:
- Fix regression in fwnode_pcs_get_from_pcsspec from v12
- Fix reverse lock for phy_lock and state_mutex
- Better handle lock in phylink_validate_mac_and_pcs and inband
- Fix wrong pointer to fwnode_pcs_add_provider notifier
- Fix compilation error for new C type in pcs_provider_notify
Changes v12:
- Fix kdoc for function
- Rework PCS provider add and delete to be provider driven (instead of
  relaying on scan of fwnode every time) (this also handle
  multi PCS scenario)
- Even further rework state mutex locking for concurrent pcs list
- Restore MAC supported_interfaces validation in phylink_create()
  wrongly dropped.
- Use get/put for fwnode reference
- Fix possible unment depndency for FWNODE_PCS
- Fix almost impossible problem for PCS calibration
- Hold rtnl with PCS deletion
Changes v11:
- Rework PCS release to notifier way (fix race as pointed out by bot)
- Add Ack from Lorenzo for Airoha Ethernet driver
- Introduce devm variant for pcs_provider_add
- Better support firmware node reference for PCS late attach
- Better protect list iteration with state mutex
- Minor fixup to airoha pcs driver (flow control fixup)
- Rebase on top of net-next
Changes v10:
- Minor code cleanup and fixes as suggested by bot
- Drop devlink patch
- Add reviewed by tag
- Configure old_link_state on PCS release
- Unlink PCS on error in phylink_create()
- Use list_add_tail
- Fix typo in Airoha PCS driver
- Update phylink migration guide
- Better handle late PCS attach (idempotent function and
  add unser state_mutex)
- Use dedicated lock in Airoha ethernet driver
Changes v9:
- Rebase on top of net-next/main
- Drop early verification of supported_interface
  (it can also be provided by get_capabilites MAC OP)
Changes v8:
- Back to RFC (net-next closed)
- Address additional bug reported by Sashiko bot
  - Better handle priv interface for Airoha PCS driver
  - Better handle locking for modifying the PCS list in
    phylink code
  - Improve fwnode_phylink_pcs_parse() parsing on -ENOENT
  - Better handle error condition in phylink_create()
  - Turn down the link when current PCS is released
- Fix compilation warning caused by copy paste error
Changes v7:
- Address all the bug from the Sashiko bot
- Rename .num_available_pcs to .num_possible_pcs
- Link PCS in phylink_create()
- Correctly unregister the notifier on phylink_destroy()
- Introduce fwnode_phylink_pcs_count()
- Better handle locking in phylink for PCS handling
- Better handle unavailable PCS at phylink_create() time
- Improve Documentation file
- Other minor fixes to address suggestion from bot
- Rebase on top of net-next
Changes v6:
- Rebase on top of net-next
- Add Documentation files
- Add fw_devlink patch
- Fix some comments typo
- Rework the airoha_eth.c implementation with new multi serdes code
- Extend PCS code with PCIe and USB support
- Align schema to new property
Changes v5:
- Rebase on top of net-next
- Use the new force_major_config
- Reword some comments and commit description
- Return -ENODEV instead of -EPROBE_DEFER to perevent race condition
- Drop phy_interface_copy patch (Russell pushed an equivalent version)
Changes v4:
- Move patch 0002 phy_interface_copy to 0002 (fix bisectability
  problem)
- Address review from Lorenzo for Airoha ethernet driver
- Fix kdoc error with missing Return (actually missing : before Return)
- Fix UNMET dependency reported error for CONFIG_FWNODE_PCS
- Revert to pcs.c instead of core.c (due to name conflict with other kmod)
- Fix clang compilation error for Airoha PCS driver
- Add missing inline function to pcs.h function
Changes v3:
- Out of RFC
- Fix various spelling mistake
- Drop circular dependency patch
- Complete Airoha Ethernet phylink integration
- Introduce .pcs_link_down PCS OP
Changes v2:
- Switch to fwnode
- Implement PCS provider notifier
- Better split changes
- Move supported_interfaces to phylink
- Add circular dependency patch
- Rework handling with indirect addition/removal and
  trigger of phylink_resolve()

Christian Marangi (15):
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phylink: make PCS phylink instance access RCU protected
  net: phylink: introduce internal phylink PCS handling
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: save phylink instance fwnode on phylink_create
  net: phylink: make phylink_validate state locked
  net: phylink: add capabilities helper and track modified advertising
  net: phylink: support PCS provider release
  net: phylink: support late PCS provider attach
  net: Document PCS subsystem
  MAINTAINERS: add myself as PCS subsystem maintainer
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha AN7581 SoC
  net: airoha: add phylink support

 .../bindings/net/pcs/airoha,pcs.yaml          |  261 ++
 Documentation/networking/index.rst            |    1 +
 Documentation/networking/pcs.rst              |  234 ++
 Documentation/networking/sfp-phylink.rst      |   35 +-
 MAINTAINERS                                   |    9 +
 drivers/net/ethernet/airoha/Kconfig           |    2 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  197 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    5 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |    8 +
 drivers/net/pcs/Makefile                      |    3 +
 drivers/net/pcs/airoha/Kconfig                |   13 +
 drivers/net/pcs/airoha/Makefile               |    7 +
 drivers/net/pcs/airoha/pcs-airoha-common.c    | 1306 ++++++++++
 drivers/net/pcs/airoha/pcs-airoha.h           | 1311 ++++++++++
 drivers/net/pcs/airoha/pcs-an7581.c           | 2100 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  314 +++
 drivers/net/phy/phylink.c                     |  501 +++-
 include/linux/linkmode.h                      |    6 +
 include/linux/pcs/pcs-provider.h              |   70 +
 include/linux/pcs/pcs.h                       |  174 ++
 include/linux/phylink.h                       |   30 +-
 22 files changed, 6530 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/airoha/Kconfig
 create mode 100644 drivers/net/pcs/airoha/Makefile
 create mode 100644 drivers/net/pcs/airoha/pcs-airoha-common.c
 create mode 100644 drivers/net/pcs/airoha/pcs-airoha.h
 create mode 100644 drivers/net/pcs/airoha/pcs-an7581.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.55.0

