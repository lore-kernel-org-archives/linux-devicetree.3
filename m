Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569898;
	b=RdpZZiHZk77Mr11vyDGJL9nCrAV539cTuolZeR29L+oJ2JFQny2HrdP+9lKzKNPr+NQV
	 aIYOLrOJSttL8rU7OTJcY9oA8fm7uYCzogufauTdq/FjOCCdpnvL0aELjn7dE8HHohLPi
	 FLzjb4sNX/X1dIOMbnBQF4xY5jL+i9P+JgGhLascnimQ4duyDXR8a82snnxQqcRlERmtg
	 Fkvl7rfPyRQJdEe3szEbx+Y2G06/mEl1ZjtHmF+YWt0612y48Mabjcc53ZEwIlVifeRMI
	 4J4EbRzub+7S8MbXuP8NFv5HWW8TsXpOAT3Wz9YQMyyGzK6jp++9V8DWre1bNK1TdcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5fsU8nLmnwYSf7euVQNfNeMa7vCUCe7G54B3850badQ=;
	b=m8JBO8cG85SGsKI29YA9P++Q1nVAQutcx/BXL1DkYLUdQpQ92iW9qBgrhcNraQ5kBwq2
	 cqwFr1ul/iTRztcbZ8ftXFggSzv6M5aqhCmXut2bhE2BIKEapTdqzZ6igyy8Z+wdiDYSb
	 TBvmgnzVb+3/Oc4MAbzO9wbQ2zEWzF3Or1ilBoQhCLErrsCBJGazRD6vq/GVDjDbgKzGD
	 LpO9saGomqBrPIEwYKENu0nGCCCv2ypMGQjEJALtAGis64HQBhwUtWthCAi6O2EaBl02O
	 BhFfeNKPT6FbDdZ0YKNG8O8IMtIfPzDzbIapysnb6Zcv/tNEQBVkjviYFoWwgo8mvxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Cp2qvcgg;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41B606A888
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F41B606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Cp2qvcgg
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so353644f8f.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794569896; x=1795174696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fsU8nLmnwYSf7euVQNfNeMa7vCUCe7G54B3850badQ=;
        b=Cp2qvcgg6njaV5KwMMbbBxiFOQ1hpWoWCe8h8O9NO0oBL9pNN9rRMW9UPQ19KYTd/t
         eC+4xLBQgm8aXJWOvhitSCQHDuJIKllJjdj4hZ50/kr90tP/sk85NZ941ITHvUrJmke0
         TdnxlQxGwiJhmSzuGYCaCDNb0FRo6X1bcel+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569896; x=1795174696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fsU8nLmnwYSf7euVQNfNeMa7vCUCe7G54B3850badQ=;
        b=h2qR0WuQVoBmfgvx3QS7RxL3cpu4jfxapt3x3UvsSvdi+AIf07h6SL7oYTExxZZNL/
         lzFM3XFVTZQ8JxhyT93s3Y7umkEBmO/sEW39LZboftIQ+Zr0D3z/HlU43PSrIIGt1FQA
         0N2G06rimnwB2g7qYdfWsjhn30jP5cjZSdvDwCBK2LEz8E3g1wcNN0EiuMllgNdZOR7i
         Tqw0hk8I15YFznJ8A6gr9R+kJdnd1r0Im/TYQrckXuJU+x3wIZCuzXInK2Tu4FINuRe/
         BpyUpQOmSPKj/JauRAsJWbggix6b+MaTCmjpBjU7vdgcD2u7Tm2IbANdDuZwBJ2MfWPF
         R8wQ==
X-Gm-Message-State: APuU4Z//RpfGtZVivGll3nWGb8oRXabAlXRVULWg80Un2jmkHyGII0Zw
	bydZAcLebM5BTJ4G1NYYSERBUboTNw2+B02XGdWVUYgo4Z5WS2MNZO/ZcfQ1vQqy1BLqb/5ILSs
	aZ7hlBaQ=
X-Gm-Gg: AYBFou2KrZ8mfHf/+lLOMFVJgRcO6sOW0zB9RWbDRKqi1NK309m4EQ4KjbiphNhqLch
	5umJ+GXvsxfAN8uNZbnR0r3ok3nlvY+K65BT2sw2XNnsLniuZfFlFi1F+p3y9ABGf9clZulg1bb
	ReyJf7pu8RBLdmuuAYwOj7dBEtLlFt4koBTXwRyeevtuG8bmQQmIfg9mFIEieMtoyQ/nfytq2Be
	yjwXZc00Dw9S+Pr/Zu8acj3uUE0GpMBCIo9I2SrmLGpKRkwkXKwjae+b4eUb5oxgc+Y2MwujDSc
	xtXgMW6DIbOwcXcoGL3zrqUWO4/xmep4TJwPZffQnjjcH6YRfbOoH/AvZfOAtqgQN3zC4F6URom
	UHm8k3n+UskLjfOeXAsIBLuqwTVuGmy01Yk8C6gBn4et68gaQSTYPQhPyxYQjxI3PMRBHyzeJy3
	RlqsgHJQF7tkShywqKIvz1ZLkZwgrnw+ifBExgdcVgpBHyKPk7Y/3aPfrx24/wLk9SSTuXGeWXI
	K/EHeZ5NfiWWOHz+VO5HKNMzwr1l3FmB+gXhxBgWWr+FcbYdH3uDOBU4tASSSi1aPiQUmV8SFRx
	EnkEWacj4JbCO76mMyFgzKKHAsCoGS/3yqOHs3CwERxOA6uXtYG0yvirkwQJck6TRb38tc3sKe1
	c1VJH60baAZhJmlhkJ/IURA==
X-Received: by 2002:a5d:5f56:0:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-49c70ed9069mr5731903f8f.14.1794569895819;
        Fri, 13 Nov 2026 03:38:15 -0800 (PST)
Received: from thinkpat.amarulasolutions.com ([2a07:7e81:b71d:0:3e39:d071:1d81:5914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm5448492f8f.1.2026.11.13.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:38:15 -0800 (PST)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Axelera Embedded 111c
Date: Fri, 13 Nov 2026 12:38:07 +0100
Message-ID: <20261113113808.1779860-3-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
References: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
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

The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
SoC.

Specification:
- Rockchip RK3588
- 16GB LPDDR4
- Axelera AI Metis AIPU, 4GB/16GB LPDDR4X
- 64GB eMMC
- uSD slot
- 2x SATA ports
- 2x Gigabit LAN
- 1x M.2 E key
- 1x M.2 B key
- 1x HDMI2.0
- 1x USB-C with DP
- 4x USB3.1

Link: https://axelera.ai/axelera-products/embedded/111c
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Add Krzysztof's Acked-by

Changes in v2:
- Rename the board and its compatible following the name change from
  metis-sbc to embedded-111c
- Drop Conor's Acked-by since the compatible has changed

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..79a45a4bce65 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -120,6 +120,11 @@ properties:
               - asus,rk3566-tinker-board-3s
           - const: rockchip,rk3566
 
+      - description: Axelera Embedded 111c
+        items:
+          - const: axelera,embedded-111c
+          - const: rockchip,rk3588
+
       - description: Beelink A1
         items:
           - const: azw,beelink-a1
-- 
2.53.0

