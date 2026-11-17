Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915880;
	b=rkyr1nZCU57DHia8KDxgcXDaBjvrRDafhCSh3LgR+UWi7CscYxqEO0c9dccrJQ8PmtZV
	 WjxZQNG3H74wM+8DpVJ30vdvKK+RcQR+oeKbDwqo46TyzcBenTcV1wjpxEAfptiVE9Rae
	 TLdw1cSRm7eJ+4kwOw7QkBgaVtjCV6lV2haIsAz8Y+eipZ4t4Rk7GiU++Dqi1lZ2QbolV
	 3E+YRAzf1ZCroxUBUHisWdPll/SoWKFmB2M4DqVQP5jp4Ins3IpqWOwVE2/BPTiYyCdj0
	 Sj5IcUqpw4dPUEaprIivvJaJgVkburRvdkR5v4ZFMkvo0ZpNCcH+CXOpDaDozbGR2tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
	b=m2GbltJxPZ7/59iHfKRdo1wg6jZwbY0A9sKM9pagCnQ7hEJnNQStWSNzTFuuwwmM4gf/
	 Aufn19RXy0KjK5fIw+WfITZQaqAcDkl0cXzcm6gwB3gqa8rWU5PF4qzQfABS2dKhYwhOt
	 Rp8DZ7DjMFi9wpILjQfEoSOx/Ns9F1nahlOYam4N6GeOa2bgkxQR4Zb8ozDs4rdo7wDT6
	 5EJhcfH8aUP5xa1TBY/bVlLi1J1XB2ykLBH7MmSqG8OxlGoWTMxMpc8wiDzjgGQYUayJr
	 jdyBlsZ9w7n8992F+Y3li6Jell5ZGpF/mUnxNDMRw+oAKzwzbqnQo8KTnPjwIMQ02xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bb9NC1x5;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BEA606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15BEA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bb9NC1x5
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so48233111fa.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915878; x=1795520678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
        b=Bb9NC1x5OLMj6GYojtlvhpg2bGM9QkVVZ/Nuze7fFvnPSyiL3TFFk2hjQ5LFSo5/oS
         AnE+Y2WaF5Sg2oRLyvYJldA7T1yXNiUO70MnKqvfH9EXdNc1QGOKS0nRLWyihPRCBmB+
         hHBuPTBFHDRVRVywd9qEV8hRwZPZKWPctrsmSgAxE2nIA6aODanvekNhMQIbqhlV6oBI
         8U3LzEZePp10oSkctiV/9ScXs2dMTD7t6Zj6S3UOcHWbe7R8qOOmrCG8KMM7qCOZt6qm
         lhZBvxEg4WRGMbBij0PyRjtLXnQk3X58KtvjIT4fMLMdyP7EB6dbcqw3BDBVP1zEVeMn
         B2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915878; x=1795520678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
        b=CiPvMb7KY/szZ9dR6MLNxMMhf19AjO5q1828+TuGZAq3fUGvGoyYT7hIc1NG2GKz+R
         Zt4QhponwWYVl2CD0vx62ZulLj2G+ZvMe/lbXP1tr0zytcgTUN+5tPru1fCGYCC7vysL
         YL4K9dHXhO+wxuWX4huMAJbup2Cxfr8XYdv0QWH8xPTtmTRsThFS3YtUc6nlWQgMGjSJ
         vagGkrwik+tK/5qDHezbKZFkeFpygM27+HWSNwvIOVW/m4N8YDOx2FxFR3/PKjdqlYJd
         n3OwXwOiKgT/4Am8xNUJHRjeg1zFrG8WkvNT/O2Ulho3aTNriDlXUBBt6+T67h5/f6Id
         BSLw==
X-Forwarded-Encrypted: i=1; AL+hErGtc/vJCQkqc3xaM1WXjS9OqOKQ3SnHV7fJGUsHyCDkq+OCc8U1z/LTX9GpETRCerlLEXfoYCRzHivj@vger.kernel.org
X-Gm-Message-State: APuU4Z9cnZ1ltTVp5eEKtfCzTz0FQjthGRj3L8YElqGFm7cyCOifizOs
	TcBftz/NnkK3EXFjemD/+UBV6jQg8QRZW8MirPkO/v8Y59jUHu3DOMW1
X-Gm-Gg: AYBFou3Tp8TdNZNTBHSq38ZoYRSoz7dARsLfSLTS9Ht/9RIWYva3CYz0kK8GN3DH9tj
	16zmeOg57OCQZUKo3nS7knkev9tYi+TMTcsVRzgxHC15Dxie7hQkC9kAKVTgBBw6hq1VLNOEiuC
	t6pRgxky81VLAjb68BorZHDChnq+xDCRwojx5r0BgL4iTSdKmSWPMFFEhJDBJNF7CpMgiHbPsJw
	aKvZXI12J/RVPRC1BXavf29BUrRbV7poAJy7xEGdfQ9i5ExbkWYjYBc7uMv6G3k93GwpEQ6tmDK
	GYRRPDYKChXE74SFms/C7w0Iib2e6XzD7LeDFAeKTUl8ncOF31gOAJJeqNrG6Xg1AxgxgDuLZR8
	KG8xcazWPvhWN8kJrszZn7ZZOOItrx5kcm2/kG+H00nUyX0MAgPkdB6afvDvuBr7WjU0pgIf6RW
	vY/ZlgZe3S2SVhLVLzlBl+vDj0P7hkutk7QJpw5e4MVEWB2VD2rSw9WBe7f4mafoW6lmBi9lw55
	FHEbdYJkGqeYsR2E/CXYGYK5e2jH8oROIkL3BmU/Kx6Yx0xhCVwMJzTLeWHNpHdcSsAY0dl8ONA
	uGGo0LZNvHUeGYcWHwMRAp61J/MWVAPXJHprU+kGa56yHTs=
X-Received: by 2002:a2e:a105:0:b0:3ae:68:d07b with SMTP id 38308e7fff4ca-3ae2b5399b8mr37245611fa.11.1794915877954;
        Tue, 17 Nov 2026 03:44:37 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:37 -0800 (PST)
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
Subject: [PATCH net-next v2 0/4] net: phy: dap8211r: add LED control support
Date: Tue, 17 Nov 2026 14:44:26 +0300
Message-ID: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

The first patch fixes mistakes in kernel-doc comments regarding MDIO
locking.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA. 
The fourth patch implements the LED callbacks
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
$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

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
$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

--
Best regards,
artem shimko

ChangeLog:
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
  v1:
    - https://lore.kernel.org/all/20261113110546.173624-1-a.shimko.dev@gmail.com/T/#t

Artem Shimko (4):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add extended register write helper
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 243 +++++++++++++++++-
 2 files changed, 291 insertions(+), 2 deletions(-)

-- 
2.43.0

