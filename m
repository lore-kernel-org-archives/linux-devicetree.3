Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635420;
	b=VW5MnB3Dtl0AqXzdzWQ4IhnzxTGtiRkAEgwEzAzFWXdMIvS3/BI6ma+TOEq+yHzp7NSe
	 ByrQ73QVHHkWBUgCd3KpZihE1ukE/rKsArgyb73/Zjw9GhQ7hkiIZ7y8lHwGPvvxCKe/t
	 JvFNtQ2+sLKi8TMWjMtWcta1qCKBd/Cyr1W0iiC8NUSnMqyUT+X4lvYxwLdP9rSpe7jT7
	 mFSUVWisvQHmY69udYsviB1qsJ5POxC7+fI1qgrc0haGZcfKRuKjltevmTHmdYfpzu06T
	 nGujw+6I1iV8qp5evQdodcXhtLOvOrbwbWXr/0fPalL0WGdsa4cIwZNAQ2IofVGZx1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=;
	b=KaOlPcCt1d96c0ZeBg4YoNDZKlby6q55kNqnDI96a6tnF2Gfwa44cYz5IJtlh4PbDXsv
	 mpb+SVED5uG1GtQRDjRYbArfQIQ77uTacmDN2GvlqWOgTQLzf6tjALdfZHfyGjpmO9Ia+
	 4jJ4jWTYeL26O7Mi1nkawmAwVExbNV+tw9rqdaXtjrVaeik6a7hyVyVM2qnHNpC8ixJfK
	 sZZU1917hFrfHN1lYHVhjsModktjm5vXgdAC5UOlqHw06TXY0puc3Ceuw6NkxmUekD/f0
	 a6HHYDg/JY+umPis1zJR8wBYQRKyM6kDvcXyGT/dX1YechaQssKdYyTMftXU3FiDNVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=V1pGyXpN;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEA606A331
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FEA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=V1pGyXpN
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so5773163f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635418; x=1796240218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=;
        b=V1pGyXpNbCgi6jKvsAMXV8HVjpNvB7JoM7X1VzjLnfIjTMDExtk3ySO9if48rJifKs
         ygvw+tYA2jtVzhuo33Mu2OAEaDJ1VsfGmguo7piwkDnSsA0t/PTSJEQpg9/Dw3JjEgY8
         i0ix92cKf69cSR+zvcDlLCRorlCfVuxKLVwa9iZ9y92yY9uvwM904eHEUnJOtgJRYK++
         UivPYm77p/zB/USjuh5xV6HNyYmT/X3FszOyGjwUbmve0jgj3rk/O2/Z0i4BH1Z9N4Dq
         ZrM7sbQhFMmykHmoPSxzKncTnPUsyc3gtoZ9/W2HLmLG/SJL7/hrJyMwp6Xy4K95KgoL
         1CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635418; x=1796240218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=;
        b=wKdvEWcf+oEaN1125ivyYF4sLiYemPDbP4uyzVUEJZfmqxSglTufjX/QpP01z9TaZf
         Dhh/E3dvXk6TqZ9k8Att/yT6OBNROHWXw0laiq+K/ROdBbe0+ov2m2KXbDB9yzAaLCIP
         ylZmDSyngognDiob0sWwz9/kD8EtaFeYo1MFTH7khIGFSJskQ1L1GNpuzWOuwiZPCTDG
         6Rx65eOYr6IfSX8zllwGhto4lAuCfL8bdryQumkvSyw2RNgkRIyid/jT0CyeeoaEr9qc
         KpQMEw7PNP8AAiHWa0Od7PrBkLfVz+lBVTPfi7eqaBTMzfLiJHOBSljCej9WNUuNhyw9
         La9A==
