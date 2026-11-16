Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867987;
	b=DLX2irJIpIyVr0L9NzEFcqcgdUXLq9uoOJB6sR20cCYBlKRkW5EAesAbH9MF0DsJznkJ
	 0PLtrvxk3gM2gRpKc+Ur4+8VvS6dcyDzb0p+WF++DoOWdfMHcfrnZJAMpMLUdvxKlAnWk
	 raJnqxE0H/9b+mwcLILbFdw0+yHLN3S7xfUrbaMeBpm7sUhsaije0J8QzCaVorFus5+6Y
	 qwYhEuQnlj7BWI14R2PDi39Wg9OLfvqXMIdihkkIjpD3Irsu3CLqFTILvqf0hmC+huWkl
	 1A2Jjs54PYytVASijcH197wHugd3+BD93FCq5cOmtcrqwzfisuzlT/Jm2bMNlQ0TLow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867987;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
	b=IwzQ3n9GvsOq0IdFhASZ/k6/0W89vZWzdFe60YszrjdEmjbawxDnLEHD53X3ZDqKNLJm
	 V/yKYvDyLNomW4qAMLYhpBa3W0OQKkE0A3REPy5cNRi1SUvY1EoTm29UXbf+YYgucJgFE
	 n0DXYXl9akcWJAJh6lKT/GGw8iNYMWNd3hgfrIemVEIhkB7cTDRk5dLnfsM7Q6A0V8DFQ
	 JJoiEfDcYE2HIxqxrpRnVcnmhTittgN0H3JEGluTwzIQzu2fxqxOxfiu8uTinRcXvso+G
	 m+JpIxswEu1HELW68DGNn49m09hZJE8qzAjcFpXIvwSWxcZPn2bHnCjiiXcCaOSdiBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WxS8g9dp;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C617606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C617606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WxS8g9dp
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so2817096a91.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867985; x=1795472785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
        b=2zWJ1/z5vTdkwj8E3sv/e1tOEnvnRJP5PMXf6ivFUK5PEm+N1HGZ1U8z3VVeToyyQa
         8kMxLIkkYuXlMRmfF0U27ysNlfmvNxBd8my72kAI5HhCe5+T0M7nnTfLZset9QBV+RTX
         4SmlxXPgsvPu5AAV3Na4obbcdRp/lMjcYeAFXJ9pFipwte1n4gBjNbXwr/WyK6308vFd
         r26HXOdeyhOPnEKJE3dEE0xUZhOt9sZzU6WoqQNBngycmfIPnFgGTRvnENl55cA2WGfU
         k7vrjSDbMBi2s+9GWHC4bpaUD4ISiwuSG/uNCZOV8WiJ4TXORQSEH6LwzhsPHyAzTNoJ
         PLLw==
X-Forwarded-Encrypted: i=1; AL+hErFIR4XNDCF0yFIvnp9DIhNVSTd/esUZMSwNiIaRTL0pMdfvBmCPQsiKYL15aCiLnjvbOLFKJSsYKPcb@vger.kernel.org
X-Gm-Message-State: APuU4Z/zEyQ56ah0FEzWt4CE9A5x3MySvnr+M1vUTshcp+F7nrxyApG5
	CCKoBDr1CDbzY6KxAzA6odhPFhodDUsI9rR4AcJR8dL/XFf5MJwIeWiDARomJI883p5b9iNnXrE
	BiicI6vG36h8kP+mJO4jyTeTwm9e/uMBnTUmzhzyYEbrjQoFjrlASKq0fX+fyjgR00ld+mSlTGv
	jZe7ujucgLH0rREFISBicvkgqES4nECbTuRKq62mZQoTqoletcQ2eFEY2Ekgcd+z0eCMmpb46FW
	voqina5uIkmVP5KL35Iyg==
X-Gm-Gg: AZFdTZdio5Zp/q8/nmx8LCjub+4/Dxw9U8K43LdV2C40sGkhc8blzRpDDa80h+DHszI
	QYINDrB3ZbBbJY+pSIt1BHLN/63VFVwHhhELMORwgWq7/dx+Xp4nN1PzZUN8f7H6W33Mpqi2R/C
	QKkeU7rsySY0alHUYMBfWms3vlT1qLoUDvazqkiefgNqg10aVAltF3qqfy1fWfAhii7MMNI2ZSY
	yaEB5YDkhqXO0qjAb2g/c5ll6kMqcS4HEH8EEm/I9IzR95ToV8x4luCp2JwcmIrF2OlYtIznQ3m
	jxml8zRYUUPSNSKwfRy//POakur9ZCS7nT5yM0LCStvgPmHchmT0WR+s7ltOxPrLd46Kz6MLb+C
	ew4NAeFPgIyXBZoj85nI42XcbyJnPtWekKPfueGsjJD3l4IEU/fKdpFeGg6l9Jk68cv5ugUFzlh
	lE5fhcksYa+AWekeTbqGktHuIlPqgd/Q2YPNKxEL2C
