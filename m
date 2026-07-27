Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B533BE17B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138813; cv=none; b=XnWE8W8LIPJZLXcXIbDfiAAfz9AaNOt1Lxm1wA3liIJdwgzISz4OD7YklUtvT42XtiiRgY44rXHNRxInBro5ikL0ay3t0u4nprw/nmLQzOGPurAIoSzuCIXiQWfWfF9tbMmvtZ9+zVxZpq8ZNzZrgP8hS7i5g3Mc+WACfG0VVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138813; c=relaxed/simple;
	bh=RwaSeM2o8U7Yz8AgPwYV2ZMuhpugkxYXZJ/7zGmXh2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ocTzDq+6PsIqWZOI37yx4URc5Uemeb9fQQFHWzL31f9BO8aY3J3FwGMAfUqy2WmPy+Lt+Yw1PZOUu2XUe9X/JH6necjMmnzPYX8Ru8Vv/YLfDzjRx5sgUlxQxRBgxVPJQdNRVhGOCrP5f2LkPewCjMuXkkDBgFmZ1VMLbTLznwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rbbrg+QQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rbbrg+QQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15f47e6297so235365666b.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138808; x=1785743608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ex9WK7cMQbcLGyCbuvoOK8Ni/e4QYuUFvHwa+Upbhlk=;
        b=Rbbrg+QQBYZdPr7CUJYmZCdUKu6Q3xfGmY/f7zFSzbvyEcgQHwxaJZtM0Nidf/N2iy
         aQBOMkSEpLE5E3pGTIY5+uG6kBOI9mVosPv9U7Fetpho+YV2ABiyPvw5ibe8WdQ6/0f0
         h3MV+r3awp0EIqQnSFWSfESCT/waBr5wvm5RBAU5cIxMCVY6zNYUWEfl4cRWLVSt0yZ3
         l10PFg08v64HkmRJ04um+PLNhASJqczyruLhwUWHCB/tszHtn94dei1PuMc0lGaP75l8
         SCqLPxN5LJpQ+OY0bXedM0SVjCcCCPDppdZwKEO4Y+eDbiwrfldkHSMrt/o5oXQkaf17
         uV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138808; x=1785743608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ex9WK7cMQbcLGyCbuvoOK8Ni/e4QYuUFvHwa+Upbhlk=;
        b=ZXsIMY/9oseFp6ykmCEl44403n/1yFGCkpNOBd8k5ovRJkyTrJqCJ2+G3QsqUGtZBN
         MVXLG/qAoIrx18H2tRQ157So6TfjGJ2UEsjnaypwz0r8MGF9Q9Mpf9vkQ2nJhce++SEA
         ZKj8zn3JqxfztcX8+IifIe12rlulzYh6LLdsop9gvg9rlMVBNuKrl/VpjffSSQiKeAeR
         genXoj1f+3ktQaLnbRhY4vRownvEZmbiui9AIKxAJLjpVa5mmfb3kztdfoGAtHojpWGT
         zLYpEilMLDmYl1vtCzoWZLFwUlzGnTUlP1nt7VKXzfQsQz0jFZZnwrwPdLReiI5HWKwk
         w/7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp9y2yxFP7+4murw9DP6ffbagYj3IpKqZdclPLAiDYzzEecBMccQBuIAYMTI/bSm+nPuW5hYG445+Bq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6sLlMKODo918rt9kTqSEeJHyDA+tX45MT+9kfcJgwIQuf7KFc
	0PP7Vvva9EfxpCPwCTelxvQsKzBA9e9w+JMq0fCX7+435S4P3cJqxvm/
X-Gm-Gg: AR+sD13iZjOqvaEJySAGeS4sHEUDpjCmXFLLJKqvV2Eaoh4X3sb0b0DcpgBD7ib/laF
	Ewwr1Srx9ipj3xLPyWjS3f79sgJt4zy2KR98IoiQEQNKcdcMZQKjA8CfQA9QBk4lclMgfB8L0oR
	TopSKI3g56SpyAoD+Ke/747q5UMiWYwivjpNku4qZLIktZ/SOY+oWiJPge7f2uzFF51vAEawQDA
	LTdG+9YuAogOuFaaaD3/bWfDJ/RcJdnLntS319PJ8RxG+oCsdyQjS6vkLIDhd6SAGXVeMlh5g+V
	NbcWo3c/Uur3yTR7S0zvOOlpnhA2mLXKrTPG9y9UFTvlOlAcVi4AiY8LS8BaB+s0TSD6J6hjsKK
	FUDYJ5IDd1h8yVWYjoLZZsvtlu6c21MySvMVsTJTJyk/2uzMOP5k9HwXNIlrEpXp96B7fuXWc9G
	JZF/DV49C8rez3cQ==
