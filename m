Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567953;
	b=2aMA8O7rgXV29SfcdBdnoknVafcqbI0CBf5mAbLnp6pm4+mqOFKpn3Hbdt0E62wxg+dy
	 pfpH6pfCCBx8UDi7LeAFu7TWxajh982wylkXP3YJz7TrrMvGHg6KH4Wc8wh3xFNayggvJ
	 cZvwrBzwhA7+gQ3F8rXj/VwNLZh0jNAwUoJ6hd1GLgPDKlj9XZnacN1LobyGtWhbIEb4b
	 wFjKk/JoBceVUidKEvzpaG4F6KYWsxAJMqWpxz+J2uczor2IlF3SXjY9ealvN8VfDIqV7
	 BtU5+Hmiwnnb+mcCRn5NJTJM+AaI5necWyyJlWwa2htKKye8H6QnomGdbMgt34E1l6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
	b=hhFQSSUHr5dvUkp4iLHDK1b45Ve8jAvKNvbbK7UQIfYhYUGljeMlpVfbphSyxWnU+0ef
	 j6T9PLFrsfz1JEulY0EylbQZ3zXxaf7VzXezRySHv/xCw2d6r1TzxvQRu07kPa0Z/x8Sc
	 wrbNT+tl9qctdXpEuTol95231ETDotIpzIZI+FyjN+ez+14Btjc6YAnBSdn9frrNPmH2U
	 5ajg4mNsfYK7aN7A/XfbV64n+OUMUCBVneGAdQIvsb5mkTvd+uVdwGjP6lwdIMfJitRdq
	 iVtioiT/8LFT20EZEjYqDk00LxPUP+XmHEmR3m+wRYPRLst1r/nunyHPpN57y8LLOgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTrJM5N5;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E3606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTrJM5N5
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14470729eso995975e87.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567951; x=1795172751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
        b=pTrJM5N56JwLitY8jMA6aeAQED3ILcDksDAzVeMg7z+Pb40AzV+vriwY9m1oXzTIDg
         HNnq0dE5w0sV94AlLlGZeS5rvx7HDP/f0LVqvKamh98XrWMprTEwjX+FNwspkbByavRc
         VHNqX30dBy8VBpRBqCNrRrhomiwHGXmk21ItMlOhyqFAvs6h6JA3oGaCb2NUWj++a27I
         0JMty6SVln9aWctIzGZK0N2Iwlt0dx4U1x9y9pR6oI8+unczMJ6TLxZ+KsIdTTFwDElH
         j9Q/OYNf3v4Ga04FaKONKLv0jy8CY9tYUsp+hst2Eldnf370JJRGKTolOANfYza5osym
         UBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567951; x=1795172751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
        b=Vhr+M0m4/Yg+JEXCutWzN5Djqe6TnqeZxVhJvGkFmo87boHb3K/ZSyw/lCah9ZPlWK
         DrSIIhev3PlhMxht7WHqUZ2nXQbVaWuet64+4Z1owlQ8T5K4HzaTFv7Lhm/NjR9P2KQd
         GXlak7NQBY1swoA+Fd/vlmn9TDrYDoXTZtrzMUjRz4IdXpsIBqN6gOxF0v/w5rF1/CPM
         eAB4aOYtHBjWUELJ04HHFUgnbGorPw6vHU+BlESuRuBMIekqZ7kwwrmWJy1L2d/8WWrC
         9FVnSz7dZ3n9O0UXUYi0sJENtxLT/UTBR+hsHf7wjI1hWzjpG4tlN6QUsYisJQfHVuuU
         iXnQ==
X-Forwarded-Encrypted: i=1; AL+hErFV90mjqrCa8LJMVIqjwfnEvDCapj7QQN1uCnITa3mEffl0EevCX77R5AWdxiNo+I99Gsfjf6fjXvQk@vger.kernel.org
X-Gm-Message-State: APuU4Z8y1qA3HZH+/s2rAzVpEtpIYka/bNzY1+62f5t2Iuo9KxUQsDX8
	5U0NPr0xsMtfMJKCvwuPg5iUMdhy2Bc0wTiE/s1r+dsXkg5Csbg6GD9y
