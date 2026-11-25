Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608912;
	b=IrLFDOLAu1KxApJWAbZbpAUBU9Oyuc7HEBx23jWDbsgf9QzLZ6li0XLsOAwl7lNONpz4
	 WWAmo9gHMIYw+i60uEGC1bOKGBXJOqAQoKKLH8LDUBOatQu7mmQZHmdbsySOmHKiKh0ib
	 YgMv8RHTCy3k1vNUGKGONVGyWrjsFRXq5bAf1QV0Av7Gf5R4nd59qkYjn7pL2J/peW4dF
	 qUjOz3fbDwJUKpEfRsXSB1fIYc4qRp5d4aDzzmo4r5yi7kw770tgg2Dvlf0PDOV7ML+QF
	 /cPpyvOoz1Y+Sf+6muu4WVrm0hXz3GEZuRzTFXHGD4DT8/tXJ/SzvBgLHwITUKn7a+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hTcRLuWGYYRPUE+QyNyXCHMSGsk+bFHW03tmtAC6svw=;
	b=oi1ZoZfaFBm3ACI8xHDq4e4nrhiBiBNHth4JkE5GHBXJCxLHOS4XFiTDgAge9tJgUubg
	 2fo3/EVnmoOaCzSe5knvH2+LGaX8D2gsNQ/NXggAkScJJ1/6cVHseaBCqhgO75RxPqqgB
	 hvbXFy+WIcEzPrWOULJ/0jMqk7lw+JoNckXzavuaUsxeRr5+tN3cGSfbPkPtmyAZNlVgw
	 OqmWFqpFu5Qoxidt9kAo5Z0AZBUnV3TUhIzp8xIxvAhhfeNnNhI1yLlMHpXBTiFPzrcwo
	 Wie3ArKwNaiZscdy84WCcgYQtYwfKFTmNl6A/pHvKg3PsTdwSkIFqjVdCm5l3LaOwmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEyeG03z;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1AF606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEyeG03z
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so58305295e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608910; x=1796213710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTcRLuWGYYRPUE+QyNyXCHMSGsk+bFHW03tmtAC6svw=;
        b=jEyeG03zmTWUxxqyKg6nGzX9qOISHJHIPn0O9EpFIEwJFxSCykLjIbR7KMh2T3kJvy
         /iZOclEBen+G11cSygOreDDisclVWt1lslBSJr3KalBLSR8CXu0JkkzwdFJl4MVqX2M+
         GDWj+gERsuvWIlX1Pr3qvyzBJBBtMbVO0WV6Fw1gXZAF3qj/1HT0i/bGD4dlXsbl5fth
         sjipc5txgikyxIKSie4YM3AoHSTclcRki7urqmdfnO3+J4mH+Mio10/f1dcBqoW1O/Rj
         MR+eJVzdAb5jVLTT5baAnPo3Cf8jDxWdqYm4+9t0wPwVZ/thv8tMTaS+5ft7sytD9QPZ
         QnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608910; x=1796213710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTcRLuWGYYRPUE+QyNyXCHMSGsk+bFHW03tmtAC6svw=;
        b=H7p3wDZ1VCx5OCe2ab197NFhjouAE+76ZmNhNUmConj2l2lHkQvPpMXHPF8n8NURnI
         V7YF9rPejlUEl92V1I28WFsC/afNMRoYv+rB+HVyUC9WB/5WKjNza9TAQBa+3TuBajiE
         KwG+K9Vzr9IIuPbTF0zwm1dOLVA5DG0JiVlZ9r73vWyBCk2/sx58cTZvhflHkUUCRusM
         kFh4YHLqT79OlpeISWcwvQC+vMRxHE7PiX6Vg1F3owCzP8dvOGuZtdj+6ZRt1z5RZ/g1
         jbGQV63A0HTSLIcvO96lpH28arBKdiZ7LH10ZHrGUFNhvkB3QSUc0FjD6HMyBqTR2EF8
         t5rw==
