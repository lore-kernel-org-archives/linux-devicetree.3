Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A233F58C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504966; cv=none; b=gjyqZLEwKHdS+U4sRFO9cBLuo161WwWdioJ5NFPFMzt1TzF2rH5FWvpdoal5ZiVPrB2jaIYFgYRHxXfDCYLxA051E6jZkrrH4kX8YUukcFEbQn3YlgWaiL5/XRphiIvLwT5PFhKIc1iD9A9W4GpUdO/x1ZcjxL/13v4xzeZWvqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504966; c=relaxed/simple;
	bh=eyeZF/GOeEoskqfrS05+TdeD1fnc46qKy1AQ7cbiGkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C4AaBDHcEo4jx2pPPxhrk3tLRR9uHU85KnNwQ+mefU5bHc3UgS501jqxLgbolkGezUTiFHhokr0LHunN1IUY8Pgevz+vdAy+34Mmae0gX3KrWLpF5DKotJCszBxBgsvN+uZ8jMur42pyx1Ejp5i9weCzNXyffqF804ehFFnQG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf6gCZwN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf6gCZwN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d02b4c3601so10778785ad.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785504964; x=1786109764; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uduIPrl1I11Bqm2iizUnhzteBLIc++VlIS5E5JRZkT0=;
        b=Uf6gCZwNXzv0HkLuurEZmMgtFkF+66/xOKJOHHbi6FMGvagSTj96FhvSBcXhOjjTYx
         EmSNf1r3qMfZ16Huxumee0zCFgZqvsdxumxXiqtNO6V3PwtK71hekxXyoSDWyiXvrDUu
         Tf5dopQ/G4wK7NatqnIT0vMtq0Gte7gPpVEfGMRKbQxU+ISUvfZykzsd02hfrpFmUyOy
         msUnFpcV9f6J5sSZqL4bhdePYOVoRNrY50kYkidvsJSbMuLPTnOqhumtPw8lSe4QLwS/
         nMC0uW4YRUjYQyNfXQqv20Ic7PI47jf7T/qhekv+ijwe3Jx3NsgZ+2P22L4h1X1Wzp8Y
         40YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785504964; x=1786109764;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uduIPrl1I11Bqm2iizUnhzteBLIc++VlIS5E5JRZkT0=;
        b=GYDP+Oj4Lq7+hVqXpgN1vGzAmf3+eN8u1yocKjY+Oqq52EIlnvGsyaYDYmq783EXfq
         2e8jcN/X9a89B4GmWITLChUscuDv+aBqQ4QsHNwdx6Ws8oJD7zXhS9onheG/OdhroY0z
         KR13x+B0bVpf+uIhfDSqPkjN9j6bhrb3q3PqoxBOVPNk8mwIrbs90AAexMcBDxlFitRt
         LlAD2/glkYqOAvKjr+SyaHwLF0An0dy1FPZ8cUbPUKxe7uxLQmPxsC8jIOKFFNtBhqx9
         CCStSwAb99yA4GtK95FqJPECQ6w1oJgM/h9dl3l5/+np9IJEme+pRV22PMlq86E3029p
         tdJA==
X-Gm-Message-State: AOJu0YyrNky7J9A4fxKG+dB6qfiw7UiqyVbmKEbyBJkcMYnlQFL2j4Xe
	3KpF+N/IDYdC5v6Oi9RVa3Nw7D80rP0XGHZ1ezWOgzUod6fUVDglVQif
X-Gm-Gg: AR+sD10pVJaKwps+mVaMpJK5E1zIJJSkHAtxnld3bkWQCB6BNqfup+kAn9pDeJsvUQD
	N5ustsTvTFkxFTIZOsyYf7qThH25jBueOUeyso2xMhS6YM5wULT05NYB7M/3jzYxcYrt+CFb3LY
	1BhGCRIaZXhza/PnjGQ4Cq1NORwFXTN5wbVNGNCeHLSWljV3wG7xy8Q8q/AGkUuTL9rY85I9vcs
	6S7EqzowkUvrFiPR5KxpzHdNmfEhq1vk9EfOAFhS/gIn+0oeJrwjov9wtR2DoTrn4yOb3LTFiTc
	jXM8VhzXhOk5tFUVxU8SWmcT09rgVu6ZIbPkpB0KMMJ+e4BfolQ+GUPCJcPVoMpBpKJwJoW8I03
	ht3hr/7RIOpUV7GzSA3mtHsHi+q0c4VZqmdnIreYGi+V4C0lqO2gSxMreZk5LD1+mMxHIZIZDvf
	37r826WwqA0j9P81E7+ylFVrbZztIW9qccL3flZcCQ6/vZ8144+TOyw8Kk0grCGRlaEdejNYsfC
	65MLwbno4SotNgKlS79WHhGr9KeSsA=
