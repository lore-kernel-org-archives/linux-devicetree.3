Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20C37BE75
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631858; cv=none; b=CAGQK1Cc+RO24QydTTQ/c6PF8/1XljY6rWa8o0ML/1CaWzefRxgKusr36eu2ZllU5irnZwrZX2SKDyui2lU2mNtvfUsn4LTD/mmsRev4magkW3Fq6vODlkqd/0SsxqW+ZokQIxFQadNfg0LZi5U2MNdASC1k0NvTjUdYVjtPjew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631858; c=relaxed/simple;
	bh=ZreoL/eVPuxj1oFb8/Qv2Bu+o3zQrHOp7wcZG/PkziY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hwhjRIPgBvz1aKByiwvR1E9GUxkt/A7QCihF/xz6h2w6ZlSVnm9joiTmIZwAnpFenmcyNVWa53dvY9k6wX4VoEg1t+pZh2QDDbdyRBtqTukA0JgWBmHsphOpE/Ewl09R4HTH3BGCK3oZU5bsWQojpkqlCHwCMQ37iiGa0z9tDzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnFdL0nd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnFdL0nd"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccf2360620so70976935ad.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784631856; x=1785236656; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XNgGUgLDxikpwQAtd9a8q8cPJ0Sn1o/cujVuEUBlzWc=;
        b=ZnFdL0ndLaroyRcARF7F3P7PrjvYBKN1FctvNjf2RUfZN9Llnm6W9M12NWJYqBpwlk
         kcqJ9dSwTXjnd58bqF3FPoqbQ68n/cZdEbqDnWDR9KdzpLhDwzdqUvUF1FcGTAbs/Z+W
         1OwdizRu1yQ2zXRa/YSHfJeRTkd/pQBoZMuhpIBEAVnnJsGO8Uxnkna4bpudUWgN2+W+
         VOUelKiS6TYPcFOH4byqbTmTicpjpw0Qr0G1lcdX8HxHPP/0gdecHGNhQMUp1GXF1Hsc
         09tnY5NWJ3KHf7z+BPigytNXxuqmDqHaRjp2mj915ZLBT0rfj3dXMb+eEUYt0r+ZL++k
         VvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784631856; x=1785236656;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XNgGUgLDxikpwQAtd9a8q8cPJ0Sn1o/cujVuEUBlzWc=;
        b=RmogH3/usKRV8q6lb5h/pMB4FAIYrCG64OWNQlHqi5fEIiBg0ZdnYX0PNToQikEtKT
         YvvEEjt8c+nvTa91Oz0mGcc0w3if7W4OW/6lmyyAzid6xwPNjtZqcdSbhqQUIVIsW+cK
         nzQbh4c+1TL93cjfmBK8gC3fAqF9DGQ3VlncLN7HhSmsWZE8yQT/bRzpWklaBWOzK/AA
         SCMt9qzFKKSvYiVrVKUxEbo792kttp7CHz1ACGN2DAzOlHTyKGwyFs1t/gY5QpEZBJsh
         95/RnlvpfCQ/3GO77qWkppndQ6KpGHvP97pwZm3SlDXQPDYY6wBB9QyzYCTkmMFVA7OI
         FrOA==
X-Gm-Message-State: AOJu0YxTC2eSyxigpRo18XHECnzwNeu0GfmzAO2OIAbTJSrjO+A722Mh
	kPMHdsb/DCDZodMehZUuY2S5jh37Q1b2SpLqmXEbMRfRBMf0lMuHNahK
X-Gm-Gg: AR+sD12bppvB5oPTzycHYgzQ/f4tO3HolC3CMBvgEkkErroY/rnsgyL3uRT5l/OkDij
	SUbYzN931POwzdEbvejhbJy+0KbYBBj1AUvzRHJmhn2Obgd3xYrenVioOFejbN3v7ATjmuoULq/
	0CrAkhE3puJe8OgfEL+kZAPqHrImPCsYuegV5guYqk8JZI8mlWClDxznp3RuRBCG/xEMucQCh3d
	ulYKRfv+X4JxaaqVkO20Xg97lOS4vavG51D6frTcIOdqoN07DIO0wLEUMRc068B65u+KVL0qI9K
	OyLGZzgEqU4nQ4bt/PFwINF8T7EeeTEbK824uAfQZTIlGyH7fO0KJrxArdj9ucn6MjqWVZis8in
	StK1vBiI7Ks2XAXcCaiC0fe4ksMfOJYCZzFZeMzC+W50gJvU0mmZH5hOETBtCVvA2tl9LY1kem5
	rridOogEo+HxFTZdhPH7q5U6aTsU1oK9lJF7Fm8t+F47Th
X-Received: by 2002:a17:902:fc8e:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cf349cc532mr198004405ad.32.1784631855821;
        Tue, 21 Jul 2026 04:04:15 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3474d305sm72786705ad.72.2026.07.21.04.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:04:15 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 21 Jul 2026 19:01:59 +0800
Subject: [PATCH] ARM: dts: aspeed: sanmiguel: Fix FIO IOEXP interrupt pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-upstream-sanmiguel-fix-fio-ioexp-intr-v1-1-8245ae0ca590@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKZRX2oC/yWNywrCMBBFf6XM2oEkvoq/Ii7SOK0jNgkziRRK/
 92oi7s4cDlnBSVhUrh0Kwi9WTnFBnbXQXj4OBHyvTE4407m7CzWrEXIz6g+zjxVeuHIS1tCTrR
 k5FgE7dj3JviDPe4HaK4s1F6/zvX2Z63Dk0L5ymHbPs7MizKJAAAA
X-Change-ID: 20260721-upstream-sanmiguel-fix-fio-ioexp-intr-1f880ca4153b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784631851; l=1256;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ZreoL/eVPuxj1oFb8/Qv2Bu+o3zQrHOp7wcZG/PkziY=;
 b=ojdm2efXwuf3QR3Gotk4btNOvBBhEIendW+qye+msS8NzhLD/ZFY6O23pbkZ1cIBBArxCA358
 7PntNXICI09CwO2hXZ8mKVYo8qzOH5Y2iXsiLLMWF5Wy7Tx7oAEFEO5
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

The interrupt properties for fio_ioexp (pca9555 on i2c14) were incorrectly
configured to gpio1 with ASPEED_GPIO(B, 6).

Update the interrupt-parent to gpio0 and the interrupt pin to
ASPEED_GPIO(C, 6) according to the hardware specification.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index d7ed497d7227..cb07c3615279 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -578,8 +578,8 @@ fio_ioexp: gpio@20 {
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(C, 6) IRQ_TYPE_LEVEL_LOW>;
 
 		gpio-line-names =
 			"", "", "", "",

---
base-commit: adcf44809e1da6f462927203b008e4cdb2ee1b34
change-id: 20260721-upstream-sanmiguel-fix-fio-ioexp-intr-1f880ca4153b

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

