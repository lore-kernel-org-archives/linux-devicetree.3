Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792912518;
	b=amLDaBX5ong3EXapMgBsT5sgWlTstYV+2C6tIP9ty+RVq19tYaDq3TGn43efrv4RWNqC
	 NZEKKTd0nD8VJSOeg41s/avu0rHSCWa7UU/z4jePgkKfzfb8c2IPZNemyTi8/C5ZSM5jv
	 gRgWiUzYpb8syGueduh+RYbTrX91DOZzyMF263dCEUNGklXnEyDgZ1tLR8s7WOr2jtdEs
	 oRgasIcav+D/QP3b2Fg3LQeXTUNlH67pKHZUJfY5HPLoRO7I12BkdOOuNu6hS58G0Fz4J
	 gNunxzQ4VzOYnWF0jfxqBVXkPWwYcySJEaNfFfvXzt9ypoiVfEjub7dDWy2OUq4bu9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792912518;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=1k/YOFzcHBp/hoasHW07eVZPh9bCyJ8vWurMur7edBQ=;
	b=L4K2na04kABpzLEftCoN8Gf2u9Q1Ochu844h9ecXxblARuopma1M3RuZLSkNrUxRVUn0
	 2DYemoxcdj6kuBoYGJr4QqDBFHR4dU7e1K1Z+YOpa3wXIRCs0GWM8zpeSY7R2RmBckKRb
	 liWtf0j7/UF6DwJ1OKTeux7L4qvDNtUjNd92B3mP5Vf/f5obN52f8WqV3zmFKxCsQQbN3
	 MqYRgB7Py2d9u3D3tCZ/F7C12t8RRe1UBhZqKkezJ7NanBWvx9ocYGxWTBveBNpNFignY
	 SKUXCv1KWGhaZZGKMEwVUFQRW+Kh/5bu1YAGfc54+pUAv+2gUHLZf/QEEpCJ4aB5yHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcXxFAfp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E1606A321
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcXxFAfp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE331F01825;
	Sun, 25 Oct 2026 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792912517;
	bh=1k/YOFzcHBp/hoasHW07eVZPh9bCyJ8vWurMur7edBQ=;
	h=From:Subject:Date:To:Cc;
	b=dcXxFAfpTp0csq2KMjImqdCCQ2mskRHPrHFEjnm5qSIqR8GvRQrxLMMHceIh1V0po
	 TnNkKvphl7cMQgEVfHoEs4s/6RdDnbc+b3def39JwKEbVceOZQtCUz9ih+dkw+LNlH
	 BN5hLMa3iNwUOWbk8mLRl7veO9XfyPhADjRvyylJhT0uQ19COmozdQ8wojYWsu0wH5
	 zanwNVljUu3UAQJpIPM0OrG/MZezI1ftdmjV86612LM2RBvGdFmmIdMHkEBaNFfrYd
	 dVUVJMw+8dVI8+PVLTiN9CWAs4iz7MabjlyrF/daPPEBcYt3jtZmqEEC2eXyWlsJZw
	 P5W5pwxYDL4zg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 0/3] ARM: bcm: Enable CFE SMP on BCMBCA
Date: Sun, 25 Oct 2026 08:15:11 +0100
Message-Id: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PQQrCMBCF4atI1o5k0jQjrryHuGjaSQ1qWxIJl
 dK7mwqCInT5z+J7zCQiB89RHDaTCJx89H2XQ283or5UXcvgm9xCSWVQIkLLHY8+wtiavTYQ7wM
 kggJCjWA1SSdZSU2lyMIQ2PnxrZ/OuS8+PvrwfI8lXK4fV626CUFCVWKjK9ewruh45dDxbdeHV
 ixwUt8YrWMqY9YZq21B2hr+w4ovTK1/nIqMUb0ndEhl2dgfbJ7nF+XYrsxhAQAA
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
Changes in v4:
- Require cpu-release-addr for brcm,bca-smp and provide a dummy release
  address for CPU0, which is already online.
- Link to v3: https://patch.msgid.link/20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org

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

 Documentation/devicetree/bindings/arm/cpus.yaml    | 39 +++++++++++++++
 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 18 ++++++-
 arch/arm/mach-bcm/Makefile                         |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c                   | 56 ++++++++++++++++++++++
 4 files changed, 113 insertions(+), 2 deletions(-)
---
base-commit: 6356fd3dd29d8b5620507a0ce037c644e052b5dd
change-id: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475

Best regards,
--  
Linus Walleij <linusw@kernel.org>

