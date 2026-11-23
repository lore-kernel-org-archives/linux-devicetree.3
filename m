Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432746;
	b=PC4ipaczTa0BilJaIo4G2FXKvc4pGQUvJaMKdtOs4UYjsnrfSlJrTjkQqMRqsiWYfkZe
	 ZgrBcRDRkgmK/mTdqnKHbCbgRKb2qMM4UgGnj1VV39Ffb5T+1yeUUN4bEBo049gUztLMo
	 kC6+LKX3T5eaMg616ev3Ou2MfoF6fVVtQBK+Mg8AaVSKF1UVf8TWhv9ykPjJYgXPZxFW4
	 387xvAJLrpTuzNQ/Vm6NxwzP0ezil8GLW+F4avAOddtaYXlDWNy3bIfd+tFGKywWoQW5F
	 hcr0irOgwjvaFfLwO/rSfexEEJEF/mYRsTgT0uoosufi41dp0FZC0DlNs8/GETbKbyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
	b=g5JBb4vJGaXJ9Td3uFjazbyMFmeJhdKryDi+tjnMThrSvq63m+iDQfCYz6x3iTFt1M6K
	 4pAVEn5ky3k75EE2fAnqHwrtOlL2klLPvE8ZlZsRbBneGof3xBtDIFSA/27KXdgrM/P7s
	 2om71CTz8QcW9P507hMcRK3tuOCphkfdDTq3WEJ/4AZX9Xm6OwqIvxtThBnMUFOxHejSa
	 xOMNNC9T9A2MAFoFGfg9ddO6myPbFgW2JL7q2n5pRXXIUJZj3gCpfdOcDkyCTFvtIMw25
	 ZfdLbEyLz3ZyBaas6pPeL3hySg1K+/xwzuarU8msJfgIepmokjEuIKKgHoAMdeyjDqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfIg7S0N;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D54606A683
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D54606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfIg7S0N
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so522424066b.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432744; x=1796037544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=VfIg7S0NyjDFiESdcciLc42EeZNUHkJFW+yGCnS+PA5FOZnFbalkEzBPwAkLuIayTa
         eRr83rB0tVsFoar4KBae9dFGYMZVX68eI4RjOO0yq+tVzl2VhYKSok73vfwwVjZbSg6H
         d6ewwLont5tR6xs0d8c2QiD02Y4M2y5Y02DebZ/RuAAl5cc1HPD8id35r3iMfrsLug4z
         MijCMWgZ2iXwVRvzNp7hJH2BQXLmLsLnSHzmlnWqZq/sjECnDCsociBw6WQ2fZU1z1KX
         zmfHulnVN2dQYmRqS/w3NZULcuK1a7Ac/Y7lAXMV9j+jf3FA7SbDfrxoGfY3rN+z3yX2
         SM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432744; x=1796037544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=OVu6bkm2O2c4wDFRNLN9P0RjgU7vzpr5Fg9oqzTYLV5f1m+TOYKWbqpSaMC4fkox8k
         EYBEPP2vyo5LqlI322XJsaJNdrzwQkVa/OhqqlkQCZjky7yiR6wi5luz4wTFlW29DUG1
         EO7amnIZOuO+WMbWAe3k07WmexwcmdhovfW1IGhbuVbnACICiWQFF0kYMdlFNtmxj4kt
         0HeWEXvwPM1MrUYoUImAeeRf2ssYGqeHmfezSxUfcVC5BVaSmTTGGp+c4YtTK7Pmp6og
         lki7QIgI4n+3wQOMapoVBNMRNLRifJj8Jn0dn8EXQ2GjhWhcv0fxfnUjBMcAXlf0pTaI
         u5wg==
X-Gm-Message-State: APuU4Z879VUjHkXDc4KLJxQfVrNDU6hC+PBDPpbhtu5peZUXUdlPgy42
	oKucm16b5FUC3m5B5QA54MghAtp2YPwvDT61maEDALwxzG9FCsRZOoQo
X-Gm-Gg: AZFdTZcvPubLAlAkft7weSmy1TfXNAWb+05VN4VwBvFGVUaJ9yGnLgm+E9sKbSS7XGf
	avJSTD+iDRvyosbd3EhUnRkjb27LIku1NkVD6YPkTi0FltnU0b01v5iY8MUnCBGgM8FvCX8pzue
	msySm9FH7uUuMywNKvCKkwZR5Y/FKXUCbvhdqPQBpQgeM165QATeKbxniVTHCctwDoJuQcTVsdd
	oykilTHPntUz13ewMCyhJ+mAqLTVRJsnFlhy06UmT8/zlYyOqtijv3pNbysssFdByRB3NfijJJN
	kRBHlscRTBxWv9spheF9AVbv4ksJXE1FsLzRSm7kxiZI2c2OhSF9m54dukI1pDw5+kas0vDB5YZ
	noziLyi0/moNmfrhYBWaYvrbgTLR4x4ETmvc5R4VC3bVPOTkT0HhlaQHMHDHMSyEhwhxwhhgvzI
	vDB0GMxqV3tMSCN6cG2Jenc6/OtvFHufcv4S5QN3sqI4fb+4cFuvzG4f/CyK3LXQ3wvkGcAQflc
	2dw1Ue6/nUOlUJyJXfL9tm7ZId0dfEdOJkfE5mLOE6k9ls/br1fE4sanZpYDTNALmrigXPbWWL9
	bBspE3wygptaruw6PUQ2DMtQ1Y5L0ipSntIfSM/zTKrr6D2+HdGyqGkgiiemX6uxmA==
X-Received: by 2002:a17:907:948e:b0:c51:3b09:f7f8 with SMTP id a640c23a62f3a-c513b09f8eamr826376566b.25.1795432744060;
        Mon, 23 Nov 2026 03:19:04 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:03 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:35 +0300
Subject: [PATCH v3 2/7] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
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
Message-Id: <20261123-initial-mt6895-v3-2-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8000/8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart

-- 
2.56.0

