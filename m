Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459326;
	b=RrKxnRZX2ceZmokfhlcbDGztGVAyALAFx4adPKzHHu3AMpI44eBb6N2SKerRKj3tw9wY
	 Ze2jciLJ9vWbde6ivtxiZqXaMmLNWGKUmKMQ+quqm3u1aGjQTP106FR1sDtKByQRqyYo/
	 Y8SnjEf9H68C4RigbcndhtnpnQJr7sl37QhVthYqDBxUZ5t5hehXXQ/WlSW78YOhs3kaL
	 f7Wo2NbLUO7FK35UWOdopG5e5FD/S+bBcEPZ1DJsNJ3L/JFNlCEuwZV/6M1WuIbLj4TsQ
	 gW6wRk4uj+V9tAqoUUu8GfBns7FjA8NcMzYsejF3HlXhf9crOlCh5xeZOD4sG0/GpsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459326;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=i1g+/0YNzYvqBFGPUcp3fwhOFj+qj4q4cuNnKmvR8ow=;
	b=w2QBxBw0ZTKcoUfWO+a9jMkAQQ9FWntc/5qSG3vPVequROsR0j6aSK4CBlZSqBNVvbC+
	 jKWIYIFS0saAOvYx1gid94XJI178KIls+oVWIRnjMr1sG1F7FXQhOnU9OEgjztj7NpPdn
	 5a9x54Kc5Uwl0zilO7ol7XDDBZkk2ZghqMGepT8QSFUADqCrBLFV7f7YETnW4BKhudAWL
	 KQazvLozTc16qQMHAOanWNP7nOV6xQdqFBkfJ43FBjCrLZwNi6S9yHX2UkaVHCsVvnYMc
	 ST7Ls+mzxNeS8/xFZKpqdCIYMobUqHbXrZ7XPwthhhUYL3IoLpr3jAolyjuhmUvxGsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T0mwVT72;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E41606A69A;
	Mon, 23 Nov 2026 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T0mwVT72
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459326;
	b=dtlG0m1xul8Xkf2eBkGyAN0Udg3c5OqJ3FyCgjo4g1Og3TL7Tjgn3K64zd8Dgv4OnYVM
	 fnOsej9owg9aOqxQ2sCpYvEfFNofP7nJ9HyTCW3qJ6dY/F3XydoXfgjivuwuhg00iZ3HS
	 hGZd5J1ww8QtYsVogSqaJWphTWgBaleOh980hOQnNFdKH+X9bQvqYISMb87RaoJyc4fTw
	 5obN5TIvDOyzbv6xkS7FuZpoQNUq3LctLwiS4jtaCNKwQdH6rkOtJgGvJewQuBL/O5uwV
	 mlC/2fxb92zAPRx4U5lMoH7FXplPkmmY8Y+FrdzdN//CqGjTIfCfDW5iYtiT74IYLag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459326;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=i1g+/0YNzYvqBFGPUcp3fwhOFj+qj4q4cuNnKmvR8ow=;
	b=2FpMCUt8kX1pXAfL2+2pvbgWtPxj9VlrhiG38D99ib20T1ZGH5TZwQU6ExKYMy0fyHa/
	 D9ockM47al5ZOrrA5EZFkuM/0C1OEbLvj08HjM7JPJBLssehxTFsLuk3YoJr6KFXlNuQc
	 9ApxorlsojbUnXCl/eKL2KUTB+5ry0bhOx9rwHcWNytU9Ehtcatql/yIijYEovVHY0TZy
	 4kUY085ANX8r4k/iBFYX1GlA8UNkClLos/6TF9NgxKZRWNSD4YYfIHcrLiq77AhJgehsn
	 gQGwJBezt1ss99lPFDCq0mJ/z7c+95noCU+pxqtpP5e59+o9bN28jJfH8nv4RTPnVcw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FDB01F0156F;
	Mon, 23 Nov 2026 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459325;
	bh=i1g+/0YNzYvqBFGPUcp3fwhOFj+qj4q4cuNnKmvR8ow=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=T0mwVT72k0zA2XEmRVoJA7r628GArpF1akV9QOS+kcP02MiwkgoXdIX007LNeD+Nm
	 ofCgUkkEQ8UE8hnX8zMoch0Pg257ZJ3vjV0PIgnF0BVYJ6zgjWjdSW84J+w93MpnYO
	 AATPICp+XO8WQH0k9Z1w6FLVPFLgOhKeOcsl5FgU9W4vrxi7oGL81dpvx2ScEo9ynl
	 zuykr8XnsGs4jV3zMmfrSaC55OZsPtrciBsscYWPm5Q1tLljal1ykpVkZ2kDVXH0D3
	 mDzP2WaQQSFiBr25ZUCaSaxsrz1fre4P6UFpwehOLxRVHzzsfROeCFVWRL1OZGetDh
	 z5z/w5ZbILhHA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AE1EE4C5ED;
	Mon, 23 Nov 2026 18:41:42 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH net-next 0/3] Add Cortina Systems CS7542 MDIO controller
 support
