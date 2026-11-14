Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653075;
	b=WURd0MpdugHvyZ9SA8HqI80lWZi+9B8eXv0EEHIOx8Y0Nwu9of57PEVOB8bROBr1YST0
	 wGLT6lOQ9BP7oVDTq7eeNqRDV5whefm2CPa83VhC9gb5a7SBwe91SyQdjTUeeU2xDi1MM
	 6TradmcDLWr14o0XrKNBmC8hjUBvKnBD6T3msFZCjSjEtq2/2UPDiameExNvIJRG8gVt2
	 7lT/unvVVd7g0Kq+bxlWZuCmOOazN3epZehePbCO9Fjz3Jbpv4olEh5+MyQSmkUZeIzVh
	 taQW+WOg3GB8xpRUALOp9B+XvNKjuHC34GeFUWpmNh+z0AAtpsY07sgVIj8t4YbtOYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vmBk3XBxt1iGqrwCxJ2nBAO970CyroiWXDWZMl6pPzU=;
	b=anrqU0nK0KN90+vfTS3YKjNs4+SIiX10sQCDHZHJAl5zqVCNMJZjWs+wFinUFUD6EP8P
	 XctiLrygwj4Lb0MLe3gXng8Thp5th2EpPwXSVLASsY8V19J3evk9wjw4JoSweUCLaCTTV
	 zAyIrWYNJkPjuZ/pJqe2o0vvwl1QXdhesAs+5jaSjAh3oXFkVc7m9MO8eHuFgrzSKv4KT
	 5YYzPqu4PRVmUdY9g0DMs0rW9+uv5nBoQ0ibulSLGdzuu4V3//nrZd1MTk1g7NSH6bV+k
	 mRjGVu2914YvWkRVulR0ZVq0/4D62EDLd6SlwjXhnaY02tFMzJu4AVpIBLB5BzUXn5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POw0rIer;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9731606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9731606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POw0rIer
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4910b863b84so1655031f8f.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653073; x=1795257873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmBk3XBxt1iGqrwCxJ2nBAO970CyroiWXDWZMl6pPzU=;
        b=POw0rIerIr+bG1hdBoqeZDybgo5QhwOFVmYsVQrN4nPqSrct8FnLH4aqkC7I+gSQzP
         3zlbespNIcNfZdjV4XyRI8dKnss9SVIAobrblWZDGEwZbkmTXhFv0oSCt5e6kZFn6ybL
         CIzfhQbKgdyGhwTtoCYDWWOqbr+BWlAuRNlVq4xEmxJVpxGl2up63j7fSxHPIJ5RwWlE
         Z74MdOkRBrUCHtT/2jcN5s5FjFi4p44IvB364yquALrNP8SbWBAgekFCRWZwBBLYLu9h
         1YjbD6ecKOzY19viMgisdVTXCN2++fBkxph4A3ZD/nDoNWcwiME+12zXfUNr6xa421pG
         Pu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653073; x=1795257873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vmBk3XBxt1iGqrwCxJ2nBAO970CyroiWXDWZMl6pPzU=;
        b=PJg0FVD8Cz+pfhij5O9wSooI5beEH+xj+e+4kFr0qp/rvQ2WDgnRm0h/QHT3Hpmmht
         r0etzK+hyR/tnHKIIytFYDHGDWQtYcsueJdPCnkRASmFaJa1I68fHPp9ElpOY9VGr0xd
         BSEatIGQnCR3JJ799CSdaaGH0E56OqmtPo52ORaH5VdqsBRCUzx3P1HyCnJ6LI+C8oRk
         8U99V5h1tD9BeiiW3TwPi4HG4Ynccot4EaILghYS/+7rVvB+bS5/lOL30VKnGNjqJ2om
         AkDKNkbiX2xK43Du0vDG7Uq4LZl/D7zsx6cjzJ9bAqCQ6YK9Dfz2Wv1zESsLbox4nyHB
         cG2w==
X-Forwarded-Encrypted: i=1; AL+hErEqyM8attaQtfWxV/oiGBXGbT6Iybj/QCo1qphH8rF7kd1J4NU0qxDlByxDBQH1eIpB7EBvJXnha5HD@vger.kernel.org
X-Gm-Message-State: APuU4Z82JaP5EPOk54s+/88dujuBTvm8vqvhjs5HZAnUE5+lJJNLJ2AF
	wCAhM51D8kbcQJsGnyicxNr7rH/N6n+SAWO8L+7PZRyvFW/RwCnr7/kN
X-Gm-Gg: AYBFou1DjFbD3tMF1hCZiyKqbhDDoMLJnf/Bwyj2iW2syvTnTUvnA63h5jOAhFjBTHG
	swKx16g65l4aGYhuBIP0uuWLfdT8yMqhQKLf0xOrkSEXp8s2BXN/5b+nZ/PqCKS88iNHKPyVRUZ
	20w25LAwsDbvKetHZXERKa9wWdFwxLhpSjSXyjjFOuRmf6yQ0vxmc0FvsESCUK3cQBhi5n5zlwT
	JmW8lg/I9Te5RYsBP62HtX/T4SxYp6R3cJsIRaVG5OvvYTqJHdM5WQwOda7+YRjzRiPm8B2veEz
	ZbzAFSXf4b3PXitvOOtSGh6CBRqrYj3EI7ZODLOeZLYctDnOcwlBFqZmLtM3FVOTtixT3fhP5eC
	fjse6wimCS4HFxnisucGLvA3Wb0jWv3zQ16KSTgU6dUNZu9Bj/x+l6sI5jcozb3iowfPaLjWsQl
	1rt89rtBrDiw85i4HmjdlkZgEoZWGWNEcmyuiUlGCgTGRpaHqup2V7i9Il2KX+CAZ2AtL+QzkA7
	v5uv5jWGjlEGDfYNhNC29fTU4vcN5oxqHVdQ/pHKKy0qdMj/S+O4CJrvuHL1bMF757QBA1KOmXC
	1Vf7/H1dvEBdH9oqnngaXq6qAlDAGvLIcpN4Hm0wfy9lye/10Bc6g3/ozf60gy4XOOhvgtai0ch
	Xky/276ne0Oy2lDVFUKk7IkVsH80wPebNrg==
X-Received: by 2002:a05:600c:354a:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb55a61152mr111930425e9.5.1794653072904;
        Sat, 14 Nov 2026 02:44:32 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:32 -0800 (PST)
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
Subject: [PATCH net-next v20 00/15] net: pcs: Introduce support for fwnode PCS
Date: Sat, 14 Nov 2026 11:43:39 +0100
Message-ID: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

Changes v20:
- Fix double declaration error in Documentation
- Drop mutex from patch 8 for validate_mac_and_pcs
- Correctly use non lock version in __phylink_validate
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
 Documentation/networking/pcs.rst              |  231 ++
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
 drivers/net/phy/phylink.c                     |  493 +++-
 include/linux/linkmode.h                      |    6 +
 include/linux/pcs/pcs-provider.h              |   70 +
 include/linux/pcs/pcs.h                       |  174 ++
 include/linux/phylink.h                       |   30 +-
 22 files changed, 6519 insertions(+), 69 deletions(-)
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

