Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201098;
	b=jtEIQV8lr2NZ7GU32ap/v6yuA1blyQxdVInARorFuhLutv7swGYWPlbuZSlI+R9CfyJl
	 9xfyNQX1WiTJgIF9/AEg0xtFnKOSu2ivJGmfXmVABZFasxA/ZkBzx7PAp/ho8Jn6CbnPC
	 qPGo+zgZ9j5OoTEbQ18Oz0dsl5wjpJw/G9Vp7m91X+OQ09qW3EsLY/l9nIfgGVUchUZ4h
	 bGavPtrdWhxaZfmTDiQ3TUEY+fYRjGEs9ciQfgBdOb4J0nwFm8CIGIfC7y8HYyp4SsFCc
	 49avyESDSJ3c0kKcqiWVDUYPmDRteWI8aFkiuAIXgxvMSudZy1aGzAPmdj0gIClKNOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=/cUkRDkkVJbrdFe/cgpwKcZrnBsjX+X35w8h1XS3sJI=;
	b=M4mOQnYJpxrgeZ430HhPJUnenTemWvSR3r2vrgPSFl37CeTwF9y1m0y/bBzPpEGIZgwW
	 Lx9WE6MnMNK2ERJXsxdlnXGqDvQnPHlWQaQWiDTUX6gGqp1YZIiIrSQpFYVS3km/SGfc/
	 gmXOuszqA+cOPL8NSKFBvMBcEDLS8KSCd5rzhKOYtHS1lwhbGfV9z+blcBtFWsvrezRnY
	 8VHBUA3zytxoLIA8iszKG53Y7jAhGKdBZfple7d70vgoePSOQP9x94PNO3mQrp+MwFh9D
	 Gk1YSNtsT2ZH5VFYFIQz1+MBVhwcpF35iXwG/SI+vcbCfXy5Z+0a8swGUQwpTzFukIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpzII3lW;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B5B606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpzII3lW
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e987b4a710so1961325ad.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201097; x=1794805897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cUkRDkkVJbrdFe/cgpwKcZrnBsjX+X35w8h1XS3sJI=;
        b=JpzII3lWw1D8OXN4XI1MAJVUTw8bBV9tWcMrG6J6BjeNCKICoVy2TB+dOakXx8Epil
         +Q4oaOr29bvttTcCs4c4mL6DihestBXnQshzvPjvKXlrT5d2aJ1pstIZEwhzJ1RQ3bCX
         0QSGXUkeDGYWUF5m72f7/aaZP6fSxDDWnOSw7xywNUspMFBPTAmNUe+FWYqmw3g23wjX
         tJy70sR+H0ybGfIK91SBfNmCH5TvBI9kNCNjste7YSvdFwctvJsnVn9tvL3kQJ3QKe9E
         exze72h1XQ5M3/o9Ec8oIbwlS/+RGUy9j456KgoZqxrLb/7yU/NvCh01FIbreVK0VDYG
         1ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201097; x=1794805897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cUkRDkkVJbrdFe/cgpwKcZrnBsjX+X35w8h1XS3sJI=;
        b=HURnJ9qRZpVnQV0yUdSv3MBa8u3IjLyugW41MQ4Uw2gO+nJOllXXnuF7b1d8r/n6ue
         PWqgVROTbSMpUALGmOXZlHOJN6/Ckl7oKxyf05s+4Se0usSKfX7JktwvPr0epWyfg0EL
         07MhufU3LjjIOF4Lsttpaspnmy+BFtcaMWyKHt52ys31iH/0zv+afBPP90zdZSauA1Fa
         rfI9XGRz0TZMI/NYZuygSwPArN2YTyr3pP1Dsj5JhRfKKYnFTc043Lav2GBSfJliHUQ0
         BZG1iL8EnqWQO7Gwfza/TLo+dzbcsYlCDprFS3JVno8A2sfN+KylLOpb6d/KUKGyWc0F
         tV6Q==
X-Forwarded-Encrypted: i=1; AL+hErGO4XgBFbRrcE9E1bP1n6aOWAOT0t0gijwmyKidiet6MWU1WSF1bRJfipgKaFfZsCVV02GUuSPhg3qc@vger.kernel.org
X-Gm-Message-State: APuU4Z+s7PHaHGU0fBDwWJf+EpLjzRG8KfXvCPY+qtZJNf3TubBJGxEc
	Hq6jnq6hlHaJzmKVYHIl4RPyiYA/4B+N16IAQUlmWC1+8QRcCvBtSGxg
X-Gm-Gg: AYBFou0LTKrWRX35OMQfSmt1wZ8MKVo2gR6HblVgBOtyvIqi+bKCXhBLYVZuE0Sgh9b
	KW7yX9Jd3FvpwDFrLOerWvSNc0081I2h4ZPEzWE50udX4a3MYIqV/qdDXid5NM8ClUfQdJn9ev1
	JKPJ52puugGOUaB2XZKpFs59NAwMp0Zng48PSQtWi1OxXRPMV1Ehj7BIsBFC7nxIhICBnDDwKRx
	OGVoecT4oo2gjT4Z2mOvZfbD6ctqf73qgRMOlSTzeHiTbVoXZcDLa85bfyzLDTZpksEJsfvUGW8
	AQWDglq7WVmCrVLulOyMcLrtkZikw9JM9MWc+OHboE5bQEOMjwmfSfolPQ+U3VYi5A5xjLDUJHa
	2zo22jNPVZ63V8EkgE+EfkZrpjFwuiD96DWfy4xbbjG0GUhvjV+UyKyxzb851KNzn4jzv8IF0OA
	0Nb6utrk9YcNUFNn4vVa+INY7r6eeXr8SNOr7kxmHK7mX+hlEQ+BHN8w9bNsCkDJ3Tzipn/FqM6
	UlxYLGohMKPCFOAxOuFKR7MxDyepfct3paGigLZVoSObfPGPuM0oJB1TG/+VRBOTB45M0BhmegB
	/1xxmjpphs9OUkpHZLw1o0LPtYZTU14PhBv8gADYQ+Z0PM2TttxS/2Y3Vn7syu6iPovC4sKi3gf
	lcmHSaX0AGW/eQBFIG6uce9Qi81bl6iBJDRUB5oaNS278pqOrmMg+LUcPyQ==
X-Received: by 2002:a17:90b:268f:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b12d102c5amr1945503a91.6.1794201097253;
        Sun, 08 Nov 2026 21:11:37 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:36 -0800 (PST)
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
Subject: [PATCH v3 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Date: Mon,  9 Nov 2026 15:40:46 +1030
Message-ID: <20261109051050.105623-7-joel@jms.id.au>
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

Add compatible for the Tenstorrent Atlantis platform.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes, pick up review tags
---
 Documentation/devicetree/bindings/riscv/tenstorrent.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
index e15359b2aab6..7fb640e38455 100644
--- a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
@@ -22,6 +22,10 @@ properties:
         items:
           - const: tenstorrent,blackhole-card
           - const: tenstorrent,blackhole
+      - description: Tenstorrent Atlantis
+        items:
+          - const: tenstorrent,atlantis-evb
+          - const: tenstorrent,atlantis
 
 additionalProperties: true
 
-- 
2.47.3

