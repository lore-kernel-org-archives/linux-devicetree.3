Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595413;
	b=NG0GqWZMEI2dsbBKbMQa99s1nH2j1bJFHBCpWP+XEEgsE2iCfxN7kGzWWTZafuuf81Q1
	 NcNu3mLSpW7zCsjXnh+LaCn9Q/RcLDvkZRifsuN+Xd4UDXWyrFK+ahnuQnKbLPPCOYTp0
	 Q6KFCo/+JpyuyVaanJlFB0wRItO9TUeU1aM6RJeQujV9oWQZHlZcB/Ux1jELeshAB4VhX
	 ZfrMELUgopG1v0S1BKM9SZb/0kchcFp2vx1f7QEFnPoDEhNnojxT3sgyCmvCrUiQG4aZZ
	 /nqZp7u8FWnzRoTAgIyDY8eEL5TEFNuGhktPZ9J87tuhmeR8honm/h4MVbwXVuWnLuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595413;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=gtKwLPlOlCqNT8hZcnvMmZ2KrgTo5rJvR8kXM2xT3ac=;
	b=aPWzKThlC8InXQY+aNBKuVUBNZjrLrsvNNkXFnlU0B5/rMUphIUe4oHDnU2xe57FswCa
	 ZAaLciFro/WztOGqsWRefgjZdsaISO+3W5lmtSQ5NKsJj5GwmEjYp2KnQwtcHKQFAypEe
	 EfihBEb/WdhoLmYVpx3gaRZwoQLRWIUebOzOSunaStHrGbOMLmyWAhXySeYjS9Tzu0AzC
	 eKnBn5wRZgIUNx0TCxrYPcZKK7LYbgozXBizwNW0kWALzWRdMIV3HrUjpUmSar0I/PQLE
	 dsnsqGLQWLsTecGDiG2dDM4/0hjyWafoCyDa3xYrTyYdmIJLbzT/dtdIrPwpmKtZ4Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YHmtbv84;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85406606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YHmtbv84
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C561F000C4;
	Wed, 21 Oct 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595413;
	bh=gtKwLPlOlCqNT8hZcnvMmZ2KrgTo5rJvR8kXM2xT3ac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YHmtbv84uqw6wxTgOdiUnXVgLwMLMCAu6ddLE1Bvs9gQH6s1t3sM6Yhr8x5dhZo5N
	 9+krQNWiGom8ycMP2IfOcMES6XvjmTtCYnWyGnhPvsDWs0TkCHkBGs93RhDLVMz3Oq
	 g7j4VEClVtl87zOOoKQ6YKmhi3979NUORMog5IR42O425oeJkgGuhiTBYfd5f0Eiwj
	 coYo8YVGa6vo0xxxHHY53/Ae7I2c401pdBtelhRgtbBprUa32+UevYCSrk+6P1VFmz
	 b0M/3r3nh5jeqzPkSU0NCOyP6aBIn8KlZpltqjTp7iR1hIBOJWPkRq+pCNDafOYdul
	 UIVNccasVhfJw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Oct 2026 17:09:54 +0200
Subject: [PATCH v3 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the
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
Message-Id: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-3-7c871f1755db@kernel.org>
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
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
mailbox in CPU1's cpu-release-addr property. Keep both CPU nodes enabled
and leave the SoC's PSCI defaults available to other boards.

Also remove no-map from the secondary-boot reservation. Its overlap
with ARM's initial page tables otherwise causes the reservation to be
rejected, leaving CFE's holding pen unprotected.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
index a3616fb7b3a8..45d4df523110 100644
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
@@ -56,6 +56,20 @@ button-restart {
 	};
 };
 
+/* CFE parks CPU1 in its holding pen and does not provide PSCI. */
+&{/psci} {
+	status = "disabled";
+};
+
+&CA7_0 {
+	enable-method = "brcm,bca-smp";
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

