Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353546;
	b=fnD2dVQR6sXoOjOdDlbwzOSOVijHtiVu/Qpd/Y3HtQTlTEci4BynbS21MBXMhJuzVqij
	 v1bANIPGsg3rYvKta84wOCiUh6xmh9fELKiDRZFJm6ys9hHLowH+EwutRXcmKildZW6vA
	 7fn6RVExa9xIC3/aRO1+p4ENbZkhs+YzJ01Zyc3RjgSTgFEcE8PCpbtiBsPjOxaC0Ockn
	 CZFc5Oi7/oGoI78I9eBZlThA0vOpudO9Kbx8fhsYJxirwJdU52/3Jg5iofPq31OYGaker
	 kPa0Dw52mr+OjxSVQBpRcVv6PGBvdfFkZV1UG03iKmJhgnESBKBMzN9IpZlPvLR5O7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
	b=5V3e9QYsv7Nwi/6qOZ1q0RFSXhhWdxLEed5zTLhQ7aJWv1cJPh+aXo7rizC3yW4q9itx
	 Uoghcgmk/moZkPSiWT1maMHSZTnFuCawcLwbTkz7UJLAqKT2hsdoXI4cGHPvv9RLikXk/
	 DVhXchikA1t9z/sfaNBFO/D8xGylv6uxiPiBgWNhmiNXmTvAjoEi7XHB2zyW93L/V7uDh
	 UQ1WHkNPEGzbJdSgbpvVYctJRZO3HF+A7j2j/BnaBUxdBTpHdo5lXvVwNEw23GcHb6jBY
	 H9V+i75ykR11mgVvdRMcv0TE0a45U/W8L1K7yjYBBqS1JUrOKtcGF6uSYtEJMABgjvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFVMHWL;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD0606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 13:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68AD0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFVMHWL
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acd523a802so21810231fa.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353544; x=1795958344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
        b=hVFVMHWLqX2IuGxnGPcTUcFvQXc3u3gzVUOHyRT6+uRwgnf+jlUlLRwhgwWNp33WZJ
         6ysfD6E0T6yGrY2xD0yhKSsPmTXQC2Muctoz41l7NxF2uUeOpJe5JduAul5xDvZ8f9t3
         jLNSHhH7x4AxrdnD+wUIyl1KCVSpyNp5HFVlZkPLaB3iIAteX0h1EbEIlPaJqnAp1OUq
         IIYAIPEE8uNeO9L8PIY55hTwMA2XKue7pEUkATtjvuFwfYSn5w4kNtW5CzDjEBClop9M
         IIhsdBxB/wLodKoJN7c5Kh4o2QywpbnAKpVEknheasWeEgteqhnqe8V4UE4PlmaprHnd
         qJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353544; x=1795958344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
        b=Ncsd6QXHB4/3/L6goSE+7SaIWpyearCAnvBiClYSHu3NBRtHyK3zfbXJwhtfxhsv1w
         lcld9kvRtORPMQt7VpnbQvp7OmO3PT5thAnsbJqdOXga4duCNFYjwus2s3cYqfwcEBdA
         sqXhYuNZ0EMuASkYWNRDJQL4xtUuXkdQ7VYQ2euNmrIfeJkRiqdvGkeKQ5uTvfO7YWv2
         c8Fgwkb28Ucd1OudITJrT+5vupvTyu31Vqzy5rFDSnZ97W3yDI2b/NCpLWvIOLDMI9K7
         iUtfWYHyoVJlqV8fayfm2aHt4BgWEv92U8c8YLdHihaFrdWJmgWlTM9gRIWLu1Q2i49O
         1bpQ==
X-Forwarded-Encrypted: i=1; AL+hErEqov1gh/wX8GpeHlSsGUsWtD5HFypDhaXzd0fTTkr3dP1UeVqfPhOJtipsi6LpnGhWurB3enpAKJhw@vger.kernel.org
X-Gm-Message-State: APuU4Z95aksP+hMhQKxb9GnpBXtdKCsDAz13DqXvlQ34FNiySI7V5kl6
	TCkTAzRnIufyREMrI42zN3eoupf8YVpon4iSRQEqu8t28QSoXlSNqGTOw/0Mkg==