X-Forwarded-Encrypted: i=1; AL+hErFZtD8qEPw7IqYRmlc1NCXOyfeGLeosY+BVPg6dvsdLUTCGUtJQjc2L0V971thQw2PKhgS+IW4OscCp@vger.kernel.org
X-Gm-Message-State: APuU4Z+RvAHI8JnfH9JbZOYMY/ofox9sn4pX7VwzMfl3pLBiOi/IVxdd
	btopCCoMlF2jAolX7Ku6ijXtDUVEDNWygq33NBNm+0OqujVvqCYqBbMdjCnOQ3DaL6M=
X-Gm-Gg: AZFdTZd7ZeL62D+KhM0d07iMwgIycVfrpkOeOlacSa+UDsHiJpnz0/bHtW4LmsfwPQG
	LLah5BNwwSH/fhCBrYcwgSA2H+eohDNCCjzRuIw50CrVdEshCI8MvCLmIU5Ai7fzQFbvwCrQgFA
	7nREJIHXs5XFIhaCV1U6C+wxDK+xEf7eZdW5CBqCuXua3fsT+JLst2l/BBv+jgXyQdjWlejd17v
	DR+KEar7mW/grEbPxrTZbswnNicB3BJhL8K6swt7nwUIH3FnfaW0KqqlU8CvIyH6ieG2tMa8xPr
	uSP5LO1c4ru4HlK/8dPusAsf0tmks+RzLteQ/vd/HkrM8QDSTAY8dtpSBn/+F9xPiuDZV7igU8c
	fcwx/JrVmTJ+aL/6KiesPQA+TwX8ehpb1csysX4xnmIwcP65bbIP5r9ZOO/VYOR47yrshRwtL3g
	Cw4LWtojyWyaAdjsjk/x83A11u1OJlwiypeh1JjGbyCAUJ1Y/ReKQAmXP2d4OpMYSQWylJ8Otqg
	kUh+m7L6mISAkKnWSIg38i3gFlTM499sEVXAQkK1A3IE4KYW4guhJBmRxOhIGlrtWnD4dhvPYEq
	jri/cPclct2apovV3tz/CKQICVWODP2CYYgDcwhHSX1bba78g9w7jsSSQ9v8u2KFYPl35ZAvPhT
	aLwyVOhsdoA==
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr446216865e9.9.1795635418569;
        Wed, 25 Nov 2026 11:36:58 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:58 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:39 +0400
Subject: [PATCH v5 2/5] dt-bindings: net: ethernet-controller: Allow a
 unique ID NVMEM cell
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
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-2-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=alchark@flipper.net;
 h=from:subject:message-id; bh=vohlOi2XU6LEq2ZrdPzPMNqYE1lULtEksPUJLyGTL0U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5wVOvtXI5DPOV69QviV3AfGYF0Wm3t6q4vsWNzaX
 E+vmfe1YyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmO+szwV7YmkO23fLvLrG6jBWHdcyaXWU/SVY17Nf8mf0Z7hJ3pNEaGfVxrrRM
 s2XIeNe94vVf6xs7JH9xLtgvU/Vq/8PuZPvZlnAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Boards without dedicated storage for a MAC address often still have an
identifier unique to the device, such as a SoC serial number in OTP
memory, and bootloaders on several platforms derive a stable MAC address
from it. The device tree can only reference a stored MAC address, so
such boards depend on the bootloader patching the derived one in.

Allow referencing the unique ID as a "unique-id" NVMEM cell instead.
Leave the derivation to the binding of the referenced cell, as it differs
between platforms.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/net/ethernet-controller.yaml          | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 30b2a335116e..6966270ff78b 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -24,10 +24,17 @@ properties:
   nvmem-cells:
     maxItems: 1
     description:
-      Reference to an nvmem node for the MAC address
+      Reference to an nvmem node for the MAC address, or for an identifier
+      unique to the device from which the MAC address is derived
 
   nvmem-cell-names:
-    const: mac-address
+    oneOf:
+      - const: mac-address
+      - const: unique-id
+        description:
+          Identifier unique to the device, such as a SoC serial number, from
+          which a stable MAC address is derived. How the address is derived
+          is defined by the binding of the referenced cell.
 
   phy-connection-type:
     description:

-- 
2.56.0

