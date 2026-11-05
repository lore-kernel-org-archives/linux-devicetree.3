Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885092;
	b=BjQv/6A048KKPUgDw1ugl/VdKdj0CCUbyJNNZTIpIpaKMfrbgRHg4IJHpXqqNNwrt0nx
	 tUrhwhSZFMnNMOOXwO6smAUkFHBf1BRGB16vOG66udLMWB9vBRpFah09v6bjt7aXJ9Npx
	 BYDZpKPgkIFo5qblInlAD28vr/z56RwT0QZV1lEBn1rjz6su1sERdTXTCT+OkOLByQ67Q
	 IYPTGyw2cNgsNW2y4hqVnDGp7PbtljnQKC/MIem2oUtjPvWZHDxqwzO6WO10ypZ/2EnRW
	 OJac8m+1zCxVBaI3tnqQbk5aDLbzMonBOva+lB/9UBIUPUGxBmoD68KlpvzR1u9VRKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885092;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=Fqv7c/hn250Ut0oSJafhwanSQJ8WrgQSQtv3/UY5Aho=;
	b=ze2/c8bwfMnEvT5o0ho5nD0HizaZl2OlqRAUMVV0fWLvjAU+WPDO6t3nYacYTBP24iIf
	 R1G/DE3JsrxQZovUBW0Bj1x42BrwFfi6C4XWj8HTrgV+tTbqM+njVy40hAjt+z82KVsUF
	 9cojKCYab3YOK04gHjvvhFG9l3/IDBOemLwSc6SSvIevZlGNm9GRbZpTGGuZhixpKuFiN
	 Y1w7iqRZuviH8l0i4lN16u9dzbNal4J35qIsok5nxEKpctQzFz36V0NrK3jt3KWQn7Agg
	 tUkAX/frkv5o7ZzsvG85+ZD6QTSqwlEMyNOuK7lzspT3BYSYUC6/BhXP0MhYB73lkGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=izpLILXh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865A606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=izpLILXh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F70C1F000C1;
	Thu,  5 Nov 2026 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885092;
	bh=Fqv7c/hn250Ut0oSJafhwanSQJ8WrgQSQtv3/UY5Aho=;
	h=From:Subject:Date:To:Cc;
	b=izpLILXhJw98RCEVdJwBA8WVd2Y8P2uIRjqMOuymdeApoAthVKdlyhx3Lvj0c0ABW
	 2AtOR5aWy/tleljAI6M1rPhrIo+eGdX/B26LDBrx7G94Ud22ugUulDSexdFriL0jdL
	 R4damb6009iMnb44/wmMFel/m1bZ18NwlwgQ23PO+WbC+Se/gl3ZFLn/7v9rCZuk1F
	 qB9eEwd2lOU7maH2ZLao79Re4rSDBElDWYpkRB503CJrsdyCVlB6Ik3p9anc7nKF5e
	 CpThJIP+CC/9qXgH88W1LdAhxFXLf4zYDYjuG+NJKJlSecPGNnTP+KgtKtmkWaoaH3
	 stuXneJXWRglQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 0/3] ARM: bcm: Enable CFE SMP on BCMBCA
Date: Thu, 05 Nov 2026 14:24:45 +0100
Message-Id: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PwWrDMAyA4VcpPlfDsmW79LT3GDvYiZyatUmxh
 8koefc5hUFGIcdfh0/SQxTOiYs4Hx4ic00lTWMLczyI7uLHgSH1rYWSyqJEhIFHnlOBebAnslB
 ud6gONOQOIZCTUbKS5Ixowj1zTPNT//hsfUnle8o/z2UV1+mfq3bdiiDBG+zJx57Ju/cvziNf3
 6Y8iBWuaou5fUw1LEQbKGhHwfILpjeY2v+46oa57uQwojOmDy8YbTGzj9F6mTbKB0OR7H9sWZZ
 fwwUD9K4BAAA=
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
Changes in v5:
- Rebased on v7.4-rc1
- Revert to the earlier CPU1-only release address after review, keeping
  cpu-release-addr required for CPU1 in the binding.
- Link to v4: https://patch.msgid.link/20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org

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

 Documentation/devicetree/bindings/arm/cpus.yaml    | 46 ++++++++++++++++++
 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 16 ++++++-
 arch/arm/mach-bcm/Makefile                         |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c                   | 56 ++++++++++++++++++++++
 4 files changed, 118 insertions(+), 2 deletions(-)
---
base-commit: ae43fb24a3dda77622157d3574d1ff71aaad20a5
change-id: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475

Best regards,
--  
Linus Walleij <linusw@kernel.org>

