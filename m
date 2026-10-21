Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595403;
	b=Z1I26cO0KXrikvnlOYXVkhOZR2m2h2JCYaCZW0NNlt1dk5TTKJcYLHdZYlSV5kkfvRab
	 B7Ph1qIo4Z5IZEfcUty8MQR5qMS+rhqw3W7E5bWL23cxWcA2C3V6eiPehTm/c1KtFv2Jb
	 9afGNmkmK7oW2AsrOYWjnHXHnsdSi9Rus6dnLq89C+StTqJ1nq3H0TgCTE6gYQUF8vOC8
	 PC+KwNaqTpPNj4Izcc+16S+jM6n/EoO5IEThpPggb1I13XdNfNqDQFmODSspSRbt0HHfN
	 K1/YSHLFV78ItXFc4NepFskcl3+FQBtjuzRAiRsRRjn1rbbrWvLOONsVvDxQoMurWgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595403;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=ooClIQJea+34VK5wiBtJlCaB6JuJ+2mJGcxE8LJ7b9g=;
	b=3NO3tu8ZzxYv7BsBMBg5kBkWhhDT/p41zLC0W0roh7H7k1t6SgMgtD3Ks8Aun1gt107y
	 3AUe9xT8nOxQpkUhw5JHkIYKcYZNMR2x431dB5sucSrcYENrK8pdZIyoIu8ttg1pnTtXc
	 wZbwH28unw9BpgXLKHpWg/FETJnCIYA04dk2qm6yLOcrbHY9sqYhHvnMXBINKq85RKMHQ
	 fjMdgu2HlwzLta7pkUcSu/5jjoZdH+Qpxm9xyvQgafU8+TP8CIi/uiwW//ZhwauWCzlh4
	 X6uJBjVT6rOkul5k5VD/u3hx3MxAYGblmmIYhxVpPVx70rO+GH4iEg/6Ha3XL83cK3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1mmn+KZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76501606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1mmn+KZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF4D1F000C1;
	Wed, 21 Oct 2026 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595402;
	bh=ooClIQJea+34VK5wiBtJlCaB6JuJ+2mJGcxE8LJ7b9g=;
	h=From:Subject:Date:To:Cc;
	b=c1mmn+KZaKLgYOnXQqI0JmUvUVMH7MO+7WWZauNJe2G5RJvpLBDQRVa11tcrbcxjY
	 hKnkRbjc37UNOeMOh6oK3l7eds1teyzcoabGpdiZRkO9CK+c2j+I6wX53ciSBhMob0
	 8cl99D6mmCnI5I8vXuqcJnPa3BTv6nYExc949C4HzUBu0MDbAEH0MMCqEbS6FZWr8d
	 KAc7MG9GdBIVtodCS/UmR+ZYfT/I4O/IQyz4apVpESRAx9eFAgBthqGPzeaDMwY+rk
	 AHN5T2DKqAUGMrLkykeQnyMhW3epOSKPllVGFFtAkSxX+zD/lGpmCnk8AhE/pvsSDX
	 kVUNaNULAbe3A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 0/3] ARM: bcm: Enable CFE SMP on BCMBCA
Date: Wed, 21 Oct 2026 17:09:51 +0200
Message-Id: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NsQ7CIBSF4VdpmL0GKAXj5HsYB2gvlKi0AUNqm
 r67tImJLh3/M3xnJgmjx0TO1UwiZp/8EErUh4q0vQ4OwXelCadcMsoYOAw4+QSTkychIT1HyAp
 qiC0DIxS1FDkVqiFFGCNaP2369Va69+k1xPd2ltm6fl2+62YGFHTDOqFth0Kryx1jwMdxiI6sc
 Oa/mNrHeMGMlUaYWgkj8Q9bluUDZ6+AzhQBAAA=
X-Change-ID: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Russell King <linux@armlinux.org.uk>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

When booted through CFE and mainline U-Boot, the XG6846B has no PSCI
provider. CFE powers up CPU1 and leaves it waiting in a holding pen.

Add a BCMBCA CFE SMP method selected by enable-method = "brcm,bca-smp".
It uses a GPIO mailbox and a wakeup IPI, with PSCI retaining priority.
On the XG6846B, preserve the holding pen and disable the board's inherited
PSCI setup.
Tested on the XG6846B with both CPUs coming online.

These patches were authored with the assistance of an LLM.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v3:
- Use BCMBCA naming for the CFE SMP implementation.
- Add the brcm,bca-smp binding and select CFE SMP through the CPU
  enable-method, retaining PSCI priority.
- Squash the holding-pen reservation fix into the CFE bring-up DTS patch.
- Boot tested successfully on the XG6846B.
- Link to v2: https://patch.msgid.link/20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org

Changes in v2:
- Read the CFE mailbox address from CPU1's cpu-release-addr property,
  as suggested by William Zhang.
- Link to v1: https://patch.msgid.link/20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org

---
Linus Walleij (3):
      dt-bindings: arm: cpus: Add brcm,bca-smp enable method
      ARM: bcm: Add CFE SMP support for BCMBCA
      ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B

 Documentation/devicetree/bindings/arm/cpus.yaml    | 36 ++++++++++++++
 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 16 ++++++-
 arch/arm/mach-bcm/Makefile                         |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c                   | 56 ++++++++++++++++++++++
 4 files changed, 108 insertions(+), 2 deletions(-)
---
base-commit: 6356fd3dd29d8b5620507a0ce037c644e052b5dd
change-id: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475

Best regards,
--  
Linus Walleij <linusw@kernel.org>