Date: Mon, 23 Nov 2026 21:41:41 +0300
Message-Id: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQrCMBAFf6Xs2QUTt0b8FenBpk9dwVSyUQql/
 25sj8MwM5MhK4zOzUwZXzUdUwW3ayg+rukO1qEy+b0/OucP3AtHC614fg06MqIIQhtw8kI1emf
 cdFqHF0oonDAV6jZjn/6JWP4/WpYfXr0PBXwAAAA=
X-Change-ID: 20261123-b4-cs7542-mdio-ec44e757e824
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459301; l=2489;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6YV4xgMIs4F2rWcDax4Fkd9ZfJOEDWX72JDkQTTmzak=;
 b=nh0g6b5cnQAQ47kWGHhGbvhaB2mYIbn/Goaf+gooGXuwqoPg6zc6DooAN6xabg14v3j7DKh5X
 TeV55fea8DlBUjg0F4gAlql2TaE2lJpcGIyKAsC21GBZPj3WIqI9G4N
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

Add an independent Clause 22 MDIO driver for the CS7542 controller used by
Securifi Almond+. The series is based on Linux v7.4-rc4 and has no platform
or ARCH_CORTINA_ACCESS dependency. It is intended for net-next.

Enable manual operation while retaining the prescaler initialized by
firmware and all unrelated configuration bits. The factory bootloader and
vendor driver set the prescaler to 0x20 on this board; the source clock and
exact divisor formula are not documented by the material available here.
Accordingly, this version does not advertise programmable clock-frequency
or preamble suppression. It does not claim Clause 45 support.

Poll short transfers with bounded microsecond waits. A timed-out transfer
remains pending until completion; a later operation cannot replace its
address and consume a stale completion. Device-managed bus allocation and
registration handle probe cleanup and removal.

Validation:
- Full independent ARM vmlinux and modules builds, driver both =y and =m,
  COMPILE_TEST=n, without the platform series.
- Binding schema/example and strict source checkpatch pass.
- Actual read/write/wait functions: 5125 address, data, timeout and recovery
  cases with mocked MMIO under UBSAN.
- Linux 7.4-rc4 booted in RAM on Almond+. Read PHY ID 004d:d036, performed
  an unchanged-value advertisement write/readback and preserved CFG=00200001.
- A RAM-only test slowed the prescaler to induce a real -ETIMEDOUT, restored
  the original setting and verified both PHY ID registers again. All hardware
  checks passed and the board returned to installed OpenWrt 6.18.64.

No kernel image was installed by these tests. The hardware-test helper and
board integration are not part of the series.

---
Fil Dunsky (3):
      dt-bindings: net: Add Cortina CS7542 MDIO controller
      net: mdio: Add Cortina CS7542 bus controller
      MAINTAINERS: Add Cortina CS7542 MDIO controller entry

 .../bindings/net/cortina,cs7542-mdio.yaml          |  48 ++++++++
 MAINTAINERS                                        |   7 ++
 drivers/net/mdio/Kconfig                           |  13 ++
 drivers/net/mdio/Makefile                          |   1 +
 drivers/net/mdio/mdio-cs75xx.c                     | 136 +++++++++++++++++++++
 5 files changed, 205 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-mdio-ec44e757e824

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