X-Gm-Gg: AZFdTZf8NQC0r8izC63hBZEGk+IZJRFMw6BlkY9X4G96/dQ9QT2ekATcMnw7MhRxByB
	S5IyUv+NtYQf2uZBiOqugAH4npE05qq18ukI1+HHgqnuehmaIuHEBkzE0Xukq9HEETYv8KtPkFp
	1TG5CjLHk2O5YXnz2QHEXWO6RUynZYgj3XWsnlvq0SI+jFWXdaN7emWXoW0A6X2+fFzh+Dx35TK
	eWyNZCPVQSKgAB/kAkiEvMEdJ6blWY3cVxSwYmeqVPdvvYud3uVT+rsApzsps48ndH6vPZ48X6a
	+8wrJ41J7NRqJmwq5an83TlSJxIOZabU3NhrZmLY+rnSSLbp91ZUMScr5DFMM4nTrwXoP6/NkUG
	i5CSP8NVNvFaxYMKopqujYh8AxpvJN/loG5YzsRrZknU2lrZsgIphHFDRIZ9+egZ2JLkKrX8CrZ
	52eqIhDh3RjGdY51Er5FiKlYakjNyxe8t1zvXmprTxHxdOr2FDwknEWVn+gcwder29j1TxwMFpA
	Z97ez0/m+MB3BoF2Nsrjz9VP1mUcvpvZzHS1Fq0pVxu1oniLur5yh+pi7E7/G9feqFq89MgVMUO
	f2Vs4ugTfUS2GrYXeSXdrdH9kQixqA==
X-Received: by 2002:a05:651c:19a3:b0:3ac:e5ef:1b8c with SMTP id 38308e7fff4ca-3ae7f9de88bmr24914911fa.11.1795353543336;
        Sun, 22 Nov 2026 05:19:03 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:02 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 0/3] net: phy: dap8211r: add LED control support
Date: Sun, 22 Nov 2026 16:18:53 +0300
Message-ID: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello,

This series adds support for LEDs on the DAP8211R
Gigabit Ethernet PHY.

The first patch fixes mistakes in function comments about locking mdio.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA and implements the three LED callbacks
required by the PHY library.

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/dptel,dap8211r.yaml 
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dptel,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dptel,dap8211r.example.dtb
$ yamllint Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
$ grep -i "dap8211r" Documentation/devicetree/bindings/processed-schema.json
    "http://devicetree.org/schemas/net/dptel,dap8211r.yaml": {
        "$filename": "/home/a-shimko/patchwork/linux/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml",
        "$id": "http://devicetree.org/schemas/net/dptel,dap8211r.yaml#",
        "title": "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY",

Required:
CONFIG_NEW_LEDS=y
    CONFIG_LEDS_CLASS=y
    CONFIG_LEDS_TRIGGERS=y
        CONFIG_LEDS_TRIGGER_NETDEV=y

Testing:
$ ip link set eth1 up
$ ls /sys/class/leds/
stmmac-1:01:amber:lan  stmmac-1:01:green:lan
$ echo netdev > /sys/class/leds/stmmac-1:01:green:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:green:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:green:lan/link_1000
$ cat /sys/class/leds/stmmac-1:01:green:lan/offloaded
$ ip addr add 192.168.5.100/24 dev eth1
$ ping -I eth1 192.168.5.1

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:amber:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ cat /sys/class/leds/stmmac-1:01:amber:lan/offloaded

$ echo none > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/brightness

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ ip addr add 192.168.5.100/24 dev eth1
$ ping -I eth1 192.168.5.1

--
Best regards,
artem

ChangeLog:
  v4:
    - squash extended register write helper into the LED control patch to
    fix netdev/build_32bit, netdev/build_allmodconfig_warn, netdev/build_clang
    fails (patchwork.kernel.org)
    - add andrew+netdev@lunn.ch to Cc of dt-bindings patch to fix
    netdev/cc_maintainers warning (patchwork.kernel.org)
  v3:
    - fix kernel-doc comment for DAP8211R_LED_FORCE_MODE_ON and
    DAP8211R_LED_FORCE_MODE_MASK
    - use FIELD_PREP() for DAP8211R_LED_FORCE_MODE_ON 
    - Link: https://lore.kernel.org/all/20261120081106.2919010-1-a.shimko.dev@gmail.com/T/#t
  v2:
    - add a commit fixing kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
    - move LED child node down below tx-internal-delay-ps in dptel,dap8211r.yaml
    - add blank lines in dptel,dap8211r.yaml
    - restrict LED reg index to 0..2 and fix schema properties in dptel,dap8211r.yaml
    - fix kernel-doc comment for dap8211r_write_ext()
    - add LED brightness (force mode) support to driver
    - remove rules == 0 statement
    - add TRIGGER_NETDEV_LINK to DAP8211R_LED_SUPPORTED_TRG for dap8211r_led_hw_is_supported()
    - clean up switch (index) statements
    - Link: https://lore.kernel.org/all/CAOPX74709XiLXLoioDJStTSzzhstC2sHpM4GieAO=3-37E18pw@mail.gmail.com/T/#u
  v1:
    - Link: https://lore.kernel.org/all/20261113110546.173624-1-a.shimko.dev@gmail.com/T/#t

Artem Shimko (3):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 242 +++++++++++++++++-
 2 files changed, 290 insertions(+), 2 deletions(-)

-- 
2.43.0