X-Received: by 2002:a17:907:724e:b0:c15:c638:d03c with SMTP id a640c23a62f3a-c1f1f06b45dmr319380866b.47.1785138808192;
        Mon, 27 Jul 2026 00:53:28 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm596226866b.20.2026.07.27.00.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:53:27 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v4 0/2] Add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver
Date: Mon, 27 Jul 2026 10:53:22 +0300
Message-ID: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds support for the DAPU Telecom DAP8211R(I) Gigabit
Ethernet PHY, commonly used in enterprise and industrial networking
applications. The PHY supports 10/100/1000 Mbps operation with RGMII
interface and includes features such as IEEE 802.3az Energy Efficient
Ethernet, IEEE 1588 SyncE.

The driver implements extended register access via indirect addressing
(registers 0x1E/0x1F) and provides comprehensive device tree support
for RGMII delay configuration. The rx-internal-delay-ps and
tx-internal-delay-ps properties allow precise tuning of clock delays
in 150 ps steps from 0 to 2250 ps.

This PHY is used on the NDA platform with 1G Ethernet tile and has
been tested on that hardware with successful link establishment and
RGMII delay tuning.

$ make dt_binding_check DT_SCHEMA_FILES=dapu,dap8211r.yaml 
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTEX    Documentation/devicetree/bindings/net/dapu,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dapu,dap8211r.example.dt