X-Received: by 2002:a17:903:182:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d0521e9560mr634015ad.1.1785504963767;
        Fri, 31 Jul 2026 06:36:03 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae196a2sm5621035ad.16.2026.07.31.06.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:36:03 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 31 Jul 2026 21:33:44 +0800
Subject: [PATCH v2] ARM: dts: aspeed: sanmiguel: Disable HSC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-upstream-sanmiguel-remove-hsc-nodes-v2-1-6a954ea49ba8@gmail.com>
X-B4-Tracking: v=1; b=H4sIADekbGoC/5WOQQ6CMBBFr0K6dswAiVJX3sOwaMsIY2hLOkA0h
 LsLeAKXL3n57y9KKDGJumWLSjSzcAwbFKdMuc6EloCbjVWBxQWvJcI0yJjIeBATPLcT9ZDIx5m
 gEwchNiRgtXa6JIeNtmpbGhI9+X1UHvWPZbIvcuM+vRsdyxjT57gx57v3X3HOIYcnlliRrQyiu
 7fecH920at6XdcvVLZZGOgAAAA=
X-Change-ID: 20260730-upstream-sanmiguel-remove-hsc-nodes-b99c93ec0d9b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785504960; l=2663;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=eyeZF/GOeEoskqfrS05+TdeD1fnc46qKy1AQ7cbiGkU=;
 b=P/nATfAEnRGOJBomjmjs2N4AEqd1gXN+yIgUBZQpk6saBfGRcRI7xQs+RHFrBFJOxYETrt48D
 /NCKAHNgCIdCmz7h+vuw/K4ebvONGPuFhX36F8agP9n4sC1Oc+6gNEH
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Disable Hot-Swap Controller (HSC) power monitor nodes in the DTS.

Due to design requirements, the HSC driver probing is moved to userspace.
Disabling these nodes in the device tree prevents kernel-level automatic
driver probing and allows userspace to handle HSC device instantiation.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v2:
- Set the HSC nodes status disabled instead of removing.
- Link to v1: https://patch.msgid.link/20260730-upstream-sanmiguel-remove-hsc-nodes-v1-1-f0308eb8a00c@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 3cc6e772cc8c..b4463533d2d2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -445,45 +445,53 @@ &i2c9 {
 	pdb_mps_hsc1: power-monitor@10 {
 		compatible = "mps,mp5926";
 		reg = <0x10>;
+		status = "disabled";
 	};
 
 	pdb_ti_hsc1: power-monitor@11 {
 		compatible = "ti,lm5066i";
 		reg = <0x11>;
 		shunt-resistor-micro-ohms = <1000>;
+		status = "disabled";
 	};
 
 	pdb_mps_hsc2: power-monitor@12 {
 		compatible = "mps,mp5926";
 		reg = <0x12>;
+		status = "disabled";
 	};
 
 	pdb_ti_hsc2: power-monitor@13 {
 		compatible = "ti,lm5066i";
 		reg = <0x13>;
 		shunt-resistor-micro-ohms = <321>;
+		status = "disabled";
 	};
 
 	pdb_mps_hsc3: power-monitor@14 {
 		compatible = "mps,mp5926";
 		reg = <0x14>;
+		status = "disabled";
 	};
 
 	pdb_ti_hsc3: power-monitor@15 {
 		compatible = "ti,lm5066i";
 		reg = <0x15>;
 		shunt-resistor-micro-ohms = <321>;
+		status = "disabled";
 	};
 
 	pdb_mps_hsc4: power-monitor@16 {
 		compatible = "mps,mp5926";
 		reg = <0x16>;
+		status = "disabled";
 	};
 
 	pdb_ti_hsc4: power-monitor@17 {
 		compatible = "ti,lm5066i";
 		reg = <0x17>;
 		shunt-resistor-micro-ohms = <500>;
+		status = "disabled";
 	};
 
 	pdb_ioexp_20: gpio@20 {

---
base-commit: c2b9fc3f7091157518a3ac2282a0a8bc797c227a
change-id: 20260730-upstream-sanmiguel-remove-hsc-nodes-b99c93ec0d9b

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

