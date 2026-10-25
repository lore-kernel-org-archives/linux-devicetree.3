Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792912529;
	b=VIHPuwRJ5Ll+Zcy6kzDIrxW8yNyE86i1mSEOqYbk/kAgH74QCtMtCePfYDz7v3oKvNCr
	 BPL3KQux8DBpSP0iZJAxKhyb3E7P6uJR6owiDeWT6pkZAJJE3onbpXyq5LjME8ICUUARP
	 sVn/3zQYs4OfvT4MSsnLZD8i48ZUHTK5+NefYJsfusWqJFoyRwrm/4YRxjwLGd6fd7Gkv
	 K6AVw1/TXuu5SWeZrGTifZ8M/ld60b7ZMti6FExuPIRNn2TEcOGUCVB79uqhV2bzrOxnx
	 XnRTtLpwuz73AMR/plpUmI103/OWXT3z/xIi8SWg1uBPgm4lfZ1cfXkxjX7x2y+VKFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792912529;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=+5cbHnUYyslIPSne2eKBDYQ2xujjPbWUVAor+9E51d0=;
	b=soCHWl/M2ijX2BtRqqKEVe1ZzeaEb8RNdTU2uZZYLi+bwmNyINzYMvA+rfKKDCZ0W0QY
	 YbNBQweJKmmiLgbp3oo9qNdQve8pHlnh3pXCqZQGueD7G2x3rLu/bCd+v2Z4NH+2zjswY
	 6g6sOCVwQ89oGwU8IOJA5tvOFzvyfWGAq4r8A6OOZwwCGkQDGYNXRpzplfDoUupUKuWpm
	 DyLtz6vUIQoyY1xCNcnDKHhvGcDdDPhbhSoOBxZDzIwjaMxuCtmEybeo3B4zEHlg8aTK2
	 vRONVSoW19m1CtP5FesIrUR9yHkC5j+2cNiOBPXZlcGpm+6oAGo/ByW4lyS2P1aMsRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVjEsSjT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A0606A327
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVjEsSjT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804601F01829;
	Sun, 25 Oct 2026 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792912528;
	bh=+5cbHnUYyslIPSne2eKBDYQ2xujjPbWUVAor+9E51d0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HVjEsSjTYYi/OID8KrKFUJ3I6njfiKgLuXExzDzJg79aNaEgZB2m7dU8nQKvRN3+H
	 Er3KkSV0RfrL7g/xWuBKhNStdkMn/tBcb86ORy8CZIDmgnV9fa1jvF+TVV14ZC4/Xx
	 vYe2r6egDQdZDwFcQY/HpwbdgCiaDq1TPeaWqM5dI7V7OyMbUibKwDxT5bzGWpcIak
	 YdTf1A7rEOg7c0z63fhZpoJYQOoMPq1dAkFMMS10oWXfih4VbHUxBtKvsWRTxqPIru
	 oMi4x8KTf/UR2y/KUuczi6eHavbiQ0MUxL9qSQDeyWyth4ncgTl6JVcw1h/1674rVR
	 2+QOvyVscrXYg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 25 Oct 2026 08:15:14 +0100
Subject: [PATCH v4 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the
 XG6846B
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
Message-Id: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org>
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
In-Reply-To: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
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

The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
not provide PSCI. Starting Linux from CFE does not install a PSCI
implementation either. The working PSCI interface in newer GenXOS
firmware belongs to a different boot stack.

Disable the inherited PSCI node on this board so Linux does not issue
SMCs to an interface that is absent. Set the CPUs' enable-method to
brcm,bca-smp to select the BCMBCA CFE SMP operations. Describe the CFE
mailbox in CPU1's cpu-release-addr property. Set CPU0's required release
address to zero since it is already online. Keep both CPU nodes enabled
and leave the SoC's PSCI defaults available to other boards.

Also remove no-map from the secondary-boot reservation. Its overlap
with ARM's initial page tables otherwise causes the reservation to be
rejected, leaving CFE's holding pen unprotected.

Reviewed-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
index a3616fb7b3a8..23145440e7bc 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
@@ -34,7 +34,7 @@ reserved-memory {
 		ranges;
 
 		secondary-boot@0 {
-			no-map;
+			/* Includes the kernel's initial page tables. */
 			reg = <0x00000000 0x00008000>;
 		};
 		pmc3-firmware@8000 {
@@ -56,6 +56,22 @@ button-restart {
 	};
 };
 
+/* CFE parks CPU1 in its holding pen and does not provide PSCI. */
+&{/psci} {
+	status = "disabled";
+};
+
+&CA7_0 {
+	enable-method = "brcm,bca-smp";
+	/* Dummy release address since CPU0 is already online */
+	cpu-release-addr = <0x00000000>;
+};
+
+&CA7_1 {
+	enable-method = "brcm,bca-smp";
+	cpu-release-addr = <0xff800568>;
+};
+
 &gpio0 {
 	status = "okay";
 };

-- 
2.56.0