$ grep -i "dap8211r" Documentation/devicetree/bindings/processed-schema.json
    "http://devicetree.org/schemas/net/dapu,dap8211r.yaml": {
        "$filename": "/home/a-shimko/patchwork/linux/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml",
        "$id": "http://devicetree.org/schemas/net/dapu,dap8211r.yaml#",
        "title": "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY",

Working with xgmac.

Board side:

$ arping -I eth0 192.168.5.100
ARPING 192.168.5.1 from 192.168.5.100 eth0
Unicast reply from 192.168.5.1 [board.mac.addr]  8.543ms
Unicast reply from 192.168.5.1 [board.mac.addr]  3.295ms
Unicast reply from 192.168.5.1 [board.mac.addr]  4.301ms
Unicast reply from 192.168.5.1 [board.mac.addr]  4.096ms
Unicast reply from 192.168.5.1 [board.mac.addr]  2.872ms
...

Unfortunately, there is a dependence on the axibus speed here
$ iperf3 -c 192.168.5.1
Connecting to host 192.168.5.1, port 5201
[  5] local 192.168.5.100 port 58936 connected to 192.168.5.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  7.88 MBytes  65.8 Mbits/sec    0    150 KBytes
[  5]   1.00-2.00   sec  8.50 MBytes  71.4 Mbits/sec    0    165 KBytes
[  5]   2.00-3.00   sec  8.25 MBytes  69.2 Mbits/sec    0    165 KBytes
[  5]   3.00-4.01   sec  8.50 MBytes  71.1 Mbits/sec    0    165 KBytes
[  5]   4.01-5.00   sec  8.38 MBytes  70.3 Mbits/sec    0    165 KBytes
[  5]   5.00-6.00   sec  8.50 MBytes  71.5 Mbits/sec    0    165 KBytes
[  5]   6.00-7.01   sec  8.62 MBytes  72.0 Mbits/sec    0    174 KBytes
[  5]   7.01-8.00   sec  8.62 MBytes  72.8 Mbits/sec    0    174 KBytes
[  5]   8.00-9.00   sec  8.62 MBytes  72.2 Mbits/sec    0    174 KBytes
[  5]   9.00-10.04  sec  8.62 MBytes  69.9 Mbits/sec    0    174 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.04  sec  84.6 MBytes  70.7 Mbits/sec    0 sender
[  5]   0.00-10.12  sec  84.8 MBytes  70.3 Mbits/sec receiveriperf Done.

$ ethtool -t eth0
...
The test extra info:
 1. MAC Loopback                 0
 2. MAC Loopback (diff. queues)  0
 3. PHY Loopback                 0
...

ELP side:
...
17:29:11.974973 ARP, Reply ELP is-at elp.mac.addr(oui Unknown), length 28
17:29:12.975199 ARP, Request who-has ELP tell 192.168.5.100, length 46
17:29:12.975217 ARP, Reply ELP is-at elp.mac.addr(oui Unknown), length 28
17:29:13.975022 ARP, Request who-has ELP tell 192.168.5.100, length 46
17:29:13.975035 ARP, Reply ELP is-at elp.mac.addr(oui Unknown), length 28
17:29:14.974837 ARP, Request who-has ELP tell 192.168.5.100, length 46
17:29:14.974849 ARP, Reply ELP is-at elp.mac.addr(oui Unknown), length 28
17:29:15.975026 ARP, Request who-has ELP tell 192.168.5.100, length 46
...

Accepted connection from 192.168.5.100, port 58932
[  5] local 192.168.5.1 port 5201 connected to 192.168.5.100 port 58936
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  7.12 MBytes  59.7 Mbits/sec
[  5]   1.00-2.00   sec  8.50 MBytes  71.3 Mbits/sec
[  5]   2.00-3.00   sec  8.50 MBytes  71.3 Mbits/sec
[  5]   3.00-4.00   sec  8.38 MBytes  70.3 Mbits/sec
[  5]   4.00-5.00   sec  8.50 MBytes  71.3 Mbits/sec
[  5]   5.00-6.00   sec  8.38 MBytes  70.3 Mbits/sec
[  5]   6.00-7.00   sec  8.62 MBytes  72.4 Mbits/sec
[  5]   7.00-8.00   sec  8.62 MBytes  72.3 Mbits/sec
[  5]   8.00-9.00   sec  8.62 MBytes  72.4 Mbits/sec
[  5]   9.00-10.00  sec  8.62 MBytes  72.4 Mbits/sec
[  5]  10.00-10.12  sec   896 KBytes  62.3 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.12  sec  84.8 MBytes  70.3 Mbits/sec receiver

DTS node example:
&ethernet_1g_tile {
  ...
  phy-mode = "rgmii-rxid";
  phy-handle = <&phy1>;
  ...

  mdio: mdio {
    phy1: ethernet-phy@1 {
      ...
      compatible = "ethernet-phy-id0008.011b";
      rx-internal-delay-ps = <1050>;
      ...
    };
  };
};

--
Best regards,
Artem Shimko

ChangeLog:
  v3 --> v4
    - Drop dapu,tx-inverted-clk (vendor-specific property removed)
    - Fix driver behavior in relation to rgmii modes
    - Apply software reset before RGMII register writes
  v2 --> v3
    - Use phy_get_internal_delay() for delay validation and selection
    - Add poll timeout for reset using read_poll_timeout()
  v1 --> v2
    - Drop debugfs interface
    - Simplify RGMII delay reading logic using of_property_read_u32()
    - Fix missing newline at end of dapu,dap8211r.yaml (yamllint error)
    - Simplify delay property description in DT binding
    - Rename tx-inverted-clk to dapu,tx-inverted-clk (vendor prefix)
    - Replace enum with multipleOf + maximum for delay validation
    - Fix compatible string and tx-internal-delay-ps value in example
    - Remove rounding logic, return -EINVAL for unsupported delay values
    - Respect DT delay properties for all RGMII modes
    - Add polling for self-clearing reset bit instead of fixed sleep
    - Remove unused packet generator macros (DAP8211R_PKGC5 and related)

Artem Shimko (2):
  dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding
  net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver

 .../bindings/net/dapu,dap8211r.yaml           |  63 ++++++
 drivers/net/phy/Kconfig                       |  10 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/dap8211r.c                    | 206 ++++++++++++++++++
 4 files changed, 280 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
 create mode 100644 drivers/net/phy/dap8211r.c

-- 
2.43.0

