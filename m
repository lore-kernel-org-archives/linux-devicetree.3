Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578527;
	b=CogVwimJYXxbnytKW+vnKqZwjHto/awtONKC+CPylU0UR+TXja7uPd/6ZvX1RMGRevkt
	 iVr4sQq/6RdoH+yUgfpAUQa3XqERlmJfk61iTzMYGsymguA7Z5gaXXbKawFsQBozhSjrV
	 YOrH1vNZxeu01EldRdg8/rKZRXB8Fgtnvw9ws0tzjfKfY/x5poT/bCxUr7LfVKGNo+PRX
	 IJZgDSeqHLO3NQmxy7HwADgIP71hEqQLln5meYRMSSD5igo5ZTrjw9U1jYNZGg2WlCfQw
	 OYpA7r7u8JcCdX1uMxCFpQQhj6Znjlzr4HktcdlY6VNXI5yOgtrFwzzi0VUdOEgyYWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578527;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=s/TRyX/520vy7EF9H/TtmbEkI4iO56nUSXKyQ+mKRvQ=;
	b=lu/wwjQ3uSq6K/EGRJ9BRUrI2NvgUgYvWMyHdFe1RFbe7/SAr1za62gdSQklirwGaWYr
	 4zb6Y0UAtON+rSyDKydoe1AtkvLztckZY1c5bSNQJ8Zet/NPsdKC69g9tKEqF/dGCOSMb
	 AKHNKwjUWtK7dnug7xx91GeNOnYSYu7WJDNNCwE19siXyufz1KjUk1vlIxKwApFLX2Pc8
	 qSCygYeux2ga8ZKzwCI5V9/gsKdMbHPLZbRkHda7phjd1xjy66Lb+XUI3rHcyGWDof6sC
	 yUK4Myt0OcNr2WpkPRhR4wb7YIlnDh6a3KTbBXcnfuC7AFvIkQuUcVNnlyfGcs5X+qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="fEkP9/tS";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04521606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04521606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fEkP9/tS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 839944E41297
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:28:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5163A606E3;
	Wed, 21 Oct 2026 10:28:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF09810328E44;
	Wed, 21 Oct 2026 12:28:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792578523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s/TRyX/520vy7EF9H/TtmbEkI4iO56nUSXKyQ+mKRvQ=;
	b=fEkP9/tStpTjkCmUw8rEPCV/QgRw6ciGPb271vndyM20VQugqhwQQy3UeIBy3vetY6jqmd
	JpJowN3xL7fEIc7TUxWfuSgBoFkAqivGy3aQX+FOa1XTu9+hY8cFSoFWqY3W5bJCkd/gXA
	y4CjxAjlva1Y6Ne2279INkvGrranvpyzIkbAX2hmCht1t43BZoNLPXnH/mMBqt534jl2Be
	NqoaWt26I67vQYBmQiG/8atWQL4aCtzIMxlncSPVRJg0+evJn2IUNgGInDLvd7PGsLCOYe
	DEWkHI2S/p7DhY+X5OJEHeteeaIQ2t9ZKkGjZQ1dgEqcRH2eIwRa9RGzq6FLkw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 21 Oct 2026 12:27:42 +0200
Subject: [PATCH 1/5] regulator: dt-bindings: Add regulator-boot-force-off
 property
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
Message-Id: <20261021-paul-lm51772-v1-1-25f0ffbffa8d@bootlin.com>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
In-Reply-To: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792578518; l=1434;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=Rky+fawFgYd09Kma7y0J1qbj5XumQ2idL5idZojc6OI=;
 b=hnqZth1yFVLPOJJslPzyXWRw1cYEkib5W39iQA2Pmuqj2RhRkwu8FwqYVcNx5WUBnHWtJLY1e
 qJPKmaRVxDEDfGG0UEk0eibbETLpxKIN5V3tkiJW19BGtzVy3ueGY0H
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Introduce a new property to immediately disable the regulator at boot
time.
This property is useful when a consumer device may query the state of
the regulator at boot time, and want to disable it right away, without a
prior regulator_enable().

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 Documentation/devicetree/bindings/regulator/regulator.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 019aeb664cae..2da8f70d7e7a 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -41,6 +41,14 @@ properties:
     description: boolean, regulator should never be disabled
     type: boolean
 
+  regulator-boot-force-off:
+    description: a regulator may be enabled by default when the system powers up.
+      A consumer may query the regulator's state during boot and disable it if
+      it is already enabled, potentially resulting in an unbalanced disable
+      operation. This property ensures that the regulator is disabled at boot,
+      regardless of its previous state.
+    type: boolean
+
   regulator-boot-on:
     description: bootloader/firmware enabled regulator.
       It's expected that this regulator was left on by the bootloader.

-- 
2.56.0