X-Forwarded-Encrypted: i=1; AL+hErEX1gEt6cm8sL8yejqnvkh+aWA3XoYOBuuXtQIi6vOSji5WjWLAUbMjkjmmoht3jncul8mfQYn0Zsow@vger.kernel.org
X-Gm-Message-State: APuU4Z83jyJvGh9BrgH/2NYArGrvwg4QLUoOKv7RHWKOzD7Sj1px+F+U
	YyxFbszWpsj6MuNYf8ScRMhMdT+PEAQhRs8G+X4joHcwQbnB3pZyzVTI
X-Gm-Gg: AZFdTZeiffMX3lMNWfTtBt7Ah36pQdEeks5iTz0u+TP1Lt8zX6QoVSuotvtZYjkTPK6
	lRuQviIVqemn9Nl0wi568R10hM548j5pDD0TP7REhXgJgGfmAzmK+jOuZsvqphtx8Frc1veoEQB
	QORfdF/OK7H/ZnSwG01Y+cKstcvVLC27mnM+guEJZMlta6V/qlSC5f61QPOpxUCtScGitOTgBC0
	4QJz3UJ0PwCMn2DoYrCUkpzrJubTiyE+uFlzy0pPo3rQ4rMF88kO9D1YiOjOnO/Wi58Zt4wKwbk
	3e25Q92AywrF4iekvzxJwB4IzO9ayBpfgQ9tY5uUgctac2l+Jvoi4WtFG1jQJmp2Y3DZsiBmQfj
	jE3NBQdNyeO/Ro8vcXTwtD9gjIh5i0M5GPJ7Zfqc+kM8KUbQAi/EMF6g9TeVhKyj57TWUza4nOU
	5B0w8ZIgqcS1BLIelC1J3UwrQDMpotNBPpLnkaA8PsOXKfVzdP8cSudu/5bAzlZS7S4RwDzYHQY
	XXMvSsbDvpjAqvq5szHMj12qRRjTijnGumdOTAlZBZ4XJmRqFpBoKYvdK4k5i8TfYw2uKnMas6B
	7Fq/PUTG00CSD62cQSFfhit8/vTC22ND9H9PZMNDibLpEP7GVYHIhnVHXvhsBb/JLYu6+Fka7ku
	t40QrXuOzd0Vd+mIgC7RTYwyPw8pDj/zl+P9hTZb1lS5SAdSmUoTGn/RHQZof6bhAv7D03DCzji
	Jj5+MTGHvL
X-Received: by 2002:a05:600c:3d05:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4bb88930872mr360894185e9.27.1795608910405;
        Wed, 25 Nov 2026 04:15:10 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:10 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/6] arm64: dts: renesas: r9a08g046: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:44 +0000
Message-ID: <20261125121448.180847-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The GBETH nodes on RZ/G3L specify 'snps,perfect-filter-entries = <128>',
but the IP provides only 32 perfect filter entries.

Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' are
discoverable from the MAC hardware feature registers. The stmmac driver
does not parse these properties for "snps,dwmac-5.20", and derives the
number of perfect filter entries and hash table bins from the hardware
feature registers instead.

Drop both properties instead of correcting the value. There is no
functional change for Linux.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Since the driver derives them I havent added a fixes tag, in case we need
one below is the tag which needs to be added:
Fixes: a357a31c3436 ("arm64: dts: renesas: r9a08g046: Add GBETH nodes")
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index bb69e5e3528d..c67a9955d03e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1111,8 +1111,6 @@ eth0: ethernet@11c30000 {
 				      "rmii", "rmii_tx", "rmii_rx";
 			resets = <&cpg R9A08G046_ETH0_ARESET_N>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -1228,8 +1226,6 @@ eth1: ethernet@11c40000 {
 				      "rmii", "rmii_tx", "rmii_rx";
 			resets = <&cpg R9A08G046_ETH1_ARESET_N>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
-- 
2.56.1

