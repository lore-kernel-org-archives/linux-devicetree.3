Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.25.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738034;
	b=qng2+gtABJwd+9R9l9F0T9zkMsF3VxUersU8FqIjIeeYplCTBc/N25VU7IPP5VvXCjXP
	 Aw1yFWV/QWNRbkZfzSFqZx1TumeFl4ZqV6SFkh7UBSMk8FlOrEx55g75dkFLCO3w+VXMf
	 kEQObXjbvZXuPCsu43IDg3ipMd9SkKuOMkaseAwGJ+GFt3u2F/zYwwRZOK1tqJ31MHgKW
	 E4zQ+xweSDxSE2x8BbhH/i3VdwoReaXJeC/UhG6Uvgu7fyejBeFFcKLMZPw2CXjot+HXW
	 qV/UF6kScsMJK/pLbdlKyQga56Hzz/87oPP8DmNxan1qgiYKgQQEs/pT3foyoM09CHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738034;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:
	 DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gviGI+/aVfXi8KK0fmiJUHN9/SwDPBwhZYFY667FLqg=;
	b=Uf0y2aVKNh2QYg92o/GwkYlHiX9ffLMopa9jZcff1IsZHrI9XWocj6QKY1KMSpe+sp5z
	 6yKxdbWgyrQ5i6V3XOUn3nMnJsu3u4ZaB9Ayq/lIc4r8B+vnv2et+Ed74+btteFuNCFaC
	 DhG2zWRVRRnNFlHyn6bhh0qqfNu7nV9QrKWmaWKtK5dz0rSeRepvVaOgKyq3Kr3X/+mB5
	 QWffMjqYoCXUp3aqZYsaUo5ojymjChs3DztEGbcIbkDIelo5NQsv2FgdH0OMVOrKwFIV0
	 ens9ODpjcOXHY7YlQ4aK65e4Hsdl8wFN7kvW/Gq/RArfHyDCNkCI7o/gHl5S3O291mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rnplus.nl;
	spf=pass smtp.mailfrom=rnplus.nl;
	dkim=pass header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=NR9fwCpe;
	arc=none smtp.remote-ip=178.251.25.70
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B70606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B70606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=NR9fwCpe
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id F30CF379787
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-8_WNjwO0sz for <devicetree@vger.kernel.org>;
	Tue,  3 Nov 2026 21:33:45 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 56C7B379779;
	Tue,  3 Nov 2026 21:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738022; bh=2wkTu59kSxoO15eMfM57RBq7UEe0GI/tQEudoKg9A2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NR9fwCpe44g4hkPId3bcDP97wwZb0KOba59eFPlHCMMc6PnTI+zQGQ6k8SSGQYqlv
	 2AmPdVB2LW9JAwDeMnffsnch0krk/qIwu8L9RhH+iYD9Sm4Gn4jdnlU/3M0Bbx8zXm
	 q+SojoJuIcYda3h6l1Dakp3uZvKCI8lXrdak7V2g=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: aspeed: x570d4u: Fix fan tach channel assignments
Date: Tue,  3 Nov 2026 21:33:03 +0100
Message-ID: <20261103203308.54789-3-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
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

The tachometer channel numbers for FAN4, FAN5 and FAN6 did not match
the board's actual PWM wiring, causing incorrect fan speed readings.
FAN6 is wired to PWM5 and FAN5 is wired to PWM6 (not PWM6/PWM5
respectively as previously assigned), and FAN4's tach channel was
off by one.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index 7d27833b761d..6e7e3e7ec101 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -320,19 +320,19 @@ fan@2 {
 	fan@3 {
 		/* FAN4 (6-pin) */
 		reg = <0x03>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0b>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03 0x0b>;
 	};
 
 	fan@4 {
-		/* FAN6 (6-pin) */
+		/* FAN6 (6-pin), wired to PWM5 */
 		reg = <0x04>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x06 0x0d>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05 0x0d>;
 	};
 
 	fan@5 {
-		/* FAN5 (6-pin) */
+		/* FAN5 (6-pin), wired to PWM6 */
 		reg = <0x05>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x05 0x0c>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0c>;
 	};
 };
 
-- 
2.56.0