X-Gm-Gg: AYBFou3xTX8KdT1mGqnsUCxJ+jOHWb6rn4saFGQeuIAmF5RDbV9JkfAwdWEvfipC8z2
	CZYO7YBcPGwGp/i3xdPUWtqZ3EvkwFa5yIqSBLlCrbthZ3ie2Btj8z6S6ZVVRvOZm21UfaLoWa9
	WQNj6DMz/tCvh/I8GzpofeQlJfOWYUKzkO2/woiz7fYSGtR/t5OAg/vTq+psdB+9SgBCrAwzgT4
	juZTvpa6pgdoHQ2NHLbjidYFOW6xs3W/U0lPEsH4bFO9DIDmceS1iHptU4aFENf0cwxYirRskRx
	54uI1SyFsHryvHqMmciYWSUwyJ2sy/U8EnP48P9NKaGmRmXSta+I/tJho0wXi0MNuXHROsnVSK1
	lfksiBcCtVzycJc1f41Ds3tNjOCGlyywaJcBYJZKQe9bVc4KxwaPhKfl0+lT2BVKZJou4UGjHq2
	CIbhFbCtNkoSN4RVI2y2l/4F7lpqGuOG8eH3leh5U1265mYKDApVQ2oNaj4o2mE5VXDkzm0tei7
	NOxXzvMfkQERMWlSng2zO9F9rJ2RHUc8NqRjsLITATFZZrjL+iYo/if/7I7ywYHbQk6OQR+5tr6
	bymtGRt9Z6ttE5FdiNU/QUG4ayh8yphKvq+kIcooRtwS2aU=
X-Received: by 2002:a05:6512:15a8:b0:5c0:ca1:46c3 with SMTP id 2adb3069b0e04-5c170b1c76fmr842803e87.22.1794567950691;
        Fri, 13 Nov 2026 03:05:50 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:49 -0800 (PST)
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
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 0/3] net: phy: dap8211r: add LED hardware control
Date: Fri, 13 Nov 2026 14:05:42 +0300
Message-ID: <20261113110546.173624-1-a.shimko.dev@gmail.com>
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

This series adds support for hardware-controlled LEDs on the DAP8211R
Gigabit Ethernet PHY.

The first patch documents the optional "leds" node in the Device Tree
binding. The second patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA. The third patch implements the three LED callbacks
required by the PHY library.

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dptel,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dptel,dap8211r.example.dtb

Required:
CONFIG_NEW_LEDS=y
    CONFIG_LEDS_CLASS=y
    CONFIG_LEDS_TRIGGERS=y
        CONFIG_LEDS_TRIGGER_NETDEV=y

Testing:
$ ip link set eth1 up
$ ls /sys/class/leds/
stmmac-1:01:amber:lan  stmmac-1:01:green:lan
$ echo eth1 > /sys/class/leds/stmmac-1:01:green:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:green:lan/link_1000
$ cat /sys/class/leds/stmmac-1:01:green:lan/offloaded

$ echo eth1 > /sys/class/leds/stmmac-1:01:amber:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ cat /sys/class/leds/stmmac-1:01:amber:lan/offloaded

$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

--
Best regards,
artem shimko

Artem Shimko (3):
  dt-bindings: net: dptel,dap8211r: add led nodes
  net: phy: dap8211r: add extended register write helper
  net: phy: dap8211r: add led hardware control support

 .../bindings/net/dptel,dap8211r.yaml          |  38 ++++
 drivers/net/phy/dap8211r.c                    | 207 ++++++++++++++++++
 2 files changed, 245 insertions(+)

-- 
2.43.0

