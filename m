Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201076;
	b=UX9QfVUBxb+JG3vxMtWIuh9WulNtRav9nWp8JrVuyCmT2hrBn1SsMLoohiH0tXh1mbvA
	 MR1Ngg9lDSFzV2tHUvuIzwq7d1ukb+Md1iJU8t2Se0iPXFhrVkai+Z9JfemQvM/LUnbgJ
	 hBP0OXv5ENxJ7ZZFuNw7gnGNwXAVxqS5mhokFyYTrj/FBYNWA13+zwNeHbXdvRDOTS+Za
	 yzqP6mIiJAj5Dqwx7n5on4PyFC0Cskbd3/erxWJFqN1c54ZaFtOMjUsFkjzaxueNhCXb4
	 Z5OSkEMIPXfyLy0cjFRW1iZsxW13nppyjl15PfDIZLX+hA0VKA/lQd375Yr0NrtNLxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=G+rCZlZvpLUe3/sSBMNpNP5w4u7bZtndPiMGg+R0D5I=;
	b=0RIH8ywuRcUo2vFiLgOBYFZEZZY04QvjciVv1dWHZUjpzcI8E4+bB0zsOuRdPZVoMo8f
	 evg8SjlDtcpVW9QK1JTC3WnT0Y1cLJyYjIcBGKG0ijikbL9ZuNwL9Jaae5wvjNktUg/Rg
	 Zz6znGEnXlSex5IqPmvxqtGJm6YvgjdOzquJ9cbeUvAN+toTV070BlLROtUK5Jl+WoQOz
	 GwnOvu26PXwDD9+qufSfU4eOCndZStc4P5I7hQfll/xKdpikloZs/1aUrY019czBv+OcM
	 cnoNgpCcIRV+a3F3BmY6VIpKkX8sGecf72JQyQN1JSPzI5VO5jAQbeuKbNr+V2PxjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E43YpmKc;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531F7606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E43YpmKc
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e987b4a710so1960345ad.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201075; x=1794805875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+rCZlZvpLUe3/sSBMNpNP5w4u7bZtndPiMGg+R0D5I=;
        b=E43YpmKcvUTnjE8CVAJ7qbNwv9CGJZy0QrMVSRT/MFSII4ud4mayIxXX76U69kakW/
         j0HVTRjDpkOJpJLuveiUBOhhFWLzxKYC07o5uuYln84Lei5K3aOLXTw2cuHQarGcRReG
         TgeHb3KAdMe5cMhoSfO7jSc05vb0pYpBVvetGqA+FAnVWPCsyif82JIgeV/fghsnc7x7
         G36k/D/DB9HKJypp0Aqb0feHvzCa99AgGc0Lpvg4ypS7q0rO1tpfT/efPnFDMnbb6DCK
         qpW37RKNBHXLCKcm6jNVF+OJbU6WTzXAVJsGfYNAXgh/8xQKmZq6xU5BtcH1YUl/zsqX
         zJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201075; x=1794805875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+rCZlZvpLUe3/sSBMNpNP5w4u7bZtndPiMGg+R0D5I=;
        b=svKC+58pJxnE5Mz5DcGBl6AnRCnvrU4ncYWmN3pNfhLdtn+kxA3KCn9y9mLOrvgmPh
         2J4XAIiGOIbYThveMEr2pRE+okJSAHxBtEY0JWKF36O+oP5HN1XPFT34jnt8W5AUtASX
         Fo9qjtycVtt43Xa3fcGG62XSi3JYBF+/xULIwPjMdJoyCRph8xiO5BkMnsdCnCJL4FP1
         4cTSlZ3hVhTkepYl5VrIIGm2yu+K3qj/4HJdy7ho8xCs0CbjWux0hwkgaIUc9tD9x+Vn
         +YNoeob2oA0xeRkscD36HZBJRp/h+gTK2+G9FYjBkLy0IeuVGzC8VANSYeSM/hpHR9+1
         a+9A==
X-Forwarded-Encrypted: i=1; AL+hErFWlim6/JeoZZHHZfdLUI+UVErY03wSelTS4g4wAWXBoG75zDi2Q8gFsM7IfpOOWkxDHPgNrPak4rr0@vger.kernel.org
X-Gm-Message-State: APuU4Z8e4wsxqgfbLw9Oy4LBgoxpVT7fa4M3KyQUhbHGqGqjXHbnd8ai
	BXHmi/gBM7BzMjuBMAXpkTffVbyX5lzfTj9BlNc3SNSNxIUu3NBX1uY7
X-Gm-Gg: AYBFou3AY+IrN+a/CaB9VMUu7JZ9bIXUenri5odNOlRZlSbUJeFlSHmIGRM0oy6/4Xo
	lslM4eea45d1BvlVFZQ6GRO+82DVd0za4E84hsAAM3wWXUE+UMGGEMIexLo7lsqjkqiGnHCcHkv
	Lu3gUPkh8ZP7ByG9T9T9d1ToGLJHHTnVPJQ15lxs7zMK6WDVOerMmg3iSh0PfZ59QTeJBH96mWb
	OJlza7FZAXqUFLQLOMvADP8VuUkcVgpY/bJ+9JvwUrLzlU8tJdP+mRPhlS/aGDPOl7dXLQAQqtQ
	BWthhCwhrlWcVpruJJef3ppcCPZERFvNAR0zNOyHP7+tOhlI5OJuoR62sNNUE1eF6Z27lLvYe2p
	806omN81gqVBTsfW4jzfZ9MJaKnqsz5QwBF1zsR6d6kMsrEri7kapoJTJ8/mcpLSwbwtM1XNy9y
	kGaTaNDzhYM5CyP9Yt04Z7dSpywb0sBEN5DjOg2bW3p9yApMgZiVGcrxPalXUdyemG6xhDEV14s
	rXVopDJhg40zvZn8h3n4zcrcFkeabT8V94vmOb0pVX1ClWiZs1oIlVVOPgCCJpx5GiUiXzRcwnB
	fHCu0EidObdKNyFI1msI4FgbSjoHvBG8MQOccQZabrSJYph6wsCMPHj5kcou9QzfK/U1f7SHwmX
	X4mZbfQnGCKbmBHXqo8Ne6qyx8qGktDatYPLNOSRVCZhi27dis9XX3GToO2ewmsxytaAQreaqJa
	1ob/kr
X-Received: by 2002:a17:90b:4b8f:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3b12d3fdbf6mr1750088a91.7.1794201075584;
        Sun, 08 Nov 2026 21:11:15 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:15 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
Date: Mon,  9 Nov 2026 15:40:42 +1030
Message-ID: <20261109051050.105623-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
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

Add compatible for IMSICS in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes, pick up review tags
---
 .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index feec122bddde..442b8870f9c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - qemu,imsics
           - spacemit,k3-imsics
+          - tenstorrent,atlantis-imsics
       - const: riscv,imsics
 
   reg:
-- 
2.47.3