X-Received: by 2002:a17:90b:1cce:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b1b0b6a455mr11251679a91.63.1794867985271;
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f198fsm545711a91.0.2026.11.16.14.26.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so4942708eec.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867983; x=1795472783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
        b=WxS8g9dpA8Z02fN5dIA94QiMp93TljrdCm1h6dkDyXu2Qlh5e5F0ODslESpl9z998V
         HbwKBO7bAtAUIOauV2+DrYq00wOrG0Ohael0jgUB3Wzg0B2Bgv/7fW/fEY+ePY7Zjgqd
         Jl1XbPjQGNVwbWGXsEltuLTTPBtJnmZnxGJXg=
X-Forwarded-Encrypted: i=1; AL+hErEXJQuWxYeGkUWNBVbx4y4v+YDv8zQHlmGGULWdFe4+w4+WYAZ6WWIq7MvsCm0O0Q1PLi1N/4Yu6IUf@vger.kernel.org
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11977689eec.41.1794867983573;
        Mon, 16 Nov 2026 14:26:23 -0800 (PST)
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11977651eec.41.1794867982905;
        Mon, 16 Nov 2026 14:26:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 0/9] net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload
Date: Mon, 16 Nov 2026 14:25:10 -0800
Message-ID: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series adds support for the Broadcom Northstar IPv4 TCP/UDP
NAT flowtable hardware called Flow Accelerator (FA). There is a second
generation called FA+/FA2 which will be added on top later on since it
builds upon the custom Broadcom tag.

Florian Fainelli (9):
  net: ethernet: bgmac: validate RX length against the DMA packet
    capacity
  netfilter: flowtable: reject non-host IPv4 packets before lookup
  netfilter: flowtable: retain offload ownership until deletion
    completes
  dt-bindings: net: describe the Northstar flow accelerator
  net: dsa: add Broadcom FA metadata and IPv4 exception paths
  net: flow_offload: allow drivers to validate and invalidate cached
    paths
  net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload
  net: add KUnit coverage for FA and flowtable path validation
  docs: net: document Northstar FA setup and NAT qualification

 .../bindings/net/brcm,bcm4708-fa.yaml         |   45 +
 .../bindings/net/brcm,bcm5301x-gmac.yaml      |   27 +
 .../ethernet/broadcom/bcm-ns-fa.rst           |  507 +++++
 .../device_drivers/ethernet/index.rst         |    1 +
 Documentation/networking/nf_flowtable.rst     |   13 +
 MAINTAINERS                                   |    8 +
 drivers/net/dsa/b53/Kconfig                   |   12 +
 drivers/net/dsa/b53/b53_common.c              |  427 +++-
 drivers/net/dsa/b53/b53_fa_test.c             |  102 +
 drivers/net/dsa/b53/b53_priv.h                |    6 +
 drivers/net/dsa/b53/b53_regs.h                |   39 +
 drivers/net/ethernet/broadcom/.kunitconfig    |   21 +
 drivers/net/ethernet/broadcom/Kconfig         |   35 +
 drivers/net/ethernet/broadcom/Makefile        |    1 +
 .../net/ethernet/broadcom/bcm-ns-fa-test.c    |  661 ++++++
 drivers/net/ethernet/broadcom/bcm-ns-fa.c     | 1901 +++++++++++++++++
 drivers/net/ethernet/broadcom/bcm-ns-fa.h     |   30 +
 drivers/net/ethernet/broadcom/bgmac-bcma.c    |    5 +
 drivers/net/ethernet/broadcom/bgmac.c         |   41 +-
 drivers/net/ethernet/broadcom/bgmac.h         |    2 +
 include/linux/dsa/brcm.h                      |   19 +
 include/net/dsa.h                             |    2 +
 include/net/flow_offload.h                    |   12 +
 include/net/netfilter/nf_flow_table.h         |    8 +-
 net/dsa/Kconfig                               |   20 +
 net/dsa/tag_brcm.c                            |  120 +-
 net/dsa/tag_brcm_test.c                       |  199 ++
 net/netfilter/Kconfig                         |   10 +
 net/netfilter/nf_flow_table_core.c            |   21 +-
 net/netfilter/nf_flow_table_core_test.c       |  171 ++
 net/netfilter/nf_flow_table_ip.c              |    4 +
 net/netfilter/nf_flow_table_offload.c         |   62 +
 net/netfilter/nf_flow_table_offload_test.c    |  129 ++
 net/netfilter/nft_flow_offload.c              |    6 +-
 .../kunit/configs/nf_flow_table.config        |    9 +
 35 files changed, 4651 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
 create mode 100644 Documentation/networking/device_drivers/ethernet/broadcom/bcm-ns-fa.rst
 create mode 100644 drivers/net/dsa/b53/b53_fa_test.c
 create mode 100644 drivers/net/ethernet/broadcom/.kunitconfig
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa-test.c
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa.c
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa.h
 create mode 100644 net/dsa/tag_brcm_test.c
 create mode 100644 net/netfilter/nf_flow_table_core_test.c
 create mode 100644 net/netfilter/nf_flow_table_offload_test.c
 create mode 100644 tools/testing/kunit/configs/nf_flow_table.config

-- 
2.53.0

