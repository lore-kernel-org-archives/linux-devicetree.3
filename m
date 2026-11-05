Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886220;
	b=WU+Gst5axC8Hip65AThgAo8BPKCcqM2BEg7T4jgAHZDQLlL0CapG8OciBy+LDA62e/+A
	 R+7p/lc+kRSc/bok2lMjrHw4hoU3V0JwlPxci+aESX9TyXqQ4osrqxc8/iYJheWIKBhM3
	 iHEmoe9kBSaxjNproJf58JUKhiDaZnzTepp17GC0vZ+ANjLwFxLmDVInJKskF+HX4s8J1
	 DBPmaJoctuloUUrS6OXHYn/a0wbizbPBqGZZp4IiRx8GRtWfm/icvne3ThVlb3974JiDC
	 YLjxhjd2M5eiAyGKSj352/evFT9ska/j07Akmfd37ddeNgZipt7xxksMJrQ6FGisirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886220;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 Content-Transfer-Encoding;
	bh=R7zrV8nYJSGrUqyvUFp4alsG/5yBXNnS0jVdAE9tc+Y=;
	b=zldxCiSvW3rLlomqND5er/I6pRoiI/6CTXsdnW4ZoPJGbLbgpuGj0TU2HlfRThQij/Zo
	 1xRHpv+uS1wacywsEpn+YrqMm2UrziWit7Gk9ymTqH0wHvK5J84uEg86HEd0511het1k4
	 QDwxNX0TpJR4oTvDzFx7OurdTKH7+s4SMzuhixBgsA58vMOQJv03OvjCTM+FDOuJR4VLe
	 mzOyI6okdmC7oXoiABx9kiirV2rXC9GEFixJJnlplip2I+9lY0U3M4TnRkcHNR0CYnEUK
	 uN78CaDd7Fw0Vi105HcaGxWWp6IekUlQBUDBm2Tx3bHkeko0SpTtoaGRKYAOSKNDzzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5vYx+WG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B12606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5vYx+WG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CCE1F000C1;
	Thu,  5 Nov 2026 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886219;
	bh=R7zrV8nYJSGrUqyvUFp4alsG/5yBXNnS0jVdAE9tc+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b5vYx+WGV/ZfRR/XCwiOjYqUfCQNOZhmguc7xRtMavc/JYlU9eacoIRWEFikWbCx2
	 hOBataOrH7ckgnNtuxGX8xHV/ke7gSMasShIveHHGkoX5lmixXKQ/dugp505L8HMUv
	 i92zMwlXz68aIeYVHrIku1Unt7MVLHBaRWNAHm2SN6F3MUAMb8mf9isEKIIoV1oyAb
	 mx/dw5eO6w3R3HCc4XC4UsGKqQa2+2vcgD9A9q16sc8cs4VogmSe5RlDc0dj4Ctu91
	 t/He+CdShhagDEo5/498gQdKK8kKTcReucpaNqMuI0uJ5eyaWUkBwn3E47JgCTaVyb
	 QIkxO7aZ/Us/g==
From: Linus Walleij <linusw@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
Date: Thu,  5 Nov 2026 14:39:47 +0100
Message-ID: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
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
X-Mailer: b4 0.16.0
Content-Transfer-Encoding: 8bit

The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
not provide PSCI. Starting Linux from CFE does not install a PSCI
implementation either. The working PSCI interface in newer GenXOS
firmware belongs to a different boot stack.

Disable the inherited PSCI node on this board so Linux does not issue
SMCs to an interface that is absent. Set the CPUs' enable-method to
brcm,bca-smp to select the BCMBCA CFE SMP operations. Describe the CFE
mailbox only in CPU1's cpu-release-addr property, since CPU0 is already
running. Keep both CPU nodes enabled and leave the SoC's PSCI defaults
available to other boards.

Also remove no-map from the secondary-boot reservation. Its overlap
with ARM's initial page tables otherwise causes the reservation to be
rejected, leaving CFE's holding pen unprotected.

Reviewed-by: William Zhang <william.zhang@broadcom.com>
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

